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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e12_graph.json',
        creation_timestamp: '2025-04-11T16:17:59.412062',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_messalina'})
    ON CREATE SET
        a.name = 'Messalina',
        a.title = 'Empress of Rome',
        a.description = 'Messalina, the Empress of Rome, strides through the marble halls of power like a tempest, her beauty both intoxicating and deadly. Born into privilege yet confined by societal expectations of her era, she defies norms by wielding her sexuality as a weapon and her cunning as a shield. Now, cornered in her chambers and facing the horrifying consequences of her reckless actions, her bravado gives way to raw fear and desperate denial as she hopes her husband, Claudius, will not condemn her.',
        a.traits = ["desperate", "fearful", "in denial", "volatile", "proud"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_mnester'})
    ON CREATE SET
        a.name = 'Mnester',
        a.title = 'Dancer',
        a.description = 'Mnester is a handsome actor known for his charm and popularity with the Roman crowds. Working in the theater and connected to Messalina\'s social circle, his witty and somewhat insolent banter underscores his playful yet observant nature. He is part of the inner circle at Silius\' villa, reveling in the wedding celebrations while displaying a sharp perception of events around him.',
        a.traits = ["Witty", "Observant", "Playful", "Perceptive"],
        a.sphere_of_influence = 'Roman Theatre'
    ;
MERGE (a:Agent {uuid: 'agent_narcissus'})
    ON CREATE SET
        a.name = 'Narcissus',
        a.title = 'Advisor to Emperor Claudius',
        a.description = 'Narcissus is one of Emperor Claudius\'s trusted advisors, a pragmatic and ruthless figure deeply embedded in the Roman court\'s power dynamics. Known for his cold, calculating demeanor, he focuses on maintaining order and control, and in this scene he is decisive and efficient as he orchestrates the practicalities of Messalina\'s execution.',
        a.traits = ["Cold", "Calculating", "Decisive", "Ruthless"],
        a.sphere_of_influence = 'Court Politics'
    ;
MERGE (a:Agent {uuid: 'agent_pallas'})
    ON CREATE SET
        a.name = 'Pallas',
        a.title = 'Advisor to Emperor Claudius',
        a.description = 'Pallas is a highly influential freedman and advisor to Emperor Claudius, renowned for his cunning intellect and masterful political maneuvering. He remains efficient, pragmatic, and subtly manipulative as he undertakes the crisis caused by Messalina\'s actions, ensuring the smooth execution of Claudius\'s will while preserving his own power.',
        a.traits = ["Cunning", "Pragmatic", "Efficient", "Manipulator"],
        a.sphere_of_influence = 'Political Intrigue'
    ;
MERGE (a:Agent {uuid: 'agent_caractacus'})
    ON CREATE SET
        a.name = 'Caractacus',
        a.title = 'None',
        a.description = 'Caractacus is a British chieftain and a potent symbol of resistance against Roman rule in Britain. Portrayed as defiant and courageous, he exemplifies the indigenous struggle for freedom amid Roman expansion. His strategic retreat to the west after the battle at Colchester underscores his determination to continue the fight.',
        a.traits = ["Defiant", "Courageous", "Resilient", "Strategic"],
        a.sphere_of_influence = 'Britannic Resistance'
    ;
MERGE (a:Agent {uuid: 'agent_aulus'})
    ON CREATE SET
        a.name = 'Aulus',
        a.title = 'None',
        a.description = 'Aulus Plautius is a Roman military commander leading the campaign to subdue Britain. Determined and militarily capable, he is focused on achieving Roman victory and consolidating imperial control. His pursuit of Caractacus with the Ninth Cavalry highlights his commitment to crushing resistance and enforcing imperial dominance.',
        a.traits = ["Determined", "Militarily Capable", "Imperialistic", "Relentless"],
        a.sphere_of_influence = 'Roman Military Command'
    ;
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'Emperor of Rome',
        a.description = 'Claudius, Emperor of Rome, is portrayed as a tragic figure ensnared in the treacherous politics of his court. More interested in scholarship than ruthless political maneuvers, his naive and unassuming nature belies the vast power he wields. Though absent from the scene, his orders form the instruments of Messalina\'s downfall, underscoring his haunting authority.',
        a.traits = ["Naive", "Scholar", "Tragic", "Unaware"],
        a.sphere_of_influence = 'Imperial Authority'
    ;
MERGE (a:Agent {uuid: 'agent_scylla'})
    ON CREATE SET
        a.name = 'Scylla',
        a.title = 'Courtesan',
        a.description = 'Scylla is a renowned courtesan and President of the Guild of Prostitutes, whose allure is matched by her shrewd business acumen. Navigating her profession with confidence and pragmatism, she understands the interplay of power and reputation, leveraging her beauty to assert her worth and challenge societal norms.',
        a.traits = ["Alluring", "Shrewd", "Assertive", "Resourceful"],
        a.sphere_of_influence = 'Prostitution Guild'
    ;
MERGE (a:Agent {uuid: 'agent_quintus_justus'})
    ON CREATE SET
        a.name = 'Quintus Justus',
        a.title = 'None',
        a.description = 'Quintus Justus is a courtier within the palace guard or administration, characterized by his anxious and rash demeanor. Deeply scandalized by Messalina\'s behavior and driven by a misguided loyalty to Claudius, he is impulsive and naive in navigating the treacherous waters of court intrigue.',
        a.traits = ["Anxious", "Suspicious", "Outraged", "Naive", "Loyal (to Emperor)", "Impulsive"],
        a.sphere_of_influence = 'Court Politics (lower level)'
    ;
MERGE (a:Agent {uuid: 'agent_colonel_ruffrius'})
    ON CREATE SET
        a.name = 'Colonel Ruffrius',
        a.title = 'Colonel',
        a.description = 'Colonel Ruffrius is the superior officer of Quintus Justus and a trusted member of Lady Messalina\'s inner circle. His role within the palace guard and Roman military administration is marked by a cautious and potentially treacherous alignment with Messalina. He prioritizes personal connections and courtly favor over straightforward duty.',
        a.traits = ["Connected (to Messalina)", "Politically Aligned (with Messalina)", "Cautious", "Potentially Treacherous", "Influential"],
        a.sphere_of_influence = 'Court Politics'
    ;
MERGE (a:Agent {uuid: 'agent_marsus_vibius'})
    ON CREATE SET
        a.name = 'Marsus Vibius',
        a.title = 'Governor of Syria',
        a.description = 'Marsus Vibius is a stern and pragmatic governor known for his loyalty to the Roman Empire and his no-nonsense approach to governance. With a military bearing and a direct manner, he reliably advises Claudius and maintains stability and security in the face of potential threats.',
        a.traits = ["Pragmatic", "Loyal", "Direct", "Military-minded"],
        a.sphere_of_influence = 'Provincial Administration'
    ;
MERGE (a:Agent {uuid: 'agent_herod_agrippa'})
    ON CREATE SET
        a.name = 'Herod Agrippa',
        a.title = 'King (deceased)',
        a.description = 'Herod Agrippa is a complex figure depicted through his dying letter as both friend and betrayer to Claudius. Ambitious and manipulative, his tragic downfall and treacherous ambitions are intertwined with divine retribution. His final words offer a chilling warning, underscoring the dangerous interplay of ambition and politics in his world.',
        a.traits = ["Treacherous", "Ambitious", "Remorseful (in death)", "Manipulative", "Cunning", "Affectionate (towards Claudius, in his own way)"],
        a.sphere_of_influence = 'Eastern Kingdoms, Judea'
    ;
MERGE (a:Agent {uuid: 'agent_antipas'})
    ON CREATE SET
        a.name = 'Antipas',
        a.title = 'Uncle of Herod Agrippa',
        a.description = 'Antipas, the uncle of Herod Agrippa, serves as a gossipy informant within royal circles and the court gossip network. His communications with Claudius reveal insights into Herod Agrippa\'s delusions and ambitions, although his accounts are often laced with hearsay and speculation.',
        a.traits = ["Gossipy", "Informative", "Observant", "Speculative", "Royal connection", "Uncle"],
        a.sphere_of_influence = 'Royal Circles, Court Gossip'
    ;
MERGE (a:Agent {uuid: 'agent_caligula'})
    ON CREATE SET
        a.name = 'Caligula',
        a.title = 'Former Emperor of Rome',
        a.description = 'Caligula, the deceased former Emperor and Claudius\'s nephew, is remembered for his erratic and grandiose behavior. His tumultuous reign and association with messianic prophecies render his name a benchmark in discussions of imperial excess and instability.',
        a.traits = ["Deceased", "Erratic", "Grandiose", "Former Emperor", "Messianic associations"],
        a.sphere_of_influence = 'Past Roman Empire'
    ;
MERGE (a:Agent {uuid: 'agent_thrasyllus'})
    ON CREATE SET
        a.name = 'Thrasyllus',
        a.title = 'Astrologer',
        a.description = 'Thrasyllus is a renowned astrologer whose accurate prophecies, particularly concerning dates of death, lend authority to discussions of fate and messianic prophecy. His predictions are heavily cited by Claudius and play a significant role in interpreting omens within Roman belief systems.',
        a.traits = ["Astrologer", "Prophetic", "Accurate", "Deceased", "Respected"],
        a.sphere_of_influence = 'Astrology, Prophecy, Roman Beliefs'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia',
        a.title = 'Grandmother of Claudius',
        a.description = 'Livia, the deceased grandmother of Claudius, is a revered historical figure whose death marked a crucial point for astrological prophecies. Her passing serves as a fixed point in the calculations of prophecy, linking her legacy to the broader narrative of messianic expectations in Roman history.',
        a.traits = ["Deceased", "Historical figure", "Grandmother of Claudius", "Related to prophecy"],
        a.sphere_of_influence = 'Roman Imperial History, Prophecy'
    ;
MERGE (a:Agent {uuid: 'agent_gaius_silius'})
    ON CREATE SET
        a.name = 'Gaius Silius',
        a.title = 'Consul-elect',
        a.description = 'Gaius Silius is a charismatic and ambitious political figure whose torrid affair with Empress Messalina marks him as a volatile force within Rome\'s power dynamics. Revelling in his apparent victory, his arrogance and bravado lead him to mock Claudius, while his misjudged invitation to the guards underscores his dangerous overconfidence.',
        a.traits = ["Arrogant", "Overconfident", "Ambitious", "Reckless"],
        a.sphere_of_influence = 'Roman Politics'
    ;
MERGE (a:Agent {uuid: 'agent_calpurnia'})
    ON CREATE SET
        a.name = 'Calpurnia',
        a.title = 'Courtesan',
        a.description = 'Calpurnia is a courtesan of Rome, emerging from the city\'s less glamorous underbelly. Known for her nervous bravery and honest, perceptive nature, she navigates the harsh realities of her world with unyielding integrity, offering a penetrating insight into the intricacies of Roman court life.',
        a.traits = ["Nervous", "Brave", "Honest", "Perceptive"],
        a.sphere_of_influence = 'Underground Society'
    ;
MERGE (a:Agent {uuid: 'agent_domitia'})
    ON CREATE SET
        a.name = 'Domitia',
        a.title = 'Aunt to Messalina',
        a.description = 'Domitia, the aunt of Messalina, is a figure of stern Roman tradition and disapproval. With an austere and pragmatic demeanor, she embodies the old guard of Roman nobility, urging her niece to confront her downfall with dignity and to accept the grim realities of their world.',
        a.traits = ["stoic", "austere", "traditional", "resolute", "grimly pragmatic"],
        a.sphere_of_influence = 'Roman Nobility'
    ;
MERGE (a:Agent {uuid: 'agent_girl_messenger'})
    ON CREATE SET
        a.name = 'Girl',
        a.title = 'Messenger',
        a.description = 'A young, unnamed girl bursts into Silius\' villa bearing devastating news. Her panicked and trembling demeanor shatters the revelry, serving as the harbinger of doom and signaling the brutal intrusion of imperial authority into the celebration.',
        a.traits = ["Panicked", "Frightened", "Urgent", "Messenger"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_geta'})
    ON CREATE SET
        a.name = 'Geta',
        a.title = 'Guard',
        a.description = 'Geta serves as a guard within the imperial palace and is a loyal enforcer of Emperor Claudius\'s will. Functioning as a dedicated functionary, he carries out orders with bureaucratic efficiency and a detached sense of duty, embodying the cold professionalism of imperial security.',
        a.traits = ["loyal", "obedient", "impersonal", "duty-bound"],
        a.sphere_of_influence = 'Imperial Security'
    ;
MERGE (o:Object {uuid: 'object_warrant'})
    ON CREATE SET
        o.name = 'Warrant',
        o.description = 'An official warrant bearing Claudius\'s unmistakable signature. It is portrayed as the Emperor\'s death sentence on parchment, a cold, bureaucratic document that seals Messalina\'s doom and represents an ultimate betrayal.',
        o.purpose = 'To formalize the execution of Messalina.',
        o.significance = 'A symbol of imperial power and irrevocable authority, crushing any lingering hope.'
    ;
MERGE (o:Object {uuid: 'object_scrolls'})
    ON CREATE SET
        o.name = 'Scrolls',
        o.description = 'Ancient scrolls featured in Claudius\'s study that symbolize his intellectual pursuits, engagement with history, and a personal attempt to document his unusual life.',
        o.purpose = 'Record keeping, scholarship, and historical documentation.',
        o.significance = 'Represent Claudius\'s intellectual nature and his desire to understand and archive his experiences.'
    ;
MERGE (o:Object {uuid: 'object_dispatches'})
    ON CREATE SET
        o.name = 'Dispatches',
        o.description = 'Official messages or reports scattered across Claudius\'s desk, relaying updates and important communications from various corners of the empire.',
        o.purpose = 'To relay important messages and updates regarding the empire\'s affairs.',
        o.significance = 'Highlight the extensive communication network vital for governance and the challenges faced by Claudius.'
    ;
MERGE (o:Object {uuid: 'object_documents'})
    ON CREATE SET
        o.name = 'Documents',
        o.description = 'A collection of unspecified official reports, intelligence, or legal texts reviewed by Pallas, reflecting his analytical and methodical nature.',
        o.purpose = 'Information gathering, governance, and strategic planning.',
        o.significance = 'Symbolize the administrative machinery of the Roman Empire and Pallas\'s attention to detail in times of crisis.'
    ;
MERGE (o:Object {uuid: 'object_desk'})
    ON CREATE SET
        o.name = 'Desk',
        o.description = 'A large, central piece of furniture in Claudius\'s study, upon which scrolls, dispatches, and documents are scattered. It is both a literal workspace and a symbol of the burden of imperial responsibilities.',
        o.purpose = 'Workspace for writing and studying.',
        o.significance = 'Represents Claudius\'s active engagement in governance and scholarship.'
    ;
MERGE (o:Object {uuid: 'object_statues_of_roman_gods'})
    ON CREATE SET
        o.name = 'Statues of Roman Gods',
        o.description = 'Sculptures of Roman deities placed within Claudius\'s study, representing the traditional religious beliefs and customs of the empire.',
        o.purpose = 'Religious veneration and decoration.',
        o.significance = 'Symbolize Roman religion and imperial tradition, reinforcing the formal atmosphere of the study.'
    ;
MERGE (o:Object {uuid: 'object_senatorial_robes'})
    ON CREATE SET
        o.name = 'Senatorial Robes',
        o.description = 'Simple senatorial robes worn by Claudius that indicate his connection to the Roman Senate and traditional political roles, despite his imperial status.',
        o.purpose = 'Clothing and symbol of status.',
        o.significance = 'Embody Roman senatorial tradition and Claudius\'s political positioning, suggesting modesty and underplayed authority.'
    ;
MERGE (o:Object {uuid: 'object_letter_from_marsus_vibius'})
    ON CREATE SET
        o.name = 'Letter from Marsus Vibius',
        o.description = 'A specific dispatch from Marsus Vibius containing startling news about Herod Agrippa’s activities, and serving as a catalyst for conflict within the narrative.',
        o.purpose = 'To inform Claudius about potential threats to Roman rule.',
        o.significance = 'Sets the stage for Claudius\'s worries regarding Herod\'s loyalty and intentions.'
    ;
MERGE (o:Object {uuid: 'object_letter_from_antipas'})
    ON CREATE SET
        o.name = 'Letter from Antipas',
        o.description = 'A letter containing gossip and insights that reveal Herod Agrippa\'s self-perception as the Jewish Messiah, offering Pallas a perspective on potential motives behind Herod’s actions.',
        o.purpose = 'Communication of personal insights and gossip.',
        o.significance = 'Provides a potential motive for Herod\'s actions and highlights the role of informal intelligence in decision-making.'
    ;
MERGE (o:Object {uuid: 'object_play'})
    ON CREATE SET
        o.name = 'Play',
        o.description = 'A theatrical performance requested by Messalina\'s friends and resisted by Mnester, symbolizing Messalina\'s demand for influence in public affairs.',
        o.purpose = 'Entertainment and theatrical performance.',
        o.significance = 'Serves as a point of conflict between Messalina and Mnester, reflecting Messalina\'s spoiled and demanding character.'
    ;
MERGE (o:Object {uuid: 'object_bed'})
    ON CREATE SET
        o.name = 'Bed',
        o.description = 'Claudius\'s bed, referenced in a context imbued with intimacy and suggestive commentary by Messalina, highlighting personal relationships and manipulative tactics.',
        o.purpose = 'Sleeping and facilitating intimacy.',
        o.significance = 'Symbolizes personal relationships and becomes a tool in Messalina\'s manipulative strategies.'
    ;
MERGE (o:Object {uuid: 'object_ornate_tapestry'})
    ON CREATE SET
        o.name = 'Ornate Tapestry',
        o.description = 'A large, ornate tapestry being removed from the wall in Messalina\'s private suite. Originally a gift from Claudius, it now symbolizes infidelity and Messalina\'s reckless abandonment of imperial favor.',
        o.purpose = 'Decoration and as a potential gift.',
        o.significance = 'Represents Messalina\'s infidelity and her defiance of Claudius, foreshadowing conflict and scandal.'
    ;
MERGE (o:Object {uuid: 'object_letter_from_herod'})
    ON CREATE SET
        o.name = 'Letter from Herod',
        o.description = 'A royal dispatch from Herod Agrippa sealed with his royal seal, serving as both a confession and farewell. It reveals remorse, betrayal, and provides a chilling final warning.',
        o.purpose = 'Communication, confession, and warning.',
        o.significance = 'Symbolizes betrayal, lost friendship, and foreshadows future dangers.'
    ;
MERGE (o:Object {uuid: 'object_royal_seal'})
    ON CREATE SET
        o.name = 'Royal Seal',
        o.description = 'A prominent royal seal featured on Herod\'s letter, symbolizing authority and the authenticity of imperial communications. It also metaphorically represents Messalina’s manipulation of imperial power.',
        o.purpose = 'Authentication and symbol of authority.',
        o.significance = 'Embodies royal authority and underscores the dangers of manipulated imperial power.'
    ;
MERGE (o:Object {uuid: 'object_history_of_my_life_scroll'})
    ON CREATE SET
        o.name = 'History of My Life (Scroll)',
        o.description = 'An autobiographical work recorded on scrolls by Claudius. It represents his attempt at self-reflection and documenting his reign and personal ordeals amid political turmoil.',
        o.purpose = 'Autobiography, historical record, self-reflection.',
        o.significance = 'Symbolizes Claudius\'s introspection and his desire to leave a truthful account of his life and reign.'
    ;
MERGE (o:Object {uuid: 'object_declaration_of_divorce'})
    ON CREATE SET
        o.name = 'Declaration of Divorce',
        o.description = 'A formal document sent by Messalina to Claudius via a freedman in Ostia. It publicly declares her abandonment of marriage and imperial commitment, marking a scandalous act of rebellion.',
        o.purpose = 'Formalize divorce and serve as a political declaration of abandonment.',
        o.significance = 'Acts as a catalyst for conflict and symbolizes Messalina\'s open rebellion against imperial authority.'
    ;
MERGE (o:Object {uuid: 'object_wine'})
    ON CREATE SET
        o.name = 'Wine',
        o.description = 'Wine that flows abundantly at Silius\' villa during a wedding celebration, contributing to the atmosphere of revelry and drunken excess.',
        o.purpose = 'Serves as a celebratory drink and intoxicant.',
        o.significance = 'Symbolizes hedonism, excessive revelry, and the misjudged sense of security among the celebrants.'
    ;
MERGE (o:Object {uuid: 'object_swords'})
    ON CREATE SET
        o.name = 'Swords',
        o.description = 'Drawn swords carried by the Emperor\'s guards. Their sudden presence shifts the tone from celebration to impending violence, representing the harsh enforcement of imperial justice.',
        o.purpose = 'Serve as weapons and as symbols of authority.',
        o.significance = 'Represent the Emperor’s power and the looming threat of brutal justice.'
    ;
MERGE (o:Object {uuid: 'object_cloud_claudius_shape'})
    ON CREATE SET
        o.name = 'Cloud in the Shape of Claudius',
        o.description = 'A cloud observed to bear a resemblance to Claudius, used metaphorically and mockingly by Messalina and her circle to downplay his authority while also foreshadowing his imminent arrival.',
        o.purpose = 'Acts as a metaphorical representation of Claudius.',
        o.significance = 'Symbolizes Claudius\'s looming presence and serves as a moment of dramatic irony regarding his eventual intervention.'
    ;
MERGE (o:Object {uuid: 'object_charge_sheets'})
    ON CREATE SET
        o.name = 'Charge Sheets',
        o.description = 'Documents detailing charges against those arrested for treason, including Messalina and Gaius Silius. They formalize the accusations and initiate the legal proceedings.',
        o.purpose = 'To formalize accusations of treason and legal charges.',
        o.significance = 'Symbolize the bureaucratic apparatus of Roman justice and the heavy burden of imperial authority.'
    ;
MERGE (o:Object {uuid: 'object_dagger'})
    ON CREATE SET
        o.name = 'Dagger',
        o.description = 'A sharp, gleaming dagger offered by Geta to Messalina as a grim symbol. It embodies the brutal dichotomy of choosing between a self-inflicted death and a harsher execution.',
        o.purpose = 'Acts as an instrument for suicide and a symbolic choice between life and enforced death.',
        o.significance = 'Represents Roman justice, finality, and a twisted form of mercy in the context of Messalina’s fate.'
    ;
MERGE (l:Location {uuid: 'location_provincial_theater_backstage_colchester'})
    ON CREATE SET
        l.name = 'Provincial Theater - Backstage',
        l.description = 'The backstage of the Provincial Theater in Colchester is a functional area, likely cluttered with props, costumes, and the tools of theatrical production. It is a space for work and preparation, contrasting with the ornate performance area, and serves as a discrete location for private, clandestine conversations away from the public spectacle.',
        l.type = 'Theater'
    ;
MERGE (l:Location {uuid: 'location_colchester'})
    ON CREATE SET
        l.name = 'Forum of Colchester',
        l.description = 'The Forum of Colchester is a bustling center of activity filled with citizens, courtiers, actors, vendors, and makeshift stages. The lively atmosphere is underscored by palpable tension and anticipation as it serves as a vital public space for social interactions, performances, and announcements in Roman provincial life.',
        l.type = 'Town Square'
    ;
MERGE (l:Location {uuid: 'location_britain'})
    ON CREATE SET
        l.name = 'Britain',
        l.description = 'Britain, re-established as a Roman province after 108 years since Julius Caesar\'s campaigns, is a territory on the edge of the Roman world. Marked by recent Roman victory and persistent instability, it reflects both conquest and ongoing resistance.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_claudian_palace_anteroom'})
    ON CREATE SET
        l.name = 'Claudian Palace - Anteroom',
        l.description = 'The anteroom of the Claudian Palace is a waiting and transitional space just outside more private rooms. Decorated in the opulent Roman style with marble features, it carries a formal, tense atmosphere due to the high-stakes political conversations held within its walls.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_new_palace'})
    ON CREATE SET
        l.name = 'New Palace',
        l.description = 'The New Palace is a recently constructed residence distinct from the Claudian Palace. It is a center of scandalous and debauched activities involving Empress Messalina, symbolizing a space of illicit pleasure, hedonism, and unchecked imperial indulgence.',
        l.type = 'Palace'
    ;
MERGE (l:Location {uuid: 'location_imperial_study'})
    ON CREATE SET
        l.name = 'Claudius\'s Private Study',
        l.description = 'Claudius\'s Private Study is a dimly lit, private sanctuary filled with scrolls and documents. In this space, illuminated by flickering candlelight, the Emperor reflects on weighty matters, isolated from the tumultuous world of court politics.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_jerusalem'})
    ON CREATE SET
        l.name = 'Jerusalem',
        l.description = 'Jerusalem in Judea is depicted as a fortified city under Herod Agrippa’s control, raising suspicions of revolt against Roman rule. Its fortifications underscore its strategic importance and the latent challenge it poses to Roman authority.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_syria'})
    ON CREATE SET
        l.name = 'Syria',
        l.description = 'Syria is a Roman province bordering Judea and serves as the operational base for surveillance and intelligence regarding potential threats to Roman rule. Governed by Marsus Vibius, it is strategically important for maintaining control in the Eastern provinces.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_rome'})
    ON CREATE SET
        l.name = 'Rome',
        l.description = 'Rome, the illustrious capital of the Roman Empire, stands as the center of power and imperial administration. It is the political heart where the Senate convenes and where both the repercussions of scandal and the exercise of authority are most keenly felt.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_bedchamber'})
    ON CREATE SET
        l.name = 'Bedchamber',
        l.description = 'Claudius\'s bedchamber is a private and intimate space associated with his personal life. Noted by Messalina for its potential use later in the night, it carries the connotation of personal vulnerability and the complexities of private relationships within the imperial household.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_messalina_private_suite'})
    ON CREATE SET
        l.name = 'Messalina\'s Private Suite',
        l.description = 'Messalina\'s Private Suite is an opulent, sun-drenched chamber within the palace adorned with rich tapestries and fine furnishings. Designed for comfort and indulgence, it simultaneously reflects wealth and status while hinting at the underlying turmoil caused by Messalina\'s scandalous actions.',
        l.type = 'Suite'
    ;
MERGE (l:Location {uuid: 'location_royal_chambers'})
    ON CREATE SET
        l.name = 'Royal Chambers',
        l.description = 'The Royal Chambers are an intimate, dimly lit space within a royal residence. Suggestive of luxury and seclusion, this area serves as a confidential location for private conversations among members of the royal family, enhancing the aura of imperial authority and vulnerability.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_secluded_portico_ostia'})
    ON CREATE SET
        l.name = 'Secluded Portico - Ostia',
        l.description = 'The secluded portico in Ostia is a shadowed, private area removed from the bustling harbor. Enveloped in an atmosphere of conspiracy, it provides a discreet setting for clandestine discussions and the secret ambitions of its occupants.',
        l.type = 'Portico'
    ;
MERGE (l:Location {uuid: 'location_claudius_private_chambers_ostia'})
    ON CREATE SET
        l.name = 'Claudius\'s Private Chambers',
        l.description = 'Claudius\'s Private Chambers in Ostia are opulent and comfortable, reflecting the Emperor\'s status even when away from Rome. Despite their private nature, these chambers are not impervious to intrusion, as evidenced by a sudden, chaotic disturbance.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_pallas_chambers_ostia'})
    ON CREATE SET
        l.name = 'Pallas\'s chambers',
        l.description = 'Pallas\'s chambers in Ostia are functional and orderly, doubling as a workspace away from the main palace. Their controlled, focused atmosphere stands in stark contrast to the more frantic settings in other parts of the imperial residence.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_ostia'})
    ON CREATE SET
        l.name = 'Ostia',
        l.description = 'Ostia, the sun-drenched port of Rome, is a vibrant hub of maritime commerce and decadent indulgence. Its bustling docks, opulent villas, and festive banquets contribute to its reputation as a stage for audacious acts and the liberal lifestyle of the Roman elite.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_silius_villa_ostia'})
    ON CREATE SET
        l.name = 'Silius\' Villa',
        l.description = 'Silius\' Villa in Ostia is a haven of opulent excess and revelry. Adorned with rich tapestries and exotic delicacies, it is the backdrop for extravagant celebrations that blur the lines between forbidden desire and rebellious ambition, until the disruption by the Emperor\'s guards shatters the revelry.',
        l.type = 'Villa'
    ;
MERGE (l:Location {uuid: 'location_claudian_palace_corridor'})
    ON CREATE SET
        l.name = 'Palace Corridor',
        l.description = 'The Palace Corridor is a long, echoing passage within the palace, heavy with the weight of imperial authority. This transitional space bears witness to dramatic confrontations, secretive movements, and the solemn progression of imperial duty amid whispers and echoes of betrayal.',
        l.type = 'Corridor'
    ;
MERGE (l:Location {uuid: 'location_temple_of_claudius_colchester'})
    ON CREATE SET
        l.name = 'Temple of Claudius',
        l.description = 'The Temple of Claudius in Colchester is a newly erected structure constructed of gleaming white stone. Bathed in moonlight, it stands as a symbol of Roman imperial power and the cult of emperor worship, contrasting the sacredness of its purpose with the dark, plotting deeds occurring nearby.',
        l.type = 'Temple'
    ;
MERGE (l:Location {uuid: 'location_messalina_chambers'})
    ON CREATE SET
        l.name = 'Messalina\'s Chambers',
        l.description = 'Messalina\'s Chambers, once a sanctuary of lush opulence, now feel like a gilded cage. Rich tapestries and fine furnishings, once markers of luxury, now underscore the sense of impending doom as the space becomes suffused with dread and frantic energy.',
        l.type = 'Room'
    ;
MERGE (o:Organization {uuid: 'org_ninth_cavalry'})
    ON CREATE SET
        o.name = 'Ninth Cavalry',
        o.description = 'The Ninth Cavalry is a Roman military unit, specifically mentioned as being deployed in Britain under the command of Aulus to pursue Caractacus. It represents the Roman military forces actively engaged in subduing the Britannic territories and is used for rapid deployment, reconnaissance, and pursuit operations within the broader Roman strategy to control Britannia.',
        o.sphere_of_influence = 'Roman Military Operations in Britannia'
    ;
MERGE (o:Organization {uuid: 'org_roman_senate'})
    ON CREATE SET
        o.name = 'Roman Senate',
        o.description = 'The Roman Senate is the governing body of Rome, composed of patrician and high-ranking citizens. In this scene, they are mentioned as a political entity that Messalina is potentially inviting to restore the Republic by abandoning Claudius, representing the traditional, though increasingly overshadowed, political power structure of Rome.',
        o.sphere_of_influence = 'Roman Governance'
    ;
MERGE (o:Organization {uuid: 'org_roman_empire'})
    ON CREATE SET
        o.name = 'Roman Empire',
        o.description = 'The Roman Empire is the vast political entity ruled by Emperor Claudius, encompassing diverse regions, cultures, and peoples. It is characterized by military conquest, cultural richness, and complex governance structures, and in this scene, is represented by Claudius, Pallas, Narcissus, and the imperial guards acting to maintain order and suppress threats to imperial authority.',
        o.sphere_of_influence = 'The entire Roman world'
    ;
MERGE (ep:Episode {uuid: 'episode_a_god_in_colchester'})
    ON CREATE SET
        ep.title = 'A God in Colchester',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'The Provocation of Ambition',
        s.description = 'In the modest backstage of the Provincial Theater in Colchester, anticipation hangs thick in the air, a blend of theatrical excitement tinged with underlying tension. The modest architecture, dimly lit with flickering torches, reveals the worn wooden structures and fabric drapes that promise grandeur once the curtain rises. Among the props and costumes, MESSALINA, a strikingly beautiful woman with an aura of restless energy, engages MNESTER, a handsome actor. Their banter flows with playful intimacy yet hints at deeper desires and ambitions. MESSALINA’s probing questions reveal her dissatisfaction with life’s limitations; she feels confined by her role as Empress and longs for something beyond mere pleasure. MNESTER, charming and jesting, teases her about the savage passions of the men in Britain, igniting MESSALINA’s competitive spirit. They delve into a fantastical idea of staging a grand erotic contest, a spectacle that symbolizes MESSALINA’s desire to assert her power and challenge societal norms. The scene encapsulates the heady mix of ambition, flirtation, and the theatricality of Roman life, setting the stage for the tumultuous events to follow as MESSALINA\'s insatiable lust for life and dominance begins to emerge.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_provincial_theater_backstage_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Messalina Engages Mnester',
        e.description = 'MESSALINA initiates an intimate conversation with MNESTER, playfully inquiring about a scratch on his back. As he responds with sarcasm, the dynamic between them shifts, revealing the underlying tension of desire and ambition. MESSALINA challenges his perception of her, asserting her power and expressing her dissatisfaction with her life. Their playful banter quickly escalates into a deeper dialogue about the nature of love and ambition, culminating in MESSALINA’s bold declaration of her capability to take on the whole of Rome. This moment underscores her yearning for more than the confines of her position, foreshadowing her future actions.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Does it hurt?", "Well of course it hurts. Do you think I'm made of wood?", "You can give it here, just for me.", "Oh, my lovers!", "When I make love, I reach for something that men never dream of."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'The Idea of a Contest',
        e.description = 'As their conversation progresses, MNESTER proposes the outrageous idea of staging a grand contest of sexual prowess, pitting MESSALINA against a formidable competitor, the Sicilian courtesan Scylla. Their playful banter transforms into a fierce declaration of MESSALINA\'s superiority, revealing her competitive nature and ambition to assert her dominance in a society that often subjugates women. This exchange becomes a catalyst, symbolizing MESSALINA\'s desire not only for physical pleasure but for power and recognition. MNESTER\'s jesting ignites a spark in MESSALINA, who eagerly accepts the challenge, setting the stage for her audacious ambitions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh, no? What about that Sicilian woman? What's her name? Scylla.", "Do you think I'd win?", "Bring on your Sicilian. And let her look to her laurels."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Calculating the Messalina Problem',
        s.description = 'Backstage at the Provincial Theater in Colchester, amidst the lingering chaos of battle preparations, Claudius\'s trusted advisors, Narcissus and Pallas, convene to assess the aftermath of the British campaign and, more pressingly, the burgeoning scandal surrounding Empress Messalina. The air, thick with the scent of sawdust and paint, buzzes with a tense undercurrent as they discuss troop movements and casualty figures, their pragmatic Roman efficiency sharply contrasting with the unseen theatrical spectacle beyond the curtain. The victory in Britain, though strategically significant, is overshadowed by the advisors\' shared concern about the Empress\'s increasingly erratic behavior and the delicate matter of informing the Emperor upon his imminent return. This scene serves to highlight the political machinations happening in the wings, far from the Emperor\'s awareness, setting the stage for the personal and political turmoil that awaits Claudius back in Rome. The thematic weight of control and the pragmatic, often ruthless, nature of Roman governance hangs heavy in the air.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_provincial_theater_backstage_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Assessing the British Campaign',
        e.description = 'Pallas delivers a concise military report to Narcissus, detailing the Roman victory in Colchester. He coldly enumerates the staggering prisoner count and enemy casualties against the relatively minor Roman losses. The report underscores the brutal efficiency of Roman conquest and the successful suppression of the British rebellion, setting a backdrop of imperial dominance against which personal dramas will unfold.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PALLAS: Well, they've taken 8,000 prisoners and counted nearly 5,000 corpses. Caractacus has left Colchester and fled to the west. Aulus has taken the Ninth Cavalry in pursuit of him.", "NARCISSUS: And our losses?", "PALLAS: Oh, insignificant. 380 killed and 600 wounded. Britain is almost subdued. The Emperor's on his way home."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Shifting Focus to the Empress',
        e.description = 'Narcissus abruptly pivots the conversation from military matters to the far more delicate issue of Empress Messalina. His seemingly casual remark, \'If he\'s on his way home, it solves our problem,\' thinly veils his deep concern about how to manage the fallout from Messalina\'s scandalous conduct now that Claudius is returning. This transition marks the shift in dramatic focus from external conquest to internal palace intrigue, foreshadowing the central conflict of the episode.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["NARCISSUS: Er... If he's on his way home, it solves our problem.", "PALLAS: About Messalina?"]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'The Unresolved Dilemma of Messalina',
        e.description = 'Pallas clarifies that Claudius\'s return merely changes the timing, not the nature of their predicament regarding Messalina. He highlights that the fundamental problem of how to address her behavior with the Emperor remains, whether they act now or upon his arrival. This exchange underscores the advisors\' apprehension and strategic maneuvering, emphasizing their awareness of the precarious situation and their need to carefully navigate Claudius\'s likely reaction to the unfolding scandal.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NARCISSUS: Yes.", "PALLAS: Well, it solves the problem of whether we should write to him. Whether we should tell him when he gets back is another matter.", "NARCISSUS: Then it becomes the same problem we had before he left."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Contest of Ambition',
        s.description = 'The Forum of Colchester buzzes with activity, a vibrant yet chaotic scene filled with citizens, courtiers, and actors weaving tales among stalls and stages. The air is laden with anticipation as Mnester, a bold actor, announces the arrival of Scylla, the esteemed courtesan, who is met by Messalina, the Emperor\'s wife. Their flirtatious banter unfurls amidst the crowd\'s excitement, revealing both their personalities—Messalina\'s regal ambition and Scylla\'s pragmatic wit. The atmosphere is charged with a mix of competition and camaraderie, setting the stage for a contest that embodies not just personal rivalry, but the broader themes of power, reputation, and the complexities of Roman desire. The stakes are raised as they negotiate the terms of their contest, balancing honor with monetary gain, foreshadowing the challenges and tensions that will arise from their encounter.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Mnester Introduces Scylla',
        e.description = 'Amidst the bustling forum, Mnester steps forward, confidently introducing himself as an actor of renown. He then introduces Scylla, the President of the Guild of Prostitutes, to Messalina, highlighting the stakes of their impending contest. This moment not only frames the rivalry but also lays the groundwork for the ensuing power dynamics between the two women.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["My name is Mnester. I am an actor. Most people have heard of me.", "Allow me to introduce you to the Lady MESSALINA. Your challenger, and the Emperor's wife."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Messalina and Scylla\'s Banter',
        e.description = 'As the rivalry begins to unfold, Messalina and Scylla exchange compliments that are laced with competitive undertones. Their playful back-and-forth reveals their characters—Messalina, the ambitious Empress, and Scylla, the pragmatic professional. The dialogue highlights the dynamics of power and reputation in Roman society, setting the stage for their contest.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["They said you were beautiful, but their praise did you small justice.", "The difference between you and me, actor, is you're a snob and I'm not."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Negotiation of Terms',
        e.description = 'The stakes are negotiated as Messalina offers Scylla three gold pieces for her participation in the contest against the backdrop of the crowd\'s anticipation. The transaction turns into a witty exchange that emphasizes both women\'s cunning and ambition. By agreeing to the terms, they solidify the contest as a blend of competitive spirit and economic exchange, crucial for maintaining their statuses.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["You shall have your money. Shall we say...? Three gold pieces a head?", "Win or lose, of course? That seems satisfactory."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Commencement of the Contest',
        e.description = 'With the terms settled, the contest is announced as Mnester proclaims \'Let the Games begin!\' Messalina and Scylla prepare to engage in their rivalry, representing not just personal ambition but the larger themes of power and societal roles within the Roman Empire. The crowd\'s excitement crescendos, reflecting the tension and anticipation that permeates the air.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Let us begin. Which side of the bed do you prefer? Left or right?", "Lady, give me a support for my back, and 'Let the Games begin,' as they say."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Justus Falls into a Trap',
        s.description = 'The anteroom of the Claudian Palace is a space of hushed tension, dimly lit and suggesting clandestine meetings. Quintus Justus paces anxiously, his agitation contrasting sharply with Pallas\'s composed demeanor as he sits, observing. The atmosphere is thick with suspicion and veiled threats as Justus, driven by outrage, reveals his knowledge of Messalina\'s scandalous behavior. However, he unwittingly steps into a trap laid by Pallas, who coolly unveils the dangerous game Justus has stumbled into. The scene crackles with the undercurrent of Roman courtly intrigue, where a moment of confession can swiftly turn into a death sentence, and loyalty is a fragile, transactional commodity. This scene serves to highlight the pervasive danger of Messalina\'s influence and the ruthless pragmatism of Pallas, who prioritizes self-preservation above all, leaving Justus utterly exposed to the Empress\'s wrath. The thematic elements of betrayal and the perilous nature of truth in a corrupt court are starkly illuminated.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudian_palace_anteroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Justus Reports Messalina\'s Debauchery',
        e.description = 'Quintus Justus, visibly distressed, bursts into the anteroom and immediately confronts Pallas. He recounts the scandalous spectacle at the New Palace, detailing Messalina\'s public contest of stamina against a prostitute. Overwhelmed by outrage at this blatant display of imperial impropriety, Justus declares it the \'final straw\' and demands immediate action, urging Pallas to inform Emperor Claudius of Messalina\'s behavior.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["QUINTUS JUSTUS: Do you know what's going on at the new palace at this moment? The Emperor's wife is competing with a prostitute to see who can wear out the most men. Oh, they've been at it since noon!", "QUINTUS JUSTUS: I've had my suspicions what's been going on there for weeks, but this is the final straw. It's outrageous. Now something must be done.", "QUINTUS JUSTUS: That's why I've come to you. I think you must write to the Emperor at once."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Pallas Exposes Justus\'s Blunder',
        e.description = 'Pallas, with chilling composure, subtly probes Justus about his indiscretion, inquiring if he has shared his concerns with anyone else. Justus confesses to confiding in his superior, Colonel Ruffrius. Pallas then reveals the devastating truth: Ruffrius is deeply embedded within Messalina\'s inner circle. Pallas coldly lays bare the dire consequences of Justus\'s naivety, implying that Messalina is already aware of his accusations and has likely requested a warrant for his execution from the Emperor, capitalizing on Claudius\'s distance and vulnerability.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["PALLAS: Have you discussed this with anyone else?", "QUINTUS JUSTUS: Only my immediate superior.", "PALLAS: Colonel RUFFRIUS?", "QUINTUS JUSTUS: Yes.", "PALLAS: Did you not know that your superior Colonel Ruffrius was one of the Lady Messalina's inner circle of friends? If you have confided in him, he has most certainly confided in her. I should think that she's already applied to the Emperor for a warrant for your execution."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Pallas Condemns Justus to Death',
        e.description = 'Justus, now realizing the mortal danger he is in, desperately pleads with Pallas for help and support. He is terrified by the implications of Pallas\'s revelation and begs to be backed up against Messalina\'s inevitable retaliation. However, Pallas firmly refuses to intervene, asserting his intention to act only at his own chosen time and emphasizing his cautious approach to the perilous situation. He coldly dismisses Justus\'s pleas, stating that he is as good as dead and should resign himself to his fate, offering no solace or assistance.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["QUINTUS JUSTUS: My execution? Are you serious? On what grounds?", "PALLAS: Does it matter? Conspiracy. Emperors are very nervous when they're away from their capitols, they'll sign anything. If I'm any judge, that warrant's already on its way back here at this very moment.", "QUINTUS JUSTUS: You mean...? What are we to do? You must help me. You must back me up. You must!", "PALLAS: I will choose my own time when to tell him, not yours or anyone else's. I have learned to tread very carefully in a burning building.", "QUINTUS JUSTUS: What am I to do?", "PALLAS: What can a dead man do? Go and get buried."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'The Contest Concludes',
        s.description = 'The scene unfolds at the Forum of Colchester, where the atmosphere is charged with the remnants of a fierce competition and the echoes of the crowd\'s excitement linger in the air. The forum, a bustling expanse filled with stone structures and market stalls, is now a shadow of its earlier fervor, the crowd thinner and more subdued as the revelry winds down. The sun casts a bright glare on the worn cobblestones, reflecting the exhaustion that hangs over the participants. Mnester, the coin distributor, stands amidst this fading spectacle, counting out the coins for the victor. As he proclaims \'The Queen is dead... Long live the Queen!\', a tense energy sparks back to life as Messalina, furious and insatiable, cries out to reclaim the contest, refusing to let the moment pass without finality. Scylla, sensing her own victory, expresses disbelief at Messalina\'s endurance, framing the scene in a tone of mockery and triumph. This moment captures the themes of ambition and rivalry, showcasing how power is contested even in the wake of declared victory. The scene underscores the narrative\'s exploration of women\'s roles in a patriarchal society, where their worth is often measured by their ability to dominate in contests of strength and ambition.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Mnester Declares Victory',
        e.description = 'In the waning moments of the contest, Mnester stands before the remaining crowd in the Forum of Colchester, counting coins as he announces the outcome, exclaiming, \'The Queen is dead... Long live the Queen!\' This proclamation signals the end of the competition, and the crowd’s attention shifts back to the spectacle now at its conclusion. His tone is filled with revelry, celebrating the victor\'s prowess while also hinting at the tensions that simmer beneath the surface of this chaotic contest.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Ah, then victory hath conceded thee! The Queen is dead... Long live the Queen!"]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Messalina\'s Fury',
        e.description = 'In a sudden burst of anger and defiance, Messalina interrupts the declaration of victory, furious that the contest is being treated as concluded. Her cry, \'Come back, you whore! We\'ve not finished,\' reveals her unwillingness to accept defeat and her desire to reclaim her power. This moment not only highlights her desperation but also the fierce determination that characterizes her character, positioning her as a formidable force in the contest for dominance.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Come back, you whore! We've not finished."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Scylla\'s Mockery',
        e.description = 'Scylla, exhausted yet triumphant, responds to Messalina’s interruption with scorn. She remarks on Messalina’s apparent inhuman endurance, saying, \'She\'s inhuman. Her insides must be made out of old army boots.\' This moment reflects the rivalry between the two women, as Scylla seeks to assert her victory while mocking Messalina\'s persistence. The exchange showcases the competitive nature of the contest and emphasizes the stakes involved for both women in this battle for supremacy.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["She's inhuman. Her insides must be made out of old army boots."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Mnester Settles Payments',
        e.description = 'Mnester, maintaining his role as the mediator in this contest, addresses Scylla as she demands her winnings. He reassures her, saying, \'Here, Lady, here. Three gold pieces per head. Will you take \'em or shall I have \'em sent?\' His calm demeanor amidst the rising tensions reflects the transactional nature of victory in this contest, emphasizing the prize involved and underscoring the stakes of ambition and rivalry in Colchester.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Here, Lady, here. Three gold pieces per head. Will you take 'em or shall I have 'em sent?"]
    ;
MERGE (e:Event {uuid: 'event_5_5'})
    ON CREATE SET
        e.title = 'Scylla Accepts Her Winnings',
        e.description = 'With a clear tone of derision, Scylla dismisses her competitors and accepts her winnings, stating, \'I\'ll take it. Amateurs!\' This final line encapsulates her triumph and serves as a sharp conclusion to the contest, reinforcing the theme of competition and the harsh judgments of those who succeed in the brutal world of Roman ambition.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["I'll take it. Amateurs!"]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Whispers of Treason, Veiled in Domestic Intrigue',
        s.description = 'In the shadowed intimacy of Claudius\'s study, candlelight dances across scrolls and imperial decrees, casting long shadows that mirror the uncertainties plaguing the Emperor. The room, dominated by a large desk and solemn statues of Roman gods, becomes a stage for both statecraft and subtle manipulation. A tense atmosphere pervades as Marsus Vibius delivers grave news of Herod Agrippa\'s potential revolt, stirring Claudius\'s anxieties about betrayal even from trusted allies. This political unease is swiftly juxtaposed with a more insidious domestic drama as Messalina enters, draped in silks, her beauty a calculated weapon. The emotional temperature shifts from political apprehension to a deceptive warmth as Messalina feigns affection while subtly maneuvering Claudius to fulfill her personal vendettas. The scene underscores the thematic tension between public duty and private desires, revealing how personal manipulations can intertwine with matters of state, all under the roof of imperial power.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Report of Herod Agrippa\'s Suspected Treachery',
        e.description = 'Marsus Vibius, Governor of Syria, arrives with alarming news regarding Herod Agrippa. He reveals intelligence suggesting Herod is fortifying Jerusalem and organizing secret meetings with neighboring kings, indicating a potential revolt against Roman rule. Vibius\'s stern demeanor and military attire underscore the gravity of the situation, as he presents evidence of a brewing political crisis that threatens the stability of the empire. Claudius, though troubled by the news, is more preoccupied with understanding Herod\'s motives, revealing his personal attachment clouding his political judgment.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MARSUS VIBIUS: Yes, Caesar. But there's more. Before I left, I learned that he was organizing a secret meeting with certain neighboring kings. He is plotting a revolt against Rome, that is certain.", "CLAUDIUS: But why? Why?"]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Messalina\'s Entrance and Feigned Concern',
        e.description = 'Messalina makes a grand entrance, interrupting the tense political briefing. Draped in fine silks, she immediately draws Claudius\'s attention away from state matters. She feigns concern for Claudius\'s well-being and expresses how much she missed him, skillfully manipulating his emotional vulnerabilities. Her arrival shifts the scene\'s focus from external threats to internal palace dynamics, highlighting her power to distract and control Claudius despite the looming political crisis.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MESSALINA: Am I interrupting?", "CLAUDIUS: No, no, come in. Marsus Vibius was just reporting the very grave situation in J-Jerusalem.", "MESSALINA: Are you worried?", "MESSALINA: I never rested properly a single night thinking about you."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Messalina\'s Calculated Complaint Against Mnester',
        e.description = 'Messalina pivots from feigned affection to a calculated complaint about Mnester. She accuses him of insolence and rudeness during Claudius\'s absence, claiming he disobeyed her wishes regarding theatrical performances. Her seemingly petty grievance serves a deeper purpose: to manipulate Claudius into punishing Mnester, who had refused to facilitate Messalina\'s illicit affair with Gaius Silius. She cleverly frames her request as being in Claudius\'s best interest, appealing to his desire to maintain popular favor, further showcasing her cunning manipulation.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["MESSALINA: I wish you would speak to Mnester. He's got so big-headed lately and insolent. During your absence, he was very rude to me. Always making excuses for not putting on this play or that which my friends wanted to see.", "CLAUDIUS: Well, couldn't you have punished him yourself?", "MESSALINA: I didn't want to do that. Well, he's a great favorite with the crowd and they might have held that against you when you returned."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Blindness and Messalina\'s True Intentions (Voice-Over)',
        e.description = 'In a poignant voice-over, Claudius reveals his utter blindness to Messalina\'s manipulative nature and her burgeoning affair with Gaius Silius. He admits to being her \'slave\' and highlights his foolishness in love. The voice-over explains that Messalina\'s complaint about Mnester was a calculated move to punish him for obstructing her desires, and that Claudius, in his naivety, unwittingly facilitated her affair by agreeing to reprimand Mnester. This narration underscores the tragic irony of Claudius\'s situation and sets the stage for the devastating betrayals to come, emphasizing Messalina\'s cunning and Claudius\'s tragic flaw of misplaced trust.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS (V.O.) I was her slave. Is there anything so foolish as an old man in love?", "CLAUDIUS (V.O.) Like a fool, I secured for her what she most wanted.", "CLAUDIUS (V.O.) She had fallen manically in love with Gaius Silius, the Consul-Elect and the handsomest man in Rome."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'The Weight of Betrayal',
        s.description = 'In the dimly lit Imperial Study, Claudius sits burdened by the weight of impending crises, his brow furrowed in concentration. The room, lined with scrolls and illuminated by flickering candlelight, echoes with the tension of power struggles and unspoken fears. Marsus Vibius stands before him, delivering unsettling news of a potential Messiah, while Pallas, a sharp-eyed advisor, observes from the periphery, keenly aware of the implications. The atmosphere is thick with foreboding as Claudius grapples with the implications of this \'Messiah\' narrative, realizing the threat it poses to his reign. The conversation reveals not only the political landscape of Jerusalem but also Claudius\'s precarious position in Rome. He connects the dots, understanding that King Herod\'s ambitions are entwined with religious fanaticism, potentially inciting rebellion against Roman authority. This scene is pivotal, revealing the external pressures that mirror the treacherous dynamics within his own court, encapsulating the themes of power, betrayal, and the fragility of authority.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Marsus Delivers Dire News',
        e.description = 'Marsus Vibius stands before Claudius, delivering grave news regarding the situation in Jerusalem and the emergence of a supposed Messiah. His words bring forth a sense of urgency and dread, highlighting the political complexities that threaten the stability of the empire. Claudius, intrigued yet apprehensive, probes deeper into the implications of this figure, revealing his naivety and the precariousness of his reign.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["More grave news of the situation in Jerusalem was hurried to me by Marsus from his agent, Catalus.", "Yes, but what exactly is this M-Messiah?"]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'The Significance of Bethlehem',
        e.description = 'In response to Claudius\'s probing questions, Marsus explains the significance of Bethlehem as the birthplace of the anticipated Messiah, providing historical context that further entangles Claudius in the web of political intrigue. The Emperor’s repeated inquiries underscore his fascination yet reveal his struggle to grasp the weight of the implications, illustrating his precarious grip on power as he connects this narrative to King Herod’s ambitions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["B-Bethlehem?", "In w-what year?"]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'The Threat of King Herod',
        e.description = 'As the conversation unfolds, Claudius learns of King Herod’s recent actions against followers of this new cult. This revelation signals a shift in the political landscape, framing Herod not just as an ally but a potential adversary. Claudius\'s realization of Herod\'s intentions to galvanize religious fervor against Rome marks a turning point, emphasizing the dangers that lurk within the empire\'s borders.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Did you find out what King Herod thought of him?", "He has followers then?"]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'Claudius Connects the Dots',
        e.description = 'Claudius connects the historical dots, understanding that Herod’s identity as a \'Messiah\' presents a dire threat to Roman authority. His insights reflect a deepening crisis not just in Jerusalem but within his own grasp on power in Rome. This moment captures the growing tension between the cult’s emergence and Claudius\'s vulnerability, foreshadowing the conflicts yet to come.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["My friend Herod believes himself to be this Messiah.", "If we don't move quickly, Herod will seize the Eastern Empire and we shall lose Egypt."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Tapestry of Treason',
        s.description = 'Sunlight streams into Messalina\'s opulent private suite, highlighting the rich tapestries that adorn the walls – symbols of imperial wealth now being carelessly dismantled. The emotional atmosphere is charged with a growing tension as Domitia observes slaves removing a prized tapestry, a gift from Claudius himself. This scene serves as a stark illustration of Messalina\'s escalating recklessness and blatant disregard for her marriage, her impulsive decision to gift a valuable imperial possession to her lover, Silius, underscores her descent into dangerous territory. The scene embodies the thematic elements of betrayal and the corrupting influence of unchecked desire, foreshadowing the disastrous consequences of Messalina\'s actions as she prioritizes personal whim over imperial duty and discretion. The removal of the tapestry is not merely a physical act but a symbolic stripping away of loyalty and a brazen flaunting of her adulterous affair.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_messalina_private_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Tapestry Taken Down',
        e.description = 'Slaves, under Messalina\'s orders, are in the process of removing a large, ornate tapestry from the wall of her private suite. Domitia enters and observes the unusual activity with growing suspicion, immediately sensing that something is amiss within Messalina\'s reckless behaviour. The sunlight filtering through the sheer curtains illuminates the scene, casting long shadows as the tapestry, a symbol of imperial favour, is taken away.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["DOMITIA: What are you doing with that?", "SLAVE: The mistress told us to take it down, lady."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Domitia Questions the Tapestry\'s Removal',
        e.description = 'Domitia, her sharp eyes fixed on the slaves struggling with the heavy tapestry, directly questions their actions, her tone laced with concern and a hint of premonition. She seeks clarification on the purpose and destination of the tapestry, recognizing its value and significance as a gift from Claudius. Her inquiry immediately establishes the central conflict of the scene: Messalina\'s impulsive and potentially treacherous actions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["DOMITIA: But why? Where are you taking it?"]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Messalina\'s Imperious Entrance and Warning',
        e.description = 'Messalina enters her private suite, her beauty striking and her demeanour imperious. She immediately asserts her authority, focusing on the practicalities of the tapestry\'s removal and threatening the slaves with punishment should it be damaged in transit. Her entrance shifts the scene\'s dynamic, moving from Domitia\'s quiet observation to Messalina\'s forceful presence and careless disregard for consequence. She deflects Domitia\'s underlying concern with a show of superficial control.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["MESSALINA: If there's a mark on it when it arrives, I'll have you whipped."]
    ;
MERGE (e:Event {uuid: 'event_8_4'})
    ON CREATE SET
        e.title = 'Gift for Silius: Confession of Treachery',
        e.description = 'Domitia, undeterred by Messalina\'s distraction, presses her question about the tapestry\'s destination. Messalina, in a moment of shocking candour, reveals her intention to gift the valuable tapestry to Silius. This admission confirms Domitia\'s worst fears and explicitly exposes Messalina\'s reckless behaviour, highlighting the Empress\'s brazen disregard for imperial propriety and her husband\'s honour. The act of gifting such a significant item is a clear escalation of her affair and a dangerous provocation.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["DOMITIA: Where is it going?", "MESSALINA: Hurry up with it! I'm giving it to someone as a present.", "DOMITIA: To SILIUS?", "MESSALINA: Yes. Iris! I want my hair dressed!"]
    ;
MERGE (e:Event {uuid: 'event_8_5'})
    ON CREATE SET
        e.title = 'Domitia Highlights the Marital Betrayal',
        e.description = 'Domitia, aghast at Messalina\'s revelation, directly confronts her niece with the gravity of her actions. She underscores the fact that the tapestry was a gift from Claudius, emphasizing the profound betrayal inherent in Messalina\'s decision to give it to her lover. Domitia\'s words are a stark reminder of Messalina\'s marital vows and the expected decorum of an Empress, highlighting the scandalous nature of her behaviour within the Roman court.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["DOMITIA: But that was a present from your husband."]
    ;
MERGE (e:Event {uuid: 'event_8_6'})
    ON CREATE SET
        e.title = 'Messalina\'s Defiant Justification and Dismissal of Claudius',
        e.description = 'Messalina, far from being contrite, doubles down on her defiance. She acknowledges the tapestry\'s origin but justifies her action by stating Silius\'s admiration for it, framing it as a romantic gesture. She then dismisses the potential repercussions of Claudius discovering the missing tapestry, revealing a startling level of arrogance and contempt for her husband\'s authority. Her flippant dismissal of Claudius\'s potential reaction further emphasizes her reckless abandon and the dangerous path she is treading.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["MESSALINA: I know that. Silius fell in love with it, so I'm giving it to him as a surprise.", "DOMITIA: And if he comes here and finds that it's gone?", "MESSALINA: He doesn't come here. And if he does, I'll tell him I've put it somewhere else."]
    ;
MERGE (e:Event {uuid: 'event_8_7'})
    ON CREATE SET
        e.title = 'Domitia\'s Desperate Plea for Sense',
        e.description = 'Domitia\'s concern escalates into outright alarm. She directly questions Messalina\'s sanity, highlighting the sheer irrationality of her actions. Domitia lists the numerous gifts Messalina has lavished upon Silius, emphasizing that many are from the imperial palace, thus constituting theft and further incriminating her. Domitia\'s urgent questions and desperate tone underscore the extreme danger Messalina is courting and her complete lack of judgment.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["DOMITIA: Have you taken leave of your senses? Have your wits deserted you entirely? You have lavished gifts on that man from all directions... half of them from the palace. Are you so much in love that you have lost all sense of discretion?"]
    ;
MERGE (e:Event {uuid: 'event_8_8'})
    ON CREATE SET
        e.title = 'Messalina\'s Reckless Declaration of Love and Invincibility',
        e.description = 'In response to Domitia\'s desperate plea for reason, Messalina utters a chillingly simple and defiant declaration: \'Yes. I am in love.\' This stark admission reveals the depth of her infatuation and her complete surrender to her passions. She follows this with a dismissive assurance that she will not imperil her life, showcasing a dangerous delusion of invincibility and a profound misunderstanding of the political realities surrounding her actions. Her love is not only adulterous but also blinding her to the very real dangers she faces.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["MESSALINA: Yes. I am in love.", "DOMITIA: Child, you've been in love before but you've never imperiled your life for it.", "MESSALINA: I shan't imperil my life."]
    ;
MERGE (e:Event {uuid: 'event_8_9'})
    ON CREATE SET
        e.title = 'Domitia Warns of Public Scandal',
        e.description = 'Domitia intensifies her warnings, shifting from private concern to the very public nature of Messalina\'s affair. She points out that all of Rome is aware of Messalina\'s open visits to Silius\'s house and her blatant gifting, emphasizing the widespread scandal and the political ramifications of such open indiscretion. She also mentions Silius\'s wife\'s bitter complaints, further highlighting the public knowledge of the affair and the social disruption it is causing.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["DOMITIA: All Rome knows that you visit him openly at his house. And take him gifts. And that his wife complains bitterly about it."]
    ;
MERGE (e:Event {uuid: 'event_8_10'})
    ON CREATE SET
        e.title = 'Silius\' Divorce: A Further Escalation',
        e.description = 'Messalina casually reveals that Silius is divorcing his wife, presenting it as further proof of his devotion and her irresistible allure. This revelation, intended to justify her actions, actually underscores the escalating nature of the scandal and the disruption it is causing within Roman society. Silius\'s divorce for Messalina further cements the public nature of their affair and fuels the growing gossip and disapproval in Rome.',
        e.sequence_within_scene = 10,
        e.key_dialogue = ["MESSALINA: He's divorcing his wife.", "DOMITIA: Divorcing her? For what reason?", "MESSALINA: For no other reason than he loves me."]
    ;
MERGE (e:Event {uuid: 'event_8_11'})
    ON CREATE SET
        e.title = 'Domitia Questions the Legality and Messalina\'s Marriage',
        e.description = 'Domitia probes further into the circumstances of Silius\'s divorce, questioning the validity of his reasons and highlighting the potential legal and social ramifications. She then pivots to the core issue: Messalina\'s own marital status. Domitia\'s questions directly challenge Messalina\'s reckless assumptions and remind her of the insurmountable obstacle of her marriage to Claudius, the Emperor.',
        e.sequence_within_scene = 11,
        e.key_dialogue = ["DOMITIA: Well, he'll have to give a better reason than that.", "MESSALINA: They're not married in the strict form. It only requires a declaration.", "DOMITIA: But you are married! You can't marry him. So why is he divorcing his wife?"]
    ;
MERGE (e:Event {uuid: 'event_8_12'})
    ON CREATE SET
        e.title = 'Jealousy and Obsession: Messalina\'s Raw Confession',
        e.description = 'In a raw and revealing outburst, Messalina finally exposes the driving force behind her reckless behaviour: intense jealousy and possessive obsession. She confesses her inability to bear the thought of Silius sharing another woman\'s bed, revealing the depth of her passionate entanglement and the irrationality fueling her actions. This final declaration underscores the extent to which Messalina is ruled by her desires, utterly disregarding logic, prudence, and the immense risks she is taking. The scene ends with Messalina\'s unveiled emotional turmoil, leaving the audience in no doubt of the impending catastrophe.',
        e.sequence_within_scene = 12,
        e.key_dialogue = ["MESSALINA: Because I can't bear the thought of him sharing that woman's bed every night when he gets out of mine!"]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Claudius\'s Isolation and Despair',
        s.description = 'In the dim light of the Imperial Study, the air hangs heavy with the weight of isolation and unspoken truths. CLAUDIUS, the awkward yet intelligent Emperor in his 50s, sits hunched over a desk cluttered with scrolls, each a reminder of the burdens he carries. The flickering candlelight casts shadows that dance across his furrowed brow, accentuating his weariness and the palpable sense of loneliness that envelops him. He speaks aloud, his voice trembling with desperation, lamenting the bitter laughter echoing through the halls of power, laughter that mocks his authority and naivety. The mention of HEROD underscores not only the treachery he faces from afar but also mirrors his own domestic betrayals, hinting at a broader conspiracy against him. This scene serves as a poignant reflection of Claudius\'s inner turmoil and the tragic disconnect between his aspirations and the reality of his reign, revealing the emotional cost of being an emperor in a sea of betrayal.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Claudius Reflects on His Isolation',
        e.description = 'CLAUDIUS, in a moment of vulnerability, expresses his profound sense of isolation and betrayal. He laments the laughter and scorn directed towards him, revealing his awareness of the whispers and mockery that surround his reign. The mention of HEROD serves as a painful reminder of the treachery both distant and close to home, highlighting his feelings of alienation not only from his court but from the very fabric of Roman society. This reflection deepens the audience\'s understanding of his tragic position as emperor, further isolating him within his own thoughts.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I heard nothing. Not a breath of the scandal that was known to everyone else in Rome. Even the slaves They're laughing at me. Still, after all these years.. still laughing at me. Herod."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'A King\'s Ominous Counsel',
        s.description = 'In the dimly lit Royal Chambers, a warm yet serious atmosphere pervades as a younger Herod Agrippa imparts a crucial lesson to a younger Claudius. The setting, though unspecified, evokes the opulent yet politically fraught environment of a royal court, likely in Jerusalem or Syria, given Herod\'s kingdom. Soft candlelight casts long shadows, emphasizing the intimacy and gravity of the moment. The air is thick with unspoken tensions, hinting at the treacherous nature of power and the ever-present threat of betrayal. This flashback serves as a stark warning, underscoring the central theme of pervasive distrust that permeates Claudius\'s life and reign. It highlights Claudius\'s inherent vulnerability and foreshadows the devastating betrayals he will endure, making Herod\'s advice a chilling prophecy and a key to understanding Claudius\'s tragic trajectory. The scene’s narrative significance lies in its thematic resonance, embedding the core message of distrust deep within the context of Claudius\'s past, shaping our understanding of his present naivety.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_royal_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Herod\'s Chilling Warning',
        e.description = 'In a softly lit chamber, Herod Agrippa, portrayed in his younger, kingly prime, leans in to deliver a stark piece of advice to a younger Claudius.  His tone is serious, almost conspiratorial, as he emphasizes the treacherous nature of their world. Herod\'s words are not just friendly counsel but a chilling prophecy, encapsulating the ruthless political landscape and the necessity for absolute vigilance. This moment serves to highlight the inherent danger of trust in their world and foreshadows the betrayals that will plague Claudius\'s future. The intimacy of the setting and the directness of Herod\'s warning amplify the impact of his message, leaving a lasting impression of impending doom and the lonely burden of leadership.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["HEROD: Trust no one, my friend. No one."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'The Omen of Herod',
        s.description = 'In the dimly lit confines of Claudius\'s study, the atmosphere is thick with tension and foreboding. The heavy oak desk, strewn with scrolls and dispatches, bears the weight of imperial decisions. Claudius, the stuttering Emperor, sits hunched, his eyes reflecting both curiosity and dread, as his advisor Marsus Vibius stands before him, delivering a chilling account of Herod Agrippa\'s demise. The air is charged with the implications of loss and betrayal, mirroring the crumbling stability of Claudius\'s reign. Vibius\'s words paint a vivid picture of Herod’s final moments, where a prophetic owl\'s appearance heralds a tragic fate that resonates ominously within the confines of the study. This scene unfolds as a significant turning point in the narrative, revealing the supernatural elements that intertwine with political machinations. It foreshadows the impending chaos that will ripple through the empire, reinforcing the themes of power, authority, and the fragility of human ambition against the will of the gods.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Marsus Vibius Reports Herod\'s Death',
        e.description = 'Marsus Vibius begins to relay the news of Herod Agrippa\'s death, prompting Claudius’s immediate concern and curiosity. As Vibius recounts the events leading to Herod\'s demise during a public festival, he details the audience’s adoration that turned to horror as an omen manifested in the form of an owl. This revelation not only shocks Claudius but also hints at deeper implications for his own rule and the stability of the empire, as it echoes the themes of prophetic doom that surround rulers in ancient Rome.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Yes, Caesar, dead. Herod Agrippa is dead.", "How? Tell me. Tell me what happened."]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Details of Herod\'s Public Revelation',
        e.description = 'Vibius elaborates on Herod\'s dramatic appearance in the amphitheater, describing the spectacle of his royal robe shimmering in the sun, and the fervent declarations from the audience that treat him as divine. The narrative unfolds with vivid imagery, depicting how Herod\'s hubris leads to his downfall, culminating in a prophetic omen as an owl interrupts the proceedings, symbolizing doom. Claudius\'s incredulity and reflection on the implications of Herod\'s self-proclaimed divinity reveal the precariousness of authority and the dark humor of fate that governs the lives of those in power.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["He was wearing a royal robe of silver tissue that flashed in the sun so brightly that it tired the eyes to look at it.", "An owl? Yes. An owl was always an ill-omen for Herod."]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Herod\'s Final Moments',
        e.description = 'Vibius recounts the horrifying details of Herod\'s final moments as the festival descends into panic and chaos. The audience’s initial reverence turns to despair as Herod collapses, reflecting the fragility of life and power. Claudius is left contemplating the implications of this event, tying it to the broader themes of mortality and the shifting fortunes of rulers. The chilling account of Herod’s rotting body serves as a stark reminder of the inevitable decline that awaits all in positions of power, including himself.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["He groaned. He seemed to feel stabbing pains in his chest, for he cried out, 'I am ill, carry me out!'", "Within five days, he was dead, his body racked with pain and rotted into an unrecognizable mass of sores."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Alone with Ghosts and a Dying Confession',
        s.description = 'In the hushed stillness of his private study, Emperor Claudius finds himself cloaked in solitude, the weight of empire momentarily forgotten.  Flickering candlelight casts long shadows across the room, illuminating the scattered scrolls that speak to his scholarly pursuits, now abandoned in favor of a more pressing grief. The air is heavy with a melancholic quiet, punctuated only by the rustle of parchment as Claudius unfolds a letter bearing the royal seal.  This is not a missive of state, but a final, desperate confession from a dying friend, Herod Agrippa. The letter’s contents plunge Claudius into a vortex of remembrance and self-reproach, forcing him to confront the ghosts of his past and the bitter reality of his present isolation. The scene resonates with themes of betrayal, the fleeting nature of friendship, and the emperor\'s tragic vulnerability, setting the stage for a painful awakening to the treachery festering within his own household. It is a moment of profound introspection before the storm breaks.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Reading Herod\'s Dying Letter',
        e.description = 'Alone in his study, Claudius opens a letter bearing the royal seal, a final message from Herod Agrippa. As he reads, Herod’s voice, rendered as voice-over, fills the somber room, confessing his impending death by a gruesome disease and his betrayal of Claudius, even while professing a twisted form of affection. Herod\'s words are laced with a chilling warning against trust, underscoring the pervasive treachery that surrounds Claudius, even from those closest to him. The letter serves as a stark reminder of the emperor\'s vulnerability and the treacherous nature of power.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["HEROD LETTER (V.O.): Marmoset, I am dying. My body is full of maggots. Forgive me. Forgive your old friend who loved you dearly yet secretly plotted to take the East away from you. I have failed. I played too dangerous a game. Little marmoset you are a fool, but I envy you your folly.. Do not weep for me. My punishment is just. I offended against the only living God. Farewell, my friend, whom I love more truly than you suppose. Farewell, little marmoset, my school fellow... and trust no one. No one. Your dying friend, Herod Agrippa."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Reflecting on Lost Companions and Messalina\'s \'Help\'',
        e.description = 'Visibly moved by Herod’s letter, Claudius sinks into a deep contemplation. He voices his profound sense of isolation, lamenting the deaths of his childhood friends – Germanicus, Postumus, and Castor – now joined by Herod in the realm of ghosts.  In this moment of vulnerability, his thoughts turn to Messalina, the only person seemingly left to him. He acknowledges her past \'help,\' tinged with a bitter irony as he recognizes her manipulation in using his seal.  Despite this dawning awareness, he still clings to the memory of her support. Claudius, in a moment of stark self-awareness, calls himself a \'fool,\' yet paradoxically defends Messalina’s \'cleverness.\' He then shifts to his historical writing, declaring his intent to reveal the truth of his life and promising to unveil how his ignorance of his domestic affairs will soon end, foreshadowing the imminent and devastating revelations about Messalina\'s treachery.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: I was alone. For the first time in my life, I was alone. They were all gone now, those friends of my youth. Germanicus, Postumus, Castor, Herod. All gone. There was no one now I could turn to except Messalina.", "CLAUDIUS: Yes she helped me. How she helped me. She persuaded me to let her use the duplicate of my seal", "CLAUDIUS: Say, \"Fool, Claudius, fool!\" I know it, I know it. But she was clever..", "CLAUDIUS: I also began this most strange history of my life, which you shall read and find, I promise you. But now you shall see how my ignorance of my own domestic affairs came to an end. I said I would tell all and I shall"]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'A Reckless Proposal',
        s.description = 'In the secluded portico of Ostia, shadows entwine with whispers of ambition as Messalina paces restlessly before Gaius Silius. The air is thick with conspiracy and tension, a heavy atmosphere punctuated by their clandestine desires. As Messalina grapples with her emotions, Silius urges her to abandon the pretense of their affair and seize power through marriage. Their dialogue oscillates between yearning and fear, revealing the precarious balance of love and ambition they tread. Messalina\'s initial hesitation gives way to a daring plan: a public wedding that will solidify their union and declare their contempt for Claudius, the oblivious Emperor. The stakes rise as they plot their audacious future, knowing the risks they face. This scene encapsulates the tension between ambition and desire, setting in motion the events that will irrevocably change their lives and the fate of the empire.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_portico_ostia'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Messalina\'s Restlessness',
        e.description = 'In the dim light of the secluded portico, Messalina paces, visibly agitated by her affair with Gaius Silius. Their conversation begins hesitantly as she expresses the weight of their secret love. Silius, radiating ambition, pushes her to consider a divorce from Claudius, urging that their current situation is fraught with danger. This opening moment establishes the tension and ambition that defines their relationship.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Gaius, don't you think that I am tired of waiting too?", "Oh, don't turn your back on me, please."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'The Bold Proposal',
        e.description = 'Silius, growing impatient with their clandestine affair, boldly proposes that Messalina divorce Claudius and marry him. He expresses his deep feelings for her, emphasizing that their current arrangement is untenable. This moment shifts the stakes dramatically, as Silius articulates a vision of rebellion against Claudius, suggesting a public declaration of their love to restore the Republic. Messalina is torn between her desires and the risks involved in such a drastic action.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Wouldn't you rather be my wife than my mistress?", "If we marry, open and publicly, all Rome will see how Claudius is abandoned."]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'The Scheme Solidifies',
        e.description = 'Messalina begins to warm to Silius\'s audacious plan, contemplating the implications of their marriage. They outline the timeline for their wedding, deciding that it should occur while Claudius is away in Ostia. This crucial plot point reveals Messalina\'s willingness to embrace her ambitions and betray Claudius openly. Their dialogue showcases a blend of romantic aspiration and political maneuvering, embodying the themes of desire and treachery.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Tomorrow I go with him to Ostia to examine the new harbor works.", "While he dallies in Ostia, we'll marry in Rome."]
    ;
MERGE (e:Event {uuid: 'event_13_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Ignorance',
        e.description = 'As Messalina and Silius plot their bold wedding, a voiceover from Claudius reveals his oblivion to the treachery unfolding. He narrates his disappointment at Messalina\'s absence due to a headache, highlighting his trust in her and his naive perception of their relationship. This moment underscores the tragic irony of Claudius\'s ignorance, setting the stage for the impending betrayal and emphasizing the emotional stakes involved.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["I trust her with my life!", "By the time I arrived in Ostia they were already married."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'Scandal in Ostia: The Plot Thickens',
        s.description = 'Sunlight streams into Pallas\'s private chambers in Ostia, illuminating rich fabrics and polished surfaces – a veneer of Roman luxury disturbed by the frantic energy of Narcissus. He bursts in upon Pallas, who maintains an outward calm while reviewing documents, but the air crackles with unspoken tension. The scandal of Messalina\'s audacious remarriage hangs heavy between them, a seismic event threatening to shatter the fragile peace of Claudius\'s reign.  Narcissus, his voice tight with panic, lays bare the treacherous political implications of Messalina\'s act, recognizing it not as mere infidelity, but as a calculated declaration of war against the Emperor. Pallas, ever pragmatic, coolly assesses the situation, his mind already racing to formulate a strategy to contain the fallout and protect their own precarious positions. The chamber becomes a crucible of conspiracy as they grapple with the urgent need to inform Claudius while simultaneously neutralizing the Empress, a dangerous game of political maneuvering where one wrong step could spell ruin for them all. The scene hums with the urgency of a crisis rapidly unfolding, the delicate balance of power teetering on a knife\'s edge.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_pallas_chambers_ostia'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Narcissus\'s Alarming Revelation',
        e.description = 'Narcissus explodes into Pallas\'s chambers, his composure shattered. He reveals the shocking news of Messalina\'s public remarriage, emphasizing that this is not just another affair, but a brazen act of defiance that jeopardizes the Emperor\'s life and their own positions. He stresses the unprecedented nature of this scandal, far exceeding Messalina\'s previous infidelities, and its immediate threat to the political order.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["NARCISSUS: Scandalous! It's scandalous! While all of Rome trooped in and out of her bed, we said nothing. We closed our eyes and ears and said nothing. But this is different. This is utterly and unbearably different. This... This puts the Emperor's life in danger. And if it puts his life in danger, it puts ours. And I say that's a very different bowl of fish."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Pallas Assesses the Treason',
        e.description = 'Pallas, despite the urgency of Narcissus\'s outburst, maintains a semblance of calm, demanding clarification on the specifics of Messalina\'s actions. He probes whether Messalina has formally divorced Claudius, recognizing the legal and political ramifications of her actions. He seeks to understand the precise nature of Messalina\'s transgression to formulate a response, highlighting his strategic and analytical approach even in crisis.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["PALLAS: But has she divorced him or not?", "PALLAS: But the Emperor wasn't here to receive it.", "PALLAS: Is the marriage bigamous or not?"]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Political Earthquake: The Republic Gambit',
        e.description = 'Narcissus elaborates on the devastating political implications of Messalina\'s remarriage. He argues that it\'s a deliberate public declaration of contempt for Claudius, signaling to the Senate that the Emperor is unfit to rule and inviting them to seize power. He paints a picture of Messalina and Silius at the head of a restored Republic, emphasizing Messalina\'s ruthless ambition and the Senate\'s potential willingness to exploit the situation, thus framing it as an existential threat to Claudius\'s reign.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NARCISSUS: Well, she's divorced him. She sent a freedman with her declaration here to his chamber.", "NARCISSUS: Well, do you think she didn't know that!", "NARCISSUS: Well, do you think she cares? Don't you see? The marriage is a public declaration that the Emperor's wife has abandoned him as being too old, too corrupt and too stupid any longer to govern Rome. That she has chosen the Consul-Elect as her husband is a clear indication and an invitation to the Senate to restore the Republic. And in view of Messalina's known viciousness when it comes to getting her own way, the Senate will take the hint and put them both at the head of it!"]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Urgent Need for Action and Control',
        e.description = 'Pallas agrees on the urgent need to inform Claudius, but recognizes the Emperor\'s blind faith in Messalina as a major obstacle. He acknowledges the critical time sensitivity of the situation, understanding that Messalina\'s influence over Claudius could undermine their efforts. Narcissus bluntly proposes eliminating Messalina without allowing her to reach Claudius, highlighting their ruthless pragmatism and determination to control the narrative and outcome.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["PALLAS: Well... he must be told. This time he must be told. But how? He won't believe a word said against her. It's the old problem. From the moment we tell him, time is on her side, not ours.", "NARCISSUS: Well, then from the moment we tell him, we must keep her away from him. We must ensure she never sees him. She must be eliminated without a hearing."]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'Calpurnia, the Trusted Messenger',
        e.description = 'Pallas concurs with the necessity of eliminating Messalina but raises the crucial question of *how* to inform Claudius in a way he will believe. They consider who Claudius trusts implicitly. Narcissus proposes Calpurnia, the prostitute, as the unlikely but perfect messenger, someone Claudius trusts and values, suggesting a cunning exploitation of Claudius\'s personal relationships to manipulate him into action against Messalina. This highlights their strategic thinking and willingness to use unconventional methods.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["PALLAS: Yes, well that's taken for granted. But how do we tell him? Whom will he most readily believe?", "NARCISSUS: Uh... There is someone. Someone he trusts utterly who's been his friend for years. The little prostitute, CALPURNIA."]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'The Shattering Revelation',
        s.description = 'In the dimly lit confines of Claudius\'s private study, the atmosphere is thick with tension and vulnerability. Soft shadows dance across the sparse room, where scattered personal letters and confidential notes reflect the Emperor\'s precarious state. Claudius, hunched over a small table, embodies the weight of impending betrayal, while Calpurnia, a nervous courtesan, stands before him, trembling with fear and urgency. The study, an intimate refuge, becomes a crucible for truth as Calpurnia dares to reveal the devastating news of Messalina\'s betrayal—the shocking revelation of her marriage to Gaius Silius, a scandal that threatens to dismantle the very fabric of Claudius\'s reign. As the gravity of her words sinks in, the tension escalates, catalyzing Claudius\'s transformation from oblivious trust to a desperate resolve to reclaim his authority. This scene serves as a pivotal turning point in the narrative, igniting the flames of conflict that will engulf both personal and political realms in tumult.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Calpurnia\'s Terrifying Revelation',
        e.description = 'Calpurnia, trembling with fear, confronts Claudius with an urgent plea that reveals the shocking truth: Messalina has married Gaius Silius. As she kneels before him, the atmosphere thickens with tension and disbelief. Claudius struggles to comprehend the enormity of her claim, insisting on his trust in Messalina. The scene unfolds with Calpurnia’s desperate insistence that everyone in Rome knows of the scandalous wedding, each revelation striking Claudius like a dagger to the heart. This pivotal moment shifts Claudius\'s emotional state from naive trust to incredulous horror, heralding a dramatic turning point in the narrative.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Oh, Caesar! ... I shall tell you because nobody else dare tell you...", "She has just married Gaius Silius and the wedding party is still going on in Rome!", "Are you mad, or wicked or both?", "I trust her with my life."]
    ;
MERGE (e:Event {uuid: 'event_15_2'})
    ON CREATE SET
        e.title = 'The Arrival of Pallas and Narcissus',
        e.description = 'Pallas and Narcissus enter the study just as Calpurnia presses her case, providing a grim validation of her claims. They exchange a knowing look with Calpurnia, underscoring the urgency of the situation. Pallas confirms Calpurnia\'s revelation, and Narcissus further elaborates on the extent of Messalina\'s betrayals, describing her adulteries with vivid imagery. The dynamics shift as Claudius\'s disbelief begins to crack under the weight of their words, pushing him closer to a breaking point. This moment of revelation serves not only as a catalyst for Claudius\'s actions but reinforces the theme of betrayal that pervades the narrative.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["It's true, Caesar. Every word she says is true.", "If you've any doubt about Silius, go to his house. It will seem like home to you."]
    ;
MERGE (e:Event {uuid: 'event_15_3'})
    ON CREATE SET
        e.title = 'Claudius’s Decision to Act',
        e.description = 'As the revelations sink deeper, Claudius grapples with the emotional turmoil of betrayal. Pallas and Narcissus press him to act decisively, urging immediate action against Messalina and Silius to regain his authority. The tension reaches a crescendo as Claudius questions his own power, reflecting on whether he can still hold command over Rome amidst the chaos. This moment marks a critical juncture where Claudius transforms from a victim of betrayal to a man resolved to reclaim his right as Emperor, setting the stage for the ensuing repercussions of his decisions.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["But am I s-still Emperor?", "Arrest them. Hurry back to Rome and arrest them ... all."]
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'The Party Crashes',
        s.description = 'Bathed in the warm Ostian sunlight, Gaius Silius\' villa is alive with the drunken revelry of Messalina and Silius\' wedding feast. Laughter and music fill the air as the Empress, emboldened by wine and a false sense of security, mocks Claudius, picturing him as a distant, impotent threat. The atmosphere is thick with hedonistic abandon, a defiant celebration of their illicit union. Yet, the carefree joy is abruptly shattered as a terrified messenger bursts in, her frantic cries of \'The guards!\' ripping through the merriment. The festive scene instantly transforms into one of chaos and panic as the chilling reality of Claudius\'s swift and decisive retribution descends upon the unsuspecting celebrants. The Emperor, far from being the fool they imagined, has unleashed his wrath, and the party is definitively over.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_silius_villa_ostia'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Mocking the Emperor\'s Cloud',
        e.description = 'Amidst the drunken wedding celebrations, Messalina, in high spirits and leaning on the dancer Mnester, engages in playful mockery of Claudius. Mnester humorously describes a cloud shaped like Claudius, initially approaching Ostia but then comically \'farting\' himself out to sea. This lighthearted exchange underscores Messalina\'s delusional confidence and underestimation of Claudius, portraying him as weak and ineffectual, a laughing stock easily dismissed.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MESSALINA: Mnester?", "MNESER: Yes?", "MESSALINA: What do you see?", "MNESER: I see a cloud in the shape of Claudius, rising over Ostia.", "GAIUS SILIUS: Is he drifting this way?", "MNESER: He was. But he just farted and blew himself out to sea.", "MESSALINA (laughing) Out of the way! Help me up."]
    ;
MERGE (e:Event {uuid: 'event_16_2'})
    ON CREATE SET
        e.title = 'Guards on the Horizon',
        e.description = 'As the drunken revelry continues, Mnester\'s playful cloud-gazing takes a sudden turn. Gazing towards the villa\'s perimeter, he spots a troop of guards approaching. Initially, Gaius Silius, still caught up in the celebratory delusion, assumes they are friendly and instructs Mnester to welcome them with wine. However, Mnester, with growing alarm, points out that the guards\' swords are drawn, signaling a hostile intent and shattering the illusion of safety and triumph.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["GAIUS SILIUS: What do you see Mnester? What do you see now?", "MNESER: I see a troop of guards climbing the hill towards us.", "GAIUS SILIUS: Splendid! Wave them in and give them wine.", "MNESER: I think not, Gaius Silius. Their swords are drawn - every one of them."]
    ;
MERGE (e:Event {uuid: 'event_16_3'})
    ON CREATE SET
        e.title = 'Messenger\'s Dire Warning',
        e.description = 'The festive atmosphere is completely destroyed as a young girl bursts into the villa, her voice filled with terror. She delivers a frantic warning, revealing that the approaching guards are the Emperor\'s forces and that they are coming to arrest everyone. Her words paint a picture of a coordinated imperial crackdown, extending beyond Ostia to Rome itself, signaling the full extent of Claudius\'s furious response and the immediate danger facing Messalina and her cohorts.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["GIRL: The guards! The guards! The guards are coming! The guards are coming to arrest us! The Emperor's in Rome! They're arresting everybody! Run! Run!"]
    ;
MERGE (e:Event {uuid: 'event_16_4'})
    ON CREATE SET
        e.title = 'Celebration to Chaos',
        e.description = 'The messenger\'s terrifying news throws the wedding celebration into utter chaos. The drunken revelry instantly evaporates, replaced by widespread panic and disarray. The laughter and music cease as guests, realizing the gravity of their situation, scramble to escape the villa and the Emperor\'s approaching wrath. The scene transforms from one of decadent abandon to one of frantic flight, highlighting the swift and devastating consequences of Messalina and Silius\'s reckless defiance.',
        e.sequence_within_scene = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'The Reckoning in the Corridor',
        s.description = 'In the chaotic corridors of the palace, guards are seen leading away prisoners, signaling a tide of unrest sweeping through the empire. The atmosphere is thick with tension as Pallas interrogates Geta about the whereabouts of the Emperor, revealing nearly 200 arrests including the Consul-elect Silius. Messalina, descending into desperation, crashes through the crowd, frantically seeking Claudius. Her disheveled appearance starkly contrasts the ordered chaos around her, embodying the turmoil of her spiraling situation. Narcissus blocks her path with palpable contempt, questioning her fidelity and taunting her with a list of her many adulteries. The scene crackles with emotional intensity as family ties are challenged and accusations fly, culminating in a visceral confrontation that encapsulates the fraying bonds of loyalty and love in a world steeped in betrayal.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudian_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Pallas Interrogates Geta',
        e.description = 'Pallas questions Geta about the Emperor\'s whereabouts amidst the chaos of the palace, unveiling the scale of the arrests and the uncertainty surrounding Silius and Messalina. The scene sets a tone of urgency and foreboding.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Where is the Emperor?", "In his study. We've arrested nearly 200 people. Silius was taken in the marketplace. The Lady Messalina has not been found."]
    ;
MERGE (e:Event {uuid: 'event_17_2'})
    ON CREATE SET
        e.title = 'Messalina\'s Desperation',
        e.description = 'Bursting onto the scene, Messalina, disheveled and frantic, demands to see Claudius. Her desperation is palpable as she pushes past the guards, showcasing her determination to confront her husband amidst the chaos.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Where is he? Where is my husband?", "Let me go! Let me go!"]
    ;
MERGE (e:Event {uuid: 'event_17_3'})
    ON CREATE SET
        e.title = 'Narcissus Blocks Messalina',
        e.description = 'Narcissus confronts Messalina, coldly asserting that Claudius does not wish to see her. His contempt for her is evident as he challenges her identity and motherhood, using her infidelities as daggers to wound her pride.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["He doesn't wish to see you.", "Which husband, you whore? Which one?"]
    ;
MERGE (e:Event {uuid: 'event_17_4'})
    ON CREATE SET
        e.title = 'Domitia Defends Messalina',
        e.description = 'Domitia steps forward, indignantly defending Messalina, reminding Narcissus of her royal status. This moment underscores the tension between familial loyalty and the harsh realities of political intrigue within the court.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["How dare you stop her! She is the Emperor's wife and the mother of his children."]
    ;
MERGE (e:Event {uuid: 'event_17_5'})
    ON CREATE SET
        e.title = 'Narcissus Exposes Messalina',
        e.description = 'Narcissus delivers a damning revelation, brandishing a list of Messalina\'s adulteries and questioning her worth as a mother. This accusation further isolates her, deepening the chasm between her and Claudius.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["But is he the father? Who knows whose litter they are?", "Here's a list of your adulteries. Do you want to read it? Hundreds!"]
    ;
MERGE (e:Event {uuid: 'event_17_6'})
    ON CREATE SET
        e.title = 'Messalina\'s Plea',
        e.description = 'In a desperate attempt to reclaim her agency, Messalina futilely cries out for Claudius, seeking to sway the court\'s opinion and reestablish her place as the Emperor\'s wife amidst the chaos surrounding her.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["No! No! Mother! Claudius! Claudius!"]
    ;
MERGE (s:Scene {uuid: 'scene_18'})
    ON CREATE SET
        s.title = 'Temple of the God-Emperor: The Warrant for Messalina\'s End',
        s.description = 'Under the cold, watchful gaze of the moon, the newly erected Temple of Claudius in Colchester stands as a stark monument to Roman ambition in a conquered land. Inside, the atmosphere is thick with unspoken tension as Pallas and Narcissus, Claudius\'s ever-present advisors, await the Emperor. Claudius enters, his face etched with weariness and confusion, a broken man struggling to comprehend the enormity of Messalina\'s betrayal. The temple, intended to glorify Claudius\'s divinity, becomes an unlikely stage for the final, grim act in Messalina\'s tragedy. The night air hangs heavy with the weight of imperial decree and the chilling efficiency of Roman justice, a stark contrast to the supposed sanctity of the temple. This scene serves as the immediate aftermath of Messalina\'s downfall, highlighting Claudius\'s tragic ignorance and the ruthless pragmatism of his advisors as they orchestrate her execution to secure the stability of Rome.',
        s.scene_number = 18
    
    WITH s
    MATCH (l:Location {uuid: 'location_temple_of_claudius_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_18_1'})
    ON CREATE SET
        e.title = 'News of Arrests and Claudius\'s Pained Confusion',
        e.description = 'Pallas breaks the tense silence, informing Claudius that arrests have swept through Colchester, confirming Silius\'s capture and reassuring the Emperor of the guard\'s loyalty. Claudius, however, is consumed by a profound sadness and bewilderment rather than anger. He utters a lament for Messalina, questioning what drove her to such acts, revealing his lingering affection and tragic inability to grasp the depth of her treachery. His words paint a picture of a man emotionally devastated and utterly lost in the face of betrayal, unable to reconcile the woman he loved with the scandalous actions he is now forced to confront.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PALLAS: Arrests have been made all over the city. Silius has been taken. Thank heaven most of the guard proved loyal.", "CLAUDIUS: Poor woman. Whatever made her d-do such things? How unhappy she must have b-been."]
    ;
MERGE (e:Event {uuid: 'event_18_2'})
    ON CREATE SET
        e.title = 'The Charge Sheets and a Call for Rest',
        e.description = 'Pallas, ever the pragmatist, redirects the conversation to the urgent matter of state, presenting Claudius with the charge sheets against Messalina and her co-conspirators. He emphasizes the necessity of Claudius\'s signature, urging him to formalize the accusations and set the wheels of Roman justice in motion. In a thinly veiled attempt to control the situation and perhaps spare Claudius further anguish, Pallas then suggests the weary Emperor should rest, framing it as a necessity for the good of Rome, subtly guiding him away from the immediate horror of his wife\'s fate.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["PALLAS: You must sign these, Caesar. They're the charge sheets. They need your signature urgently. ... Sleep, Caesar, sleep. You need your rest. Save yourself for Rome."]
    ;
MERGE (e:Event {uuid: 'event_18_3'})
    ON CREATE SET
        e.title = 'The Death Warrant is Issued',
        e.description = 'Narcissus, with chilling efficiency, intervenes, cutting through any lingering pretense of mercy or delay. He produces the warrant for Messalina\'s execution and hands it to Geta, the designated executioner. Narcissus’s decisive action underscores the cold, calculated nature of Roman justice and the irreversible momentum of Messalina\'s downfall. The warrant becomes a tangible symbol of her fate, a stark contrast to Claudius\'s earlier expressions of pity and confusion. The scene shifts from Claudius\'s internal turmoil to the brutal mechanics of imperial power, where lives are extinguished with bureaucratic precision.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NARCISSUS: Geta. Here's the warrant for her execution. Hurry."]
    ;
MERGE (e:Event {uuid: 'event_18_4'})
    ON CREATE SET
        e.title = 'A Dagger as a Twisted Mercy',
        e.description = 'Pallas adds a final, chilling instruction, revealing the advisors\' pragmatic and manipulative approach to Claudius\'s fragile state. He directs Geta to offer Messalina a dagger first, suggesting a twisted form of mercy – allowing her to commit suicide. Pallas explains this is to spare Claudius the explicit sight of the execution warrant in the morning, demonstrating their intent to shield the Emperor from the full brutality of his own decree and maintain a carefully constructed illusion of control and compassion, even in the face of stark ruthlessness. This final instruction highlights the advisors\' calculated cruelty and their cynical manipulation of Claudius\'s emotions for their own political ends.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["PALLAS: And, Geta offer her the dagger first.", "NARCISSUS: No.", "PALLAS: If she takes her own life, it will save us having to show him the warrant in the morning."]
    ;
MERGE (s:Scene {uuid: 'scene_19'})
    ON CREATE SET
        s.title = 'Desperation in the Chambers',
        s.description = 'In the dim light of Messalina\'s private chambers, the air thrums with tension as MESSALINA paces back and forth, her anxiety palpable. The room, adorned with opulent fabrics and flickering candles, casts shadows that dance across the walls, mirroring her frantic mental state. DOMITIA stands by, observing with a mixture of pity and disapproval, embodying the weight of family expectations and the moral decay surrounding them. As MESSALINA\'s desperation mounts, she instructs DOMITIA to deliver a message to the palace, clinging to the hope that it will mend the rifts in her family. Her urgency underscores the stakes of her situation, revealing a woman on the edge, grasping at threads of hope in the face of impending doom. DOMITIA\'s reproachful response highlights the internal conflict—a deep familial love contrasting with the moral implications of MESSALINA\'s choices. Outside, the sounds of the palace serve as a reminder of the impending confrontation, heightening the emotional atmosphere. This scene encapsulates the tragic desperation and moral ambiguity that have led MESSALINA to this point, revealing the depths of her character as she strives to reclaim control over her crumbling world.',
        s.scene_number = 19
    
    WITH s
    MATCH (l:Location {uuid: 'location_messalina_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_19_1'})
    ON CREATE SET
        e.title = 'Messalina\'s Frantic Plea',
        e.description = 'In a moment of frantic urgency, MESSALINA insists that DOMITIA take an important message to the palace, believing it will prompt her father to forgive her mother. The desperation in her voice reveals her inner turmoil and the high stakes of her actions. As she urges DOMITIA to hurry, her need for affirmation and familial reconciliation becomes apparent, underscoring her vulnerability and the chaos consuming her life.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Take it to the palace. Tell no one that you have it. Only that you want to see your father. Now hurry. When he reads it, he'll forgive your mother, you'll see. Hurry. Hurry."]
    ;
MERGE (e:Event {uuid: 'event_19_2'})
    ON CREATE SET
        e.title = 'Domitia\'s Disapproval',
        e.description = 'DOMITIA, filled with a mixture of pity and disapproval, questions MESSALINA\'s choices, expressing her concern over the reckless path her cousin has taken. This moment reflects the moral conflict within the familial bond, contrasting MESSALINA\'s fervent ambition with DOMITIA\'s grounded perspective. The tension escalates as MESSALINA lashes out in frustration, demanding action rather than pity, revealing her desperation and the emotional stakes at play.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh, how could you, child? How could you?", "Is that all you can say? Why don't you do something? Why don't you see him on your own?"]
    ;
MERGE (e:Event {uuid: 'event_19_3'})
    ON CREATE SET
        e.title = 'Anticipation and Arrival',
        e.description = 'As the atmosphere thickens with anticipation, MESSALINA hears the sound of knocking, fueling her hope and anxiety. She becomes frantic, convinced that her father is coming to see her, illustrating her desire for resolution and reconciliation amidst the chaos of her life. This moment captures the emotional stakes as MESSALINA shifts from desperation to a flicker of hope, setting the stage for the impending confrontation.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["He's coming. He's coming to see me.", "What do you want?"]
    ;
MERGE (s:Scene {uuid: 'scene_20'})
    ON CREATE SET
        s.title = 'The Death Warrant',
        s.description = 'Confined within the luxurious prison of her private chambers, Empress Messalina confronts the stark reality of her impending execution. The room, once a haven of opulence and intrigue, now feels like a suffocating cage as the grim-faced guard, Geta, stands sentinel at the door, holding her fate in his hands. The emotional atmosphere is thick with dread and disbelief, a stark shift from the intoxicating highs of Messalina\'s recent rebellion. Night hangs heavy outside, amplifying the sense of isolation and finality within the chamber. This scene serves as the brutal climax of Messalina\'s tragic arc, sealing her fate and underscoring the ruthless nature of Roman justice. The thematic elements of betrayal, consequence, and the fragility of power are starkly illuminated as Messalina\'s desperate denial clashes against the unyielding decree of the Emperor, her husband, Claudius. The scene embodies the cold, unforgiving nature of imperial authority and the personal tragedy of ambition spiraling into destruction.',
        s.scene_number = 20
    
    WITH s
    MATCH (l:Location {uuid: 'location_messalina_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_20_1'})
    ON CREATE SET
        e.title = 'The Emperor\'s Decree',
        e.description = 'Geta, a stern Roman guard, stands at the threshold of Messalina\'s chambers, delivering the Emperor\'s final judgment. His presence alone is a chilling intrusion into her private world, and his words are a death knell. He coldly announces that her life is forfeit, stating it is \'Your husband\'s orders,\' leaving no room for doubt about the source of her doom. To emphasize the finality, he presents the warrant bearing Claudius\'s unmistakable signature, a tangible symbol of betrayal from the man she thought she knew, and details the grim procedure of her execution - a perverse mercy of offering a dagger for self-inflicted death before the brutal decapitation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["GETA: Your life, Lady. Your husband's orders."]
    ;
MERGE (e:Event {uuid: 'event_20_2'})
    ON CREATE SET
        e.title = 'Desperate Denial',
        e.description = 'Messalina recoils in visceral denial, her carefully constructed world shattering around her. She refuses to accept the horrifying reality of Claudius\'s betrayal, clinging to the delusion that \'My husband wouldn\'t do that.\' Her words are a desperate plea against the inevitable, a pathetic attempt to rewrite her fate through sheer force of will. The stark terror of decapitation pierces through her denial as she fixates on the gruesome detail – \'Not my head! Not my head!\' – revealing a primal fear eclipsing any semblance of imperial dignity.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MESSALINA: No! He wouldn't do that. My husband wouldn't do...", "MESSALINA: No! No! Not my head! Not my head!", "MESSALINA: Don't let them take my head. No! Oh... No. He wouldn't do that. Not Claudius."]
    ;
MERGE (e:Event {uuid: 'event_20_3'})
    ON CREATE SET
        e.title = 'The Inability to Face Death',
        e.description = 'Domitia, a figure of cold Roman pragmatism, steps forward, urging her niece towards a stoic acceptance of her fate. \'Child, child! Your life is done,\' she declares, her tone devoid of comfort, emphasizing the finality of Messalina\'s situation. Domitia\'s counsel is brutally direct: \'Take the dagger and use it. Use it quickly,\' pushing Messalina to seize a modicum of control in her demise. Yet, Messalina remains paralyzed by fear, her whispered \'I can\'t\' a stark admission of her utter helplessness. The primal terror of decapitation overwhelms her, culminating in a final, choked cry – \'Not my head! Not my...!\' – as the scene abruptly cuts, leaving her fate hanging in the suffocating silence of her chambers, poised between self-destruction and brutal execution.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["GETA: Read it! It has his signature. I'm to offer you the dagger first, if you'll have it. And then to cut off your pretty head and put it on a spear.", "DOMITIA: Child, child! Your life is done. Take the dagger and use it.", "DOMITIA: Use it. Use it quickly.", "MESSALINA: I can't. I can't. No! Not my head! Not my...!"]
    ;
MERGE (s:Scene {uuid: 'scene_21'})
    ON CREATE SET
        s.title = 'The Temple of Broken Promises',
        s.description = 'At dawn, the Temple of Claudius in Colchester stands radiant, its newly erected structure basking in the soft glow of the morning sun. The temple, meant to signify Claudius’s glory and divine status, now feels more like a tomb for hopes long dead. The air is thick with a sense of foreboding as Claudius, still cloaked in the remnants of his naive trust, demands to see his wife. Pallas and Narcissus, cold and calculating, deliver the shattering news of Messalina\'s execution, revealing the stark reality of betrayal that has permeated his life. Their words hang in the air, heavy with the weight of political treachery and personal loss. As they speak, the once-magnificent temple becomes a symbol of Claudius’s shattered illusions, a reflection of his fragile authority now solidified in the cold reality of power dynamics. The conversation shifts to the dispatch from Britain, indicating the political maneuvering surrounding his name, further underscoring the disconnect between Claudius’s perception and the ruthless machinations of those around him.',
        s.scene_number = 21
    
    WITH s
    MATCH (l:Location {uuid: 'location_temple_of_claudius_colchester'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_21_1'})
    ON CREATE SET
        e.title = 'Claudius Demands to See His Wife',
        e.description = 'In the dawning light, Claudius, with a sense of purpose, orders to see Messalina, his wife. He is still wrapped in the belief that their marriage endures despite the turmoil surrounding him. His words echo with hope and a tragic ignorance of the darker realities lurking just beneath the surface.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I'll see my w-wife now."]
    ;
MERGE (e:Event {uuid: 'event_21_2'})
    ON CREATE SET
        e.title = 'Pallas Delivers the Grim News',
        e.description = 'Pallas, with chilling calmness, informs Claudius of Messalina\'s execution, revealing that it was carried out at his own orders. His delivery is devoid of emotion, a stark reminder of the cold realities of power and betrayal that define their world. The revelation strikes Claudius with the weight of betrayal and loss, shattering his illusions of love and fidelity.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["She was executed last night at your orders, Caesar. Here is the warrant."]
    ;
MERGE (e:Event {uuid: 'event_21_3'})
    ON CREATE SET
        e.title = 'Narcissus Confirms Claudius\'s Divine Status',
        e.description = 'Narcissus interjects with a dispatch from Britain, turning the narrative away from personal tragedy to the political machinations at play. He reveals that a temple has been dedicated to Claudius, contrasting the tragedy of his personal life with the cold calculations of imperial politics, emphasizing the conflicting realities of his rule.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["There is a dispatch from Britain, Caesar. The temple that was to have been dedicated to the God Augustus in Colchester has been dedicated instead to you."]
    ;
MERGE (e:Event {uuid: 'event_21_4'})
    ON CREATE SET
        e.title = 'Pallas Explains the Political Significance',
        e.description = 'Pallas elaborates on the political maneuvering behind the temple\'s dedication, framing it as a move that solidifies Claudius\'s authority among the Britons. He emphasizes the political correctness of the decision, suggesting that even in the face of personal loss, Claudius\'s rule is being secured through strategic gestures.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Aulus Plautius writes that Augustus means nothing to the Britons, but they're more than happy to worship you as a god."]
    ;
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (o:Organization {uuid: 'org_roman_empire'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geta'}),
          (o:Organization {uuid: 'org_roman_empire'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_warrant'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scrolls'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dispatches'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_documents'}),
          (a:Agent {uuid: 'agent_pallas'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_desk'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_statues_of_roman_gods'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_senatorial_robes'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_letter_from_marsus_vibius'}),
          (a:Agent {uuid: 'agent_marsus_vibius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_letter_from_antipas'}),
          (a:Agent {uuid: 'agent_antipas'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_play'}),
          (a:Agent {uuid: 'agent_messalina'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bed'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_ornate_tapestry'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_letter_from_herod'}),
          (a:Agent {uuid: 'agent_herod_agrippa'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_royal_seal'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_history_of_my_life_scroll'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_declaration_of_divorce'}),
          (a:Agent {uuid: 'agent_messalina'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_wine'}),
          (a:Agent {uuid: 'agent_gaius_silius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_swords'}),
          (a:Agent {uuid: 'org_roman_empire'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_charge_sheets'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dagger'}),
          (a:Agent {uuid: 'org_roman_empire'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (o:Organization {uuid: 'org_roman_empire'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geta'}),
          (o:Organization {uuid: 'org_roman_empire'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands intimately close to Mnester in the backstage area of the provincial theatre, her attention focused on a scratch on his back, which she playfully admits to inflicting. She maintains a dominant physical presence, moving closer to him even as he attempts to distance himself, underscoring her desire for control and immediate gratification.',
        ap.emotional_state = 'Messalina is a whirlwind of conflicting emotions. Outwardly, she is playful and teasing, almost flirtatious with Mnester, yet beneath the surface simmers a profound boredom and restless energy. Her playful inquiry masks a deeper dissatisfaction with her life and position. There\'s a hint of frustration in her tone as she questions her tolerance of Mnester, revealing a subtle tension between her desire for amusement and a yearning for something more substantial.',
        ap.emotional_tags = ["messalina is a whirlwind of conflicting emotions. outwardly, she is playful", "teasing, almost flirtatious with mnester, yet beneath the surface simmers a profound boredom", "restless energy. her playful inquiry masks a deeper dissatisfaction with her life", "position. there's a hint of frustration in her tone as she questions her tolerance of mnester, revealing a subtle tension between her desire for amusement", "a yearning for something more substantial.", "messalina is a whirlwind of conflicting emotions. outwardly", "she is playful and teasing", "almost flirtatious with mnester", "yet beneath the surface simmers a profound boredom and restless energy. her playful inquiry masks a deeper dissatisfaction with her life and position. there's a hint of frustration in her tone as she questions her tolerance of mnester", "revealing a subtle tension between her desire for amusement and a yearning for something more substantial."],
        ap.active_plans = ["To alleviate her boredom through playful interaction and banter with Mnester.", "To assert her dominance and remind Mnester of his subordinate position, reinforcing her sense of control.", "To explore her own feelings of restlessness and dissatisfaction, pushing boundaries of conventional behavior and thought."],
        ap.beliefs = ["She believes in her own superiority and power, expecting immediate gratification and obedience from those around her.", "She believes her current life is unfulfilling and lacks excitement, leading to a constant search for stimulation and novelty.", "She believes men are fundamentally predictable and easily manipulated, viewing them as tools for her amusement or ambition."],
        ap.goals = ["Short-term: To be entertained and amused by Mnester in the immediate moment, distracting herself from boredom.", "Medium-term: To understand and define the elusive 'something more' she seeks in life, even if it remains just out of reach.", "Ultimate: To break free from the perceived constraints of her imperial role and experience a life of greater intensity and significance, potentially through dramatic and unconventional actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Mnester initially reacts to Messalina\'s inquiry with sarcasm and a touch of theatrical exaggeration, highlighting the scratch on his back and the supposed impact on his performance. He attempts to maintain a playful distance, both physically and verbally, from Messalina\'s dominating presence, using humor and wit as defense mechanisms against her unpredictable moods and demands.',
        ap.emotional_state = 'Mnester presents a facade of lightheartedness and amusement, engaging in witty banter with Messalina and using sarcasm to deflect her intensity. Internally, he is likely navigating a complex mix of emotions: awareness of Messalina\'s power, a degree of genuine amusement at her antics, and perhaps a subtle undercurrent of caution or self-preservation. He seems to tread carefully, balancing playful insolence with a clear understanding of the boundaries he cannot cross.',
        ap.emotional_tags = ["mnester presents a facade of lightheartedness", "amusement, engaging in witty banter with messalina", "using sarcasm to deflect her intensity. internally, he is likely navigating a complex mix of emotions: awareness of messalina's power, a degree of genuine amusement at her antics,", "perhaps a subtle undercurrent of caution or self-preservation. he seems to tread carefully, balancing playful insolence with a clear understanding of the boundaries he cannot cross.", "mnester presents a facade of lightheartedness and amusement", "engaging in witty banter with messalina and using sarcasm to deflect her intensity. internally", "he is likely navigating a complex mix of emotions: awareness of messalina's power", "a degree of genuine amusement at her antics", "and perhaps a subtle undercurrent of caution or self-preservation. he seems to tread carefully", "balancing playful insolence with a clear understanding of the boundaries he cannot cross."],
        ap.active_plans = ["To deflect Messalina's potential anger or boredom through humor and playful sarcasm, maintaining a light and entertaining dynamic.", "To subtly assert his own identity and worth beyond being merely an object of Messalina's amusement, reminding her of his profession and talent.", "To gauge Messalina's mood and intentions, attempting to anticipate her desires and avoid crossing her, while also pushing the boundaries of their dynamic for his own amusement."],
        ap.beliefs = ["He believes in the power of humor and wit as a means of social navigation and self-defense, especially in the face of powerful figures like Messalina.", "He believes Messalina is fundamentally bored and driven by a need for constant stimulation, recognizing this as both a vulnerability and an opportunity for him.", "He believes in his own value as an actor and entertainer, finding a degree of confidence in his ability to amuse and engage even the Empress."],
        ap.goals = ["Short-term: To entertain Messalina and maintain her favor, ensuring his continued presence in her circle and avoiding her displeasure.", "Medium-term: To leverage his relationship with Messalina to his advantage, potentially for career advancement or social standing within her sphere of influence.", "Ultimate: To survive and thrive within the volatile and dangerous world of the Roman court, using his wit and charm as tools for self-preservation and advancement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands with a commanding presence, her striking beauty accentuated by her restless energy. She positions herself close to Mnester, leaning slightly as she engages him in playful banter. Her gestures are animated, showcasing her vivaciousness as she banters about his \'injury\' with a teasing smile, and she displays a mix of childlike curiosity and fierce confidence when discussing her abilities.',
        ap.emotional_state = 'On the surface, Messalina radiates playful confidence, her tone flirtatious and engaging as she challenges Mnester. However, beneath this facade lies simmering ambition and a deep-seated frustration with her constrained role. Her competitive spirit flares, revealing a desire for recognition and dominance in a patriarchal society, which she masks with humor and charm.',
        ap.emotional_tags = ["on the surface, messalina radiates playful confidence, her tone flirtatious", "engaging as she challenges mnester. however, beneath this facade lies simmering ambition", "a deep-seated frustration with her constrained role. her competitive spirit flares, revealing a desire for recognition", "dominance in a patriarchal society, which she masks with humor", "charm.", "on the surface", "messalina radiates playful confidence", "her tone flirtatious and engaging as she challenges mnester. however", "beneath this facade lies simmering ambition and a deep-seated frustration with her constrained role. her competitive spirit flares", "revealing a desire for recognition and dominance in a patriarchal society", "which she masks with humor and charm."],
        ap.active_plans = ["To assert her dominance and prowess as a woman in a male-dominated arena.", "To entertain and distract herself from the tedium of her life as Empress.", "To ignite a sense of challenge and excitement by accepting a competition against Scylla."],
        ap.beliefs = ["Women are underestimated and must assert their power through cunning and ambition.", "Physical pleasure is intertwined with a deeper desire for recognition and authority.", "Her beauty and charm can be wielded as powerful tools to manipulate those around her."],
        ap.goals = ["Short-term: To engage in playful banter and assert her uniqueness in a conversation.", "Medium-term: To hone a competitive edge by accepting the challenge against Scylla.", "Ultimate: To redefine her identity beyond that of an Empress, becoming a symbol of female empowerment and desire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Mnester stands casually, exuding confidence as he engages in a lively exchange with Messalina. He is relaxed yet alert, using expressive hand gestures to emphasize his points. His body language suggests a playful defiance, and he skillfully navigates the teasing atmosphere while maintaining an air of charm, ready to return to the stage.',
        ap.emotional_state = 'Mnester displays a mix of playful arrogance and genuine admiration for Messalina\'s spirit. He relishes the banter, masking any underlying anxiety with humor. Internally, he senses the dangerous game they are playing, yet he remains unafraid, focusing instead on the thrill of their interaction and the prospect of the challenge he suggests.',
        ap.emotional_tags = ["mnester displays a mix of playful arrogance", "genuine admiration for messalina's spirit. he relishes the banter, masking any underlying anxiety with humor. internally, he senses the dangerous game they are playing, yet he remains unafraid, focusing instead on the thrill of their interaction", "the prospect of the challenge he suggests.", "mnester displays a mix of playful arrogance and genuine admiration for messalina's spirit. he relishes the banter", "masking any underlying anxiety with humor. internally", "he senses the dangerous game they are playing", "yet he remains unafraid", "focusing instead on the thrill of their interaction and the prospect of the challenge he suggests."],
        ap.active_plans = ["To maintain his role as the witty provocateur, engaging Messalina in flirtatious banter.", "To encourage Messalina to embrace her competitive side, fueling her ambition.", "To entertain the idea of staging a grand contest, thereby asserting his influence within the context of their playful exchange."],
        ap.beliefs = ["The world of theater offers a unique lens through which to explore passion and ambition.", "Women, especially powerful ones like Messalina, thrive when challenged, and competition can elevate their status.", "Humor and charm can diffuse tension and create deeper connections, even in the face of ambitious pursuits."],
        ap.goals = ["Short-term: To engage Messalina in light-hearted conversation that showcases his charm.", "Medium-term: To playfully propose a competition that could enhance both their standings.", "Ultimate: To establish a deeper bond with Messalina through shared ambition and creativity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Pallas stands in the backstage area of the provincial theater, delivering a crisp and chilling military report to Narcissus. He is composed, his posture erect, and his gaze direct as he recounts the brutal statistics of the Roman victory in Colchester. His gestures are minimal, economical, focused solely on conveying the information with precision and gravity, emphasizing the stark figures of prisoners and casualties.',
        ap.emotional_state = 'Pallas maintains a veneer of professional detachment, his voice measured and devoid of overt emotion as he details the grim realities of battle. Beneath this surface of cold efficiency, however, there is a subtle undercurrent of satisfaction at the successful suppression of the British rebellion. He is likely also calculating the political ramifications of this victory and how it will impact the delicate situation with Messalina back in Rome. His pragmatism masks any deeper emotional response to the human cost of the campaign.',
        ap.emotional_tags = ["pallas maintains a veneer of professional detachment, his voice measured", "devoid of overt emotion as he details the grim realities of battle. beneath this surface of cold efficiency, however, there is a subtle undercurrent of satisfaction at the successful suppression of the british rebellion. he is likely also calculating the political ramifications of this victory", "how it will impact the delicate situation with messalina back in rome. his pragmatism masks any deeper emotional response to the human cost of the campaign.", "pallas maintains a veneer of professional detachment", "his voice measured and devoid of overt emotion as he details the grim realities of battle. beneath this surface of cold efficiency", "however", "there is a subtle undercurrent of satisfaction at the successful suppression of the british rebellion. he is likely also calculating the political ramifications of this victory and how it will impact the delicate situation with messalina back in rome. his pragmatism masks any deeper emotional response to the human cost of the campaign."],
        ap.active_plans = ["To inform Narcissus of the military outcome in Colchester, providing a factual basis for their subsequent discussions.", "To assess the political implications of the Roman victory, particularly regarding its impact on Claudius's authority and the Messalina affair.", "To strategize with Narcissus about the next steps concerning Messalina, now that Claudius's return is imminent and the British situation is seemingly under control."],
        ap.beliefs = ["Military success is the foundation of Roman power and stability.", "Emotional considerations should be secondary to pragmatic political calculations.", "Order and control are paramount, and any threats to the established imperial authority must be dealt with decisively."],
        ap.goals = ["Short-term: To ensure Narcissus is fully informed about the military situation.", "Medium-term: To effectively manage the political fallout from Messalina's actions and maintain stability upon Claudius's return.", "Ultimate: To solidify his own position of influence within Claudius's court and ensure the continued strength and order of the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus listens intently to Pallas\'s report, his body language still and focused. He stands in the backstage area, his expression serious and contemplative as he absorbs the details of the battle. He exchanges serious glances with Pallas, indicating a shared understanding of the gravity of the situation and the implications of the military news for their current predicament regarding Messalina. His attention is entirely fixed on the information being delivered.',
        ap.emotional_state = 'Narcissus displays a characteristically controlled demeanor, revealing little outwardly as he processes the military report.  Internally, he is undoubtedly relieved by the Roman victory and the suppression of the rebellion, yet simultaneously concerned about the looming \'problem\' of Messalina now that Claudius is returning.  His pragmatism and focus on order likely temper any strong emotional reaction; he is primarily concerned with strategic implications and maintaining control over the unfolding events, viewing emotions as secondary to effective action.',
        ap.emotional_tags = ["narcissus displays a characteristically controlled demeanor, revealing little outwardly as he processes the military report.  internally, he is undoubtedly relieved by the roman victory", "the suppression of the rebellion, yet simultaneously concerned about the looming 'problem' of messalina now that claudius is returning.  his pragmatism", "focus on order likely temper any strong emotional reaction; he is primarily concerned with strategic implications", "maintaining control over the unfolding events, viewing emotions as secondary to effective action.", "narcissus displays a characteristically controlled demeanor", "revealing little outwardly as he processes the military report.  internally", "he is undoubtedly relieved by the roman victory and the suppression of the rebellion", "yet simultaneously concerned about the looming 'problem' of messalina now that claudius is returning.  his pragmatism and focus on order likely temper any strong emotional reaction; he is primarily concerned with strategic implications and maintaining control over the unfolding events", "viewing emotions as secondary to effective action.", "narcissus displays a characteristically controlled demeanor, revealing little outwardly as he processes the military report.  internally, he is undoubtedly relieved by the roman victory and the suppression of the rebellion, yet simultaneously concerned about the looming 'problem' of messalina now that claudius is returning.  his pragmatism and focus on order likely temper any strong emotional reaction", "he is primarily concerned with strategic implications and maintaining control over the unfolding events, viewing emotions as secondary to effective action."],
        ap.active_plans = ["To fully understand the details of the military victory in Colchester and its broader implications for Roman control in Britain.", "To assess how the successful military campaign might affect the political climate in Rome, particularly in relation to Messalina's scandalous behaviour.", "To collaborate with Pallas on a strategy to address the 'Messalina problem' before Claudius's return, ensuring minimal disruption and maximum control over the narrative."],
        ap.beliefs = ["Maintaining order and stability within the Roman Empire is his primary responsibility.", "Messalina's actions are a significant threat to imperial order and must be neutralized.", "Decisive action and pragmatic solutions are essential for effective governance, even if they are morally ambiguous."],
        ap.goals = ["Short-term: To gather all necessary information about the Colchester victory and its immediate aftermath.", "Medium-term: To resolve the 'Messalina problem' swiftly and efficiently, preventing further scandal and political instability.", "Ultimate: To safeguard Claudius's reign and ensure the continued dominance of the Roman Empire, securing his own influential position within it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands with a composed demeanor, arms crossed, with a calculating gaze directed towards Pallas. His posture is relaxed yet alert, indicative of his mental acuity as he navigates the conversation with ease. He subtly shifts the topic, revealing his strategic mindset as he contemplates the implications of Claudius\'s return.',
        ap.emotional_state = 'Narcissus exhibits a facade of calm, but underneath, he grapples with anxiety about Messalina\'s situation. His voice carries an air of nonchalance, masking a keen awareness of the precariousness of their political landscape. He feels a mix of confidence and concern, acknowledging the necessity of managing the fallout from the Empress\'s actions.',
        ap.emotional_tags = ["narcissus exhibits a facade of calm, but underneath, he grapples with anxiety about messalina's situation. his voice carries an air of nonchalance, masking a keen awareness of the precariousness of their political landscape. he feels a mix of confidence", "concern, acknowledging the necessity of managing the fallout from the empress's actions.", "narcissus exhibits a facade of calm", "but underneath", "he grapples with anxiety about messalina's situation. his voice carries an air of nonchalance", "masking a keen awareness of the precariousness of their political landscape. he feels a mix of confidence and concern", "acknowledging the necessity of managing the fallout from the empress's actions.", "narcissus exhibits a facade of calm,", "underneath, he grapples with anxiety about messalina's situation. his voice carries an air of nonchalance, masking a keen awareness of the precariousness of their political landscape. he feels a mix of confidence and concern, acknowledging the necessity of managing the fallout from the empress's actions."],
        ap.active_plans = ["To discuss the ramifications of Claudius's imminent return and strategize their response regarding Messalina.", "To maintain control over the narrative surrounding Messalina's actions to protect their positions.", "To ensure that Claudius remains oblivious to the full extent of the scandal until they can manage it."],
        ap.beliefs = ["Power must be maintained through calculated manipulation and control.", "The loyalty of the Emperor is conditional and should be preserved at all costs.", "Reputation and stability of the empire are paramount, even at the cost of personal relationships."],
        ap.goals = ["Short-term: Navigate the immediate political crisis concerning Messalina without alarming Claudius.", "Medium-term: Position himself as the key advisor protecting Claudius's reign against threats.", "Ultimate: Ensure his continued influence and power within the court of Rome amid rising tensions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands beside Narcissus, arms at his sides, exuding an air of quiet readiness. His body language reflects a blend of concern and calculated detachment as he contemplates the implications of their conversation. He leans slightly forward, signaling his engagement in the matter at hand while maintaining an aura of control.',
        ap.emotional_state = 'Pallas displays a composed yet tense exterior, indicating an internal conflict about the situation involving Messalina. His surface calm belies the urgency of the political turmoil they face. He is acutely aware of the stakes and feels compelled to balance his ambitions with the immediate need for action in response to Claudius\'s return.',
        ap.emotional_tags = ["pallas displays a composed yet tense exterior, indicating an internal conflict about the situation involving messalina. his surface calm belies the urgency of the political turmoil they face. he is acutely aware of the stakes", "feels compelled to balance his ambitions with the immediate need for action in response to claudius's return.", "pallas displays a composed yet tense exterior", "indicating an internal conflict about the situation involving messalina. his surface calm belies the urgency of the political turmoil they face. he is acutely aware of the stakes and feels compelled to balance his ambitions with the immediate need for action in response to claudius's return."],
        ap.active_plans = ["To assess how they will inform Claudius of Messalina's situation upon his return.", "To strategize whether to take preemptive action against Messalina's influence before Claudius arrives.", "To maintain his own standing and power in the court while navigating the scandal."],
        ap.beliefs = ["Maintaining political stability requires a balance between truth and manipulation.", "Ambition must be tempered with caution, especially regarding powerful figures like the Emperor.", "The wellbeing of the Emperor should be prioritized to secure their positions and influence."],
        ap.goals = ["Short-term: Ensure a solid plan for addressing Messalina's actions before Claudius's return.", "Medium-term: Leverage the situation surrounding Messalina to strengthen his own political position.", "Ultimate: Establish a firm grip on the power dynamics within the court to safeguard his future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Pallas stands in the dimly lit backstage area of the provincial theater, his posture composed and professional. He delivers a concise report to Narcissus, detailing Roman military victories in Britannia, reeling off casualty figures and strategic updates regarding Caractacus\'s retreat. His movements are minimal, focused entirely on the exchange of vital information, his presence radiating an air of controlled efficiency even amidst the theatrical chaos surrounding them.',
        ap.emotional_state = 'Pallas maintains a veneer of detached professionalism, his surface emotions masked by the gravity of the situation.  Beneath this composed exterior, he is likely wrestling with the precariousness of their position regarding Messalina.  His pragmatic mind is focused on strategic solutions, yet there is an undercurrent of apprehension about Claudius\'s unpredictable reaction. He is emotionally invested in maintaining order and control, but acutely aware of the volatile human element, especially concerning the Emperor\'s affections.',
        ap.emotional_tags = ["pallas maintains a veneer of detached professionalism, his surface emotions masked by the gravity of the situation.  beneath this composed exterior, he is likely wrestling with the precariousness of their position regarding messalina.  his pragmatic mind is focused on strategic solutions, yet there is an undercurrent of apprehension about claudius's unpredictable reaction. he is emotionally invested in maintaining order", "control, but acutely aware of the volatile human element, especially concerning the emperor's affections.", "pallas maintains a veneer of detached professionalism", "his surface emotions masked by the gravity of the situation.  beneath this composed exterior", "he is likely wrestling with the precariousness of their position regarding messalina.  his pragmatic mind is focused on strategic solutions", "yet there is an undercurrent of apprehension about claudius's unpredictable reaction. he is emotionally invested in maintaining order and control", "but acutely aware of the volatile human element", "especially concerning the emperor's affections.", "pallas maintains a veneer of detached professionalism, his surface emotions masked by the gravity of the situation.  beneath this composed exterior, he is likely wrestling with the precariousness of their position regarding messalina.  his pragmatic mind is focused on strategic solutions, yet there is an undercurrent of apprehension about claudius's unpredictable reaction. he is emotionally invested in maintaining order and control,", "acutely aware of the volatile human element, especially concerning the emperor's affections."],
        ap.active_plans = ["To inform Narcissus about the current military situation in Britannia and the successful suppression of the rebellion.", "To assess the immediate implications of Claudius's imminent return to Rome on their strategy for dealing with Messalina's scandalous behaviour.", "To collaboratively refine their approach with Narcissus, considering whether to confront Claudius immediately upon his arrival or delay the revelation of Messalina's actions."],
        ap.beliefs = ["The stability of the Roman Empire is paramount, demanding swift and decisive action against any threats, internal or external.", "Messalina's scandalous behavior is a significant threat to Claudius's authority and the overall stability of the Empire.", "Claudius, while Emperor, is emotionally vulnerable and susceptible to manipulation, requiring a carefully orchestrated approach when dealing with sensitive matters concerning his personal life."],
        ap.goals = ["Short-term: To fully brief Narcissus on the relevant military updates from Britannia.", "Medium-term: To formulate a strategy to inform Claudius about Messalina's treachery in a controlled and impactful manner.", "Ultimate: To safeguard the stability of the Roman Empire and maintain his position of influence by effectively managing the crisis caused by Messalina's actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands attentively in the backstage clutter, his body language still and focused, his gaze fixed on Pallas as he absorbs the military update. He listens intently, his mind already processing the strategic and political ramifications of Claudius\'s impending return. His physical presence is understated yet commanding, reflecting his focused and pragmatic approach to the unfolding crisis.',
        ap.emotional_state = 'Narcissus projects an aura of cold, calculating efficiency, his surface emotions carefully controlled.  Internally, he is likely experiencing a mixture of concern and impatience. He is deeply troubled by the \'Messalina problem\' and recognizes the urgency of addressing it before Claudius returns and potentially complicates matters.  His underlying motivation is maintaining order and control, and he is likely frustrated by the unpredictable element Messalina introduces into his meticulously managed world.',
        ap.emotional_tags = ["narcissus projects an aura of cold, calculating efficiency, his surface emotions carefully controlled.  internally, he is likely experiencing a mixture of concern", "impatience. he is deeply troubled by the 'messalina problem'", "recognizes the urgency of addressing it before claudius returns", "potentially complicates matters.  his underlying motivation is maintaining order", "control,", "he is likely frustrated by the unpredictable element messalina introduces into his meticulously managed world.", "narcissus projects an aura of cold", "calculating efficiency", "his surface emotions carefully controlled.  internally", "he is likely experiencing a mixture of concern and impatience. he is deeply troubled by the 'messalina problem' and recognizes the urgency of addressing it before claudius returns and potentially complicates matters.  his underlying motivation is maintaining order and control", "and he is likely frustrated by the unpredictable element messalina introduces into his meticulously managed world."],
        ap.active_plans = ["To fully understand the details of the military situation in Britain as presented by Pallas.", "To analyze how Claudius's return changes the dynamics of their dilemma regarding Messalina and the timing of their intervention.", "To collaborate with Pallas in reassessing their strategy for informing Claudius and ensuring a swift and decisive resolution to the Messalina scandal."],
        ap.beliefs = ["Unwavering order and absolute control are essential for the proper functioning of the Roman Empire and the maintenance of his own power within it.", "Messalina's scandalous actions are a direct and unacceptable threat to Claudius's authority and the stability of the Roman state.", "Swift, decisive action, even if unpleasant, is always preferable to prolonged indecision when dealing with threats to imperial order."],
        ap.goals = ["Short-term: To fully grasp the implications of Claudius's return in relation to the immediate problem of Messalina's behavior.", "Medium-term: To develop a definitive plan with Pallas to inform Claudius about Messalina's actions in a way that ensures Claudius acts decisively and minimizes any political fallout.", "Ultimate: To eliminate the threat posed by Messalina to the stability of Claudius's reign and to reinforce his own position as a key advisor, indispensable for maintaining order and control within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Mnester steps forward confidently, positioning himself at the forefront of the gathering. He gestures grandly as he introduces himself as a renowned actor, his demeanor bold and self-assured, commanding the attention of the crowd with his theatrical flair.',
        ap.emotional_state = 'Mnester exudes a vibrant blend of pride and amusement. Surface-level, he displays confidence, relishing the chance to showcase his charm. Internally, he harbors a keen awareness of the precariousness of the social dynamics at play, recognizing the potential fallout from the rivalry he is about to ignite.',
        ap.emotional_tags = ["mnester exudes a vibrant blend of pride", "amusement. surface-level, he displays confidence, relishing the chance to showcase his charm. internally, he harbors a keen awareness of the precariousness of the social dynamics at play, recognizing the potential fallout from the rivalry he is about to ignite.", "mnester exudes a vibrant blend of pride and amusement. surface-level", "he displays confidence", "relishing the chance to showcase his charm. internally", "he harbors a keen awareness of the precariousness of the social dynamics at play", "recognizing the potential fallout from the rivalry he is about to ignite."],
        ap.active_plans = ["To introduce Scylla as a formidable rival to Messalina, heightening the stakes of the contest.", "To maintain his own social standing and reputation as a charming and witty actor amongst the elite.", "To ensure the contest garners maximum entertainment value, boosting his own visibility and relevance."],
        ap.beliefs = ["He believes in the power of performance and spectacle to capture attention and sway public opinion.", "He holds a conviction that reputation and honor are closely tied to one's ability to entertain and engage.", "He perceives the political landscape as a stage where ambition and rivalry are part of the entertainment."],
        ap.goals = ["Short-term: To facilitate the introduction of Scylla to Messalina, setting the stage for the contest.", "Medium-term: To leverage the ensuing rivalry to enhance his own status within the forum.", "Ultimate: To establish himself as a key figure in the social fabric of Colchester, renowned for his role in entertaining and shaping events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Scylla confidently steps forth, asserting her presence with a bold introduction. She engages directly with Messalina, showcasing her self-assuredness and defiance, as she challenges the expectations placed upon her as a courtesan.',
        ap.emotional_state = 'Scylla radiates a mix of pride and pragmatism. Outwardly, she displays confidence and wit in her exchanges, while inwardly she balances ambition with a shrewd understanding of her worth and the stakes involved in the contest against Messalina.',
        ap.emotional_tags = ["scylla radiates a mix of pride", "pragmatism. outwardly, she displays confidence", "wit in her exchanges, while inwardly she balances ambition with a shrewd understanding of her worth", "the stakes involved in the contest against messalina.", "scylla radiates a mix of pride and pragmatism. outwardly", "she displays confidence and wit in her exchanges", "while inwardly she balances ambition with a shrewd understanding of her worth and the stakes involved in the contest against messalina.", "scylla radiates a mix of pride and pragmatism. outwardly, she displays confidence and wit in her exchanges,", "inwardly she balances ambition with a shrewd understanding of her worth and the stakes involved in the contest against messalina."],
        ap.active_plans = ["To assert her assertiveness and challenge Messalina's status, positioning herself as an equal in the contest.", "To negotiate favorable terms for participation, ensuring she secures payment for her involvement.", "To maintain her reputation in the Guild of Prostitutes while potentially elevating her status through this public competition."],
        ap.beliefs = ["She believes in the power of negotiation and understands the value of her position within society.", "Scylla is convinced that her professional identity as a courtesan can be leveraged to challenge societal norms and hierarchies.", "She perceives personal value not only in financial compensation but also in the honor and visibility brought by such contests."],
        ap.goals = ["Short-term: To enter the contest with clear terms that reflect her worth and assert her power.", "Medium-term: To enhance her standing within the Guild and the broader community through her participation.", "Ultimate: To redefine her reputation and influence, challenging the traditional perceptions of courtesans in society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Messalina strides confidently into the forum, her beauty and authority commanding attention. She engages in a witty back-and-forth with Scylla, positioning herself as both a competitor and a figure of power, despite the precariousness of her situation.',
        ap.emotional_state = 'Messalina\'s outward demeanor is confident and regal, masking an undercurrent of anxiety as she navigates the challenge posed by Scylla. Internally, she grapples with the implications of her actions, aware that her boldness comes with risks that could threaten her status.',
        ap.emotional_tags = ["messalina's outward demeanor is confident", "regal, masking an undercurrent of anxiety as she navigates the challenge posed by scylla. internally, she grapples with the implications of her actions, aware that her boldness comes with risks that could threaten her status.", "messalina's outward demeanor is confident and regal", "masking an undercurrent of anxiety as she navigates the challenge posed by scylla. internally", "she grapples with the implications of her actions", "aware that her boldness comes with risks that could threaten her status."],
        ap.active_plans = ["To demonstrate her superiority in the upcoming contest, reinforcing her status as Empress.", "To ensure that she maintains control over the narrative surrounding her rivalry with Scylla.", "To secure the financial terms of the contest, showcasing her willingness to engage with the common aspects of her role."],
        ap.beliefs = ["She believes that her beauty and status as Empress grant her an inherent advantage over others.", "Messalina holds a conviction that bold actions, even reckless ones, are necessary to maintain her power and influence.", "She perceives the contest as a vehicle not only for personal entertainment but also for asserting her dominance in a male-dominated society."],
        ap.goals = ["Short-term: To successfully initiate the contest with Scylla and show her prowess.", "Medium-term: To divert attention from her other, more dangerous indiscretions by focusing on this public display.", "Ultimate: To reinforce her power within the court and solidify her legacy as both a ruler and an icon of defiance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands regally in the bustling forum of Colchester, a playful smile gracing her lips as she engages with Scylla. She leans slightly forward, attentive and poised, her body language radiating confidence and imperial amusement. Her gestures are light and theatrical, perfectly befitting the public spectacle she is orchestrating, ensuring all eyes are on her as she sets the stage for the contest.',
        ap.emotional_state = 'On the surface, Messalina exudes playful condescension and amusement, enjoying the verbal sparring and the attention it draws. Beneath this facade, a competitive fire burns, fueled by her ambition and desire to assert dominance. There\'s a subtle undercurrent of arrogance, a belief in her inherent superiority, as she engages with Scylla, whom she views as socially beneath her, even while feigning camaraderie. Her amusement is edged with a need to control the narrative and ensure her victory in every domain, be it social or physical.',
        ap.emotional_tags = ["on the surface, messalina exudes playful condescension", "amusement, enjoying the verbal sparring", "the attention it draws. beneath this facade, a competitive fire burns, fueled by her ambition", "desire to assert dominance. there's a subtle undercurrent of arrogance, a belief in her inherent superiority, as she engages with scylla, whom she views as socially beneath her, even while feigning camaraderie. her amusement is edged with a need to control the narrative", "ensure her victory in every domain, be it social or physical.", "on the surface", "messalina exudes playful condescension and amusement", "enjoying the verbal sparring and the attention it draws. beneath this facade", "a competitive fire burns", "fueled by her ambition and desire to assert dominance. there's a subtle undercurrent of arrogance", "a belief in her inherent superiority", "as she engages with scylla", "whom she views as socially beneath her", "even while feigning camaraderie. her amusement is edged with a need to control the narrative and ensure her victory in every domain", "be it social or physical.", "on the surface, messalina exudes playful condescension and amusement, enjoying the verbal sparring and the attention it draws. beneath this facade, a competitive fire burns, fueled by her ambition and desire to assert dominance. there's a subtle undercurrent of arrogance, a belief in her inherent superiority, as she engages with scylla, whom she views as socially beneath her, even", "feigning camaraderie. her amusement is edged with a need to control the narrative and ensure her victory in every domain, be it social or physical."],
        ap.active_plans = ["To establish verbal dominance over Scylla in this initial encounter.", "To assess Scylla's personality and competitive spirit before the actual contest.", "To maintain her public image as a witty, powerful, and effortlessly superior Empress."],
        ap.beliefs = ["Her imperial status inherently places her above commoners in all aspects.", "Public perception and maintaining a dazzling image are essential for wielding power.", "She is naturally more talented and charismatic than those of lower social standing."],
        ap.goals = ["short_term\": \"To win the verbal joust with Scylla and establish her as the dominant figure.", "medium_term\": \"To triumph decisively in the physical contest against Scylla, proving her superiority in all arenas.", "ultimate\": \"To reinforce her image as an indomitable and captivating Empress, solidifying her power and influence within Rome and beyond."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Scylla enters the forum with a pragmatic stride, directly addressing Messalina and Mnester with an unvarnished honesty that cuts through courtly pretenses. She stands her ground amidst the grandeur, her posture confident and self-assured, betraying no intimidation by the Empress\'s presence. Her movements are economical and purposeful, every gesture underscoring her professional demeanor and sharp wit.',
        ap.emotional_state = 'Scylla displays a confident pragmatism, her outward demeanor calm and collected, even amused by the theatricality of Messalina and Mnester. Internally, she is sizing up the situation with a professional detachment, viewing this encounter as a business transaction rather than a social game. There\'s a hint of wry amusement at the \'snobbish\' posturing of the actor and the Empress, contrasting their lofty airs with her own grounded, transactional view of the world. She is focused on securing her compensation and upholding her reputation, remaining unfazed by the social dynamics at play.',
        ap.emotional_tags = ["scylla displays a confident pragmatism, her outward demeanor calm", "collected, even amused by the theatricality of messalina", "mnester. internally, she is sizing up the situation with a professional detachment, viewing this encounter as a business transaction rather than a social game. there's a hint of wry amusement at the 'snobbish' posturing of the actor", "the empress, contrasting their lofty airs with her own grounded, transactional view of the world. she is focused on securing her compensation", "upholding her reputation, remaining unfazed by the social dynamics at play.", "scylla displays a confident pragmatism", "her outward demeanor calm and collected", "even amused by the theatricality of messalina and mnester. internally", "she is sizing up the situation with a professional detachment", "viewing this encounter as a business transaction rather than a social game. there's a hint of wry amusement at the 'snobbish' posturing of the actor and the empress", "contrasting their lofty airs with her own grounded", "transactional view of the world. she is focused on securing her compensation and upholding her reputation", "remaining unfazed by the social dynamics at play."],
        ap.active_plans = ["To secure a lucrative payment for participating in the contest.", "To clearly establish her professional identity and differentiate herself from the perceived snobbery of the Roman elite.", "To evaluate Messalina's true motivations and approach to the challenge, gauging the level of genuine competition versus mere aristocratic whim."],
        ap.beliefs = ["Professional services deserve fair compensation, regardless of the client's social standing.", "Directness and honesty are more valuable than social graces in business dealings.", "Skill and expertise are the true measures of worth, transcending social hierarchies and titles."],
        ap.goals = ["short_term\": \"To negotiate and finalize a favorable payment agreement with Messalina.", "medium_term\": \"To perform professionally in the contest, upholding her reputation and Guild's standing.", "ultimate\": \"To maintain her successful and respected business within Rome, ensuring her continued professional and financial stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently at the forum, her posture exuding authority as she engages in a verbal duel with Scylla. She gestures gracefully while negotiating terms, her presence commanding attention amidst the bustling crowd. Her tone is playful yet strategic, showcasing her cunning as she offers gold to entice the courtesan into the contest.',
        ap.emotional_state = 'Outwardly, Messalina displays confidence and charm, her smile warm as she engages with Scylla. Internally, she grapples with a mixture of ambition and a need to assert her dominance in a public spectacle. There is an undercurrent of competitive tension as she seeks to maintain her status against another formidable woman, revealing her desire to outmaneuver Scylla.',
        ap.emotional_tags = ["outwardly, messalina displays confidence", "charm, her smile warm as she engages with scylla. internally, she grapples with a mixture of ambition", "a need to assert her dominance in a public spectacle. there is an undercurrent of competitive tension as she seeks to maintain her status against another formidable woman, revealing her desire to outmaneuver scylla.", "outwardly", "messalina displays confidence and charm", "her smile warm as she engages with scylla. internally", "she grapples with a mixture of ambition and a need to assert her dominance in a public spectacle. there is an undercurrent of competitive tension as she seeks to maintain her status against another formidable woman", "revealing her desire to outmaneuver scylla."],
        ap.active_plans = ["To secure Scylla's participation in the contest, ensuring the event gains legitimacy and spectacle.", "To demonstrate her power and influence as the Empress in front of the citizens and courtiers.", "To negotiate terms that not only benefit her but also elevate her status and reputation in a public setting."],
        ap.beliefs = ["Her beauty and wit can manipulate situations to her advantage.", "Public perception is crucial to maintaining her status and power.", "Competition among women enhances her allure and reinforces her strength as a leader."],
        ap.goals = ["Short-term: Convince Scylla to participate in the contest.", "Medium-term: Increase her standing within the court and among the citizens of Colchester.", "Ultimate: Reinforce her authority as Empress by successfully orchestrating a celebrated contest, showcasing her power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Scylla stands assertively before Messalina, her demeanor confident and unapologetic. She makes sharp, witty remarks, negotiating the terms of the contest with a blend of humor and practicality. Her posture is relaxed yet poised, reflecting her familiarity with the dynamics of power and reputation in her profession.',
        ap.emotional_state = 'Scylla radiates self-assuredness, her expression a mixture of amusement and challenge as she faces Messalina. Beneath her playful exterior, there is a shrewd awareness of her own worth and the stakes of the contest. She exhibits a blend of pride in her profession and a desire to assert her value, revealing a tension between competitiveness and the need for economic practicality.',
        ap.emotional_tags = ["scylla radiates self-assuredness, her expression a mixture of amusement", "challenge as she faces messalina. beneath her playful exterior, there is a shrewd awareness of her own worth", "the stakes of the contest. she exhibits a blend of pride in her profession", "a desire to assert her value, revealing a tension between competitiveness", "the need for economic practicality.", "scylla radiates self-assuredness", "her expression a mixture of amusement and challenge as she faces messalina. beneath her playful exterior", "there is a shrewd awareness of her own worth and the stakes of the contest. she exhibits a blend of pride in her profession and a desire to assert her value", "revealing a tension between competitiveness and the need for economic practicality."],
        ap.active_plans = ["To negotiate a favorable payment for her participation, asserting her value as a professional.", "To maintain her reputation and status within her guild and the broader community.", "To engage playfully with Messalina while keeping the contest professional and economically viable."],
        ap.beliefs = ["Her profession deserves respect and compensation, unlike mere hobbies.", "Power dynamics in Rome dictate that charm and wit are essential for survival.", "Competitive spirit can coexist with economic savvy in the pursuit of success."],
        ap.goals = ["Short-term: Secure a profitable payment for her participation in the contest.", "Medium-term: Reinforce her status as a leading figure in the Guild of Prostitutes.", "Ultimate: Navigate the contest successfully, ensuring her reputation and economic stability are upheld."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Messalina stands poised to begin the contest, her gaze fixed on Scylla with a mixture of anticipation and veiled challenge. She has just verbally agreed to Scylla\'s financial demands, demonstrating her imperial largesse and desire to proceed without further delay. A subtle shift in her posture reveals a readiness to engage, both physically and competitively, in the spectacle she has orchestrated.',
        ap.emotional_state = 'Beneath a veneer of regal composure, Messalina is charged with competitive excitement and a desire to assert her dominance. Outwardly, she maintains a playful, almost gracious demeanor, masking a deeper need to prove her superiority over Scylla. There is a palpable tension between her aristocratic facade and the raw, ambitious drive fueling her participation in this scandalous public contest. She feels a thrill at pushing boundaries and showcasing her audacity.',
        ap.emotional_tags = ["beneath a veneer of regal composure, messalina is charged with competitive excitement", "a desire to assert her dominance. outwardly, she maintains a playful, almost gracious demeanor, masking a deeper need to prove her superiority over scylla. there is a palpable tension between her aristocratic facade", "the raw, ambitious drive fueling her participation in this scandalous public contest. she feels a thrill at pushing boundaries", "showcasing her audacity.", "beneath a veneer of regal composure", "messalina is charged with competitive excitement and a desire to assert her dominance. outwardly", "she maintains a playful", "almost gracious demeanor", "masking a deeper need to prove her superiority over scylla. there is a palpable tension between her aristocratic facade and the raw", "ambitious drive fueling her participation in this scandalous public contest. she feels a thrill at pushing boundaries and showcasing her audacity."],
        ap.active_plans = ["To immediately commence the contest of stamina against Scylla.", "To publicly display her physical prowess and beauty, outshining Scylla in front of the Colchester crowd.", "To maintain an air of imperial amusement and control throughout the contest, reinforcing her status despite the scandalous nature of the event."],
        ap.beliefs = ["Her imperial status grants her inherent superiority over commoners and even renowned courtesans.", "Public displays of power and extravagance are essential to maintaining her image and influence.", "She is naturally more talented and capable than other women, especially in areas of pleasure and endurance."],
        ap.goals = ["short_term\": \"To decisively win the contest against Scylla and humiliate her.", "medium_term\": \"To solidify her reputation as a woman of unparalleled beauty, stamina, and daring, further enhancing her allure and power within Roman society.", "ultimate\": \"To maintain her position as Empress and wield unchecked influence over Rome and Claudius, indulging her desires without consequence and reinforcing her legendary status."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Scylla stands ready to begin the contest, having secured her financial terms and engaging directly with Messalina\'s challenge. She maintains a composed and professional posture, unfazed by the Empress\'s grandeur or Mnester\'s snobbery. Her physical stance suggests a readiness to perform her profession, grounded and pragmatic, focused on the task at hand.',
        ap.emotional_state = 'Scylla projects an air of calm professionalism, her primary emotion being pragmatic amusement at the spectacle unfolding. Beneath the surface, there\'s a quiet confidence in her abilities and a shrewd understanding of the situation\'s transactional nature. She is likely amused by Messalina\'s need to engage in such a public display, seeing it as a testament to the Empress\'s insecurities rather than genuine sport. There is a hint of detached irony in her demeanor, contrasting sharply with Messalina\'s passionate intensity.',
        ap.emotional_tags = ["scylla projects an air of calm professionalism, her primary emotion being pragmatic amusement at the spectacle unfolding. beneath the surface, there's a quiet confidence in her abilities", "a shrewd understanding of the situation's transactional nature. she is likely amused by messalina's need to engage in such a public display, seeing it as a testament to the empress's insecurities rather than genuine sport. there is a hint of detached irony in her demeanor, contrasting sharply with messalina's passionate intensity.", "scylla projects an air of calm professionalism", "her primary emotion being pragmatic amusement at the spectacle unfolding. beneath the surface", "there's a quiet confidence in her abilities and a shrewd understanding of the situation's transactional nature. she is likely amused by messalina's need to engage in such a public display", "seeing it as a testament to the empress's insecurities rather than genuine sport. there is a hint of detached irony in her demeanor", "contrasting sharply with messalina's passionate intensity."],
        ap.active_plans = ["To immediately start the contest and execute her professional skills to the best of her ability.", "To ensure she receives the agreed-upon payment of three gold pieces a head, viewing this as a purely business transaction.", "To uphold her professional reputation for stamina and skill, demonstrating her worth regardless of the context or company."],
        ap.beliefs = ["Professionalism and financial compensation are paramount in her line of work, transcending social status or 'honor'.", "Directness and honesty are more valuable than social pretense or snobbery.", "Her skills and experience as a courtesan make her a worthy competitor, even against an Empress engaging in this as a 'hobby'."],
        ap.goals = ["short_term\": \"To participate in the contest, perform well, and secure her agreed payment from Messalina.", "medium_term\": \"To maintain her reputation as a skilled and sought-after courtesan, ensuring continued business and financial stability.", "ultimate\": \"To achieve long-term financial security and professional respect within her chosen profession, navigating the complexities of Roman society with pragmatism and shrewdness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Mnester steps forward with theatrical flourish, announcing \'Let the Games begin!\' His posture is bold and self-assured, relishing his role as the master of ceremonies for this scandalous spectacle. He positions himself between Messalina and Scylla, acting as the presenter and commentator for the unfolding contest, fully embracing the dramatic moment.',
        ap.emotional_state = 'Mnester is brimming with excitement and self-importance, thoroughly enjoying the limelight and his part in this sensational event. He feels a sense of superiority over Scylla, viewing himself as more refined and socially elevated, yet he is also entertained by her sharp wit and pragmatism. There is a performative delight in his outward demeanor, relishing the drama and gossip the contest will generate. He is energized by the spectacle and his ability to command attention.',
        ap.emotional_tags = ["mnester is brimming with excitement", "self-importance, thoroughly enjoying the limelight", "his part in this sensational event. he feels a sense of superiority over scylla, viewing himself as more refined", "socially elevated, yet he is also entertained by her sharp wit", "pragmatism. there is a performative delight in his outward demeanor, relishing the drama", "gossip the contest will generate. he is energized by the spectacle", "his ability to command attention.", "mnester is brimming with excitement and self-importance", "thoroughly enjoying the limelight and his part in this sensational event. he feels a sense of superiority over scylla", "viewing himself as more refined and socially elevated", "yet he is also entertained by her sharp wit and pragmatism. there is a performative delight in his outward demeanor", "relishing the drama and gossip the contest will generate. he is energized by the spectacle and his ability to command attention."],
        ap.active_plans = ["To dramatically announce and oversee the commencement of the contest, enhancing the theatricality of the event.", "To entertain the crowd with witty commentary and pronouncements throughout the contest, maintaining his role as a performer.", "To solidify his connection with Messalina and her circle by participating in and amplifying this scandalous public event."],
        ap.beliefs = ["Social hierarchy dictates that actors are of a higher status than courtesans, despite Scylla's professional success.", "Spectacle and entertainment are crucial aspects of Roman life, and he, as an actor, is central to providing them.", "His charm and wit are valuable assets that elevate his social standing and influence within Roman society."],
        ap.goals = ["short_term\": \"To successfully launch the contest and provide entertaining commentary, captivating the audience and Messalina.", "medium_term\": \"To further his reputation as a charismatic and sought-after actor, increasing his popularity and opportunities within the Roman theater scene.", "ultimate\": \"To achieve lasting fame and social recognition in Rome through his theatrical talents and connections, securing a comfortable and prestigious position within the city's elite circles."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warrant_event_4_2'})
    ON CREATE SET
        oi.description = 'The warrant is not physically present but is invoked by Pallas as a chilling hypothetical threat. Pallas strategically mentions the \'warrant for your execution\' as a consequence Messalina could easily procure from the Emperor, who is distant and vulnerable to manipulation. The warrant, though unseen, becomes a potent instrument of psychological manipulation, used by Pallas to instill terror in Justus and underscore the deadly seriousness of his situation. It represents the Emperor\'s absolute authority and the swift, merciless justice that can be dispensed on mere suspicion.',
        oi.status_before = 'The warrant is non-existent prior to Pallas\'s mention. It exists only as a potential, abstract threat, a tool within Pallas\'s manipulative strategy. It is an unwritten, unconceived document, residing solely in the realm of possibility.',
        oi.status_after = 'The warrant remains hypothetical and unwritten after the event. However, its conceptual presence has had a profound effect on Justus. It has effectively silenced and terrified him, rendering him compliant and reinforcing Pallas\'s control. The *idea* of the warrant becomes more powerful than an actual document might be, achieving Pallas\'s objective of intimidation and control without material existence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warrant'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Quintus Justus paces anxiously in the anteroom, his body tense and agitated, eyes wide with urgency as he confronts Pallas. His movements reflect a tumult of emotion as he breathlessly recounts the scandalous behavior of Messalina, emphasizing his distress with emphatic gestures.',
        ap.emotional_state = 'Justus is overwhelmed with outrage, his surface emotions betraying his inner turmoil. He feels a mix of indignation and fear, driven by a sense of moral duty to expose the imperial impropriety. Beneath his outrage lies a desperate anxiety about the implications for his own safety, as he realizes the precarious nature of his position.',
        ap.emotional_tags = ["justus is overwhelmed with outrage, his surface emotions betraying his inner turmoil. he feels a mix of indignation", "fear, driven by a sense of moral duty to expose the imperial impropriety. beneath his outrage lies a desperate anxiety about the implications for his own safety, as he realizes the precarious nature of his position.", "justus is overwhelmed with outrage", "his surface emotions betraying his inner turmoil. he feels a mix of indignation and fear", "driven by a sense of moral duty to expose the imperial impropriety. beneath his outrage lies a desperate anxiety about the implications for his own safety", "as he realizes the precarious nature of his position."],
        ap.active_plans = ["To inform Pallas of Messalina's scandalous actions in hopes of immediate intervention.", "To persuade Pallas to write to the Emperor about the debauchery, emphasizing the urgency of the situation.", "To rally support from Pallas, seeking an ally in confronting Messalina's excesses."],
        ap.beliefs = ["That loyalty to the Emperor necessitates taking action against Messalina's behavior.", "That transparency and truth are paramount in preserving the integrity of Rome.", "That the court's moral standards should be upheld even if it places him at risk."],
        ap.goals = ["Short-term: To expose Messalina's actions to prevent further scandal.", "Medium-term: To protect his own position and avoid retaliation from Messalina's allies.", "Ultimate: To restore moral order within the imperial court and safeguard Claudius's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated, composed amidst Justus\'s frantic pacing. He listens intently, exhibiting a calm demeanor that contrasts with Justus\'s agitation. His posture reflects confidence and control, even as the situation spirals, maintaining an air of nonchalance as he weighs Justus\'s revelations.',
        ap.emotional_state = 'Pallas exhibits a facade of calm, but beneath it lies the cold calculation of a man who comprehends the stakes involved. He is mildly amused by Justus\'s naiveté, yet his internal tension stems from recognizing the dangerous implications of Messalina\'s actions and the potential fallout it could bring.',
        ap.emotional_tags = ["pallas exhibits a facade of calm, but beneath it lies the cold calculation of a man who comprehends the stakes involved. he is mildly amused by justus's naivet\u00e9, yet his internal tension stems from recognizing the dangerous implications of messalina's actions", "the potential fallout it could bring.", "pallas exhibits a facade of calm", "but beneath it lies the cold calculation of a man who comprehends the stakes involved. he is mildly amused by justus's naivet\u00e9", "yet his internal tension stems from recognizing the dangerous implications of messalina's actions and the potential fallout it could bring.", "pallas exhibits a facade of calm,", "beneath it lies the cold calculation of a man who comprehends the stakes involved. he is mildly amused by justus's naivet\u00e9, yet his internal tension stems from recognizing the dangerous implications of messalina's actions and the potential fallout it could bring."],
        ap.active_plans = ["To assess the gravity of Justus\u2019s claims and determine the best course of action.", "To control the narrative surrounding Messalina's behavior by choosing the timing and method of informing Claudius.", "To preserve his own position while evaluating the fallout from exposing Messalina."],
        ap.beliefs = ["That careful manipulation is essential in maneuvering through the treacherous political landscape.", "That the Emperor must be shielded from the chaos until it can be controlled.", "That loyalty is conditional and must be preserved for personal gain within the court."],
        ap.goals = ["Short-term: To maintain composure and control over the situation presented by Justus.", "Medium-term: To navigate the impending crisis with strategic finesse and protect his interests.", "Ultimate: To solidify his influence in the court by managing the fallout of Messalina's actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Quintus Justus paces restlessly in the anteroom, his agitation evident in his hurried movements and anxious demeanor. He is the active participant in the dialogue, initiating the conversation with Pallas and divulging sensitive information regarding his concerns about Messalina\'s scandalous conduct. He stands before Pallas, seeking validation and urgent action.',
        ap.emotional_state = 'Justus is in a state of considerable anxiety and moral outrage, visibly shocked and scandalized by Messalina\'s behaviour. Beneath this surface indignation, fear is beginning to take root as Pallas unveils the precariousness of his position. He is torn between his initial righteous anger and a dawning terror for his own safety, realizing the immense personal risk he has undertaken by speaking out against the Empress, driven by a naive sense of duty.',
        ap.emotional_tags = ["justus is in a state of considerable anxiety", "moral outrage, visibly shocked", "scandalized by messalina's behaviour. beneath this surface indignation, fear is beginning to take root as pallas unveils the precariousness of his position. he is torn between his initial righteous anger", "a dawning terror for his own safety, realizing the immense personal risk he has undertaken by speaking out against the empress, driven by a naive sense of duty.", "justus is in a state of considerable anxiety and moral outrage", "visibly shocked and scandalized by messalina's behaviour. beneath this surface indignation", "fear is beginning to take root as pallas unveils the precariousness of his position. he is torn between his initial righteous anger and a dawning terror for his own safety", "realizing the immense personal risk he has undertaken by speaking out against the empress", "driven by a naive sense of duty."],
        ap.active_plans = ["To convey the gravity of Messalina's scandalous behavior to a figure of authority within the court.", "To convince Pallas to take immediate action, ideally by writing to Emperor Claudius about Messalina's depravity.", "To secure Pallas's support and protection, believing Pallas to be a powerful ally against potential repercussions."],
        ap.beliefs = ["Moral outrage at the Empress's behavior necessitates immediate reporting to higher authorities.", "Upright conduct demands speaking out against blatant immorality, regardless of personal risk.", "Pallas, as a respected advisor, will recognize the seriousness of the situation and offer assistance."],
        ap.goals = ["short_term\": \"To elicit a decisive response from Pallas, compelling him to intervene swiftly.", "medium_term\": \"To expose Messalina's scandalous actions and ensure she faces consequences for her behavior, upholding moral standards within the court.", "ultimate\": \"To preserve the integrity of the Roman court and protect the Emperor's honor, driven by a sense of loyalty and civic duty, though naively executed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated and composed, a picture of icy control amidst Justus\'s escalating panic. He observes Justus with a calculating gaze, deliberately drawing out information and subtly probing the extent of Justus\'s blunder. He maintains a posture of calm authority, listening intently while strategically maneuvering the conversation to his advantage.',
        ap.emotional_state = 'Pallas projects an outward demeanor of detached composure and almost bored amusement, masking his internal calculations. Beneath this facade, he is likely assessing the situation with cold pragmatism, recognizing the potential chaos and opportunity presented by Justus\'s indiscretion. While he may feel contempt for Justus\'s naivety, his primary emotion is strategic calculation, devoid of genuine empathy or moral outrage, focused solely on maintaining control and exploiting the situation.',
        ap.emotional_tags = ["pallas projects an outward demeanor of detached composure", "almost bored amusement, masking his internal calculations. beneath this facade, he is likely assessing the situation with cold pragmatism, recognizing the potential chaos", "opportunity presented by justus's indiscretion. while he may feel contempt for justus's naivety, his primary emotion is strategic calculation, devoid of genuine empathy or moral outrage, focused solely on maintaining control", "exploiting the situation.", "pallas projects an outward demeanor of detached composure and almost bored amusement", "masking his internal calculations. beneath this facade", "he is likely assessing the situation with cold pragmatism", "recognizing the potential chaos and opportunity presented by justus's indiscretion. while he may feel contempt for justus's naivety", "his primary emotion is strategic calculation", "devoid of genuine empathy or moral outrage", "focused solely on maintaining control and exploiting the situation."],
        ap.active_plans = ["To thoroughly assess the scope of Justus's knowledge and the potential damage caused by his rash actions.", "To manipulate Justus into a state of fear and compliance, ensuring his silence and preventing further impulsive actions.", "To strategically control the flow of information regarding Messalina's scandal, deciding when and how to reveal it to Claudius for maximum political leverage."],
        ap.beliefs = ["Emotional reactions are weaknesses to be exploited in political maneuvering.", "Control over information is paramount to maintaining power and influence within the court.", "Messalina's reckless behavior is a destabilizing threat that needs to be managed, not out of moral concern, but for the sake of order and control."],
        ap.goals = ["short_term\": \"To extract all relevant information from Justus and immediately neutralize him as a potential threat or loose end.", "medium_term\": \"To utilize Justus's blunder and Messalina's scandal to solidify his and Narcissus's position within Claudius's court, potentially at Messalina's expense.", "ultimate\": \"To maintain and expand his own power and influence, ensuring the stability of the Roman state under Claudius's rule, as defined by his own pragmatic and self-serving agenda."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Quintus Justus paces anxiously in the anteroom, his movements rapid and filled with tension. He gestures animatedly, his hands fidgeting as he expresses his outrage and desperation to Pallas, embodying a sense of urgency and fear regarding the Emperor\'s wife and her reckless behavior.',
        ap.emotional_state = 'Quintus is a bundle of nerves, visibly shaken by the realization of the gravity of the situation. His surface emotions display a mix of anger and fear as he articulates his concerns, but underneath lies a profound terror and vulnerability as he realizes he may be in mortal danger. His pleas reflect a desperate hope for support, clashing with the stark reality of his predicament.',
        ap.emotional_tags = ["quintus is a bundle of nerves, visibly shaken by the realization of the gravity of the situation. his surface emotions display a mix of anger", "fear as he articulates his concerns, but underneath lies a profound terror", "vulnerability as he realizes he may be in mortal danger. his pleas reflect a desperate hope for support, clashing with the stark reality of his predicament.", "quintus is a bundle of nerves", "visibly shaken by the realization of the gravity of the situation. his surface emotions display a mix of anger and fear as he articulates his concerns", "but underneath lies a profound terror and vulnerability as he realizes he may be in mortal danger. his pleas reflect a desperate hope for support", "clashing with the stark reality of his predicament.", "quintus is a bundle of nerves, visibly shaken by the realization of the gravity of the situation. his surface emotions display a mix of anger and fear as he articulates his concerns,", "underneath lies a profound terror and vulnerability as he realizes he may be in mortal danger. his pleas reflect a desperate hope for support, clashing with the stark reality of his predicament."],
        ap.active_plans = ["Convince Pallas to support his call to inform the Emperor about Messalina's actions.", "Seek protection from Pallas against potential retaliation from Messalina.", "Identify a strategy to safeguard his own life in light of the imminent threat."],
        ap.beliefs = ["Loyalty to the Emperor must be upheld, even in the face of scandal.", "Those in positions of authority are bound to act justly when informed of wrongdoing.", "His duty is to protect the integrity of the palace, even if it risks his own safety."],
        ap.goals = ["Short-term: Alert Pallas about Messalina's outrageous contest and its implications.", "Medium-term: Secure Pallas's backing to confront the Emperor about the scandal.", "Ultimate: Ensure his safety and maintain his position in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated, his posture relaxed and composed, exuding an air of control and authority. He listens to Justus with a calm demeanor, occasionally raising an eyebrow in skepticism as he assesses the gravity of Justus\'s revelations. His movements are deliberate, reflecting his calculated approach to the unfolding crisis.',
        ap.emotional_state = 'Pallas displays a veneer of indifference, masking the sharp intellect and strategic mind beneath. Outwardly, he appears composed and dismissive of Justus\'s panic, but internally, he is acutely aware of the perilous nature of their political landscape. He recognizes the stakes involved and chooses to navigate the situation with caution, embodying the pragmatism of a seasoned courtier.',
        ap.emotional_tags = ["pallas displays a veneer of indifference, masking the sharp intellect", "strategic mind beneath. outwardly, he appears composed", "dismissive of justus's panic, but internally, he is acutely aware of the perilous nature of their political landscape. he recognizes the stakes involved", "chooses to navigate the situation with caution, embodying the pragmatism of a seasoned courtier.", "pallas displays a veneer of indifference", "masking the sharp intellect and strategic mind beneath. outwardly", "he appears composed and dismissive of justus's panic", "but internally", "he is acutely aware of the perilous nature of their political landscape. he recognizes the stakes involved and chooses to navigate the situation with caution", "embodying the pragmatism of a seasoned courtier.", "pallas displays a veneer of indifference, masking the sharp intellect and strategic mind beneath. outwardly, he appears composed and dismissive of justus's panic,", "internally, he is acutely aware of the perilous nature of their political landscape. he recognizes the stakes involved and chooses to navigate the situation with caution, embodying the pragmatism of a seasoned courtier."],
        ap.active_plans = ["Assess the situation regarding Messalina's actions and decide when to inform the Emperor.", "Preserve his own position and influence within the court amidst the brewing chaos.", "Manage the fallout from this scandal without directly involving himself until the right moment."],
        ap.beliefs = ["In a court rife with danger, discretion is paramount; timing is everything.", "Emotional responses can cloud judgment; a calm exterior is essential for survival.", "Allegiances are fleeting; maintaining power requires careful navigation of relationships."],
        ap.goals = ["Short-term: Maintain composure while evaluating the implications of Justus\u2019s information.", "Medium-term: Decide the most strategic timing to approach the Emperor with the information regarding Messalina.", "Ultimate: Ensure his own survival and continued influence in the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Mnester stands amidst the thinning crowd in the Colchester forum, his fingers deftly counting out gold coins. He is distributing winnings, acting as the contest\'s bookkeeper and announcer. With a flourish and a theatrical voice, he proclaims the end of the competition, declaring, \'The Queen is dead... Long live the Queen!\' his gaze sweeping across the remaining onlookers.',
        ap.emotional_state = 'Mnester exudes a jovial, celebratory air, his tone laced with playful irony. Outwardly, he is enjoying the spectacle and the conclusion of the contest, reveling in the dramatic pronouncements. Beneath the surface, there\'s a hint of knowing amusement, a sharp awareness of the absurdity of the situation and Messalina\'s over-the-top antics. He understands the performance aspect of the event and is relishing his role as commentator and witty observer.',
        ap.emotional_tags = ["mnester exudes a jovial, celebratory air, his tone laced with playful irony. outwardly, he is enjoying the spectacle", "the conclusion of the contest, reveling in the dramatic pronouncements. beneath the surface, there's a hint of knowing amusement, a sharp awareness of the absurdity of the situation", "messalina's over-the-top antics. he understands the performance aspect of the event", "is relishing his role as commentator", "witty observer.", "mnester exudes a jovial", "celebratory air", "his tone laced with playful irony. outwardly", "he is enjoying the spectacle and the conclusion of the contest", "reveling in the dramatic pronouncements. beneath the surface", "there's a hint of knowing amusement", "a sharp awareness of the absurdity of the situation and messalina's over-the-top antics. he understands the performance aspect of the event and is relishing his role as commentator and witty observer."],
        ap.active_plans = ["To finalize the distribution of coins to the winners of the betting pool, ensuring a smooth and orderly conclusion to the financial aspect of the contest.", "To entertain the remaining crowd with a memorable and slightly provocative declaration, maintaining the festive atmosphere and his reputation as a witty showman.", "To gauge the reactions of Messalina and Scylla to his pronouncements, observing their responses to his theatrical conclusion of their contest for further amusement and social insight."],
        ap.beliefs = ["Spectacle and performance are the primary currencies of Roman public life, and dramatic pronouncements are essential for captivating an audience.", "Social hierarchies, even those involving powerful figures like Messalina, can be playfully mocked and satirized for entertainment, as long as it's done with wit and charm.", "His own value lies in his ability to entertain and observe, using his charm and wit to navigate social circles and maintain his position within Messalina's orbit."],
        ap.goals = ["Short-term Goal: To efficiently and accurately complete the coin counting and distribution, fulfilling his immediate duty at the event.", "Medium-term Goal: To solidify his reputation as a witty and engaging figure within Messalina's social circle, ensuring continued access to patronage and opportunities.", "Ultimate Goal: To advance his career and social standing by leveraging his charm, wit, and connections, ultimately securing a comfortable and influential position in Roman society through his performative skills."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands amidst the thinning crowd, her posture rigid with fury. She interrupts the proceedings, shouting a defiant challenge to Scylla, her voice a combination of anger and desperation. Her movements are animated, hands clenching in frustration, her demeanor a tempest of indignation that disrupts the celebratory atmosphere.',
        ap.emotional_state = 'Outwardly, Messalina exudes fury and defiance, her eyes blazing with a mix of anger and determination. Internally, she is wrestling with a desperate need to reclaim her power and status, feeling the sting of defeat while fiercely resisting the perception of her loss. Her cry reflects a deeper fear of losing her identity and influence, revealing the vulnerability beneath her bravado.',
        ap.emotional_tags = ["outwardly, messalina exudes fury", "defiance, her eyes blazing with a mix of anger", "determination. internally, she is wrestling with a desperate need to reclaim her power", "status, feeling the sting of defeat while fiercely resisting the perception of her loss. her cry reflects a deeper fear of losing her identity", "influence, revealing the vulnerability beneath her bravado.", "outwardly", "messalina exudes fury and defiance", "her eyes blazing with a mix of anger and determination. internally", "she is wrestling with a desperate need to reclaim her power and status", "feeling the sting of defeat while fiercely resisting the perception of her loss. her cry reflects a deeper fear of losing her identity and influence", "revealing the vulnerability beneath her bravado.", "outwardly, messalina exudes fury and defiance, her eyes blazing with a mix of anger and determination. internally, she is wrestling with a desperate need to reclaim her power and status, feeling the sting of defeat", "fiercely resisting the perception of her loss. her cry reflects a deeper fear of losing her identity and influence, revealing the vulnerability beneath her bravado."],
        ap.active_plans = ["To disrupt the celebration and assert her dominance in the contest.", "To challenge Scylla and reclaim her perceived loss.", "To maintain her public image as an invincible figure in the face of defeat."],
        ap.beliefs = ["Power is fought for and must be claimed aggressively.", "Defeat is not an option; it is a threat to her identity.", "Her worth is tied to her ability to dominate others."],
        ap.goals = ["Short-term: To reignite the contest and regain the upper hand.", "Medium-term: To solidify her reputation as fierce and untouchable in the eyes of the crowd.", "Ultimate: To maintain her position of power and influence within the court and beyond."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Scylla stands in the Colchester forum, physically drained from the contest but radiating an aura of hard-won triumph. She is engaged in a transaction with Mnester, pointedly counting the gold coins she has earned.  Despite her exhaustion, she turns to retort at Messalina\'s furious outburst, a gesture of defiance and finality to their competition. She then promptly gathers her winnings from Mnester, ready to depart the arena, her business concluded.',
        ap.emotional_state = 'Outwardly, Scylla displays triumphant scorn, her words dripping with sarcasm as she dismisses Messalina\'s challenge. Beneath this surface bravado, there\'s a clear exhaustion from the physical ordeal, yet it\'s overshadowed by a deep satisfaction in her victory and the financial reward.  She likely feels a sense of professional pride, having proven her stamina and skill, and perhaps a touch of amusement at Messalina\'s inability to accept defeat gracefully.',
        ap.emotional_tags = ["outwardly, scylla displays triumphant scorn, her words dripping with sarcasm as she dismisses messalina's challenge. beneath this surface bravado, there's a clear exhaustion from the physical ordeal, yet it's overshadowed by a deep satisfaction in her victory", "the financial reward.  she likely feels a sense of professional pride, having proven her stamina", "skill,", "perhaps a touch of amusement at messalina's inability to accept defeat gracefully.", "outwardly", "scylla displays triumphant scorn", "her words dripping with sarcasm as she dismisses messalina's challenge. beneath this surface bravado", "there's a clear exhaustion from the physical ordeal", "yet it's overshadowed by a deep satisfaction in her victory and the financial reward.  she likely feels a sense of professional pride", "having proven her stamina and skill", "and perhaps a touch of amusement at messalina's inability to accept defeat gracefully."],
        ap.active_plans = ["Secure immediate payment for her performance from Mnester, ensuring she receives the agreed-upon sum.", "Underscore her victory over Messalina, asserting her dominance and dismissing Messalina's lingering competitive spirit with a cutting remark.", "Exit the forum promptly, having completed her task and collected her earnings, disengaging from further drama and moving on to her next engagement."],
        ap.beliefs = ["Meritocracy: She believes her stamina and professional skill are superior and deserve recognition and reward.", "Pragmatism: She believes in concluding business efficiently, collecting her dues, and not lingering in unnecessary conflicts once the transaction is complete.", "Self-worth: She believes in asserting her value and not allowing herself to be drawn back into a losing battle or undermined by sore losers like Messalina."],
        ap.goals = ["Short-term: To collect the 'three gold pieces per head' from Mnester without any dispute or delay.", "Medium-term: To reinforce her reputation as a top courtesan by demonstrating her superior stamina and business acumen in this public spectacle, further enhancing her market value.", "Ultimate: To maintain her successful and independent career as a courtesan, ensuring financial security and professional respect within her guild and Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Mnester stands confidently amidst the thinning crowd, counting out coins with a calm demeanor, embodying the role of mediator. His movements are assured, reflecting his charm, as he addresses Scylla directly, his posture relaxed yet authoritative.',
        ap.emotional_state = 'Mnester projects an air of calm amidst the rising tensions, with a slight smirk hinting at his enjoyment of the scene. Internally, he may feel the pressure of the moment, aware of the stakes involved and the volatile nature of the competition he oversees.',
        ap.emotional_tags = ["mnester projects an air of calm amidst the rising tensions, with a slight smirk hinting at his enjoyment of the scene. internally, he may feel the pressure of the moment, aware of the stakes involved", "the volatile nature of the competition he oversees.", "mnester projects an air of calm amidst the rising tensions", "with a slight smirk hinting at his enjoyment of the scene. internally", "he may feel the pressure of the moment", "aware of the stakes involved and the volatile nature of the competition he oversees."],
        ap.active_plans = ["To ensure Scylla receives her rightful winnings without escalating tensions further.", "To maintain his reputation as a competent mediator in the contest.", "To navigate the dynamics of victory and rivalry carefully, ensuring he remains in the crowd's favor."],
        ap.beliefs = ["Victory in contests often comes with monetary reward, reflecting the transactional nature of relationships.", "His role as a mediator is crucial in maintaining order amidst competition.", "Public perception is key; maintaining a favorable image will benefit him in future interactions."],
        ap.goals = ["Short-term: To distribute the winnings to Scylla without conflict.", "Medium-term: To reinforce his position as a reliable mediator in social events.", "Ultimate: To cultivate lasting relationships within the elite circles of Colchester."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Scylla stands defiantly, her body tense and animated, as she demands her payment from Mnester. With an air of exhaustion but a fierce determination, she confronts the crowd, embodying both victory and frustration as she seeks her due.',
        ap.emotional_state = 'Outwardly, Scylla exudes anger and frustration, her tone sharp and demanding as she insists on receiving her money. Internally, she grapples with feelings of betrayal and exhaustion after the contest, revealing a deeper sense of vulnerability masked by her fierce exterior.',
        ap.emotional_tags = ["outwardly, scylla exudes anger", "frustration, her tone sharp", "demanding as she insists on receiving her money. internally, she grapples with feelings of betrayal", "exhaustion after the contest, revealing a deeper sense of vulnerability masked by her fierce exterior.", "outwardly", "scylla exudes anger and frustration", "her tone sharp and demanding as she insists on receiving her money. internally", "she grapples with feelings of betrayal and exhaustion after the contest", "revealing a deeper sense of vulnerability masked by her fierce exterior."],
        ap.active_plans = ["To secure her winnings promptly and without further delay.", "To assert her dominance and reputation as a formidable competitor.", "To navigate the aftermath of the contest with confidence, reinforcing her status among peers."],
        ap.beliefs = ["Winnings are a reflection of her worth and competence in the competitive landscape.", "Power dynamics in contests can be exploited; showing strength after victory is essential.", "Financial independence is crucial to her identity and survival in a patriarchal society."],
        ap.goals = ["Short-term: To collect her payment of three gold pieces immediately.", "Medium-term: To maintain her reputation as a leading figure among the courtesans.", "Ultimate: To secure a stable and influential position in society, free from subjugation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Scylla, though visibly drained from the grueling contest, stands tall amidst the thinning crowd in the Colchester forum. She listens intently as Mnester counts out her winnings, her body posture revealing a mix of fatigue and satisfaction. She takes the offered coins directly, her movements efficient and business-like, a seasoned professional concluding a transaction. Her final words are a dismissive flourish aimed at the departed competitors, delivered with a sharp, confident tone.',
        ap.emotional_state = 'On the surface, Scylla projects an air of triumphant derision. Her tone is cutting as she labels her unseen rivals \'amateurs,\' displaying a blatant sense of superiority. Beneath this bravado, a deep satisfaction simmers – the hard-won victory is hers, and she knows it. There\'s a hint of cynicism too; she understands the transactional nature of this brutal spectacle, but she played the game ruthlessly and emerged victorious, validating her professional prowess in this debased arena.',
        ap.emotional_tags = ["on the surface, scylla projects an air of triumphant derision. her tone is cutting as she labels her unseen rivals 'amateurs,' displaying a blatant sense of superiority. beneath this bravado, a deep satisfaction simmers \u2013 the hard-won victory is hers,", "she knows it. there's a hint of cynicism too; she understands the transactional nature of this brutal spectacle, but she played the game ruthlessly", "emerged victorious, validating her professional prowess in this debased arena.", "on the surface", "scylla projects an air of triumphant derision. her tone is cutting as she labels her unseen rivals 'amateurs", "' displaying a blatant sense of superiority. beneath this bravado", "a deep satisfaction simmers \u2013 the hard-won victory is hers", "and she knows it. there's a hint of cynicism too; she understands the transactional nature of this brutal spectacle", "but she played the game ruthlessly and emerged victorious", "validating her professional prowess in this debased arena.", "on the surface, scylla projects an air of triumphant derision. her tone is cutting as she labels her unseen rivals 'amateurs,' displaying a blatant sense of superiority. beneath this bravado, a deep satisfaction simmers \u2013 the hard-won victory is hers, and she knows it. there's a hint of cynicism too", "she understands the transactional nature of this brutal spectacle, but she played the game ruthlessly and emerged victorious, validating her professional prowess in this debased arena.", "on the surface, scylla projects an air of triumphant derision. her tone is cutting as she labels her unseen rivals 'amateurs,' displaying a blatant sense of superiority. beneath this bravado, a deep satisfaction simmers \u2013 the hard-won victory is hers, and she knows it. there's a hint of cynicism too; she understands the transactional nature of this brutal spectacle,", "she played the game ruthlessly and emerged victorious, validating her professional prowess in this debased arena."],
        ap.active_plans = ["Collect her full payment from Mnester without delay, ensuring she receives every coin owed for her strenuous effort.", "Publicly assert her professional dominance and stamina, reinforcing her brand as the superior courtesan compared to her competitors.", "Depart from the forum swiftly, leaving behind the scene of the competition now that her business is concluded and her victory secured."],
        ap.beliefs = ["She believes in the brutal meritocracy of her profession, where stamina and performance are the ultimate measures of success and worth.", "She believes in her own exceptional endurance and skill, viewing herself as a cut above the average practitioners in her field.", "She believes in direct and immediate reward for her labor, expecting prompt and unquestioning payment for services rendered."],
        ap.goals = ["short-term: To secure the immediate financial reward for winning the contest, ensuring she is properly compensated for her efforts.", "medium-term: To solidify her reputation as the most formidable and enduring courtesan, enhancing her market value and attracting higher clientele.", "ultimate: To achieve long-term financial security and professional respect within her industry, leveraging her unique skills and reputation to maintain a position of power and independence."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_documents_event_6_1'})
    ON CREATE SET
        oi.description = 'The documents scattered across Claudius’s desk represent a collection of intelligence reports and legal texts. They serve as the backdrop against which the conversation about Herod Agrippa unfolds, symbolizing the weight of bureaucratic duty and the complexities of governance that Claudius grapples with. The documents highlight the tension between personal relationships and political responsibilities, as Claudius’s focus shifts between administrative duties and his concern for his old friend.',
        oi.status_before = 'Prior to the event, the documents were in disarray on Claudius’s desk, indicating a busy and perhaps chaotic period of governance, filled with pressing matters that require his attention.',
        oi.status_after = 'Following the event, the documents remain scattered, signifying that the urgency of the political crisis has compounded Claudius\'s existing workload, leaving him overwhelmed with pressing issues related to Herod\'s suspected treachery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_documents'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_play_event_6_3'})
    ON CREATE SET
        oi.description = 'The play symbolizes Messalina\'s desire for influence and control over public affairs. It serves as a point of contention between her and Mnester, who has resisted her demands. By leveraging her complaint about the play, Messalina manipulates Claudius to assert her authority and diminish Mnester\'s standing, showcasing the intersection of personal and political motives in her schemes.',
        oi.status_before = 'The play has been requested by Messalina\'s friends but is currently in limbo due to Mnester\'s refusal to produce it, reflecting the tensions between the Empress\'s desires and the actor\'s professional integrity.',
        oi.status_after = 'After Claudius\'s decision to address Mnester\'s insubordination, the play is likely to proceed, allowing Messalina to exert her influence in public theater and further her ambitions, while Mnester\'s position grows precarious.'
    WITH oi
    MATCH (o:Object {uuid: 'object_play'})
    MATCH (e:Event {uuid: 'event_6_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched over a cluttered desk in his richly appointed study, surrounded by scattered documents and statues of Roman gods. He speaks with a furrowed brow, reflecting his troubled concentration as he engages with Marsus Vibius, the stern governor. His posture conveys a mix of authority and weariness, a ruler weighed down by the complexities of both friendship and duty.',
        ap.emotional_state = 'On the surface, Claudius exhibits concern mixed with a sense of paternal affection towards Herod Agrippa, revealing a deeper emotional attachment that clouds his judgment. Internally, he grapples with anxiety and insecurity, manifesting in his questioning of motivations behind potential betrayal. His desire for friendship conflicts with the harsh realities of political loyalty.',
        ap.emotional_tags = ["on the surface, claudius exhibits concern mixed with a sense of paternal affection towards herod agrippa, revealing a deeper emotional attachment that clouds his judgment. internally, he grapples with anxiety", "insecurity, manifesting in his questioning of motivations behind potential betrayal. his desire for friendship conflicts with the harsh realities of political loyalty.", "on the surface", "claudius exhibits concern mixed with a sense of paternal affection towards herod agrippa", "revealing a deeper emotional attachment that clouds his judgment. internally", "he grapples with anxiety and insecurity", "manifesting in his questioning of motivations behind potential betrayal. his desire for friendship conflicts with the harsh realities of political loyalty."],
        ap.active_plans = ["To assess the seriousness of the threat posed by Herod Agrippa and gather intelligence on the political situation in Jerusalem.", "To maintain his role as a benevolent ruler while addressing the potential revolt against Rome.", "To understand the motivations behind Herod's actions, reflecting his desire for personal connection amidst political intrigue."],
        ap.beliefs = ["Friendship and loyalty should hold significant weight in political matters.", "Understanding motives is crucial for effective leadership and governance.", "His own inadequacies as a ruler can be mitigated by remaining in touch with personal relationships."],
        ap.goals = ["Short-term: To gather information about Herod's potential threats and understand the underlying motivations.", "Medium-term: To assert his authority by addressing the revolt while maintaining personal relationships.", "Ultimate: To uphold the stability of the Roman Empire and prevent conflicts that could arise from personal betrayals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius enters the study with a stern demeanor, bowing slightly before addressing Claudius. He stands at attention, displaying military discipline, and presents the alarming intelligence regarding Herod Agrippa\'s activities. His posture conveys authority and seriousness, emphasizing the weight of the message he brings.',
        ap.emotional_state = 'Marsus Vibius remains emotionally detached, embodying a pragmatic approach to governance. His surface demeanor is stern and focused, indicating his commitment to the Roman Empire\'s stability. Internally, he likely experiences concern for the empire\'s safety but keeps it concealed, prioritizing duty over personal feelings.',
        ap.emotional_tags = ["marsus vibius remains emotionally detached, embodying a pragmatic approach to governance. his surface demeanor is stern", "focused, indicating his commitment to the roman empire's stability. internally, he likely experiences concern for the empire's safety but keeps it concealed, prioritizing duty over personal feelings.", "marsus vibius remains emotionally detached", "embodying a pragmatic approach to governance. his surface demeanor is stern and focused", "indicating his commitment to the roman empire's stability. internally", "he likely experiences concern for the empire's safety but keeps it concealed", "prioritizing duty over personal feelings.", "marsus vibius remains emotionally detached, embodying a pragmatic approach to governance. his surface demeanor is stern and focused, indicating his commitment to the roman empire's stability. internally, he likely experiences concern for the empire's safety", "keeps it concealed, prioritizing duty over personal feelings."],
        ap.active_plans = ["To deliver critical intelligence regarding Herod Agrippa to Claudius in a straightforward manner.", "To emphasize the urgency and seriousness of the potential revolt against Rome.", "To maintain a position of authority while advising Claudius on necessary actions to counter the threat."],
        ap.beliefs = ["Duty to the empire outweighs personal attachments or friendships.", "Clear and direct communication is essential in times of political crisis.", "The stability of Rome is paramount, and threats must be dealt with swiftly and effectively."],
        ap.goals = ["Short-term: To inform Claudius of the brewing threat from Herod Agrippa.", "Medium-term: To assist in formulating a response to any potential revolt against Roman authority.", "Ultimate: To ensure the continued dominance and stability of the Roman Empire under Claudius's rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Messalina sweeps into Claudius\'s study, a vision of imperial allure draped in exquisite silks, interrupting a crucial state briefing. She immediately positions herself as the center of Claudius\'s attention, her movements calculated to captivate and distract him from the weighty matters at hand. Her presence dominates the room, shifting the atmosphere from tense deliberation to one of personal intimacy and manipulative charm.',
        ap.emotional_state = 'On the surface, Messalina exudes an air of affectionate concern, her tone honeyed with feigned worry for Claudius\'s well-being during his absence. However, beneath this veneer of wifely solicitude lies a core of cold calculation and self-interest. She masks her manipulative intent with practiced ease, her internal state focused solely on leveraging Claudius\'s affection for her own petty agendas, betraying a stark emotional detachment from any genuine care for his burdens.',
        ap.emotional_tags = ["on the surface, messalina exudes an air of affectionate concern, her tone honeyed with feigned worry for claudius's well-being during his absence. however, beneath this veneer of wifely solicitude lies a core of cold calculation", "self-interest. she masks her manipulative intent with practiced ease, her internal state focused solely on leveraging claudius's affection for her own petty agendas, betraying a stark emotional detachment from any genuine care for his burdens.", "on the surface", "messalina exudes an air of affectionate concern", "her tone honeyed with feigned worry for claudius's well-being during his absence. however", "beneath this veneer of wifely solicitude lies a core of cold calculation and self-interest. she masks her manipulative intent with practiced ease", "her internal state focused solely on leveraging claudius's affection for her own petty agendas", "betraying a stark emotional detachment from any genuine care for his burdens."],
        ap.active_plans = ["To divert Claudius's attention from the pressing political issues of the state and towards her personal desires.", "To reassert her dominance and emotional hold over Claudius, ensuring her continued influence within the palace.", "To manipulate Claudius into reprimanding Mnester, thereby solidifying her authority and punishing perceived slights against her."],
        ap.beliefs = ["Claudius is hopelessly devoted to her and easily swayed by emotional manipulation and displays of affection.", "Her beauty and charm are potent tools that grant her significant power over men, especially Claudius.", "The Emperor's authority is a resource to be exploited for her personal whims and to settle petty grievances."],
        ap.goals = ["{short_term: Secure Claudius's immediate agreement to reprimand Mnester, resolving her personal annoyance., medium_term: Maintain her unchallenged position as Claudius's confidante and primary emotional influence, ensuring her access to power and resources., ultimate: Expand her personal power and control within the Roman court, using Claudius as a means to achieve her ambitions and desires, no matter how trivial.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially immersed in state affairs, hunched over documents in his study, deeply engaged in a serious discussion about potential threats to the empire. He is physically present but mentally preoccupied, his brow furrowed with concern. Upon Messalina\'s dramatic entrance, he shifts his posture and focus, becoming visibly softer and more attentive to her presence, eagerly abandoning the weighty matters of state.',
        ap.emotional_state = 'Initially burdened and anxious about the political briefing, Claudius\'s demeanor transforms into one of relieved affection and vulnerability upon Messalina\'s arrival. He outwardly expresses pleasure at her presence and readily accepts her feigned concern as genuine. Beneath the surface, however, lies a deep-seated loneliness and a desperate yearning for connection, making him exceptionally susceptible to Messalina\'s manipulations. His desire for affection overrides his awareness of her manipulative nature, highlighting a tragic emotional naivety.',
        ap.emotional_tags = ["initially burdened", "anxious about the political briefing, claudius's demeanor transforms into one of relieved affection", "vulnerability upon messalina's arrival. he outwardly expresses pleasure at her presence", "readily accepts her feigned concern as genuine. beneath the surface, however, lies a deep-seated loneliness", "a desperate yearning for connection, making him exceptionally susceptible to messalina's manipulations. his desire for affection overrides his awareness of her manipulative nature, highlighting a tragic emotional naivety.", "initially burdened and anxious about the political briefing", "claudius's demeanor transforms into one of relieved affection and vulnerability upon messalina's arrival. he outwardly expresses pleasure at her presence and readily accepts her feigned concern as genuine. beneath the surface", "however", "lies a deep-seated loneliness and a desperate yearning for connection", "making him exceptionally susceptible to messalina's manipulations. his desire for affection overrides his awareness of her manipulative nature", "highlighting a tragic emotional naivety."],
        ap.active_plans = ["To understand the gravity of the political situation in Jerusalem and devise a response.", "To momentarily escape the pressures of his imperial responsibilities and enjoy Messalina's company.", "To reassure himself of Messalina's affection and solidify their personal bond, however illusory it may be."],
        ap.beliefs = ["Messalina genuinely loves and cares for him, providing him with much-needed emotional support and companionship.", "He can trust Messalina implicitly, even in matters of personal and potentially political significance.", "His role as Emperor can be balanced with his personal need for love and connection, despite mounting evidence to the contrary."],
        ap.goals = ["{short_term: Resolve the immediate political crisis with Herod Agrippa while enjoying a moment of intimacy with Messalina., medium_term: Maintain stability both in the empire and in his personal life, believing Messalina is key to his emotional well-being., ultimate: Rule Rome justly and effectively, while also achieving personal happiness and genuine connection, a tragically flawed aspiration given the reality of his court.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently in the doorway of Claudius\'s study, draped in fine silks that accentuate her beauty. She moves gracefully into the room, her demeanor shifting from playful to strategically assertive as she begins to address Claudius. Her gestures are deliberate, eyes sparkling with cunning, as she dismisses any notion of vulnerability.',
        ap.emotional_state = 'Outwardly, Messalina appears charming and flirtatious, yet beneath this facade lies a calculated determination. Her heart races with the thrill of manipulation as she paints herself as a victim of Mnester\'s insolence. Internally, she grapples with the weight of her ambitions, masking her desperation to secure Gaius Silius\'s affection without risking her position.',
        ap.emotional_tags = ["outwardly, messalina appears charming", "flirtatious, yet beneath this facade lies a calculated determination. her heart races with the thrill of manipulation as she paints herself as a victim of mnester's insolence. internally, she grapples with the weight of her ambitions, masking her desperation to secure gaius silius's affection without risking her position.", "outwardly", "messalina appears charming and flirtatious", "yet beneath this facade lies a calculated determination. her heart races with the thrill of manipulation as she paints herself as a victim of mnester's insolence. internally", "she grapples with the weight of her ambitions", "masking her desperation to secure gaius silius's affection without risking her position."],
        ap.active_plans = ["To manipulate Claudius into punishing Mnester for his perceived disrespect.", "To deflect attention from her own illicit desires by framing the complaint as a matter of state and propriety.", "To reinforce her influence over Claudius by ensuring he remains obedient to her wishes regarding the theater."],
        ap.beliefs = ["Manipulation is a necessary tool to maintain power and influence.", "Her beauty and charm can bend others to her will, including Claudius.", "Maintaining a fa\u00e7ade of loyalty to Claudius is crucial for her survival and ambition."],
        ap.goals = ["Short-term: To get Claudius to confront Mnester and ensure her wishes are followed.", "Medium-term: To position herself favorably for her affair with Gaius Silius by eliminating potential obstacles.", "Ultimate: To secure her own power and influence in the court while simultaneously pursuing her desires without consequence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched at his large desk, surrounded by scrolls and documents that reflect his scholarly pursuits. His posture is weary, marked by deep furrows of concern as he listens to Messalina. He glances up at her with a blend of affection and naivety, his demeanor embodying the trust he places in her words.',
        ap.emotional_state = 'Externally, Claudius exhibits a blend of vulnerability and affection towards Messalina, easily swayed by her charm. Internally, however, he is increasingly troubled by the implications of her complaint, sensing an underlying tension that he struggles to comprehend. His blind trust in Messalina leads him to overlook the potential for manipulation.',
        ap.emotional_tags = ["externally, claudius exhibits a blend of vulnerability", "affection towards messalina, easily swayed by her charm. internally, however, he is increasingly troubled by the implications of her complaint, sensing an underlying tension that he struggles to comprehend. his blind trust in messalina leads him to overlook the potential for manipulation.", "externally", "claudius exhibits a blend of vulnerability and affection towards messalina", "easily swayed by her charm. internally", "however", "he is increasingly troubled by the implications of her complaint", "sensing an underlying tension that he struggles to comprehend. his blind trust in messalina leads him to overlook the potential for manipulation."],
        ap.active_plans = ["To maintain peace in his household and keep the empire stable by addressing Messalina's complaints.", "To protect his reputation and popularity by ensuring Mnester complies with Messalina's wishes.", "To explore the situation regarding Herod Agrippa and manage external threats to his reign."],
        ap.beliefs = ["His role as Emperor requires him to balance the needs of his court and his wife.", "He believes in the loyalty and affection of those around him, particularly Messalina.", "Understanding the motives behind threats to Rome is crucial to his reign."],
        ap.goals = ["Short-term: To resolve the conflict with Mnester to please Messalina.", "Medium-term: To secure the loyalty of his advisors and maintain stability in the court.", "Ultimate: To safeguard his legacy as Emperor and ensure the continuation of his rule amid political complexities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_3'})
    ON CREATE SET
        ap.current_status = 'While Mnester does not appear physically in this particular event, his presence looms large over the conversation. Claudius refers to him with a tone of authority, indicating that Mnester has already established a significant reputation in the court. The delay in his compliance with Messalina\'s wishes is causing tension.',
        ap.emotional_state = 'Since he is not present, Mnester\'s emotional state is implied rather than explicit. He might be feeling anxiety over his standing with Messalina and Claudius, caught between his respect for Silius\'s wife and the pressure from the Empress. His absence suggests a sense of precariousness regarding his position.',
        ap.emotional_tags = ["since he is not present, mnester's emotional state is implied rather than explicit. he might be feeling anxiety over his standing with messalina", "claudius, caught between his respect for silius's wife", "the pressure from the empress. his absence suggests a sense of precariousness regarding his position.", "since he is not present", "mnester's emotional state is implied rather than explicit. he might be feeling anxiety over his standing with messalina and claudius", "caught between his respect for silius's wife and the pressure from the empress. his absence suggests a sense of precariousness regarding his position."],
        ap.active_plans = ["To maintain his popularity with the public and avoid entanglements in royal disputes.", "To uphold his respect for Silius's marriage while navigating the demands of Messalina.", "To ensure he does not incur the wrath of Claudius or Messalina, striving for a balance."],
        ap.beliefs = ["The theater should be free from royal manipulations and personal vendettas.", "Maintaining a favorable reputation with both the public and the court is essential for his career.", "Navigating the whims of the elite requires cleverness and subtlety."],
        ap.goals = ["Short-term: To deflect Messalina's ambitions without causing a scandal.", "Medium-term: To uphold his status as a favored actor amidst the machinations of the court.", "Ultimate: To secure a long-term position within the entertainment world of Rome without compromising his integrity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Mnester is described as being \'big-headed\' and \'insolent\' by Messalina because he refused her initial request to introduce her to Silius.  His current status is one of defiance against Messalina’s desires, driven by respect for Silius\'s wife. However, he is also now subject to Claudius\'s direct command to obey Messalina unconditionally. He is positioned as a pawn caught between the Empress\'s desires and the Emperor\'s will, forced into compliance despite his initial moral stance.',
        ap.emotional_state = 'Mnester\'s emotional state is likely a mix of resentment and resignation. Outwardly, he may have presented a facade of professional resistance to Messalina, using \'excuses\' to avoid fulfilling her requests. Internally, he is likely frustrated and possibly indignant at being manipulated by Messalina and then ordered by Claudius to comply. Unspoken conflicts include his personal moral code (respect for Silius\'s wife), his professional obligations, and his powerlessness against imperial authority.',
        ap.emotional_tags = ["mnester's emotional state is likely a mix of resentment", "resignation. outwardly, he may have presented a facade of professional resistance to messalina, using 'excuses' to avoid fulfilling her requests. internally, he is likely frustrated", "possibly indignant at being manipulated by messalina", "then ordered by claudius to comply. unspoken conflicts include his personal moral code (respect for silius's wife), his professional obligations,", "his powerlessness against imperial authority.", "mnester's emotional state is likely a mix of resentment and resignation. outwardly", "he may have presented a facade of professional resistance to messalina", "using 'excuses' to avoid fulfilling her requests. internally", "he is likely frustrated and possibly indignant at being manipulated by messalina and then ordered by claudius to comply. unspoken conflicts include his personal moral code (respect for silius's wife)", "his professional obligations", "and his powerlessness against imperial authority."],
        ap.active_plans = ["To resist Messalina's initial requests based on his principles.", "To explain his reasons for refusal, possibly hoping for understanding.", "To ultimately comply with Claudius's command, however reluctantly, to avoid further trouble."],
        ap.beliefs = ["He believes in respecting marital vows and boundaries (initially, regarding Silius's wife).", "He believes in his own judgment and professional integrity.", "He now understands that obedience to the Emperor overrides personal principles in this context."],
        ap.goals = ["Short-term: To avoid directly facilitating Messalina's affair (initially).", "Medium-term: To comply with Claudius's orders while minimizing his own moral compromise.", "Ultimate: To navigate the treacherous court politics and maintain his position without incurring the wrath of either Messalina or Claudius."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dispatches_event_7_1'})
    ON CREATE SET
        oi.description = 'The dispatches serve as the primary medium of communication between Marsus and Claudius, containing crucial information regarding the political climate in Jerusalem and the emergence of the supposed Messiah. They are scattered across Claudius\'s desk, representing the weight of imperial responsibilities and the urgency of the news being presented. The dispatches symbolize not just information, but the pressing threats that challenge Claudius\'s authority.',
        oi.status_before = 'The dispatches were in a state of disarray, reflecting the chaotic nature of the information being relayed to Claudius. They are filled with updates and reports from various parts of the empire, particularly related to tensions in Jerusalem.',
        oi.status_after = 'After the event, the dispatches remain on the desk, now imbued with a greater significance as Claudius contemplates the implications of the news. Their presence serves as a reminder of the challenges ahead, prompting Claudius to take action.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dispatches'})
    MATCH (e:Event {uuid: 'event_7_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at his desk, physically slumped under the weight of his burdens. He fidgets with the scrolls scattered before him, his stutter emerging as a barrier between his thoughts and speech. His brow furrows as he absorbs the grave news from Marsus, each piece of information pushing him deeper into a state of anxiety.',
        ap.emotional_state = 'Claudius exhibits a mix of confusion and apprehension. His surface demeanor is one of a ruler grappling with complex news, but internally, he wrestles with fear and disbelief as the implications of a new Messiah are presented. He is torn between his role as Emperor and his naivety regarding the political realities of rebellion and faith.',
        ap.emotional_tags = ["claudius exhibits a mix of confusion", "apprehension. his surface demeanor is one of a ruler grappling with complex news, but internally, he wrestles with fear", "disbelief as the implications of a new messiah are presented. he is torn between his role as emperor", "his naivety regarding the political realities of rebellion", "faith.", "claudius exhibits a mix of confusion and apprehension. his surface demeanor is one of a ruler grappling with complex news", "but internally", "he wrestles with fear and disbelief as the implications of a new messiah are presented. he is torn between his role as emperor and his naivety regarding the political realities of rebellion and faith.", "claudius exhibits a mix of confusion and apprehension. his surface demeanor is one of a ruler grappling with complex news,", "internally, he wrestles with fear and disbelief as the implications of a new messiah are presented. he is torn between his role as emperor and his naivety regarding the political realities of rebellion and faith."],
        ap.active_plans = ["To understand the true nature of the Messiah and the potential threat it poses to Rome.", "To assess the loyalty of his advisors and allies in light of this new information.", "To formulate a response to King Herod's emerging threat before it escalates."],
        ap.beliefs = ["He believes in the divine right of emperors, but also fears the power of faith among the populace.", "He holds a conviction that ignorance is a dangerous state for a ruler, prompting him to seek knowledge.", "He trusts in the loyalty of his advisors but struggles with the fear of betrayal."],
        ap.goals = ["Short-term: To comprehend the situation in Jerusalem and the implications of a supposed Messiah.", "Medium-term: To reinforce his authority and quell any potential uprisings stemming from this religious fervor.", "Ultimate: To maintain the stability of the Roman Empire and secure his reign against both internal and external threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands resolutely before Claudius, his posture firm and authoritative. He delivers the grim news with a military precision, articulating the details of the situation in Jerusalem with a calm demeanor that masks any underlying urgency. His gestures are measured, reflecting his no-nonsense approach to governance.',
        ap.emotional_state = 'Marsus is composed but aware of the gravity of the news he delivers. His surface emotions are those of steadfast loyalty and seriousness, yet internally, he is acutely aware of the threat Herod poses. He feels a sense of responsibility to ensure Claudius is fully informed and prepared to act decisively.',
        ap.emotional_tags = ["marsus is composed but aware of the gravity of the news he delivers. his surface emotions are those of steadfast loyalty", "seriousness, yet internally, he is acutely aware of the threat herod poses. he feels a sense of responsibility to ensure claudius is fully informed", "prepared to act decisively.", "marsus is composed but aware of the gravity of the news he delivers. his surface emotions are those of steadfast loyalty and seriousness", "yet internally", "he is acutely aware of the threat herod poses. he feels a sense of responsibility to ensure claudius is fully informed and prepared to act decisively.", "marsus is composed", "aware of the gravity of the news he delivers. his surface emotions are those of steadfast loyalty and seriousness, yet internally, he is acutely aware of the threat herod poses. he feels a sense of responsibility to ensure claudius is fully informed and prepared to act decisively."],
        ap.active_plans = ["To provide Claudius with the most accurate and timely information regarding the situation in Jerusalem.", "To encourage immediate strategic planning in response to the emerging threat of Herod.", "To maintain clarity and focus in the conversation to guide Claudius towards action."],
        ap.beliefs = ["He believes in the importance of military and political vigilance to protect the Empire.", "He holds that knowledge is power, and timely information can prevent calamity.", "He trusts in Claudius's ability to make rational decisions when armed with the right information."],
        ap.goals = ["Short-term: To ensure Claudius understands the seriousness of the situation and the need for action.", "Medium-term: To influence Claudius to adopt a more proactive stance against potential threats.", "Ultimate: To help maintain the stability of Rome under Claudius's rule through informed governance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius is seated at his desk in his imperial study, his posture reflecting the weight of the empire he carries. He leans forward, intently listening to Marsus Vibius, his fingers perhaps tapping lightly on the desk as he processes the information. He peppers Marsus with questions, his brow furrowed in concentration as he tries to grasp the significance of the details being presented.',
        ap.emotional_state = 'Claudius is initially driven by intellectual curiosity, his stammering questions revealing a genuine desire to understand the religious context of the Messiah. As Marsus speaks of Bethlehem and Joshua Bar-Joseph, a flicker of concern begins to cloud his curiosity. This morphs into a dawning alarm as he connects Bethlehem to King Herod, realizing the potential political ramifications. Beneath the surface, there\'s a vulnerability, a fear of betrayal, informed by past experiences and the constant political machinations around him.',
        ap.emotional_tags = ["claudius is initially driven by intellectual curiosity, his stammering questions revealing a genuine desire to understand the religious context of the messiah. as marsus speaks of bethlehem", "joshua bar-joseph, a flicker of concern begins to cloud his curiosity. this morphs into a dawning alarm as he connects bethlehem to king herod, realizing the potential political ramifications. beneath the surface, there's a vulnerability, a fear of betrayal, informed by past experiences", "the constant political machinations around him.", "claudius is initially driven by intellectual curiosity", "his stammering questions revealing a genuine desire to understand the religious context of the messiah. as marsus speaks of bethlehem and joshua bar-joseph", "a flicker of concern begins to cloud his curiosity. this morphs into a dawning alarm as he connects bethlehem to king herod", "realizing the potential political ramifications. beneath the surface", "there's a vulnerability", "a fear of betrayal", "informed by past experiences and the constant political machinations around him."],
        ap.active_plans = ["To fully comprehend the concept of the 'Messiah' and its implications for Roman rule.", "To assess the credibility of the information provided by Marsus and its potential impact on Herod Agrippa's intentions.", "To formulate a strategic response if Herod is indeed perceived as a threat, ensuring the stability of the Eastern Empire."],
        ap.beliefs = ["Religious beliefs and prophecies can have significant political ramifications.", "Understanding historical and cultural contexts is crucial for effective governance.", "Trusted allies can harbor hidden ambitions and pose unforeseen threats."],
        ap.goals = ["short-term\": \"To gain a clear understanding of the 'Messiah' figure and Bethlehem's importance.", "medium-term\": \"To determine the true nature of Herod Agrippa's ambitions and assess the danger he poses to Rome.", "ultimate\": \"To safeguard the Roman Empire from internal and external threats, maintaining peace and stability within its vast territories."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands formally before Emperor Claudius in the imperial study, his posture erect and respectful. He delivers his report with measured tones, presenting the information about the Messiah and Bethlehem in a clear, didactic manner. He gestures subtly as he explains, maintaining eye contact with Claudius to ensure his message is understood and taken seriously.',
        ap.emotional_state = 'Marsus Vibius projects an outward demeanor of stern professionalism and unwavering loyalty. He speaks with a serious tone, reflecting the gravity of the information he is conveying. Internally, he is likely driven by a sense of duty to inform Claudius of potential threats to the empire, and perhaps a degree of concern about the implications of Herod\'s possible ambitions. He maintains a composed facade, carefully modulating his tone to avoid causing undue panic while still conveying the urgency of the situation.',
        ap.emotional_tags = ["marsus vibius projects an outward demeanor of stern professionalism", "unwavering loyalty. he speaks with a serious tone, reflecting the gravity of the information he is conveying. internally, he is likely driven by a sense of duty to inform claudius of potential threats to the empire,", "perhaps a degree of concern about the implications of herod's possible ambitions. he maintains a composed facade, carefully modulating his tone to avoid causing undue panic while still conveying the urgency of the situation.", "marsus vibius projects an outward demeanor of stern professionalism and unwavering loyalty. he speaks with a serious tone", "reflecting the gravity of the information he is conveying. internally", "he is likely driven by a sense of duty to inform claudius of potential threats to the empire", "and perhaps a degree of concern about the implications of herod's possible ambitions. he maintains a composed facade", "carefully modulating his tone to avoid causing undue panic while still conveying the urgency of the situation.", "marsus vibius projects an outward demeanor of stern professionalism and unwavering loyalty. he speaks with a serious tone, reflecting the gravity of the information he is conveying. internally, he is likely driven by a sense of duty to inform claudius of potential threats to the empire, and perhaps a degree of concern about the implications of herod's possible ambitions. he maintains a composed facade, carefully modulating his tone to avoid causing undue panic", "still conveying the urgency of the situation."],
        ap.active_plans = ["To accurately and comprehensively present the intelligence gathered about the 'Messiah' prophecy and Bethlehem.", "To answer Claudius's questions thoroughly, ensuring the Emperor grasps the significance of the information.", "To subtly guide Claudius towards recognizing the potential danger posed by Herod Agrippa, based on the religious context provided."],
        ap.beliefs = ["Providing accurate and timely intelligence is paramount to the Emperor's ability to govern effectively.", "Religious movements and prophecies can be manipulated for political gain and pose a threat to Roman authority.", "Loyalty to Rome and the Emperor requires proactive identification and reporting of potential dangers."],
        ap.goals = ["short-term\": \"To deliver a clear and impactful report that answers Claudius's inquiries.", "medium-term\": \"To ensure Claudius understands the potential political ramifications of the Messiah narrative, especially concerning Herod.", "ultimate\": \"To contribute to the security and stability of the Roman Empire by providing crucial intelligence and informed counsel to the Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at his desk, visibly burdened by the weight of troubling news. His posture is slumped as he engages with Marsus Vibius, his fingers tracing the edges of a scroll, reflecting his anxiety and the gravity of the information being discussed. His speech is hesitant, underscoring his internal turmoil as he processes the implications of Herod\'s rising power.',
        ap.emotional_state = 'Claudius is a mix of concern and disbelief. Outwardly, he maintains a facade of authority, but his stammering and furrowed brow reveal his inner dread and confusion about the political implications of Herod being seen as a Messiah. He grapples with feelings of vulnerability and the nagging fear of betrayal from allies he once trusted.',
        ap.emotional_tags = ["claudius is a mix of concern", "disbelief. outwardly, he maintains a facade of authority, but his stammering", "furrowed brow reveal his inner dread", "confusion about the political implications of herod being seen as a messiah. he grapples with feelings of vulnerability", "the nagging fear of betrayal from allies he once trusted.", "claudius is a mix of concern and disbelief. outwardly", "he maintains a facade of authority", "but his stammering and furrowed brow reveal his inner dread and confusion about the political implications of herod being seen as a messiah. he grapples with feelings of vulnerability and the nagging fear of betrayal from allies he once trusted.", "claudius is a mix of concern and disbelief. outwardly, he maintains a facade of authority,", "his stammering and furrowed brow reveal his inner dread and confusion about the political implications of herod being seen as a messiah. he grapples with feelings of vulnerability and the nagging fear of betrayal from allies he once trusted."],
        ap.active_plans = ["To gather and analyze intelligence on King Herod's activities and intentions.", "To ensure the stability and security of the Eastern Empire against potential insurrections.", "To strategize a response to the emerging threat Herod poses to Rome's control over the region."],
        ap.beliefs = ["The belief that knowledge and understanding of political dynamics are crucial for maintaining authority.", "The conviction that loyalty is essential among allies, although he grapples with the reality of betrayal.", "A deep-seated fear of losing the empire's power and influence due to internal and external threats."],
        ap.goals = ["Short-term: To comprehend the current political situation regarding Herod and the cult.", "Medium-term: To formulate a plan to contain the threat posed by Herod's potential uprising.", "Ultimate: To solidify his reign as Emperor and prevent any challenge to the authority of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands before Claudius with a military bearing, his posture straight and authoritative. He speaks directly, delivering news with a no-nonsense demeanor, using emphatic gestures to emphasize critical points about King Herod. His presence commands attention, and he remains focused and resolute, reflecting his commitment to the Empire’s stability.',
        ap.emotional_state = 'Marsus exhibits confidence and urgency, conveying the seriousness of the situation. He remains emotionally composed, yet there\'s an underlying tension in his voice as he discusses Herod\'s actions. His pragmatism underlines his concern for the Empire’s security, displaying a fierce loyalty tempered with the awareness of potential threats.',
        ap.emotional_tags = ["marsus exhibits confidence", "urgency, conveying the seriousness of the situation. he remains emotionally composed, yet there's an underlying tension in his voice as he discusses herod's actions. his pragmatism underlines his concern for the empire\u2019s security, displaying a fierce loyalty tempered with the awareness of potential threats.", "marsus exhibits confidence and urgency", "conveying the seriousness of the situation. he remains emotionally composed", "yet there's an underlying tension in his voice as he discusses herod's actions. his pragmatism underlines his concern for the empire\u2019s security", "displaying a fierce loyalty tempered with the awareness of potential threats."],
        ap.active_plans = ["To inform Claudius of the latest intelligence regarding Herod and his followers.", "To encourage Claudius to act swiftly to counter Herod\u2019s growing influence.", "To maintain stability within the Eastern provinces by advising on military readiness."],
        ap.beliefs = ["The belief that decisive action is necessary to prevent threats from escalating.", "A conviction that the loyalty and strength of the Empire must be upheld through clear communication and strategic planning.", "An understanding that knowledge is power; hence, he sees reporting accurate information as vital."],
        ap.goals = ["Short-term: To ensure Claudius is fully informed of Herod\u2019s activities for immediate action.", "Medium-term: To align the military and administrative resources in anticipation of possible conflict.", "Ultimate: To safeguard the Roman Empire's authority and prevent any insurrection from jeopardizing its dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius sits heavily at his desk, scrolls scattered around him, signifying his immersion in state affairs and scholarly pursuits even amidst crisis. He listens intently to Marsus Vibius, his posture reflecting a man burdened by the weight of empire, yet his mind actively engages with the details of the report. He poses questions, his characteristic stammer present but his focus sharp as he seeks to understand the unfolding situation in Jerusalem.',
        ap.emotional_state = 'Initially, Claudius is intellectually curious, his questions about the \'Messiah\' tinged with scholarly interest rather than alarm. However, as Marsus Vibius elaborates, a shift occurs. Confusion gives way to concern, then to a dawning horror as he connects \'Bethlehem\' and Herod\'s possible messianic ambitions. Beneath the surface, a profound sense of betrayal brews, the realization that a trusted friend might be plotting against him shaking his naive worldview.',
        ap.emotional_tags = ["initially, claudius is intellectually curious, his questions about the 'messiah' tinged with scholarly interest rather than alarm. however, as marsus vibius elaborates, a shift occurs. confusion gives way to concern, then to a dawning horror as he connects 'bethlehem'", "herod's possible messianic ambitions. beneath the surface, a profound sense of betrayal brews, the realization that a trusted friend might be plotting against him shaking his naive worldview.", "initially", "claudius is intellectually curious", "his questions about the 'messiah' tinged with scholarly interest rather than alarm. however", "as marsus vibius elaborates", "a shift occurs. confusion gives way to concern", "then to a dawning horror as he connects 'bethlehem' and herod's possible messianic ambitions. beneath the surface", "a profound sense of betrayal brews", "the realization that a trusted friend might be plotting against him shaking his naive worldview."],
        ap.active_plans = ["To thoroughly understand the nature of this 'Messiah' figure and its potential impact on Roman territories.", "To discern the connection between the 'Messiah' prophecies and King Herod's recent actions and birthplace.", "To formulate a strategic response to Herod's perceived threat, based on the intelligence gathered and his interpretation of Herod's intentions."],
        ap.beliefs = ["Knowledge and historical context are essential tools for navigating political and strategic challenges.", "Personal relationships and past friendships do not guarantee loyalty in the treacherous world of Roman politics.", "Maintaining Roman dominion and preventing rebellion in the Eastern Empire is paramount for the stability of Rome itself."],
        ap.goals = ["Short-term: Decipher the immediate implications of the 'Messiah' news for Rome's current political landscape.", "Medium-term: Accurately assess Herod Agrippa's true intentions and the extent of the threat he poses to Roman power.", "Ultimate: Secure the Roman Empire from external threats, preserve his reign, and maintain peace (albeit through strength and decisive action if necessary)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands formally before Claudius, acting as the bearer of grave tidings. He delivers the report from his agent Catalus with a serious and respectful demeanor. He carefully explains the details about the \'Messiah\' prophecy and the figure of Joshua Bar-Joseph, answering Claudius\'s detailed questions with precision and appearing focused on conveying information accurately and efficiently.',
        ap.emotional_state = 'Marsus Vibius maintains a stern and pragmatic facade, characteristic of a seasoned governor. He is clearly concerned about the gravity of the news he is delivering, understanding its potential to destabilize the Eastern territories and threaten Roman authority. Though outwardly composed, there\'s an underlying urgency in his tone, reflecting the pressing need for Claudius to grasp the significance of the intelligence and take swift action.',
        ap.emotional_tags = ["marsus vibius maintains a stern", "pragmatic facade, characteristic of a seasoned governor. he is clearly concerned about the gravity of the news he is delivering, understanding its potential to destabilize the eastern territories", "threaten roman authority. though outwardly composed, there's an underlying urgency in his tone, reflecting the pressing need for claudius to grasp the significance of the intelligence", "take swift action.", "marsus vibius maintains a stern and pragmatic facade", "characteristic of a seasoned governor. he is clearly concerned about the gravity of the news he is delivering", "understanding its potential to destabilize the eastern territories and threaten roman authority. though outwardly composed", "there's an underlying urgency in his tone", "reflecting the pressing need for claudius to grasp the significance of the intelligence and take swift action."],
        ap.active_plans = ["To fully and accurately convey the information received from his agent in Jerusalem regarding the 'Messiah' and related figures.", "To answer all of Claudius's queries clearly and concisely, ensuring the Emperor has a complete picture of the situation.", "To underscore the potential political and strategic ramifications of this religious movement and Herod's possible involvement, urging Claudius towards decisive action."],
        ap.beliefs = ["Reliable and timely intelligence is crucial for the Emperor to make informed decisions and maintain control over the vast empire.", "Religious movements, even those seemingly insignificant, can quickly become potent political forces, especially in volatile regions like Judea.", "Maintaining order and Roman authority requires constant vigilance and proactive responses to potential threats, whether military or ideological."],
        ap.goals = ["Short-term: Ensure Claudius fully understands the report and its immediate implications for Roman policy in the East.", "Medium-term: Advise Claudius on formulating an effective strategy to counter any threat posed by Herod and the 'Messiah' movement.", "Ultimate: Safeguard the Roman Empire's interests and maintain stability within its territories, thereby reinforcing his own position as a trusted advisor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Pallas stands silently observant beside Claudius, his posture suggesting watchful attention. While Marsus Vibius presents the details, Pallas intently monitors Claudius\'s reactions and the flow of information. He interjects strategically, steering the conversation away from scholarly tangents and back towards the core political and strategic implications for Rome, demonstrating his focus on practical statecraft.',
        ap.emotional_state = 'Pallas projects an air of cool, calculated pragmatism. He is interested in the information presented, but his primary concern is its political relevance to the Roman Empire. He shows a subtle impatience with Claudius’s intellectual diversions, hinting at an internal frustration that the Emperor might be missing the forest for the trees. His controlled demeanor masks a shrewd mind constantly assessing the situation and calculating the best course of action to maintain Roman power and his own influence.',
        ap.emotional_tags = ["pallas projects an air of cool, calculated pragmatism. he is interested in the information presented, but his primary concern is its political relevance to the roman empire. he shows a subtle impatience with claudius\u2019s intellectual diversions, hinting at an internal frustration that the emperor might be missing the forest for the trees. his controlled demeanor masks a shrewd mind constantly assessing the situation", "calculating the best course of action to maintain roman power", "his own influence.", "pallas projects an air of cool", "calculated pragmatism. he is interested in the information presented", "but his primary concern is its political relevance to the roman empire. he shows a subtle impatience with claudius\u2019s intellectual diversions", "hinting at an internal frustration that the emperor might be missing the forest for the trees. his controlled demeanor masks a shrewd mind constantly assessing the situation and calculating the best course of action to maintain roman power and his own influence.", "pallas projects an air of cool, calculated pragmatism. he is interested in the information presented,", "his primary concern is its political relevance to the roman empire. he shows a subtle impatience with claudius\u2019s intellectual diversions, hinting at an internal frustration that the emperor might be missing the forest for the trees. his controlled demeanor masks a shrewd mind constantly assessing the situation and calculating the best course of action to maintain roman power and his own influence."],
        ap.active_plans = ["To observe and analyze Claudius's comprehension and emotional response to the potentially destabilizing news from Jerusalem.", "To subtly guide the conversation, ensuring it remains focused on the practical political and strategic consequences for Rome, rather than getting lost in theological or historical minutiae.", "To assess the situation and formulate a pragmatic strategy, likely alongside Narcissus, to counteract any threat posed by Herod and reinforce Roman control in the East."],
        ap.beliefs = ["Political stability and the preservation of Roman power are the ultimate priorities, overshadowing personal relationships or scholarly pursuits.", "Religious matters are significant only insofar as they impact political stability and can be manipulated for strategic advantage.", "Effective governance requires a clear focus on practicalities and decisive action, avoiding emotional or intellectual distractions that could cloud judgment."],
        ap.goals = ["Short-term: Gauge the immediate political impact of the 'Messiah' news and ensure Claudius focuses on the strategic implications.", "Medium-term: Develop and implement a political strategy to neutralize Herod's potential threat and secure Roman dominance in the East, possibly working in concert with Narcissus.", "Ultimate: Enhance Roman power and maintain the stability of the empire, thereby securing and furthering his own influential position within Claudius's court."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_1'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, once a precious gift from Claudius to Messalina, is being removed from the wall under her orders. Its removal signifies Messalina\'s break with her imperial ties and a reckless abandon of her loyalty to Claudius. As it is taken away, it represents the shifting allegiances and the dangers of her love for Silius, foreshadowing the potential fallout from her actions.',
        oi.status_before = 'The tapestry is displayed proudly on the wall of Messalina\'s private suite, symbolizing her status and the affection from Claudius, who gifted it to her.',
        oi.status_after = 'The tapestry is no longer in Messalina\'s suite, having been taken away by slaves. Its absence marks a significant shift in her priorities and foreshadows her impending betrayal.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_2'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, a lavish gift from Emperor Claudius to Messalina, becomes the central object of contention in this scene. Slaves, under Messalina\'s command, are in the process of removing it from the wall of her private suite. This act of removal is not merely practical but deeply symbolic, as Messalina intends to gift it to her lover, Silius. Domitia\'s questioning is directly triggered by the tapestry\'s removal, making it the catalyst for the confrontation and highlighting Messalina\'s reckless disregard for imperial gifts and her husband\'s favor. The tapestry, in its silent presence and imminent removal, underscores Messalina\'s escalating infidelity and brazenness.',
        oi.status_before = 'Prior to the event, the ornate tapestry hangs prominently on the wall of Messalina\'s private suite, undisturbed and serving its intended purpose as a decorative element within her imperial chambers. It is understood to be a gift from Claudius, signifying his favor and affection towards Messalina and holding considerable value both materially and symbolically.',
        oi.status_after = 'Following the start of the event, the ornate tapestry is actively being removed from the wall by slaves, its status shifting from a fixed decoration within Messalina\'s suite to a mobile object destined to be gifted to Gaius Silius. This removal marks a significant change in its status and symbolic meaning; it transitions from representing imperial favor to becoming a token of Messalina\'s adulterous affair, signifying her audaciousness and disregard for Claudius\'s generosity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_3'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, originally a gift from Claudius to Messalina, serves as a focal point of conflict and tension in the scene. Its removal symbolizes Messalina\'s disregard for her husband\'s affections and her reckless pursuit of Silius. As it is taken down, it becomes a physical manifestation of her betrayal and the peril she invites.',
        oi.status_before = 'The tapestry hangs prominently on the wall, symbolizing Claudius\'s affection and Messalina\'s imperial status, representing her connection to her husband.',
        oi.status_after = 'After the scene, the tapestry is removed, no longer adorning Messalina\'s suite, marking a pivotal shift in her relationship with Claudius and further entrenching her commitment to Silius.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_4'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, a valuable object previously adorning Messalina\'s private suite and a gift from Emperor Claudius, is being physically removed from the wall by slaves under Messalina\'s direct orders. Messalina explicitly states her intention to gift it to Gaius Silius, claiming he \'fell in love with it.\' This act of gifting a significant and imperial item highlights Messalina\'s audacious disregard for imperial property and her husband\'s honour. The tapestry becomes a potent symbol of her infidelity, representing a tangible transfer of loyalty and imperial possessions to her lover, Silius.',
        oi.status_before = 'The ornate tapestry is hanging on the wall within Messalina\'s private suite, serving as a decorative and valuable element of her imperial surroundings. It is established as a gift from Claudius, signifying his favour and imperial generosity towards his wife.',
        oi.status_after = 'The tapestry is in the process of being removed from Messalina\'s suite by slaves, destined to be transported and delivered to Gaius Silius as a gift. Its location shifts from the imperial palace to Silius\'s possession, and its symbolic value transforms from a token of imperial affection to an emblem of Messalina\'s brazen betrayal and reckless extravagance in her affair.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_5'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, originally a gift from Claudius, is being removed from the wall by slaves under Messalina\'s orders. It serves as a pivotal symbol of her betrayal, as she intends to give it to Silius, highlighting her reckless abandonment of loyalty to her husband and the imperial decorum expected of her.',
        oi.status_before = 'The tapestry hangs prominently on the wall of Messalina\'s private suite, a beautiful representation of Claudius\'s affection and a symbol of their union.',
        oi.status_after = 'Following the event, the tapestry is no longer adorning the wall of the suite, having been taken away for delivery to Silius, marking a definitive act of betrayal against Claudius.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ornate_tapestry_event_8_6'})
    ON CREATE SET
        oi.description = 'The ornate tapestry, originally a gift from Emperor Claudius to Messalina, is being physically removed from the wall of Messalina\'s private suite by slaves under her direct orders. Messalina intends to present this tapestry to Gaius Silius as a gift, a bold and symbolic gesture of her affection and a deliberate act of defiance against Claudius. This act of re-gifting a present from her husband to her lover underscores her brazenness and utter contempt for Claudius\'s feelings and authority. Domitia immediately recognizes the tapestry and questions its removal, understanding its significance as a symbol of Claudius\'s favor and the implicit insult in gifting it to Silius.',
        oi.status_before = 'The ornate tapestry is hanging on the wall in Messalina\'s private suite, in good condition and acting as a decorative element of her luxurious chambers. It is a valuable object and a symbol of Claudius\'s favor and their (superficially) marital bond.',
        oi.status_after = 'The ornate tapestry is in the process of being removed from Messalina\'s suite and will be transported to Silius\'s villa to be given to him as a gift. Its status shifts from being a symbol of imperial favor and marital connection to becoming a potent symbol of Messalina\'s infidelity and defiance, now residing in the possession of her lover.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ornate_tapestry'})
    MATCH (e:Event {uuid: 'event_8_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Domitia enters the private suite, her eyes widening in alarm at the sight of slaves removing the ornate tapestry from the wall. She stands with her arms crossed, a posture exuding authority and concern, as she challenges the slaves\' actions and inquires about the tapestry\'s fate.',
        ap.emotional_state = 'Domitia\'s surface emotions reflect growing suspicion and disapproval as she confronts Messalina\'s reckless behavior. Internally, she feels a deep concern for her niece\'s well-being, as she recognizes the peril Messalina faces in her infatuation with Silius. This tension manifests in her stern tone and sharp questions, revealing her protective instincts and frustration with Messalina\'s choices.',
        ap.emotional_tags = ["domitia's surface emotions reflect growing suspicion", "disapproval as she confronts messalina's reckless behavior. internally, she feels a deep concern for her niece's well-being, as she recognizes the peril messalina faces in her infatuation with silius. this tension manifests in her stern tone", "sharp questions, revealing her protective instincts", "frustration with messalina's choices.", "domitia's surface emotions reflect growing suspicion and disapproval as she confronts messalina's reckless behavior. internally", "she feels a deep concern for her niece's well-being", "as she recognizes the peril messalina faces in her infatuation with silius. this tension manifests in her stern tone and sharp questions", "revealing her protective instincts and frustration with messalina's choices."],
        ap.active_plans = ["To uncover the truth behind Messalina's decision to remove the tapestry.", "To protect Messalina from potential backlash or danger stemming from her actions.", "To instill a sense of caution and responsibility in her niece regarding her relationship with Silius."],
        ap.beliefs = ["Loyalty and responsibility to family are paramount, especially in the dangerous political environment of Rome.", "Emotional decisions can lead to perilous consequences, particularly for women in their society.", "Tradition and decorum should be upheld, especially when it comes to matters of imperial favor."],
        ap.goals = ["Short-term: To understand why Messalina is giving away the tapestry and to prevent further reckless actions.", "Medium-term: To guide Messalina back to a path of prudence and dignity.", "Ultimate: To ensure the safety and reputation of her family amidst the treacherous politics of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s private suite and immediately notices slaves struggling to remove a large tapestry from the wall. Her attention is instantly drawn to this activity, and she directly intervenes, questioning the slaves and then Messalina herself about the removal and destination of the ornate object. She stands within the suite, her presence sharp and observant, demanding answers.',
        ap.emotional_state = 'Domitia is deeply concerned and suspicious, her surface emotions betraying a growing alarm at Messalina\'s actions. Beneath her outward questioning lies an internal state of apprehension and disapproval. She senses a dangerous recklessness in Messalina\'s behavior, fueled by her infatuation with Silius. Domitia\'s unspoken conflict stems from her familial duty clashing with her ingrained Roman sensibilities, creating a tension between protecting her niece and condemning her imprudence.',
        ap.emotional_tags = ["domitia is deeply concerned", "suspicious, her surface emotions betraying a growing alarm at messalina's actions. beneath her outward questioning lies an internal state of apprehension", "disapproval. she senses a dangerous recklessness in messalina's behavior, fueled by her infatuation with silius. domitia's unspoken conflict stems from her familial duty clashing with her ingrained roman sensibilities, creating a tension between protecting her niece", "condemning her imprudence.", "domitia is deeply concerned and suspicious", "her surface emotions betraying a growing alarm at messalina's actions. beneath her outward questioning lies an internal state of apprehension and disapproval. she senses a dangerous recklessness in messalina's behavior", "fueled by her infatuation with silius. domitia's unspoken conflict stems from her familial duty clashing with her ingrained roman sensibilities", "creating a tension between protecting her niece and condemning her imprudence."],
        ap.active_plans = ["To ascertain the reason for the tapestry's removal and its intended location, aiming to understand the immediate situation.", "To confront Messalina about the escalating recklessness of her affair and the potential repercussions of her actions on her life and status.", "To dissuade Messalina from further jeopardizing her position and the imperial family's reputation through impulsive and ill-considered actions, hoping to inject some sense of reason into her niece's infatuated mind."],
        ap.beliefs = ["Roman nobility, especially those of imperial rank, must adhere to strict standards of decorum and discretion to maintain social order and respect.", "Messalina's increasingly public and extravagant affair is a grave threat to her own safety and the stability of the imperial family, breaching acceptable boundaries of behavior.", "Gifts from the Emperor are not mere possessions but hold significant symbolic weight, representing imperial favor and loyalty, and should not be treated as trivial items to be given away on a whim, particularly to a lover."],
        ap.goals = ["Short-term Goal: To immediately uncover the truth behind the tapestry's removal and prevent any further impulsive actions by Messalina in this moment.", "Medium-term Goal: To make Messalina recognize the extreme danger she is courting and to convince her to exercise greater caution and restraint in her affair with Silius.", "Ultimate-term Goal: To safeguard the reputation of her family and prevent a catastrophic scandal that could destabilize the imperial household and lead to dire consequences for Messalina and potentially the entire Julio-Claudian lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Messalina enters the suite, exuding confidence and authority. She adjusts her hair with a practiced grace, her posture upright and commanding as she briskly directs the slaves to ensure the tapestry\'s safe removal, threatening punishment for any damage. Her movements are sharp and deliberate, embodying her impulsive yet controlling nature.',
        ap.emotional_state = 'Outwardly, Messalina radiates confidence and urgency, her voice laced with imperious command. Internally, however, a flicker of anxiety may lurk beneath her bravado, hinting at the consequences of her reckless choices. Her dismissive attitude toward Domitia\'s concerns implies a conflict between her desire for love and the precariousness of her position.',
        ap.emotional_tags = ["outwardly, messalina radiates confidence", "urgency, her voice laced with imperious command. internally, however, a flicker of anxiety may lurk beneath her bravado, hinting at the consequences of her reckless choices. her dismissive attitude toward domitia's concerns implies a conflict between her desire for love", "the precariousness of her position.", "outwardly", "messalina radiates confidence and urgency", "her voice laced with imperious command. internally", "however", "a flicker of anxiety may lurk beneath her bravado", "hinting at the consequences of her reckless choices. her dismissive attitude toward domitia's concerns implies a conflict between her desire for love and the precariousness of her position."],
        ap.active_plans = ["To assert her authority over the slaves and ensure the tapestry is removed without incident.", "To solidify her bond with Silius by gifting him the tapestry, reinforcing her impulsive romantic desires.", "To deflect Domitia's warnings and maintain control over her narrative, portraying her decisions as calculated rather than reckless."],
        ap.beliefs = ["Love justifies her actions, no matter how reckless or dangerous.", "Her beauty and influence can shield her from consequences.", "The tapestry's removal is a harmless act that symbolizes her commitment to Silius."],
        ap.goals = ["Short-term: Successfully gift the tapestry to Silius without its removal being discovered by Claudius.", "Medium-term: Cement her relationship with Silius to facilitate his divorce from his wife.", "Ultimate: Reclaim her personal agency and secure her position of power alongside Silius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Domitia stands in the suite with an expression of shock and concern, her sharp gaze fixed on the tapestry\'s removal. She remains poised, but her body language reflects tension as she questions Messalina\'s decisions, attempting to maintain a protective stance towards her niece amidst the chaos.',
        ap.emotional_state = 'Domitia\'s surface emotions reveal alarm and disbelief as she confronts Messalina\'s choices. Internally, she feels a profound sense of duty mixed with worry, recognizing the perilous path her niece is treading. There is a palpable conflict between her desire to shield Messalina and frustration at her reckless behavior.',
        ap.emotional_tags = ["domitia's surface emotions reveal alarm", "disbelief as she confronts messalina's choices. internally, she feels a profound sense of duty mixed with worry, recognizing the perilous path her niece is treading. there is a palpable conflict between her desire to shield messalina", "frustration at her reckless behavior.", "domitia's surface emotions reveal alarm and disbelief as she confronts messalina's choices. internally", "she feels a profound sense of duty mixed with worry", "recognizing the perilous path her niece is treading. there is a palpable conflict between her desire to shield messalina and frustration at her reckless behavior."],
        ap.active_plans = ["To challenge Messalina's decisions and urge her to reconsider the implications of her actions.", "To protect her niece from the consequences of her impulsiveness by questioning her judgment.", "To instill a sense of caution in Messalina, emphasizing the risks of her affair with Silius."],
        ap.beliefs = ["Family loyalty and tradition must be upheld, especially in turbulent times.", "Messalina\u2019s reckless pursuit of love threatens not only her safety but their family's reputation.", "Prudence and discretion are vital in the treacherous court of Rome."],
        ap.goals = ["Short-term: Convince Messalina to reconsider her impulsive decision to give away the tapestry.", "Medium-term: Reinforce the importance of discretion in her dealings with Silius.", "Ultimate: Ensure Messalina's safety and maintain the family's honor amidst the court's scrutiny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Messalina enters her private suite, observing slaves removing a large, ornate tapestry from the wall. She appears preoccupied with her appearance, adjusting her hair and giving instructions to her slave Iris regarding her hairdressing. She initially deflects Domitia\'s questions about the tapestry with impatience, focusing on ensuring its safe removal and delivery.',
        ap.emotional_state = 'On the surface, Messalina exudes an air of careless confidence and entitlement, dismissing Domitia\'s probing questions with flippancy. However, beneath this facade lies a passionate obsession with Silius and a desire to flaunt her affair. There is a tension between her outward nonchalance and the inherently risky nature of her actions, suggesting a possible suppression of underlying anxiety. She is driven by lust and a need for validation, fuelled by boredom and a craving for forbidden thrills.',
        ap.emotional_tags = ["on the surface, messalina exudes an air of careless confidence", "entitlement, dismissing domitia's probing questions with flippancy. however, beneath this facade lies a passionate obsession with silius", "a desire to flaunt her affair. there is a tension between her outward nonchalance", "the inherently risky nature of her actions, suggesting a possible suppression of underlying anxiety. she is driven by lust", "a need for validation, fuelled by boredom", "a craving for forbidden thrills.", "on the surface", "messalina exudes an air of careless confidence and entitlement", "dismissing domitia's probing questions with flippancy. however", "beneath this facade lies a passionate obsession with silius and a desire to flaunt her affair. there is a tension between her outward nonchalance and the inherently risky nature of her actions", "suggesting a possible suppression of underlying anxiety. she is driven by lust and a need for validation", "fuelled by boredom and a craving for forbidden thrills."],
        ap.active_plans = ["Gift the ornate tapestry to Gaius Silius as a romantic present.", "Dismiss Domitia's increasingly concerned questions and warnings.", "Prepare her appearance and ensure her hair is styled to her liking."],
        ap.beliefs = ["Her intense love for Silius justifies any action, regardless of social or imperial consequences.", "Her position as Empress grants her immunity from repercussions and allows her to act with impunity.", "Claudius is oblivious and weak, unlikely to notice or care about her extravagant gifts or blatant infidelity."],
        ap.goals = ["short_term\": \"Successfully deliver the tapestry to Silius as a grand romantic gesture.", "medium_term\": \"Solidify her bond with Silius and deepen their illicit relationship, pushing boundaries further.", "ultimate\": \"Possess Silius exclusively, potentially aiming to supplant Claudius and seize power with Silius (implied, not explicitly stated in this scene)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s private suite and immediately notices the slaves removing the ornate tapestry. She sharply questions them and then confronts Messalina directly, her posture and tone conveying growing alarm and disapproval. She persists with her questioning, undeterred by Messalina\'s attempts to brush her off, indicating her determination to understand and intervene.',
        ap.emotional_state = 'Domitia is initially surprised and inquisitive upon seeing the tapestry being moved, quickly transitioning to alarm and stern disapproval as Messalina reveals her intentions. Her surface emotions are marked by sharp concern and moral outrage, evident in her direct and increasingly urgent questioning. Internally, she is likely experiencing a mix of fear for Messalina\'s reckless endangerment and outrage at her niece\'s blatant disregard for Roman values and imperial decorum. She is motivated by a sense of familial duty and a rigid adherence to traditional Roman propriety.',
        ap.emotional_tags = ["domitia is initially surprised", "inquisitive upon seeing the tapestry being moved, quickly transitioning to alarm", "stern disapproval as messalina reveals her intentions. her surface emotions are marked by sharp concern", "moral outrage, evident in her direct", "increasingly urgent questioning. internally, she is likely experiencing a mix of fear for messalina's reckless endangerment", "outrage at her niece's blatant disregard for roman values", "imperial decorum. she is motivated by a sense of familial duty", "a rigid adherence to traditional roman propriety.", "domitia is initially surprised and inquisitive upon seeing the tapestry being moved", "quickly transitioning to alarm and stern disapproval as messalina reveals her intentions. her surface emotions are marked by sharp concern and moral outrage", "evident in her direct and increasingly urgent questioning. internally", "she is likely experiencing a mix of fear for messalina's reckless endangerment and outrage at her niece's blatant disregard for roman values and imperial decorum. she is motivated by a sense of familial duty and a rigid adherence to traditional roman propriety."],
        ap.active_plans = ["Determine the reason for the tapestry's removal and its destination.", "Warn Messalina about the perilous nature of her actions and the escalating scandal.", "Persuade Messalina to reconsider her reckless behaviour and the potential consequences."],
        ap.beliefs = ["Messalina's affair has spiralled out of control and her actions are dangerously provocative.", "Messalina's infatuation with Silius has blinded her to reason and prudence, leading her to act foolishly.", "Roman society and imperial authority demand discretion and adherence to established norms, which Messalina is flagrantly violating, risking severe repercussions."],
        ap.goals = ["short_term\": \"Force Messalina to acknowledge the danger she is in and the gravity of her actions.", "medium_term\": \"Instill some sense of caution and discretion in Messalina to mitigate the immediate risks of her affair.", "ultimate\": \"Prevent Messalina from destroying herself and bringing shame and ruin upon their family and potentially the imperial lineage through her scandalous behaviour."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Domitia stands in Messalina\'s private suite, eyes widening in shock as she witnesses the removal of the ornate tapestry. Her posture reflects disbelief and concern, arms crossed tightly against her chest, as she confronts her niece about the implications of her actions.',
        ap.emotional_state = 'Domitia\'s surface emotions are a blend of incredulity and reproach, her brows furrowed and voice tinged with urgency. Internally, she wrestles with a profound sense of loyalty to family, battling the fear that Messalina\'s reckless actions could lead to dire consequences for both of them. The tension between her protective instincts and the reality of their situation underscores her conflict.',
        ap.emotional_tags = ["domitia's surface emotions are a blend of incredulity", "reproach, her brows furrowed", "voice tinged with urgency. internally, she wrestles with a profound sense of loyalty to family, battling the fear that messalina's reckless actions could lead to dire consequences for both of them. the tension between her protective instincts", "the reality of their situation underscores her conflict.", "domitia's surface emotions are a blend of incredulity and reproach", "her brows furrowed and voice tinged with urgency. internally", "she wrestles with a profound sense of loyalty to family", "battling the fear that messalina's reckless actions could lead to dire consequences for both of them. the tension between her protective instincts and the reality of their situation underscores her conflict."],
        ap.active_plans = ["To confront Messalina about the tapestry and its implications.", "To urge Messalina to reconsider her impulsive actions and their potential fallout.", "To protect her family's reputation in light of Messalina's behavior."],
        ap.beliefs = ["Loyalty to family and the importance of maintaining honor in the eyes of Rome.", "The belief that Messalina's reckless actions endanger their lives and status.", "An understanding that love can be both a blessing and a curse, particularly in the political landscape of Rome."],
        ap.goals = ["Short-term: To prevent Messalina from gifting the tapestry to Silius.", "Medium-term: To persuade Messalina to demonstrate discretion in her love life.", "Ultimate: To safeguard their family's honor and well-being amidst the chaos of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Messalina enters her private suite with a confident stride, adjusting her hair, exuding a blend of excitement and defiance as she commands the slaves to hurry with the tapestry. Her body language is lively, arms gesturing animatedly as she insists on her decision to gift the tapestry to Silius.',
        ap.emotional_state = 'Messalina projects an air of boldness and desire, her tone laced with enthusiasm. However, beneath this bravado lies a deep-seated anxiety as she grapples with the ramifications of her choices. There is a tension between her impulsive love for Silius and the stark reality of her position as the Empress, revealing an internal conflict that threatens to unravel her confidence.',
        ap.emotional_tags = ["messalina projects an air of boldness", "desire, her tone laced with enthusiasm. however, beneath this bravado lies a deep-seated anxiety as she grapples with the ramifications of her choices. there is a tension between her impulsive love for silius", "the stark reality of her position as the empress, revealing an internal conflict that threatens to unravel her confidence.", "messalina projects an air of boldness and desire", "her tone laced with enthusiasm. however", "beneath this bravado lies a deep-seated anxiety as she grapples with the ramifications of her choices. there is a tension between her impulsive love for silius and the stark reality of her position as the empress", "revealing an internal conflict that threatens to unravel her confidence."],
        ap.active_plans = ["To present the tapestry to Silius as a symbol of her affection.", "To maintain the facade of confidence despite potential consequences.", "To dismiss any concerns about her actions, reinforcing her determination to pursue her desires."],
        ap.beliefs = ["That love justifies any actions, including defying her marital vows.", "The conviction that her affair with Silius will lead to a happier life.", "A belief that she can navigate and manipulate the dangerous political waters of Rome without facing repercussions."],
        ap.goals = ["Short-term: To successfully gift the tapestry to Silius without drawing suspicion.", "Medium-term: To solidify her relationship with Silius by expressing her love through lavish gifts.", "Ultimate: To escape the confines of her marriage to Claudius and embrace her passion with Silius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Messalina is in her private suite, directing slaves to remove a large, ornate tapestry from the wall. She is focused on ensuring the tapestry is handled carefully, issuing instructions with an air of impatience and entitlement. She then calls for her hair to be dressed, multitasking her imperial duties with personal vanities.',
        ap.emotional_state = 'On the surface, Messalina is supremely confident and dismissive, exhibiting impatience and a commanding tone. She outwardly projects an image of being completely in control and unaffected by Domitia\'s concerns. Beneath this facade, she is driven by a potent mix of infatuation with Silius and a reckless desire to assert her will, even to the point of extreme indiscretion. There\'s a palpable undercurrent of defiance and a dangerous disregard for the potential consequences of her actions, fueled by her passionate obsession.',
        ap.emotional_tags = ["on the surface, messalina is supremely confident", "dismissive, exhibiting impatience", "a commanding tone. she outwardly projects an image of being completely in control", "unaffected by domitia's concerns. beneath this facade, she is driven by a potent mix of infatuation with silius", "a reckless desire to assert her will, even to the point of extreme indiscretion. there's a palpable undercurrent of defiance", "a dangerous disregard for the potential consequences of her actions, fueled by her passionate obsession.", "on the surface", "messalina is supremely confident and dismissive", "exhibiting impatience and a commanding tone. she outwardly projects an image of being completely in control and unaffected by domitia's concerns. beneath this facade", "she is driven by a potent mix of infatuation with silius and a reckless desire to assert her will", "even to the point of extreme indiscretion. there's a palpable undercurrent of defiance and a dangerous disregard for the potential consequences of her actions", "fueled by her passionate obsession."],
        ap.active_plans = ["Gift the ornate tapestry to Silius as a grand romantic gesture to solidify their bond and demonstrate her devotion.", "Dismiss and belittle Domitia's warnings and concerns, maintaining an image of invulnerability and control over the situation.", "Continue to publicly flaunt her affair with Silius, disregarding social norms and imperial expectations, reinforcing her rebellious stance."],
        ap.beliefs = ["Her intense love for Silius justifies any action, superseding marital vows, imperial decorum, and common sense.", "She is powerful enough to manipulate any situation and evade any negative repercussions from her scandalous behavior.", "Claudius is weak, ineffectual, and easily deceived, posing no real threat to her desires or actions."],
        ap.goals = ["Short-term: To please Silius and express the depth of her feelings through a lavish and meaningful gift.", "Medium-term: To secure Silius's unwavering love and loyalty, ensuring her position in his life above all others.", "Ultimate: To live a life unconstrained by her marriage to Claudius, pursuing her passions and desires without limitation, potentially envisioning a future where she and Silius rule together."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s private suite and immediately notices the slaves removing the ornate tapestry. She expresses her surprise and concern, questioning the slaves and then directly challenging Messalina about her actions. Domitia is attempting to reason with Messalina, highlighting the recklessness and potential danger of her behavior.',
        ap.emotional_state = 'Domitia is initially surprised and then swiftly transitions to a state of deep concern and disapproval. Her outward emotions are marked by sharp questioning and increasingly urgent warnings, reflecting her mounting alarm at Messalina\'s actions. Internally, she is grappling with a mixture of fear for Messalina\'s safety and exasperation at her niece\'s blatant disregard for prudence.  She is driven by a sense of duty to protect Messalina from self-destruction and a strong adherence to traditional Roman values of discretion and propriety.',
        ap.emotional_tags = ["domitia is initially surprised", "then swiftly transitions to a state of deep concern", "disapproval. her outward emotions are marked by sharp questioning", "increasingly urgent warnings, reflecting her mounting alarm at messalina's actions. internally, she is grappling with a mixture of fear for messalina's safety", "exasperation at her niece's blatant disregard for prudence.  she is driven by a sense of duty to protect messalina from self-destruction", "a strong adherence to traditional roman values of discretion", "propriety.", "domitia is initially surprised and then swiftly transitions to a state of deep concern and disapproval. her outward emotions are marked by sharp questioning and increasingly urgent warnings", "reflecting her mounting alarm at messalina's actions. internally", "she is grappling with a mixture of fear for messalina's safety and exasperation at her niece's blatant disregard for prudence.  she is driven by a sense of duty to protect messalina from self-destruction and a strong adherence to traditional roman values of discretion and propriety."],
        ap.active_plans = ["Investigate the purpose behind the tapestry's removal, seeking clarity on Messalina's intentions.", "Alert Messalina to the extreme danger of her actions, emphasizing the social and political ramifications of her public affair.", "Appeal to Messalina's sense of reason and self-preservation, urging her to exercise restraint and reconsider her reckless course of action."],
        ap.beliefs = ["Reckless actions inevitably lead to severe consequences, and Messalina is treading a path towards disaster.", "Maintaining social decorum and discretion is paramount, especially for someone of Messalina's imperial standing.", "Messalina's infatuation is blinding her to the very real and present dangers she is creating for herself and her position."],
        ap.goals = ["Short-term: To halt the immediate act of gifting the tapestry, preventing this blatant act of indiscretion.", "Medium-term: To make Messalina understand the gravity of her situation, breaking through her denial and infatuation.", "Ultimate: To protect Messalina from utter ruin, preserving her life and whatever shred of dignity remains, even if it requires delivering harsh truths and confronting her niece's dangerous delusions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_7'})
    ON CREATE SET
        ap.current_status = 'Domitia stands in Messalina\'s private suite, eyes widening in disbelief as she observes the slaves removing the ornate tapestry. She confronts Messalina with an urgent tone, her posture rigid, reflecting her alarm and concern.',
        ap.emotional_state = 'Domitia\'s surface emotions are characterized by alarm and disbelief. Her furrowed brow and sharp tone indicate a profound concern for Messalina\'s well-being. Internally, she is grappling with a sense of dread, fearing for her niece’s safety as she realizes the extent of Messalina\'s recklessness. The juxtaposition of her urgent pleas against Messalina\'s cavalier attitude reveals a deep-seated conflict between familial loyalty and the horror of impending disgrace.',
        ap.emotional_tags = ["domitia's surface emotions are characterized by alarm", "disbelief. her furrowed brow", "sharp tone indicate a profound concern for messalina's well-being. internally, she is grappling with a sense of dread, fearing for her niece\u2019s safety as she realizes the extent of messalina's recklessness. the juxtaposition of her urgent pleas against messalina's cavalier attitude reveals a deep-seated conflict between familial loyalty", "the horror of impending disgrace.", "domitia's surface emotions are characterized by alarm and disbelief. her furrowed brow and sharp tone indicate a profound concern for messalina's well-being. internally", "she is grappling with a sense of dread", "fearing for her niece\u2019s safety as she realizes the extent of messalina's recklessness. the juxtaposition of her urgent pleas against messalina's cavalier attitude reveals a deep-seated conflict between familial loyalty and the horror of impending disgrace."],
        ap.active_plans = ["To dissuade Messalina from her reckless actions and return to a state of prudence.", "To make Messalina aware of the grave dangers her actions are courting within the court.", "To protect the family's reputation and Messalina's future by urging caution and discretion."],
        ap.beliefs = ["Family honor must be preserved at all costs, and reckless actions could lead to disgrace.", "Loyalty to one's family is paramount, and it is her duty to guide Messalina away from danger.", "Romantic infatuations should not take precedence over familial obligations and political realities."],
        ap.goals = ["Short-term: To convince Messalina to reconsider her decision regarding the tapestry and the gifts to Silius.", "Medium-term: To ensure that Messalina maintains discretion in her romantic liaisons and does not attract scandal.", "Ultimate: To protect Messalina from the potential consequences of her actions and preserve their family's standing in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_7'})
    ON CREATE SET
        ap.current_status = 'Messalina enters her private suite, adjusting her hair with an air of confidence and determination. She briskly commands the slaves to expedite the removal of the tapestry, her posture reflecting impatience and defiance.',
        ap.emotional_state = 'Messalina\'s outward demeanor is one of boldness and impulsive excitement, underscored by her insistence on gifting the tapestry to Silius. Internally, however, she experiences a conflict between her desire for romantic fulfillment and the looming threat of scandal. Her dismissal of Domitia\'s concerns reveals a deeper denial regarding the precariousness of her situation, indicating a troubling disconnect between her desires and the potential consequences.',
        ap.emotional_tags = ["messalina's outward demeanor is one of boldness", "impulsive excitement, underscored by her insistence on gifting the tapestry to silius. internally, however, she experiences a conflict between her desire for romantic fulfillment", "the looming threat of scandal. her dismissal of domitia's concerns reveals a deeper denial regarding the precariousness of her situation, indicating a troubling disconnect between her desires", "the potential consequences.", "messalina's outward demeanor is one of boldness and impulsive excitement", "underscored by her insistence on gifting the tapestry to silius. internally", "however", "she experiences a conflict between her desire for romantic fulfillment and the looming threat of scandal. her dismissal of domitia's concerns reveals a deeper denial regarding the precariousness of her situation", "indicating a troubling disconnect between her desires and the potential consequences."],
        ap.active_plans = ["To assert her affection for Silius by bestowing the tapestry, solidifying her bond with him.", "To navigate and manipulate the situation so that her actions do not lead to repercussions from Claudius or the court.", "To maintain an illusion of control and confidence despite the risks involved in her actions."],
        ap.beliefs = ["Love is worth any risk, even if it means jeopardizing her position and safety.", "Imperial gifts can solidify alliances and romantic connections, demonstrating her power and influence.", "Denial of her precarious situation allows her to pursue her desires without succumbing to fear."],
        ap.goals = ["Short-term: To surprise Silius with the tapestry, affirming her love and deepening their connection.", "Medium-term: To navigate her relationship with Silius while managing the fallout of her actions in court.", "Ultimate: To secure Silius's loyalty and affection, potentially leading to a separation from Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_8'})
    ON CREATE SET
        ap.current_status = 'Messalina stands in her opulent private suite, overseeing slaves as they remove a large tapestry from the wall. She is actively directing the servants, focused on the task at hand and ensuring the tapestry is handled with utmost care, revealing a possessive nature even when gifting items away. Her posture is likely confident and commanding, accustomed to being obeyed and unfazed by the unusual activity.',
        ap.emotional_state = 'On the surface, Messalina exudes a sense of giddy infatuation and arrogant confidence. She openly declares her love for Silius, dismissing Domitia\'s concerns with a wave of hand. However, beneath this facade of bravado, there\'s a hint of reckless abandon and perhaps a willful blindness to the true danger she is in. Her impulsivity and passionate nature are driving her actions, overriding any rational thought or concern for consequences. She seems to be reveling in the drama and forbidden thrill of her affair.',
        ap.emotional_tags = ["on the surface, messalina exudes a sense of giddy infatuation", "arrogant confidence. she openly declares her love for silius, dismissing domitia's concerns with a wave of hand. however, beneath this facade of bravado, there's a hint of reckless abandon", "perhaps a willful blindness to the true danger she is in. her impulsivity", "passionate nature are driving her actions, overriding any rational thought or concern for consequences. she seems to be reveling in the drama", "forbidden thrill of her affair.", "on the surface", "messalina exudes a sense of giddy infatuation and arrogant confidence. she openly declares her love for silius", "dismissing domitia's concerns with a wave of hand. however", "beneath this facade of bravado", "there's a hint of reckless abandon and perhaps a willful blindness to the true danger she is in. her impulsivity and passionate nature are driving her actions", "overriding any rational thought or concern for consequences. she seems to be reveling in the drama and forbidden thrill of her affair."],
        ap.active_plans = ["Gift the ornate tapestry, a present from her husband Claudius, to her lover Silius as a grand gesture of affection.", "Continue her open and scandalous affair with Gaius Silius, disregarding social norms and imperial expectations.", "Dismiss all warnings and concerns raised by Domitia and others, maintaining her delusion of invincibility and control over the situation."],
        ap.beliefs = ["Her intense love for Silius justifies any action, regardless of its impropriety or potential danger.", "As Empress, she is above the rules and consequences that apply to others, believing in her untouchable status.", "She can manipulate and control any situation through her charm and will, remaining confident in her ability to manage the fallout from her reckless behavior."],
        ap.goals = ["short-term\": \"To please Silius and deepen his affection through extravagant gifts, specifically the tapestry.", "medium-term\": \"To solidify her passionate relationship with Silius, potentially leading to him divorcing his wife to be fully available to her.", "ultimate\": \"To live a life dictated by her desires and passions, free from constraints, possibly envisioning a future where her love for Silius is publicly acknowledged and celebrated, even if it means defying Claudius and Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_8'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s private suite and is immediately struck by the sight of slaves removing a large tapestry. She stands observing the scene with growing alarm and disapproval. Her posture is likely rigid and concerned as she questions the slaves and then confronts Messalina directly, seeking answers and attempting to intervene in what she perceives as reckless behavior.',
        ap.emotional_state = 'Domitia is deeply worried and disapproving of Messalina\'s actions. Her tone is sharp and laced with concern, reflecting her fear for Messalina\'s safety and reputation. She is frustrated and possibly angered by Messalina\'s blatant disregard for reason and discretion. Beneath her outward sternness, there is a genuine concern for her niece, stemming from a sense of duty and a traditional Roman understanding of propriety and the dangers of unchecked passions in the treacherous world of the imperial court.',
        ap.emotional_tags = ["domitia is deeply worried", "disapproving of messalina's actions. her tone is sharp", "laced with concern, reflecting her fear for messalina's safety", "reputation. she is frustrated", "possibly angered by messalina's blatant disregard for reason", "discretion. beneath her outward sternness, there is a genuine concern for her niece, stemming from a sense of duty", "a traditional roman understanding of propriety", "the dangers of unchecked passions in the treacherous world of the imperial court.", "domitia is deeply worried and disapproving of messalina's actions. her tone is sharp and laced with concern", "reflecting her fear for messalina's safety and reputation. she is frustrated and possibly angered by messalina's blatant disregard for reason and discretion. beneath her outward sternness", "there is a genuine concern for her niece", "stemming from a sense of duty and a traditional roman understanding of propriety and the dangers of unchecked passions in the treacherous world of the imperial court."],
        ap.active_plans = ["To understand the reason behind the removal of the tapestry and its destination, seeking to uncover the extent of Messalina's imprudence.", "To warn Messalina about the severe risks associated with her open affair and extravagant gifts to Silius, emphasizing the political and social ramifications.", "To appeal to Messalina's sense of reason and self-preservation, attempting to dissuade her from continuing down this dangerous path and urging her towards more discreet behavior."],
        ap.beliefs = ["Messalina's current behavior is dangerously reckless and will inevitably lead to dire consequences, jeopardizing her life and position.", "Discretion and adherence to Roman social norms are paramount for survival and maintaining status within the imperial court.", "Love and passion, while understandable, cannot justify such blatant disregard for duty, political reality, and the potential for imperial wrath."],
        ap.goals = ["short-term\": \"To halt the removal of the tapestry or at least understand the immediate purpose behind it, hoping to prevent this specific act of indiscretion.", "medium-term\": \"To convince Messalina to reconsider her affair and adopt a more cautious approach, urging her to prioritize her safety and imperial standing.", "ultimate\": \"To protect Messalina from the catastrophic fallout of her actions, potentially saving her from ruin and preserving what remains of her dignity and position within Roman society, though she recognizes the situation is rapidly spiraling out of control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_9'})
    ON CREATE SET
        ap.current_status = 'Domitia stands in the private suite, her expression a mix of alarm and incredulity as she witnesses the tapestry being removed. She gestures emphatically, her body language radiating concern as she confronts Messalina about the implications of her actions. Domitia\'s posture is rigid, her brow furrowed, emphasizing her disapproval and urgency.',
        ap.emotional_state = 'Domitia is deeply troubled, her surface emotions reflecting a fierce protectiveness over Messalina. Internally, she wrestles with fear and disappointment, recognizing the potential fallout of Messalina\'s reckless choices. There\'s a palpable tension between her desire to guide her niece and her frustration at Messalina\'s impulsiveness, revealing an underlying conflict between familial loyalty and moral duty.',
        ap.emotional_tags = ["domitia is deeply troubled, her surface emotions reflecting a fierce protectiveness over messalina. internally, she wrestles with fear", "disappointment, recognizing the potential fallout of messalina's reckless choices. there's a palpable tension between her desire to guide her niece", "her frustration at messalina's impulsiveness, revealing an underlying conflict between familial loyalty", "moral duty.", "domitia is deeply troubled", "her surface emotions reflecting a fierce protectiveness over messalina. internally", "she wrestles with fear and disappointment", "recognizing the potential fallout of messalina's reckless choices. there's a palpable tension between her desire to guide her niece and her frustration at messalina's impulsiveness", "revealing an underlying conflict between familial loyalty and moral duty."],
        ap.active_plans = ["To prevent Messalina from further jeopardizing her safety and reputation.", "To convince Messalina to reconsider her relationship with Silius and the public scandal it brings.", "To remind Messalina of the political ramifications of her actions and the danger they pose to her life."],
        ap.beliefs = ["She believes in the importance of maintaining discretion and dignity as a Roman woman.", "She is convinced that reckless ambition can lead to ruin, especially for women in their society.", "She trusts in the traditional values of Roman nobility, which emphasize loyalty and caution."],
        ap.goals = ["Short-term: To halt the removal of the tapestry and protect Messalina's reputation.", "Medium-term: To persuade Messalina to act with more caution in her affair with Silius.", "Ultimate: To ensure Messalina's safety and well-being by instilling a sense of prudence in her actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_9'})
    ON CREATE SET
        ap.current_status = 'Messalina enters with an air of impulsiveness, adjusting her hair as she commands the slaves regarding the tapestry. Her movements are swift and confident, yet there is an undercurrent of frantic energy as she directs others. Her demeanor conveys a sense of urgency, masking the turmoil beneath her surface.',
        ap.emotional_state = 'Messalina exudes a facade of control, masking deeper feelings of vulnerability and defiance. Externally, she projects confidence and excitement about her relationship with Silius, but internally, she grapples with fear of exposure and potential repercussions. Her determination clashes with the reality of her precarious situation, reflecting a conflict between her desires and the looming threat of public scandal.',
        ap.emotional_tags = ["messalina exudes a facade of control, masking deeper feelings of vulnerability", "defiance. externally, she projects confidence", "excitement about her relationship with silius, but internally, she grapples with fear of exposure", "potential repercussions. her determination clashes with the reality of her precarious situation, reflecting a conflict between her desires", "the looming threat of public scandal.", "messalina exudes a facade of control", "masking deeper feelings of vulnerability and defiance. externally", "she projects confidence and excitement about her relationship with silius", "but internally", "she grapples with fear of exposure and potential repercussions. her determination clashes with the reality of her precarious situation", "reflecting a conflict between her desires and the looming threat of public scandal.", "messalina exudes a facade of control, masking deeper feelings of vulnerability and defiance. externally, she projects confidence and excitement about her relationship with silius,", "internally, she grapples with fear of exposure and potential repercussions. her determination clashes with the reality of her precarious situation, reflecting a conflict between her desires and the looming threat of public scandal."],
        ap.active_plans = ["To surprise Silius with the tapestry as a gesture of affection, demonstrating her commitment.", "To maintain the facade of discretion while indulging in her passion for Silius.", "To dismiss any concerns about her relationship and assert her agency over her desires."],
        ap.beliefs = ["She believes that love justifies her actions, regardless of the potential consequences.", "She has a conviction that her social status allows her to navigate the risks of her affair with Silius.", "She is convinced that her feelings for Silius are genuine and worthy of any sacrifice, including her safety."],
        ap.goals = ["Short-term: To successfully gift the tapestry to Silius without drawing attention.", "Medium-term: To solidify her relationship with Silius and secure his affection.", "Ultimate: To eventually marry Silius and escape the constraints of her marriage to Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_10'})
    ON CREATE SET
        ap.current_status = 'Messalina breezes into her private suite, seemingly unfazed by the removal of the large tapestry. She directs the slaves with an air of casual command, her focus on the practicalities of the task and her appearance, adjusting her hair and calling for her hairdresser, Iris, moments later. She moves with the confidence of someone accustomed to getting her way, oblivious to the gravity of her actions.',
        ap.emotional_state = 'On the surface, Messalina projects an air of giddy infatuation and defiant joy. She seems genuinely thrilled by Silius\'s devotion and revels in the scandal she\'s creating. However, beneath this bravado, there\'s a hint of insecurity and a need for validation. Her insistence on Silius\'s love being the sole reason for the divorce suggests a desire to convince herself and Domitia of the affair\'s significance, masking any underlying anxiety about the potential fallout.',
        ap.emotional_tags = ["on the surface, messalina projects an air of giddy infatuation", "defiant joy. she seems genuinely thrilled by silius's devotion", "revels in the scandal she's creating. however, beneath this bravado, there's a hint of insecurity", "a need for validation. her insistence on silius's love being the sole reason for the divorce suggests a desire to convince herself", "domitia of the affair's significance, masking any underlying anxiety about the potential fallout.", "on the surface", "messalina projects an air of giddy infatuation and defiant joy. she seems genuinely thrilled by silius's devotion and revels in the scandal she's creating. however", "beneath this bravado", "there's a hint of insecurity and a need for validation. her insistence on silius's love being the sole reason for the divorce suggests a desire to convince herself and domitia of the affair's significance", "masking any underlying anxiety about the potential fallout."],
        ap.active_plans = ["Gift the tapestry to Silius as a grand romantic gesture to solidify his affection and demonstrate her power.", "Dismiss Domitia's concerns and criticisms, maintaining a facade of carefree love and unwavering confidence.", "Further publicize her affair with Silius by flaunting her gifts and his actions, reinforcing her image as desirable and untouchable."],
        ap.beliefs = ["Silius's love for her is genuine and all-consuming, justifying any action she takes.", "Her beauty and allure are irresistible, granting her the power to bend others to her will.", "She is above the conventional rules and consequences that apply to others due to her imperial status and perceived power."],
        ap.goals = ["Short-term: Ensure the tapestry reaches Silius in perfect condition to impress him and solidify her romantic narrative.", "Medium-term: Cement her relationship with Silius, driving him further away from his wife and deeper into her orbit.", "Ultimate:  To live a life unbound by societal expectations and imperial constraints, prioritizing personal desires and romantic fulfillment above all else, potentially even envisioning a future with Silius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_10'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s suite and immediately observes the slaves removing the tapestry. She questions them directly and then confronts Messalina with sharp, concerned questions, her posture and tone reflecting disapproval and mounting alarm. She stands as a stark contrast to Messalina\'s flippant attitude, embodying a sense of Roman severity and traditional values.',
        ap.emotional_state = 'Domitia is deeply worried and disapproving. Her surface emotions are evident in her sharp tone and questioning manner, revealing her concern for Messalina\'s reckless behavior. Internally, she is likely experiencing a mix of frustration, exasperation, and fear for Messalina\'s safety and the family\'s reputation. There\'s a conflict between her familial duty to advise and protect Messalina and her moral outrage at her niece\'s scandalous conduct, creating a tense and disapproving atmosphere.',
        ap.emotional_tags = ["domitia is deeply worried", "disapproving. her surface emotions are evident in her sharp tone", "questioning manner, revealing her concern for messalina's reckless behavior. internally, she is likely experiencing a mix of frustration, exasperation,", "fear for messalina's safety", "the family's reputation. there's a conflict between her familial duty to advise", "protect messalina", "her moral outrage at her niece's scandalous conduct, creating a tense", "disapproving atmosphere.", "domitia is deeply worried and disapproving. her surface emotions are evident in her sharp tone and questioning manner", "revealing her concern for messalina's reckless behavior. internally", "she is likely experiencing a mix of frustration", "exasperation", "and fear for messalina's safety and the family's reputation. there's a conflict between her familial duty to advise and protect messalina and her moral outrage at her niece's scandalous conduct", "creating a tense and disapproving atmosphere."],
        ap.active_plans = ["Understand the purpose of the tapestry removal and where it's being taken, seeking to uncover the extent of Messalina's recklessness.", "Warn Messalina about the grave danger she is placing herself in through her indiscreet affair and extravagant gifts to Silius.", "Appeal to Messalina's sense of reason and self-preservation, attempting to dissuade her from further scandalous actions before it's too late."],
        ap.beliefs = ["Messalina's actions are dangerously impulsive and lack any sense of discretion, jeopardizing her position and life.", "Public perception and maintaining appearances are crucial for survival and stability in Roman society, especially for someone of Messalina's status.", "Love and passion should be tempered with reason and caution, not pursued at the expense of one's safety and reputation."],
        ap.goals = ["Short-term: To halt the removal of the tapestry and prevent Messalina from giving away more imperial possessions.", "Medium-term: To make Messalina understand the gravity of her situation and the potential consequences of her affair.", "Ultimate: To salvage Messalina's reputation and prevent a catastrophic downfall, protecting the family's honor and standing in Rome, even if it means facing harsh truths."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_11'})
    ON CREATE SET
        ap.current_status = 'Domitia stands firmly in the middle of Messalina\'s private suite, her posture rigid and authoritative as she watches the slaves remove the ornate tapestry. She approaches with a look of incredulity and concern, her body language reflecting her disapproval as she interrogates her niece about the tapestry\'s removal and its implications.',
        ap.emotional_state = 'Domitia exudes a mixture of exasperation and concern, her brows furrowed in worry. Outwardly, she expresses incredulity at Messalina\'s reckless behavior, yet internally, she is terrified for her niece\'s safety and reputation, grappling with the chaotic implications of Messalina\'s impulsive decisions. Her protective instincts clash with the harsh realities of Messalina\'s choices.',
        ap.emotional_tags = ["domitia exudes a mixture of exasperation", "concern, her brows furrowed in worry. outwardly, she expresses incredulity at messalina's reckless behavior, yet internally, she is terrified for her niece's safety", "reputation, grappling with the chaotic implications of messalina's impulsive decisions. her protective instincts clash with the harsh realities of messalina's choices.", "domitia exudes a mixture of exasperation and concern", "her brows furrowed in worry. outwardly", "she expresses incredulity at messalina's reckless behavior", "yet internally", "she is terrified for her niece's safety and reputation", "grappling with the chaotic implications of messalina's impulsive decisions. her protective instincts clash with the harsh realities of messalina's choices."],
        ap.active_plans = ["To challenge Messalina's reckless decisions regarding her gifts to Silius.", "To remind Messalina of the dangers of her infatuation and the implications it has on her status.", "To seek clarity on the legitimacy of Silius's divorce and how it affects Messalina's own marriage."],
        ap.beliefs = ["Family honor must be upheld, and reckless actions can lead to disgrace.", "Love should not eclipse reason or lead to dangerous decisions.", "The societal and legal complexities of Roman marriage are paramount and cannot be ignored."],
        ap.goals = ["Short-term: To persuade Messalina to reconsider her rash actions.", "Medium-term: To safeguard Messalina's standing in Roman society and her personal safety.", "Ultimate: To restore a sense of order and rationality in Messalina's life, ensuring the family's legacy remains intact amidst chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_11'})
    ON CREATE SET
        ap.current_status = 'Messalina enters her private suite with a confident stride, adjusting her hair and emanating an air of impulsive determination. She hurries the slaves to remove the tapestry, her gestures sharp and insistent, betraying an urgency and excitement about her plans to gift it to Silius.',
        ap.emotional_state = 'Messalina displays a facade of confidence and excitement as she discusses her plans with Domitia; however, underneath lies a tumult of reckless passion, defiance, and an undercurrent of fear regarding the potential consequences of her actions. Her bravado masks a growing desperation as she risks everything for her love for Silius, despite the looming specter of her marriage to Claudius.',
        ap.emotional_tags = ["messalina displays a facade of confidence", "excitement as she discusses her plans with domitia; however, underneath lies a tumult of reckless passion, defiance,", "an undercurrent of fear regarding the potential consequences of her actions. her bravado masks a growing desperation as she risks everything for her love for silius, despite the looming specter of her marriage to claudius.", "messalina displays a facade of confidence and excitement as she discusses her plans with domitia; however", "underneath lies a tumult of reckless passion", "defiance", "and an undercurrent of fear regarding the potential consequences of her actions. her bravado masks a growing desperation as she risks everything for her love for silius", "despite the looming specter of her marriage to claudius.", "messalina displays a facade of confidence and excitement as she discusses her plans with domitia", "however, underneath lies a tumult of reckless passion, defiance, and an undercurrent of fear regarding the potential consequences of her actions. her bravado masks a growing desperation as she risks everything for her love for silius, despite the looming specter of her marriage to claudius."],
        ap.active_plans = ["To gift the tapestry to Silius as a sign of her affection and commitment.", "To maintain her romantic connection with Silius, despite the risks involved.", "To assert her independence and defy societal norms regarding her marriage."],
        ap.beliefs = ["Love transcends social boundaries and should not be constrained by societal norms.", "Possessing power in a relationship can be achieved through acts of defiance.", "Material gifts can solidify emotional bonds and manipulate perceptions of love."],
        ap.goals = ["Short-term: To successfully give the tapestry to Silius without any complications.", "Medium-term: To establish herself as Silius's primary love interest and secure his commitment.", "Ultimate: To escape the confines of her marriage to Claudius and enter into a new, liberated life with Silius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_12'})
    ON CREATE SET
        ap.current_status = 'Messalina is in her private suite, supervising slaves who are carefully taking down a large, ornate tapestry from the wall. She is actively giving instructions to the slaves, concerned about the tapestry\'s condition during removal.  She\'s also in the process of having her hair dressed, showcasing a blend of imperial command and personal vanity amidst the unfolding drama.',
        ap.emotional_state = 'Superficially, Messalina projects an air of nonchalant imperiousness, focusing on the tapestry and her appearance. However, her passionate outburst reveals a tempest of jealousy and possessiveness churning beneath.  She is driven by an almost frantic need for Silius\'s exclusive devotion, unable to bear the thought of him with another woman. This unveils a raw vulnerability masked by bravado, highlighting a deep insecurity fueling her reckless actions and pronouncements of \'love\'.',
        ap.emotional_tags = ["superficially, messalina projects an air of nonchalant imperiousness, focusing on the tapestry", "her appearance. however, her passionate outburst reveals a tempest of jealousy", "possessiveness churning beneath.  she is driven by an almost frantic need for silius's exclusive devotion, unable to bear the thought of him with another woman. this unveils a raw vulnerability masked by bravado, highlighting a deep insecurity fueling her reckless actions", "pronouncements of 'love'.", "superficially", "messalina projects an air of nonchalant imperiousness", "focusing on the tapestry and her appearance. however", "her passionate outburst reveals a tempest of jealousy and possessiveness churning beneath.  she is driven by an almost frantic need for silius's exclusive devotion", "unable to bear the thought of him with another woman. this unveils a raw vulnerability masked by bravado", "highlighting a deep insecurity fueling her reckless actions and pronouncements of 'love'."],
        ap.active_plans = ["Ensure the ornate tapestry, a gift from Claudius, is successfully delivered to Silius as a grand gesture of her affection and dominance.", "Dismiss and deflect Domitia's probing questions and moral objections with assertions of love and impulsive justifications.", "Maintain an outward facade of unwavering confidence and control, masking her internal emotional volatility and the precariousness of her situation."],
        ap.beliefs = ["Her desires and passions supersede all social norms and imperial duties; her feelings justify any action, regardless of risk.", "Love is inherently possessive and demands absolute exclusivity; the mere idea of Silius sharing intimacy with his wife is intolerable.", "Her imperial status provides a shield and grants her impunity; she believes she can manipulate any situation to her advantage, even defying her husband and Roman conventions."],
        ap.goals = ["Short-term Goal: Present the tapestry to Silius as a tangible symbol of her affection and ownership, solidifying her hold on him.", "Medium-term Goal: Compel Silius to divorce his wife swiftly, eliminating any obstacle to her complete possession of him and publicizing their exclusive bond.", "Ultimate Goal: Secure a future with Silius, possibly envisioning a life where their passionate bond transcends societal constraints and even challenges Claudius's authority, driven by her insatiable desires."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_12'})
    ON CREATE SET
        ap.current_status = 'Domitia enters Messalina\'s private suite and immediately observes the slaves removing the tapestry, her entry marked by a sharp intake of breath and widening eyes. She directly confronts Messalina, questioning the removal of the tapestry and its destination. Her posture is rigid with disapproval, her voice laced with concern and a growing sense of alarm as she witnesses Messalina\'s reckless actions.',
        ap.emotional_state = 'Domitia is deeply alarmed and disapproving, her initial widened eyes giving way to a stern, concerned expression.  Internally, she is wrestling with a mix of frustration, disappointment, and fear for Messalina\'s impending doom.  There\'s a palpable tension between her loyalty to her niece and her ingrained Roman sensibilities, horrified by Messalina’s scandalous behavior and its potentially catastrophic consequences.  Unspoken is her fear for the family\'s reputation and the traditional Roman values Messalina is so flagrantly disregarding.',
        ap.emotional_tags = ["domitia is deeply alarmed", "disapproving, her initial widened eyes giving way to a stern, concerned expression.  internally, she is wrestling with a mix of frustration, disappointment,", "fear for messalina's impending doom.  there's a palpable tension between her loyalty to her niece", "her ingrained roman sensibilities, horrified by messalina\u2019s scandalous behavior", "its potentially catastrophic consequences.  unspoken is her fear for the family's reputation", "the traditional roman values messalina is so flagrantly disregarding.", "domitia is deeply alarmed and disapproving", "her initial widened eyes giving way to a stern", "concerned expression.  internally", "she is wrestling with a mix of frustration", "disappointment", "and fear for messalina's impending doom.  there's a palpable tension between her loyalty to her niece and her ingrained roman sensibilities", "horrified by messalina\u2019s scandalous behavior and its potentially catastrophic consequences.  unspoken is her fear for the family's reputation and the traditional roman values messalina is so flagrantly disregarding."],
        ap.active_plans = ["Immediately ascertain the reason for the tapestry's removal and its intended recipient to understand the extent of Messalina's recklessness.", "Reason with Messalina, appealing to her sense of self-preservation and reminding her of the immense danger she is courting with her actions.", "Attempt to instill some sense of discretion and prudence in Messalina, urging her to consider the devastating repercussions of her blatant affair and disregard for imperial norms."],
        ap.beliefs = ["Actions, especially those of an Empress, have severe and far-reaching consequences; Messalina's behaviour is dangerously provocative and unsustainable.", "Discretion and adherence to Roman social and marital norms are paramount for maintaining stability and avoiding personal and familial ruin.", "Love, particularly for a married woman, should be tempered by duty, reason, and a sense of decorum; Messalina's 'love' is a destructive force spiraling out of control."],
        ap.goals = ["Short-term Goal: Halt the removal of the tapestry or at least dissuade Messalina from gifting it to Silius, thereby mitigating one visible act of her indiscretion.", "Medium-term Goal: Impress upon Messalina the gravity of her situation, urging her to cease her open affair and adopt a more cautious approach to avoid imperial wrath.", "Ultimate Goal: Protect Messalina from self-destruction and uphold the values of Roman virtue and order, even if it requires sternly confronting her niece and acknowledging the grim reality of their world."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_9_1'})
    ON CREATE SET
        oi.description = 'The scrolls surround CLAUDIUS, visually representing his scholarly pursuits. They serve as both a source of knowledge and refuge, representing his desire to understand the complexities of power and history, even as they contrast sharply with his current emotional state of isolation. The scrolls become a silent witness to his lamentations, amplifying his sense of loneliness in a world that seems to mock him.',
        oi.status_before = 'The scrolls are neatly stacked on CLAUDIUS\'s desk, representing his ongoing engagement with history and statecraft, but their neatness belies the emotional chaos of the moment.',
        oi.status_after = 'After the event, the scrolls remain scattered, reflecting CLAUDIUS\'s distracted state of mind as he grapples with his feelings of betrayal, suggesting that his focus on scholarship has been disrupted by the harsh realities of his political life.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'CLAUDIUS sits hunched at his desk, surrounded by a chaotic array of scrolls that reflect his intellectual pursuits but also his emotional turmoil. His posture is weary and defeated, as he fidgets with a scroll in his hands, his gaze occasionally drifting towards the window as if searching for something beyond the confines of his study.',
        ap.emotional_state = 'CLAUDIUS\'s surface emotions reveal a profound sense of sorrow and betrayal. His voice trembles with vulnerability as he reflects on the laughter directed at him, a mixture of shame and anger flickering across his face. Internally, he is grappling with feelings of isolation and the weight of his perceived incompetence as an emperor, exacerbated by memories of Herod\'s treachery that haunt him.',
        ap.emotional_tags = ["claudius's surface emotions reveal a profound sense of sorrow", "betrayal. his voice trembles with vulnerability as he reflects on the laughter directed at him, a mixture of shame", "anger flickering across his face. internally, he is grappling with feelings of isolation", "the weight of his perceived incompetence as an emperor, exacerbated by memories of herod's treachery that haunt him.", "claudius's surface emotions reveal a profound sense of sorrow and betrayal. his voice trembles with vulnerability as he reflects on the laughter directed at him", "a mixture of shame and anger flickering across his face. internally", "he is grappling with feelings of isolation and the weight of his perceived incompetence as an emperor", "exacerbated by memories of herod's treachery that haunt him."],
        ap.active_plans = ["To articulate his feelings of betrayal and isolation, attempting to process the emotional fallout from the laughter of the court.", "To reflect on the implications of Herod's treachery, drawing parallels to his own precarious position.", "To seek solace in the knowledge contained within the scrolls, hoping to distract himself from the painful reality of his circumstances."],
        ap.beliefs = ["He believes that knowledge and scholarship can provide refuge from the treachery surrounding him.", "He holds a conviction that loyalty should be a fundamental aspect of his reign, leading to his disillusionment when faced with betrayal.", "He is tormented by the belief that his physical awkwardness and perceived weakness diminish his authority as emperor."],
        ap.goals = ["Short-term: To express his feelings of isolation to himself, seeking clarity in his thoughts.", "Medium-term: To understand and come to terms with the betrayal he feels from his court and allies.", "Ultimate: To regain some semblance of authority and respect among his peers, proving that he is more than just a figure of mockery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Herod Agrippa, in his younger years and kingly attire, leans in close to a youthful Claudius within the intimate setting of royal chambers. His posture is conspiratorial, his movements deliberate as he delivers his grave counsel, ensuring his message is both seen and deeply felt by the future Emperor.',
        ap.emotional_state = 'Herod projects an air of grave seriousness, his tone laced with a conspiratorial urgency. Beneath this surface of concern, a complex blend of emotions might stir. Perhaps a genuine, albeit pragmatic, care for Claudius\'s future, or perhaps a more calculated self-interest, seeking to forge a bond by sharing what appears to be hard-won wisdom. An unspoken tension may exist between his regal authority and the vulnerability implied by issuing such a stark warning.',
        ap.emotional_tags = ["herod projects an air of grave seriousness, his tone laced with a conspiratorial urgency. beneath this surface of concern, a complex blend of emotions might stir. perhaps a genuine, albeit pragmatic, care for claudius's future, or perhaps a more calculated self-interest, seeking to forge a bond by sharing what appears to be hard-won wisdom. an unspoken tension may exist between his regal authority", "the vulnerability implied by issuing such a stark warning.", "herod projects an air of grave seriousness", "his tone laced with a conspiratorial urgency. beneath this surface of concern", "a complex blend of emotions might stir. perhaps a genuine", "albeit pragmatic", "care for claudius's future", "or perhaps a more calculated self-interest", "seeking to forge a bond by sharing what appears to be hard-won wisdom. an unspoken tension may exist between his regal authority and the vulnerability implied by issuing such a stark warning."],
        ap.active_plans = ["To impart a critical lesson about the nature of power and trust to young Claudius.", "To establish a sense of shared understanding and perhaps even dependence between them.", "To subtly influence Claudius's future actions and decisions by planting a seed of caution and suspicion."],
        ap.beliefs = ["The world, particularly the world of kings and emperors, is inherently treacherous and rife with hidden agendas.", "Trust is a dangerous and often fatal vulnerability in positions of power.", "Survival and continued rule depend on unwavering vigilance and a deep-seated suspicion of others' motives."],
        ap.goals = ["goals\": [\n          \"Short-term: To ensure Claudius fully grasps and internalizes the gravity of his warning.", "Medium-term: To foster a relationship with Claudius built on shared understanding of political realities.", "Ultimate: To secure his own future and legacy by aligning himself with a potentially powerful ally who is now aware of the dangers of their world, perhaps even ensuring mutual survival in a treacherous landscape."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_11_1'})
    ON CREATE SET
        oi.description = 'The scrolls are scattered across Claudius\'s desk, representing both his scholarly pursuits and the weighty matters of the empire. They serve as a physical reminder of the knowledge Claudius seeks as he contemplates the ramifications of Herod\'s death.',
        oi.status_before = 'The scrolls are organized yet well-worn, indicative of Claudius\'s continual engagement with Roman history and governance.',
        oi.status_after = 'Following the event, the scrolls remain on the desk, still a symbol of Claudius\'s scholarly nature but now overshadowed by the grim news of Herod\'s death, highlighting the tension between knowledge and the harsh realities of rule.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dispatches_event_11_1'})
    ON CREATE SET
        oi.description = 'The dispatches, filled with important communications from the empire, lie in disarray on Claudius\'s desk. They emphasize the continuous flow of information and the weight of decisions that Claudius must face, now complicated further by the news of Herod\'s demise.',
        oi.status_before = 'The dispatches are somewhat scattered, suggesting ongoing discussions and updates regarding various matters of state prior to the news of Herod\'s death.',
        oi.status_after = 'Post-event, the dispatches remain scattered yet now carry an additional layer of urgency, as Claudius must prioritize the implications of Herod\'s death amidst his other duties.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dispatches'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_11_2'})
    ON CREATE SET
        oi.description = 'The scrolls are present in Claudius\'s study, scattered across his desk and shelves, visually establishing the Emperor\'s scholarly environment. They serve as a silent backdrop to the dramatic recounting of Herod\'s death, highlighting Claudius\'s intellectual pursuits and the contrast between his world of books and the turbulent realities of imperial politics and divine interventions being described by Vibius.',
        oi.status_before = 'The scrolls are in their usual state, organized yet accessible within Claudius\'s study, representing his ongoing engagement with historical texts and scholarly activities. They are part of the everyday setting of his intellectual life.',
        oi.status_after = 'The scrolls remain undisturbed after Vibius\'s report, their state unchanged. However, symbolically, they underscore the enduring nature of knowledge and history against the backdrop of fleeting human dramas and divine judgments, providing a constant element in Claudius\'s world.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dispatches_event_11_2'})
    ON CREATE SET
        oi.description = 'Dispatches are scattered on Claudius\'s desk, visually representing the constant flow of information and urgent communications from across the Roman Empire that demand the Emperor\'s attention. Vibius\'s oral report about Herod\'s death functions as a verbal dispatch, bringing news from afar directly into Claudius\'s study, illustrating the vast reach of the empire and the continuous influx of critical information he must process.',
        oi.status_before = 'The dispatches are already present in Claudius\'s study, signifying his ongoing responsibilities in managing the empire and staying informed about events in distant territories. They represent the routine influx of imperial news and administrative tasks.',
        oi.status_after = 'The dispatches remain on Claudius\'s desk, with the oral dispatch of Herod\'s death adding to the collection of imperial news. The event reinforces the importance of these dispatches as conduits of crucial information that shape Claudius\'s understanding of the world and his empire.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dispatches'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_11_3'})
    ON CREATE SET
        oi.description = 'The scrolls on Claudius\'s desk serve as a backdrop to the serious discourse about Herod\'s death. They symbolize Claudius\'s scholarly nature and his engagement with the history and affairs of the empire. As he processes the shocking news, these scrolls represent the weight of knowledge and the historical continuity that he grapples with amidst the chaos.',
        oi.status_before = 'The scrolls are neatly organized yet slightly disheveled, indicating Claudius\'s recent preoccupation with his studies and the pressing matters at hand.',
        oi.status_after = 'Following the event, the scrolls remain on the desk, untouched, symbolizing Claudius\'s shift in focus from scholarly pursuits to the immediate political crisis and the implications of Herod\'s death.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dispatches_event_11_3'})
    ON CREATE SET
        oi.description = 'The dispatches scattered across Claudius’s desk echo the urgency of communication during this tumultuous time. As Marsus recounts the events surrounding Herod\'s death, these dispatches remind Claudius of the broader implications of power and the necessity for swift responses to emerging political threats.',
        oi.status_before = 'Prior to the event, the dispatches are in a state of disarray, reflecting the chaotic atmosphere of the court and Claudius\'s preoccupation with multiple pressing matters.',
        oi.status_after = 'After the event, the dispatches remain on the desk, now holding a heightened significance as Claudius contemplates the ramifications of Herod\'s demise and the potential shifts in alliances and power dynamics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dispatches'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands before Claudius, his posture formal and attentive, as he relays the news of Herod Agrippa\'s death. His hands may gesticulate slightly as he emphasizes crucial details, his voice steady yet laced with the gravity of the situation.',
        ap.emotional_state = 'Vibius displays a facade of calm professionalism, yet an underlying tension exists as he must navigate delivering devastating news. He appears confident as he recounts the events, but there might be a hint of apprehension regarding the implications of Herod\'s demise on the empire.',
        ap.emotional_tags = ["vibius displays a facade of calm professionalism", "yet an underlying tension exists as he must navigate delivering devastating news. he appears confident as he recounts the events", "but there might be a hint of apprehension regarding the implications of herod's demise on the empire.", "vibius displays a facade of calm professionalism, yet an underlying tension exists as he must navigate delivering devastating news. he appears confident as he recounts the events,", "there might be a hint of apprehension regarding the implications of herod's demise on the empire."],
        ap.active_plans = ["To inform Claudius about Herod Agrippa's death and its significance.", "To reassure Claudius about the stability of the alliance despite Herod's absence.", "To prepare Claudius for potential political fallout from the news."],
        ap.beliefs = ["The stability of the Roman Empire is paramount.", "Communication of truth, even harsh, is necessary for effective leadership.", "Herod's death could lead to power vacuums that threaten imperial authority."],
        ap.goals = ["Short-term: Deliver accurate information to Claudius without causing panic.", "Medium-term: Ensure the loyalty of Tyre and Sidon following Herod's death.", "Ultimate: Maintain stability and security within the Roman Empire amidst changing political dynamics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at his desk, leaning slightly forward, clearly engrossed in the conversation with Marsus Vibius. His hands may rest on the scrolls in front of him, indicating the weight of the news he is processing, as his brow furrows with concern.',
        ap.emotional_state = 'Claudius exhibits a mix of curiosity and anxiety as he hears about Herod\'s death. His internal turmoil is evident as he grapples with the implications for his own rule, feeling the weight of prophetic doom that has often haunted emperors.',
        ap.emotional_tags = ["claudius exhibits a mix of curiosity", "anxiety as he hears about herod's death. his internal turmoil is evident as he grapples with the implications for his own rule, feeling the weight of prophetic doom that has often haunted emperors.", "claudius exhibits a mix of curiosity and anxiety as he hears about herod's death. his internal turmoil is evident as he grapples with the implications for his own rule", "feeling the weight of prophetic doom that has often haunted emperors."],
        ap.active_plans = ["To understand the full context of Herod Agrippa's death.", "To assess the potential impact this event may have on his reign and alliances.", "To contemplate the implications of Herod's self-proclaimed messianic identity."],
        ap.beliefs = ["The stability of alliances is crucial for the empire's integrity.", "Divine omens and signs must be considered in political matters.", "His own authority as Emperor is challenged by political upheaval."],
        ap.goals = ["Short-term: Gather all relevant information regarding Herod's death.", "Medium-term: Assess how this event might affect his rule and the Roman Empire's stability.", "Ultimate: Secure his position as emperor and navigate the turbulent political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands attentively before Emperor Claudius in the imperial study, his posture respectful yet confident as he delivers the dramatic news of Herod Agrippa\'s death. He uses measured gestures to emphasize key points in his narrative, ensuring Claudius grasps the full spectacle and divine implications of the event.',
        ap.emotional_state = 'Vibius presents himself as composed and dutiful, his tone carefully modulated to convey gravity and respect for Claudius\'s position. Beneath this veneer of professional detachment, there is a subtle undercurrent of self-satisfaction in being the bearer of such significant and sensational news. He relishes the dramatic telling, subtly reinforcing his value as a knowledgeable advisor privy to critical imperial events.',
        ap.emotional_tags = ["vibius presents himself as composed", "dutiful, his tone carefully modulated to convey gravity", "respect for claudius's position. beneath this veneer of professional detachment, there is a subtle undercurrent of self-satisfaction in being the bearer of such significant", "sensational news. he relishes the dramatic telling, subtly reinforcing his value as a knowledgeable advisor privy to critical imperial events.", "vibius presents himself as composed and dutiful", "his tone carefully modulated to convey gravity and respect for claudius's position. beneath this veneer of professional detachment", "there is a subtle undercurrent of self-satisfaction in being the bearer of such significant and sensational news. he relishes the dramatic telling", "subtly reinforcing his value as a knowledgeable advisor privy to critical imperial events."],
        ap.active_plans = ["To comprehensively inform Claudius about the circumstances of Herod's death, emphasizing the divine judgment aspect.", "To subtly reinforce the idea of divine will in worldly affairs, potentially influencing Claudius's own sense of authority and destiny.", "To maintain his position as a trusted and well-informed advisor, showcasing his access to important imperial intelligence and his ability to deliver it effectively."],
        ap.beliefs = ["The Roman Empire's power is divinely sanctioned and events like Herod's death reinforce this belief.", "Maintaining order and respect for authority is crucial for the empire's stability.", "Presenting information in a dramatic and impactful way enhances its perceived importance and the advisor's value."],
        ap.goals = ["Short-term: Clearly communicate the details of Herod's death to Claudius.", "Medium-term: Strengthen his influence over Claudius by providing him with crucial and dramatically presented information.", "Ultimate: Contribute to the stability and perceived strength of the Roman Empire, thereby securing his own position and influence within it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius is seated at his desk, amidst scrolls and dispatches, leaning forward with rapt attention as Marsus Vibius recounts the details of Herod\'s demise. He gestures with a hand, prompting Vibius to continue, his physical stillness contrasting with the active engagement of his mind as he processes the extraordinary tale.',
        ap.emotional_state = 'Claudius begins with a detached curiosity, intellectually intrigued by the narrative of Herod\'s death and its bizarre circumstances. As Vibius elaborates, a sense of unease and reflection washes over Claudius. He is visibly contemplative, his brow furrowed as he grapples with the implications of Herod\'s hubris and the seemingly divine retribution. There\'s a hint of melancholy and perhaps a flicker of fear, as he recognizes the precariousness of power and the unpredictable hand of fate.',
        ap.emotional_tags = ["claudius begins with a detached curiosity, intellectually intrigued by the narrative of herod's death", "its bizarre circumstances. as vibius elaborates, a sense of unease", "reflection washes over claudius. he is visibly contemplative, his brow furrowed as he grapples with the implications of herod's hubris", "the seemingly divine retribution. there's a hint of melancholy", "perhaps a flicker of fear, as he recognizes the precariousness of power", "the unpredictable hand of fate.", "claudius begins with a detached curiosity", "intellectually intrigued by the narrative of herod's death and its bizarre circumstances. as vibius elaborates", "a sense of unease and reflection washes over claudius. he is visibly contemplative", "his brow furrowed as he grapples with the implications of herod's hubris and the seemingly divine retribution. there's a hint of melancholy and perhaps a flicker of fear", "as he recognizes the precariousness of power and the unpredictable hand of fate."],
        ap.active_plans = ["To fully understand the sequence of events leading to Herod's death, seeking a clear and detailed account from Vibius.", "To analyze the meaning behind the events, particularly the omen of the owl and the audience's deification of Herod, reflecting on the nature of power and divinity.", "To relate Herod's fate to his own position as Emperor, pondering the potential parallels and lessons for his own rule and the Roman Empire's stability."],
        ap.beliefs = ["Divine forces and omens can influence earthly events and the fates of rulers.", "Understanding history and the actions of others can provide valuable insights into governance and personal conduct.", "Even those in positions of great power are vulnerable to unforeseen circumstances and the whims of fate."],
        ap.goals = ["Short-term: Acquire all necessary information regarding Herod's death and its immediate context.", "Medium-term: Extract meaningful lessons from Herod's story to inform his own reign and decision-making.", "Ultimate: Rule Rome with wisdom and prudence, ensuring stability and avoiding the pitfalls of hubris and overreach that seemingly led to Herod's downfall."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Marsus Vibius stands before Claudius, his demeanor reflecting a combination of authority and deference. He gestures subtly as he recounts the details of Herod Agrippa\'s death, his posture indicating both restraint and a need to convey the gravity of the situation. His voice is steady, yet carries the weight of the tragic news, emphasizing the gravity of Herod\'s demise.',
        ap.emotional_state = 'Marsus outwardly conveys a professional detachment, maintaining a calm facade despite the grim content of his report. Beneath, there lies a sense of urgency; he understands the gravity of the implications for the Roman Empire. His dedication to serve Claudius and the empire shows his loyalty, but the horror of Herod\'s fate looms large in his mind, creating a subtle tension within him.',
        ap.emotional_tags = ["marsus outwardly conveys a professional detachment, maintaining a calm facade despite the grim content of his report. beneath, there lies a sense of urgency; he understands the gravity of the implications for the roman empire. his dedication to serve claudius", "the empire shows his loyalty, but the horror of herod's fate looms large in his mind, creating a subtle tension within him.", "marsus outwardly conveys a professional detachment", "maintaining a calm facade despite the grim content of his report. beneath", "there lies a sense of urgency; he understands the gravity of the implications for the roman empire. his dedication to serve claudius and the empire shows his loyalty", "but the horror of herod's fate looms large in his mind", "creating a subtle tension within him.", "marsus outwardly conveys a professional detachment, maintaining a calm facade despite the grim content of his report. beneath, there lies a sense of urgency", "he understands the gravity of the implications for the roman empire. his dedication to serve claudius and the empire shows his loyalty, but the horror of herod's fate looms large in his mind, creating a subtle tension within him.", "marsus outwardly conveys a professional detachment, maintaining a calm facade despite the grim content of his report. beneath, there lies a sense of urgency; he understands the gravity of the implications for the roman empire. his dedication to serve claudius and the empire shows his loyalty,", "the horror of herod's fate looms large in his mind, creating a subtle tension within him."],
        ap.active_plans = ["To inform Claudius of the death of Herod Agrippa and its implications for Roman authority.", "To maintain a composed demeanor while conveying the severity of the situation.", "To prepare Claudius for possible political ramifications stemming from Herod's demise."],
        ap.beliefs = ["The stability of the empire depends on clear communication of critical events.", "Loyalty to the emperor is paramount, regardless of the distressing news.", "Understanding the audience's reaction is essential in delivering such grave news."],
        ap.goals = ["Short-term: To accurately relay the news of Herod\u2019s death to ensure Claudius is informed.", "Medium-term: To gauge Claudius's reaction and strategize the next steps for maintaining control over the empire.", "Ultimate: To preserve the stability and integrity of the Roman Empire amidst emerging threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at his desk, surrounded by scrolls and dispatches, his attention fully captured by Marsus Vibius’s account. His body language is tense, illustrating his deep engagement with the unfolding narrative. He leans forward, emphasizing his eagerness to understand the implications of Herod\'s death, revealing a scholar\'s fascination amidst the disarray.',
        ap.emotional_state = 'Claudius\'s surface emotions fluctuate between curiosity and concern, reflecting his deeper anxieties about power and mortality. Internally, he wrestles with a growing sense of vulnerability, as Herod\'s collapse starkly confronts him with the fragility of life and authority. His naive trust in his position is shadowed by the realization that power can be fleeting and perilous.',
        ap.emotional_tags = ["claudius's surface emotions fluctuate between curiosity", "concern, reflecting his deeper anxieties about power", "mortality. internally, he wrestles with a growing sense of vulnerability, as herod's collapse starkly confronts him with the fragility of life", "authority. his naive trust in his position is shadowed by the realization that power can be fleeting", "perilous.", "claudius's surface emotions fluctuate between curiosity and concern", "reflecting his deeper anxieties about power and mortality. internally", "he wrestles with a growing sense of vulnerability", "as herod's collapse starkly confronts him with the fragility of life and authority. his naive trust in his position is shadowed by the realization that power can be fleeting and perilous."],
        ap.active_plans = ["To comprehend the full context of Herod Agrippa's death and its potential impact on his reign.", "To reconcile the idea of Herod as a 'Messiah' with the reality of his demise, reflecting on the implications for his own authority.", "To prepare for possible political shifts resulting from Herod's death and its ramifications for the empire."],
        ap.beliefs = ["The nature of power is fragile and can be threatened by unforeseen events.", "Death, especially of allies, signifies not only a personal loss but a potential shift in political dynamics.", "Understanding the broader implications of such events is crucial for a ruler."],
        ap.goals = ["Short-term: To gather comprehensive information on Herod's death for immediate understanding.", "Medium-term: To assess the potential political fallout and strategize accordingly.", "Ultimate: To maintain stability and authority in the empire despite emerging threats."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_letter_from_herod_event_12_1'})
    ON CREATE SET
        oi.description = 'The letter from Herod is the central catalyst of this event. Claudius picks it up, opens it, and reads its contents, both visually and auditorily as Herod\'s voice-over reads the text aloud. The letter serves as a vessel for Herod\'s confession, warning, and dying words, directly impacting Claudius\'s emotional state and understanding of his world. It is the bearer of unwelcome truth, shattering Claudius\'s illusions and forcing him to confront the pervasive treachery around him. The letter itself becomes a tangible symbol of betrayal and loss.',
        oi.status_before = 'The letter is sealed with the royal seal, indicating its official nature and importance. It is unopened, representing unknown and potentially significant news from Herod Agrippa, arriving from afar and carrying an air of somber formality.',
        oi.status_after = 'The letter is now opened and read, its message delivered and absorbed by Claudius. It transforms from a mere object of communication into a potent symbol of betrayal, loss, and a stark warning. It becomes a physical representation of Herod\'s dying confession and a catalyst for Claudius\'s growing awareness of the treachery surrounding him.'
    WITH oi
    MATCH (o:Object {uuid: 'object_letter_from_herod'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_royal_seal_event_12_1'})
    ON CREATE SET
        oi.description = 'The royal seal is prominently featured on the letter, immediately establishing its authenticity and official nature. It signifies that this is not merely a personal note, but a formal communication from a king, albeit a dying one. Initially, the seal commands respect and attention, indicating the gravity of the message before the personal and betraying nature of Herod\'s confession is revealed. It acts as a marker of authority and imperial communication, which is ironically undermined by the letter\'s content of betrayal and crumbling trust.',
        oi.status_before = 'The royal seal is intact and unbroken on the letter, signifying the letter\'s official status and the authority of its sender, Herod Agrippa.',
        oi.status_after = 'The royal seal remains physically unchanged, still affixed to the letter. However, its symbolic weight is diminished by the contents of the letter itself. The seal, meant to represent authority and trust, is now associated with a message of betrayal and the shattering of trust, highlighting the fragility of power and loyalty even within official communications.'
    WITH oi
    MATCH (o:Object {uuid: 'object_royal_seal'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_history_of_my_life_scroll_event_12_2'})
    ON CREATE SET
        oi.description = 'The scroll represents Claudius\'s commitment to documenting the truths of his reign and personal experiences. As he reflects on the losses he has suffered and the manipulations he has endured, this scroll stands as a metaphor for his desire to bring clarity to his life, even as he grapples with the realization of his ignorance regarding the true nature of those around him.',
        oi.status_before = 'The scroll exists as an unfinished work, a personal reflection gathering dust as Claudius\'s attention is diverted by the machinations of court life and his emotional turmoil.',
        oi.status_after = 'Following this moment of contemplation, the scroll becomes a focal point for Claudius\'s resolve to document his life, symbolizing a shift towards self-awareness and an intention to confront the complexities of his reign.'
    WITH oi
    MATCH (o:Object {uuid: 'object_history_of_my_life_scroll'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_royal_seal_event_12_2'})
    ON CREATE SET
        oi.description = 'The royal seal, prominently featured on Herod\'s letter, symbolizes Claudius\'s authority and the trust placed in those close to him. However, it also represents the manipulation by Messalina, as she previously used a duplicate of this seal for her own purposes. Claudius\'s acknowledgment of this fact deepens his sense of betrayal and highlights the precarious nature of power in his relationships.',
        oi.status_before = 'The seal is a powerful emblem of imperial authority, typically held with reverence and used to authenticate decrees and communications.',
        oi.status_after = 'Post-event, the royal seal takes on a dual significance—while it remains a symbol of power, it now also embodies the treachery and manipulation that Claudius faces, marking a shift in his perception of trust and authority.'
    WITH oi
    MATCH (o:Object {uuid: 'object_royal_seal'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands alone in his study, the flickering candlelight casting long shadows around the room filled with scrolls and busts of philosophers. He holds a letter, its royal seal catching the light, his fingers tracing the edge of the parchment as he begins to read. His posture is initially composed, but subtly shifts as the weight of Herod\'s words begins to sink in.',
        ap.emotional_state = 'Initially, Claudius is likely somber, expecting news from afar, perhaps even anticipating bad tidings given the royal seal and the context of political intrigue. As he reads, disbelief and a profound sadness wash over him. The confession of betrayal by a lifelong friend cuts deeply, stirring a sense of wounded vulnerability beneath his scholarly exterior.  He is grappling with the crushing weight of loneliness and the realization of his own naivety in trusting those close to him.',
        ap.emotional_tags = ["initially, claudius is likely somber, expecting news from afar, perhaps even anticipating bad tidings given the royal seal", "the context of political intrigue. as he reads, disbelief", "a profound sadness wash over him. the confession of betrayal by a lifelong friend cuts deeply, stirring a sense of wounded vulnerability beneath his scholarly exterior.  he is grappling with the crushing weight of loneliness", "the realization of his own naivety in trusting those close to him.", "initially", "claudius is likely somber", "expecting news from afar", "perhaps even anticipating bad tidings given the royal seal and the context of political intrigue. as he reads", "disbelief and a profound sadness wash over him. the confession of betrayal by a lifelong friend cuts deeply", "stirring a sense of wounded vulnerability beneath his scholarly exterior.  he is grappling with the crushing weight of loneliness and the realization of his own naivety in trusting those close to him."],
        ap.active_plans = ["To fully comprehend the contents of Herod's letter and understand the extent of his betrayal.", "To reflect on the implications of Herod's warning 'trust no one' and its relevance to his own court.", "To seek solace and perhaps misguidedly, support from Messalina, as mentioned in his monologue following the letter reading."],
        ap.beliefs = ["He has believed in the bonds of friendship and loyalty, particularly with those from his youth, like Herod.", "He holds a naive belief in the inherent goodness or at least trustworthiness of people he considers close.", "He is beginning to confront the belief that he is isolated and surrounded by potential betrayers, a stark contrast to his earlier trust."],
        ap.goals = ["Short-term: To finish reading and fully absorb Herod's final message.", "Medium-term: To process the emotional impact of Herod's betrayal and the loss of another friend, alongside the chilling warning.", "Ultimate: To navigate the treacherous political landscape of Rome, potentially with a newfound cynicism and caution, though still yearning for genuine connection."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Herod Agrippa, though deceased and physically absent, powerfully participates in the event through his dying letter. His voice, in voice-over, resonates within Claudius\'s study, painting a gruesome picture of his decaying body and delivering a confession from beyond the grave. His presence is spectral yet potent, dominating Claudius\'s solitude with his final words.',
        ap.emotional_state = 'Herod\'s emotional state, as conveyed in the letter, is a complex tapestry of remorse, twisted affection, and cynical resignation. He expresses regret for his betrayal, yet couches it within a warped form of endearment for Claudius, calling him \'marmoset\' and reminiscing about their school days. There\'s a chilling acceptance of his gruesome fate as divine justice and a haunting undercurrent of despair mixed with a final, stark warning born from his own treacherous experiences.',
        ap.emotional_tags = ["herod's emotional state, as conveyed in the letter, is a complex tapestry of remorse, twisted affection,", "cynical resignation. he expresses regret for his betrayal, yet couches it within a warped form of endearment for claudius, calling him 'marmoset'", "reminiscing about their school days. there's a chilling acceptance of his gruesome fate as divine justice", "a haunting undercurrent of despair mixed with a final, stark warning born from his own treacherous experiences.", "herod's emotional state", "as conveyed in the letter", "is a complex tapestry of remorse", "twisted affection", "and cynical resignation. he expresses regret for his betrayal", "yet couches it within a warped form of endearment for claudius", "calling him 'marmoset' and reminiscing about their school days. there's a chilling acceptance of his gruesome fate as divine justice and a haunting undercurrent of despair mixed with a final", "stark warning born from his own treacherous experiences."],
        ap.active_plans = ["To confess his betrayal to Claudius before death claims him completely, seeking a form of posthumous absolution.", "To offer a final piece of 'wisdom' to Claudius, urging him to trust no one, born from his own failed ambition and demise.", "To leave a lasting impression on Claudius, ensuring he is remembered not just as a betrayer but also as a friend, however twisted that friendship might have been."],
        ap.beliefs = ["He believes in a form of divine justice, seeing his maggot-ridden death as punishment for offending 'the only living God'.", "He believes in the pervasive nature of betrayal and distrust in the world of power and politics, hence his warning 'trust no one'.", "He holds a contradictory belief of genuine affection for Claudius, even while having plotted against him, showcasing a complex and morally ambiguous character."],
        ap.goals = ["Short-term: To communicate his confession and warning before death.", "Medium-term: To be remembered by Claudius, even if as a betrayer, and to impart a final lesson.", "Ultimate: To find some form of peace or justification in his final moments, accepting his fate as divinely ordained, while still attempting to influence Claudius's future actions through his warning."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits alone in his study, surrounded by the silence of his imperial chamber. He has just received a letter from Herod, and his fingers tremble slightly as he holds it. His posture is hunched, revealing the weight of the emotional burden he bears as he reflects on his past, the losses he has endured, and the presence of Messalina in his life.',
        ap.emotional_state = 'Claudius is engulfed by a profound sense of loneliness and nostalgia. He outwardly expresses sorrow for the loss of his friends, yet beneath this melancholy lies a bittersweet acknowledgment of his complex relationship with Messalina. His self-reflection evokes a mix of guilt and denial, as he grapples with the manipulation he has suffered and still clings to the memory of her support.',
        ap.emotional_tags = ["claudius is engulfed by a profound sense of loneliness", "nostalgia. he outwardly expresses sorrow for the loss of his friends, yet beneath this melancholy lies a bittersweet acknowledgment of his complex relationship with messalina. his self-reflection evokes a mix of guilt", "denial, as he grapples with the manipulation he has suffered", "still clings to the memory of her support.", "claudius is engulfed by a profound sense of loneliness and nostalgia. he outwardly expresses sorrow for the loss of his friends", "yet beneath this melancholy lies a bittersweet acknowledgment of his complex relationship with messalina. his self-reflection evokes a mix of guilt and denial", "as he grapples with the manipulation he has suffered and still clings to the memory of her support."],
        ap.active_plans = ["To reflect on the letter from Herod and the implications it holds for his reign.", "To confront his feelings of solitude and consider the role of Messalina in his life, even amidst his growing awareness of her manipulation.", "To commit to documenting his life in a scroll, aiming to reveal the truths of his reign and the events surrounding his personal relationships."],
        ap.beliefs = ["Trust is essential, even if it can lead to deception.", "Love and companionship are worth pursuing, even in the face of betrayal.", "Acknowledging one's faults and ignorance is the first step towards understanding."],
        ap.goals = ["Short-term: To come to grips with the death of his friends and the implications of Herod\u2019s betrayal.", "Medium-term: To document his life and reign in a scroll, aiming to provide clarity and truth.", "Ultimate: To achieve a deeper understanding of his personal and political relationships, particularly with Messalina, and to reclaim control over his life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Though not physically present in the scene, Messalina looms large in Claudius\'s thoughts as he reflects on their past interactions. Her influence permeates the air, and Claudius recalls her past \'help\' with a mixture of gratitude and bitterness, contemplating her role in his life and the empire.',
        ap.emotional_state = 'In Claudius\'s mind, Messalina embodies both the allure of companionship and the treachery of betrayal. He feels a conflicted mix of admiration for her cleverness and resentment for her manipulation. Her absence is felt keenly in this moment of vulnerability, as Claudius grapples with the irony of having trusted her.',
        ap.emotional_tags = ["in claudius's mind, messalina embodies both the allure of companionship", "the treachery of betrayal. he feels a conflicted mix of admiration for her cleverness", "resentment for her manipulation. her absence is felt keenly in this moment of vulnerability, as claudius grapples with the irony of having trusted her.", "in claudius's mind", "messalina embodies both the allure of companionship and the treachery of betrayal. he feels a conflicted mix of admiration for her cleverness and resentment for her manipulation. her absence is felt keenly in this moment of vulnerability", "as claudius grapples with the irony of having trusted her."],
        ap.active_plans = ["To manipulate Claudius's emotions and perceptions, using her previous 'support' to solidify her position.", "To navigate the political landscape and maintain her influence over Claudius, despite his growing awareness of her actions.", "To plot her next moves in the court, ensuring her survival amidst the brewing chaos."],
        ap.beliefs = ["Power is best wielded through cunning and strategic manipulation.", "Trust can be an asset if cultivated wisely, even in a web of deceit.", "Survival in the cutthroat world of Roman politics requires adaptability and cleverness."],
        ap.goals = ["Short-term: To maintain her grip on Claudius and ensure his loyalty even as doubt creeps in.", "Medium-term: To navigate the fallout from her actions and capitalize on Claudius's emotional turmoil.", "Ultimate: To secure her power and authority within the empire, ensuring she remains untouchable even as the threat of exposure looms."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Messalina paces restlessly within the shadowed portico in Ostia, her movements betraying her inner agitation. She engages in a hushed, yet intense, conversation with Gaius Silius, her body language reflecting a state of unease and internal conflict as she grapples with the implications of their affair and Silius\'s audacious proposal.',
        ap.emotional_state = 'Outwardly, Messalina presents a facade of conflicted desire, expressing her longing to be Silius\'s wife while simultaneously voicing apprehension about the risks involved in such a drastic move.  Beneath the surface, she is a whirlwind of conflicting emotions: ambition clashes with fear, desire battles with pragmatism, and boredom fuels a reckless yearning for change. She is increasingly restless within the confines of her secret affair, seeking a more definitive and daring path forward.',
        ap.emotional_tags = ["outwardly, messalina presents a facade of conflicted desire, expressing her longing to be silius's wife while simultaneously voicing apprehension about the risks involved in such a drastic move.  beneath the surface, she is a whirlwind of conflicting emotions: ambition clashes with fear, desire battles with pragmatism,", "boredom fuels a reckless yearning for change. she is increasingly restless within the confines of her secret affair, seeking a more definitive", "daring path forward.", "outwardly", "messalina presents a facade of conflicted desire", "expressing her longing to be silius's wife while simultaneously voicing apprehension about the risks involved in such a drastic move.  beneath the surface", "she is a whirlwind of conflicting emotions: ambition clashes with fear", "desire battles with pragmatism", "and boredom fuels a reckless yearning for change. she is increasingly restless within the confines of her secret affair", "seeking a more definitive and daring path forward.", "outwardly, messalina presents a facade of conflicted desire, expressing her longing to be silius's wife", "simultaneously voicing apprehension about the risks involved in such a drastic move.  beneath the surface, she is a whirlwind of conflicting emotions: ambition clashes with fear, desire battles with pragmatism, and boredom fuels a reckless yearning for change. she is increasingly restless within the confines of her secret affair, seeking a more definitive and daring path forward."],
        ap.active_plans = ["To assess the depth of Silius's commitment to a more public and potentially treasonous relationship.", "To articulate her own desires for a legitimate union with Silius, while carefully evaluating the inherent dangers of defying Claudius.", "To explore the possibility of transforming their clandestine affair into a recognized and powerful partnership, cautiously weighing the catastrophic consequences of such a bold action."],
        ap.beliefs = ["She believes in the potency of her own desires and is driven by a profound need for exhilaration and personal fulfillment that transcends her imperial duties.", "She believes her affair with Silius offers a vital source of personal gratification, yet she is acutely aware of the precariousness of their clandestine arrangement.", "She believes in her capacity to manipulate situations to her advantage, though she may be dangerously underestimating the magnitude of the risks and repercussions of her choices."],
        ap.goals = ["{type: short-term, description: To ascertain the viability of a more open relationship with Silius and to determine his resolve for decisive action.}", "{type: medium-term, description: To escape the monotony of her current existence and seek a more stimulating and empowering life, potentially through a more prominent union with Silius.}", "{type: ultimate, description: To attain a position of greater personal contentment and influence, even if it necessitates challenging the established imperial order and risking everything she currently possesses.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands before Messalina in the dim portico, his posture radiating ambition and unwavering resolve. He is the instigator of their hushed discourse, forcefully advocating for a radical shift in their clandestine affair. His stance and pronouncements underscore a man seizing control of the moment, determined to steer their relationship toward a perilous, yet potentially rewarding, confrontation.',
        ap.emotional_state = 'Silius exudes an air of assured confidence and barely contained impatience. He overtly professes his ardent love for Messalina and his growing frustration with the secrecy that shrouds their affair, skillfully employing emotional appeals to sway her to his audacious plan. Internally, he burns with political ambition, viewing Messalina as both a lover and a stepping stone to greater power. His impatience is a carefully constructed guise for strategic calculation, recognizing a ripe opportunity to seize imperial authority, driven by a potent cocktail of lust and political avarice.',
        ap.emotional_tags = ["silius exudes an air of assured confidence", "barely contained impatience. he overtly professes his ardent love for messalina", "his growing frustration with the secrecy that shrouds their affair, skillfully employing emotional appeals to sway her to his audacious plan. internally, he burns with political ambition, viewing messalina as both a lover", "a stepping stone to greater power. his impatience is a carefully constructed guise for strategic calculation, recognizing a ripe opportunity to seize imperial authority, driven by a potent cocktail of lust", "political avarice.", "silius exudes an air of assured confidence and barely contained impatience. he overtly professes his ardent love for messalina and his growing frustration with the secrecy that shrouds their affair", "skillfully employing emotional appeals to sway her to his audacious plan. internally", "he burns with political ambition", "viewing messalina as both a lover and a stepping stone to greater power. his impatience is a carefully constructed guise for strategic calculation", "recognizing a ripe opportunity to seize imperial authority", "driven by a potent cocktail of lust and political avarice."],
        ap.active_plans = ["To forcefully persuade Messalina to initiate divorce proceedings against Claudius and publicly pledge herself to him in marriage.", "To compellingly argue that their ongoing clandestine affair is inherently more perilous than an overt act of rebellion against the Emperor.", "To meticulously outline a strategy for declaring the Roman Republic restored and seizing control of the empire, envisioning himself and Messalina as the architects of this new order."],
        ap.beliefs = ["He firmly believes that their covert affair is no longer tenable and that a daring, decisive maneuver is imperative for their survival and ascension.", "He believes Claudius is a feeble ruler and that Rome is teetering on the brink of political upheaval, rendering a public challenge not only feasible but advantageous.", "He believes that his profound love for Messalina and his burning political ambitions are inextricably linked, and that attaining supreme power is indispensable for securing their shared happiness and future dominion."],
        ap.goals = ["{type: short-term, description: To secure Messalina's immediate agreement to a public wedding and to instigate swift, decisive action against Emperor Claudius.}", "{type: medium-term, description: To orchestrate the successful overthrow of Claudius's reign and to establish a transformed political framework in Rome, with himself and Messalina reigning supreme.}", "{type: ultimate, description: To achieve absolute power and enduring renown as a ruler of Rome, alongside Messalina, thereby fulfilling both his fervent personal desires and his towering political aspirations.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Messalina paces restlessly in the secluded portico, her beauty both captivating and tense as she grapples with Gaius Silius\'s bold proposal. She reaches out to him, her gestures filled with a mix of longing and hesitation, revealing her inner turmoil about their current situation and the risks of a drastic change.',
        ap.emotional_state = 'Messalina displays an outwardly confident facade, yet internally she is conflicted and anxious. She desires to be Silius\'s wife, but the weight of potential betrayal and the consequences of defying Claudius gnaws at her. The tension between her ambition and fear of discovery creates a palpable unease beneath her surface bravado.',
        ap.emotional_tags = ["messalina displays an outwardly confident facade, yet internally she is conflicted", "anxious. she desires to be silius's wife, but the weight of potential betrayal", "the consequences of defying claudius gnaws at her. the tension between her ambition", "fear of discovery creates a palpable unease beneath her surface bravado.", "messalina displays an outwardly confident facade", "yet internally she is conflicted and anxious. she desires to be silius's wife", "but the weight of potential betrayal and the consequences of defying claudius gnaws at her. the tension between her ambition and fear of discovery creates a palpable unease beneath her surface bravado.", "messalina displays an outwardly confident facade, yet internally she is conflicted and anxious. she desires to be silius's wife,", "the weight of potential betrayal and the consequences of defying claudius gnaws at her. the tension between her ambition and fear of discovery creates a palpable unease beneath her surface bravado."],
        ap.active_plans = ["To maintain her affair with Silius while ensuring her safety and Claudius's ignorance for as long as possible.", "To strategize a way to position herself as Silius's legitimate wife without provoking Claudius's wrath.", "To assess the political landscape and gauge the potential fallout from their actions before making any rash moves."],
        ap.beliefs = ["She believes that her beauty and cunning can manipulate the situation to her advantage.", "She is convinced that remaining hidden is safer than taking drastic actions that could expose her.", "She harbors a desire for true power and recognition that she feels can only be achieved through a public union with Silius."],
        ap.goals = ["Short-term: To maintain the illusion of her marriage to Claudius while secretly planning her future with Silius.", "Medium-term: To devise a plan to divorce Claudius and marry Silius without inciting immediate retaliation.", "Ultimate: To seize political power and position herself as a respected figure in Rome alongside Silius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Silius stands confidently before Messalina, his posture assertive and magnetic as he pushes for a public marriage. He steps closer to her, exuding a blend of passion and impatience, his gestures urging her to embrace the boldness of their situation.',
        ap.emotional_state = 'Silius displays overwhelming confidence and urgency, driven by his feelings for Messalina and his impatience with their clandestine affair. However, beneath his bravado lies a hint of recklessness, as he underestimates the dangers of their proposed rebellion against Claudius, revealing a naivety that could lead to disaster.',
        ap.emotional_tags = ["silius displays overwhelming confidence", "urgency, driven by his feelings for messalina", "his impatience with their clandestine affair. however, beneath his bravado lies a hint of recklessness, as he underestimates the dangers of their proposed rebellion against claudius, revealing a naivety that could lead to disaster.", "silius displays overwhelming confidence and urgency", "driven by his feelings for messalina and his impatience with their clandestine affair. however", "beneath his bravado lies a hint of recklessness", "as he underestimates the dangers of their proposed rebellion against claudius", "revealing a naivety that could lead to disaster."],
        ap.active_plans = ["To convince Messalina to divorce Claudius and marry him, thereby solidifying their alliance.", "To rally support from powerful allies who would back their rebellion against Claudius's rule.", "To establish a bold public stance that would demonstrate Claudius's abandonment and garner popular support for their cause."],
        ap.beliefs = ["He believes that love and ambition can conquer any obstacle, including the formidable presence of Claudius.", "He is certain that their public marriage will spark a movement toward restoring the Republic, igniting a wave of support.", "He views their current secrecy as a liability and believes that only through bold action can they secure their future."],
        ap.goals = ["Short-term: To solidify his relationship with Messalina by persuading her to marry him immediately.", "Medium-term: To gain the support of influential figures in Rome who are disillusioned with Claudius.", "Ultimate: To overthrow Claudius and establish a new political order in Rome, positioning himself as a key leader."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Messalina paces restlessly within the shadowed portico of her Ostian retreat, her silken robes whispering with each agitated step. She moves with the contained energy of a caged tigress, her body language betraying her inner turmoil as she debates Silius’s audacious proposition. At times, she pauses, reaching out a hand towards him, a gesture both of longing and hesitant inquiry.',
        ap.emotional_state = 'Beneath her composed exterior, a storm of emotions rages within Messalina. Initially, boredom and frustration with the clandestine nature of her affair are palpable. She outwardly expresses a desire for a more public commitment from Silius, yet a deep-seated fear of the consequences of open rebellion tempers her longing. Internally, she grapples with the seductive allure of Silius\'s daring plan against the ingrained caution of self-preservation, creating a visible tension between her yearning for freedom and her fear of Claudius\'s reprisal.',
        ap.emotional_tags = ["beneath her composed exterior, a storm of emotions rages within messalina. initially, boredom", "frustration with the clandestine nature of her affair are palpable. she outwardly expresses a desire for a more public commitment from silius, yet a deep-seated fear of the consequences of open rebellion tempers her longing. internally, she grapples with the seductive allure of silius's daring plan against the ingrained caution of self-preservation, creating a visible tension between her yearning for freedom", "her fear of claudius's reprisal.", "beneath her composed exterior", "a storm of emotions rages within messalina. initially", "boredom and frustration with the clandestine nature of her affair are palpable. she outwardly expresses a desire for a more public commitment from silius", "yet a deep-seated fear of the consequences of open rebellion tempers her longing. internally", "she grapples with the seductive allure of silius's daring plan against the ingrained caution of self-preservation", "creating a visible tension between her yearning for freedom and her fear of claudius's reprisal."],
        ap.active_plans = ["Assess the immediate dangers and potential rewards of Silius's radical plan for public marriage.", "Gauge the depth of Silius's commitment and ambition to ensure their goals are aligned.", "Evaluate her own desires for power and public recognition against the risks of openly defying Claudius and the established order."],
        ap.beliefs = ["Initially, she believes in the relative safety of their concealed affair and the wisdom of long-term, cautious planning.", "She believes that being publicly acknowledged as Silius's wife would be the ultimate fulfillment of her desires.", "She wavers in her belief in her own 'innocence', acknowledging the gravity of her actions but still clinging to a degree of self-justification."],
        ap.goals = ["Short-term Goal: Decide whether to embrace Silius's plan for a public marriage or maintain the status quo of their secret affair.", "Medium-term Goal: Secure a more prominent and publicly acknowledged relationship with Gaius Silius, free from secrecy and constraint.", "Ultimate Goal: To potentially elevate her own power and status, possibly even overthrowing Claudius and establishing a new political order alongside Silius, though this ambition is still nascent and intertwined with her desire for personal fulfillment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands before Messalina, a figure radiating virile confidence and unwavering resolve. He positions himself close to her, his physical presence assertive and commanding within the secluded portico. His movements are deliberate as he emphasizes key points in his argument, stepping closer to underscore his passion and determination to move forward with their audacious plan, his gaze intense and unwavering.',
        ap.emotional_state = 'Silius is driven by a potent blend of impatience and fervent ambition. Outwardly, he projects an image of romantic devotion and unwavering confidence in their plan. His tone is urgent and persuasive, fueled by a restless energy and a growing frustration with the constraints of their secret affair. Internally, beneath the declarations of love, burns a fierce political ambition. He sees the public marriage not just as a romantic escalation but as a strategic maneuver to seize power, driven by a desire for public acclaim and political dominance that rivals his passion for Messalina.',
        ap.emotional_tags = ["silius is driven by a potent blend of impatience", "fervent ambition. outwardly, he projects an image of romantic devotion", "unwavering confidence in their plan. his tone is urgent", "persuasive, fueled by a restless energy", "a growing frustration with the constraints of their secret affair. internally, beneath the declarations of love, burns a fierce political ambition. he sees the public marriage not just as a romantic escalation but as a strategic maneuver to seize power, driven by a desire for public acclaim", "political dominance that rivals his passion for messalina.", "silius is driven by a potent blend of impatience and fervent ambition. outwardly", "he projects an image of romantic devotion and unwavering confidence in their plan. his tone is urgent and persuasive", "fueled by a restless energy and a growing frustration with the constraints of their secret affair. internally", "beneath the declarations of love", "burns a fierce political ambition. he sees the public marriage not just as a romantic escalation but as a strategic maneuver to seize power", "driven by a desire for public acclaim and political dominance that rivals his passion for messalina.", "silius is driven by a potent blend of impatience and fervent ambition. outwardly, he projects an image of romantic devotion and unwavering confidence in their plan. his tone is urgent and persuasive, fueled by a restless energy and a growing frustration with the constraints of their secret affair. internally, beneath the declarations of love, burns a fierce political ambition. he sees the public marriage not just as a romantic escalation", "as a strategic maneuver to seize power, driven by a desire for public acclaim and political dominance that rivals his passion for messalina."],
        ap.active_plans = ["Persuade Messalina to abandon her cautious approach and embrace his bold plan for a public wedding.", "Articulate the strategic advantages of immediate action, emphasizing the perceived weakness of Claudius and the potential for widespread support.", "Outline the practical steps for their public marriage and subsequent declaration of a Republic, presenting a clear and actionable path forward."],
        ap.beliefs = ["He believes that prolonged secrecy is more dangerous than open defiance, arguing that discovery is inevitable and they must seize the initiative.", "He believes that a public marriage will serve as a catalyst, exposing Claudius's weakness and rallying support for their cause.", "He believes that they have sufficient 'powerful friends' and popular support to successfully overthrow Claudius and establish a new Republic with themselves at the helm."],
        ap.goals = ["Short-term Goal: Secure Messalina's immediate agreement to their public marriage plan, setting the stage for action the very next day.", "Medium-term Goal: Publicly marry Messalina and use this act of defiance to trigger widespread dissent against Claudius and his rule.", "Ultimate Goal: To overthrow Claudius, dismantle the existing imperial structure, and establish a new Roman Republic with himself and Messalina as the leading figures, wielding significant power and reshaping Rome according to their vision."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Claudius, though absent from the immediate scene, feels the weight of disappointment as he reflects on Messalina\'s last-minute excuse for not accompanying him to Ostia. His trust in her remains steadfast, yet his oblivion to the betrayal brewing beneath the surface is palpable, highlighting his vulnerability within the dynamics of power.',
        ap.emotional_state = 'Claudius grapples with a mix of disappointment and obliviousness. Outwardly, he expresses a façade of trust and loyalty towards Messalina, but internally, he harbors a deep-seated longing for genuine connection. His emotional naivety contrasts sharply with the treachery occurring behind his back, embodying the tragic irony of his situation.',
        ap.emotional_tags = ["claudius grapples with a mix of disappointment", "obliviousness. outwardly, he expresses a fa\u00e7ade of trust", "loyalty towards messalina, but internally, he harbors a deep-seated longing for genuine connection. his emotional naivety contrasts sharply with the treachery occurring behind his back, embodying the tragic irony of his situation.", "claudius grapples with a mix of disappointment and obliviousness. outwardly", "he expresses a fa\u00e7ade of trust and loyalty towards messalina", "but internally", "he harbors a deep-seated longing for genuine connection. his emotional naivety contrasts sharply with the treachery occurring behind his back", "embodying the tragic irony of his situation.", "claudius grapples with a mix of disappointment and obliviousness. outwardly, he expresses a fa\u00e7ade of trust and loyalty towards messalina,", "internally, he harbors a deep-seated longing for genuine connection. his emotional naivety contrasts sharply with the treachery occurring behind his back, embodying the tragic irony of his situation."],
        ap.active_plans = ["To inspect the new harbor works in Ostia, a task rooted in his duties as emperor.", "To seek reconciliation with Messalina, demonstrating his enduring affection despite her absence.", "To remain blissfully unaware of the political machinations swirling around him, maintaining his focus on scholarly pursuits."],
        ap.beliefs = ["He believes in the loyalty of those closest to him, particularly Messalina.", "He holds onto the hope that love and trust can overcome the treachery of politics.", "He is convinced that his scholarly pursuits provide a solid foundation for his role as emperor, despite the chaos in his personal life."],
        ap.goals = ["Short-term: To fulfill his duties by visiting Ostia and inspecting the harbor.", "Medium-term: To maintain the facade of a harmonious relationship with Messalina.", "Ultimate: To secure a stable and peaceful reign as emperor, built on trust and loyalty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Messalina paces restlessly in the secluded portico, her beauty and ambition at odds with the tension of their clandestine plotting. She reaches out to Silius, expressing urgency and desire for their future, while grappling with the risks of their audacious plans. Her body language oscillates between confidence and vulnerability as she contemplates the implications of their actions.',
        ap.emotional_state = 'Messalina is torn between ambition and fear. Outwardly, she exudes confidence and desire for a future with Silius, but internally, she wrestles with the weight of their deceit. There’s a tension between her longing for freedom from Claudius and the anxiety surrounding the dangerous path they are charting together, reflecting a complex inner turmoil.',
        ap.emotional_tags = ["messalina is torn between ambition", "fear. outwardly, she exudes confidence", "desire for a future with silius, but internally, she wrestles with the weight of their deceit. there\u2019s a tension between her longing for freedom from claudius", "the anxiety surrounding the dangerous path they are charting together, reflecting a complex inner turmoil.", "messalina is torn between ambition and fear. outwardly", "she exudes confidence and desire for a future with silius", "but internally", "she wrestles with the weight of their deceit. there\u2019s a tension between her longing for freedom from claudius and the anxiety surrounding the dangerous path they are charting together", "reflecting a complex inner turmoil.", "messalina is torn between ambition and fear. outwardly, she exudes confidence and desire for a future with silius,", "internally, she wrestles with the weight of their deceit. there\u2019s a tension between her longing for freedom from claudius and the anxiety surrounding the dangerous path they are charting together, reflecting a complex inner turmoil."],
        ap.active_plans = ["To convince Silius to marry her openly, abandoning their current secretive arrangement.", "To ensure they both remain safe while executing their audacious plan to publicly declare their union.", "To navigate the political landscape carefully, avoiding detection until the timing is right."],
        ap.beliefs = ["She believes that true power comes from taking bold actions rather than remaining passive.", "She holds that love should be expressed openly and that her desires should not be constrained by her marriage.", "She perceives herself as a victim of circumstance, believing that her ambitions are justified."],
        ap.goals = ["Short-term: To marry Silius and solidify her position of power.", "Medium-term: To assert her independence from Claudius and reshape her narrative in Rome.", "Ultimate: To restore a Republic with Silius at her side, usurping Claudius's authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands confidently, radiating ambition as he urges Messalina to take decisive action. His posture is assertive, and he closes the distance between them, emphasizing his determination to move forward with their plan. He embodies a sense of urgency and bravado, eager to escape the confines of their secretive affair.',
        ap.emotional_state = 'Silius is driven by a mix of passion and arrogance. He expresses love for Messalina openly, but his confidence borders on recklessness as he dismisses the dangers of their situation. Internally, he may feel the weight of their choices but is more consumed by the thrill of ambition and the intoxicating idea of power that marriage could bring.',
        ap.emotional_tags = ["silius is driven by a mix of passion", "arrogance. he expresses love for messalina openly, but his confidence borders on recklessness as he dismisses the dangers of their situation. internally, he may feel the weight of their choices but is more consumed by the thrill of ambition", "the intoxicating idea of power that marriage could bring.", "silius is driven by a mix of passion and arrogance. he expresses love for messalina openly", "but his confidence borders on recklessness as he dismisses the dangers of their situation. internally", "he may feel the weight of their choices but is more consumed by the thrill of ambition and the intoxicating idea of power that marriage could bring.", "silius is driven by a mix of passion and arrogance. he expresses love for messalina openly,", "his confidence borders on recklessness as he dismisses the dangers of their situation. internally, he may feel the weight of their choices", "is more consumed by the thrill of ambition and the intoxicating idea of power that marriage could bring."],
        ap.active_plans = ["To persuade Messalina to divorce Claudius and marry him publicly.", "To rally their powerful friends in support of their union, seeking to shift the tides of power in their favor.", "To act decisively, rejecting prolonged concealment in favor of an audacious public declaration."],
        ap.beliefs = ["He believes that ambition requires daring and that they must seize the moment before it slips away.", "He holds a conviction that their love can triumph over any obstacles, including the political dangers they face.", "He perceives their current situation as untenable and believes that action is the only path to security."],
        ap.goals = ["Short-term: To marry Messalina and assert his dominance over Claudius.", "Medium-term: To build a coalition of powerful allies to support their political ambitions.", "Ultimate: To overthrow Claudius's authority and establish themselves as the new power in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus bursts into Pallas\'s chambers, his movements frantic and uncontrolled, a stark contrast to his usual composed demeanor. He paces agitatedly as he delivers the shocking news, his body language conveying the urgency and panic he feels about the unfolding scandal. He is not simply informing Pallas; he is conveying a sense of imminent crisis that demands immediate action.',
        ap.emotional_state = 'Narcissus is in a state of near-panic, his composure completely shattered by the news of Messalina\'s remarriage. Outwardly, his frantic movements and exclamatory speech reveal his agitation and alarm. Internally, he is likely experiencing a mix of fear, anger, and a profound sense of threat. His carefully constructed order is crumbling, and the political stability he values is in jeopardy, fueling his desperate need to control the situation and eliminate the threat.',
        ap.emotional_tags = ["narcissus is in a state of near-panic, his composure completely shattered by the news of messalina's remarriage. outwardly, his frantic movements", "exclamatory speech reveal his agitation", "alarm. internally, he is likely experiencing a mix of fear, anger,", "a profound sense of threat. his carefully constructed order is crumbling,", "the political stability he values is in jeopardy, fueling his desperate need to control the situation", "eliminate the threat.", "narcissus is in a state of near-panic", "his composure completely shattered by the news of messalina's remarriage. outwardly", "his frantic movements and exclamatory speech reveal his agitation and alarm. internally", "he is likely experiencing a mix of fear", "anger", "and a profound sense of threat. his carefully constructed order is crumbling", "and the political stability he values is in jeopardy", "fueling his desperate need to control the situation and eliminate the threat."],
        ap.active_plans = ["To immediately convey the severity of Messalina's remarriage to Pallas, ensuring he understands the magnitude of the political and personal threat.", "To convince Pallas that this situation is fundamentally different from Messalina's previous affairs, demanding an unprecedented and decisive response to protect the Emperor and their own positions.", "To initiate a plan to eliminate Messalina swiftly and discreetly, preventing her from reaching Claudius and further manipulating the situation to her advantage."],
        ap.beliefs = ["Messalina's public remarriage is not just a personal scandal but a deliberate act of treason and rebellion against Claudius's authority and the stability of the Roman Empire.", "The situation is critically dangerous, posing an immediate threat to Claudius's life, their own positions of power, and the very fabric of Roman governance.", "Swift and decisive action, including the elimination of Messalina, is the only way to avert political catastrophe and restore order."],
        ap.goals = ["Short-term: To secure Pallas's agreement on the urgency of the situation and the necessity for immediate, drastic action.", "Medium-term: To neutralize the immediate threat posed by Messalina and Silius by preventing them from gaining further influence or inciting rebellion, ultimately leading to Messalina's removal.", "Ultimate: To safeguard Claudius's reign and preserve the existing power structure, ensuring the continued stability of Rome and his own influential position within it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated at his table, calmly reviewing documents as Narcissus bursts in, maintaining his composed exterior amidst the frantic news. He listens intently to Narcissus\'s outburst, absorbing the information while exhibiting minimal outward reaction, his posture suggesting a mind already strategizing and assessing the implications.',
        ap.emotional_state = 'Pallas projects an aura of calm and control, his outward composure contrasting sharply with Narcissus\'s panic. On the surface, he appears collected and analytical, focused on dissecting the facts of the situation. Internally, while likely concerned by the gravity of the news, Pallas remains pragmatic and strategic, prioritizing a calculated response over emotional reaction. He is assessing the political ramifications and formulating a plan to manage the crisis without betraying any outward sign of alarm.',
        ap.emotional_tags = ["pallas projects an aura of calm", "control, his outward composure contrasting sharply with narcissus's panic. on the surface, he appears collected", "analytical, focused on dissecting the facts of the situation. internally, while likely concerned by the gravity of the news, pallas remains pragmatic", "strategic, prioritizing a calculated response over emotional reaction. he is assessing the political ramifications", "formulating a plan to manage the crisis without betraying any outward sign of alarm.", "pallas projects an aura of calm and control", "his outward composure contrasting sharply with narcissus's panic. on the surface", "he appears collected and analytical", "focused on dissecting the facts of the situation. internally", "while likely concerned by the gravity of the news", "pallas remains pragmatic and strategic", "prioritizing a calculated response over emotional reaction. he is assessing the political ramifications and formulating a plan to manage the crisis without betraying any outward sign of alarm.", "pallas projects an aura of calm and control, his outward composure contrasting sharply with narcissus's panic. on the surface, he appears collected and analytical, focused on dissecting the facts of the situation. internally,", "likely concerned by the gravity of the news, pallas remains pragmatic and strategic, prioritizing a calculated response over emotional reaction. he is assessing the political ramifications and formulating a plan to manage the crisis without betraying any outward sign of alarm."],
        ap.active_plans = ["To methodically assess the validity and details of Narcissus's alarming claims, seeking clarification on key aspects such as the divorce and the public nature of the remarriage to understand the precise threat.", "To analyze the legal and political ramifications of Messalina's actions, specifically whether the remarriage constitutes bigamy and how it can be interpreted as a challenge to Claudius's imperial authority and an invitation to the Senate.", "To collaborate with Narcissus to devise a strategy for informing Claudius in a way that will be believable, and to ensure Messalina is prevented from reaching the Emperor and manipulating him further."],
        ap.beliefs = ["Messalina's remarriage is a serious political event with potentially destabilizing consequences for Claudius's reign and the Roman Empire, requiring careful and strategic handling.", "Claudius's deep affection for Messalina will make him resistant to believing negative reports about her, necessitating a delicate and persuasive approach to reveal the truth.", "Maintaining control over the flow of information and preventing Messalina from directly influencing Claudius are crucial steps in managing the crisis and ensuring a favorable outcome for their power and stability."],
        ap.goals = ["Short-term: To fully comprehend the extent of Messalina's actions and their immediate implications by questioning Narcissus and gathering all relevant information.", "Medium-term: To develop a cohesive plan with Narcissus to effectively inform Claudius of Messalina's betrayal and to control the narrative, ensuring Claudius acts decisively against her.", "Ultimate: To preserve the stability of the Roman Empire and safeguard their own positions of influence within Claudius's court by strategically managing the crisis and neutralizing the threat posed by Messalina's rebellion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Pallas sits composed at a table, reviewing documents, maintaining an air of calm despite Narcissus\'s frantic outburst. He prompts Narcissus for clarification about the divorce and its implications, actively engaging in calculating the ramifications of Messalina\'s actions.',
        ap.emotional_state = 'Pallas exhibits a calm exterior, masking the urgency of the situation. He appears focused and analytical, although beneath the surface, he feels the pressure of potential chaos brewing from Messalina\'s actions. His mind races with strategic considerations, knowing the stakes are high.',
        ap.emotional_tags = ["pallas exhibits a calm exterior, masking the urgency of the situation. he appears focused", "analytical, although beneath the surface, he feels the pressure of potential chaos brewing from messalina's actions. his mind races with strategic considerations, knowing the stakes are high.", "pallas exhibits a calm exterior", "masking the urgency of the situation. he appears focused and analytical", "although beneath the surface", "he feels the pressure of potential chaos brewing from messalina's actions. his mind races with strategic considerations", "knowing the stakes are high."],
        ap.active_plans = ["To ascertain the specifics of Messalina's divorce and its legal ramifications on Claudius's reign.", "To formulate a strategic response that mitigates the threat posed by Messalina's actions.", "To maintain order and control within the court regardless of the chaos surrounding Messalina."],
        ap.beliefs = ["Legal proceedings and proper protocol are crucial in maintaining the integrity of the empire.", "A composed demeanor is vital in times of crisis to ensure clear decision-making.", "The political landscape is precarious, requiring calculated moves to navigate the treachery."],
        ap.goals = ["Short-term: Clarify the details of Messalina's actions to prepare for a response.", "Medium-term: Prevent Messalina from leveraging her actions further to destabilize Claudius's rule.", "Ultimate: Ensure the stability of the empire while protecting his own position and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus bursts into Pallas\'s chambers, visibly agitated and frantic. His urgency underscores the gravity of Messalina\'s actions, and he passionately outlines the potential consequences for Claudius and themselves, illustrating a dynamic of alarm and decisiveness.',
        ap.emotional_state = 'Narcissus is in a state of panic and frustration, his agitation palpable as he grapples with the implications of Messalina\'s actions. He feels a mix of urgency and fear for both Claudius\'s safety and their own positions. This emotional turmoil drives his determination to act swiftly.',
        ap.emotional_tags = ["narcissus is in a state of panic", "frustration, his agitation palpable as he grapples with the implications of messalina's actions. he feels a mix of urgency", "fear for both claudius's safety", "their own positions. this emotional turmoil drives his determination to act swiftly.", "narcissus is in a state of panic and frustration", "his agitation palpable as he grapples with the implications of messalina's actions. he feels a mix of urgency and fear for both claudius's safety and their own positions. this emotional turmoil drives his determination to act swiftly."],
        ap.active_plans = ["To inform Pallas of the gravity of Messalina's actions regarding her divorce.", "To ensure that they take immediate action to curtail Messalina's influence over Claudius.", "To devise a strategy that eliminates Messalina without her being able to defend herself."],
        ap.beliefs = ["Messalina's actions represent a direct threat to the Emperor's life and his own power.", "Urgency in addressing political crises can prevent greater calamities.", "In the dangerous game of Roman politics, swift and decisive action is necessary to survive."],
        ap.goals = ["Short-term: Convey the urgency of Messalina's situation to Pallas and ensure immediate action is taken.", "Medium-term: Keep Messalina away from Claudius to prevent her from manipulating the situation further.", "Ultimate: Secure their safety and positions by eliminating the threat posed by Messalina."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus bursts into Pallas\'s chambers, agitated and pacing, his movements reflecting the urgency and alarm of his words. He gestures emphatically as he speaks, his body language conveying a sense of frantic energy and barely contained panic. He dominates the physical space with his unrestrained outburst.',
        ap.emotional_state = 'Narcissus is in a state of high anxiety and agitation, bordering on panic. Outwardly, he expresses outrage and alarm, using strong, exclamatory language to convey the severity of the situation. Internally, he is driven by fear for his own safety and the stability of the empire, recognizing the profound threat Messalina poses. His controlled facade has cracked, revealing a raw, visceral fear.',
        ap.emotional_tags = ["narcissus is in a state of high anxiety", "agitation, bordering on panic. outwardly, he expresses outrage", "alarm, using strong, exclamatory language to convey the severity of the situation. internally, he is driven by fear for his own safety", "the stability of the empire, recognizing the profound threat messalina poses. his controlled facade has cracked, revealing a raw, visceral fear.", "narcissus is in a state of high anxiety and agitation", "bordering on panic. outwardly", "he expresses outrage and alarm", "using strong", "exclamatory language to convey the severity of the situation. internally", "he is driven by fear for his own safety and the stability of the empire", "recognizing the profound threat messalina poses. his controlled facade has cracked", "revealing a raw", "visceral fear."],
        ap.active_plans = ["Convince Pallas of the extreme danger posed by Messalina's remarriage.", "Persuade Pallas that Claudius must be informed immediately, despite the Emperor's likely disbelief.", "Advocate for Messalina's swift and silent elimination to prevent further political damage and secure their own positions."],
        ap.beliefs = ["Messalina's remarriage is not merely a personal scandal but a calculated political act of treason.", "The Senate is opportunistic and will readily exploit Claudius's weakness to restore the Republic.", "Immediate and decisive action, including Messalina's elimination, is the only way to protect Claudius and the empire."],
        ap.goals = ["Short-term: To shock Pallas into recognizing the gravity of the situation and the urgent need for action.", "Medium-term: To eliminate Messalina and suppress any senatorial rebellion, thereby securing Claudius's reign.", "Ultimate: To maintain the stability of the Roman Empire and preserve their own power and influence within the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated and composed at his table, calmly reviewing documents as Narcissus erupts. His physical stillness contrasts sharply with Narcissus\'s frantic energy, highlighting his controlled and analytical nature. He listens intently, occasionally looking up to meet Narcissus\'s gaze, maintaining an air of thoughtful consideration amidst the chaos.',
        ap.emotional_state = 'Pallas is outwardly calm and collected, maintaining his composure even in the face of Narcissus\'s panic. Surface emotions are masked by his professional demeanor, but internally he is deeply concerned and strategically assessing the situation. He experiences a controlled urgency, recognizing the danger but prioritizing a methodical approach to finding a solution rather than succumbing to immediate fear. He is calculating and focused on strategy.',
        ap.emotional_tags = ["pallas is outwardly calm", "collected, maintaining his composure even in the face of narcissus's panic. surface emotions are masked by his professional demeanor, but internally he is deeply concerned", "strategically assessing the situation. he experiences a controlled urgency, recognizing the danger but prioritizing a methodical approach to finding a solution rather than succumbing to immediate fear. he is calculating", "focused on strategy.", "pallas is outwardly calm and collected", "maintaining his composure even in the face of narcissus's panic. surface emotions are masked by his professional demeanor", "but internally he is deeply concerned and strategically assessing the situation. he experiences a controlled urgency", "recognizing the danger but prioritizing a methodical approach to finding a solution rather than succumbing to immediate fear. he is calculating and focused on strategy.", "pallas is outwardly calm and collected, maintaining his composure even in the face of narcissus's panic. surface emotions are masked by his professional demeanor,", "internally he is deeply concerned and strategically assessing the situation. he experiences a controlled urgency, recognizing the danger", "prioritizing a methodical approach to finding a solution rather than succumbing to immediate fear. he is calculating and focused on strategy."],
        ap.active_plans = ["Analyze the legal and political ramifications of Messalina's actions, particularly whether the divorce is legally valid.", "Determine the best course of action to inform Claudius in a way that he will believe and act upon.", "Collaborate with Narcissus to formulate a strategy to neutralize Messalina and manage the political fallout within the Senate."],
        ap.beliefs = ["Messalina's remarriage is a serious political crisis that cannot be ignored, regardless of Claudius's personal feelings.", "Claudius is emotionally vulnerable and will be resistant to believing negative news about Messalina, requiring a delicate approach.", "Maintaining control and preventing chaos is paramount for the stability of the empire and their own positions of power."],
        ap.goals = ["Short-term: To fully understand the legal and political implications of Messalina's actions and devise a plan to inform Claudius effectively.", "Medium-term: To neutralize the threat posed by Messalina and Silius and manage the Senate's reaction to the scandal.", "Ultimate: To ensure the continued stability of Claudius's reign and secure their own influence and survival within the treacherous Roman court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Pallas sits composedly at a table, reviewing documents, a picture of calm amidst the storm of Narcissus\'s frantic revelations. His posture is relaxed yet attentive, a subtle power dynamic in play as he absorbs the gravity of the situation unfolding around him.',
        ap.emotional_state = 'Pallas maintains an external calm, but internally, he wrestles with anxiety and tactical calculations. He is acutely aware of the urgency of their predicament and the need for swift action, yet he struggles against the tide of Claudius\'s blind faith in Messalina, feeling the weight of responsibility pressing upon him.',
        ap.emotional_tags = ["pallas maintains an external calm, but internally, he wrestles with anxiety", "tactical calculations. he is acutely aware of the urgency of their predicament", "the need for swift action, yet he struggles against the tide of claudius's blind faith in messalina, feeling the weight of responsibility pressing upon him.", "pallas maintains an external calm", "but internally", "he wrestles with anxiety and tactical calculations. he is acutely aware of the urgency of their predicament and the need for swift action", "yet he struggles against the tide of claudius's blind faith in messalina", "feeling the weight of responsibility pressing upon him.", "pallas maintains an external calm,", "internally, he wrestles with anxiety and tactical calculations. he is acutely aware of the urgency of their predicament and the need for swift action, yet he struggles against the tide of claudius's blind faith in messalina, feeling the weight of responsibility pressing upon him."],
        ap.active_plans = ["To devise a strategy to inform Claudius about Messalina's betrayal without triggering his disbelief.", "To maintain control over the narrative surrounding Messalina's actions to preserve their own positions.", "To ensure that Messalina is kept away from Claudius to prevent her influence from undermining their efforts."],
        ap.beliefs = ["The necessity for quick and decisive action to protect their own interests.", "The understanding that personal loyalties are secondary to political necessity.", "The conviction that preserving the Emperor's authority is paramount, even at the cost of his personal relationships."],
        ap.goals = ["Short-term: Quickly inform Claudius of the crisis to take preemptive measures.", "Medium-term: Eliminate Messalina's influence to stabilize the throne.", "Ultimate: Ensure the continuity of their power and the stability of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Narcissus bursts into the room, his frantic energy contrasting sharply with Pallas\'s composure. He paces, gesticulating wildly as he articulates the scandalous implications of Messalina\'s actions, his urgency palpable as he drives home the point of potential danger to Claudius.',
        ap.emotional_state = 'Narcissus exhibits surface-level panic, his voice tinged with acute dread about the ramifications of Messalina\'s actions. Internally, he is calculating and ruthless, viewing the situation as a chess game where each move must be precise to safeguard their interests. He wrestles with the fear of losing control.',
        ap.emotional_tags = ["narcissus exhibits surface-level panic, his voice tinged with acute dread about the ramifications of messalina's actions. internally, he is calculating", "ruthless, viewing the situation as a chess game where each move must be precise to safeguard their interests. he wrestles with the fear of losing control.", "narcissus exhibits surface-level panic", "his voice tinged with acute dread about the ramifications of messalina's actions. internally", "he is calculating and ruthless", "viewing the situation as a chess game where each move must be precise to safeguard their interests. he wrestles with the fear of losing control."],
        ap.active_plans = ["To communicate the immediate danger posed by Messalina's actions to Pallas and ultimately to Claudius.", "To propose eliminating Messalina swiftly to prevent her from undermining their authority.", "To ensure that they control the narrative surrounding Claudius's perception of Messalina's betrayal."],
        ap.beliefs = ["A firm belief in the necessity of power consolidation, prioritizing survival over morality.", "The conviction that swift, decisive action is crucial in times of crisis.", "The understanding that loyalty in the treacherous world of Rome is conditional and often self-serving."],
        ap.goals = ["Short-term: Alert Pallas and formulate a plan of action regarding Messalina's betrayal.", "Medium-term: Eliminate Messalina without giving her a chance to manipulate Claudius.", "Ultimate: Secure their positions within the court and maintain stability in the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Narcissus storms into Pallas\'s chambers, his body tense with agitation. He paces back and forth, hands gesturing wildly as he vents his fury and alarm. His voice is raised, filled with a mixture of outrage and panic as he describes Messalina\'s scandalous behavior and its perilous consequences for the Emperor and themselves. He is a whirlwind of frantic energy, unable to contain his escalating anxiety.',
        ap.emotional_state = 'Narcissus is consumed by a volatile mix of panic and fury. Outwardly, he displays explosive outrage at Messalina\'s actions, viewing them as an unbearable affront. Internally, deep fear fuels his agitation—fear for his own safety, for Claudius\'s life, and for the stability of the empire he depends upon. He is terrified of the chaos Messalina\'s treason could unleash, revealing a profound insecurity beneath his veneer of ruthless control. He is driven by a desperate need to regain order and eliminate the perceived threat.',
        ap.emotional_tags = ["narcissus is consumed by a volatile mix of panic", "fury. outwardly, he displays explosive outrage at messalina's actions, viewing them as an unbearable affront. internally, deep fear fuels his agitation\u2014fear for his own safety, for claudius's life,", "for the stability of the empire he depends upon. he is terrified of the chaos messalina's treason could unleash, revealing a profound insecurity beneath his veneer of ruthless control. he is driven by a desperate need to regain order", "eliminate the perceived threat.", "narcissus is consumed by a volatile mix of panic and fury. outwardly", "he displays explosive outrage at messalina's actions", "viewing them as an unbearable affront. internally", "deep fear fuels his agitation\u2014fear for his own safety", "for claudius's life", "and for the stability of the empire he depends upon. he is terrified of the chaos messalina's treason could unleash", "revealing a profound insecurity beneath his veneer of ruthless control. he is driven by a desperate need to regain order and eliminate the perceived threat."],
        ap.active_plans = ["To immediately inform Emperor Claudius about Messalina's treacherous remarriage and the declaration of divorce.", "To ensure Messalina is kept completely isolated from Claudius to prevent her manipulation or influence over him.", "To execute Messalina swiftly and decisively, without any public trial or hearing, to contain the scandal and prevent further political damage."],
        ap.beliefs = ["Unquestioning obedience to the Emperor is essential for maintaining order and stability in Rome.", "Messalina's actions are not just personal indiscretions but a direct and dangerous assault on imperial authority.", "Ruthless and immediate action, even if it means bypassing due process, is necessary to eliminate threats to the established power structure."],
        ap.goals = ["Short-term: To convince Pallas of the immediate and extreme danger posed by Messalina's actions and secure his cooperation.", "Medium-term: To orchestrate Messalina's swift and silent execution, eliminating her as a political and personal threat to Claudius and themselves.", "Ultimate: To safeguard the stability of the Roman Empire and solidify his own position and influence as a key advisor, ensuring continued power and control within the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Pallas remains seated and composed amidst Narcissus\'s frantic outburst. He is meticulously reviewing documents at his table, his posture calm and deliberate, contrasting sharply with Narcissus\'s agitation. He listens intently, his gaze steady, absorbing the information with a calculating demeanor.  He occasionally gestures with a hand to indicate he is following and considering Narcissus\'s points, maintaining an air of controlled attentiveness.',
        ap.emotional_state = 'Pallas exhibits a façade of detached composure, a mask of icy control that betrays little outward emotion. Internally, he is analytically processing the gravity of Messalina\'s treason, assessing the strategic implications and political fallout with cold pragmatism. Beneath his calm exterior lies a calculating mind, focused on identifying the most efficient and politically advantageous course of action. He is driven by a desire for order and control, but his approach is measured and strategic, lacking Narcissus\'s overt panic, revealing a more nuanced and self-assured ambition.',
        ap.emotional_tags = ["pallas exhibits a fa\u00e7ade of detached composure, a mask of icy control that betrays little outward emotion. internally, he is analytically processing the gravity of messalina's treason, assessing the strategic implications", "political fallout with cold pragmatism. beneath his calm exterior lies a calculating mind, focused on identifying the most efficient", "politically advantageous course of action. he is driven by a desire for order", "control, but his approach is measured", "strategic, lacking narcissus's overt panic, revealing a more nuanced", "self-assured ambition.", "pallas exhibits a fa\u00e7ade of detached composure", "a mask of icy control that betrays little outward emotion. internally", "he is analytically processing the gravity of messalina's treason", "assessing the strategic implications and political fallout with cold pragmatism. beneath his calm exterior lies a calculating mind", "focused on identifying the most efficient and politically advantageous course of action. he is driven by a desire for order and control", "but his approach is measured and strategic", "lacking narcissus's overt panic", "revealing a more nuanced and self-assured ambition.", "pallas exhibits a fa\u00e7ade of detached composure, a mask of icy control that betrays little outward emotion. internally, he is analytically processing the gravity of messalina's treason, assessing the strategic implications and political fallout with cold pragmatism. beneath his calm exterior lies a calculating mind, focused on identifying the most efficient and politically advantageous course of action. he is driven by a desire for order and control,", "his approach is measured and strategic, lacking narcissus's overt panic, revealing a more nuanced and self-assured ambition."],
        ap.active_plans = ["To verify the details of Messalina's actions, particularly confirming whether a formal divorce declaration was indeed issued.", "To carefully consider and determine the most effective and believable method of informing the emotionally vulnerable Emperor Claudius about Messalina's betrayal.", "To identify the individual most likely to be believed by Claudius, recognizing the Emperor's deep-seated denial and affection for Messalina, settling on Calpurnia as a strategic choice."],
        ap.beliefs = ["Political pragmatism and strategic maneuvering are more effective than emotional reactions in maintaining power.", "Emperor Claudius, while the ultimate authority, is emotionally susceptible and easily manipulated, requiring careful handling.", "Exploiting personal relationships and trust, even unconventional ones, can be a valuable tool in political strategy and manipulation."],
        ap.goals = ["Short-term: To thoroughly understand the factual basis of the unfolding crisis and calmly strategize the optimal response with Narcissus.", "Medium-term: To ensure Claudius is effectively informed and decisively acts against Messalina in a manner that solidifies their own influence and control.", "Ultimate: To navigate the treacherous political landscape of the Roman court, securing and expanding his own power and influence by adeptly managing crises and manipulating events to his advantage, ensuring long-term stability for his position."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Calpurnia stands trembling before Claudius, kneeling in a gesture of submission while clutching a note. Her posture is one of fear and urgency, her voice quivering as she delivers the shocking revelation about Messalina\'s marriage to Silius.',
        ap.emotional_state = 'Calpurnia is engulfed in a whirlwind of anxiety and desperation. Outwardly, she displays fear, her hands shaking as she speaks. Internally, she grapples with the knowledge that delivering this truth could lead to dire consequences for her, revealing a conflict between her loyalty to Claudius and her own survival instincts.',
        ap.emotional_tags = ["calpurnia is engulfed in a whirlwind of anxiety", "desperation. outwardly, she displays fear, her hands shaking as she speaks. internally, she grapples with the knowledge that delivering this truth could lead to dire consequences for her, revealing a conflict between her loyalty to claudius", "her own survival instincts.", "calpurnia is engulfed in a whirlwind of anxiety and desperation. outwardly", "she displays fear", "her hands shaking as she speaks. internally", "she grapples with the knowledge that delivering this truth could lead to dire consequences for her", "revealing a conflict between her loyalty to claudius and her own survival instincts."],
        ap.active_plans = ["To reveal the truth about Messalina's marriage to Silius to Claudius despite the risk.", "To convince Claudius of the urgency and gravity of the situation to prompt immediate action.", "To navigate the dangerous political waters of the court by being the whistleblower on Messalina's betrayal."],
        ap.beliefs = ["Calpurnia believes in the power of truth and feels a moral obligation to warn Claudius.", "She believes that loyalty to the Emperor, despite her low status, is paramount in preserving both their lives.", "Calpurnia has a conviction that she must act despite her fear, as inaction could lead to a greater catastrophe."],
        ap.goals = ["Short-term: To get Claudius to understand the gravity of Messalina's betrayal.", "Medium-term: To ensure that Claudius acts against the betrayal before it escalates further.", "Ultimate: To protect herself and preserve some semblance of justice in the chaotic court of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched over his table, initially appearing vulnerable and confused as he processes Calpurnia\'s shocking news. His posture reflects disbelief and denial, as he struggles to comprehend the enormity of her claim.',
        ap.emotional_state = 'Claudius experiences an intense conflict between his naïve trust in Messalina and the horrifying reality presented by Calpurnia. Outwardly, he displays disbelief and indignation, insisting on his trust in Messalina. Internally, he faces a tumultuous wave of betrayal and confusion as the truth begins to unravel his once secure world.',
        ap.emotional_tags = ["claudius experiences an intense conflict between his na\u00efve trust in messalina", "the horrifying reality presented by calpurnia. outwardly, he displays disbelief", "indignation, insisting on his trust in messalina. internally, he faces a tumultuous wave of betrayal", "confusion as the truth begins to unravel his once secure world.", "claudius experiences an intense conflict between his na\u00efve trust in messalina and the horrifying reality presented by calpurnia. outwardly", "he displays disbelief and indignation", "insisting on his trust in messalina. internally", "he faces a tumultuous wave of betrayal and confusion as the truth begins to unravel his once secure world."],
        ap.active_plans = ["To maintain his trust in Messalina while processing Calpurnia's alarming claims.", "To gather more information before taking any drastic measures against his wife.", "To confront the reality of his situation and determine whether he still holds power as Emperor."],
        ap.beliefs = ["Claudius believes in the loyalty and fidelity of those closest to him, especially Messalina.", "He holds a conviction that his status as Emperor should afford him some level of control over his personal life.", "Claudius believes that confrontation and conflict are to be avoided when possible, leading to his initial denial of the situation."],
        ap.goals = ["Short-term: To ascertain the truth behind Calpurnia's accusations before making any decisions.", "Medium-term: To protect his reign and authority in the face of potential betrayal.", "Ultimate: To uphold the integrity of his marriage and the stability of his rule over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Pallas enters Claudius\'s study alongside Narcissus, his presence immediately shifting the atmosphere from uneasy anticipation to grim certainty. He stands with a composed posture, observing the distraught Emperor and the trembling Calpurnia. With a measured tone, he steps forward to validate Calpurnia\'s shocking testimony, his mere presence lending weight to the unbelievable news.',
        ap.emotional_state = 'Pallas projects an air of controlled severity, his surface emotions reflecting grim determination. Internally, he is likely experiencing a mix of calculated urgency and cold satisfaction. There\'s a palpable sense of strategic resolve beneath his calm exterior, driven by the need to swiftly resolve the crisis and reinforce his own position. He betrays no outward emotion beyond the seriousness of the moment, maintaining a professional detachment.',
        ap.emotional_tags = ["pallas projects an air of controlled severity, his surface emotions reflecting grim determination. internally, he is likely experiencing a mix of calculated urgency", "cold satisfaction. there's a palpable sense of strategic resolve beneath his calm exterior, driven by the need to swiftly resolve the crisis", "reinforce his own position. he betrays no outward emotion beyond the seriousness of the moment, maintaining a professional detachment.", "pallas projects an air of controlled severity", "his surface emotions reflecting grim determination. internally", "he is likely experiencing a mix of calculated urgency and cold satisfaction. there's a palpable sense of strategic resolve beneath his calm exterior", "driven by the need to swiftly resolve the crisis and reinforce his own position. he betrays no outward emotion beyond the seriousness of the moment", "maintaining a professional detachment."],
        ap.active_plans = ["Corroborate Calpurnia's account to break through Claudius's denial.", "Emphasize the political ramifications of Messalina's actions, stressing the threat to Claudius's rule.", "Guide Claudius towards a decisive course of action, specifically immediate arrests, to regain control."],
        ap.beliefs = ["Messalina's treasonous actions pose a direct and immediate threat to Roman stability.", "Claudius, in his naivet\u00e9, is incapable of grasping the severity of the situation without stark, undeniable confirmation.", "Swift and decisive action is crucial to quash the rebellion and maintain order."],
        ap.goals = ["Short-term: Secure Claudius's belief in Messalina's betrayal and trigger his command for arrests.", "Medium-term: Neutralize Messalina and Silius to restore order and eliminate the immediate threat to imperial authority.", "Ultimate: Solidify his own power and influence by effectively managing this crisis and demonstrating his indispensability to Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus strides into the dimly lit study behind Pallas, his entrance radiating an air of cold authority. He observes the scene with a calculating gaze before stepping forward to amplify the grim tidings. He meticulously details the extent of Messalina\'s betrayal, painting a vivid and damning picture of her excesses and treason to shatter Claudius\'s remaining disbelief.',
        ap.emotional_state = 'Narcissus displays a chillingly pragmatic demeanor, devoid of emotional warmth or empathy for Claudius\'s plight. Internally, he operates with ruthless efficiency and calculated contempt for Messalina\'s chaotic actions and Claudius\'s naiveté. He exudes a surface of controlled urgency, masking a deeper satisfaction in exerting control and orchestrating the unfolding events. There\'s a distinct lack of any personal emotion, replaced by a cold, strategic focus.',
        ap.emotional_tags = ["narcissus displays a chillingly pragmatic demeanor, devoid of emotional warmth or empathy for claudius's plight. internally, he operates with ruthless efficiency", "calculated contempt for messalina's chaotic actions", "claudius's naivet\u00e9. he exudes a surface of controlled urgency, masking a deeper satisfaction in exerting control", "orchestrating the unfolding events. there's a distinct lack of any personal emotion, replaced by a cold, strategic focus.", "narcissus displays a chillingly pragmatic demeanor", "devoid of emotional warmth or empathy for claudius's plight. internally", "he operates with ruthless efficiency and calculated contempt for messalina's chaotic actions and claudius's naivet\u00e9. he exudes a surface of controlled urgency", "masking a deeper satisfaction in exerting control and orchestrating the unfolding events. there's a distinct lack of any personal emotion", "replaced by a cold", "strategic focus."],
        ap.active_plans = ["Validate Calpurnia's initial report, reinforcing the credibility of the news.", "Detail the full scope of Messalina's transgressions, emphasizing the depth of her betrayal and the scale of her treason.", "Push Claudius towards immediate and forceful action, advocating for the swift arrest of all conspirators to reassert imperial control."],
        ap.beliefs = ["Messalina represents unbridled chaos and a direct threat to the established order of Rome.", "Claudius is tragically weak and easily manipulated, requiring forceful intervention to comprehend and address the crisis.", "Ruthless and immediate action is necessary to restore order and prevent a larger political upheaval."],
        ap.goals = ["Short-term: Incite Claudius's anger and command for immediate arrests by detailing the full extent of Messalina's betrayal.", "Medium-term: Ensure Messalina's swift and decisive removal from power, eliminating her threat to the empire and to his own influence.", "Ultimate: Consolidate his own power and reinforce his image as a pragmatic and indispensable advisor by effectively managing this crisis and maintaining Roman stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched and vulnerable in his private study, initially resistant to Calpurnia\'s alarming news. He gestures dismissively, clinging to his disbelief as Pallas and Narcissus enter, their presence casting a pall of undeniable truth over the room. He looks from Calpurnia to his advisors, his posture shifting from skeptical dismissal to bewildered horror as the weight of their combined confirmations crushes his denial.',
        ap.emotional_state = 'Claudius begins in a state of deep denial and incredulity, desperately seeking to dismiss Calpurnia\'s revelations as madness or malice. Beneath this outward dismissal, a fragile hope for Messalina\'s innocence wars with mounting unease. As Pallas and Narcissus confirm the accusations, disbelief cracks, giving way to a dawning horror and profound betrayal. Internally, he is emotionally shattered, grappling with the devastating collapse of his trust and affection for Messalina, plunging him into a state of profound vulnerability and pain.',
        ap.emotional_tags = ["claudius begins in a state of deep denial", "incredulity, desperately seeking to dismiss calpurnia's revelations as madness or malice. beneath this outward dismissal, a fragile hope for messalina's innocence wars with mounting unease. as pallas", "narcissus confirm the accusations, disbelief cracks, giving way to a dawning horror", "profound betrayal. internally, he is emotionally shattered, grappling with the devastating collapse of his trust", "affection for messalina, plunging him into a state of profound vulnerability", "pain.", "claudius begins in a state of deep denial and incredulity", "desperately seeking to dismiss calpurnia's revelations as madness or malice. beneath this outward dismissal", "a fragile hope for messalina's innocence wars with mounting unease. as pallas and narcissus confirm the accusations", "disbelief cracks", "giving way to a dawning horror and profound betrayal. internally", "he is emotionally shattered", "grappling with the devastating collapse of his trust and affection for messalina", "plunging him into a state of profound vulnerability and pain."],
        ap.active_plans = ["Initially, to dismiss Calpurnia's claims and maintain his idealized image of Messalina.", "To understand the sudden, grim urgency brought by Pallas and Narcissus and reconcile it with his trust in his wife.", "Finally, to confront the undeniable reality of Messalina's betrayal and issue a command for action, however reluctantly and painfully."],
        ap.beliefs = ["He desperately wants to believe in Messalina's fidelity and his own judgment, clinging to the illusion of her trustworthiness.", "He trusts in the few women he has placed his faith in, including Messalina, making the betrayal especially devastating.", "He is beginning to confront the brutal reality that his trust has been catastrophically misplaced, shattering his worldview."],
        ap.goals = ["Short-term: To understand the truth of the situation and reconcile it with his preconceived notions of Messalina.", "Medium-term: To process the devastating betrayal and decide on a course of action that addresses the political and personal crisis.", "Ultimate: To restore order to Rome and his own shattered world, though he is primarily reacting to the immediate shock and pain, with long-term goals obscured by emotional turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched over a small table in his dimly lit study, visibly distressed. His hands tremble as he clutches a document, embodying vulnerability and confusion. He looks between Calpurnia and the doorway, where Pallas and Narcissus have entered, reflecting the weight of the revelations and the precariousness of his authority.',
        ap.emotional_state = 'Claudius is visibly shaken and disbelieving, his surface emotions a mixture of confusion and anger. Internally, he struggles with betrayal and disbelief, wrestling with the implications of Calpurnia\'s revelations. There is a profound internal conflict as he grapples with the reality of his wife\'s disloyalty, juxtaposed against his naive trust in her.',
        ap.emotional_tags = ["claudius is visibly shaken", "disbelieving, his surface emotions a mixture of confusion", "anger. internally, he struggles with betrayal", "disbelief, wrestling with the implications of calpurnia's revelations. there is a profound internal conflict as he grapples with the reality of his wife's disloyalty, juxtaposed against his naive trust in her.", "claudius is visibly shaken and disbelieving", "his surface emotions a mixture of confusion and anger. internally", "he struggles with betrayal and disbelief", "wrestling with the implications of calpurnia's revelations. there is a profound internal conflict as he grapples with the reality of his wife's disloyalty", "juxtaposed against his naive trust in her."],
        ap.active_plans = ["To process the shocking revelations about Messalina's marriage to Silius and their implications.", "To determine whether he can assert his authority as Emperor in the wake of this betrayal.", "To decide on an immediate course of action against Messalina and Silius to reclaim his power."],
        ap.beliefs = ["He believes in the loyalty of those close to him, including his wife, despite evidence to the contrary.", "He holds onto the conviction that trust and personal bonds are foundational to leadership.", "He has faith in his ability to maintain control over Rome, even amidst chaos."],
        ap.goals = ["Short-term: Confirm the truth of Calpurnia's claims about Messalina and Silius.", "Medium-term: To regain control over the Roman political landscape by addressing the betrayal.", "Ultimate: To strengthen his position as Emperor and restore order to his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands confidently in the doorway, having just entered the study. His posture is assertive, embodying authority and control, as he locks eyes with Claudius, conveying the gravity of the situation. His expression is unyielding, ready to deliver the harsh truths that Claudius must face.',
        ap.emotional_state = 'Narcissus projects a cold, calculating confidence, his surface demeanor devoid of empathy. Internally, he feels a sense of urgency, recognizing the precariousness of Claudius\'s position and the need to act decisively. He is motivated by a pragmatic desire to maintain stability and control over the Empire, viewing Claudius\'s naivety as a liability.',
        ap.emotional_tags = ["narcissus projects a cold, calculating confidence, his surface demeanor devoid of empathy. internally, he feels a sense of urgency, recognizing the precariousness of claudius's position", "the need to act decisively. he is motivated by a pragmatic desire to maintain stability", "control over the empire, viewing claudius's naivety as a liability.", "narcissus projects a cold", "calculating confidence", "his surface demeanor devoid of empathy. internally", "he feels a sense of urgency", "recognizing the precariousness of claudius's position and the need to act decisively. he is motivated by a pragmatic desire to maintain stability and control over the empire", "viewing claudius's naivety as a liability."],
        ap.active_plans = ["To provide Claudius with the critical information he needs to confront the reality of Messalina's betrayal.", "To persuade Claudius to take immediate action against Messalina and Silius.", "To ensure that Claudius reestablishes his authority as Emperor to prevent further chaos."],
        ap.beliefs = ["He believes that power must be controlled and that any threat to stability must be eliminated swiftly.", "He holds the conviction that loyalty is transactional and that personal bonds should not cloud judgment.", "He views ambition and ruthlessness as essential qualities for survival in Roman politics."],
        ap.goals = ["Short-term: To convince Claudius of the urgency of the situation regarding Messalina.", "Medium-term: To facilitate a swift arrest of Messalina and Silius to restore order.", "Ultimate: To solidify his influence over Claudius and position himself as a key player in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Pallas stands alongside Narcissus, his posture poised and assertive as he addresses Claudius. He maintains an air of calculated authority, ready to back up Narcissus’s claims. His expression is serious, reflecting the gravity of the revelations that have just come to light.',
        ap.emotional_state = 'Pallas exudes a calm yet urgent demeanor, focused on conveying the seriousness of the situation. Internally, he feels a sense of determination to act against Messalina\'s betrayal. He recognizes the opportunity to reinforce his own power and influence amidst the chaos, motivating him to push Claudius towards decisive action.',
        ap.emotional_tags = ["pallas exudes a calm yet urgent demeanor, focused on conveying the seriousness of the situation. internally, he feels a sense of determination to act against messalina's betrayal. he recognizes the opportunity to reinforce his own power", "influence amidst the chaos, motivating him to push claudius towards decisive action.", "pallas exudes a calm yet urgent demeanor", "focused on conveying the seriousness of the situation. internally", "he feels a sense of determination to act against messalina's betrayal. he recognizes the opportunity to reinforce his own power and influence amidst the chaos", "motivating him to push claudius towards decisive action."],
        ap.active_plans = ["To support Narcissus in convincing Claudius of the dire need to act against Messalina.", "To emphasize the consequences of inaction, framing the situation in terms of political survival.", "To ensure that Claudius regains his authority to prevent potential upheaval within the Empire."],
        ap.beliefs = ["He believes that the swift elimination of threats is essential for maintaining order and stability.", "He holds the conviction that political survival requires decisive action and shrewd maneuvering.", "He values pragmatism over sentimentality, viewing personal emotions as potential weaknesses in leadership."],
        ap.goals = ["Short-term: To reinforce Claudius's understanding of the threats posed by Messalina and Silius.", "Medium-term: To facilitate the organization of the necessary arrests and maintain order in the court.", "Ultimate: To leverage this crisis to bolster his own status and influence within the power structure."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cloud_claudius_shape_event_16_1'})
    ON CREATE SET
        oi.description = 'The cloud, fancifully interpreted by Mnester at Messalina\'s prompting as resembling Claudius, serves as a metaphorical object of ridicule. It becomes the focal point of a joke intended to diminish Claudius\'s imperial presence and authority, portraying him as distant, ineffectual, and easily dismissed. The cloud\'s imagined \'farting\' out to sea further amplifies this mockery, symbolizing Claudius\'s perceived impotence and inability to affect their revelry or rebellion in Ostia. The object enhances the scene\'s tone of arrogant defiance and delusional underestimation of Claudius.',
        oi.status_before = 'A natural atmospheric phenomenon, an ordinary cloud in the sky above Ostia, initially unremarkable and without specific narrative significance.',
        oi.status_after = 'The cloud, while physically unchanged, gains symbolic weight within the narrative. It transforms into a potent symbol of Messalina and Silius\'s hubris and misjudgment, representing their dangerously flawed perception of Claudius as a powerless and laughable figure just before his true power is revealed.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cloud_claudius_shape'})
    MATCH (e:Event {uuid: 'event_16_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wine_event_16_1'})
    ON CREATE SET
        oi.description = 'Wine is abundantly present at Silius\'s villa, flowing freely and contributing significantly to the atmosphere of drunken revelry and uninhibited celebration of Messalina and Silius\'s \'wedding\'. It acts as a social lubricant, lowering inhibitions and emboldening the characters to engage in increasingly audacious acts of defiance and mockery towards Claudius. The wine fuels Messalina\'s high spirits and Silius\'s overconfidence, playing a crucial role in setting the stage for their dramatic downfall by clouding their judgment and amplifying their recklessness.',
        oi.status_before = 'Wine is plentiful and readily available at the villa, prepared for the wedding feast and intended to enhance the celebratory mood and loosen social constraints among the guests.',
        oi.status_after = 'The wine continues to be consumed as the celebration proceeds, but its role shifts subtly. Initially a symbol of joy and freedom, it becomes a contributing factor to the characters\' blindness to the approaching danger and their inability to react effectively when the girl brings news of the Emperor\'s guards, marking a transition from drunken revelry to impending panic and chaos.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wine'})
    MATCH (e:Event {uuid: 'event_16_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_swords_event_16_2'})
    ON CREATE SET
        oi.description = 'The drawn swords of the guards signify a sudden shift from revelry to imminent danger. As their approach is announced, the swords become a stark reminder of imperial authority and the consequences of Messalina\'s and Silius\'s actions, transforming the festive atmosphere into one of panic and fear.',
        oi.status_before = 'The swords are sheathed, representing a period of peace and celebration; their presence is not yet felt by the guests, maintaining an illusion of safety.',
        oi.status_after = 'The swords are drawn and ready for combat, marking a dramatic escalation in tension. Their visibility and intent signal an approach toward violence, shifting the mood from celebration to chaos.'
    WITH oi
    MATCH (o:Object {uuid: 'object_swords'})
    MATCH (e:Event {uuid: 'event_16_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wine_event_16_2'})
    ON CREATE SET
        oi.description = 'The wine flows freely during the wedding celebration, fueling the atmosphere of excess and camaraderie. It symbolizes the indulgence and reckless spirit of the moment, but as the guards approach, its role shifts from a means of enjoyment to a potential means of escape as panic ensues.',
        oi.status_before = 'The wine is abundant and central to the festivities, representing the joy and merriment of the celebration, enhancing social bonds among the guests.',
        oi.status_after = 'As the guards arrive and panic spreads, the wine becomes a catalyst for chaos, with guests potentially abandoning their cups in fear, signifying the collapse of the celebratory mood.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wine'})
    MATCH (e:Event {uuid: 'event_16_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Messalina, flushed with wine and high spirits from her wedding celebrations, is physically leaning against Mnester, a handsome dancer, for support. She is actively engaging in playful banter, initiating the mockery of Claudius by asking Mnester what he sees, her posture relaxed and confident amidst the revelry at Silius\'s villa in Ostia.',
        ap.emotional_state = 'Messalina is exuding an outward appearance of joy and triumphant amusement, laughing heartily at the jests made at Claudius\'s expense. Beneath this surface of mirth, she is deeply entrenched in a state of delusional confidence, convinced of her own power and Claudius\'s utter ineffectualness. Her mockery masks a deeper contempt for her husband and a reckless belief in her own invulnerability, fueled by the heady wine and the perceived success of her audacious rebellion.',
        ap.emotional_tags = ["messalina is exuding an outward appearance of joy", "triumphant amusement, laughing heartily at the jests made at claudius's expense. beneath this surface of mirth, she is deeply entrenched in a state of delusional confidence, convinced of her own power", "claudius's utter ineffectualness. her mockery masks a deeper contempt for her husband", "a reckless belief in her own invulnerability, fueled by the heady wine", "the perceived success of her audacious rebellion.", "messalina is exuding an outward appearance of joy and triumphant amusement", "laughing heartily at the jests made at claudius's expense. beneath this surface of mirth", "she is deeply entrenched in a state of delusional confidence", "convinced of her own power and claudius's utter ineffectualness. her mockery masks a deeper contempt for her husband and a reckless belief in her own invulnerability", "fueled by the heady wine and the perceived success of her audacious rebellion."],
        ap.active_plans = ["Continue enjoying the wedding celebrations and reveling in her perceived triumph.", "Solidify her image of power and dominance by publicly mocking Claudius.", "Reinforce her bond with Silius and her co-conspirators through shared acts of defiance and contempt for the Emperor."],
        ap.beliefs = ["Claudius is a weak, foolish, and ineffectual ruler, easily manipulated and disregarded.", "Her marriage to Silius is a fait accompli and represents a significant shift in Roman power dynamics.", "She and Silius are powerful and untouchable, immune to any repercussions from Claudius or his forces."],
        ap.goals = ["Short-term: To maximize her enjoyment of the wedding celebration and publicly humiliate Claudius's image.", "Medium-term: To consolidate her power base with Silius and prepare for the formal overthrow of Claudius.", "Ultimate: To rule Rome as empress alongside Silius, establishing a new order where she is in control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Mnester is physically supporting the leaning Messalina, acting as her playful confidante in this moment of drunken revelry. He engages in witty banter, responding to Messalina\'s prompting with an imaginative and insolent description of a cloud resembling Claudius. He gestures perhaps with a flourish as he delivers his lines, fully participating in the mockery.',
        ap.emotional_state = 'Mnester appears outwardly jovial and witty, enjoying the playful exchange and the attention of the Empress. He is likely experiencing a sense of amusement and perhaps a touch of insolent thrill at mocking the Emperor so openly. Internally, he is observant and aware of the potential danger in their actions, yet chooses to play along, possibly motivated by a desire to please Messalina, maintain his favored position, and enjoy the present moment of carefree celebration.',
        ap.emotional_tags = ["mnester appears outwardly jovial", "witty, enjoying the playful exchange", "the attention of the empress. he is likely experiencing a sense of amusement", "perhaps a touch of insolent thrill at mocking the emperor so openly. internally, he is observant", "aware of the potential danger in their actions, yet chooses to play along, possibly motivated by a desire to please messalina, maintain his favored position,", "enjoy the present moment of carefree celebration.", "mnester appears outwardly jovial and witty", "enjoying the playful exchange and the attention of the empress. he is likely experiencing a sense of amusement and perhaps a touch of insolent thrill at mocking the emperor so openly. internally", "he is observant and aware of the potential danger in their actions", "yet chooses to play along", "possibly motivated by a desire to please messalina", "maintain his favored position", "and enjoy the present moment of carefree celebration."],
        ap.active_plans = ["Entertain Messalina and the wedding party with his witty and humorous observations.", "Maintain his position of favor within Messalina's circle by participating in her amusements.", "Observe the unfolding events and gauge the mood of the celebration, remaining alert to any shifts in atmosphere."],
        ap.beliefs = ["Messalina is currently in a position of power and influence, making her a valuable person to be close to.", "Claudius is distant and perhaps unaware of the extent of Messalina's rebellion, making their mockery relatively safe in the short term.", "Humor and wit are valuable commodities in the Roman court, and demonstrating them can enhance his social standing."],
        ap.goals = ["Short-term: To deliver amusing and memorable lines that entertain Messalina and the assembled guests.", "Medium-term: To solidify his reputation as a witty and charming entertainer within the Roman elite circles.", "Ultimate: To advance his career as an actor and dancer by aligning himself with powerful patrons like Messalina."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands nearby Messalina and Mnester, a proud and central figure in the wedding celebration at his villa. He actively participates in the mockery of Claudius, prompting Mnester for further jesting and displaying a sense of ownership and bravado. He confidently interprets the arrival of guards as a positive sign, initially welcoming them with open arms and wine.',
        ap.emotional_state = 'Silius is radiating arrogance and overconfidence, basking in what he perceives as a moment of triumph and solidified power. He is outwardly dismissive and contemptuous of Claudius, viewing him as a pathetic obstacle easily overcome. Internally, he is fueled by a dangerous level of hubris, blinded by his desire for power and his belief in the invincibility of their rebellion. His misinterpretation of the guards\' arrival reveals a profound misjudgment of the situation and a reckless underestimation of Claudius\'s potential response.',
        ap.emotional_tags = ["silius is radiating arrogance", "overconfidence, basking in what he perceives as a moment of triumph", "solidified power. he is outwardly dismissive", "contemptuous of claudius, viewing him as a pathetic obstacle easily overcome. internally, he is fueled by a dangerous level of hubris, blinded by his desire for power", "his belief in the invincibility of their rebellion. his misinterpretation of the guards' arrival reveals a profound misjudgment of the situation", "a reckless underestimation of claudius's potential response.", "silius is radiating arrogance and overconfidence", "basking in what he perceives as a moment of triumph and solidified power. he is outwardly dismissive and contemptuous of claudius", "viewing him as a pathetic obstacle easily overcome. internally", "he is fueled by a dangerous level of hubris", "blinded by his desire for power and his belief in the invincibility of their rebellion. his misinterpretation of the guards' arrival reveals a profound misjudgment of the situation and a reckless underestimation of claudius's potential response."],
        ap.active_plans = ["Participate in and encourage the mockery of Claudius to further diminish the Emperor's authority in the eyes of their followers.", "Maintain an image of strength and control as the newly 'wedded' consort to the Empress.", "Welcome the approaching figures, initially assuming they are aligned with or celebratory of their union, demonstrating his miscalculated confidence."],
        ap.beliefs = ["He and Messalina have successfully undermined Claudius's authority and are on the verge of seizing true power.", "Claudius is too weak and detached to effectively respond to their open rebellion.", "Their public wedding has sent a clear signal of their defiance and strength to Rome and its citizens."],
        ap.goals = ["Short-term: To celebrate his 'wedding' to Messalina and publicly assert their dominance over Claudius.", "Medium-term: To consolidate their political power and prepare to formally challenge Claudius for control of Rome.", "Ultimate: To become the co-ruler of Rome alongside Messalina, ushering in a new era under their leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Mnester stands at the center of the raucous wedding celebration, leaning casually against a column with a playful demeanor. His movements are fluid, reflecting the carefree atmosphere, yet there’s an underlying attentiveness as he gazes towards the villa’s perimeter, scanning for the approaching guards.',
        ap.emotional_state = 'Mnester outwardly exudes playful confidence, reveling in the joviality of the feast, but beneath this light-hearted facade lies a growing tension as he senses the approaching threat. His banter belies a deeper awareness of the precariousness of their situation, hinting at his instinctive caution amidst the revelry.',
        ap.emotional_tags = ["mnester outwardly exudes playful confidence", "reveling in the joviality of the feast", "but beneath this light-hearted facade lies a growing tension as he senses the approaching threat. his banter belies a deeper awareness of the precariousness of their situation", "hinting at his instinctive caution amidst the revelry.", "mnester outwardly exudes playful confidence, reveling in the joviality of the feast,", "beneath this light-hearted facade lies a growing tension as he senses the approaching threat. his banter belies a deeper awareness of the precariousness of their situation, hinting at his instinctive caution amidst the revelry."],
        ap.active_plans = ["Engage in playful banter to entertain the guests and lighten the mood.", "Observe the surroundings for any signs of danger, maintaining awareness amidst the festivities.", "Assist in welcoming guests, though this intention shifts as he realizes the guards' true purpose."],
        ap.beliefs = ["The power of humor can diffuse tension and foster camaraderie.", "Awareness of one's surroundings is crucial, especially in a volatile environment.", "Celebration can quickly turn to despair if one is not vigilant."],
        ap.goals = ["Short-term: Enjoy the festivities and entertain the guests.", "Medium-term: Ensure the safety of the attendees by keeping an eye on potential threats.", "Ultimate: Maintain a position of favor and relevance within Messalina\u2019s circle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands confidently near the center of the celebration, his posture relaxed and self-assured. He engages in banter with Mnester, oblivious to the danger looming outside the villa. His gestures are expansive, embodying the triumph he feels at this moment of revelry and defiance.',
        ap.emotional_state = 'Silius displays a facade of bravado and delight, fully immersed in the celebration and dismissing any concerns about Claudius. However, internally, there is a growing tension as the reality of their circumstances begins to encroach upon his victorious delusions. His overconfidence masks a deep-seated fear of losing everything he has gained.',
        ap.emotional_tags = ["silius displays a facade of bravado", "delight, fully immersed in the celebration", "dismissing any concerns about claudius. however, internally, there is a growing tension as the reality of their circumstances begins to encroach upon his victorious delusions. his overconfidence masks a deep-seated fear of losing everything he has gained.", "silius displays a facade of bravado and delight", "fully immersed in the celebration and dismissing any concerns about claudius. however", "internally", "there is a growing tension as the reality of their circumstances begins to encroach upon his victorious delusions. his overconfidence masks a deep-seated fear of losing everything he has gained."],
        ap.active_plans = ["Continue the celebration, reveling in the moment and asserting his dominance.", "Encourage Mnester to entertain the guests further, reinforcing his own position as the host.", "Misinterpret the arrival of the guards as benign, hoping to maintain the facade of control over the situation."],
        ap.beliefs = ["Victory and power can be celebrated publicly without fear of retribution.", "His charm and wit can overcome any potential threat.", "He is secure in his position and believes that his ambition will go unchallenged."],
        ap.goals = ["Short-term: Enjoy the wedding festivities and bask in the adoration of the guests.", "Medium-term: Solidify his power and influence through the public display of celebration.", "Ultimate: Eliminate Claudius's authority and position himself as a key figure in the new order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_3'})
    ON CREATE SET
        ap.current_status = 'The young girl bursts into Silius\'s villa, disrupting the drunken wedding revelry. She is in frantic motion, having rushed from outside to deliver her urgent message. Trembling and wide-eyed, she addresses the chaotic scene, her physical presence immediately injecting terror into the formerly joyous atmosphere. Her arrival is sudden and impactful, a whirlwind of fear amidst the languid decadence.',
        ap.emotional_state = 'The girl is consumed by sheer panic and terror. Her surface emotion is clearly abject fear, evident in her panicked voice and rushed movements. Internally, she is likely driven by a primal survival instinct, terrified of the Emperor\'s guards and the consequences of their arrival. There\'s no hint of deception or hidden agendas; her terror is raw and immediate, suggesting a genuine belief in the gravity of the situation and the imminent danger to everyone present.',
        ap.emotional_tags = ["the girl is consumed by sheer panic", "terror. her surface emotion is clearly abject fear, evident in her panicked voice", "rushed movements. internally, she is likely driven by a primal survival instinct, terrified of the emperor's guards", "the consequences of their arrival. there's no hint of deception or hidden agendas; her terror is raw", "immediate, suggesting a genuine belief in the gravity of the situation", "the imminent danger to everyone present.", "the girl is consumed by sheer panic and terror. her surface emotion is clearly abject fear", "evident in her panicked voice and rushed movements. internally", "she is likely driven by a primal survival instinct", "terrified of the emperor's guards and the consequences of their arrival. there's no hint of deception or hidden agendas; her terror is raw and immediate", "suggesting a genuine belief in the gravity of the situation and the imminent danger to everyone present.", "the girl is consumed by sheer panic and terror. her surface emotion is clearly abject fear, evident in her panicked voice and rushed movements. internally, she is likely driven by a primal survival instinct, terrified of the emperor's guards and the consequences of their arrival. there's no hint of deception or hidden agendas", "her terror is raw and immediate, suggesting a genuine belief in the gravity of the situation and the imminent danger to everyone present."],
        ap.active_plans = ["To immediately alert those in the villa about the approaching guards.", "To convey the urgency and severity of the situation, emphasizing the guards' intent to arrest everyone.", "To escape the villa herself, as her warning is followed by an exhortation to 'Run! Run!'"],
        ap.beliefs = ["Believes the Emperor's guards represent a significant and immediate threat.", "Believes that the guards are coming to arrest everyone at the villa, not just a select few.", "Believes that escape is the only viable option to avoid capture and punishment."],
        ap.goals = ["short-term\": \"Successfully deliver the warning message to Messalina and her companions, ensuring they understand the imminent danger.", "medium-term\": \"Escape from Silius's villa and evade capture by the Emperor's guards, seeking safety away from the immediate conflict.", "ultimate\": \"Ensure her own survival and avoid becoming a victim of the Emperor's wrath, potentially by fleeing Ostia or seeking refuge elsewhere."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Messalina leans against Mnester, her posture relaxed yet flushed with wine, embodying the revelry of the wedding celebration. She engages in playful banter about the shape of a cloud resembling Claudius, fully immersed in the joyous atmosphere until the mood shifts dramatically.',
        ap.emotional_state = 'Messalina\'s laughter and playful demeanor hint at surface confidence, but beneath it, there is a growing tension as the realization of the impending chaos looms. Her bravado begins to falter as panic grips her when the guards are mentioned, revealing her underlying fear of the consequences of her actions.',
        ap.emotional_tags = ["messalina's laughter", "playful demeanor hint at surface confidence, but beneath it, there is a growing tension as the realization of the impending chaos looms. her bravado begins to falter as panic grips her when the guards are mentioned, revealing her underlying fear of the consequences of her actions.", "messalina's laughter and playful demeanor hint at surface confidence", "but beneath it", "there is a growing tension as the realization of the impending chaos looms. her bravado begins to falter as panic grips her when the guards are mentioned", "revealing her underlying fear of the consequences of her actions.", "messalina's laughter and playful demeanor hint at surface confidence,", "beneath it, there is a growing tension as the realization of the impending chaos looms. her bravado begins to falter as panic grips her when the guards are mentioned, revealing her underlying fear of the consequences of her actions."],
        ap.active_plans = ["Continue to revel boldly in the wedding festivities without concern for the outside world.", "Maintain an air of confidence and defiance against Claudius's authority.", "Find ways to assert her dominance and allure over those around her, especially Gaius Silius."],
        ap.beliefs = ["She believes her charm and beauty can shield her from the consequences of her reckless behavior.", "Messalina thinks that defiance against Claudius is a game she can win.", "She holds the conviction that power dynamics can be manipulated through her sexual allure."],
        ap.goals = ["Short-term: Enjoy the wedding festivities and bask in the attention of her admirers.", "Medium-term: Strengthen her relationship with Silius and use their union to defy Claudius.", "Ultimate: Establish herself as the true power within Rome, effectively dismissing Claudius's authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Gaius Silius stands nearby, confidently engaging in the banter initiated by Messalina and Mnester, showcasing his arrogance as he dismisses the notion of danger approaching them. His posture is relaxed and self-assured, embodying the celebratory atmosphere of the wedding.',
        ap.emotional_state = 'Silius\'s outward bravado and laughter mask an overconfidence that borders on recklessness. Internally, he may feel a flicker of concern at the mention of guards, but he quickly suppresses it, believing in his perceived invincibility and the celebration\'s atmosphere.',
        ap.emotional_tags = ["silius's outward bravado", "laughter mask an overconfidence that borders on recklessness. internally, he may feel a flicker of concern at the mention of guards, but he quickly suppresses it, believing in his perceived invincibility", "the celebration's atmosphere.", "silius's outward bravado and laughter mask an overconfidence that borders on recklessness. internally", "he may feel a flicker of concern at the mention of guards", "but he quickly suppresses it", "believing in his perceived invincibility and the celebration's atmosphere.", "silius's outward bravado and laughter mask an overconfidence that borders on recklessness. internally, he may feel a flicker of concern at the mention of guards,", "he quickly suppresses it, believing in his perceived invincibility and the celebration's atmosphere."],
        ap.active_plans = ["Encourage the revelry to continue and assert his authority in the villa.", "Mock Claudius openly to maintain the sense of superiority he feels in the moment.", "Prepare to handle any situation that arises from the guards' potential arrival."],
        ap.beliefs = ["He believes that his current status and relationship with Messalina render him untouchable.", "Silius thinks that mocking Claudius's authority is a show of strength.", "He holds the conviction that he can control the narrative of this event regardless of outside threats."],
        ap.goals = ["Short-term: Continue enjoying the wedding festivities without fear.", "Medium-term: Solidify his position and influence within the emerging power dynamics.", "Ultimate: Eliminate Claudius's hold on power and take a leading role in the new order he envisions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Mnester engages with Messalina and Silius, contributing to the lighthearted banter about clouds and Claudius, embodying the role of the charming entertainer. His playful banter is showcased through a humorous metaphor, illustrating both his wit and his keen awareness of the situation.',
        ap.emotional_state = 'Mnester appears at ease and jovial, fully immersed in the celebrations. However, there is an undercurrent of anxiety as he transitions from humor to a more serious observation about the guards, revealing his perceptive nature and a sense of foreboding that contrasts with the revelry around him.',
        ap.emotional_tags = ["mnester appears at ease", "jovial, fully immersed in the celebrations. however, there is an undercurrent of anxiety as he transitions from humor to a more serious observation about the guards, revealing his perceptive nature", "a sense of foreboding that contrasts with the revelry around him.", "mnester appears at ease and jovial", "fully immersed in the celebrations. however", "there is an undercurrent of anxiety as he transitions from humor to a more serious observation about the guards", "revealing his perceptive nature and a sense of foreboding that contrasts with the revelry around him."],
        ap.active_plans = ["Continue entertaining the guests while maintaining a light atmosphere.", "Serve as a comedic voice that brings levity to the situation, even as tensions begin to rise.", "Stay alert to the changing dynamics around him and react accordingly to any threats."],
        ap.beliefs = ["He believes that humor and charm can diffuse tension and maintain the celebratory atmosphere.", "Mnester thinks that awareness of the surroundings is crucial for survival in a politically charged environment.", "He holds the conviction that his role as an entertainer is vital to the success of events like this."],
        ap.goals = ["Short-term: Keep the atmosphere light and entertaining for all guests.", "Medium-term: Use his charm to forge closer connections with powerful figures in attendance.", "Ultimate: Establish himself as a key figure in the social scene of Rome, valued for his wit and insight."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_4'})
    ON CREATE SET
        ap.current_status = 'The girl rushes into the villa, breathless and panicked, her presence disrupting the festive atmosphere. She delivers the crucial message about the approaching guards, her urgency and fear starkly contrasting the revelry that had been ongoing.',
        ap.emotional_state = 'Her frantic demeanor is marked by fear and urgency, creating a palpable tension in the air. The panic in her voice reflects an awareness of the danger that the other guests are oblivious to, highlighting her role as the harbinger of doom.',
        ap.emotional_tags = ["her frantic demeanor is marked by fear", "urgency, creating a palpable tension in the air. the panic in her voice reflects an awareness of the danger that the other guests are oblivious to, highlighting her role as the harbinger of doom.", "her frantic demeanor is marked by fear and urgency", "creating a palpable tension in the air. the panic in her voice reflects an awareness of the danger that the other guests are oblivious to", "highlighting her role as the harbinger of doom."],
        ap.active_plans = ["Get the guests to understand the gravity of the situation and prompt them to flee.", "Ensure the message about the guards is delivered rapidly and effectively to avoid further chaos.", "Protect herself by escaping the villa once her warning is given."],
        ap.beliefs = ["She believes that timely warnings can save lives and prevent disaster.", "The girl thinks that the chaos of the wedding will make it difficult for the guests to grasp the urgency of her message.", "She holds the conviction that her role, though minor, is crucial in the face of impending danger."],
        ap.goals = ["Short-term: Warn the guests about the guards' approach and incite immediate action.", "Medium-term: Ensure her own safety amidst the chaos that ensues.", "Ultimate: Become a figure of significance in a moment of crisis, helping others escape danger."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Pallas stands amidst the bustling chaos of the palace corridor, a figure of icy composure amidst the turmoil. He is actively questioning Geta, his gaze sharp and probing as he seeks to ascertain critical information about the unfolding crisis. He gestures with controlled movements, his posture erect and commanding, indicating his authority even in the midst of widespread panic and arrests. Pallas is clearly in command of the immediate situation, directing inquiries and managing the flow of information.',
        ap.emotional_state = 'Pallas projects an aura of cold, professional detachment, his surface emotions carefully masked to maintain control. He is likely feeling a deep sense of urgency and controlled fury at the disruption caused by Messalina\'s actions, recognizing the immense threat to the established order. Beneath this veneer of calm, there\'s a calculated determination to restore stability and exploit the situation to further solidify his own power. He suppresses any personal feelings, focusing solely on strategic objectives and the ruthless efficiency required to quell the crisis.',
        ap.emotional_tags = ["pallas projects an aura of cold, professional detachment, his surface emotions carefully masked to maintain control. he is likely feeling a deep sense of urgency", "controlled fury at the disruption caused by messalina's actions, recognizing the immense threat to the established order. beneath this veneer of calm, there's a calculated determination to restore stability", "exploit the situation to further solidify his own power. he suppresses any personal feelings, focusing solely on strategic objectives", "the ruthless efficiency required to quell the crisis.", "pallas projects an aura of cold", "professional detachment", "his surface emotions carefully masked to maintain control. he is likely feeling a deep sense of urgency and controlled fury at the disruption caused by messalina's actions", "recognizing the immense threat to the established order. beneath this veneer of calm", "there's a calculated determination to restore stability and exploit the situation to further solidify his own power. he suppresses any personal feelings", "focusing solely on strategic objectives and the ruthless efficiency required to quell the crisis."],
        ap.active_plans = ["Determine the Emperor's exact location and ensure his safety and isolation from Messalina until Pallas can fully control the narrative.", "Assess the full scope of Messalina's conspiracy by extracting information from Geta regarding the number of arrests and key figures apprehended.", "Prevent Messalina from reaching Claudius directly and influencing him with her emotional appeals, thereby safeguarding Pallas's control over the Emperor's perception of events."],
        ap.beliefs = ["Unwavering order and stringent control are essential for the preservation of the Roman Empire, and any disruption must be swiftly and decisively crushed.", "Messalina's blatant disregard for imperial authority and her treasonous actions are unforgivable and demand the severest consequences to deter future challenges to power.", "Pragmatism and strategic manipulation are the most effective tools for navigating the treacherous currents of Roman politics and maintaining personal influence."],
        ap.goals = ["Short-term Goal: Secure immediate control over the palace and prevent any further escalation of the chaos caused by Messalina's rebellion.", "Medium-term Goal: Orchestrate Messalina's downfall and ensure she is permanently removed as a threat to Claudius's reign and Pallas's own influence.", "Ultimate Goal: Consolidate his position as the key advisor to Claudius, becoming indispensable in maintaining stability and wielding significant power behind the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Geta stands rigidly before Pallas in the bustling palace corridor, surrounded by guards and prisoners, his posture conveying dutiful attention. He answers Pallas\'s questions directly and efficiently, reporting on the Emperor\'s location and the number of arrests. He is clearly acting in his capacity as a palace guard, focused on providing accurate information and fulfilling his assigned role in the unfolding crisis. His movements are likely minimal and functional, reflecting his subordinate position and focus on conveying information clearly.',
        ap.emotional_state = 'Geta maintains a professional and detached demeanor, his surface emotions reflecting a sense of dutiful seriousness. Internally, he is likely experiencing a heightened awareness of the palace\'s chaotic state and the gravity of the situation, understanding the significance of Messalina\'s betrayal. However, as a palace guard, his primary emotional response is disciplined compliance and a focus on executing his orders efficiently, suppressing any personal feelings or anxieties to maintain his professional composure in the face of imperial crisis.',
        ap.emotional_tags = ["geta maintains a professional", "detached demeanor, his surface emotions reflecting a sense of dutiful seriousness. internally, he is likely experiencing a heightened awareness of the palace's chaotic state", "the gravity of the situation, understanding the significance of messalina's betrayal. however, as a palace guard, his primary emotional response is disciplined compliance", "a focus on executing his orders efficiently, suppressing any personal feelings or anxieties to maintain his professional composure in the face of imperial crisis.", "geta maintains a professional and detached demeanor", "his surface emotions reflecting a sense of dutiful seriousness. internally", "he is likely experiencing a heightened awareness of the palace's chaotic state and the gravity of the situation", "understanding the significance of messalina's betrayal. however", "as a palace guard", "his primary emotional response is disciplined compliance and a focus on executing his orders efficiently", "suppressing any personal feelings or anxieties to maintain his professional composure in the face of imperial crisis."],
        ap.active_plans = ["Accurately and efficiently answer Pallas's questions regarding the Emperor's location and the status of arrests, ensuring clear and concise communication.", "Continue to follow any further orders issued by Pallas or other superiors to maintain order and security within the palace during the crisis.", "Remain vigilant and observant of the ongoing events in the palace corridor, ready to respond to any security threats or instructions as they arise."],
        ap.beliefs = ["Unquestioning obedience to imperial authority and the chain of command is paramount for a palace guard.", "Maintaining order and security within the palace is his primary responsibility and must be upheld with unwavering dedication.", "Clear and efficient communication is essential for effective functioning within the imperial security apparatus, particularly during times of crisis."],
        ap.goals = ["Short-term Goal: Provide Pallas with all requested information accurately and promptly, fulfilling his immediate duty in the interrogation.", "Medium-term Goal: Contribute to the restoration of order and security within the palace by diligently executing all assigned tasks and orders.", "Ultimate Goal: Maintain his position as a reliable and dutiful palace guard, demonstrating his loyalty and competence to ensure continued employment and potential advancement within the imperial security ranks."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Messalina bursts into the chaotic corridor, her hair disheveled, clothes in disarray, pushing past guards with a frantic urgency. Her movements are wild and desperate, displaying a palpable determination to reach Claudius amidst the storm of arrests surrounding her.',
        ap.emotional_state = 'Messalina is layered with emotions; on the surface, she exudes desperation, her voice rising with urgency as she seeks her husband. Internally, fear and anxiety claw at her, knowing the precariousness of her situation. There is a stark tension between her frantic need for Claudius\'s support and the cold reality of her precarious status as the accused.',
        ap.emotional_tags = ["messalina is layered with emotions; on the surface, she exudes desperation, her voice rising with urgency as she seeks her husband. internally, fear", "anxiety claw at her, knowing the precariousness of her situation. there is a stark tension between her frantic need for claudius's support", "the cold reality of her precarious status as the accused.", "messalina is layered with emotions; on the surface", "she exudes desperation", "her voice rising with urgency as she seeks her husband. internally", "fear and anxiety claw at her", "knowing the precariousness of her situation. there is a stark tension between her frantic need for claudius's support and the cold reality of her precarious status as the accused.", "messalina is layered with emotions", "on the surface, she exudes desperation, her voice rising with urgency as she seeks her husband. internally, fear and anxiety claw at her, knowing the precariousness of her situation. there is a stark tension between her frantic need for claudius's support and the cold reality of her precarious status as the accused."],
        ap.active_plans = ["To confront Claudius directly, seeking to sway him to her side amid the chaos.", "To plead her case and defend her honor against the accusations being thrust upon her.", "To regain control over her narrative and appeal to Claudius's affection, hoping to stave off impending doom."],
        ap.beliefs = ["Believes that her status as Empress grants her the right to access Claudius without obstruction.", "Holds a misguided faith in Claudius's love and loyalty, viewing him as a potential ally in her moment of crisis.", "Thinks that she can still manipulate the situation to her advantage despite the mounting evidence against her."],
        ap.goals = ["Short-term: To see Claudius immediately and plead her case against the charges.", "Medium-term: To mitigate the fallout from her actions and regain her standing in the court.", "Ultimate: To secure her position and power as Empress without losing Claudius\u2019s love and support."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands firm in the palace corridor, an immovable barrier against Messalina\'s frantic attempt to reach Claudius. He is physically imposing, blocking her path with a rigid posture and controlled movements. He gestures dismissively towards her and barks orders to the guards to remove her from the scene, maintaining a cold, professional distance.',
        ap.emotional_state = 'Narcissus exudes an air of icy contempt and controlled fury. Outwardly, he is calm and authoritative, his tone sharp and dismissive. Internally, he is driven by a deep-seated disgust for Messalina\'s actions and a resolute determination to restore order. There\'s no hint of sympathy or hesitation in his demeanor; he sees her purely as a chaotic element to be purged.',
        ap.emotional_tags = ["narcissus exudes an air of icy contempt", "controlled fury. outwardly, he is calm", "authoritative, his tone sharp", "dismissive. internally, he is driven by a deep-seated disgust for messalina's actions", "a resolute determination to restore order. there's no hint of sympathy or hesitation in his demeanor; he sees her purely as a chaotic element to be purged.", "narcissus exudes an air of icy contempt and controlled fury. outwardly", "he is calm and authoritative", "his tone sharp and dismissive. internally", "he is driven by a deep-seated disgust for messalina's actions and a resolute determination to restore order. there's no hint of sympathy or hesitation in his demeanor; he sees her purely as a chaotic element to be purged.", "narcissus exudes an air of icy contempt and controlled fury. outwardly, he is calm and authoritative, his tone sharp and dismissive. internally, he is driven by a deep-seated disgust for messalina's actions and a resolute determination to restore order. there's no hint of sympathy or hesitation in his demeanor", "he sees her purely as a chaotic element to be purged."],
        ap.active_plans = ["Prevent Messalina from directly contacting Claudius and potentially manipulating him.", "Assert his authority over Messalina, stripping her of any remaining imperial dignity.", "Ensure Messalina is swiftly removed from the corridor and confined to her chambers, isolating her from further influence."],
        ap.beliefs = ["Messalina's actions are a grave threat to the stability of the empire and must be dealt with decisively.", "Emotional appeals and familial ties are irrelevant in matters of state and security.", "Ruthless pragmatism is the only effective approach to maintaining control in the treacherous world of Roman politics."],
        ap.goals = ["Short-term Goal: Immediately neutralize Messalina's attempt to reach Claudius and cause further disruption.", "Medium-term Goal: Secure Messalina's isolation and ensure she faces the consequences of her treasonous actions.", "Ultimate Goal: Eliminate Messalina as a threat to Claudius and the empire, thereby reinforcing his own position and the stability of Roman rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Messalina bursts into the corridor, a whirlwind of disarray and desperation. Her clothes are disheveled, her hair likely undone, reflecting the chaos of her unraveling world. She pushes through guards, frantically searching for Claudius, her movements erratic and driven by panic. She is physically forceful in her attempts to bypass Narcissus, but ultimately futile against his resolute stance.',
        ap.emotional_state = 'Messalina is a tempest of raw, untamed emotions. On the surface, she projects fury and imperial entitlement, screaming demands and insults. Beneath this facade, however, is a core of abject terror and denial. She is desperate, clinging to the remnants of her former power and the hope that Claudius, her husband, will intervene. There\'s a frantic, almost childlike plea in her cries, masked by rage and disbelief at her sudden fall from grace.',
        ap.emotional_tags = ["messalina is a tempest of raw, untamed emotions. on the surface, she projects fury", "imperial entitlement, screaming demands", "insults. beneath this facade, however, is a core of abject terror", "denial. she is desperate, clinging to the remnants of her former power", "the hope that claudius, her husband, will intervene. there's a frantic, almost childlike plea in her cries, masked by rage", "disbelief at her sudden fall from grace.", "messalina is a tempest of raw", "untamed emotions. on the surface", "she projects fury and imperial entitlement", "screaming demands and insults. beneath this facade", "however", "is a core of abject terror and denial. she is desperate", "clinging to the remnants of her former power and the hope that claudius", "her husband", "will intervene. there's a frantic", "almost childlike plea in her cries", "masked by rage and disbelief at her sudden fall from grace."],
        ap.active_plans = ["Reach Claudius and plead for his mercy, attempting to leverage their marital bond and his past affection.", "Assert her imperial status and intimidate those who dare to stand against her, hoping to regain control of the situation through sheer force of will.", "Delay or prevent her arrest and confinement, buying time to find a way to escape the consequences of her actions."],
        ap.beliefs = ["Her position as Empress and wife of Claudius should afford her protection and deference, even in this crisis.", "Claudius's love for her is a powerful force that she can still manipulate to her advantage.", "She can still talk her way out of this situation, relying on her charm and persuasive abilities, even in the face of overwhelming evidence against her."],
        ap.goals = ["Short-term Goal: Break through Narcissus's blockade and gain immediate access to Claudius.", "Medium-term Goal: Convince Claudius of her innocence or at least mitigate his wrath, avoiding severe punishment.", "Ultimate Goal: Restore her position as Empress, regain her freedom, and somehow salvage her shattered power, ideally returning to her previous life of influence and pleasure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_17_4'})
    ON CREATE SET
        ap.current_status = 'Domitia steps forward with indignation, her posture firm and authoritative as she boldly confronts Narcissus. Her presence commands attention, her voice raised to defend Messalina\'s royal status amidst the chaos of guards and prisoners, asserting the importance of familial bonds in a world steeped in betrayal.',
        ap.emotional_state = 'Domitia exhibits a fierce protectiveness mixed with outrage. Her surface emotions reveal a steadfast loyalty to her niece, yet beneath that, there is a tension stemming from the political machinations surrounding them. She feels the weight of her family\'s honor, caught between anger at Narcissus\'s contempt and fear for Messalina\'s fate.',
        ap.emotional_tags = ["domitia exhibits a fierce protectiveness mixed with outrage. her surface emotions reveal a steadfast loyalty to her niece, yet beneath that, there is a tension stemming from the political machinations surrounding them. she feels the weight of her family's honor, caught between anger at narcissus's contempt", "fear for messalina's fate.", "domitia exhibits a fierce protectiveness mixed with outrage. her surface emotions reveal a steadfast loyalty to her niece", "yet beneath that", "there is a tension stemming from the political machinations surrounding them. she feels the weight of her family's honor", "caught between anger at narcissus's contempt and fear for messalina's fate."],
        ap.active_plans = ["To intervene and defend Messalina against Narcissus's accusations.", "To remind the court of Messalina's status as the Emperor's wife and mother of his children.", "To assert familial loyalty in the face of political intrigue."],
        ap.beliefs = ["Family loyalty is paramount and must be defended at all costs.", "Noble status should afford protection and dignity, even amidst scandal.", "The political machinations of the court are a threat to familial bonds."],
        ap.goals = ["Short-term: To protect Messalina from further humiliation and potential harm.", "Medium-term: To rally support among other nobles for Messalina's defense.", "Ultimate: To ensure that Messalina's royal status is recognized and respected, preserving the family's honor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_4'})
    ON CREATE SET
        ap.current_status = 'Messalina bursts through the crowd, her disheveled appearance betraying her desperation. She pushes past Narcissus, frantic and frantic, with wild gestures of urgency, demanding to see Claudius, embodying a mixture of defiance and vulnerability as she seeks refuge in her husband\'s presence.',
        ap.emotional_state = 'Messalina\'s emotional state oscillates between frantic desperation and fierce indignation. Outwardly, she projects anger and urgency, but internally, she is gripped by fear and the realization of her precarious position. There’s a profound conflict between her need for Claudius\'s support and the acknowledgment of her own actions that have led her to this moment.',
        ap.emotional_tags = ["messalina's emotional state oscillates between frantic desperation", "fierce indignation. outwardly, she projects anger", "urgency, but internally, she is gripped by fear", "the realization of her precarious position. there\u2019s a profound conflict between her need for claudius's support", "the acknowledgment of her own actions that have led her to this moment.", "messalina's emotional state oscillates between frantic desperation and fierce indignation. outwardly", "she projects anger and urgency", "but internally", "she is gripped by fear and the realization of her precarious position. there\u2019s a profound conflict between her need for claudius's support and the acknowledgment of her own actions that have led her to this moment.", "messalina's emotional state oscillates between frantic desperation and fierce indignation. outwardly, she projects anger and urgency,", "internally, she is gripped by fear and the realization of her precarious position. there\u2019s a profound conflict between her need for claudius's support and the acknowledgment of her own actions that have led her to this moment."],
        ap.active_plans = ["To confront Narcissus and demand to see her husband, Claudius.", "To persuade anyone blocking her path that she is still the Empress and deserves respect.", "To seek protection from Claudius against the accusations and threats from the court."],
        ap.beliefs = ["Her royal status should afford her protection and respect, no matter the circumstances.", "Love and loyalty from Claudius are vital to her survival in this political landscape.", "She must assert her identity as the Emperor's wife to counteract the accusations against her."],
        ap.goals = ["Short-term: To reach Claudius and secure his support amid the chaos.", "Medium-term: To navigate the political fallout and regain her position of power.", "Ultimate: To escape the consequences of her actions and preserve her life and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_5'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands firmly in the palace corridor, directly blocking Messalina\'s frantic attempt to reach Claudius. He is composed and resolute, a figure of cold authority amidst the surrounding chaos, using his physical presence and sharp words to control the escalating situation and assert his dominance over the Empress.',
        ap.emotional_state = 'Narcissus is controlled and contemptuous. Outwardly, he projects icy authority, his voice dripping with disdain as he confronts Messalina. Internally, he feels a cold satisfaction at her downfall, believing he is restoring order and punishing chaos. He is unmoved by her distress, seeing her as a manipulative threat finally being neutralized. There is no empathy, only pragmatic efficiency and perhaps a hint of vengeful satisfaction in his actions.',
        ap.emotional_tags = ["narcissus is controlled", "contemptuous. outwardly, he projects icy authority, his voice dripping with disdain as he confronts messalina. internally, he feels a cold satisfaction at her downfall, believing he is restoring order", "punishing chaos. he is unmoved by her distress, seeing her as a manipulative threat finally being neutralized. there is no empathy, only pragmatic efficiency", "perhaps a hint of vengeful satisfaction in his actions.", "narcissus is controlled and contemptuous. outwardly", "he projects icy authority", "his voice dripping with disdain as he confronts messalina. internally", "he feels a cold satisfaction at her downfall", "believing he is restoring order and punishing chaos. he is unmoved by her distress", "seeing her as a manipulative threat finally being neutralized. there is no empathy", "only pragmatic efficiency and perhaps a hint of vengeful satisfaction in his actions."],
        ap.active_plans = ["Prevent Messalina from reaching Claudius and influencing him.", "Publicly humiliate and degrade Messalina to diminish her remaining influence.", "Enforce the arrest order and ensure Messalina is removed from the scene to await her fate."],
        ap.beliefs = ["Messalina's actions are a grave threat to the stability of Rome and Claudius's rule.", "He is acting in Claudius's best interest by protecting him from Messalina's deceit.", "Moral superiority over Messalina due to her debauchery and treason.", "Ruthless action is necessary to maintain order and control in the empire."],
        ap.goals = ["Short-term: Immediately stop Messalina's advance and remove her from the corridor.", "Medium-term: Ensure Messalina's complete isolation and prevent any further attempts to manipulate Claudius.", "Ultimate: Solidify his own power and influence by orchestrating Messalina's downfall and demonstrating his control over the situation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_5'})
    ON CREATE SET
        ap.current_status = 'Messalina bursts into the palace corridor, a disheveled whirlwind of desperation. She is pushing through guards, her imperial composure shattered, her movements frantic as she desperately seeks Claudius. She is physically struggling against those who try to restrain her, her voice raw with panic and outrage as she demands to see her husband.',
        ap.emotional_state = 'Messalina is a tempest of conflicting emotions. On the surface, she displays furious entitlement and rage, screaming accusations and demanding her imperial rights. Beneath this facade, raw fear and desperation claw at her. She is in denial of the gravity of her situation, clinging to the hope that her status and past relationship with Claudius can save her. Her internal state is a chaotic mix of terror, humiliation, and a desperate, fading hope for mercy, masked by outward fury and defiance.',
        ap.emotional_tags = ["messalina is a tempest of conflicting emotions. on the surface, she displays furious entitlement", "rage, screaming accusations", "demanding her imperial rights. beneath this facade, raw fear", "desperation claw at her. she is in denial of the gravity of her situation, clinging to the hope that her status", "past relationship with claudius can save her. her internal state is a chaotic mix of terror, humiliation,", "a desperate, fading hope for mercy, masked by outward fury", "defiance.", "messalina is a tempest of conflicting emotions. on the surface", "she displays furious entitlement and rage", "screaming accusations and demanding her imperial rights. beneath this facade", "raw fear and desperation claw at her. she is in denial of the gravity of her situation", "clinging to the hope that her status and past relationship with claudius can save her. her internal state is a chaotic mix of terror", "humiliation", "and a desperate", "fading hope for mercy", "masked by outward fury and defiance."],
        ap.active_plans = ["Reach Claudius and directly appeal to him, hoping to sway his emotions or manipulate him.", "Assert her imperial status and demand to be treated as Empress, attempting to intimidate those who oppose her.", "Evade capture or restraint, fighting to maintain her freedom and access to Claudius."],
        ap.beliefs = ["Claudius, despite everything, still holds some affection for her and might be swayed by her pleas.", "Her imperial status and motherhood should grant her immunity or at least a fair hearing.", "She can still manipulate her way out of this crisis through force of personality or emotional appeals.", "She is the Empress and deserves to be treated with deference, even in this dire situation."],
        ap.goals = ["Short-term: Immediately break through the guards and reach Claudius.", "Medium-term: Convince Claudius to forgive her, or at least delay judgment and allow her to plead her case.", "Ultimate: Survive the immediate crisis and somehow regain a semblance of her former power and position (though this goal is increasingly unrealistic)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_6'})
    ON CREATE SET
        ap.current_status = 'Messalina bursts through the crowd, her disheveled appearance and frantic movements signaling her desperation. She pushes forward, ignoring the guards and others around her, intent on reaching Claudius, her husband, whom she believes she can still sway.',
        ap.emotional_state = 'Outwardly, Messalina\'s desperation is palpable; her voice trembles with urgency and fear as she cries out for Claudius. Internally, she wrestles with a storm of panic, knowing the precariousness of her situation. There is a stark contrast between her frantic efforts to reclaim power and the reality of her increasing isolation as a condemned woman.',
        ap.emotional_tags = ["outwardly, messalina's desperation is palpable; her voice trembles with urgency", "fear as she cries out for claudius. internally, she wrestles with a storm of panic, knowing the precariousness of her situation. there is a stark contrast between her frantic efforts to reclaim power", "the reality of her increasing isolation as a condemned woman.", "outwardly", "messalina's desperation is palpable; her voice trembles with urgency and fear as she cries out for claudius. internally", "she wrestles with a storm of panic", "knowing the precariousness of her situation. there is a stark contrast between her frantic efforts to reclaim power and the reality of her increasing isolation as a condemned woman.", "outwardly, messalina's desperation is palpable", "her voice trembles with urgency and fear as she cries out for claudius. internally, she wrestles with a storm of panic, knowing the precariousness of her situation. there is a stark contrast between her frantic efforts to reclaim power and the reality of her increasing isolation as a condemned woman."],
        ap.active_plans = ["To confront Claudius and appeal to his emotions, hoping to regain her status and influence as Empress.", "To sway the opinions of those around her, including her supporters, by asserting her position as the mother of Claudius's children.", "To navigate the chaotic environment and maneuver past Narcissus and Pallas, seeking an audience with Claudius regardless of the obstacles."],
        ap.beliefs = ["I am the rightful Empress, and my bond with Claudius should shield me from judgment.", "My influence over Claudius can be restored if I can make him see my worth and loyalty.", "The court will recognize my status and the love of a wife must defend against treachery."],
        ap.goals = ["Short-term: To see Claudius and plead her case before him.", "Medium-term: To restore her position and evade the consequences of her actions.", "Ultimate: To maintain her power and influence in Rome, ensuring her and her children's safety."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_charge_sheets_event_18_2'})
    ON CREATE SET
        oi.description = 'The charge sheets are presented to Claudius by Pallas as a crucial document that formalizes the accusations against Messalina and her conspirators. They represent the shift towards legal action and political accountability for her treachery, driving the narrative of impending justice and the consequences of betrayal in the empire.',
        oi.status_before = 'The charge sheets exist as prepared documents, detailing the accusations against Messalina and Silius, awaiting Claudius\'s signature to initiate the legal process against them.',
        oi.status_after = 'After the event, the charge sheets carry Claudius\'s signature, marking the official start of the legal proceedings against Messalina, thus sealing her fate and amplifying the tension of the political climate in Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_charge_sheets'})
    MATCH (e:Event {uuid: 'event_18_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dagger_event_18_4'})
    ON CREATE SET
        oi.description = 'The dagger, a sharp and gleaming instrument, is a chilling symbol of autonomy in death, offered to Messalina by Geta as per Pallas\'s orders. Its presence embodies the brutal reality of the Emperor\'s decree while also reflecting the twisted mercy of allowing her to choose her fate. This stark offer underscores the calculated cruelty of the advisors, who manipulate the situation to spare Claudius from the harsher visual of an execution.',
        oi.status_before = 'The dagger remains a mere tool, polished and ready for use, representing the impending execution yet unassigned to any specific fate.',
        oi.status_after = 'After the event, the dagger may remain with Messalina as a choice for her self-inflicted death or is taken from her afterward to be re-stowed, forever a reminder of the brutal decisions of power.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dagger'})
    MATCH (e:Event {uuid: 'event_18_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Pallas stands within the newly erected Temple of Claudius in Colchester, his posture tense as he awaits the Emperor. Upon Claudius\'s arrival, Pallas immediately takes charge, delivering a concise report. He informs Claudius of the widespread arrests across Colchester, the capture of Silius, and the reassuring loyalty of the palace guard, maintaining a composed and efficient demeanor.',
        ap.emotional_state = 'Pallas projects an air of calm efficiency and controlled pragmatism. Outwardly, he is the picture of collected competence, focused on delivering necessary information and managing the unfolding crisis. Internally, he is likely driven by a cold ambition and a desire for order, prioritizing the stability of Rome above all else. There is a notable lack of empathy for Claudius\'s emotional turmoil, as Pallas\'s focus remains firmly on the political and strategic aspects of the situation.',
        ap.emotional_tags = ["pallas projects an air of calm efficiency", "controlled pragmatism. outwardly, he is the picture of collected competence, focused on delivering necessary information", "managing the unfolding crisis. internally, he is likely driven by a cold ambition", "a desire for order, prioritizing the stability of rome above all else. there is a notable lack of empathy for claudius's emotional turmoil, as pallas's focus remains firmly on the political", "strategic aspects of the situation.", "pallas projects an air of calm efficiency and controlled pragmatism. outwardly", "he is the picture of collected competence", "focused on delivering necessary information and managing the unfolding crisis. internally", "he is likely driven by a cold ambition and a desire for order", "prioritizing the stability of rome above all else. there is a notable lack of empathy for claudius's emotional turmoil", "as pallas's focus remains firmly on the political and strategic aspects of the situation."],
        ap.active_plans = ["To brief Claudius on the success of the arrests and the capture of key conspirators to reassure the Emperor and maintain control over the narrative.", "To present the charge sheets to Claudius for immediate signature, ensuring the legal process is swiftly enacted and demonstrating decisive action.", "To subtly guide Claudius towards accepting the necessary course of action, suggesting rest and emphasizing the needs of Rome to steer him away from emotional instability."],
        ap.beliefs = ["Maintaining order and stability within the Roman Empire is the highest priority, justifying even ruthless measures.", "Strong, decisive leadership is essential for effective governance, and emotional sentimentality is a weakness in a ruler.", "His own pragmatic approach and political acumen are crucial for guiding Claudius and safeguarding Rome's interests."],
        ap.goals = ["Short-term: Secure Claudius's signature on the charge sheets and ensure the smooth execution of the warrants to swiftly resolve the immediate crisis.", "Medium-term: Consolidate his own power and influence within the court by demonstrating competence and loyalty during this critical period.", "Ultimate: To contribute to the long-term stability and strength of the Roman Empire, ensuring his own position as a key advisor and power broker."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the newly built temple, his figure appearing weary and burdened under the moonlight. He listens to Pallas\'s report, his physical presence marked by a subdued demeanor. He does not engage in any commanding actions, but rather reacts with a sense of profound sorrow and confusion, his words laced with a pained lament for Messalina, indicating his internal struggle rather than outward command.',
        ap.emotional_state = 'Claudius is deeply consumed by sadness and bewilderment, his emotional state a stark contrast to the political machinations unfolding around him. Outwardly, he expresses confusion and sorrow, questioning Messalina\'s motives with a tone of genuine pain and tragic incomprehension. Internally, he is heartbroken and struggling to reconcile the betrayal with his lingering affection for his wife. He is emotionally devastated, grappling with the personal tragedy of betrayal more than the political implications, revealing a deep-seated naivety and vulnerability.',
        ap.emotional_tags = ["claudius is deeply consumed by sadness", "bewilderment, his emotional state a stark contrast to the political machinations unfolding around him. outwardly, he expresses confusion", "sorrow, questioning messalina's motives with a tone of genuine pain", "tragic incomprehension. internally, he is heartbroken", "struggling to reconcile the betrayal with his lingering affection for his wife. he is emotionally devastated, grappling with the personal tragedy of betrayal more than the political implications, revealing a deep-seated naivety", "vulnerability.", "claudius is deeply consumed by sadness and bewilderment", "his emotional state a stark contrast to the political machinations unfolding around him. outwardly", "he expresses confusion and sorrow", "questioning messalina's motives with a tone of genuine pain and tragic incomprehension. internally", "he is heartbroken and struggling to reconcile the betrayal with his lingering affection for his wife. he is emotionally devastated", "grappling with the personal tragedy of betrayal more than the political implications", "revealing a deep-seated naivety and vulnerability."],
        ap.active_plans = ["To passively receive information from Pallas regarding the arrests, demonstrating a reliance on his advisors in this moment of crisis.", "To express his bewilderment and sorrow over Messalina's actions, seeking to understand her motivations on a personal, emotional level rather than a strategic one.", "To implicitly accept the unfolding events as presented by Pallas and Narcissus, indicating a degree of resignation and emotional exhaustion in the face of betrayal."],
        ap.beliefs = ["He believed in the possibility of love and loyalty within his marriage, despite the evidence to the contrary, reflecting a deep-seated desire for genuine connection.", "He believes in justice and order, but is conflicted when it necessitates the downfall of someone he deeply cared for, showcasing his inherent moral conflict.", "He harbors a sense of personal inadequacy, possibly blaming himself for Messalina's unhappiness and actions, revealing a tragic flaw in his self-perception."],
        ap.goals = ["Short-term: To find some semblance of understanding or rationale behind Messalina's actions, even if it is rooted in delusion and wishful thinking.", "Medium-term: To process the profound emotional shock and pain of Messalina's betrayal and begin to navigate the personal wreckage of his shattered trust.", "Ultimate: To maintain the stability of the Roman Empire despite his personal devastation, fulfilling his duty as Emperor even as he grapples with immense personal loss and disillusionment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands within the temple, his posture composed yet tense as he presents the charge sheets to Claudius. He maintains a steady gaze, gesturing towards the documents with a sense of urgency while subtly positioning himself to guide Claudius\'s next actions.',
        ap.emotional_state = 'Outwardly calm, Pallas harbors an internal anxiety about the repercussions of Messalina\'s betrayal. He expresses a veneer of concern for Claudius\'s well-being, but beneath lies a calculated intent to manipulate the Emperor\'s grief into swift action against Messalina.',
        ap.emotional_tags = ["outwardly calm", "pallas harbors an internal anxiety about the repercussions of messalina's betrayal. he expresses a veneer of concern for claudius's well-being", "but beneath lies a calculated intent to manipulate the emperor's grief into swift action against messalina.", "outwardly calm, pallas harbors an internal anxiety about the repercussions of messalina's betrayal. he expresses a veneer of concern for claudius's well-being,", "beneath lies a calculated intent to manipulate the emperor's grief into swift action against messalina."],
        ap.active_plans = ["To prompt Claudius to sign the charge sheets against Messalina and her conspirators, ensuring the legal proceedings commence.", "To divert Claudius's focus from the emotional turmoil of his wife's actions by suggesting rest, thereby controlling the narrative of the moment.", "To maintain his position as a trusted advisor while eliminating threats that Messalina's indiscretions pose to the stability of the Empire."],
        ap.beliefs = ["The ends justify the means, and swift action must be taken to preserve order in the Empire.", "Empathy can be a tool for manipulation; understanding Claudius's feelings allows him to steer the Emperor's decisions.", "His loyalty is to the state first, maintaining power and stability over personal relationships."],
        ap.goals = ["Short-term: Secure Claudius's signature on the charge sheets to initiate Messalina's downfall.", "Medium-term: Consolidate power and influence in the wake of political upheaval created by Messalina's actions.", "Ultimate: Ensure his own position and authority in the court remain unchallenged regardless of the shifting power dynamics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the temple, weary and burdened by the weight of recent revelations. He stands slightly hunched, the tension in his posture indicating his emotional distress as he contemplates the gravity of Messalina\'s actions while speaking with a stammer, reflecting his internal turmoil.',
        ap.emotional_state = 'Claudius displays surface-level sorrow and confusion regarding Messalina\'s betrayal. Internally, he grapples with feelings of betrayal and disbelief, caught between his love for her and the harsh reality of her actions. His naivety clashes with the unfolding treachery, revealing an inherent vulnerability.',
        ap.emotional_tags = ["claudius displays surface-level sorrow", "confusion regarding messalina's betrayal. internally, he grapples with feelings of betrayal", "disbelief, caught between his love for her", "the harsh reality of her actions. his naivety clashes with the unfolding treachery, revealing an inherent vulnerability.", "claudius displays surface-level sorrow and confusion regarding messalina's betrayal. internally", "he grapples with feelings of betrayal and disbelief", "caught between his love for her and the harsh reality of her actions. his naivety clashes with the unfolding treachery", "revealing an inherent vulnerability."],
        ap.active_plans = ["To process the shock of Messalina's betrayal and understand her motivations, reflecting his naive perspective.", "To consider the implications of the arrests being made, particularly regarding his feelings for Messalina.", "To comply with the political necessity of signing the charge sheets, despite his emotional reservations."],
        ap.beliefs = ["Love and loyalty should be paramount, and he struggles to reconcile these with the reality of betrayal.", "The power of the Empire must be upheld, even at the personal cost of heartbreak.", "His authority, while significant, is often undermined by the very people he trusts, leading to a sense of helplessness."],
        ap.goals = ["Short-term: To understand the events surrounding Messalina's actions and make the right decisions as Emperor.", "Medium-term: To maintain some degree of control over the situation while managing his emotional state.", "Ultimate: To restore his image and governance in Rome, while grappling with the personal loss of his wife."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands within the newly erected temple in Colchester, his posture tense and focused. He listens briefly to Claudius\'s lament, but his attention is firmly fixed on the task at hand. With swift, precise movements, he produces the execution warrant from within his garments and hands it to Geta, issuing curt, clear instructions to ensure the sentence is carried out without delay or deviation.',
        ap.emotional_state = 'Narcissus projects an aura of icy calm and unwavering resolve. Outwardly, he shows no emotion, his face a mask of Roman pragmatism. Internally, he is driven by a cold, calculated determination to eliminate what he perceives as a threat to the stability of the empire. There is no hint of sympathy or moral conflict; his motivation is purely strategic and focused on maintaining order at any cost.',
        ap.emotional_tags = ["narcissus projects an aura of icy calm", "unwavering resolve. outwardly, he shows no emotion, his face a mask of roman pragmatism. internally, he is driven by a cold, calculated determination to eliminate what he perceives as a threat to the stability of the empire. there is no hint of sympathy or moral conflict; his motivation is purely strategic", "focused on maintaining order at any cost.", "narcissus projects an aura of icy calm and unwavering resolve. outwardly", "he shows no emotion", "his face a mask of roman pragmatism. internally", "he is driven by a cold", "calculated determination to eliminate what he perceives as a threat to the stability of the empire. there is no hint of sympathy or moral conflict; his motivation is purely strategic and focused on maintaining order at any cost.", "narcissus projects an aura of icy calm and unwavering resolve. outwardly, he shows no emotion, his face a mask of roman pragmatism. internally, he is driven by a cold, calculated determination to eliminate what he perceives as a threat to the stability of the empire. there is no hint of sympathy or moral conflict", "his motivation is purely strategic and focused on maintaining order at any cost."],
        ap.active_plans = ["Ensure Messalina's immediate and irreversible execution.", "Prevent any wavering or change of heart from Claudius regarding the execution.", "Reinforce the authority of the Emperor and the swiftness of Roman justice to deter future threats."],
        ap.beliefs = ["The stability of Rome and the Emperor's authority must be preserved above all else.", "Messalina's actions are a grave act of treason that demands the ultimate punishment.", "Ruthless efficiency and decisive action are necessary to maintain control and order within the empire."],
        ap.goals = ["goals\": [\n          \"Short-term: To see Messalina executed before dawn breaks.", "Medium-term: To quell any potential unrest or sympathy for Messalina by demonstrating swift and decisive justice.", "Ultimate: To solidify his own power and influence by ensuring the smooth and efficient resolution of this crisis, reinforcing his image as a reliable and indispensable advisor to Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_4'})
    ON CREATE SET
        ap.current_status = 'Pallas stands within the Temple of Claudius, his posture tense as he interacts with Claudius and Narcissus, conveying an air of urgency. He gestures towards the charge sheets, indicating the gravity of the situation, while his voice remains calm and measured.',
        ap.emotional_state = 'Pallas exudes a facade of calmness, but beneath lies the tension of political machinations. He feels the weight of responsibility and the urgency of the moment, but his true emotions remain hidden, revealing a manipulative pragmatism in his approach to Claudius\'s fragile state.',
        ap.emotional_tags = ["pallas exudes a facade of calmness, but beneath lies the tension of political machinations. he feels the weight of responsibility", "the urgency of the moment, but his true emotions remain hidden, revealing a manipulative pragmatism in his approach to claudius's fragile state.", "pallas exudes a facade of calmness", "but beneath lies the tension of political machinations. he feels the weight of responsibility and the urgency of the moment", "but his true emotions remain hidden", "revealing a manipulative pragmatism in his approach to claudius's fragile state.", "pallas exudes a facade of calmness,", "beneath lies the tension of political machinations. he feels the weight of responsibility and the urgency of the moment,", "his true emotions remain hidden, revealing a manipulative pragmatism in his approach to claudius's fragile state."],
        ap.active_plans = ["Ensure Claudius signs the charge sheets swiftly to solidify the execution order.", "Manipulate the narrative around Messalina's betrayal to maintain control over the Emperor's perception.", "Direct Geta to offer the dagger to Messalina as a twisted form of mercy to avoid the explicit brutality of the execution."],
        ap.beliefs = ["Power must be maintained through calculated actions and decisions.", "Compassion in politics is often a guise for manipulation.", "The ends justify the means, even if it involves cruelty."],
        ap.goals = ["Short-term: Secure Claudius's signature on the charge sheets.", "Medium-term: Consolidate power by managing the fallout from Messalina's execution.", "Ultimate: Establish himself as a key power broker in the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_4'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands with an icy demeanor, presenting the execution warrant to Geta. His body language is assertive, and his voice carries a chilling finality as he interjects into the discussion, emphasizing the need for swift action.',
        ap.emotional_state = 'Narcissus is composed, embodying a ruthless efficiency. There is an undercurrent of satisfaction in executing the plan against Messalina, but also a detached sense of responsibility, revealing his belief that order must be restored at any cost.',
        ap.emotional_tags = ["narcissus is composed", "embodying a ruthless efficiency. there is an undercurrent of satisfaction in executing the plan against messalina", "but also a detached sense of responsibility", "revealing his belief that order must be restored at any cost.", "narcissus is composed, embodying a ruthless efficiency. there is an undercurrent of satisfaction in executing the plan against messalina,", "also a detached sense of responsibility, revealing his belief that order must be restored at any cost."],
        ap.active_plans = ["Facilitate the execution of Messalina by providing the necessary documents.", "Influence Claudius's perception to ensure he remains oblivious to the true brutality of action.", "Support Pallas's directive to offer the dagger, viewing it as a means to minimize the emotional fallout for Claudius."],
        ap.beliefs = ["Control is paramount in maintaining the stability of the empire.", "Emotional detachment is essential for effective leadership.", "Compassion is a dangerous weakness in the face of treachery."],
        ap.goals = ["Short-term: Ensure the execution is carried out without complications.", "Medium-term: Reassert control within the court following Messalina's downfall.", "Ultimate: Secure his position as a leading advisor by demonstrating decisiveness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_18_4'})
    ON CREATE SET
        ap.current_status = 'Geta stands ready, a loyal guard with an air of stoic duty. He listens intently as the warrant for Messalina\'s execution is discussed, preparing to execute the Emperor’s orders with military precision.',
        ap.emotional_state = 'Geta is largely impassive, embodying a sense of duty that suppresses personal feelings. However, beneath his stoic exterior, he grapples with the moral implications of carrying out such a grim task.',
        ap.emotional_tags = ["geta is largely impassive", "embodying a sense of duty that suppresses personal feelings. however", "beneath his stoic exterior", "he grapples with the moral implications of carrying out such a grim task."],
        ap.active_plans = ["Carry out the execution of Messalina as ordered by Claudius.", "Present the dagger to Messalina, following Pallas's instruction.", "Maintain loyalty to the Emperor and ensure order among the guards during this tumultuous time."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, even in the face of moral dilemmas.", "Order must be maintained, regardless of personal feelings.", "The role of a guard is to follow orders without question."],
        ap.goals = ["Short-term: Execute the warrant without complications.", "Medium-term: Ensure the loyalty of his fellow guards during this crisis.", "Ultimate: Solidify his role as a reliable enforcer within the imperial palace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Messalina paces within her chambers, a caged tigress of imperial blood, her movements frantic and driven by desperation. She issues a flurry of urgent instructions to Domitia, her voice sharp with command, insisting a message be delivered to Claudius with utmost haste. She clutches at the last straws of hope, believing a personal plea will sway the Emperor.',
        ap.emotional_state = 'Messalina is a tempest of raw, exposed nerves. Outwardly, she projects a desperate hope, clinging to the belief that her father-husband will forgive her, her words laced with forced optimism. Beneath this facade, however, lies a churning vortex of terror and denial. Her frantic energy masks a profound fear of the consequences of her actions, a desperate attempt to control a situation spiraling out of her grasp. The bravado that once defined her has crumbled, revealing a core of vulnerability and panic.',
        ap.emotional_tags = ["messalina is a tempest of raw, exposed nerves. outwardly, she projects a desperate hope, clinging to the belief that her father-husband will forgive her, her words laced with forced optimism. beneath this facade, however, lies a churning vortex of terror", "denial. her frantic energy masks a profound fear of the consequences of her actions, a desperate attempt to control a situation spiraling out of her grasp. the bravado that once defined her has crumbled, revealing a core of vulnerability", "panic.", "messalina is a tempest of raw", "exposed nerves. outwardly", "she projects a desperate hope", "clinging to the belief that her father-husband will forgive her", "her words laced with forced optimism. beneath this facade", "however", "lies a churning vortex of terror and denial. her frantic energy masks a profound fear of the consequences of her actions", "a desperate attempt to control a situation spiraling out of her grasp. the bravado that once defined her has crumbled", "revealing a core of vulnerability and panic."],
        ap.active_plans = ["To dispatch Domitia with a crucial message to Claudius.", "To evoke Claudius's paternal affection and secure his forgiveness.", "To manipulate Claudius emotionally and regain her former standing."],
        ap.beliefs = ["Claudius still harbors deep paternal affection for her despite her transgressions.", "A direct, personal appeal to Claudius's emotions can override political considerations.", "She possesses the power to sway Claudius through her words and perceived vulnerability."],
        ap.goals = ["short_term\": \"Ensure Domitia immediately delivers her message to Claudius at the palace.", "medium_term\": \"Obtain Claudius's forgiveness and avert severe punishment for her actions.", "ultimate\": \"Re-establish her position as Empress and regain her lost influence and power within the Roman court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Domitia stands as a grim sentinel within Messalina\'s opulent chamber, her posture stiff with disapproval, her gaze fixed upon her niece\'s frantic display. She observes Messalina\'s desperate pacing and listens to her urgent commands, offering only words of somber condemnation in response to the Empress\'s plea for help. Her presence is a stark counterpoint to Messalina\'s turmoil, a figure of stoic Roman virtue amidst chaos.',
        ap.emotional_state = 'Domitia is a study in austere disapproval and weary pity. Outwardly, she expresses her moral judgment and disappointment in Messalina\'s actions, her voice tinged with sorrow. Internally, she is likely wrestling with a conflict between familial duty and her rigid sense of Roman propriety. While she may feel a flicker of pity for her niece\'s plight, it is overshadowed by her deep disapproval of Messalina\'s scandalous behavior and the dishonor it has brought upon their family. She anticipates a tragic outcome, viewing Messalina\'s frantic hope as delusional.',
        ap.emotional_tags = ["domitia is a study in austere disapproval", "weary pity. outwardly, she expresses her moral judgment", "disappointment in messalina's actions, her voice tinged with sorrow. internally, she is likely wrestling with a conflict between familial duty", "her rigid sense of roman propriety. while she may feel a flicker of pity for her niece's plight, it is overshadowed by her deep disapproval of messalina's scandalous behavior", "the dishonor it has brought upon their family. she anticipates a tragic outcome, viewing messalina's frantic hope as delusional.", "domitia is a study in austere disapproval and weary pity. outwardly", "she expresses her moral judgment and disappointment in messalina's actions", "her voice tinged with sorrow. internally", "she is likely wrestling with a conflict between familial duty and her rigid sense of roman propriety. while she may feel a flicker of pity for her niece's plight", "it is overshadowed by her deep disapproval of messalina's scandalous behavior and the dishonor it has brought upon their family. she anticipates a tragic outcome", "viewing messalina's frantic hope as delusional."],
        ap.active_plans = ["To listen to Messalina's desperate instructions and observe her niece's unraveling.", "To express her moral disapproval and offer a stark perspective on Messalina's situation.", "Implicitly, to decide whether to comply with Messalina's request to deliver the message, despite her own pessimism."],
        ap.beliefs = ["Messalina's actions have been a profound moral failing and a catastrophic error in judgment.", "Claudius is unlikely to be swayed by emotional appeals at this juncture, given the gravity of Messalina's treason.", "Roman virtue and stoicism demand acceptance of fate, even when it is grim, and emotional outbursts are futile."],
        ap.goals = ["short_term\": \"Observe Messalina's behavior and offer her own stern, disapproving perspective.", "medium_term\": \"Possibly agree to deliver Messalina's message, albeit with little faith in its efficacy.", "ultimate\": \"Maintain a semblance of Roman dignity amidst the unfolding scandal and guide Messalina towards a more stoic acceptance of her inevitable downfall."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Messalina paces frantically in her chambers, her movements jittery and anxious. She gestures emphatically toward Domitia, her posture tense with urgency, as she insists on delivering a message to her father. Her frantic energy radiates desperation, the weight of her situation pressing heavily upon her.',
        ap.emotional_state = 'Messalina\'s surface emotions reflect a frantic determination intermingled with fear. Her voice quivers with urgency, a stark contrast to the underlying dread that grips her heart. Internally, she is torn between ambition and the crushing reality of her actions, feeling the walls of consequence close in on her. There is a palpable tension between her external bravado and the internal turmoil of impending doom.',
        ap.emotional_tags = ["messalina's surface emotions reflect a frantic determination intermingled with fear. her voice quivers with urgency, a stark contrast to the underlying dread that grips her heart. internally, she is torn between ambition", "the crushing reality of her actions, feeling the walls of consequence close in on her. there is a palpable tension between her external bravado", "the internal turmoil of impending doom.", "messalina's surface emotions reflect a frantic determination intermingled with fear. her voice quivers with urgency", "a stark contrast to the underlying dread that grips her heart. internally", "she is torn between ambition and the crushing reality of her actions", "feeling the walls of consequence close in on her. there is a palpable tension between her external bravado and the internal turmoil of impending doom."],
        ap.active_plans = ["Convince Domitia to take a message to Claudius in hopes of securing his forgiveness.", "Manipulate the situation to regain favor and control over her narrative.", "Desperately seek a way to escape the consequences of her reckless actions."],
        ap.beliefs = ["She believes that familial loyalty can sway Claudius's judgment in her favor.", "Messalina holds on to the conviction that her charm and beauty can redeem her mistakes.", "She is convinced that her ambitions are worth the risks, despite the mounting evidence of her betrayal."],
        ap.goals = ["Short-term: Urgently get Domitia to deliver her message to Claudius.", "Medium-term: Regain her position of power and influence within the court.", "Ultimate: Maintain her marriage and status as Empress amidst the growing chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Domitia stands watching Messalina with a mixture of pity and disapproval, her arms crossed in a posture of stern judgement. While she tries to maintain a semblance of composure, her expression betrays her concern for Messalina\'s reckless ambitions. She remains steadfast, embodying the weight of tradition and moral obligation.',
        ap.emotional_state = 'Domitia\'s surface emotions reveal deep disappointment and concern for her cousin. Her tone is laced with a sternness that reflects her disappointment in Messalina\'s choices. Internally, she struggles with a sense of helplessness, torn between familial loyalty and the need to confront Messalina\'s self-destructive path. There is a conflict brewing within her, as she longs to guide Messalina toward a more honorable path.',
        ap.emotional_tags = ["domitia's surface emotions reveal deep disappointment", "concern for her cousin. her tone is laced with a sternness that reflects her disappointment in messalina's choices. internally, she struggles with a sense of helplessness, torn between familial loyalty", "the need to confront messalina's self-destructive path. there is a conflict brewing within her, as she longs to guide messalina toward a more honorable path.", "domitia's surface emotions reveal deep disappointment and concern for her cousin. her tone is laced with a sternness that reflects her disappointment in messalina's choices. internally", "she struggles with a sense of helplessness", "torn between familial loyalty and the need to confront messalina's self-destructive path. there is a conflict brewing within her", "as she longs to guide messalina toward a more honorable path."],
        ap.active_plans = ["Attempt to reason with Messalina about the consequences of her actions.", "Encourage Messalina to confront her mistakes rather than cling to false hopes.", "Seek a way to protect the family\u2019s honor despite Messalina's reckless decisions."],
        ap.beliefs = ["Domitia believes in the importance of tradition and moral integrity.", "She holds that one's actions have consequences that cannot be ignored.", "Domitia is convinced that loyalty must be tempered with accountability, especially in their turbulent world."],
        ap.goals = ["Short-term: Express her concern and urge Messalina to accept the repercussions of her actions.", "Medium-term: Preserve the family's reputation amidst the scandal.", "Ultimate: Help guide Messalina back to a path of dignity and honor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_3'})
    ON CREATE SET
        ap.current_status = 'Messalina is a whirlwind of nervous energy, pacing rapidly within her chambers. She issues hurried instructions to Domitia, pressing her to deliver a letter directly to Claudius with utmost secrecy.  Her movements are sharp and agitated, her focus entirely consumed by the hope of reaching her husband with a personal plea, convinced this will alter her dire fate.',
        ap.emotional_state = 'Messalina oscillates wildly between desperate hope and underlying terror. Outwardly, she projects frantic optimism, clinging to the belief that Claudius will forgive her upon reading her letter, a desperate attempt to deny the gravity of her situation.  Internally, she is wracked with anxiety, the sounds of the door and knocking amplifying her fragile hope while betraying a deeper fear of the inevitable consequences of her actions and the precariousness of her position.',
        ap.emotional_tags = ["messalina oscillates wildly between desperate hope", "underlying terror. outwardly, she projects frantic optimism, clinging to the belief that claudius will forgive her upon reading her letter, a desperate attempt to deny the gravity of her situation.  internally, she is wracked with anxiety, the sounds of the door", "knocking amplifying her fragile hope while betraying a deeper fear of the inevitable consequences of her actions", "the precariousness of her position.", "messalina oscillates wildly between desperate hope and underlying terror. outwardly", "she projects frantic optimism", "clinging to the belief that claudius will forgive her upon reading her letter", "a desperate attempt to deny the gravity of her situation.  internally", "she is wracked with anxiety", "the sounds of the door and knocking amplifying her fragile hope while betraying a deeper fear of the inevitable consequences of her actions and the precariousness of her position.", "messalina oscillates wildly between desperate hope and underlying terror. outwardly, she projects frantic optimism, clinging to the belief that claudius will forgive her upon reading her letter, a desperate attempt to deny the gravity of her situation.  internally, she is wracked with anxiety, the sounds of the door and knocking amplifying her fragile hope", "betraying a deeper fear of the inevitable consequences of her actions and the precariousness of her position."],
        ap.active_plans = ["Dispatch a secret letter to Claudius via Domitia, aiming to bypass his advisors and appeal directly to his emotions.", "Persuade herself that the sounds of knocking signify Claudius's imminent arrival, fostering a sense of hope and anticipation to counter her despair.", "Exert control over Domitia, ensuring the letter's delivery is swift and discreet, preventing any interception or sabotage by her enemies within the palace."],
        ap.beliefs = ["Claudius possesses a deep, paternalistic affection for her that transcends political considerations and personal betrayals.", "A direct, heartfelt appeal can effectively counter the machinations of her political adversaries and sway Claudius's judgment in her favor.", "Her personal influence over Claudius remains potent enough to secure forgiveness and potentially mitigate the consequences of her treasonous actions."],
        ap.goals = ["{type: short-term, description: To have Claudius read her letter immediately and be moved to see her, initiating a direct personal encounter.}", "{type: medium-term, description: To elicit forgiveness from Claudius, avoiding the harshest penalties and potentially salvaging her position and life.}", "{type: ultimate, description: To survive the current crisis, ideally regaining some semblance of her former power and influence, or at the very least, securing her personal safety and avoiding execution.}"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warrant_event_20_1'})
    ON CREATE SET
        oi.description = 'The warrant serves as a grim symbol of Claudius\'s betrayal, bearing his unmistakable signature. In this moment, it is presented by Geta to Messalina, illustrating the finality of the Emperor\'s decree. It underscores the cold bureaucratic nature of her execution, transforming her fate into an official act rather than a personal betrayal. The warrant becomes the instrument of her doom, stripping her of agency and forcing her to confront the cold reality of her situation.',
        oi.status_before = 'Prior to this event, the warrant exists as an official document prepared by Claudius, signed and sealed, ready to be enacted upon Messalina\'s impending execution.',
        oi.status_after = 'Following the event, the warrant signifies the irreversible nature of Messalina\'s fate, serving as a permanent reminder of her downfall and Claudius\'s betrayal. It remains a physical object of evidential importance, still bearing the Emperor\'s seal even as her life is extinguished.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warrant'})
    MATCH (e:Event {uuid: 'event_20_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warrant_event_20_2'})
    ON CREATE SET
        oi.description = 'The warrant, bearing Claudius\'s unmistakable signature, is presented by Geta to Messalina as irrefutable evidence of her death sentence. Geta explicitly points out Claudius\'s signature, emphasizing the official and irreversible nature of the decree. He urges Messalina to read it, forcing her to confront the stark reality of her husband\'s judgment and shattering her desperate denial. The warrant acts as a tangible embodiment of Claudius\'s ultimate betrayal and the crushing weight of imperial authority, triggering Messalina\'s final, visceral descent into terror and despair. It is the instrument that seals her fate, leaving no room for hope or escape.',
        oi.status_before = 'The warrant is held by Geta, having been issued under Claudius\'s authority, likely delivered to Geta by Narcissus or Pallas. Its status is that of an official, unread execution order, representing the Emperor\'s final judgment against Messalina, a symbol of impending doom yet to be fully revealed to its target.',
        oi.status_after = 'The warrant is thrust into Messalina\'s trembling hands, forcing her to directly confront the stark reality of Claudius\'s signed death sentence. While its physical state remains unchanged, its narrative significance is amplified; it has served its purpose as the definitive instrument of her condemnation, confirming her fate and solidifying the Emperor\'s will. It is likely to be retrieved by Geta after Messalina\'s death, serving as proof that the execution order was indeed carried out.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warrant'})
    MATCH (e:Event {uuid: 'event_20_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dagger_event_20_3'})
    ON CREATE SET
        oi.description = 'The dagger is presented to Messalina as a grim option for her fate, symbolizing the choice between self-inflicted death or brutal execution. It serves as a tangible reminder of her impending demise, embodying the stark reality of her situation and the weight of her decisions. Geta\'s offer to grant her the dagger first underscores the urgency and desperation of her circumstances.',
        oi.status_before = 'Prior to the event, the dagger is an ordinary Roman weapon, possibly kept within the guard\'s possession as a tool for self-defense or execution. It holds no particular significance beyond its function as a weapon.',
        oi.status_after = 'After the event, the dagger becomes irrevocably tied to Messalina\'s tragic fate, symbolizing lost agency and the brutality of her impending execution. Its status shifts from a simple weapon to an emblem of her helplessness in the face of death.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dagger'})
    MATCH (e:Event {uuid: 'event_20_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Geta stands firmly at the door of Messalina\'s chambers, his posture rigid and authoritative. He holds the warrant in one hand, presenting it with a detached efficiency that underscores the gravity of his message. His presence is a chilling intrusion, a reminder of the finality of his task as he delivers the Emperor\'s decree.',
        ap.emotional_state = 'Geta\'s demeanor is calm yet cold, reflecting a professional detachment as he carries out a grim duty. His face betrays no emotion, embodying the stoicism expected of a Roman guard, but internally he may feel the weight of executing such a painful order. There is no joy or malice, only an unwavering commitment to his role in the imperial machinery.',
        ap.emotional_tags = ["geta's demeanor is calm yet cold", "reflecting a professional detachment as he carries out a grim duty. his face betrays no emotion", "embodying the stoicism expected of a roman guard", "but internally he may feel the weight of executing such a painful order. there is no joy or malice", "only an unwavering commitment to his role in the imperial machinery.", "geta's demeanor is calm yet cold, reflecting a professional detachment as he carries out a grim duty. his face betrays no emotion, embodying the stoicism expected of a roman guard,", "internally he may feel the weight of executing such a painful order. there is no joy or malice, only an unwavering commitment to his role in the imperial machinery."],
        ap.active_plans = ["Deliver the Emperor's message to Messalina regarding her execution.", "Present the warrant as undeniable proof of Claudius's orders.", "Offer Messalina the choice of the dagger to emphasize the grim nature of her fate."],
        ap.beliefs = ["The Emperor's will is absolute and must be obeyed without question.", "His role as a guard is to enforce the law and maintain order in the empire.", "Compassion has no place in duty; loyalty to Claudius supersedes personal feelings."],
        ap.goals = ["To execute the Emperor's orders efficiently and without hesitation.", "To maintain a demeanor of professionalism despite the emotional weight of the task.", "To ensure that Messalina understands the gravity of her situation and the inevitability of her fate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands trembling in her chambers, her body language betraying her desperation as she clings to the hope of her husband\'s love. She shifts between denial and panic, her hands reaching out as if to grasp at the fleeting threads of her authority and life, her posture collapsing inward under the weight of impending doom.',
        ap.emotional_state = 'Messalina is engulfed in a tumultuous mix of fear and disbelief as she grapples with the reality of her husband\'s betrayal. Her outward protestations that Claudius would never condemn her are steeped in desperation, while internally, she is tormented by the realization of her imminent demise. The conflict between her previous confidence and her current vulnerability is stark, revealing her profound isolation.',
        ap.emotional_tags = ["messalina is engulfed in a tumultuous mix of fear", "disbelief as she grapples with the reality of her husband's betrayal. her outward protestations that claudius would never condemn her are steeped in desperation, while internally, she is tormented by the realization of her imminent demise. the conflict between her previous confidence", "her current vulnerability is stark, revealing her profound isolation.", "messalina is engulfed in a tumultuous mix of fear and disbelief as she grapples with the reality of her husband's betrayal. her outward protestations that claudius would never condemn her are steeped in desperation", "while internally", "she is tormented by the realization of her imminent demise. the conflict between her previous confidence and her current vulnerability is stark", "revealing her profound isolation.", "messalina is engulfed in a tumultuous mix of fear and disbelief as she grapples with the reality of her husband's betrayal. her outward protestations that claudius would never condemn her are steeped in desperation,", "internally, she is tormented by the realization of her imminent demise. the conflict between her previous confidence and her current vulnerability is stark, revealing her profound isolation."],
        ap.active_plans = ["To deny the validity of Geta's claims and cling to the hope that Claudius still loves her.", "To seek a way to escape her fate, either through pleading with Geta or finding a means of survival.", "To search for reassurance and evidence of Claudius's true feelings, hoping to turn the tide of her punishment."],
        ap.beliefs = ["Her husband, Claudius, would not truly wish for her death, as she believes in his affection for her.", "Power dynamics can be manipulated, and she still holds some influence despite her precarious situation.", "Desperation can lead to unexpected solutions, and she may yet find a way to save herself."],
        ap.goals = ["To convince Geta to spare her life, appealing to her past loyalty and Claudius's love.", "To find a means of self-preservation, whether through deception or by using the dagger offered to her.", "To understand the depth of Claudius's betrayal and its implications for her legacy as Empress."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Confined to her chambers, Messalina paces frantically, her movements mirroring a caged animal sensing its impending doom. She recoils violently at Geta\'s pronouncement, her body language expressing utter disbelief and desperate rejection of the situation. Her hands flutter ineffectually, gestures of denial against the encroaching reality.',
        ap.emotional_state = 'On the surface, Messalina vehemently denies Claudius\'s betrayal, her words a torrent of desperate protestations about her husband\'s supposed love and loyalty. Beneath this frantic denial, raw terror pulsates, a primal fear of death and, specifically, decapitation. An undercurrent of fragile hope persists, a desperate clinging to the fantasy that Claudius will relent, a stark contrast to the horrifying truth crashing down upon her.',
        ap.emotional_tags = ["on the surface, messalina vehemently denies claudius's betrayal, her words a torrent of desperate protestations about her husband's supposed love", "loyalty. beneath this frantic denial, raw terror pulsates, a primal fear of death and, specifically, decapitation. an undercurrent of fragile hope persists, a desperate clinging to the fantasy that claudius will relent, a stark contrast to the horrifying truth crashing down upon her.", "on the surface", "messalina vehemently denies claudius's betrayal", "her words a torrent of desperate protestations about her husband's supposed love and loyalty. beneath this frantic denial", "raw terror pulsates", "a primal fear of death and", "specifically", "decapitation. an undercurrent of fragile hope persists", "a desperate clinging to the fantasy that claudius will relent", "a stark contrast to the horrifying truth crashing down upon her."],
        ap.active_plans = ["To verbally deny the validity of the death sentence, hoping to sway Geta or create doubt.", "To delay the execution through emotional appeals and protestations, buying herself precious moments.", "To seek validation from Domitia, hoping her aunt will somehow intervene or offer an alternative."],
        ap.beliefs = ["Claudius's love for her is strong enough to override political machinations or advisors' influence.", "Her imperial status and past power should afford her some protection, even in this dire situation.", "She can manipulate emotions and situations through sheer force of will and denial."],
        ap.goals = ["Short-term: To avoid immediate execution and stay alive.", "Medium-term: To somehow communicate with Claudius and plead her case, hoping for mercy or a change of heart.", "Ultimate: To survive this ordeal and regain her former position and power, erasing this nightmare from her history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Geta stands rigidly at the threshold of Messalina\'s chambers, an impassive sentinel of imperial decree. He delivers the death sentence with cold, bureaucratic precision, his posture unwavering, his gaze fixed. He extends the warrant and the dagger with a detached efficiency, each movement devoid of personal inflection, a mere functionary executing his duty.',
        ap.emotional_state = 'Geta projects an aura of utter detachment, his surface emotion a mask of cold professionalism. Internally, he is likely focused solely on the execution of his orders, devoid of personal sentiment or empathy for Messalina\'s terror. There is an implicit acceptance of the brutal machinery of Roman justice, his role within it unquestioned and absolute, a chilling embodiment of imperial will.',
        ap.emotional_tags = ["geta projects an aura of utter detachment, his surface emotion a mask of cold professionalism. internally, he is likely focused solely on the execution of his orders, devoid of personal sentiment or empathy for messalina's terror. there is an implicit acceptance of the brutal machinery of roman justice, his role within it unquestioned", "absolute, a chilling embodiment of imperial will.", "geta projects an aura of utter detachment", "his surface emotion a mask of cold professionalism. internally", "he is likely focused solely on the execution of his orders", "devoid of personal sentiment or empathy for messalina's terror. there is an implicit acceptance of the brutal machinery of roman justice", "his role within it unquestioned and absolute", "a chilling embodiment of imperial will."],
        ap.active_plans = ["To formally present the death warrant to Messalina, ensuring she understands the irreversible nature of her situation.", "To offer the 'mercy' of suicide by dagger, as per his instructions, providing a means for a quicker, less gruesome end.", "To proceed with the full execution, including decapitation and the public display of her head, if Messalina refuses to cooperate with the 'merciful' option."],
        ap.beliefs = ["His duty is to obey the Emperor's commands without question or personal interpretation.", "Imperial justice, however harsh, is necessary and must be carried out efficiently and without sentimentality.", "His personal feelings or moral qualms are irrelevant in the face of his sworn loyalty to the Emperor and the Roman state."],
        ap.goals = ["Short-term: To deliver the death sentence and offer the dagger as instructed.", "Medium-term: To ensure Messalina's execution is carried out swiftly and cleanly, minimizing any disruption or delay.", "Ultimate: To maintain his reputation as a reliable and unquestioningly loyal guard, securing his position within the imperial hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Domitia stands as a grim, statuesque observer amidst Messalina\'s chaotic unraveling. Her posture is erect, her expression stern, radiating an austere disapproval of her niece\'s hysteria. She watches Messalina\'s descent into denial with a composed detachment, offering pragmatic, if cold, counsel as a representative of old Roman virtue.',
        ap.emotional_state = 'Domitia outwardly projects sternness and a severe disapproval of Messalina\'s emotional outburst, her surface emotion a mask of grim resignation and stoicism. Internally, while she may harbor a flicker of familial pity for Messalina\'s tragic end, it is heavily outweighed by her adherence to Roman ideals of dignity and acceptance of fate. There\'s an unspoken conflict between familial affection and her rigid moral code, ultimately prioritizing what she perceives as a \'noble\' Roman death over Messalina\'s desperate, undignified pleas.',
        ap.emotional_tags = ["domitia outwardly projects sternness", "a severe disapproval of messalina's emotional outburst, her surface emotion a mask of grim resignation", "stoicism. internally, while she may harbor a flicker of familial pity for messalina's tragic end, it is heavily outweighed by her adherence to roman ideals of dignity", "acceptance of fate. there's an unspoken conflict between familial affection", "her rigid moral code, ultimately prioritizing what she perceives as a 'noble' roman death over messalina's desperate, undignified pleas.", "domitia outwardly projects sternness and a severe disapproval of messalina's emotional outburst", "her surface emotion a mask of grim resignation and stoicism. internally", "while she may harbor a flicker of familial pity for messalina's tragic end", "it is heavily outweighed by her adherence to roman ideals of dignity and acceptance of fate. there's an unspoken conflict between familial affection and her rigid moral code", "ultimately prioritizing what she perceives as a 'noble' roman death over messalina's desperate", "undignified pleas.", "domitia outwardly projects sternness and a severe disapproval of messalina's emotional outburst, her surface emotion a mask of grim resignation and stoicism. internally,", "she may harbor a flicker of familial pity for messalina's tragic end, it is heavily outweighed by her adherence to roman ideals of dignity and acceptance of fate. there's an unspoken conflict between familial affection and her rigid moral code, ultimately prioritizing what she perceives as a 'noble' roman death over messalina's desperate, undignified pleas."],
        ap.active_plans = ["To guide Messalina towards a more dignified death, urging her to abandon her hysterical denial.", "To convince Messalina that suicide by dagger is the only honorable course of action left to her, sparing her further humiliation.", "To maintain her own composure and uphold the appearance of Roman stoicism in the face of impending tragedy, setting an example of 'proper' behavior."],
        ap.beliefs = ["Death is an inevitable part of life, and a noble Roman must face it with courage and stoicism, not fear and denial.", "Maintaining dignity in the face of death is paramount for a Roman of noble lineage, regardless of the circumstances.", "Suicide by dagger offers a measure of control and honor in a situation where all other control has been lost, a preferable alternative to butchery."],
        ap.goals = ["Short-term: To persuade Messalina to accept the dagger and end her life swiftly and 'honorably'.", "Medium-term: To ensure Messalina's death is conducted with as much Roman decorum as possible under the circumstances, minimizing scandal.", "Ultimate: To uphold the values of Roman nobility and family honor, even in the face of tragedy and disgrace, preserving a semblance of dignity for the family name."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Domitia stands resolutely in Messalina\'s chamber, her posture rigid and unwavering as she confronts her niece. With a firm grip on the situation, she embodies the cold, pragmatic stoicism of Roman tradition, compelling Messalina to face the brutal reality of her fate.',
        ap.emotional_state = 'Domitia\'s demeanor is marked by a stern resolve, revealing no sympathy for Messalina\'s plight. Beneath her pragmatic exterior lies a deep-seated disappointment, reflecting her belief in the necessity of facing harsh truths. Her tone, devoid of comfort, accentuates the finality of Messalina\'s situation, embodying the unforgiving nature of their world.',
        ap.emotional_tags = ["domitia's demeanor is marked by a stern resolve", "revealing no sympathy for messalina's plight. beneath her pragmatic exterior lies a deep-seated disappointment", "reflecting her belief in the necessity of facing harsh truths. her tone", "devoid of comfort", "accentuates the finality of messalina's situation", "embodying the unforgiving nature of their world."],
        ap.active_plans = ["Urge Messalina to accept her fate and take control of her impending death.", "Impart the stark reality of their situation to instill a sense of urgency and agency in Messalina.", "Prepare herself for the aftermath of Messalina's decision, ensuring her own survival amidst the chaos."],
        ap.beliefs = ["Life is to be faced with stoicism, not denial.", "Every individual must confront their own choices and the consequences that follow.", "Weakness in the face of danger is unacceptable and must be overcome."],
        ap.goals = ["Short-term: Encourage Messalina to seize the dagger and take charge of her own fate.", "Medium-term: Ensure that the family's honor is preserved even in the face of disgrace.", "Ultimate: Survive and maintain her status in the harsh political landscape of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands near the center of her chambers, visibly shaken and disheveled, her hands trembling as she confronts the reality of her situation. She oscillates between despair and denial, her movements frantic and pleading as she struggles to grasp the implications of Geta\'s message.',
        ap.emotional_state = 'Messalina is engulfed by a paralyzing fear, expressing outward denial and desperation through her frantic gestures and panicked voice. Internally, she battles a torrent of conflicting emotions, ranging from disbelief to terror at the thought of her impending execution. Her cries of \'Not my head!\' reveal a profound struggle between her instinct for survival and the haunting reality of her choices.',
        ap.emotional_tags = ["messalina is engulfed by a paralyzing fear, expressing outward denial", "desperation through her frantic gestures", "panicked voice. internally, she battles a torrent of conflicting emotions, ranging from disbelief to terror at the thought of her impending execution. her cries of 'not my head!' reveal a profound struggle between her instinct for survival", "the haunting reality of her choices.", "messalina is engulfed by a paralyzing fear", "expressing outward denial and desperation through her frantic gestures and panicked voice. internally", "she battles a torrent of conflicting emotions", "ranging from disbelief to terror at the thought of her impending execution. her cries of 'not my head!' reveal a profound struggle between her instinct for survival and the haunting reality of her choices."],
        ap.active_plans = ["Attempt to persuade Geta of Claudius's supposed mercy and loyalty.", "Seek to negotiate or manipulate her way out of the situation, clinging to hope against the grim reality.", "Delay her fate through emotional appeals, hoping for a last-minute reprieve."],
        ap.beliefs = ["Her husband, Claudius, would never condemn her to death and must still love her.", "Desperation can lead to salvation, and she may yet find a way to escape her fate.", "Power and beauty can protect her from the consequences of her actions."],
        ap.goals = ["Short-term: Evade immediate death by convincing Geta of her innocence.", "Medium-term: Regain control over her situation and seek reconciliation with Claudius.", "Ultimate: Preserve her life and power, finding a way to escape the impending execution."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warrant_event_21_2'})
    ON CREATE SET
        oi.description = 'The warrant serves as a tangible representation of Claudius’s command for Messalina\'s execution. Pallas presents it to Claudius with chilling calmness, signifying the bureaucratic finality of her death. This object encapsulates the themes of power, betrayal, and the cold nature of imperial authority.',
        oi.status_before = 'Prior to the event, the warrant is an official document bearing Claudius\'s signature, a mere piece of parchment awaiting execution of a harsh decree.',
        oi.status_after = 'Following the event, the warrant symbolizes the irrevocable act of betrayal that has been carried out, marking a turning point in the narrative and Claudius\'s personal journey.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warrant'})
    MATCH (e:Event {uuid: 'event_21_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Standing within the newly consecrated Temple of Claudius, as dawn\'s first light touches the stone, Claudius turns with a fragile sense of purpose. He speaks with a quiet but firm resolve, issuing a simple order to be reunited with his wife. His posture is likely expectant, perhaps even leaning slightly forward, his gaze directed towards an unseen doorway, anticipating Messalina\'s arrival, completely unaware of the devastating truth that awaits him.',
        ap.emotional_state = 'On the surface, Claudius projects a hopeful anticipation, a desire to reconnect with Messalina, evidenced by his direct and expectant statement. However, beneath this veneer of expectation lies a profound delusion. He is emotionally adrift, clinging to the remnants of his trust in Messalina, desperately seeking solace in the familiar comfort of his marriage. He is tragically ignorant of the brutal reality of her execution, his internal state a poignant mix of yearning and denial, shielded from the crushing truth by a fragile wall of wishful thinking.',
        ap.emotional_tags = ["on the surface, claudius projects a hopeful anticipation, a desire to reconnect with messalina, evidenced by his direct", "expectant statement. however, beneath this veneer of expectation lies a profound delusion. he is emotionally adrift, clinging to the remnants of his trust in messalina, desperately seeking solace in the familiar comfort of his marriage. he is tragically ignorant of the brutal reality of her execution, his internal state a poignant mix of yearning", "denial, shielded from the crushing truth by a fragile wall of wishful thinking.", "on the surface", "claudius projects a hopeful anticipation", "a desire to reconnect with messalina", "evidenced by his direct and expectant statement. however", "beneath this veneer of expectation lies a profound delusion. he is emotionally adrift", "clinging to the remnants of his trust in messalina", "desperately seeking solace in the familiar comfort of his marriage. he is tragically ignorant of the brutal reality of her execution", "his internal state a poignant mix of yearning and denial", "shielded from the crushing truth by a fragile wall of wishful thinking."],
        ap.active_plans = ["To immediately summon Messalina to his location within the newly dedicated temple.", "To seek a personal audience with Messalina, believing a direct encounter will resolve the turmoil.", "To reassert his marital authority and perhaps attempt to understand, or even forgive, Messalina's perceived transgressions, still operating under a misapprehension of the true gravity of events."],
        ap.beliefs = ["He firmly believes Messalina is still alive and subject to his imperial will, capable of being summoned and reasoned with.", "He believes in the fundamental bond of their marriage, however naively, imagining it can withstand the current crisis and be restored to some semblance of normalcy.", "He believes in the power of personal interaction and direct communication, trusting that seeing Messalina will clarify the situation and allow him to regain control, based on his tragically flawed understanding."],
        ap.goals = ["Short-term Goal: To immediately be in the presence of Messalina and speak with her directly.", "Medium-term Goal: To understand Messalina's actions from her own perspective and to attempt a reconciliation, clinging to the hope of salvaging their relationship.", "Ultimate Goal: To restore the perceived order and stability of his marriage and his personal life, returning to a state of domestic tranquility that is tragically unattainable given the irreversible events orchestrated by his advisors."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands composed before Claudius, his posture steady, exuding an air of chilling calmness. He delivers the grim news with a measured tone, presenting the warrant with deliberate precision, embodying the cold realities of power.',
        ap.emotional_state = 'Pallas\'s surface demeanor is devoid of emotion, reflecting his pragmatic nature. Internally, he may feel a sense of satisfaction in executing his duty but is also aware of the treacherous waters he navigates. His motivations are masked by a façade of loyalty, concealing any potential inner conflict about the consequences of his revelations.',
        ap.emotional_tags = ["pallas's surface demeanor is devoid of emotion", "reflecting his pragmatic nature. internally", "he may feel a sense of satisfaction in executing his duty but is also aware of the treacherous waters he navigates. his motivations are masked by a fa\u00e7ade of loyalty", "concealing any potential inner conflict about the consequences of his revelations.", "pallas's surface demeanor is devoid of emotion, reflecting his pragmatic nature. internally, he may feel a sense of satisfaction in executing his duty", "is also aware of the treacherous waters he navigates. his motivations are masked by a fa\u00e7ade of loyalty, concealing any potential inner conflict about the consequences of his revelations."],
        ap.active_plans = ["To ensure Claudius comprehends the gravity of Messalina's execution and the implications of his power.", "To maintain his own position by demonstrating unwavering loyalty to Claudius while subtly manipulating the narrative.", "To prepare for the possible fallout from Messalina's death and position himself favorably in the wake of the political chaos."],
        ap.beliefs = ["Power is maintained through calculated actions rather than emotional attachments.", "Political survival often necessitates ruthless decisions, as demonstrated by the execution of Messalina.", "The stability of the empire is paramount, even if it comes at the cost of personal relationships."],
        ap.goals = ["Short-term: To deliver the news of Messalina\u2019s execution without eliciting emotional backlash from Claudius.", "Medium-term: To consolidate his influence within the court following the upheaval of Messalina\u2019s death.", "Ultimate: To ensure his survival and ascendance in the political hierarchy of Rome amidst the chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Pallas and Narcissus, his body language conveying disbelief and shock. He is physically present but emotionally distant, grappling with the weight of the news that has just been delivered to him.',
        ap.emotional_state = 'Claudius displays surface disbelief, his tone wavering as he struggles to comprehend the reality of Messalina\'s execution. Internally, he is engulfed by a storm of confusion, betrayal, and grief, revealing a deep vulnerability that clashes with his public persona as Emperor. His mind wrestles with guilt and regret, exacerbated by the realization that he unwittingly ordered his wife’s death.',
        ap.emotional_tags = ["claudius displays surface disbelief, his tone wavering as he struggles to comprehend the reality of messalina's execution. internally, he is engulfed by a storm of confusion, betrayal,", "grief, revealing a deep vulnerability that clashes with his public persona as emperor. his mind wrestles with guilt", "regret, exacerbated by the realization that he unwittingly ordered his wife\u2019s death.", "claudius displays surface disbelief", "his tone wavering as he struggles to comprehend the reality of messalina's execution. internally", "he is engulfed by a storm of confusion", "betrayal", "and grief", "revealing a deep vulnerability that clashes with his public persona as emperor. his mind wrestles with guilt and regret", "exacerbated by the realization that he unwittingly ordered his wife\u2019s death."],
        ap.active_plans = ["To process the devastating news of Messalina's execution and its implications for his reign.", "To confront the advisors about the circumstances leading to this act, seeking the truth amidst the layers of betrayal.", "To assert his authority in the aftermath of the revelation, even as he grapples with personal loss."],
        ap.beliefs = ["Trust is a fragile construct, easily shattered by the ambitions of those around him.", "Love can blind one to the harsh realities of loyalty and betrayal.", "The burden of leadership often involves painful decisions that have irrevocable consequences."],
        ap.goals = ["Short-term: To come to terms with the shocking revelation of Messalina\u2019s execution and its emotional fallout.", "Medium-term: To stabilize his reign and address the political ramifications of her death.", "Ultimate: To reclaim his authority and ensure that such betrayals do not undermine his rule again."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands within the newly consecrated temple, a picture of Roman efficiency amidst the dawning light. He listens to Claudius\'s heartbroken request with an impassive face, then smoothly interjects, producing a dispatch from Britain. His movements are precise and economical, every gesture calculated to redirect the Emperor\'s focus.',
        ap.emotional_state = 'Narcissus is emotionally detached, focused entirely on the political implications of the moment. He displays no empathy for Claudius\'s personal tragedy, his tone is brisk and professional, prioritizing the stability of the empire over the Emperor\'s grief. Beneath the surface, he is likely operating with a controlled urgency, keen to swiftly move past the messy personal drama and reinforce Claudius\'s public image.',
        ap.emotional_tags = ["narcissus is emotionally detached, focused entirely on the political implications of the moment. he displays no empathy for claudius's personal tragedy, his tone is brisk", "professional, prioritizing the stability of the empire over the emperor's grief. beneath the surface, he is likely operating with a controlled urgency, keen to swiftly move past the messy personal drama", "reinforce claudius's public image.", "narcissus is emotionally detached", "focused entirely on the political implications of the moment. he displays no empathy for claudius's personal tragedy", "his tone is brisk and professional", "prioritizing the stability of the empire over the emperor's grief. beneath the surface", "he is likely operating with a controlled urgency", "keen to swiftly move past the messy personal drama and reinforce claudius's public image."],
        ap.active_plans = ["Divert Claudius's attention from Messalina's execution to matters of state.", "Reinforce Claudius's image as a divinely sanctioned ruler to the Britons.", "Ensure Claudius remains compliant and focused on his imperial duties, preventing a descent into debilitating grief."],
        ap.beliefs = ["The Emperor's personal feelings are secondary to the stability and image of Rome.", "Maintaining control over Claudius's perception of events is crucial for political manipulation.", "Divine authority is a useful tool for imperial control and pacification of conquered territories."],
        ap.goals = ["Short-term: To successfully present the dispatch and change the subject of conversation.", "Medium-term: To solidify Claudius's image as a god in the provinces, thus strengthening Roman rule.", "Ultimate: To maintain his own power and influence by ensuring a stable and controllable Emperor, regardless of personal cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands within the cold temple, bathed in the nascent light of dawn, his frame slumped with weariness and sorrow. He voices a pathetic, lingering hope to see Messalina, his words betraying a deep-seated denial of the brutal reality he has just ordered. He is adrift in a sea of grief and confusion, seeking solace in a world that has just been irrevocably shattered.',
        ap.emotional_state = 'Claudius is profoundly heartbroken and bewildered, clinging to a desperate hope of reconciliation even after ordering Messalina\'s execution. His outward demeanor is one of pathetic ignorance and deep sadness, his words tinged with a tragic irony as he remains oblivious to the political machinations swirling around him. Internally, he is likely wrestling with a maelstrom of grief, disbelief, and a dawning horror at the consequences of his own actions, yet still unable to fully grasp the depth of betrayal.',
        ap.emotional_tags = ["claudius is profoundly heartbroken", "bewildered, clinging to a desperate hope of reconciliation even after ordering messalina's execution. his outward demeanor is one of pathetic ignorance", "deep sadness, his words tinged with a tragic irony as he remains oblivious to the political machinations swirling around him. internally, he is likely wrestling with a maelstrom of grief, disbelief,", "a dawning horror at the consequences of his own actions, yet still unable to fully grasp the depth of betrayal.", "claudius is profoundly heartbroken and bewildered", "clinging to a desperate hope of reconciliation even after ordering messalina's execution. his outward demeanor is one of pathetic ignorance and deep sadness", "his words tinged with a tragic irony as he remains oblivious to the political machinations swirling around him. internally", "he is likely wrestling with a maelstrom of grief", "disbelief", "and a dawning horror at the consequences of his own actions", "yet still unable to fully grasp the depth of betrayal."],
        ap.active_plans = ["Seek to see Messalina, driven by a naive hope for connection or reconciliation.", "Attempt to process the devastating news of Messalina's death, though his understanding remains clouded.", "Unconsciously retreat into a state of denial to avoid confronting the full weight of his loss and betrayal."],
        ap.beliefs = ["He desperately wants to believe in love and loyalty, even in the face of overwhelming evidence to the contrary.", "He struggles to reconcile the brutal realities of Roman politics with his own desire for peace and order.", "He clings to the hope that Messalina, despite everything, might still offer some semblance of the affection he craves."],
        ap.goals = ["Short-term: To see Messalina, driven by a mixture of grief, denial, and lingering affection.", "Medium-term: To find some way to understand or make sense of the catastrophic events that have unfolded, even if based on illusion.", "Ultimate: To regain a sense of peace and stability in his life and reign, though this now seems tragically unattainable and built upon lies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_4'})
    ON CREATE SET
        ap.current_status = 'Pallas stands before Claudius, a careful expression on his face, gesturing towards the temple with a measured calmness. He exudes confidence, emphasizing the political significance of the temple\'s dedication while maintaining a composed demeanor.',
        ap.emotional_state = 'Pallas\'s surface demeanor is calm and assured, reflecting a calculated confidence in his ability to manipulate the moment. Internally, he feels a mix of satisfaction at the success of his political maneuvering and a sense of urgency to stabilize Claudius\'s authority in light of recent upheaval. He understands the precarious balance of power and feels the weight of responsibility.',
        ap.emotional_tags = ["pallas's surface demeanor is calm", "assured, reflecting a calculated confidence in his ability to manipulate the moment. internally, he feels a mix of satisfaction at the success of his political maneuvering", "a sense of urgency to stabilize claudius's authority in light of recent upheaval. he understands the precarious balance of power", "feels the weight of responsibility.", "pallas's surface demeanor is calm and assured", "reflecting a calculated confidence in his ability to manipulate the moment. internally", "he feels a mix of satisfaction at the success of his political maneuvering and a sense of urgency to stabilize claudius's authority in light of recent upheaval. he understands the precarious balance of power and feels the weight of responsibility."],
        ap.active_plans = ["To frame the temple's dedication as a consolidation of Claudius's power among the Britons.", "To distract Claudius from his personal loss by highlighting political gains.", "To reinforce loyalty to Claudius by presenting the dedication as a politically correct decision approved by the province's leadership."],
        ap.beliefs = ["Political stability is paramount for maintaining power.", "Symbols of authority can often overshadow personal grievances.", "A well-timed gesture can manipulate public perception and loyalty."],
        ap.goals = ["Short-term: To present the temple's dedication as a positive development immediately following Messalina's execution.", "Medium-term: To establish Claudius's authority firmly among the Britons and ensure his reign is seen as legitimate.", "Ultimate: To secure his own position and influence within the imperial court, using Claudius's authority as leverage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the temple, his presence overshadowed by the recent revelation of his wife\'s execution. He appears bewildered and in denial, seeking comfort in the thought of seeing Messalina despite the grim news.',
        ap.emotional_state = 'Outwardly, Claudius displays confusion and a desperate need for reassurance. Internally, he is grappling with grief and disbelief, struggling to reconcile his love for Messalina with the stark reality of her betrayal. He is torn between his personal loss and the demands of being an Emperor.',
        ap.emotional_tags = ["outwardly, claudius displays confusion", "a desperate need for reassurance. internally, he is grappling with grief", "disbelief, struggling to reconcile his love for messalina with the stark reality of her betrayal. he is torn between his personal loss", "the demands of being an emperor.", "outwardly", "claudius displays confusion and a desperate need for reassurance. internally", "he is grappling with grief and disbelief", "struggling to reconcile his love for messalina with the stark reality of her betrayal. he is torn between his personal loss and the demands of being an emperor."],
        ap.active_plans = ["To seek out Messalina, hoping for a reconciliation despite the turmoil.", "To process the news of her execution and understand the implications it carries for his reign.", "To navigate the political fallout from Messalina's actions while maintaining his authority."],
        ap.beliefs = ["Loyalty and love should be reciprocated in his marriage.", "The Emperor's authority must be upheld, even amidst personal tragedy.", "Understanding the political landscape is crucial for maintaining control."],
        ap.goals = ["Short-term: To comprehend the events that led to his wife's execution and confront his advisors.", "Medium-term: To stabilize his rule and maintain the loyalty of the Senate and people.", "Ultimate: To emerge as a respected and powerful ruler, despite personal losses and betrayals."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_quintus_justus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quintus_justus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quintus_justus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quintus_justus_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scylla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scylla_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Event {uuid: 'event_8_10'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_9'}),
          (b:Event {uuid: 'event_8_10'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_11'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_10'}),
          (b:Event {uuid: 'event_8_11'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_12'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_11'}),
          (b:Event {uuid: 'event_8_12'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_7'}),
          (b:Event {uuid: 'event_8_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_7'}),
          (b:Event {uuid: 'event_8_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_8'}),
          (b:Event {uuid: 'event_8_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_8'}),
          (b:Event {uuid: 'event_8_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_9'}),
          (b:Event {uuid: 'event_8_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_9'}),
          (b:Event {uuid: 'event_8_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_10'}),
          (b:Event {uuid: 'event_8_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_10'}),
          (b:Event {uuid: 'event_8_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_11'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_11'}),
          (b:Event {uuid: 'event_8_11'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_11'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_11'}),
          (b:Event {uuid: 'event_8_11'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_12'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_12'}),
          (b:Event {uuid: 'event_8_12'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_12'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_8_12'}),
          (b:Event {uuid: 'event_8_12'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_8'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_9_1'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_herod_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marsus_vibius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marsus_vibius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_girl_messenger'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius_silius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_silius_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mnester'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mnester_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_girl_messenger'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_girl_messenger_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Event {uuid: 'event_17_6'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_5'}),
          (b:Event {uuid: 'event_17_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geta'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_17_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_17_4'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_4'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_17_5'}),
          (b:Event {uuid: 'event_17_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_5'}),
          (b:Event {uuid: 'event_17_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_17_6'}),
          (b:Event {uuid: 'event_17_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_18'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_3'}),
          (b:Event {uuid: 'event_18_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_18_4'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_18_4'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geta'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_18_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_18_4'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_19'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Event {uuid: 'event_19_3'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_19_2'}),
          (b:Event {uuid: 'event_19_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_19_3'}),
          (b:Event {uuid: 'event_19_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_20'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_geta'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geta'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geta_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_21'}),
          (ep:Episode {uuid: 'episode_a_god_in_colchester'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_21_4'}),
          (b:Event {uuid: 'event_21_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_4'}),
          (b:Event {uuid: 'event_21_4'})
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
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_3'})
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
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_7'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_8'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_9'}),
                      (e2:Event {uuid: 'event_8_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_7'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_8'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_9'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_10'}),
                      (e2:Event {uuid: 'event_8_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_7'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_8'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_9'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_10'}),
                      (e2:Event {uuid: 'event_8_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_11'}),
                      (e2:Event {uuid: 'event_8_12'})
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
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_3'})
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
                

                MATCH (e1:Event {uuid: 'event_17_1'}),
                      (e2:Event {uuid: 'event_17_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_2'}),
                      (e2:Event {uuid: 'event_17_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_3'}),
                      (e2:Event {uuid: 'event_17_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_4'}),
                      (e2:Event {uuid: 'event_17_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_5'}),
                      (e2:Event {uuid: 'event_17_6'})
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
                

                MATCH (e1:Event {uuid: 'event_19_1'}),
                      (e2:Event {uuid: 'event_19_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_19_2'}),
                      (e2:Event {uuid: 'event_19_3'})
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
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_4'})
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
