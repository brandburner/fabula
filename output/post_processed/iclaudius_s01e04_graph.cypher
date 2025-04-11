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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e04_graph.json',
        creation_timestamp: '2025-04-11T16:16:41.693601',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_horace'})
    ON CREATE SET
        a.name = 'Horace',
        a.title = 'Poet',
        a.description = 'Horace, the renowned poet of Rome, represents the voice of imperial propaganda through his eloquent verses. His role as an observer and commentator captures the grandeur of the empire along with its underlying tensions, reflecting on the fleeting nature of life and the weight of legacy.',
        a.traits = ["Eloquent", "Observant", "Cultural influencer", "Articulate"],
        a.sphere_of_influence = 'Poetry and Literature'
    ;
MERGE (a:Agent {uuid: 'agent_augustus'})
    ON CREATE SET
        a.name = 'Augustus',
        a.title = 'Emperor of Rome',
        a.description = 'Augustus, the Emperor of Rome, is a complex figure balancing imperial strength with the vulnerabilities of familial loyalty. He demands loyalty yet grapples with paranoia, revealing a ruler who is both a fierce protector of his dynasty and a man deeply affected by the ambitions around him.',
        a.traits = ["Authoritative", "Paranoid", "Manipulative", "Protective"],
        a.sphere_of_influence = 'Imperial Governance'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'Empress',
        a.description = 'Livia Drusilla, Empress of Rome, is a creature sculpted from ice and ambition. Her beauty conceals a core of molten will, making her the unseen architect of power within the imperial corridors. She moves invisibly through the villas and shadowed galleries, influencing the course of events with lethal subtlety.',
        a.traits = ["Manipulative", "Ambitious", "Ruthless", "Calculating", "Controlling"],
        a.sphere_of_influence = 'Imperial Politics, Manipulation of the Dynasty'
    ;
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Drusus Nero Germanicus',
        a.title = 'Prince',
        a.description = 'Tiberius Claudius Drusus Nero Germanicus, known as Claudius, is a stuttering prince born into a world of triumph and treachery. Overlooked and underestimated by his peers, he navigates the brutal dynamics of power with a keen, deconstructive intellect, even as he becomes a shadow amid a family fraught with ambition and betrayal.',
        a.traits = ["Observant", "Intelligent", "Underestimated", "Self-deprecating", "Stuttering"],
        a.sphere_of_influence = 'Intellectual pursuits'
    ;
MERGE (a:Agent {uuid: 'agent_germanicus'})
    ON CREATE SET
        a.name = 'Germanicus',
        a.title = 'General',
        a.description = 'Germanicus is celebrated as a paragon of martial virtue in Rome. Cherished by legions and court alike, he strides into battle with a lion’s confidence, though beneath his striking features lies the burden of self-doubt and the weight of an uncertain legacy.',
        a.traits = ["Valiant", "Honorable", "Adored", "Respected", "Military Prowess"],
        a.sphere_of_influence = 'Military Leadership, Public Adoration'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius',
        a.title = 'None',
        a.description = 'Tiberius, the brooding and resentful heir, is overshadowed by his illustrious lineage. Criticized for his cautious approach in military campaigns, his inaction in Germania becomes a point of contention among his superiors, highlighting the strained dynamics of familial expectation and imperial ambition.',
        a.traits = ["Cautious", "Strategic (implied)", "Passive (in this scene)", "Under Scrutiny", "Military Commander", "Heir Apparent", "Brooding", "Resentful"],
        a.sphere_of_influence = 'Military Strategy, Germanic Front, Imperial Succession'
    ;
MERGE (a:Agent {uuid: 'agent_livilla'})
    ON CREATE SET
        a.name = 'Livilla',
        a.title = 'None',
        a.description = 'Livilla is a captivating and dangerous presence in imperial Rome. Embodying seduction and calculated ambition, she maneuvers through power dynamics with a blend of allure and strategic cunning, entangling herself in the complex webs spun by her family relationships.',
        a.traits = ["Manipulative", "Ambitious", "Seductive", "Calculating", "Deceptive"],
        a.sphere_of_influence = 'Intrigue, Manipulation'
    ;
MERGE (a:Agent {uuid: 'agent_postumus'})
    ON CREATE SET
        a.name = 'Postumus Agrippa',
        a.title = 'None',
        a.description = 'Postumus Agrippa is the impulsive and volatile grandson of Emperor Augustus, constantly wrestling with deep-seated insecurities and the desperate need for acceptance. His actions, fueled by passion and a sense of being hunted, highlight the internal conflicts bred by his complex family relationships.',
        a.traits = ["Volatile", "Passionate", "Suspicious", "Impulsive", "Paranoid"],
        a.sphere_of_influence = 'Family relations, Military (potential)'
    ;
MERGE (a:Agent {uuid: 'agent_praxis'})
    ON CREATE SET
        a.name = 'Praxis',
        a.title = 'None',
        a.description = 'Praxis is depicted as a nervous and flustered aide within the imperial court. Frantic yet obedient, his actions underscore the constant pressure of serving the Emperor, balancing the delivery of urgent news with the fear of incurring imperial wrath.',
        a.traits = ["Nervous", "Subservient", "Flustered", "Obedient"],
        a.sphere_of_influence = 'Imperial Service'
    ;
MERGE (a:Agent {uuid: 'agent_courier'})
    ON CREATE SET
        a.name = 'Courier',
        a.title = 'None',
        a.description = 'The Courier is an exhausted yet determined messenger who bears critical news from the front lines. Despite his disheveled appearance and physical depletion, his respectful and focused demeanor ensures that his vital reports, such as those from the Teutoburg Forest massacre, are delivered with grim clarity.',
        a.traits = ["Exhausted", "Urgent", "Respectful", "Informative", "Resilient"],
        a.sphere_of_influence = 'Military Communications'
    ;
MERGE (a:Agent {uuid: 'agent_varus'})
    ON CREATE SET
        a.name = 'Quinctilius Varus',
        a.title = 'None',
        a.description = 'Quinctilius Varus is a notorious Roman commander whose catastrophic military failure is cemented in history. Held responsible for losing the Roman eagles to barbarian forces, his actions have invoked the Emperor’s wrath, marking him as a symbol of incompetence and the devastating cost of failure in military command.',
        a.traits = ["Incompetent (implied)", "Responsible for Defeat", "Cause of Imperial Fury", "Failed Commander", "Absent (deceased)"],
        a.sphere_of_influence = 'Military Command (failed), Germanic Front (defeat)'
    ;
MERGE (a:Agent {uuid: 'agent_cassius_chaerea'})
    ON CREATE SET
        a.name = 'Cassius Chaerea',
        a.title = 'Officer',
        a.description = 'Cassius Chaerea is a resourceful and level-headed officer whose brave and competent leadership stands in stark contrast to the failures around him. His ability to maintain composure and rally survivors amid calamity highlights both the resilience and determination present within the Roman military.',
        a.traits = ["Resourceful", "Level-headed", "Brave", "Competent", "Leader"],
        a.sphere_of_influence = 'Military Leadership (Competent)'
    ;
MERGE (a:Agent {uuid: 'agent_pollio'})
    ON CREATE SET
        a.name = 'Asinius Pollio',
        a.title = 'None',
        a.description = 'Asinius Pollio is a distinguished historian renowned for his sharp wit and incisive commentary on the Roman elite. His acerbic observations and keen intellect make him both a challenging and respected figure in political discourse.',
        a.traits = ["Intelligent", "Wise", "Cynical", "Perceptive", "Sharp-witted"],
        a.sphere_of_influence = 'History, Political Commentary'
    ;
MERGE (a:Agent {uuid: 'agent_livy'})
    ON CREATE SET
        a.name = 'Livy',
        a.title = 'Historian',
        a.description = 'Livy is a renowned historian whose serious demeanor belies a deep understanding of Rome\'s political machinations. Respected for his insights into the beauty and brutality of his times, he provides a scholarly perspective on the state of the Republic.',
        a.traits = ["Serious", "Knowledgeable", "Respected", "Insightful"],
        a.sphere_of_influence = 'Historical Discourse'
    ;
MERGE (a:Agent {uuid: 'agent_palace_guard_1'})
    ON CREATE SET
        a.name = 'Palace Guard 1',
        a.title = 'Guard',
        a.description = 'A palace guard tasked with maintaining security within the Imperial Palace. In the scene, his vulnerability and servitude are highlighted when he becomes the target of Postumus\'s temper after laughing at Claudius.',
        a.traits = ["Anonymous", "Vulnerable", "Servile", "Target of Temper"],
        a.sphere_of_influence = 'Palace Security'
    ;
MERGE (a:Agent {uuid: 'agent_postumus_wife'})
    ON CREATE SET
        a.name = 'Postumus\' Wife',
        a.title = 'Wife',
        a.description = 'The unnamed wife of Postumus, bound to him in a loveless political marriage. Her discontent, as mentioned by Augustus, underlines the absence of affection in the union and the pressures of maintaining appearances for the sake of imperial succession.',
        a.traits = ["Unhappy", "Neglected", "Duty-bound", "Complaining"],
        a.sphere_of_influence = 'Domestic Sphere'
    ;
MERGE (a:Agent {uuid: 'agent_postumus_father'})
    ON CREATE SET
        a.name = 'Postumus\' Father',
        a.title = 'None',
        a.description = 'The deceased father of Postumus and a trusted friend of Emperor Augustus. His legacy, marked by respect and idealization, continues to influence Augustus’s expectations for Postumus, embodying lost potential and the weight of paternal succession.',
        a.traits = ["Deceased", "Trusted", "Respected", "Idealized"],
        a.sphere_of_influence = 'Military Leadership (historical)'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia',
        a.title = 'Noblewoman',
        a.description = 'Antonia is a member of the imperial family noted for her empathetic and reflective nature. Present at the games alongside Livia, she offers a softer, sentimental perspective on the harsh realities of court life, particularly in moments of shared loss.',
        a.traits = ["Empathetic", "Sentimental", "Reflective", "Family-oriented"],
        a.sphere_of_influence = 'Family & Courtly Life'
    ;
MERGE (a:Agent {uuid: 'agent_servant_1'})
    ON CREATE SET
        a.name = 'Servant 1',
        a.title = 'None',
        a.description = 'A servant in the Imperial Council Chamber who enters upon summons. His role underscores the subservient position of palace staff, quickly dismissed to preserve the privacy of significant imperial discussions.',
        a.traits = ["Obedient", "Discreet", "Servile", "Attentive"],
        a.sphere_of_influence = 'Imperial Household Service'
    ;
MERGE (a:Agent {uuid: 'agent_servant_2'})
    ON CREATE SET
        a.name = 'Servant 2',
        a.title = 'None',
        a.description = 'Another servant in the Imperial Council Chamber, present alongside Servant 1. He embodies the quiet, obedient nature of the palace staff, ensuring the smooth functioning of imperial proceedings while maintaining discretion.',
        a.traits = ["Obedient", "Discreet", "Servile", "Attentive"],
        a.sphere_of_influence = 'Imperial Household Service'
    ;
MERGE (a:Agent {uuid: 'agent_herod'})
    ON CREATE SET
        a.name = 'Herod',
        a.title = 'Client King',
        a.description = 'Herod is a cynical and observant client king from the Middle East. Attending the gladiatorial games, he offers a detached and witty perspective on Roman customs, engaging in philosophical exchanges that reveal his pragmatic and culturally distinct viewpoint.',
        a.traits = ["Cynical", "Observant", "Pragmatic", "Witty"],
        a.sphere_of_influence = 'Diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent_castor'})
    ON CREATE SET
        a.name = 'Castor',
        a.title = 'None',
        a.description = 'Castor is a minor but pivotal presence in the imperial court, noted for his nervous and fidgety demeanor. Serving as a messenger, he embodies the constant tension and subservience required to navigate the intricate dynamics of court intrigue.',
        a.traits = ["Nervous", "Fidgety", "Inquisitive", "Subservient"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_urgulanilla'})
    ON CREATE SET
        a.name = 'Urgulanilla',
        a.title = 'None',
        a.description = 'Urgulanilla is an enforcer loyal to Livia, known for her persuasive shouting and unofficial role in palace security. Her distant shouts as she pursues Postumus in the Palace Gardens underscore her function as an extension of Livia’s will.',
        a.traits = ["Enforcer", "Loyal to Livia", "Persuasive (through shouting)"],
        a.sphere_of_influence = 'Livia\'s Will, Palace Security (unofficial)'
    ;
MERGE (o:Object {uuid: 'object_gold_statue'})
    ON CREATE SET
        o.name = 'Gold Statue',
        o.description = 'A small, intricately crafted gold statue of Etruscan origin. It represents Augustus\'s wealth and patronage of the arts, and was gifted to Horace as a token of appreciation.',
        o.purpose = 'To serve as a gift symbolizing Augustus\'s favor and support for Horace\'s literary endeavors.',
        o.significance = 'Highlights Augustus\'s role as a patron of the arts and underscores the cultural depth of the imperial court.'
    ;
MERGE (o:Object {uuid: 'object_fig'})
    ON CREATE SET
        o.name = 'Fig',
        o.description = 'A ripe, fresh fig picked directly from a tree in Augustus\'s gardens. It is presented as a seemingly casual gesture that later takes on symbolic weight in the discussion about responsibility and imperial expectations.',
        o.purpose = 'To be tasted and enjoyed, and to initiate conversation.',
        o.significance = 'Serves as a symbol of natural abundance and Roman prosperity, acting as a prop to start a more serious discussion.'
    ;
MERGE (o:Object {uuid: 'object_fountain'})
    ON CREATE SET
        o.name = 'Fountain',
        o.description = 'A decorative water fountain located within the Imperial Palace grounds. Originally ornamental to enhance the palace\'s beauty, it becomes the scene of a minor disruption when Postumus throws a palace guard toward it.',
        o.purpose = 'To serve as an ornamental water feature and inadvertent receptacle for a palace guard.',
        o.significance = 'Symbolizes Postumus\'s impulsiveness and breach of decorum, marking his unruly behavior in the eyes of the court.'
    ;
MERGE (o:Object {uuid: 'object_bench'})
    ON CREATE SET
        o.name = 'Bench',
        o.description = 'A simple garden bench located in Augustus\'s gardens. It serves as the setting where Augustus invites Postumus to sit down, marking a transition in their conversation toward serious and private matters.',
        o.purpose = 'To sit and converse.',
        o.significance = 'Marks a transition to a more serious discussion about behavior, expectations, and the future of the empire.'
    ;
MERGE (o:Object {uuid: 'object_inheritance'})
    ON CREATE SET
        o.name = 'Inheritance',
        o.description = 'The financial inheritance left to Postumus by his deceased father. Withheld by Augustus on the grounds of Postumus\'s immaturity, it becomes a symbol of control, trust, and the potential role within the empire.',
        o.purpose = 'To provide financial provision and symbolize maturity and trust.',
        o.significance = 'Represents the power and control Augustus exerts over Postumus\'s life and future, acting as a point of conflict.'
    ;
MERGE (o:Object {uuid: 'object_roman_eagles'})
    ON CREATE SET
        o.name = 'Roman Eagles',
        o.description = 'The Roman Eagles, or Aquilae, are the legionary standards revered as symbols of Roman military honor and power. Their loss to the Germanic tribes is a significant blow to imperial pride.',
        o.purpose = 'To serve as military standards and symbolize Roman power and honor.',
        o.significance = 'Their loss becomes a major political and military concern, representing Roman prestige and invincibility.'
    ;
MERGE (o:Object {uuid: 'object_biography_claudius_father'})
    ON CREATE SET
        o.name = 'Biography of Claudius\' Father',
        o.description = 'A written biography of Claudius\'s father authored by Claudius. It contains subversive content that praises his father\'s attachment to the Republic, which Livia deems a threat to the imperial regime.',
        o.purpose = 'To serve as a biography and historical writing.',
        o.significance = 'Represents Claudius\'s intellectual pursuits, potential dissent within the imperial family, and is seen as a symbol of independent political thought.'
    ;
MERGE (o:Object {uuid: 'object_scroll_biography'})
    ON CREATE SET
        o.name = 'Scroll (Biography)',
        o.description = 'The physical scroll that contains Claudius\'s biography of his father. It is a tangible representation of Claudius\'s intellectual activity and becomes central as Livia uses it to underscore the threat posed by its content.',
        o.purpose = 'To serve as the container for the biography.',
        o.significance = 'Acts as a tangible representation of the subversive biography and becomes an object of control by Livia.'
    ;
MERGE (o:Object {uuid: 'object_map_table'})
    ON CREATE SET
        o.name = 'Map Table',
        o.description = 'A large table situated in the Imperial Council Chamber, typically used for displaying maps, charts, or strategic documents. It anchors the setting of a scene focused on imperial planning.',
        o.purpose = 'To serve as a table for maps and documents related to imperial governance and military strategy.',
        o.significance = 'Symbolizes imperial planning, strategy, and the administrative aspects of statecraft.'
    ;
MERGE (o:Object {uuid: 'object_bridges_rhine'})
    ON CREATE SET
        o.name = 'Rhine Bridges (General)',
        o.description = 'Infrastructure comprising bridges spanning the Rhine River, essential for military and civilian movement across this strategic frontier. The bridges become symbolic when Tiberius is seen \'holding\' them.',
        o.purpose = 'To serve as strategic crossing points and infrastructure for controlling the Rhine frontier.',
        o.significance = 'They symbolize Tiberius\' cautious approach contrasted with Augustus\'s impatience and represent an important military staging ground.'
    ;
MERGE (o:Object {uuid: 'object_seat_games_box'})
    ON CREATE SET
        o.name = 'Seat in Games Box',
        o.description = 'A seat specifically allocated within the Imperial Box at the Games for Claudius. It is representative of imperial social hierarchy and the marginalization of certain family members despite their inclusion in public events.',
        o.purpose = 'To provide seating at a public event, highlighting the tiered social hierarchy within the imperial family.',
        o.significance = 'Serves as a symbol of Claudius\'s ambiguous status and diminished agency within the imperial social order.'
    ;
MERGE (o:Object {uuid: 'object_betrothal_agreement'})
    ON CREATE SET
        o.name = 'Betrothal Agreement (Claudius)',
        o.description = 'A legal marriage contract drawn up six years prior for Claudius. It is a formal arrangement that highlights Livia\'s control over family matters and the arranged nature of imperial marriages.',
        o.purpose = 'To serve as a legal document enshrining the betrothal and marriage contract.',
        o.significance = 'Symbolizes Claudius\'s lack of agency, the control exercised by Livia over his personal life, and the broader social dynamics within the imperial family.'
    ;
MERGE (o:Object {uuid: 'object_gold_pieces_bet'})
    ON CREATE SET
        o.name = 'Gold Pieces (Bet)',
        o.description = 'A collection of twenty gold pieces, likely Roman Aurei, used as currency in a wager between Augustus and Herod. The coins embody imperial wealth and the casual nature of betting on human lives.',
        o.purpose = 'To act as currency for betting, symbolizing the commodification of wealth and human life.',
        o.significance = 'Represents imperial wealth and the desensitization towards violence, as well as the high-stakes nature of social and political wager within Roman society.'
    ;
MERGE (l:Location {uuid: 'location_imperial_salon'})
    ON CREATE SET
        l.name = 'Imperial Salon',
        l.description = 'The Imperial Salon is an elegantly designed room within the grand palace, richly adorned with classical art and sculptures. It serves as a formal gathering space for the imperial family and distinguished guests. Its intimate atmosphere, juxtaposed with the opulent decor, creates a setting where art and politics intertwine and where poetry, debates, and family dynamics play out against a backdrop of power and ambition.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_study'})
    ON CREATE SET
        l.name = 'Imperial Study',
        l.description = 'A formal, book-lined room within the imperial palace, purposefully designed for serious state matters. The austere and orderly atmosphere, accentuated by its nighttime lighting, underscores its role as a private space for confidential discussions and urgent decision-making.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_across_the_rhine_germany'})
    ON CREATE SET
        l.name = 'Across-the-Rhine Germany',
        l.description = 'A region referring to the Roman territories east of the Rhine river. This area, once defended by Roman legions who were eventually massacred, is depicted as a dangerous and unstable frontier, vulnerable to incursions from Germanic tribes.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_teutoberg_forest'})
    ON CREATE SET
        l.name = 'Teutoberg Forest',
        l.description = 'A dark, treacherous forest in Germania that was the site of a devastating Roman defeat. Characterized by dense woodland, difficult terrain, and muddy tracks, the forest symbolizes the peril of the Germanic frontier and the limits of Roman military strength.',
        l.type = 'Forest'
    ;
MERGE (l:Location {uuid: 'location_gaul'})
    ON CREATE SET
        l.name = 'Gaul',
        l.description = 'A Roman province bordering Across-the-Rhine Germany. Following the Roman military disaster, Gaul is depicted as vulnerable and directly threatened by Germanic tribes, symbolizing strategic territorial risks for the empire.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_rhine_bridges'})
    ON CREATE SET
        l.name = 'Rhine Bridges',
        l.description = 'Strategic bridges spanning the Rhine river that are essential for controlling access between Gaul and Germania. Their security is crucial for preventing Germanic tribes from invading Gaul, representing vital infrastructure in the Roman defense strategy.',
        l.type = 'Infrastructure'
    ;
MERGE (l:Location {uuid: 'location_mars_field'})
    ON CREATE SET
        l.name = 'Mars Field',
        l.description = 'A military training ground in Rome used for training soldiers. Mentioned in passing in relation to Postumus’s military preparations, it underscores the Roman capacity for military readiness though it lies outside of the immediate crisis planning.',
        l.type = 'Military Training Ground'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace'})
    ON CREATE SET
        l.name = 'Imperial Palace',
        l.description = 'The sprawling and opulent residence of the Roman Emperor, symbolizing Roman power and authority. Housing various chambers and spaces for governance, private life, and imperial display, it is the nerve center where critical decisions and political intrigues intertwine. Within its complex lie additional distinct spaces like Augustus\' Gardens.',
        l.type = 'Palace'
    ;
MERGE (l:Location {uuid: 'location_imperial_library'})
    ON CREATE SET
        l.name = 'Imperial Library',
        l.description = 'A grand repository of knowledge featuring high shelves filled with scrolls and books. Bathed in shafts of sunlight through tall windows, the quiet atmosphere filled with the soft rustling of papyrus makes it a sanctum for scholars and historians, illustrating the empire’s patronage of intellectual pursuits.',
        l.type = 'Library'
    ;
MERGE (l:Location {uuid: 'location_augustus_gardens'})
    ON CREATE SET
        l.name = 'Augustus\' Gardens',
        l.description = 'A tranquil, sun-drenched private garden located within the Imperial Palace complex. Filled with lush vegetation such as fig trees, decorative fountains, and benches, the garden offers a serene setting for private conversations and informal meetings, contrasting with the formal, tense atmosphere of the palace.',
        l.type = 'Garden'
    ;
MERGE (l:Location {uuid: 'location_banks_of_the_rhine'})
    ON CREATE SET
        l.name = 'Banks of the Rhine',
        l.description = 'A rustic region representing the less civilized and less fortunate outskirts of the empire, marked by simple, even harsh living conditions. Highlighted by Augustus as a birthplace contrast to Rome, it underscores the geographical and cultural divide with the Rhine river serving as a significant frontier.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_syria'})
    ON CREATE SET
        l.name = 'Syria',
        l.description = 'A region within the Roman Empire depicted as a less privileged birthplace compared to Rome. Characterized by modest living conditions such as \'grubby little tents\', it emphasizes the perceived disparity between the nomadic or military-camp-like existence there and the grandeur of the imperial center.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_rome'})
    ON CREATE SET
        l.name = 'Rome',
        l.description = 'The heart of the empire, Rome is a sprawling metropolis renowned for its marble architecture, opulent palaces, and vibrant public spaces. It pulses with power and ambition, balancing grand celebrations with underlying intrigue and violence, making it a central character in the narrative of imperial dominance.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_livias_private_chambers'})
    ON CREATE SET
        l.name = 'Livia\'s Private Chambers',
        l.description = 'A richly decorated and intimate chamber within the palace, belonging to the Empress Livia. Adorned with luxurious fabrics and exquisite decor, it is softly lit by oil lamps and serves as a backdrop for secretive exchanges and manipulations, reflecting both comfort and confinement.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_imperial_council_chamber'})
    ON CREATE SET
        l.name = 'Imperial Council Chamber',
        l.description = 'An imposing and grand room within the Imperial Palace designed for significant meetings and imperial pronouncements. Framed by imposing columns and adorned with Roman symbols of power, it features a large map table for strategic planning, serving as a central hub for governance and military discussions.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_rhine'})
    ON CREATE SET
        l.name = 'Rhine',
        l.description = 'A major river that forms a significant portion of the Roman frontier with Germania. It represents a strategic focus in the military crisis, where its bridges and banks serve as vital points for controlling movement between Roman territories and potential invading forces.',
        l.type = 'River/Region'
    ;
MERGE (l:Location {uuid: 'location_imperial_box_games'})
    ON CREATE SET
        l.name = 'Imperial Box (Games)',
        l.description = 'A designated, elevated box at the venue of the Games reserved for the Emperor and his family. Although it offers a prominent view of the events, its placement—mentioned as \'at the back\'—reflects the ambiguous position of family members like Claudius in the imperial hierarchy.',
        l.type = 'Designated Area/Box'
    ;
MERGE (l:Location {uuid: 'location_claudius_study'})
    ON CREATE SET
        l.name = 'Claudius\' Study',
        l.description = 'The private study of Claudius, presumably within the Imperial Palace. This space, used for scholarly and literary pursuits as evidenced by the discovery of a biography of his father, underscores Claudius’s intellectual side while remaining a personal area within the broader imperial household.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_arena'})
    ON CREATE SET
        l.name = 'Arena',
        l.description = 'A vast, open-air amphitheater filled with rows of spectators and charged with the sounds of combat, steel clashing, and roaring crowds. The sunlit, sand-covered ground hosts brutal gladiatorial combats, while decorations and the prominent imperial box amplify the spectacle and raw intensity of the events.',
        l.type = 'Venue'
    ;
MERGE (l:Location {uuid: 'location_palace_corridor'})
    ON CREATE SET
        l.name = 'Palace Corridor',
        l.description = 'A dimly lit and secluded corridor within the palace, thick with atmosphere and unspoken tension. Its shadowy passage and hushed whispers symbolize the hidden machinations and secretive nature of the imperial family\'s power struggles.',
        l.type = 'Corridor'
    ;
MERGE (l:Location {uuid: 'location_palace_grounds'})
    ON CREATE SET
        l.name = 'Palace Grounds',
        l.description = 'The Palace Grounds at night transform into a shadowy labyrinth where vibrant foliage gives way to long, dancing shadows. Towering hedges and ancient trees create secluded pockets, fostering an atmosphere of secrecy and unease within the supposed safety of the imperial residence.',
        l.type = 'Grounds'
    ;
MERGE (l:Location {uuid: 'location_palace_gardens'})
    ON CREATE SET
        l.name = 'Palace Gardens',
        l.description = 'A secluded and dimly lit section of the palace grounds, characterized by the rustling of leaves and an overall atmosphere of secrecy and tension. This space provides a venue for private conversations and clandestine meetings, hidden away from the public eye within the imperial complex.',
        l.type = 'Garden'
    ;
MERGE (o:Organization {uuid: 'org_roman_army'})
    ON CREATE SET
        o.name = 'Roman Army',
        o.description = 'The military force of the Roman Empire, responsible for defense, expansion, and maintaining order within its territories. In this scene, the focus is on the legions stationed in Germania under Tiberius\'s command as \'raw recruits\', with an immediate objective of retrieving the lost Roman eagles from the Germanic tribes.',
        o.sphere_of_influence = 'Military Operations, Imperial Security, Roman Expansion'
    ;
MERGE (o:Organization {uuid: 'org_german_tribes'})
    ON CREATE SET
        o.name = 'German Tribes',
        o.description = 'A collective term for the various Germanic peoples residing across the Rhine and depicted as enemies of Rome. In this scene they are implicated in the massacre of Roman legions in the Teutoberg Forest, employing tactics of ambush and betrayal.',
        o.sphere_of_influence = 'Germania'
    ;
MERGE (o:Organization {uuid: 'org_roman_senate'})
    ON CREATE SET
        o.name = 'Roman Senate',
        o.description = 'The governing body of Rome, composed traditionally of the aristocracy. Although its power has diminished under the Empire, it retains symbolic importance and some legislative and advisory functions, notably in confirming imperial transitions.',
        o.sphere_of_influence = 'Roman Governance, Legislation, Imperial Succession (Nominally)'
    ;
MERGE (o:Organization {uuid: 'org_roman_republic'})
    ON CREATE SET
        o.name = 'Roman Republic',
        o.description = 'The former political system of Rome before it was replaced by the Empire under Augustus. Referenced in this scene in the context of Claudius\'s biography of his father, its mention is controversial as it evokes nostalgia for past republican ideals and is viewed as potentially subversive by figures like Livia.',
        o.sphere_of_influence = 'Roman Politics (historical), Ideological Opposition (to Empire)'
    ;
MERGE (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
    ON CREATE SET
        ep.title = 'What Shall We Do About Claudius?',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Poetry and Poison Tongues',
        s.description = 'In the opulent yet intimate setting of an imperial salon, a carefully orchestrated evening unfolds. Rich tapestries and classical art adorn the walls, casting soft shadows in the warm light. Horace, the poet laureate, stands at the room\'s center, his voice resonating with verses that glorify the Emperor and subtly hint at the empire\'s fragile grandeur. Augustus, the aging emperor, presides with a veneer of benevolent charm, surrounded by his extended family. Yet beneath the surface of polite applause and forced smiles, tensions simmer. Claudius, the awkward prince, observes from the periphery, a stammering shadow amidst the polished figures of his kin. Livilla\'s playful cruelty towards Postumus, Livia\'s veiled barbs, and Tiberius\'s brooding silence all contribute to an atmosphere thick with unspoken rivalries and calculated disdain. The scene, beginning with artistic pretense and ending with chilling pragmatism, highlights the performative nature of imperial life and the casual cruelty directed at those deemed weak or inconvenient, setting the stage for the dynastic intrigues to come.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_salon'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Horace Recites Imperial Verse',
        e.description = 'The scene opens with Horace, the court poet, reciting his poetry to Augustus and his family. His verses, praising the cyclical nature of life and the inevitability of death, serve as a backdrop to the unfolding drama. While seemingly innocuous, the poem subtly underscores the themes of mortality and legacy that permeate the narrative, hinting at the transient nature of power and earthly glory amidst the splendor of the Roman court. Claudius, observing from the side, offers internal commentary, introducing key family members and their dynamics to the audience through voiceover.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["HORACE: \"Thaw follows frost, hard on the heels of spring, treads summer bound to die...for hard on hers, comes autumn with his apples scattering. Then back to winter tide again where nothing stirs. But, oh, what're the sky-led seasons mar, Moon upon moon rebuilds it with her beams...\"", "HORACE: \"...Come we where Tullus and where Ancus are, and good Aeneas, we are dust and dreams. Torquatus, if the gods in heaven should add the morrow to the day, ...\"", "HORACE: \"...Feast then thy heart, for what thy heart has had, the fingers of no heir will ever hold. When thou descendent once the shades among, the stern assize...\"", "HORACE: \"...and equal judgment o'er, Not thy long lineage nor thy golden tongue, No, nor thy righteousness, shall friend thee more.\""]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Augustus Praises Horace and Bestows a Gift',
        e.description = 'Following Horace\'s recitation, Augustus showers the poet with effusive praise, lauding his verses as superior to Ovid\'s and emphasizing the importance of wholesome, morally uplifting poetry. This display of imperial approval is both performative and calculated, reinforcing Augustus\'s image as a patron of the arts and a moral authority. He promises Horace a gold statue as a reward, further highlighting the emperor\'s wealth and power while subtly underscoring the transactional nature of favor in the imperial court. The scene reveals Augustus\'s preference for art that serves his propaganda, contrasting with Ovid\'s more subversive and sensual works.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: Oh, beautiful. Beautiful. Horace, my dear fellow, such language. Wonderful. Wonderful. Weren't they lovely poems? Exquisite. Now, that's what I call poetry. Ovid? I mean there's no comparison. It's better than Ovid. I don't care what they say! I've never liked that man. Alright, his poetry's very beautiful, but it's also very smutty. A lot of it's downright indecent. Frankly, I wouldn't have him in the house. Thank you. People say that he has a lovely voice, but I say what does he do with his lovely voice? Talks a lot of smut, that's what he does!", "AUGUSTUS: Write poetry, yes, but write about nice things - things you'd like your children to hear. Now, I want a copy of the book when you publish.", "AUGUSTUS: And before you go, I've got a good present for you.", "AUGUSTUS: Oh, it's nothing. It's a little gold statue I found, Etruscan, I think. It's solid gold, but you'll appreciate it more than anyone.", "AUGUSTUS: No, no, no. Err, PRAXIS? Praxis, where are you?", "PRAXIS: Here, Caesar.", "AUGUSTUS: He knows where it is. Now, wait till you see it, really. Yes, you must come again sometime."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Clumsiness and Family\'s Scorn',
        e.description = 'The convivial atmosphere abruptly shifts when Claudius clumsily knocks over a cup. This minor accident becomes a flashpoint, exposing the family\'s deep-seated disdain for him. Livia immediately seizes the opportunity to belittle Claudius, her sharp words echoing the general sentiment of the family. Antonia and Livilla join in the reprimand, highlighting Claudius\'s social ineptitude and reinforcing his position as the family outcast. This moment underscores Claudius\'s constant struggle for acceptance and the casual cruelty he endures from his own family, setting him apart as the object of ridicule and contempt.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: I was wondering how long it would take you to knock that over.", "ANTONIA: Claudius, how can you be so clumsy?", "LIVIA: Oh, leave it alone, for heaven's sake. If you want to do the clearing up, we'll find you some work in the kitchens.", "ANTONIA: Claudius!"]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Family Bids Goodnight Amidst Lingering Tensions',
        e.description = 'As the evening draws to a close, the family prepares to depart. The goodnights exchanged are a mix of genuine affection and perfunctory politeness, masking the underlying tensions. Augustus, seemingly oblivious or willfully ignorant of the family\'s dynamics, expresses his desire for Livilla\'s absent husband, Castor, to attend future gatherings, highlighting the importance he places on familial appearances. Tiberius\'s curt reply about his son further reveals the fractured family relationships. The scene concludes with a series of formal goodnights, each interaction carrying unspoken weight and hinting at the complex web of relationships within the Julio-Claudian dynasty.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["GERMANICUS: Pina, wake up. It's time to go home.", "ANTONIA: It's time we all went home.", "AUGUSTUS: What? Are you leaving?", "ANTONIA: It's late. It's two hours after dark already.", "AUGUSTUS: Yes, yes, you're right, and there's a lot of work to do tomorrow. A sleepy head's a foolish one. What a poet that Horace is, eh? Well, Livilla, the whole family was here tonight except your husband. It won't do, you know.", "LIVILLA: What can I do? Castor hates family dinners.", "AUGUSTUS: Oh, I don't understand that. Tiberius, you must talk to that son of yours.", "TIBERIUS: You talk to him, he doesn't listen to me.", "AGRIPPINA: Goodnight, Uncle.", "AUGUSTUS: Goodnight, my dear.", "GERMANICUS: Grandfather.", "AUGUSTUS: Goodnight Germanicus. Goodnight Pina.", "CLAUDIUS: G-G-Goodnight, Grandmother.", "LIVIA: That's my foot you're treading on.", "DOMITIA: Are we going?", "CLAUDIUS: Sorry.", "ANTONIA: Claudius, do come on.", "AUGUSTUS: Ah, Postumus, I'll come and see those troops of yours tomorrow. How are they shaping up?", "POSTUMUS: Very well. There's some good material there.", "AUGUSTUS: Good.", "POSTUMUS: Goodnight.", "AUGUSTUS: Goodnight.", "POSTUMUS: Goodnight, everyone.", "AUGUSTUS: Goodnight, Domitia.", "DOMITIA: Goodnight, Grandfather.", "AUGUSTUS: Ah, goodnight, Livilla. Now, you tell that husband of yours... Oh. You know what to tell him.", "LIVILLA: Grandmother.", "LIVIA: Goodnight, my dear. You looked very lovely tonight.", "LIVILLA: Thank you. Goodnight, Uncle.", "CLAUDIUS: G-G-Goodnight, Grandfather.", "AUGUSTUS: What? Oh, yes goodnight, Claudius. Ah, what a wonderful evening. They're such good children. I think they liked their little presents, eh?"]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'Livia and Augustus\'s Private Discussion About Claudius',
        e.description = 'Once the family has departed, Livia immediately shifts the focus to a more pragmatic and politically charged topic: Claudius\'s role in the upcoming games honoring his father. Her cold pragmatism pierces the mirth of the evening as she confronts Augustus with the uncomfortable question of Claudius\'s public visibility. Augustus, seeking to avoid conflict and postpone difficult decisions, initially dismisses the concern. However, Livia\'s persistence forces him to confront the dilemma of Claudius\'s public image and the potential damage it could inflict on the imperial family\'s carefully constructed perception. Their exchange reveals Livia\'s ruthless focus on maintaining appearances and her willingness to marginalize Claudius for the sake of political expediency.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: What are we going to do about Claudius?", "AUGUSTUS: Claudius what? What? In the matter of what?", "LIVIA: In the matter of the games to be held in his father's honor.", "AUGUSTUS: Oh, I don't know. I mean, must we think about it now?", "LIVIA: Well, how much longer can we leave it? Is he to sit in your box at the games or is he not?", "AUGUSTUS: Well, it might look a little odd if he doesn't.", "LIVIA: It might look odder if he does. Do you want to sit next to a twitching idiot all day?", "AUGUSTUS: Oh, let's think about it tomorrow, eh? Goodnight, my dear. Now don't you worry about Claudius. I'll have him to dinner a few times and I'll see how he gets on. If we could just stop that twitching."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Shattering News',
        s.description = 'In the austere confines of the Imperial Study, the air is thick with tension. The night is dark and foreboding, illuminated only by the flickering light of oil lamps that cast long shadows across the formal, book-lined walls. Augustus, the weary emperor, sits at a heavy desk cluttered with scrolls, embodying the heavy burden of state matters. Tiberius stands nearby, his grim expression mirroring the dark clouds gathering over the empire. The nervous aide, Praxis, hovers by the door, a harbinger of urgent news. The sudden sound of hurried footsteps echoes through the quiet room, breaking the oppressive silence. When the courier enters, disheveled and covered in mud, it becomes clear that the news he bears is dire—the annihilation of three legions in the Teutoburg Forest. This revelation sends shockwaves through the room, igniting a flurry of concern as Augustus, Tiberius, and Germanicus grapple with the implications of their military disaster. The scene serves as a pivotal moment, revealing the fragility of Roman power and the impending chaos that will ensue, setting the stage for a brutal confrontation with destiny.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Praxis Brings Urgent News',
        e.description = 'Praxis hurriedly enters the study, interrupting Augustus\'s evening to deliver an urgent message about a courier arriving from Germany. His anxious demeanor signals the gravity of the situation, but Augustus, exasperated, questions the need for such news at this hour. The tension builds as Praxis insists on the urgency, setting the stage for the shocking revelation that follows.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Caesar! Caesar, forgive me, but a courier has just arrived from Germany.", "But it's urgent, Caesar, Urgent! There's been a terrible disaster."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Courier Delivers Catastrophic News',
        e.description = 'The exhausted courier enters, confirming his identity as a soldier of the now-defunct 19th legion. He delivers news that sends shockwaves through the assembly: all three legions, the 17th, 18th, and 19th, have been massacred in the Teutoburg Forest. The implications of this disaster resonate deeply, as it signifies a vulnerability in Roman defenses and the potential for enemy incursions into Gaul. The dread escalates as Augustus and Tiberius process the magnitude of the loss.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["The whole army of Quinctilius Varus was massacred in the Teutoburg Forest.", "Three legions, Caesar. There's nothing left."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Plans for Response Are Discussed',
        e.description = 'With the gravity of the situation laid bare, Augustus instructs Praxis to summon Germanicus and Postumus. As the urgency of the moment escalates, discussions turn toward immediate military responses. Tiberius and Germanicus strategize on how to deal with the Germans, contemplating whether they have seized the Rhine bridges. There is an underlying tension as they prepare to protect their provinces from impending threats.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Send for GERMANICUS and POSTUMUS. Hurry!", "Then we'll have to secure the bridges. Fast!"]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Germanicus and Postumus\'s Role in the Crisis',
        e.description = 'As Germanicus enters, the gravity of the military situation becomes more pronounced. The courier recounts the chaotic circumstances of the legions\' annihilation, emphasizing the betrayal by allied Germans. The urgency mounts as they discuss potential troop movements and strategies to reclaim control of the provinces. Tiberius proposes to take action immediately, showcasing the emerging leadership dynamics in the face of crisis.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["There is no army in Across-the-Rhine Germany.", "With the men Postumus has been training on Mars field, it brings the number up to about a legion."]
    ;
MERGE (e:Event {uuid: 'event_2_5'})
    ON CREATE SET
        e.title = 'The Impending Crisis and Livia\'s Calculations',
        e.description = 'Livia enters the scene, composed despite the chaos brewing outside. She subtly manipulates the conversation, hinting at Postumus’s whereabouts while maintaining the facade of concern. The undercurrents of family manipulation begin to reveal themselves as the conversation shifts towards the need for immediate action and how to manage the fallout of the disaster. Augustus\'s reliance on his family and military might is tested, leading to a discussion of securing the empire\'s borders.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Did it occur to you he may have visited his wife's room?", "With the men Postumus has been training on Mars field, it brings the number up to about a legion."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'A Historian\'s Warning',
        s.description = 'Sunlight filters into the hallowed Imperial Library, illuminating towering shelves laden with scrolls and books, the air thick with the scent of aged papyrus and quiet contemplation. Renowned historians Livy and Pollio seek a rare text, their scholarly pursuit briefly disrupted by the hesitant approach of young Claudius. Initially dismissed, Claudius reveals a surprising depth of knowledge, impressing Pollio and piquing his curiosity. The atmosphere shifts from academic inquiry to hushed intrigue as Pollio, recognizing the prince\'s lineage, imparts a cryptic yet vital warning. He unveils the perilous nature of truth in the Roman court, advising Claudius to mask his intellect behind a façade of foolishness to ensure his survival amidst the treacherous currents of imperial politics. The scene underscores the library as not just a repository of knowledge but also a stage for subtle power dynamics and veiled warnings, leaving Claudius to grapple with the chilling implications of Pollio\'s words.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_library'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Scholarly Search Interrupted',
        e.description = 'Livy and Pollio, accompanied by a Librarian, are immersed in their search for a specific book within the vast Imperial Library. Their focused discussion is momentarily paused by the Librarian\'s unsuccessful search and the arrival of young Claudius, who hesitantly approaches, his presence initially unnoticed by the preoccupied historians.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVY: Well, it was here. It was years ago, but I saw it.", "POLLIO: Then it's been stolen probably.", "LIVY: There's a book we want to look at. It's by a Greek called Polemocles. And it's a commentary on Polybius' Military Tactics. It's not in the catalog but it was here.", "LIBRARIAN: I'll see if I can find it."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Historians Take Notice of Claudius',
        e.description = 'Livy\'s recognition of Claudius draws the historians\' attention to the young prince. They engage him in conversation, initially with condescension, assuming his literary interests are trivial. Pollio, in particular, voices a dismissive opinion, reflecting a common prejudice against the young nobles\' supposed lack of serious intellectual pursuits, setting up a contrast with Claudius\'s actual interests.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVY: Why, it's young CLAUDIUS, isn't it?", "CLAUDIUS: Yes, it is, sir.", "LIVY: You seem very studious. What are you reading?", "POLLIO: Romantic rubbish, I'll be bound. That's all the young use this library for. What is it that you're reading?"]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Claudius Demonstrates Unexpected Intellect',
        e.description = 'Claudius reveals he is reading Livy\'s own \'History of the Civil Wars,\' surprising the historians and challenging their initial assumptions.  Pollio, intrigued and still slightly dismissive, playfully tests Claudius\'s knowledge and judgment, initiating a lighthearted but pointed comparison between himself and Livy to gauge the young prince\'s discernment and courage in expressing his opinion.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: It's your own History of the C-C-Civil Wars.", "LIVY: It's rubbish, all right.", "POLLIO: So you know who I am?", "CLAUDIUS: Oh, yes, sir. ASINIUS P-P-POLLIO. One of our g-greatest historians.", "POLLIO: One of them? What do you mean, one of them?", "CLAUDIUS: One of the t-two greatest.", "POLLIO: And who is the other one?", "CLAUDIUS: L-L-Livy, of course.", "POLLIO: Well, there can't be two greatest. That's just shilly-shallying, apart from being an abuse of the Roman tongue. So, you will have to choose. Which one of us would you rather read?", "LIVY: Oh come Pollio, that's not fair.", "POLLIO: Nonsense. The lad's obviously intelligent. So, speak up, boy. Which of us would you rather read?", "CLAUDIUS: Well, it d-d-depends, sir."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'A Diplomatic and Truthful Answer',
        e.description = 'Claudius, despite his stammer and initial nervousness, delivers a remarkably astute and diplomatic answer. He praises both historians, differentiating their strengths—beauty of language for Livy and interpretation of fact for Pollio—demonstrating not only intelligence but also tact and nuanced understanding. This clever response further impresses Pollio and challenges Livy\'s playful disapproval, marking Claudius as more perceptive and thoughtful than they initially presumed.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["POLLIO: Ah, intelligent, but cowardly.", "CLAUDIUS: No. I mean, it depends on what I'm reading for. For b-beauty of language I would read L-Livy, and for interpretation of fact I would read P-P-Pollio.", "LIVY: Now you please neither of us and that's always a mistake!", "CLAUDIUS: I wasn't t-trying to please, just to tell the truth."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Claudius Locates the Missing Book',
        e.description = 'As the Librarian returns empty-handed, Claudius interjects with surprising confidence, correcting the historians about the book\'s title, author, and even ethnicity. He accurately pinpoints its location on a high shelf, revealing a detailed knowledge of the library\'s collection that far surpasses expectations. This moment firmly establishes Claudius\'s intellectual prowess and sharp observational skills, contrasting sharply with his perceived image as a fool.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["POLLIO: He might make an historian after all.", "LIBRARIAN: The book isn't here. Perhaps you read it in the Octavian library?", "LIVY: I'm not so old young man that I don't know what library I'm in when I'm in it!", "CLAUDIUS: Umm. umm. Excuse me. Um, um, the book you want, it's on the t-t-top shelf, fourth from the window right at the back. I had it out the other day. Only the t-t-title is Dissertation on Tactics and it's by P-P-Polemocrates, not Polemocles, and he was a J-J-Jew, not a Greek.", "POLLIO: Hahaha.", "LIVY: You'd better be right, boy. For I don't take kindly to that many corrections in one day!"]
    ;
MERGE (e:Event {uuid: 'event_3_6'})
    ON CREATE SET
        e.title = 'Identity Revealed and Perceptions Shift',
        e.description = 'Pollio, now genuinely impressed and curious, directly asks Claudius to identify himself. Upon hearing Claudius\'s full name and titles, Pollio realizes he is speaking to the ridiculed prince of the imperial family. Pollio acknowledges the court\'s underestimation of Claudius, directly referencing the false perception of him as a \'half-wit.\' Claudius candidly confirms his family\'s shame and describes his physical ailments, reinforcing the superficial judgments made against him based on appearances.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: Have I upset him?", "POLLIO: Yes. It'll do him good. Do you like history?", "CLAUDIUS: Yes, sir.", "POLLIO: But who the devil are you? Livy called you Claudius.", "CLAUDIUS: I'm T-T-Tiberius Claudius D-Drusus Nero Germanicus.", "POLLIO: Oh, that Claudius! They told me you were a half-wit.", "CLAUDIUS: Well, my f-family's ashamed of me because I s-s-stammer, and I'm lame and my head twitches.", "POLLIO: Yes, I've noticed that. Can't you stop it?", "CLAUDIUS: No. The doctors said I might g-g-grow out of it."]
    ;
MERGE (e:Event {uuid: 'event_3_7'})
    ON CREATE SET
        e.title = 'A Dangerous Family History and Cryptic Warning',
        e.description = 'The conversation takes a serious turn as Claudius reveals his historical project: writing biographies of his father and grandfather, figures associated with the Republic. Pollio immediately recognizes the danger, hinting at the politically motivated deaths of Claudius\'s Republican-leaning ancestors – implying they were \'poisoned.\'  He then delivers a crucial, cryptic warning, advising Claudius to exaggerate his disabilities and play the fool as a survival strategy within the treacherous imperial court, suggesting that his intellectual pursuits, especially those touching on sensitive history, could be perilous.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["POLLIO: Why were you reading my History of the Civil Wars?", "CLAUDIUS: Oh, I'm gathering material for a life of my f-f-father and g-g-grandfather.", "POLLIO: Oh, I remember them.", "CLAUDIUS: They both believed in the Republic.", "POLLIO: I know they did. That's why they died.", "CLAUDIUS: I beg your pardon?", "POLLIO: I mean, that's why they were poisoned.", "CLAUDIUS: P-p-p-poisoned!", "POLLIO: Sh! Not so loud. Look, I won't mention any names, but I'll tell you this. You say you're writing a life of your father? They won't let you finish it.", "CLAUDIUS: Who won't?", "POLLIO: Never mind. Look here, Claudius, I'll give you some good advice. Do you want to live a long and useful life?", "CLAUDIUS: Yes.", "POLLIO: In that case, exaggerate your stutter and your limp. Let your wits wander and play the fool as much as you like. Do you understand me? It's a pleasure to talk to you, my boy. I must find Livy."]
    ;
MERGE (e:Event {uuid: 'event_3_8'})
    ON CREATE SET
        e.title = 'Stunned Realization and Lingering Fear',
        e.description = 'Pollio abruptly exits to rejoin Livy, leaving Claudius alone to process the weight of the historian\'s warning. Claudius is left in stunned silence, fixated on the shocking revelation of \'poisoned,\' his final line echoing the most impactful and disturbing piece of information he has just received. The scene concludes with Claudius grappling with the dawning realization of the danger surrounding him and the chilling implications of Pollio\'s advice for his future survival in the Roman court.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["CLAUDIUS: P-P-Poisoned?"]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'A Fig and Familial Pressure',
        s.description = 'In the tranquil embrace of Augustus\' Gardens, sunlight filters through lush foliage, illuminating the serene beauty of the setting. Augustus, the venerable Emperor of Rome, stands alongside his grandson Postumus, offering a fig—an emblem of nature\'s bounty and a moment of paternal connection. The atmosphere feels deceptively peaceful, yet undercurrents of tension pulse beneath the surface. As Augustus reflects on the privileges of their station, he subtly layers his words with expectations and pressures upon Postumus. The dialogue reveals not just the bond between grandfather and grandson but also the weight of familial duty and the looming specter of Livia\'s discontent. This scene serves to explore the complex dynamics of power and legacy within the Julio-Claudian dynasty, as Augustus grapples with the realities of succession in an empire rife with ambition and rivalry. Thematic elements of duty, ambition, and the pressure of expectation loom large, encapsulating the struggle between personal desire and imperial obligation. The serene setting contrasts sharply with the tension surrounding Postumus\'s future, creating a rich tableau of familial interaction amidst political intrigue.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Augustus Offers Wisdom Along with a Fig',
        e.description = 'In the heart of Augustus\' Gardens, Augustus casually offers a fig to Postumus, initiating a conversation steeped in the grandeur of their heritage. He reflects on Rome\'s privileged status compared to lesser lands, emphasizing the hard work that has built their empire. This moment is not just about the fig but a deeper instruction on the responsibilities they hold as rulers. Augustus’s words are laced with caution, suggesting that they cannot afford complacency amid the comforts of their station. Postumus, responding with curiosity, hints at an underlying tension about their family\'s expectations and his role within them.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Taste that.", "Did you ever think how fortunate we are?", "Do you understand the effort that has gone into making this little place master of the world?"]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Weight of Complaints and Expectations',
        e.description = 'Augustus guides Postumus to sit, shifting the tone towards more serious matters. He reveals that there are complaints about Postumus\'s behavior, particularly an incident where he threw a palace guard into a fountain. The exchange highlights the tension between familial love and political reality, as Augustus reminds Postumus of the image they must uphold. He reveals Livia\'s criticisms, which serve to reinforce the pressures on Postumus to conform to expectations. This pivotal moment underscores the complexities of family dynamics and the burdens of legacy, where personal actions are scrutinized against the backdrop of imperial duty.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I hear nothing but complaints about you.", "Livia for instance. I mean she complains about you all the time."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Inheritance and Expectations Clash',
        e.description = 'As the conversation deepens, Postumus confronts Augustus about the withholding of his inheritance. This moment starkly illustrates Postumus\'s frustration and desire for recognition. Augustus explains that he plans to grant it only when he feels Postumus is mature enough, emphasizing the need for him to prove his worth. The dialogue reveals the contrasting expectations placed on Postumus, who grapples with feelings of inadequacy while navigating the complexities of imperial favor. Augustus\'s insistence on maturity and accountability highlights the theme of personal development against the backdrop of political aspirations.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Why has my inheritance from my father been withheld?", "You'll get it when I think you're mature enough to use it."]
    ;
MERGE (e:Event {uuid: 'event_4_5'})
    ON CREATE SET
        e.title = 'Tiberius and the Struggle for Approval',
        e.description = 'The tension escalates as Postumus expresses concern about Tiberius, who is also positioned as a potential successor. Augustus reassures Postumus that he will address Tiberius\'s ambitions, emphasizing his personal disapproval of Tiberius as a ruler. This moment reveals Augustus\'s conflicted feelings about familial loyalty and the political landscape, creating a nuanced portrait of the struggles within the Julio-Claudian dynasty. Postumus\'s worries reflect a growing realization of his precarious position in the power hierarchy, as he seeks affirmation from Augustus while contending with the reality of Tiberius\'s influence.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Oh, you let me worry about Tiberius.", "Tiberius, that's something else, we just don't get on."]
    ;
MERGE (e:Event {uuid: 'event_4_6'})
    ON CREATE SET
        e.title = 'The Burden of Legacy',
        e.description = 'As the conversation culminates, Augustus reflects on his legacy and the importance of ensuring that Rome is left in capable hands. He emphasizes that the Senate will accept his recommendations for succession, but it will depend on Postumus earning his trust. This moment encapsulates the heavy weight of expectation that both Augustus and Postumus bear. Augustus\'s insistence on meritocracy in succession frames the larger themes of ambition and legitimacy within the context of imperial Rome, as Postumus grapples with his identity amidst the powerful shadows of his family.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["I think the Senate will accept my recommendation.", "But you must earn it, you understand."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'A Mother\'s Scorn, A Daughter\'s Fear',
        s.description = 'In the intimate yet opulent confines of Livia\'s private chambers, the air hangs heavy with unspoken accusations and veiled threats. Soft lamplight casts long shadows across the richly decorated room, illuminating tapestries and ornate furniture that speak to imperial power. The atmosphere is thick with tension as Livia, regal and composed, confronts her granddaughter Livilla, who enters with a nervous tremor in her voice. The scene is emotionally charged, oscillating between Livia\'s icy control and Livilla\'s escalating fear and desperation. This clandestine meeting serves as a critical juncture, unveiling Livia\'s ruthless pragmatism and her intricate machinations to secure the imperial succession for Tiberius. The thematic undercurrents of ambition, betrayal, and familial manipulation are palpable, as Livia uses both intimidation and calculated appeals to bend Livilla to her will, revealing the cold, strategic heart of Roman imperial politics where even family is a tool to be wielded.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_private_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'The Accusation of Infidelity',
        e.description = 'Livilla nervously enters Livia\'s chambers, seeking an audience she requested but now dreads. Livia, without preamble, launches a direct and chilling accusation: Livilla has been unfaithful to her husband, bedding Postumus Agrippa in secret. The accusation hangs in the air, heavy with Livia\'s implied omniscience and unwavering authority. Livilla is immediately thrown into a state of panicked denial, the playful anticipation she might have had replaced with stark fear.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVILLA: Grandmother?", "LIVIA: Why do you deceive your husband every time he's away?", "LIVILLA: Deceive? I don't understand.", "LIVIA: Why do you allow Postumus Agrippa into your room at night?"]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Confession and Plea for Mercy',
        e.description = 'Cornered and terrified by Livia\'s unwavering gaze and her chilling mention of Livilla\'s aunt Julia\'s banishment, Livilla\'s denial crumbles. She breaks down, confessing to the affair and desperately pleading for Livia\'s mercy. Livilla\'s fear of exile and separation from the imperial court is palpable as she sobs and promises to end the affair, revealing her dependence on Livia\'s favor and the suffocating power of the Empress.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVILLA: But I don't! Who said such a thing?", "LIVIA: Come here.", "LIVILLA: Oh, God! I didn't mean it. I didn't mean it! I won't ever do it again. Don't send me away. Please. Please. I won't ever see him again, I swear it. [*sobs*]"]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'From Scorn to Manipulation',
        e.description = 'Livia, having witnessed Livilla\'s abject fear and confession, shifts her demeanor from stern judge to manipulative confidante. She dismisses Livilla\'s tears and subtly appeals to her vanity, reminding her of her beauty and drawing a parallel to her own legendary allure. This calculated shift is designed to regain control of Livilla, turning her fear into a tool for manipulation. Livia\'s reference to Cleopatra serves as a veiled warning and a subtle form of flattery, suggesting Livilla possesses a similar dangerous charm.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: You were always a naughty little girl, you know that, don't you? Your mother never punished you enough.", "LIVILLA: You won't tell Augustus, will you? He'll send me away if you do and I couldn't bear it!", "LIVIA: Well, perhaps that won't be necessary. Oh, come on, dry your tears, come on. There. That's better. Such a beautiful girl. I was beautiful too once, you know?", "LIVILLA: They say you were the most beautiful woman in the world.", "LIVIA: There was one other, but she was in Egypt. And, besides, she didn't last as long as I did."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'The Succession Conspiracy Revealed',
        e.description = 'Livia steers the conversation from Livilla\'s indiscretion to the grand political stage of Rome, feigning to confide in her granddaughter as a \'grown woman\'. She evokes the specter of civil war and emphasizes the need for singular, unchallenged leadership. This carefully constructed narrative lays the groundwork for revealing her true objective: securing the imperial succession for Tiberius and his lineage. Livia skillfully frames her ambition as a matter of Roman stability and duty, manipulating Livilla\'s desire for her husband\'s future glory.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LIVIA: Now, about Postumus Agrippa. You're not in love with him, are you?", "LIVILLA: No.", "LIVIA: He pestered you, I suppose, and you gave in. Oh, what frail creatures we women are.", "LIVILLA: He always wanted me.", "LIVIA: Yes, and you always enjoyed teasing him, didn't you? Oh yes, you did, I've seen it.", "LIVILLA: I swear to you I won't do it again.", "LIVIA: Yes, well, let's not be in too much of a hurry to swear anything, shall we? My dear, I must talk to you like a grown woman now. Can I talk to you? Can I open my heart to you?", "LIVILLA: Oh, yes, Grandmother, yes.", "LIVIA: Many years ago, you know, before you were born, we all went through the terrible agony of civil war. Rome tottered and shook and nearly fell. I'm afraid that may happen again.", "LIVILLA: And will it?", "LIVIA: I'm sure of one thing. Only a single hand at the helm will keep this ship on course. Now, the question is, whose hand will it be? If there is any doubt, the rivalry will plunge us into civil war again.", "LIVILLA: Is there a doubt, then?", "LIVIA: Not in my mind. But there is in someone else's.", "LIVILLA: Augustus?", "LIVIA: Yes. And it's my duty to remove that doubt. Through everything I've ever done, that has been my only object. And now it must become yours.", "LIVILLA: How, Grandmother?", "LIVIA: You want your husband to become Emperor of Rome?", "LIVILLA: Yes.", "LIVIA: Then his father must become Emperor before him. Tiberius must succeed Augustus, if Castor is to succeed Tiberius. Only then will the line become established. It'll seem easier to accept it than reject it."]
    ;
MERGE (e:Event {uuid: 'event_5_5'})
    ON CREATE SET
        e.title = 'The Postumus Problem',
        e.description = 'Livilla, now seemingly aligned with Livia\'s grand scheme, instinctively identifies the major obstacle: Postumus Agrippa. Livia, pleased with Livilla\'s quick grasp of the situation, subtly confirms Postumus\'s problematic status. The scene ends on this chilling note, implying that Postumus is not merely a romantic entanglement but a significant threat to Livia\'s carefully laid plans, and that Livilla is now implicated in whatever \'solution\' Livia intends to enact regarding him. The air is thick with unspoken danger and the weight of imperial ambition.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVILLA: And Postumus?", "LIVIA: Bravo, my dear, you've put your finger on it. Yes. Postumus. As always, we come back to Postumus."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Fury and Strategy in the Council Chamber',
        s.description = 'Inside the imposing Imperial Council Chamber, adorned with grandiose columns and heavy symbols of power, the tension is palpable as AUGUSTUS paces, his fury barely contained. LIVIA stands poised by a large map table, her demeanor calm yet calculating. The air is thick with the weight of military decisions and familial strife, as Augustus expresses his frustration over Quinctilius Varus\'s inaction in recovering the lost Roman eagles. LIVIA, ever the strategist, counters his anger with reasoned caution, arguing against sending the untested Postumus Agrippa to the Rhine. Their conversation quickly escalates from concern for the empire\'s military strategy to deeper currents of mistrust, ambitions, and familial dynamics. The scene reveals the cracks in Augustus\'s leadership, the lurking shadows of rivalry between Tiberius and Postumus, and Livia\'s manipulative influence over the Emperor. As they weigh the fates of their sons against the backdrop of a failing campaign, the audience is reminded that in Rome, the stakes of power are measured not just in military conquests, but in the very fabric of family loyalty and ambition.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_council_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Augustus\'s Fury Unleashed',
        e.description = 'AUGUSTUS expresses his anger over Quinctilius Varus\'s lack of action in retrieving the lost Roman eagles, accusing Varus of playing games instead of fulfilling his military duties. His frustration reveals the urgency felt within the empire as he questions the competence of his generals.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Nothing! That's what it amounts to, he's done nothing!", "Oh, he's playing some game of his own, that's what he's doing!"]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Livia\'s Cautious Counsel',
        e.description = 'LIVIA asserts her perspective, suggesting that Varus\'s caution is warranted given the nature of the army he commands. She attempts to temper Augustus\'s fury with logical reasoning, highlighting the risks of sending an untested commander into battle.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["He is cautious, naturally.", "He has an army of raw recruits. Would you have him risk another ambush?"]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Conflict over Command Decisions',
        e.description = 'AUGUSTUS and LIVIA clash over the decision to send Postumus Agrippa to the Rhine. Augustus insists on sending him for his training and potential, while Livia counters that Postumus is unpredictable and would only exacerbate tensions with Tiberius.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["He's the obvious person to send.", "Postumus is totally unpredictable."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'The Shadow of Rivalry',
        e.description = 'Livia reveals the historical animosity between Postumus and Tiberius, warning Augustus that sending Postumus would be perceived as a lack of trust in Tiberius, which could lead to friction. This highlights the ongoing power struggle within the family dynamics.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["If Postumus arrives, Tiberius will regard him as more of a spy than a support.", "There's a history of mistrust and antagonism between Postumus and Tiberius."]
    ;
MERGE (e:Event {uuid: 'event_6_5'})
    ON CREATE SET
        e.title = 'Concessions and Compromise',
        e.description = 'Reluctantly conceding to Livia\'s arguments, AUGUSTUS agrees to send Germanicus instead of Postumus, but his frustration remains evident as he insists on retrieving the lost eagles. This moment underscores the tension between personal ambitions and military responsibility.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["All right, I'll send Germanicus! But I want my damned eagles back!"]
    ;
MERGE (e:Event {uuid: 'event_6_6'})
    ON CREATE SET
        e.title = 'The Subversive Biography',
        e.description = 'LIVIA reveals a biography written by Claudius, which she deems subversive due to its praise of his father\'s attachment to the Republic. She expresses her intent to destroy it, exhibiting her control over narratives that challenge the imperial status quo.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["It's subversive. I told him on no account is he to continue with it."]
    ;
MERGE (e:Event {uuid: 'event_6_7'})
    ON CREATE SET
        e.title = 'Games and Familial Arrangements',
        e.description = 'The conversation shifts to the upcoming Games, with LIVIA insisting on the need to include Claudius in the imperial box despite AUGUSTUS\'s reluctance. This exchange highlights the intertwining of family obligations and public appearances in the political landscape.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["Claudius? That's even more reason why he should be in the box."]
    ;
MERGE (e:Event {uuid: 'event_6_8'})
    ON CREATE SET
        e.title = 'Marriage Prospects for Claudius',
        e.description = 'The discussion turns to Claudius\'s pending marriage, revealing Livia\'s concerns about his betrothed and the dynamics of familial expectations. This moment reinforces the theme of duty and the burdens placed upon Claudius as a member of the Julio-Claudian dynasty.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["He'll be married at the end of the year.", "Are you sure this girl will marry him?"]
    ;
MERGE (e:Event {uuid: 'event_6_9'})
    ON CREATE SET
        e.title = 'The Weight of Legacy',
        e.description = 'As the conversation ends, AUGUSTUS expresses concern for Claudius\'s future, reflecting the oppressive expectations of legacy that weigh heavily on the younger generation, while Livia defends her plans. This encapsulates the broader themes of ambition, family loyalty, and the burdens of power.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["You've left these matters to me for the last 30 years.", "What's the matter with you today? Why are you so bad tempered?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Bloodlust and Imperial Command',
        s.description = 'The grand arena pulsates with the energy of a vast crowd, a sea of faces eagerly anticipating the spectacle of gladiatorial combat. Sunlight streams into the circular amphitheater, illuminating the tiered seating packed with boisterous Romans, their chatter a low rumble punctuated by excited shouts.  The air is thick with anticipation, a heady mix of savory food aromas and the underlying tension of impending violence. Within the Imperial Box, Antonia guides a hesitant Claudius, placing him amongst the cynical observations of King Herod. The atmosphere shifts abruptly as the imposing figures of Livia, flanked by Augustus and Livilla, arrive, casting a shadow of imperial authority over the festive mood. Livia\'s sharp pronouncements cut through the arena\'s noise, her chillingly pragmatic speech revealing the brutal expectations underpinning the games, a stark reminder of the dynasty\'s ruthless power and the casual acceptance of bloodshed as entertainment. The scene underscores the Roman appetite for violence and the rigid social hierarchy, where even amidst spectacle, power and control remain paramount.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_arena'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Awkward Arrival and Cynical Observation',
        e.description = 'Antonia navigates a hesitant and clumsy Claudius through the bustling arena crowd towards their designated seating.  They join King Herod, who surveys the spectacle with detached cynicism, remarking on the crowd\'s eagerness for bloodshed and their gluttonous indulgence in food while anticipating mortal combat. Claudius, visibly nervous and out of place, expresses his inexperience with gladiatorial games and his wish for Germanicus\'s reassuring presence, highlighting his discomfort with the brutal entertainment and his longing for familial support.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["ANTONIA: Claudius, not there! Those are the Imperial seats. Sit behind. Here, with HEROD... Your nose is running.", "HEROD: Just look at them all. They can't wait to see the blood start flowing.", "CLAUDIUS: I've n-n-never seen a swordfight before. I wish Ger-Germanicus was here."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Herod\'s Jaded Commentary on Roman Spectacle',
        e.description = 'Herod elaborates on his cynical fascination with the Roman games, emphasizing the stark contrast between the audience\'s decadent enjoyment and the gladiators\' impending death. He dismisses the spectacle as a display of inhumanity, prompting Claudius to awkwardly attempt to defend the tradition by citing its religious origins and honorable intentions of appeasing the spirits of the dead. Herod mockingly questions the logic of honoring the dead by creating more deaths, further exposing the hypocrisy and brutality inherent in the gladiatorial contests.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["HEROD: Look at them! Stuffing themselves with cakes while down below their fellow men are preparing to die for their enjoyment.", "CLAUDIUS: Oh, Herod! I hope you're not going to s-s-spoil it all.", "HEROD: My dear Claudius, I'm fascinated. I never cease to wonder at these spectacles.", "CLAUDIUS: Its origin is r-r-religious. It's a r-r-religious r-r-rite... r-r-really. It's an honor. We render the spirits of the dead.", "HEROD: By rendering more people dead? How noble!"]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Imperial Entrance and Livia\'s Ruthless Address',
        e.description = 'Livia, accompanied by Augustus and Livilla, makes a grand entrance, immediately commanding attention and silencing the surrounding chatter.  She delivers a chillingly pragmatic speech directly to the gladiators (implied), ostensibly in honor of her deceased son Drusus.  Her words reveal her cold, demanding nature and her expectation of a genuinely brutal and entertaining spectacle, threatening severe punishment for any perceived lack of effort or attempts to fake injury or death. She emphasizes her desire for \'a good show\' and \'money\'s worth\', highlighting the commodification of violence and the gladiators\' lives for imperial entertainment. Claudius nervously attempts to silence Herod\'s potential dissent, showcasing his awareness of Livia\'s power and volatility.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Oh, shut up, Herod. You're a J-Jew. You don't understand these things. Besides, Mother will hear you and you'll make her cross.", "LIVIA: I've a few words to say to you before these games begin. Well, gather round. Now, these games are being held in honor of my son, Drusus Nero, who was worth the whole lot of you put together. It's my intention that these games shall be remembered long after you're all dead and forgotten even by your nearest and dearest. You're all scum and you know it, but you've a chance here - some of you - to prove that you're a bit more than that. And for those whom death doesn't liberate, there'll be plenty of freedoms handed out afterwards - to say nothing of gold plate and coin. But... I want a good show. I want my money's worth! I don't want any kiss-in-the-ring stuff. And I don't want my family watching two grown men pussyfooting around each other for half an hour before one of them aims a real blow. There's been too much of that in the past. And, don't think you can fool me either because I know every trick in the book, including the pig's blood in the bladder to make it look as if one of you is dead. There's been too much of that too lately. These games are being degraded by the increasing use of professional tricks to stay alive, and I won't have it. So put on a good show and there'll be plenty of money for the living and a decent burial for the dead. And, if not, I'll break this guild up and I'll send the lot of you to the mines in Numidia. That's all I've got to say to you."]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Clumsiness and Imperial Indifference',
        e.description = 'Claudius, visibly uncomfortable and overwhelmed by Livia\'s pronouncement and the general atmosphere, clumsily falls off his chair, drawing unwanted attention. Antonia rushes to his aid, while Livia glares at him with open disdain, dismissing his mishap as inappropriate for the serious occasion. Augustus, seemingly detached from the immediate situation, drifts into reminiscence, vaguely recalling a similar incident in his own past, highlighting his growing senility and detachment from the present. Livia curtly dismisses his attempt at connection, refocusing his attention on the gladiators\' salute, reinforcing her dominant personality and Augustus\'s diminishing influence.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: Oh...", "ANTONIA: Claudius!", "LIVIA: Get him up. This is not a comedy theatre.", "AUGUSTUS: That happened to me once. Do you remember, Livia?", "LIVIA: No, I don't.", "AUGUSTUS: It did, you know. Which games was it at?", "LIVIA: I don't remember.", "AUGUSTUS: Or was it at the races?", "LIVIA: The gladiators are saluting you.", "AUGUSTUS: Eh? Oh."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'The Games Begin',
        s.description = 'In the oppressive atmosphere of the arena, the air thick with tension and anticipation, Claudius, a reluctant spectator, watches the unfolding swordfight, anxiety bubbling beneath his surface. The arena is a stark contrast to the opulence of the imperial court, filled with the roar of a bloodthirsty crowd, echoing off the marble walls. The sunlight slices through the dust, illuminating the combatants as they dance a deadly ballet of skill and brutality. Livilla, with her youthful exuberance, claps in excitement, while Livia reminisces about her lost son, creating a poignant juxtaposition of nostalgia against the grim spectacle. Augustus, ever the gambler, engages Herod in a bet that highlights the mockery of life and death in the arena, while the underlying theme of ambition and manipulation weaves through the conversation, as characters navigate both their personal stakes and the broader implications of power in Rome. The scene encapsulates the duality of the Roman experience—excitement mingled with the dread of mortality, the thrill of spectacle undercut by the ever-present specter of betrayal.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_arena'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Claudius Watches with Anxiety',
        e.description = 'Claudius sits in the arena, visibly anxious as he watches the swordfight unfold. His discomfort contrasts sharply with the relaxed demeanor of the fighters, highlighting his internal struggles and feelings of inadequacy. The anticipation of violence triggers his fears, showcasing the emotional toll the spectacle takes on him as he grapples with his own insecurities in a world that celebrates strength.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Ow.", "I'm t-trying."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Livia\'s Nostalgic Reflection',
        e.description = 'Livia\'s gaze lingers on the fight as she reminisces about her deceased son, Drusus. Her comments reveal her underlying grief and the haunting memories of family loss, juxtaposed against the violent entertainment of the arena. Antonia echoes her sentiments, deepening the emotional resonance of the moment while illuminating Livia\'s complex character—one driven by ambition yet burdened by the past.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Drusus would have loved this.", "Yes. I was thinking of him."]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Augustus Initiates a Bet',
        e.description = 'Augustus leans towards Herod with a gleam in his eye, proposing a bet on the outcome of the fight. This moment encapsulates his character as a ruler who enjoys the thrill of chance, revealing his complex view on life and death. Herod\'s initial reluctance to gamble on human life due to religious beliefs adds a layer of tension, yet he ultimately concedes, reflecting the pervasive nature of ambition and risk-taking within the imperial court.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["How about a little bet, Herod, eh? I'll take the fat man for 20 gold pieces.", "Caesar it would be against my religion to bet on the life of a man.", "Oh, really? I would've thought it was against your religion to bet on anything."]
    ;
MERGE (e:Event {uuid: 'event_8_4'})
    ON CREATE SET
        e.title = 'A Moment of Dark Humor',
        e.description = 'The exchange between Augustus and Herod takes a lighter turn as they jest about the nature of gambling and religion. Herod\'s humorous remark about the difficulties of living with a single god provides a moment of levity amidst the grim setting. This banter illustrates the absurdities of their political realities and deepens their relationship, even as they navigate the undercurrents of power and belief.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Believe me, Caesar, the one we have is hard enough to live with!", "I've never understood that. It's quite insufficient. You could have some of ours, you know."]
    ;
MERGE (e:Event {uuid: 'event_8_5'})
    ON CREATE SET
        e.title = 'Livilla\'s Excitement',
        e.description = 'Livilla claps her hands in delight, urging the fighters to finish the duel. Her enthusiastic reaction emphasizes her youthful zeal and the intoxicating thrill of the arena, contrasting with Claudius\'s anxiety. This moment illustrates how the spectacle of violence captivates some while instilling fear in others, highlighting the varied responses to the brutal entertainment of the games.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Finish him! Finish him!"]
    ;
MERGE (e:Event {uuid: 'event_8_6'})
    ON CREATE SET
        e.title = 'Postumus\'s Concern',
        e.description = 'As the atmosphere becomes too intense for Claudius, he passes out, prompting Postumus to step in and express concern. This moment reveals the vulnerability of Claudius amidst the harsh realities of the arena and the growing responsibility taken on by Postumus, foreshadowing potential alliances and character developments that may arise from this chaotic environment.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["Err... It's all right. I'll see him home."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'The Corridor Trap',
        s.description = 'In the shadowy depths of a palace corridor, a clandestine meeting takes a sinister turn. Dimly lit by flickering torches, the marble walls seem to absorb sound, amplifying the hushed tension between Livilla and Postumus. The air is thick with unspoken desires and dangerous secrets. Livilla, with calculated allure, draws Postumus into her web, only to abruptly transform into a victim, her screams shattering the stillness of the night. Augustus, responding to the fabricated cries, bursts onto the scene, his imperial fury instantly ignited against Postumus. Livia arrives, a silent puppeteer observing her plan unfold, her presence a chilling reinforcement of the orchestrated deception. This scene serves as the devastating climax of Livia\'s plot to eliminate Postumus, securing Tiberius\'s path to power by exploiting Augustus\'s blind trust and Postumus\'s volatile nature. The thematic undercurrents of betrayal, manipulation, and the deceptive nature of appearances permeate every interaction, culminating in Postumus\'s tragic and unjust downfall.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Incriminating Desire',
        e.description = 'In the dimly lit corridor, Postumus confronts Livilla, his agitation palpable. He questions her husband\'s absence, revealing his pent-up desire for her, confessing how difficult it was to restrain himself at the Games. Livilla initially responds with feigned tenderness, drawing him closer and whispering sweet words, seemingly reciprocating his advances and luring him deeper into her trap.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["POSTUMUS: Where's your husband?", "LIVILLA: Gone out on one of his usual jaunts.", "POSTUMUS: Oh, Livilla. It was all I could do to stop touching you at the Games today. I nearly went mad.", "LIVILLA: Oh, my poor darling."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Livilla\'s Deceptive Cry',
        e.description = 'In a sudden, jarring shift, Livilla recoils from Postumus\'s embrace. With calculated precision, she slaps him hard across the face and erupts into a series of frantic screams for help, falsely accusing him of violence and attempted rape. Her cries are designed to draw attention and paint Postumus as an aggressor, instantly reversing the perceived dynamic of their encounter and setting her trap.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVILLA: Murder! Murder! Stop it!", "LIVILLA: Help me! Don't! Stop it! Help me! No, please! No! No! No! Help! Help! He tried to rape me!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Augustus Enters, Blinded by Fury',
        e.description = 'Responding to Livilla\'s staged cries of distress, the corridor doors are flung open, and Augustus storms in, his face contorted with rage. Castor follows closely behind, adding to the sense of overwhelming condemnation facing Postumus. Augustus, instantly believing Livilla\'s performance, confronts Postumus with immediate hostility, his imperial authority solidifying the false narrative.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: What are you? Some kind of animal?", "POSTUMUS: Oh! Ow!", "POSTUMUS: Livilla...", "POSTUMUS: You bitch! You filthy bitch!", "AUGUSTUS: Beast, look at her. She's terrified!"]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Postumus\'s Plea and Incrimination of Livia',
        e.description = 'Desperate to defend himself against the overwhelming tide of accusation, Postumus insists on his innocence, declaring the entire situation a lie. He attempts to explain that Livilla invited him, but Augustus dismisses his claims outright. Cornered and realizing the depth of the deception, Postumus shifts his focus, directing suspicion towards Livia, hinting at her manipulative nature and suggesting her potential involvement in the orchestrated trap.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["POSTUMUS: It's a lie. Can't you see? The whole thing's a lie.", "POSTUMUS: She invited me into her room.", "LIVILLA: I didn't! He climbed up on my balcony and attacked me!", "AUGUSTUS: What, you expect me to believe she'd invite you to her room with her husband a few doors away?", "POSTUMUS: She told me he'd be out.", "CASTOR: You filthy pig!", "AUGUSTUS: Stop it! Now, stop it! Wait outside. I suppose you'll tell me that this isn't your dagger?", "POSTUMUS: Yes, it's mine, but she could have got it anytime. She and Castor dine with us often enough.", "AUGUSTUS: What do you take me for? Do you expect me to believe that she tricked you into coming to her room so that she could falsely accuse you of rape? Well, for what reason? Well, tell me!", "POSTUMUS: Ask her. Perhaps she knows."]
    ;
MERGE (e:Event {uuid: 'event_9_5'})
    ON CREATE SET
        e.title = 'Postumus Unleashes the Truth',
        e.description = 'In a final, desperate act of defiance, Postumus unleashes a torrent of accusations against Livia. He points to the suspicious deaths of his family members – Agrippa, Marcellus, Gaius, Lucius, and Julia – arguing that Livia has systematically eliminated anyone who stood in the way of her son Tiberius\'s ascension. He even raises questions about Drusus\'s death, hinting at Livia\'s potential involvement in that tragedy as well. His explosive accusations reveal the dark underbelly of the imperial family and the ruthless ambition driving Livia\'s actions.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: He'll incriminate us all before he's done.", "POSTUMUS: She hates me and you're so blind you can't see it.", "AUGUSTUS: Hates you? What do you mean, hates you?", "POSTUMUS: She hates me as she hated my brothers and my mother. She hates anyone who might come between you and her precious son!", "AUGUSTUS: What is going on here? What is he saying?", "POSTUMUS: Oh, Grandfather, open your eyes! Throw off the blinkers! For years, everyone around you has either died or disappeared. Do you think it was all an accident? My father Agrippa and before him, Marcellus. My brothers Gaius and Lucius, my mother Julia and now me! Well, can't you see? She's clearing a path for herself! And that other son of hers, Drusus, whose revered memory she honors in those games of hers - ask her how he died! There was nothing wrong with him till she sent her personal physician to treat him!"]
    ;
MERGE (e:Event {uuid: 'event_9_6'})
    ON CREATE SET
        e.title = 'Augustus\'s Blind Decree',
        e.description = 'Despite the gravity of Postumus\'s accusations, Augustus refuses to confront the possibility of Livia\'s treachery. Instead, he dismisses Postumus as insane, choosing to believe the carefully constructed lie. In a harsh and irreversible decree, Augustus banishes Postumus to a remote, desolate island, condemning him to a life of isolation and effectively removing him as a threat. He orders the guards to take Postumus away, solidifying his downfall and Livia\'s victory.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["AUGUSTUS: Marcellus? Agrippa? What is he saying? What is he, some kind of raving lunatic? What does he think, that they were all murdered? Are you insane? Or is just that you want me to think you are? Yes! You're very clever. You think that by pretending insanity that I'll be lenient with you. Yes, you think a show of madness will move me and I'll put you away somewhere in the care of a doctor. You're disgusting! You know something, I'd rather clear vomit off the street than talk to you.", "POSTUMUS: It's incredible, isn't it? It's too horrific even to think about it. I have to be mad even to mention it. What a joke! What a pathetic joke! Well, can't you see it's not me that's mad, it's her! Look at her, she's a madwoman! She'll destroy us all before she's finished, you included!", "AUGUSTUS: I could kill you now. Spill your guts onto the floor and give you no more thought than I would a dog killed on the road. But that'd be too good for you. You're going to suffer, like your mother suffers. Living out your life on a rock somewhere in the middle of the sea with nothing but birds for company. And it won't be on any that you'll find on a map because they're all too big for you. But I'll find one, don't you fear, just your size. In ten minutes you'll know every stone and blade of grass. And you'll stay there till you rot. Guard! Take him out, and keep him under arrest!"]
    ;
MERGE (e:Event {uuid: 'event_9_7'})
    ON CREATE SET
        e.title = 'Livilla\'s Reward, Postumus\'s Fate Sealed',
        e.description = 'With Postumus being dragged away, Augustus turns his attention to Livilla, his demeanor shifting from furious to solicitous. He expresses concern for her well-being, completely accepting her fabricated story. To further solidify the false narrative and offer a sense of closure, Augustus proposes a temple sacrifice with Livilla, suggesting it will cleanse her of the supposed ordeal, symbolically rewarding her deception and sealing Postumus\'s tragic fate. The scene concludes with Augustus\'s commanding voice echoing as he ensures Postumus\'s immediate removal.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["AUGUSTUS: Are you all right?", "LIVILLA: I feel unclean.", "AUGUSTUS: Well, my dear, it's not you that's unclean, it's him. Tomorrow, you and I will go the temple and make a sacrifice together. You'll feel better.", "AUGUSTUS: Go on!"]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Desperation in the Shadows',
        s.description = 'Under the cloak of night, the palace grounds are illuminated only by the faint glow of moonlight filtering through leaves. The air is thick with tension as POSTUMUS stumbles through the manicured pathways, his heart racing with fear. His clothing is disheveled, suggesting a hasty escape, and he glances over his shoulder, paranoid about the guards searching the area. The opulent surroundings feel menacing in the dark, with statues watching like silent sentinels. Suddenly, CLAUDIUS emerges from the shadows, his presence a cautious beacon amidst Postumus\'s turmoil. The emotional atmosphere is fraught with desperation and urgency, underscored by the looming threat of capture. This scene serves as a pivotal moment of alliance, as Postumus seeks refuge and guidance from Claudius, both aware of the treachery that surrounds them. Themes of survival and the fragility of alliances resonate, as they navigate the deadly currents of ambition and family loyalty.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_grounds'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Postumus Escapes Capture',
        e.description = 'POSTUMUS, desperate and fearful, makes a hurried escape from his guards. He stumbles through the palace grounds, whispering to himself about the imminent danger as he tries to catch his breath. His sense of urgency is palpable as he fears being discovered. The tension heightens as he hurries through the shadows, illustrating the perilous state of his existence.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Sh! They're searching for me in the grounds. They'll find me soon. I haven't much time."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Claudius Appears',
        e.description = 'CLAUDIUS quietly steps from the shadows, his watchful demeanor contrasting with Postumus\'s frantic energy. The appearance of Claudius serves as both a moment of potential safety and a reminder of the precariousness of their shared fate. His composed presence suggests he is aware of the lurking dangers, creating a stark juxtaposition between the two characters\' emotional states. This encounter marks a crucial juncture in their relationship, as they stand united against the threats that loom over them.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Postumus.", "Just listen."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'News of the Escape',
        s.description = 'Within the austere, echoing confines of a palace corridor, Emperor Augustus paces with barely contained fury. The white marble walls, usually symbols of imperial grandeur, now feel like cold witnesses to his mounting frustration. Dim light filters through the high windows, casting long shadows that amplify the tense atmosphere. The air is thick with unspoken anxiety as Castor, visibly nervous, stands before the Emperor, bearing unwelcome news. This scene serves as a pivotal moment, highlighting Augustus\'s waning control and the escalating chaos within his own household. Postumus\'s escape is not just a security breach; it\'s a symbolic crack in the façade of imperial authority, foreshadowing further unraveling and underscoring the theme of fragile power within the Roman dynasty. The emotional undercurrent is one of simmering rage mixed with a deep-seated fear of losing control, as the Emperor grapples with the implications of this blatant act of defiance.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Postumus\'s Flight Revealed',
        e.description = 'Augustus, his patience worn thin, demands an update on Postumus\'s whereabouts. Castor, in a state of nervous agitation, delivers the unwelcome news that Postumus has evaded his guards and escaped. The revelation hangs heavy in the air, underscoring the Emperor\'s vulnerability and the breakdown of order within the palace. This event immediately escalates the tension, confirming a significant shift in the narrative as Postumus\'s escape becomes a catalyst for further imperial anxieties.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: Well?", "CASTOR: He slipped the guards. They're searching the palace for him."]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Imperial Wrath and Marital Scolding',
        e.description = 'Upon hearing of Postumus\'s successful escape, Augustus erupts in frustrated anger.  He dismisses the severity of the situation with a thinly veiled threat about Roman reach, then abruptly pivots to a personal and somewhat misplaced scolding of Castor.  He petulantly advises Castor to focus on his marital duties, implying that Castor\'s supposed neglect of his wife is somehow connected to the current crisis and Postumus\'s escape. This outburst reveals Augustus\'s deep-seated anxieties and his tendency to deflect blame and exert control, even in moments of crisis. The Emperor\'s words highlight the intertwining of public and private life within the imperial court, where even marital advice becomes a tool for asserting authority.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: He won't get far. If he runs to the ends of the earth, he'll find a Roman or a friend of Rome ready to give him up.", "AUGUSTUS: Oh, take your wife to bed!", "AUGUSTUS: And, Castor, be nice to her. Get in beside her. That's your place.", "AUGUSTUS: If you'd been there more often instead of carousing around town, none of this might have happened!", "AUGUSTUS: Oh..."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Desperate Whispers in the Shadows',
        s.description = 'In the dimly lit gardens of the palace, the air is thick with tension and the scent of night-blooming flowers. Flickering torches cast dancing shadows across the manicured hedges, creating a sense of foreboding. Postumus emerges, wide-eyed and panicked, glancing furtively over his shoulder as if the very walls are listening. His breath is quick, heart racing, the night surrounding him a cloak of danger. In this secretive enclave, where whispers can be as deadly as swords, he is acutely aware of the imminent threat. Suddenly, Claudius appears from the shadows, his presence both unsettling and oddly reassuring. The emotional atmosphere is charged with urgency and fear—two men caught in a deadly game of power where trust is a luxury they cannot afford. This scene serves a vital narrative function, illustrating the precarious position of Postumus as he seeks an ally in a landscape rife with betrayal and ambition. Themes of survival, desperation, and the quest for acceptance loom large as the specter of danger lurks just beyond the garden\'s borders.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Postumus Emerges in Panic',
        e.description = 'Postumus bursts onto the scene, his face a mask of fear and urgency. He has narrowly escaped detection and is desperate for a safe space to regroup. His breaths come in quick, shallow gasps as he scans the gardens for signs of pursuers, embodying the tension of a man on the run. The urgency of his situation underscores his need for immediate action and guidance, crucial for the unfolding narrative where alliances are fragile and threats loom large.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Sh! They're searching for me in the grounds. They'll find me soon. I haven't much time."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Claudius Offers Silent Support',
        e.description = 'Claudius steps silently from the shadows, his presence both unexpected and grounding. He meets Postumus\'s frightened gaze with an understanding nod, conveying a depth of awareness that transcends words. This moment is pivotal; Claudius, often overlooked, becomes a crucial ally in Postumus’s time of need. The silent bond between them speaks volumes about their mutual struggle for survival and acceptance in a world that constantly undermines them. This connection hints at the deeper layers of loyalty and camaraderie that will be tested as political machinations unfold.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Postumus.", "Just listen."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'The Runaway and the Emperor\'s Ire',
        s.description = 'Within the austere, echoing corridors of the Imperial Palace, Emperor Augustus paces like a caged lion, his anxiety a palpable force. The cold marble underfoot reflects the growing chill in his demeanor as he awaits news. Castor, a figure of nervous deference, stands uncomfortably by, shifting his weight and avoiding the Emperor\'s gaze. The air crackles with unspoken tension, the silence punctuated only by Augustus\'s restless movements and the hushed urgency of their exchange. This scene reveals the immediate aftermath of a security breach – someone of significance has escaped the palace grounds, throwing the Emperor into a fit of agitation and suspicion. It underscores Augustus\'s controlling nature and his quickness to assign blame, even as a deeper unease simmers beneath the surface of his imperial authority. The corridor, usually a place of transit, becomes a stage for a private eruption of imperial frustration, hinting at deeper familial and political fault lines within the palace.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Demanding Answers',
        e.description = 'Emperor Augustus, his face etched with impatience, halts his pacing abruptly and turns to Castor, demanding immediate information. His single word, delivered with sharp imperiousness, cuts through the tense silence, revealing his desperate need for control and updates amidst the unfolding crisis. The question hangs in the air, heavy with expectation and the implicit threat of imperial displeasure should the news be unfavorable.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: Well?"]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Escape Confirmed, Palace Searched',
        e.description = 'Castor, visibly uneasy under the Emperor\'s intense scrutiny, delivers the unwelcome news: the unnamed individual has indeed evaded the palace guards. He reports that a palace-wide search is underway, a frantic attempt to rectify the security lapse and recapture the fugitive. Castor\'s words confirm Augustus\'s worst fears and escalate the tension, painting a picture of chaos brewing within the seemingly impenetrable walls of the imperial residence. The news underscores the gravity of the situation - this is not a minor infraction, but a significant breach that threatens the Emperor\'s authority and peace of mind.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CASTOR: He slipped the guards. They're searching the palace for him."]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'Imperial Confidence and Domestic Reprimand',
        e.description = 'Despite the alarming news, Augustus asserts his unwavering belief in Roman reach and loyalty, declaring with imperial certainty that the escapee will inevitably be caught, no matter where they flee. He then abruptly pivots, redirecting his simmering frustration towards Castor. In a jarring shift from matters of state to personal affairs, Augustus chastises Castor about his marital duties, implying a connection between Castor\'s supposed neglect of his wife and the current palace security failure. This unexpected reprimand reveals Augustus\'s volatile temper and his tendency to conflate personal and political domains, ending the scene on a bizarre and unsettling note.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: He won't get far. If he runs to the ends of the earth, he'll find a Roman or a friend of Rome ready to give him up. Oh, take your wife to bed! And, Castor, be nice to her. Get in beside her. That's your place. If you'd been there more often instead of carousing around town, none of this might have happened! Oh..."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'Whispers in the Garden',
        s.description = 'Under the moonlit canopy of the palace gardens, the atmosphere is charged with tension and secrecy. The air is thick and still, punctuated only by the soft rustle of leaves, as Claudius and Postumus stand facing each other, their silhouettes framed by the fragrant flora. The soft glow of lanterns casts a warm light, contrasting with the dark undercurrents of betrayal that swirl around them. The scene carries an emotional weight, reflecting anxiety and urgency as the two young men grapple with the dangerous political landscape. While Claudius, known for his stammering and perceived foolishness, seeks to protect his friend, Postumus embodies the volatile spirit of a man aware of the peril he faces. This moment encapsulates the broader narrative, illustrating the fragile bonds of friendship forged under the threat of imperial treachery, and hints at the impending chaos that will engulf their lives. The themes of loyalty, survival, and manipulation resonate deeply, underscoring the characters\' urgent need to navigate the deadly currents of ambition that define their world.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Postumus Reveals the Truth',
        e.description = 'In a moment fraught with tension, Postumus confides in Claudius about his suspicions regarding Livilla\'s manipulation, attributing her schemes to Livia\'s machinations. This revelation highlights the dangerous political landscape they inhabit, and Postumus feels the weight of the threat against him. The urgency of his warning underscores the stakes involved, especially as he expresses his intentions to inform Germanicus upon his return, indicating the importance of alliance and communication amidst peril.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I'm certain of it. I'll go now. If LIVIA knows I've been here, your life won't be worth much. But I wanted you to know.", "I wanted you, above all, to know the truth, and I want GERMANICUS to know when he returns."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Claudius Urges Caution',
        e.description = 'As the tension escalates, Claudius urges Postumus to prioritize his safety, imploring him not to provoke those who may wish to see him harmed. His concern for Postumus reveals a deeper bond between them as friends, and it also reflects Claudius\'s gradual awakening to the perilous nature of their environment. The urgency in his voice underscores the stakes of their current situation, hinting at the looming threat of violence and betrayal that permeates their world.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I'll tell him. But, listen, stay alive. Don't give them any excuse to k-k-kill you."]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Postumus\'s Regret',
        e.description = 'Postumus expresses his regret for not being able to attend Claudius\'s wedding, which adds an emotional layer to their exchange. This moment highlights the personal sacrifices they endure due to the treacherous nature of their lives and the political machinations around them. Claudius\'s light-hearted response about the small affair illustrates his coping mechanism in the face of adversity, while Postumus\'s comment reinforces the bond of friendship that exists even amidst impending danger.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["I'm sorry I won't be at your wedding.", "Oh, don't worry. It'll be a very small affair. I embarrass them all far too much."]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'A Final Warning',
        e.description = 'Postumus, sensing the urgency of their circumstances, encourages Claudius to continue playing the fool as a means of survival. This advice reflects the harsh reality of their world where cunning and deception are vital for safety. The reference to Asinius Pollio serves as an important connection, revealing that others share their understanding of the court\'s treachery. Their farewell is tinged with a sense of impending doom, leaving both characters aware of the precariousness of their fates.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Good. Go on embarrassing them. Go on playing the idiot. It's safer that way.", "You know, somebody else said that to me a while ago. ASINIUS P-POLLIO."]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'The Shouts of Danger',
        e.description = 'As the scene draws to a close, the sound of shouting in the distance serves as a stark reminder of the ever-present danger that surrounds them. This auditory cue foreshadows the chaos that is likely to follow and emphasizes the volatility of their environment. Postumus’s reaction to the noise underscores his awareness of the threat, heightening the tension and leaving both characters on edge as they prepare to part ways.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["SOUND of shouting in the distance."]
    ;
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_roman_army'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_gold_statue'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_fig'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_fountain'}),
          (a:Agent {uuid: 'location_imperial_palace'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bench'}),
          (a:Agent {uuid: 'location_augustus_gardens'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_inheritance'}),
          (a:Agent {uuid: 'agent_postumus_father'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_roman_eagles'}),
          (a:Agent {uuid: 'org_roman_army'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_biography_claudius_father'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scroll_biography'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_map_table'}),
          (a:Agent {uuid: 'location_imperial_council_chamber'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bridges_rhine'}),
          (a:Agent {uuid: 'org_roman_army'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_seat_games_box'}),
          (a:Agent {uuid: 'location_imperial_box_games'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_betrothal_agreement'}),
          (a:Agent {uuid: 'agent_livia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_gold_pieces_bet'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_roman_army'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gold_statue_event_1_2'})
    ON CREATE SET
        oi.description = 'The gold statue is presented by Augustus as a reward for Horace\'s poetic recitation. Augustus announces his intention to gift it, and implicitly directs Praxis to retrieve it, though the actual presentation occurs off-screen. The statue functions as a tangible symbol of imperial favor and wealth, demonstrating Augustus\'s generosity and Horace\'s value in his eyes. It underscores the patron-client relationship, where artistic service is directly recompensed with valuable gifts, reinforcing the transactional dynamics within the imperial court. The statue\'s Etruscan origin, mentioned by Augustus, adds a layer of historical and cultural significance to the gift, elevating it beyond mere monetary value.',
        oi.status_before = 'The gold statue is in the possession of Emperor Augustus, likely kept within the imperial palace\'s treasury or personal collection. Its status is that of a valuable and admired object owned by the Emperor, possibly of Etruscan origin, and indicative of his wealth and refined taste.',
        oi.status_after = 'Following the event, the gold statue is intended to become the possession of Horace, gifted by Augustus as a reward for his poetry. Its status shifts from imperial property to a personal possession of the poet, now imbued with the significance of imperial favor and public recognition of Horace\'s artistic merit. The statue serves as a constant reminder of Horace\'s success and his connection to the Emperor.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gold_statue'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Horace stands at the center of the imperial salon, his presence commanding attention as he recites his verses with eloquence. His movements are fluid, emphasizing the rhythm of his words, and he gestures subtly to engage his audience, embodying the role of the poet weaving a tapestry of language that resonates throughout the room.',
        ap.emotional_state = 'Horace exhibits a confident demeanor, his tone steady and captivating. Beneath this exterior, there lies a complex tapestry of emotions; he is aware of the weight his words carry in the court, feeling both the honor of his position and the undercurrents of political maneuvering that could easily swallow him whole. He is a performer at once proud and acutely conscious of the precariousness of his role.',
        ap.emotional_tags = ["horace exhibits a confident demeanor, his tone steady", "captivating. beneath this exterior, there lies a complex tapestry of emotions; he is aware of the weight his words carry in the court, feeling both the honor of his position", "the undercurrents of political maneuvering that could easily swallow him whole. he is a performer at once proud", "acutely conscious of the precariousness of his role.", "horace exhibits a confident demeanor", "his tone steady and captivating. beneath this exterior", "there lies a complex tapestry of emotions; he is aware of the weight his words carry in the court", "feeling both the honor of his position and the undercurrents of political maneuvering that could easily swallow him whole. he is a performer at once proud and acutely conscious of the precariousness of his role.", "horace exhibits a confident demeanor, his tone steady and captivating. beneath this exterior, there lies a complex tapestry of emotions", "he is aware of the weight his words carry in the court, feeling both the honor of his position and the undercurrents of political maneuvering that could easily swallow him whole. he is a performer at once proud and acutely conscious of the precariousness of his role."],
        ap.active_plans = ["To captivate the imperial family with his poetry, ensuring his works maintain favor in the court.", "To subtly reflect the transient nature of power and glory in his verses, perhaps nudging the audience toward self-reflection.", "To solidify his role as a vital voice in the political landscape of Rome, ensuring his continued patronage by Augustus."],
        ap.beliefs = ["Art and poetry have the power to reflect and influence political realities.", "The transient nature of life is a recurring theme that must be acknowledged and celebrated through verse.", "Loyalty to Augustus is paramount, as his position hinges on pleasing the emperor and the imperial family."],
        ap.goals = ["Short-term: To impress Augustus and the court with his poetry during this particular event.", "Medium-term: To secure ongoing patronage from Augustus by consistently delivering impactful poetry.", "Ultimate: To be recognized as one of Rome's great poets, achieving a legacy that transcends his lifetime."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the head of the room, his posture reflecting both authority and weariness. He leans forward with interest during Horace\'s recitation, clapping enthusiastically at the end, which emphasizes his desire for approval and connection with the artistic expressions of his court.',
        ap.emotional_state = 'Augustus displays a facade of joviality and pride, reveling in the admiration of his family and the praise directed at Horace. Internally, however, he grapples with anxiety over the stability of his reign and the loyalty of those around him, projecting an image of confidence while feeling the weight of potential betrayal lurking within his family.',
        ap.emotional_tags = ["augustus displays a facade of joviality", "pride, reveling in the admiration of his family", "the praise directed at horace. internally, however, he grapples with anxiety over the stability of his reign", "the loyalty of those around him, projecting an image of confidence while feeling the weight of potential betrayal lurking within his family.", "augustus displays a facade of joviality and pride", "reveling in the admiration of his family and the praise directed at horace. internally", "however", "he grapples with anxiety over the stability of his reign and the loyalty of those around him", "projecting an image of confidence while feeling the weight of potential betrayal lurking within his family.", "augustus displays a facade of joviality and pride, reveling in the admiration of his family and the praise directed at horace. internally, however, he grapples with anxiety over the stability of his reign and the loyalty of those around him, projecting an image of confidence", "feeling the weight of potential betrayal lurking within his family."],
        ap.active_plans = ["To showcase the strength of his rule by publicly supporting Horace's poetry, reinforcing the cultural significance of his reign.", "To maintain familial cohesion and connection during the gathering despite underlying tensions.", "To address concerns regarding succession and the behavior of his children, particularly Tiberius and Postumus."],
        ap.beliefs = ["Art and culture are fundamental to the legitimacy of his reign.", "Family loyalty is crucial, yet it must be constantly monitored and managed.", "Praising Horace's work elevates his own status and that of his dynasty."],
        ap.goals = ["Short-term: To enjoy a successful evening filled with celebrations around his reign and Horace's poetry.", "Medium-term: To solidify his legacy through cultural patronage and maintaining family unity.", "Ultimate: To ensure a stable succession that will preserve the empire's glory beyond his lifetime."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Livia positions herself near Augustus, her posture poised yet subtly commanding. She observes the proceedings with shrewd eyes, her facial expressions revealing a mixture of amusement and disdain, particularly when she addresses Claudius with sharp comments that underline her icy authority over family dynamics.',
        ap.emotional_state = 'Livia outwardly appears composed, yet beneath the surface lies a tempest of ambition and manipulation. Her remarks are laced with condescension, particularly towards Claudius, reflecting her contempt for perceived weakness. Internally, she is calculating her next moves, determined to maintain control over her family\'s fortunes and secure Tiberius\'s position.',
        ap.emotional_tags = ["livia outwardly appears composed, yet beneath the surface lies a tempest of ambition", "manipulation. her remarks are laced with condescension, particularly towards claudius, reflecting her contempt for perceived weakness. internally, she is calculating her next moves, determined to maintain control over her family's fortunes", "secure tiberius's position.", "livia outwardly appears composed", "yet beneath the surface lies a tempest of ambition and manipulation. her remarks are laced with condescension", "particularly towards claudius", "reflecting her contempt for perceived weakness. internally", "she is calculating her next moves", "determined to maintain control over her family's fortunes and secure tiberius's position."],
        ap.active_plans = ["To undermine Claudius publicly, reinforcing her power and influence over family affairs.", "To steer Augustus\u2019s attention away from potential threats posed by Postumus and Claudius.", "To ensure Tiberius's ascendancy by strategically positioning her other children within the family hierarchy."],
        ap.beliefs = ["Power is best wielded through subtle manipulation and the art of appearance.", "Weakness within the family must be quashed to secure her ambitions.", "Family ties are tools to be leveraged, not bonds to be cherished."],
        ap.goals = ["Short-term: To assert her dominance in the family dynamic during the event.", "Medium-term: To secure Tiberius\u2019s position and diminish the influence of rivals.", "Ultimate: To shape the future of the Julio-Claudian dynasty according to her vision."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Antonia sits close to Augustus, her demeanor reflective and attentive. She engages with the family in a manner that is both warm and concerned, her eyes often flicking towards Claudius with a mix of empathy and protectiveness, indicative of her nurturing nature amidst the court\'s treachery.',
        ap.emotional_state = 'Antonia appears calm and supportive, exuding a maternal quality as she regards her family. Internally, she feels the weight of familial expectations and the tensions that define their relationships, particularly towards Claudius, with whom she seems to empathize deeply, grappling with her desire to protect him from Livia\'s sharp tongue.',
        ap.emotional_tags = ["antonia appears calm", "supportive, exuding a maternal quality as she regards her family. internally, she feels the weight of familial expectations", "the tensions that define their relationships, particularly towards claudius, with whom she seems to empathize deeply, grappling with her desire to protect him from livia's sharp tongue.", "antonia appears calm and supportive", "exuding a maternal quality as she regards her family. internally", "she feels the weight of familial expectations and the tensions that define their relationships", "particularly towards claudius", "with whom she seems to empathize deeply", "grappling with her desire to protect him from livia's sharp tongue."],
        ap.active_plans = ["To maintain an atmosphere of familial warmth in the midst of tension.", "To subtly advocate for Claudius, hoping to soften Livia's harshness towards him.", "To ensure that Augustus remains at ease, reinforcing familial bonds despite underlying discord."],
        ap.beliefs = ["Family cohesion is vital, even amidst the tumult of ambition and betrayal.", "Compassion and support can counterbalance the harshness of court politics.", "Each family member deserves respect, regardless of their perceived flaws."],
        ap.goals = ["Short-term: To foster a supportive environment during the evening's festivities.", "Medium-term: To strengthen her relationship with Claudius, encouraging his sense of belonging.", "Ultimate: To maintain the integrity of her family amidst the treacherous political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Germanicus sits with an air of confidence, appearing engaged with Horace\'s recitation. His posture is relaxed yet attentive, indicating both his comfort in the space and his status as a favored member of the family. He occasionally glances at Claudius, showing a hint of camaraderie amidst the familial tensions.',
        ap.emotional_state = 'Germanicus expresses pride and confidence as he listens to Horace\'s verses, but beneath this exterior, he wrestles with the weight of expectations placed upon him as a soldier and member of the imperial family. He feels a burgeoning sense of responsibility, empathetically aware of Claudius\'s struggles, yet slightly burdened by the competition within the family.',
        ap.emotional_tags = ["germanicus expresses pride", "confidence as he listens to horace's verses, but beneath this exterior, he wrestles with the weight of expectations placed upon him as a soldier", "member of the imperial family. he feels a burgeoning sense of responsibility, empathetically aware of claudius's struggles, yet slightly burdened by the competition within the family.", "germanicus expresses pride and confidence as he listens to horace's verses", "but beneath this exterior", "he wrestles with the weight of expectations placed upon him as a soldier and member of the imperial family. he feels a burgeoning sense of responsibility", "empathetically aware of claudius's struggles", "yet slightly burdened by the competition within the family.", "germanicus expresses pride and confidence as he listens to horace's verses,", "beneath this exterior, he wrestles with the weight of expectations placed upon him as a soldier and member of the imperial family. he feels a burgeoning sense of responsibility, empathetically aware of claudius's struggles, yet slightly burdened by the competition within the family."],
        ap.active_plans = ["To enjoy the evening while reinforcing his status as a preferred member of the family.", "To connect with Claudius, offering him a friendly presence amidst the tensions.", "To maintain a careful balance between familial loyalty and the demand for his military prowess."],
        ap.beliefs = ["Honor and valor are the highest ideals in both battle and family loyalty.", "Family bonds are important, yet they are often tested by ambition and rivalry.", "He has a duty to protect those he cares about, including Claudius."],
        ap.goals = ["Short-term: To have an enjoyable evening filled with camaraderie and support.", "Medium-term: To solidify his reputation as a strong leader while remaining true to family.", "Ultimate: To secure his legacy as a beloved general and protector of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius maintains a rigid posture, sitting slightly apart from the others, his expression a mix of displeasure and determination. His demeanor reflects a brooding intensity as he listens to Horace\'s poetry, perhaps feeling overshadowed by Germanicus\'s charm and success.',
        ap.emotional_state = 'Tiberius appears sullen and resentful, his bitterness towards both Augustus\'s favoritism and Germanicus\'s popularity evident in his body language. Internally, he wrestles with feelings of inadequacy and jealousy, fighting a deep-seated desire for approval amidst the brilliance of his family\'s legacy.',
        ap.emotional_tags = ["tiberius appears sullen", "resentful, his bitterness towards both augustus's favoritism", "germanicus's popularity evident in his body language. internally, he wrestles with feelings of inadequacy", "jealousy, fighting a deep-seated desire for approval amidst the brilliance of his family's legacy.", "tiberius appears sullen and resentful", "his bitterness towards both augustus's favoritism and germanicus's popularity evident in his body language. internally", "he wrestles with feelings of inadequacy and jealousy", "fighting a deep-seated desire for approval amidst the brilliance of his family's legacy."],
        ap.active_plans = ["To mask his discontent while still appearing engaged in the festivities.", "To strategize ways to secure his position as the legitimate heir without overtly challenging Augustus.", "To navigate the complex dynamics of his family, especially in relation to Germanicus."],
        ap.beliefs = ["As the heir, he deserves recognition and respect over his cousin Germanicus.", "The political landscape is treacherous, and he must tread carefully to gain his due place.", "Familial loyalty can be a double-edged sword, used against the weak."],
        ap.goals = ["Short-term: To survive the evening without revealing his inner turmoil.", "Medium-term: To gradually assert his standing within the family without provoking his grandfather.", "Ultimate: To claim the imperial throne and establish his legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Livilla sits elegantly, her posture relaxed yet subtly observant. She engages with Postumus, her demeanor flirtatious as she aims to manipulate the situation to her advantage, taking a keen interest in the dynamics of the room while maintaining an air of innocence.',
        ap.emotional_state = 'Livilla exudes confidence and charm, masking her ulterior motives with a façade of sweet innocence. Beneath the surface, she is calculating, eager to exert her influence over Postumus and the family dynamics while navigating the precarious waters of court politics.',
        ap.emotional_tags = ["livilla exudes confidence", "charm, masking her ulterior motives with a fa\u00e7ade of sweet innocence. beneath the surface, she is calculating, eager to exert her influence over postumus", "the family dynamics while navigating the precarious waters of court politics.", "livilla exudes confidence and charm", "masking her ulterior motives with a fa\u00e7ade of sweet innocence. beneath the surface", "she is calculating", "eager to exert her influence over postumus and the family dynamics while navigating the precarious waters of court politics.", "livilla exudes confidence and charm, masking her ulterior motives with a fa\u00e7ade of sweet innocence. beneath the surface, she is calculating, eager to exert her influence over postumus and the family dynamics", "navigating the precarious waters of court politics."],
        ap.active_plans = ["To charm Postumus and draw him into her web of influence.", "To subtly undermine Claudius and position herself as a more favorable alternative in family matters.", "To ensure her ambitions align with Livia's as she seeks to secure a favorable future."],
        ap.beliefs = ["Manipulation is a necessary tool in the pursuit of power.", "Appearing innocent and charming can mask more dangerous ambitions.", "Female agency in the court is best asserted through cunning rather than open confrontation."],
        ap.goals = ["Short-term: To captivate Postumus and solidify her influence over him.", "Medium-term: To align closely with Livia's ambitions while positioning herself for greater power.", "Ultimate: To establish her legacy as a significant player within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Postumus sits with a slightly restless posture, his attention divided between Horace\'s recitation and the interactions of those around him. He appears eager yet anxious, attempting to navigate the familial dynamics while seeking approval and camaraderie.',
        ap.emotional_state = 'Postumus projects a sense of youthful energy, mingled with an underlying frustration over his marginalization within the family. He yearns for acceptance and recognition, feeling the weight of expectations that shape his actions and interactions, particularly with Livilla.',
        ap.emotional_tags = ["postumus projects a sense of youthful energy, mingled with an underlying frustration over his marginalization within the family. he yearns for acceptance", "recognition, feeling the weight of expectations that shape his actions", "interactions, particularly with livilla.", "postumus projects a sense of youthful energy", "mingled with an underlying frustration over his marginalization within the family. he yearns for acceptance and recognition", "feeling the weight of expectations that shape his actions and interactions", "particularly with livilla."],
        ap.active_plans = ["To connect with family, especially during the evening\u2019s festivities, despite feeling out of place.", "To showcase his capabilities to Augustus and earn his approval.", "To navigate the flirtation with Livilla while guarding himself against being manipulated."],
        ap.beliefs = ["Approval from his family is essential for his sense of identity and worth.", "The dynamics of power within the family are fluid and often treacherous.", "Friendships can be both a source of strength and a potential vulnerability."],
        ap.goals = ["Short-term: To enjoy the evening and connect with family members without conflict.", "Medium-term: To assert himself as a worthy heir in the eyes of Augustus.", "Ultimate: To forge a secure place within the family and avoid the dangers of familial rivalry."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands awkwardly to the side, his posture betraying a blend of nervousness and longing for acceptance. He shifts his weight from one foot to the other, often stuttering as he attempts to engage in conversation, reflecting his struggle to find his place among his more confident family members.',
        ap.emotional_state = 'Claudius exhibits a mix of anxiety and quiet determination, feeling the sting of mockery aimed at him. His internal conflict is palpable; he yearns for connection but is hyper-aware of his perceived shortcomings, leading to both insecurity and a hidden desire to prove his worth.',
        ap.emotional_tags = ["claudius exhibits a mix of anxiety", "quiet determination, feeling the sting of mockery aimed at him. his internal conflict is palpable; he yearns for connection but is hyper-aware of his perceived shortcomings, leading to both insecurity", "a hidden desire to prove his worth.", "claudius exhibits a mix of anxiety and quiet determination", "feeling the sting of mockery aimed at him. his internal conflict is palpable; he yearns for connection but is hyper-aware of his perceived shortcomings", "leading to both insecurity and a hidden desire to prove his worth.", "claudius exhibits a mix of anxiety and quiet determination, feeling the sting of mockery aimed at him. his internal conflict is palpable", "he yearns for connection but is hyper-aware of his perceived shortcomings, leading to both insecurity and a hidden desire to prove his worth.", "claudius exhibits a mix of anxiety and quiet determination, feeling the sting of mockery aimed at him. his internal conflict is palpable; he yearns for connection", "is hyper-aware of his perceived shortcomings, leading to both insecurity and a hidden desire to prove his worth."],
        ap.active_plans = ["To navigate the familial dynamics while seeking acceptance and validation.", "To observe and learn from the interactions around him, keenly aware of the political undercurrents.", "To muster the courage to engage, despite his fears of ridicule."],
        ap.beliefs = ["He is capable of more than his family perceives, and he longs to prove this.", "Family loyalty is crucial, yet it often feels like a heavy burden.", "His stutter and physicality do not define his intellect or potential."],
        ap.goals = ["Short-term: To survive the evening without attracting negative attention.", "Medium-term: To find a moment of connection with a family member that validates his existence.", "Ultimate: To assert his intelligence and prove that he can play a role in the family\u2019s legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Emperor Augustus, seated amongst his family in the imperial salon, initially listens to Horace\'s recitation with apparent enjoyment. Once the poem concludes, he rises to applaud enthusiastically, directing his praise towards Horace. He gestures expansively while speaking, calling for Praxis to bring forth a gift, a gold statue, intended for the poet. Throughout, Augustus dominates the interaction, positioning himself as the ultimate arbiter of taste and generosity.',
        ap.emotional_state = 'Augustus projects an air of magnanimous approval and paternal benevolence, lavishing praise upon Horace with apparent sincerity. However, beneath this performance lies a calculated intent to reinforce his authority and promote a specific type of art. His dismissive remarks about Ovid hint at an underlying insecurity and a need to assert his moral and artistic judgment. There\'s a subtle undercurrent of performative generosity, as his praise and gift are public displays designed to impress his court and maintain control.',
        ap.emotional_tags = ["augustus projects an air of magnanimous approval", "paternal benevolence, lavishing praise upon horace with apparent sincerity. however, beneath this performance lies a calculated intent to reinforce his authority", "promote a specific type of art. his dismissive remarks about ovid hint at an underlying insecurity", "a need to assert his moral", "artistic judgment. there's a subtle undercurrent of performative generosity, as his praise", "gift are public displays designed to impress his court", "maintain control.", "augustus projects an air of magnanimous approval and paternal benevolence", "lavishing praise upon horace with apparent sincerity. however", "beneath this performance lies a calculated intent to reinforce his authority and promote a specific type of art. his dismissive remarks about ovid hint at an underlying insecurity and a need to assert his moral and artistic judgment. there's a subtle undercurrent of performative generosity", "as his praise and gift are public displays designed to impress his court and maintain control."],
        ap.active_plans = ["To publicly validate Horace's poetry, thereby endorsing art that aligns with his imperial values and projecting an image of cultured patronage.", "To assert his artistic judgment by contrasting Horace favorably with Ovid, implicitly discouraging subversive or 'indecent' artistic expressions.", "To utilize a valuable gift, the gold statue, as a tangible reward for Horace's service and a means of securing the poet's continued loyalty and favorable portrayal of his reign."],
        ap.beliefs = ["Imperial authority extends to artistic and moral domains, and the Emperor has a duty to guide public taste.", "Art should serve a didactic purpose, promoting virtue and reinforcing the established social order.", "Public displays of wealth and generosity are effective tools for maintaining power and securing loyalty within the court."],
        ap.goals = ["short-term\": \"To deliver a convincing performance of imperial appreciation, effectively rewarding Horace and impressing his court.", "medium-term\": \"To cultivate a cultural landscape that favors art which glorifies his reign and reinforces his moral agenda, thereby shaping public perception.", "ultimate\": \"To secure a positive and enduring legacy as a wise and benevolent ruler, remembered not only for military and political achievements but also for his patronage of the arts and promotion of 'wholesome' values."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Horace stands in the imperial salon, having just completed his poetic recitation. He is the focal point of Augustus\'s attention, listening respectfully as the Emperor delivers effusive praise. He maintains a posture of humility and gratitude, accepting Augustus\'s compliments and the promise of a gift with polite demurral, yet ultimately acquiescing to the Emperor\'s generosity. He waits for Praxis to bring the statue, remaining composed and dignified in the imperial presence.',
        ap.emotional_state = 'Horace likely experiences a mix of professional satisfaction and courtly apprehension. He is outwardly gracious and appreciative of Augustus\'s praise, projecting an image of humble gratitude. Internally, he may feel a surge of pride in his work being recognized by the Emperor, but also a degree of awareness of the transactional nature of imperial patronage. There might be a subtle undercurrent of professional ambition, balanced with the need to navigate the complexities of courtly etiquette and maintain favor with the powerful Augustus.',
        ap.emotional_tags = ["horace likely experiences a mix of professional satisfaction", "courtly apprehension. he is outwardly gracious", "appreciative of augustus's praise, projecting an image of humble gratitude. internally, he may feel a surge of pride in his work being recognized by the emperor, but also a degree of awareness of the transactional nature of imperial patronage. there might be a subtle undercurrent of professional ambition, balanced with the need to navigate the complexities of courtly etiquette", "maintain favor with the powerful augustus.", "horace likely experiences a mix of professional satisfaction and courtly apprehension. he is outwardly gracious and appreciative of augustus's praise", "projecting an image of humble gratitude. internally", "he may feel a surge of pride in his work being recognized by the emperor", "but also a degree of awareness of the transactional nature of imperial patronage. there might be a subtle undercurrent of professional ambition", "balanced with the need to navigate the complexities of courtly etiquette and maintain favor with the powerful augustus.", "horace likely experiences a mix of professional satisfaction and courtly apprehension. he is outwardly gracious and appreciative of augustus's praise, projecting an image of humble gratitude. internally, he may feel a surge of pride in his work being recognized by the emperor,", "also a degree of awareness of the transactional nature of imperial patronage. there might be a subtle undercurrent of professional ambition, balanced with the need to navigate the complexities of courtly etiquette and maintain favor with the powerful augustus."],
        ap.active_plans = ["To receive Augustus's praise with appropriate humility and gratitude, ensuring he is perceived as respectful and deserving of imperial favor.", "To subtly acknowledge and reinforce Augustus's artistic preferences, thereby solidifying his position as a favored poet within the imperial circle.", "To accept the offered gift, the gold statue, gracefully, recognizing it as a symbol of imperial patronage and a valuable asset for his professional standing."],
        ap.beliefs = ["Imperial patronage is crucial for a poet's success and social advancement in Rome.", "Expressing gratitude and deference to the Emperor is essential for maintaining favor and securing future opportunities.", "Aligning his poetic themes and style with the Emperor's preferences will ensure continued recognition and rewards."],
        ap.goals = ["short-term\": \"To successfully navigate the interaction with Augustus, ensuring he is perceived as both talented and suitably respectful.", "medium-term\": \"To solidify his position as the Emperor's favored poet, benefiting from continued patronage and influence within the court.", "ultimate\": \"To achieve lasting literary fame and secure his place in Roman literary history, potentially through aligning his artistic endeavors with the imperial agenda and enjoying the benefits of imperial endorsement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised and regal, her sharp gaze fixed on Claudius as he fumbles. She leans slightly forward, embodying both elegance and predatory intent, her words dripping with disdain as she criticizes his clumsiness, relishing the chance to belittle him in front of the family.',
        ap.emotional_state = 'Livia\'s surface demeanor is calm and composed, exuding confidence as she critiques Claudius. However, internally, she harbors a ruthless ambition; her disdain for Claudius reveals a deeper insecurity about her family’s dynamics and her son Tiberius\'s place in the hierarchy. She relishes the opportunity to assert her dominance.',
        ap.emotional_tags = ["livia's surface demeanor is calm", "composed, exuding confidence as she critiques claudius. however, internally, she harbors a ruthless ambition; her disdain for claudius reveals a deeper insecurity about her family\u2019s dynamics", "her son tiberius's place in the hierarchy. she relishes the opportunity to assert her dominance.", "livia's surface demeanor is calm and composed", "exuding confidence as she critiques claudius. however", "internally", "she harbors a ruthless ambition; her disdain for claudius reveals a deeper insecurity about her family\u2019s dynamics and her son tiberius's place in the hierarchy. she relishes the opportunity to assert her dominance.", "livia's surface demeanor is calm and composed, exuding confidence as she critiques claudius. however, internally, she harbors a ruthless ambition", "her disdain for claudius reveals a deeper insecurity about her family\u2019s dynamics and her son tiberius's place in the hierarchy. she relishes the opportunity to assert her dominance."],
        ap.active_plans = ["To publicly humiliate Claudius, reinforcing her family's disdain for him.", "To shift the family's focus toward Tiberius, undermining any sympathy that Claudius might receive.", "To strengthen her control over family dynamics by asserting her influence through mockery."],
        ap.beliefs = ["Weakness should be exposed and exploited to maintain power.", "Family loyalty is secondary to ambition and success.", "Public perception is crucial for preserving her family\u2019s status."],
        ap.goals = ["Short-term: To undermine Claudius\u2019s reputation within the family.", "Medium-term: To have Tiberius recognized as the favored son and potential heir.", "Ultimate: To secure her family's dominance in the imperial hierarchy and eliminate perceived threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Antonia stands nearby, her expression a blend of concern and frustration. As she chastises Claudius for his clumsiness, her posture reflects a protective instinct mixed with disapproval. She gestures toward him with a hint of exasperation, embodying the family\'s collective shame.',
        ap.emotional_state = 'Antonia\'s surface emotion is one of disappointment, as she scolds Claudius for his mishap. Beneath this, she feels a twinge of empathy for her brother, recognizing his struggles yet feeling compelled to conform to the family’s ridicule. There is a conflict between her affection for Claudius and her desire to maintain familial harmony.',
        ap.emotional_tags = ["antonia's surface emotion is one of disappointment, as she scolds claudius for his mishap. beneath this, she feels a twinge of empathy for her brother, recognizing his struggles yet feeling compelled to conform to the family\u2019s ridicule. there is a conflict between her affection for claudius", "her desire to maintain familial harmony.", "antonia's surface emotion is one of disappointment", "as she scolds claudius for his mishap. beneath this", "she feels a twinge of empathy for her brother", "recognizing his struggles yet feeling compelled to conform to the family\u2019s ridicule. there is a conflict between her affection for claudius and her desire to maintain familial harmony."],
        ap.active_plans = ["To express disapproval of Claudius\u2019s behavior to conform to family expectations.", "To maintain the decorum of the evening by addressing the disruption.", "To subtly defend Claudius without openly challenging Livia's authority."],
        ap.beliefs = ["Family reputation is paramount and must be upheld at all costs.", "Clumsiness reflects poorly on the family, and such behavior must be corrected.", "Support for Claudius is necessary but must be discreet to avoid familial backlash."],
        ap.goals = ["Short-term: To mitigate the embarrassment caused by Claudius's clumsiness.", "Medium-term: To advocate for Claudius in a way that doesn\u2019t provoke family ire.", "Ultimate: To foster a sense of unity within the family while protecting Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands awkwardly to the side, his posture tense and defensive. As he knocks over the cup, he flinches at the immediate reaction from his family, his hands trembling slightly. He attempts to apologize, his stammer betraying his anxiety as he seeks to mitigate the embarrassment.',
        ap.emotional_state = 'Claudius\'s outward expression reveals panic and embarrassment as he realizes the implications of his clumsiness. Internally, he grapples with feelings of rejection and inadequacy, aware that he is the family outcast. The ridicule from Livia and Antonia compounds his sense of isolation and longing for acceptance.',
        ap.emotional_tags = ["claudius's outward expression reveals panic", "embarrassment as he realizes the implications of his clumsiness. internally, he grapples with feelings of rejection", "inadequacy, aware that he is the family outcast. the ridicule from livia", "antonia compounds his sense of isolation", "longing for acceptance.", "claudius's outward expression reveals panic and embarrassment as he realizes the implications of his clumsiness. internally", "he grapples with feelings of rejection and inadequacy", "aware that he is the family outcast. the ridicule from livia and antonia compounds his sense of isolation and longing for acceptance."],
        ap.active_plans = ["To apologize and defuse the immediate tension caused by the incident.", "To seek understanding and support from his family, despite their scorn.", "To navigate the evening without further incident, attempting to blend into the background."],
        ap.beliefs = ["Acceptance from his family is unattainable but desperately desired.", "His physicality and stutter mark him as inferior in a world that values perfection.", "Each family gathering is an opportunity for ridicule and a reminder of his isolation."],
        ap.goals = ["Short-term: To minimize his embarrassment in the eyes of his family.", "Medium-term: To find a moment of connection with someone in the family.", "Ultimate: To reclaim his dignity and prove that he is more than the family fool."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Germanicus stands, gently rousing Agrippina, his wife, indicating it\'s time to leave. He is physically present but relatively quiet during this departure scene, focused on ensuring his wife is ready to go. His posture is likely upright and composed, reflecting his military bearing, though softened by familial tenderness towards Agrippina.',
        ap.emotional_state = 'Germanicus projects an air of calm and collectedness, typical of his public persona. Internally, he is likely navigating the subtle tensions of the room, aware of the undercurrents within his family. While outwardly polite and dutiful, there might be a weariness beneath the surface, a quiet resignation to the complex dynamics of the imperial household. He is likely more observant than expressive, attuned to the unspoken cues of his grandfather and Livia.',
        ap.emotional_tags = ["germanicus projects an air of calm", "collectedness, typical of his public persona. internally, he is likely navigating the subtle tensions of the room, aware of the undercurrents within his family. while outwardly polite", "dutiful, there might be a weariness beneath the surface, a quiet resignation to the complex dynamics of the imperial household. he is likely more observant than expressive, attuned to the unspoken cues of his grandfather", "livia.", "germanicus projects an air of calm and collectedness", "typical of his public persona. internally", "he is likely navigating the subtle tensions of the room", "aware of the undercurrents within his family. while outwardly polite and dutiful", "there might be a weariness beneath the surface", "a quiet resignation to the complex dynamics of the imperial household. he is likely more observant than expressive", "attuned to the unspoken cues of his grandfather and livia."],
        ap.active_plans = ["To ensure Agrippina is ready to depart gracefully and without incident.", "To maintain a respectful and dutiful posture in front of Augustus, reinforcing his image as a loyal grandson.", "To observe the interactions between other family members, especially Livia and Augustus, gauging the power dynamics at play."],
        ap.beliefs = ["Family duty and respect for elders are paramount, especially towards Augustus.", "Maintaining a composed and honorable demeanor is crucial for his public and familial image.", "Subtlety and observation are valuable tools for navigating the complexities of court life."],
        ap.goals = ["Short-term: To exit the salon smoothly and politely, concluding the evening without causing any ripples.", "Medium-term: To continue cultivating a positive relationship with Augustus, securing his favor and trust.", "Ultimate: To uphold his reputation as a virtuous and honorable Roman, solidifying his position within the empire and potentially as a future leader."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Antonia actively participates in the departure, prompting Claudius to leave and agreeing with the general sentiment that it is late. She is positioned amongst the departing family members, engaging directly with Claudius and aligning herself with the general flow of exit. Her actions are gentle but firm, reflecting a desire for order and perhaps a touch of maternal concern.',
        ap.emotional_state = 'Antonia displays a mix of weariness and mild exasperation, particularly directed at Claudius\'s clumsiness. Beneath the surface, she carries a gentle empathy and familial affection, though tinged with a realistic understanding of the family\'s dysfunctions. Her tone is practical and slightly world-weary, suggesting she\'s accustomed to the minor dramas and social awkwardness within the imperial circle. She is likely feeling the lateness of the hour and the desire for the evening to conclude peacefully.',
        ap.emotional_tags = ["antonia displays a mix of weariness", "mild exasperation, particularly directed at claudius's clumsiness. beneath the surface, she carries a gentle empathy", "familial affection, though tinged with a realistic understanding of the family's dysfunctions. her tone is practical", "slightly world-weary, suggesting she's accustomed to the minor dramas", "social awkwardness within the imperial circle. she is likely feeling the lateness of the hour", "the desire for the evening to conclude peacefully.", "antonia displays a mix of weariness and mild exasperation", "particularly directed at claudius's clumsiness. beneath the surface", "she carries a gentle empathy and familial affection", "though tinged with a realistic understanding of the family's dysfunctions. her tone is practical and slightly world-weary", "suggesting she's accustomed to the minor dramas and social awkwardness within the imperial circle. she is likely feeling the lateness of the hour and the desire for the evening to conclude peacefully."],
        ap.active_plans = ["To ensure Claudius, whom she seems to have some affection for, doesn't further embarrass himself or become the target of Livia's ire.", "To facilitate a smooth and timely departure for herself and the other family members, signaling the end of the evening's formal obligations.", "To maintain a semblance of familial harmony and decorum during the leave-taking, despite the evident undercurrents of tension."],
        ap.beliefs = ["Maintaining social decorum is important, even within the family, to prevent unnecessary conflict.", "Kindness and patience are necessary, especially when dealing with Claudius's social difficulties.", "Practicality and efficiency are valued, particularly at the end of a long evening."],
        ap.goals = ["Short-term: To get Claudius to leave without further incident and to depart herself promptly.", "Medium-term: To continue fostering a somewhat protective and understanding relationship with Claudius, offering him support within the family.", "Ultimate: To maintain a degree of peace and stability within her immediate family and social circle, navigating the broader imperial tensions as best she can."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Augustus remains seated, holding court even as his family prepares to leave. He directs comments and questions to various departing members, particularly Livilla and Postumus, seemingly oblivious to the undercurrents of tension. His posture is relaxed and avuncular, reflecting his desire to project an image of familial harmony and imperial benevolence. He is the center of attention, even as the scene shifts to departure.',
        ap.emotional_state = 'Augustus exudes a forced joviality, masking potential anxieties about family dynamics and succession. On the surface, he is pleased with the evening and Horace\'s poetry, attempting to maintain a lighthearted atmosphere. Internally, he may be feeling the weight of his age and the complexities of his family, choosing to ignore or downplay the simmering tensions. There is a hint of willful blindness, a desire to see his family as unified and loving, despite evidence to the contrary.',
        ap.emotional_tags = ["augustus exudes a forced joviality, masking potential anxieties about family dynamics", "succession. on the surface, he is pleased with the evening", "horace's poetry, attempting to maintain a lighthearted atmosphere. internally, he may be feeling the weight of his age", "the complexities of his family, choosing to ignore or downplay the simmering tensions. there is a hint of willful blindness, a desire to see his family as unified", "loving, despite evidence to the contrary.", "augustus exudes a forced joviality", "masking potential anxieties about family dynamics and succession. on the surface", "he is pleased with the evening and horace's poetry", "attempting to maintain a lighthearted atmosphere. internally", "he may be feeling the weight of his age and the complexities of his family", "choosing to ignore or downplay the simmering tensions. there is a hint of willful blindness", "a desire to see his family as unified and loving", "despite evidence to the contrary."],
        ap.active_plans = ["To maintain the illusion of a harmonious and loving family unit, particularly in public and at gatherings.", "To subtly remind Livilla of her marital duties and expectations, reinforcing traditional family values.", "To engage with Postumus in a fatherly manner, assessing his military progress and maintaining a connection, however superficial."],
        ap.beliefs = ["Familial unity and outward appearances are crucial for maintaining imperial stability and image.", "The Emperor's role includes overseeing and guiding his family, even in personal matters.", "Ignoring or downplaying problems can sometimes be a more effective strategy than direct confrontation, especially within the family."],
        ap.goals = ["Short-term: To end the evening on a positive and seemingly harmonious note, reinforcing the image of a happy imperial family.", "Medium-term: To subtly manage and control the dynamics within his family, preventing open conflict and maintaining his authority.", "Ultimate: To ensure a smooth succession and the continued stability of the empire, even if it requires overlooking inconvenient truths about his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Livilla stands amongst the departing family, engaging in brief exchanges with Augustus and Livia. She is physically present and responsive to their comments, though her engagement appears somewhat perfunctory. Her posture is likely poised and elegant, maintaining her image of a refined noblewoman. She is positioned as a key member of the family, interacting directly with the senior figures.',
        ap.emotional_state = 'Livilla displays a superficial politeness and deference to Augustus and Livia, but her true emotions are likely concealed. Beneath the surface, she might be feeling boredom or impatience with the evening\'s formalities. There\'s a hint of practiced charm, suggesting her interactions are calculated and strategic. She is likely aware of the underlying tensions and navigates them with practiced ease, masking her own ambitions and manipulations.',
        ap.emotional_tags = ["livilla displays a superficial politeness", "deference to augustus", "livia, but her true emotions are likely concealed. beneath the surface, she might be feeling boredom or impatience with the evening's formalities. there's a hint of practiced charm, suggesting her interactions are calculated", "strategic. she is likely aware of the underlying tensions", "navigates them with practiced ease, masking her own ambitions", "manipulations.", "livilla displays a superficial politeness and deference to augustus and livia", "but her true emotions are likely concealed. beneath the surface", "she might be feeling boredom or impatience with the evening's formalities. there's a hint of practiced charm", "suggesting her interactions are calculated and strategic. she is likely aware of the underlying tensions and navigates them with practiced ease", "masking her own ambitions and manipulations.", "livilla displays a superficial politeness and deference to augustus and livia,", "her true emotions are likely concealed. beneath the surface, she might be feeling boredom or impatience with the evening's formalities. there's a hint of practiced charm, suggesting her interactions are calculated and strategic. she is likely aware of the underlying tensions and navigates them with practiced ease, masking her own ambitions and manipulations."],
        ap.active_plans = ["To maintain a facade of familial harmony and respect, particularly in front of Augustus and Livia.", "To deflect any criticism or probing questions about her husband Castor's absence, offering a plausible excuse.", "To observe and assess the dynamics between Augustus, Livia, and other family members, gathering information for her own schemes."],
        ap.beliefs = ["Outward appearances and social maneuvering are essential for survival and advancement within the imperial family.", "Discretion and calculated charm are powerful tools for manipulation and control.", "Family gatherings are opportunities for strategic positioning and information gathering, not genuine connection."],
        ap.goals = ["Short-term: To navigate the goodnight exchanges smoothly and without attracting negative attention.", "Medium-term: To maintain her position within the family and continue her manipulations, particularly concerning Postumus and her own ambitions.", "Ultimate: To increase her own power and influence within the Julio-Claudian dynasty, potentially through marriage, alliances, or other strategic means."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands with the departing family, offering curt responses to Augustus\'s attempts at familial pleasantries. He is physically present but emotionally detached, his posture likely stiff and reserved. He positions himself as part of the family unit, but his interactions are minimal and lacking warmth. His presence is more obligatory than engaged.',
        ap.emotional_state = 'Tiberius displays a brooding resentment and emotional distance. On the surface, he is terse and dismissive, particularly regarding his son Castor. Internally, he is likely feeling unloved and unappreciated, perhaps even jealous of the attention given to others like Germanicus and Postumus. His curtness masks deeper feelings of inadequacy and frustration with his family dynamics. He is likely feeling trapped and obligated, going through the motions of familial duty without genuine warmth.',
        ap.emotional_tags = ["tiberius displays a brooding resentment", "emotional distance. on the surface, he is terse", "dismissive, particularly regarding his son castor. internally, he is likely feeling unloved", "unappreciated, perhaps even jealous of the attention given to others like germanicus", "postumus. his curtness masks deeper feelings of inadequacy", "frustration with his family dynamics. he is likely feeling trapped", "obligated, going through the motions of familial duty without genuine warmth.", "tiberius displays a brooding resentment and emotional distance. on the surface", "he is terse and dismissive", "particularly regarding his son castor. internally", "he is likely feeling unloved and unappreciated", "perhaps even jealous of the attention given to others like germanicus and postumus. his curtness masks deeper feelings of inadequacy and frustration with his family dynamics. he is likely feeling trapped and obligated", "going through the motions of familial duty without genuine warmth."],
        ap.active_plans = ["To minimize interaction and emotional investment in the familial farewells, maintaining his emotional distance.", "To deflect Augustus's attempts to involve him in family matters, particularly regarding Castor, asserting his lack of control.", "To observe the power dynamics and familial tensions, particularly concerning Augustus's pronouncements and Livia's reactions, remaining vigilant for any shifts in the political landscape."],
        ap.beliefs = ["Family interactions are often superficial and performative, masking deeper resentments and power struggles.", "Emotional vulnerability is a weakness to be avoided, especially within the treacherous imperial family.", "His own opinions and feelings are likely to be disregarded or minimized by Augustus, making genuine engagement pointless."],
        ap.goals = ["Short-term: To exit the salon as quickly and quietly as possible, minimizing his exposure to unwanted familial interaction.", "Medium-term: To maintain his position as the heir apparent, despite feeling unloved and unappreciated by Augustus.", "Ultimate: To secure the imperial throne and rule in his own way, perhaps proving his worth and competence to those who underestimate him, while also potentially distancing himself from the emotional burdens of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands awkwardly to the side throughout the departure, physically present but socially marginalized. He clumsily knocks over a cup, drawing negative attention from Livia and Antonia, further highlighting his awkwardness. He delivers a stuttering goodnight to Livia and Augustus, his physical presence marked by clumsiness and social discomfort. He is positioned on the periphery, an observer rather than a participant in the familial warmth.',
        ap.emotional_state = 'Claudius is acutely anxious and self-conscious, evident in his clumsiness and stuttering goodnights. On the surface, he endures the familial mockery with a degree of resignation, yet internally he is deeply hurt and humiliated by their disdain. He yearns for acceptance but expects rejection, his internal state a mix of longing and self-deprecating humor. He is emotionally isolated and vulnerable, keenly aware of his social failings within the judgmental family environment.',
        ap.emotional_tags = ["claudius is acutely anxious", "self-conscious, evident in his clumsiness", "stuttering goodnights. on the surface, he endures the familial mockery with a degree of resignation, yet internally he is deeply hurt", "humiliated by their disdain. he yearns for acceptance but expects rejection, his internal state a mix of longing", "self-deprecating humor. he is emotionally isolated", "vulnerable, keenly aware of his social failings within the judgmental family environment.", "claudius is acutely anxious and self-conscious", "evident in his clumsiness and stuttering goodnights. on the surface", "he endures the familial mockery with a degree of resignation", "yet internally he is deeply hurt and humiliated by their disdain. he yearns for acceptance but expects rejection", "his internal state a mix of longing and self-deprecating humor. he is emotionally isolated and vulnerable", "keenly aware of his social failings within the judgmental family environment.", "claudius is acutely anxious and self-conscious, evident in his clumsiness and stuttering goodnights. on the surface, he endures the familial mockery with a degree of resignation, yet internally he is deeply hurt and humiliated by their disdain. he yearns for acceptance", "expects rejection, his internal state a mix of longing and self-deprecating humor. he is emotionally isolated and vulnerable, keenly aware of his social failings within the judgmental family environment."],
        ap.active_plans = ["To avoid further social blunders and negative attention from his family, particularly Livia.", "To offer polite goodnights as required, fulfilling his familial duties despite his social discomfort.", "To observe the interactions of his family, especially Livia and Augustus's dynamics, learning about their power plays and social cues from the sidelines."],
        ap.beliefs = ["He is inherently clumsy and socially inept, deserving of the mockery and disdain he receives from his family.", "Acceptance and belonging within his family are likely unattainable for him.", "Observing and learning from the sidelines is his primary mode of engagement with the imperial court, as direct participation is fraught with social peril."],
        ap.goals = ["Short-term: To escape the salon without causing further embarrassment and enduring minimal negative interaction.", "Medium-term: To develop strategies for navigating social situations within his family, perhaps by mastering observation and calculated passivity.", "Ultimate: To find a way to be accepted and valued, even if it means accepting a marginalized role within the family, and to perhaps find intellectual or historical pursuits that offer him a sense of purpose and worth beyond familial approval."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Livia remains seated beside Augustus, observing the family\'s departure with a critical eye. She pointedly remarks on Claudius\'s clumsiness, reinforcing his marginalized status. She engages in brief, controlled exchanges with Livilla and Claudius, her posture regal and watchful. She is positioned as the matriarchal authority, subtly directing social interactions and maintaining control even during a seemingly informal departure.',
        ap.emotional_state = 'Livia displays a controlled impatience and subtle disdain, particularly towards Claudius. On the surface, she is composed and observant, but internally she is likely calculating and assessing the family dynamics, especially regarding potential threats or weaknesses. Her remark about Claudius reveals a lack of empathy and a focus on appearances and control. She is feeling the need to maintain order and reinforce her authority, even in minor social interactions, ensuring no one deviates from her expectations.',
        ap.emotional_tags = ["livia displays a controlled impatience", "subtle disdain, particularly towards claudius. on the surface, she is composed", "observant, but internally she is likely calculating", "assessing the family dynamics, especially regarding potential threats or weaknesses. her remark about claudius reveals a lack of empathy", "a focus on appearances", "control. she is feeling the need to maintain order", "reinforce her authority, even in minor social interactions, ensuring no one deviates from her expectations.", "livia displays a controlled impatience and subtle disdain", "particularly towards claudius. on the surface", "she is composed and observant", "but internally she is likely calculating and assessing the family dynamics", "especially regarding potential threats or weaknesses. her remark about claudius reveals a lack of empathy and a focus on appearances and control. she is feeling the need to maintain order and reinforce her authority", "even in minor social interactions", "ensuring no one deviates from her expectations.", "livia displays a controlled impatience and subtle disdain, particularly towards claudius. on the surface, she is composed and observant,", "internally she is likely calculating and assessing the family dynamics, especially regarding potential threats or weaknesses. her remark about claudius reveals a lack of empathy and a focus on appearances and control. she is feeling the need to maintain order and reinforce her authority, even in minor social interactions, ensuring no one deviates from her expectations."],
        ap.active_plans = ["To subtly reinforce Claudius's inferior status within the family, ensuring he remains marginalized and poses no threat to Tiberius's succession.", "To maintain a watchful presence over the family's interactions, ensuring decorum and adherence to her standards.", "To subtly probe Augustus's thoughts on Claudius's role in upcoming events, particularly the games, pushing her agenda of minimizing Claudius's public visibility."],
        ap.beliefs = ["Weakness and imperfection are unacceptable within the imperial family, and must be actively suppressed or marginalized.", "Maintaining absolute control over family dynamics is essential for securing Tiberius's succession and her own power.", "Outward appearances and social performances are crucial for maintaining the image of a strong and capable imperial family."],
        ap.goals = ["Short-term: To ensure Claudius is properly put in his place and that the family departs in an orderly and presentable manner.", "Medium-term: To continue subtly undermining Claudius's position and influence within the family and court.", "Ultimate: To secure Tiberius's ascension to the throne and consolidate her own power as Empress Mother, eliminating any potential threats or obstacles, including perceived weaknesses within the family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Postumus stands to depart with the rest of the family, engaging in a brief, somewhat formal exchange with Augustus about his troops. He offers a general goodnight to everyone, his posture likely less stiff than Tiberius but still reserved. He is positioned among the departing family members, but his interaction with Augustus feels somewhat staged and transactional, lacking genuine warmth.',
        ap.emotional_state = 'Postumus displays a superficial politeness and dutifulness, particularly towards Augustus. Beneath the surface, he is likely feeling a mix of insecurity and a yearning for genuine acceptance from his grandfather. His exchange with Augustus is brief and focused on military matters, suggesting a desire to prove his worth through his military capabilities. There\'s a hint of underlying tension, possibly stemming from his marginalized position and awareness of Livia\'s machinations. He is likely feeling the pressure to perform and prove himself worthy in Augustus\'s eyes.',
        ap.emotional_tags = ["postumus displays a superficial politeness", "dutifulness, particularly towards augustus. beneath the surface, he is likely feeling a mix of insecurity", "a yearning for genuine acceptance from his grandfather. his exchange with augustus is brief", "focused on military matters, suggesting a desire to prove his worth through his military capabilities. there's a hint of underlying tension, possibly stemming from his marginalized position", "awareness of livia's machinations. he is likely feeling the pressure to perform", "prove himself worthy in augustus's eyes.", "postumus displays a superficial politeness and dutifulness", "particularly towards augustus. beneath the surface", "he is likely feeling a mix of insecurity and a yearning for genuine acceptance from his grandfather. his exchange with augustus is brief and focused on military matters", "suggesting a desire to prove his worth through his military capabilities. there's a hint of underlying tension", "possibly stemming from his marginalized position and awareness of livia's machinations. he is likely feeling the pressure to perform and prove himself worthy in augustus's eyes."],
        ap.active_plans = ["To present a dutiful and capable image to Augustus, emphasizing his military competence and loyalty.", "To maintain a polite and generally agreeable demeanor during the farewells, avoiding any conflict or negative attention.", "To observe the interactions between other family members, particularly Livia and Tiberius, gauging the political climate and potential threats to his position."],
        ap.beliefs = ["Military prowess and loyalty are key to earning Augustus's respect and favor.", "Maintaining a public image of competence and dutifulness is crucial for navigating the imperial court.", "His position within the family is precarious, requiring constant vigilance and strategic self-presentation."],
        ap.goals = ["Short-term: To conclude the evening with a positive impression on Augustus, reinforcing his image as a capable military leader.", "Medium-term: To solidify his position within the family and court, potentially gaining more responsibility and recognition from Augustus.", "Ultimate: To secure a prominent and respected role within the Roman Empire, potentially even as a successor to Augustus, and to gain genuine acceptance and belonging within his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised, her posture straight and commanding, as she engages Augustus in a sharp exchange about Claudius. Her movements are deliberate, with her hands lightly gesturing to emphasize her points. The coldness of her demeanor contrasts with the warmth of the evening, highlighting her role as the pragmatic strategist in the family.',
        ap.emotional_state = 'Livia\'s surface demeanor is composed, yet beneath lies a steely resolve mixed with disdain for Claudius. Her eyes glint with ambition as she confronts Augustus, revealing an unyielding determination to maintain the family\'s public image. The internal conflict between familial loyalty and political necessity is palpable, as she ruthlessly prioritizes the latter over her own blood.',
        ap.emotional_tags = ["livia's surface demeanor is composed, yet beneath lies a steely resolve mixed with disdain for claudius. her eyes glint with ambition as she confronts augustus, revealing an unyielding determination to maintain the family's public image. the internal conflict between familial loyalty", "political necessity is palpable, as she ruthlessly prioritizes the latter over her own blood.", "livia's surface demeanor is composed", "yet beneath lies a steely resolve mixed with disdain for claudius. her eyes glint with ambition as she confronts augustus", "revealing an unyielding determination to maintain the family's public image. the internal conflict between familial loyalty and political necessity is palpable", "as she ruthlessly prioritizes the latter over her own blood."],
        ap.active_plans = ["To persuade Augustus to reconsider Claudius's role in the public games, ensuring the family maintains a favorable image.", "To marginalize Claudius in the family hierarchy, reinforcing her son Tiberius's position as the heir.", "To leverage the situation to eliminate what she perceives as a liability in the form of Claudius, reducing potential threats to her own ambitions."],
        ap.beliefs = ["Public perception is paramount for maintaining power and influence within the empire.", "Weakness should be ruthlessly eliminated to protect the family's legacy and ambitions.", "Political expediency outweighs personal relationships in the ruthless world of Roman politics."],
        ap.goals = ["Short-term: To convince Augustus that having Claudius present at the games could be detrimental to their public image.", "Medium-term: To solidify Tiberius's status as the unquestioned heir of Augustus, pushing Claudius further into the shadows.", "Ultimate: To ensure the survival of her family's power and influence in Rome, at any cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Augustus sits with an air of patriarchal authority, initially engaging with the evening\'s festivities. As Livia shifts the conversation, he leans back, momentarily avoiding eye contact, as if seeking to distance himself from the uncomfortable subject of Claudius. His fidgeting with his cup reveals his discomfort with confronting the issue directly.',
        ap.emotional_state = 'Outwardly, Augustus exhibits a façade of relaxed authority, but internally he grapples with mounting anxiety about his family\'s dynamics and the public\'s expectations. He exhibits a blend of frustration and avoidance, showcasing his reluctance to face the implications of Livia\'s concerns about Claudius, torn between his desire to protect his family and the reality of their political reputation.',
        ap.emotional_tags = ["outwardly, augustus exhibits a fa\u00e7ade of relaxed authority, but internally he grapples with mounting anxiety about his family's dynamics", "the public's expectations. he exhibits a blend of frustration", "avoidance, showcasing his reluctance to face the implications of livia's concerns about claudius, torn between his desire to protect his family", "the reality of their political reputation.", "outwardly", "augustus exhibits a fa\u00e7ade of relaxed authority", "but internally he grapples with mounting anxiety about his family's dynamics and the public's expectations. he exhibits a blend of frustration and avoidance", "showcasing his reluctance to face the implications of livia's concerns about claudius", "torn between his desire to protect his family and the reality of their political reputation.", "outwardly, augustus exhibits a fa\u00e7ade of relaxed authority,", "internally he grapples with mounting anxiety about his family's dynamics and the public's expectations. he exhibits a blend of frustration and avoidance, showcasing his reluctance to face the implications of livia's concerns about claudius, torn between his desire to protect his family and the reality of their political reputation."],
        ap.active_plans = ["To maintain a harmonious family atmosphere by deflecting Livia's concerns about Claudius's public presence.", "To delay making a decision regarding Claudius's role at the games, preferring to avoid conflict for as long as possible.", "To appease Livia while hoping that the issue will resolve itself without further intervention."],
        ap.beliefs = ["Family loyalty is essential, but public image must be preserved to maintain authority.", "Conflict should be avoided to ensure stability within the family and the empire.", "Claudius, as a member of the family, deserves consideration, but his shortcomings are a liability."],
        ap.goals = ["Short-term: To navigate Livia's concerns without escalating tensions within the family.", "Medium-term: To maintain a careful balance between family loyalty and the empire's public perception.", "Ultimate: To secure the legacy of his reign while managing the competing ambitions within his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Praxis bursts into Augustus\'s book-lined study, his movements hurried and his posture anxious. He hovers nervously by the door, disrupting the Emperor\'s evening with an urgent summons. His presence is a stark intrusion into the formal setting, his frantic energy contrasting sharply with the room\'s austere order, underscoring the gravity of the message he bears.',
        ap.emotional_state = 'Praxis is visibly agitated, his surface emotions dominated by anxiety and a palpable fear of disturbing the Emperor. Beneath this surface, there\'s a clear internal stress stemming from the weight of the urgent news and his responsibility to deliver it. He is caught between his duty to inform Augustus and his desire to avoid imperial displeasure, creating a tension that manifests in his flustered demeanor and apologetic tone.',
        ap.emotional_tags = ["praxis is visibly agitated, his surface emotions dominated by anxiety", "a palpable fear of disturbing the emperor. beneath this surface, there's a clear internal stress stemming from the weight of the urgent news", "his responsibility to deliver it. he is caught between his duty to inform augustus", "his desire to avoid imperial displeasure, creating a tension that manifests in his flustered demeanor", "apologetic tone.", "praxis is visibly agitated", "his surface emotions dominated by anxiety and a palpable fear of disturbing the emperor. beneath this surface", "there's a clear internal stress stemming from the weight of the urgent news and his responsibility to deliver it. he is caught between his duty to inform augustus and his desire to avoid imperial displeasure", "creating a tension that manifests in his flustered demeanor and apologetic tone."],
        ap.active_plans = ["Immediately deliver the urgent message from Germany to Emperor Augustus.", "Emphasize the critical nature of the news to ensure Augustus understands its importance.", "Minimize any personal repercussions from interrupting the Emperor's evening by being deferential and apologetic."],
        ap.beliefs = ["The Emperor's time is precious and interruptions should be avoided unless absolutely necessary.", "News of imperial significance, especially if urgent, must be delivered to Augustus without delay.", "Maintaining a respectful and submissive demeanor towards the Emperor is crucial for his own safety and position."],
        ap.goals = ["Short-term: Successfully convey the urgent message to Augustus without incurring his anger.", "Medium-term: Ensure Augustus grasps the severity of the situation and prompts appropriate action.", "Ultimate: Maintain his role as a trusted, albeit nervous, aide within the imperial household."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Augustus is initially seated at his desk in his formal study, appearing weary as he is interrupted by Praxis. He reacts with exasperation to the intrusion, questioning the necessity of urgent news at such a late hour. He remains seated, maintaining a posture of imperial authority even when disturbed, indicating his expectation of order and control within his personal space and the palace.',
        ap.emotional_state = 'On the surface, Augustus displays annoyance and irritation at being disturbed during his evening routine. His exasperated questions and tone reveal a clear displeasure at the interruption. However, beneath this initial annoyance, there\'s a weariness that suggests he is already burdened by the responsibilities of his office, and perhaps a latent apprehension about what \'urgent\' news might entail. He values his structured evening and views this intrusion as a disruption to his carefully managed imperial life, though the insistence of \'terrible disaster\' begins to pique his underlying concern.',
        ap.emotional_tags = ["on the surface, augustus displays annoyance", "irritation at being disturbed during his evening routine. his exasperated questions", "tone reveal a clear displeasure at the interruption. however, beneath this initial annoyance, there's a weariness that suggests he is already burdened by the responsibilities of his office,", "perhaps a latent apprehension about what 'urgent' news might entail. he values his structured evening", "views this intrusion as a disruption to his carefully managed imperial life, though the insistence of 'terrible disaster' begins to pique his underlying concern.", "on the surface", "augustus displays annoyance and irritation at being disturbed during his evening routine. his exasperated questions and tone reveal a clear displeasure at the interruption. however", "beneath this initial annoyance", "there's a weariness that suggests he is already burdened by the responsibilities of his office", "and perhaps a latent apprehension about what 'urgent' news might entail. he values his structured evening and views this intrusion as a disruption to his carefully managed imperial life", "though the insistence of 'terrible disaster' begins to pique his underlying concern."],
        ap.active_plans = ["Establish and maintain his authority by questioning Praxis's urgency and demanding justification for the interruption.", "Quickly assess the nature and severity of the urgent message to determine its impact on the empire.", "Reassert control over the situation by directing Praxis to 'send him in,' transitioning from annoyed dismissal to pragmatic engagement with the unfolding crisis."],
        ap.beliefs = ["As Emperor, his schedule and personal time should be respected and protected from trivial disturbances.", "Urgent matters must be of significant imperial importance to warrant interrupting his evening.", "Maintaining composure and projecting an image of controlled authority is essential, even when faced with unexpected disruptions."],
        ap.goals = ["Short-term: Efficiently understand the reason for Praxis's urgent interruption and minimize further disruption to his evening.", "Medium-term: Address any potential crisis arising from the urgent news while upholding his imperial composure and authority.", "Ultimate: Preserve the stability and order of the Roman Empire, and maintain his image as a strong and capable ruler despite any emerging threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_2'})
    ON CREATE SET
        ap.current_status = 'The Courier stands in the austere study, visibly exhausted and disheveled, covered in mud from his long journey. His posture is tense yet respectful as he delivers the catastrophic news, carefully choosing his words while trying to maintain his composure in the presence of the Emperor and his heir.',
        ap.emotional_state = 'The Courier displays a mix of anxiety and determination, his voice trembling slightly as he relays the disastrous news. Beneath his calm facade lies a deep sense of dread and urgency, knowing the severity of the situation he is reporting. He feels the weight of his message and the impending consequences it carries for Rome.',
        ap.emotional_tags = ["the courier displays a mix of anxiety", "determination, his voice trembling slightly as he relays the disastrous news. beneath his calm facade lies a deep sense of dread", "urgency, knowing the severity of the situation he is reporting. he feels the weight of his message", "the impending consequences it carries for rome.", "the courier displays a mix of anxiety and determination", "his voice trembling slightly as he relays the disastrous news. beneath his calm facade lies a deep sense of dread and urgency", "knowing the severity of the situation he is reporting. he feels the weight of his message and the impending consequences it carries for rome."],
        ap.active_plans = ["Deliver urgent news regarding the fate of the legions to Augustus and Tiberius.", "Maintain clarity and focus despite physical exhaustion to ensure understanding of the dire situation.", "Alleviate any potential backlash from his appearance by emphasizing the urgency of the message."],
        ap.beliefs = ["It is imperative to relay accurate information to the Emperor for the safety of the empire.", "His duty as a soldier and messenger supersedes personal discomfort or appearance.", "The fate of the legions reflects on the empire's strength, and this information must be taken seriously."],
        ap.goals = ["Short-term: Effectively communicate the catastrophic news to stabilize awareness within the imperial circle.", "Medium-term: Ensure that measures are taken to address the vulnerability of Roman forces.", "Ultimate: Contribute to the protection and preservation of the Roman Empire in the wake of disaster."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at his desk, weary and burdened. As the Courier delivers the devastating news, he rises, moving deeper into the study to gather his thoughts. His demeanor shifts from irritation to shock as the implications of the message sink in, his posture reflecting both authority and vulnerability.',
        ap.emotional_state = 'Augustus grapples with a tumult of emotions—initial annoyance transforms into disbelief and then into a fierce sense of urgency. His authoritative facade cracks, revealing the deep fear and paranoia that come with the realization of Rome\'s vulnerable position. He wrestles internally with the implications of leadership and failure.',
        ap.emotional_tags = ["augustus grapples with a tumult of emotions\u2014initial annoyance transforms into disbelief", "then into a fierce sense of urgency. his authoritative facade cracks, revealing the deep fear", "paranoia that come with the realization of rome's vulnerable position. he wrestles internally with the implications of leadership", "failure.", "augustus grapples with a tumult of emotions\u2014initial annoyance transforms into disbelief and then into a fierce sense of urgency. his authoritative facade cracks", "revealing the deep fear and paranoia that come with the realization of rome's vulnerable position. he wrestles internally with the implications of leadership and failure."],
        ap.active_plans = ["Immediately assess the situation regarding the fallen legions to formulate a response.", "Summon key military leaders, Germanicus and Postumus, to devise a strategy for defense.", "Convey a sense of stability and leadership to quell potential panic among his advisors and officials."],
        ap.beliefs = ["The strength of the empire is paramount, and maintaining control over the narrative is essential.", "Failure to act decisively will lead to chaos and undermine the authority of his rule.", "His role as Emperor includes protecting Rome from both external threats and internal dissent."],
        ap.goals = ["Short-term: Gather intelligence and formulate a response to the immediate crisis.", "Medium-term: Restore confidence in his leadership among the Roman populace and military.", "Ultimate: Secure the empire's borders and maintain its power against any threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Standing grimly nearby, Tiberius listens intently to the Courier’s report. His posture is tense, reflecting a mix of concern and frustration as he processes the information about the legions’ destruction. He engages actively in the conversation, seeking clarity on the situation.',
        ap.emotional_state = 'Internally, Tiberius battles resentment and insecurity, feeling overshadowed by the news and the pressure to act. His exterior remains stoic, but the weight of expectation and his own ambitions gnaw at him as he navigates the gravity of the situation, caught between familial loyalty and personal desire for recognition.',
        ap.emotional_tags = ["internally, tiberius battles resentment", "insecurity, feeling overshadowed by the news", "the pressure to act. his exterior remains stoic, but the weight of expectation", "his own ambitions gnaw at him as he navigates the gravity of the situation, caught between familial loyalty", "personal desire for recognition.", "internally", "tiberius battles resentment and insecurity", "feeling overshadowed by the news and the pressure to act. his exterior remains stoic", "but the weight of expectation and his own ambitions gnaw at him as he navigates the gravity of the situation", "caught between familial loyalty and personal desire for recognition.", "internally, tiberius battles resentment and insecurity, feeling overshadowed by the news and the pressure to act. his exterior remains stoic,", "the weight of expectation and his own ambitions gnaw at him as he navigates the gravity of the situation, caught between familial loyalty and personal desire for recognition."],
        ap.active_plans = ["Assess the situation regarding the repercussions of losing the legions to prepare for potential panic.", "Propose immediate military strategies to respond to the German threat.", "Position himself as a capable leader to gain favor and respect from Augustus and the military."],
        ap.beliefs = ["It is crucial to act swiftly to protect Roman interests and solidify his position as the rightful heir.", "His worth is measured against his actions, particularly in moments of crisis.", "The military's effectiveness reflects on him personally, and he must prove himself a competent leader."],
        ap.goals = ["Short-term: Develop a plan to secure the Rhine and prevent further incursions.", "Medium-term: Establish himself as a decisive leader in military matters to counter any doubts about his capabilities.", "Ultimate: Ensure his legacy as a strong ruler in history, recognized for his military acumen and leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Augustus, initially seated at his desk, is visibly weary but immediately snaps to attention upon hearing Praxis\'s urgent announcement. He rises with a mix of exasperation and imperial command, demanding to hear the courier\'s report despite the late hour. As the horrific news unfolds, he moves deeper into the study, his movements becoming more agitated as the scale of the disaster sinks in. He directs questions at the courier, seeking to grasp the full extent of the catastrophe and its implications for Rome.',
        ap.emotional_state = 'Augustus begins with annoyance at the late-night interruption, displaying a ruler\'s impatience with disruptions to routine. This quickly transforms into profound shock and disbelief as the courier\'s words paint a grim picture of annihilation. Beneath the surface of imperial composure, a deep-seated fear emerges—fear for Rome\'s vulnerability, for his legacy, and for the unraveling of the Pax Romana he has strived to maintain. His anger flares at Varus\'s incompetence, a desperate attempt to deflect the crushing weight of the disaster.',
        ap.emotional_tags = ["augustus begins with annoyance at the late-night interruption, displaying a ruler's impatience with disruptions to routine. this quickly transforms into profound shock", "disbelief as the courier's words paint a grim picture of annihilation. beneath the surface of imperial composure, a deep-seated fear emerges\u2014fear for rome's vulnerability, for his legacy,", "for the unraveling of the pax romana he has strived to maintain. his anger flares at varus's incompetence, a desperate attempt to deflect the crushing weight of the disaster.", "augustus begins with annoyance at the late-night interruption", "displaying a ruler's impatience with disruptions to routine. this quickly transforms into profound shock and disbelief as the courier's words paint a grim picture of annihilation. beneath the surface of imperial composure", "a deep-seated fear emerges\u2014fear for rome's vulnerability", "for his legacy", "and for the unraveling of the pax romana he has strived to maintain. his anger flares at varus's incompetence", "a desperate attempt to deflect the crushing weight of the disaster."],
        ap.active_plans = ["Ascertain the full scope of the military defeat in the Teutoburg Forest.", "Evaluate the immediate threat posed by the German tribes to Gaul and Roman territories.", "Delegate military responsibilities to Tiberius and Germanicus to secure the Rhine frontier and manage the crisis."],
        ap.beliefs = ["Roman military might is inherently superior and should be capable of quelling barbarian uprisings.", "Maintaining order and control is paramount to the stability and prestige of the Roman Empire.", "As Emperor, he bears ultimate responsibility for Rome's security and the welfare of its citizens."],
        ap.goals = ["Short-term: Gather accurate information about the disaster and assess the immediate danger to Roman provinces.", "Medium-term: Swiftly mobilize forces to secure the Rhine frontier and prevent a German invasion of Gaul, restoring order and confidence.", "Ultimate: Preserve the stability and security of the Roman Empire, ensuring his legacy as a strong and capable ruler despite this major setback."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands beside Augustus, his posture initially grim and reserved, already seemingly burdened by the weight of expectation. He listens intently to the courier, his body language controlled and focused. As the news of the massacre breaks, he remains outwardly composed, his questions directed towards the practical military implications of the disaster. He engages in strategic discussion with Germanicus, proposing concrete actions to secure the Rhine bridges, demonstrating his military pragmatism and readiness to act.',
        ap.emotional_state = 'Tiberius maintains a facade of stoic calm, his usual grim expression deepening with the grave news. Internally, he is likely processing the information with a mixture of professional concern and a strategic, almost detached, analysis. While genuinely concerned for the empire\'s security, there\'s an undercurrent of ambition; this crisis presents an opportunity to demonstrate his military competence and leadership, potentially contrasting himself favorably against the disastrous command of Varus and the more popular Germanicus. He is driven by a need to prove his worth and capability, especially in the military sphere.',
        ap.emotional_tags = ["tiberius maintains a facade of stoic calm, his usual grim expression deepening with the grave news. internally, he is likely processing the information with a mixture of professional concern", "a strategic, almost detached, analysis. while genuinely concerned for the empire's security, there's an undercurrent of ambition; this crisis presents an opportunity to demonstrate his military competence", "leadership, potentially contrasting himself favorably against the disastrous command of varus", "the more popular germanicus. he is driven by a need to prove his worth", "capability, especially in the military sphere.", "tiberius maintains a facade of stoic calm", "his usual grim expression deepening with the grave news. internally", "he is likely processing the information with a mixture of professional concern and a strategic", "almost detached", "analysis. while genuinely concerned for the empire's security", "there's an undercurrent of ambition; this crisis presents an opportunity to demonstrate his military competence and leadership", "potentially contrasting himself favorably against the disastrous command of varus and the more popular germanicus. he is driven by a need to prove his worth and capability", "especially in the military sphere.", "tiberius maintains a facade of stoic calm, his usual grim expression deepening with the grave news. internally, he is likely processing the information with a mixture of professional concern and a strategic, almost detached, analysis. while genuinely concerned for the empire's security, there's an undercurrent of ambition", "this crisis presents an opportunity to demonstrate his military competence and leadership, potentially contrasting himself favorably against the disastrous command of varus and the more popular germanicus. he is driven by a need to prove his worth and capability, especially in the military sphere."],
        ap.active_plans = ["Gather detailed information about the military losses and the current situation in Germania.", "Assess the strategic vulnerability of the Rhine frontier and the potential for German incursions into Gaul.", "Propose and prepare for immediate military action to secure the Rhine bridges and contain the German threat, positioning himself as a proactive military leader."],
        ap.beliefs = ["Roman military strength is the ultimate guarantor of security and must be decisively employed to quell threats.", "Pragmatic, strategic action and military preparedness are essential in times of crisis.", "He possesses the military acumen and leadership skills necessary to address this crisis effectively and protect Rome."],
        ap.goals = ["Short-term: Immediately secure the Rhine bridges to prevent German advancement and protect Roman territories.", "Medium-term: Effectively lead military efforts to contain the German threat and restore Roman dominance in the region, showcasing his military prowess.", "Ultimate: Enhance his reputation as a capable military leader and statesman, solidifying his position as Augustus's heir and proving his worthiness to rule, potentially overshadowing Germanicus's popularity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Germanicus enters the study with visible concern etched on his face, reacting swiftly to the urgent summons. He immediately seeks to understand the situation, asking a direct and anxious question: \"What\'s happened?\". He listens intently as Tiberius summarizes the disaster, his attention focused on the details provided by the courier, particularly concerning the survivors and the fate of prisoners. He engages in practical military discussion, showing a readiness to act and a concern for the immediate safety of Roman territories.',
        ap.emotional_state = 'Germanicus displays immediate concern and shock upon hearing the news, his youthful idealism confronted by the brutal reality of the massacre. He likely experiences a wave of horror and empathy for the legions lost, contrasting with the more detached pragmatism of Tiberius and the imperial anger of Augustus. Beneath his outward concern, there is a burgeoning sense of responsibility and duty to respond effectively to this crisis. He is driven by a desire to protect Rome and its people, motivated by honor and a genuine concern for the human cost of the disaster.',
        ap.emotional_tags = ["germanicus displays immediate concern", "shock upon hearing the news, his youthful idealism confronted by the brutal reality of the massacre. he likely experiences a wave of horror", "empathy for the legions lost, contrasting with the more detached pragmatism of tiberius", "the imperial anger of augustus. beneath his outward concern, there is a burgeoning sense of responsibility", "duty to respond effectively to this crisis. he is driven by a desire to protect rome", "its people, motivated by honor", "a genuine concern for the human cost of the disaster.", "germanicus displays immediate concern and shock upon hearing the news", "his youthful idealism confronted by the brutal reality of the massacre. he likely experiences a wave of horror and empathy for the legions lost", "contrasting with the more detached pragmatism of tiberius and the imperial anger of augustus. beneath his outward concern", "there is a burgeoning sense of responsibility and duty to respond effectively to this crisis. he is driven by a desire to protect rome and its people", "motivated by honor and a genuine concern for the human cost of the disaster."],
        ap.active_plans = ["Rapidly comprehend the extent of the military disaster and its immediate ramifications.", "Assess the escape route taken by the courier and the potential for rescuing other survivors or understanding enemy tactics.", "Evaluate the immediate defensive needs and contribute to strategizing a swift military response to secure the Rhine frontier and protect Roman provinces."],
        ap.beliefs = ["Roman soldiers deserve effective leadership and protection, and their lives should not be squandered by incompetence.", "A swift and decisive military response is crucial to deter further aggression and restore Roman authority.", "He has a personal and moral obligation to defend Rome and its provinces, upholding Roman honor and protecting its citizens from harm."],
        ap.goals = ["Short-term: Assist in securing the Rhine bridges and preventing immediate German incursions into Roman territories.", "Medium-term: Contribute to organizing and leading a robust military response to contain the German threat and avenge the lost legions, demonstrating his military valor and leadership.", "Ultimate: Uphold Roman honor and protect the empire, solidifying his reputation as a virtuous and capable leader, potentially emerging as a popular figure to rally Rome in this crisis, though remaining loyal to Augustus's command."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_4'})
    ON CREATE SET
        ap.current_status = 'The Courier stands before Augustus and Tiberius, disheveled and weary, his clothes caked with mud from the arduous journey. He is visibly exhausted, yet his posture remains upright, conveying urgency as he recounts the catastrophic news about the legions. His gestures are animated yet strained, reflecting the weight of the message he bears.',
        ap.emotional_state = 'On the surface, the Courier exhibits a respectful demeanor, addressing Augustus and Tiberius with a tone of urgency. Internally, he is likely grappling with a mix of dread and determination, aware that the news he carries could alter the very fabric of Roman power. His exhaustion hints at underlying trauma from witnessing the horrors of defeat.',
        ap.emotional_tags = ["on the surface, the courier exhibits a respectful demeanor, addressing augustus", "tiberius with a tone of urgency. internally, he is likely grappling with a mix of dread", "determination, aware that the news he carries could alter the very fabric of roman power. his exhaustion hints at underlying trauma from witnessing the horrors of defeat.", "on the surface", "the courier exhibits a respectful demeanor", "addressing augustus and tiberius with a tone of urgency. internally", "he is likely grappling with a mix of dread and determination", "aware that the news he carries could alter the very fabric of roman power. his exhaustion hints at underlying trauma from witnessing the horrors of defeat."],
        ap.active_plans = ["To relay the critical information regarding the annihilation of the legions from the Teutoburg Forest.", "To ensure that the importance of the situation is understood promptly by Augustus and Tiberius.", "To assist in strategizing the next steps for the Roman forces facing this unprecedented crisis."],
        ap.beliefs = ["The truth must be conveyed, no matter how grim, for the survival of Rome hinges on it.", "Failure to act upon such critical information could result in further catastrophe.", "The loyalty of the remaining troops and the urgency of the situation should guide immediate actions."],
        ap.goals = ["Short-term: To deliver the urgent news with clarity and emphasis on its importance.", "Medium-term: To ensure that the leadership takes decisive action in response to the crisis.", "Ultimate: To contribute to the restoration of order and security in the Roman provinces."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands grimly near Augustus, his body tense, reflecting the weight of impending crisis. His arms are crossed, and his brow furrows as he processes the Courier\'s news. He remains vigilant and poised for action, his demeanor projecting seriousness as he engages in the unfolding conversation about troop movements.',
        ap.emotional_state = 'Outwardly, Tiberius exhibits a stoic facade, masking the turmoil of frustration and fear regarding the situation. Internally, he likely wrestles with feelings of inadequacy, as he contemplates his standing as heir amidst the chaos. His urgent response to involve himself in the military actions hints at a desire to prove his worth.',
        ap.emotional_tags = ["outwardly, tiberius exhibits a stoic facade, masking the turmoil of frustration", "fear regarding the situation. internally, he likely wrestles with feelings of inadequacy, as he contemplates his standing as heir amidst the chaos. his urgent response to involve himself in the military actions hints at a desire to prove his worth.", "outwardly", "tiberius exhibits a stoic facade", "masking the turmoil of frustration and fear regarding the situation. internally", "he likely wrestles with feelings of inadequacy", "as he contemplates his standing as heir amidst the chaos. his urgent response to involve himself in the military actions hints at a desire to prove his worth."],
        ap.active_plans = ["To propose immediate action to reclaim control over the provinces threatened by the German tribes.", "To organize a company of troops to secure the Rhine bridges and prevent further incursions.", "To assert his leadership as a response to the crisis, seeking to demonstrate his capability as heir."],
        ap.beliefs = ["It is imperative to act quickly to restore Roman dignity and control.", "Leadership during crises earns respect and solidifies his position as heir.", "The failures of the past must be addressed to prevent a repeat of disaster."],
        ap.goals = ["Short-term: To take swift action against the German tribes following the news.", "Medium-term: To solidify his position as a competent leader within the imperial family.", "Ultimate: To secure the provinces and restore the reputation of the Roman military."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Germanicus enters the study, his expression concerned and alert. He strides purposefully towards the group, positioning himself as a key player in the unfolding crisis. His body language is assertive, projecting confidence even as he absorbs the gravity of the Courier\'s message.',
        ap.emotional_state = 'Germanicus’s concern is palpable as he processes the devastating news. He balances a fierce loyalty to Rome with the burden of responsibility that comes with his reputation as a military leader. Beneath the surface, he may feel pressure to live up to expectations, grappling with the weight of his legacy amidst the crisis.',
        ap.emotional_tags = ["germanicus\u2019s concern is palpable as he processes the devastating news. he balances a fierce loyalty to rome with the burden of responsibility that comes with his reputation as a military leader. beneath the surface", "he may feel pressure to live up to expectations", "grappling with the weight of his legacy amidst the crisis."],
        ap.active_plans = ["To understand the full scope of the disaster and the response needed from the military.", "To assert his role in leading the next military actions against the Germans.", "To coordinate with Tiberius and Augustus to ensure a swift and effective response."],
        ap.beliefs = ["His duty as a Roman general is to protect the empire and its citizens at all costs.", "Leadership is not only about valor in battle but also about strategic decision-making.", "The failure of Varus must not define Rome's military legacy; redemption is necessary."],
        ap.goals = ["Short-term: To quickly gather information and assess the situation with the remaining troops.", "Medium-term: To take command of the military response and lead the fight against the German tribes.", "Ultimate: To restore confidence in Roman military prowess and cement his legacy as a hero."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Postumus is not physically present in this scene, but his influence looms as his name is mentioned during the discussions. His recent training efforts are acknowledged by Tiberius and Germanicus, indicating his potential role in the military response.',
        ap.emotional_state = 'While not present, Postumus\'s absence speaks volumes. He is likely feeling the weight of expectation and the urgency to prove himself amidst the gathering chaos. His emotional state may oscillate between eagerness for action and anxiety about the implications of the disaster for his standing within the family.',
        ap.emotional_tags = ["while not present, postumus's absence speaks volumes. he is likely feeling the weight of expectation", "the urgency to prove himself amidst the gathering chaos. his emotional state may oscillate between eagerness for action", "anxiety about the implications of the disaster for his standing within the family.", "while not present", "postumus's absence speaks volumes. he is likely feeling the weight of expectation and the urgency to prove himself amidst the gathering chaos. his emotional state may oscillate between eagerness for action and anxiety about the implications of the disaster for his standing within the family."],
        ap.active_plans = ["To prepare his troops for potential deployment following the crisis.", "To align himself with Tiberius and Germanicus in the face of external threats.", "To assert his capability in the military hierarchy to gain the favor of Augustus and Livia."],
        ap.beliefs = ["He believes that proving his worth in this crisis is essential for acceptance within his family.", "The loyalty of his trained men can turn the tide in favor of Rome during this uncertain time.", "Inaction could lead to further marginalization and he must seize this opportunity."],
        ap.goals = ["Short-term: To mobilize his troops at a moment\u2019s notice should the command be given.", "Medium-term: To establish himself as a vital asset to the Roman military forces.", "Ultimate: To gain recognition and support from the imperial family while ensuring the safety of the provinces."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Imperial Study with an air of regal composure, a stark contrast to the palpable panic that grips the room. She listens intently as Praxis stammers out his report about Postumus’s missing presence, her gaze sharp and assessing as she takes in the unfolding situation with calculated stillness.',
        ap.emotional_state = 'Outwardly, Livia projects an image of icy calm, her features betraying no hint of alarm or surprise at the chaotic news. Beneath this serene facade, however, simmers a mind rapidly calculating the implications of both the military disaster and Postumus\'s suspicious absence. There\'s a subtle undercurrent of manipulation in her demeanor, a hint of control exerted through carefully chosen words and expressions.',
        ap.emotional_tags = ["outwardly, livia projects an image of icy calm, her features betraying no hint of alarm or surprise at the chaotic news. beneath this serene facade, however, simmers a mind rapidly calculating the implications of both the military disaster", "postumus's suspicious absence. there's a subtle undercurrent of manipulation in her demeanor, a hint of control exerted through carefully chosen words", "expressions.", "outwardly", "livia projects an image of icy calm", "her features betraying no hint of alarm or surprise at the chaotic news. beneath this serene facade", "however", "simmers a mind rapidly calculating the implications of both the military disaster and postumus's suspicious absence. there's a subtle undercurrent of manipulation in her demeanor", "a hint of control exerted through carefully chosen words and expressions."],
        ap.active_plans = ["Assess the immediate situation and the level of panic within the room.", "Subtly direct attention towards Postumus's questionable whereabouts, planting seeds of suspicion and potential scandal.", "Maintain an outward appearance of control and authority to reassure Augustus and subtly steer the narrative in her favor."],
        ap.beliefs = ["Control over information and perception is paramount in maintaining power.", "Family appearances and public image are crucial for the dynasty's stability.", "Postumus is a volatile element and a threat to Tiberius's succession, needing careful management or removal."],
        ap.goals = ["Short-term: To subtly discredit Postumus and understand the true nature of his absence.", "Medium-term: To use the current crisis to solidify Tiberius's position as the indispensable heir and minimize any threats to his succession.", "Ultimate: To ensure the seamless transition of power to Tiberius and maintain her own influence within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Praxis re-enters the study, visibly flustered and anxious, his earlier urgency now replaced by a nervous hesitancy. He stammers and avoids direct eye contact as he reports his failure to locate Postumus, his discomfort escalating as he is forced to mention Livilla\'s apartments under Livia\'s pointed gaze.',
        ap.emotional_state = 'Praxis is a whirlwind of anxiety and fear, acutely aware of the gravity of the situation and the imperial figures he addresses. He is caught between his duty to report and his terror of overstepping boundaries, particularly in mentioning Livilla\'s name in front of Livia. His internal conflict is palpable, torn between obedience and the desire to avoid any personal repercussions.',
        ap.emotional_tags = ["praxis is a whirlwind of anxiety", "fear, acutely aware of the gravity of the situation", "the imperial figures he addresses. he is caught between his duty to report", "his terror of overstepping boundaries, particularly in mentioning livilla's name in front of livia. his internal conflict is palpable, torn between obedience", "the desire to avoid any personal repercussions.", "praxis is a whirlwind of anxiety and fear", "acutely aware of the gravity of the situation and the imperial figures he addresses. he is caught between his duty to report and his terror of overstepping boundaries", "particularly in mentioning livilla's name in front of livia. his internal conflict is palpable", "torn between obedience and the desire to avoid any personal repercussions."],
        ap.active_plans = ["Convey the information about Postumus's absence as directly and quickly as possible.", "Explain his search efforts to demonstrate diligence and thoroughness.", "Minimize personal exposure and avoid making any interpretations or speculations about Postumus's whereabouts that could be misconstrued."],
        ap.beliefs = ["Strict adherence to protocol and direct orders is essential for survival in the imperial court.", "Imperial figures, especially Livia, are to be treated with extreme caution and deference.", "Discretion and avoiding personal opinions are crucial for maintaining a safe position as an aide."],
        ap.goals = ["Short-term: To deliver the news of Postumus's absence without incurring the wrath of Augustus or Livia.", "Medium-term: To remain in favor and avoid being blamed for any negative consequences arising from Postumus's actions.", "Ultimate: To continue serving in the imperial household, maintaining a position of relative safety and stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius remains a brooding presence in the study, observing the exchange between Livia and Praxis with a grim and watchful intensity. He stands slightly apart, his body language suggesting a mixture of concern over the military crisis and a deep-seated awareness of the simmering family tensions being subtly brought to the surface by Livia\'s arrival and questions.',
        ap.emotional_state = 'Tiberius is likely wrestling with a complex blend of emotions. The news of the military disaster weighs heavily on him, fueling his ever-present anxieties about Rome\'s stability and his own capabilities. Simultaneously, he observes Livia’s calculated maneuvering with a familiar cynicism, recognizing her subtle manipulations and their potential implications for Postumus and himself. He is reserved and watchful, his internal state a cauldron of concern and strategic calculation.',
        ap.emotional_tags = ["tiberius is likely wrestling with a complex blend of emotions. the news of the military disaster weighs heavily on him, fueling his ever-present anxieties about rome's stability", "his own capabilities. simultaneously, he observes livia\u2019s calculated maneuvering with a familiar cynicism, recognizing her subtle manipulations", "their potential implications for postumus", "himself. he is reserved", "watchful, his internal state a cauldron of concern", "strategic calculation.", "tiberius is likely wrestling with a complex blend of emotions. the news of the military disaster weighs heavily on him", "fueling his ever-present anxieties about rome's stability and his own capabilities. simultaneously", "he observes livia\u2019s calculated maneuvering with a familiar cynicism", "recognizing her subtle manipulations and their potential implications for postumus and himself. he is reserved and watchful", "his internal state a cauldron of concern and strategic calculation."],
        ap.active_plans = ["Observe Livia\u2019s interaction with Praxis to gauge her intentions and the direction of her manipulation.", "Assess the potential political ramifications of Postumus\u2019s absence in light of the unfolding crisis.", "Remain composed and ready to respond to any directives from Augustus, while subtly positioning himself to benefit from the unfolding events."],
        ap.beliefs = ["Livia is a master manipulator whose actions are always strategically motivated.", "Family dynamics and political power are inextricably intertwined in the Roman court.", "Crises often present opportunities for strategic advancement, but also carry significant risks."],
        ap.goals = ["Short-term: To decipher Livia's immediate agenda concerning Postumus and its connection to the broader crisis.", "Medium-term: To navigate the political fallout of the Teutoburg disaster and consolidate his position as Augustus's heir.", "Ultimate: To secure the imperial throne and prove his worth as a capable ruler, despite the shadow of Germanicus and his own insecurities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Germanicus enters the Imperial Study in a state of concerned urgency, immediately seeking clarity on the unfolding disaster. His focus is sharply on the military implications, questioning the courier about the specifics of the massacre and the fate of Roman soldiers. He stands ready to address the military crisis with decisive action, his demeanor reflecting a soldier\'s directness and concern for duty.',
        ap.emotional_state = 'Germanicus is primarily driven by concern and a sense of duty in this moment. The news of the legions\' annihilation clearly troubles him deeply, evoking empathy for the soldiers and alarm for Rome\'s security. He is focused on the immediate crisis, his emotions geared towards practical action and military response, showing less immediate concern for the subtle family politics unfolding around him, though he is certainly not oblivious.',
        ap.emotional_tags = ["germanicus is primarily driven by concern", "a sense of duty in this moment. the news of the legions' annihilation clearly troubles him deeply, evoking empathy for the soldiers", "alarm for rome's security. he is focused on the immediate crisis, his emotions geared towards practical action", "military response, showing less immediate concern for the subtle family politics unfolding around him, though he is certainly not oblivious.", "germanicus is primarily driven by concern and a sense of duty in this moment. the news of the legions' annihilation clearly troubles him deeply", "evoking empathy for the soldiers and alarm for rome's security. he is focused on the immediate crisis", "his emotions geared towards practical action and military response", "showing less immediate concern for the subtle family politics unfolding around him", "though he is certainly not oblivious."],
        ap.active_plans = ["Ascertain the full extent of the military disaster and its immediate consequences.", "Identify the most pressing military threats and vulnerabilities arising from the defeat (e.g., Rhine bridges).", "Propose and prepare for immediate military action to secure Roman borders and prevent further incursions from Germanic tribes."],
        ap.beliefs = ["Military strength and readiness are paramount for Roman security and honor.", "Decisive and swift action is crucial in responding to military threats.", "The well-being of Roman soldiers and the protection of Roman territories are his primary responsibilities."],
        ap.goals = ["Short-term: To fully understand the military situation and assess the immediate dangers to Rome.", "Medium-term: To lead or participate in military efforts to secure the Rhine frontier and restore Roman military strength.", "Ultimate: To defend and expand the Roman Empire, upholding Roman military glory and ensuring the safety of its citizens and territories."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Livy stands confidently in the Imperial Library, surrounded by shelves heavy with scrolls, exuding authority. Her posture is firm, as she engages in a scholarly discussion with Pollio, her focus intense and unwavering. When Claudius appears, she shifts her attention, her demeanor softening slightly, intrigued by the young man\'s presence.',
        ap.emotional_state = 'Livy exhibits a serious exterior, but there are hints of curiosity and perhaps a protective instinct towards Claudius. Beneath her scholarly facade, she grapples with the weight of her reputation and the political implications of her work. Internally, she balances admiration for the young man\'s intellect with the anxiety of navigating the political landscape.',
        ap.emotional_tags = ["livy exhibits a serious exterior, but there are hints of curiosity", "perhaps a protective instinct towards claudius. beneath her scholarly facade, she grapples with the weight of her reputation", "the political implications of her work. internally, she balances admiration for the young man's intellect with the anxiety of navigating the political landscape.", "livy exhibits a serious exterior", "but there are hints of curiosity and perhaps a protective instinct towards claudius. beneath her scholarly facade", "she grapples with the weight of her reputation and the political implications of her work. internally", "she balances admiration for the young man's intellect with the anxiety of navigating the political landscape.", "livy exhibits a serious exterior,", "there are hints of curiosity and perhaps a protective instinct towards claudius. beneath her scholarly facade, she grapples with the weight of her reputation and the political implications of her work. internally, she balances admiration for the young man's intellect with the anxiety of navigating the political landscape."],
        ap.active_plans = ["To locate the missing book by Polemocles to further her research.", "To assert her authority in the discussion with Pollio and Claudius, showcasing her knowledge.", "To encourage the younger generation, represented by Claudius, to engage in historical discourse."],
        ap.beliefs = ["Knowledge and history are vital for understanding and shaping the present.", "Younger scholars, like Claudius, hold potential that must be nurtured.", "The political realities of Rome necessitate a careful navigation of relationships and reputations."],
        ap.goals = ["Short-term: Find the book by Polemocles to continue her research.", "Medium-term: Establish her influence in the scholarly community by engaging with younger historians.", "Ultimate: Preserve and promote the integrity of Roman history amid the political turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Pollio stands beside Livy, his posture relaxed yet alert as he jokes and probes the young Claudius for his opinions. His gestures are animated, showcasing his sharp wit. When Claudius accurately identifies the location of the book, Pollio leans in, intrigued, his demeanor shifting to one of impressed curiosity.',
        ap.emotional_state = 'Pollio\'s surface emotion is playful and teasing, reflecting his acerbic humor. However, beneath this exterior lies a keen awareness of the political landscape and concern for Claudius\'s well-being. His contradictory feelings of admiration for intelligence mixed with caution about the youth\'s vulnerabilities reveal his layered motivations.',
        ap.emotional_tags = ["pollio's surface emotion is playful", "teasing, reflecting his acerbic humor. however, beneath this exterior lies a keen awareness of the political landscape", "concern for claudius's well-being. his contradictory feelings of admiration for intelligence mixed with caution about the youth's vulnerabilities reveal his layered motivations.", "pollio's surface emotion is playful and teasing", "reflecting his acerbic humor. however", "beneath this exterior lies a keen awareness of the political landscape and concern for claudius's well-being. his contradictory feelings of admiration for intelligence mixed with caution about the youth's vulnerabilities reveal his layered motivations."],
        ap.active_plans = ["To engage Claudius in a debate about historical perspectives.", "To gauge the young man's intellect and potential as a historian.", "To assert his superiority in the scholarly hierarchy by comparing himself to Livy."],
        ap.beliefs = ["Historical accuracy and interpretation are paramount in scholarly work.", "Humor and wit are essential tools for navigating complex political discussions.", "Young minds, like Claudius's, should be challenged to ensure they grow."],
        ap.goals = ["Short-term: Evaluate Claudius's knowledge and wit during their conversation.", "Medium-term: Foster a competitive yet respectful relationship with Claudius to promote scholarly excellence.", "Ultimate: Maintain his status as a leading historian and intellectual in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Praxis flits about the library, nervously arranging scrolls and glancing at Livy and Pollio. His demeanor reflects anxiety as he tries to assist in the search for the book while managing the expectations of the historians. His movements are fidgety, indicative of his apprehension in this scholarly environment.',
        ap.emotional_state = 'Praxis appears flustered and overwhelmed, struggling to maintain his composure under pressure. He outwardly shows a mixture of eagerness to please the historians and fear of disappointing them. Internally, he wrestles with self-doubt and the weight of his responsibilities in the imperial court.',
        ap.emotional_tags = ["praxis appears flustered", "overwhelmed, struggling to maintain his composure under pressure. he outwardly shows a mixture of eagerness to please the historians", "fear of disappointing them. internally, he wrestles with self-doubt", "the weight of his responsibilities in the imperial court.", "praxis appears flustered and overwhelmed", "struggling to maintain his composure under pressure. he outwardly shows a mixture of eagerness to please the historians and fear of disappointing them. internally", "he wrestles with self-doubt and the weight of his responsibilities in the imperial court."],
        ap.active_plans = ["To efficiently assist Livy and Pollio in locating the desired book.", "To manage the expectations of the historians while maintaining the library's order.", "To avoid any conflict or disapproval from the historians for any mistakes he might make."],
        ap.beliefs = ["Serving the historians well is crucial for his standing in the court.", "Knowledge should be respected and protected, especially in the Imperial Library.", "Success in his duties reflects his value within the imperial hierarchy."],
        ap.goals = ["Short-term: Help locate the book to satisfy Livy and Pollio's inquiry.", "Medium-term: Establish himself as a competent aide to scholars and historians.", "Ultimate: Secure his position within the library and the court without drawing negative attention."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Livy, a historian of considerable renown, stands in the grand library, initially preoccupied with locating a specific book alongside Pollio. He engages with the librarian, his tone suggesting a scholar\'s mild impatience. Upon noticing Claudius, he shifts his attention, becoming curious about the young prince\'s scholarly pursuits, though still maintaining a somewhat formal and slightly distant posture.',
        ap.emotional_state = 'Livy begins the scene with a focused intent to find the book, exhibiting a scholar\'s typical determination. He is momentarily amused by Pollio\'s banter but becomes genuinely curious when Claudius is introduced. While he maintains a composed and serious demeanor, a flicker of intellectual curiosity sparks as he probes Claudius\'s reading habits, revealing an underlying openness to be surprised by unexpected intellect.',
        ap.emotional_tags = ["livy begins the scene with a focused intent to find the book, exhibiting a scholar's typical determination. he is momentarily amused by pollio's banter but becomes genuinely curious when claudius is introduced. while he maintains a composed", "serious demeanor, a flicker of intellectual curiosity sparks as he probes claudius's reading habits, revealing an underlying openness to be surprised by unexpected intellect.", "livy begins the scene with a focused intent to find the book", "exhibiting a scholar's typical determination. he is momentarily amused by pollio's banter but becomes genuinely curious when claudius is introduced. while he maintains a composed and serious demeanor", "a flicker of intellectual curiosity sparks as he probes claudius's reading habits", "revealing an underlying openness to be surprised by unexpected intellect.", "livy begins the scene with a focused intent to find the book, exhibiting a scholar's typical determination. he is momentarily amused by pollio's banter", "becomes genuinely curious when claudius is introduced. while he maintains a composed and serious demeanor, a flicker of intellectual curiosity sparks as he probes claudius's reading habits, revealing an underlying openness to be surprised by unexpected intellect."],
        ap.active_plans = ["Locate the specific book on military tactics to further his historical research.", "Engage in intellectual discourse with Pollio to refine his understanding of historical texts.", "Assess young Claudius's intellectual capabilities, moving past initial assumptions based on the prince's family's reputation."],
        ap.beliefs = ["Values rigorous historical research and accuracy above casual observation.", "Believes in the importance of primary source material and in-depth analysis.", "Upholds the dignity of historical scholarship, though he can be swayed by displays of genuine intellect regardless of social standing."],
        ap.goals = ["Short-term: Find the misplaced book to continue his immediate research.", "Medium-term: Engage in stimulating intellectual debates that refine his historical interpretations.", "Ultimate: Contribute significantly to the understanding of Roman history through meticulous research and eloquent writing, solidifying his legacy as a preeminent historian."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Pollio, a historian known for his sharp wit, initially stands with Livy, engaged in the search for a book, but quickly shifts to a more playful and subtly condescending demeanor upon noticing young Claudius. He leans in, observing Claudius with a mixture of amusement and skepticism, ready to dismiss him as another frivolous noble. He postures with a knowing air, testing Claudius with pointed questions and pronouncements.',
        ap.emotional_state = 'Pollio\'s emotions range from light-hearted amusement at Livy\'s expense to outright condescension towards Claudius, reflecting a common prejudice against the perceived intellectual shallowness of young nobles. However, beneath this playful cynicism, there\'s a keen intellect ready to be engaged. When Claudius demonstrates unexpected insight, Pollio\'s amusement turns to genuine surprise and respect, revealing a capacity to acknowledge intelligence regardless of its source.',
        ap.emotional_tags = ["pollio's emotions range from light-hearted amusement at livy's expense to outright condescension towards claudius, reflecting a common prejudice against the perceived intellectual shallowness of young nobles. however, beneath this playful cynicism, there's a keen intellect ready to be engaged. when claudius demonstrates unexpected insight, pollio's amusement turns to genuine surprise", "respect, revealing a capacity to acknowledge intelligence regardless of its source.", "pollio's emotions range from light-hearted amusement at livy's expense to outright condescension towards claudius", "reflecting a common prejudice against the perceived intellectual shallowness of young nobles. however", "beneath this playful cynicism", "there's a keen intellect ready to be engaged. when claudius demonstrates unexpected insight", "pollio's amusement turns to genuine surprise and respect", "revealing a capacity to acknowledge intelligence regardless of its source."],
        ap.active_plans = ["Engage in witty banter with Livy, showcasing his own intellectual agility and playful nature.", "Tease and challenge Claudius, initially expecting to expose a lack of serious intellectual depth.", "Assess Claudius's true intellect based on his responses, potentially offering guidance if impressed."],
        ap.beliefs = ["Believes in the power of sharp intellect and quick wit as tools for navigating social and intellectual landscapes.", "Holds a somewhat cynical view of the Roman aristocracy, suspecting them of intellectual laziness and superficiality.", "Values genuine intellectual ability and truth-telling, even when it comes from unexpected sources, and recognizes the dangers of the political climate."],
        ap.goals = ["Short-term: Enjoy intellectual sparring and assert his sharp wit in conversation.", "Medium-term: Identify and acknowledge genuine intelligence wherever he finds it, even in unexpected individuals like Claudius.", "Ultimate: To impart valuable wisdom, particularly regarding survival in the treacherous Roman political world, to those he deems worthy, ensuring the preservation of truth and perhaps a legacy beyond his historical works."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Young Claudius enters the library, moving with a noticeable limp and stammer, initially unnoticed by the historians. He is absorbed in his reading, a solitary figure amidst the towering shelves. When Livy and Pollio\'s attention turns to him, he approaches hesitantly, self-conscious of his physical afflictions, yet holding himself with a quiet dignity. He answers their questions with a mix of nervousness and burgeoning confidence as he reveals his unexpected depth of knowledge.',
        ap.emotional_state = 'Claudius is initially anxious and insecure, aware of his physical disabilities and anticipating mockery or dismissal. As the historians question him, a flicker of pride emerges as he demonstrates his intellectual capabilities, finding a rare moment of validation. This quickly shifts to stunned disbelief and fear as Pollio reveals the dangerous undercurrents of Roman politics and the potential threat to Claudius\'s historical pursuits, leaving him deeply unsettled and pondering the ominous warning.',
        ap.emotional_tags = ["claudius is initially anxious", "insecure, aware of his physical disabilities", "anticipating mockery or dismissal. as the historians question him, a flicker of pride emerges as he demonstrates his intellectual capabilities, finding a rare moment of validation. this quickly shifts to stunned disbelief", "fear as pollio reveals the dangerous undercurrents of roman politics", "the potential threat to claudius's historical pursuits, leaving him deeply unsettled", "pondering the ominous warning.", "claudius is initially anxious and insecure", "aware of his physical disabilities and anticipating mockery or dismissal. as the historians question him", "a flicker of pride emerges as he demonstrates his intellectual capabilities", "finding a rare moment of validation. this quickly shifts to stunned disbelief and fear as pollio reveals the dangerous undercurrents of roman politics and the potential threat to claudius's historical pursuits", "leaving him deeply unsettled and pondering the ominous warning."],
        ap.active_plans = ["Continue his historical studies, focusing on his family history, seeking knowledge and understanding in the quiet solitude of the library.", "Answer the historians' questions truthfully and thoughtfully, attempting to demonstrate his genuine intellectual interests despite his stammer and perceived foolishness.", "Process and understand the implications of Pollio's cryptic warning about the dangers of his historical project, and the need to feign weakness for survival."],
        ap.beliefs = ["Believes in the power of knowledge and history to understand the present and the past, seeing it as a refuge and a source of personal strength.", "Internalizes his family's shame and societal prejudice regarding his physical disabilities, leading to deep-seated insecurities and a yearning for acceptance.", "Initially naive about the overt dangers of political intrigue, but open to learning and adapting to survive, now confronted with the harsh realities of his family's world."],
        ap.goals = ["Short-term: Engage respectfully with the historians, demonstrating his knowledge and perhaps earning a measure of their respect.", "Medium-term: Complete his historical work on his father and grandfather, driven by a desire to understand his lineage and perhaps reclaim their legacy.", "Ultimate: To survive in the treacherous Roman court, potentially by adopting Pollio's advice to feign foolishness, while secretly pursuing his intellectual passions and uncovering the hidden truths of his family and the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Livy stands confidently among the shelves of the Imperial Library, her serious demeanor reflecting a scholar\'s dedication. She gestures with authority as she engages with Pollio and Claudius, displaying a keen interest in their discourse while subtly asserting her own expertise.',
        ap.emotional_state = 'Livy exhibits a mix of curiosity and competitiveness. Surface emotions reveal her motivation to guide the conversation, yet underneath lies a fear of being overshadowed by the intelligence of the young Claudius, which she recognizes could challenge her established status.',
        ap.emotional_tags = ["livy exhibits a mix of curiosity", "competitiveness. surface emotions reveal her motivation to guide the conversation, yet underneath lies a fear of being overshadowed by the intelligence of the young claudius, which she recognizes could challenge her established status.", "livy exhibits a mix of curiosity and competitiveness. surface emotions reveal her motivation to guide the conversation", "yet underneath lies a fear of being overshadowed by the intelligence of the young claudius", "which she recognizes could challenge her established status."],
        ap.active_plans = ["To engage Claudius in intellectual discourse to gauge his knowledge and potential.", "To assert her dominance in the conversation by dismissing Pollio's provocations.", "To ensure that Claudius respects the historical contributions of both historians."],
        ap.beliefs = ["That knowledge is power, particularly in the male-dominated arena of Roman scholarship.", "That her legacy as a historian is paramount and must be preserved.", "That teaching the younger generation is crucial to maintaining the integrity of history."],
        ap.goals = ["Short-term: To find the book and engage Claudius in an enlightening conversation.", "Medium-term: To solidify her reputation as the preeminent historian in the eyes of her peers.", "Ultimate: To ensure the continuation of scholarly integrity and influence in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Pollio stands relaxed yet observant beside Livy, his posture radiating an air of playful challenge. He teases Claudius while maintaining a critical eye on the young prince\'s responses, enjoying the banter while asserting his own intellectual superiority.',
        ap.emotional_state = 'Pollio\'s surface demeanor is jovial and teasing, yet beneath the playful banter, there is a genuine interest in Claudius\'s intellect. His dismissive jests hide a deeper recognition of Claudius as a potential equal, stirring a mix of amusement and challenge.',
        ap.emotional_tags = ["pollio's surface demeanor is jovial", "teasing, yet beneath the playful banter, there is a genuine interest in claudius's intellect. his dismissive jests hide a deeper recognition of claudius as a potential equal, stirring a mix of amusement", "challenge.", "pollio's surface demeanor is jovial and teasing", "yet beneath the playful banter", "there is a genuine interest in claudius's intellect. his dismissive jests hide a deeper recognition of claudius as a potential equal", "stirring a mix of amusement and challenge."],
        ap.active_plans = ["To provoke Claudius into revealing more of his knowledge and opinions.", "To maintain a lighthearted atmosphere while subtly asserting his own superiority as a historian.", "To gauge Claudius's discernment and courage in expressing his opinions between Livy and himself."],
        ap.beliefs = ["That intellectual discourse thrives on challenge and banter.", "That the youth should be engaged in scholarly pursuits to cultivate future historians.", "That humility in the face of knowledge is essential for growth."],
        ap.goals = ["Short-term: To engage Claudius in a repartee that reveals his intellect.", "Medium-term: To reinforce his own reputation while nurturing young talent.", "Ultimate: To shape the next generation of historians who will appreciate and build upon the knowledge of the past."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Claudius approaches the historians with a hesitant yet noticeable presence, his stammer apparent as he converses. He stands slightly hunched, a visual manifestation of his struggle against societal expectations, yet his keen intellect shines through in his responses.',
        ap.emotional_state = 'Claudius feels a mix of anxiety and determination. At the surface, he is anxious as he converses with esteemed historians but internally, he feels a burgeoning pride in showcasing his knowledge, revealing a conflict between his insecurities and his aspirations.',
        ap.emotional_tags = ["claudius feels a mix of anxiety", "determination. at the surface, he is anxious as he converses with esteemed historians but internally, he feels a burgeoning pride in showcasing his knowledge, revealing a conflict between his insecurities", "his aspirations.", "claudius feels a mix of anxiety and determination. at the surface", "he is anxious as he converses with esteemed historians but internally", "he feels a burgeoning pride in showcasing his knowledge", "revealing a conflict between his insecurities and his aspirations.", "claudius feels a mix of anxiety and determination. at the surface, he is anxious as he converses with esteemed historians", "internally, he feels a burgeoning pride in showcasing his knowledge, revealing a conflict between his insecurities and his aspirations."],
        ap.active_plans = ["To assert his knowledge of history and prove his worth beyond family expectations.", "To gather information for his father's and grandfather's histories without drawing undue attention.", "To navigate the delicate dynamics of conversation without revealing his vulnerabilities."],
        ap.beliefs = ["That intelligence and knowledge can counteract the scorn he receives due to his physical afflictions.", "That history is vital to understanding his family's legacy and his place within it.", "That earning respect from the historians is crucial for his self-worth."],
        ap.goals = ["Short-term: To participate meaningfully in the conversation and share his knowledge.", "Medium-term: To garner the respect of Pollio and Livy, proving he is more than his disabilities.", "Ultimate: To write a definitive history of his father and grandfather that redeems his family's name."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Livy stands in the library alongside Pollio, engaged in a scholarly pursuit, seeking a specific book. He is drawn into a playful intellectual sparring match with Pollio, directing questions at young Claudius with a mix of genuine curiosity and mild scholarly condescension.  He observes Claudius closely, assessing the young prince\'s intellectual capabilities in this impromptu test.',
        ap.emotional_state = 'On the surface, Livy projects an air of scholarly amusement and mild superiority, engaging in the intellectual game with Pollio. Beneath this playful exterior, there is a hint of genuine curiosity about Claudius\'s intellect, perhaps even a slight underestimation of the young prince. He displays a touch of playful annoyance at being corrected on bibliographic details, but quickly recovers with good humor.',
        ap.emotional_tags = ["on the surface, livy projects an air of scholarly amusement", "mild superiority, engaging in the intellectual game with pollio. beneath this playful exterior, there is a hint of genuine curiosity about claudius's intellect, perhaps even a slight underestimation of the young prince. he displays a touch of playful annoyance at being corrected on bibliographic details, but quickly recovers with good humor.", "on the surface", "livy projects an air of scholarly amusement and mild superiority", "engaging in the intellectual game with pollio. beneath this playful exterior", "there is a hint of genuine curiosity about claudius's intellect", "perhaps even a slight underestimation of the young prince. he displays a touch of playful annoyance at being corrected on bibliographic details", "but quickly recovers with good humor.", "on the surface, livy projects an air of scholarly amusement and mild superiority, engaging in the intellectual game with pollio. beneath this playful exterior, there is a hint of genuine curiosity about claudius's intellect, perhaps even a slight underestimation of the young prince. he displays a touch of playful annoyance at being corrected on bibliographic details,", "quickly recovers with good humor."],
        ap.active_plans = ["To locate the book by Polemocles/Polemocrates.", "To engage in intellectual sparring with Pollio, maintaining their established dynamic.", "To assess Claudius's intelligence and knowledge through direct questioning, albeit in a somewhat lighthearted manner."],
        ap.beliefs = ["Scholarly debate and intellectual challenges are valuable forms of discourse.", "Experience and established reputation grant a certain intellectual authority.", "Members of the imperial family are generally more focused on politics than intellectual pursuits."],
        ap.goals = ["Short-term: Find the book and resolve the bibliographic query.", "Medium-term: Maintain his reputation as a knowledgeable and respected historian within his peer group.", "Ultimate: Contribute significantly to Roman historical scholarship and understanding."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Pollio positions himself as the more assertive and challenging of the two historians, directly engaging Claudius in a somewhat confrontational manner. He pushes Claudius to choose between himself and Livy, creating a moment of high-pressure intellectual testing. He leans forward, scrutinizing Claudius\'s reaction and answer with keen interest and a hint of playful mockery.',
        ap.emotional_state = 'Pollio exudes self-assuredness and intellectual confidence, bordering on arrogance, as he puts Claudius on the spot. He seems to relish the intellectual challenge, displaying amusement and a touch of condescension initially. However, Claudius\'s astute response seems to pique his genuine interest and respect, shifting his demeanor from dismissive to impressed and intrigued by the young prince\'s unexpected wit.',
        ap.emotional_tags = ["pollio exudes self-assuredness", "intellectual confidence, bordering on arrogance, as he puts claudius on the spot. he seems to relish the intellectual challenge, displaying amusement", "a touch of condescension initially. however, claudius's astute response seems to pique his genuine interest", "respect, shifting his demeanor from dismissive to impressed", "intrigued by the young prince's unexpected wit.", "pollio exudes self-assuredness and intellectual confidence", "bordering on arrogance", "as he puts claudius on the spot. he seems to relish the intellectual challenge", "displaying amusement and a touch of condescension initially. however", "claudius's astute response seems to pique his genuine interest and respect", "shifting his demeanor from dismissive to impressed and intrigued by the young prince's unexpected wit."],
        ap.active_plans = ["To assert his intellectual prowess, particularly in relation to Livy, within their friendly rivalry.", "To test Claudius's intellectual capacity directly and provocatively, pushing past superficial politeness.", "To entertain himself and Livy with this impromptu intellectual game, injecting some playful drama into their scholarly pursuit."],
        ap.beliefs = ["Intellectual greatness is a competitive and hierarchical domain.", "Direct, even confrontational, questioning is an effective method for discerning true intellect.", "Initial appearances can be deceiving, and even those underestimated can possess surprising intelligence."],
        ap.goals = ["Short-term: Win the playful intellectual duel and elicit an interesting response from Claudius.", "Medium-term: Reinforce his image as a sharp-witted and insightful historian, capable of intellectual dominance.", "Ultimate: Secure his legacy as a significant interpreter of Roman history, valued for his incisive analysis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Claudius approaches the historians hesitantly, marked by his stammer and limp, initially appearing nervous and deferential in the presence of these renowned figures. When directly questioned by Pollio, he stands his ground, composing himself to deliver a thoughtful and diplomatic answer. He carefully articulates his nuanced opinion, demonstrating unexpected intellectual agility and tact.',
        ap.emotional_state = 'Initially, Claudius is anxious and insecure, his stammer amplifying his visible discomfort. However, as he engages with the historians\' questions, a shift occurs. He becomes focused and determined to provide an intelligent and truthful response. Beneath his outward nervousness, a spark of confidence ignites as he articulates his insightful answer, revealing a hidden depth and challenging the historians\' initial low expectations of him.',
        ap.emotional_tags = ["initially, claudius is anxious", "insecure, his stammer amplifying his visible discomfort. however, as he engages with the historians' questions, a shift occurs. he becomes focused", "determined to provide an intelligent", "truthful response. beneath his outward nervousness, a spark of confidence ignites as he articulates his insightful answer, revealing a hidden depth", "challenging the historians' initial low expectations of him.", "initially", "claudius is anxious and insecure", "his stammer amplifying his visible discomfort. however", "as he engages with the historians' questions", "a shift occurs. he becomes focused and determined to provide an intelligent and truthful response. beneath his outward nervousness", "a spark of confidence ignites as he articulates his insightful answer", "revealing a hidden depth and challenging the historians' initial low expectations of him."],
        ap.active_plans = ["To avoid drawing undue attention and remain as unobtrusive as possible initially.", "To answer the direct question truthfully and thoughtfully, showcasing his genuine understanding.", "To impress the historians with his intellect and nuanced perspective, subtly challenging their underestimation of him."],
        ap.beliefs = ["Truth and accuracy are paramount in intellectual discourse, even when addressing powerful figures.", "Different forms of excellence exist, and each historian possesses unique strengths.", "His physical impairments and stammer do not define his intellectual capacity, though others often perceive them as limitations."],
        ap.goals = ["Short-term: Successfully navigate the unexpected intellectual challenge and provide a satisfactory answer.", "Medium-term: Earn a measure of respect and recognition from respected intellectuals like Livy and Pollio.", "Ultimate: Overcome the limitations imposed by his physical disabilities and societal perceptions to be recognized for his true intellectual worth and potential."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Livy stands with a serious demeanor in the Imperial Library, her gaze fixed on Claudius as he approaches. She exhibits an authoritative posture, leaning slightly forward, eager to engage in intellectual discourse while maintaining her status as a respected historian.',
        ap.emotional_state = 'Livy\'s surface emotions depict a blend of curiosity and mild surprise upon encountering Claudius. Internally, she harbors a sense of protectiveness over her intellectual territory, wary of any challenge to her expertise or status. Her confidence as a historian feels subtly threatened by Claudius\'s keen insights.',
        ap.emotional_tags = ["livy's surface emotions depict a blend of curiosity", "mild surprise upon encountering claudius. internally, she harbors a sense of protectiveness over her intellectual territory, wary of any challenge to her expertise or status. her confidence as a historian feels subtly threatened by claudius's keen insights.", "livy's surface emotions depict a blend of curiosity and mild surprise upon encountering claudius. internally", "she harbors a sense of protectiveness over her intellectual territory", "wary of any challenge to her expertise or status. her confidence as a historian feels subtly threatened by claudius's keen insights."],
        ap.active_plans = ["To locate the missing book by Polemocles which she believes holds historical significance.", "To engage Claudius in scholarly debate, assessing his intellect against that of Pollio.", "To mentor and perhaps encourage Claudius, recognizing his potential despite societal mockery."],
        ap.beliefs = ["Intellectual prowess must be recognized and respected, regardless of social standing.", "History is critical for understanding the present and shaping the future.", "The importance of nurturing young intellectuals to ensure the continuation of knowledge."],
        ap.goals = ["Short-term: Find the missing book to further her historical research.", "Medium-term: Cultivate a relationship with Claudius, recognizing his intellect as valuable.", "Ultimate: Establish herself and Pollio as the preeminent historians of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Pollio stands with arms crossed, an air of confidence surrounding him as he banters with Livy. His posture is relaxed yet assertive, using humor to challenge Claudius, showcasing his sharp wit and acerbic nature as he navigates the conversation with ease.',
        ap.emotional_state = 'Outwardly, Pollio displays amusement and a playful demeanor, enjoying the intellectual sparring with Claudius. Internally, he feels an undercurrent of protectiveness over his reputation as a historian and is intrigued by Claudius\'s unexpected knowledge, reflecting on the potential of the young prince.',
        ap.emotional_tags = ["outwardly, pollio displays amusement", "a playful demeanor, enjoying the intellectual sparring with claudius. internally, he feels an undercurrent of protectiveness over his reputation as a historian", "is intrigued by claudius's unexpected knowledge, reflecting on the potential of the young prince.", "outwardly", "pollio displays amusement and a playful demeanor", "enjoying the intellectual sparring with claudius. internally", "he feels an undercurrent of protectiveness over his reputation as a historian and is intrigued by claudius's unexpected knowledge", "reflecting on the potential of the young prince."],
        ap.active_plans = ["To enjoy a light-hearted debate with Claudius and Livy, showcasing his wit.", "To assess Claudius's knowledge and intellect, determining if he could be a rival or ally.", "To impart wisdom indirectly through humor, guiding Claudius towards understanding the complexities of their world."],
        ap.beliefs = ["Humor is a powerful tool in intellectual discourse and social interaction.", "Knowledge and intelligence should be celebrated, but must be accompanied by wit.", "Historical narratives must be both factual and engaging to capture the public's imagination."],
        ap.goals = ["Short-term: To engage in conversation that tests Claudius's knowledge.", "Medium-term: To gauge Claudius's potential as an intellectual figure in Rome.", "Ultimate: To maintain his reputation as a leading historian while mentoring promising minds."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Claudius approaches the historians with hesitation but quickly gains confidence as he speaks. His posture is slightly hunched due to his physical challenges, yet there\'s a spark in his demeanor as he accurately identifies the book\'s location, showcasing his hidden strengths.',
        ap.emotional_state = 'Claudius initially feels anxious and uncertain, fearing judgment from the esteemed historians. However, as he corrects them, a sense of pride and intellectual clarity emerges, revealing a contrast between his perceived foolishness and his genuine knowledge. There\'s a subtle defiance against the mockery he often endures.',
        ap.emotional_tags = ["claudius initially feels anxious", "uncertain, fearing judgment from the esteemed historians. however, as he corrects them, a sense of pride", "intellectual clarity emerges, revealing a contrast between his perceived foolishness", "his genuine knowledge. there's a subtle defiance against the mockery he often endures.", "claudius initially feels anxious and uncertain", "fearing judgment from the esteemed historians. however", "as he corrects them", "a sense of pride and intellectual clarity emerges", "revealing a contrast between his perceived foolishness and his genuine knowledge. there's a subtle defiance against the mockery he often endures."],
        ap.active_plans = ["To assert himself by accurately identifying the missing book, showcasing his intelligence.", "To gather material for his family's history, connecting with his lineage.", "To navigate the expectations of the historians while maintaining his sense of identity."],
        ap.beliefs = ["True intelligence can flourish even in the most underestimated individuals.", "Knowledge is a means of reclaiming agency in a world that often dismisses him.", "Despite his struggles, he possesses valuable insights worthy of recognition."],
        ap.goals = ["Short-term: To demonstrate his knowledge by revealing the book's details.", "Medium-term: To cultivate a reputation as more than just the family's 'fool'.", "Ultimate: To write a comprehensive history of his father and grandfather, asserting his place in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Pollio, initially teasing and dismissive, pivots to genuine curiosity, leaning in with focused attention as he demands Claudius identify himself. His playful mockery transforms into sharp, direct questioning, his eyes scrutinizing Claudius with newfound interest and respect. He listens intently, absorbing Claudius\'s stammered confession of his full imperial name and lineage, a flicker of surprise crossing his face as the pieces fall into place.',
        ap.emotional_state = 'Pollio transitions from amusement and condescension to surprise and intellectual respect. He is intrigued and impressed by Claudius\'s intellect, now recognizing the prince beneath the facade of awkwardness. There\'s a hint of remorse for his earlier dismissiveness, replaced by a genuine curiosity and a burgeoning respect for Claudius\'s unexpected depth. He is mentally recalibrating his perception of the young prince.',
        ap.emotional_tags = ["pollio transitions from amusement", "condescension to surprise", "intellectual respect. he is intrigued", "impressed by claudius's intellect, now recognizing the prince beneath the facade of awkwardness. there's a hint of remorse for his earlier dismissiveness, replaced by a genuine curiosity", "a burgeoning respect for claudius's unexpected depth. he is mentally recalibrating his perception of the young prince.", "pollio transitions from amusement and condescension to surprise and intellectual respect. he is intrigued and impressed by claudius's intellect", "now recognizing the prince beneath the facade of awkwardness. there's a hint of remorse for his earlier dismissiveness", "replaced by a genuine curiosity and a burgeoning respect for claudius's unexpected depth. he is mentally recalibrating his perception of the young prince."],
        ap.active_plans = ["Ascertain Claudius's identity to understand who he is engaging with.", "Gauge the extent of Claudius's awareness of his own social standing and family perceptions.", "Formulate a new, more accurate assessment of Claudius's character and potential based on this revelation."],
        ap.beliefs = ["Intellectual curiosity is paramount, regardless of social standing.", "First impressions can be deceiving, especially in the Roman court.", "Genuine intellect is rare and should be acknowledged, even in unexpected individuals."],
        ap.goals = ["Short-term: Satisfy his immediate curiosity about Claudius's identity and social position.", "Medium-term: Re-evaluate his initial judgment of Claudius based on this new information and form a more informed opinion.", "Ultimate: Gain a deeper understanding of the dynamics within the imperial family and identify potential players beyond the surface appearances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Claudius, initially hesitant and stammering, straightens slightly as Pollio\'s direct question cuts through the earlier playful banter. He meets Pollio\'s gaze, his stammer becoming more pronounced under the weight of the direct address. He reveals his full, lengthy name, a formal declaration of his identity, and then, with a mix of resignation and quiet defiance, confirms the court\'s low estimation of him, openly describing his physical ailments as if laying bare the very reasons for his family\'s shame.',
        ap.emotional_state = 'Claudius is initially anxious and self-conscious, but as he reveals his identity, a subtle shift occurs. There\'s a tinge of vulnerability and resignation in admitting his family\'s shame and his physical imperfections. Yet, beneath the surface, there is also a flicker of defiance and a quiet pride in his lineage. He is aware of the court\'s perception of him and seems resigned to it, but also perhaps subtly challenging Pollio to see beyond the superficial judgments.',
        ap.emotional_tags = ["claudius is initially anxious", "self-conscious, but as he reveals his identity, a subtle shift occurs. there's a tinge of vulnerability", "resignation in admitting his family's shame", "his physical imperfections. yet, beneath the surface, there is also a flicker of defiance", "a quiet pride in his lineage. he is aware of the court's perception of him", "seems resigned to it, but also perhaps subtly challenging pollio to see beyond the superficial judgments.", "claudius is initially anxious and self-conscious", "but as he reveals his identity", "a subtle shift occurs. there's a tinge of vulnerability and resignation in admitting his family's shame and his physical imperfections. yet", "beneath the surface", "there is also a flicker of defiance and a quiet pride in his lineage. he is aware of the court's perception of him and seems resigned to it", "but also perhaps subtly challenging pollio to see beyond the superficial judgments.", "claudius is initially anxious and self-conscious,", "as he reveals his identity, a subtle shift occurs. there's a tinge of vulnerability and resignation in admitting his family's shame and his physical imperfections. yet, beneath the surface, there is also a flicker of defiance and a quiet pride in his lineage. he is aware of the court's perception of him and seems resigned to it,", "also perhaps subtly challenging pollio to see beyond the superficial judgments."],
        ap.active_plans = ["Answer Pollio's direct question truthfully and without evasion, despite his inherent nervousness.", "Convey the reality of his social standing and the prejudice he faces within his own family due to his disabilities.", "Subtly challenge Pollio's preconceived notions by presenting himself as more than just the 'half-wit' he is perceived to be."],
        ap.beliefs = ["Honesty, even about painful truths, is important in genuine interaction.", "His physical ailments and stammer are sources of shame and social stigma within his family.", "His true identity and lineage are significant, even if they are currently overshadowed by negative perceptions."],
        ap.goals = ["Short-term: Clearly communicate his identity to Pollio, ensuring there is no misunderstanding.", "Medium-term: Elicit a more nuanced understanding from Pollio, hoping to be seen beyond his disabilities and family's dismissiveness.", "Ultimate: Achieve a degree of recognition and respect for his intellect and potential, even if it starts with changing the perception of a single, influential individual like Pollio."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Pollio stands confidently beside Livy in the Imperial Library, his posture relaxed yet authoritative, as he engages Claudius in conversation. His gestures are animated, emphasizing his points as he questions Claudius’s reading choices, and he leans in slightly, displaying both curiosity and playful challenge.',
        ap.emotional_state = 'Pollio exhibits a playful demeanor, masking a deeper concern for Claudius’s safety as he navigates the treacherous waters of Roman politics. Outwardly, he appears light-hearted, but beneath the surface lies a sense of urgency as he recognizes the implications of Claudius\'s historical pursuits.',
        ap.emotional_tags = ["pollio exhibits a playful demeanor", "masking a deeper concern for claudius\u2019s safety as he navigates the treacherous waters of roman politics. outwardly", "he appears light-hearted", "but beneath the surface lies a sense of urgency as he recognizes the implications of claudius's historical pursuits.", "pollio exhibits a playful demeanor, masking a deeper concern for claudius\u2019s safety as he navigates the treacherous waters of roman politics. outwardly, he appears light-hearted,", "beneath the surface lies a sense of urgency as he recognizes the implications of claudius's historical pursuits."],
        ap.active_plans = ["To engage Claudius in a conversation that tests his intellect and knowledge.", "To subtly warn Claudius about the dangers associated with his familial legacy.", "To encourage Claudius to adopt a fa\u00e7ade of foolishness as a survival tactic within the imperial court."],
        ap.beliefs = ["Knowledge is a powerful tool, but it also carries risks in a politically charged environment.", "Playing the fool can be a strategic advantage in a world where perception is everything.", "The legacy of history should be preserved, but it must be approached with caution."],
        ap.goals = ["Short-term: To assess Claudius's understanding and intellect.", "Medium-term: To guide Claudius towards safer strategies for navigating the court.", "Ultimate: To preserve the integrity of the historical narrative while ensuring the safety of those who study it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Claudius approaches the conversation hesitantly, his physical presence marked by a stutter and a noticeable limp. He stands slightly hunched, his fingers fidgeting as he speaks, revealing his anxiety and eagerness to engage with the esteemed historians. His eyes dart between Pollio and Livy as he navigates their questions.',
        ap.emotional_state = 'Claudius feels a mixture of anxiety and pride as he interacts with Pollio and Livy, striving to prove himself despite his disabilities. While he outwardly displays a desire to be recognized for his intellect, internally he battles feelings of inadequacy and fear of judgment, particularly regarding his family\'s legacy.',
        ap.emotional_tags = ["claudius feels a mixture of anxiety", "pride as he interacts with pollio", "livy, striving to prove himself despite his disabilities. while he outwardly displays a desire to be recognized for his intellect, internally he battles feelings of inadequacy", "fear of judgment, particularly regarding his family's legacy.", "claudius feels a mixture of anxiety and pride as he interacts with pollio and livy", "striving to prove himself despite his disabilities. while he outwardly displays a desire to be recognized for his intellect", "internally he battles feelings of inadequacy and fear of judgment", "particularly regarding his family's legacy."],
        ap.active_plans = ["To gather material for his biographies of his father and grandfather, despite the dangers associated with their Republican ideals.", "To demonstrate his knowledge and intelligence to Pollio and Livy, seeking their approval.", "To navigate the complexities of his family's history while managing his own insecurities."],
        ap.beliefs = ["Knowledge of history is vital, especially regarding his family's legacy.", "Despite his physical challenges, he possesses a valuable intellect worthy of recognition.", "The truth of his ancestors\u2019 stories must be told, regardless of the risks involved."],
        ap.goals = ["Short-term: To find the book he believes contains important information for his project.", "Medium-term: To engage with historians to validate his intellect and knowledge.", "Ultimate: To write a truthful account of his family's legacy that honors the values of the Republic."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Claudius stands alone amidst the towering shelves of the Imperial Library, his physical form stilled by the weight of Pollio\'s words. He remains fixed in place, his body momentarily frozen as he grapples with the historian\'s abrupt departure and the unsettling revelation he left behind. The bustling library fades into background noise as Claudius becomes an island of contemplation.',
        ap.emotional_state = 'A wave of shock washes over Claudius, leaving him momentarily speechless and internally reeling. Beneath the surface of his stunned silence, fear begins to take root, intertwining with a chilling dawning of understanding. The word \'poisoned\' reverberates in his mind, shattering his naiveté about his family and the court. A profound unease settles upon him as he confronts the perilous reality hinted at by Pollio.',
        ap.emotional_tags = ["a wave of shock washes over claudius, leaving him momentarily speechless", "internally reeling. beneath the surface of his stunned silence, fear begins to take root, intertwining with a chilling dawning of understanding. the word 'poisoned' reverberates in his mind, shattering his naivet\u00e9 about his family", "the court. a profound unease settles upon him as he confronts the perilous reality hinted at by pollio.", "a wave of shock washes over claudius", "leaving him momentarily speechless and internally reeling. beneath the surface of his stunned silence", "fear begins to take root", "intertwining with a chilling dawning of understanding. the word 'poisoned' reverberates in his mind", "shattering his naivet\u00e9 about his family and the court. a profound unease settles upon him as he confronts the perilous reality hinted at by pollio."],
        ap.active_plans = ["Process and fully comprehend the gravity of Pollio's warning about his family's past and the dangers of the court.", "Re-examine his understanding of his father's and grandfather's deaths, specifically considering the possibility of poisoning.", "Begin to internalize and consider how to implement Pollio's advice to exaggerate his disabilities as a survival strategy within the treacherous Roman court."],
        ap.beliefs = ["The history of his family and the Roman court is far more perilous and shrouded in secrecy than he had ever imagined.", "His physical impairments, previously a source of shame, might paradoxically serve as a form of protection if deliberately amplified.", "Historians, like Pollio, possess crucial insights into the hidden dangers and machinations within the imperial family and Roman politics."],
        ap.goals = ["Short-term Goal: To fully absorb the immediate danger implied by the revelation of 'poisoned' and understand its direct implications for him.", "Medium-term Goal: To develop a strategy for survival within the Roman court, actively considering and refining Pollio's advice about feigning foolishness.", "Ultimate Goal: To ensure his long-term survival and, potentially, to live a 'long and useful life,' even if it requires adopting a persona of weakness and deception to navigate the dangerous political landscape."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fig_event_4_1'})
    ON CREATE SET
        oi.description = 'The fig serves as a tangible symbol of the abundance and privilege afforded to Augustus and his lineage. Initially presented as a simple offering, its significance deepens as Augustus uses it to illuminate the conversation about their roles as rulers and the responsibilities that come with their heritage.',
        oi.status_before = 'The fig is fresh, plucked from the boughs of Augustus\'s garden, representing the bountiful fruits of Roman prosperity and the intimate connection to nature within the imperial setting.',
        oi.status_after = 'The fig remains uneaten, symbolizing the larger conversation about responsibility and duty that overshadows the simple pleasure of enjoying its taste, reflecting the weight of expectations that come with their status.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fig'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_inheritance_event_4_3'})
    ON CREATE SET
        oi.description = 'The inheritance, a financial legacy from Postumus\'s father, is a point of contention in the conversation. It symbolizes Augustus\'s control and the expectations placed upon Postumus. As Augustus discusses the withholding of this inheritance, it reflects the deeper themes of maturity and responsibility that must be demonstrated before it is granted. The inheritance serves as both a reward and a burden, encapsulating the pressures of succession.',
        oi.status_before = 'The inheritance remains a promised asset, withheld by Augustus due to his concerns about Postumus\'s perceived immaturity and behavior.',
        oi.status_after = 'Following the event, the status of the inheritance remains unchanged; it continues to symbolize the conditional trust that Augustus places in Postumus, pending his growth and development as a potential leader.'
    WITH oi
    MATCH (o:Object {uuid: 'object_inheritance'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Augustus stands leisurely in the sun-dappled garden, one hand extended to offer a ripe fig to Postumus. His posture exudes authority tempered by a paternal warmth, as he engages in a conversation that oscillates between casual and deeply consequential.',
        ap.emotional_state = 'Augustus exhibits a calm exterior, reflecting a surface of paternal pride and concern for his grandson. Internally, he grapples with anxiety over Postumus\'s behavior and the expectations of the imperial lineage. His careful choice of words reveals a deeper worry about the future of the dynasty amidst tension with Livia and Tiberius.',
        ap.emotional_tags = ["augustus exhibits a calm exterior, reflecting a surface of paternal pride", "concern for his grandson. internally, he grapples with anxiety over postumus's behavior", "the expectations of the imperial lineage. his careful choice of words reveals a deeper worry about the future of the dynasty amidst tension with livia", "tiberius.", "augustus exhibits a calm exterior", "reflecting a surface of paternal pride and concern for his grandson. internally", "he grapples with anxiety over postumus's behavior and the expectations of the imperial lineage. his careful choice of words reveals a deeper worry about the future of the dynasty amidst tension with livia and tiberius."],
        ap.active_plans = ["To impart wisdom and instill a sense of responsibility in Postumus regarding their imperial legacy.", "To address the growing concerns about Postumus's reputation and behavior within the court.", "To subtly assert his authority and expectations regarding the future leadership of Rome."],
        ap.beliefs = ["The importance of maintaining the imperial image and legacy of Rome.", "Family loyalty and the need for unity among his heirs.", "The belief that maturity is essential for inheriting power and responsibility."],
        ap.goals = ["Short-term: To ensure Postumus understands the importance of his role within the family.", "Medium-term: To prepare Postumus for future leadership without causing him to feel overwhelmed.", "Ultimate: To secure a competent and loyal successor for the future of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Postumus stands next to Augustus, displaying a mix of curiosity and defiance as he listens to his grandfather\'s words. He gestures dismissively regarding the fig, indicating he feels overshadowed by the weight of the conversation and familial expectations.',
        ap.emotional_state = 'Postumus feels a simmering tension between his desire for acceptance and the burden of expectations placed upon him. Outwardly, he exhibits bravado, but internally, he wrestles with insecurities regarding his place in the family and the looming threat of inadequacy compared to Tiberius.',
        ap.emotional_tags = ["postumus feels a simmering tension between his desire for acceptance", "the burden of expectations placed upon him. outwardly, he exhibits bravado, but internally, he wrestles with insecurities regarding his place in the family", "the looming threat of inadequacy compared to tiberius.", "postumus feels a simmering tension between his desire for acceptance and the burden of expectations placed upon him. outwardly", "he exhibits bravado", "but internally", "he wrestles with insecurities regarding his place in the family and the looming threat of inadequacy compared to tiberius.", "postumus feels a simmering tension between his desire for acceptance and the burden of expectations placed upon him. outwardly, he exhibits bravado,", "internally, he wrestles with insecurities regarding his place in the family and the looming threat of inadequacy compared to tiberius."],
        ap.active_plans = ["To assert his autonomy and address the misunderstandings surrounding his behavior.", "To seek clarity about his inheritance and future within the imperial structure.", "To navigate the complicated family dynamics with Livia and Tiberius while trying to prove his worth to Augustus."],
        ap.beliefs = ["Family connections are crucial, yet they can also be a source of betrayal.", "He must prove his worth to earn his rightful place in the lineage.", "The old traditions of duty and respect can sometimes conflict with personal desires."],
        ap.goals = ["Short-term: To clear the air regarding the complaints about his behavior.", "Medium-term: To establish his identity within the family and assert his claim to his father's legacy.", "Ultimate: To secure a stable position within the imperial hierarchy and gain Augustus's approval."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his sunlit gardens, initially offering Postumus a fig with a paternal air. He then gestures towards a nearby bench, inviting Postumus to sit beside him, a subtle shift from casual interaction to a more deliberate, instructive posture. His movements are measured, conveying the weight of his imperial authority even in this informal setting.',
        ap.emotional_state = 'On the surface, Augustus projects a grandfatherly concern, beginning with a lighthearted tone about the fig. However, a current of underlying anxiety and disappointment runs through him. He is weary of courtly dramas and Livia\'s constant complaints, yet determined to guide Postumus. Beneath this, there\'s a flicker of hope mixed with doubt regarding Postumus\'s maturity and suitability to inherit his legacy, creating a tension between his affection and his imperial duty.',
        ap.emotional_tags = ["on the surface, augustus projects a grandfatherly concern, beginning with a lighthearted tone about the fig. however, a current of underlying anxiety", "disappointment runs through him. he is weary of courtly dramas", "livia's constant complaints, yet determined to guide postumus. beneath this, there's a flicker of hope mixed with doubt regarding postumus's maturity", "suitability to inherit his legacy, creating a tension between his affection", "his imperial duty.", "on the surface", "augustus projects a grandfatherly concern", "beginning with a lighthearted tone about the fig. however", "a current of underlying anxiety and disappointment runs through him. he is weary of courtly dramas and livia's constant complaints", "yet determined to guide postumus. beneath this", "there's a flicker of hope mixed with doubt regarding postumus's maturity and suitability to inherit his legacy", "creating a tension between his affection and his imperial duty."],
        ap.active_plans = ["To assess Postumus's maturity and readiness for imperial responsibility.", "To gently reprimand Postumus for his recent misbehavior and instill a sense of decorum.", "To gauge Postumus's understanding of the burdens and expectations of Roman leadership."],
        ap.beliefs = ["The stability of Rome depends on maintaining a strong imperial image and upholding traditional Roman values.", "Lineage and bloodline are important factors in succession, but personal character and competence are paramount.", "Despite his flaws, Postumus represents the best hope for continuing his legacy through Agrippa's line."],
        ap.goals = ["short-term\": \"To convey the seriousness of his concerns to Postumus in a manner that is both instructive and paternal.", "medium-term\": \"To mold Postumus into a responsible heir who can eventually assume leadership of Rome.", "ultimate\": \"To ensure a smooth and stable transition of power after his death, securing the future of Rome and his dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Postumus initially accepts the fig offered by Augustus, consuming it quickly, but his attention is clearly elsewhere. He stands restlessly until Augustus gestures him to the bench, where he sits with a degree of impatience. He listens to Augustus, but his responses are direct and somewhat defensive, indicating a simmering resentment beneath a veneer of politeness.',
        ap.emotional_state = 'Postumus presents a façade of respectful attentiveness, answering Augustus\'s questions directly. However, beneath this surface, he is deeply insecure and defensive, quickly becoming impatient with Augustus\'s preamble. He feels misunderstood and unfairly judged, bristling at the complaints and Livia\'s criticisms. There\'s a palpable yearning for his grandfather\'s approval and a frustration at being constantly measured against unattainable expectations, creating internal conflict between his desire for acceptance and his rebellious spirit.',
        ap.emotional_tags = ["postumus presents a fa\u00e7ade of respectful attentiveness, answering augustus's questions directly. however, beneath this surface, he is deeply insecure", "defensive, quickly becoming impatient with augustus's preamble. he feels misunderstood", "unfairly judged, bristling at the complaints", "livia's criticisms. there's a palpable yearning for his grandfather's approval", "a frustration at being constantly measured against unattainable expectations, creating internal conflict between his desire for acceptance", "his rebellious spirit.", "postumus presents a fa\u00e7ade of respectful attentiveness", "answering augustus's questions directly. however", "beneath this surface", "he is deeply insecure and defensive", "quickly becoming impatient with augustus's preamble. he feels misunderstood and unfairly judged", "bristling at the complaints and livia's criticisms. there's a palpable yearning for his grandfather's approval and a frustration at being constantly measured against unattainable expectations", "creating internal conflict between his desire for acceptance and his rebellious spirit."],
        ap.active_plans = ["To understand the specific nature of the complaints against him and who is making them.", "To defend his actions, particularly the fountain incident, and justify them as protective of Claudius.", "To ascertain his grandfather's true intentions regarding his inheritance and succession, especially in light of Tiberius's position."],
        ap.beliefs = ["He is unfairly targeted by palace gossip and Livia's manipulations.", "His impulsive actions are often misunderstood and stem from a sense of loyalty and protectiveness.", "His inheritance is being unjustly withheld as a means of control and punishment rather than genuine concern for his maturity."],
        ap.goals = ["short-term\": \"To discern Augustus's true feelings towards him and his place in the succession.", "medium-term\": \"To gain Augustus's trust and secure his inheritance, proving his worth as a successor.", "ultimate\": \"To be recognized and respected as Augustus's heir and to live up to the legacy of his father, Agrippa, escaping the shadow of perceived inadequacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Livia is not physically present in the garden, but her influence permeates the conversation. She is invoked by Augustus as the source of complaints against Postumus, her criticisms shaping the narrative of the interaction. Though unseen, her presence is powerfully felt through Augustus\'s words and the anxieties they provoke in Postumus.',
        ap.emotional_state = 'Livia is likely experiencing a cold satisfaction, knowing her manipulations are bearing fruit. She remains emotionally detached and strategically focused, viewing this conversation as another step in her calculated plan to undermine Postumus. Her internal state is characterized by icy determination and unwavering ambition, devoid of empathy for Postumus and solely driven by securing Tiberius\'s path to power. There is no discernible emotional conflict; her actions are purely pragmatic and ruthlessly efficient.',
        ap.emotional_tags = ["livia is likely experiencing a cold satisfaction, knowing her manipulations are bearing fruit. she remains emotionally detached", "strategically focused, viewing this conversation as another step in her calculated plan to undermine postumus. her internal state is characterized by icy determination", "unwavering ambition, devoid of empathy for postumus", "solely driven by securing tiberius's path to power. there is no discernible emotional conflict; her actions are purely pragmatic", "ruthlessly efficient.", "livia is likely experiencing a cold satisfaction", "knowing her manipulations are bearing fruit. she remains emotionally detached and strategically focused", "viewing this conversation as another step in her calculated plan to undermine postumus. her internal state is characterized by icy determination and unwavering ambition", "devoid of empathy for postumus and solely driven by securing tiberius's path to power. there is no discernible emotional conflict; her actions are purely pragmatic and ruthlessly efficient.", "livia is likely experiencing a cold satisfaction, knowing her manipulations are bearing fruit. she remains emotionally detached and strategically focused, viewing this conversation as another step in her calculated plan to undermine postumus. her internal state is characterized by icy determination and unwavering ambition, devoid of empathy for postumus and solely driven by securing tiberius's path to power. there is no discernible emotional conflict", "her actions are purely pragmatic and ruthlessly efficient."],
        ap.active_plans = ["To further erode Augustus's confidence in Postumus by highlighting his perceived flaws and indiscretions.", "To reinforce the narrative that Postumus is immature and unsuitable for leadership through carefully placed complaints.", "To indirectly elevate Tiberius's standing by contrast, subtly positioning him as the more responsible and stable alternative."],
        ap.beliefs = ["Postumus is a significant threat to Tiberius's succession and must be actively discredited.", "Tiberius is the only logical and capable choice to succeed Augustus and secure the future of Rome.", "Manipulation and strategic influence are legitimate and necessary tools to achieve her political objectives and protect her son's interests."],
        ap.goals = ["short-term\": \"To ensure Augustus's conversation with Postumus reinforces negative perceptions of him.", "medium-term\": \"To permanently disqualify Postumus as a viable heir, solidifying Tiberius's position as the sole successor in Augustus's mind.", "ultimate\": \"To orchestrate Tiberius's ascension to the imperial throne, thereby consolidating her own power and securing the dynasty for her lineage, eliminating any rivals or uncertainties."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in the sunlit garden, his bearing regal yet weighed down by the burden of leadership. He gestures toward a nearby bench, inviting Postumus to sit and listen. His movements are deliberate and paternal, reflecting both warmth and authority as he offers a fig, aiming to share wisdom disguised as casual conversation.',
        ap.emotional_state = 'Augustus exhibits a surface calm, his tone measured as he speaks to Postumus. However, beneath this facade lies a current of anxiety, driven by his awareness of familial discord and the pressure of maintaining the empire. His concerns about Postumus\'s behavior hint at unspoken fears regarding loyalty and succession, revealing a man torn between love and duty.',
        ap.emotional_tags = ["augustus exhibits a surface calm, his tone measured as he speaks to postumus. however, beneath this facade lies a current of anxiety, driven by his awareness of familial discord", "the pressure of maintaining the empire. his concerns about postumus's behavior hint at unspoken fears regarding loyalty", "succession, revealing a man torn between love", "duty.", "augustus exhibits a surface calm", "his tone measured as he speaks to postumus. however", "beneath this facade lies a current of anxiety", "driven by his awareness of familial discord and the pressure of maintaining the empire. his concerns about postumus's behavior hint at unspoken fears regarding loyalty and succession", "revealing a man torn between love and duty."],
        ap.active_plans = ["To impart wisdom about the responsibilities of leadership and the expectations of the imperial family.", "To address and mitigate the complaints regarding Postumus's behavior in an effort to maintain familial unity and public perception.", "To emphasize the importance of maturity and responsibility to ensure Postumus is prepared for future leadership."],
        ap.beliefs = ["The importance of nurturing the next generation of leaders to secure the future of Rome.", "The belief that personal experience and maturity are crucial for effective leadership.", "The understanding that family loyalty is paramount in the treacherous political landscape of Rome."],
        ap.goals = ["Short-term: To resolve immediate concerns about Postumus's behavior and ensure he understands the expectations placed upon him.", "Medium-term: To prepare Postumus for potential leadership by instilling the values of responsibility and maturity.", "Ultimate: To secure a stable succession for Rome, ensuring that Postumus can eventually take up the mantle left by his father."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Postumus stands with an air of defiance, his posture tense as he reacts to Augustus\'s admonitions. He listens closely, the sunlight casting shadows across his features, reflecting the inner turmoil and frustration that he feels regarding his grandfather\'s expectations. His gestures are animated, particularly when he challenges Augustus\'s remarks, showcasing his passionate nature.',
        ap.emotional_state = 'Postumus exhibits frustration and resentment, feeling undermined by Augustus\'s criticisms and the weight of his expectations. Outwardly, he masks his vulnerability with bravado, yet internally he grapples with feelings of inadequacy and a desperate need for recognition. This tension highlights his struggle for acceptance within the imperial family and the burden of living up to his father\'s legacy.',
        ap.emotional_tags = ["postumus exhibits frustration", "resentment, feeling undermined by augustus's criticisms", "the weight of his expectations. outwardly, he masks his vulnerability with bravado, yet internally he grapples with feelings of inadequacy", "a desperate need for recognition. this tension highlights his struggle for acceptance within the imperial family", "the burden of living up to his father's legacy.", "postumus exhibits frustration and resentment", "feeling undermined by augustus's criticisms and the weight of his expectations. outwardly", "he masks his vulnerability with bravado", "yet internally he grapples with feelings of inadequacy and a desperate need for recognition. this tension highlights his struggle for acceptance within the imperial family and the burden of living up to his father's legacy."],
        ap.active_plans = ["To confront Augustus about the withholding of his inheritance and assert his desire for recognition.", "To clarify the misunderstandings surrounding his behavior and express his need for autonomy.", "To navigate the complexities of familial politics while seeking affirmation from Augustus."],
        ap.beliefs = ["The belief that he deserves recognition and his rightful inheritance, given his lineage.", "The conviction that he is being unfairly judged and misunderstood by those around him.", "The understanding that familial loyalty is complicated by political ambition and personal desires."],
        ap.goals = ["Short-term: To gain clarity on the reasons behind the withholding of his inheritance.", "Medium-term: To establish himself as a worthy successor and earn Augustus's approval.", "Ultimate: To prove himself capable of leading Rome and reclaiming the legacy of his father."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_father_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Postumus\'s father, a revered figure in the eyes of Augustus, looms over the conversation as a symbol of lost potential. His legacy is invoked during Augustus\'s exhortations, casting a long shadow over Postumus’s aspirations and decisions. Though not physically present, his influence permeates the interaction, reminding both men of the expectations tied to lineage.',
        ap.emotional_state = 'Although absent, the emotional weight of Postumus’s father\'s legacy evokes a sense of nostalgia and regret in Augustus, who seeks to honor his fallen friend while grappling with the need to guide Postumus. For Postumus, this legacy intensifies his internal conflict, driving him to prove that he can live up to his father\'s ideals.',
        ap.emotional_tags = ["although absent, the emotional weight of postumus\u2019s father's legacy evokes a sense of nostalgia", "regret in augustus, who seeks to honor his fallen friend while grappling with the need to guide postumus. for postumus, this legacy intensifies his internal conflict, driving him to prove that he can live up to his father's ideals.", "although absent", "the emotional weight of postumus\u2019s father's legacy evokes a sense of nostalgia and regret in augustus", "who seeks to honor his fallen friend while grappling with the need to guide postumus. for postumus", "this legacy intensifies his internal conflict", "driving him to prove that he can live up to his father's ideals.", "although absent, the emotional weight of postumus\u2019s father's legacy evokes a sense of nostalgia and regret in augustus, who seeks to honor his fallen friend", "grappling with the need to guide postumus. for postumus, this legacy intensifies his internal conflict, driving him to prove that he can live up to his father's ideals."],
        ap.active_plans = ["To emphasize the importance of his father's legacy in shaping Postumus's future.", "To ensure that Postumus understands the expectations associated with his inheritance.", "To guide Postumus towards fulfilling the potential seen in him due to his father\u2019s reputation."],
        ap.beliefs = ["The idea that a father's legacy should guide the next generation toward greatness.", "The belief that connection to familial history imposes specific duties and expectations.", "The conviction that the best way to honor a deceased father's memory is through the success of his children."],
        ap.goals = ["Short-term: To ensure that Postumus acknowledges the significance of his father's legacy.", "Medium-term: To guide Postumus in embodying the values his father upheld.", "Ultimate: To see Postumus rise as a leader worthy of his father\u2019s name and reputation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his sun-drenched gardens, initially presenting a fig to Postumus in a gesture of paternal warmth. He then gestures towards a nearby bench, guiding Postumus to sit beside him. His posture is relaxed yet commanding, transitioning into a more serious demeanor as the conversation deepens, his physical presence indicating a desire to impart important imperial wisdom.',
        ap.emotional_state = 'Augustus projects an air of seasoned wisdom and paternal concern, beginning the conversation casually to ease into more serious matters. However, beneath this façade lies a deep well of anxiety about the future of Rome and the succession. He is conflicted, torn between his disappointment in Postumus\'s behavior and his genuine desire for him to succeed. There\'s an undercurrent of frustration with Livia\'s constant complaints and a weary resignation regarding Tiberius, whom he personally dislikes.',
        ap.emotional_tags = ["augustus projects an air of seasoned wisdom", "paternal concern, beginning the conversation casually to ease into more serious matters. however, beneath this fa\u00e7ade lies a deep well of anxiety about the future of rome", "the succession. he is conflicted, torn between his disappointment in postumus's behavior", "his genuine desire for him to succeed. there's an undercurrent of frustration with livia's constant complaints", "a weary resignation regarding tiberius, whom he personally dislikes.", "augustus projects an air of seasoned wisdom and paternal concern", "beginning the conversation casually to ease into more serious matters. however", "beneath this fa\u00e7ade lies a deep well of anxiety about the future of rome and the succession. he is conflicted", "torn between his disappointment in postumus's behavior and his genuine desire for him to succeed. there's an undercurrent of frustration with livia's constant complaints and a weary resignation regarding tiberius", "whom he personally dislikes."],
        ap.active_plans = ["To gently reprimand Postumus for his recent behavior and instill in him a sense of imperial responsibility.", "To assess Postumus's understanding of the demands of leadership and the significance of Rome's global dominance.", "To reaffirm his intention to have Postumus succeed him, counteracting any doubts Postumus might have due to Tiberius's position."],
        ap.beliefs = ["The strength of Rome relies on the dedication and responsible behavior of its leaders, especially the imperial family.", "Maintaining a stable family life and setting a moral example are crucial for the continuation of Roman society and leadership.", "His judgment on who should succeed him is paramount and will ultimately be respected and followed by the Senate."],
        ap.goals = ["Short-term Goal: To correct Postumus's immediate behavioral issues and make him reflect on his actions.", "Medium-term Goal: To mold Postumus into a mature and capable leader who can shoulder the responsibilities of the empire.", "Ultimate Goal: To ensure a smooth and stable succession, securing the future of Rome under a capable ruler, ideally from his own bloodline through Postumus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Postumus initially accepts the fig from Augustus, eating it as he listens to his grandfather\'s opening remarks. He then sits on the bench as invited, his posture shifting from casual to attentive, though tinged with defensiveness. He engages in direct eye contact with Augustus, occasionally fidgeting, indicating a mixture of respect and underlying anxiety as the conversation becomes more critical and probing.',
        ap.emotional_state = 'Postumus starts with a veneer of politeness, appreciating the fig and seemingly receptive to Augustus\'s initial words. However, as Augustus\'s questioning intensifies and criticism emerges, Postumus becomes increasingly defensive and insecure. He is visibly bothered by the complaints and feels misunderstood, particularly regarding his defense of Claudius. Beneath the surface, there is a palpable yearning for his grandfather\'s approval and a deep-seated anxiety about his future and inheritance, intensified by the looming presence of Tiberius.',
        ap.emotional_tags = ["postumus starts with a veneer of politeness, appreciating the fig", "seemingly receptive to augustus's initial words. however, as augustus's questioning intensifies", "criticism emerges, postumus becomes increasingly defensive", "insecure. he is visibly bothered by the complaints", "feels misunderstood, particularly regarding his defense of claudius. beneath the surface, there is a palpable yearning for his grandfather's approval", "a deep-seated anxiety about his future", "inheritance, intensified by the looming presence of tiberius.", "postumus starts with a veneer of politeness", "appreciating the fig and seemingly receptive to augustus's initial words. however", "as augustus's questioning intensifies and criticism emerges", "postumus becomes increasingly defensive and insecure. he is visibly bothered by the complaints and feels misunderstood", "particularly regarding his defense of claudius. beneath the surface", "there is a palpable yearning for his grandfather's approval and a deep-seated anxiety about his future and inheritance", "intensified by the looming presence of tiberius."],
        ap.active_plans = ["To discern the true purpose of Augustus's summons and understand the specific complaints against him.", "To defend his actions, particularly the incident with the palace guard, justifying his behavior as righteous defense of Claudius.", "To directly address the issue of his withheld inheritance, seeking clarity and access to what he believes is rightfully his, viewing it as a measure of Augustus's trust and future intentions."],
        ap.beliefs = ["He is being unfairly judged and misunderstood by Augustus, potentially influenced by biased reports from others like Livia.", "His impulsive actions, like defending Claudius, stem from a sense of loyalty and justice, even if they are misinterpreted as recklessness.", "His inheritance is a symbol of his father's legacy and his own rightful place within the imperial family, and its withholding is a sign of distrust and lack of confidence in him."],
        ap.goals = ["Short-term Goal: To defend his character and actions to Augustus, mitigating the negative perceptions and criticisms.", "Medium-term Goal: To regain Augustus's favor and trust, proving his worthiness as a potential successor and dispelling doubts about his maturity.", "Ultimate Goal: To secure his position as Augustus's chosen heir and eventually inherit the power and responsibility of leading Rome, overcoming the obstacles posed by Tiberius and Livia's influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius is not physically present in the garden, but his presence is strongly felt through his absence and the constant references made to him by both Augustus and Postumus. He exists as a looming figure of political and familial tension, an unspoken rival whose ambitions and perceived influence cast a shadow over the seemingly paternal conversation between Augustus and Postumus. His status is defined by being the \'other\' potential successor, the one Augustus explicitly states he \'doesn\'t like\'.',
        ap.emotional_state = 'Though absent, Tiberius’s emotional state can be inferred as a complex blend of ambition and insecurity. He is likely aware of Augustus\'s reservations and the undercurrent of disapproval, fueling a simmering resentment. He probably experiences a constant pressure to prove his worth and competence, battling feelings of being perpetually second to others, perhaps even Postumus in Augustus\'s heart despite Livia\'s manipulations. There\'s an unspoken tension of suppressed ambition, knowing he is a contender but not the preferred one.',
        ap.emotional_tags = ["though absent, tiberius\u2019s emotional state can be inferred as a complex blend of ambition", "insecurity. he is likely aware of augustus's reservations", "the undercurrent of disapproval, fueling a simmering resentment. he probably experiences a constant pressure to prove his worth", "competence, battling feelings of being perpetually second to others, perhaps even postumus in augustus's heart despite livia's manipulations. there's an unspoken tension of suppressed ambition, knowing he is a contender but not the preferred one.", "though absent", "tiberius\u2019s emotional state can be inferred as a complex blend of ambition and insecurity. he is likely aware of augustus's reservations and the undercurrent of disapproval", "fueling a simmering resentment. he probably experiences a constant pressure to prove his worth and competence", "battling feelings of being perpetually second to others", "perhaps even postumus in augustus's heart despite livia's manipulations. there's an unspoken tension of suppressed ambition", "knowing he is a contender but not the preferred one.", "though absent, tiberius\u2019s emotional state can be inferred as a complex blend of ambition and insecurity. he is likely aware of augustus's reservations and the undercurrent of disapproval, fueling a simmering resentment. he probably experiences a constant pressure to prove his worth and competence, battling feelings of being perpetually second to others, perhaps even postumus in augustus's heart despite livia's manipulations. there's an unspoken tension of suppressed ambition, knowing he is a contender", "not the preferred one."],
        ap.active_plans = ["(Inferred) To continue to cultivate Livia's support, recognizing her influence over Augustus and her strategic maneuvering within the court.", "(Inferred) To maintain a public image of dutifulness and competence, subtly contrasting himself with Postumus's perceived recklessness and immaturity.", "(Inferred) To patiently wait for opportunities to solidify his claim to succession, relying on Livia's machinations and any potential missteps by Postumus that could further diminish Augustus's confidence in him."],
        ap.beliefs = ["(Inferred) He believes in his own superior capability and suitability to rule Rome compared to Postumus, seeing himself as more pragmatic and experienced.", "(Inferred) He believes that Livia is his strongest ally and that her influence is crucial in navigating the treacherous path to succession.", "(Inferred) He likely believes that Augustus's personal feelings are ultimately less important than political realities and dynastic stability, hoping to outmaneuver Postumus through strategic patience and Livia's aid."],
        ap.goals = ["Short-term Goal: (Inferred) To remain in Livia's favor and ensure her continued advocacy for his succession.", "Medium-term Goal: (Inferred) To subtly undermine Postumus's standing with Augustus without direct confrontation, allowing Postumus's own flaws to become apparent.", "Ultimate Goal: (Inferred) To succeed Augustus as Emperor of Rome, securing the ultimate power and validation he craves, despite Augustus's personal reservations and preferences."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Augustus stands confidently in the sun-drenched garden, offering a ripe fig to Postumus. His posture is relaxed yet authoritative, suggesting openness while firmly addressing his grandson’s behavior. He gestures to a nearby bench invitingly, indicating his desire for a serious conversation.',
        ap.emotional_state = 'Augustus exhibits a surface calm, with a warm tone aimed at fostering connection. However, there is an undercurrent of concern and disappointment regarding Postumus’s behavior, revealing a man grappling with the legacy he wishes to pass on. His frustration is masked by his attempts to guide Postumus amidst familial tensions.',
        ap.emotional_tags = ["augustus exhibits a surface calm, with a warm tone aimed at fostering connection. however, there is an undercurrent of concern", "disappointment regarding postumus\u2019s behavior, revealing a man grappling with the legacy he wishes to pass on. his frustration is masked by his attempts to guide postumus amidst familial tensions.", "augustus exhibits a surface calm", "with a warm tone aimed at fostering connection. however", "there is an undercurrent of concern and disappointment regarding postumus\u2019s behavior", "revealing a man grappling with the legacy he wishes to pass on. his frustration is masked by his attempts to guide postumus amidst familial tensions."],
        ap.active_plans = ["To instill a sense of responsibility and awareness in Postumus about the weight of their legacy.", "To address concerns from Livia and others about Postumus's behavior and character.", "To communicate trust in Postumus's potential while emphasizing the need for maturity and restraint."],
        ap.beliefs = ["The future of Rome must be entrusted to capable hands, highlighting the importance of merit in leadership.", "Family loyalty and unity are vital, although they are often tested by ambition.", "He believes in the necessity of nurturing the next generation to carry on the legacy of Rome."],
        ap.goals = ["Short-term: To resolve issues surrounding Postumus's behavior and reassure him of his place in the family.", "Medium-term: To prepare Postumus for a future role in governance that aligns with Augustus\u2019s expectations.", "Ultimate: To ensure that Rome remains in capable hands, paving the way for a stable succession that honors his late friend, Agrippa."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Postumus stands in the garden, a mix of defiance and vulnerability evident in his posture. He initially bites into the fig with a casual demeanor but quickly shifts to a more serious stance as he confronts Augustus. His gestures express frustration and confusion, particularly when discussing his grievances.',
        ap.emotional_state = 'Postumus\'s surface emotions fluctuate between defiance and insecurity, revealing his struggle for acceptance. He expresses annoyance at Augustus\'s concerns, yet the weight of familial expectations weighs heavily on him, leading to a simmering resentment. His internal conflict is palpable as he grapples with his identity amidst the shadows of his family’s ambitions.',
        ap.emotional_tags = ["postumus's surface emotions fluctuate between defiance", "insecurity, revealing his struggle for acceptance. he expresses annoyance at augustus's concerns, yet the weight of familial expectations weighs heavily on him, leading to a simmering resentment. his internal conflict is palpable as he grapples with his identity amidst the shadows of his family\u2019s ambitions.", "postumus's surface emotions fluctuate between defiance and insecurity", "revealing his struggle for acceptance. he expresses annoyance at augustus's concerns", "yet the weight of familial expectations weighs heavily on him", "leading to a simmering resentment. his internal conflict is palpable as he grapples with his identity amidst the shadows of his family\u2019s ambitions."],
        ap.active_plans = ["To defend himself against Augustus\u2019s criticisms and assert his independence.", "To seek clarification on his inheritance and role within the family.", "To navigate his feelings of betrayal and isolation while trying to earn Augustus's trust."],
        ap.beliefs = ["He believes he deserves to be recognized and valued within the family despite his rebellious nature.", "Postumus feels a strong need for independence and autonomy, resisting undue control from others.", "He fears being overshadowed by others in the family and wishes to carve out his own legacy."],
        ap.goals = ["Short-term: To clarify his standing in the family and defend his actions.", "Medium-term: To prove his maturity and capability to Augustus and the Senate.", "Ultimate: To assert his rightful place as a leader in Rome, independent of Livia\u2019s manipulations and Tiberius's shadow."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Empress Livia is seated in her private chambers, a space richly adorned and softly illuminated, emphasizing her wealth and power. She is physically still and composed, positioned as the dominant figure in the room, observing Livilla\'s nervous entrance with an unwavering, penetrating gaze that suggests she already knows the truth and is merely waiting for confirmation.',
        ap.emotional_state = 'Livia projects an outward calm and controlled demeanor, her voice measured and devoid of overt emotion, yet laced with an underlying chill of authority. Beneath this composed surface, she is driven by a ruthless, calculating ambition. She feels a cold, almost clinical detachment as she manipulates her granddaughter, viewing Livilla\'s indiscretion not with moral outrage, but as a strategic opportunity to assert control and further her own dynastic agenda.',
        ap.emotional_tags = ["livia projects an outward calm", "controlled demeanor, her voice measured", "devoid of overt emotion, yet laced with an underlying chill of authority. beneath this composed surface, she is driven by a ruthless, calculating ambition. she feels a cold, almost clinical detachment as she manipulates her granddaughter, viewing livilla's indiscretion not with moral outrage, but as a strategic opportunity to assert control", "further her own dynastic agenda.", "livia projects an outward calm and controlled demeanor", "her voice measured and devoid of overt emotion", "yet laced with an underlying chill of authority. beneath this composed surface", "she is driven by a ruthless", "calculating ambition. she feels a cold", "almost clinical detachment as she manipulates her granddaughter", "viewing livilla's indiscretion not with moral outrage", "but as a strategic opportunity to assert control and further her own dynastic agenda.", "livia projects an outward calm and controlled demeanor, her voice measured and devoid of overt emotion, yet laced with an underlying chill of authority. beneath this composed surface, she is driven by a ruthless, calculating ambition. she feels a cold, almost clinical detachment as she manipulates her granddaughter, viewing livilla's indiscretion not with moral outrage,", "as a strategic opportunity to assert control and further her own dynastic agenda."],
        ap.active_plans = ["To immediately establish her dominance and superior knowledge in the encounter with Livilla, ensuring Livilla understands the power dynamic.", "To extract a full confession from Livilla regarding her affair with Postumus Agrippa, confirming her own intelligence and breaking Livilla's initial denial.", "To subtly transition from accusation to manipulation, guiding Livilla towards becoming a willing participant in Livia's larger political schemes, leveraging Livilla's fear and desire for forgiveness."],
        ap.beliefs = ["She believes in her own absolute authority and omniscience within her family and the Roman court, confident that nothing escapes her notice.", "She firmly believes that maintaining stability and order in Rome requires unwavering control and the ruthless elimination of any perceived threats to her dynastic ambitions.", "She believes that familial bonds are secondary to political expediency, viewing family members as instruments to be used and manipulated in the pursuit of power."],
        ap.goals = ["Short-term: To intimidate Livilla into submission and extract a truthful confession about her affair with Postumus.", "Medium-term: To leverage Livilla's vulnerability and guilt to ensure her unwavering loyalty and obedience in future schemes, transforming her into a reliable pawn.", "Ultimate: To solidify the succession of Tiberius and establish a lasting Julio-Claudian dynasty, securing her own enduring influence and legacy as the power behind the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Livilla enters Livia\'s chambers with visible nervousness, her initial tentative steps betraying her dread of the impending confrontation. She is physically present but positioned as subordinate to Livia, her movements hesitant and lacking their usual confident grace.  She stands before her grandmother, anxiously awaiting judgement, her posture reflecting a mixture of fear and apprehension.',
        ap.emotional_state = 'Livilla outwardly displays a facade of nervous innocence and feigned confusion, attempting to deflect Livia\'s accusations with protestations of misunderstanding. However, beneath this surface, she is gripped by fear and panic. Her initial playful anticipation of seeing her grandmother has been completely shattered by the chilling directness of Livia\'s accusation.  She is internally torn between her desire to deny the affair and the growing terror of Livia\'s inescapable knowledge, realizing the precariousness of her situation and the potential for severe repercussions.',
        ap.emotional_tags = ["livilla outwardly displays a facade of nervous innocence", "feigned confusion, attempting to deflect livia's accusations with protestations of misunderstanding. however, beneath this surface, she is gripped by fear", "panic. her initial playful anticipation of seeing her grandmother has been completely shattered by the chilling directness of livia's accusation.  she is internally torn between her desire to deny the affair", "the growing terror of livia's inescapable knowledge, realizing the precariousness of her situation", "the potential for severe repercussions.", "livilla outwardly displays a facade of nervous innocence and feigned confusion", "attempting to deflect livia's accusations with protestations of misunderstanding. however", "beneath this surface", "she is gripped by fear and panic. her initial playful anticipation of seeing her grandmother has been completely shattered by the chilling directness of livia's accusation.  she is internally torn between her desire to deny the affair and the growing terror of livia's inescapable knowledge", "realizing the precariousness of her situation and the potential for severe repercussions."],
        ap.active_plans = ["To initially deny the accusations of infidelity, attempting to maintain a semblance of innocence and hoping to deflect Livia's anger.", "To quickly shift to pleas of remorse and promises of future obedience once her denial fails, seeking to evoke Livia's pity and avoid harsh punishment, such as being sent away.", "To attempt to gauge the true extent of Livia's knowledge and understanding of the situation, trying to ascertain the level of danger she is in and how best to navigate Livia's manipulation."],
        ap.beliefs = ["She believes in Livia's absolute power and influence within the family and the Roman court, understanding that her grandmother possesses near-omniscient knowledge and authority.", "She believes that her actions, particularly those that defy familial expectations or risk scandal, have significant consequences within the rigid structure of her family.", "She holds a naive belief in her own ability to manipulate situations and people with her charm and beauty, but this belief is rapidly eroding in the face of Livia's unflinching and direct confrontation."],
        ap.goals = ["Short-term: To immediately escape Livia's wrath and avoid any immediate punishment, particularly the dreaded prospect of being banished or disgraced.", "Medium-term: To regain Livia's favor and trust, attempting to repair the damage caused by her indiscretion and restore her position within the family's good graces.", "Ultimate: To navigate the treacherous dynamics of her family and ultimately leverage her position and beauty for her own ambitions within the Roman court, though in this moment, survival and damage control are her primary concerns."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livia sits regally in her opulent chambers, her posture a mix of authority and expectation as she interrogates Livilla. Her movements are deliberate, beckoning her granddaughter closer, her gestures cold yet commanding, embodying her role as the unforgiving matriarch of the Julio-Claudian dynasty.',
        ap.emotional_state = 'Livia exudes a chilling calmness, her surface demeanor unwavering as she challenges Livilla’s deception. Beneath this composed exterior, however, lies a fierce protectiveness over her family\'s legacy, and a ruthless determination to eliminate any threat to her ambitions, particularly regarding Postumus Agrippa.',
        ap.emotional_tags = ["livia exudes a chilling calmness, her surface demeanor unwavering as she challenges livilla\u2019s deception. beneath this composed exterior, however, lies a fierce protectiveness over her family's legacy,", "a ruthless determination to eliminate any threat to her ambitions, particularly regarding postumus agrippa.", "livia exudes a chilling calmness", "her surface demeanor unwavering as she challenges livilla\u2019s deception. beneath this composed exterior", "however", "lies a fierce protectiveness over her family's legacy", "and a ruthless determination to eliminate any threat to her ambitions", "particularly regarding postumus agrippa."],
        ap.active_plans = ["To extract a confession from Livilla regarding her affair with Postumus Agrippa.", "To assert her control over Livilla and instill a sense of fear that ensures loyalty.", "To manipulate the situation to further her own agenda regarding the succession of Tiberius."],
        ap.beliefs = ["The continuity of power must be maintained at all costs.", "Women are frail creatures who must be guided firmly to ensure loyalty and obedience.", "Only through decisive action can Rome's stability and her family's position be secured."],
        ap.goals = ["Short-term: To ensure Livilla feels the weight of Livia's authority and loyalty.", "Medium-term: To solidify Tiberius's position as the future emperor through Livilla's complicity.", "Ultimate: To eradicate any potential threat from Postumus and establish an unshakeable power structure for her family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livilla enters Livia\'s chambers looking anxious, her body language revealing a mix of tension and dread. She moves closer to Livia, desperately trying to defend herself against the accusations, her gestures erratic as she pleads for mercy, embodying a conflicted girl caught in a web of familial expectations and personal desires.',
        ap.emotional_state = 'Livilla\'s exterior displays panic and fear as she faces her grandmother\'s piercing gaze. Internally, she is terrified of the potential consequences of her actions and craves Livia\'s approval and protection. This internal conflict between her desires and her vulnerability creates a palpable tension as she sobs and pleads.',
        ap.emotional_tags = ["livilla's exterior displays panic", "fear as she faces her grandmother's piercing gaze. internally, she is terrified of the potential consequences of her actions", "craves livia's approval", "protection. this internal conflict between her desires", "her vulnerability creates a palpable tension as she sobs", "pleads.", "livilla's exterior displays panic and fear as she faces her grandmother's piercing gaze. internally", "she is terrified of the potential consequences of her actions and craves livia's approval and protection. this internal conflict between her desires and her vulnerability creates a palpable tension as she sobs and pleads."],
        ap.active_plans = ["To deny the allegations against her regarding her affair with Postumus.", "To evoke sympathy from Livia to avoid punishment and secure her place in the imperial court.", "To distance herself from the affair in hopes of reestablishing her standing with her family."],
        ap.beliefs = ["Family ties are essential for survival in the treacherous world of Roman politics.", "She must navigate her ambitions carefully to maintain favor with Livia.", "Her identity and worth are tied to her standing within the imperial court."],
        ap.goals = ["Short-term: To convince Livia of her innocence and avoid punishment.", "Medium-term: To gain Livia's support against potential exile or banishment.", "Ultimate: To secure her position within the family and avoid being a pawn in Livia's schemes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Livia remains seated in her richly adorned private chambers, a picture of imperial composure. Initially, she adopts a stern, inquisitorial posture, her gaze fixed intently on Livilla, probing for truth. As Livilla breaks down, Livia subtly shifts, beckoning her closer with a gesture that mixes authority with a veneer of intimacy. She observes Livilla\'s distress with a calculating eye, ready to exploit it.',
        ap.emotional_state = 'Beneath a facade of controlled displeasure and moral outrage at Livilla\'s supposed deceit, Livia is calculating and manipulative. Her initial sternness is a performance designed to intimidate Livilla into confession. Internally, she feels a cold satisfaction at uncovering Livilla\'s transgression, seeing it as leverage. As Livilla becomes vulnerable, Livia transitions to feigned sympathy, masking her underlying ambition and ruthless intent to use this situation to her advantage.',
        ap.emotional_tags = ["beneath a facade of controlled displeasure", "moral outrage at livilla's supposed deceit, livia is calculating", "manipulative. her initial sternness is a performance designed to intimidate livilla into confession. internally, she feels a cold satisfaction at uncovering livilla's transgression, seeing it as leverage. as livilla becomes vulnerable, livia transitions to feigned sympathy, masking her underlying ambition", "ruthless intent to use this situation to her advantage.", "beneath a facade of controlled displeasure and moral outrage at livilla's supposed deceit", "livia is calculating and manipulative. her initial sternness is a performance designed to intimidate livilla into confession. internally", "she feels a cold satisfaction at uncovering livilla's transgression", "seeing it as leverage. as livilla becomes vulnerable", "livia transitions to feigned sympathy", "masking her underlying ambition and ruthless intent to use this situation to her advantage."],
        ap.active_plans = ["To confirm Livilla's infidelity with Postumus Agrippa and use this information to exert control over her.", "To transition from a stern interrogator to a manipulative confidante, gaining Livilla's trust and making her pliable.", "To subtly guide the conversation towards the larger political context, specifically the issue of imperial succession and Livilla's role in securing it for Tiberius and his line."],
        ap.beliefs = ["Maintaining absolute control over her family is crucial for securing her political objectives and the stability of Rome.", "Emotional vulnerability in others is a weakness to be exploited for strategic advantage.", "Personal transgressions within the family can be effectively leveraged to achieve larger political aims."],
        ap.goals = ["Short-term: Extract a full confession and display of submission from Livilla in this chamber.", "Medium-term: Solidify her influence over Livilla, ensuring her granddaughter's compliance in future schemes.", "Ultimate: Secure the imperial succession for Tiberius, and by extension, for his son Castor, ensuring the long-term dominance of her lineage and preventing civil war."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Livilla enters Livia\'s chambers with visible anxiety, her movements hesitant and her voice trembling as she addresses her grandmother. Initially, she attempts to maintain a semblance of composure, denying the accusations leveled against her. However, as Livia\'s interrogation intensifies, Livilla\'s carefully constructed facade crumbles. She moves closer to Livia as beckoned, her posture shifting from defensive to pleading, culminating in a tearful breakdown as she confesses and begs for mercy.',
        ap.emotional_state = 'Livilla is consumed by a potent mix of fear and anxiety. Outwardly, she initially attempts denial, but her trembling voice and anxious demeanor betray her inner turmoil. Beneath the surface, terror dominates as she confronts the Empress\'s unwavering knowledge and implied threats. Her confession is driven by desperation to avoid severe punishment, particularly exile, revealing a deep-seated vulnerability and dependence on her grandmother\'s favor. As Livia softens her tone, Livilla clings to a fragile hope of redemption, her emotions swinging from terror to a desperate yearning for reassurance and forgiveness.',
        ap.emotional_tags = ["livilla is consumed by a potent mix of fear", "anxiety. outwardly, she initially attempts denial, but her trembling voice", "anxious demeanor betray her inner turmoil. beneath the surface, terror dominates as she confronts the empress's unwavering knowledge", "implied threats. her confession is driven by desperation to avoid severe punishment, particularly exile, revealing a deep-seated vulnerability", "dependence on her grandmother's favor. as livia softens her tone, livilla clings to a fragile hope of redemption, her emotions swinging from terror to a desperate yearning for reassurance", "forgiveness.", "livilla is consumed by a potent mix of fear and anxiety. outwardly", "she initially attempts denial", "but her trembling voice and anxious demeanor betray her inner turmoil. beneath the surface", "terror dominates as she confronts the empress's unwavering knowledge and implied threats. her confession is driven by desperation to avoid severe punishment", "particularly exile", "revealing a deep-seated vulnerability and dependence on her grandmother's favor. as livia softens her tone", "livilla clings to a fragile hope of redemption", "her emotions swinging from terror to a desperate yearning for reassurance and forgiveness.", "livilla is consumed by a potent mix of fear and anxiety. outwardly, she initially attempts denial,", "her trembling voice and anxious demeanor betray her inner turmoil. beneath the surface, terror dominates as she confronts the empress's unwavering knowledge and implied threats. her confession is driven by desperation to avoid severe punishment, particularly exile, revealing a deep-seated vulnerability and dependence on her grandmother's favor. as livia softens her tone, livilla clings to a fragile hope of redemption, her emotions swinging from terror to a desperate yearning for reassurance and forgiveness."],
        ap.active_plans = ["Initially, to deny any wrongdoing and deceive Livia about her relationship with Postumus Agrippa.", "Upon realizing denial is futile, to confess and plead for leniency, focusing on avoiding exile and Augustus's wrath.", "To regain Livia's favor and trust by expressing remorse and promising future obedience, seeking to re-establish her position within the family."],
        ap.beliefs = ["Livia possesses an almost omniscient level of awareness and control within the Roman court.", "Disobeying Livia or incurring her displeasure carries severe and potentially irreversible consequences.", "Her survival and social standing are entirely dependent on maintaining the favor of powerful family members, particularly Livia and Augustus."],
        ap.goals = ["Short-term: Escape immediate punishment and avoid being reported to Augustus in this encounter with Livia.", "Medium-term: Rebuild her relationship with Livia and regain her grandmother's trust to secure her future within the family.", "Ultimate: Maintain her privileged position and social standing within the Julio-Claudian dynasty, ensuring her personal comfort and influence, even if it means aligning with Livia's schemes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Livia sits composed in her richly decorated chambers, her posture regal and assured, as she beckons Livilla closer. Her gestures are deliberate, conveying both authority and a feigned intimacy, as she shifts the conversation from her granddaughter\'s indiscretion to the broader political landscape of Rome.',
        ap.emotional_state = 'Livia outwardly presents a calm and calculated demeanor, her voice smooth and authoritative, yet beneath this facade lies a simmering ambition and an unyielding determination. She masks her manipulative intentions with the guise of maternal concern, creating an unsettling mix of warmth and cold steel in her interactions with Livilla.',
        ap.emotional_tags = ["livia outwardly presents a calm", "calculated demeanor, her voice smooth", "authoritative, yet beneath this facade lies a simmering ambition", "an unyielding determination. she masks her manipulative intentions with the guise of maternal concern, creating an unsettling mix of warmth", "cold steel in her interactions with livilla.", "livia outwardly presents a calm and calculated demeanor", "her voice smooth and authoritative", "yet beneath this facade lies a simmering ambition and an unyielding determination. she masks her manipulative intentions with the guise of maternal concern", "creating an unsettling mix of warmth and cold steel in her interactions with livilla."],
        ap.active_plans = ["To manipulate Livilla's fears and desires to ensure her compliance in Livia's political machinations.", "To frame the narrative of succession as a matter of Roman stability, thus justifying her ambitions.", "To prepare Livilla for a role in securing Tiberius's ascendance, thereby solidifying her own power."],
        ap.beliefs = ["Only a single hand at the helm can prevent civil war, reflecting her conviction that centralized power is essential.", "Women, seen as frail and easily manipulated, can be powerful players when guided correctly in the political arena.", "Family loyalty is secondary to political ambition and the preservation of the dynasty's power."],
        ap.goals = ["Short-term: To quell Livilla's anxiety and gain her trust.", "Medium-term: To secure Tiberius's succession as Emperor, establishing a clear line of authority in Rome.", "Ultimate: To maintain her own control over the imperial family and prevent any potential rivals from rising against her."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Livilla enters Livia\'s chambers with an anxious demeanor, her posture slightly hunched, reflecting her nervousness. She moves closer to Livia as instructed, fidgeting with her hands, a clear display of her discomfort and fear of her grandmother\'s wrath.',
        ap.emotional_state = 'Livilla\'s surface emotions reveal a mixture of fear and desperation as she pleads for her grandmother\'s understanding. Internally, she feels a profound conflict between her desires and the consequences of her actions. She grapples with a sense of vulnerability, fearing the repercussions of Livia\'s knowledge and authority.',
        ap.emotional_tags = ["livilla's surface emotions reveal a mixture of fear", "desperation as she pleads for her grandmother's understanding. internally, she feels a profound conflict between her desires", "the consequences of her actions. she grapples with a sense of vulnerability, fearing the repercussions of livia's knowledge", "authority.", "livilla's surface emotions reveal a mixture of fear and desperation as she pleads for her grandmother's understanding. internally", "she feels a profound conflict between her desires and the consequences of her actions. she grapples with a sense of vulnerability", "fearing the repercussions of livia's knowledge and authority."],
        ap.active_plans = ["To convince Livia of her remorse and avoid punishment for her perceived transgressions.", "To seek her grandmother\u2019s protection and favor, hoping to navigate the dangerous family dynamics.", "To distance herself from Postumus while grappling with her own emotions and desires regarding him."],
        ap.beliefs = ["Loyalty to family must come with understanding and protection, especially when facing potential threats.", "Her worth is tied to her beauty and ability to navigate the treacherous court, and failure to do so could lead to her downfall.", "The political landscape is fraught with danger, and survival depends on securing alliances with powerful figures like Livia."],
        ap.goals = ["Short-term: To alleviate Livia's anger and secure her place in the family without punishment.", "Medium-term: To avoid the fate of her Aunt Julia and remain within the imperial fold.", "Ultimate: To help her husband, if he becomes Emperor, while navigating the complex currents of ambition and loyalty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Empress Livia sits regally in her private chambers, surrounded by the trappings of imperial power and soft lamplight. She is in a position of dominance, calmly observing Livilla\'s entrance and anxieties, her posture exuding an almost unnerving stillness as she prepares to dissect her granddaughter\'s indiscretions.',
        ap.emotional_state = 'Livia projects an outward veneer of composed authority and icy control, her tone measured and deliberate. Beneath this surface, she is intensely calculating and strategically focused, her emotions subordinated to her political objectives. While she feigns a semblance of grandmotherly concern, her primary drive is ruthless ambition, and her internal state is one of cold determination to manipulate Livilla into serving her grand design.',
        ap.emotional_tags = ["livia projects an outward veneer of composed authority", "icy control, her tone measured", "deliberate. beneath this surface, she is intensely calculating", "strategically focused, her emotions subordinated to her political objectives. while she feigns a semblance of grandmotherly concern, her primary drive is ruthless ambition,", "her internal state is one of cold determination to manipulate livilla into serving her grand design.", "livia projects an outward veneer of composed authority and icy control", "her tone measured and deliberate. beneath this surface", "she is intensely calculating and strategically focused", "her emotions subordinated to her political objectives. while she feigns a semblance of grandmotherly concern", "her primary drive is ruthless ambition", "and her internal state is one of cold determination to manipulate livilla into serving her grand design."],
        ap.active_plans = ["To extract a confession from Livilla regarding her relationship with Postumus.", "To assess Livilla's usefulness and malleability in her succession plans.", "To subtly threaten Livilla with the consequences of disobedience, mirroring Julia's fate, thereby ensuring her compliance and silence."],
        ap.beliefs = ["Unwavering control and absolute power are essential for maintaining stability in Rome.", "Family members are tools to be strategically employed or discarded to achieve dynastic goals.", "Tiberius's ascension to Emperor is divinely ordained and crucial for Rome's future."],
        ap.goals = ["Short-term: To intimidate Livilla into revealing the full extent of her involvement with Postumus and secure her vow of obedience.", "Medium-term: To neutralize Postumus as a threat to Tiberius's succession, potentially by using Livilla's entanglement to her advantage.", "Ultimate: To ensure a smooth transition of power to Tiberius, securing her family's dynasty and preventing civil war at all costs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Livilla enters Livia\'s chambers with visible anxiety, her movements hesitant and her eyes darting around the opulent room. She is summoned and immediately on the defensive, attempting to navigate the treacherous terrain of her grandmother\'s displeasure, her physical presence reflecting her inner turmoil and vulnerability.',
        ap.emotional_state = 'Livilla is a whirlwind of surface emotions: initially nervous and defensive, quickly shifting to pleading and tearful as Livia\'s interrogation intensifies. Beneath this outward display of distress lies a core of fear and self-preservation. She is internally conflicted, torn between her desire to avoid punishment and a dawning realization of the dangerous game she\'s been playing. Her unspoken conflict is the tension between her own desires and the crushing weight of her grandmother\'s expectations and power.',
        ap.emotional_tags = ["livilla is a whirlwind of surface emotions: initially nervous", "defensive, quickly shifting to pleading", "tearful as livia's interrogation intensifies. beneath this outward display of distress lies a core of fear", "self-preservation. she is internally conflicted, torn between her desire to avoid punishment", "a dawning realization of the dangerous game she's been playing. her unspoken conflict is the tension between her own desires", "the crushing weight of her grandmother's expectations", "power.", "livilla is a whirlwind of surface emotions: initially nervous and defensive", "quickly shifting to pleading and tearful as livia's interrogation intensifies. beneath this outward display of distress lies a core of fear and self-preservation. she is internally conflicted", "torn between her desire to avoid punishment and a dawning realization of the dangerous game she's been playing. her unspoken conflict is the tension between her own desires and the crushing weight of her grandmother's expectations and power."],
        ap.active_plans = ["Initially, to deny any wrongdoing and deflect Livia's accusations.", "To gauge the extent of Livia's knowledge and adjust her strategy accordingly, moving from denial to pleading.", "To evoke Livia's sympathy and avoid severe punishment, particularly being sent away from Rome and Augustus's favor."],
        ap.beliefs = ["Her grandmother, Livia, possesses immense power and omniscience within the imperial family.", "Her beauty and ability to manipulate men are valuable assets, but insufficient against Livia's scrutiny.", "Maintaining her position within the family and avoiding disgrace are paramount for her survival and social standing."],
        ap.goals = ["Short-term: To convince Livia of her remorse and secure a promise that Augustus will not be informed of her indiscretions.", "Medium-term: To regain Livia's trust and favor by demonstrating her willingness to cooperate with her schemes, whatever they may be.", "Ultimate: To navigate the treacherous waters of imperial politics and maintain her privileged position, even if it means sacrificing personal desires and aligning with Livia's ruthless agenda."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_roman_eagles_event_6_1'})
    ON CREATE SET
        oi.description = 'The loss of the Roman eagles is a focal point of AUGUSTUS\'s fury, representing not just a military failure but a blow to Roman pride and authority. His repeated mentions of the eagles highlight their symbolic significance as standards of honor and imperial power, stirring urgency for their recovery.',
        oi.status_before = 'The Roman eagles were lost during military engagements with the Germanic tribes, now captured and held as trophies by the enemy, symbolizing a major setback for Roman prestige.',
        oi.status_after = 'AUGUSTUS\'s resolve to retrieve the Roman eagles remains unfulfilled by the end of the event, his anger undiminished and the eagles still absent, increasing the pressure on his generals.'
    WITH oi
    MATCH (o:Object {uuid: 'object_roman_eagles'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_map_table_event_6_1'})
    ON CREATE SET
        oi.description = 'The map table serves as a strategic centerpiece in the Imperial Council Chamber, where AUGUSTUS\'s plans and frustrations coalesce. It is used to discuss military strategy, showcasing the geographic context of the Rhine and the significance of the lost eagles, emphasizing the urgency of military action.',
        oi.status_before = 'The map table is clean and ready for discussions, holding maps and documents that illustrate Roman territories and military campaigns, signifying the empire\'s ambitions.',
        oi.status_after = 'The map table remains central to the discussions, now marked by the tensions of AUGUSTUS\'s frustration and strategic planning, hinting at future military endeavors.'
    WITH oi
    MATCH (o:Object {uuid: 'object_map_table'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_biography_event_6_6'})
    ON CREATE SET
        oi.description = 'The scroll containing Claudius\'s biography is presented by Livia to Augustus as tangible proof of Claudius\'s subversive nature. Livia uses it as a prop to underscore her concerns about Claudius’s loyalty and to manipulate Augustus\'s perception of his grandson. She reads from it to highlight its praise of republican ideals, framing it as a direct challenge to the imperial regime and thus justifying its immediate destruction. The scroll becomes a symbol of suppressed narratives and Livia’s control over the imperial family\'s image.',
        oi.status_before = 'The scroll is a recently completed manuscript, secretly written by Claudius and discovered by Antonia. It is in Livia\'s possession, having been brought to her attention as a potential threat. Before this event, its existence was unknown to Augustus, representing a hidden intellectual endeavor of Claudius.',
        oi.status_after = 'Following Livia’s pronouncement of intent to destroy it, the scroll’s fate is effectively sealed. It is no longer a private manuscript but an object condemned for its subversive content. Its status shifts from a piece of writing to a symbol of imperial censorship and control. While not explicitly destroyed within this scene, the clear implication is that Livia will ensure its destruction, removing it from circulation and preventing its potentially dissenting message from spreading.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll_biography'})
    MATCH (e:Event {uuid: 'event_6_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_seat_games_box_event_6_7'})
    ON CREATE SET
        oi.description = 'The seat in the Games Box is discussed as a point of contention between Augustus and Livia. It symbolizes Claudius\'s marginal status within the imperial family, highlighting the tension between familial obligations and the public spectacle of the Games. Livia insists on Claudius\'s inclusion, arguing for his visibility despite Augustus\'s reluctance.',
        oi.status_before = 'The seat is reserved for Claudius, reflecting his betrothal and familial ties, but is also a representation of his outsider status in the family hierarchy.',
        oi.status_after = 'The seat remains allocated for Claudius, with Livia\'s insistence solidifying its importance in the public eye, though the dynamics surrounding it are still fraught with tension and uncertainty.'
    WITH oi
    MATCH (o:Object {uuid: 'object_seat_games_box'})
    MATCH (e:Event {uuid: 'event_6_7'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_betrothal_agreement_event_6_8'})
    ON CREATE SET
        oi.description = 'The betrothal agreement is invoked by Livia as the definitive justification for Claudius\'s impending marriage. When Augustus questions the suitability and timing of the marriage, Livia firmly references the six-year-old agreement, emphasizing its binding nature and pre-arranged status. This object is not physically present but its existence and authority are central to the conversation, effectively shutting down any further debate from Augustus. It functions as a narrative device to highlight Livia\'s control and the rigid expectations placed upon Claudius, showcasing the impersonal and duty-bound nature of aristocratic marriages within the Julio-Claudian dynasty. The agreement underscores the lack of agency for Claudius and his betrothed in this crucial life decision.',
        oi.status_before = 'The betrothal agreement exists as a legally binding document, likely stored among family records. It represents a long-standing arrangement initiated and controlled by Livia, signifying a pre-determined future for Claudius and his betrothed. It is a static object, representing a fixed plan for the family.',
        oi.status_after = 'The betrothal agreement\'s status is reinforced and solidified. Livia\'s explicit mention of it reaffirms its authority and immutability within the context of the family\'s plans. It remains unchanged physically, but its narrative weight is amplified, further emphasizing its role in dictating Claudius\'s future and Livia\'s unwavering control over family affairs. The agreement continues to be a symbol of pre-ordained duty and dynastic imperatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object_betrothal_agreement'})
    MATCH (e:Event {uuid: 'event_6_8'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS paces restlessly in the Imperial Council Chamber, his movements sharp and agitated. He gestures emphatically, emphasizing his frustration as he speaks about Quinctilius Varus, revealing his desperation for action. The imposing columns around him mirror his grand expectations for military prowess, yet his frustration is palpable.',
        ap.emotional_state = 'AUGUSTUS\'s outer demeanor radiates fury and impatience, his brows furrowed and voice raised with indignation. Internally, he wrestles with feelings of inadequacy and vulnerability, fearing that the empire\'s strength is waning due to inaction. The tension manifests in harsh words directed at Varus, revealing his deep concern for the empire\'s reputation and safety.',
        ap.emotional_tags = ["augustus's outer demeanor radiates fury", "impatience, his brows furrowed", "voice raised with indignation. internally, he wrestles with feelings of inadequacy", "vulnerability, fearing that the empire's strength is waning due to inaction. the tension manifests in harsh words directed at varus, revealing his deep concern for the empire's reputation", "safety.", "augustus's outer demeanor radiates fury and impatience", "his brows furrowed and voice raised with indignation. internally", "he wrestles with feelings of inadequacy and vulnerability", "fearing that the empire's strength is waning due to inaction. the tension manifests in harsh words directed at varus", "revealing his deep concern for the empire's reputation and safety."],
        ap.active_plans = ["Demand immediate action from Quinctilius Varus to reclaim the lost eagles.", "Consider sending Postumus Agrippa to reinforce Varus and exert control over the situation.", "Reassert his authority as the military decision-maker, ensuring that his commands are respected."],
        ap.beliefs = ["Military success is essential for maintaining the empire's image and his own authority.", "Caution in military matters can be perceived as weakness, undermining his leadership.", "Loyalty and action are paramount virtues in a general; inaction is unacceptable."],
        ap.goals = ["Short-term: Retrieve the lost Roman eagles to restore Roman honor.", "Medium-term: Reinforce his military commands to ensure obedience and respect from his generals.", "Ultimate: Maintain and solidify his power as Emperor of Rome amidst rising tensions and challenges."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands with composed stillness near the map table, a stark contrast to Augustus\'s agitated pacing. She observes his outburst with a detached air, her body language suggesting control and calculation. When she speaks, it is with measured tones and deliberate gestures, each word carefully chosen to navigate Augustus\'s volatile temper and guide the conversation towards her desired outcome.',
        ap.emotional_state = 'On the surface, Livia projects an image of serene composure, her voice calm and even, betraying no outward frustration with Augustus\'s tantrum. However, beneath this placid exterior lies a complex mix of emotions. She is likely annoyed by Augustus\'s irrationality and impatience, yet simultaneously resolute in her strategic objectives. There\'s a subtle undercurrent of controlled impatience, masked by her practiced facade of imperial calm, as she manipulates the situation to her advantage.',
        ap.emotional_tags = ["on the surface, livia projects an image of serene composure, her voice calm", "even, betraying no outward frustration with augustus's tantrum. however, beneath this placid exterior lies a complex mix of emotions. she is likely annoyed by augustus's irrationality", "impatience, yet simultaneously resolute in her strategic objectives. there's a subtle undercurrent of controlled impatience, masked by her practiced facade of imperial calm, as she manipulates the situation to her advantage.", "on the surface", "livia projects an image of serene composure", "her voice calm and even", "betraying no outward frustration with augustus's tantrum. however", "beneath this placid exterior lies a complex mix of emotions. she is likely annoyed by augustus's irrationality and impatience", "yet simultaneously resolute in her strategic objectives. there's a subtle undercurrent of controlled impatience", "masked by her practiced facade of imperial calm", "as she manipulates the situation to her advantage."],
        ap.active_plans = ["To de-escalate Augustus's immediate fury and prevent him from making an impulsive decision to send Postumus to the Rhine.", "To subtly guide Augustus towards choosing Germanicus as the commander, thereby avoiding potential conflict between Tiberius and Postumus and maintaining Tiberius's authority.", "To reinforce her image as the voice of reason and strategic wisdom in Augustus's ear, subtly strengthening her influence over imperial decisions."],
        ap.beliefs = ["Tiberius is the most capable and suitable heir to Augustus and must be protected from any perceived slights or challenges to his authority.", "Postumus is a volatile and unpredictable element, posing a threat to the stability of the succession and should not be given any significant military command.", "Reason and calculated strategy are more effective tools for maintaining power and achieving political objectives than emotional outbursts and rash decisions."],
        ap.goals = ["{type: short-term, objective: Calm Augustus down in this immediate confrontation and prevent him from sending Postumus to the Rhine.}", "{type: medium-term, objective: Ensure Tiberius's successful handling of the Germanian situation, bolstering his military reputation and solidifying his position as Augustus's favored heir.}", "{type: ultimate, objective: Secure Tiberius's smooth and unchallenged succession to the imperial throne, solidifying her own enduring power and influence within the Julio-Claudian dynasty.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS paces angrily, his posture tense and dynamic, embodying a mixture of frustration and authority. His gestures are emphatic as he emphasizes key points with sharp movements of his hands, often pointing to the map table as if to underline his strategic frustrations.',
        ap.emotional_state = 'AUGUSTUS\'s surface emotions reveal deep-seated anger and impatience, his tone sharp and commanding as he criticizes Tiberius\'s caution. However, beneath this fury lies insecurity over his commands being openly questioned, and a growing paranoia regarding his legacy, fueled by fears of military failures.',
        ap.emotional_tags = ["augustus's surface emotions reveal deep-seated anger", "impatience, his tone sharp", "commanding as he criticizes tiberius's caution. however, beneath this fury lies insecurity over his commands being openly questioned,", "a growing paranoia regarding his legacy, fueled by fears of military failures.", "augustus's surface emotions reveal deep-seated anger and impatience", "his tone sharp and commanding as he criticizes tiberius's caution. however", "beneath this fury lies insecurity over his commands being openly questioned", "and a growing paranoia regarding his legacy", "fueled by fears of military failures."],
        ap.active_plans = ["To assert his authority by sending Postumus to the Rhine, believing it will strengthen military resolve.", "To reclaim the lost Roman Eagles, viewing this as essential for restoring his power and reputation.", "To re-establish confidence in military leadership by confronting perceived cowardice from Tiberius."],
        ap.beliefs = ["He believes that decisive action is necessary to maintain the strength of Rome and his legacy.", "He holds that military leaders must take risks, seeing caution as synonymous with weakness.", "He is convinced that family dynamics should not interfere with military decisions, despite personal loyalties."],
        ap.goals = ["Short-term: To send immediate reinforcements to the Rhine to reclaim the Eagles.", "Medium-term: To restore his reputation as a strong and effective leader in the eyes of both his family and the Senate.", "Ultimate: To solidify his legacy and maintain the stability of his reign against internal and external threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'})
    ON CREATE SET
        ap.current_status = 'LIVIA stands poised and calm, her posture unwavering as she observes AUGUSTUS with a measured gaze. She remains composed throughout the heated exchange, occasionally gesturing towards the map table to redirect the conversation strategically, maintaining an air of authority.',
        ap.emotional_state = 'LIVIA\'s surface demeanor is serene, yet her eyes betray a calculating intensity, reflecting her internal conflict as she navigates AUGUSTUS\'s fury. She feels a mix of maternal protection for both Tiberius and Postumus, yet is driven by her ambition to manipulate the situation to her advantage.',
        ap.emotional_tags = ["livia's surface demeanor is serene, yet her eyes betray a calculating intensity, reflecting her internal conflict as she navigates augustus's fury. she feels a mix of maternal protection for both tiberius", "postumus, yet is driven by her ambition to manipulate the situation to her advantage.", "livia's surface demeanor is serene", "yet her eyes betray a calculating intensity", "reflecting her internal conflict as she navigates augustus's fury. she feels a mix of maternal protection for both tiberius and postumus", "yet is driven by her ambition to manipulate the situation to her advantage."],
        ap.active_plans = ["To undermine AUGUSTUS's decision to send Postumus, wishing to protect her son's precarious position.", "To advocate for sending Germanicus instead, believing it would mitigate familial tensions.", "To maintain her influence over AUGUSTUS by controlling the narrative surrounding military commands."],
        ap.beliefs = ["She believes that the unpredictability of Postumus could jeopardize military operations.", "She holds that maintaining family harmony is crucial for political stability, especially concerning Tiberius and Postumus.", "She is convinced that her strategic insights are essential for guiding AUGUSTUS's decisions, even if it means challenging his authority."],
        ap.goals = ["Short-term: To prevent the sending of Postumus to the Rhine, which she sees as a tactical error.", "Medium-term: To position Germanicus favorably within the military hierarchy and maintain peace within the family.", "Ultimate: To secure her son Tiberius's ascension to the throne while subtly managing the dynamics of power within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands with poised stillness near the map table, a stark contrast to Augustus\'s agitated pacing. Her body language is controlled, almost serene, as she observes her husband\'s outburst with a calculating gaze. She offers subtle nods to servants and maintains a measured tone, projecting an image of calm authority amidst the Emperor\'s fury. Her physical presence is a study in composure, a silent counterpoint to the rising tension in the room.',
        ap.emotional_state = 'Livia presents an outward façade of calm reason, a soothing counterpoint to Augustus\'s volcanic temper. However, beneath this placid surface, her mind is a whirlwind of strategic calculation. She is deeply attuned to the power dynamics at play, her emotions carefully masked by icy pragmatism. There is a palpable tension between her outwardly supportive demeanor and her manipulative intent to steer Augustus\'s decisions to her advantage, securing Tiberius\'s path to power.',
        ap.emotional_tags = ["livia presents an outward fa\u00e7ade of calm reason, a soothing counterpoint to augustus's volcanic temper. however, beneath this placid surface, her mind is a whirlwind of strategic calculation. she is deeply attuned to the power dynamics at play, her emotions carefully masked by icy pragmatism. there is a palpable tension between her outwardly supportive demeanor", "her manipulative intent to steer augustus's decisions to her advantage, securing tiberius's path to power.", "livia presents an outward fa\u00e7ade of calm reason", "a soothing counterpoint to augustus's volcanic temper. however", "beneath this placid surface", "her mind is a whirlwind of strategic calculation. she is deeply attuned to the power dynamics at play", "her emotions carefully masked by icy pragmatism. there is a palpable tension between her outwardly supportive demeanor and her manipulative intent to steer augustus's decisions to her advantage", "securing tiberius's path to power."],
        ap.active_plans = ["Calm Augustus's immediate fury and redirect his focus from Tiberius's perceived inaction.", "Subtly undermine Postumus's standing in Augustus's eyes, portraying him as unsuitable for command.", "Advocate for Germanicus as the more 'sensible' choice, thereby maintaining a degree of influence over military appointments while appearing to defer to Augustus's authority."],
        ap.beliefs = ["Tiberius is the only suitable heir to Augustus and must be protected at all costs.", "Postumus is a volatile threat to the stability of the dynasty and must be kept away from positions of power.", "Her own judgment and strategic acumen are superior to Augustus's increasingly erratic decisions, especially when it comes to securing the succession."],
        ap.goals = ["goals\": [\n          \"**Short-term**: Defuse Augustus's immediate anger and prevent him from making impulsive decisions regarding Postumus.", "**Medium-term**: Solidify Tiberius's position as the unquestioned successor and neutralize any potential rivals or threats to his claim.", "**Ultimate**: Ensure the continuation of the Julio-Claudian dynasty under her and Tiberius's firm control, safeguarding her family's power for generations to come."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS paces the chamber, his broad shoulders tense and his hands gesturing emphatically as he expresses his frustration over the military inaction of his commanders. His posture is rigid, embodying the fury and impatience that churns within him as he debates the strategic failings in the campaign.',
        ap.emotional_state = 'Outwardly, AUGUSTUS displays anger and irritation, his voice rising as he articulates his grievances. Internally, however, there is a simmering anxiety fueled by the potential repercussions of military failures, which threatens his authority and the stability of his reign. The clash between his desire for decisive action and his duty to maintain control creates a palpable tension.',
        ap.emotional_tags = ["outwardly, augustus displays anger", "irritation, his voice rising as he articulates his grievances. internally, however, there is a simmering anxiety fueled by the potential repercussions of military failures, which threatens his authority", "the stability of his reign. the clash between his desire for decisive action", "his duty to maintain control creates a palpable tension.", "outwardly", "augustus displays anger and irritation", "his voice rising as he articulates his grievances. internally", "however", "there is a simmering anxiety fueled by the potential repercussions of military failures", "which threatens his authority and the stability of his reign. the clash between his desire for decisive action and his duty to maintain control creates a palpable tension."],
        ap.active_plans = ["Retrieve the lost Roman eagles to restore military honor and personal pride.", "Assert his authority by making military decisions regarding troop deployments.", "Navigate the political landscape of his family dynamics, particularly concerning Tiberius and Postumus."],
        ap.beliefs = ["Military success is paramount for the stability of his regime and personal pride.", "Decisiveness is essential in leadership, especially in times of crisis.", "Family loyalty must align with military responsibilities; failure to act risks familial and imperial chaos."],
        ap.goals = ["Short-term: Expedite the retrieval of the lost eagles from the Rhine.", "Medium-term: Strengthen his military command by demonstrating effective leadership.", "Ultimate: Secure his legacy as a capable and powerful emperor in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_5'})
    ON CREATE SET
        ap.current_status = 'LIVIA stands near the map table, her arms crossed and her expression calm yet calculating as she observes AUGUSTUS\'s volatile reactions. She maintains a composed demeanor, using her body language to project authority and influence while subtly guiding the conversation.',
        ap.emotional_state = 'LIVIA appears unflappable on the surface, displaying a cool confidence in her dialogue with AUGUSTUS. Internally, she feels a complex mix of determination and concern, as her ambitions clash with the volatile emotions of her husband. She subtly manipulates the conversation to align with her goals, all while masking her true intentions.',
        ap.emotional_tags = ["livia appears unflappable on the surface, displaying a cool confidence in her dialogue with augustus. internally, she feels a complex mix of determination", "concern, as her ambitions clash with the volatile emotions of her husband. she subtly manipulates the conversation to align with her goals, all while masking her true intentions.", "livia appears unflappable on the surface", "displaying a cool confidence in her dialogue with augustus. internally", "she feels a complex mix of determination and concern", "as her ambitions clash with the volatile emotions of her husband. she subtly manipulates the conversation to align with her goals", "all while masking her true intentions.", "livia appears unflappable on the surface, displaying a cool confidence in her dialogue with augustus. internally, she feels a complex mix of determination and concern, as her ambitions clash with the volatile emotions of her husband. she subtly manipulates the conversation to align with her goals, all", "masking her true intentions."],
        ap.active_plans = ["Discredit POSTUMUS as a military leader to ensure Tiberius's position remains secure.", "Influence AUGUSTUS's decision-making to align with her vision for the family's power dynamics.", "Protect her son Germanicus while ensuring that AUGUSTUS remains focused on the larger military picture."],
        ap.beliefs = ["Maintaining control over family dynamics is essential for her power.", "Caution in military affairs is critical for preserving lives and political favor.", "The perception of loyalty and capability within the family must be carefully managed to prevent rivalries."],
        ap.goals = ["Short-term: Manipulate AUGUSTUS into sending Germanicus instead of Postumus.", "Medium-term: Strengthen Tiberius's position while mitigating risks to her family's power.", "Ultimate: Secure a stable legacy for her son Tiberius as the future emperor of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_6'})
    ON CREATE SET
        ap.current_status = 'Livia stands calmly near the map table, observing Augustus’s agitated pacing across the council chamber. She remains physically composed, her posture still and controlled as she listens to Augustus vent his fury about Tiberius. With subtle gestures, like a barely perceptible nod to a servant, she manages the flow of the room and the conversation, maintaining an air of collected authority amidst the Emperor\'s outburst.',
        ap.emotional_state = 'Livia outwardly projects an image of serene composure and reasoned patience, a stark contrast to Augustus\'s volatile temper. Beneath this placid surface, she is calculating and subtly manipulative, using the discovery of Claudius’s biography as a strategic tool. She feels a controlled annoyance at Augustus’s emotional outbursts but is also driven by her unwavering ambition to secure Tiberius\'s succession, viewing any challenge to the imperial narrative as a threat to be neutralized swiftly.',
        ap.emotional_tags = ["livia outwardly projects an image of serene composure", "reasoned patience, a stark contrast to augustus's volatile temper. beneath this placid surface, she is calculating", "subtly manipulative, using the discovery of claudius\u2019s biography as a strategic tool. she feels a controlled annoyance at augustus\u2019s emotional outbursts but is also driven by her unwavering ambition to secure tiberius's succession, viewing any challenge to the imperial narrative as a threat to be neutralized swiftly.", "livia outwardly projects an image of serene composure and reasoned patience", "a stark contrast to augustus's volatile temper. beneath this placid surface", "she is calculating and subtly manipulative", "using the discovery of claudius\u2019s biography as a strategic tool. she feels a controlled annoyance at augustus\u2019s emotional outbursts but is also driven by her unwavering ambition to secure tiberius's succession", "viewing any challenge to the imperial narrative as a threat to be neutralized swiftly.", "livia outwardly projects an image of serene composure and reasoned patience, a stark contrast to augustus's volatile temper. beneath this placid surface, she is calculating and subtly manipulative, using the discovery of claudius\u2019s biography as a strategic tool. she feels a controlled annoyance at augustus\u2019s emotional outbursts", "is also driven by her unwavering ambition to secure tiberius's succession, viewing any challenge to the imperial narrative as a threat to be neutralized swiftly."],
        ap.active_plans = ["Maintain her composed and strategic persona in front of Augustus, reinforcing her role as a calm advisor.", "Neutralize the perceived threat of Claudius's biography by having it destroyed, thus controlling the narrative.", "Subtly steer Augustus away from sending Postumus to Germania, advocating for Germanicus instead to avoid potential power clashes and maintain Tiberius's authority."],
        ap.beliefs = ["Unwavering loyalty to the imperial system and the absolute necessity of maintaining its power.", "The belief that any deviation from the officially sanctioned narrative is subversive and dangerous.", "A firm conviction in her own judgment and strategic abilities, especially concerning the succession of Tiberius."],
        ap.goals = ["goals\": [\n          \"Short-term: Ensure the immediate destruction of Claudius\u2019s biography and reinforce her control over information within the imperial household.", "Medium-term: Solidify Tiberius\u2019s position as the unquestioned heir and manage any potential rivals or sources of instability, like Postumus.", "Ultimate: Secure the long-term stability and dominance of the Julio-Claudian dynasty under Tiberius, ensuring her own enduring influence and legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_7'})
    ON CREATE SET
        ap.current_status = 'Livia stands near the map table, her posture straight and composed, observing Augustus\'s pacing with measured calm. She gestures subtly as she speaks, maintaining a poised demeanor even in the face of her husband\'s escalating fury.',
        ap.emotional_state = 'Livia presents a facade of tranquility, masking her internal resolve. While outwardly calm, she likely feels a mix of determination and frustration, battling against Augustus\'s aggressive decisions and the unpredictability of family dynamics. Beneath her composed exterior lies an awareness of the stakes involved, driving her to control the narrative.',
        ap.emotional_tags = ["livia presents a facade of tranquility, masking her internal resolve. while outwardly calm, she likely feels a mix of determination", "frustration, battling against augustus's aggressive decisions", "the unpredictability of family dynamics. beneath her composed exterior lies an awareness of the stakes involved, driving her to control the narrative.", "livia presents a facade of tranquility", "masking her internal resolve. while outwardly calm", "she likely feels a mix of determination and frustration", "battling against augustus's aggressive decisions and the unpredictability of family dynamics. beneath her composed exterior lies an awareness of the stakes involved", "driving her to control the narrative."],
        ap.active_plans = ["To persuade Augustus to reconsider sending Postumus to the Rhine, arguing for Germanicus instead.", "To protect Claudius from potential embarrassment or punishment regarding his biography, emphasizing his inclusion in the Games.", "To subtly manipulate Augustus's decisions and maintain her influence over military strategies."],
        ap.beliefs = ["Strongly believes in the necessity of strategic family alliances to maintain power.", "Holds that loyalty must be balanced with caution, especially regarding untested family members like Postumus.", "Views the family as a chessboard, where every piece must be moved with careful consideration."],
        ap.goals = ["Short-term: To ensure Claudius's presence in the imperial box at the Games.", "Medium-term: To secure a stable leadership structure that favors her son Tiberius over Postumus.", "Ultimate: To maintain and consolidate her family's power and influence within the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_7'})
    ON CREATE SET
        ap.current_status = 'Augustus paces the chamber with visible agitation, his hands gesturing emphatically as he expresses frustration over military decisions. He halts to face Livia, his brow furrowing as he grapples with the implications of her words.',
        ap.emotional_state = 'Augustus is brimming with anger and impatience, feeling the weight of failure regarding Varus and the lost eagles. Beneath his fury lies vulnerability, a fear of losing control and trust among his commanders, reflecting his struggle to reconcile authority with familial bonds.',
        ap.emotional_tags = ["augustus is brimming with anger", "impatience, feeling the weight of failure regarding varus", "the lost eagles. beneath his fury lies vulnerability, a fear of losing control", "trust among his commanders, reflecting his struggle to reconcile authority with familial bonds.", "augustus is brimming with anger and impatience", "feeling the weight of failure regarding varus and the lost eagles. beneath his fury lies vulnerability", "a fear of losing control and trust among his commanders", "reflecting his struggle to reconcile authority with familial bonds."],
        ap.active_plans = ["To demand immediate action from Varus regarding the retrieval of the lost eagles.", "To assert his authority by insisting on sending Postumus to the Rhine to support Varus.", "To establish a clear line of command and reinforce his role as the ultimate decision-maker in military matters."],
        ap.beliefs = ["Believes in the necessity of decisive action, especially in military contexts, to maintain Roman power.", "Feels that personal loyalty among family members should enhance military effectiveness.", "Holds a strong conviction that demonstrating strength is essential for maintaining respect both in his family and the empire."],
        ap.goals = ["Short-term: To retrieve the lost eagles and restore military honor.", "Medium-term: To assert authority and manage internal family rivalries effectively.", "Ultimate: To solidify his legacy and ensure the stability of the empire during his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_8'})
    ON CREATE SET
        ap.current_status = 'Livia stands calmly near the map table, observing Augustus\'s agitated pacing. She initiates the discussion about Claudius\'s marriage with a seemingly casual remark in response to Augustus\'s broader concerns. Her physical stillness contrasts sharply with Augustus\'s restless energy, underscoring her composed and controlling demeanor throughout the exchange. She maintains eye contact, subtly guiding the conversation back to her agenda.',
        ap.emotional_state = 'Livia projects an outward calm and collectedness, yet beneath the surface, she is subtly impatient and controlling. Her tone is dismissive when Augustus questions the marriage, betraying her irritation at his perceived interference in what she considers her domain. Internally, she is resolute in ensuring the marriage proceeds as planned, viewing it as a matter of strategic family arrangement rather than personal happiness. Her surface composure masks a steely determination to maintain her control over family matters.',
        ap.emotional_tags = ["livia projects an outward calm", "collectedness, yet beneath the surface, she is subtly impatient", "controlling. her tone is dismissive when augustus questions the marriage, betraying her irritation at his perceived interference in what she considers her domain. internally, she is resolute in ensuring the marriage proceeds as planned, viewing it as a matter of strategic family arrangement rather than personal happiness. her surface composure masks a steely determination to maintain her control over family matters.", "livia projects an outward calm and collectedness", "yet beneath the surface", "she is subtly impatient and controlling. her tone is dismissive when augustus questions the marriage", "betraying her irritation at his perceived interference in what she considers her domain. internally", "she is resolute in ensuring the marriage proceeds as planned", "viewing it as a matter of strategic family arrangement rather than personal happiness. her surface composure masks a steely determination to maintain her control over family matters."],
        ap.active_plans = ["To firmly dismiss any suggestion of delaying or reconsidering Claudius's marriage.", "To reassert her authority over family arrangements and decisions, subtly reminding Augustus of her long-standing control.", "To downplay any potential concerns about the bride's feelings or Claudius's suitability, focusing solely on the pre-arranged agreement."],
        ap.beliefs = ["Family matters, especially marriages of dynastic importance, are her responsibility and within her purview to manage.", "Emotional considerations are secondary to the strategic needs and pre-established agreements of the family.", "Augustus is becoming increasingly erratic and less capable of sound judgment, requiring her to maintain firm control."],
        ap.goals = ["short-term\": \"To shut down Augustus's questioning and ensure the conversation moves on.", "medium-term\": \"To finalize Claudius's marriage as scheduled, reinforcing family stability and her own authority.", "ultimate\": \"To solidify her family's power and ensure the smooth continuation of her dynastic plans, viewing Claudius's marriage as a piece in this larger strategic puzzle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_8'})
    ON CREATE SET
        ap.current_status = 'Augustus, initially pacing in fury about military matters, momentarily pauses as Livia redirects the conversation to Claudius\'s marriage prospects. He takes the scroll absently, his focus shifting but still retaining an undercurrent of irritability. He poses questions about the bride and Claudius\'s readiness, showing a fleeting, almost paternal concern amidst his imperial anxieties. However, his physical agitation and distracted manner reveal his deeper preoccupation with the military crisis and his waning patience.',
        ap.emotional_state = 'Augustus\'s primary emotion is still residual anger and frustration from the earlier discussion about Tiberius. When the topic shifts to Claudius\'s marriage, a flicker of concern and perhaps even pity surfaces, directed towards Claudius\'s unknown bride. However, this is quickly overshadowed by his underlying irritability and impatience with Livia\'s controlling nature. He feels a sense of detachment and weariness, as if even family matters are becoming another burden adding to his imperial woes. His questions are tinged with resignation, suggesting a passive acceptance of Livia\'s decisions.',
        ap.emotional_tags = ["augustus's primary emotion is still residual anger", "frustration from the earlier discussion about tiberius. when the topic shifts to claudius's marriage, a flicker of concern", "perhaps even pity surfaces, directed towards claudius's unknown bride. however, this is quickly overshadowed by his underlying irritability", "impatience with livia's controlling nature. he feels a sense of detachment", "weariness, as if even family matters are becoming another burden adding to his imperial woes. his questions are tinged with resignation, suggesting a passive acceptance of livia's decisions.", "augustus's primary emotion is still residual anger and frustration from the earlier discussion about tiberius. when the topic shifts to claudius's marriage", "a flicker of concern and perhaps even pity surfaces", "directed towards claudius's unknown bride. however", "this is quickly overshadowed by his underlying irritability and impatience with livia's controlling nature. he feels a sense of detachment and weariness", "as if even family matters are becoming another burden adding to his imperial woes. his questions are tinged with resignation", "suggesting a passive acceptance of livia's decisions."],
        ap.active_plans = ["To momentarily divert his attention from the pressing military crisis by engaging in a less emotionally charged topic.", "To voice a fleeting, perhaps performative, concern for Claudius's betrothed, showing a semblance of paternal interest.", "To subtly test the boundaries of his influence in family matters, though quickly backing down when faced with Livia's assertive control."],
        ap.beliefs = ["He is losing control over both the empire and his family, with Livia increasingly dictating terms.", "While dynastic marriages are important, there might be a human cost that he vaguely acknowledges but feels powerless to address.", "His opinions on family matters are becoming less relevant and are easily overridden by Livia's stronger will."],
        ap.goals = ["short-term\": \"To ask a few questions about Claudius's marriage, asserting a minimal level of paternal engagement.", "medium-term\": \"To avoid further conflict with Livia on this issue and defer to her judgment, prioritizing his energy for more pressing imperial matters.", "ultimate\": \"To maintain a semblance of order and stability in his family and the empire, even if it means relinquishing personal control to Livia's more decisive hand."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_9'})
    ON CREATE SET
        ap.current_status = 'Augustus paces the council chamber, his agitation palpable as he rants about the lack of action from Tiberius. His movements are sharp and erratic, with clenched fists and furrowed brows emphasizing his frustration. He gestures emphatically towards the map table, highlighting the strategic importance of the bridges over the Rhine and showcasing his deep anger over their perceived neglect.',
        ap.emotional_state = 'Augustus is engulfed in a tempest of fury and frustration. Outwardly, he displays anger, his voice rising as he lashes out at Tiberius’s caution, but beneath this surface lies a deeper worry about the empire\'s safety and legacy. His desperation reflects an anxiety about his own failures as a leader, revealing an internal conflict between his role as a ruler and the vulnerabilities his family faces.',
        ap.emotional_tags = ["augustus is engulfed in a tempest of fury", "frustration. outwardly, he displays anger, his voice rising as he lashes out at tiberius\u2019s caution, but beneath this surface lies a deeper worry about the empire's safety", "legacy. his desperation reflects an anxiety about his own failures as a leader, revealing an internal conflict between his role as a ruler", "the vulnerabilities his family faces.", "augustus is engulfed in a tempest of fury and frustration. outwardly", "he displays anger", "his voice rising as he lashes out at tiberius\u2019s caution", "but beneath this surface lies a deeper worry about the empire's safety and legacy. his desperation reflects an anxiety about his own failures as a leader", "revealing an internal conflict between his role as a ruler and the vulnerabilities his family faces.", "augustus is engulfed in a tempest of fury and frustration. outwardly, he displays anger, his voice rising as he lashes out at tiberius\u2019s caution,", "beneath this surface lies a deeper worry about the empire's safety and legacy. his desperation reflects an anxiety about his own failures as a leader, revealing an internal conflict between his role as a ruler and the vulnerabilities his family faces."],
        ap.active_plans = ["To confront Tiberius about his inaction and demand immediate military action to retrieve the lost eagles.", "To assert his authority over military decision-making, emphasizing his role as Emperor.", "To secure the loyalty of the legions by ensuring decisive action against the barbarians."],
        ap.beliefs = ["The emperor must maintain control and assert power to ensure the stability of Rome.", "Caution in military matters is a sign of weakness that can lead to disaster.", "Family loyalty should serve the greater good of the empire, even if it requires harsh decisions."],
        ap.goals = ["Short-term: To retrieve the lost Roman eagles and restore military honor.", "Medium-term: To assert and reinforce his authority over Tiberius and the military.", "Ultimate: To secure a lasting legacy that strengthens the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_9'})
    ON CREATE SET
        ap.current_status = 'Livia stands near the map table, observing Augustus with an air of calm authority. Her posture is relaxed, yet her gaze is piercing and vigilant as she listens to Augustus\'s rants. She interjects strategically, using measured tones and carefully chosen words to guide the conversation, maintaining control over the narrative as she defends her son\'s caution.',
        ap.emotional_state = 'Livia exhibits a composed exterior, but beneath lies a fierce determination to protect her family\'s interests. Outwardly, she remains calm even as Augustus\'s anger flares, signaling her ability to navigate tumultuous waters. Internally, however, she wrestles with the anxieties of power, the threat that Postumus’s unpredictability poses to her carefully arranged plans, and her need to keep Augustus\'s temper in check.',
        ap.emotional_tags = ["livia exhibits a composed exterior, but beneath lies a fierce determination to protect her family's interests. outwardly, she remains calm even as augustus's anger flares, signaling her ability to navigate tumultuous waters. internally, however, she wrestles with the anxieties of power, the threat that postumus\u2019s unpredictability poses to her carefully arranged plans,", "her need to keep augustus's temper in check.", "livia exhibits a composed exterior", "but beneath lies a fierce determination to protect her family's interests. outwardly", "she remains calm even as augustus's anger flares", "signaling her ability to navigate tumultuous waters. internally", "however", "she wrestles with the anxieties of power", "the threat that postumus\u2019s unpredictability poses to her carefully arranged plans", "and her need to keep augustus's temper in check.", "livia exhibits a composed exterior,", "beneath lies a fierce determination to protect her family's interests. outwardly, she remains calm even as augustus's anger flares, signaling her ability to navigate tumultuous waters. internally, however, she wrestles with the anxieties of power, the threat that postumus\u2019s unpredictability poses to her carefully arranged plans, and her need to keep augustus's temper in check."],
        ap.active_plans = ["To persuade Augustus not to send Postumus to the Rhine, highlighting the potential for conflict with Tiberius.", "To maintain her influence over military decisions by subtly undermining Augustus's authority.", "To protect her son's interests and ensure that he gains military experience without becoming a pawn in Augustus's schemes."],
        ap.beliefs = ["Family loyalty is paramount, but it must be balanced with political strategy and caution.", "Postumus's unpredictability makes him a liability in a high-stakes environment.", "Power dynamics within the family must be navigated carefully to ensure her son's ascension."],
        ap.goals = ["Short-term: To avoid sending Postumus into a situation that could harm his reputation.", "Medium-term: To position Germanicus as the favored son in military matters.", "Ultimate: To secure Tiberius's elevation while ensuring her family's dominance in the imperial hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Antonia expertly guides a hesitant Claudius through the throngs of spectators packing the arena. She steers him away from the prestigious Imperial seats, directing him to a more modest location beside King Herod. She subtly attends to Claudius\'s discomfort, mentioning his runny nose as they navigate the crowded space, ensuring he is somewhat presentable despite his evident unease.',
        ap.emotional_state = 'Antonia is composed and practical, focused on efficiently managing the immediate situation of navigating the crowded arena and seating Claudius appropriately. Beneath her composed exterior, there\'s a gentle concern for Claudius\'s well-being and social comfort. She displays a nurturing patience towards his awkwardness, indicating a deep-seated empathy and a desire to ease his anxieties in this overwhelming public spectacle.',
        ap.emotional_tags = ["antonia is composed", "practical, focused on efficiently managing the immediate situation of navigating the crowded arena", "seating claudius appropriately. beneath her composed exterior, there's a gentle concern for claudius's well-being", "social comfort. she displays a nurturing patience towards his awkwardness, indicating a deep-seated empathy", "a desire to ease his anxieties in this overwhelming public spectacle.", "antonia is composed and practical", "focused on efficiently managing the immediate situation of navigating the crowded arena and seating claudius appropriately. beneath her composed exterior", "there's a gentle concern for claudius's well-being and social comfort. she displays a nurturing patience towards his awkwardness", "indicating a deep-seated empathy and a desire to ease his anxieties in this overwhelming public spectacle."],
        ap.active_plans = ["Navigate the crowded arena efficiently to reach their designated seating.", "Ensure Claudius is seated in a location befitting his (non-imperial) status, away from the most prominent positions.", "Introduce Claudius to King Herod and facilitate a polite social interaction between them."],
        ap.beliefs = ["Maintaining social order and decorum is essential, particularly in public settings like the arena.", "Claudius requires gentle guidance and support to navigate social situations due to his inherent awkwardness.", "It is important to be courteous and respectful to allied rulers and client kings like Herod."],
        ap.goals = ["Short-term: Successfully seat Claudius and join Herod without causing any social disruptions or drawing undue attention.", "Medium-term: Support Claudius in developing his social skills and confidence in public settings, fostering his integration into court life.", "Ultimate: Protect and care for Claudius, offering him a sense of stability and acceptance within the often-harsh environment of the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles awkwardly through the bustling arena, guided by Antonia’s hand. His movements are hesitant, his gaze darting nervously around at the vast crowds. He stumbles slightly as he walks, his physical discomfort mirroring his social unease.  He expresses a longing for Germanicus\'s presence, revealing his apprehension about the spectacle and a desire for familiar comfort.',
        ap.emotional_state = 'Claudius is deeply anxious and overwhelmed by the arena\'s spectacle and the surrounding crowds. His nervousness is palpable, manifesting in his physical awkwardness and stuttering speech. He feels out of place and intimidated, highlighting his profound insecurity and discomfort in public, performative environments. He longs for the reassuring presence of Germanicus, indicating a deep-seated need for familial support and validation in moments of stress.',
        ap.emotional_tags = ["claudius is deeply anxious", "overwhelmed by the arena's spectacle", "the surrounding crowds. his nervousness is palpable, manifesting in his physical awkwardness", "stuttering speech. he feels out of place", "intimidated, highlighting his profound insecurity", "discomfort in public, performative environments. he longs for the reassuring presence of germanicus, indicating a deep-seated need for familial support", "validation in moments of stress.", "claudius is deeply anxious and overwhelmed by the arena's spectacle and the surrounding crowds. his nervousness is palpable", "manifesting in his physical awkwardness and stuttering speech. he feels out of place and intimidated", "highlighting his profound insecurity and discomfort in public", "performative environments. he longs for the reassuring presence of germanicus", "indicating a deep-seated need for familial support and validation in moments of stress."],
        ap.active_plans = ["Follow Antonia's directions and attempt to navigate the crowded arena without causing a scene.", "Observe the gladiatorial games, despite his personal discomfort and lack of prior experience.", "Engage in polite conversation with Herod, despite his own nervousness and Herod's cynical demeanor."],
        ap.beliefs = ["Gladiatorial games, despite their brutality, are rooted in religious tradition and are a significant Roman rite.", "Germanicus provides a sense of safety and reassurance, representing an idealized figure of strength and acceptance within his family.", "He is socially inept and requires guidance from others, like Antonia, to navigate public and social situations effectively."],
        ap.goals = ["Short-term: Endure the gladiatorial games without succumbing to panic or making a significant social blunder.", "Medium-term: Gradually become more accustomed to public spectacles and social gatherings, reducing his anxiety and awkwardness in such environments.", "Ultimate: Achieve a sense of acceptance and belonging within his family and Roman society, overcoming his perceived physical and social limitations to find his place."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_1'})
    ON CREATE SET
        ap.current_status = 'King Herod is already seated, observing the bustling arena with a detached, cynical amusement. He surveys the crowd with a knowing gaze, taking in their excited anticipation and gluttonous feasting. He remains seated and composed as Antonia and Claudius arrive, offering sharp, witty commentary on the spectacle unfolding around them.',
        ap.emotional_state = 'Herod is detached and cynical, viewing the Roman spectacle with amusement and a hint of disdain. He is observant and critical of the Roman populace\'s eagerness for violence and their superficial indulgence. He maintains a cool, almost mocking demeanor, suggesting a sense of cultural superiority or at least a strong distinction from Roman values. His cynicism is not overtly hostile but rather a form of detached intellectual amusement and social commentary.',
        ap.emotional_tags = ["herod is detached", "cynical, viewing the roman spectacle with amusement", "a hint of disdain. he is observant", "critical of the roman populace's eagerness for violence", "their superficial indulgence. he maintains a cool, almost mocking demeanor, suggesting a sense of cultural superiority or at least a strong distinction from roman values. his cynicism is not overtly hostile but rather a form of detached intellectual amusement", "social commentary.", "herod is detached and cynical", "viewing the roman spectacle with amusement and a hint of disdain. he is observant and critical of the roman populace's eagerness for violence and their superficial indulgence. he maintains a cool", "almost mocking demeanor", "suggesting a sense of cultural superiority or at least a strong distinction from roman values. his cynicism is not overtly hostile but rather a form of detached intellectual amusement and social commentary.", "herod is detached and cynical, viewing the roman spectacle with amusement and a hint of disdain. he is observant and critical of the roman populace's eagerness for violence and their superficial indulgence. he maintains a cool, almost mocking demeanor, suggesting a sense of cultural superiority or at least a strong distinction from roman values. his cynicism is not overtly hostile", "rather a form of detached intellectual amusement and social commentary."],
        ap.active_plans = ["Observe and analyze the behavior of the Roman crowd at the gladiatorial games, forming his own critical assessment of Roman culture.", "Engage in witty and cynical banter with Claudius and Antonia, offering his outsider's perspective on Roman customs and values.", "Maintain a detached and objective stance, avoiding emotional investment in the spectacle and remaining an observer rather than a participant."],
        ap.beliefs = ["Roman gladiatorial games are a barbaric display of violence, driven by a crude public appetite for bloodshed.", "The Roman populace is easily swayed by spectacle and superficial entertainment, lacking deeper moral or philosophical substance.", "His own cultural and philosophical traditions offer a more refined and ethical perspective than Roman society."],
        ap.goals = ["Short-term: Entertain himself by observing and commenting on the gladiatorial games and the Roman audience, deriving intellectual amusement from the spectacle.", "Medium-term: Maintain his independent perspective and cultural identity while navigating interactions within the Roman Empire, preserving his critical distance.", "Ultimate: Return to his own kingdom with a strengthened sense of his cultural distinctiveness and a deeper understanding of Roman societal dynamics, informed by his detached observations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits awkwardly among the crowd, his posture hunched as he navigates the overwhelming atmosphere of the arena. His hands fidget nervously, and his stammer presents itself as he struggles to articulate his thoughts amidst the chaotic spectacle around him.',
        ap.emotional_state = 'Claudius is visibly anxious and overwhelmed, his face flushed and eyes darting around the arena, betraying his discomfort in this brutal environment. Internally, there lies a complex mix of fear, desire for acceptance, and an uncomfortable awareness of the impending violence, creating a tension between his genuine interest and fear of the spectacle.',
        ap.emotional_tags = ["claudius is visibly anxious", "overwhelmed, his face flushed", "eyes darting around the arena, betraying his discomfort in this brutal environment. internally, there lies a complex mix of fear, desire for acceptance,", "an uncomfortable awareness of the impending violence, creating a tension between his genuine interest", "fear of the spectacle.", "claudius is visibly anxious and overwhelmed", "his face flushed and eyes darting around the arena", "betraying his discomfort in this brutal environment. internally", "there lies a complex mix of fear", "desire for acceptance", "and an uncomfortable awareness of the impending violence", "creating a tension between his genuine interest and fear of the spectacle."],
        ap.active_plans = ["To engage in conversation with Herod in an attempt to deflect attention from his own discomfort.", "To rationalize the gladiatorial games by emphasizing their religious significance, hoping to find a sense of honor in the violence.", "To seek reassurance and validation from his surroundings, particularly from figures like Germanicus, whom he wishes were present."],
        ap.beliefs = ["He believes that the spectacles serve a higher purpose by honoring the dead.", "He thinks that his own presence at such events will somehow validate him within the family and society.", "He holds a conviction that understanding and discussing the traditions will shield him from judgment."],
        ap.goals = ["Short-term: To maintain composure and not draw undue attention to his stammer during the games.", "Medium-term: To engage with Herod and learn more about the arena's culture, hoping to integrate better into Roman society.", "Ultimate: To gain acceptance and recognition from his family, ultimately to find his place within the brutal dynamics of Roman power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Herod stands with a critical, detached demeanor, watching the crowd with a cynical smile. He gestures dismissively, commenting on the grotesque enjoyment of the spectators, relishing the irony of their craving for violence while indulging in lavish delicacies.',
        ap.emotional_state = 'Herod exhibits a veneer of cynicism, his expressions reflective and sardonic as he critiques the absurdity of the games. Internally, he feels a mix of fascination and distaste, recognizing the moral decay surrounding him, while also enjoying the power his observations afford him over Claudius and the situation.',
        ap.emotional_tags = ["herod exhibits a veneer of cynicism, his expressions reflective", "sardonic as he critiques the absurdity of the games. internally, he feels a mix of fascination", "distaste, recognizing the moral decay surrounding him, while also enjoying the power his observations afford him over claudius", "the situation.", "herod exhibits a veneer of cynicism", "his expressions reflective and sardonic as he critiques the absurdity of the games. internally", "he feels a mix of fascination and distaste", "recognizing the moral decay surrounding him", "while also enjoying the power his observations afford him over claudius and the situation.", "herod exhibits a veneer of cynicism, his expressions reflective and sardonic as he critiques the absurdity of the games. internally, he feels a mix of fascination and distaste, recognizing the moral decay surrounding him,", "also enjoying the power his observations afford him over claudius and the situation."],
        ap.active_plans = ["To critique the spectacle of the games, using irony to highlight the disparity between the audience's pleasure and the gladiators' plight.", "To engage Claudius in conversation, challenging his beliefs and drawing out his insecurities.", "To observe the dynamics within the imperial entourage, assessing any weaknesses or vulnerabilities among the Roman elite."],
        ap.beliefs = ["He believes that the gladiatorial games are a grotesque representation of human nature, showcasing the darker impulses of society.", "He holds a conviction that the lavish displays of excess do not hide the underlying brutality of Roman culture.", "He thinks that engaging in philosophical debates can expose the hypocrisies of those around him, especially the elite."],
        ap.goals = ["Short-term: To provoke thought and unease in Claudius about the nature of the games and their implications.", "Medium-term: To leverage the opportunity to critique Roman culture and gain Claudius's trust through their shared experience.", "Ultimate: To navigate the complex political landscape of Rome, establishing his own position while remaining critical of the empire's moral fabric."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Livia enters the arena with an air of supreme command, flanked by Augustus and Livilla. She strides purposefully towards the gladiators (implied audience), her regal bearing silencing the surrounding hubbub. Standing tall and imperious, she addresses the crowd and the gladiators with sharp, declarative pronouncements about the spectacle they are about to witness, her gaze sweeping across the arena to ensure her dominance is felt by all.',
        ap.emotional_state = 'Livia exudes cold, calculated authority. Her surface emotions are imperious and demanding, devoid of warmth or empathy as she speaks of \'scum\' and \'money\'s worth.\' Internally, she is driven by a ruthless pragmatism and a steely determination to control every aspect of the spectacle, ensuring it reflects imperial power and her personal will. Her unspoken motivation is to assert her dominance and demand absolute obedience, using the games as a stage to reinforce her iron grip on the Roman court.',
        ap.emotional_tags = ["livia exudes cold, calculated authority. her surface emotions are imperious", "demanding, devoid of warmth or empathy as she speaks of 'scum'", "'money's worth.' internally, she is driven by a ruthless pragmatism", "a steely determination to control every aspect of the spectacle, ensuring it reflects imperial power", "her personal will. her unspoken motivation is to assert her dominance", "demand absolute obedience, using the games as a stage to reinforce her iron grip on the roman court.", "livia exudes cold", "calculated authority. her surface emotions are imperious and demanding", "devoid of warmth or empathy as she speaks of 'scum' and 'money's worth.' internally", "she is driven by a ruthless pragmatism and a steely determination to control every aspect of the spectacle", "ensuring it reflects imperial power and her personal will. her unspoken motivation is to assert her dominance and demand absolute obedience", "using the games as a stage to reinforce her iron grip on the roman court."],
        ap.active_plans = ["Establish immediate and unquestionable authority over the gladiators and the arena audience.", "Ensure a brutally entertaining spectacle that meets her exacting standards, reflecting well on the imperial family and her own power.", "Deter any attempts at trickery or less-than-genuine combat, reinforcing her reputation for ruthless efficiency and control."],
        ap.beliefs = ["Spectacles of violence are essential for maintaining control over the populace and projecting imperial strength.", "Gladiators are expendable commodities whose lives are secondary to imperial entertainment and spectacle.", "Ruthless pragmatism and unwavering control are the cornerstones of effective power and governance."],
        ap.goals = ["Short-term: To witness a genuinely brutal and entertaining gladiatorial contest that satisfies her demand for a 'good show'.", "Medium-term: To solidify her image as a powerful, uncompromising figure within the Roman court, commanding respect and fear.", "Ultimate: To secure the enduring legacy of her family and maintain her influence over the empire, ensuring her son Tiberius's ascent to power and the continuation of her dynasty's dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Augustus accompanies Livia and Livilla into the arena, yet he appears detached and mentally adrift. While physically present, he is described as \'distracted, staring into space\', his attention drawn inward rather than to the spectacle unfolding around him. He seems almost oblivious to Livia\'s forceful address, his focus instead wandering to fragmented memories, revealing a king losing his grip on the present.',
        ap.emotional_state = 'Augustus exhibits a surface detachment and absent-mindedness, lost in a private world of fading memories. Internally, he is likely wrestling with weariness and the anxieties of his aging reign. There\'s a palpable sense of vulnerability beneath the imperial façade, a stark contrast to Livia\'s assertive control. His unspoken conflict is his struggle with declining power and relevance, contrasted with the sharp, undiminished authority of his wife. He seeks refuge in the past, perhaps to escape the pressures of the present.',
        ap.emotional_tags = ["augustus exhibits a surface detachment", "absent-mindedness, lost in a private world of fading memories. internally, he is likely wrestling with weariness", "the anxieties of his aging reign. there's a palpable sense of vulnerability beneath the imperial fa\u00e7ade, a stark contrast to livia's assertive control. his unspoken conflict is his struggle with declining power", "relevance, contrasted with the sharp, undiminished authority of his wife. he seeks refuge in the past, perhaps to escape the pressures of the present.", "augustus exhibits a surface detachment and absent-mindedness", "lost in a private world of fading memories. internally", "he is likely wrestling with weariness and the anxieties of his aging reign. there's a palpable sense of vulnerability beneath the imperial fa\u00e7ade", "a stark contrast to livia's assertive control. his unspoken conflict is his struggle with declining power and relevance", "contrasted with the sharp", "undiminished authority of his wife. he seeks refuge in the past", "perhaps to escape the pressures of the present."],
        ap.active_plans = ["Maintain a nominal imperial presence alongside Livia, fulfilling his expected role in public appearances.", "Subconsciously seek connection or shared memory with Livia, perhaps longing for a time when their relationship was more resonant.", "Endure the gladiatorial games, though his mind is clearly preoccupied with personal reflections and a sense of fading agency."],
        ap.beliefs = ["Maintaining imperial appearances is still necessary, even when personal engagement wanes.", "The past is becoming more vivid and compelling than the present, signaling a shift in his mental focus and priorities.", "Livia is now the driving force, the true wielder of power, while he recedes into a more passive role."],
        ap.goals = ["Short-term: To passively witness the gladiatorial games, his mind elsewhere, seeking escape from present realities.", "Medium-term: To find solace in memories of the past, perhaps attempting to recapture a sense of former vitality or connection.", "Ultimate: To reconcile with his declining powers and legacy, seeking a measure of peace in his final years, even as Livia continues to steer the empire with unwavering resolve."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Livilla enters the arena as part of the imperial entourage, positioned alongside Livia and Augustus. She maintains a composed and observant demeanor, her presence contributing to the visual spectacle of imperial authority. While less overtly active than Livia, Livilla\'s poised attentiveness suggests she is keenly absorbing the dynamics of power being displayed.',
        ap.emotional_state = 'Livilla projects an outward image of poised compliance and keen observation. Internally, she is likely a careful student of Livia\'s power display, registering every nuance of her grandmother\'s assertive command. There\'s a calculated attentiveness in her demeanor, suggesting she is learning the intricacies of imperial manipulation and control. Her unspoken motivation is to align herself strategically with Livia, absorbing lessons in wielding influence within the treacherous court and solidifying her own position.',
        ap.emotional_tags = ["livilla projects an outward image of poised compliance", "keen observation. internally, she is likely a careful student of livia's power display, registering every nuance of her grandmother's assertive command. there's a calculated attentiveness in her demeanor, suggesting she is learning the intricacies of imperial manipulation", "control. her unspoken motivation is to align herself strategically with livia, absorbing lessons in wielding influence within the treacherous court", "solidifying her own position.", "livilla projects an outward image of poised compliance and keen observation. internally", "she is likely a careful student of livia's power display", "registering every nuance of her grandmother's assertive command. there's a calculated attentiveness in her demeanor", "suggesting she is learning the intricacies of imperial manipulation and control. her unspoken motivation is to align herself strategically with livia", "absorbing lessons in wielding influence within the treacherous court and solidifying her own position."],
        ap.active_plans = ["Present a unified and supportive front alongside Livia and Augustus, reinforcing the image of a cohesive imperial family.", "Closely observe and analyze Livia's assertive behavior and command style, learning valuable lessons in power dynamics and manipulation.", "Maintain a position of favor and proximity to Livia, ensuring her continued access to imperial influence and strategic advantage."],
        ap.beliefs = ["Strategic alignment with powerful figures like Livia is essential for personal advancement and influence within the imperial family.", "Keen observation and astute learning are critical tools for navigating the complexities of court politics.", "Maintaining a polished public image and demonstrating outward conformity are vital for securing and retaining status in the Roman court."],
        ap.goals = ["Short-term: To maintain a favorable and attentive presence during the imperial entrance and Livia's address, demonstrating her loyalty and perceptiveness.", "Medium-term: To cultivate a closer relationship with Livia, leveraging her grandmother's power and guidance to enhance her own standing and influence.", "Ultimate: To secure a position of lasting power and strategic advantage within the Roman court, potentially by emulating Livia's methods and forging her own path to influence and control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Claudius is guided by Antonia to seating behind the imperial box, a position highlighting his marginal status. Initially awkward and nervous, he attempts to engage Herod in conversation, providing a historical and religious context for the games. He shifts uncomfortably and ultimately falls from his chair when Livia makes her forceful entrance and delivers her dominating speech, physically manifesting his unease and social ineptitude amidst imperial power.',
        ap.emotional_state = 'Claudius displays surface nervousness and palpable discomfort with the gladiatorial spectacle, stammering about his inexperience and longing for Germanicus\'s presence. Internally, he is anxious and intimidated by the imperial family, particularly Livia\'s imposing demeanor. He seeks intellectual refuge by explaining the games\' origins, attempting to rationalize the brutality. His unspoken conflict is his struggle to reconcile his intellectual sensitivity with the brutal realities of Roman spectacle and imperial dominance, feeling deeply out of place and socially inadequate.',
        ap.emotional_tags = ["claudius displays surface nervousness", "palpable discomfort with the gladiatorial spectacle, stammering about his inexperience", "longing for germanicus's presence. internally, he is anxious", "intimidated by the imperial family, particularly livia's imposing demeanor. he seeks intellectual refuge by explaining the games' origins, attempting to rationalize the brutality. his unspoken conflict is his struggle to reconcile his intellectual sensitivity with the brutal realities of roman spectacle", "imperial dominance, feeling deeply out of place", "socially inadequate.", "claudius displays surface nervousness and palpable discomfort with the gladiatorial spectacle", "stammering about his inexperience and longing for germanicus's presence. internally", "he is anxious and intimidated by the imperial family", "particularly livia's imposing demeanor. he seeks intellectual refuge by explaining the games' origins", "attempting to rationalize the brutality. his unspoken conflict is his struggle to reconcile his intellectual sensitivity with the brutal realities of roman spectacle and imperial dominance", "feeling deeply out of place and socially inadequate."],
        ap.active_plans = ["Seek a less conspicuous seating area, away from the direct gaze of the imperial family, initially guided by Antonia.", "Attempt to engage Herod in intellectual discourse, using historical and religious explanations to distance himself from the immediate violence and his own discomfort.", "Subtly express his admiration for Germanicus, perhaps as an idealized figure contrasted with the intimidating presence of Livia and the spectacle of the arena."],
        ap.beliefs = ["Violence, while a Roman custom, is inherently disturbing and clashes with his intellectual and sensitive nature.", "Intellectual understanding and historical context can provide a coping mechanism for dealing with uncomfortable or brutal realities.", "Germanicus represents a more honorable and less threatening figure compared to the manipulative and forceful members of his own family."],
        ap.goals = ["Short-term: To endure the gladiatorial games with minimal personal distress and social awkwardness, attempting to blend into the background.", "Medium-term: To maintain a low profile and avoid attracting negative attention from the imperial family, particularly Livia, fearing their disapproval and judgment.", "Ultimate: To find a way to navigate the brutal Roman world while preserving his intellectual integrity and personal values, seeking refuge in historical understanding and detached observation rather than direct engagement with imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Herod observes the arena and the unfolding scene with cynical detachment from his seat alongside Claudius. He watches the crowd with a \'cynical eye\' and delivers barbed commentary on their bloodlust and the spectacle\'s supposed religious significance. He engages in a witty and ironic exchange with Claudius, maintaining his outsider\'s perspective and critical stance throughout Livia\'s entrance and address.',
        ap.emotional_state = 'Herod projects an air of amused cynicism and intellectual superiority, mocking the Roman crowd\'s enthusiasm for violence and Livia\'s imperious pronouncements. Internally, he is likely detached and critical, viewing Roman customs with a mixture of amusement and disdain from his culturally distinct vantage point. There\'s a sense of ironic detachment and a subtle self-assurance in his outsider status. His unspoken motivation is to maintain his cultural and intellectual distance, using wit and cynicism as a shield against Roman barbarity and self-importance.',
        ap.emotional_tags = ["herod projects an air of amused cynicism", "intellectual superiority, mocking the roman crowd's enthusiasm for violence", "livia's imperious pronouncements. internally, he is likely detached", "critical, viewing roman customs with a mixture of amusement", "disdain from his culturally distinct vantage point. there's a sense of ironic detachment", "a subtle self-assurance in his outsider status. his unspoken motivation is to maintain his cultural", "intellectual distance, using wit", "cynicism as a shield against roman barbarity", "self-importance.", "herod projects an air of amused cynicism and intellectual superiority", "mocking the roman crowd's enthusiasm for violence and livia's imperious pronouncements. internally", "he is likely detached and critical", "viewing roman customs with a mixture of amusement and disdain from his culturally distinct vantage point. there's a sense of ironic detachment and a subtle self-assurance in his outsider status. his unspoken motivation is to maintain his cultural and intellectual distance", "using wit and cynicism as a shield against roman barbarity and self-importance."],
        ap.active_plans = ["Observe and critique Roman customs and spectacles from an outsider's perspective, highlighting their perceived absurdity and hypocrisy.", "Engage in witty banter with Claudius, using irony and sarcasm to underscore his skeptical view of Roman society and its values.", "Maintain a detached and cynical demeanor to protect himself emotionally and culturally, reinforcing his distinct identity as a client king from the Middle East."],
        ap.beliefs = ["Roman spectacles are ultimately driven by base bloodlust and a superficial desire for entertainment, masking deeper societal flaws.", "Outsider perspectives offer valuable insights and critiques of dominant cultures, revealing their inherent contradictions and hypocrisies.", "Cynicism and intellectual detachment are effective defenses against the excesses and barbarities of powerful empires."],
        ap.goals = ["Short-term: To observe and analyze the gladiatorial games and the Roman court with a critical and detached eye, forming his own judgments.", "Medium-term: To maintain his cultural and intellectual distinctiveness while navigating the Roman world, preserving his own values and perspective.", "Ultimate: To return to his own kingdom with a deeper understanding of Roman society and its weaknesses, using his observations to inform his own rule and diplomatic strategies, potentially benefiting from Roman vulnerabilities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits awkwardly in his chair, visibly uncomfortable and nervously glancing around the arena, overwhelmed by the noise and atmosphere. His posture is tense, and he clumsily falls off his chair, attracting unwanted attention and concern from those around him.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect anxiety and embarrassment, as indicated by his stammer and awkwardness. Internally, he grapples with feelings of inadequacy and fear of judgment from both the audience and his family, heightening his sense of isolation in a brutal environment.',
        ap.emotional_tags = ["claudius's surface emotions reflect anxiety", "embarrassment, as indicated by his stammer", "awkwardness. internally, he grapples with feelings of inadequacy", "fear of judgment from both the audience", "his family, heightening his sense of isolation in a brutal environment.", "claudius's surface emotions reflect anxiety and embarrassment", "as indicated by his stammer and awkwardness. internally", "he grapples with feelings of inadequacy and fear of judgment from both the audience and his family", "heightening his sense of isolation in a brutal environment."],
        ap.active_plans = ["To observe the gladiatorial games as a means of understanding Roman culture and ritual.", "To remain inconspicuous and avoid drawing attention to his physical clumsiness.", "To express a desire for companionship by mentioning Germanicus, seeking comfort in familial connections."],
        ap.beliefs = ["He believes that understanding the cultural significance of the games will help him fit into the imperial family.", "Claudius holds a conviction that he must navigate the brutal realities of his environment to survive.", "He perceives family loyalty as vital, though it often leaves him feeling like an outsider."],
        ap.goals = ["Short-term: To manage his anxiety while attending the games and avoid further humiliation.", "Medium-term: To find a sense of belonging within his family and the imperial court.", "Ultimate: To develop the strength and confidence to assert himself within the complex dynamics of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Antonia stands beside Claudius, offering her support as he navigates through the crowd. She is attentive to his discomfort and rushes to aid him after his fall, demonstrating her care and concern for his well-being.',
        ap.emotional_state = 'Antonia appears empathetic and protective, her demeanor softening the harshness of the arena. Internally, she feels a profound sense of obligation to support Claudius, reflecting her understanding of his vulnerabilities and the need for familial compassion amidst the brutality of the event.',
        ap.emotional_tags = ["antonia appears empathetic", "protective, her demeanor softening the harshness of the arena. internally, she feels a profound sense of obligation to support claudius, reflecting her understanding of his vulnerabilities", "the need for familial compassion amidst the brutality of the event.", "antonia appears empathetic and protective", "her demeanor softening the harshness of the arena. internally", "she feels a profound sense of obligation to support claudius", "reflecting her understanding of his vulnerabilities and the need for familial compassion amidst the brutality of the event."],
        ap.active_plans = ["To guide Claudius safely through the crowd and ensure he takes his place away from the Imperial seats.", "To provide emotional support in the face of Claudius's anxiety and discomfort.", "To maintain a supportive presence that counteracts the harshness exhibited by other family members."],
        ap.beliefs = ["She believes in the importance of familial duty and protecting vulnerable family members.", "Antonia holds a conviction that kindness and empathy can soften the brutality of court life.", "She perceives the imperial games as a necessary spectacle but wishes for a more humane approach to the events."],
        ap.goals = ["Short-term: To help Claudius feel more comfortable during the games and minimize his embarrassment.", "Medium-term: To foster a sense of unity and support within the family despite the prevailing cruelty.", "Ultimate: To advocate for more compassion in the imperial court, contrasting the brutal politics surrounding them."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands regal and imposing as she addresses the crowd, her commanding presence dominating the atmosphere. She delivers a harsh pronouncement regarding the games, asserting her authority and expectations while glaring at Claudius after his fall, perceiving his clumsiness as a personal affront.',
        ap.emotional_state = 'Livia\'s surface emotions reflect cold determination and disdain for perceived weaknesses, particularly in Claudius. Underneath, she experiences a relentless drive to maintain control and uphold her family\'s reputation, viewing any disruptions as threats to her carefully crafted image.',
        ap.emotional_tags = ["livia's surface emotions reflect cold determination", "disdain for perceived weaknesses, particularly in claudius. underneath, she experiences a relentless drive to maintain control", "uphold her family's reputation, viewing any disruptions as threats to her carefully crafted image.", "livia's surface emotions reflect cold determination and disdain for perceived weaknesses", "particularly in claudius. underneath", "she experiences a relentless drive to maintain control and uphold her family's reputation", "viewing any disruptions as threats to her carefully crafted image."],
        ap.active_plans = ["To assert her authority and set the tone for the gladiatorial games, ensuring they meet her high expectations.", "To demonstrate her disdain for weakness in her family, particularly towards Claudius, reinforcing her dominance.", "To manipulate the outcomes of the games to reflect positively on her son, Drusus Nero, maintaining her political power."],
        ap.beliefs = ["She believes that strength and power are paramount in the imperial court, viewing weakness as a liability.", "Livia holds a conviction that her family's legacy must be protected at all costs, even if it means harsh treatment of its members.", "She perceives her role as the ultimate authority in the family, entrusted with the responsibility of guiding its direction."],
        ap.goals = ["Short-term: To ensure the gladiatorial games are executed flawlessly and are entertaining for the audience.", "Medium-term: To elevate the status and legacy of her son, Drusus Nero, amidst the spectacle of the games.", "Ultimate: To consolidate her power within the imperial family by eliminating any perceived threats to her influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Augustus sits in attendance, appearing distracted and detached as he gazes into space, reminiscing about past events. His physical presence suggests a weary ruler, whose mind drifts between memories rather than engaging with the current spectacle.',
        ap.emotional_state = 'Augustus displays a facade of indifference, masking deeper insecurities about his relevance and authority. His internal state reveals confusion and nostalgia, struggling to connect with the present as he grapples with the realities of aging and diminishing influence within the court.',
        ap.emotional_tags = ["augustus displays a facade of indifference, masking deeper insecurities about his relevance", "authority. his internal state reveals confusion", "nostalgia, struggling to connect with the present as he grapples with the realities of aging", "diminishing influence within the court.", "augustus displays a facade of indifference", "masking deeper insecurities about his relevance and authority. his internal state reveals confusion and nostalgia", "struggling to connect with the present as he grapples with the realities of aging and diminishing influence within the court."],
        ap.active_plans = ["To observe the games with a sense of nostalgia, reflecting on his reign and the changes in the empire.", "To engage in conversation with Livia, seeking connection despite his mental drift into memories.", "To maintain a semblance of authority in the face of his growing senility and detachment."],
        ap.beliefs = ["He believes that his legacy and decisions are paramount, yet he struggles to reconcile them with the present chaos.", "Augustus holds a conviction that the games are a vital display of Roman strength and culture, despite their brutality.", "He perceives himself as a protector of the empire, though he senses his grip on power slipping."],
        ap.goals = ["Short-term: To remain engaged with the events despite his distractions, preserving an image of control.", "Medium-term: To maintain familial connections that seem to slip through his fingers amid the chaos.", "Ultimate: To secure a legacy that reflects strength and stability for the Roman Empire in an era of turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Livilla stands in the background as part of Livia’s retinue, observing the proceedings with a calculating gaze. She remains poised, subtly assessing the reactions of those around her, particularly Claudius\'s awkwardness and Augustus\'s distractions.',
        ap.emotional_state = 'Livilla\'s surface emotions reflect a mix of intrigue and amusement at the dynamics unfolding before her. Internally, she is calculating and strategic, contemplating how Claudius\'s misstep and Augustus\'s detachment could be leveraged to her advantage in the complex court politics.',
        ap.emotional_tags = ["livilla's surface emotions reflect a mix of intrigue", "amusement at the dynamics unfolding before her. internally, she is calculating", "strategic, contemplating how claudius's misstep", "augustus's detachment could be leveraged to her advantage in the complex court politics.", "livilla's surface emotions reflect a mix of intrigue and amusement at the dynamics unfolding before her. internally", "she is calculating and strategic", "contemplating how claudius's misstep and augustus's detachment could be leveraged to her advantage in the complex court politics."],
        ap.active_plans = ["To observe the interactions between family members and identify weaknesses to exploit for her own gain.", "To maintain a fa\u00e7ade of loyalty while positioning herself favorably within the shifting power dynamics of the court.", "To assess Claudius's vulnerability as a potential asset or liability in her own ambitions."],
        ap.beliefs = ["She believes that observance and subtle manipulation are key to thriving in the treacherous landscape of Roman politics.", "Livilla holds a conviction that family connections can be strategically used to achieve personal goals.", "She perceives her beauty and charm as powerful tools for navigating the male-dominated arena of imperial Rome."],
        ap.goals = ["Short-term: To remain aligned with Livia while subtly distancing herself from any fallout from Claudius's failure.", "Medium-term: To maneuver herself into a position of greater influence within the court by leveraging familial weaknesses.", "Ultimate: To secure her power and status in the imperial family, ensuring her ambitions are realized amidst the chaos."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gold_pieces_bet_event_8_3'})
    ON CREATE SET
        oi.description = 'The twenty gold pieces serve as the central object of the wager initiated by Augustus and accepted by Herod. They are explicitly offered by Augustus as the stake in his bet on the \'fat man\' gladiator, representing a tangible measure of value and risk in the outcome of the gladiatorial combat. The coins symbolize imperial wealth and the casualness with which even human life can be commodified and gambled upon in this setting. Their potential transfer from Augustus to Herod, should Herod win, is the direct consequence of the bet and the driving motivation for Herod\'s acceptance despite his initial religious objections.',
        oi.status_before = 'Prior to Augustus proposing the bet, the gold pieces are presumed to be in his possession, representing a portion of his vast imperial wealth. They are simply generic currency, readily available for his use or disposal, and not yet specifically designated for any purpose within the scene\'s narrative.',
        oi.status_after = 'Following Herod\'s acceptance of the bet, the status of the gold pieces shifts from general imperial wealth to \'wagered funds\'. While still physically in Augustus\'s possession at this moment, their ownership is now contingent on the outcome of the gladiatorial fight. They are symbolically \'in play\', representing the stakes of the gamble and poised to potentially change ownership based on the events unfolding in the arena. The coins are now charged with narrative significance, embodying the risk and potential reward of the bet.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gold_pieces_bet'})
    MATCH (e:Event {uuid: 'event_8_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated in the arena, eyes wide with a mixture of horror and morbid fascination as he watches the gladiatorial combat unfold. He flinches visibly at the brutal exchanges, even letting out a small cry of \'Ow\' at a particularly violent blow. He fidgets in his seat, his body tense and his hands clasped tightly, a stark contrast to the seasoned spectators around him.',
        ap.emotional_state = 'Claudius is experiencing acute anxiety and distress. Outwardly, his discomfort is clear through his physical reactions – flinching, exclamations of pain, and visible tension. Beneath the surface, he is wrestling with a deep aversion to the violence, a stark contrast to the Roman appetite for spectacle. He feels inadequate and out of place, his sensitivity clashing with the brutal environment and the apparent enjoyment of those around him, including his own family.',
        ap.emotional_tags = ["claudius is experiencing acute anxiety", "distress. outwardly, his discomfort is clear through his physical reactions \u2013 flinching, exclamations of pain,", "visible tension. beneath the surface, he is wrestling with a deep aversion to the violence, a stark contrast to the roman appetite for spectacle. he feels inadequate", "out of place, his sensitivity clashing with the brutal environment", "the apparent enjoyment of those around him, including his own family.", "claudius is experiencing acute anxiety and distress. outwardly", "his discomfort is clear through his physical reactions \u2013 flinching", "exclamations of pain", "and visible tension. beneath the surface", "he is wrestling with a deep aversion to the violence", "a stark contrast to the roman appetite for spectacle. he feels inadequate and out of place", "his sensitivity clashing with the brutal environment and the apparent enjoyment of those around him", "including his own family."],
        ap.active_plans = ["To endure the gladiatorial spectacle without succumbing entirely to his fear and disgust.", "To try and control his outward reactions to the violence, attempting to appear less weak and sensitive in front of others.", "To observe and understand the Romans' fascination with the arena, despite his personal revulsion, hoping to glean insights into Roman culture and power dynamics."],
        ap.beliefs = ["Violence is inherently barbaric and morally repugnant, not a source of entertainment.", "His physical and emotional sensitivities are weaknesses in the Roman world, making him an outsider.", "The Roman obsession with gladiatorial combat reflects a deeper societal brutality that he finds deeply unsettling."],
        ap.goals = ["Short-term: To survive the arena event without fainting or making a spectacle of his discomfort.", "Medium-term: To comprehend the role of violence in Roman society and how it shapes the imperial mindset.", "Ultimate: To find a way to navigate the treacherous world of Roman politics and court intrigue while staying true to his own moral compass, even if it means remaining an outsider."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Herod is seated near Claudius and Augustus, calmly observing the gladiatorial combat. He initially dismisses Claudius\'s anxiety, telling him to \'calm down\', suggesting a seasoned indifference to the arena\'s violence. He engages in a witty and slightly philosophical exchange with Augustus about betting and religion, maintaining a detached yet respectful demeanor throughout the scene.',
        ap.emotional_state = 'Herod is outwardly composed and amused, displaying a cynical detachment from the spectacle. His tone is light and slightly mocking towards Claudius\'s distress, and playfully challenging towards Augustus\'s assumptions about religion and betting. Internally, he is likely observing Roman customs with a critical and culturally distinct perspective. He appears unperturbed by the violence and more interested in the social and political dynamics of the Roman court.',
        ap.emotional_tags = ["herod is outwardly composed", "amused, displaying a cynical detachment from the spectacle. his tone is light", "slightly mocking towards claudius's distress,", "playfully challenging towards augustus's assumptions about religion", "betting. internally, he is likely observing roman customs with a critical", "culturally distinct perspective. he appears unperturbed by the violence", "more interested in the social", "political dynamics of the roman court.", "herod is outwardly composed and amused", "displaying a cynical detachment from the spectacle. his tone is light and slightly mocking towards claudius's distress", "and playfully challenging towards augustus's assumptions about religion and betting. internally", "he is likely observing roman customs with a critical and culturally distinct perspective. he appears unperturbed by the violence and more interested in the social and political dynamics of the roman court."],
        ap.active_plans = ["To observe the Roman spectacle and the reactions of the imperial family, gathering insights into their values and power dynamics.", "To engage in diplomatic banter with Augustus, maintaining a balance of respect and cultural independence.", "To participate in the Emperor's betting game, initially declining on religious grounds but then accepting, demonstrating a pragmatic flexibility in Roman social customs."],
        ap.beliefs = ["Roman customs, including gladiatorial combat and casual betting on lives, are both barbaric and indicative of Roman power.", "Maintaining a degree of cultural and religious distinctiveness is important, but adaptability is necessary when dealing with Roman rulers.", "Pragmatism and witty diplomacy are effective tools for navigating interactions with powerful figures like Augustus."],
        ap.goals = ["Short-term: To enjoy the spectacle in his own detached manner and engage in courtly exchanges.", "Medium-term: To maintain a stable and beneficial relationship with the Roman Empire through diplomacy and understanding of Roman culture.", "Ultimate: To safeguard his own kingdom's interests by skillfully navigating the complexities of Roman power and influence while preserving his cultural identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands amid the intense atmosphere of the arena, her gaze fixed on the brutal spectacle before her. She watches the swordfight with a nostalgic expression, a slight furrow of sadness etching her brow as she recalls her late son, Drusus. Her posture is both regal and reflective, revealing a woman caught between the thrill of the moment and the weight of her loss.',
        ap.emotional_state = 'On the surface, Livia appears absorbed in the arena\'s excitement, yet her eyes betray a deep-seated grief as she reminisces about Drusus. Beneath her composed exterior is a poignant mix of longing and bitterness, reflecting how the violent entertainment stirs memories of familial love and loss. Her comments not only reveal her sorrow but hint at an enduring connection to her desires for her family\'s legacy.',
        ap.emotional_tags = ["on the surface, livia appears absorbed in the arena's excitement, yet her eyes betray a deep-seated grief as she reminisces about drusus. beneath her composed exterior is a poignant mix of longing", "bitterness, reflecting how the violent entertainment stirs memories of familial love", "loss. her comments not only reveal her sorrow but hint at an enduring connection to her desires for her family's legacy.", "on the surface", "livia appears absorbed in the arena's excitement", "yet her eyes betray a deep-seated grief as she reminisces about drusus. beneath her composed exterior is a poignant mix of longing and bitterness", "reflecting how the violent entertainment stirs memories of familial love and loss. her comments not only reveal her sorrow but hint at an enduring connection to her desires for her family's legacy.", "on the surface, livia appears absorbed in the arena's excitement, yet her eyes betray a deep-seated grief as she reminisces about drusus. beneath her composed exterior is a poignant mix of longing and bitterness, reflecting how the violent entertainment stirs memories of familial love and loss. her comments not only reveal her sorrow", "hint at an enduring connection to her desires for her family's legacy."],
        ap.active_plans = ["To maintain her composure in public while grappling with personal grief.", "To subtly influence those around her, reminding them of her family's legacy.", "To navigate her ambitions without revealing vulnerability, using nostalgia to garner sympathy."],
        ap.beliefs = ["Family ties dictate loyalty and responsibility, even in death.", "Power dynamics can shift based on emotional connections.", "The past is a double-edged sword that can be wielded for strength or vulnerability."],
        ap.goals = ["Short-term: To appear strong and composed while reflecting on her past.", "Medium-term: To ensure her family's legacy continues in the face of new challenges.", "Ultimate: To secure her son Tiberius's place in the imperial hierarchy while managing her grief."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Antonia stands beside Livia in the arena, her expression softening as she exchanges solemn words about Drusus. She leans slightly closer to Livia, sharing a moment of quiet reflection, her body language indicating empathy and support for her friend amidst the harsh spectacle.',
        ap.emotional_state = 'Antonia\'s emotional state is marked by a deep sense of compassion and sadness. She feels the weight of Livia\'s nostalgia and shares in the unspoken grief of losing Drusus. Her demeanor contrasts with the brutality of the arena, showcasing her capacity for empathy, making her a grounding presence in this moment filled with tension and remembrance.',
        ap.emotional_tags = ["antonia's emotional state is marked by a deep sense of compassion", "sadness. she feels the weight of livia's nostalgia", "shares in the unspoken grief of losing drusus. her demeanor contrasts with the brutality of the arena, showcasing her capacity for empathy, making her a grounding presence in this moment filled with tension", "remembrance.", "antonia's emotional state is marked by a deep sense of compassion and sadness. she feels the weight of livia's nostalgia and shares in the unspoken grief of losing drusus. her demeanor contrasts with the brutality of the arena", "showcasing her capacity for empathy", "making her a grounding presence in this moment filled with tension and remembrance."],
        ap.active_plans = ["To offer emotional support to Livia during this difficult moment.", "To foster a sense of camaraderie and shared sorrow in remembrance of Drusus.", "To navigate the political landscape delicately, ensuring her discussions do not provoke Livia's ambition."],
        ap.beliefs = ["Acknowledging grief is essential in forging deeper connections.", "The past shapes the present, and memories can bind or divide individuals.", "Empathy plays a crucial role in the complex dynamics of the imperial family."],
        ap.goals = ["Short-term: To comfort Livia and honor the memory of Drusus.", "Medium-term: To strengthen the bond with Livia amidst the turmoil of court politics.", "Ultimate: To navigate her position within the imperial family, fostering unity rather than division."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Emperor Augustus, with a sudden glint of playful mischief in his eyes, leans towards Herod, breaking the detached observation of the gladiatorial combat. He gestures slightly with his hand, as if casually tossing aside the gravity of the arena, initiating a wager with the client king. His posture is relaxed, almost regal in its nonchalance, suggesting a man completely at ease in wielding power and indulging in the spectacle.',
        ap.emotional_state = 'Augustus projects an air of jovial amusement and imperial confidence. On the surface, he\'s enjoying the games, finding entertainment in the brutal spectacle and the opportunity for a lighthearted bet. However, beneath this playful exterior, there\'s a subtle undercurrent of calculation. He might be testing Herod\'s reactions, subtly asserting his dominance even in casual exchanges, or simply indulging in the emperor\'s prerogative to find amusement wherever he pleases, even in matters of life and death.',
        ap.emotional_tags = ["augustus projects an air of jovial amusement", "imperial confidence. on the surface, he's enjoying the games, finding entertainment in the brutal spectacle", "the opportunity for a lighthearted bet. however, beneath this playful exterior, there's a subtle undercurrent of calculation. he might be testing herod's reactions, subtly asserting his dominance even in casual exchanges, or simply indulging in the emperor's prerogative to find amusement wherever he pleases, even in matters of life", "death.", "augustus projects an air of jovial amusement and imperial confidence. on the surface", "he's enjoying the games", "finding entertainment in the brutal spectacle and the opportunity for a lighthearted bet. however", "beneath this playful exterior", "there's a subtle undercurrent of calculation. he might be testing herod's reactions", "subtly asserting his dominance even in casual exchanges", "or simply indulging in the emperor's prerogative to find amusement wherever he pleases", "even in matters of life and death."],
        ap.active_plans = ["To engage Herod in a casual, power-affirming interaction.", "To demonstrate his imperial status and wealth through the act of betting gold.", "To momentarily alleviate the potential tension of the arena with a lighthearted proposition."],
        ap.beliefs = ["The Roman games are a fitting display of imperial power and entertainment.", "As Emperor, he has the authority and right to initiate wagers and engage in such casual displays of wealth.", "Life, especially in the context of gladiatorial combat, can be viewed with a degree of detachment and even used for amusement or wagering."],
        ap.goals = ["Short-term: To experience a moment of levity and amusement amidst the spectacle of the games.", "Medium-term: To reinforce his social dominance and imperial status through a casual display of wealth and power in front of a client king.", "Ultimate: To maintain his image as a powerful and confident emperor, in control of both the empire and the social dynamics within his court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Herod initially responds to Augustus with a composed and respectful demeanor, drawing back slightly as the Emperor proposes the bet. He explains his religious objection with a measured tone, maintaining eye contact but avoiding any overly enthusiastic acceptance. However, when Augustus playfully challenges his piety, Herod reconsiders, his posture shifting subtly as he decides to accept the wager, a flicker of pragmatic calculation now visible in his expression.',
        ap.emotional_state = 'Herod initially presents an outward appearance of religious conviction and principled refusal, seeking to maintain his cultural and religious identity in the Roman court. Internally, he is likely navigating a complex social situation. While he expresses a religious objection, his quick change of heart reveals a pragmatic awareness of the power dynamics at play. He might be experiencing a conflict between his stated beliefs and the social pressure from the Emperor, ultimately choosing to prioritize maintaining a good relationship with Augustus over rigid adherence to his initial stance.',
        ap.emotional_tags = ["herod initially presents an outward appearance of religious conviction", "principled refusal, seeking to maintain his cultural", "religious identity in the roman court. internally, he is likely navigating a complex social situation. while he expresses a religious objection, his quick change of heart reveals a pragmatic awareness of the power dynamics at play. he might be experiencing a conflict between his stated beliefs", "the social pressure from the emperor, ultimately choosing to prioritize maintaining a good relationship with augustus over rigid adherence to his initial stance.", "herod initially presents an outward appearance of religious conviction and principled refusal", "seeking to maintain his cultural and religious identity in the roman court. internally", "he is likely navigating a complex social situation. while he expresses a religious objection", "his quick change of heart reveals a pragmatic awareness of the power dynamics at play. he might be experiencing a conflict between his stated beliefs and the social pressure from the emperor", "ultimately choosing to prioritize maintaining a good relationship with augustus over rigid adherence to his initial stance."],
        ap.active_plans = ["Initially, to politely refuse the bet based on his religious principles.", "To clearly articulate his religious stance to Emperor Augustus, ensuring respectful communication.", "To reassess his position when challenged by Augustus, and strategically decide to accept the bet to avoid offense and potentially gain favor."],
        ap.beliefs = ["His religion prohibits gambling on human life, or at least it is presented as such to Augustus initially.", "Jews in general have a complex relationship with gambling, loving it yet fearing divine repercussions, indicating a cultural nuance he can leverage.", "Maintaining a positive relationship with the Roman Emperor and the imperial court is strategically important for his position and kingdom."],
        ap.goals = ["Short-term: To navigate the social interaction with Augustus in a way that is both respectful and avoids direct confrontation or offense.", "Medium-term: To maintain a favorable standing within the Roman sphere of influence and with Emperor Augustus personally.", "Ultimate: To protect the interests of his kingdom and potentially enhance his own position through strategic alliances and careful negotiation with the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Augustus stands near Herod, his demeanor a mix of joviality and imperial authority as he proposes a bet on the upcoming fight. His posture is relaxed but commanding, lean and engaged as he leans slightly forward, eagerly anticipating the outcome.',
        ap.emotional_state = 'Outwardly, Augustus appears confident and lighthearted, a gleam in his eye as he exchanges jokes with Herod. Internally, he grapples with the absurdity of life and death intertwined with politics, masking deeper insecurities about control and legacy with humor. This banter serves as a temporary escape from his looming familial pressures.',
        ap.emotional_tags = ["outwardly, augustus appears confident", "lighthearted, a gleam in his eye as he exchanges jokes with herod. internally, he grapples with the absurdity of life", "death intertwined with politics, masking deeper insecurities about control", "legacy with humor. this banter serves as a temporary escape from his looming familial pressures.", "outwardly", "augustus appears confident and lighthearted", "a gleam in his eye as he exchanges jokes with herod. internally", "he grapples with the absurdity of life and death intertwined with politics", "masking deeper insecurities about control and legacy with humor. this banter serves as a temporary escape from his looming familial pressures."],
        ap.active_plans = ["To engage with Herod in lighthearted banter to strengthen their rapport.", "To divert attention from the grim realities of the games through humor.", "To assert dominance and control in the conversation, showcasing his authority playfully."],
        ap.beliefs = ["Life is a grand spectacle where humor can alleviate tension.", "Control comes not only from power but also from social connections.", "The absurdity of betting on lives reflects the nature of Roman politics."],
        ap.goals = ["Short-term: To win a bet and enjoy the spectacle of the games.", "Medium-term: To strengthen his political alliance with Herod through shared experiences.", "Ultimate: To maintain a fa\u00e7ade of strength and control amidst the uncertainties of succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Herod stands beside Augustus, maintaining a relaxed but observant posture as he engages in playful dialogue. His movements are measured, and he gestures lightly, reflecting his detached amusement while weighing the absurdity of the situation.',
        ap.emotional_state = 'Herod shows a surface-level amusement, chuckling at Augustus\'s banter, but beneath lies a shrewd awareness of the precariousness of their situation. He balances his cynical view of power with a humorous commentary, revealing a mindset that blends pragmatism with a desire to maintain his position in the Roman court.',
        ap.emotional_tags = ["herod shows a surface-level amusement", "chuckling at augustus's banter", "but beneath lies a shrewd awareness of the precariousness of their situation. he balances his cynical view of power with a humorous commentary", "revealing a mindset that blends pragmatism with a desire to maintain his position in the roman court.", "herod shows a surface-level amusement, chuckling at augustus's banter,", "beneath lies a shrewd awareness of the precariousness of their situation. he balances his cynical view of power with a humorous commentary, revealing a mindset that blends pragmatism with a desire to maintain his position in the roman court."],
        ap.active_plans = ["To provide comic relief and lighten the grim atmosphere of the arena.", "To test Augustus's thoughts on religion and gambling, gauging their rapport.", "To reinforce his own cultural identity while navigating the Roman elite."],
        ap.beliefs = ["Humor can bridge cultural divides and foster relationships.", "The political game is as much about perception as it is about reality.", "Faith and gambling reflect the same human desires for control and fortune."],
        ap.goals = ["Short-term: To engage in clever banter and maintain camaraderie with Augustus.", "Medium-term: To assert his cultural perspective without alienating his Roman peers.", "Ultimate: To secure his position and influence within the shifting dynamics of the Roman court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Livilla is an active spectator in the arena, her attention fully captivated by the unfolding gladiatorial combat. She punctuates the tense atmosphere with bursts of clapping, her hands coming together with youthful vigour as she leans forward, eagerly watching the fight. Her body language is animated and engaged, a stark contrast to the more reserved demeanour of others present, indicating her wholehearted embrace of the spectacle.',
        ap.emotional_state = 'Livilla is in a state of overt excitement and youthful thrill. On the surface, she expresses unbridled enthusiasm for the violent spectacle, her cheers ringing out with an almost innocent delight. Internally, this likely reflects a genuine, if somewhat naive, fascination with the raw power and drama of the arena. There\'s a sense of being caught up in the moment, perhaps without fully processing the brutal reality of the life-and-death struggle before her, indicating a youthful eagerness to embrace the spectacle of Roman power.',
        ap.emotional_tags = ["livilla is in a state of overt excitement", "youthful thrill. on the surface, she expresses unbridled enthusiasm for the violent spectacle, her cheers ringing out with an almost innocent delight. internally, this likely reflects a genuine, if somewhat naive, fascination with the raw power", "drama of the arena. there's a sense of being caught up in the moment, perhaps without fully processing the brutal reality of the life-and-death struggle before her, indicating a youthful eagerness to embrace the spectacle of roman power.", "livilla is in a state of overt excitement and youthful thrill. on the surface", "she expresses unbridled enthusiasm for the violent spectacle", "her cheers ringing out with an almost innocent delight. internally", "this likely reflects a genuine", "if somewhat naive", "fascination with the raw power and drama of the arena. there's a sense of being caught up in the moment", "perhaps without fully processing the brutal reality of the life-and-death struggle before her", "indicating a youthful eagerness to embrace the spectacle of roman power."],
        ap.active_plans = ["To fully immerse herself in the spectacle of the gladiatorial combat and derive entertainment from the violent display.", "To express her excitement openly, conforming to the expected enthusiastic reactions of the Roman audience at the games.", "To perhaps subtly position herself as aligned with the more dominant, less sensitive members of her family, in contrast to figures like Claudius who display discomfort."],
        ap.beliefs = ["Gladiatorial combat is a thrilling and acceptable form of Roman entertainment, a demonstration of strength and imperial power.", "Expressing outward enthusiasm for such spectacles is socially appropriate and aligns with Roman values of appreciating strength and spectacle.", "Displays of dominance and victory, even through violence, are inherently exciting and worthy of celebration and vocal encouragement."],
        ap.goals = ["Short-term: To experience the immediate thrill and excitement of the gladiatorial games in the arena, enjoying the spectacle in the present moment.", "Medium-term: To reinforce her social standing within the imperial family and Roman society by actively participating in and visibly enjoying public spectacles.", "Ultimate: To solidify her position and influence within the Roman power structure, demonstrating her alignment with Roman values and perhaps subtly contrasting herself with those perceived as weaker or more sensitive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Postumus stands nearby, his body tense and alert, eyes fixed on Claudius as he witnesses him succumb to the overpowering atmosphere of the arena. He instinctively moves closer, his posture protective, ready to act as the situation escalates.',
        ap.emotional_state = 'Concern and urgency dominate Postumus\'s emotional landscape. Outwardly, he displays anxiety over Claudius\'s fainting, responding quickly to the distress. Internally, he grapples with a surge of protective instincts, feeling the weight of responsibility as he steps forward to help, acknowledging Claudius\'s vulnerability amidst the chaos.',
        ap.emotional_tags = ["concern", "urgency dominate postumus's emotional landscape. outwardly, he displays anxiety over claudius's fainting, responding quickly to the distress. internally, he grapples with a surge of protective instincts, feeling the weight of responsibility as he steps forward to help, acknowledging claudius's vulnerability amidst the chaos.", "concern and urgency dominate postumus's emotional landscape. outwardly", "he displays anxiety over claudius's fainting", "responding quickly to the distress. internally", "he grapples with a surge of protective instincts", "feeling the weight of responsibility as he steps forward to help", "acknowledging claudius's vulnerability amidst the chaos."],
        ap.active_plans = ["Ensure Claudius is safe and regroup after his fainting spell.", "Assess the reactions of those around him to gauge their perceptions of both Claudius and himself.", "Explore the potential for alliance with Claudius, recognizing their shared experience in the treacherous environment of the arena."],
        ap.beliefs = ["Family bonds are crucial, and protecting Claudius may strengthen their relationship.", "His actions in moments of crisis define his character and potential for acceptance within his family.", "Vulnerability is a shared experience that can bridge gaps between them, despite their differences."],
        ap.goals = ["Short-term: Ensure Claudius recovers from his fainting spell without further embarrassment.", "Medium-term: Establish a supportive rapport with Claudius, positioning himself as a trusted ally.", "Ultimate: Secure his place within the imperial family and reclaim his stature through acts of valor and loyalty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands rigidly, his eyes wide with anxiety, breathing shallowly as the arena atmosphere overwhelms him. He attempts to watch the swordfight but ultimately succumbs to the stress, fainting and losing consciousness, leaving him vulnerable and exposed.',
        ap.emotional_state = 'Claudius experiences a tumultuous storm of fear and anxiety. Outwardly, he stammers in distress, desperately trying to cope with the overwhelming spectacle. Internally, a sense of isolation and inadequacy grips him, amplifying his insecurities as he longs for acceptance but finds himself paralyzed by the brutality around him.',
        ap.emotional_tags = ["claudius experiences a tumultuous storm of fear", "anxiety. outwardly, he stammers in distress, desperately trying to cope with the overwhelming spectacle. internally, a sense of isolation", "inadequacy grips him, amplifying his insecurities as he longs for acceptance but finds himself paralyzed by the brutality around him.", "claudius experiences a tumultuous storm of fear and anxiety. outwardly", "he stammers in distress", "desperately trying to cope with the overwhelming spectacle. internally", "a sense of isolation and inadequacy grips him", "amplifying his insecurities as he longs for acceptance but finds himself paralyzed by the brutality around him.", "claudius experiences a tumultuous storm of fear and anxiety. outwardly, he stammers in distress, desperately trying to cope with the overwhelming spectacle. internally, a sense of isolation and inadequacy grips him, amplifying his insecurities as he longs for acceptance", "finds himself paralyzed by the brutality around him."],
        ap.active_plans = ["Attempt to remain composed and engaged in the excitement of the arena despite his fears.", "Seek the approval of those around him, especially in front of Livia and Augustus.", "Ultimately, confront his anxieties regarding his place within the family and his identity."],
        ap.beliefs = ["His physical and emotional vulnerabilities define how others perceive him in this brutal environment.", "Acceptance within his family is elusive, making moments like this feel particularly isolating.", "The arena is a microcosm of the brutal dynamics of his family, where only the strong survive."],
        ap.goals = ["Short-term: Stay conscious and engaged during the fight, trying to overcome his anxiousness.", "Medium-term: Navigate the complex social dynamics among his family members and find a place in their eyes.", "Ultimate: Transform his perceived weaknesses into strengths that can earn him respect and recognition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Postumus stands agitated in the dimly lit palace corridor, confronting Livilla. He is physically demonstrative, reaching out to her and confessing his struggle to resist her allure. When Livilla recoils and cries for help, Postumus is caught off guard, protesting his innocence and attempting to expose Livilla\'s deception to the arriving Augustus and Castor, but his pleas fall on deaf ears as he is ultimately arrested and led away by guards.',
        ap.emotional_state = 'Postumus is a tempest of conflicting emotions. On the surface, he is consumed by lust and frustration, boldly expressing his desire for Livilla, driven by a yearning for connection. Beneath this veneer of passion, there\'s a simmering desperation and perhaps a nascent suspicion that he\'s walking into a trap. When accused, his emotions shift to outrage and betrayal, as he realizes the depth of Livilla\'s deceit and the hopelessness of his situation. He is emotionally exposed and vulnerable, his volatile nature easily manipulated against him.',
        ap.emotional_tags = ["postumus is a tempest of conflicting emotions. on the surface, he is consumed by lust", "frustration, boldly expressing his desire for livilla, driven by a yearning for connection. beneath this veneer of passion, there's a simmering desperation", "perhaps a nascent suspicion that he's walking into a trap. when accused, his emotions shift to outrage", "betrayal, as he realizes the depth of livilla's deceit", "the hopelessness of his situation. he is emotionally exposed", "vulnerable, his volatile nature easily manipulated against him.", "postumus is a tempest of conflicting emotions. on the surface", "he is consumed by lust and frustration", "boldly expressing his desire for livilla", "driven by a yearning for connection. beneath this veneer of passion", "there's a simmering desperation and perhaps a nascent suspicion that he's walking into a trap. when accused", "his emotions shift to outrage and betrayal", "as he realizes the depth of livilla's deceit and the hopelessness of his situation. he is emotionally exposed and vulnerable", "his volatile nature easily manipulated against him."],
        ap.active_plans = ["Express his pent-up desire for Livilla, hoping for reciprocation or at least acknowledgement.", "Question Livilla about her husband's absence to gauge the possibility of intimacy and the safety of the situation.", "Defend himself against Livilla's sudden accusations and expose her deception to Augustus in a desperate attempt to salvage his reputation and freedom."],
        ap.beliefs = ["Livilla might be genuinely attracted to him, or at least susceptible to his advances given her husband's supposed absence.", "Honesty and directness, even in a clandestine encounter, might be effective in communicating his feelings and intentions.", "Augustus, despite his position and power, is potentially blind to the manipulative nature of those closest to him, especially Livia and her family."],
        ap.goals = ["Short-term: To achieve physical intimacy with Livilla and fulfill his desires in the moment.", "Medium-term: To establish a clandestine affair with Livilla, seeking affection and validation that he lacks elsewhere.", "Ultimate: To find acceptance and belonging within the imperial family, a desire tragically undermined by his own impulsiveness and the machinations of others."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Livilla stands in the dimly lit corridor, initially engaging with Postumus, feigning a seductive allure as she draws him closer with whispered words. This performance abruptly shifts when she recoils violently, slapping Postumus and escalating into cries for help, falsely accusing him of attempted rape. As Augustus and Castor arrive, Livilla maintains a convincing facade of terror and victimhood, solidifying the false narrative and ensuring Postumus\'s condemnation.',
        ap.emotional_state = 'Livilla is a study in calculated deception. Outwardly, she projects fear and outrage, a terrified victim of Postumus\'s aggression, using trembling voice and dramatic cries for help. Internally, she remains icily composed, executing a pre-planned manipulation with cold precision. There is a stark and chilling contrast between her feigned vulnerability and her ruthless intent to destroy Postumus\'s standing. Her true emotion is ambition, masked by a performance of distress to achieve her objectives and serve the larger schemes of her family, particularly Livia\'s.',
        ap.emotional_tags = ["livilla is a study in calculated deception. outwardly, she projects fear", "outrage, a terrified victim of postumus's aggression, using trembling voice", "dramatic cries for help. internally, she remains icily composed, executing a pre-planned manipulation with cold precision. there is a stark", "chilling contrast between her feigned vulnerability", "her ruthless intent to destroy postumus's standing. her true emotion is ambition, masked by a performance of distress to achieve her objectives", "serve the larger schemes of her family, particularly livia's.", "livilla is a study in calculated deception. outwardly", "she projects fear and outrage", "a terrified victim of postumus's aggression", "using trembling voice and dramatic cries for help. internally", "she remains icily composed", "executing a pre-planned manipulation with cold precision. there is a stark and chilling contrast between her feigned vulnerability and her ruthless intent to destroy postumus's standing. her true emotion is ambition", "masked by a performance of distress to achieve her objectives and serve the larger schemes of her family", "particularly livia's."],
        ap.active_plans = ["Lure Postumus into a compromising situation by feigning reciprocation of his advances, creating a believable scenario for her accusation.", "Stage a convincing false accusation of attempted rape, using physical actions and vocal performance to manipulate Augustus's perception.", "Ensure Postumus's immediate arrest and condemnation by maintaining her victim persona and leveraging Augustus's protective instincts and pre-existing biases."],
        ap.beliefs = ["Postumus is easily manipulated by her allure and desires, making him a vulnerable target for her scheme.", "Augustus is more inclined to believe a woman's accusation of sexual assault, especially against the volatile and less favored Postumus.", "Sacrificing Postumus is a necessary step to secure her family's position and eliminate a potential threat to Tiberius's succession, furthering Livia's agenda."],
        ap.goals = ["Short-term: To successfully frame Postumus for attempted rape, leading to his immediate arrest and removal from court.", "Medium-term: To discredit and neutralize Postumus as a political threat, ensuring he can no longer challenge Tiberius's claim to succession.", "Ultimate: To consolidate her family's power and influence within the Roman Empire, aligning with Livia's ambitions and securing a more advantageous position for herself and her lineage in the long run."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Postumus stands in the dimly lit corridor, visibly agitated as he confronts Livilla. His posture is tense, fists clenching at his sides, reflecting his frustration and desire for her affection. When Livilla recoils and slaps him, he is taken aback, stumbling slightly as he processes the betrayal.',
        ap.emotional_state = 'Postumus\'s surface emotions fluctuate between anger and confusion. He feels a deep sense of injustice as Livilla accuses him of violence, and his internal state is plagued by insecurity, feeling both desperate for her approval and enraged by her deception. The accusation ignites a fierce defensiveness, revealing the tumultuous conflict lying beneath his passionate exterior.',
        ap.emotional_tags = ["postumus's surface emotions fluctuate between anger", "confusion. he feels a deep sense of injustice as livilla accuses him of violence,", "his internal state is plagued by insecurity, feeling both desperate for her approval", "enraged by her deception. the accusation ignites a fierce defensiveness, revealing the tumultuous conflict lying beneath his passionate exterior.", "postumus's surface emotions fluctuate between anger and confusion. he feels a deep sense of injustice as livilla accuses him of violence", "and his internal state is plagued by insecurity", "feeling both desperate for her approval and enraged by her deception. the accusation ignites a fierce defensiveness", "revealing the tumultuous conflict lying beneath his passionate exterior."],
        ap.active_plans = ["Defend himself against Livilla's false accusations of assault.", "Seek to reveal Livilla's manipulative nature to Augustus to clear his name.", "Reassert his claim to acceptance and recognition within the imperial family."],
        ap.beliefs = ["He believes Livilla is using her charm and deceit to manipulate the situation to her advantage.", "He feels that the truth of his innocence will eventually prevail if he can expose Livilla's lies.", "He is convinced that his family's tragic history makes him a target of conspiracy and betrayal."],
        ap.goals = ["Short-term: Convince Augustus of his innocence in the face of Livilla's accusations.", "Medium-term: Secure his position and influence within the imperial family despite the scandal.", "Ultimate: Gain acceptance and prove himself worthy of his lineage, breaking the cycle of betrayal surrounding him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Livilla stands poised and elegant in the corridor, her posture confident and deliberate as she moves closer to Postumus. When she unexpectedly slaps him, she shifts from a seductive demeanor to one of feigned terror, her body language radically transforming as she seeks to manipulate the situation to her advantage.',
        ap.emotional_state = 'Outwardly, Livilla projects distress and fear, her voice trembling as she screams for help. Internally, she revels in the chaos she\'s orchestrated, feeling a sense of power and control over the narrative. This sharp contrast between her external panic and internal triumph highlights her cunning nature, revealing her enjoyment in manipulating those around her.',
        ap.emotional_tags = ["outwardly, livilla projects distress", "fear, her voice trembling as she screams for help. internally, she revels in the chaos she's orchestrated, feeling a sense of power", "control over the narrative. this sharp contrast between her external panic", "internal triumph highlights her cunning nature, revealing her enjoyment in manipulating those around her.", "outwardly", "livilla projects distress and fear", "her voice trembling as she screams for help. internally", "she revels in the chaos she's orchestrated", "feeling a sense of power and control over the narrative. this sharp contrast between her external panic and internal triumph highlights her cunning nature", "revealing her enjoyment in manipulating those around her."],
        ap.active_plans = ["Create a scene that will draw attention and paint Postumus as the aggressor.", "Use her cries for help to manipulate Augustus into believing her fabricated story.", "Secure her position and influence within the court by eliminating Postumus as a rival."],
        ap.beliefs = ["She believes that power can be obtained through manipulation and deceit, using her beauty and charm as tools.", "She is convinced that by removing threats like Postumus, she can ensure her own security and that of her family.", "She feels justified in her actions, viewing them as necessary for her ambition to elevate her own status within the imperial family."],
        ap.goals = ["Short-term: Successfully frame Postumus as an aggressor to divert attention from her own manipulations.", "Medium-term: Strengthen her family's position in the court by eliminating potential rivals like Postumus.", "Ultimate: Ascend to a position of greater power within the imperial family, ensuring her son\u2019s legacy remains unchallenged."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Postumus stands in the palace corridor, initially reaching for Livilla, then recoiling in pain from her slap and bewildered by her sudden accusations. He becomes increasingly agitated and defensive as Augustus enters, gesturing emphatically while trying to explain the situation, his voice rising in desperation as he accuses Livilla of lying and implicates Livia in a larger conspiracy against him and his family.',
        ap.emotional_state = 'Postumus begins in a state of arousal and anticipation, quickly shifting to shock and pain upon being slapped. Confusion and betrayal then surge as he realizes he\'s been set up, rapidly escalating to anger and desperation. Beneath the surface, a deep-seated fear and resentment towards Livia and the imperial family fuels his outburst, as he feels cornered and unjustly accused, his pleas tinged with a sense of hopelessness against the overwhelming power stacked against him.',
        ap.emotional_tags = ["postumus begins in a state of arousal", "anticipation, quickly shifting to shock", "pain upon being slapped. confusion", "betrayal then surge as he realizes he's been set up, rapidly escalating to anger", "desperation. beneath the surface, a deep-seated fear", "resentment towards livia", "the imperial family fuels his outburst, as he feels cornered", "unjustly accused, his pleas tinged with a sense of hopelessness against the overwhelming power stacked against him.", "postumus begins in a state of arousal and anticipation", "quickly shifting to shock and pain upon being slapped. confusion and betrayal then surge as he realizes he's been set up", "rapidly escalating to anger and desperation. beneath the surface", "a deep-seated fear and resentment towards livia and the imperial family fuels his outburst", "as he feels cornered and unjustly accused", "his pleas tinged with a sense of hopelessness against the overwhelming power stacked against him."],
        ap.active_plans = ["Defend himself against the false accusation of attempted rape.", "Expose Livilla's deceit and reveal her manipulative nature to Augustus.", "Alert Augustus to Livia's broader scheme to eliminate potential heirs and consolidate power for Tiberius."],
        ap.beliefs = ["He believes Livilla lured him into this situation as part of a deliberate trap.", "He is convinced that Livia is the mastermind behind a plot to remove him from succession.", "He holds the conviction that Augustus is tragically blind to the true nature of Livia's ambition and treachery."],
        ap.goals = ["short-term\": \"To convince Augustus of his innocence in the immediate situation and avoid immediate punishment.", "medium-term\": \"To expose Livia's machinations and open Augustus's eyes to the dangers within his own family.", "ultimate\": \"To survive the deadly court politics, regain Augustus's favor, and secure his rightful place within the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Livilla initially stands close to Postumus, whispering seductively, then executes a swift and dramatic transformation, recoiling and screaming as if attacked. She positions herself centrally in the corridor, feigning terror and distress, gesturing towards Postumus while loudly proclaiming him a rapist. Her performance is designed to be instantly convincing to Augustus, manipulating his protective instincts and reinforcing a false narrative of victimhood.',
        ap.emotional_state = 'On the surface, Livilla expertly projects terror and outrage, employing cries and dramatic gestures to convey the image of a violated woman. Internally, she is cold and calculating, experiencing a thrill of control as her plan unfolds flawlessly. Beneath this facade lies a ruthless ambition and a satisfaction in her manipulative prowess, devoid of remorse for the damage inflicted on Postumus, her emotions entirely subordinated to her strategic objectives and loyalty to Livia\'s grand design.',
        ap.emotional_tags = ["on the surface, livilla expertly projects terror", "outrage, employing cries", "dramatic gestures to convey the image of a violated woman. internally, she is cold", "calculating, experiencing a thrill of control as her plan unfolds flawlessly. beneath this facade lies a ruthless ambition", "a satisfaction in her manipulative prowess, devoid of remorse for the damage inflicted on postumus, her emotions entirely subordinated to her strategic objectives", "loyalty to livia's grand design.", "on the surface", "livilla expertly projects terror and outrage", "employing cries and dramatic gestures to convey the image of a violated woman. internally", "she is cold and calculating", "experiencing a thrill of control as her plan unfolds flawlessly. beneath this facade lies a ruthless ambition and a satisfaction in her manipulative prowess", "devoid of remorse for the damage inflicted on postumus", "her emotions entirely subordinated to her strategic objectives and loyalty to livia's grand design."],
        ap.active_plans = ["Solidify the false narrative of Postumus as a violent attacker and attempted rapist.", "Ensure Postumus is immediately condemned and punished by Augustus, removing him as a threat.", "Maintain her innocent facade and gain sympathy and support from Augustus and others in the court."],
        ap.beliefs = ["She believes Postumus's volatile nature makes him a credible target for such an accusation.", "She is confident in her ability to manipulate Augustus's emotions and biases through a convincing performance.", "She firmly believes that eliminating Postumus is necessary for the stability of the dynasty and the advancement of Tiberius's claim."],
        ap.goals = ["short-term\": \"To successfully stage the rape accusation and have Augustus believe her account without question.", "medium-term\": \"To orchestrate Postumus's complete disgrace and removal from any position of influence or succession.", "ultimate\": \"To secure her family's power, enhance her own standing within the court, and contribute to Livia's overarching scheme to ensure Tiberius's ascension to the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Augustus bursts into the corridor, face contorted with fury, immediately directing his rage at Postumus. He physically confronts Postumus with accusations and demands, his body language and tone conveying utter disbelief and condemnation. He stands protectively beside Livilla, his presence and authority solidifying the false narrative, and he remains unmoved by Postumus\'s desperate pleas and accusations against Livia.',
        ap.emotional_state = 'Augustus is consumed by a potent mix of rage and paternalistic protectiveness towards Livilla, instantly triggered by her cries and apparent distress. His fury is fueled by a pre-existing distrust of Postumus and a deep-seated weariness with familial discord. Beneath the surface, there\'s a profound blindness, a willful refusal to consider any version of events that challenges his established perceptions, making him emotionally vulnerable to Livilla\'s manipulation and tragically detached from the truth of the situation.',
        ap.emotional_tags = ["augustus is consumed by a potent mix of rage", "paternalistic protectiveness towards livilla, instantly triggered by her cries", "apparent distress. his fury is fueled by a pre-existing distrust of postumus", "a deep-seated weariness with familial discord. beneath the surface, there's a profound blindness, a willful refusal to consider any version of events that challenges his established perceptions, making him emotionally vulnerable to livilla's manipulation", "tragically detached from the truth of the situation.", "augustus is consumed by a potent mix of rage and paternalistic protectiveness towards livilla", "instantly triggered by her cries and apparent distress. his fury is fueled by a pre-existing distrust of postumus and a deep-seated weariness with familial discord. beneath the surface", "there's a profound blindness", "a willful refusal to consider any version of events that challenges his established perceptions", "making him emotionally vulnerable to livilla's manipulation and tragically detached from the truth of the situation."],
        ap.active_plans = ["Immediately subdue and punish Postumus for his perceived violent attack on Livilla.", "Assert his imperial authority and restore order in what he perceives as a blatant act of aggression.", "Comfort and reassure Livilla, reinforcing his role as her protector and validating her victimhood."],
        ap.beliefs = ["He believes Livilla is genuinely terrified and a victim of Postumus's violent tendencies.", "He is convinced Postumus is inherently unstable and capable of such an assault, reinforcing his negative bias.", "He holds a firm belief in his own judgment and is resistant to any narrative that contradicts his initial assessment of the situation."],
        ap.goals = ["short-term\": \"To immediately end what he believes to be Postumus's attack and inflict swift punishment.", "medium-term\": \"To quell any further disruption within his family and reassert his control over potential threats to familial harmony.", "ultimate\": \"To maintain the illusion of order and stability within his empire and family, even if it means ignoring uncomfortable truths and perpetuating injustices based on manipulated appearances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Postumus stands agitated in the dimly lit corridor, his posture tense and confrontational as he defiantly attempts to safeguard his reputation against a tide of accusations. His hands clench tightly, and he gestures animatedly, reflecting his desperation and urgency in the moment.',
        ap.emotional_state = 'Postumus\'s surface emotions are marked by agitation and indignation, his voice rising as he attempts to assert his innocence. Internally, he wrestles with fear and paranoia, knowing the stakes are high. His anger is layered with a sense of vulnerability, feeling trapped by the machinations of those around him, particularly Livia\'s potential manipulations.',
        ap.emotional_tags = ["postumus's surface emotions are marked by agitation", "indignation, his voice rising as he attempts to assert his innocence. internally, he wrestles with fear", "paranoia, knowing the stakes are high. his anger is layered with a sense of vulnerability, feeling trapped by the machinations of those around him, particularly livia's potential manipulations.", "postumus's surface emotions are marked by agitation and indignation", "his voice rising as he attempts to assert his innocence. internally", "he wrestles with fear and paranoia", "knowing the stakes are high. his anger is layered with a sense of vulnerability", "feeling trapped by the machinations of those around him", "particularly livia's potential manipulations."],
        ap.active_plans = ["To defend himself against Livilla's accusations and assert his innocence.", "To redirect suspicion towards Livia, suggesting her machinations are at play.", "To provoke Augustus into a confrontation that may yield a moment of clarity about the deeper intrigues within the family."],
        ap.beliefs = ["That truth will eventually prevail, and he can prove his innocence.", "That Livia's ambition is a genuine threat to his position and that Augustus is blind to her manipulations.", "That his familial connections should afford him protection and understanding from Augustus."],
        ap.goals = ["Short-term: To stave off imminent punishment by convincing Augustus of his innocence.", "Medium-term: To reveal the true nature of the family dynamics and the danger posed by Livia.", "Ultimate: To reclaim his position within the imperial family and ensure his survival against the backdrop of court intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Livilla stands poised and beautiful, her expression a carefully orchestrated mix of innocence and fear. As the confrontation escalates, she shifts her body language from initially seductive to defensive, employing a dramatic recoil from Postumus\'s approach, which further accentuates the tension in the air.',
        ap.emotional_state = 'On the surface, Livilla exudes a facade of horror and vulnerability, her pleas for help piercing the atmosphere. Internally, however, she revels in the chaos she has created, masking her strategic cunning behind a guise of victimhood. Her unspoken conflict lies in the thrill of manipulation clashing with the risk of exposure.',
        ap.emotional_tags = ["on the surface, livilla exudes a facade of horror", "vulnerability, her pleas for help piercing the atmosphere. internally, however, she revels in the chaos she has created, masking her strategic cunning behind a guise of victimhood. her unspoken conflict lies in the thrill of manipulation clashing with the risk of exposure.", "on the surface", "livilla exudes a facade of horror and vulnerability", "her pleas for help piercing the atmosphere. internally", "however", "she revels in the chaos she has created", "masking her strategic cunning behind a guise of victimhood. her unspoken conflict lies in the thrill of manipulation clashing with the risk of exposure."],
        ap.active_plans = ["To manipulate the situation to her advantage by portraying herself as the victim.", "To alienate Postumus further from Augustus through dramatic accusations.", "To maintain her position and influence over the court while avoiding repercussions."],
        ap.beliefs = ["That she must eliminate threats to her ambitions, even if it means sacrificing others.", "That perception is reality, and she must ensure Augustus sees her as blameless.", "That her beauty and charm can manipulate others to do her bidding without repercussions."],
        ap.goals = ["Short-term: To successfully frame Postumus and avoid blame for the encounter.", "Medium-term: To strengthen her control within the court by discrediting rivals.", "Ultimate: To secure a powerful position for herself and her preferred allies in the imperial hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the corridor with a stormy expression, his presence commanding and filled with authority. His movements are abrupt, and his gestures are decisive, emphasizing his confrontational stance as he questions Postumus. He stands protectively by Livilla, projecting both concern and anger.',
        ap.emotional_state = 'Augustus displays anger and disappointment towards Postumus, his mind racing with the implications of the accusations. Beneath his furious facade, there is a deep-seated fear of betrayal within his family, reflecting his paranoia and vulnerability. He struggles with the conflicting need to protect his family while maintaining control over the situation.',
        ap.emotional_tags = ["augustus displays anger", "disappointment towards postumus, his mind racing with the implications of the accusations. beneath his furious facade, there is a deep-seated fear of betrayal within his family, reflecting his paranoia", "vulnerability. he struggles with the conflicting need to protect his family while maintaining control over the situation.", "augustus displays anger and disappointment towards postumus", "his mind racing with the implications of the accusations. beneath his furious facade", "there is a deep-seated fear of betrayal within his family", "reflecting his paranoia and vulnerability. he struggles with the conflicting need to protect his family while maintaining control over the situation.", "augustus displays anger and disappointment towards postumus, his mind racing with the implications of the accusations. beneath his furious facade, there is a deep-seated fear of betrayal within his family, reflecting his paranoia and vulnerability. he struggles with the conflicting need to protect his family", "maintaining control over the situation."],
        ap.active_plans = ["To defend Livilla and ensure her safety against what he perceives as a dangerous accusation.", "To impose his authority and maintain order in the chaotic confrontation.", "To uncover the truth of the situation while managing his family's reputation."],
        ap.beliefs = ["That loyalty is paramount, and he must protect those close to him, especially Livilla.", "That threats to his family must be dealt with swiftly and decisively.", "That appearances matter greatly, and he must uphold the dignity of his family at all costs."],
        ap.goals = ["Short-term: To quell the uproar and ascertain the truth behind the accusations.", "Medium-term: To reinforce his image as a strong leader and protector of his family.", "Ultimate: To navigate the treacherous waters of succession and protect his dynasty from internal strife."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Livia enters the scene with a composed and calculating demeanor, her presence sharp and observant. She remains in the background, her posture relaxed yet alert, keenly listening to the exchange while subtly assessing the fallout from the accusations.',
        ap.emotional_state = 'Livia maintains a facade of calmness, her expression unreadable as she processes the unfolding drama. Internally, she feels a sense of strategic satisfaction as she realizes the chaos serves her interests. Her unspoken conflict revolves around controlling the narrative and ensuring her son’s ascent remains unaffected by this turmoil.',
        ap.emotional_tags = ["livia maintains a facade of calmness, her expression unreadable as she processes the unfolding drama. internally, she feels a sense of strategic satisfaction as she realizes the chaos serves her interests. her unspoken conflict revolves around controlling the narrative", "ensuring her son\u2019s ascent remains unaffected by this turmoil.", "livia maintains a facade of calmness", "her expression unreadable as she processes the unfolding drama. internally", "she feels a sense of strategic satisfaction as she realizes the chaos serves her interests. her unspoken conflict revolves around controlling the narrative and ensuring her son\u2019s ascent remains unaffected by this turmoil."],
        ap.active_plans = ["To observe and gather information from the confrontation for future leverage.", "To subtly guide Augustus's response to ensure it aligns with her ambitions.", "To protect her family\u2019s interests while drawing suspicion away from herself."],
        ap.beliefs = ["That chaos can be advantageous if it can be controlled and utilized.", "That the ends justify the means, especially in securing power for Tiberius.", "That she must remain several moves ahead in the deadly game of court politics."],
        ap.goals = ["Short-term: To ensure the incident does not compromise her plans for Tiberius.", "Medium-term: To manipulate the situation to further isolate potential threats.", "Ultimate: To solidify her family's power while removing obstacles in their path."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Postumus stands accused, cornered in the palace corridor. He is physically present but powerless, his movements restricted by the guards who have apprehended him. He gesticulates wildly as he speaks, his voice rising in desperation as he unleashes a torrent of accusations against Livia, pointing and gesturing towards her and Augustus to emphasize his points, trying to break through Augustus\'s fury and denial.',
        ap.emotional_state = 'Postumus is a volcano of raw emotion. Outwardly, he is enraged and defiant, shouting accusations and insults at Livilla and Livia. Beneath the surface, there\'s a deep well of despair and betrayal. He feels utterly abandoned and unjustly accused. His anger is fueled by a sense of injustice and the fear of his impending doom, mixed with a desperate hope that he can still break through Augustus\'s denial and make him see the truth before it\'s too late.',
        ap.emotional_tags = ["postumus is a volcano of raw emotion. outwardly, he is enraged", "defiant, shouting accusations", "insults at livilla", "livia. beneath the surface, there's a deep well of despair", "betrayal. he feels utterly abandoned", "unjustly accused. his anger is fueled by a sense of injustice", "the fear of his impending doom, mixed with a desperate hope that he can still break through augustus's denial", "make him see the truth before it's too late.", "postumus is a volcano of raw emotion. outwardly", "he is enraged and defiant", "shouting accusations and insults at livilla and livia. beneath the surface", "there's a deep well of despair and betrayal. he feels utterly abandoned and unjustly accused. his anger is fueled by a sense of injustice and the fear of his impending doom", "mixed with a desperate hope that he can still break through augustus's denial and make him see the truth before it's too late."],
        ap.active_plans = ["Expose Livia's alleged crimes to Augustus, hoping to shatter his blind faith in her.", "Discredit Livilla's rape accusation by highlighting her manipulative nature and Livia's influence.", "Provoke an emotional reaction in Augustus that will force him to question the official narrative and consider the possibility of Livia's treachery."],
        ap.beliefs = ["Livia is a ruthless and murderous woman who has systematically eliminated his family members.", "Augustus is dangerously naive and blinded by his love and trust for Livia.", "Livilla is a pawn in Livia's game, willingly participating in the deception to serve her own ambitions and her grandmother's agenda."],
        ap.goals = ["Short-term: To make Augustus question Livia's innocence and see through Livilla's lies in this immediate confrontation.", "Medium-term: To avoid banishment or death by convincing Augustus of the truth and escaping Livia's grasp.", "Ultimate: To expose Livia's crimes to the Roman court and achieve justice for his murdered family, even if it's a posthumous victory."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Livilla positions herself as the traumatized victim. She stands near Augustus, leaning on him for support, her posture conveying vulnerability and fear. She uses gestures of recoiling and trembling to emphasize her supposed terror and innocence, her voice trembling as she recounts the fabricated attack, ensuring Augustus witnesses her \'distress\'.',
        ap.emotional_state = 'Livilla is performing a calculated act of distress. Outwardly, she displays terror and victimhood, with cries for help and trembling. Internally, she is cold and calculating, focused on maintaining her deception and ensuring Postumus is condemned. There\'s a stark contrast between her manufactured fear and her controlled manipulation, driven by ambition and loyalty to Livia\'s schemes. She experiences a thrill in her successful deception, but also a cold resolve to see it through.',
        ap.emotional_tags = ["livilla is performing a calculated act of distress. outwardly, she displays terror", "victimhood, with cries for help", "trembling. internally, she is cold", "calculating, focused on maintaining her deception", "ensuring postumus is condemned. there's a stark contrast between her manufactured fear", "her controlled manipulation, driven by ambition", "loyalty to livia's schemes. she experiences a thrill in her successful deception, but also a cold resolve to see it through.", "livilla is performing a calculated act of distress. outwardly", "she displays terror and victimhood", "with cries for help and trembling. internally", "she is cold and calculating", "focused on maintaining her deception and ensuring postumus is condemned. there's a stark contrast between her manufactured fear and her controlled manipulation", "driven by ambition and loyalty to livia's schemes. she experiences a thrill in her successful deception", "but also a cold resolve to see it through.", "livilla is performing a calculated act of distress. outwardly, she displays terror and victimhood, with cries for help and trembling. internally, she is cold and calculating, focused on maintaining her deception and ensuring postumus is condemned. there's a stark contrast between her manufactured fear and her controlled manipulation, driven by ambition and loyalty to livia's schemes. she experiences a thrill in her successful deception,", "also a cold resolve to see it through."],
        ap.active_plans = ["Maintain the charade of being a rape victim to secure Postumus's immediate condemnation by Augustus.", "Reinforce the narrative of Postumus's violent and animalistic nature to justify his punishment in Augustus's eyes.", "Solidify her position as a damsel in distress, gaining sympathy and protection from Augustus and further aligning herself with the imperial favor."],
        ap.beliefs = ["Postumus is a dangerous liability who needs to be removed to secure the family's power.", "Deception and manipulation are acceptable tools to achieve her and Livia's political objectives.", "Augustus is susceptible to emotional appeals and will readily believe a woman's claim of assault over Postumus's accusations."],
        ap.goals = ["Short-term: To ensure Augustus believes her rape accusation and orders Postumus's immediate arrest and punishment in this corridor scene.", "Medium-term: To contribute to Postumus's permanent removal from Rome and the line of succession, eliminating him as a threat.", "Ultimate: To enhance her own standing within the family and contribute to the overall consolidation of power for Livia and Tiberius, securing her future within the dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the scene with the force of imperial authority, his face contorted with fury at what he believes is a violent assault on Livilla. He physically confronts Postumus, his posture aggressive and accusatory, demanding answers and immediate obedience. He is surrounded by his guards and Castor, reinforcing his power and control over the situation, his focus fixed on Livilla\'s supposed distress and Postumus\'s perceived brutality.',
        ap.emotional_state = 'Augustus is initially consumed by righteous anger and paternal protectiveness towards Livilla. Outwardly, he displays intense fury and disgust at Postumus\'s alleged actions, his words sharp and condemnatory. Internally, however, Postumus\'s accusations begin to sow seeds of doubt, creating a conflict between his initial rage and a growing unease. He struggles to reconcile his love for Livia with the horrific possibility of her treachery, battling against acknowledging the dark implications of Postumus\'s desperate outburst.',
        ap.emotional_tags = ["augustus is initially consumed by righteous anger", "paternal protectiveness towards livilla. outwardly, he displays intense fury", "disgust at postumus's alleged actions, his words sharp", "condemnatory. internally, however, postumus's accusations begin to sow seeds of doubt, creating a conflict between his initial rage", "a growing unease. he struggles to reconcile his love for livia with the horrific possibility of her treachery, battling against acknowledging the dark implications of postumus's desperate outburst.", "augustus is initially consumed by righteous anger and paternal protectiveness towards livilla. outwardly", "he displays intense fury and disgust at postumus's alleged actions", "his words sharp and condemnatory. internally", "however", "postumus's accusations begin to sow seeds of doubt", "creating a conflict between his initial rage and a growing unease. he struggles to reconcile his love for livia with the horrific possibility of her treachery", "battling against acknowledging the dark implications of postumus's desperate outburst."],
        ap.active_plans = ["Immediately punish Postumus for the perceived rape of Livilla, asserting his authority and dispensing swift justice.", "Restore order and calm to the palace corridor, quelling the disruptive outburst and reaffirming his control over his family.", "Dismiss Postumus's accusations as the ravings of a madman, protecting Livia and the established order from any scrutiny or suspicion."],
        ap.beliefs = ["Rape is an abhorrent crime that must be punished severely and immediately to maintain Roman moral order.", "Livilla, as a member of his family, is inherently trustworthy and deserving of his protection against external threats like Postumus.", "Postumus is a volatile and disrespectful grandson who has finally crossed a line and must be disciplined to prevent further chaos and instability within the dynasty."],
        ap.goals = ["Short-term: To deliver immediate and decisive punishment to Postumus in the corridor, ending the scene with his authority reaffirmed.", "Medium-term: To permanently remove Postumus from his presence and prevent future disruptions or threats to his family's peace and power.", "Ultimate: To maintain the stability and appearance of unity within his family and the empire, even if it requires suppressing uncomfortable truths and ignoring potential betrayals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Livia enters the corridor with calculated composure, her presence immediately shifting the dynamic. She positions herself strategically, observing the unfolding drama and interjecting at key moments to subtly guide Augustus\'s reactions and reinforce the narrative against Postumus. Her movements are controlled, her gaze sharp and focused, ensuring her influence is felt without being overtly dominant, acting as a silent puppeteer.',
        ap.emotional_state = 'Livia maintains a facade of controlled concern and righteous indignation. Outwardly, she expresses a measured disapproval of Postumus, appearing worried about the family\'s reputation and the scandal. Internally, she is cold and calculating, assessing the situation and ensuring her plan proceeds flawlessly. She feels a sense of grim satisfaction as Postumus falls into her trap, her ambition overriding any semblance of empathy or familial affection. Her calmness is a mask for her ruthless determination.',
        ap.emotional_tags = ["livia maintains a facade of controlled concern", "righteous indignation. outwardly, she expresses a measured disapproval of postumus, appearing worried about the family's reputation", "the scandal. internally, she is cold", "calculating, assessing the situation", "ensuring her plan proceeds flawlessly. she feels a sense of grim satisfaction as postumus falls into her trap, her ambition overriding any semblance of empathy or familial affection. her calmness is a mask for her ruthless determination.", "livia maintains a facade of controlled concern and righteous indignation. outwardly", "she expresses a measured disapproval of postumus", "appearing worried about the family's reputation and the scandal. internally", "she is cold and calculating", "assessing the situation and ensuring her plan proceeds flawlessly. she feels a sense of grim satisfaction as postumus falls into her trap", "her ambition overriding any semblance of empathy or familial affection. her calmness is a mask for her ruthless determination."],
        ap.active_plans = ["Reinforce Livilla's victim narrative and subtly guide Augustus towards believing the rape accusation without question.", "Discredit Postumus's accusations of murder and conspiracy by framing him as a madman, deflecting any suspicion away from herself.", "Ensure Augustus orders a severe punishment for Postumus, effectively removing him as a threat to Tiberius's succession and her own power."],
        ap.beliefs = ["Postumus is a dangerous obstacle to her son Tiberius's ascension and must be eliminated to secure the future of the dynasty as she envisions it.", "Deception and manipulation are necessary and justifiable tools for achieving political power and protecting her family's interests.", "Augustus is emotionally vulnerable and can be easily manipulated by playing on his protective instincts and his desire for order and stability."],
        ap.goals = ["Short-term: To ensure Postumus is condemned and arrested in this scene, solidifying the success of Livilla's fabricated accusation.", "Medium-term: To orchestrate Postumus's permanent banishment or even death, removing him as a potential rival and securing Tiberius's path to the throne.", "Ultimate: To consolidate her power behind the throne and ensure the Julio-Claudian dynasty continues under her control and influence, with Tiberius as her compliant instrument."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Postumus stands visibly agitated in the dimly lit corridor, his body tense and gestures frantic as he attempts to defend himself against Livilla\'s accusations. He reaches out toward her, his movements a mixture of desperation and rage, before recoiling from the impact of her slap, which jolts him and adds to the chaos of the scene.',
        ap.emotional_state = 'Postumus exhibits a turbulent emotional state, oscillating between anger, desperation, and fear. His voice is charged with emotion as he vehemently denies the accusations, revealing his deep-seated insecurities regarding his family\'s fate. Internally, he feels hunted, battling against the overwhelming sense of betrayal and the imminent threat to his life and dignity. The situation’s absurdity leaves him teetering on the edge of madness, feeling unjustly victimized.',
        ap.emotional_tags = ["postumus exhibits a turbulent emotional state, oscillating between anger, desperation,", "fear. his voice is charged with emotion as he vehemently denies the accusations, revealing his deep-seated insecurities regarding his family's fate. internally, he feels hunted, battling against the overwhelming sense of betrayal", "the imminent threat to his life", "dignity. the situation\u2019s absurdity leaves him teetering on the edge of madness, feeling unjustly victimized.", "postumus exhibits a turbulent emotional state", "oscillating between anger", "desperation", "and fear. his voice is charged with emotion as he vehemently denies the accusations", "revealing his deep-seated insecurities regarding his family's fate. internally", "he feels hunted", "battling against the overwhelming sense of betrayal and the imminent threat to his life and dignity. the situation\u2019s absurdity leaves him teetering on the edge of madness", "feeling unjustly victimized."],
        ap.active_plans = ["To expose Livilla's treachery and convince Augustus of the truth behind the accusations.", "To defend his honor and innocence against the overwhelming tide of accusations from Livilla and Augustus.", "To survive the immediate threat to his life by attempting to sway Augustus's perception in his favor."],
        ap.beliefs = ["He believes that Livia is orchestrating a plot to eliminate him, just as she has done with others in his family.", "He holds a conviction that truth and loyalty should prevail, regardless of the consequences he faces.", "He believes Augustus is blinded by manipulations and needs to recognize Livia's role in the familial betrayals."],
        ap.goals = ["Short-term: To clear his name and avoid punishment for a crime he did not commit.", "Medium-term: To gain Augustus's trust and convince him of the dangers Livia poses to their family.", "Ultimate: To ensure his survival and reclaim his position within the imperial family, thwarting Livia's ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the corridor with an imposing presence, his face a mask of fury as he confronts Postumus. He stands tall and authoritative, gesturing emphatically while questioning Postumus\'s sanity and the motives behind his accusations. His movements are deliberate, filled with a sense of urgency and defensiveness as he tries to uphold his image of control amidst the chaos.',
        ap.emotional_state = 'Augustus\'s emotional state is a tumultuous blend of anger and denial. Outwardly, he expresses fury towards Postumus, convinced of his guilt and the need to protect his family\'s reputation. Internally, he grapples with the unsettling implications of Postumus\'s claims, wrestling with the fear that the foundations of his dynasty may not be as solid as he believes. His protective instincts are stirred, yet he remains blind to the treachery lurking within his own family.',
        ap.emotional_tags = ["augustus's emotional state is a tumultuous blend of anger", "denial. outwardly, he expresses fury towards postumus, convinced of his guilt", "the need to protect his family's reputation. internally, he grapples with the unsettling implications of postumus's claims, wrestling with the fear that the foundations of his dynasty may not be as solid as he believes. his protective instincts are stirred, yet he remains blind to the treachery lurking within his own family.", "augustus's emotional state is a tumultuous blend of anger and denial. outwardly", "he expresses fury towards postumus", "convinced of his guilt and the need to protect his family's reputation. internally", "he grapples with the unsettling implications of postumus's claims", "wrestling with the fear that the foundations of his dynasty may not be as solid as he believes. his protective instincts are stirred", "yet he remains blind to the treachery lurking within his own family."],
        ap.active_plans = ["To assert his authority and quell the chaos instigated by Postumus's accusations.", "To dismiss any suggestion of family treachery while preserving the image of his dynasty.", "To protect Livilla and reaffirm her innocence, prioritizing familial loyalty over the truth."],
        ap.beliefs = ["He believes that loyalty to family must be upheld, regardless of evidence presented against them.", "He holds a conviction that the stability of his reign depends on maintaining the facade of a united family.", "He thinks that accusations against Livilla and his family are unfounded and driven by envy or madness."],
        ap.goals = ["Short-term: To silence Postumus and maintain control over the situation, ensuring no public scandal arises.", "Medium-term: To reinforce Livilla's position and address any lingering doubts about her loyalty.", "Ultimate: To secure the legacy of his rule and protect the dynasty from any threats, both external and internal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the background, her demeanor cool and calculating as she observes the confrontation unfold. She maintains an air of composure, her posture regal yet relaxed, seemingly unbothered by the chaos. Her presence looms large, subtly guiding Augustus\'s responses while allowing him to believe he is in control.',
        ap.emotional_state = 'Livia\'s emotional state is one of icy detachment, masking her inner machinations with a veneer of concern for Augustus and the family\'s reputation. Although she appears supportive of Augustus, beneath the surface lies a calculating mind that sees Postumus\'s predicament as an opportunity to eliminate a potential rival. She feels no guilt over the unfolding drama, only a sense of triumph at the success of her schemes.',
        ap.emotional_tags = ["livia's emotional state is one of icy detachment, masking her inner machinations with a veneer of concern for augustus", "the family's reputation. although she appears supportive of augustus, beneath the surface lies a calculating mind that sees postumus's predicament as an opportunity to eliminate a potential rival. she feels no guilt over the unfolding drama, only a sense of triumph at the success of her schemes.", "livia's emotional state is one of icy detachment", "masking her inner machinations with a veneer of concern for augustus and the family's reputation. although she appears supportive of augustus", "beneath the surface lies a calculating mind that sees postumus's predicament as an opportunity to eliminate a potential rival. she feels no guilt over the unfolding drama", "only a sense of triumph at the success of her schemes."],
        ap.active_plans = ["To manipulate Augustus into believing Livilla's innocence while maintaining her own influence over the family dynamics.", "To eliminate Postumus as a threat to her son Tiberius's future and further secure her position.", "To ensure that Augustus remains oblivious to her manipulations and the true nature of her ambitions."],
        ap.beliefs = ["She believes power is best wielded from the shadows, manipulating events to suit her purposes without direct involvement.", "She holds a conviction that family bonds can be sacrificed for the greater good of her son's ascendance.", "She thinks that maintaining control over perception is crucial in the ruthless game of Roman politics."],
        ap.goals = ["Short-term: To reinforce her influence over Augustus and ensure he dismisses Postumus's accusations.", "Medium-term: To solidify Tiberius's position as heir by removing Postumus from the equation.", "Ultimate: To secure her legacy and the power of her bloodline within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_7'})
    ON CREATE SET
        ap.current_status = 'Livilla stands trembling in the dimly lit corridor, feigning distress and recoiling from the guards hauling Postumus away. She clutches at her clothing, subtly amplifying the impression of a violated woman. Her performance is meticulously crafted, designed to maintain the illusion of victimhood and secure Augustus\'s unwavering sympathy and belief in her fabricated ordeal.',
        ap.emotional_state = 'Livilla outwardly displays a fragile vulnerability, projecting an image of shock and emotional distress following the staged \'attack\'. Beneath this carefully constructed facade, she experiences a cold satisfaction as her intricate scheme reaches its successful climax. There is a calculated detachment in her demeanor, a chilling composure that belies the turmoil she pretends to have endured, revealing her ruthless ambition and mastery of deception.',
        ap.emotional_tags = ["livilla outwardly displays a fragile vulnerability, projecting an image of shock", "emotional distress following the staged 'attack'. beneath this carefully constructed facade, she experiences a cold satisfaction as her intricate scheme reaches its successful climax. there is a calculated detachment in her demeanor, a chilling composure that belies the turmoil she pretends to have endured, revealing her ruthless ambition", "mastery of deception.", "livilla outwardly displays a fragile vulnerability", "projecting an image of shock and emotional distress following the staged 'attack'. beneath this carefully constructed facade", "she experiences a cold satisfaction as her intricate scheme reaches its successful climax. there is a calculated detachment in her demeanor", "a chilling composure that belies the turmoil she pretends to have endured", "revealing her ruthless ambition and mastery of deception."],
        ap.active_plans = ["Maintain the facade of a traumatized victim to solidify Augustus's belief.", "Ensure Postumus is permanently removed and discredited in Augustus's eyes.", "Strengthen her position within the imperial family by showcasing her 'vulnerability' and dependence on Augustus's protection."],
        ap.beliefs = ["Deception is a necessary tool to secure power and eliminate threats.", "Postumus's volatile nature makes him a plausible aggressor in Augustus's eyes.", "Her own safety and influence depend on the successful removal of rivals to Tiberius's succession."],
        ap.goals = ["short_term\": \"To be comforted and reassured by Augustus, further cementing her victim narrative.", "medium_term\": \"To ensure Postumus is banished and forgotten, posing no future threat to Tiberius's claim.", "ultimate\": \"To solidify Tiberius's path to the throne and maintain her own position as a powerful figure in the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'})
    ON CREATE SET
        ap.current_status = 'Augustus, his face softened with paternal concern, turns his full attention to Livilla. He speaks to her with gentle solicitousness, his earlier fury entirely dissipated. He proposes a temple sacrifice, a gesture of comfort and public absolution, placing a reassuring hand on her arm. He dismisses the guards with a final, authoritative shout, ensuring Postumus\'s immediate and forceful departure.',
        ap.emotional_state = 'Augustus transitions swiftly from incandescent rage to tender solicitude, fully believing Livilla\'s performance. He feels a surge of protective paternalism towards her, seeing her as a fragile victim in need of comfort and reassurance. His underlying emotions are likely a mix of relief that the immediate crisis is \'resolved\', and a continued frustration with Postumus\'s perceived instability, reinforcing his existing negative biases and clouding his judgment completely.',
        ap.emotional_tags = ["augustus transitions swiftly from incandescent rage to tender solicitude, fully believing livilla's performance. he feels a surge of protective paternalism towards her, seeing her as a fragile victim in need of comfort", "reassurance. his underlying emotions are likely a mix of relief that the immediate crisis is 'resolved',", "a continued frustration with postumus's perceived instability, reinforcing his existing negative biases", "clouding his judgment completely.", "augustus transitions swiftly from incandescent rage to tender solicitude", "fully believing livilla's performance. he feels a surge of protective paternalism towards her", "seeing her as a fragile victim in need of comfort and reassurance. his underlying emotions are likely a mix of relief that the immediate crisis is 'resolved'", "and a continued frustration with postumus's perceived instability", "reinforcing his existing negative biases and clouding his judgment completely."],
        ap.active_plans = ["Comfort and reassure Livilla, demonstrating his support and belief in her.", "Solidify the fabricated narrative by publicly validating Livilla's victimhood.", "Ensure Postumus's swift and irreversible banishment, removing him from the succession equation permanently."],
        ap.beliefs = ["Livilla is a trustworthy and innocent member of his family, incapable of deceit.", "Postumus is inherently flawed and deserving of punishment for his perceived aggression.", "Public displays of piety and ritual are important for maintaining social order and personal well-being after a crisis."],
        ap.goals = ["short_term\": \"To ease Livilla's apparent distress and restore a sense of calm within the palace.", "medium_term\": \"To publicly reaffirm Livilla's innocence and Postumus's guilt through the temple sacrifice.", "ultimate\": \"To maintain the illusion of familial harmony and imperial control, even if based on a foundation of deception, and to secure a smooth succession by eliminating Postumus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Postumus stumbles through the palace grounds, moving with urgent, erratic movements as he tries to evade his guards. His posture is hunched, driven by fear, and he frequently glances over his shoulder, aware of the potential danger lurking in the shadows.',
        ap.emotional_state = 'Postumus is overwhelmed with fear and desperation, his anxiety manifesting through rapid breaths and frantic whispers. Beneath this surface panic lies a profound sense of vulnerability, knowing that he is hunted and isolated. This internal conflict amplifies as he grapples with his wish for acceptance in a hostile environment.',
        ap.emotional_tags = ["postumus is overwhelmed with fear", "desperation, his anxiety manifesting through rapid breaths", "frantic whispers. beneath this surface panic lies a profound sense of vulnerability, knowing that he is hunted", "isolated. this internal conflict amplifies as he grapples with his wish for acceptance in a hostile environment.", "postumus is overwhelmed with fear and desperation", "his anxiety manifesting through rapid breaths and frantic whispers. beneath this surface panic lies a profound sense of vulnerability", "knowing that he is hunted and isolated. this internal conflict amplifies as he grapples with his wish for acceptance in a hostile environment."],
        ap.active_plans = ["Evade capture by hiding and using the palace grounds to his advantage.", "Seek refuge and support from Claudius, hoping for protection or a plan.", "Gather his thoughts and regain composure before making his next move."],
        ap.beliefs = ["He believes that his life is at immediate risk due to the machinations of Livia and her influence.", "He holds the conviction that the loyalty of his family is tenuous and unreliable.", "He perceives himself as a rightful heir who deserves acceptance and safety but feels continuously undermined."],
        ap.goals = ["Short-term: Avoid capture and find a safe hiding spot within the palace.", "Medium-term: Secure Claudius's assistance to navigate his perilous situation.", "Ultimate: Establish himself as a legitimate contender for the throne, free from the shadows of his family's political games."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Claudius emerges from the deep shadows of the palace grounds, a silent observer materializing into the dimly lit space. He stands with a composed posture, his body language suggesting a quiet readiness. He watches Postumus intently, his gaze sharp and assessing, like a predator calmly observing its prey. His movements are deliberate and hushed, ensuring his presence is felt but not alarming.',
        ap.emotional_state = 'Claudius maintains an outwardly calm and collected demeanor, a stark contrast to Postumus\'s visible panic. Beneath this composed surface, there\'s a sense of caution and perhaps a flicker of concern for Postumus\'s desperate state. He is internally alert, processing the urgency of the situation and the potential danger it presents. There is an unspoken tension between his desire to help and his ingrained self-preservation instincts in this treacherous court.',
        ap.emotional_tags = ["claudius maintains an outwardly calm", "collected demeanor, a stark contrast to postumus's visible panic. beneath this composed surface, there's a sense of caution", "perhaps a flicker of concern for postumus's desperate state. he is internally alert, processing the urgency of the situation", "the potential danger it presents. there is an unspoken tension between his desire to help", "his ingrained self-preservation instincts in this treacherous court.", "claudius maintains an outwardly calm and collected demeanor", "a stark contrast to postumus's visible panic. beneath this composed surface", "there's a sense of caution and perhaps a flicker of concern for postumus's desperate state. he is internally alert", "processing the urgency of the situation and the potential danger it presents. there is an unspoken tension between his desire to help and his ingrained self-preservation instincts in this treacherous court."],
        ap.active_plans = ["To assess the immediate danger to both himself and Postumus.", "To understand why Postumus is in such a frantic state and what he needs.", "To offer a semblance of calm and stability in contrast to Postumus's panic, potentially to gain information or control of the situation."],
        ap.beliefs = ["The palace grounds are no longer safe, even under the cloak of night.", "Sudden appearances and panicked states usually indicate grave danger in the court.", "Remaining observant and controlled is the best way to navigate treacherous situations and extract information."],
        ap.goals = ["Short-term: Ensure neither he nor Postumus are immediately detected or captured.", "Medium-term: Uncover the nature of the threat Postumus is facing and how it might implicate him.", "Ultimate: Navigate the escalating palace intrigue and secure his own survival by understanding and potentially manipulating the unfolding events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Postumus stumbles and rushes through the darkened palace grounds, his body language radiating desperation and fear. He is physically disheveled, suggesting a hurried escape, his movements jerky and uncoordinated as he scans his surroundings for pursuers. He whispers urgently, trying to keep his voice down while conveying the critical nature of his situation, his posture hunched and defensive.',
        ap.emotional_state = 'Postumus is consumed by raw fear and panic, evident in his frantic whispers and desperate movements. On the surface, he is breathlessly trying to warn Claudius, his anxiety palpable. Internally, he is likely terrified of being caught, feeling hunted and betrayed. His urgency suggests a deep-seated belief that his life is in immediate danger, and he is likely grappling with a sense of isolation and vulnerability, seeking any form of help in his desperate flight.',
        ap.emotional_tags = ["postumus is consumed by raw fear", "panic, evident in his frantic whispers", "desperate movements. on the surface, he is breathlessly trying to warn claudius, his anxiety palpable. internally, he is likely terrified of being caught, feeling hunted", "betrayed. his urgency suggests a deep-seated belief that his life is in immediate danger,", "he is likely grappling with a sense of isolation", "vulnerability, seeking any form of help in his desperate flight.", "postumus is consumed by raw fear and panic", "evident in his frantic whispers and desperate movements. on the surface", "he is breathlessly trying to warn claudius", "his anxiety palpable. internally", "he is likely terrified of being caught", "feeling hunted and betrayed. his urgency suggests a deep-seated belief that his life is in immediate danger", "and he is likely grappling with a sense of isolation and vulnerability", "seeking any form of help in his desperate flight."],
        ap.active_plans = ["To evade his pursuers and find a temporary hiding place within the palace grounds.", "To urgently communicate his plight and warning to Claudius before he is discovered.", "To seek assistance or refuge from Claudius, hoping for an ally in this dangerous situation."],
        ap.beliefs = ["He is being actively hunted and his capture is imminent if he is found.", "Time is critically short, and any delay could be fatal.", "Claudius, despite his usual quiet demeanor, might be his only hope for immediate assistance or at least a listening ear in this crisis."],
        ap.goals = ["Short-term: Evade immediate capture and successfully deliver his urgent message to Claudius.", "Medium-term: Secure a safe haven and understand the extent of the threat against him, potentially figuring out who is pursuing him and why.", "Ultimate: Survive the immediate danger and find a way to clear his name or escape the clutches of his pursuers, potentially seeking long-term safety and justice."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Augustus paces in the opulent corridor of the palace, his regal presence marked by an air of impatience and frustration. His movements are quick and deliberate, showcasing the tension in his posture as he demands answers regarding Postumus\'s escape. His gestures are sharp, punctuating his words with authority and urgency.',
        ap.emotional_state = 'Augustus exhibits surface-level irritation, his brow furrowing as he grapples with the implications of Postumus\'s flight. Beneath this façade lies a deep-seated anxiety about the stability of his rule and the loyalty of his family. He feels betrayed and vulnerable, revealing a ruler caught between the desire for control and the fear of losing grip over his dynasty.',
        ap.emotional_tags = ["augustus exhibits surface-level irritation, his brow furrowing as he grapples with the implications of postumus's flight. beneath this fa\u00e7ade lies a deep-seated anxiety about the stability of his rule", "the loyalty of his family. he feels betrayed", "vulnerable, revealing a ruler caught between the desire for control", "the fear of losing grip over his dynasty.", "augustus exhibits surface-level irritation", "his brow furrowing as he grapples with the implications of postumus's flight. beneath this fa\u00e7ade lies a deep-seated anxiety about the stability of his rule and the loyalty of his family. he feels betrayed and vulnerable", "revealing a ruler caught between the desire for control and the fear of losing grip over his dynasty."],
        ap.active_plans = ["To locate Postumus and regain control over the situation before it escalates further.", "To assert his authority in front of Castor, reinforcing the need for loyalty and diligence among his subordinates.", "To prevent any further breaches of security in the palace, ensuring guards are vigilant and aware."],
        ap.beliefs = ["Loyalty is paramount among those who serve the empire and must be uncompromising.", "Family ties can be both a source of strength and a potential threat, making vigilance essential.", "The stability of Rome relies on maintaining an image of absolute power and control."],
        ap.goals = ["Short-term: To quickly retrieve information about Postumus's whereabouts to prevent further embarrassment.", "Medium-term: To reinforce his position within the palace and ensure all threats to his rule are neutralized.", "Ultimate: To secure the future of his dynasty by quelling any dissent and maintaining the loyalty of his family and allies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Castor stands nearby, visibly fidgeting as he delivers the unsettling news of Postumus\'s escape. His body language is tense, hands wringing together and avoiding Augustus\'s piercing gaze. He shifts his weight from one foot to the other, reflecting his nervousness and the high stakes of the moment.',
        ap.emotional_state = 'Castor\'s anxiety is palpable, expressed through his jittery movements and stammering voice. Internally, he experiences fear and guilt for failing to contain Postumus, feeling the weight of responsibility for the Emperor\'s displeasure. His conflict lies in the desire to be seen as competent while grappling with the fear of retribution for this setback.',
        ap.emotional_tags = ["castor's anxiety is palpable, expressed through his jittery movements", "stammering voice. internally, he experiences fear", "guilt for failing to contain postumus, feeling the weight of responsibility for the emperor's displeasure. his conflict lies in the desire to be seen as competent while grappling with the fear of retribution for this setback.", "castor's anxiety is palpable", "expressed through his jittery movements and stammering voice. internally", "he experiences fear and guilt for failing to contain postumus", "feeling the weight of responsibility for the emperor's displeasure. his conflict lies in the desire to be seen as competent while grappling with the fear of retribution for this setback.", "castor's anxiety is palpable, expressed through his jittery movements and stammering voice. internally, he experiences fear and guilt for failing to contain postumus, feeling the weight of responsibility for the emperor's displeasure. his conflict lies in the desire to be seen as competent", "grappling with the fear of retribution for this setback."],
        ap.active_plans = ["To find a way to support Augustus and regain his favor, perhaps by seeking out Postumus.", "To reassure Augustus of his loyalty and commitment to his duties despite the slip-up.", "To align himself with other authorities in the palace to bolster security and prevent further escapes."],
        ap.beliefs = ["Failure to fulfill one's duty can have severe consequences, especially in the imperial court.", "Survival in the palace depends heavily on maintaining the trust of influential figures like Augustus.", "The dynamics of power in Rome demand constant vigilance and adaptability to avoid being a pawn."],
        ap.goals = ["Short-term: To calm Augustus's anger and provide a plausible plan to rectify the situation.", "Medium-term: To improve his standing within the court by demonstrating initiative and loyalty.", "Ultimate: To secure a position of favor and influence, ensuring his safety and relevance in the face of shifting loyalties."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Augustus paces back and forth in the palace corridor, his movements sharp and restless, betraying his inner turmoil. He is engaged in a tense exchange with Castor, demanding answers about Postumus\'s escape with an air of imperial impatience and barely contained fury. His physical presence dominates the space, even in his agitation.',
        ap.emotional_state = 'On the surface, Augustus displays overt anger and frustration, evident in his impatient pacing and sharp tone. Beneath this outward rage, there\'s a deeper current of anxiety and a sense of lost control. Postumus\'s escape is a direct challenge to his authority, stirring up profound insecurities about his reign and the loyalty of those around him. His sudden shift to scolding Castor about marital duties suggests a deflection of this deeper unease, projecting blame outwards rather than confronting the core issue of his faltering grip.',
        ap.emotional_tags = ["on the surface, augustus displays overt anger", "frustration, evident in his impatient pacing", "sharp tone. beneath this outward rage, there's a deeper current of anxiety", "a sense of lost control. postumus's escape is a direct challenge to his authority, stirring up profound insecurities about his reign", "the loyalty of those around him. his sudden shift to scolding castor about marital duties suggests a deflection of this deeper unease, projecting blame outwards rather than confronting the core issue of his faltering grip.", "on the surface", "augustus displays overt anger and frustration", "evident in his impatient pacing and sharp tone. beneath this outward rage", "there's a deeper current of anxiety and a sense of lost control. postumus's escape is a direct challenge to his authority", "stirring up profound insecurities about his reign and the loyalty of those around him. his sudden shift to scolding castor about marital duties suggests a deflection of this deeper unease", "projecting blame outwards rather than confronting the core issue of his faltering grip."],
        ap.active_plans = ["To immediately recapture Postumus and restore order, preventing any further damage to his imperial authority.", "To identify and punish those responsible for Postumus's escape, reinforcing his image as a ruler who tolerates no breaches of security.", "To reassert control over his household and court, using even minor figures like Castor to exemplify the need for obedience and adherence to his will."],
        ap.beliefs = ["His imperial authority is absolute and must be unquestioned to maintain order and prevent chaos.", "Any challenge to his control, even a seemingly minor escape, is a serious threat to the stability of Rome and his dynasty.", "Personal conduct and domestic order within his court are reflections of the larger order of the empire; therefore, lapses in personal duty reflect broader failures of loyalty and control."],
        ap.goals = ["Short-term: To receive immediate, satisfactory updates on the progress of Postumus's recapture and to vent his frustration, finding a target for his anger in Castor.", "Medium-term: To swiftly and decisively resolve the Postumus situation, minimizing any public perception of weakness or instability in his rule.", "Ultimate: To secure a peaceful and unchallenged succession, ensuring his legacy as a strong and respected emperor, even as age and internal strife weaken his grip."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Castor stands nervously in the palace corridor, physically close to Augustus but emotionally distant. He fidgets under the Emperor\'s intense gaze, his body language radiating anxiety and subservience. He remains still, offering short, clipped responses, clearly trying to minimize his presence and avoid further provoking Augustus\'s wrath.',
        ap.emotional_state = 'Castor is visibly nervous and intimidated by Augustus\'s anger. His fidgeting and hesitant demeanor betray his deep discomfort and fear of imperial displeasure. Internally, he is likely wrestling with anxiety and a sense of helplessness, aware that he is a convenient target for Augustus\'s misplaced anger. While outwardly compliant, he might harbor resentment at being unjustly scolded for a situation beyond his control, yet understands the absolute necessity of masking any such feelings to survive in the court.',
        ap.emotional_tags = ["castor is visibly nervous", "intimidated by augustus's anger. his fidgeting", "hesitant demeanor betray his deep discomfort", "fear of imperial displeasure. internally, he is likely wrestling with anxiety", "a sense of helplessness, aware that he is a convenient target for augustus's misplaced anger. while outwardly compliant, he might harbor resentment at being unjustly scolded for a situation beyond his control, yet understands the absolute necessity of masking any such feelings to survive in the court.", "castor is visibly nervous and intimidated by augustus's anger. his fidgeting and hesitant demeanor betray his deep discomfort and fear of imperial displeasure. internally", "he is likely wrestling with anxiety and a sense of helplessness", "aware that he is a convenient target for augustus's misplaced anger. while outwardly compliant", "he might harbor resentment at being unjustly scolded for a situation beyond his control", "yet understands the absolute necessity of masking any such feelings to survive in the court."],
        ap.active_plans = ["To deliver the necessary information to Augustus concisely and without further complication, hoping to satisfy the Emperor's immediate demand for answers.", "To absorb Augustus's scolding without protest or defensiveness, projecting an image of humility and acceptance of blame, even if undeserved.", "To escape the Emperor's presence as quickly as possible and avoid becoming further entangled in the fallout from Postumus's escape."],
        ap.beliefs = ["The Emperor's anger is unpredictable and dangerous, and it is crucial to avoid becoming its target.", "Subservience and obedience are the primary means of survival and advancement within the imperial court.", "Personal well-being is secondary to maintaining favor with those in power, even if it means accepting unjust criticism and blame."],
        ap.goals = ["Short-term: To endure Augustus's outburst and escape the immediate situation without incurring further punishment or blame.", "Medium-term: To reaffirm his loyalty and usefulness to the imperial household, hoping to regain favor and erase any negative impression caused by the current situation.", "Ultimate: To maintain a stable, if precarious, position within the court, navigating the treacherous currents of imperial politics to ensure his continued survival and, if possible, some level of influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Postumus emerges into the dimly lit gardens, his body tense and posture hunched as he scans the surroundings with wide, darting eyes. He moves quickly, almost furtively, suggesting a deep urgency as he tries to disappear into the shadows.',
        ap.emotional_state = 'Postumus is overwhelmed by panic, evident in his quickened breathing and frantic gestures. While he attempts to maintain a façade of control by whispering to Claudius, the fear of being caught clearly underlines his every movement. Internally, he grapples with feelings of vulnerability and desperation, his emotional state fluctuating between the need for safety and the dread of impending capture.',
        ap.emotional_tags = ["postumus is overwhelmed by panic, evident in his quickened breathing", "frantic gestures. while he attempts to maintain a fa\u00e7ade of control by whispering to claudius, the fear of being caught clearly underlines his every movement. internally, he grapples with feelings of vulnerability", "desperation, his emotional state fluctuating between the need for safety", "the dread of impending capture.", "postumus is overwhelmed by panic", "evident in his quickened breathing and frantic gestures. while he attempts to maintain a fa\u00e7ade of control by whispering to claudius", "the fear of being caught clearly underlines his every movement. internally", "he grapples with feelings of vulnerability and desperation", "his emotional state fluctuating between the need for safety and the dread of impending capture."],
        ap.active_plans = ["Seek refuge and guidance from Claudius as he feels cornered and hunted.", "Explain the urgency of his situation to Claudius, hoping to gain immediate assistance.", "Formulate a plan of action to evade those pursuing him, utilizing Claudius\u2019s intellect."],
        ap.beliefs = ["He believes that survival in this treacherous world depends on forming strategic alliances.", "He is convinced that he cannot rely on his family and must take matters into his own hands.", "He holds a deep-seated belief that loyalty is fleeting in the face of ambition and betrayal."],
        ap.goals = ["Short-term: Find a safe hiding place in the gardens to evade capture.", "Medium-term: Gain Claudius's support and guidance to navigate the immediate danger.", "Ultimate: Secure his position within the family and the empire, overcoming the threats posed by Livia's machinations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Postumus bursts into the dimly lit palace gardens, his movements betraying his inner turmoil. He glances frantically in every direction, his body tense with fear, checking over his shoulder as if expecting pursuers to emerge from the shadows at any moment. He speaks in hushed, urgent tones to Claudius, his posture hunched and defensive, indicating a man desperate to evade immediate danger and find fleeting sanctuary.',
        ap.emotional_state = 'Postumus is gripped by palpable panic; his surface emotions are a whirlwind of fear and desperation, evident in his darting eyes and rushed words. Internally, he\'s likely consumed by terror, convinced he\'s on the verge of capture, his heart pounding with the dread of the unknown consequences awaiting him. Beneath the immediate fright, there\'s a raw undercurrent of injustice and betrayal; he\'s running not just from physical threat, but from the emotional wound of being hunted by his own family, creating a volatile mix of terror and wounded pride.',
        ap.emotional_tags = ["postumus is gripped by palpable panic; his surface emotions are a whirlwind of fear", "desperation, evident in his darting eyes", "rushed words. internally, he's likely consumed by terror, convinced he's on the verge of capture, his heart pounding with the dread of the unknown consequences awaiting him. beneath the immediate fright, there's a raw undercurrent of injustice", "betrayal; he's running not just from physical threat, but from the emotional wound of being hunted by his own family, creating a volatile mix of terror", "wounded pride.", "postumus is gripped by palpable panic; his surface emotions are a whirlwind of fear and desperation", "evident in his darting eyes and rushed words. internally", "he's likely consumed by terror", "convinced he's on the verge of capture", "his heart pounding with the dread of the unknown consequences awaiting him. beneath the immediate fright", "there's a raw undercurrent of injustice and betrayal; he's running not just from physical threat", "but from the emotional wound of being hunted by his own family", "creating a volatile mix of terror and wounded pride.", "postumus is gripped by palpable panic", "his surface emotions are a whirlwind of fear and desperation, evident in his darting eyes and rushed words. internally, he's likely consumed by terror, convinced he's on the verge of capture, his heart pounding with the dread of the unknown consequences awaiting him. beneath the immediate fright, there's a raw undercurrent of injustice and betrayal", "he's running not just from physical threat, but from the emotional wound of being hunted by his own family, creating a volatile mix of terror and wounded pride.", "postumus is gripped by palpable panic; his surface emotions are a whirlwind of fear and desperation, evident in his darting eyes and rushed words. internally, he's likely consumed by terror, convinced he's on the verge of capture, his heart pounding with the dread of the unknown consequences awaiting him. beneath the immediate fright, there's a raw undercurrent of injustice and betrayal; he's running not just from physical threat,", "from the emotional wound of being hunted by his own family, creating a volatile mix of terror and wounded pride."],
        ap.active_plans = ["Evade immediate capture by whoever is searching for him.", "Find a secure hiding place within the palace grounds.", "Quickly communicate his predicament and seek assistance from Claudius, hoping for a sympathetic ear or practical help."],
        ap.beliefs = ["He is in grave danger and is being actively hunted by powerful enemies.", "Secrecy and speed are his only allies in this desperate situation.", "He can potentially find a modicum of trust and understanding with Claudius, given their shared outsider status."],
        ap.goals = ["Short-term: To successfully evade capture in the immediate moment and find a temporary safe haven.", "Medium-term: To understand the nature and source of the threat against him and determine who is pursuing him.", "Ultimate: To secure his long-term safety and potentially clear his name or regain a semblance of his former standing within the imperial family, though survival is the more pressing aim."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Claudius appears as if materializing from the very shadows of the garden, his entrance silent and almost spectral. He observes Postumus\'s frantic state with a calm, knowing gaze, his body language relaxed yet alert. He stands still, a stark contrast to Postumus\'s agitation, offering a quiet, grounding presence amidst the other man\'s panic. His subtle nod is a gesture of acknowledgement and understanding, a silent offering of support.',
        ap.emotional_state = 'Claudius presents an outward calm, a stark contrast to Postumus\'s panic, suggesting a composed and observant nature. Internally, he is deeply empathetic, recognizing the fear in Postumus\'s eyes and understanding the precariousness of their shared position within the imperial family. He is not surprised by the unfolding drama, hinting at a cynical awareness of the court\'s treachery. Beneath the surface calm, there is a quiet resolve and a burgeoning sense of agency, a feeling of being drawn into the unfolding events not merely as an observer, but as a potential participant, motivated by a desire to offer solidarity to a fellow outcast.',
        ap.emotional_tags = ["claudius presents an outward calm, a stark contrast to postumus's panic, suggesting a composed", "observant nature. internally, he is deeply empathetic, recognizing the fear in postumus's eyes", "understanding the precariousness of their shared position within the imperial family. he is not surprised by the unfolding drama, hinting at a cynical awareness of the court's treachery. beneath the surface calm, there is a quiet resolve", "a burgeoning sense of agency, a feeling of being drawn into the unfolding events not merely as an observer, but as a potential participant, motivated by a desire to offer solidarity to a fellow outcast.", "claudius presents an outward calm", "a stark contrast to postumus's panic", "suggesting a composed and observant nature. internally", "he is deeply empathetic", "recognizing the fear in postumus's eyes and understanding the precariousness of their shared position within the imperial family. he is not surprised by the unfolding drama", "hinting at a cynical awareness of the court's treachery. beneath the surface calm", "there is a quiet resolve and a burgeoning sense of agency", "a feeling of being drawn into the unfolding events not merely as an observer", "but as a potential participant", "motivated by a desire to offer solidarity to a fellow outcast.", "claudius presents an outward calm, a stark contrast to postumus's panic, suggesting a composed and observant nature. internally, he is deeply empathetic, recognizing the fear in postumus's eyes and understanding the precariousness of their shared position within the imperial family. he is not surprised by the unfolding drama, hinting at a cynical awareness of the court's treachery. beneath the surface calm, there is a quiet resolve and a burgeoning sense of agency, a feeling of being drawn into the unfolding events not merely as an observer,", "as a potential participant, motivated by a desire to offer solidarity to a fellow outcast."],
        ap.active_plans = ["Observe Postumus's immediate distress and quickly assess the gravity of the situation.", "Offer silent, non-verbal reassurance to Postumus, conveying understanding and support without drawing attention.", "Position himself as a potential confidant and ally for Postumus, ready to listen and possibly offer assistance if needed."],
        ap.beliefs = ["The imperial court is a dangerous and unpredictable environment where anyone can become a target.", "He and Postumus are both vulnerable to the machinations of those in power, despite their lineage.", "Silent observation and understated actions can be more effective and safer than overt displays of emotion or involvement."],
        ap.goals = ["Short-term: To provide immediate, quiet support to Postumus in his moment of visible crisis and establish a connection based on shared understanding.", "Medium-term: To foster a bond of trust with Postumus, potentially gaining insight into the unfolding events and solidifying a valuable alliance.", "Ultimate: To navigate the treacherous political landscape of the court by forming strategic alliances and leveraging his unique position as an overlooked observer, ultimately ensuring his own survival and perhaps even gaining influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Augustus paces with an intensity that reflects his agitation, halting abruptly to face Castor. His body language is tense, with clenched fists and a furrowed brow that underscores his impatience. The sharpness of his posture and the urgency of his movements communicate a desperate need for control in the chaos surrounding him.',
        ap.emotional_state = 'Augustus exhibits a surface-level irritation marked by his terse demands and sharp comments. Beneath this, however, lies a deeper insecurity about his authority and the loyalty of those around him. His frustration hints at a looming sense of paranoia, reflecting an internal struggle with vulnerability amid the unfolding crisis.',
        ap.emotional_tags = ["augustus exhibits a surface-level irritation marked by his terse demands", "sharp comments. beneath this, however, lies a deeper insecurity about his authority", "the loyalty of those around him. his frustration hints at a looming sense of paranoia, reflecting an internal struggle with vulnerability amid the unfolding crisis.", "augustus exhibits a surface-level irritation marked by his terse demands and sharp comments. beneath this", "however", "lies a deeper insecurity about his authority and the loyalty of those around him. his frustration hints at a looming sense of paranoia", "reflecting an internal struggle with vulnerability amid the unfolding crisis."],
        ap.active_plans = ["Gather immediate information about the situation to regain control over the unfolding chaos.", "Reassert his authority over Castor and any others present to reinforce his position as Emperor.", "Address the crisis directly by implying consequences for those involved, ensuring loyalty and compliance."],
        ap.beliefs = ["The Emperor's authority must be unquestioned and absolute to maintain order.", "Family loyalty is paramount, and failure to uphold it is a personal affront.", "Fear can be an effective tool for ensuring compliance and preventing betrayal."],
        ap.goals = ["Short-term: Obtain crucial updates on the situation to quell his immediate anxiety.", "Medium-term: Reinforce his control over the palace and its inhabitants to prevent further chaos.", "Ultimate: Secure his legacy and authority as Emperor amidst the rising tensions of succession and betrayal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Castor stands awkwardly nearby, shifting from foot to foot, reflecting his discomfort and anxiety. His fidgeting reveals his nervousness as he tries to maintain his composure under Augustus\'s piercing gaze. His loose posture contrasts sharply with Augustus\'s tension, highlighting the power dynamic between them.',
        ap.emotional_state = 'Castor displays clear signs of anxiety through his restless movements and hesitant speech. On the surface, he appears anxious and unsure, but internally, there may be a lingering sense of loyalty to Augustus mixed with the fear of reprisal should he fail to provide satisfactory information.',
        ap.emotional_tags = ["castor displays clear signs of anxiety through his restless movements", "hesitant speech. on the surface, he appears anxious", "unsure, but internally, there may be a lingering sense of loyalty to augustus mixed with the fear of reprisal should he fail to provide satisfactory information.", "castor displays clear signs of anxiety through his restless movements and hesitant speech. on the surface", "he appears anxious and unsure", "but internally", "there may be a lingering sense of loyalty to augustus mixed with the fear of reprisal should he fail to provide satisfactory information.", "castor displays clear signs of anxiety through his restless movements and hesitant speech. on the surface, he appears anxious and unsure,", "internally, there may be a lingering sense of loyalty to augustus mixed with the fear of reprisal should he fail to provide satisfactory information."],
        ap.active_plans = ["Relay the information he has about the situation involving the escaped individual.", "Calm Augustus's agitation by providing relevant updates as soon as possible.", "Navigate the treacherous atmosphere of the palace while attempting to avoid further upsetting the Emperor."],
        ap.beliefs = ["Loyalty to the Emperor is essential for survival within the court.", "One must tread carefully among the powerful to avoid drawing their ire.", "Knowledge is a double-edged sword; it can protect but also expose one to danger."],
        ap.goals = ["Short-term: Provide Augustus with the information he seeks to alleviate the immediate tension.", "Medium-term: Ensure his position remains secure despite the chaotic environment.", "Ultimate: Maintain his loyalty and usefulness to Augustus to avoid being caught in the crossfire of palace intrigues."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Augustus paces back and forth in the palace corridor, his movements restless and filled with barely suppressed fury. He stops abruptly to face Castor, demanding answers with sharp, impatient questions. His body language exudes tension as he awaits confirmation of his fears, his imperial composure cracking under the strain of the unfolding crisis.',
        ap.emotional_state = 'Augustus is consumed by a volatile mix of anxiety and rage. Outwardly, he projects императорское displeasure, his tone sharp and imperious, reflecting his absolute authority. Internally, a deeper current of fear and frustration churns. The escape is a direct challenge to his control, fueling his ever-present paranoia about threats to his power and legacy. His outburst to Castor reveals a raw nerve, hinting at a deeper insecurity beneath the emperor\'s mask.',
        ap.emotional_tags = ["augustus is consumed by a volatile mix of anxiety", "rage. outwardly, he projects \u0438\u043c\u043f\u0435\u0440\u0430\u0442\u043e\u0440\u0441\u043a\u043e\u0435 displeasure, his tone sharp", "imperious, reflecting his absolute authority. internally, a deeper current of fear", "frustration churns. the escape is a direct challenge to his control, fueling his ever-present paranoia about threats to his power", "legacy. his outburst to castor reveals a raw nerve, hinting at a deeper insecurity beneath the emperor's mask.", "augustus is consumed by a volatile mix of anxiety and rage. outwardly", "he projects \u0438\u043c\u043f\u0435\u0440\u0430\u0442\u043e\u0440\u0441\u043a\u043e\u0435 displeasure", "his tone sharp and imperious", "reflecting his absolute authority. internally", "a deeper current of fear and frustration churns. the escape is a direct challenge to his control", "fueling his ever-present paranoia about threats to his power and legacy. his outburst to castor reveals a raw nerve", "hinting at a deeper insecurity beneath the emperor's mask."],
        ap.active_plans = ["Confirm the reality of the escape and ascertain the details.", "Initiate and oversee a comprehensive search of the entire palace to recapture the fugitive.", "Identify and punish those responsible for the security breach, ensuring accountability and reasserting his authority."],
        ap.beliefs = ["As Emperor, he is entitled to absolute obedience and control within his domain.", "Any lapse in security is a direct affront to his authority and reflects poorly on his reign.", "Rome and its citizens are inherently loyal to him and will ultimately aid in recapturing any fugitive."],
        ap.goals = ["Short-term: Immediately recapture the escaped individual to contain the crisis and prevent further embarrassment.", "Medium-term: Restore order and reinforce security protocols within the palace to prevent future incidents and demonstrate unwavering control.", "Ultimate: Maintain his image as an infallible ruler and ensure the stability of the empire by swiftly quashing any signs of disorder or defiance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Castor stands nervously before Augustus, shifting his weight from one foot to the other, a picture of unease and subservience. He speaks hesitantly, his posture reflecting his anxiety under the Emperor\'s intense gaze. He delivers the unwelcome news with a clear reluctance, avoiding direct eye contact and fidgeting with his hands, acutely aware of Augustus\'s volatile mood.',
        ap.emotional_state = 'Castor is profoundly anxious and intimidated. On the surface, he displays a nervous deference, his voice likely wavering slightly as he delivers the bad news. Internally, he is likely gripped by fear of Augustus\'s wrath and the potential repercussions of the security breach. He feels caught between his duty to inform the Emperor and the dread of incurring his displeasure, highlighting the precarious position of those serving in the imperial court.',
        ap.emotional_tags = ["castor is profoundly anxious", "intimidated. on the surface, he displays a nervous deference, his voice likely wavering slightly as he delivers the bad news. internally, he is likely gripped by fear of augustus's wrath", "the potential repercussions of the security breach. he feels caught between his duty to inform the emperor", "the dread of incurring his displeasure, highlighting the precarious position of those serving in the imperial court.", "castor is profoundly anxious and intimidated. on the surface", "he displays a nervous deference", "his voice likely wavering slightly as he delivers the bad news. internally", "he is likely gripped by fear of augustus's wrath and the potential repercussions of the security breach. he feels caught between his duty to inform the emperor and the dread of incurring his displeasure", "highlighting the precarious position of those serving in the imperial court."],
        ap.active_plans = ["Deliver the news of the escape as directly and concisely as possible, minimizing any perceived embellishment or delay.", "Provide details of the ongoing palace search to demonstrate that steps are being taken to rectify the situation.", "Endure Augustus's inevitable anger and reprimand with subservience and without offering excuses or defensiveness."],
        ap.beliefs = ["The Emperor's displeasure is to be avoided at all costs, as it can have severe consequences.", "His role is to deliver messages and obey orders, not to question or challenge authority.", "Personal blame is likely to be assigned for any negative event, regardless of individual responsibility in the grand scheme of the palace."],
        ap.goals = ["Short-term: Survive this immediate confrontation with Augustus without becoming the scapegoat for the security failure.", "Medium-term:  Fade back into the background and avoid further attention from the Emperor, hoping to distance himself from the negative fallout of the escape.", "Ultimate: Maintain his position within the court, navigating the treacherous political landscape by remaining inconspicuous and obedient, ensuring his continued survival in the emperor's service."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Augustus paces impatiently in the corridor, his movements sharp and decisive, revealing his agitation. His posture is rigid, and he gestures emphatically as he speaks, conveying a sense of both authority and frustration. The tension in his body language suggests a man on the edge, grappling with the chaos of the current situation.',
        ap.emotional_state = 'On the surface, Augustus displays irritation and impatience, his brow furrowed and voice clipped as he addresses Castor. Internally, he grapples with a deep-seated anxiety about the implications of the escapee\'s flight. Despite his authoritarian demeanor, a flicker of vulnerability emerges as he shifts to chastising Castor, indicating his volatile temperament and frustration with personal loyalties overlapping with political failures.',
        ap.emotional_tags = ["on the surface, augustus displays irritation", "impatience, his brow furrowed", "voice clipped as he addresses castor. internally, he grapples with a deep-seated anxiety about the implications of the escapee's flight. despite his authoritarian demeanor, a flicker of vulnerability emerges as he shifts to chastising castor, indicating his volatile temperament", "frustration with personal loyalties overlapping with political failures.", "on the surface", "augustus displays irritation and impatience", "his brow furrowed and voice clipped as he addresses castor. internally", "he grapples with a deep-seated anxiety about the implications of the escapee's flight. despite his authoritarian demeanor", "a flicker of vulnerability emerges as he shifts to chastising castor", "indicating his volatile temperament and frustration with personal loyalties overlapping with political failures."],
        ap.active_plans = ["Reassert his control over the situation by expressing confidence in the Roman reach to catch the escapee.", "Redirect his frustration towards Castor, seeking to establish a sense of authority by imposing personal advice.", "Reinforce the importance of loyalty and duty within his inner circle to mitigate future errors in palace security."],
        ap.beliefs = ["He believes in the imperial strength of Rome, convinced that loyalty will always prevail.", "Augustus holds a conviction that personal neglect leads to broader failures within his realm, intertwining personal and political spheres.", "He views himself as the ultimate authority figure, responsible for both the state and the moral behavior of those in his orbit."],
        ap.goals = ["Short-term: Ensure the immediate capture of the escapee to restore palace order.", "Medium-term: Reinforce loyalty and accountability among his subordinates to prevent similar incidents.", "Ultimate: Maintain the authority and stability of the empire amidst growing internal and external pressures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Castor stands nearby, fidgeting nervously as Augustus paces, his demeanor anxious and unsure. He shifts from foot to foot, reflecting his discomfort in the tense atmosphere. His eyes dart around the corridor, suggesting a deep unease about the situation and his role within it.',
        ap.emotional_state = 'Castor\'s emotional state is one of anxiety and subservience, his voice shaky as he delivers news about the escapee. Beneath this surface, there is a palpable fear of Augustus\'s wrath and a desire to fulfill his duties while navigating the complexities of court intrigue. He feels the weight of responsibility but lacks the confidence to assert himself.',
        ap.emotional_tags = ["castor's emotional state is one of anxiety", "subservience, his voice shaky as he delivers news about the escapee. beneath this surface, there is a palpable fear of augustus's wrath", "a desire to fulfill his duties while navigating the complexities of court intrigue. he feels the weight of responsibility but lacks the confidence to assert himself.", "castor's emotional state is one of anxiety and subservience", "his voice shaky as he delivers news about the escapee. beneath this surface", "there is a palpable fear of augustus's wrath and a desire to fulfill his duties while navigating the complexities of court intrigue. he feels the weight of responsibility but lacks the confidence to assert himself.", "castor's emotional state is one of anxiety and subservience, his voice shaky as he delivers news about the escapee. beneath this surface, there is a palpable fear of augustus's wrath and a desire to fulfill his duties", "navigating the complexities of court intrigue. he feels the weight of responsibility but lacks the confidence to assert himself.", "castor's emotional state is one of anxiety and subservience, his voice shaky as he delivers news about the escapee. beneath this surface, there is a palpable fear of augustus's wrath and a desire to fulfill his duties while navigating the complexities of court intrigue. he feels the weight of responsibility", "lacks the confidence to assert himself."],
        ap.active_plans = ["Deliver timely information about the escapee to Augustus, aiming to demonstrate his usefulness.", "Avoid provoking Augustus's ire by remaining submissive and compliant in their interaction.", "Maintain vigilance in the palace to assist in the search for the escapee and prevent further chaos."],
        ap.beliefs = ["He believes that fulfilling his duties will ultimately ensure his safety and place within the court.", "Castor views Augustus as an imposing figure whose approval is crucial for his standing.", "He holds a conviction that loyalty to the Emperor is paramount, even if it means enduring personal reprimands."],
        ap.goals = ["Short-term: Assist in the search for the escapee to demonstrate loyalty and competence.", "Medium-term: Secure a favorable standing with Augustus by effectively communicating and responding to his needs.", "Ultimate: Achieve stability in his position within the court, minimizing risks associated with political turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Postumus stands firmly before Claudius in the hushed garden, his posture radiating an urgent intensity. He leans in conspiratorially, his voice lowered but charged with conviction as he delivers the weight of his suspicions about Livilla and Livia.  He is poised for a swift departure, every movement suggesting a man keenly aware of the peril of his presence.',
        ap.emotional_state = 'Beneath a veneer of determined resolve, Postumus is a maelstrom of anxiety and suppressed fear.  Outwardly, he projects certainty and a focused purpose in delivering his warning. Yet, internally, he is deeply vulnerable, haunted by the palpable threat of Livia and her machinations. His concern for Claudius and Germanicus is genuine, battling with his own self-preservation instincts in this perilous moment of truth-telling.',
        ap.emotional_tags = ["beneath a veneer of determined resolve, postumus is a maelstrom of anxiety", "suppressed fear.  outwardly, he projects certainty", "a focused purpose in delivering his warning. yet, internally, he is deeply vulnerable, haunted by the palpable threat of livia", "her machinations. his concern for claudius", "germanicus is genuine, battling with his own self-preservation instincts in this perilous moment of truth-telling.", "beneath a veneer of determined resolve", "postumus is a maelstrom of anxiety and suppressed fear.  outwardly", "he projects certainty and a focused purpose in delivering his warning. yet", "internally", "he is deeply vulnerable", "haunted by the palpable threat of livia and her machinations. his concern for claudius and germanicus is genuine", "battling with his own self-preservation instincts in this perilous moment of truth-telling."],
        ap.active_plans = ["To urgently convey the truth about Livilla's manipulation and Livia's orchestration to Claudius.", "To entrust Claudius with the responsibility of informing Germanicus upon his return, ensuring the warning reaches key allies.", "To swiftly and discreetly depart from the gardens to minimize the risk of being discovered by Livia's watchful eyes, prioritizing his own immediate safety."],
        ap.beliefs = ["Livia is the true puppet master behind Livilla's actions, manipulating events from the shadows to secure her own power.", "The truth, though dangerous, must be revealed to those who are threatened, especially allies like Claudius and Germanicus.", "His own life is in imminent danger if Livia discovers his act of defiance and revelation."],
        ap.goals = ["Short-term: Successfully deliver the crucial warning to Claudius and escape the palace gardens unnoticed.", "Medium-term: Ensure that Germanicus receives this vital information through Claudius, strengthening their alliance against Livia.", "Ultimate: Survive the treacherous political landscape of Rome, expose Livia's manipulations, and potentially reclaim his rightful place within the imperial family, or at least ensure justice prevails."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands listening intently, his body still, his gaze fixed on Postumus. He absorbs every word with focused gravity, his initial posture of quiet observation shifting to one of engaged concern as the gravity of Postumus\'s revelation sinks in. He responds with thoughtful questions and assurances, offering a quiet strength to Postumus in the face of danger.',
        ap.emotional_state = 'Claudius, on the surface, maintains a calm and measured demeanor, processing the shocking information with his characteristic intellectual curiosity. However, internally, a turmoil of emotions is brewing. Surprise and a sense of vindication mingle with a growing unease and fear as Postumus confirms his darkest suspicions about the court\'s treachery. He grapples with the weight of this dangerous knowledge, feeling a surge of responsibility for his friend and for Germanicus, even as his own vulnerability is underscored.',
        ap.emotional_tags = ["claudius, on the surface, maintains a calm", "measured demeanor, processing the shocking information with his characteristic intellectual curiosity. however, internally, a turmoil of emotions is brewing. surprise", "a sense of vindication mingle with a growing unease", "fear as postumus confirms his darkest suspicions about the court's treachery. he grapples with the weight of this dangerous knowledge, feeling a surge of responsibility for his friend", "for germanicus, even as his own vulnerability is underscored.", "claudius", "on the surface", "maintains a calm and measured demeanor", "processing the shocking information with his characteristic intellectual curiosity. however", "internally", "a turmoil of emotions is brewing. surprise and a sense of vindication mingle with a growing unease and fear as postumus confirms his darkest suspicions about the court's treachery. he grapples with the weight of this dangerous knowledge", "feeling a surge of responsibility for his friend and for germanicus", "even as his own vulnerability is underscored."],
        ap.active_plans = ["To fully comprehend the details of Postumus's accusations and the extent of Livia's manipulation, ensuring he grasps the gravity of the situation.", "To offer reassurance and support to Postumus in his vulnerable state, solidifying their bond of friendship amidst the unfolding danger.", "To commit to informing Germanicus of Postumus's revelations upon his return, recognizing the strategic importance of this alliance in navigating the court's perils."],
        ap.beliefs = ["The Roman court is a treacherous arena where family loyalty is constantly sacrificed for political gain and personal ambition.", "Truth and knowledge are powerful tools, even in the face of danger, and sharing crucial information is vital for survival and resistance.", "He has a moral obligation to support his friends and allies like Postumus and Germanicus, even if it means risking his own precarious position within the family."],
        ap.goals = ["Short-term: Fully understand the implications of Postumus's warning and offer immediate support and reassurance to his friend.", "Medium-term: Discreetly and effectively relay Postumus's crucial information to Germanicus, strengthening their alliance and preparing for potential threats.", "Ultimate: Navigate the treacherous currents of the Julio-Claudian court, using his intellect and newfound knowledge to protect himself and his allies, and perhaps, in the long run, to expose the corruption and deceit that permeates his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the garden, his body tense and alert, leaning slightly forward as he speaks to Postumus. His hands are clenched, revealing his anxiety about the danger surrounding them. He frequently glances around, as if the shadows themselves might harbor threats, the stillness of the night heightening his unease.',
        ap.emotional_state = 'On the surface, Claudius appears anxious and concerned, his voice trembling with urgency as he implores Postumus to prioritize his safety. Internally, he grapples with a growing awareness of the perilous nature of their world, the weight of his concern revealing his deepening bond with Postumus. He is torn between the desire to protect his friend and the helplessness of his own situation.',
        ap.emotional_tags = ["on the surface, claudius appears anxious", "concerned, his voice trembling with urgency as he implores postumus to prioritize his safety. internally, he grapples with a growing awareness of the perilous nature of their world, the weight of his concern revealing his deepening bond with postumus. he is torn between the desire to protect his friend", "the helplessness of his own situation.", "on the surface", "claudius appears anxious and concerned", "his voice trembling with urgency as he implores postumus to prioritize his safety. internally", "he grapples with a growing awareness of the perilous nature of their world", "the weight of his concern revealing his deepening bond with postumus. he is torn between the desire to protect his friend and the helplessness of his own situation."],
        ap.active_plans = ["To warn Postumus about the looming threats posed by Livia's ambitions.", "To ensure Postumus remains alive and does not provoke danger.", "To communicate the truth to Germanicus upon his return."],
        ap.beliefs = ["Safety is paramount in their treacherous environment.", "Friendship and loyalty can offer protection in a world rife with betrayal.", "Knowledge of the truth is essential for survival."],
        ap.goals = ["Short-term: To ensure Postumus leaves safely without attracting attention.", "Medium-term: To establish a sense of trust and solidarity among allies.", "Ultimate: To navigate the dangerous political landscape and protect those he cares for while finding his place in the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Postumus stands resolute, his posture tense as he prepares to leave. He casts a worried glance towards the sound of shouting, indicating his awareness of the imminent danger. His body language is a mix of defiance and anxiety, reflecting his internal struggle between loyalty to Claudius and the necessity of self-preservation.',
        ap.emotional_state = 'Externally, Postumus exhibits a mixture of urgency and resignation as he conveys the gravity of the situation to Claudius. Internally, he is conflicted, feeling the weight of familial expectation and the fear of Livia\'s wrath. His desire to impart the truth to Claudius and Germanicus battles with his instinct for self-preservation, revealing a man caught between loyalty and survival.',
        ap.emotional_tags = ["externally, postumus exhibits a mixture of urgency", "resignation as he conveys the gravity of the situation to claudius. internally, he is conflicted, feeling the weight of familial expectation", "the fear of livia's wrath. his desire to impart the truth to claudius", "germanicus battles with his instinct for self-preservation, revealing a man caught between loyalty", "survival.", "externally", "postumus exhibits a mixture of urgency and resignation as he conveys the gravity of the situation to claudius. internally", "he is conflicted", "feeling the weight of familial expectation and the fear of livia's wrath. his desire to impart the truth to claudius and germanicus battles with his instinct for self-preservation", "revealing a man caught between loyalty and survival."],
        ap.active_plans = ["To inform Claudius about Livia's manipulation and the danger it poses.", "To leave the garden quickly before Livia or her agents discover his presence.", "To ensure Germanicus is aware of the truth upon his return."],
        ap.beliefs = ["The truth must be shared, even at great personal risk.", "Self-preservation is essential in a hostile environment.", "Loyalty to friends is paramount, but must be balanced with personal safety."],
        ap.goals = ["Short-term: To leave the garden without being caught.", "Medium-term: To maintain a sense of alliance with Claudius while safeguarding his own interests.", "Ultimate: To navigate his family's treacherous politics and secure his own future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Postumus stands firmly planted in the stillness of the palace gardens, facing Claudius directly, his posture conveying a sense of urgency and suppressed emotion. He delivers his message with a directness born of desperation, his words punctuated by the imminent need to depart. He glances nervously towards distant sounds, a physical manifestation of the ever-present threat looming over him, ready to flee at a moment\'s notice.',
        ap.emotional_state = 'Beneath a veneer of resolve, Postumus is wrestling with a potent blend of regret and fear. Outwardly, he expresses sorrow for missing Claudius\'s wedding, a surface emotion that hints at a deeper melancholy. Internally, he is driven by a profound sense of danger, knowing his clandestine meeting with Claudius is fraught with peril.  Unspoken is the conflict between his desire to warn his friend and the instinct for self-preservation, a tension amplified by the ever-present threat of Livia\'s reach.',
        ap.emotional_tags = ["beneath a veneer of resolve, postumus is wrestling with a potent blend of regret", "fear. outwardly, he expresses sorrow for missing claudius's wedding, a surface emotion that hints at a deeper melancholy. internally, he is driven by a profound sense of danger, knowing his clandestine meeting with claudius is fraught with peril.  unspoken is the conflict between his desire to warn his friend", "the instinct for self-preservation, a tension amplified by the ever-present threat of livia's reach.", "beneath a veneer of resolve", "postumus is wrestling with a potent blend of regret and fear. outwardly", "he expresses sorrow for missing claudius's wedding", "a surface emotion that hints at a deeper melancholy. internally", "he is driven by a profound sense of danger", "knowing his clandestine meeting with claudius is fraught with peril.  unspoken is the conflict between his desire to warn his friend and the instinct for self-preservation", "a tension amplified by the ever-present threat of livia's reach."],
        ap.active_plans = ["To convey the crucial information about Livia's manipulation of Livilla to Claudius.", "To emphasize the gravity of the situation and the danger they both face.", "To depart swiftly and discreetly from the gardens to avoid detection by Livia's spies, ensuring his own immediate safety."],
        ap.beliefs = ["Livia is the ultimate orchestrator of treachery within the imperial family.", "Livilla is merely a puppet in Livia's grand scheme, manipulated for her grandmother's purposes.", "Claudius, despite his perceived foolishness, is a trustworthy confidant and deserves to know the truth to protect himself and potentially Germanicus."],
        ap.goals = ["short-term\": \"To escape the palace gardens undetected after delivering his warning to Claudius.", "medium-term\": \"To ensure that Germanicus is made aware of Livia's machinations upon his return to Rome, potentially leveraging this knowledge to counter Livia's influence.", "ultimate\": \"To survive the dangerous political landscape of the Roman court, even if it means accepting exile or a life constantly under threat, while ensuring the truth about Livia's actions comes to light, even if posthumously."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands attentively, his body language reflecting deep concentration as he absorbs Postumus\'s revelations. He maintains eye contact, his posture still yet alert, indicating he is fully engaged in the conversation despite the surrounding tension.  He responds with a gentle reassurance about his wedding, attempting to deflect from the gravity of the situation and ease Postumus\'s mind in this tense exchange.',
        ap.emotional_state = 'Claudius projects an outward calm, even making light of his own wedding, but beneath this facade lies a churning mix of anxiety and dawning understanding. He is outwardly empathetic to Postumus\'s situation, downplaying his own event to alleviate Postumus\'s regret. Internally, he is processing the weight of Postumus\'s accusations against Livia and Livilla, a revelation that confirms his growing suspicions about the court\'s treacherous nature. He is torn between his inherent desire for connection and the need to remain detached and observant to survive.',
        ap.emotional_tags = ["claudius projects an outward calm, even making light of his own wedding, but beneath this facade lies a churning mix of anxiety", "dawning understanding. he is outwardly empathetic to postumus's situation, downplaying his own event to alleviate postumus's regret. internally, he is processing the weight of postumus's accusations against livia", "livilla, a revelation that confirms his growing suspicions about the court's treacherous nature. he is torn between his inherent desire for connection", "the need to remain detached", "observant to survive.", "claudius projects an outward calm", "even making light of his own wedding", "but beneath this facade lies a churning mix of anxiety and dawning understanding. he is outwardly empathetic to postumus's situation", "downplaying his own event to alleviate postumus's regret. internally", "he is processing the weight of postumus's accusations against livia and livilla", "a revelation that confirms his growing suspicions about the court's treacherous nature. he is torn between his inherent desire for connection and the need to remain detached and observant to survive.", "claudius projects an outward calm, even making light of his own wedding,", "beneath this facade lies a churning mix of anxiety and dawning understanding. he is outwardly empathetic to postumus's situation, downplaying his own event to alleviate postumus's regret. internally, he is processing the weight of postumus's accusations against livia and livilla, a revelation that confirms his growing suspicions about the court's treacherous nature. he is torn between his inherent desire for connection and the need to remain detached and observant to survive."],
        ap.active_plans = ["To meticulously absorb and analyze the information Postumus is sharing about Livia and Livilla's plot, seeking to understand the full implications.", "To offer words of comfort and reassurance to Postumus, downplaying the personal significance of his wedding to ease Postumus's guilt and fear.", "To commit to relaying the vital information to Germanicus, recognizing the importance of informing a figure of power who might be able to act upon it."],
        ap.beliefs = ["Postumus's warnings about Livia and Livilla are credible and must be taken seriously, given the court's history of intrigue.", "His own perceived insignificance and 'fool' persona can be a form of protection, allowing him to observe and learn without drawing undue attention.", "Friendship and loyalty, even in a treacherous court, are valuable and should be reciprocated, as seen in his genuine concern for Postumus's safety."],
        ap.goals = ["short-term\": \"To ensure Postumus can escape the gardens safely and undetected, prioritizing his friend's immediate well-being.", "medium-term\": \"To discreetly convey Postumus's warning to Germanicus upon his return, potentially using this information to navigate the court's politics more effectively.", "ultimate\": \"To survive the dangerous currents of the Julio-Claudian court, leveraging his intellect and observational skills, and perhaps eventually emerge from the shadows to play a more significant role, while maintaining a semblance of personal integrity and loyalty to those he trusts."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Postumus stands in the moonlit garden, tension palpable in his posture. He leans slightly towards Claudius, urgency in his gaze, as if every word could be overheard. His hands are fidgeting, a stark contrast to his otherwise composed demeanor, reflecting the perilous nature of their conversation.',
        ap.emotional_state = 'Surface emotions reveal Postumus\'s anxiety, with furrowed brows and a tight jaw as he warns Claudius. Beneath this, a well of sorrow brews; he feels the weight of impending doom, knowing his fate is precarious, especially in the shadow of Livia\'s cunning. His internal conflict wrestles with the desire for survival and the pang of lost camaraderie.',
        ap.emotional_tags = ["surface emotions reveal postumus's anxiety, with furrowed brows", "a tight jaw as he warns claudius. beneath this, a well of sorrow brews; he feels the weight of impending doom, knowing his fate is precarious, especially in the shadow of livia's cunning. his internal conflict wrestles with the desire for survival", "the pang of lost camaraderie.", "surface emotions reveal postumus's anxiety", "with furrowed brows and a tight jaw as he warns claudius. beneath this", "a well of sorrow brews; he feels the weight of impending doom", "knowing his fate is precarious", "especially in the shadow of livia's cunning. his internal conflict wrestles with the desire for survival and the pang of lost camaraderie.", "surface emotions reveal postumus's anxiety, with furrowed brows and a tight jaw as he warns claudius. beneath this, a well of sorrow brews", "he feels the weight of impending doom, knowing his fate is precarious, especially in the shadow of livia's cunning. his internal conflict wrestles with the desire for survival and the pang of lost camaraderie."],
        ap.active_plans = ["To convey urgent information to Claudius regarding Livia's manipulations and ensure he understands the danger they face.", "To protect himself by leaving quickly, minimizing his exposure to potential threats from Livia.", "To instill a sense of caution in Claudius, advising him to play the fool for his safety."],
        ap.beliefs = ["Trust is a fragile construct in the imperial court, and survival often requires playing the role of the fool.", "Livia's ambition poses a genuine threat; one must tread carefully around her machinations.", "Solidarity among allies, even amidst treachery, is essential for navigating the perilous waters of their world."],
        ap.goals = ["Short-term: To escape the gardens undetected and warn Claudius before it is too late.", "Medium-term: To survive the political turmoil and maintain his position in the eyes of the court.", "Ultimate: To reclaim his place in the imperial family and find acceptance, despite the dangers that surround him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands facing Postumus, his stammer evident as he speaks, a mix of anxiety and determination etched on his face. His body language is tense, hands clasped nervously, while his posture reflects a blend of vulnerability and an emerging resolve to protect his friend.',
        ap.emotional_state = 'Claudius\'s outward demeanor reveals concern and a desire to reassure Postumus, but internally, he grapples with fear and helplessness. His stammer hints at his insecurity, yet beneath it lies a burgeoning awareness of the deadly nature of their surroundings. The unspoken conflict of wanting to be seen as capable while feeling overshadowed adds to his emotional complexity.',
        ap.emotional_tags = ["claudius's outward demeanor reveals concern", "a desire to reassure postumus, but internally, he grapples with fear", "helplessness. his stammer hints at his insecurity, yet beneath it lies a burgeoning awareness of the deadly nature of their surroundings. the unspoken conflict of wanting to be seen as capable while feeling overshadowed adds to his emotional complexity.", "claudius's outward demeanor reveals concern and a desire to reassure postumus", "but internally", "he grapples with fear and helplessness. his stammer hints at his insecurity", "yet beneath it lies a burgeoning awareness of the deadly nature of their surroundings. the unspoken conflict of wanting to be seen as capable while feeling overshadowed adds to his emotional complexity.", "claudius's outward demeanor reveals concern and a desire to reassure postumus, but internally, he grapples with fear and helplessness. his stammer hints at his insecurity, yet beneath it lies a burgeoning awareness of the deadly nature of their surroundings. the unspoken conflict of wanting to be seen as capable", "feeling overshadowed adds to his emotional complexity.", "claudius's outward demeanor reveals concern and a desire to reassure postumus,", "internally, he grapples with fear and helplessness. his stammer hints at his insecurity, yet beneath it lies a burgeoning awareness of the deadly nature of their surroundings. the unspoken conflict of wanting to be seen as capable while feeling overshadowed adds to his emotional complexity."],
        ap.active_plans = ["To reassure Postumus of his loyalty and urge him to stay alive despite the looming danger.", "To take the information about Livia's schemes seriously and relay it to Germanicus, understanding the gravity of the situation.", "To navigate the treacherous dynamics of the court by adopting the role of the fool as a protective mechanism."],
        ap.beliefs = ["The court thrives on deception, and one must adapt to survive.", "Friendship and loyalty can be powerful, even in the face of overwhelming treachery.", "His stammer and perceived weaknesses can be used as a shield against the threats posed by his family."],
        ap.goals = ["Short-term: To keep Postumus safe and secure vital information about Livia's plans.", "Medium-term: To strengthen his relationship with Germanicus by providing crucial insights into the court's dangers.", "Ultimate: To find a way to assert himself within the imperial family while ensuring his own survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Postumus, having delivered his urgent message to Claudius, is poised to depart.  He physically stands, his body tense and alert, ready to flee should the distant shouts escalate or move closer. His eyes dart nervously towards the direction of the sound, betraying his apprehension and heightened awareness of the ever-present danger he faces within the palace grounds. He is on edge, every sense tuned to potential threats.',
        ap.emotional_state = 'Postumus is gripped by anxiety and a palpable sense of urgency. Outwardly, his nervousness is evident in his glances and physical tension. Internally, fear for his own safety is paramount, amplified by the knowledge that his clandestine meeting with Claudius could be perceived as treasonous.  He is also likely feeling a surge of vindication that his suspicions about Livia\'s treachery are confirmed, yet this offers little comfort in the face of immediate peril. A deep-seated mistrust of the court fuels his desperate need to escape.',
        ap.emotional_tags = ["postumus is gripped by anxiety", "a palpable sense of urgency. outwardly, his nervousness is evident in his glances", "physical tension. internally, fear for his own safety is paramount, amplified by the knowledge that his clandestine meeting with claudius could be perceived as treasonous.  he is also likely feeling a surge of vindication that his suspicions about livia's treachery are confirmed, yet this offers little comfort in the face of immediate peril. a deep-seated mistrust of the court fuels his desperate need to escape.", "postumus is gripped by anxiety and a palpable sense of urgency. outwardly", "his nervousness is evident in his glances and physical tension. internally", "fear for his own safety is paramount", "amplified by the knowledge that his clandestine meeting with claudius could be perceived as treasonous.  he is also likely feeling a surge of vindication that his suspicions about livia's treachery are confirmed", "yet this offers little comfort in the face of immediate peril. a deep-seated mistrust of the court fuels his desperate need to escape."],
        ap.active_plans = ["To immediately leave the gardens and evade potential pursuers.", "To remain undetected and disappear from the immediate vicinity of the palace.", "To consider his next move to ensure his long-term survival in light of Livia's schemes."],
        ap.beliefs = ["Livia is actively plotting against him and represents a lethal threat.", "His presence in the gardens is now compromised and poses immediate danger.", "Claudius, despite his perceived weaknesses, is a trustworthy confidant and ally."],
        ap.goals = ["Short-term: To escape the gardens without being seen or apprehended.", "Medium-term: To potentially seek refuge or find a way to warn Germanicus himself.", "Ultimate: To expose Livia's treachery and clear his name, though survival is the more pressing objective at this moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Claudius, though physically still standing face-to-face with Postumus, becomes acutely aware of the auditory disruption in the distance. His posture likely shifts subtly, becoming more rigid as he listens intently to the shouts.  He remains observant, his gaze perhaps flickering towards the direction of the noise while maintaining focus on Postumus, processing the potential implications of this sudden intrusion on their clandestine meeting. He is now poised, ready to react to any escalation of the disturbance.',
        ap.emotional_state = 'Claudius experiences a surge of concern, primarily for Postumus\'s immediate safety, given the perilous nature of their conversation. Outwardly, he might show a restrained anxiety, masking his deeper feelings as is his habit. Internally, he feels a growing sense of unease and foreboding, realizing the volatile environment they inhabit is intruding upon their private moment. The shouts serve as a stark reminder of the ever-present danger and the validity of Postumus’s fears, solidifying Claudius\'s understanding of the treacherous court dynamics. ',
        ap.emotional_tags = ["claudius experiences a surge of concern, primarily for postumus's immediate safety, given the perilous nature of their conversation. outwardly, he might show a restrained anxiety, masking his deeper feelings as is his habit. internally, he feels a growing sense of unease", "foreboding, realizing the volatile environment they inhabit is intruding upon their private moment. the shouts serve as a stark reminder of the ever-present danger", "the validity of postumus\u2019s fears, solidifying claudius's understanding of the treacherous court dynamics.", "claudius experiences a surge of concern", "primarily for postumus's immediate safety", "given the perilous nature of their conversation. outwardly", "he might show a restrained anxiety", "masking his deeper feelings as is his habit. internally", "he feels a growing sense of unease and foreboding", "realizing the volatile environment they inhabit is intruding upon their private moment. the shouts serve as a stark reminder of the ever-present danger and the validity of postumus\u2019s fears", "solidifying claudius's understanding of the treacherous court dynamics."],
        ap.active_plans = ["To ensure Postumus can escape safely and undetected, potentially offering assistance or cover.", "To assess the nature and proximity of the shouts to determine the level of immediate threat.", "To mentally prepare to relay Postumus's message to Germanicus, understanding the weight and danger of this task."],
        ap.beliefs = ["The distant shouts likely signify a potential threat or discovery, reinforcing the danger Postumus is in.", "Livia and her faction are capable of surveillance and swift, ruthless action.", "Protecting Postumus and honoring his trust by delivering the message to Germanicus are crucial responsibilities."],
        ap.goals = ["Short-term: To facilitate Postumus\u2019s safe departure and ensure neither of them are implicated by the disturbance.", "Medium-term: To carefully consider how and when to approach Germanicus with Postumus's vital information.", "Ultimate: To navigate the treacherous court politics and survive, while also upholding his moral compass and loyalties in a corrupt world."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_horace'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_horace'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_horace_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_praxis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_courier'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_courier'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_praxis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_livy'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_praxis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livy'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livy'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livy'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livy'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livy_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pollio'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pollio_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_3'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_6'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus_father'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_father_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_father_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Event {uuid: 'event_6_5'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_4'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_6_6'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_5'}),
          (b:Event {uuid: 'event_6_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_6_7'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_6'}),
          (b:Event {uuid: 'event_6_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_6_8'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_7'}),
          (b:Event {uuid: 'event_6_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_6_9'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_8'}),
          (b:Event {uuid: 'event_6_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_6'}),
          (b:Event {uuid: 'event_6_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_7'}),
          (b:Event {uuid: 'event_6_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_7'}),
          (b:Event {uuid: 'event_6_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_8'}),
          (b:Event {uuid: 'event_6_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_8'}),
          (b:Event {uuid: 'event_6_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_9'}),
          (b:Event {uuid: 'event_6_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_9'}),
          (b:Event {uuid: 'event_6_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_9_7'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_what_shall_we_do_about_claudius?'})
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
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
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
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
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
                

                MATCH (e1:Event {uuid: 'event_4_5'}),
                      (e2:Event {uuid: 'event_4_6'})
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
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_4'}),
                      (e2:Event {uuid: 'event_6_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_4'}),
                      (e2:Event {uuid: 'event_6_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_5'}),
                      (e2:Event {uuid: 'event_6_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_4'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_5'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_6'}),
                      (e2:Event {uuid: 'event_6_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_4'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_5'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_6'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_7'}),
                      (e2:Event {uuid: 'event_6_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_4'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_5'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_6'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_7'}),
                      (e2:Event {uuid: 'event_6_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_8'}),
                      (e2:Event {uuid: 'event_6_9'})
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
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_2'})
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
