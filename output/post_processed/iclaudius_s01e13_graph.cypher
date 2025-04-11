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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e13_graph.json',
        creation_timestamp: '2025-04-11T16:18:09.448177',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'Former Emperor',
        a.description = 'Claudius is the stammering Emperor of Rome who often presents himself as a fool to disguise his sharp intellect and keen observation. Weary yet resolute, he is deeply introspective and aware of the political machinations around him, confronting both mortality and legacy with resignation.',
        a.traits = ["Introspective", "Wise", "Resilient", "Perceptive"],
        a.sphere_of_influence = 'Imperial Governance'
    ;
MERGE (a:Agent {uuid: 'agent_nero'})
    ON CREATE SET
        a.name = 'Nero',
        a.title = 'None',
        a.description = 'Nero is depicted as impressionable and easily manipulated under the influence of his mother, Agrippinilla. He shows a brief appreciation for Claudius\'s intellectual works but primarily values destructive excitement, focusing on the immediate thrill of fire and chaos rather than historical or political significance.',
        a.traits = ["Impressionable", "Easily Manipulated", "Destructive", "Immature", "Petulant"],
        a.sphere_of_influence = 'Imperial Power'
    ;
MERGE (a:Agent {uuid: 'agent_agrippinilla'})
    ON CREATE SET
        a.name = 'Agrippinilla',
        a.title = 'None',
        a.description = 'Agrippinilla is a formidable woman of keen intellect and relentless ambition. As the driving force behind the political maneuvers in Rome, she is determined to erase Claudius\'s legacy by burning his scrolls and securing Nero\'s succession. Her sharp mind and ruthless manipulation underscore her central role in the power plays of the imperial court.',
        a.traits = ["Ambitious", "Ruthless", "Cunning", "Determined", "Manipulative"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_pallas'})
    ON CREATE SET
        a.name = 'Pallas',
        a.title = 'Advisor',
        a.description = 'Pallas is a shrewd and concerned advisor deeply involved in the Roman court\'s political intrigues. Known for his cautious pragmatism and resourcefulness, he counsels Agrippinilla on the need for drastic measures against Claudius. His insider knowledge of court procedures and security measures highlights his capability in navigating treacherous power dynamics.',
        a.traits = ["shrewd", "concerned", "cautious", "pragmatic", "resourceful"],
        a.sphere_of_influence = 'Imperial Counsel'
    ;
MERGE (a:Agent {uuid: 'agent_narcissus'})
    ON CREATE SET
        a.name = 'Narcissus',
        a.title = 'Loyal Advisor',
        a.description = 'Narcissus is the loyal and perceptive advisor to Emperor Claudius. Marked by a sense of regret for his inability to prevent Claudius\'s murder, he remains discreet while navigating the political intrigues of the imperial court. His steadfast loyalty and awareness of the surrounding betrayals underscore his protective role over the emperor and his legacy.',
        a.traits = ["Loyal", "Perceptive", "Discreet", "Regretful"],
        a.sphere_of_influence = 'Political Advisory'
    ;
MERGE (a:Agent {uuid: 'agent_lollia_paulina'})
    ON CREATE SET
        a.name = 'Lollia Paulina',
        a.title = 'Lady',
        a.description = 'Lollia Paulina is a noblewoman presented as a potential wife for Emperor Claudius. Known for her beauty and noble lineage, she is childless and considered more ornamental than intellectually or politically valuable, as evidenced by Pallas\'s dismissive remarks regarding her capabilities.',
        a.traits = ["ornamental", "stupid (according to Pallas)", "childless", "noble lineage", "beautiful (purportedly)"],
        a.sphere_of_influence = 'Roman Aristocracy'
    ;
MERGE (a:Agent {uuid: 'agent_caractacus'})
    ON CREATE SET
        a.name = 'Caractacus',
        a.title = 'King',
        a.description = 'Caractacus is the captured King of the Britons, brought to Rome in chains as a defeated enemy. Despite his captivity, he displays remarkable courage, defiance, and eloquence as he addresses the Roman Senate, warning about the endless nature of conquest and earning widespread respect.',
        a.traits = ["courageous", "defiant", "dignified", "eloquent", "respected"],
        a.sphere_of_influence = 'Britons'
    ;
MERGE (a:Agent {uuid: 'agent_britannicus'})
    ON CREATE SET
        a.name = 'Britannicus',
        a.title = 'Rightful Heir',
        a.description = 'Britannicus is the young and rightful heir to the throne, emblematic of vulnerability mixed with budding defiance and ambition. Hurt by Claudius\'s past actions and favoritism towards Nero, he displays both intelligence and a determination to reclaim his rightful place, rejecting exile and challenging familial authority.',
        a.traits = ["Vulnerable", "Intelligent", "Defiant", "Ambitious"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_locusta'})
    ON CREATE SET
        a.name = 'Locusta',
        a.title = 'Poisoner',
        a.description = 'Locusta is renowned as a woman of formidable and sinister skill in the art of poisons. Although she does not appear directly in the scene, her reputation and expertise in discreet and lethal methods make her a key figure in Agrippinilla and Pallas\'s plot to assassinate Claudius, embodying the dark underbelly of Roman ambition.',
        a.traits = ["skilled", "dangerous", "discreet", "lethal", "sought-after"],
        a.sphere_of_influence = 'Assassination'
    ;
MERGE (a:Agent {uuid: 'agent_octavia'})
    ON CREATE SET
        a.name = 'Octavia',
        a.title = 'Wife of Nero',
        a.description = 'Octavia is depicted as a young and independent-minded woman caught in marital strife with Nero. Her defiant actions—such as locking herself in her bedroom to bar Nero\'s entry—reveal her unhappiness and resistance within their forced union, highlighting the unstable power dynamics at play.',
        a.traits = ["defiant", "independent-minded", "young", "unhappy", "resistant"],
        a.sphere_of_influence = 'Domestic sphere'
    ;
MERGE (a:Agent {uuid: 'agent_sybill'})
    ON CREATE SET
        a.name = 'The Sibyl',
        a.title = 'Oracle',
        a.description = 'The Sibyl is an ethereal oracle who serves as a conduit to the destinies that bind Rome\'s players. Her mysterious prophecies, imbued with insight and foresight, reveal the inevitable cycles of ambition, fate, and consequence that govern the lives of those in power.',
        a.traits = ["Mysterious", "Prophetic", "Ethereal", "Insightful"],
        a.sphere_of_influence = 'Fate and Prophecy'
    ;
MERGE (o:Object {uuid: 'object_mysterious_box'})
    ON CREATE SET
        o.name = 'Ornate Mysterious Box',
        o.description = 'An ornate box resting amid the clutter of scrolls and parchments, its design intricate and enigmatic. It serves as a focal point in the study, symbolizing the hidden complexities of Claudius\'s reign and the secrets yet to be uncovered.',
        o.purpose = 'To potentially contain significant items or documents related to Claudius\'s will or imperial legacy.',
        o.significance = 'Represents the mysteries of power and legacy that surround Claudius\'s reign.'
    ;
MERGE (o:Object {uuid: 'object_throne'})
    ON CREATE SET
        o.name = 'Throne',
        o.description = 'The Emperor\'s throne, situated prominently within the reception hall, is a symbol of Roman imperial power and authority. Likely crafted from rich materials such as marble or gilded wood, it is elevated to command attention and signify Claudius\'s supreme status.',
        o.purpose = 'Symbol of Imperial Authority',
        o.significance = 'Represents Claudius\'s power and the weight of his office, visually manifesting his dominion and responsibilities.'
    ;
MERGE (o:Object {uuid: 'object_chains'})
    ON CREATE SET
        o.name = 'Chains',
        o.description = 'Heavy, metal restraints used to bind Caractacus as he is presented before the Senate. They serve as a stark symbol of captivity, defeat, and Roman dominance over conquered peoples while contrasting physical restraint with inner resilience.',
        o.purpose = 'To restrain captives and symbolize subjugation',
        o.significance = 'Symbol of Roman power and Caractacus\'s defiance in captivity'
    ;
MERGE (o:Object {uuid: 'object_sword'})
    ON CREATE SET
        o.name = 'Sword',
        o.description = 'A sword referenced by Caractacus as a potent symbol of Roman military might. Though not physically present, it embodies the force, conquest, and potential for endless conflict inherent in Roman imperialism.',
        o.purpose = 'Symbol of Roman military power and conquest',
        o.significance = 'Represents the limitations of force and the potential for unending conflict'
    ;
MERGE (o:Object {uuid: 'object_scrolls_and_maps'})
    ON CREATE SET
        o.name = 'Scrolls and Maps',
        o.description = 'Numerous scrolls and maps line the walls of Claudius\'s private study. The scrolls likely contain historical records, imperial decrees, and literary works, while the maps underline his strategic concerns as an imperial leader.',
        o.purpose = 'To provide historical and strategic context for Claudius\'s decisions and writings.',
        o.significance = 'They represent Claudius\'s dual role as a scholar and emperor, highlighting the responsibilities and legacy of his reign.'
    ;
MERGE (o:Object {uuid: 'object_scrolls'})
    ON CREATE SET
        o.name = 'Scrolls',
        o.description = 'Numerous scrolls scattered throughout the Imperial Library represent years of Claudius\'s scholarly efforts. They include historical records, philosophical treatises, and personal writings, embodying an intellectual legacy under threat.',
        o.purpose = 'To store knowledge and historical records; to represent Claudius\'s intellectual legacy.',
        o.significance = 'Symbolizes Claudius\'s legacy and historical record that Agrippinilla seeks to destroy.'
    ;
MERGE (o:Object {uuid: 'object_will'})
    ON CREATE SET
        o.name = 'Will',
        o.description = 'The missing Imperial Will of Claudius, this document holds immense significance for determining the succession of the Roman Empire and shaping the future of power. Its discovery is critical to legitimizing Nero\'s claim and consolidating control.',
        o.purpose = 'To legally determine the succession of the Roman Empire and the distribution of power.',
        o.significance = 'Represents the legal instrument of power transfer and is key to Nero\'s legitimacy.'
    ;
MERGE (o:Object {uuid: 'object_fire'})
    ON CREATE SET
        o.name = 'Fire',
        o.description = 'Fire is envisioned as a destructive force, intended to obliterate Claudius\'s scrolls and, symbolically, his legacy. It represents both physical and ideological destruction as part of Agrippinilla\'s ambitions.',
        o.purpose = 'To destroy Claudius\'s scrolls and erase his legacy.',
        o.significance = 'Symbolizes destruction, erasure of history, and Nero\'s destructive potential.'
    ;
MERGE (l:Location {uuid: 'location_claudius_private_study'})
    ON CREATE SET
        l.name = 'Claudius\'s Private Study',
        l.description = 'A secluded, candlelit chamber deep within the palace, designed for private consultations and scholarly pursuits. The walls are lined with scrolls and maps, hinting at Claudius\'s historical interests and strategic thinking. The dim lighting and intimate setting create an atmosphere of secrecy and confidentiality, providing a refuge from the public eye for clandestine discussions and personal revelations.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    ON CREATE SET
        l.name = 'Imperial Palace Reception Hall',
        l.description = 'An opulent space characterized by towering marble columns and statues of revered Roman ancestors. Golden mosaics depicting victorious battles and heavy silk drapes filtering sunlight create an atmosphere of hushed grandeur and unspoken tension, embodying the weight of imperial decisions and courtly intrigue.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_agrippinillas_private_apartments'})
    ON CREATE SET
        l.name = 'Agrippinilla\'s Private Apartments',
        l.description = 'A lavish suite illuminated by soft bronze oil lamps and polished bronze mirrors. This private space serves as a sanctuary for Agrippinilla\'s schemes, showcasing her wealth, status, and cunning through an environment heavy with the scent of perfume and the atmosphere of intense political maneuvering.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_claudius_chambers'})
    ON CREATE SET
        l.name = 'Claudius\'s Chambers',
        l.description = 'A private and intimate space that reflects the Emperor\'s need for sanctuary away from the bustling court. Furnished with imperial yet scholarly appointments including scrolls, writing implements, and symbols of power, the room is designed for significant and manipulative dialogue in a subdued atmosphere.',
        l.type = 'Chambers'
    ;
MERGE (l:Location {uuid: 'location_senate'})
    ON CREATE SET
        l.name = 'Senate House',
        l.description = 'A grand hall lined with towering marble columns and intricate frescoes depicting historical triumphs. Designed for large assemblies and public addresses, the hall\'s imposing and solemn atmosphere reinforces its role as the center of Roman political power.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_claudius_bedroom'})
    ON CREATE SET
        l.name = 'Claudius\'s Bedroom',
        l.description = 'A grand yet austere imperial chamber filled with sunlight from large windows offering commanding views of the Roman Forum. Furnished with regal yet simple décor, the room balances opulence with isolation, serving as a setting for intimate conversations laden with political tension and familial strife.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_agrippinillas_bedroom'})
    ON CREATE SET
        l.name = 'Agrippinilla\'s Bedroom',
        l.description = 'An opulent and private space richly adorned with luxurious fabrics and enhanced by flickering candlelight. Beyond a place of rest, it is used as a clandestine meeting venue for political machinations and strategic planning, away from the scrutiny of the Roman court.',
        l.type = 'Bedroom'
    ;
MERGE (l:Location {uuid: 'location_imperial_library'})
    ON CREATE SET
        l.name = 'Imperial Library',
        l.description = 'A vast, shadowy space at night filled with towering shelves of scrolls and scattered documents. The scent of aged parchment and lamplight that casts long shadows emphasizes the secretive and tense atmosphere surrounding the illicit pursuits taking place within this repository of knowledge.',
        l.type = 'Library'
    ;
MERGE (l:Location {uuid: 'location_ferrymans_shore'})
    ON CREATE SET
        l.name = 'Ferryman\'s Shore',
        l.description = 'A mist-covered riverbank that exists between realms, with a haunting atmosphere accentuated by shadows of past figures and dim torchlight. This ethereal setting conveys themes of loss and the inevitable nature of fate as murmurs and whispers blend with the lapping water.',
        l.type = 'Riverbank'
    ;
MERGE (o:Organization {uuid: 'org_senate'})
    ON CREATE SET
        o.name = 'Senate',
        o.description = 'The Roman Senate is the primary governing and advisory body in Rome, composed of patrician citizens who hold significant political influence. In this scene, the Senate acts as an audience and a collective entity that reacts to Claudius\'s address and Caractacus\'s speech, being swayed by displays of courage and dignity, and capable of shifting from demanding punishment to offering respect and leniency.',
        o.sphere_of_influence = 'Political Governance'
    ;
MERGE (ep:Episode {uuid: 'episode_old_king_log'})
    ON CREATE SET
        ep.title = 'Old King Log',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'The New Emperor Rises',
        s.description = 'Shadows engulf the corners of Claudius\'s private study, a space overwhelmed by the weight of history in scrolls and parchments. An ornate box sits silently amidst the scholarly clutter, a silent witness to the room\'s secrets. Just beyond, in the imperial bedchamber, the stillness of death reigns where Emperor Claudius has drawn his last breath. Into this somber space bursts young Nero, barely a man, his eyes gleaming with a cruel, nascent ambition. Behind him, Agrippinilla enters, a figure of poised elegance, her ambition thinly veiled beneath a mask of controlled composure. The air is thick with unspoken power, the transition of rule hanging heavy as mother and son step into the void left by the departed Emperor. This scene marks the immediate aftermath of Claudius\'s death, setting the stage for Nero\'s ascension and the power plays that will define his reign, beginning with the urgent search for Claudius\'s will, a document that holds the potential to solidify or shatter their carefully laid plans.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Confirmation of Imperial Succession',
        e.description = 'Nero strides into Claudius\'s study, his first question a blunt confirmation of the Emperor\'s demise. Agrippinilla\'s terse \'Yes\' seals Claudius\'s fate and immediately propels Nero into his new reality. A giddy excitement bubbles up in Nero as he grasps the enormity of his ascension, declaring himself \'Emperor\' with childish glee. Agrippinilla, ever the pragmatist, swiftly redirects his focus from celebratory pronouncements to the practicalities of power, hissing a reminder of the gravity of his new title. This exchange sharply defines the contrasting personalities and priorities of mother and son in this pivotal moment of imperial transition.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["NERO: Is he dead?", "AGRIPPINILLA: Yes. Yes, he's dead.", "NERO: Then I am Emperor.", "AGRIPPINILLA: Yes.", "NERO: Whee!", "AGRIPPINILLA: Sh! You are Emperor."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Delaying the Death Announcement and Seeking the Will',
        e.description = 'Nero, in his youthful exuberance, immediately wants to announce Claudius\'s death, eager to publicly claim his new title. However, Agrippinilla, ever the strategist, swiftly interjects, revealing her calculated approach to power. She instructs Nero to first issue a false bulletin proclaiming Claudius\'s health, a deceptive maneuver to buy them time and control the narrative.  Her immediate priority shifts to locating Claudius\'s will, understanding its potential to either legitimize or undermine Nero\'s claim. This reveals Agrippinilla\'s cunning and her understanding that true power lies not just in title but in strategic control of information and legacy.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["NERO: Let's announce his death.", "AGRIPPINILLA: Not yet. First, we shall put out a bulletin to say that he's as well as can be expected.", "NERO: Considering he's dead!", "AGRIPPINILLA: Yes. Then we must find the will. It will be in his study. Come!"]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'The Hunt for the Will and Discovery of History',
        e.description = 'Agrippinilla and Nero move deeper into Claudius\'s cluttered study, the physical mess reflecting the tangled affairs of the deceased Emperor.  Agrippinilla directs the search, her focus sharp and intent on finding the crucial will. Nero, in contrast, is careless and easily distracted, complaining about the disarray. As they rummage through scrolls, Agrippinilla uncovers a history, not the desired will, but a chronicle of their family, beginning with the scandalous death of Messalina.  Nero\'s immediate, self-absorbed question about whether he is mentioned reveals his vanity and lack of genuine interest in history or legacy beyond himself, while Agrippinilla\'s frustrated reaction highlights her strategic focus and impatience with Nero\'s immaturity.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NERO: What a mess!", "AGRIPPINILLA: He would never let anyone touch it, that's why. It will be here somewhere. You look over there and I'll look here.", "NERO: Have you found it, Mother? Well, what is it?", "AGRIPPINILLA: It looks like a history.", "NERO: Of what?", "AGRIPPINILLA: Of our family.", "NERO: Does it mention me? Where does it begin?", "AGRIPPINILLA: With the death of his last wife, Messalina.", "NERO: That should be interesting. What's it say about me?", "AGRIPPINILLA: Oh, be quiet! How can I tell if you keep talking to me?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Poisonous Proposal',
        s.description = 'In the opulent Reception Hall of the Imperial Palace, marble columns rise majestically, adorned with statues of illustrious Roman ancestors. Golden mosaics depict victorious battles, while heavy silk drapes filter the sunlight, casting a rich, muted glow over the space. The air is thick with unspoken tension as Emperor Claudius sits on his ornate throne, flanked by his advisors Pallas and Narcissus. Claudius articulates his inner turmoil, lamenting his perceived shortcomings as a ruler, hinting at the simmering chaos beneath the surface of his benevolence. The conversation shifts to the subject of marriage, with Pallas and Narcissus vying for Claudius\'s favor, recommending Lollia Paulina, a beautiful woman of questionable intellect, as a suitable wife. However, the dialogue takes a treacherous turn when Pallas suggests Agrippinilla, Claudius\'s niece, as an ideal candidate, igniting a fierce debate over the implications of such an incestuous union. Claudius, seemingly lost in his thoughts, echoes his earlier ominous statement about letting all the poisons hatch out, signaling his readiness to embrace the darkness of political machinations. The scene encapsulates the brewing storm of ambition and treachery, setting the stage for the ruthless power struggles to come.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Claudius Reflects on His Rule',
        e.description = 'Claudius, seated on his throne, reflects on his reign, expressing feelings of inadequacy and contemplating the consequences of his benevolence. He acknowledges the violent disorders that plague Rome and suggests that violent remedies may be necessary, signaling a shift in his temperament towards a more ruthless approach to governance.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["The frog pool wanted a king. Jove sent them Old King Log. I have been as deaf and blind and wooden as a log. My chief fault? I have been too benevolent. Let all the poisons that lurk in the mud hatch out."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Discussion of Marriage Candidates',
        e.description = 'Pallas and Narcissus engage in a debate about potential wives for Claudius. Pallas begins by suggesting the need for Claudius to remarry for the good of his children and the realm. Narcissus recommends Lollia Paulina, highlighting her beauty despite her flaws. The discussion hints at the different values each advisor holds regarding the Emperor\'s future.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["But, chiefly, your children need a mother. And Rome needs a mother. It's not right for an Emperor to be alone.", "The one woman in Rome who would be a perfect wife is Lollia Paulina."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Pallas Advocates for Agrippinilla',
        e.description = 'Pallas proposes Agrippinilla as a candidate for marriage, arguing she is suitable due to her intelligence and lineage. He dismisses Narcissus\'s objections regarding her character, presenting her as a woman who could unite the family and solidify Claudius’s power. This discussion reveals the underlying tensions and motivations driving the characters.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["I refer to the Lady Agrippinilla. She's a woman of powerful intelligence. She is the daughter of Germanicus.", "An Emperor should have a wife who is both good looking and of outstanding intelligence. Now, she has both!"]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Narcissus\'s Outrage',
        e.description = 'Narcissus expresses outrage at the suggestion of marrying Agrippinilla, emphasizing the incestuous nature of such a union and arguing that it would bring ruin upon Rome. His fervent objections highlight the moral and ethical dilemmas faced by those in power as they navigate the treacherous waters of familial loyalty and political ambition.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Caesar, an uncle does not marry his niece. The union will be incestuous and the gods abominate incest. It will bring ruin and destruction on all Rome."]
    ;
MERGE (e:Event {uuid: 'event_2_5'})
    ON CREATE SET
        e.title = 'Claudius\'s Determination',
        e.description = 'In a moment of chilling clarity, Claudius decides to marry Agrippinilla, asserting his will despite the protests of his advisors. His declaration serves as a pivotal moment, signaling his willingness to embrace the darker aspects of power and the potential consequences that loom ahead. The scene closes with Claudius echoing his earlier ominous sentiment, suggesting a willingness to face whatever dangers lie ahead.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["I will m-marry my niece. Bring her to me."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Triumphant News and Tense Interlude',
        s.description = 'Bathed in the soft glow of oil lamps within her private apartments, Agrippinilla awaits news, the air thick with her heady perfume and simmering ambition. Pallas bursts in, breathless, bearing the news she craves: Claudius has agreed to marriage. Relief washes over Agrippinilla, tinged with disbelief at the ease of her victory. She drills Pallas for details, a hint of a predatory smile touching her lips as she learns of Narcissus\'s futile opposition.  The scene crackles with Agrippinilla\'s calculated triumph, undercut by the raw lust and mounting regret in Pallas\'s eyes. He confesses his conflicted desires, seeking a fleeting moment of intimacy before Agrippinilla embarks on her next power play, a tense interlude before she steps into Claudius\'s bedchamber and further tightens her grip on the empire.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_agrippinillas_private_apartments'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Claudius Agrees to Marriage',
        e.description = 'Pallas arrives in Agrippinilla\'s private apartments, out of breath, and delivers the news that Claudius has agreed to her proposal of marriage. Agrippinilla, initially surprised by the swiftness and ease of her triumph, seeks confirmation, her ambition momentarily giving way to incredulity. Pallas confirms Claudius\'s consent and his immediate desire to see her.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PALLAS: He's agreed. He has agreed. He wants to see you.", "AGRIPPINILLA: He'll marry me? He said he'd marry me?", "PALLAS: Yes."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Narcissus\'s Opposition Dismissed',
        e.description = 'Agrippinilla, probing for any obstacles, inquires about opposition to the marriage proposal. Pallas reveals that only Narcissus voiced dissent, but Claudius disregarded his advisor\'s concerns. Agrippinilla, with a hint of menace, declares her intention to neutralize Narcissus, foreshadowing future conflicts. She further confirms that Claudius made no mention of their familial relationship or the taboo of incest, suggesting his eagerness or calculated acceptance.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AGRIPPINILLA: That's all? Anything else? No arguments? No opposition?", "PALLAS: Only from NARCISSUS.", "AGRIPPINILLA: Ah. What did he say?", "PALLAS: I shan't repeat it. What does it matter? He lost. It was only sour grapes.", "AGRIPPINILLA: I'll sour all his grapes before I'm done. And Claudius? He said nothing about my being his niece? Nothing about incest?", "PALLAS: Nothing."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Pallas\'s Regret and Lustful Plea',
        e.description = 'Pallas expresses his mounting regrets about facilitating Agrippinilla\'s marriage, revealing his possessive desire for her and the discomfort at the thought of her with Claudius. He makes a plea for immediate intimacy, momentarily prioritizing his passion over his ambition. Agrippinilla, acknowledging his desire but focused on her strategic goals, teases him, agreeing to a brief encounter but emphasizing Claudius\'s impatient anticipation, underscoring her control and the transactional nature of their relationship.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["PALLAS: I shan't like it though, the thought of you in his bed. I'm beginning to have regrets already.", "AGRIPPINILLA: You ever found my passion wanting?", "PALLAS: No. But in my case, passion and ambition are beautifully combined... aren't they?", "PALLAS: My regrets are mounting. I hope when you're married...", "AGRIPPINILLA: Don't be silly. Oh, I've hurt you. And I shouldn't have. Don't worry. I'll make it up to you.", "PALLAS: Now. Make it up to me now.", "AGRIPPINILLA: He's waiting for me.", "PALLAS: It won't take long. You see, for once, my passion burns brighter than my ambition.", "AGRIPPINILLA: Hurry, then. I imagine his passion is burning too... and at his age, the flames don't last very long."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'A Proposal of Shadows',
        s.description = 'In the dimly lit opulence of Claudius\'s chambers, the atmosphere crackles with tension and ambition. The walls, adorned with rich tapestries, bear silent witness to the unfolding drama. Claudius, looking weary yet alert, embodies the remnants of a ruler grappling with the weight of impending decisions. Agrippinilla enters with a radiance that belies her true intentions, her confidence radiating like a beacon in the shadows. As they engage in a seemingly innocuous conversation about marriage, the underlying currents of incest, power, and manipulation bubble to the surface. Claudius seeks a consort not just for companionship, but to navigate the treacherous waters of imperial politics, while Agrippinilla’s ambitious heart beats with the promise of power and influence. The room, thick with unspoken desires, becomes a crucible for their ambitions, setting the stage for a calculated union that masks the true stakes of their relationship. It is a delicate dance of words, each line laced with double meanings, as both characters navigate the intricate web of power dynamics that define their fates, foreshadowing the chaos that will ensue from their alliance.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Agrippinilla\'s Entrance and Proposal',
        e.description = 'Agrippinilla enters Claudius\'s chambers, exuding confidence and seeking to confirm the rumors of her uncle\'s desire to marry her. Claudius confirms the intention and proposes marriage, eliciting a joyous reaction from Agrippinilla. Her declaration of love and commitment reveals her manipulative nature as she positions her ambitions cloaked in affection.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AGRIPPINILLA: Uncle? Pallas tells me you wanted to see me.", "CLAUDIUS: Yes.", "AGRIPPINILLA: He said that you had decided to marry again.", "CLAUDIUS: Yes.", "AGRIPPINILLA: And that you had chosen me?", "CLAUDIUS: Would you like to marry me?", "AGRIPPINILLA: Oh, Uncle! You have made me the happiest woman in the world."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Discussion of Incest and Ambition',
        e.description = 'The conversation shifts as Claudius teases Agrippinilla about the incestuous implications of their union. Agrippinilla deftly dodges the question, rationalizing past actions during Caligula\'s reign. This moment highlights the tension between familial bonds and political strategy, revealing their shared history of manipulation and ambition.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: Does it not worry you, my dear, that you will be committing incest?", "AGRIPPINILLA: We all did things during the reign of my mad brother that we might not otherwise have done.", "CLAUDIUS: That's true. That is true. Only some of us did them a little more willingly than others, didn't we?"]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Power Dynamics Revealed',
        e.description = 'Agrippinilla asserts her desire for power within the marriage, claiming that she shall not be a mere cipher. Claudius acknowledges her ambition, subtly revealing his intent to wield her intellect for his benefit as they navigate the treacherous waters of imperial politics. Their alliance is laid bare as a calculated move rather than a romance.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AGRIPPINILLA: Admirably. But I shan't be a cipher, I can tell you that. If you give me power, I shall use it.", "CLAUDIUS: Now why else do you imagine I'm giving it to you?"]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Whispers of Cryptic Intent',
        s.description = 'Agrippinilla\'s private apartments are a sumptuous haven, draped in rich fabrics and illuminated by the soft glow of lamplight, yet the air crackles with unspoken tension.  The opulent surroundings, usually a source of comfort and power for Agrippinilla, now feel like a gilded cage as she paces restlessly, her mind wrestling with the perplexing pronouncements of Emperor Claudius. The emotional atmosphere is thick with suspicion and unease as Agrippinilla grapples with the emperor\'s cryptic words regarding their impending marriage. Pallas enters, his expression mirroring Agrippinilla\'s concern, and the hushed conversation that ensues reveals the undercurrent of intrigue and veiled motives that permeate the Roman court. This scene is pivotal in establishing Agrippinilla\'s growing distrust of Claudius and her determination to unravel his true agenda, setting the stage for future conflicts and highlighting the precarious nature of power in their world. The thematic elements of deception and hidden agendas are palpable, underscoring the treacherous landscape of Roman politics.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_agrippinillas_private_apartments'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Agrippinilla Questions Claudius\'s True Motives',
        e.description = 'Agrippinilla, visibly troubled despite the outward victory of securing marriage to Claudius, seeks clarity from Pallas. She voices her suspicion that Claudius\'s motivations are not as straightforward as they seem. Her pacing and direct questioning reveal her sharp intellect and unease with the emperor\'s seemingly agreeable demeanor. She senses a hidden layer beneath Claudius\'s actions, suspecting he may not desire a true partnership but something more complex and potentially manipulative. This moment sets the scene\'s central conflict: Agrippinilla\'s struggle to decipher Claudius\'s enigmatic intentions.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AGRIPPINILLA: We are to be married. But why?", "AGRIPPINILLA: He doesn't want me to share his bed. He doesn't even like me. He says he wants me to help him rule."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Pallas Recounts Claudius\'s Cryptic Utterance',
        e.description = 'Driven by Agrippinilla\'s persistent questioning, Pallas reluctantly reveals a strange, almost unsettling comment Claudius made when Agrippinilla\'s name was proposed for marriage. He recalls the emperor\'s bizarre phrase, \"Let all the poisons that are in the mud hatch out,\" delivered with an unsettling lack of context. This revelation hangs heavy in the air, amplifying Agrippinilla\'s suspicion and introducing a chilling layer of ambiguity to Claudius\'s character. The cryptic nature of the quote suggests a hidden agenda, a possible undercurrent of malice or calculation that unsettles Agrippinilla and deepens the scene\'s atmosphere of intrigue.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AGRIPPINILLA: What did he say when you suggested me?", "AGRIPPINILLA: Nothing more?", "AGRIPPINILLA: What? What did he say?", "PALLAS: Er... \"Let all the poisons that are in the mud hatch out\" or something like that."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Agrippinilla Strategizes for Nero\'s Ascendancy',
        e.description = 'Despite the unsettling nature of Claudius\'s words, Agrippinilla\'s ambition remains undeterred. She quickly pivots from contemplation to strategic planning, dismissing the possibility of Claudius\'s madness while acknowledging his potential short lifespan post-marriage. Her focus immediately shifts to securing Nero\'s future, emphasizing the necessity of Claudius remaining alive long enough for her son to reach maturity and claim his destined power. This moment underscores Agrippinilla\'s ruthless pragmatism and unwavering commitment to her son\'s imperial ambitions, solidifying her role as a master manipulator in the treacherous game for the Roman throne.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AGRIPPINILLA: Perhaps his mind's going.", "PALLAS: Maybe he won't last long after his marriage.", "AGRIPPINILLA: No. We must keep him alive long enough for my son to come of age."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Claudius Addresses the Senate',
        s.description = 'In the grand chamber of the Senate, resplendent with marble columns and the weight of Roman authority, Emperor Claudius stands before a sea of senators, his presence both commanding and anxious. The air is thick with the tension of political maneuvering, vibrant with the echoes of ambition and the ghosts of past rulers. As Claudius begins to speak, the sunlight filters through the high windows, illuminating the intricacies of the rich mosaics that adorn the walls, while shadows hint at the treachery that brews within the Senate’s heart. His voice, though steady, carries the tremor of authority mingled with vulnerability as he recounts the arduous conquest of Britain, the culmination of years of struggle. The mood shifts dramatically as the defiant King Caractacus enters in chains, his spirit unbroken, igniting an unexpected wave of respect and admiration among the senators. Their applause reverberates like thunder, revealing a deep yearning for valor and dignity in the Roman experience. This pivotal moment encapsulates the broader themes of power, honor, and the complexities of leadership, underscoring Claudius\'s tenuous grip on authority amidst the gathering storm of political intrigue.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Claudius Declares Victory in Britain',
        e.description = 'Emperor Claudius stands resolutely before the Senate, laying claim to the end of the prolonged conflict in Britain. He recounts the challenges faced during the conquest, emphasizing the enormous sacrifices made. With a voice that seeks to inspire but also reveals the burden of leadership, he highlights the singular responsibility for the losses encountered during the campaign, setting the stage for the Senate\'s reaction. This moment serves to consolidate his authority and seek approval from the assembled senators, showcasing the delicate dance between power and public perception.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Senators. Seven years ago, I undertook the conquest of the island of Britain. It has taken until now to complete it."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Caractacus Stands Defiant',
        e.description = 'As Claudius speaks, King Caractacus is brought into the Senate in chains, yet his spirit remains unyielded. In a powerful display of courage, he challenges the Roman senators, declaring that mere displays of military might will not subdue the spirit of the Britons. His fiery words resonate in the chamber, illustrating the fight for dignity even in defeat. The senators, instead of viewing him merely as a vanquished foe, are moved by his defiance and valor, leading to an unexpected eruption of applause. This event marks a significant turning point, as it shifts the Senate\'s perception of Caractacus from enemy to respected adversary, reflecting the complex interplay of honor, courage, and the politics of respect.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I'll tell you this. If the sword is all that you're prepared to show us Britons, then be prepared to carry it forever in your hand... and sleep with it forever by your side at night! For you will need it!"]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Senate Applauds Caractacus',
        e.description = 'Following Caractacus\'s impassioned speech, the Senate erupts in applause, a testament to the unexpected respect and admiration he has garnered. This moment of unity among the senators highlights their yearning for integrity and strength, values that resonate deeply within the Roman ethos. Claudius watches, perhaps taken aback by the emotional response, realizing that the tide of political sentiment can shift in an instant. This event encapsulates the powerful impact of charisma and courage in leadership, reinforcing the idea that true strength lies not just in military conquest but in the respect earned through valorous behavior.',
        e.sequence_within_scene = 3,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Imperial Maneuvers and Prophetic Confessions',
        s.description = 'The scene unfolds within Claudius\'s grand yet austere bedroom, bathed in the stark daylight streaming through tall windows overlooking the Roman Forum. The physical grandeur of the imperial chamber, with its tapestries and commanding view, contrasts sharply with the tense and manipulative atmosphere within. Agrippinilla, Nero, and Britannicus are present, staging a grotesque tableau of forced family unity, while unspoken power struggles simmer beneath the surface. The emotional atmosphere is thick with veiled animosity, subtle power plays, and a palpable sense of foreboding. Claudius, weary and seemingly detached, presides over the scene, yet his pronouncements hint at a hidden agenda. This scene is pivotal in advancing the plot by showcasing Agrippinilla\'s manipulative control, Britannicus\'s simmering resentment, and Claudius\'s unexpected strategic depth, setting the stage for the tragic events to come and revealing the complex web of political and familial tensions at the heart of the narrative. Thematic elements of ambition, deception, and fate are strongly present, as characters maneuver for dominance while Claudius hints at a preordained destiny.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_bedroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Musical Barbs and Forced Harmony',
        e.description = 'Claudius, in a moment of cynical reflection, openly declares his distaste for Agrippinilla and Nero, setting a dark tone for the scene. Agrippinilla, ever the opportunist, seizes upon Nero\'s musical talents to subtly belittle Britannicus, suggesting a duet that highlights Britannicus\'s perceived lack of accomplishments. This seemingly innocuous exchange reveals the underlying tension and Agrippinilla\'s constant efforts to undermine Britannicus in favor of Nero, setting the stage for further conflict.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: I'm am near the end of my story. I have been married to Agrippinilla for five years and she has turned out as loathsome as I thought she would. As has that slimy son of hers.", "AGRIPPINELLA: Yes. ... I wonder, Britannicus, that you don't take lessons.", "BRITANNICUS: I'm not interested in music.", "AGRIPPINELLA: Pity. You could play duets together.", "BRITANNICUS: That would be very unlikely, Lucius Domitius being so gifted."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'The Name Game and Demand for Apology',
        e.description = 'Agrippinilla escalates the tension by aggressively correcting Britannicus\'s use of Nero\'s birth name, \'Lucius Domitius,\' insisting he use \'Nero\' and demanding an apology for what she perceives as deliberate disrespect. This power play underscores Agrippinilla\'s dominance and her determination to assert Nero\'s elevated status, even forcing Claudius to intervene and command Britannicus to apologize, further highlighting Britannicus\'s marginalized position within his own family.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AGRIPPINELLA: I wish you would stop addressing him as Lucius Domitius. He has adopted the name of Nero.", "BRITANNICUS: I forgot.", "AGRIPPINELLA: No, you do not forget. I think you do it deliberately.", "AGRIPPINELLA: Well, you have been reminded, which I think calls for a correction and an apology.", "AGRIPPINELLA: I think it is. Well?", "BRITANNICUS: I shall not apologize.", "AGRIPPINELLA: I think you will. Claudius, I insist that you order him to apologize."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Britannicus\'s Accusation and Painful Outburst',
        e.description = 'Britannicus refuses to apologize and erupts in a raw display of anguish and resentment. He accuses Claudius of constantly siding with Agrippinilla and Nero against him, culminating in a heart-wrenching accusation of Claudius murdering his mother, Messalina. This outburst reveals the deep wounds of the past and Britannicus\'s profound sense of betrayal and injustice, showcasing the emotional chasm that separates him from his father and stepfamily.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Apologize to N-Nero, Britannicus. You've hurt his feelings and you know how sensitive he is.", "BRITANNICUS: You side with them! You take her side and his against me all the time. I shall not apologize!", "CLAUDIUS: You will apologize or you'll be punished.", "BRITANNICUS: What will you do? Have me executed as you did my mother? I detest you all! All of you!"]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'False Sympathy and Coded Praise',
        e.description = 'Nero interjects with feigned sympathy for Britannicus, attempting to appear magnanimous while subtly reinforcing his own perceived victimhood. He suggests seeking out Britannicus with Octavia under the guise of pacification, showcasing a calculated performance of kindness. Agrippinilla reinforces this manipulation by praising Nero\'s supposed kindness and highlighting the growing affection between Nero and Octavia, strategically setting the stage for her forthcoming marriage proposal.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["NERO: I'm sorry to have been the cause of that.", "AGRIPPINELLA: It's not your fault, everyone can see that.", "NERO: Nevertheless, I'll go and see him. Come, OCTAVIA, let's go and find your brother. Perhaps we can pacify him.", "OCTAVIA: I think you're very kind.", "NERO: There's far too little kindness in the world.", "AGRIPPINELLA: Have you noticed how fond they are of each other? Everyone's commenting on it. Nero simply adores her."]
    ;
MERGE (e:Event {uuid: 'event_7_5'})
    ON CREATE SET
        e.title = 'Marriage Proposal and Eager Assent',
        e.description = 'Agrippinilla initiates her calculated marriage proposal, suggesting the union of Nero and Octavia. Claudius, anticipating her request, immediately and enthusiastically agrees, stating it is a good match even before Agrippinilla fully articulates her proposal. His eagerness and preemptive agreement hint at a deeper, hidden strategy, unsettling Agrippinilla and suggesting he is not as easily manipulated as she believes.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AGRIPPINELLA: There's something I've been wanting to speak to you about for a long time.", "CLAUDIUS: Yes.", "AGRIPPINELLA: It concerns the matter of... Pardon?", "CLAUDIUS: The answer is yes.", "AGRIPPINELLA: You don't know what I'm going to ask.", "CLAUDIUS: Aren't you going to suggest that I marry Octavia to your son?", "AGRIPPINELLA: Yes.", "CLAUDIUS: The answer is yes.", "AGRIPPINELLA: Don't you wish to discuss it?", "CLAUDIUS: What is there to discuss? They'll be well matched."]
    ;
MERGE (e:Event {uuid: 'event_7_6'})
    ON CREATE SET
        e.title = 'Adoption Gambit and Swift Compliance',
        e.description = 'Agrippinilla, emboldened, proceeds to her ultimate power play: proposing Nero\'s official adoption as joint heir, effectively sidelining Britannicus. Again, Claudius swiftly agrees, even preempting her full statement and claiming he \'read her mind\'. This repeated immediate assent, seemingly too good to be true, further disquiets Agrippinilla and reinforces the growing suspicion that Claudius\'s acquiescence is not genuine but part of a calculated game.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["AGRIPPINELLA: ... It just occurred to me that since he now will be marrying Octavia...", "CLAUDIUS: The answer once again is yes.", "AGRIPPINELLA: Will you let me finish? You don't even know what I'm going to say! You're in your cups! You've had too much wine again.", "CLAUDIUS: Oh my dear, I thought you were going to suggest that I adopt Nero officially as my son. Make him and Britannicus joint heirs. Of course, if that is not what you were going to say.", "AGRIPPINELLA: Yes. Yes, it was. It was. I just wish you'd let me finish! Your manner's very strange."]
    ;
MERGE (e:Event {uuid: 'event_7_7'})
    ON CREATE SET
        e.title = 'Narcissus\'s Fury and Claudius\'s Prophetic Revelation',
        e.description = 'After Agrippinilla departs, Narcissus confronts Claudius, expressing his outrage and disbelief at Claudius\'s decisions. In response to Narcissus\'s accusations of folly, Claudius unveils his hidden strategy, revealing he is acting according to a prophecy from the Sibyl, delivered to him by Livia. He explains his plan is to let Nero\'s tyranny destroy the monarchy, paving the way for Britannicus to eventually restore the Republic. This revelation dramatically shifts the scene\'s tone, exposing Claudius\'s calculated deception and his grand, albeit risky, plan, grounded in a belief in destiny and a desire to undo his imperial legacy.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["NARCISSUS: You should have consulted me! I would have talked you out of it. I would never have let it happen. Never!", "CLAUDIUS: That's why I never discussed it.", "NARCISSUS: By marrying Nero to your daughter and adopting him as your son, you've signed your death warrant, that's what you've done. Your wife has got everything she wanted out of marrying you. Everything! She doesn't need you anymore.", "CLAUDIUS: I shall die soon anyway.", "NARCISSUS: Why did you do it? Why? Did you not at least think of Britannicus?", "CLAUDIUS: I thought principally of him.", "CLAUDIUS: N-Nero is destined to rule after me, not Britannicus. It has been foretold, Narcissus, nothing can alter it.", "NARCISSUS: Foretold? By who?", "CLAUDIUS: By the Sibyl", "CLAUDIUS: Nero will kill his mother. That, too, has been foretold by the Sibyl", "CLAUDIUS: All my life I wanted to see the Republic restored, yet I let myself be made an Emperor. That was written too. But I made a mistake. I tried to rule wisely and justly, blunting the edge of monarchy, reconciling the people to it. In doing that, I was helping monarchy. Now I shall destroy it once and for all. Or rather Nero will destroy it. He's as mad as my n-nephew, Caligula. We're all mad, we Caesars. When we are gone, the people will finish with monarchies once and for all, and return to the sanity of the Republic.", "CLAUDIUS: He is my instrument. He will restore the Republic."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Schemes in the Shadows',
        s.description = 'In the opulence of Agrippinilla\'s bedroom, rich fabrics drape the walls, casting shadows under the flickering candlelight. The atmosphere is thick with tension as Agrippinilla, sharp-witted and ambitious, discusses her plans with Pallas, her concerned advisor. They plot the downfall of Claudius, aware that his unpredictability could thwart their ambitions. Pallas expresses unease about Agrippinilla\'s son, Nero, now married, and questions his reliability. Agrippinilla dismisses his concerns, asserting her control over Nero. The tension escalates with the sudden arrival of Nero, who is restless and frustrated, leading to a confrontation filled with insecurities and maternal manipulation. Agrippinilla balances her ambitions and the unpredictable emotions of her son, setting the stage for manipulation within the imperial household.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_agrippinillas_bedroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Agrippinilla and Pallas Plot',
        e.description = 'Agrippinilla and Pallas engage in a conspiratorial discussion about the need to act quickly against Claudius. Pallas expresses concern about Narcissus, emphasizing the heightened scrutiny surrounding the Emperor\'s meals. Agrippinilla insists on seeking advice, revealing her determination to secure her ambitions. The conversation highlights the precarious nature of their plans and the lurking dangers they face.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AGRIPPINA: We must do it now.", "PALLAS: It won't be easy. NARCISSUS watches him like a hawk."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Locusta as a Weapon',
        e.description = 'Pallas reveals the possibility of engaging Locusta, a skilled woman, to aid their plans, emphasizing the importance of acting swiftly. Agrippinilla’s eagerness to proceed indicates her commitment to the treachery ahead. The moment is charged with the urgency of their conspiratorial intentions, reflecting both ambition and anxiety about their future.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["PALLAS: Well, there is someone. AGRIPPINA: Ah.", "PALLAS: A woman, LOCUSTA. She's very skilled."]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Nero\'s Entrance',
        e.description = 'Nero bursts into the room, revealing his agitation and restlessness. His disdain for Pallas further complicates the dynamics, exposing his insecurities about his mother\'s confidants. Agrippinilla attempts to soothe him, manipulating his emotions and redirecting his frustrations away from her schemes, showcasing her dual role as a mother and a schemer.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NERO: I don't like that Greek.", "AGRIPPINA: That Greek runs this Empire."]
    ;
MERGE (e:Event {uuid: 'event_8_4'})
    ON CREATE SET
        e.title = 'Nero\'s Frustration',
        e.description = 'Nero expresses his frustrations about Octavia locking him out, showcasing his immaturity and entitlement as he struggles to assert his authority. Agrippinilla plays into his insecurities, offering to find him companionship, which reflects her manipulative nature and the complex relationship between mother and son. This moment underlines Nero\'s vulnerability amid rising ambitions.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["NERO: She's locked herself in her bedroom. She won't let me in.", "AGRIPPINA: Did you quarrel?"]
    ;
MERGE (e:Event {uuid: 'event_8_5'})
    ON CREATE SET
        e.title = 'Maternal Manipulation',
        e.description = 'Agrippinilla employs her maternal instincts to manipulate Nero further, downplaying Octavia\'s actions and reinforcing his sense of entitlement. Her suggestion to find a \'pretty house girl\' reveals her dual motives, balancing genuine concern for her son’s feelings with her overarching ambitions for power. Nero\'s responses illustrate his growing sense of autonomy, setting the stage for future conflicts.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AGRIPPINA: It was very naughty of Octavia to lock you out.", "AGRIPPINA: Would you like me to find a pretty house girl for you?"]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'The Weary Emperor\'s Last Stand',
        s.description = 'The grand Senate House, a hall of towering columns and hushed reverence, is the stage for Emperor Claudius\'s final address. Daylight streams in, illuminating the formal assembly of senators in their crimson robes. Claudius, though physically frail, stands before them with a palpable resolve in his weary eyes. His voice, though trembling with age and illness, resonates with the authority of his office as he announces his impending departure from the political stage. The emotional atmosphere is heavy with a mixture of disbelief, forced protestations, and an underlying sense of the inevitable end of an era. Claudius\'s words are not merely a resignation; they are a poignant reflection on the nature of power, the burdens of leadership, and the fleeting nature of life itself. This scene serves as Claudius\'s valedictory moment, a public confession of his weariness and a cryptic hint at a legacy beyond the mundane concerns of the Senate, underscored by the encroaching hallucinations that reveal his increasingly fragile mental state.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Claudius Declares His Farewell',
        e.description = 'Standing before the assembled Senate, Claudius, with a voice weakened yet firm, announces that this will be his last appearance before them. He frames it as a farewell speech, signaling his intention to step down from his imperial duties due to age and failing health. His words carry a weight of finality, hinting at the end of his reign.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Senators, you see me here for the last time. I shall not come again. This is in the nature of a farewell speech."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Senate\'s Feigned Protest and Claudius\'s Weary Dismissal',
        e.description = 'The Senate, in a display of expected courtly behavior, voices dissent at Claudius\'s declaration, urging him to reconsider. However, Claudius, with a tone of profound weariness, dismisses their protests. He cites his advanced age and declining health as reasons for his decision, suggesting a deep-seated fatigue with the burdens of his position and a sense of his own obsolescence in their eyes.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SENATE: No, no.", "CLAUDIUS: I'm too old and I'm not well enough. I don't think you need my presence here anymore. I sometimes wonder if you ever did."]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Confession of Reluctant Emperor and Yearning for Final Rest',
        e.description = 'Claudius reveals the unexpected and unwanted nature of his ascension to Emperor, recalling being \'dragged from behind a curtain\' and made ruler against his will. He confesses he never desired the position and believes it was a mistake. He then speaks of a \'final curtain\' of death, expressing a weary anticipation for its arrival, contrasting sharply with the Senator\'s expected wish for his eternal reign.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Few of you know, the soldiers dragged me from behind a curtain and made me Emperor. I n-never wanted it. I think it was a mistake.", "SENATE: No! No!", "CLAUDIUS: Well, be that as it may. Soon I shall retire behind another curtain - the final one. The one the gods draw over all of us in the end, great and small. I shan't be sorry to see that final curtain.", "SENATOR: May you live forever, Caesar!", "CLAUDIUS: No, thank you! But I've no wish to, even if I could."]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Claudius Hints at Historical Legacy and Resurrection',
        e.description = 'Claudius shifts his tone to contemplate his historical legacy, musing on how history\'s judgment differs from contemporary opinions. He cryptically mentions a \'something\' he has done, unrelated to the Senate\'s concerns, alluding to his historical writings. He speaks of knowing \'great people\' who made Rome and envisions a future \'resurrection\' where \'the dead will come to life\' and Rome will be revealed \'for what she truly was,\' suggesting his historical work as a means to unveil a deeper, truer Rome beyond superficial political narratives.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: What you will s-say about me when I'm gone... I can only guess at. I hope it won't be as cutting as the things you've said while I was here. Not to my face, of course. That's not an Emperor's privilege. But what is said about us in our lives is not always what history says. And doubtless history will have its say, as it always does. And about that, I have done something. Oh, not something that need concern you... but something. You see, in the course of my life I have known many people. Great people. People who have m-made Rome what she is today. Yes. And one day, they will all live again. The dead will come to life. The man who dwells by the pool will open graves... and deliver Rome up again. She shall be seen for what she truly was."]
    ;
MERGE (e:Event {uuid: 'event_9_5'})
    ON CREATE SET
        e.title = 'Claudius\'s Descent into Hallucinatory Voices of the Past',
        e.description = 'As Claudius closes his eyes, he is immediately besieged by a cacophony of voices from his past – Augustus, Livia, Antonia, Caligula, and Tiberius. These voices, representing the ghosts of his lineage, offer mocking and critical commentary on his reign and his life. Augustus offers faint praise, while Livia and Antonia revert to familial condescension. Caligula\'s absurd pronouncements and Tiberius\'s cynical remarks highlight the tragic and burdensome legacy of the Julio-Claudian dynasty weighing on Claudius\'s mind, blurring the lines between reality and hallucination.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS (V.O.) Well done, Claudius. Emperor after all. Who would have thought it, eh?", "LIVIA (V.O.) You're a fool, boy, you always were. People say it's not your fault, but if it's not your fault, whose fault is it, eh?", "ANTONIA (V.O.) And your nose is still running, Claudius. It's still running.", "CALIGULA (V.O.) Excuse me.", "TIBERIUS (V.O.) Just a minute. Just wait your turn.", "TIBERIUS (V.O.) It wasn't worth it, was it? I could have told you that.", "CALIGULA (V.O.) Uncle Claudius, I wasn't the Messiah after all. Would you believe it? You could have knocked me over with a feather when they told me."]
    ;
MERGE (e:Event {uuid: 'event_9_6'})
    ON CREATE SET
        e.title = 'Senate\'s Dismissive Pragmatism and Return to Mundane Affairs',
        e.description = 'Ignoring Claudius\'s evident distress and his descent into hallucination, a Senator suggests calling for a doctor, reflecting a superficial concern or perhaps a pragmatic dismissal of the Emperor\'s mental state as irrelevant to the business of state. The Consul, even more pragmatically, cuts through any pretense of concern and directs the Senate to \'continue with the business of the day\', highlighting the cold, bureaucratic machinery of Roman governance that grinds on regardless of the Emperor\'s personal or mental state. This emphasizes the Senate\'s focus on practical matters over the Emperor\'s existential or health crises.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["SENATOR: Shall a doctor be brought?", "CONSUL: Senators, let us continue with the business of the day."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'A Father\'s Betrayal',
        s.description = 'In the secluded confines of Claudius\'s private study, the atmosphere is dense with tension and unspoken truths. The chamber, dimly lit by flickering candles, is laden with scrolls and maps that silently bear witness to the Emperor\'s desperate attempts to secure the future of his son, Britannicus. Claudius, with a weary demeanor that hints at the burdens of his reign, gestures for Britannicus to approach, his voice trembling as he navigates the delicate terrain of paternal affection and political pragmatism. Britannicus stands at the precipice of youthful rebellion and deep-seated resentment, his anger bubbling over as he confronts his father\'s past decisions. The emotional atmosphere oscillates between fear, anger, and a glimmer of hope, as Claudius attempts to articulate a plan intended to protect his son from the looming threat of Nero. This pivotal moment unveils the fraught dynamics of their relationship, a tragic interplay of love, betrayal, and the stark realities of imperial power. The stakes are high as Claudius reveals his intentions to alter his will in favor of Nero, setting off a chain of desperate pleas from Britannicus, who yearns for recognition and a chance to reclaim his rightful place in the Roman legacy.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Claudius Summons Britannicus',
        e.description = 'In a dim, candlelit study, Claudius gestures for Britannicus to approach, indicating the urgent nature of their meeting. He instructs Narcissus to leave, emphasizing the secrecy of their discussion. Claudius reveals his intention to alter his will in favor of Nero, a decision that shocks and angers Britannicus.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Leave us, Narcissus. I will send for you.", "I intend to alter my will in favor of Nero."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Britannicus Confronts Claudius',
        e.description = 'Britannicus, filled with indignation, challenges Claudius on why he feels the need to explain his decision now when he has consistently favored Nero over him. He passionately accuses Claudius of never loving him and of being responsible for his mother\'s death, expressing feelings of hatred towards his father.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["You haven't felt it before.", "I shall never forgive you for that either. I hate you."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Justification',
        e.description = 'Claudius attempts to explain his past feelings, revealing that he struggled to love Britannicus after learning of his mother\'s deceptions. He expresses that despite the doubts about Britannicus\'s parentage, he has come to recognize him as his son and conveys a love that is stifled by the weight of imperial burdens.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["I believe you are C-Caligula's son.", "You are now my son and I love you more than anyone in the world."]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'The Plan Unfolds',
        e.description = 'Claudius reveals a plan to protect Britannicus from Nero, explaining the potential threats he faces from his stepbrother. He outlines a scheme for Britannicus to hide in Britain, away from Roman eyes, emphasizing the necessity of this drastic measure.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Nero will try to kill you, as C-Caligula killed Gemellus.", "You will go with them in disguise."]
    ;
MERGE (e:Event {uuid: 'event_10_5'})
    ON CREATE SET
        e.title = 'Britannicus\'s Defiance',
        e.description = 'Britannicus vehemently rejects Claudius\'s plan, filled with indignation at the thought of hiding among barbarians. He demands to be treated as a man and asserts his desire to confront Nero directly, challenging the notion of retreat as dishonorable.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["I can protect myself.", "If you love me, give me that chance."]
    ;
MERGE (e:Event {uuid: 'event_10_6'})
    ON CREATE SET
        e.title = 'Claudius\'s Resignation',
        e.description = 'Claudius, acknowledging Britannicus\'s resolve and ambition, expresses a somber acceptance of his son\'s wishes, conceding to the youth\'s desire to rule. He offers a final blessing, a recognition of the storm that lies ahead for both of them.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["I've done all I could.", "May the gods protect you."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Claudius\'s Weary Curtain Call',
        s.description = 'Night envelops Claudius\'s private chambers, the air thick with the scent of aged parchment and beeswax from the numerous scrolls that surround his writing desk.  The room is dimly lit, casting long shadows that dance with the flickering candlelight, emphasizing the Emperor\'s isolation.  A profound sense of weariness permeates the space, emanating from Claudius himself as he sits hunched over his work, the weight of empire and years etched into his posture.  The atmosphere is heavy with resignation and a quiet acceptance of mortality, underscored by the silence broken only by his soft, final pronouncements. This scene serves as a poignant farewell for Claudius, a moment of reflection on his life\'s tumultuous journey and the legacy he leaves behind.  It\'s a moment of closure before the inevitable, a release from the burdens of power and a somber prelude to his death, emphasizing the thematic elements of mortality, legacy, and the acceptance of fate.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Claudius Embraces the End',
        e.description = 'Alone in his study, Emperor Claudius closes his eyes, a profound exhaustion washing over him.  He speaks to himself, declaring his writing complete, his historical record set straight as prophesied by the Sibyl. A deep weariness permeates his words as he acknowledges the completion of his life\'s work and expresses a profound readiness for death, seeing it as a welcome release. He is tired of the burdens of rule, the constant betrayals, and the relentless machinations of the Roman court. In this solitary moment, he welcomes the finality of death, anticipating the drawing of life\'s final curtain.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Write no more, Claudius. Write no more.", "CLAUDIUS: I have told it all, as I said I would, and as the Sibyl prophesied. I have told the truth. I have set the record straight. It is all here for remote posterity.", "CLAUDIUS: Come, Death, and draw the final curtain. I am tired. Oh so tired."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'The Search for the Will',
        s.description = 'In the dim light of the Imperial Library, AGRIPPINILLA and NERO stand amidst a chaotic scattering of scrolls, the air thick with tension as they search for Claudius\'s will. The library, once a grand repository of knowledge, now feels like a tomb, echoing the weight of past legacies and hidden treachery. AGRIPPINILLA\'s voice cuts through the silence, her urgency revealing the depths of her ambition. NERO, caught between awe and despair, reflects on the Herculean labor of his late father, yet is drawn to the seductive idea of destruction as AGRIPPINILLA plans to burn the scrolls, a chilling testament to her ruthless desire for power. The scene encapsulates the foreboding atmosphere of impending doom that hangs over the characters, highlighting the lengths they will go to secure their ambitions and erase the past.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_library'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Agrippinilla Demands the Scrolls',
        e.description = 'AGRIPPINILLA\'s voice resonates with urgency and authority as she commands NERO to find the rest of Claudius\'s scrolls, emphasizing her relentless ambition and desire to control the narrative of their legacy. She expresses her disdain for the scattered remnants of Claudius\'s work, indicating her willingness to obliterate his memory to establish her son\'s dominance.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["So much for posterity. Where's the rest of it? It must be here. Find it!"]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Nero Reflects on Claudius\'s Labor',
        e.description = 'NERO, surveying the scattered scrolls, reflects on the Herculean effort it took Claudius to compile them, a moment that evokes both admiration and a sense of loss. This moment reveals NERO\'s conflicting emotions as he grapples with the legacy of his father and the impending destruction of his life\'s work under AGRIPPINILLA\'s ruthless plans.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["This looks like them. Yes, this is them all right. What a Herculean labor! It must have taken him years."]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Agrippinilla\'s Call for Destruction',
        e.description = 'AGRIPPINILLA\'s chilling decision to burn the scrolls underscores her ambition to erase Claudius\'s legacy as she aims to solidify her control over the future of the empire through her son, NERO. Her cold dismissal of the scrolls\' significance highlights the lengths she will go to eliminate any threats to her power, foreshadowing the destructive path she intends to follow.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Years. We'll burn the lot."]
    ;
MERGE (e:Event {uuid: 'event_12_4'})
    ON CREATE SET
        e.title = 'Nero\'s Dark Fascination with Fire',
        e.description = 'NERO\'s morbid fascination with the idea of burning the scrolls reveals a troubling delight in destruction, echoing the corrupted ambition that he inherits from AGRIPPINILLA. His line, \'What a pretty thing a fire is,\' serves as a dark counterpoint to the gravity of their actions, emphasizing the seductive power of chaos and destruction in their quest for dominance.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["What a pretty thing a fire is."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Journey to the Beyond',
        s.description = 'On a mist-shrouded riverbank, a liminal space that exists neither in Rome nor fully beyond, Britannicus and Narcissus grapple with the immediate aftermath of Claudius\'s murder. The air is thick with grief and the chilling reality of betrayal. As they mourn, the ethereal Sibyl materializes, her presence woven into the dim light of flickering torches, becoming a conduit for the spectral voice of Claudius himself. This otherworldly shore becomes a stage for final pronouncements and farewells, a poignant transition point as Claudius confronts his death and the destinies of those he leaves behind. The scene evokes a sense of mournful reflection and the inexorable pull of fate, underscored by the ghostly whispers that seem to emanate from the very waters of the river.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_ferrymans_shore'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Mourning the Poisoning',
        e.description = 'Britannicus, overcome with sorrow, confronts Narcissus, demanding to know the details of Claudius\'s death. Narcissus confirms the Emperor was poisoned, explaining Agrippinilla\'s cunning method involving a dish of mushrooms. He recounts how she offered Claudius a poisoned mushroom from her own plate, exploiting their shared meal to deliver the fatal dose. Narcissus expresses his regret at not preventing the murder and warns Britannicus of the danger he now faces, urging him to flee.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["BRITANNICUS: Did they murder him?", "NARCISSUS: Yes. Yes, they poisoned him.", "BRITANNICUS: But how? How did they do it? Why didn't you protect him?", "NARCISSUS: Well, they were clever, very clever. They tried several times to tamper with his food and get at the slaves who prepared it, but I always stopped them. Always. I built a wall around him they couldn't breach. How then did she do it? I will tell you. For I see now how it was done. Unable to poison his food, she must have poisoned her own. Yes, poisoned hers or part of it. It was in a dish of mushrooms, which he loved, and out of which she'd been eating. He had finished his own and was calling for some more which he often did. It was then that she offered him hers out of her own dish. At first, I thought nothing of it. When you're used to seeing someone eat from a dish, it doesn't occur to you it may contain something different in just one part of it. And then she lifted the mushroom onto her fork and held it out for him to take. I knew then there was something different about it. I knew, as certainly as I had ever known anything, that he was suddenly in the gravest danger. And I knew too, as certainly as I knew that... that he knew - knew it was poisoned, knew that his end was there on that fork... and that he didn't care... that he welcomed it.", "NARCISSUS: ... Now, you must go away. They will kill you."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Sibyl and Ghostly King',
        e.description = 'As Narcissus and Britannicus speak of Claudius, the Sibyl materializes, her ethereal form appearing amidst the misty riverbank. She addresses Claudius, her words echoing into the night.  Claudius\'s disembodied voice responds, revealing he is aware of his death but with a touch of wry amusement, believing he has somehow outwitted his murderers once more. The Sibyl swiftly corrects his delusion, grounding him in the reality of his demise.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["NARCISSUS: Oh, I don't know. He didn't do badly when you come to think of it.", "THE SYBIL: Well, Old King Log? Poisons all hatched out?", "CLAUDIUS (O.S) Is that you, Sibyl?", "THE SYBIL: Yes it's me.", "CLAUDIUS (O.S) Where are you?", "THE SYBIL: Here. Why are you laughing?", "CLAUDIUS (O.S) I cheated them again. They all think I'm dead.", "THE SYBIL: But you are dead, you fool! You're as dead as anyone can be.", "CLAUDIUS (O.S) Oh well, you can't survive them all."]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'Prophecies of Doom',
        e.description = 'Claudius, now accepting his death, expresses concern for Britannicus and Narcissus. He asks the Sibyl about their fates. The Sibyl, with chilling certainty, foretells a grim future: Nero will murder Britannicus, Agrippinilla will kill Narcissus, and in a brutal twist of fate, Nero will ultimately kill Agrippinilla, completing a cycle of violence and betrayal within his own family.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS (O.S) Wait. Britannicus. What will happen to him?", "THE SYBIL: Nero will kill him.", "CLAUDIUS (O.S) And Narcissus?", "THE SYBIL: Agrippinilla will kill him. Then Nero will kill her.", "CLAUDIUS (O.S) It all sounds depressingly familiar."]
    ;
MERGE (e:Event {uuid: 'event_13_4'})
    ON CREATE SET
        e.title = 'Legacy and Farewell',
        e.description = 'The Sibyl then speaks of the Empire\'s continuation, fulfilling Livia\'s prophecy, but declares that Claudius\'s line will end with Nero, marking the close of an era. She reveals the destruction of Claudius\'s historical writings by Nero and Agrippinilla, but assures him that a secret copy survives, preserving his legacy. Finally, the Sibyl announces that the ferryman awaits, signaling Claudius\'s time to depart for the afterlife.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["THE SYBIL: Yes, isn't it?", "CLAUDIUS (O.S) And the Empire?", "THE SYBIL: Oh that will go on, as Livia said it would. But they'll be no more Claudians after Nero. He'll be the last. But the Emperors won't be a bad lot after him. Well, give or take a few. ... Quite a story, wasn't it? ... They burned your book, you know. All of it. ... Lucky for you, you made a copy and buried it. ... It's time to go, Claudius. The ferryman is waiting."]
    ;
MERGE (e:Event {uuid: 'event_13_5'})
    ON CREATE SET
        e.title = 'The Ferryman Awaits',
        e.description = 'Claudius, resigned to his fate, prepares to leave the mortal realm. The Sibyl guides him towards the ferryman, painting a comforting picture of the journey – a short step to the boat, a brief crossing, and then the promise of peaceful dreams in a different story altogether.  She bids him a final, formal farewell, acknowledging his full imperial title and earthly reign, before the scene fades to black, signifying Claudius\'s departure and the end of his tumultuous reign.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CLAUDIUS (O.S) Just one thing more.", "THE SYBIL: You can't put it off... You can't stay here forever.", "CLAUDIUS (O.S) No, I suppose not.", "THE SYBIL: Now. ... Close your eyes. It's but a short step to the boat, a short pull across the river..", "CLAUDIUS (O.S) And then?", "THE SYBIL: And then, I promise you, you'll dream a different story altogether... Farewell, Tiberius Claudius Drusus Nero Germanicus, God of the Britons, one-time Emperor of the Roman world. Farewell."]
    ;
MATCH (o:Object {uuid: 'object_mysterious_box'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_throne'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_chains'}),
          (a:Agent {uuid: 'org_senate'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sword'}),
          (a:Agent {uuid: 'org_senate'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scrolls_and_maps'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scrolls'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_will'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_fire'}),
          (a:Agent {uuid: 'agent_agrippinilla'})
    MERGE (a)-[:OWNS]->(o);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Nero bursts into Claudius\'s study, his youthful face alight with a disturbing eagerness. He trails after Agrippinilla, moving with a jerky, impatient energy.  He questions his mother directly about Claudius\'s state, then, upon confirmation of the death, throws his arms wide in a childish gesture of triumph, rummaging carelessly through scrolls as he anticipates his new imperial status.',
        ap.emotional_state = 'On the surface, Nero is giddy and gleeful, almost childlike in his excitement at the news of Claudius\'s death and his own ascension. Beneath this surface bravado, there\'s a palpable thrill at the prospect of power, though it seems to be rooted in a superficial understanding of what emperorship entails. He expresses a fleeting, almost performative, pity for Claudius, quickly dismissed, revealing a chilling lack of genuine empathy.',
        ap.emotional_tags = ["on the surface, nero is giddy", "gleeful, almost childlike in his excitement at the news of claudius's death", "his own ascension. beneath this surface bravado, there's a palpable thrill at the prospect of power, though it seems to be rooted in a superficial understanding of what emperorship entails. he expresses a fleeting, almost performative, pity for claudius, quickly dismissed, revealing a chilling lack of genuine empathy.", "on the surface", "nero is giddy and gleeful", "almost childlike in his excitement at the news of claudius's death and his own ascension. beneath this surface bravado", "there's a palpable thrill at the prospect of power", "though it seems to be rooted in a superficial understanding of what emperorship entails. he expresses a fleeting", "almost performative", "pity for claudius", "quickly dismissed", "revealing a chilling lack of genuine empathy."],
        ap.active_plans = ["Confirm the reality of Claudius's death to solidify his understanding of the situation.", "Immediately announce his ascension to Emperor and bask in the glory of the title.", "Discover any immediate benefits or changes that come with his new position (implicitly guided by Agrippinilla to find the will)."],
        ap.beliefs = ["He believes that Claudius's death directly translates to his immediate and undisputed succession as Emperor.", "He believes being Emperor is inherently desirable and a source of personal gratification.", "He believes his mother, Agrippinilla, will handle the complexities of power, allowing him to enjoy the perks of emperorship without burden."],
        ap.goals = ["short-term\": \"Experience the immediate excitement and celebratory aspects of becoming Emperor.", "medium-term\": \"Solidify his position and enjoy the privileges and status associated with being the Roman Emperor.", "ultimate\": \"Rule Rome, though his conception of 'ruling' is likely self-centered and focused on personal pleasure rather than governance or legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla enters the study with Nero, her movements controlled and purposeful. She answers Nero\'s question about Claudius\'s death with a sharp, decisive \'Yes,\' her voice resonating with the finality of the act. She immediately takes charge, silencing Nero\'s childish outburst with a sharp \'Sh!\' and directing his focus towards the practical steps needed to secure their power. She begins a focused and intense search of Claudius\'s study, seeking the crucial will.',
        ap.emotional_state = 'Agrippinilla projects an outward image of controlled triumph, her face a carefully constructed mask of imperial composure. However, beneath this veneer of elegance, she is undoubtedly experiencing a surge of exhilaration and satisfaction as her long-laid plans come to fruition. Her internal state is charged with a potent mix of ambition fulfilled and a relentless drive to consolidate her and Nero\'s power. There\'s no room for sentimentality or grief; her focus is solely on the strategic necessities of this pivotal moment.',
        ap.emotional_tags = ["agrippinilla projects an outward image of controlled triumph, her face a carefully constructed mask of imperial composure. however, beneath this veneer of elegance, she is undoubtedly experiencing a surge of exhilaration", "satisfaction as her long-laid plans come to fruition. her internal state is charged with a potent mix of ambition fulfilled", "a relentless drive to consolidate her", "nero's power. there's no room for sentimentality or grief; her focus is solely on the strategic necessities of this pivotal moment.", "agrippinilla projects an outward image of controlled triumph", "her face a carefully constructed mask of imperial composure. however", "beneath this veneer of elegance", "she is undoubtedly experiencing a surge of exhilaration and satisfaction as her long-laid plans come to fruition. her internal state is charged with a potent mix of ambition fulfilled and a relentless drive to consolidate her and nero's power. there's no room for sentimentality or grief; her focus is solely on the strategic necessities of this pivotal moment.", "agrippinilla projects an outward image of controlled triumph, her face a carefully constructed mask of imperial composure. however, beneath this veneer of elegance, she is undoubtedly experiencing a surge of exhilaration and satisfaction as her long-laid plans come to fruition. her internal state is charged with a potent mix of ambition fulfilled and a relentless drive to consolidate her and nero's power. there's no room for sentimentality or grief", "her focus is solely on the strategic necessities of this pivotal moment."],
        ap.active_plans = ["Control Nero's immediate reactions to ensure they align with her strategic objectives and maintain an image of imperial dignity.", "Delay the public announcement of Claudius's death to gain a strategic advantage in securing Nero's succession and managing any potential opposition.", "Locate and secure Claudius's will to control the narrative of succession and potentially suppress any clauses unfavorable to Nero or herself."],
        ap.beliefs = ["She believes that Nero's ascension to Emperor is the culmination of her life's ambition and the key to her ultimate power.", "She believes that power is maintained through meticulous planning, strategic control, and swift action, leaving no room for emotional indulgence or vulnerability.", "She believes that Claudius's legacy, including his written will, poses a potential threat to Nero's unchallenged rule and must be managed or eliminated to ensure their dominance."],
        ap.goals = ["short-term\": \"Secure Claudius's will and manage the immediate aftermath of his death to ensure a smooth transition of power to Nero.", "medium-term\": \"Consolidate Nero's emperorship, neutralizing any potential threats to his rule and establishing herself as the power behind the throne.", "ultimate\": \"Establish a lasting dynasty under Nero's name, securing absolute and enduring power for herself and her lineage, shaping the future of Rome according to her ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Nero enters the study with an eagerness that radiates from his youthful posture. He rummages through parchments with careless abandon, displaying an animated energy that underscores his impatience and excitement at claiming the title of Emperor.',
        ap.emotional_state = 'Nero\'s surface emotions reflect a giddy exhilaration at his newfound power, punctuated by a cruel glint in his eyes. Internally, however, he may wrestle with a naive misunderstanding of the weight of his new title and the implications of his actions, revealing a mixture of innocence and burgeoning ambition.',
        ap.emotional_tags = ["nero's surface emotions reflect a giddy exhilaration at his newfound power, punctuated by a cruel glint in his eyes. internally, however, he may wrestle with a naive misunderstanding of the weight of his new title", "the implications of his actions, revealing a mixture of innocence", "burgeoning ambition.", "nero's surface emotions reflect a giddy exhilaration at his newfound power", "punctuated by a cruel glint in his eyes. internally", "however", "he may wrestle with a naive misunderstanding of the weight of his new title and the implications of his actions", "revealing a mixture of innocence and burgeoning ambition."],
        ap.active_plans = ["Announce Claudius's death to seize the imperial title.", "Collaborate with Agrippinilla to strategize control over Rome.", "Locate Claudius's will to legitimize his claim as Emperor."],
        ap.beliefs = ["The throne is his birthright and should be claimed without hesitation.", "Power brings freedom from the constraints of his past.", "The legacy of his predecessors is unimportant compared to his own ambitions."],
        ap.goals = ["Short-term: Announce his ascension to Emperor.", "Medium-term: Secure control over the narrative surrounding Claudius's death.", "Ultimate: Establish himself as a formidable ruler of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla enters with an elegant demeanor, her movements calculated and purposeful as she navigates the cluttered study. She displays focused intensity while searching for Claudius\'s will, embodying the sharpness of her ambition and her eagerness to control the unfolding situation.',
        ap.emotional_state = 'Agrippinilla\'s outward expression is a mask of controlled excitement, revealing her triumph yet underscored by an underlying urgency. Internally, she may grapple with anxiety about the precariousness of her plans, showcasing a complex duality between her ambition and fear of losing power.',
        ap.emotional_tags = ["agrippinilla's outward expression is a mask of controlled excitement, revealing her triumph yet underscored by an underlying urgency. internally, she may grapple with anxiety about the precariousness of her plans, showcasing a complex duality between her ambition", "fear of losing power.", "agrippinilla's outward expression is a mask of controlled excitement", "revealing her triumph yet underscored by an underlying urgency. internally", "she may grapple with anxiety about the precariousness of her plans", "showcasing a complex duality between her ambition and fear of losing power."],
        ap.active_plans = ["Delay the announcement of Claudius's death to maintain control over the narrative.", "Locate Claudius's will to ensure her son's claim remains legitimate.", "Strategically manipulate Nero's enthusiasm to align with her ambitions."],
        ap.beliefs = ["Power must be seized and maintained through cunning and control.", "Nero's ascension is vital for the continuation of her plans.", "Claudius's legacy must be managed to protect her own ambitions."],
        ap.goals = ["Short-term: Ensure the narrative surrounding Claudius's death favors Nero.", "Medium-term: Secure Claudius's will to cement her and Nero's positions.", "Ultimate: Establish a dynasty rooted in her family's power and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Nero eagerly enters Claudius\'s study alongside Agrippinilla, his movements reflecting a restless energy and lack of focus. He rummages through stacks of parchments with a careless disregard for their contents, more interested in the immediate thrill of the moment than any methodical search. He trails after Agrippinilla, physically present but mentally detached from the gravity of the situation, his actions driven by childish excitement.',
        ap.emotional_state = 'Nero is consumed by a giddy, almost disturbing glee at Claudius\'s death and his own ascension to Emperor. His surface emotions are transparently joyful, expressed through exclamations and a lack of decorum. Internally, he is reveling in the newfound power, devoid of genuine empathy for Claudius or understanding of the responsibilities of rule. His fleeting, insincere pity is a performative gesture, quickly dismissed in favor of self-congratulatory excitement, revealing a shallow emotional depth.',
        ap.emotional_tags = ["nero is consumed by a giddy, almost disturbing glee at claudius's death", "his own ascension to emperor. his surface emotions are transparently joyful, expressed through exclamations", "a lack of decorum. internally, he is reveling in the newfound power, devoid of genuine empathy for claudius or understanding of the responsibilities of rule. his fleeting, insincere pity is a performative gesture, quickly dismissed in favor of self-congratulatory excitement, revealing a shallow emotional depth.", "nero is consumed by a giddy", "almost disturbing glee at claudius's death and his own ascension to emperor. his surface emotions are transparently joyful", "expressed through exclamations and a lack of decorum. internally", "he is reveling in the newfound power", "devoid of genuine empathy for claudius or understanding of the responsibilities of rule. his fleeting", "insincere pity is a performative gesture", "quickly dismissed in favor of self-congratulatory excitement", "revealing a shallow emotional depth."],
        ap.active_plans = ["Confirm his ascension to Emperor.", "Immediately announce Claudius's death to Rome.", "Discover if Claudius's history mentions him and his role."],
        ap.beliefs = ["Becoming Emperor is inherently desirable and a cause for celebration.", "He is naturally entitled to the throne now that Claudius is gone.", "History is only relevant insofar as it pertains to him and his personal glory."],
        ap.goals = ["Short-term: Enjoy the immediate thrill of being Emperor and the attention it brings.", "Medium-term: Be publicly acknowledged and celebrated as the new Emperor of Rome.", "Ultimate: Achieve legendary status as a Roman Emperor, surpassing even Claudius in fame and power, ensuring his place in history books."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla strides into Claudius\'s study, immediately taking command of the situation. She directs Nero’s search with precise instructions, her movements efficient and purposeful as she systematically examines the study. Her focus is laser-sharp as she navigates the cluttered space, intent on locating Claudius\'s will. She maintains a veneer of controlled composure, her outward elegance contrasting with the ruthless determination driving her actions.',
        ap.emotional_state = 'Agrippinilla is outwardly composed, masking a potent blend of triumph and relentless ambition. Her surface emotions are controlled and focused, presenting an image of a woman in charge and on a mission. Internally, she is experiencing the heady rush of victory, knowing her machinations have placed Nero on the throne. However, beneath the surface, there is a simmering impatience and strategic urgency, driven by the need to secure the will and solidify her grip on power. Her sharp correction of Nero\'s childishness reveals a tension between her ambition and the unpredictable nature of her son.',
        ap.emotional_tags = ["agrippinilla is outwardly composed, masking a potent blend of triumph", "relentless ambition. her surface emotions are controlled", "focused, presenting an image of a woman in charge", "on a mission. internally, she is experiencing the heady rush of victory, knowing her machinations have placed nero on the throne. however, beneath the surface, there is a simmering impatience", "strategic urgency, driven by the need to secure the will", "solidify her grip on power. her sharp correction of nero's childishness reveals a tension between her ambition", "the unpredictable nature of her son.", "agrippinilla is outwardly composed", "masking a potent blend of triumph and relentless ambition. her surface emotions are controlled and focused", "presenting an image of a woman in charge and on a mission. internally", "she is experiencing the heady rush of victory", "knowing her machinations have placed nero on the throne. however", "beneath the surface", "there is a simmering impatience and strategic urgency", "driven by the need to secure the will and solidify her grip on power. her sharp correction of nero's childishness reveals a tension between her ambition and the unpredictable nature of her son."],
        ap.active_plans = ["Confirm Claudius's death to Nero and reinforce Nero's new status as Emperor.", "Locate Claudius's will to understand its contents and control the succession narrative.", "Delay the public announcement of Claudius's death to buy time for strategic maneuvering."],
        ap.beliefs = ["Power is not inherited, but seized and maintained through strategic and decisive action.", "Nero's reign is the culmination of her life's ambition, justifying any necessary measures.", "Control over information and narrative is crucial for securing and wielding power effectively."],
        ap.goals = ["Short-term: Secure Claudius's will and establish immediate control over the imperial transition.", "Medium-term: Consolidate Nero's power and her own influence as Empress Mother, ensuring a stable and compliant regime.", "Ultimate: Establish a lasting dynasty under Nero's rule, securing her own enduring legacy as the architect of their imperial destiny and a pivotal figure in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Claudius, though deceased in the adjacent bedchamber, is present in the scene through his lingering influence on the study itself, a space cluttered with his scrolls and histories. His physical absence is palpable, yet his voice echoes through the scene via his writings, a ghostly presence in the very room that defined his intellectual life. His disembodied voice, through voice-over, intrudes on the scene, a spectral reminder of the man now gone.',
        ap.emotional_state = 'Though deceased, Claudius\'s lingering emotional state is conveyed through his posthumous voice-over, revealing a deep weariness and resignation towards his life\'s work. The phrase \"Write no more, Claudius\" suggests a sense of release from the burden of chronicling his dynasty and the endless turmoil of Roman rule. Internally, he seems to have found a somber peace in death, accepting the futility of his efforts and the cyclical nature of Roman history. There\'s a quiet acceptance of his own mortality and the end of his reign, a finality underscored by his silence.',
        ap.emotional_tags = ["though deceased, claudius's lingering emotional state is conveyed through his posthumous voice-over, revealing a deep weariness", "resignation towards his life's work. the phrase \"write no more, claudius\" suggests a sense of release from the burden of chronicling his dynasty", "the endless turmoil of roman rule. internally, he seems to have found a somber peace in death, accepting the futility of his efforts", "the cyclical nature of roman history. there's a quiet acceptance of his own mortality", "the end of his reign, a finality underscored by his silence.", "though deceased", "claudius's lingering emotional state is conveyed through his posthumous voice-over", "revealing a deep weariness and resignation towards his life's work. the phrase \"write no more", "claudius\" suggests a sense of release from the burden of chronicling his dynasty and the endless turmoil of roman rule. internally", "he seems to have found a somber peace in death", "accepting the futility of his efforts and the cyclical nature of roman history. there's a quiet acceptance of his own mortality and the end of his reign", "a finality underscored by his silence."],
        ap.active_plans = ["(Prior to death) To document the history of his family, including its darker aspects.", "(Inferred) To leave a will that reflects his complex and perhaps contradictory intentions for the succession.", "(Posthumously) To have his voice and perspective, as chronicled in his histories, endure beyond his physical existence."],
        ap.beliefs = ["History and the act of recording it are inherently valuable, even if personally burdensome.", "The truth of the Julio-Claudian dynasty, with all its flaws, must be preserved for posterity.", "Death offers a release from the relentless demands and betrayals of imperial life."],
        ap.goals = ["Short-term: (Posthumous) For his written history to be discovered and read, imparting his perspective on events.", "Medium-term: (Posthumous) For his will to be found and enacted, though his true desires for the succession remain ambiguous and potentially undermined by Agrippinilla.", "Ultimate: (Posthumous) To leave behind a lasting intellectual legacy through his histories, ensuring that his understanding of Rome and his family survives, even if his political ambitions are thwarted and his reign ends in death and uncertainty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits regally on his throne, physically embodying the weight of his title. His posture is slumped, betraying the exhaustion of a ruler who feels the burdens of his position heavily. He gazes into the distance, seemingly lost in contemplation, his hands resting lightly on the armrests, conveying both authority and weariness.',
        ap.emotional_state = 'Outwardly, Claudius appears resigned, his voice steady but tinged with a hint of frustration as he reflects on his past decisions. Internally, he wrestles with feelings of inadequacy, grappling with the realization that his benevolence may have led to the very chaos he now seeks to address. This conflict reveals a deeper tension as he struggles between his identity as \'Old King Log\' and the potential need for ruthless governance.',
        ap.emotional_tags = ["outwardly, claudius appears resigned, his voice steady but tinged with a hint of frustration as he reflects on his past decisions. internally, he wrestles with feelings of inadequacy, grappling with the realization that his benevolence may have led to the very chaos he now seeks to address. this conflict reveals a deeper tension as he struggles between his identity as 'old king log'", "the potential need for ruthless governance.", "outwardly", "claudius appears resigned", "his voice steady but tinged with a hint of frustration as he reflects on his past decisions. internally", "he wrestles with feelings of inadequacy", "grappling with the realization that his benevolence may have led to the very chaos he now seeks to address. this conflict reveals a deeper tension as he struggles between his identity as 'old king log' and the potential need for ruthless governance.", "outwardly, claudius appears resigned, his voice steady", "tinged with a hint of frustration as he reflects on his past decisions. internally, he wrestles with feelings of inadequacy, grappling with the realization that his benevolence may have led to the very chaos he now seeks to address. this conflict reveals a deeper tension as he struggles between his identity as 'old king log' and the potential need for ruthless governance."],
        ap.active_plans = ["To recognize the consequences of his past kindness and reassess his approach to leadership.", "To accept the need for more direct and possibly violent measures to restore order in Rome.", "To convey a new resolve that signals a shift in his rule, potentially preparing to act against those who threaten his authority."],
        ap.beliefs = ["That his previous benevolence was a flaw that allowed disarray to flourish.", "That violent remedies may be necessary to combat the deep-seated corruption within Rome.", "That his role as Emperor requires a balance between mercy and strength to maintain control."],
        ap.goals = ["Short-term: To inspire confidence among his advisors about his capability to govern effectively.", "Medium-term: To implement strategies that tighten his grip on power and restore order in the empire.", "Ultimate: To leave a legacy as a strong ruler who navigated Rome through chaos, rather than a ruler remembered for his leniency."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands beside Claudius in the opulent reception hall, actively engaged in a strategic discussion with Narcissus. He initiates the conversation about Claudius\'s remarriage, subtly dismissing a departing woman to steer the topic towards his own preferred candidate. Pallas is postured to advise and persuade, using calculated gestures and assertive language to promote his agenda.',
        ap.emotional_state = 'Pallas outwardly presents a facade of pragmatic concern for Claudius and the stability of Rome, emphasizing the necessity of an empress. However, beneath this veneer of advisorly duty lies a core of cold ambition. He believes Agrippinilla\'s intelligence and lineage make her the ideal choice, aligning with his own power aspirations. His indignation at Narcissus\'s criticisms of Agrippinilla is performative, a calculated show to solidify his stance and silence dissent.',
        ap.emotional_tags = ["pallas outwardly presents a facade of pragmatic concern for claudius", "the stability of rome, emphasizing the necessity of an empress. however, beneath this veneer of advisorly duty lies a core of cold ambition. he believes agrippinilla's intelligence", "lineage make her the ideal choice, aligning with his own power aspirations. his indignation at narcissus's criticisms of agrippinilla is performative, a calculated show to solidify his stance", "silence dissent.", "pallas outwardly presents a facade of pragmatic concern for claudius and the stability of rome", "emphasizing the necessity of an empress. however", "beneath this veneer of advisorly duty lies a core of cold ambition. he believes agrippinilla's intelligence and lineage make her the ideal choice", "aligning with his own power aspirations. his indignation at narcissus's criticisms of agrippinilla is performative", "a calculated show to solidify his stance and silence dissent."],
        ap.active_plans = ["To convince Claudius of the urgent need to remarry.", "To strategically position Agrippinilla as the most advantageous and suitable wife for Claudius.", "To undermine and dismiss Narcissus's counter-proposal of Lollia Paulina by highlighting her perceived inadequacies and lack of strategic value."],
        ap.beliefs = ["The Roman Empire requires a strong Empress to ensure stability and project power.", "Agrippinilla's intelligence and noble lineage from Germanicus make her exceptionally qualified for imperial marriage.", "Political pragmatism and strategic alliances are more critical than rigid adherence to traditional moral or familial norms in matters of state."],
        ap.goals = ["short-term\": \"To secure Claudius's agreement to seriously consider Agrippinilla as his next wife.", "medium-term\": \"To orchestrate and finalize the marriage between Claudius and Agrippinilla, overcoming any objections or obstacles.", "ultimate\": \"To consolidate his own influence and elevate his position within the Roman court by aligning himself with Agrippinilla, anticipating increased power through her imperial status."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus is present in the Imperial Palace Reception Hall, flanking Claudius alongside Pallas, listening attentively to the Emperor\'s pronouncements before engaging in the discussion about Claudius remarrying. He initially concurs with Pallas on the need for Claudius to remarry but quickly diverges by recommending Lollia Paulina. Narcissus actively argues against Pallas\'s suggestion of Agrippinilla, using strong warnings and moral objections.',
        ap.emotional_state = 'Narcissus displays a palpable sense of loyalty and genuine concern for Claudius\'s well-being, tinged with anxiety about the potential dangers of remarriage, particularly to Agrippinilla. Outwardly, he maintains a respectful demeanor while expressing his dissenting opinions with reasoned arguments. Internally, Narcissus is driven by a deep-seated loyalty to Claudius and a strong distrust of Agrippinilla, whom he perceives as a corrupt and ambitious threat. He fears a repeat of the Messalina tragedy, amplified by Agrippinilla\'s sharp intellect.',
        ap.emotional_tags = ["narcissus displays a palpable sense of loyalty", "genuine concern for claudius's well-being, tinged with anxiety about the potential dangers of remarriage, particularly to agrippinilla. outwardly, he maintains a respectful demeanor while expressing his dissenting opinions with reasoned arguments. internally, narcissus is driven by a deep-seated loyalty to claudius", "a strong distrust of agrippinilla, whom he perceives as a corrupt", "ambitious threat. he fears a repeat of the messalina tragedy, amplified by agrippinilla's sharp intellect.", "narcissus displays a palpable sense of loyalty and genuine concern for claudius's well-being", "tinged with anxiety about the potential dangers of remarriage", "particularly to agrippinilla. outwardly", "he maintains a respectful demeanor while expressing his dissenting opinions with reasoned arguments. internally", "narcissus is driven by a deep-seated loyalty to claudius and a strong distrust of agrippinilla", "whom he perceives as a corrupt and ambitious threat. he fears a repeat of the messalina tragedy", "amplified by agrippinilla's sharp intellect.", "narcissus displays a palpable sense of loyalty and genuine concern for claudius's well-being, tinged with anxiety about the potential dangers of remarriage, particularly to agrippinilla. outwardly, he maintains a respectful demeanor", "expressing his dissenting opinions with reasoned arguments. internally, narcissus is driven by a deep-seated loyalty to claudius and a strong distrust of agrippinilla, whom he perceives as a corrupt and ambitious threat. he fears a repeat of the messalina tragedy, amplified by agrippinilla's sharp intellect."],
        ap.active_plans = ["To dissuade Claudius from considering Agrippinilla as a potential wife, emphasizing the dangers and negative consequences of such a union.", "To promote Lollia Paulina as a safer and more suitable alternative, highlighting her perceived harmlessness and lack of political ambition.", "To directly appeal to Claudius's judgment and warn him about the potential for ruin and destruction that Agrippinilla and her son, Nero, represent for Rome."],
        ap.beliefs = ["Claudius requires a wife for the sake of his children and the stability of Rome, but the choice must be prudent and not driven by political expediency.", "Agrippinilla is a morally corrupt and dangerously ambitious woman whose influence would be detrimental to Claudius and the Empire.", "Incestuous unions are inherently wrong and will incur divine wrath, bringing misfortune and chaos upon Rome, mirroring his deep-seated traditional Roman values."],
        ap.goals = ["short-term\": \"To immediately halt any consideration of Agrippinilla as a marriage candidate in Claudius's mind.", "medium-term\": \"To steer Claudius towards a more benign and less politically dangerous marriage option, such as Lollia Paulina, ensuring a peaceful domestic life for the Emperor.", "ultimate\": \"To protect Claudius and Rome from the perceived threat posed by Agrippinilla's ambition and potential for treachery, safeguarding the Emperor's reign and the future stability of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Pallas stands with a confident posture, gesturing subtly as he advocates for Agrippinilla\'s candidacy as Claudius\'s wife. He maintains an air of authority, addressing Claudius with a pointed focus, and attempting to steer the conversation toward his proposal with calculated eloquence.',
        ap.emotional_state = 'Pallas exudes a blend of confidence and determination, masking a hint of anxiety as he challenges Narcissus\'s objections. His surface demeanor is calm and persuasive, yet internally, he grapples with the stakes of his proposal, fully aware of the potential backlash it could invite.',
        ap.emotional_tags = ["pallas exudes a blend of confidence", "determination, masking a hint of anxiety as he challenges narcissus's objections. his surface demeanor is calm", "persuasive, yet internally, he grapples with the stakes of his proposal, fully aware of the potential backlash it could invite.", "pallas exudes a blend of confidence and determination", "masking a hint of anxiety as he challenges narcissus's objections. his surface demeanor is calm and persuasive", "yet internally", "he grapples with the stakes of his proposal", "fully aware of the potential backlash it could invite."],
        ap.active_plans = ["To persuade Claudius to consider Agrippinilla as a marriage candidate.", "To diminish Narcissus's influence and objections regarding Agrippinilla's character.", "To secure a powerful alliance that would stabilize Claudius's reign and strengthen his own position."],
        ap.beliefs = ["A strong marriage is crucial for the stability of the empire and the emperor\u2019s legacy.", "Agrippinilla possesses the intelligence and lineage necessary to serve as a formidable Empress.", "Political alliances through marriage can effectively consolidate power and mitigate threats."],
        ap.goals = ["Short-term: To convince Claudius to consider Agrippinilla for marriage.", "Medium-term: To solidify his influence over Claudius and the imperial court.", "Ultimate: To ensure a stable and powerful ruling lineage that secures Rome's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands with a posture that reflects unease, glancing between Pallas and Claudius as he counters Pallas\'s proposal. His body language conveys tension, and he shifts slightly as he expresses doubts about Agrippinilla, highlighting his protective instincts for Claudius.',
        ap.emotional_state = 'Narcissus feels a mix of concern and urgency, striving to protect Claudius from potential ruin. Outwardly, he maintains a calm demeanor, but internally, he is anxious about the implications of Pallas\'s suggestion, fearing it could lead to catastrophe for the Emperor and Rome.',
        ap.emotional_tags = ["narcissus feels a mix of concern", "urgency, striving to protect claudius from potential ruin. outwardly, he maintains a calm demeanor, but internally, he is anxious about the implications of pallas's suggestion, fearing it could lead to catastrophe for the emperor", "rome.", "narcissus feels a mix of concern and urgency", "striving to protect claudius from potential ruin. outwardly", "he maintains a calm demeanor", "but internally", "he is anxious about the implications of pallas's suggestion", "fearing it could lead to catastrophe for the emperor and rome.", "narcissus feels a mix of concern and urgency, striving to protect claudius from potential ruin. outwardly, he maintains a calm demeanor,", "internally, he is anxious about the implications of pallas's suggestion, fearing it could lead to catastrophe for the emperor and rome."],
        ap.active_plans = ["To dissuade Claudius from marrying Agrippinilla, based on her character and background.", "To highlight the risks of incestuous unions and their potential consequences for Rome.", "To maintain his loyal role as a guardian of Claudius's legacy and well-being."],
        ap.beliefs = ["Incestuous unions are morally and politically dangerous, threatening stability.", "A wise emperor should seek a marriage that strengthens alliances rather than complicates them.", "Honesty in counsel is paramount, especially regarding sensitive matters of power and legacy."],
        ap.goals = ["Short-term: To convince Claudius to reject Pallas's proposal for Agrippinilla.", "Medium-term: To protect Claudius from decisions that could lead to personal or political disaster.", "Ultimate: To ensure the stability and integrity of the imperial lineage and Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits on his throne, appearing somewhat detached, his posture slumped as he stares ahead with a vacant expression. His mind seems to drift, caught in contemplation as he repeats phrases about \'poisons\' and \'hatching out,\' indicating an inner conflict and deep contemplation of his role and decisions.',
        ap.emotional_state = 'Claudius exhibits a surface calm, but beneath lies a complex whirl of introspection and resignation. He grapples with his identity as \'Old King Log,\' echoing a sense of futility and the burdens of past decisions, feeling the tension of impending choices regarding his future and the empire.',
        ap.emotional_tags = ["claudius exhibits a surface calm, but beneath lies a complex whirl of introspection", "resignation. he grapples with his identity as 'old king log,' echoing a sense of futility", "the burdens of past decisions, feeling the tension of impending choices regarding his future", "the empire.", "claudius exhibits a surface calm", "but beneath lies a complex whirl of introspection and resignation. he grapples with his identity as 'old king log", "' echoing a sense of futility and the burdens of past decisions", "feeling the tension of impending choices regarding his future and the empire.", "claudius exhibits a surface calm,", "beneath lies a complex whirl of introspection and resignation. he grapples with his identity as 'old king log,' echoing a sense of futility and the burdens of past decisions, feeling the tension of impending choices regarding his future and the empire."],
        ap.active_plans = ["To weigh the merits of the marriage proposal amid the political turmoil.", "To confront his own limitations and the implications of his rule.", "To assert his authority in the face of conflicting advice from his advisors."],
        ap.beliefs = ["The need for decisive action in times of unrest is paramount.", "A marriage may strengthen his position but must be carefully considered.", "His role as Emperor bears both the weight of history and the potential for future legacy."],
        ap.goals = ["Short-term: To evaluate potential marriage candidates that could stabilize his reign.", "Medium-term: To assert control over the political landscape and reinvigorate his leadership.", "Ultimate: To leave a legacy that transcends his perceived weaknesses and solidifies Rome's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands in the opulent reception hall of the Imperial Palace, directly confronting Pallas and appealing to Emperor Claudius. He is in the midst of a vehement outburst, gesticulating emphatically as he passionately argues against the proposed marriage between Claudius and Agrippinilla. His body language conveys urgency and deep concern as he attempts to dissuade the Emperor from what he perceives as a catastrophic decision.',
        ap.emotional_state = 'Narcissus is consumed by righteous outrage and deep-seated fear. Outwardly, this manifests as scorn and vehement disagreement, his voice rising in protest against Pallas\'s suggestion and his words dripping with disdain for Agrippinilla. Beneath this surface anger lies a profound anxiety for the future of Rome and a genuine loyalty to Claudius. He is torn between his duty to advise the Emperor and his horror at the Emperor\'s seeming inclination to ignore his warnings, creating a palpable tension between his outward defiance and internal dread.',
        ap.emotional_tags = ["narcissus is consumed by righteous outrage", "deep-seated fear. outwardly, this manifests as scorn", "vehement disagreement, his voice rising in protest against pallas's suggestion", "his words dripping with disdain for agrippinilla. beneath this surface anger lies a profound anxiety for the future of rome", "a genuine loyalty to claudius. he is torn between his duty to advise the emperor", "his horror at the emperor's seeming inclination to ignore his warnings, creating a palpable tension between his outward defiance", "internal dread.", "narcissus is consumed by righteous outrage and deep-seated fear. outwardly", "this manifests as scorn and vehement disagreement", "his voice rising in protest against pallas's suggestion and his words dripping with disdain for agrippinilla. beneath this surface anger lies a profound anxiety for the future of rome and a genuine loyalty to claudius. he is torn between his duty to advise the emperor and his horror at the emperor's seeming inclination to ignore his warnings", "creating a palpable tension between his outward defiance and internal dread."],
        ap.active_plans = ["To vociferously denounce the idea of Claudius marrying Agrippinilla, highlighting the incestuous nature of the union.", "To persuade Claudius by painting a dire picture of the consequences, predicting ruin and destruction for Rome.", "To discredit Agrippinilla's character, emphasizing her perceived corruption and dangerous ambition, contrasting her unfavorably with other potential wives like Lollia Paulina (implicitly)."],
        ap.beliefs = ["Marrying one's niece is morally repugnant and an abomination in the eyes of the gods, inevitably leading to divine punishment.", "Agrippinilla is a manipulative and corrupt woman whose ambition poses a grave threat to Claudius and the stability of Rome.", "It is his duty to speak truth to power, even when it is unpopular, and to protect Claudius from making decisions that will harm himself and the empire."],
        ap.goals = ["Short-term Goal: To immediately dissuade Claudius from agreeing to marry Agrippinilla during this discussion in the reception hall.", "Medium-term Goal: To steer Claudius towards considering other, more virtuous and less dangerous marriage options, ensuring the selection of a suitable Empress.", "Ultimate Goal: To safeguard Rome from moral and political ruin, preserving the Julio-Claudian dynasty and ensuring a stable and righteous reign for the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Claudius sits prominently on his throne, his posture slightly slumped yet regal, eyes focused with an unsettling clarity as he contemplates the dire realities of his reign. His hands rest on the armrests, fingers tapping rhythmically, betraying a mix of anxiety and resolve. Despite his physical frailty, he projects an aura of determined authority as he articulates his decision to marry Agrippinilla.',
        ap.emotional_state = 'Amidst the pressing weight of despair and isolation, Claudius\'s surface reflects a veneer of calm, yet beneath lies a tempest of anxiety regarding his legacy and the machinations of those around him. His declarations reveal a chilling acceptance of the darker path ahead, suggesting conflicted feelings of desperation and a burgeoning will to embrace the chaos of power as he grapples with the implications of his choice.',
        ap.emotional_tags = ["amidst the pressing weight of despair", "isolation, claudius's surface reflects a veneer of calm, yet beneath lies a tempest of anxiety regarding his legacy", "the machinations of those around him. his declarations reveal a chilling acceptance of the darker path ahead, suggesting conflicted feelings of desperation", "a burgeoning will to embrace the chaos of power as he grapples with the implications of his choice.", "amidst the pressing weight of despair and isolation", "claudius's surface reflects a veneer of calm", "yet beneath lies a tempest of anxiety regarding his legacy and the machinations of those around him. his declarations reveal a chilling acceptance of the darker path ahead", "suggesting conflicted feelings of desperation and a burgeoning will to embrace the chaos of power as he grapples with the implications of his choice."],
        ap.active_plans = ["To assert his authority by making a significant and controversial decision regarding his marriage.", "To confront the inner and outer challenges posed by his advisors regarding his choices, showing his resolve despite their protests.", "To prepare for the potential fallout from marrying Agrippinilla, acknowledging the dangers that loom over his reign."],
        ap.beliefs = ["He believes that true strength may require embracing violence and tyranny to rectify past benevolence.", "Claudius holds a conviction that confronting the poisons in his court may reveal hidden truths and ultimately strengthen his rule.", "There is a deep-seated belief that his legacy must include a firm hand in the face of betrayal, even at personal cost."],
        ap.goals = ["Short-term: To solidify his power by marrying Agrippinilla, thus reinforcing his familial ties and claim to authority.", "Medium-term: To navigate the political fallout of this choice, asserting control over dissenting voices within his court.", "Ultimate: To create a legacy that balances the complexities of leadership with the harsh realities of Roman politics, ensuring a lasting impact on the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Pallas bursts into Agrippinilla\'s lavish chambers, his breath ragged and chest heaving, a messenger freshly arrived from the Emperor\'s presence. He stands before her, still catching his breath, the bearer of momentous news, eager to deliver the outcome of his delicate mission to Claudius. His posture is a mix of triumph and lingering nervousness, aware of the volatile nature of the woman before him and the implications of the agreement he now confirms.',
        ap.emotional_state = 'Pallas is a whirlwind of conflicting emotions. Relief washes over him at the unexpected ease of Claudius\'s consent, a surprise that borders on disbelief. Yet, a shadow of regret darkens his triumph, a nascent unease at the prospect of Agrippinilla becoming Empress, and more intimately, Claudius\'s wife. Lust and possessiveness flicker within him as he gazes upon Agrippinilla, a selfish desire momentarily overshadowing his ambition-driven machinations. He is a man caught between political expediency and personal longing, a dangerous and unstable combination.',
        ap.emotional_tags = ["pallas is a whirlwind of conflicting emotions. relief washes over him at the unexpected ease of claudius's consent, a surprise that borders on disbelief. yet, a shadow of regret darkens his triumph, a nascent unease at the prospect of agrippinilla becoming empress,", "more intimately, claudius's wife. lust", "possessiveness flicker within him as he gazes upon agrippinilla, a selfish desire momentarily overshadowing his ambition-driven machinations. he is a man caught between political expediency", "personal longing, a dangerous", "unstable combination.", "pallas is a whirlwind of conflicting emotions. relief washes over him at the unexpected ease of claudius's consent", "a surprise that borders on disbelief. yet", "a shadow of regret darkens his triumph", "a nascent unease at the prospect of agrippinilla becoming empress", "and more intimately", "claudius's wife. lust and possessiveness flicker within him as he gazes upon agrippinilla", "a selfish desire momentarily overshadowing his ambition-driven machinations. he is a man caught between political expediency and personal longing", "a dangerous and unstable combination."],
        ap.active_plans = ["Deliver the news of Claudius's agreement to Agrippinilla, ensuring she understands the swiftness and completeness of her victory.", "Gauge Agrippinilla's reaction to the news, observing her for signs of doubt or hesitation.", "Attempt to leverage his role in securing the agreement for personal intimacy, hoping to capitalize on the moment of shared triumph and Agrippinilla's apparent vulnerability.", "Subtly undermine Narcissus's opposition, dismissing it as irrelevant and driven by spite, reinforcing Agrippinilla's confidence and his own strategic importance."],
        ap.beliefs = ["He believes Claudius's agreement to the marriage is a pivotal moment, solidifying Agrippinilla's ascent and their shared ambitions.", "He believes Narcissus's dissent is insignificant, a mere whimper against the tide of Agrippinilla's ambition and Claudius's whim.", "He believes his own passion for Agrippinilla, though secondary to ambition, can still be indulged and perhaps even rewarded in this moment of victory.", "He believes Agrippinilla values his counsel and influence, making him a key player in her ascent to power, deserving of both political and personal favors."],
        ap.goals = ["Short-term: To successfully convey the news and gauge Agrippinilla's immediate reaction, ensuring a smooth transition into the next phase of their plan.", "Medium-term: To solidify his position as Agrippinilla's confidante and advisor, leveraging her newfound power for his own advancement and influence within the Roman court.", "Ultimate: To bask in the reflected glory of Agrippinilla's reign, securing a position of power and privilege within the newly configured imperial structure, potentially even realizing his romantic desires, however misguided."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla is the picture of poised anticipation in her private apartments, a queen awaiting news of her latest conquest. She stands elegantly amidst the opulent surroundings, her senses sharpened, listening intently as Pallas delivers his breathless report. Her body language exudes confidence, yet her sharp, probing questions betray a mind still racing, ensuring every detail of her triumph is confirmed and understood. She is the spider at the center of her web, calmly awaiting the fly.',
        ap.emotional_state = 'A flicker of surprise dances in Agrippinilla\'s eyes, quickly replaced by a coolly triumphant satisfaction. The ease of Claudius\'s capitulation is almost unsettling, a victory so swift it borders on the unbelievable. Beneath the surface of her controlled demeanor, a current of ambition hums with renewed intensity. She is amused by Narcissus\'s predictable opposition, dismissing it with contemptuous ease. Yet, a subtle calculation underlies her triumph; she questions Claudius\'s motives, a hint of suspicion tempering her victory, recognizing the emperor may be less of a fool than he appears. Her emotions are a carefully orchestrated blend of triumph, vigilance, and calculating ambition.',
        ap.emotional_tags = ["a flicker of surprise dances in agrippinilla's eyes, quickly replaced by a coolly triumphant satisfaction. the ease of claudius's capitulation is almost unsettling, a victory so swift it borders on the unbelievable. beneath the surface of her controlled demeanor, a current of ambition hums with renewed intensity. she is amused by narcissus's predictable opposition, dismissing it with contemptuous ease. yet, a subtle calculation underlies her triumph; she questions claudius's motives, a hint of suspicion tempering her victory, recognizing the emperor may be less of a fool than he appears. her emotions are a carefully orchestrated blend of triumph, vigilance,", "calculating ambition.", "a flicker of surprise dances in agrippinilla's eyes", "quickly replaced by a coolly triumphant satisfaction. the ease of claudius's capitulation is almost unsettling", "a victory so swift it borders on the unbelievable. beneath the surface of her controlled demeanor", "a current of ambition hums with renewed intensity. she is amused by narcissus's predictable opposition", "dismissing it with contemptuous ease. yet", "a subtle calculation underlies her triumph; she questions claudius's motives", "a hint of suspicion tempering her victory", "recognizing the emperor may be less of a fool than he appears. her emotions are a carefully orchestrated blend of triumph", "vigilance", "and calculating ambition.", "a flicker of surprise dances in agrippinilla's eyes, quickly replaced by a coolly triumphant satisfaction. the ease of claudius's capitulation is almost unsettling, a victory so swift it borders on the unbelievable. beneath the surface of her controlled demeanor, a current of ambition hums with renewed intensity. she is amused by narcissus's predictable opposition, dismissing it with contemptuous ease. yet, a subtle calculation underlies her triumph", "she questions claudius's motives, a hint of suspicion tempering her victory, recognizing the emperor may be less of a fool than he appears. her emotions are a carefully orchestrated blend of triumph, vigilance, and calculating ambition."],
        ap.active_plans = ["Receive and meticulously scrutinize Pallas's report, demanding precise details of Claudius's words and demeanor to fully grasp the situation.", "Assess the implications of Claudius's easy agreement, considering whether it signals genuine acquiescence or a hidden strategy.", "Dismiss and belittle Narcissus's opposition, reinforcing her own sense of invincibility and undermining any potential threat he might pose.", "Manipulate Pallas's desires and regrets, offering just enough encouragement to maintain his loyalty while ensuring he remains firmly under her control.", "Prepare herself mentally and strategically for her imminent meeting with Claudius, anticipating the next phase of her intricate power play, ready to solidify her victory and further her ambitions."],
        ap.beliefs = ["She believes that securing marriage to Claudius is an essential step in her grand plan to consolidate power and ensure Nero's succession.", "She believes she can outmaneuver and control both Claudius and Narcissus, viewing them as predictable and ultimately inferior intellects.", "She believes her ambition is justified and righteous, a driving force that will reshape Rome to her will and benefit her dynasty.", "She believes in the power of calculated charm and strategic manipulation, confident in her ability to sway even the most resistant individuals to her cause."],
        ap.goals = ["Short-term: To fully absorb and analyze the news of Claudius's agreement, ensuring no hidden caveats or potential pitfalls exist in her apparent victory.", "Medium-term: To successfully navigate her impending meeting with Claudius, solidifying the marriage agreement and further cementing her influence over the Emperor.", "Ultimate: To become Empress of Rome, wielding significant power alongside Claudius, ultimately paving the way for Nero's ascension and the establishment of her enduring legacy, erasing any trace of Claudius's influence and name from the annals of history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands poised, exuding confidence as she engages in a strategic conversation with Pallas. Her posture is upright, and her movements are deliberate, reflecting her calculated nature. She leans slightly forward, an eager predator sensing the sweet taste of victory.',
        ap.emotional_state = 'On the surface, Agrippinilla radiates triumph and anticipation, her eyes glinting with ambition. Internally, she grapples with a simmering menace, aware of potential threats but momentarily buoyed by Claudius\'s compliance, her confidence masking a deeper paranoia about her rivals.',
        ap.emotional_tags = ["on the surface, agrippinilla radiates triumph", "anticipation, her eyes glinting with ambition. internally, she grapples with a simmering menace, aware of potential threats but momentarily buoyed by claudius's compliance, her confidence masking a deeper paranoia about her rivals.", "on the surface", "agrippinilla radiates triumph and anticipation", "her eyes glinting with ambition. internally", "she grapples with a simmering menace", "aware of potential threats but momentarily buoyed by claudius's compliance", "her confidence masking a deeper paranoia about her rivals.", "on the surface, agrippinilla radiates triumph and anticipation, her eyes glinting with ambition. internally, she grapples with a simmering menace, aware of potential threats", "momentarily buoyed by claudius's compliance, her confidence masking a deeper paranoia about her rivals."],
        ap.active_plans = ["Confirm Claudius's agreement to the marriage as a stepping stone to greater power.", "Neutralize Narcissus, ensuring no obstacles remain in her path.", "Consolidate her control over Claudius and his legacy."],
        ap.beliefs = ["Power must be seized and held, regardless of familial ties.", "Ambition justifies any means in the ruthless game of politics.", "Claudius's compliance indicates his eagerness to align with her ambitions."],
        ap.goals = ["Short-term: Secure Claudius's immediate agreement to their marriage.", "Medium-term: Eliminate opposition, particularly from Narcissus.", "Ultimate: Establish a stable and unchallenged dominion through her son, Nero."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Pallas enters Agrippinilla\'s luxurious chambers, breathless yet animated, his demeanor underscoring the gravity of their schemes. He stands slightly hunched, a physical manifestation of the tension that accompanies their conspiratorial discussions, his gestures punctuating the unfolding narrative.',
        ap.emotional_state = 'Pallas masks his apprehension with an air of triumph, though beneath the surface, a sense of regret and unease festers. He struggles with conflicting feelings about Agrippinilla’s ambitions and the potential consequences of their actions, feeling an uncomfortable tension between loyalty and moral conflict.',
        ap.emotional_tags = ["pallas masks his apprehension with an air of triumph, though beneath the surface, a sense of regret", "unease festers. he struggles with conflicting feelings about agrippinilla\u2019s ambitions", "the potential consequences of their actions, feeling an uncomfortable tension between loyalty", "moral conflict.", "pallas masks his apprehension with an air of triumph", "though beneath the surface", "a sense of regret and unease festers. he struggles with conflicting feelings about agrippinilla\u2019s ambitions and the potential consequences of their actions", "feeling an uncomfortable tension between loyalty and moral conflict."],
        ap.active_plans = ["Encourage Agrippinilla's ambitions by confirming Claudius's agreement.", "Downplay Narcissus's objection to create a sense of security.", "Navigate the implications of Agrippinilla's marriage to Claudius."],
        ap.beliefs = ["Ambition often trumps morality in the game of power.", "Loyalty can be a double-edged sword when navigating treacherous waters.", "A successful alliance with Agrippinilla is necessary for his own standing."],
        ap.goals = ["Short-term: Support Agrippinilla's plans for marriage.", "Medium-term: Maintain his influence and protect his interests within the court.", "Ultimate: Ensure his survival and relevance in the shifting tides of imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Though not present in the scene, Narcissus\'s influence looms large, his dissent echoing through Agrippinilla\'s thoughts. He stands as a silent adversary in the backdrop, his caution and loyalty to Claudius serving as a counterpoint to Agrippinilla\'s ambitious machinations.',
        ap.emotional_state = 'Narcissus, although absent, is filled with quiet resolve and concern, aware that his voice carries weight even in silence. His internal conflict is palpable—torn between loyalty to Claudius and the need to avert disaster for Rome, he embodies the tension of a looming threat to Agrippinilla’s plans.',
        ap.emotional_tags = ["narcissus, although absent, is filled with quiet resolve", "concern, aware that his voice carries weight even in silence. his internal conflict is palpable\u2014torn between loyalty to claudius", "the need to avert disaster for rome, he embodies the tension of a looming threat to agrippinilla\u2019s plans.", "narcissus", "although absent", "is filled with quiet resolve and concern", "aware that his voice carries weight even in silence. his internal conflict is palpable\u2014torn between loyalty to claudius and the need to avert disaster for rome", "he embodies the tension of a looming threat to agrippinilla\u2019s plans."],
        ap.active_plans = ["Advocate for Claudius's cautious approach to marriage and power.", "Seek to warn Claudius of Agrippinilla's true intentions.", "Gather allies within the court to counter Agrippinilla's influence."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, even against familial ties.", "The dangers of ambition can lead to ruin for both individuals and the empire.", "Integrity in counsel is necessary, regardless of personal cost."],
        ap.goals = ["Short-term: Safeguard Claudius from potential pitfalls of marrying Agrippinilla.", "Medium-term: Build a coalition of support against Agrippinilla's machinations.", "Ultimate: Preserve the legacy of Claudius and restore stability to Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Pallas bursts into Agrippinilla\'s lavish apartments, still catching his breath from his recent audience with Claudius. He stands before Agrippinilla, relaying the momentous news of Claudius\'s agreement to the marriage proposal, his posture shifting between professional messenger and a man wrestling with personal desires as the conversation progresses and his possessive feelings surface.',
        ap.emotional_state = 'Initially, Pallas exudes the satisfaction of a successful envoy, pleased to deliver the news Agrippinilla desires. However, beneath this professional veneer, a turbulent mix of emotions churns. Regret and possessiveness consume him as he contemplates Agrippinilla becoming Claudius\'s wife. Lust wars with apprehension, revealing his internal conflict between ambition and a raw, almost desperate desire for Agrippinilla, a conflict made evident by his sour dismissal of Narcissus\'s dissent.',
        ap.emotional_tags = ["initially, pallas exudes the satisfaction of a successful envoy, pleased to deliver the news agrippinilla desires. however, beneath this professional veneer, a turbulent mix of emotions churns. regret", "possessiveness consume him as he contemplates agrippinilla becoming claudius's wife. lust wars with apprehension, revealing his internal conflict between ambition", "a raw, almost desperate desire for agrippinilla, a conflict made evident by his sour dismissal of narcissus's dissent.", "initially", "pallas exudes the satisfaction of a successful envoy", "pleased to deliver the news agrippinilla desires. however", "beneath this professional veneer", "a turbulent mix of emotions churns. regret and possessiveness consume him as he contemplates agrippinilla becoming claudius's wife. lust wars with apprehension", "revealing his internal conflict between ambition and a raw", "almost desperate desire for agrippinilla", "a conflict made evident by his sour dismissal of narcissus's dissent."],
        ap.active_plans = ["To inform Agrippinilla of Claudius's affirmative response to the marriage proposal.", "To express his growing regrets and possessive feelings about Agrippinilla marrying Claudius.", "To seize a moment of intimacy with Agrippinilla, momentarily prioritizing his personal desires over their shared political ambitions."],
        ap.beliefs = ["Ambition is a driving force, but passion can momentarily eclipse even the most strategic objectives.", "Agrippinilla's marriage to Claudius is a pivotal step in their shared pursuit of power.", "His personal desires for Agrippinilla, though complex and politically intertwined, are valid and deserve to be acknowledged, even in this strategic context."],
        ap.goals = ["Short-term: To experience a brief, passionate encounter with Agrippinilla before she is bound to Claudius in marriage.", "Medium-term: To maintain his influential position as Agrippinilla's advisor, leveraging her enhanced status as Empress for his own gain.", "Ultimate: To secure a future where his relationship with Agrippinilla transcends mere political alliance, perhaps envisioning a deeper, more personal connection intertwined with their shared power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands regally in her private apartments, bathed in the soft glow of oil lamps, a picture of composed anticipation. As Pallas enters, she remains still, her gaze sharp and focused as she absorbs his news. She listens intently, her body language controlled, betraying only subtle shifts in expression as she probes for details and maintains her strategic distance even during Pallas\'s emotional outburst and plea for intimacy.',
        ap.emotional_state = 'Agrippinilla outwardly projects an air of cool triumph and calculated satisfaction upon hearing of Claudius\'s agreement. Beneath this composed surface, a steely resolve and unwavering focus on her ambitions prevail. While she acknowledges Pallas\'s possessiveness and desire, she remains emotionally detached, viewing their interaction through a strategic lens. Amusement flickers at Pallas\'s vulnerability, but her primary emotion is one of controlled anticipation, eager to move to the next phase of her plan and meet with Claudius.',
        ap.emotional_tags = ["agrippinilla outwardly projects an air of cool triumph", "calculated satisfaction upon hearing of claudius's agreement. beneath this composed surface, a steely resolve", "unwavering focus on her ambitions prevail. while she acknowledges pallas's possessiveness", "desire, she remains emotionally detached, viewing their interaction through a strategic lens. amusement flickers at pallas's vulnerability, but her primary emotion is one of controlled anticipation, eager to move to the next phase of her plan", "meet with claudius.", "agrippinilla outwardly projects an air of cool triumph and calculated satisfaction upon hearing of claudius's agreement. beneath this composed surface", "a steely resolve and unwavering focus on her ambitions prevail. while she acknowledges pallas's possessiveness and desire", "she remains emotionally detached", "viewing their interaction through a strategic lens. amusement flickers at pallas's vulnerability", "but her primary emotion is one of controlled anticipation", "eager to move to the next phase of her plan and meet with claudius.", "agrippinilla outwardly projects an air of cool triumph and calculated satisfaction upon hearing of claudius's agreement. beneath this composed surface, a steely resolve and unwavering focus on her ambitions prevail. while she acknowledges pallas's possessiveness and desire, she remains emotionally detached, viewing their interaction through a strategic lens. amusement flickers at pallas's vulnerability,", "her primary emotion is one of controlled anticipation, eager to move to the next phase of her plan and meet with claudius."],
        ap.active_plans = ["To receive and confirm Pallas's report regarding Claudius's consent to the marriage proposal.", "To assess the situation, particularly noting Narcissus's opposition, but dismissing it as insignificant.", "To manage Pallas's emotional and sexual advances efficiently, ensuring they do not distract from her overarching strategic objectives.", "To prepare herself for an immediate audience with Claudius, ready to capitalize on his agreement and advance her plans for imperial dominance."],
        ap.beliefs = ["Power is the ultimate objective, and all actions should be strategically aligned to achieve it.", "Relationships, even intimate ones, are transactional and must serve her ambition; emotional attachments are secondary to strategic gains.", "She possesses superior control over her destiny and the actions of those around her, including both Pallas and Claudius, whom she sees as manipulable pieces in her grand design."],
        ap.goals = ["Short-term: To briefly indulge Pallas's desires to maintain his loyalty and cooperation, while swiftly refocusing on the more critical objective of meeting with Claudius.", "Medium-term: To successfully marry Claudius and ascend to the position of Empress, thereby gaining significant influence and access to imperial power.", "Ultimate: To secure Nero's succession to the throne and establish an enduring dynasty under her family's control, ensuring her lasting legacy and the perpetuation of her power for generations to come."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his chambers, exuding a weary yet alert demeanor. His posture reflects both the weight of his imperial responsibilities and the vulnerability of his position. As Agrippinilla enters, he engages in conversation, responding to her inquiries with a mix of hesitation and resolve, revealing his cautious approach to her advances.',
        ap.emotional_state = 'Claudius projects a façade of calmness, but underneath lies a complex blend of exhaustion and wariness. His surface demeanor appears stoic, yet internally, he grapples with the implications of accepting Agrippinilla\'s proposal and the incestuous nature of their union. This ambivalence hints at his lingering awareness of the political stakes involved.',
        ap.emotional_tags = ["claudius projects a fa\u00e7ade of calmness, but underneath lies a complex blend of exhaustion", "wariness. his surface demeanor appears stoic, yet internally, he grapples with the implications of accepting agrippinilla's proposal", "the incestuous nature of their union. this ambivalence hints at his lingering awareness of the political stakes involved.", "claudius projects a fa\u00e7ade of calmness", "but underneath lies a complex blend of exhaustion and wariness. his surface demeanor appears stoic", "yet internally", "he grapples with the implications of accepting agrippinilla's proposal and the incestuous nature of their union. this ambivalence hints at his lingering awareness of the political stakes involved.", "claudius projects a fa\u00e7ade of calmness,", "underneath lies a complex blend of exhaustion and wariness. his surface demeanor appears stoic, yet internally, he grapples with the implications of accepting agrippinilla's proposal and the incestuous nature of their union. this ambivalence hints at his lingering awareness of the political stakes involved."],
        ap.active_plans = ["To establish a political alliance through marriage to Agrippinilla.", "To ensure stability within the empire by solidifying familial ties despite the complexities of their relationship.", "To navigate the treacherous waters of Roman politics while maintaining a semblance of control over his own fate."],
        ap.beliefs = ["Marriage is a strategic tool to bolster power and influence.", "Family bonds, however complicated, are crucial for maintaining stability in the empire.", "Intellect and political acumen are more valuable in a partner than mere affection."],
        ap.goals = ["Short-term: To confirm his intention to marry Agrippinilla and solidify family ties.", "Medium-term: To strengthen his position as Emperor through this alliance and navigate the political landscape.", "Ultimate: To leave a legacy that preserves the empire's integrity despite the chaos surrounding him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla enters the chamber with a confident demeanor, her body language radiating assurance and ambition. As she engages Claudius, she expresses delight and affection, utilizing her charm to secure her position. Her gestures are animated, emphasizing her excitement about the prospect of marriage while subtly veiling her ulterior motives.',
        ap.emotional_state = 'Agrippinilla\'s surface joy is palpable, her expression brightened by the prospect of power and influence. However, beneath this joy lies a cunning resolve—her declarations of love serve as a manipulation to mask her true ambitions. The slight falter in her smile at the mention of incest reveals a moment of vulnerability, quickly masked by her strategic recovery.',
        ap.emotional_tags = ["agrippinilla's surface joy is palpable, her expression brightened by the prospect of power", "influence. however, beneath this joy lies a cunning resolve\u2014her declarations of love serve as a manipulation to mask her true ambitions. the slight falter in her smile at the mention of incest reveals a moment of vulnerability, quickly masked by her strategic recovery.", "agrippinilla's surface joy is palpable", "her expression brightened by the prospect of power and influence. however", "beneath this joy lies a cunning resolve\u2014her declarations of love serve as a manipulation to mask her true ambitions. the slight falter in her smile at the mention of incest reveals a moment of vulnerability", "quickly masked by her strategic recovery."],
        ap.active_plans = ["To secure her marriage to Claudius as a means to increase her political power.", "To position herself as a maternal figure to Britannicus and Octavia, thus consolidating her influence over the imperial family.", "To ensure Claudius views her as a partner in governance, rather than just a consort."],
        ap.beliefs = ["Power is best secured through strategic marriages and alliances.", "Emotional expressions can be manipulated to achieve personal goals.", "Intellectual partnership is vital for dominance in the political landscape."],
        ap.goals = ["Short-term: To successfully propose marriage to Claudius and garner his favor.", "Medium-term: To leverage her position as Empress to control the succession of the throne.", "Ultimate: To establish herself as a dominant force in Roman politics, shaping the future of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Claudius remains seated, his physical weariness evident in his posture, yet his eyes are sharp and observant as he engages Agrippinilla. He maintains a calm and composed demeanor, listening intently to her responses, occasionally interjecting with probing questions, his stammer subtly present but controlled, used as a tool to disarm and observe.',
        ap.emotional_state = 'Beneath a veneer of detached amusement and feigned weariness, Claudius is deeply calculating and suspicious. He toys with Agrippinilla, testing her reaction to the incestuous nature of their proposed marriage and her past with Caligula. Internally, he is wary and resolute, determined to understand her true motivations beyond her charming facade. He masks his intellectual curiosity and strategic intent with a guise of being merely tired of ruling alone.',
        ap.emotional_tags = ["beneath a veneer of detached amusement", "feigned weariness, claudius is deeply calculating", "suspicious. he toys with agrippinilla, testing her reaction to the incestuous nature of their proposed marriage", "her past with caligula. internally, he is wary", "resolute, determined to understand her true motivations beyond her charming facade. he masks his intellectual curiosity", "strategic intent with a guise of being merely tired of ruling alone.", "beneath a veneer of detached amusement and feigned weariness", "claudius is deeply calculating and suspicious. he toys with agrippinilla", "testing her reaction to the incestuous nature of their proposed marriage and her past with caligula. internally", "he is wary and resolute", "determined to understand her true motivations beyond her charming facade. he masks his intellectual curiosity and strategic intent with a guise of being merely tired of ruling alone."],
        ap.active_plans = ["To assess Agrippinilla's character and ambition directly.", "To gauge her reaction to uncomfortable truths and insinuations.", "To subtly assert his own awareness and control in the dynamic of their relationship, despite his apparent weariness."],
        ap.beliefs = ["He believes that intelligence and strategic capability are paramount in a ruler's consort.", "He believes that appearances can be deceptive, and it is crucial to look beyond them.", "He believes in using his perceived weakness (stammer, 'foolishness') as a strategic advantage to observe others' true nature."],
        ap.goals = ["Short-term: To elicit genuine reactions from Agrippinilla to his provocative questions.", "Medium-term: To establish a power dynamic in their marriage where he is not entirely subservient to her ambition.", "Ultimate: To secure a politically advantageous marriage that will aid in ruling Rome, while remaining aware of and mitigating the potential dangers Agrippinilla poses."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla enters with an air of poised confidence, her movements graceful and assured as she approaches Claudius. She maintains direct eye contact, her smile radiant and seemingly genuine, though subtly strained when faced with Claudius\'s probing questions. She uses her physical presence to project an image of eagerness and affection, subtly leaning in and gesturing warmly as she speaks.',
        ap.emotional_state = 'On the surface, Agrippinilla exudes delight and feigned adoration, expressing overwhelming happiness at Claudius\'s proposal. However, beneath this carefully constructed facade, a flicker of unease and calculation is present. Claudius\'s incest remark momentarily unsettles her, but she swiftly recovers, masking any discomfort with practiced ease. Her internal state is dominated by ambition and strategic focus, constantly assessing Claudius\'s words and reactions to ensure the marriage proposal remains secured and her power grab proceeds smoothly.',
        ap.emotional_tags = ["on the surface, agrippinilla exudes delight", "feigned adoration, expressing overwhelming happiness at claudius's proposal. however, beneath this carefully constructed facade, a flicker of unease", "calculation is present. claudius's incest remark momentarily unsettles her, but she swiftly recovers, masking any discomfort with practiced ease. her internal state is dominated by ambition", "strategic focus, constantly assessing claudius's words", "reactions to ensure the marriage proposal remains secured", "her power grab proceeds smoothly.", "on the surface", "agrippinilla exudes delight and feigned adoration", "expressing overwhelming happiness at claudius's proposal. however", "beneath this carefully constructed facade", "a flicker of unease and calculation is present. claudius's incest remark momentarily unsettles her", "but she swiftly recovers", "masking any discomfort with practiced ease. her internal state is dominated by ambition and strategic focus", "constantly assessing claudius's words and reactions to ensure the marriage proposal remains secured and her power grab proceeds smoothly.", "on the surface, agrippinilla exudes delight and feigned adoration, expressing overwhelming happiness at claudius's proposal. however, beneath this carefully constructed facade, a flicker of unease and calculation is present. claudius's incest remark momentarily unsettles her,", "she swiftly recovers, masking any discomfort with practiced ease. her internal state is dominated by ambition and strategic focus, constantly assessing claudius's words and reactions to ensure the marriage proposal remains secured and her power grab proceeds smoothly."],
        ap.active_plans = ["To solidify Claudius's marriage proposal and secure her position as Empress.", "To deflect and rationalize any potentially damaging questions about her past actions and motivations.", "To project an image of loving devotion and capability, emphasizing her value to Claudius as a partner and advisor."],
        ap.beliefs = ["She believes that marriage to Claudius is the key to unlocking ultimate power and securing Nero's future.", "She believes in her own ability to manipulate and control situations and people to achieve her ambitions.", "She believes that any past indiscretions are justifiable in the pursuit of power and are inconsequential in the grand scheme of her dynastic goals."],
        ap.goals = ["Short-term: To fully convince Claudius of her eagerness and suitability as his wife.", "Medium-term: To leverage her position as Empress to gain political influence and control over Roman affairs.", "Ultimate: To ensure Nero's ascension to Emperor and establish a lasting dynasty, solidifying her family's dominance over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits upright, exuding a blend of weariness and alertness as he engages with Agrippinilla. His posture is resolute, yet his tiredness seeps through the lines of his face, indicative of the burdens he carries as Emperor. He speaks with a measured tone, hinting at the gravity of the conversation.',
        ap.emotional_state = 'Claudius\'s surface demeanor reflects a calm yet underlying tension. He manages to maintain a façade of authority even while feeling the weight of the decision at hand. Internally, he battles doubts about Agrippinilla’s true intentions, feeling a mix of hope for partnership and dread over her ambition.',
        ap.emotional_tags = ["claudius's surface demeanor reflects a calm yet underlying tension. he manages to maintain a fa\u00e7ade of authority even while feeling the weight of the decision at hand. internally, he battles doubts about agrippinilla\u2019s true intentions, feeling a mix of hope for partnership", "dread over her ambition.", "claudius's surface demeanor reflects a calm yet underlying tension. he manages to maintain a fa\u00e7ade of authority even while feeling the weight of the decision at hand. internally", "he battles doubts about agrippinilla\u2019s true intentions", "feeling a mix of hope for partnership and dread over her ambition.", "claudius's surface demeanor reflects a calm yet underlying tension. he manages to maintain a fa\u00e7ade of authority even", "feeling the weight of the decision at hand. internally, he battles doubts about agrippinilla\u2019s true intentions, feeling a mix of hope for partnership and dread over her ambition."],
        ap.active_plans = ["To secure Agrippinilla as a political ally through marriage, utilizing her ambitions for his own gain.", "To navigate the complexities of Roman politics with a partner who possesses both beauty and intellect.", "To address the pressing need for support in his reign as he faces the reality of his vulnerabilities."],
        ap.beliefs = ["Power must be shared with those who possess the intellect to wield it effectively.", "Personal connections can be crafted from political necessity, blurring the lines between affection and ambition.", "Incestuous alliances, while taboo, can serve political aims if handled correctly."],
        ap.goals = ["Short-term: To finalize the marriage proposal to Agrippinilla to stabilize his power.", "Medium-term: To utilize Agrippinilla's intelligence to navigate the political landscape and ensure his reign.", "Ultimate: To establish a legacy through a strong partnership that secures the imperial line and Rome\u2019s stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla enters with an air of confidence, her movements fluid and assured as she positions herself next to Claudius, ready to engage. Her gestures are animated, reflecting her enthusiasm for the prospect of marriage and power, while her smile masks deeper intentions.',
        ap.emotional_state = 'On the surface, Agrippinilla radiates joy and excitement at the proposal, her voice laced with affection. Beneath this facade, however, lies a cunning ambition and a calculated resolve, determined to exploit the marriage for her own gain. She navigates between celebrating the union and asserting her role as a formidable partner.',
        ap.emotional_tags = ["on the surface, agrippinilla radiates joy", "excitement at the proposal, her voice laced with affection. beneath this facade, however, lies a cunning ambition", "a calculated resolve, determined to exploit the marriage for her own gain. she navigates between celebrating the union", "asserting her role as a formidable partner.", "on the surface", "agrippinilla radiates joy and excitement at the proposal", "her voice laced with affection. beneath this facade", "however", "lies a cunning ambition and a calculated resolve", "determined to exploit the marriage for her own gain. she navigates between celebrating the union and asserting her role as a formidable partner."],
        ap.active_plans = ["To assert her position of power in the marriage, ensuring that she is not relegated to a passive role.", "To solidify her influence over Claudius and the imperial court, leveraging the marriage to further her own ambitions.", "To maintain her image as a devoted wife while quietly maneuvering for control over key political decisions."],
        ap.beliefs = ["Marriage is a strategic alliance that can amplify her ambitions and power.", "Her intellect and capability surpass typical notions of femininity in power dynamics, allowing her to challenge traditional roles.", "To achieve her goals, she must be both charming and ruthless, embodying the duality of affection and ambition."],
        ap.goals = ["Short-term: To secure the marriage to Claudius and establish immediate influence over him.", "Medium-term: To position herself as a central figure in the imperial court, shaping policy and decisions.", "Ultimate: To use her relationship with Claudius to ensure Nero's succession and dismantle any threats to her family\u2019s power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla is in motion, pacing restlessly in her private apartments. She is no longer basking in the glow of her apparent victory, but is now consumed by a gnawing uncertainty. Her brow is furrowed, and her movements are sharp and agitated as she probes Pallas for answers, demanding clarity on Claudius\'s perplexing words.',
        ap.emotional_state = 'Though outwardly she presents a facade of composed inquiry, beneath the surface, Agrippinilla is deeply unsettled and suspicious. The initial triumph of securing the marriage has given way to a chilling unease. She is struggling to reconcile Claudius\'s compliant agreement with his cryptic pronouncements, hinting at a hidden agenda that she cannot yet decipher. Fear and suspicion are beginning to eclipse her ambition-fueled confidence.',
        ap.emotional_tags = ["though outwardly she presents a facade of composed inquiry, beneath the surface, agrippinilla is deeply unsettled", "suspicious. the initial triumph of securing the marriage has given way to a chilling unease. she is struggling to reconcile claudius's compliant agreement with his cryptic pronouncements, hinting at a hidden agenda that she cannot yet decipher. fear", "suspicion are beginning to eclipse her ambition-fueled confidence.", "though outwardly she presents a facade of composed inquiry", "beneath the surface", "agrippinilla is deeply unsettled and suspicious. the initial triumph of securing the marriage has given way to a chilling unease. she is struggling to reconcile claudius's compliant agreement with his cryptic pronouncements", "hinting at a hidden agenda that she cannot yet decipher. fear and suspicion are beginning to eclipse her ambition-fueled confidence."],
        ap.active_plans = ["To dissect Claudius's ambiguous statement to understand his true intentions regarding the marriage.", "To assess whether Claudius is truly the easily manipulated fool she perceived, or if he possesses a hidden cunning.", "To reaffirm the strategy with Pallas, ensuring their plan to use Claudius for Nero's benefit remains viable despite these new uncertainties."],
        ap.beliefs = ["That power is rarely offered without ulterior motives, especially in the treacherous Roman court.", "That Claudius, despite his stammer and perceived weakness, might be more perceptive and calculating than she initially judged.", "That she must remain vigilant and intellectually superior to her rivals to maintain control and achieve her ambitions."],
        ap.goals = ["Short-term: To fully understand the meaning behind Claudius's cryptic words and assess the immediate implications for her plan.", "Medium-term: To ensure the marriage to Claudius serves her long-term goals of securing Nero's path to the emperorship, adapting her strategy if necessary.", "Ultimate: To establish Nero as the undisputed Emperor of Rome and consolidate her own power and influence behind the throne, overcoming any obstacles posed by Claudius or others."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Pallas enters Agrippinilla\'s private apartments, responding to her summons with a concerned yet composed demeanor. He listens attentively to Agrippinilla\'s anxious questioning, offering reassurances while attempting to downplay the significance of Claudius\'s perplexing statement. He stands calmly, observing Agrippinilla\'s agitation and ready to offer pragmatic advice.',
        ap.emotional_state = 'Pallas projects an air of calm reassurance, aiming to soothe Agrippinilla\'s growing anxieties. While he acknowledges her concerns, he seems less perturbed by Claudius\'s cryptic words, perhaps viewing them as the ramblings of an aging, eccentric emperor. Internally, he might be slightly wary of Agrippinilla\'s heightened suspicion, but primarily focused on maintaining the momentum of their established plan, prioritizing practical outcomes over speculative worries.',
        ap.emotional_tags = ["pallas projects an air of calm reassurance", "aiming to soothe agrippinilla's growing anxieties. while he acknowledges her concerns", "he seems less perturbed by claudius's cryptic words", "perhaps viewing them as the ramblings of an aging", "eccentric emperor. internally", "he might be slightly wary of agrippinilla's heightened suspicion", "but primarily focused on maintaining the momentum of their established plan", "prioritizing practical outcomes over speculative worries.", "pallas projects an air of calm reassurance, aiming to soothe agrippinilla's growing anxieties. while he acknowledges her concerns, he seems less perturbed by claudius's cryptic words, perhaps viewing them as the ramblings of an aging, eccentric emperor. internally, he might be slightly wary of agrippinilla's heightened suspicion,", "primarily focused on maintaining the momentum of their established plan, prioritizing practical outcomes over speculative worries."],
        ap.active_plans = ["To reassure Agrippinilla and dismiss her concerns as unfounded, preventing her from becoming overly anxious or derailing their strategy.", "To provide the information Agrippinilla requests, specifically recalling Claudius's exact words to satisfy her need for clarity.", "To maintain the focus on their primary objective: ensuring Claudius's reign continues long enough for Nero to mature and solidify his claim to succession."],
        ap.beliefs = ["That Claudius is likely an aging and somewhat eccentric ruler whose cryptic pronouncements should not be over-analyzed.", "That Agrippinilla's sharp intellect can sometimes lead her to overthink and perceive threats where none exist.", "That the marriage to Claudius remains a significant strategic advantage, regardless of any enigmatic comments from the Emperor."],
        ap.goals = ["Short-term: To calm Agrippinilla's nerves and redirect her focus back to their established plan, minimizing any disruption caused by her suspicion.", "Medium-term: To ensure the marriage proceeds smoothly and is effectively leveraged to advance Nero's position and their own influence.", "Ultimate: To contribute to the successful transition of power to Nero, securing his own position and influence within the new imperial regime."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands at the entrance of Agrippinilla\'s private apartments, concerned and hesitant. He shifts his weight from one foot to the other, embodying a mix of caution and loyalty as he engages in a conversation filled with tension. His body language suggests he is prepared for a difficult dialogue, ready to navigate the delicate dynamics of their scheming.',
        ap.emotional_state = 'Pallas experiences a complex emotional state, outwardly displaying concern and professionalism. Internally, however, he grapples with unease and trepidation. The cryptic nature of Claudius\'s statement weighs heavily on him, sowing doubt about the emperor\'s current state of mind. His desire to protect Agrippinilla clashes with his instinct to tread carefully in the volatile environment of the imperial court.',
        ap.emotional_tags = ["pallas experiences a complex emotional state, outwardly displaying concern", "professionalism. internally, however, he grapples with unease", "trepidation. the cryptic nature of claudius's statement weighs heavily on him, sowing doubt about the emperor's current state of mind. his desire to protect agrippinilla clashes with his instinct to tread carefully in the volatile environment of the imperial court.", "pallas experiences a complex emotional state", "outwardly displaying concern and professionalism. internally", "however", "he grapples with unease and trepidation. the cryptic nature of claudius's statement weighs heavily on him", "sowing doubt about the emperor's current state of mind. his desire to protect agrippinilla clashes with his instinct to tread carefully in the volatile environment of the imperial court."],
        ap.active_plans = ["To provide Agrippinilla with honest counsel regarding Claudius's mental state and potential threats.", "To assess the implications of the emperor's cryptic statement on their plans.", "To help maintain stability in the court while protecting Agrippinilla's interests."],
        ap.beliefs = ["Loyalty to Agrippinilla is paramount, but it must be balanced with caution towards Claudius.", "Claudius's erratic behavior poses a potential threat to their ambitions and must be monitored closely.", "Understanding the nuances of power dynamics in the court is essential for survival."],
        ap.goals = ["Short-term: Ensure Agrippinilla feels supported and informed about Claudius's behavior.", "Medium-term: Strategically navigate any upcoming political moves related to Claudius's marriage proposal.", "Ultimate: Secure a position of influence in the court that aligns with Agrippinilla's ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla paces restlessly within her lavish private apartments, her posture reflecting both determination and anxiety. She gestures animatedly as she speaks to Pallas, her brow furrowed in concentration as she seeks clarity on Claudius\'s intentions. Her pacing serves as an outward manifestation of her internal turmoil as she grapples with the implications of her impending marriage.',
        ap.emotional_state = 'Agrippinilla is a maelstrom of emotions, outwardly projecting confidence and ambition, yet inside she wrestles with doubt and suspicion. The bizarre phrase from Claudius unsettles her, stirring a sense of paranoia about his true intentions. While she seeks to maintain her composure, an undercurrent of fear about losing control of her carefully crafted plans simmers beneath her surface.',
        ap.emotional_tags = ["agrippinilla is a maelstrom of emotions, outwardly projecting confidence", "ambition, yet inside she wrestles with doubt", "suspicion. the bizarre phrase from claudius unsettles her, stirring a sense of paranoia about his true intentions. while she seeks to maintain her composure, an undercurrent of fear about losing control of her carefully crafted plans simmers beneath her surface.", "agrippinilla is a maelstrom of emotions", "outwardly projecting confidence and ambition", "yet inside she wrestles with doubt and suspicion. the bizarre phrase from claudius unsettles her", "stirring a sense of paranoia about his true intentions. while she seeks to maintain her composure", "an undercurrent of fear about losing control of her carefully crafted plans simmers beneath her surface."],
        ap.active_plans = ["To decipher Claudius's intentions regarding their marriage and potential threats to her power.", "To ensure her son Nero is positioned advantageously as she navigates political intricacies.", "To keep Claudius alive long enough to solidify her plans, despite her growing suspicions."],
        ap.beliefs = ["Power is a game of manipulation, and she must outwit Claudius and others to secure her legacy.", "Trust is a luxury she cannot afford; everyone, including Claudius, is a potential threat.", "Her ambitions for Nero's ascendance must not be compromised, no matter the cost."],
        ap.goals = ["Short-term: Clarify Claudius's intentions to safeguard her plans.", "Medium-term: Ensure Claudius's continued reign long enough for Nero to come of age.", "Ultimate: Eliminate any obstacles to her family's power and secure Nero's position as Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla is actively pacing within her private apartments, a physical manifestation of her mental agitation and deep contemplation. She is not idle; her movements are purposeful, reflecting the restless nature of her strategic mind as she processes the implications of Claudius\'s cryptic pronouncements and formulates her next moves in the power game.',
        ap.emotional_state = 'On the surface, Agrippinilla maintains a veneer of composed calculation, her questions to Pallas sharp and analytical. However, beneath this facade, a flicker of unease and suspicion is palpable. Claudius\'s unsettling words have injected uncertainty into her plans, triggering a subtle paranoia.  She is wrestling with the implications of his cryptic statement, attempting to reconcile her perception of Claudius as a puppet with the possibility of a hidden, more dangerous intellect.',
        ap.emotional_tags = ["on the surface, agrippinilla maintains a veneer of composed calculation, her questions to pallas sharp", "analytical. however, beneath this facade, a flicker of unease", "suspicion is palpable. claudius's unsettling words have injected uncertainty into her plans, triggering a subtle paranoia.  she is wrestling with the implications of his cryptic statement, attempting to reconcile her perception of claudius as a puppet with the possibility of a hidden, more dangerous intellect.", "on the surface", "agrippinilla maintains a veneer of composed calculation", "her questions to pallas sharp and analytical. however", "beneath this facade", "a flicker of unease and suspicion is palpable. claudius's unsettling words have injected uncertainty into her plans", "triggering a subtle paranoia.  she is wrestling with the implications of his cryptic statement", "attempting to reconcile her perception of claudius as a puppet with the possibility of a hidden", "more dangerous intellect."],
        ap.active_plans = ["To decipher the true meaning behind Claudius's strange statement, 'Let all the poisons that are in the mud hatch out,' and assess if it poses a threat to her plans.", "To reassess her understanding of Claudius's character and motivations, considering he might be more perceptive or cunning than she initially believed.", "To ensure Claudius remains alive and Emperor until Nero reaches an age where he can effectively assume power, securing her son's future and her own continued influence."],
        ap.beliefs = ["Ruthless pragmatism is essential for survival and success in Roman politics, and sentimentality is a weakness to be exploited by others.", "Nero's ascension to the imperial throne is not just desirable but a necessary outcome for her own ambition and legacy.", "Power is a game of manipulation and control, and understanding the hidden motives of others is crucial to maintaining the upper hand."],
        ap.goals = ["{type: short-term, description: To fully comprehend the significance of Claudius's cryptic words and determine if they represent a genuine threat or just the ramblings of a weakened mind.}", "{type: medium-term, description: To solidify her position as Empress and leverage her marriage to Claudius to further her influence and control over the Roman court, paving the way for Nero's succession.}", "{type: ultimate, description: To secure Nero's unchallenged reign as Emperor of Rome, establishing a dynasty and ensuring her own enduring legacy as the power behind the throne.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Pallas enters Agrippinilla\'s private apartments in response to her summons, his posture suggesting concern and attentiveness to her unease. He is actively engaging in conversation with Agrippinilla, answering her direct questions about his prior interaction with Claudius and participating in strategic dialogue, offering his perspective on the unfolding situation.',
        ap.emotional_state = 'Pallas displays a demeanor of pragmatic concern, reflecting his role as a trusted advisor deeply invested in Agrippinilla\'s political strategies. He is responsive to her anxieties about Claudius\'s cryptic statement, suggesting he shares a similar level of caution and awareness of potential threats. While outwardly composed, there\'s an underlying tension as they both grapple with the unsettling implications of Claudius\'s words, hinting at a shared vulnerability in their carefully laid plans.',
        ap.emotional_tags = ["pallas displays a demeanor of pragmatic concern, reflecting his role as a trusted advisor deeply invested in agrippinilla's political strategies. he is responsive to her anxieties about claudius's cryptic statement, suggesting he shares a similar level of caution", "awareness of potential threats. while outwardly composed, there's an underlying tension as they both grapple with the unsettling implications of claudius's words, hinting at a shared vulnerability in their carefully laid plans.", "pallas displays a demeanor of pragmatic concern", "reflecting his role as a trusted advisor deeply invested in agrippinilla's political strategies. he is responsive to her anxieties about claudius's cryptic statement", "suggesting he shares a similar level of caution and awareness of potential threats. while outwardly composed", "there's an underlying tension as they both grapple with the unsettling implications of claudius's words", "hinting at a shared vulnerability in their carefully laid plans."],
        ap.active_plans = ["To accurately relay his conversation with Claudius to Agrippinilla, ensuring she has all available information to assess the situation.", "To offer his interpretation of Claudius's cryptic statement, attempting to rationalize it or downplay its potential significance to reassure Agrippinilla.", "To collaborate with Agrippinilla in developing contingency plans based on the potential implications of Claudius's words, maintaining their strategic advantage in the power struggle."],
        ap.beliefs = ["Maintaining a close alliance with Agrippinilla is crucial for his own political survival and advancement within the Roman court.", "Claudius, despite his perceived weaknesses, should not be underestimated, and his pronouncements require careful analysis.", "Strategic planning and information control are essential tools for navigating the treacherous landscape of Roman imperial politics."],
        ap.goals = ["{type: short-term, description: To effectively communicate the details of his conversation with Claudius and provide Agrippinilla with the information she needs to make informed decisions.}", "{type: medium-term, description: To support Agrippinilla in her schemes to consolidate power and secure Nero's succession, ensuring stability and his continued influence within the new regime.}", "{type: ultimate, description: To contribute to the establishment of a powerful and stable Roman Empire, ideally under Nero's rule, which would also secure his own long-term position and influence within the Roman state.}"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_chains_event_6_2'})
    ON CREATE SET
        oi.description = 'The heavy, cold chains are prominently displayed, binding King Caractacus as he is presented before the Roman Senate. They serve as a stark and brutal symbol of his captivity and the might of Rome\'s military power.  The chains are not merely functional restraints; they are a visual declaration of Roman dominance, intended to underscore Caractacus\'s defeat and subjugation in the eyes of the Senate. However, paradoxically, they also become a stage for Caractacus\'s defiance, highlighting the fact that while his body is bound, his spirit remains unbroken and his voice undeterred.',
        oi.status_before = 'The chains are in use, tightly binding Caractacus, signifying his status as a captured enemy of Rome and emphasizing his complete physical restraint as he is brought into the Senate.',
        oi.status_after = 'The chains remain on Caractacus throughout the event, still symbolizing his physical captivity. However, their narrative significance shifts. They no longer solely represent Roman triumph, but also become a potent visual contrast to Caractacus\'s unyielding spirit and the unexpected respect he earns from the Senate despite his physical bondage. The chains become a testament to the limits of physical power in subduing the human spirit.'
    WITH oi
    MATCH (o:Object {uuid: 'object_chains'})
    MATCH (e:Event {uuid: 'event_6_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sword_event_6_3'})
    ON CREATE SET
        oi.description = 'The sword symbolizes Roman military might and the ongoing threat of violence inherent in conquest. Though not physically present, it serves as a potent reminder of the implications of Caractacus\'s resistance and the potential endless cycle of conflict that looms over Britain.',
        oi.status_before = 'The sword exists as a metaphorical representation of power, wielded by the Senate as a tool of authority and subjugation, with the weight of its legacy echoing throughout Rome.',
        oi.status_after = 'Following Caractacus\'s speech and the Senate\'s applause, the sword\'s representation shifts to embody the choice between continued conquest and the possibility of honorable governance, now shadowed by the emotional response of the Senate.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sword'})
    MATCH (e:Event {uuid: 'event_6_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_chains_event_6_3'})
    ON CREATE SET
        oi.description = 'The chains represent Caractacus\'s physical captivity yet contrast sharply with his indomitable spirit. They serve as a visual symbol of defeat while highlighting the resilience of the human spirit, emphasizing the tension between subjugation and dignity.',
        oi.status_before = 'Before the event, the chains bound Caractacus, marking him as a prisoner of war and a testament to Roman dominance over conquered peoples.',
        oi.status_after = 'After the event, the chains remain, but their psychological impact has shifted; they now symbolize not just defeat but also the respect earned by Caractacus through his courageous stance against oppression.'
    WITH oi
    MATCH (o:Object {uuid: 'object_chains'})
    MATCH (e:Event {uuid: 'event_6_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'CLAUDIUS stands resolutely before the Senate, his posture erect, embodying the weight of authority and the burdens of leadership. He gestures subtly as he speaks, emphasizing key points about the conquest of Britain. His movements are deliberate, as he maintains eye contact with the senators, commanding their attention with a blend of vulnerability and command.',
        ap.emotional_state = 'Claudius displays a façade of confidence tempered by an undercurrent of weariness. His tone, though firm, hints at the emotional toll of leadership—an urge to inspire his senators while grappling with the enormity of his responsibilities. Internally, he wrestles with the implications of his words and the gravity of his rule, feeling the tension between public perception and personal doubt.',
        ap.emotional_tags = ["claudius displays a fa\u00e7ade of confidence tempered by an undercurrent of weariness. his tone, though firm, hints at the emotional toll of leadership\u2014an urge to inspire his senators while grappling with the enormity of his responsibilities. internally, he wrestles with the implications of his words", "the gravity of his rule, feeling the tension between public perception", "personal doubt.", "claudius displays a fa\u00e7ade of confidence tempered by an undercurrent of weariness. his tone", "though firm", "hints at the emotional toll of leadership\u2014an urge to inspire his senators while grappling with the enormity of his responsibilities. internally", "he wrestles with the implications of his words and the gravity of his rule", "feeling the tension between public perception and personal doubt.", "claudius displays a fa\u00e7ade of confidence tempered by an undercurrent of weariness. his tone, though firm, hints at the emotional toll of leadership\u2014an urge to inspire his senators", "grappling with the enormity of his responsibilities. internally, he wrestles with the implications of his words and the gravity of his rule, feeling the tension between public perception and personal doubt."],
        ap.active_plans = ["To assert his authority and consolidate power before the Senate.", "To inspire loyalty and respect from the senators with a recounting of the conquest's challenges and sacrifices.", "To shift the focus of blame for losses onto himself, presenting an image of a self-sacrificing leader seeking solidarity."],
        ap.beliefs = ["The importance of public perception in maintaining authority as Emperor.", "A belief that vulnerability can strengthen his position by humanizing himself to the Senate.", "The conviction that acknowledging failure can foster unity and support from his advisors and the Senate."],
        ap.goals = ["Short-term: To gain the Senate's approval for his decisions regarding the British conquest.", "Medium-term: To solidify his legacy as a capable Emperor despite the setbacks in Britain.", "Ultimate: To secure a place in history as a wise and just ruler who managed the complexities of Rome's empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the assembled Senate, regal in his imperial robes, yet his posture betrays a weariness that underlies his authority. He is in the midst of addressing the senators, his voice, though occasionally halting, carries the weight of his imperial office as he recounts the long and arduous campaign in Britain. He gestures with a hand, perhaps indicating the presence of Caractacus, while maintaining a formal distance from the captured king.',
        ap.emotional_state = 'Claudius projects an air of imperial composure, a necessary facade when addressing the Senate. Beneath this exterior, however, there\'s a discernible detachment, almost as if he\'s observing the scene unfold with a historian\'s eye rather than a conqueror\'s pride. He seems intrigued by Caractacus\'s defiance, perhaps even admiring it in a detached way. There\'s no overt triumph in his demeanor, more a sense of weary acknowledgment of the political theatre playing out.',
        ap.emotional_tags = ["claudius projects an air of imperial composure", "a necessary facade when addressing the senate. beneath this exterior", "however", "there's a discernible detachment", "almost as if he's observing the scene unfold with a historian's eye rather than a conqueror's pride. he seems intrigued by caractacus's defiance", "perhaps even admiring it in a detached way. there's no overt triumph in his demeanor", "more a sense of weary acknowledgment of the political theatre playing out."],
        ap.active_plans = ["To formally announce the successful conclusion of the war in Britain to the Roman Senate.", "To present King Caractacus to the Senate as a symbol of Roman victory and conquered territories.", "To gauge the Senate's reaction to Caractacus's presence and defiance, subtly influencing their perception of the captured king."],
        ap.beliefs = ["The Roman Empire's expansion and dominance are inevitable and justified.", "Courage and dignity are noteworthy traits, even when displayed by Rome's adversaries.", "Maintaining the Senate's approval and cooperation is crucial for the stability and governance of the Empire."],
        ap.goals = ["short-term\": \"To deliver a clear and authoritative account of the British campaign's end to the Senate.", "medium-term\": \"To solidify his image as a successful Emperor who brings glory and expansion to Rome, while also demonstrating clemency.", "ultimate\": \"To ensure the continued strength and stability of the Roman Empire through strategic political maneuvering and displays of imperial power tempered with wisdom."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caractacus_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Caractacus stands defiantly before the Senate, bound in chains yet radiating strength. His posture is upright, conveying a spirit unbroken by captivity. With each word, he gestures passionately, a striking juxtaposition to his physical restraint.',
        ap.emotional_state = 'Caractacus exudes a fierce bravery and unwavering resolve. While he outwardly displays defiance, internally, he is acutely aware of the vulnerability his chains represent. His motivations are layered, battling between the pride of his heritage and the acute awareness of his precarious position.',
        ap.emotional_tags = ["caractacus exudes a fierce bravery", "unwavering resolve. while he outwardly displays defiance, internally, he is acutely aware of the vulnerability his chains represent. his motivations are layered, battling between the pride of his heritage", "the acute awareness of his precarious position.", "caractacus exudes a fierce bravery and unwavering resolve. while he outwardly displays defiance", "internally", "he is acutely aware of the vulnerability his chains represent. his motivations are layered", "battling between the pride of his heritage and the acute awareness of his precarious position."],
        ap.active_plans = ["To deliver a stirring speech that captivates the Senate and shifts their perspective on British resistance.", "To underscore the futility of reliance solely on military might, advocating for dignity and honor.", "To garner respect and sympathy from the Senators, hoping to secure a merciful outcome for himself and his people."],
        ap.beliefs = ["True strength lies in dignity and honor rather than mere military conquest.", "The spirit of a people cannot be subdued by chains; defiance is a powerful weapon.", "Engaging in dialogue is as crucial as wielding a sword in battle."],
        ap.goals = ["Short-term: To make an impactful statement that resonates with the Senate and gains their respect.", "Medium-term: To secure a favorable treatment for himself and his family, potentially avoiding execution.", "Ultimate: To inspire future generations of Britons to resist oppression and maintain their identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the Senate, observing the unfolding scene with a mix of surprise and contemplation. His demeanor is one of weary authority, processing the unexpected applause that follows Caractacus\'s speech.',
        ap.emotional_state = 'Claudius experiences a complex mix of emotions, including surprise, admiration, and concern. While he perceives the Senate\'s admiration for Caractacus as a potential threat to his authority, he also feels the weight of respect and the longing for integrity within the Empire.',
        ap.emotional_tags = ["claudius experiences a complex mix of emotions, including surprise, admiration,", "concern. while he perceives the senate's admiration for caractacus as a potential threat to his authority, he also feels the weight of respect", "the longing for integrity within the empire.", "claudius experiences a complex mix of emotions", "including surprise", "admiration", "and concern. while he perceives the senate's admiration for caractacus as a potential threat to his authority", "he also feels the weight of respect and the longing for integrity within the empire."],
        ap.active_plans = ["To maintain his composure and authority in the face of Caractacus's impassioned speech.", "To gauge the Senate's sentiments and understand their shifting loyalty towards values of honor and bravery.", "To navigate this unexpected response in a way that reinforces his own position while acknowledging the courage displayed."],
        ap.beliefs = ["A ruler must balance strength with wisdom, understanding the political tides of sentiment.", "Respect earned through valor can be more powerful than fear instilled through conquest.", "Leadership requires not only authority but the ability to listen and adapt to the will of the Senate."],
        ap.goals = ["Short-term: To manage the Senate's reaction and assert his authority despite the applause for Caractacus.", "Medium-term: To find a way to honor Caractacus's bravery while reinforcing his own power.", "Ultimate: To guide Rome towards a legacy of strength that incorporates respect and integrity in leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Seated wearily on his throne within his grand bedroom, Claudius observes the tense exchange unfolding before him. He listens intently, his body language suggesting a mixture of resignation and detached amusement as Agrippinilla orchestrates the scene.  He intervenes only to superficially quell the immediate conflict, agreeing readily to Agrippinilla\'s demands and proposals.',
        ap.emotional_state = 'Beneath a veneer of weariness and compliance, Claudius harbors a deep cynicism and a sense of fatalistic acceptance. He outwardly expresses irritation with Agrippinilla and Nero, hinting at his awareness of their schemes. Internally, he is detached yet resolute, resigned to his fate but also harboring secret plans. There\'s a sense of sardonic amusement in his quick agreements, masking a deeper, strategic purpose.',
        ap.emotional_tags = ["beneath a veneer of weariness", "compliance, claudius harbors a deep cynicism", "a sense of fatalistic acceptance. he outwardly expresses irritation with agrippinilla", "nero, hinting at his awareness of their schemes. internally, he is detached yet resolute, resigned to his fate but also harboring secret plans. there's a sense of sardonic amusement in his quick agreements, masking a deeper, strategic purpose.", "beneath a veneer of weariness and compliance", "claudius harbors a deep cynicism and a sense of fatalistic acceptance. he outwardly expresses irritation with agrippinilla and nero", "hinting at his awareness of their schemes. internally", "he is detached yet resolute", "resigned to his fate but also harboring secret plans. there's a sense of sardonic amusement in his quick agreements", "masking a deeper", "strategic purpose.", "beneath a veneer of weariness and compliance, claudius harbors a deep cynicism and a sense of fatalistic acceptance. he outwardly expresses irritation with agrippinilla and nero, hinting at his awareness of their schemes. internally, he is detached yet resolute, resigned to his fate", "also harboring secret plans. there's a sense of sardonic amusement in his quick agreements, masking a deeper, strategic purpose."],
        ap.active_plans = ["Observe Agrippinilla's manipulative tactics and Nero's reactions.", "Maintain a facade of compliance to conceal his true intentions and plans.", "Subtly express his disdain for Agrippinilla and Nero to establish his true feelings."],
        ap.beliefs = ["Agrippinilla and Nero are driven by loathsome ambition.", "His own death is imminent and predetermined.", "He possesses secret plans to counter Agrippinilla's schemes, despite appearing passive."],
        ap.goals = ["Short-term: End the immediate confrontation and move the scene forward.", "Medium-term: Implement his secret plans, hinted at but not yet revealed.", "Ultimate: Achieve his vision for Rome's future, even if it involves his own demise and suffering in the short term."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Standing imperiously before Claudius, Agrippinilla orchestrates a subtle power play using Nero\'s musicality as a weapon against Britannicus. She initiates a seemingly innocuous suggestion of a duet, then swiftly escalates the tension by demanding Britannicus address Nero by his adopted name and apologize, pressing Claudius to enforce her will and immediately seizing the opportunity to propose marriage and adoption.',
        ap.emotional_state = 'Agrippinilla exudes a chilling confidence and calculated dominance. Outwardly, she maintains a veneer of aristocratic decorum, but beneath the surface lies a ruthless ambition and barely concealed contempt for Britannicus. She is subtly aggressive and manipulative, using the musical exchange as a pretext to assert her control and belittle Britannicus, revealing a deep-seated need to control the narrative and secure Nero\'s ascendance.',
        ap.emotional_tags = ["agrippinilla exudes a chilling confidence", "calculated dominance. outwardly, she maintains a veneer of aristocratic decorum, but beneath the surface lies a ruthless ambition", "barely concealed contempt for britannicus. she is subtly aggressive", "manipulative, using the musical exchange as a pretext to assert her control", "belittle britannicus, revealing a deep-seated need to control the narrative", "secure nero's ascendance.", "agrippinilla exudes a chilling confidence and calculated dominance. outwardly", "she maintains a veneer of aristocratic decorum", "but beneath the surface lies a ruthless ambition and barely concealed contempt for britannicus. she is subtly aggressive and manipulative", "using the musical exchange as a pretext to assert her control and belittle britannicus", "revealing a deep-seated need to control the narrative and secure nero's ascendance.", "agrippinilla exudes a chilling confidence and calculated dominance. outwardly, she maintains a veneer of aristocratic decorum,", "beneath the surface lies a ruthless ambition and barely concealed contempt for britannicus. she is subtly aggressive and manipulative, using the musical exchange as a pretext to assert her control and belittle britannicus, revealing a deep-seated need to control the narrative and secure nero's ascendance."],
        ap.active_plans = ["Undermine Britannicus's confidence and social standing in front of Claudius.", "Assert her authority over Britannicus and within the imperial family.", "Secure Claudius's immediate and unquestioning approval for Nero's marriage to Octavia and his adoption."],
        ap.beliefs = ["Nero is superior to Britannicus and destined to be Emperor.", "Britannicus is a threat to Nero's claim and must be consistently diminished.", "Claudius, despite his position, is manipulable and can be steered to serve her ambitions."],
        ap.goals = ["Short-term: Force Britannicus into submission and secure Claudius's immediate agreement in this scene.", "Medium-term: Solidify Nero's position as the clear heir and further marginalize Britannicus politically and socially.", "Ultimate: Establish Nero as the unchallenged Emperor of Rome and maintain her own powerful influence behind the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Standing in the imperial bedroom, Britannicus is drawn into Agrippinilla’s manipulative game. He pointedly refuses to call Nero by his adopted name, \'Nero\', and defiantly rejects Agrippinilla\'s demand for an apology. His posture is rigid, reflecting his inner turmoil as he directly confronts Claudius, accusing him of consistent favoritism and referencing the execution of his mother.',
        ap.emotional_state = 'Britannicus is consumed by a volatile mix of resentment, hurt, and defiance. Outwardly, he displays anger and open rebellion against Agrippinilla\'s machinations and Claudius\'s perceived betrayal. Internally, he grapples with deep-seated feelings of injustice and neglect, the pain of his mother\'s murder still raw. His refusal to apologize is a desperate assertion of his dignity and a cry against the constant undermining of his birthright.',
        ap.emotional_tags = ["britannicus is consumed by a volatile mix of resentment, hurt,", "defiance. outwardly, he displays anger", "open rebellion against agrippinilla's machinations", "claudius's perceived betrayal. internally, he grapples with deep-seated feelings of injustice", "neglect, the pain of his mother's murder still raw. his refusal to apologize is a desperate assertion of his dignity", "a cry against the constant undermining of his birthright.", "britannicus is consumed by a volatile mix of resentment", "hurt", "and defiance. outwardly", "he displays anger and open rebellion against agrippinilla's machinations and claudius's perceived betrayal. internally", "he grapples with deep-seated feelings of injustice and neglect", "the pain of his mother's murder still raw. his refusal to apologize is a desperate assertion of his dignity and a cry against the constant undermining of his birthright."],
        ap.active_plans = ["Resist Agrippinilla's attempts to belittle him and assert his own worth.", "Challenge Nero's legitimacy and the forced adoption of his new name.", "Express his deep resentment and hurt to Claudius, highlighting the perceived favoritism."],
        ap.beliefs = ["He is unfairly and consistently mistreated in favor of Nero.", "Claudius is weak and swayed by Agrippinilla, failing to protect him.", "Agrippinilla and Nero are usurpers who threaten his rightful inheritance."],
        ap.goals = ["Short-term: Refuse to apologize and voice his resentment, asserting his defiance in this immediate confrontation.", "Medium-term: Undermine Nero's position and challenge his claim to the throne whenever possible.", "Ultimate: Reclaim his birthright and become recognized as the rightful Emperor, avenging the injustices against him and his mother."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Positioned beside Agrippinilla, Nero initially remains silent during the tense exchange, observing the dynamic between Britannicus and his mother. When Britannicus refuses to apologize, Nero interjects with a show of false magnanimity, claiming an apology is unnecessary. He then proposes a performative act of reconciliation, inviting Octavia to join him in \'pacifying\' Britannicus, showcasing a calculated display of kindness.',
        ap.emotional_state = 'Nero presents a facade of manufactured humility and kindness, carefully crafted for observation. Outwardly, he appears gracious and forgiving, eager to defuse the tension. Internally, he is opportunistic and self-serving, likely pleased by Britannicus\'s discomfiture and Agrippinilla\'s dominance. His feigned kindness is a strategic performance, designed to enhance his public image and contrast sharply with Britannicus\'s raw emotion and defiance.',
        ap.emotional_tags = ["nero presents a facade of manufactured humility", "kindness, carefully crafted for observation. outwardly, he appears gracious", "forgiving, eager to defuse the tension. internally, he is opportunistic", "self-serving, likely pleased by britannicus's discomfiture", "agrippinilla's dominance. his feigned kindness is a strategic performance, designed to enhance his public image", "contrast sharply with britannicus's raw emotion", "defiance.", "nero presents a facade of manufactured humility and kindness", "carefully crafted for observation. outwardly", "he appears gracious and forgiving", "eager to defuse the tension. internally", "he is opportunistic and self-serving", "likely pleased by britannicus's discomfiture and agrippinilla's dominance. his feigned kindness is a strategic performance", "designed to enhance his public image and contrast sharply with britannicus's raw emotion and defiance."],
        ap.active_plans = ["Maintain a public image of kindness and magnanimity to contrast with Britannicus's perceived negativity.", "Appear conciliatory and forgiving to further undermine Britannicus in the eyes of Claudius and Agrippinilla.", "Reinforce Agrippinilla's agenda by playing his assigned role in the family's power dynamics."],
        ap.beliefs = ["He is destined for imperial greatness and favored by fortune (and Agrippinilla).", "Britannicus is a lesser rival and a threat to his ambitions, deserving of being undermined.", "Public perception and performance of virtue are crucial tools for achieving and maintaining power."],
        ap.goals = ["Short-term: Present himself as virtuous and kind in this immediate scene, gaining favor in the present interaction.", "Medium-term: Solidify his image as the favored son and heir, cultivating public approval and contrasting himself with Britannicus.", "Ultimate: Ascend to the throne and wield imperial power, enjoying the status and privileges of Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands assertively before Claudius, exuding an air of authority and control as she engages with Britannicus. Her body language is commanding, with deliberate gestures that emphasize her words, reinforcing her dominance in the family dynamic.',
        ap.emotional_state = 'Agrippinilla displays a surface confidence, her tone sharp and unwavering as she corrects Britannicus. However, beneath this bravado lies an underlying tension, driven by her need to assert Nero’s status and her fears of losing control over the political machinations within the family.',
        ap.emotional_tags = ["agrippinilla displays a surface confidence, her tone sharp", "unwavering as she corrects britannicus. however, beneath this bravado lies an underlying tension, driven by her need to assert nero\u2019s status", "her fears of losing control over the political machinations within the family.", "agrippinilla displays a surface confidence", "her tone sharp and unwavering as she corrects britannicus. however", "beneath this bravado lies an underlying tension", "driven by her need to assert nero\u2019s status and her fears of losing control over the political machinations within the family."],
        ap.active_plans = ["To compel Britannicus to acknowledge Nero's adopted name and apologize, thereby asserting Nero's elevated status.", "To manipulate the dynamics between Claudius, Britanicus, and Nero to solidify her power and influence.", "To prepare the ground for her son Nero's ascendance by reinforcing familial loyalties and undermining Britannicus."],
        ap.beliefs = ["She believes that control over familial relationships is essential for maintaining power.", "Agrippinilla thinks that public perception of Nero's status must be relentlessly enforced to eliminate any challenge from Britannicus.", "She holds a conviction that her ambitions for her son\u2019s reign justify manipulative actions and power plays."],
        ap.goals = ["Short-term: To secure an apology from Britannicus to reinforce Nero's status.", "Medium-term: To ensure Nero's marriage to Octavia happens smoothly, solidifying both their positions within the imperial family.", "Ultimate: To obliterate Claudius's legacy and establish a powerful dynasty through Nero."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands defiant, his posture rigid with anger as he confronts both Agrippinilla and Claudius. His movements are tense, reflecting his internal turmoil as he pushes back against Agrippinilla’s demands.',
        ap.emotional_state = 'Britannicus is filled with resentment and frustration, his surface anger masking a deeper hurt stemming from feelings of neglect and betrayal. He grapples with the painful recognition that his status and voice are being overshadowed and dismissed within his own family.',
        ap.emotional_tags = ["britannicus is filled with resentment", "frustration, his surface anger masking a deeper hurt stemming from feelings of neglect", "betrayal. he grapples with the painful recognition that his status", "voice are being overshadowed", "dismissed within his own family.", "britannicus is filled with resentment and frustration", "his surface anger masking a deeper hurt stemming from feelings of neglect and betrayal. he grapples with the painful recognition that his status and voice are being overshadowed and dismissed within his own family."],
        ap.active_plans = ["To resist Agrippinilla\u2019s demand for an apology, asserting his own dignity and rejecting her authority.", "To vocalize his grievances about Claudius's favoritism towards Nero, seeking acknowledgment of his own rightful position.", "To forge alliances within the family that could protect his claim to the throne and counter Agrippinilla's influence."],
        ap.beliefs = ["He believes that he deserves respect and acknowledgment as the rightful heir to the throne.", "Britannicus thinks that familial loyalty should not come at the cost of sacrificing his dignity and identity.", "He holds a conviction that the truth of his mother's murder and the injustices he faces must be confronted."],
        ap.goals = ["Short-term: To refuse Agrippinilla\u2019s demand for an apology and stand his ground against her manipulation.", "Medium-term: To seek reconciliation with Claudius in order to secure his position as the rightful heir.", "Ultimate: To reclaim his birthright and restore a sense of justice and legacy within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits on his throne, weary and contemplative, observing the escalating confrontation. His body language is weary yet resolute, indicating his struggle to maintain authority amidst familial discord.',
        ap.emotional_state = 'Claudius’s external demeanor reflects a blend of resignation and concern. Internally, he is caught in a conflict between his roles as a father and emperor, feeling the weight of his family\'s ambitions and the consequences of his previous decisions.',
        ap.emotional_tags = ["claudius\u2019s external demeanor reflects a blend of resignation", "concern. internally, he is caught in a conflict between his roles as a father", "emperor, feeling the weight of his family's ambitions", "the consequences of his previous decisions.", "claudius\u2019s external demeanor reflects a blend of resignation and concern. internally", "he is caught in a conflict between his roles as a father and emperor", "feeling the weight of his family's ambitions and the consequences of his previous decisions."],
        ap.active_plans = ["To intervene in the dispute between Britannicus and Agrippinilla to restore some semblance of order.", "To navigate the treacherous waters of familial loyalty while asserting his authority as emperor.", "To contemplate his legacy and the implications of his marriage choices for the future of Rome."],
        ap.beliefs = ["He believes that maintaining peace within the family is essential for the stability of his reign.", "Claudius thinks that the dynamics between his children must be carefully managed to prevent further discord.", "He holds a conviction that his choices, though flawed, are aimed at protecting the empire from chaos."],
        ap.goals = ["Short-term: To quell the immediate conflict and assert his authority over both Agrippinilla and Britannicus.", "Medium-term: To solidify alliances through strategic marriages that will secure his family's legacy.", "Ultimate: To navigate his impending mortality while ensuring the future stability of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Nero stands by Agrippinilla, appearing somewhat awkward yet eager to please, as he tries to defuse the situation. His demeanor is that of a reluctant participant caught between the demands of his mother and the animosity of Britannicus.',
        ap.emotional_state = 'Nero exhibits a flicker of discomfort at the tension, masking it with a disarming charm. Deep down, he feels torn between the expectations of his mother and the reality of his developing identity, which is laced with insecurity and a desire for approval.',
        ap.emotional_tags = ["nero exhibits a flicker of discomfort at the tension, masking it with a disarming charm. deep down, he feels torn between the expectations of his mother", "the reality of his developing identity, which is laced with insecurity", "a desire for approval.", "nero exhibits a flicker of discomfort at the tension", "masking it with a disarming charm. deep down", "he feels torn between the expectations of his mother and the reality of his developing identity", "which is laced with insecurity and a desire for approval."],
        ap.active_plans = ["To support Agrippinilla in asserting his status and to appease Britannicus with a kind gesture.", "To navigate the familial tensions without provoking further conflict, seeking to maintain a semblance of harmony.", "To cultivate his relationship with Octavia, positioning himself within the family dynamics while trying to gain independence."],
        ap.beliefs = ["He believes that family loyalty is paramount, yet he struggles with the consequences of his mother\u2019s ambitions.", "Nero thinks that being agreeable and charming will protect him from familial strife.", "He holds a conviction that his path to power is intertwined with Agrippinilla's ambitions and Claudius's decisions."],
        ap.goals = ["Short-term: To placate Britannicus and reduce the tension, seeking to avoid confrontation.", "Medium-term: To solidify his position as a prominent figure in the family through strategic alliances.", "Ultimate: To carve out a path to power that aligns with his mother's ambitions while trying to assert his own identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands defiantly in the imperial bedroom, directly confronting Agrippinilla and Claudius. He refuses to apologize to Nero, his body language charged with resentment and hurt. He directly accuses Claudius of siding against him and erupts with a painful accusation about his mother\'s death, his voice filled with raw emotion and a sense of deep injustice.',
        ap.emotional_state = 'Britannicus is consumed by raw anguish and resentment. Outwardly, he displays intense anger and defiance, his voice raised and his words sharp. Beneath the surface, he is deeply wounded, feeling betrayed and unloved by his father. There is a palpable tension between his princely pride and the deep-seated pain of past neglect and the loss of his mother, fueling his explosive outburst and accusations.',
        ap.emotional_tags = ["britannicus is consumed by raw anguish", "resentment. outwardly, he displays intense anger", "defiance, his voice raised", "his words sharp. beneath the surface, he is deeply wounded, feeling betrayed", "unloved by his father. there is a palpable tension between his princely pride", "the deep-seated pain of past neglect", "the loss of his mother, fueling his explosive outburst", "accusations.", "britannicus is consumed by raw anguish and resentment. outwardly", "he displays intense anger and defiance", "his voice raised and his words sharp. beneath the surface", "he is deeply wounded", "feeling betrayed and unloved by his father. there is a palpable tension between his princely pride and the deep-seated pain of past neglect and the loss of his mother", "fueling his explosive outburst and accusations."],
        ap.active_plans = ["Refuse to apologize to Nero, asserting his dignity and rejecting Agrippinilla's imposed authority.", "Voice his deep-seated resentment towards Claudius for perceived favoritism and constant siding with Agrippinilla and Nero.", "Express the profound pain of his mother's murder, directly accusing Claudius to wound him emotionally and expose his perceived cruelty."],
        ap.beliefs = ["He believes he is consistently treated unfairly and unjustly by Claudius in favor of Nero, fueled by Agrippinilla's manipulation.", "He believes Agrippinilla is deliberately provoking and humiliating him, seeking to diminish his status and authority.", "He believes Claudius is responsible for his mother's death and fundamentally incapable of genuine paternal affection or justice towards him."],
        ap.goals = ["Short-term: Express his rage and pain, refusing to be demeaned and forced into a false apology.", "Medium-term: Force Claudius to acknowledge his hurt and recognize the injustice he feels, seeking some form of paternal validation.", "Ultimate: Though not explicitly stated here, his underlying goal is to reclaim his birthright and avenge the injustices against him and his mother, challenging Nero's claim and Agrippinilla's influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits on his throne, observing the escalating tension. He initially attempts to mediate by weakly asking Britannicus to apologize, but quickly yields to Agrippinilla\'s insistence, firmly ordering Britannicus to comply. He appears weary and detached, avoiding direct confrontation and seeking the easiest path to restore superficial calm, even at Britannicus\'s expense.',
        ap.emotional_state = 'Claudius presents a facade of weariness and detachment, stammering and quickly agreeing with Agrippinilla to quell the immediate conflict. Internally, he is likely experiencing a complex mix of guilt, sadness, and resignation. He is aware of Britannicus\'s pain and the injustice of his actions but seems emotionally and politically unable to truly confront Agrippinilla or offer genuine support to his son. There\'s an underlying sense of helplessness and a preference for avoiding immediate conflict over addressing deeper familial wounds.',
        ap.emotional_tags = ["claudius presents a facade of weariness", "detachment, stammering", "quickly agreeing with agrippinilla to quell the immediate conflict. internally, he is likely experiencing a complex mix of guilt, sadness,", "resignation. he is aware of britannicus's pain", "the injustice of his actions but seems emotionally", "politically unable to truly confront agrippinilla or offer genuine support to his son. there's an underlying sense of helplessness", "a preference for avoiding immediate conflict over addressing deeper familial wounds.", "claudius presents a facade of weariness and detachment", "stammering and quickly agreeing with agrippinilla to quell the immediate conflict. internally", "he is likely experiencing a complex mix of guilt", "sadness", "and resignation. he is aware of britannicus's pain and the injustice of his actions but seems emotionally and politically unable to truly confront agrippinilla or offer genuine support to his son. there's an underlying sense of helplessness and a preference for avoiding immediate conflict over addressing deeper familial wounds.", "claudius presents a facade of weariness and detachment, stammering and quickly agreeing with agrippinilla to quell the immediate conflict. internally, he is likely experiencing a complex mix of guilt, sadness, and resignation. he is aware of britannicus's pain and the injustice of his actions", "seems emotionally and politically unable to truly confront agrippinilla or offer genuine support to his son. there's an underlying sense of helplessness and a preference for avoiding immediate conflict over addressing deeper familial wounds."],
        ap.active_plans = ["Restore immediate peace and order in the bedroom, prioritizing a quick resolution over addressing the emotional core of the conflict.", "Appease Agrippinilla by siding with her and enforcing her demands, maintaining a superficial harmony in their relationship.", "Avoid directly engaging with Britannicus's emotional outburst and accusations, opting for a simple command to apologize and end the scene swiftly."],
        ap.beliefs = ["He believes maintaining outward peace and avoiding immediate conflict is paramount, even if it means sacrificing Britannicus's emotional well-being.", "He believes it is politically safer and easier to appease Agrippinilla than to challenge her authority, even if it comes at Britannicus's cost.", "He believes he is nearing his end and is resigned to the unfolding events, perhaps seeing this familial discord as part of a larger, inevitable fate."],
        ap.goals = ["Short-term: End the argument quickly, restoring surface-level calm and quiet in the imperial chamber.", "Medium-term: Preserve a fragile peace within the family for his remaining time, avoiding further escalations and Agrippinilla's displeasure.", "Ultimate: (Though not explicit in this event) Implement his grand plan concerning Nero and Britannicus based on prophecy, even if it necessitates causing Britannicus immediate pain and misunderstanding."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands dominantly before Claudius and Britannicus, orchestrating the confrontation with calculated precision. She pointedly corrects Britannicus\'s address of Nero, demanding an apology with imperious insistence. Her posture is assertive, her gaze fixed on Britannicus, demonstrating her unwavering control and intent to assert Nero\'s superiority.',
        ap.emotional_state = 'Agrippinilla outwardly displays controlled anger and imperiousness, her tone sharp and demanding as she insists on Britannicus\'s apology. Internally, she is likely experiencing a mix of triumph and cold satisfaction. Triumph at her ability to manipulate Claudius and assert dominance over Britannicus, and satisfaction in further diminishing Britannicus\'s standing while elevating Nero. Her unspoken motivation is to crush any hint of challenge to Nero\'s authority and solidify her own power through him, viewing Britannicus as a persistent irritant to be subdued.',
        ap.emotional_tags = ["agrippinilla outwardly displays controlled anger", "imperiousness, her tone sharp", "demanding as she insists on britannicus's apology. internally, she is likely experiencing a mix of triumph", "cold satisfaction. triumph at her ability to manipulate claudius", "assert dominance over britannicus,", "satisfaction in further diminishing britannicus's standing while elevating nero. her unspoken motivation is to crush any hint of challenge to nero's authority", "solidify her own power through him, viewing britannicus as a persistent irritant to be subdued.", "agrippinilla outwardly displays controlled anger and imperiousness", "her tone sharp and demanding as she insists on britannicus's apology. internally", "she is likely experiencing a mix of triumph and cold satisfaction. triumph at her ability to manipulate claudius and assert dominance over britannicus", "and satisfaction in further diminishing britannicus's standing while elevating nero. her unspoken motivation is to crush any hint of challenge to nero's authority and solidify her own power through him", "viewing britannicus as a persistent irritant to be subdued.", "agrippinilla outwardly displays controlled anger and imperiousness, her tone sharp and demanding as she insists on britannicus's apology. internally, she is likely experiencing a mix of triumph and cold satisfaction. triumph at her ability to manipulate claudius and assert dominance over britannicus, and satisfaction in further diminishing britannicus's standing", "elevating nero. her unspoken motivation is to crush any hint of challenge to nero's authority and solidify her own power through him, viewing britannicus as a persistent irritant to be subdued."],
        ap.active_plans = ["Force a public humiliation of Britannicus by demanding an apology to Nero, reinforcing Nero's superior status within the family.", "Assert her authority over both Britannicus and Claudius, demonstrating her control within the imperial household and their obedience to her will.", "Provoke a strong reaction from Britannicus to highlight his emotional instability and perceived unsuitability to rule, further contrasting him with Nero's (feigned) calmness."],
        ap.beliefs = ["She believes Nero is inherently superior to Britannicus and rightfully deserves all deference and respect as the designated heir.", "She believes Britannicus poses a constant threat to Nero's ascension and must be systematically diminished, humiliated, and controlled to prevent any challenge.", "She believes Claudius is weak and easily manipulated, and she can leverage his weakness to enforce her will and achieve her objectives within the family and the empire."],
        ap.goals = ["Short-term: Force Britannicus into public submission and apology, immediately asserting Nero's dominance and her own authority.", "Medium-term: Systematically undermine Britannicus's standing and influence within the court, solidifying Nero's position as the undisputed heir apparent.", "Ultimate: Secure Nero's unchallenged succession to the throne, ensuring her continued power and control over Rome through her son, eliminating any potential threats from Britannicus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Nero initially stands passively beside Agrippinilla, allowing her to lead the confrontation. When Britannicus\'s outburst intensifies, Nero interjects with a seemingly conciliatory gesture, expressing \'sorrow\' and proposing to \'pacify\' Britannicus with Octavia. He adopts a posture of feigned humility and kindness, contrasting sharply with Agrippinilla\'s aggression and Britannicus\'s rage.',
        ap.emotional_state = 'Nero outwardly projects an image of calmness and even kindness, feigning regret for causing distress and offering a gesture of reconciliation. Internally, he is likely observing and learning from his mother\'s manipulative tactics, while also enjoying Britannicus\'s humiliation and his own elevated status. Beneath the surface charm, there\'s a nascent sense of superiority and a growing awareness of the power dynamics at play. His unspoken motivation is to present himself as virtuous and likeable while subtly relishing Britannicus\'s downfall.',
        ap.emotional_tags = ["nero outwardly projects an image of calmness", "even kindness, feigning regret for causing distress", "offering a gesture of reconciliation. internally, he is likely observing", "learning from his mother's manipulative tactics, while also enjoying britannicus's humiliation", "his own elevated status. beneath the surface charm, there's a nascent sense of superiority", "a growing awareness of the power dynamics at play. his unspoken motivation is to present himself as virtuous", "likeable while subtly relishing britannicus's downfall.", "nero outwardly projects an image of calmness and even kindness", "feigning regret for causing distress and offering a gesture of reconciliation. internally", "he is likely observing and learning from his mother's manipulative tactics", "while also enjoying britannicus's humiliation and his own elevated status. beneath the surface charm", "there's a nascent sense of superiority and a growing awareness of the power dynamics at play. his unspoken motivation is to present himself as virtuous and likeable while subtly relishing britannicus's downfall.", "nero outwardly projects an image of calmness and even kindness, feigning regret for causing distress and offering a gesture of reconciliation. internally, he is likely observing and learning from his mother's manipulative tactics,", "also enjoying britannicus's humiliation and his own elevated status. beneath the surface charm, there's a nascent sense of superiority and a growing awareness of the power dynamics at play. his unspoken motivation is to present himself as virtuous and likeable", "subtly relishing britannicus's downfall."],
        ap.active_plans = ["Present himself as kind, forgiving, and reasonable to contrast with Agrippinilla's harshness and Britannicus's emotional volatility, gaining favor in Claudius's and Octavia's eyes.", "Offer a superficial gesture of reconciliation (visiting Britannicus with Octavia) to diffuse the immediate tension without genuine empathy or intent to resolve the underlying conflict.", "Use the situation to enhance his image as a mature and benevolent figure, further solidifying his perceived suitability as heir in contrast to Britannicus's emotional 'instability'."],
        ap.beliefs = ["He believes appearing kind and conciliatory is strategically advantageous, even if it is insincere, as it improves his public image and gains him favor.", "He believes he is destined for imperial power and should cultivate an image that aligns with leadership, contrasting with Britannicus's perceived flaws.", "He believes Agrippinilla's methods are effective and he should learn from her manipulations while adding his own touch of charm and calculated 'kindness' to enhance his appeal."],
        ap.goals = ["Short-term: Appear benevolent and peacemaking, diffusing immediate tension and gaining approval from Claudius and Octavia through feigned kindness.", "Medium-term: Cultivate a public image of virtue and reason, further solidifying his position as the favored heir and contrasting him favorably with Britannicus.", "Ultimate: Secure his succession to the throne and maintain power, utilizing manipulative charm and calculated displays of kindness as tools for political advancement, mirroring Agrippinilla's ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Nero stands poised and attentive, adopting an expression of faux sympathy while interjecting into the conversation. His posture is slightly open, with hands resting casually, yet his eyes glint with a mixture of calculated charm and underlying malice as he speaks of seeking out Britannicus.',
        ap.emotional_state = 'Nero outwardly portrays a façade of kindness and concern, but underneath lies a deep-seated resentment. He feels victimized and seeks validation through his performance, creating a dissonance between his surface-level compassion and true motivations, which are steeped in ambition and self-interest.',
        ap.emotional_tags = ["nero outwardly portrays a fa\u00e7ade of kindness", "concern, but underneath lies a deep-seated resentment. he feels victimized", "seeks validation through his performance, creating a dissonance between his surface-level compassion", "true motivations, which are steeped in ambition", "self-interest.", "nero outwardly portrays a fa\u00e7ade of kindness and concern", "but underneath lies a deep-seated resentment. he feels victimized and seeks validation through his performance", "creating a dissonance between his surface-level compassion and true motivations", "which are steeped in ambition and self-interest.", "nero outwardly portrays a fa\u00e7ade of kindness and concern,", "underneath lies a deep-seated resentment. he feels victimized and seeks validation through his performance, creating a dissonance between his surface-level compassion and true motivations, which are steeped in ambition and self-interest."],
        ap.active_plans = ["To present himself as magnanimous and caring, thereby reinforcing his position in the family hierarchy.", "To subtly manipulate the narrative of victimhood, framing himself as the one who bridges conflicts.", "To position himself advantageously in Agrippinilla's schemes, ensuring his future power by aligning with her ambitions."],
        ap.beliefs = ["Power is best maintained through manipulation and the appearance of generosity.", "Vulnerability is a weakness to be exploited rather than a trait to be embraced.", "Family ties are instruments of ambition, to be leveraged for personal gain."],
        ap.goals = ["Short-term: To pacify Britannicus and control the narrative around their rivalry.", "Medium-term: To solidify his place as a favored successor in the imperial line through strategic familial bonds.", "Ultimate: To secure absolute power over Rome, eliminating any threats to his reign, including Britannicus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands assertively, her posture radiating authority as she directs the conversation. She gestures toward Nero, reinforcing his role in seeking out Britannicus, and her eyes sparkle with ambition as she subtly guides the narrative to benefit her plans.',
        ap.emotional_state = 'Agrippinilla projects a veneer of maternal concern, yet beneath her calm exterior lies an insatiable ambition. Her intentions are duplicitous, as she uses praise for Nero to manipulate perceptions and further her own agenda, embodying a complex mix of affection and ruthless ambition.',
        ap.emotional_tags = ["agrippinilla projects a veneer of maternal concern, yet beneath her calm exterior lies an insatiable ambition. her intentions are duplicitous, as she uses praise for nero to manipulate perceptions", "further her own agenda, embodying a complex mix of affection", "ruthless ambition.", "agrippinilla projects a veneer of maternal concern", "yet beneath her calm exterior lies an insatiable ambition. her intentions are duplicitous", "as she uses praise for nero to manipulate perceptions and further her own agenda", "embodying a complex mix of affection and ruthless ambition."],
        ap.active_plans = ["To manipulate the dynamics between Nero and Britannicus to fracture their relationship further.", "To reinforce Nero's position by praising his actions, ensuring he remains aligned with her ambitions.", "To set the stage for a marriage proposal between Nero and Octavia, solidifying her control over the future of the empire."],
        ap.beliefs = ["Manipulation is a necessary tool in the pursuit of power and dominance.", "Familial bonds can be weaponized to achieve political ends.", "The perception of kindness can be a powerful facade to mask true intentions."],
        ap.goals = ["Short-term: To solidify Nero's perceived victimhood and set him up as a sympathetic figure.", "Medium-term: To orchestrate a marriage between Nero and Octavia for greater control over the imperial lineage.", "Ultimate: To erase Claudius's legacy and ensure her and Nero's dominance over the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits on his throne, his presence exuding a weary authority. He engages with Agrippinilla and the others, but his posture reflects fatigue and resignation. His words are measured, revealing a mind still sharp despite the physical toll of power.',
        ap.emotional_state = 'Claudius\'s outward demeanor is one of stoicism mixed with weariness. However, internally, he grapples with the consequences of his choices and the impending sense of doom. He feels the weight of his legacy and the manipulation from Agrippinilla, creating a sense of bitterness masked by his public composure.',
        ap.emotional_tags = ["claudius's outward demeanor is one of stoicism mixed with weariness. however, internally, he grapples with the consequences of his choices", "the impending sense of doom. he feels the weight of his legacy", "the manipulation from agrippinilla, creating a sense of bitterness masked by his public composure.", "claudius's outward demeanor is one of stoicism mixed with weariness. however", "internally", "he grapples with the consequences of his choices and the impending sense of doom. he feels the weight of his legacy and the manipulation from agrippinilla", "creating a sense of bitterness masked by his public composure."],
        ap.active_plans = ["To maintain an illusion of control over his family dynamics despite being manipulated.", "To protect Britannicus, albeit indirectly, through his decisions regarding Nero.", "To confront and reconcile the impending transition of power, ensuring his will is enacted."],
        ap.beliefs = ["Power dynamics are an intricate game, often requiring sacrifice and compromise.", "Legacy must be preserved, even in the face of personal betrayal and manipulation.", "Destiny is predetermined, and one must navigate the currents of fate with caution."],
        ap.goals = ["Short-term: To assert his authority while managing the tensions within his family.", "Medium-term: To ensure a smooth transition of power that preserves his legacy.", "Ultimate: To restore the Republic through the actions of Britannicus after his own demise."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands regally before Claudius in his imperial bedchamber, her posture perfectly poised and controlled. She initiates the conversation with a seemingly casual observation about Nero and Octavia\'s fondness, subtly maneuvering towards her strategic objective. Her movements are deliberate, each gesture designed to project confidence and command, ensuring she maintains the upper hand in this crucial exchange with the Emperor.',
        ap.emotional_state = 'On the surface, Agrippinilla exudes an air of poised confidence, her tone laced with calculated sweetness as she steers the conversation. Beneath this veneer of composure, however, a flicker of unease begins to stir. Claudius\'s unsettlingly eager agreement to her proposal throws her off balance, hinting at a level of awareness she hadn\'t anticipated. She is driven by a fierce ambition for Nero, yet a seed of paranoia is planted, questioning her absolute control over the Emperor.',
        ap.emotional_tags = ["on the surface", "agrippinilla exudes an air of poised confidence", "her tone laced with calculated sweetness as she steers the conversation. beneath this veneer of composure", "however", "a flicker of unease begins to stir. claudius's unsettlingly eager agreement to her proposal throws her off balance", "hinting at a level of awareness she hadn't anticipated. she is driven by a fierce ambition for nero", "yet a seed of paranoia is planted", "questioning her absolute control over the emperor."],
        ap.active_plans = ["Propose the marriage of Nero and Octavia to Claudius, framing it as a natural progression of their familial bonds.", "Observe Claudius's reaction carefully to gauge his true sentiments and any potential resistance to her plans.", "Reinforce the narrative of Nero's suitability and popularity to further persuade Claudius and solidify public perception."],
        ap.beliefs = ["Strategic marriages are essential tools for consolidating power and securing dynastic succession in Rome.", "Claudius, despite his imperial status, is fundamentally weak and easily manipulated to serve her ambitions.", "Nero's future as Emperor is her paramount goal, justifying any means necessary to achieve it."],
        ap.goals = ["Short-term: Secure Claudius's immediate and enthusiastic approval for the marriage proposal.", "Medium-term: Solidify Nero's position within the imperial family, further eclipsing Britannicus's claim.", "Ultimate: Establish Nero as the undisputed successor to Claudius, ensuring her family's enduring dominance over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Claudius sits upon his throne in his bedroom, a figure of weary resolve amidst the opulent setting. As Agrippinilla broaches the topic of marriage, he leans forward with an almost unsettling eagerness, preempting her proposal with an immediate and emphatic agreement. His eyes, though perhaps appearing unfocused, are sharp with observation, missing nothing as he orchestrates his own counter-maneuver within this carefully staged scene.',
        ap.emotional_state = 'Claudius outwardly presents a facade of compliant acquiescence, even appearing somewhat foolish in his eagerness to agree to Agrippinilla\'s unspoken request. Yet, beneath this carefully constructed guise, a complex mix of emotions churns. He is weary of the constant political games and betrayals, but also resolute in his hidden plan. There is a sense of grim amusement as he anticipates Agrippinilla\'s predictable ambition, masking his deeper, strategic intentions behind a veneer of seeming simplicity and resignation to fate.',
        ap.emotional_tags = ["claudius outwardly presents a facade of compliant acquiescence, even appearing somewhat foolish in his eagerness to agree to agrippinilla's unspoken request. yet, beneath this carefully constructed guise, a complex mix of emotions churns. he is weary of the constant political games", "betrayals, but also resolute in his hidden plan. there is a sense of grim amusement as he anticipates agrippinilla's predictable ambition, masking his deeper, strategic intentions behind a veneer of seeming simplicity", "resignation to fate.", "claudius outwardly presents a facade of compliant acquiescence", "even appearing somewhat foolish in his eagerness to agree to agrippinilla's unspoken request. yet", "beneath this carefully constructed guise", "a complex mix of emotions churns. he is weary of the constant political games and betrayals", "but also resolute in his hidden plan. there is a sense of grim amusement as he anticipates agrippinilla's predictable ambition", "masking his deeper", "strategic intentions behind a veneer of seeming simplicity and resignation to fate.", "claudius outwardly presents a facade of compliant acquiescence, even appearing somewhat foolish in his eagerness to agree to agrippinilla's unspoken request. yet, beneath this carefully constructed guise, a complex mix of emotions churns. he is weary of the constant political games and betrayals,", "also resolute in his hidden plan. there is a sense of grim amusement as he anticipates agrippinilla's predictable ambition, masking his deeper, strategic intentions behind a veneer of seeming simplicity and resignation to fate."],
        ap.active_plans = ["Anticipate and preempt Agrippinilla's marriage proposal to unsettle her and project an image of unexpected insight.", "Feign compliance and even enthusiasm to lull Agrippinilla into a false sense of security, masking his true agenda.", "Utilize this orchestrated agreement as a step in his larger plan to manipulate Nero's future reign and ultimately undermine the monarchy itself."],
        ap.beliefs = ["Prophecy dictates Nero's ascension, but also his destructive nature, which can be leveraged for a greater purpose.", "Monarchy is inherently flawed and detrimental to Rome's long-term stability, needing to be dismantled from within.", "He can use Agrippinilla's ambition and Nero's madness as instruments to achieve his own vision of restoring the Republic."],
        ap.goals = ["Short-term: Secure Agrippinilla's belief in her own manipulative prowess while concealing his counter-strategy.", "Medium-term: Guide Nero's reign in a way that exposes the flaws of monarchy and paves the way for its eventual rejection.", "Ultimate: Facilitate the restoration of the Republic, even posthumously, by setting in motion events that will lead to the end of imperial rule and the rise of a new Roman order, possibly through Britannicus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_6'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla stands assertively before Claudius, her posture rigid with confidence. She manipulates the conversation with carefully chosen words, her gestures deliberate as she navigates the emotional landscape of the room, gauging responses from Britannicus and Claudius.',
        ap.emotional_state = 'Agrippinilla exudes a façade of composure, but beneath it lies a simmering tension. She feels a mix of excitement for her power play and unease at Claudius’s unexpectedly swift compliance, sensing that his acquiescence might not be as genuine as it appears.',
        ap.emotional_tags = ["agrippinilla exudes a fa\u00e7ade of composure, but beneath it lies a simmering tension. she feels a mix of excitement for her power play", "unease at claudius\u2019s unexpectedly swift compliance, sensing that his acquiescence might not be as genuine as it appears.", "agrippinilla exudes a fa\u00e7ade of composure", "but beneath it lies a simmering tension. she feels a mix of excitement for her power play and unease at claudius\u2019s unexpectedly swift compliance", "sensing that his acquiescence might not be as genuine as it appears.", "agrippinilla exudes a fa\u00e7ade of composure,", "beneath it lies a simmering tension. she feels a mix of excitement for her power play and unease at claudius\u2019s unexpectedly swift compliance, sensing that his acquiescence might not be as genuine as it appears."],
        ap.active_plans = ["Propose the official adoption of Nero as joint heir to undermine Britannicus's position.", "Secure Claudius's agreement to her plans while maintaining the appearance of familial harmony.", "Reinforce her control over the narrative of the succession, framing it as a natural and beneficial move for the empire."],
        ap.beliefs = ["Power is best maintained through strategic manipulation and deception.", "Her son, Nero, is the rightful heir and should be positioned to rule.", "Familial loyalty is secondary to the ambition for power; alliances are mere tools."],
        ap.goals = ["Short-term: Gain Claudius\u2019s approval for the marriage of Nero and Octavia.", "Medium-term: Establish Nero as the legitimate successor, sidelining Britannicus.", "Ultimate: Secure her own legacy and power through her son\u2019s ascension to the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_6'})
    ON CREATE SET
        ap.current_status = 'Claudius sits on his throne, an imposing yet weary figure. His body language reflects fatigue, but his eyes glimmer with a keen awareness. He interrupts Agrippinilla, seemingly predicting her thoughts, emphasizing his control over the conversation.',
        ap.emotional_state = 'Claudius displays a surface level of resignation, but internally he wrestles with the implications of his actions. His rapid agreement to Agrippinilla’s proposal hints at a deeper strategy, masking his true intentions and casting doubt on his perceived folly.',
        ap.emotional_tags = ["claudius displays a surface level of resignation, but internally he wrestles with the implications of his actions. his rapid agreement to agrippinilla\u2019s proposal hints at a deeper strategy, masking his true intentions", "casting doubt on his perceived folly.", "claudius displays a surface level of resignation", "but internally he wrestles with the implications of his actions. his rapid agreement to agrippinilla\u2019s proposal hints at a deeper strategy", "masking his true intentions and casting doubt on his perceived folly.", "claudius displays a surface level of resignation,", "internally he wrestles with the implications of his actions. his rapid agreement to agrippinilla\u2019s proposal hints at a deeper strategy, masking his true intentions and casting doubt on his perceived folly."],
        ap.active_plans = ["Preempt Agrippinilla's full proposal to maintain an appearance of authority and control.", "Navigate the treacherous waters of familial loyalty while securing his legacy.", "Subtly manipulate the situation to ensure Britannicus is not permanently sidelined."],
        ap.beliefs = ["The future of Rome is written, and he is merely a player in a larger game.", "To be perceived as foolish can be a strategic advantage in political maneuvering.", "His actions must ultimately serve the greater good of the Republic, even if they appear self-serving."],
        ap.goals = ["Short-term: Manage the immediate fallout of Agrippinilla's proposal without alienating anyone.", "Medium-term: Ensure Britannicus\u2019s safety and position while allowing Nero to ascend.", "Ultimate: To restore the Republic\u2019s values through the chaos that is to come, positioning Britannicus as a future leader."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_7'})
    ON CREATE SET
        ap.current_status = 'Narcissus explodes into the imperial bedchamber, his voice a thunderclap in the opulent space. He paces before the reclining Emperor Claudius, gesticulating wildly with unrestrained fury. He is no longer the composed advisor, but a man consumed by disbelief and outrage, his movements sharp and accusatory as he confronts Claudius with the perceived folly of his decisions.',
        ap.emotional_state = 'On the surface, Narcissus is incandescent with rage, his voice laced with scorn and disbelief. Beneath this fury, there\'s a deep well of fear and betrayal. He feels personally affronted by Claudius\'s secrecy and horrified by the implications of his actions. His internal state is a maelstrom of anxiety for Claudius and Britannicus\'s safety, mixed with a profound sense of being undermined and disregarded as Claudius\'s most trusted advisor. Unspoken is his fear for his own future and the stability of Rome under Agrippinilla and Nero\'s influence.',
        ap.emotional_tags = ["on the surface, narcissus is incandescent with rage, his voice laced with scorn", "disbelief. beneath this fury, there's a deep well of fear", "betrayal. he feels personally affronted by claudius's secrecy", "horrified by the implications of his actions. his internal state is a maelstrom of anxiety for claudius", "britannicus's safety, mixed with a profound sense of being undermined", "disregarded as claudius's most trusted advisor. unspoken is his fear for his own future", "the stability of rome under agrippinilla", "nero's influence.", "on the surface", "narcissus is incandescent with rage", "his voice laced with scorn and disbelief. beneath this fury", "there's a deep well of fear and betrayal. he feels personally affronted by claudius's secrecy and horrified by the implications of his actions. his internal state is a maelstrom of anxiety for claudius and britannicus's safety", "mixed with a profound sense of being undermined and disregarded as claudius's most trusted advisor. unspoken is his fear for his own future and the stability of rome under agrippinilla and nero's influence."],
        ap.active_plans = ["To shock Claudius into recognizing the danger of his decisions regarding Nero's adoption and marriage.", "To understand the seemingly irrational motivations behind Claudius's choices, demanding a logical explanation.", "To persuade Claudius to reverse his decisions and reconsider the implications for Britannicus and the future of Rome, appealing to Claudius's sense of responsibility."],
        ap.beliefs = ["Claudius has made a catastrophic error in judgment, blinded by Agrippinilla's manipulations or his own weakness.", "Consultation with trusted advisors is paramount for sound imperial governance, and Claudius has violated this principle.", "Agrippinilla and Nero pose an existential threat to Claudius, Britannicus, and the very stability of the empire, driven by insatiable ambition and ruthlessness."],
        ap.goals = ["Short-term: To vent his immediate anger and frustration at Claudius's perceived betrayal and foolishness.", "Medium-term: To awaken Claudius to the grave danger he has placed himself and Britannicus in, prompting a change of course.", "Ultimate: To safeguard Claudius and Britannicus from Agrippinilla's machinations, preserving the Claudian lineage and ensuring a stable, just succession for Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_7'})
    ON CREATE SET
        ap.current_status = 'Claudius initially reclines, weary and seemingly detached, observing Narcissus\'s outburst with a hint of amusement. As Narcissus\'s fury escalates, Claudius shifts in posture, becoming more engaged and resolute. He rises slightly, meeting Narcissus\'s accusations with a calm, almost theatrical demeanor as he begins to unveil his secret plan. His movements become deliberate and measured, each gesture emphasizing the weight of his prophetic revelations.',
        ap.emotional_state = 'On the surface, Claudius projects an air of weary resignation, tinged with amusement at Narcissus\'s predictable outrage. Internally, he is controlled and purposeful, harboring a profound sense of tragic inevitability and a detached acceptance of his fate. Beneath this facade lies a complex mix of emotions: weariness from the burdens of empire, a calculating shrewdness in his deception, and a somber resolve to enact his grand, albeit risky, plan. Unspoken is a deep sorrow for the necessary pain he inflicts on Britannicus and perhaps a flicker of hope, however faint, that his plan will ultimately succeed in reshaping Rome\'s destiny.',
        ap.emotional_tags = ["on the surface, claudius projects an air of weary resignation, tinged with amusement at narcissus's predictable outrage. internally, he is controlled", "purposeful, harboring a profound sense of tragic inevitability", "a detached acceptance of his fate. beneath this facade lies a complex mix of emotions: weariness from the burdens of empire, a calculating shrewdness in his deception,", "a somber resolve to enact his grand, albeit risky, plan. unspoken is a deep sorrow for the necessary pain he inflicts on britannicus", "perhaps a flicker of hope, however faint, that his plan will ultimately succeed in reshaping rome's destiny.", "on the surface", "claudius projects an air of weary resignation", "tinged with amusement at narcissus's predictable outrage. internally", "he is controlled and purposeful", "harboring a profound sense of tragic inevitability and a detached acceptance of his fate. beneath this facade lies a complex mix of emotions: weariness from the burdens of empire", "a calculating shrewdness in his deception", "and a somber resolve to enact his grand", "albeit risky", "plan. unspoken is a deep sorrow for the necessary pain he inflicts on britannicus and perhaps a flicker of hope", "however faint", "that his plan will ultimately succeed in reshaping rome's destiny."],
        ap.active_plans = ["To reveal his carefully constructed plan to Narcissus, justifying his seemingly rash decisions and demonstrating his strategic foresight.", "To manipulate Narcissus's loyalty and outrage, enlisting him as a crucial accomplice in his scheme to protect Britannicus and restore the Republic.", "To assert control over the narrative, presenting himself not as a fool but as a cunning strategist guided by prophecy and a grand vision for Rome's future, thereby regaining Narcissus's respect and trust."],
        ap.beliefs = ["The Sibyl's prophecy is an immutable force, dictating the course of Roman history and the fates of its rulers; resistance is futile.", "Nero's reign is destined to be a tyrannical disaster, ultimately beneficial in destroying the concept of monarchy and paving the way for a Republic.", "Britannicus is the key to Rome's future, the destined restorer of the Republic, and must be protected at all costs, even through deception and sacrifice."],
        ap.goals = ["Short-term: To fully disclose his prophetic understanding and strategic plan to Narcissus, securing his understanding and cooperation.", "Medium-term: To ensure Nero's ascent to the throne and subsequent tyrannical rule, fulfilling the prophecy and dismantling the monarchy from within.", "Ultimate: To orchestrate the restoration of the Roman Republic through Britannicus, realizing his lifelong desire and leaving behind a legacy as the emperor who inadvertently paved the way for Rome's true freedom."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla sits in her lavishly decorated bedroom, her posture straight yet slightly agitated. Her hands gesticulate as she speaks, displaying a blend of eagerness and underlying tension. She engages with Pallas, her expression revealing an iron determination masked beneath a layer of elegance.',
        ap.emotional_state = 'Agrippinilla exhibits a fierce surface confidence as she commands the conversation. Yet beneath this facade lies a simmering anxiety, driven by her desire to control the unpredictable fate of Claudius and the empire. Her worries about Narcissus and Claudius\'s erratic nature reveal her internal conflict between ambition and fear.',
        ap.emotional_tags = ["agrippinilla exhibits a fierce surface confidence as she commands the conversation. yet beneath this facade lies a simmering anxiety, driven by her desire to control the unpredictable fate of claudius", "the empire. her worries about narcissus", "claudius's erratic nature reveal her internal conflict between ambition", "fear.", "agrippinilla exhibits a fierce surface confidence as she commands the conversation. yet beneath this facade lies a simmering anxiety", "driven by her desire to control the unpredictable fate of claudius and the empire. her worries about narcissus and claudius's erratic nature reveal her internal conflict between ambition and fear."],
        ap.active_plans = ["To expedite the execution of their plot against Claudius, necessitating swift and decisive action.", "To seek counsel from Locusta, a skilled poisoner, to ensure the success of their plan.", "To maintain control over Nero\u2019s development and influence, ensuring he aligns with her ambitions."],
        ap.beliefs = ["Power must be seized and secured quickly before circumstances change.", "Narcissus poses a significant threat to her plans due to his vigilance.", "Maternal influence over Nero is paramount to guarantee her lineage\u2019s dominance."],
        ap.goals = ["Short-term: To gather information and advice from Locusta regarding the execution of Claudius.", "Medium-term: To solidify Nero\u2019s position as the Emperor and ensure Claudius's removal.", "Ultimate: To establish a lasting dynasty through her son, eliminating any threats to their rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Pallas stands before Agrippinilla, his expression marked by concern and caution. His posture is slightly hunched, reflecting his apprehension about the gravity of their situation. He gestures subtly as he discusses Narcissus\'s watchful presence, indicating his awareness of the dangers surrounding their plot.',
        ap.emotional_state = 'Pallas\'s surface demeanor is calm, but his concern for the precariousness of their plans permeates his tone. Internally, he is anxious, wrestling with the implications of their actions and the potential fallout from Claudius\'s unpredictability. His worry about Agrippinilla\'s confidence in Nero adds to his sense of foreboding.',
        ap.emotional_tags = ["pallas's surface demeanor is calm, but his concern for the precariousness of their plans permeates his tone. internally, he is anxious, wrestling with the implications of their actions", "the potential fallout from claudius's unpredictability. his worry about agrippinilla's confidence in nero adds to his sense of foreboding.", "pallas's surface demeanor is calm", "but his concern for the precariousness of their plans permeates his tone. internally", "he is anxious", "wrestling with the implications of their actions and the potential fallout from claudius's unpredictability. his worry about agrippinilla's confidence in nero adds to his sense of foreboding.", "pallas's surface demeanor is calm,", "his concern for the precariousness of their plans permeates his tone. internally, he is anxious, wrestling with the implications of their actions and the potential fallout from claudius's unpredictability. his worry about agrippinilla's confidence in nero adds to his sense of foreboding."],
        ap.active_plans = ["To highlight the necessity of caution given the imminent threat posed by Narcissus.", "To suggest the involvement of Locusta to ensure their scheme's success.", "To navigate the treacherous dynamics of the court while supporting Agrippinilla's ambitions."],
        ap.beliefs = ["Careful planning is essential in the treacherous environment of the imperial court.", "Agrippinilla's ambition, while powerful, could lead to reckless decisions if not tempered with caution.", "Narcissus's loyalty to Claudius could unravel their plans if not addressed thoughtfully."],
        ap.goals = ["Short-term: To secure an alliance with Locusta to facilitate their poisoning plot.", "Medium-term: To maintain stability in their plans while mitigating the risks posed by Narcissus.", "Ultimate: To assist Agrippinilla in realizing her ambitions while ensuring his own survival and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla is seated regally in her opulent bedroom, surrounded by the trappings of power and wealth, yet her posture is tense, reflecting the gravity of the conversation. She leans forward, intently listening to Pallas, her gaze sharp and focused, as she absorbs the details of their treacherous plan. The flickering candlelight casts dancing shadows around her, mirroring the clandestine nature of her actions.',
        ap.emotional_state = 'Outwardly, Agrippinilla projects an image of resolute determination, her tone firm as she pushes for immediate action. However, beneath the surface, a current of anxiety runs through her. Claudius\'s unpredictable behavior and the lingering uncertainties about Nero\'s future command stir a deep unease within her. She masks her fear with a veneer of control, but her eagerness to proceed with the plot betrays a simmering desperation to secure her ambitions before circumstances shift against her.',
        ap.emotional_tags = ["outwardly, agrippinilla projects an image of resolute determination, her tone firm as she pushes for immediate action. however, beneath the surface, a current of anxiety runs through her. claudius's unpredictable behavior", "the lingering uncertainties about nero's future command stir a deep unease within her. she masks her fear with a veneer of control, but her eagerness to proceed with the plot betrays a simmering desperation to secure her ambitions before circumstances shift against her.", "outwardly", "agrippinilla projects an image of resolute determination", "her tone firm as she pushes for immediate action. however", "beneath the surface", "a current of anxiety runs through her. claudius's unpredictable behavior and the lingering uncertainties about nero's future command stir a deep unease within her. she masks her fear with a veneer of control", "but her eagerness to proceed with the plot betrays a simmering desperation to secure her ambitions before circumstances shift against her.", "outwardly, agrippinilla projects an image of resolute determination, her tone firm as she pushes for immediate action. however, beneath the surface, a current of anxiety runs through her. claudius's unpredictable behavior and the lingering uncertainties about nero's future command stir a deep unease within her. she masks her fear with a veneer of control,", "her eagerness to proceed with the plot betrays a simmering desperation to secure her ambitions before circumstances shift against her."],
        ap.active_plans = ["To swiftly engage Locusta's services to procure a lethal poison.", "To finalize the assassination plan with Pallas, ensuring all details are meticulously arranged.", "To maintain a facade of composure and control, both for Pallas and for her own psychological fortitude amidst the high stakes."],
        ap.beliefs = ["Claudius's unpredictable nature makes him a dangerous variable that must be eliminated quickly.", "Nero's ascension to Emperor is the only path to secure her power and legacy.", "Ruthless and decisive action, including murder, is justified to achieve her political objectives."],
        ap.goals = ["short-term\": \"To immediately contact and secure Locusta's assistance in acquiring poison.", "medium-term\": \"To successfully assassinate Claudius and ensure Nero's seamless transition to Emperor.", "ultimate\": \"To establish and maintain absolute power and control through Nero's reign, securing her dynastic ambitions and ensuring her lasting influence over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Pallas stands respectfully before Agrippinilla in her lavish bedroom, his posture conveying a mix of deference and concern. He is actively advising her, presenting the option of Locusta with cautious pragmatism. His face is etched with a thoughtful expression, indicating his careful consideration of the risks and implications of their conspiracy. He moves with a sense of urgency, yet remains composed as he delivers crucial information.',
        ap.emotional_state = 'Pallas is outwardly composed and professional, maintaining the demeanor of a concerned advisor. Internally, he is likely experiencing anxiety about the perilous nature of their plot and the potential repercussions if discovered. He expresses worry regarding Claudius\'s unpredictability and Nero\'s future control, suggesting a deep awareness of the instability and danger inherent in their actions. His pragmatic approach masks an underlying tension, reflecting the high stakes and moral ambiguity of his involvement.',
        ap.emotional_tags = ["pallas is outwardly composed", "professional, maintaining the demeanor of a concerned advisor. internally, he is likely experiencing anxiety about the perilous nature of their plot", "the potential repercussions if discovered. he expresses worry regarding claudius's unpredictability", "nero's future control, suggesting a deep awareness of the instability", "danger inherent in their actions. his pragmatic approach masks an underlying tension, reflecting the high stakes", "moral ambiguity of his involvement.", "pallas is outwardly composed and professional", "maintaining the demeanor of a concerned advisor. internally", "he is likely experiencing anxiety about the perilous nature of their plot and the potential repercussions if discovered. he expresses worry regarding claudius's unpredictability and nero's future control", "suggesting a deep awareness of the instability and danger inherent in their actions. his pragmatic approach masks an underlying tension", "reflecting the high stakes and moral ambiguity of his involvement."],
        ap.active_plans = ["To inform Agrippinilla about Locusta as a potential solution for their assassination plot.", "To assess Agrippinilla's confidence in Nero's future rule and subtly question her control over him.", "To maintain secrecy and discretion, quickly departing when Nero unexpectedly arrives to avoid detection and suspicion."],
        ap.beliefs = ["Locusta's skills are essential for the successful execution of their plan.", "Claudius poses an unpredictable threat that necessitates immediate and decisive action.", "Nero's temperament and future independence are potential vulnerabilities that could undermine Agrippinilla\u2019s long-term control."],
        ap.goals = ["short-term\": \"To effectively convey the information about Locusta and secure Agrippinilla's approval to proceed.", "medium-term\": \"To contribute to the successful assassination of Claudius and the smooth transition of power to Nero, ensuring stability in the short term.", "ultimate\": \"To maintain his influential position within the imperial court under Nero's rule, ensuring the continuation of his power and safeguarding his own interests within the new regime."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla sits poised in her luxurious bedroom, her sharp gaze focused on Pallas as he expresses concern about the risks surrounding their plans. She remains composed, articulating her determination to act swiftly, her voice steady despite the undercurrents of tension in the room. When Nero enters, she shifts her attention to him, attempting to comfort and manipulate his emotions through a mix of maternal affection and strategic reassurance.',
        ap.emotional_state = 'On the surface, Agrippinilla exudes a calm and maternal demeanor, but beneath lies a layer of anxiety as she grapples with her son’s unpredictability and the potential threat posed by Claudius. She is driven by ambition, yet there’s an underlying tension in her interactions with both Pallas and Nero, a sense of urgency that colors her motivations and concerns about their precarious position.',
        ap.emotional_tags = ["on the surface, agrippinilla exudes a calm", "maternal demeanor, but beneath lies a layer of anxiety as she grapples with her son\u2019s unpredictability", "the potential threat posed by claudius. she is driven by ambition, yet there\u2019s an underlying tension in her interactions with both pallas", "nero, a sense of urgency that colors her motivations", "concerns about their precarious position.", "on the surface", "agrippinilla exudes a calm and maternal demeanor", "but beneath lies a layer of anxiety as she grapples with her son\u2019s unpredictability and the potential threat posed by claudius. she is driven by ambition", "yet there\u2019s an underlying tension in her interactions with both pallas and nero", "a sense of urgency that colors her motivations and concerns about their precarious position.", "on the surface, agrippinilla exudes a calm and maternal demeanor,", "beneath lies a layer of anxiety as she grapples with her son\u2019s unpredictability and the potential threat posed by claudius. she is driven by ambition, yet there\u2019s an underlying tension in her interactions with both pallas and nero, a sense of urgency that colors her motivations and concerns about their precarious position."],
        ap.active_plans = ["To secure the necessary advice and assistance for her plans against Claudius, particularly by consulting Locusta.", "To manipulate Nero's emotions, redirecting his frustrations away from her schemes while maintaining her control over him.", "To ensure her son remains focused on his future as emperor, avoiding any distractions that could derail their ambitions."],
        ap.beliefs = ["That her ambition and cunning are justified for the sake of her son's future and their family's power.", "That Claudius's unpredictability poses a significant threat to her plans and ambitions.", "That her maternal instincts can be leveraged to manipulate Nero effectively, ensuring his loyalty and focus."],
        ap.goals = ["Short-term: To obtain the necessary support from Locusta to carry out her plan.", "Medium-term: To solidify Nero's claim to the throne and eliminate Claudius as a threat.", "Ultimate: To ensure that her bloodline secures lasting power in Rome, rewriting the narrative of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Pallas stands before Agrippinilla with a furrowed brow, his posture tense as he delivers cautious advice regarding the risks of their plans. He acknowledges the threat Narcissus poses and offers solutions to mitigate it. Upon Nero\'s entrance, he bows slightly and removes himself from the room, recognizing the shifting dynamics and the need to protect his position in the court.',
        ap.emotional_state = 'Pallas exhibits a blend of concern and pragmatism, his voice tinged with anxiety as he navigates the dangerous waters of imperial intrigue. He understands the ramifications of Agrippinilla\'s ambitions and the potential for chaos. His internal conflict reflects a commitment to his role as an advisor, tempered by a desire to maintain safety and stability amidst the tumult of ambition.',
        ap.emotional_tags = ["pallas exhibits a blend of concern", "pragmatism, his voice tinged with anxiety as he navigates the dangerous waters of imperial intrigue. he understands the ramifications of agrippinilla's ambitions", "the potential for chaos. his internal conflict reflects a commitment to his role as an advisor, tempered by a desire to maintain safety", "stability amidst the tumult of ambition.", "pallas exhibits a blend of concern and pragmatism", "his voice tinged with anxiety as he navigates the dangerous waters of imperial intrigue. he understands the ramifications of agrippinilla's ambitions and the potential for chaos. his internal conflict reflects a commitment to his role as an advisor", "tempered by a desire to maintain safety and stability amidst the tumult of ambition."],
        ap.active_plans = ["To advise Agrippinilla on the necessity of consulting Locusta for their plans.", "To assess the risks posed by Narcissus and find ways to counteract his vigilance.", "To maintain a neutral stance with Nero, ensuring he does not alienate the future emperor while protecting Agrippinilla's ambitions."],
        ap.beliefs = ["That the political landscape in Rome is fraught with peril, demanding cautious and strategic maneuvering.", "That Nero's immaturity and impulsiveness could endanger their plans if not properly managed.", "That Agrippinilla's ambitions, while powerful, could lead to their downfall if not carefully navigated."],
        ap.goals = ["Short-term: To ensure Agrippinilla secures advice that will bolster their plans.", "Medium-term: To help guide Agrippinilla and Nero away from dangerous pitfalls within the imperial court.", "Ultimate: To maintain his position and influence in a court ruled by treachery and ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Nero enters the room with a restless energy, his movements reflecting agitation and displeasure. He expresses disdain for Pallas\'s presence, revealing his insecurity about his mother\'s confidants. As he interacts with Agrippinilla, he oscillates between petulance and a desire for affirmation, struggling to assert his position while grappling with feelings of rejection from Octavia.',
        ap.emotional_state = 'Nero\'s demeanor is a tumultuous mix of frustration and insecurity. Outwardly, he attempts to project authority as the emperor-elect, yet his vulnerability surfaces when he discusses Octavia, indicating deeper emotional conflicts. His antagonism towards Pallas underscores his struggle to navigate the complexities of power and the expectations placed upon him.',
        ap.emotional_tags = ["nero's demeanor is a tumultuous mix of frustration", "insecurity. outwardly, he attempts to project authority as the emperor-elect, yet his vulnerability surfaces when he discusses octavia, indicating deeper emotional conflicts. his antagonism towards pallas underscores his struggle to navigate the complexities of power", "the expectations placed upon him.", "nero's demeanor is a tumultuous mix of frustration and insecurity. outwardly", "he attempts to project authority as the emperor-elect", "yet his vulnerability surfaces when he discusses octavia", "indicating deeper emotional conflicts. his antagonism towards pallas underscores his struggle to navigate the complexities of power and the expectations placed upon him."],
        ap.active_plans = ["To assert his authority and express his dissatisfaction with his mother's advisor, Pallas.", "To seek validation from Agrippinilla regarding his feelings and position as the future emperor.", "To process his frustrations about Octavia and assert control over his personal life."],
        ap.beliefs = ["That he deserves to be treated with respect and authority as the emperor-elect, regardless of his age.", "That Pallas's influence is a threat to his position and autonomy.", "That maternal support from Agrippinilla is crucial for navigating his tumultuous emotions and ambitions."],
        ap.goals = ["Short-term: To gain reassurance and support from Agrippinilla regarding his feelings of rejection.", "Medium-term: To establish himself as an authoritative figure within the imperial court.", "Ultimate: To secure his power as emperor without interference, ensuring that no one challenges his authority, especially within his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla is seated in her lavishly decorated bedroom, initially engaged in a clandestine conversation with Pallas. When Nero enters, she shifts her attention to him, adopting a maternal and comforting posture, listening intently to his complaints while subtly guiding the interaction.',
        ap.emotional_state = 'On the surface, Agrippinilla projects an image of calm control and maternal concern, soothing Nero\'s ego and dismissing his childish frustrations. However, beneath this facade, she is calculating and manipulative, using Nero\'s insecurities to reinforce her influence and solidify her control over him. There\'s an undercurrent of anxiety about Claudius\'s unpredictable nature and the reliability of her son.',
        ap.emotional_tags = ["on the surface, agrippinilla projects an image of calm control", "maternal concern, soothing nero's ego", "dismissing his childish frustrations. however, beneath this facade, she is calculating", "manipulative, using nero's insecurities to reinforce her influence", "solidify her control over him. there's an undercurrent of anxiety about claudius's unpredictable nature", "the reliability of her son.", "on the surface", "agrippinilla projects an image of calm control and maternal concern", "soothing nero's ego and dismissing his childish frustrations. however", "beneath this facade", "she is calculating and manipulative", "using nero's insecurities to reinforce her influence and solidify her control over him. there's an undercurrent of anxiety about claudius's unpredictable nature and the reliability of her son."],
        ap.active_plans = ["To finalize the plan to assassinate Claudius, using Locusta's expertise in poisons.", "To reassure Pallas about her control over Nero, ensuring their continued collaboration in her schemes.", "To manipulate Nero by validating his feelings of entitlement and insecurity, strengthening his dependence on her guidance and control."],
        ap.beliefs = ["Power is the ultimate goal, and any means are justified to achieve and maintain it.", "Nero is her instrument to wield power, and his reign must be secured at all costs.", "Emotional manipulation is a powerful tool to control others and achieve her objectives."],
        ap.goals = ["Short-term: Secure Pallas's commitment to the assassination plan and soothe Nero's immediate emotional distress.", "Medium-term: Maintain absolute control over Nero's actions and decisions once he becomes Emperor.", "Ultimate: Establish a lasting dynasty under her and Nero's rule, ensuring her enduring legacy and power within Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Nero bursts into Agrippinilla\'s bedroom, restless and visibly upset. He paces and complains about being locked out by Octavia, displaying petulant behavior and demanding attention. He seeks solace and validation from his mother, oscillating between childish frustration and grand pronouncements of his future imperial power.',
        ap.emotional_state = 'Nero is emotionally volatile and insecure. He is outwardly angry and frustrated by Octavia\'s rejection, revealing a deep-seated need for control and validation. Internally, he is childishly hurt and seeks comfort from Agrippinilla. His bravado about being Emperor masks underlying anxieties about his own authority and worth.',
        ap.emotional_tags = ["nero is emotionally volatile", "insecure. he is outwardly angry", "frustrated by octavia's rejection, revealing a deep-seated need for control", "validation. internally, he is childishly hurt", "seeks comfort from agrippinilla. his bravado about being emperor masks underlying anxieties about his own authority", "worth.", "nero is emotionally volatile and insecure. he is outwardly angry and frustrated by octavia's rejection", "revealing a deep-seated need for control and validation. internally", "he is childishly hurt and seeks comfort from agrippinilla. his bravado about being emperor masks underlying anxieties about his own authority and worth."],
        ap.active_plans = ["To seek comfort and sympathy from Agrippinilla after his marital rejection.", "To assert his dominance and entitlement as the future Emperor, demanding respect and control.", "To express his jealousy and suspicion regarding Pallas's presence, testing his mother's loyalty and boundaries."],
        ap.beliefs = ["As the Emperor-elect, he is entitled to immediate gratification and unquestioning obedience.", "His mother, Agrippinilla, is his primary source of emotional support and guidance.", "Power means the absence of any constraints on his desires and actions."],
        ap.goals = ["Short-term: Receive reassurance and validation from Agrippinilla, alleviating his immediate frustration and hurt feelings.", "Medium-term: Establish dominance over Octavia and anyone who challenges his authority, reinforcing his sense of power.", "Ultimate: Reign as an all-powerful Emperor, free from any constraints and universally feared and obeyed, fulfilling his sense of entitlement and grandiosity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Agrippinilla reclines in her opulent bedroom, her sharp intellect and ambition on full display as she converses with Pallas. Her posture is commanding, and every gesture is measured, reflecting her authority and the underlying tension of their discussion about the precarious state of her power.',
        ap.emotional_state = 'Agrippinilla exudes a facade of calm, yet beneath the surface, anxiety simmers. She is concerned about Claudius\'s unpredictability and her son’s future, feeling the weight of impending doom, but her resolve to manipulate the situation reveals a fierce determination buried under maternal instinct.',
        ap.emotional_tags = ["agrippinilla exudes a facade of calm, yet beneath the surface, anxiety simmers. she is concerned about claudius's unpredictability", "her son\u2019s future, feeling the weight of impending doom, but her resolve to manipulate the situation reveals a fierce determination buried under maternal instinct.", "agrippinilla exudes a facade of calm", "yet beneath the surface", "anxiety simmers. she is concerned about claudius's unpredictability and her son\u2019s future", "feeling the weight of impending doom", "but her resolve to manipulate the situation reveals a fierce determination buried under maternal instinct.", "agrippinilla exudes a facade of calm, yet beneath the surface, anxiety simmers. she is concerned about claudius's unpredictability and her son\u2019s future, feeling the weight of impending doom,", "her resolve to manipulate the situation reveals a fierce determination buried under maternal instinct."],
        ap.active_plans = ["To eliminate Claudius by seeking the assistance of Locusta for poison.", "To reinforce her influence over Nero, ensuring he perceives her as his only true ally.", "To navigate the political landscape carefully, maintaining control of the narrative surrounding her son and his future as emperor."],
        ap.beliefs = ["Power must be seized and held tightly, not merely inherited.", "Maternal instincts are a tool to manipulate and control her son\u2019s ambitions.", "Trust is a dangerous commodity in the court; only the strongest survive."],
        ap.goals = ["Short-term: To secure poison for Claudius to eliminate him as a threat.", "Medium-term: To solidify Nero's position as emperor, ensuring her control over his reign.", "Ultimate: To erase Claudius's legacy entirely and establish a powerful dynasty through her son."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Nero enters Agrippinilla\'s bedroom, restless and petulant, his youthful energy clashing with the serious undertones of the conversation. He shifts uneasily, revealing his discontent and frustration with Octavia, the weight of impending power evident in his body language.',
        ap.emotional_state = 'Nero\'s surface demeanor is one of agitation and frustration, stemming from his conflict with Octavia. Internally, he is grappling with feelings of entitlement and insecurity, as he yearns for control while being acutely aware of his vulnerability in his current status as emperor-elect.',
        ap.emotional_tags = ["nero's surface demeanor is one of agitation", "frustration, stemming from his conflict with octavia. internally, he is grappling with feelings of entitlement", "insecurity, as he yearns for control while being acutely aware of his vulnerability in his current status as emperor-elect.", "nero's surface demeanor is one of agitation and frustration", "stemming from his conflict with octavia. internally", "he is grappling with feelings of entitlement and insecurity", "as he yearns for control while being acutely aware of his vulnerability in his current status as emperor-elect.", "nero's surface demeanor is one of agitation and frustration, stemming from his conflict with octavia. internally, he is grappling with feelings of entitlement and insecurity, as he yearns for control", "being acutely aware of his vulnerability in his current status as emperor-elect."],
        ap.active_plans = ["To assert his autonomy and establish dominance over his household and future reign.", "To confront Agrippinilla about her dealings, expressing his disapproval of Pallas.", "To solidify his sense of identity as emperor, distancing himself from perceived weakness."],
        ap.beliefs = ["He is destined to rule and deserves to have his desires met without opposition.", "Maternal affection is a shield against the cruelty of the world, but it should not undermine his authority.", "He must eliminate any rivals or perceived threats to consolidate his power."],
        ap.goals = ["Short-term: To resolve his conflict with Octavia and reassert his control.", "Medium-term: To eliminate any threats to his authority, including Pallas.", "Ultimate: To establish himself as a tyrant who does as he pleases, free from maternal influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius stands before the Roman Senate, adorned in his formal robes, his physical presence marked by a visible frailty. Despite his weakened state, he maintains a resolute posture, addressing the senators directly. His gestures are minimal yet deliberate, each movement underscoring the gravity of his words as he announces his departure from imperial duties, his voice resonating with the authority of his office despite its wavering quality.',
        ap.emotional_state = 'Claudius outwardly projects a weary resignation, his tone tinged with finality as he declares his farewell. Beneath this surface acceptance, a deeper current of disillusionment and introspection flows. He is emotionally detached, hinting at a profound weariness with the burdens of his reign and a sense of being unappreciated by the Senate. There\'s a poignant undercurrent of melancholy, mixed with a philosophical contemplation of mortality and the elusive nature of historical legacy, suggesting a man grappling with the end of his era.',
        ap.emotional_tags = ["claudius outwardly projects a weary resignation, his tone tinged with finality as he declares his farewell. beneath this surface acceptance, a deeper current of disillusionment", "introspection flows. he is emotionally detached, hinting at a profound weariness with the burdens of his reign", "a sense of being unappreciated by the senate. there's a poignant undercurrent of melancholy, mixed with a philosophical contemplation of mortality", "the elusive nature of historical legacy, suggesting a man grappling with the end of his era.", "claudius outwardly projects a weary resignation", "his tone tinged with finality as he declares his farewell. beneath this surface acceptance", "a deeper current of disillusionment and introspection flows. he is emotionally detached", "hinting at a profound weariness with the burdens of his reign and a sense of being unappreciated by the senate. there's a poignant undercurrent of melancholy", "mixed with a philosophical contemplation of mortality and the elusive nature of historical legacy", "suggesting a man grappling with the end of his era."],
        ap.active_plans = ["To deliver a formal farewell address to the Senate, clearly stating his intention to retire.", "To convey his weariness with the imperial role and subtly express his disillusionment with the political machinations of Rome.", "To hint at a hidden legacy or a deeper understanding of Rome that he believes will outlast the immediate judgments of his contemporaries, focusing on historical perception rather than present acclaim."],
        ap.beliefs = ["He believes his age and declining health render him unfit to continue ruling Rome effectively.", "He believes the Senate may not have genuinely valued his leadership or presence, suggesting a sense of isolation and underestimation.", "He believes that history will ultimately offer a more accurate and considered judgment of his reign and his actions than his contemporaries currently offer."],
        ap.goals = ["Short-term Goal: To effectively communicate his decision to retire to the Senate and ensure a peaceful transition of power, or at least set the stage for it.", "Medium-term Goal: To step down from his imperial duties and withdraw from the political arena, seeking personal peace and respite from the constant pressures of leadership.", "Ultimate Goal: To secure a legacy that transcends the immediate criticisms and misunderstandings of his time, hoping that future generations will recognize the deeper truths and complexities of his reign and his contributions to Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the Senate, looking frail but determined. His posture is slightly hunched, suggesting the weight of his years. As he speaks, his voice wavers, yet he maintains a steadfast presence, his gestures minimal yet purposeful, emphasizing his resignation. The atmosphere is charged with tension as dissenting voices echo around him.',
        ap.emotional_state = 'Claudius outwardly projects a sense of weary resignation, his tone reflecting the fatigue of both body and spirit. Beneath the surface, he grapples with deep introspection and a bittersweet acceptance of his legacy, recognizing that his time is drawing to a close. The unspoken conflicts of doubt and vulnerability linger within him as he addresses the Senate, aware of their veiled contempt and their insincere protests.',
        ap.emotional_tags = ["claudius outwardly projects a sense of weary resignation, his tone reflecting the fatigue of both body", "spirit. beneath the surface, he grapples with deep introspection", "a bittersweet acceptance of his legacy, recognizing that his time is drawing to a close. the unspoken conflicts of doubt", "vulnerability linger within him as he addresses the senate, aware of their veiled contempt", "their insincere protests.", "claudius outwardly projects a sense of weary resignation", "his tone reflecting the fatigue of both body and spirit. beneath the surface", "he grapples with deep introspection and a bittersweet acceptance of his legacy", "recognizing that his time is drawing to a close. the unspoken conflicts of doubt and vulnerability linger within him as he addresses the senate", "aware of their veiled contempt and their insincere protests."],
        ap.active_plans = ["To deliver what he perceives as his final farewell to the Senate, imparting his thoughts on mortality and legacy.", "To confront the reality of his declining health and the implications it has for his role as Emperor.", "To subtly challenge the Senate's views of him, shaping the narrative of how he wishes to be remembered after his departure."],
        ap.beliefs = ["The conviction that his age and health have diminished his effectiveness as a ruler, making him a relic of the past.", "The belief that history will ultimately judge him more favorably than the senators have in their current dissent.", "A deep-seated understanding that the ephemeral nature of power and life makes his impending death a release rather than a tragedy."],
        ap.goals = ["Short-term: To convey his thoughts on power and legacy to the Senate before his retirement.", "Medium-term: To shape his posthumous reputation, hoping for a more favorable historical narrative.", "Ultimate: To achieve a sense of peace and acceptance regarding his life and reign as Emperor, finding closure as he faces the end."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius stands before the Roman Senate, his figure appearing frail yet imbued with a quiet resolve. He is positioned centrally in the Senate House, facing the assembled senators who are arrayed in their formal robes. Though his physical presence is diminished by age and illness, his gestures remain deliberate as he delivers his valedictory address, his gaze sweeping across the chamber as he speaks of his impending departure.',
        ap.emotional_state = 'Claudius is profoundly weary, his voice tinged with resignation as he confesses his lack of ambition for the imperial throne and expresses a genuine longing for the peace of death. Beneath this weariness, there\'s a flicker of sardonic amusement and intellectual detachment as he anticipates history\'s judgment of him, contrasting it with the often shallow and self-serving opinions of his contemporaries. He is emotionally removed from the expected grandeur of his position, more concerned with historical truth than present accolades.',
        ap.emotional_tags = ["claudius is profoundly weary, his voice tinged with resignation as he confesses his lack of ambition for the imperial throne", "expresses a genuine longing for the peace of death. beneath this weariness, there's a flicker of sardonic amusement", "intellectual detachment as he anticipates history's judgment of him, contrasting it with the often shallow", "self-serving opinions of his contemporaries. he is emotionally removed from the expected grandeur of his position, more concerned with historical truth than present accolades.", "claudius is profoundly weary", "his voice tinged with resignation as he confesses his lack of ambition for the imperial throne and expresses a genuine longing for the peace of death. beneath this weariness", "there's a flicker of sardonic amusement and intellectual detachment as he anticipates history's judgment of him", "contrasting it with the often shallow and self-serving opinions of his contemporaries. he is emotionally removed from the expected grandeur of his position", "more concerned with historical truth than present accolades."],
        ap.active_plans = ["To formally announce his intention to effectively retire from his imperial duties, using the guise of a farewell speech to the Senate.", "To subtly communicate his disillusionment with the emperor's role and the political realities he has faced, expressing his personal truth regardless of senatorial expectations.", "To plant the seed of his legacy as a historian, hinting at the deeper, more lasting impact of his writings and historical perspectives beyond his reign, suggesting a 'resurrection' of Rome through his historical accounts."],
        ap.beliefs = ["He believes his ascension to Emperor was an error, an imposition against his true desires, highlighting a profound lack of personal ambition for power.", "He believes death is not to be feared but welcomed as a 'final curtain', a release from the burdens and pretenses of his imperial existence.", "He believes that true judgment and understanding will come from history, not from the fleeting opinions of his senators, placing greater value on posterity's view than contemporary praise."],
        ap.goals = ["Short-term: To deliver his farewell speech effectively and without succumbing to physical weakness, maintaining his dignity in his final address to the Senate.", "Medium-term: To relinquish the burdens of emperorship and transition into a state of peaceful retirement (implicitly, death), escaping the political turmoil and personal weariness.", "Ultimate: To ensure his true legacy is understood and appreciated by future generations through his historical writings, hoping to reveal a deeper, more authentic Rome beyond the superficial narratives of power and conquest."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands at the forefront of the Senate House, his frail frame clad in the imperial toga, a symbol of authority now tinged with vulnerability. His posture is resolute despite his wavering voice, as he addresses the assembled senators, a mix of respect and trepidation in their responses. He gestures subtly, evoking the weight of his words while closing his eyes momentarily, lost in the echoes of history.',
        ap.emotional_state = 'Claudius\'s surface emotions fluctuate between resignation and reflective introspection. He conveys a somber acceptance of his mortality, yet beneath that lies a profound sorrow and perhaps a flicker of pride as he contemplates his legacy. His thoughts appear tangled with doubts about how history will judge him, suggesting a deep-seated conflict between his public persona and private fears.',
        ap.emotional_tags = ["claudius's surface emotions fluctuate between resignation", "reflective introspection. he conveys a somber acceptance of his mortality, yet beneath that lies a profound sorrow", "perhaps a flicker of pride as he contemplates his legacy. his thoughts appear tangled with doubts about how history will judge him, suggesting a deep-seated conflict between his public persona", "private fears.", "claudius's surface emotions fluctuate between resignation and reflective introspection. he conveys a somber acceptance of his mortality", "yet beneath that lies a profound sorrow and perhaps a flicker of pride as he contemplates his legacy. his thoughts appear tangled with doubts about how history will judge him", "suggesting a deep-seated conflict between his public persona and private fears."],
        ap.active_plans = ["To deliver a farewell speech that encapsulates his reflections on legacy and mortality.", "To hint at his historical writings that may outlive him and reshape perceptions of Rome.", "To subtly confront the senators with the reality of his departure from power and the finality of death."],
        ap.beliefs = ["The importance of legacy and how history often diverges from contemporary opinions.", "The belief that his actions, particularly his historical writings, will reveal a truer version of Rome.", "The acceptance of mortality and the inevitability of judgment by both the living and the dead."],
        ap.goals = ["Short-term: To communicate his impending retirement and elicit a reaction from the Senate.", "Medium-term: To ensure that his writings contribute to a lasting legacy that may correct misperceptions of his reign.", "Ultimate: To find peace in his mortality, leaving behind a Rome understood beyond its surface."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the Senate, physically frail but with a core of resolute dignity. He delivers his farewell address, his voice wavering yet carrying the authority of his imperial office.  He pauses, closing his eyes, and is immediately plunged into a hallucinatory state, besieged by internal voices while remaining outwardly still before the senators.',
        ap.emotional_state = 'Outwardly, Claudius projects weariness and resignation, speaking of his age and ill health with detachment.  Beneath this surface, however, he is deeply troubled and insecure, haunted by the critical voices of his deceased predecessors. These internal voices amplify his anxieties about his reign and legacy, revealing a profound sense of inadequacy and the heavy burden of his lineage.  There\'s a palpable tension between his public performance of weary acceptance and his private turmoil.',
        ap.emotional_tags = ["outwardly, claudius projects weariness", "resignation, speaking of his age", "ill health with detachment.  beneath this surface, however, he is deeply troubled", "insecure, haunted by the critical voices of his deceased predecessors. these internal voices amplify his anxieties about his reign", "legacy, revealing a profound sense of inadequacy", "the heavy burden of his lineage.  there's a palpable tension between his public performance of weary acceptance", "his private turmoil.", "outwardly", "claudius projects weariness and resignation", "speaking of his age and ill health with detachment.  beneath this surface", "however", "he is deeply troubled and insecure", "haunted by the critical voices of his deceased predecessors. these internal voices amplify his anxieties about his reign and legacy", "revealing a profound sense of inadequacy and the heavy burden of his lineage.  there's a palpable tension between his public performance of weary acceptance and his private turmoil."],
        ap.active_plans = ["To deliver his final address to the Senate, formally announcing his departure from public life.", "To mentally confront and process the judgments of his ancestors, grappling with their criticisms of his reign.", "To seek a form of peace or resolution regarding his legacy as he anticipates his own death, hinted at by his mention of doing 'something' about history."],
        ap.beliefs = ["He believes his reign might have been a mistake, reflecting a deep-seated insecurity about his capabilities as Emperor.", "He believes history will inevitably judge him, demonstrating an awareness of the enduring power of historical narrative and legacy.", "He believes death offers a release from the burdens of his life and office, viewing the 'final curtain' with a sense of weary anticipation rather than fear."],
        ap.goals = ["Short-term Goal: To successfully conclude his farewell speech and formally relinquish his active role in Roman governance.", "Medium-term Goal: To somehow influence or shape his historical legacy, hinted at by his cryptic statement about having 'done something' regarding history.", "Ultimate Goal: To find peace in death and escape the relentless pressures and criticisms that have defined his reign and life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands frail yet resolute in the Senate House, his body trembling slightly but his posture is upright, embodying the weight of the office he has borne for so long. He speaks with a wavering voice, yet it carries a profound gravity, reflecting his internal struggle as he addresses the senators, their dismissive responses echoing around him.',
        ap.emotional_state = 'Claudius is a tapestry of vulnerability and resignation. Outwardly, he appears calm but reveals cracks of distress and introspection as he confronts his mortality and the looming finality of his reign. Internally, he grapples with feelings of inadequacy, regret, and a desire for understanding from those who have often disparaged him.',
        ap.emotional_tags = ["claudius is a tapestry of vulnerability", "resignation. outwardly, he appears calm but reveals cracks of distress", "introspection as he confronts his mortality", "the looming finality of his reign. internally, he grapples with feelings of inadequacy, regret,", "a desire for understanding from those who have often disparaged him.", "claudius is a tapestry of vulnerability and resignation. outwardly", "he appears calm but reveals cracks of distress and introspection as he confronts his mortality and the looming finality of his reign. internally", "he grapples with feelings of inadequacy", "regret", "and a desire for understanding from those who have often disparaged him.", "claudius is a tapestry of vulnerability and resignation. outwardly, he appears calm", "reveals cracks of distress and introspection as he confronts his mortality and the looming finality of his reign. internally, he grapples with feelings of inadequacy, regret, and a desire for understanding from those who have often disparaged him."],
        ap.active_plans = ["To deliver a farewell speech that encapsulates his reflection on leadership and legacy.", "To convey the importance of historical memory and the truth of his reign to the Senate.", "To express his resignation to the inevitable, revealing his acceptance of death and the impact of his rule."],
        ap.beliefs = ["That the truth of one's legacy often contrasts sharply with the perceptions held by contemporaries.", "That mortality is an inescapable destiny that even emperors must face.", "That history will ultimately reveal the essence of Rome and those who shaped it."],
        ap.goals = ["Short-term: To articulate his thoughts and feelings clearly in his final address.", "Medium-term: To ensure that his contributions to Rome are acknowledged and remembered correctly.", "Ultimate: To leave behind a legacy that reflects his true intentions and understanding of power, rather than the misinterpretations of his critics."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_1'})
    ON CREATE SET
        oi.description = 'The scrolls and maps that line the walls of Claudius\'s private study serve as silent witnesses to the emotionally charged confrontation between Claudius and Britannicus. They visually underscore the weight of history and imperial responsibility that Claudius carries, and against which Britannicus\'s youthful defiance is set. The maps, in particular, become narratively relevant as Claudius outlines his plan of exile to the remote parts of Britain, visually grounding the proposed escape route in the geography of the empire. The objects function as a backdrop that amplifies the gravity of the private conversation, highlighting the historical and strategic context of Claudius\'s desperate measures.',
        oi.status_before = 'The scrolls and maps are neatly arranged and displayed within Claudius\'s private study, representing his scholarly pursuits and strategic imperial concerns. They are static and serve as part of the room\'s ambiance, indicative of Claudius\'s intellectual and ruling persona.',
        oi.status_after = 'The scrolls and maps remain physically unchanged after the event, still lining the walls of the study. However, narratively, they are now imbued with the unspoken tension and tragic weight of the father-son confrontation. They have absorbed the emotional residue of the scene, becoming silent testaments to Claudius\'s agonizing decisions and Britannicus\'s defiant rejection, foreshadowing the unfolding tragedy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_2'})
    ON CREATE SET
        oi.description = 'The scrolls and maps lining the walls serve as silent witnesses to the intense emotional confrontation between Claudius and Britannicus. They symbolize Claudius\'s strategic concerns and the burden of leadership, contrasting the personal turmoil unfolding within the chamber. The scrolls likely contain records of imperial history and decrees, reflecting Claudius\'s persistent attempts to navigate the complexities of his reign even as familial bonds unravel.',
        oi.status_before = 'Prior to the event, the scrolls and maps are meticulously organized, representing Claudius\'s attempts to maintain control over his legacy and the empire\'s future.',
        oi.status_after = 'Following the confrontation, the scrolls and maps remain unchanged in their physical state, yet they become imbued with the weight of the emotional exchanges that transpired, serving as a reminder of the personal stakes behind political maneuvers.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_3'})
    ON CREATE SET
        oi.description = 'The scrolls and maps lining the walls of Claudius\'s private study serve as silent witnesses to the fraught exchange between father and son. They envelop the chamber, representing the vast empire and the weight of history that Claudius carries, a burden he attempts to pass on, or at least explain, to Britannicus. These objects, symbols of imperial power and knowledge, underscore the context of their conversation – a desperate attempt to secure a future amidst the treacherous currents of Roman politics, played out against the backdrop of Claudius\'s intellectual and strategic world.',
        oi.status_before = 'The scrolls and maps are neatly arranged within Claudius\'s private study, their usual place of storage and consultation. They are static elements of the room, representing Claudius\'s scholarly pursuits and his role as Emperor, holding within them the records and strategies of his reign and of Rome itself.',
        oi.status_after = 'The scrolls and maps remain physically unchanged in their location and arrangement. However, having borne witness to the intense emotional confrontation and the pivotal decisions made within their confines, they now carry a new, symbolic weight. They become imbued with the unspoken tensions and unresolved conflicts of this encounter, transforming from mere objects of knowledge into silent keepers of a deeply personal and historically consequential moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_4'})
    ON CREATE SET
        oi.description = 'The scrolls and maps lining Claudius\'s study serve as silent witnesses to the gravity of the conversation between father and son. They symbolize Claudius\'s role as an emperor, holding the weight of knowledge and strategy, while also highlighting the precarious balance of power within the empire. The surroundings amplify the tension, underscoring the strategic necessity of Claudius\'s plans for Brittanicus\'s safety and the future of Rome.',
        oi.status_before = 'The scrolls and maps are meticulously arranged, filled with historical accounts and strategic outlines reflecting Claudius\'s responsibilities and ambitions as Emperor.',
        oi.status_after = 'Post-event, the scrolls and maps remain unchanged in physical form, yet they now carry the weight of the dire conversations and decisions made within the chamber. They encapsulate the tension of impending changes in the empire, serving as a reminder of the stakes involved.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_5'})
    ON CREATE SET
        oi.description = 'The scrolls and maps lining the walls of Claudius\'s private study serve as a silent, imposing backdrop to the intense and private conversation between Claudius and Britannicus. They visually represent the weight of history and the vastness of the Roman Empire, underscoring the gravity of the decisions being discussed.  The maps, in particular, implicitly highlight the proposed exile to the edges of the known world, while the scrolls suggest the historical context and imperial legacy that both Claudius and Britannicus are grappling with. They are not directly manipulated or referenced in the dialogue, but their presence enriches the scene, grounding the personal drama within the larger context of Roman power and destiny, acting as silent witnesses to this pivotal confrontation.',
        oi.status_before = 'The scrolls and maps are neatly arranged and hung in Claudius\'s private study, organized and indicative of a space of imperial administration and scholarly pursuit. They are static elements of the room, representing Claudius\'s authority and intellectual interests before the emotional confrontation begins.',
        oi.status_after = 'The scrolls and maps remain physically unchanged after the event, still lining the walls of the study. However, they are now imbued with the residue of the intense emotional exchange and the fateful decisions made within their presence. They become silent witnesses to a critical turning point in the narrative, holding the unspoken weight of Britannicus\'s defiance and Claudius\'s weary resignation, now part of the room\'s narrative history.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_10_6'})
    ON CREATE SET
        oi.description = 'The scrolls and maps lining the study represent the strategic considerations of Claudius as he contemplates the political landscape. They serve as a backdrop to the conversation, emphasizing the weighty decisions at hand regarding Britannicus\'s future and the fate of Rome itself. Their presence underscores the tension between knowledge and the impending chaos of succession.',
        oi.status_before = 'The scrolls and maps are meticulously organized, symbols of Claudius\'s efforts to maintain control and strategize for the empire\'s future, reflecting his role as Emperor burdened by the consequences of his choices.',
        oi.status_after = 'Post-event, the scrolls and maps remain in their places, serving as silent witnesses to the emotional turmoil and critical decisions made during this pivotal confrontation. Their unchanged presence signifies the ongoing struggle for power and the unresolved tensions within the imperial family.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_10_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Claudius, weary and aged, is positioned within his private study, gesturing towards Britannicus to come closer. He speaks in hushed tones, emphasizing the need for secrecy by dismissing Narcissus. He is seated amidst scrolls and maps, props of his scholarly and imperial life, now backdrops to a painful paternal duty.',
        ap.emotional_state = 'Claudius is burdened by a deep weariness, tinged with resignation. Outwardly, he maintains a somber, fatherly tone, attempting to reason with Britannicus. Internally, he is wrestling with guilt over past neglect and the painful necessity of his current actions. He is driven by a fatalistic acceptance of prophecy, yet underneath lies a desperate, if flawed, paternal love struggling to surface, shadowed by fear and regret.',
        ap.emotional_tags = ["claudius is burdened by a deep weariness, tinged with resignation. outwardly, he maintains a somber, fatherly tone, attempting to reason with britannicus. internally, he is wrestling with guilt over past neglect", "the painful necessity of his current actions. he is driven by a fatalistic acceptance of prophecy, yet underneath lies a desperate, if flawed, paternal love struggling to surface, shadowed by fear", "regret.", "claudius is burdened by a deep weariness", "tinged with resignation. outwardly", "he maintains a somber", "fatherly tone", "attempting to reason with britannicus. internally", "he is wrestling with guilt over past neglect and the painful necessity of his current actions. he is driven by a fatalistic acceptance of prophecy", "yet underneath lies a desperate", "if flawed", "paternal love struggling to surface", "shadowed by fear and regret."],
        ap.active_plans = ["Explain his decision to alter his will in favor of Nero.", "Justify his past treatment of Britannicus as being for his protection.", "Persuade Britannicus to accept exile in Britain as a means of survival."],
        ap.beliefs = ["Prophecy dictates Nero's ascension to Emperor is inevitable.", "Nero poses a direct and lethal threat to Britannicus's life.", "Exile, though dishonorable in Britannicus's eyes, is the only viable path to ensure his son's survival."],
        ap.goals = ["Short-term: Communicate his altered will and exile plan to Britannicus.", "Medium-term: Secure Britannicus's agreement to go into exile to escape Nero's reach.", "Ultimate-term: Ensure Britannicus's long-term survival, hoping he can one day return to restore the Republic, even if it means sacrificing his immediate paternal desires."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Britannicus enters Claudius\'s study, initially responding to his father\'s summons with a degree of formal respect. He listens intently, but his posture shifts as Claudius reveals his intentions, becoming more confrontational and agitated. He stands before Claudius, youthfully defiant, his words laced with years of suppressed resentment and wounded pride.',
        ap.emotional_state = 'Britannicus is a tempest of raw, youthful emotion. On the surface, he displays a simmering anger and accusatory tone, directly challenging Claudius’s past actions and perceived favoritism. Internally, he is deeply wounded, feeling unloved and betrayed by his father. Beneath the anger, there is a profound yearning for paternal affection and recognition, battling with a burgeoning ambition and a fierce rejection of what he perceives as cowardly escape.',
        ap.emotional_tags = ["britannicus is a tempest of raw, youthful emotion. on the surface, he displays a simmering anger", "accusatory tone, directly challenging claudius\u2019s past actions", "perceived favoritism. internally, he is deeply wounded, feeling unloved", "betrayed by his father. beneath the anger, there is a profound yearning for paternal affection", "recognition, battling with a burgeoning ambition", "a fierce rejection of what he perceives as cowardly escape.", "britannicus is a tempest of raw", "youthful emotion. on the surface", "he displays a simmering anger and accusatory tone", "directly challenging claudius\u2019s past actions and perceived favoritism. internally", "he is deeply wounded", "feeling unloved and betrayed by his father. beneath the anger", "there is a profound yearning for paternal affection and recognition", "battling with a burgeoning ambition and a fierce rejection of what he perceives as cowardly escape."],
        ap.active_plans = ["Demand an explanation for Claudius's decision to favor Nero.", "Express the depth of his resentment and pain caused by Claudius's past neglect.", "Refuse the plan of exile, asserting his right to remain in Rome and claim his inheritance."],
        ap.beliefs = ["He is the rightful heir to the Roman throne by blood and lineage.", "Exile is an act of dishonor and weakness unbecoming of a Claudian.", "He possesses the strength and right to rule Rome directly, without hiding or fleeing."],
        ap.goals = ["Short-term: Confront Claudius and voice his grievances and claim to legitimacy.", "Medium-term: Persuade Claudius to acknowledge his right to rule and reverse the decision favoring Nero.", "Ultimate-term: Ascend to the throne of Rome as the rightful Emperor, ruling with the strength and honor he believes is his birthright, rejecting the Republic Claudius envisions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus is initially present in the study, standing as a silent, watchful presence alongside Claudius and Britannicus. He maintains a respectful distance, observant and ready to assist. Upon Claudius\'s directive, he promptly and silently withdraws from the chamber, demonstrating his unwavering obedience and discretion, though likely with concern etched on his face.',
        ap.emotional_state = 'Narcissus embodies steadfast loyalty and quiet apprehension. Outwardly, he is composed and dutiful, immediately obeying Claudius\'s command to leave. Internally, he is filled with concern for both Claudius and Britannicus, understanding the gravity of a private meeting between father and son at this critical juncture. He likely feels a sense of foreboding, knowing the court\'s treacherous nature and the potential dangers lurking for Britannicus.',
        ap.emotional_tags = ["narcissus embodies steadfast loyalty", "quiet apprehension. outwardly, he is composed", "dutiful, immediately obeying claudius's command to leave. internally, he is filled with concern for both claudius", "britannicus, understanding the gravity of a private meeting between father", "son at this critical juncture. he likely feels a sense of foreboding, knowing the court's treacherous nature", "the potential dangers lurking for britannicus.", "narcissus embodies steadfast loyalty and quiet apprehension. outwardly", "he is composed and dutiful", "immediately obeying claudius's command to leave. internally", "he is filled with concern for both claudius and britannicus", "understanding the gravity of a private meeting between father and son at this critical juncture. he likely feels a sense of foreboding", "knowing the court's treacherous nature and the potential dangers lurking for britannicus."],
        ap.active_plans = ["Carry out Claudius's instruction to leave immediately and without question.", "Remain readily available should Claudius require his presence or assistance later.", "Maintain vigilance outside the study, subtly ensuring the privacy and security of Claudius and Britannicus during their confidential discussion."],
        ap.beliefs = ["Unquestioning obedience to Claudius is paramount to his duty and loyalty.", "Britannicus is in a precarious position and requires careful protection from the court's dangers.", "Secrecy and discretion are essential to navigate the treacherous political landscape and safeguard Claudius's plans, whatever they may be."],
        ap.goals = ["Short-term: Ensure Claudius has the privacy he desires by leaving the study promptly.", "Medium-term: Continue to protect and support both Claudius and Britannicus in the face of growing threats.", "Ultimate-term: Secure the safety and well-being of the Claudian lineage and uphold the stability of the empire through loyal service and prudent action, even if it means acting from the shadows."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in his private study, weary from the weight of impending decisions. He gestures for Britannicus to approach, his posture slightly slumped, revealing exhaustion. His movements are deliberate yet strained as he attempts to convey the gravity of his intentions, holding the air thick with unspoken affection and paternal regret.',
        ap.emotional_state = 'Outwardly, Claudius displays a calm demeanor, masking the turmoil within. His face is lined with worry, but his tone is earnest. Internally, he grapples with guilt and the burden of past mistakes. His need to express love and explain his decisions clashes with the fear of Britannicus\'s wrath, revealing a father torn between duty and affection.',
        ap.emotional_tags = ["outwardly, claudius displays a calm demeanor, masking the turmoil within. his face is lined with worry, but his tone is earnest. internally, he grapples with guilt", "the burden of past mistakes. his need to express love", "explain his decisions clashes with the fear of britannicus's wrath, revealing a father torn between duty", "affection.", "outwardly", "claudius displays a calm demeanor", "masking the turmoil within. his face is lined with worry", "but his tone is earnest. internally", "he grapples with guilt and the burden of past mistakes. his need to express love and explain his decisions clashes with the fear of britannicus's wrath", "revealing a father torn between duty and affection.", "outwardly, claudius displays a calm demeanor, masking the turmoil within. his face is lined with worry,", "his tone is earnest. internally, he grapples with guilt and the burden of past mistakes. his need to express love and explain his decisions clashes with the fear of britannicus's wrath, revealing a father torn between duty and affection."],
        ap.active_plans = ["To explain his decision to alter his will in favor of Nero and provide clarity to Britannicus about his intentions.", "To protect Britannicus from Nero's potential wrath by planning an escape to Britain.", "To reconcile with Britannicus and foster a sense of loyalty, despite the harsh realities of their political landscape."],
        ap.beliefs = ["Believes that familial duty sometimes demands harsh decisions for the greater good.", "Holds a conviction that Britannicus\u2019s safety is paramount, even if it means sacrificing his position.", "Fears that the legacy of his family\u2019s madness could taint Britannicus and shape his destiny."],
        ap.goals = ["Short-term: To communicate his plan to Britannicus and ensure he understands the necessity of it.", "Medium-term: To safeguard Britannicus's life from the dangers posed by Nero\u2019s ascendance.", "Ultimate: To secure a future for Rome that aligns with the resurrection of the Republic, placing Britannicus in a position to fulfill that legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands before Claudius, his body tense with indignation. He confronts his father, moving closer with defiance. His gestures are emphatic, revealing the depth of his frustration and hurt, as he struggles to maintain a composure that is ultimately cracking under the weight of betrayal and desire for recognition.',
        ap.emotional_state = 'Surface emotions reveal a tempest of anger and betrayal, with clenched fists and a quivering voice as he accuses Claudius. Internally, he wrestles with feelings of inadequacy and rejection, simmering resentment toward his father. The combination of hurt from his past and his longing for paternal love creates an emotional conflict that he cannot reconcile.',
        ap.emotional_tags = ["surface emotions reveal a tempest of anger", "betrayal, with clenched fists", "a quivering voice as he accuses claudius. internally, he wrestles with feelings of inadequacy", "rejection, simmering resentment toward his father. the combination of hurt from his past", "his longing for paternal love creates an emotional conflict that he cannot reconcile.", "surface emotions reveal a tempest of anger and betrayal", "with clenched fists and a quivering voice as he accuses claudius. internally", "he wrestles with feelings of inadequacy and rejection", "simmering resentment toward his father. the combination of hurt from his past and his longing for paternal love creates an emotional conflict that he cannot reconcile."],
        ap.active_plans = ["To confront Claudius about his favoritism towards Nero and seek recognition.", "To express his deep-seated resentment and hurt over his mother's death and Claudius's actions.", "To reject Claudius's plan for exile, asserting his own desire for honor and a rightful chance at power."],
        ap.beliefs = ["Believes he is entitled to his father's love and recognition as the legitimate heir.", "Thinks that Claudius's favoritism towards Nero is a betrayal that cannot be overlooked.", "Is convinced that his identity as a Claudian grants him a rightful claim to power and respect."],
        ap.goals = ["Short-term: To voice his grievances against Claudius and demand acknowledgment.", "Medium-term: To reclaim his position as the rightful heir and challenge Nero\u2019s ascension.", "Ultimate: To restore the Republic and prove himself worthy of leadership in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Claudius, weary and burdened, sits in his candlelit study, gesturing for Britannicus to approach. He speaks in hushed tones, having dismissed Narcissus to ensure absolute secrecy. He attempts to explain his decision to alter his will, his physical presence conveying a mix of imperial authority and paternal vulnerability as he seeks to justify his complex choices to his son.',
        ap.emotional_state = 'Beneath a veneer of imperial composure, Claudius is deeply conflicted and emotionally strained. Outwardly, he tries to appear rational and explanatory, yet his stammer betrays his inner turmoil. Internally, he is wrestling with years of guilt and a late-blooming paternal affection, attempting to reconcile his political maneuvers with his personal feelings for Britannicus. He is driven by a desperate desire to protect his son, even if his methods are misconstrued and painful.',
        ap.emotional_tags = ["beneath a veneer of imperial composure, claudius is deeply conflicted", "emotionally strained. outwardly, he tries to appear rational", "explanatory, yet his stammer betrays his inner turmoil. internally, he is wrestling with years of guilt", "a late-blooming paternal affection, attempting to reconcile his political maneuvers with his personal feelings for britannicus. he is driven by a desperate desire to protect his son, even if his methods are misconstrued", "painful.", "beneath a veneer of imperial composure", "claudius is deeply conflicted and emotionally strained. outwardly", "he tries to appear rational and explanatory", "yet his stammer betrays his inner turmoil. internally", "he is wrestling with years of guilt and a late-blooming paternal affection", "attempting to reconcile his political maneuvers with his personal feelings for britannicus. he is driven by a desperate desire to protect his son", "even if his methods are misconstrued and painful."],
        ap.active_plans = ["To articulate the strategic reasoning behind favoring Nero in his will.", "To persuade Britannicus to accept exile in Britannia as a means of survival.", "To express a belated but genuine paternal love and seek reconciliation with Britannicus before his death."],
        ap.beliefs = ["He believes that destiny, or prophecy, dictates Nero's ascension to the throne.", "He believes exile is the only viable path to safeguard Britannicus from Nero's ambition.", "He believes in the eventual restoration of the Republic, even if it is a distant prospect."],
        ap.goals = ["{short_term: To have Britannicus understand and accept his explanation and plan for exile., medium_term: To secure Britannicus's long-term survival by facilitating his escape to Britannia., ultimate: To ensure the future stability of Rome, even if it means sacrificing his son's immediate claim to power and hoping for a republican resurgence.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Britannicus enters his father\'s study, approaching Claudius with a mixture of apprehension and defiance. He stands before the Emperor, listening initially, but soon his pent-up resentment erupts. He becomes physically animated, his voice rising as he confronts Claudius, challenging his decisions and expressing years of accumulated hurt and perceived neglect. He moves closer to Claudius during moments of emotional intensity, yet maintains a proud, unbroken posture.',
        ap.emotional_state = 'Britannicus is a tempest of raw, youthful emotion. Superficially, he displays anger, resentment, and a deep sense of betrayal, his words laced with bitterness and accusation. Internally, beneath the hardened exterior, lies a profound yearning for his father\'s love and recognition, a desire that clashes fiercely with his wounded pride and sense of injustice. He grapples with the pain of past neglect and the sting of perceived favoritism, fueling a volatile mix of hurt and defiance.',
        ap.emotional_tags = ["britannicus is a tempest of raw, youthful emotion. superficially, he displays anger, resentment,", "a deep sense of betrayal, his words laced with bitterness", "accusation. internally, beneath the hardened exterior, lies a profound yearning for his father's love", "recognition, a desire that clashes fiercely with his wounded pride", "sense of injustice. he grapples with the pain of past neglect", "the sting of perceived favoritism, fueling a volatile mix of hurt", "defiance.", "britannicus is a tempest of raw", "youthful emotion. superficially", "he displays anger", "resentment", "and a deep sense of betrayal", "his words laced with bitterness and accusation. internally", "beneath the hardened exterior", "lies a profound yearning for his father's love and recognition", "a desire that clashes fiercely with his wounded pride and sense of injustice. he grapples with the pain of past neglect and the sting of perceived favoritism", "fueling a volatile mix of hurt and defiance."],
        ap.active_plans = ["To voice his long-suppressed grievances and accusations against Claudius regarding his neglect and preference for Nero.", "To firmly reject Claudius's plan for exile, viewing it as cowardly and beneath his Claudian lineage.", "To assert his right to rule Rome and demand a chance to prove his worth as Emperor, directly challenging Claudius's will."],
        ap.beliefs = ["He believes he has been unjustly treated and deprived of paternal love and recognition by Claudius.", "He believes exile is an act of dishonor and weakness, incompatible with his identity as a Claudian prince.", "He believes in his own capability to rule Rome and that he deserves the opportunity to claim his birthright and govern as Emperor."],
        ap.goals = ["{short_term: To express his anger and pain directly to Claudius, making his father understand the depth of his hurt., medium_term: To be acknowledged as a man and heir, gaining the toga virilis and a chance to prove himself in Rome., ultimate: To ascend to the throne, rule Rome in his own right, and rectify what he perceives as the injustices of Claudius's reign and legacy.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at a desk, his weary figure illuminated by the flickering candlelight, gesturing for Britannicus to approach. His posture is one of both authority and fatigue, searching for the right words as he prepares to reveal a plan that weighs heavily on his mind.',
        ap.emotional_state = 'Surface emotions reveal Claudius\'s deep-seated anxiety and urgency. His voice carries the weight of paternal concern, yet there’s a tremor of guilt and fear as he confronts the consequences of his decisions. Internally, he grapples with remorse for past neglect towards Britannicus and the painful admission of his doubts about their relationship.',
        ap.emotional_tags = ["surface emotions reveal claudius's deep-seated anxiety", "urgency. his voice carries the weight of paternal concern, yet there\u2019s a tremor of guilt", "fear as he confronts the consequences of his decisions. internally, he grapples with remorse for past neglect towards britannicus", "the painful admission of his doubts about their relationship.", "surface emotions reveal claudius's deep-seated anxiety and urgency. his voice carries the weight of paternal concern", "yet there\u2019s a tremor of guilt and fear as he confronts the consequences of his decisions. internally", "he grapples with remorse for past neglect towards britannicus and the painful admission of his doubts about their relationship."],
        ap.active_plans = ["To explain his decision to alter his will in favor of Nero and the reasons behind it.", "To assure Britannicus of his love and commitment, despite past mistakes.", "To devise a plan to protect Britannicus from the impending threats posed by Nero."],
        ap.beliefs = ["Believes that family loyalty can sometimes mandate difficult decisions.", "Holds a conviction that Britannicus must be safeguarded from the dangers of ambition and jealousy.", "Recognizes the necessity of deceit and strategy in preserving the realm and family."],
        ap.goals = ["Short-term: To convince Britannicus of the reality of the threats he faces.", "Medium-term: To ensure Britannicus's safety by arranging for his exile to Britain.", "Ultimate: To secure a future for Rome that aligns with the ideals of the Republic, through Britannicus's eventual return."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands before Claudius, a mix of youthful defiance and palpable hurt on his face. His posture is tense, arms crossed, reflecting a deep emotional turmoil as he confronts his father for the first time about his feelings of betrayal and neglect.',
        ap.emotional_state = 'Outwardly, Britannicus radiates anger and disappointment, his voice sharp as he challenges Claudius. Beneath the surface, there’s a fragile yearning for paternal love and approval. His bitterness is compounded by the deep sense of injustice he feels regarding his mother’s fate, intensifying his internal conflict with feelings of betrayal and desire for recognition.',
        ap.emotional_tags = ["outwardly, britannicus radiates anger", "disappointment, his voice sharp as he challenges claudius. beneath the surface, there\u2019s a fragile yearning for paternal love", "approval. his bitterness is compounded by the deep sense of injustice he feels regarding his mother\u2019s fate, intensifying his internal conflict with feelings of betrayal", "desire for recognition.", "outwardly", "britannicus radiates anger and disappointment", "his voice sharp as he challenges claudius. beneath the surface", "there\u2019s a fragile yearning for paternal love and approval. his bitterness is compounded by the deep sense of injustice he feels regarding his mother\u2019s fate", "intensifying his internal conflict with feelings of betrayal and desire for recognition."],
        ap.active_plans = ["To confront Claudius about his past favoritism towards Nero.", "To express his feelings of neglect and demand recognition as the rightful heir.", "To reject the plan of exile, asserting his desire to fight for his place in Rome."],
        ap.beliefs = ["Believes that a true heir should confront challenges rather than hide from them.", "Holds a conviction that he deserves his rightful place as Emperor, regardless of his parentage.", "Thinks that loyalty to family should not come at the cost of personal honor and dignity."],
        ap.goals = ["Short-term: To gain affirmation and acknowledgment from Claudius.", "Medium-term: To refuse the plan for exile and assert his own strength and legitimacy.", "Ultimate: To reclaim his position as Emperor of Rome and restore honor to his family name."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands before his father in the dimly lit study, initially rigid with indignation and accusation. He paces slightly as he voices his long-held resentments, his posture shifting as Claudius attempts reconciliation. He remains physically present, confronting Claudius directly, unwavering in his refusal to accept exile, his youthful frame radiating defiance and burgeoning ambition.',
        ap.emotional_state = 'On the surface, Britannicus is a tempest of anger and hurt, his voice laced with acid as he throws accusations of neglect and past betrayals at Claudius. Beneath this fury, there\'s a deep well of wounded pride and a desperate yearning for paternal love that has been denied him. He grapples with the unspoken conflict of proving his worth as Claudius\'s son, overshadowed by Nero\'s adoption and preferential treatment, revealing a complex mix of rage, vulnerability, and ambition.',
        ap.emotional_tags = ["on the surface, britannicus is a tempest of anger", "hurt, his voice laced with acid as he throws accusations of neglect", "past betrayals at claudius. beneath this fury, there's a deep well of wounded pride", "a desperate yearning for paternal love that has been denied him. he grapples with the unspoken conflict of proving his worth as claudius's son, overshadowed by nero's adoption", "preferential treatment, revealing a complex mix of rage, vulnerability,", "ambition.", "on the surface", "britannicus is a tempest of anger and hurt", "his voice laced with acid as he throws accusations of neglect and past betrayals at claudius. beneath this fury", "there's a deep well of wounded pride and a desperate yearning for paternal love that has been denied him. he grapples with the unspoken conflict of proving his worth as claudius's son", "overshadowed by nero's adoption and preferential treatment", "revealing a complex mix of rage", "vulnerability", "and ambition."],
        ap.active_plans = ["Express the full extent of his resentment and pain at Claudius's past actions and perceived favoritism towards Nero.", "Reject Claudius's plan for exile in Britain, deeming it cowardly and dishonorable for a Claudian.", "Assert his right to be recognized as a man and demand his rightful place in Rome, directly challenging Nero for power."],
        ap.beliefs = ["Exile and hiding among barbarians is an unacceptable and shameful course of action for someone of his lineage.", "He possesses the strength and capability to confront Nero directly and secure his own destiny in Rome.", "The concept of a Republic is outdated and irrelevant; Rome needs a strong Emperor, and he believes he can be that Emperor."],
        ap.goals = ["short-term\": \"To make Claudius fully understand the depth of his hurt and resentment over years of perceived neglect and unfair treatment.", "medium-term\": \"To be officially recognized as a man by receiving the toga virilis, signaling his readiness to assume adult responsibilities and challenge Nero's claim.", "ultimate\": \"To rule Rome as Emperor in his own right, surpassing Nero and proving his worthiness to lead, thereby restoring his family's honor and legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Claudius sits wearily in his private study, gesturing for Britannicus to approach, his physical presence marked by a sense of resignation and age. He attempts to convey paternal concern, his movements slow and deliberate as he explains his difficult decisions and proposes a plan for Britannicus\'s safety. He reaches out to Britannicus, drawing him close in a belated, paternal embrace, a gesture of affection tinged with sorrow.',
        ap.emotional_state = 'Claudius projects an outward weariness and resignation, yet beneath the surface, he is driven by a deep-seated fear for Britannicus\'s life and a fatalistic acceptance of prophecy. He wrestles with the internal conflict between his political calculations, which favor Nero, and his belatedly awakened paternal feelings for Britannicus. Unspoken motivations include guilt over his past neglect of Britannicus and a desperate, if misguided, desire to protect his son in the only way he believes possible, even if it is misunderstood and rejected.',
        ap.emotional_tags = ["claudius projects an outward weariness", "resignation, yet beneath the surface, he is driven by a deep-seated fear for britannicus's life", "a fatalistic acceptance of prophecy. he wrestles with the internal conflict between his political calculations, which favor nero,", "his belatedly awakened paternal feelings for britannicus. unspoken motivations include guilt over his past neglect of britannicus", "a desperate, if misguided, desire to protect his son in the only way he believes possible, even if it is misunderstood", "rejected.", "claudius projects an outward weariness and resignation", "yet beneath the surface", "he is driven by a deep-seated fear for britannicus's life and a fatalistic acceptance of prophecy. he wrestles with the internal conflict between his political calculations", "which favor nero", "and his belatedly awakened paternal feelings for britannicus. unspoken motivations include guilt over his past neglect of britannicus and a desperate", "if misguided", "desire to protect his son in the only way he believes possible", "even if it is misunderstood and rejected."],
        ap.active_plans = ["To explain his rationale for altering his will in favor of Nero, attempting to justify his politically motivated decisions to Britannicus.", "To convince Britannicus of the necessity of exile in Britain, framing it as the only viable path to ensure his survival against the prophesied threat of Nero.", "To offer a semblance of paternal reconciliation and affection to Britannicus, attempting to bridge the emotional gap created by years of distance and perceived rejection, albeit in a tragically late and insufficient manner."],
        ap.beliefs = ["Nero's ascension to Emperor is predetermined by fate and prophecy, an unalterable course of events he must accept.", "Nero will inevitably become a dangerous and tyrannical ruler, posing a mortal threat to Britannicus's life.", "Exile in the remote parts of Britain is the only viable option to safeguard Britannicus from Nero's reach and secure a future for him, however distant and uncertain."],
        ap.goals = ["short-term\": \"To effectively communicate his complex plan to Britannicus, ensuring the young prince understands the perceived dangers and the intended protection offered by exile.", "medium-term\": \"To secure Britannicus's escape to Britain and his integration into the barbarian world, believing this to be the only way to guarantee his immediate safety.", "ultimate\": \"To indirectly ensure the future stability of Rome, even if it means accepting Nero's flawed rule in the short term, while preserving a potential future for the Republic through Britannicus's eventual return, however improbable or distant that may seem."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his candlelit study, his posture weary yet resolute as he gestures for Britannicus to approach. He speaks with a cautious urgency, revealing a deep concern for his son\'s future. His hands tremble slightly, reflecting both his age and the heavy burden of imperial decisions weighing on him.',
        ap.emotional_state = 'Claudius exhibits a complex mix of sorrow and resignation. Outwardly, he strives for calmness as he explains his intentions to Britannicus, but internally he battles guilt and a sense of impending loss. There’s a palpable tension between his desire to protect his son and the harsh reality of the political landscape surrounding them.',
        ap.emotional_tags = ["claudius exhibits a complex mix of sorrow", "resignation. outwardly, he strives for calmness as he explains his intentions to britannicus, but internally he battles guilt", "a sense of impending loss. there\u2019s a palpable tension between his desire to protect his son", "the harsh reality of the political landscape surrounding them.", "claudius exhibits a complex mix of sorrow and resignation. outwardly", "he strives for calmness as he explains his intentions to britannicus", "but internally he battles guilt and a sense of impending loss. there\u2019s a palpable tension between his desire to protect his son and the harsh reality of the political landscape surrounding them.", "claudius exhibits a complex mix of sorrow and resignation. outwardly, he strives for calmness as he explains his intentions to britannicus,", "internally he battles guilt and a sense of impending loss. there\u2019s a palpable tension between his desire to protect his son and the harsh reality of the political landscape surrounding them."],
        ap.active_plans = ["To inform Britannicus of his plans regarding the will and to ensure his son's safety amid the power struggle.", "To prepare Britannicus for a possible exile to Britain, crafting a narrative of safety disguised as a strategic retreat.", "To convey a sense of paternal love and responsibility, despite the complicated familial dynamics."],
        ap.beliefs = ["Believes that Nero is destined to become Emperor, which necessitates precautions for Britannicus\u2019s safety.", "Holds a conviction that his own failings as a father are tied to the legacy of his family's madness.", "Thinks that sacrificing his son\u2019s immediate desires is essential for the greater good of Rome's future."],
        ap.goals = ["Short-term: To successfully communicate his intentions to Britannicus without causing further conflict.", "Medium-term: To arrange Britannicus's safe removal from Rome to ensure his survival.", "Ultimate: To protect the legacy of the Republic and ensure that Britannicus can eventually reclaim his rightful place."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands defiantly before Claudius, his posture tense and arms crossed. His movements are sharp, reflecting his agitation and hurt. He approaches his father reluctantly, maintaining eye contact that conveys both vulnerability and an unyielding resolve.',
        ap.emotional_state = 'Britannicus is engulfed by a tumult of emotions—anger, betrayal, and a fierce longing for validation. He outwardly expresses resentment towards Claudius for past neglect, but beneath that, there is a deep-seated desire for paternal approval. His internal conflict is palpable, torn between the yearning for love and the need to assert his identity.',
        ap.emotional_tags = ["britannicus is engulfed by a tumult of emotions\u2014anger, betrayal,", "a fierce longing for validation. he outwardly expresses resentment towards claudius for past neglect, but beneath that, there is a deep-seated desire for paternal approval. his internal conflict is palpable, torn between the yearning for love", "the need to assert his identity.", "britannicus is engulfed by a tumult of emotions\u2014anger", "betrayal", "and a fierce longing for validation. he outwardly expresses resentment towards claudius for past neglect", "but beneath that", "there is a deep-seated desire for paternal approval. his internal conflict is palpable", "torn between the yearning for love and the need to assert his identity.", "britannicus is engulfed by a tumult of emotions\u2014anger, betrayal, and a fierce longing for validation. he outwardly expresses resentment towards claudius for past neglect,", "beneath that, there is a deep-seated desire for paternal approval. his internal conflict is palpable, torn between the yearning for love and the need to assert his identity."],
        ap.active_plans = ["To confront Claudius about the perceived favoritism towards Nero and demand recognition of his own worth.", "To reject the idea of exile and assert his desire to rule Rome, seeking validation as a rightful heir.", "To challenge his father's authority in a bid for agency over his future and legacy."],
        ap.beliefs = ["Believes that he deserves to be recognized as the legitimate heir and to rule in his own right.", "Holds that his lineage should not determine his fate; a child's worth is not dictated by their parentage.", "Thinks that the ideals of the Republic are worth fighting for, despite the current realities of power."],
        ap.goals = ["Short-term: To express his grievances and assert his position to Claudius.", "Medium-term: To find a way to challenge Nero's ascension and claim his rightful place in Rome.", "Ultimate: To restore the Republic and demonstrate his capability to lead Rome justly."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_maps_event_11_1'})
    ON CREATE SET
        oi.description = 'The scrolls and maps are not merely background objects; they are central to Claudius\'s state of mind in this scene. They physically surround him in his study, representing the culmination of his intellectual and imperial endeavors. Claudius directly refers to his writing on the scrolls as \'it all\', signifying that these documents are his life\'s work, the \'record\' he has set straight. They serve as silent witnesses to his final pronouncements, embodying his legacy and the truth he believes he is leaving behind for posterity. The scrolls, therefore, are not just objects but symbols of his completed historical task and his readiness for death.',
        oi.status_before = 'The scrolls and maps are presumably in disarray around Claudius\'s desk, indicative of his active work as a historian and emperor. They represent ongoing projects, unfinished chronicles, and the daily burdens of rule, symbolizing a life still actively engaged with the world and its demands.',
        oi.status_after = 'The scrolls and maps, in Claudius\'s mind, transition from representing \'work in progress\' to a \'completed record\'. They now symbolize a finished legacy, a testament to his life and reign that he believes is ready to be judged by \'remote posterity\'. Their status shifts from active tools to passive monuments of his intellectual and historical contributions, standing as a completed testament as Claudius prepares to depart.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_maps'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius sits heavily at his writing desk, the weight of his reign visibly pressing down on him. He is surrounded by the physical manifestations of his life\'s work – scrolls filled with his histories and maps charting the vast Roman empire. With eyes closed, he appears utterly drained, his body still but his mind clearly active as he speaks his final reflections.',
        ap.emotional_state = 'Claudius is profoundly weary, both physically and emotionally. His voice, though firm, carries the unmistakable tone of a man who has reached the end of his endurance. Beneath the surface exhaustion, there\'s a sense of resignation, even acceptance. He is not afraid of death, but rather welcomes it as a release from the ceaseless burdens of his imperial role and the betrayals that have marked his life. There\'s a quiet satisfaction in having completed his self-appointed task of chronicling his era, mixed with a deep melancholy for all that he has endured.',
        ap.emotional_tags = ["claudius is profoundly weary, both physically", "emotionally. his voice, though firm, carries the unmistakable tone of a man who has reached the end of his endurance. beneath the surface exhaustion, there's a sense of resignation, even acceptance. he is not afraid of death, but rather welcomes it as a release from the ceaseless burdens of his imperial role", "the betrayals that have marked his life. there's a quiet satisfaction in having completed his self-appointed task of chronicling his era, mixed with a deep melancholy for all that he has endured.", "claudius is profoundly weary", "both physically and emotionally. his voice", "though firm", "carries the unmistakable tone of a man who has reached the end of his endurance. beneath the surface exhaustion", "there's a sense of resignation", "even acceptance. he is not afraid of death", "but rather welcomes it as a release from the ceaseless burdens of his imperial role and the betrayals that have marked his life. there's a quiet satisfaction in having completed his self-appointed task of chronicling his era", "mixed with a deep melancholy for all that he has endured.", "claudius is profoundly weary, both physically and emotionally. his voice, though firm, carries the unmistakable tone of a man who has reached the end of his endurance. beneath the surface exhaustion, there's a sense of resignation, even acceptance. he is not afraid of death,", "rather welcomes it as a release from the ceaseless burdens of his imperial role and the betrayals that have marked his life. there's a quiet satisfaction in having completed his self-appointed task of chronicling his era, mixed with a deep melancholy for all that he has endured."],
        ap.active_plans = ["To cease his historical writing, believing his account is now complete.", "To embrace death as an approaching and welcome event, no longer fighting against the inevitable.", "To find solace in the belief that he has fulfilled his promise to the Sibyl and set the historical record straight for posterity."],
        ap.beliefs = ["He believes he has successfully chronicled his life and reign with honesty and truth, fulfilling his self-mandate.", "He believes in the Sibyl's prophecies and their influence on his life and destiny.", "He believes death offers a final escape from the weariness and suffering of his earthly existence."],
        ap.goals = ["Short-term Goal: To stop writing and rest, both mentally and physically.", "Medium-term Goal: To peacefully accept death as a natural conclusion to his life.", "Ultimate Goal: To ensure his truthful historical record survives for future generations, shaping his legacy beyond his death."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_12_1'})
    ON CREATE SET
        oi.description = 'The scattered scrolls represent years of Claudius\'s intellectual labor, embodying his legacy and personal history. AGRIPPINILLA\'s desire to find and burn them signifies a ruthless attempt to erase Claudius’s influence in favor of her son\'s ascendency, turning the scrolls into symbols of both knowledge and danger.',
        oi.status_before = 'Prior to the event, the scrolls lie scattered throughout the Imperial Library, representing a fragmented legacy of Claudius filled with historical records, personal reflections, and philosophical insights.',
        oi.status_after = 'Following the event, should AGRIPPINILLA\'s plans succeed, the scrolls may be destroyed in a fire, effectively eliminating Claudius\'s intellectual contributions and reshaping the narrative of their family\'s legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_12_2'})
    ON CREATE SET
        oi.description = 'The scrolls, representing Claudius\'s extensive historical and intellectual work, are the central focus of this event. Nero directly interacts with them by examining and commenting on their quantity and the effort required to produce them. They serve as a tangible representation of Claudius\'s legacy, which is about to be destroyed. Agrippinilla\'s intention to burn them highlights her desire to erase Claudius\'s influence and solidify Nero\'s reign by eliminating symbols of the past. The scrolls become a point of brief reflection for Nero before their impending annihilation.',
        oi.status_before = 'The scrolls are meticulously stored within the Imperial Library, representing a vast collection of knowledge and Claudius\'s life\'s work. They are intact and organized, symbolizing the culmination of years of scholarly effort and imperial record-keeping, embodying Claudius\'s intellectual and historical legacy within the Roman Empire.',
        oi.status_after = 'The scrolls are destined to be burned by Nero, under Agrippinilla\'s instruction. Their status will be transformed from valuable repositories of knowledge and history into ashes. This destruction symbolizes the eradication of Claudius\'s legacy and the violent transition to Nero\'s rule, where intellectual and historical pursuits are subordinated to immediate power and ruthless ambition, marking a significant cultural and symbolic loss.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_event_12_3'})
    ON CREATE SET
        oi.description = 'The scattered scrolls symbolize Claudius\'s extensive intellectual and historical legacy, now under threat from AGRIPPINILLA\'s chilling ambition. As she commands their destruction, the scrolls become a representation of the past she seeks to obliterate, embodying the knowledge and power that could challenge her plans. The act of burning them transforms them from vessels of wisdom into ashes, signifying a complete severance from Claudius\'s influence.',
        oi.status_before = 'The scrolls are scattered across the library, remnants of Claudius\'s scholarly life, embodying years of labor and intellectual pursuit.',
        oi.status_after = 'Following AGRIPPINILLA\'s decision, the scrolls are set to be burned, their contents lost forever, symbolizing the erasure of Claudius\'s legacy and a step toward AGRIPPINILLA\'s domination.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls'})
    MATCH (e:Event {uuid: 'event_12_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fire_event_12_3'})
    ON CREATE SET
        oi.description = 'FIRE is invoked as a powerful tool of destruction, representing AGRIPPINILLA\'s ambition to obliterate any trace of Claudius\'s legacy. As she contemplates the act of burning the scrolls, FIRE symbolizes not only the physical destruction of knowledge but also the ideological cleansing of a past that threatens her control. It embodies her ruthless willingness to wield destruction as a means of securing her future and that of her son, Nero.',
        oi.status_before = 'FIRE exists as an abstract concept, representing the potential for destruction and change, waiting to be unleashed upon the scrolls.',
        oi.status_after = 'Post-event, the FIRE would consume the scrolls, leaving behind only ashes, signifying the irrevocable transformation of knowledge into oblivion and the finality of AGRIPPINILLA\'s ambition.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fire'})
    MATCH (e:Event {uuid: 'event_12_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fire_event_12_4'})
    ON CREATE SET
        oi.description = 'Although not physically present yet, fire is invoked by Nero as a concept, a potent symbol of destruction and erasure. His line, \'What a pretty thing a fire is,\' introduces fire as a desired agent of obliteration for Claudius\'s scrolls and, by extension, his legacy. This conceptual fire is wielded as a tool of ideological warfare, aimed at extinguishing the past and paving the way for Agrippinilla and Nero\'s dominance. It embodies the ruthless ambition to not only seize power but also to control the narrative of history by destroying dissenting voices and inconvenient truths preserved within the scrolls. Fire, in this context, is not just combustion, but a metaphor for the scorching ambition that drives their actions.',
        oi.status_before = 'Fire exists only as a potential future action, a concept in Nero\'s mind and a planned method of destruction for Agrippinilla. It is an unrealized force, dormant but intended to be unleashed upon Claudius\'s scrolls.',
        oi.status_after = 'Fire remains a conceptual threat, a planned act of destruction. The idea of fire has been verbally introduced and its symbolic power emphasized, creating a sense of impending devastation for Claudius\'s intellectual legacy. The scene concludes with the anticipation of fire\'s destructive role, hanging heavy in the air as a promised act of erasure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fire'})
    MATCH (e:Event {uuid: 'event_12_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_1'})
    ON CREATE SET
        ap.current_status = 'AGRIPPINILLA stands amidst the scattered scrolls of Claudius, her posture commanding as she emphasizes her urgency to NERO. Her fingers grip the edges of a scroll tightly, revealing her impatience as she scans the room, eyes sharp and focused.',
        ap.emotional_state = 'AGRIPPINILLA radiates an intense urgency mixed with disdain. Surface-level frustration manifests in her sharp tone as she berates NERO for the disarray, yet beneath this lies a deeper anxiety about losing control over the narrative of her family\'s legacy. Her ambition drives her to obliterate any trace of Claudius’s work.',
        ap.emotional_tags = ["agrippinilla radiates an intense urgency mixed with disdain. surface-level frustration manifests in her sharp tone as she berates nero for the disarray", "yet beneath this lies a deeper anxiety about losing control over the narrative of her family's legacy. her ambition drives her to obliterate any trace of claudius\u2019s work."],
        ap.active_plans = ["To locate and secure Claudius's will among the scattered scrolls, consolidating power for Nero's succession.", "To eliminate any remnants of Claudius's legacy by burning the scrolls, thereby rewriting history to favor her son.", "To assert her dominance over the narrative of imperial power, ensuring that Nero's rise is unchallenged."],
        ap.beliefs = ["Power must be seized and maintained through ruthless action, not merely inherited.", "Legacy is only as strong as the narratives that support it; she believes in controlling the story of their family's power.", "Emotional displays are weaknesses; she must mask her true feelings to maintain her position."],
        ap.goals = ["Short-term: Find and destroy Claudius's scrolls to prevent any potential challenges to Nero's rule.", "Medium-term: Establish Nero as the uncontested Emperor by erasing Claudius\u2019s influence.", "Ultimate: Secure a lasting legacy for her family, ensuring their dominance over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_1'})
    ON CREATE SET
        ap.current_status = 'NERO stands beside AGRIPPINILLA, appearing somewhat overwhelmed by the scattered scrolls. He shifts his weight from one foot to another, occasionally glancing at the papers with a mix of curiosity and detachment, an inkling of appreciation for the effort behind them.',
        ap.emotional_state = 'NERO displays surface-level excitement tinged with mischief, his tone light as he comments on the scrolls. However, there is an underlying reluctance to fully engage with their historical significance, reflecting a conflict between his inherent admiration for his grandfather\'s intellect and the chaotic thrill of destruction that his mother incites.',
        ap.emotional_tags = ["nero displays surface-level excitement tinged with mischief, his tone light as he comments on the scrolls. however, there is an underlying reluctance to fully engage with their historical significance, reflecting a conflict between his inherent admiration for his grandfather's intellect", "the chaotic thrill of destruction that his mother incites.", "nero displays surface-level excitement tinged with mischief", "his tone light as he comments on the scrolls. however", "there is an underlying reluctance to fully engage with their historical significance", "reflecting a conflict between his inherent admiration for his grandfather's intellect and the chaotic thrill of destruction that his mother incites."],
        ap.active_plans = ["To assist AGRIPPINILLA in locating the will, albeit without genuine enthusiasm for the task at hand.", "To indulge in the idea of burning the scrolls, showcasing his youthful thrill for destruction over historical reverence.", "To align with his mother's ambitions, though he is swayed by the immediate excitement rather than the consequences."],
        ap.beliefs = ["Destruction can be thrilling and liberating, viewing fire as a beautiful spectacle.", "His identity and future are intricately tied to his mother's ambitions, and he feels the need to support her.", "Intellectual pursuits hold less value than power and excitement in the chaotic landscape of imperial politics."],
        ap.goals = ["Short-term: Help find the will to please AGRIPPINILLA and maintain her favor.", "Medium-term: Embrace his role in the imperial court, albeit with a focus on the excitement of power rather than its weight.", "Ultimate: Shape his legacy as a ruler who is feared and admired, devoid of the burdens of his familial past."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Nero stands in the Imperial Library, his gaze sweeping over the vast collection of scrolls scattered around him. He picks up a scroll, perhaps unrolling it slightly, his posture suggesting a fleeting moment of contemplation amidst the planned destruction. He speaks aloud, acknowledging the immense labor involved in creating these documents, his actions betraying a momentary pause before the impending act of arson.',
        ap.emotional_state = 'Nero experiences a brief flicker of awe and perhaps even a nascent respect for the sheer volume of Claudius\'s work, indicated by his exclamation, \'What a Herculean labor!\'. However, this is quickly overtaken by a more dominant, almost childish fascination with destruction. He is clearly more enthralled by the idea of fire and the spectacle it will create than by any genuine appreciation for the intellectual content or historical significance of the scrolls, showing a superficial engagement with the situation.',
        ap.emotional_tags = ["nero experiences a brief flicker of awe", "perhaps even a nascent respect for the sheer volume of claudius's work, indicated by his exclamation, 'what a herculean labor!'. however, this is quickly overtaken by a more dominant, almost childish fascination with destruction. he is clearly more enthralled by the idea of fire", "the spectacle it will create than by any genuine appreciation for the intellectual content or historical significance of the scrolls, showing a superficial engagement with the situation.", "nero experiences a brief flicker of awe and perhaps even a nascent respect for the sheer volume of claudius's work", "indicated by his exclamation", "'what a herculean labor!'. however", "this is quickly overtaken by a more dominant", "almost childish fascination with destruction. he is clearly more enthralled by the idea of fire and the spectacle it will create than by any genuine appreciation for the intellectual content or historical significance of the scrolls", "showing a superficial engagement with the situation."],
        ap.active_plans = ["Locate Claudius's will amongst the scrolls, as instructed by Agrippinilla, to secure their power.", "Carry out Agrippinilla's command to burn all of Claudius's scrolls, demonstrating obedience and loyalty.", "Indulge his own nascent destructive impulses and derive pleasure from the spectacle of the fire, showcasing a growing tyrannical inclination."],
        ap.beliefs = ["Agrippinilla's directives are paramount and must be followed without question, reflecting his dependence on her authority.", "The immediate thrill of destruction and spectacle is more captivating and valuable than the preservation of knowledge or historical legacy, indicating a shallow value system.", "Intellectual pursuits and laborious efforts like Claudius's scroll-writing are ultimately less significant than displays of power and decisive action, mirroring Agrippinilla's pragmatic and ruthless worldview."],
        ap.goals = ["Short-term: Find Claudius's will and set fire to the scrolls in the library, fulfilling Agrippinilla's immediate objectives.", "Medium-term: Consolidate his position as Emperor by adhering to Agrippinilla's plans and eliminating potential threats, ensuring a smooth transition of power.", "Ultimate: Establish a reign marked by spectacle and power, perhaps echoing the destructive tendencies hinted at in his fascination with fire, rather than building a legacy of intellect or wisdom like Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_3'})
    ON CREATE SET
        ap.current_status = 'AGRIPPINILLA stands amidst the scattered scrolls in the dim light of the Imperial Library, her posture tense with purpose. She leans forward, eyes scanning the chaotic remnants of Claudius\'s work, her hands poised as if ready to seize the scrolls and cast them into the flames. Her expression is one of cold determination, with an imperious gesture signaling urgency as she commands NERO to find the will.',
        ap.emotional_state = 'AGRIPPINILLA\'s surface emotions are marked by an icy resolve, her voice sharp and authoritative. Beneath this facade, a simmering paranoia lurks, revealing her fear of Claudius\'s legacy overshadowing her ambitions. The tension between her ambition and the need to eradicate potential threats breeds a restless energy, manifesting as a chilling dismissal of the scrolls\' importance, showcasing the depths of her ruthless ambition.',
        ap.emotional_tags = ["agrippinilla's surface emotions are marked by an icy resolve, her voice sharp", "authoritative. beneath this facade, a simmering paranoia lurks, revealing her fear of claudius's legacy overshadowing her ambitions. the tension between her ambition", "the need to eradicate potential threats breeds a restless energy, manifesting as a chilling dismissal of the scrolls' importance, showcasing the depths of her ruthless ambition.", "agrippinilla's surface emotions are marked by an icy resolve", "her voice sharp and authoritative. beneath this facade", "a simmering paranoia lurks", "revealing her fear of claudius's legacy overshadowing her ambitions. the tension between her ambition and the need to eradicate potential threats breeds a restless energy", "manifesting as a chilling dismissal of the scrolls' importance", "showcasing the depths of her ruthless ambition."],
        ap.active_plans = ["Locate Claudius's will among the scrolls to secure Nero's succession.", "Burn the scrolls to obliterate Claudius's legacy and assert her control over the future of the empire.", "Manipulate Nero further into aligning with her ambitions and consolidating their power."],
        ap.beliefs = ["Power and control must be seized at any cost, even through the destruction of familial ties.", "Claudius's legacy poses a threat to her ambitions and must be eradicated.", "Nero is the key to her ultimate dominance over the empire."],
        ap.goals = ["Short-term: Find Claudius's will and ensure her plans for Nero's succession are solidified.", "Medium-term: Eliminate any remnants of Claudius's influence, particularly through the destruction of his works.", "Ultimate: Establish a complete and unchallenged reign for Nero, positioning herself as the true power behind the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Nero stands amidst towering shelves laden with scrolls, his youthful frame dwarfed by the sheer volume of Claudius\'s historical work. He runs his fingers along the parchment, picking up a scroll and examining it with a detached curiosity, more like a child with a trinket than an emperor contemplating history. His movements are languid, his attention fleeting, as his gaze drifts towards the more immediate and visceral appeal of destruction.',
        ap.emotional_state = 'Nero outwardly displays a superficial interest, commenting on the \'Herculean labor\' of Claudius, but his tone lacks genuine respect or understanding. Beneath this veneer of mild curiosity, a darker impulse stirs. He is captivated by the idea of destruction, a nascent fascination with chaos and erasure beginning to blossom. There is a palpable lack of empathy for Claudius\'s life\'s work, replaced by a disturbing anticipation of the spectacle of fire, reflecting a corrupted innocence and a growing appetite for power without depth.',
        ap.emotional_tags = ["nero outwardly displays a superficial interest, commenting on the 'herculean labor' of claudius, but his tone lacks genuine respect or understanding. beneath this veneer of mild curiosity, a darker impulse stirs. he is captivated by the idea of destruction, a nascent fascination with chaos", "erasure beginning to blossom. there is a palpable lack of empathy for claudius's life's work, replaced by a disturbing anticipation of the spectacle of fire, reflecting a corrupted innocence", "a growing appetite for power without depth.", "nero outwardly displays a superficial interest", "commenting on the 'herculean labor' of claudius", "but his tone lacks genuine respect or understanding. beneath this veneer of mild curiosity", "a darker impulse stirs. he is captivated by the idea of destruction", "a nascent fascination with chaos and erasure beginning to blossom. there is a palpable lack of empathy for claudius's life's work", "replaced by a disturbing anticipation of the spectacle of fire", "reflecting a corrupted innocence and a growing appetite for power without depth.", "nero outwardly displays a superficial interest, commenting on the 'herculean labor' of claudius,", "his tone lacks genuine respect or understanding. beneath this veneer of mild curiosity, a darker impulse stirs. he is captivated by the idea of destruction, a nascent fascination with chaos and erasure beginning to blossom. there is a palpable lack of empathy for claudius's life's work, replaced by a disturbing anticipation of the spectacle of fire, reflecting a corrupted innocence and a growing appetite for power without depth."],
        ap.active_plans = ["Locate Claudius's will amongst the scrolls, as instructed by Agrippinilla.", "Voice a detached, almost aesthetic appreciation for the idea of burning the scrolls, focusing on the visual spectacle rather than the intellectual loss.", "Solidify his alliance with Agrippinilla by echoing her destructive sentiments and demonstrating his willingness to participate in erasing Claudius's legacy."],
        ap.beliefs = ["Destruction can be beautiful and entertaining, offering a form of immediate gratification and power.", "Claudius's past and his intellectual pursuits are insignificant obstacles to his own ascent and Agrippinilla's ambitions.", "His mother's desires and pronouncements represent the ultimate authority and the correct course of action."],
        ap.goals = ["Short-term: To locate Claudius's will within the library.", "Medium-term: To participate in the symbolic destruction of Claudius's legacy by burning his scrolls, thus clearing the path for his own reign.", "Ultimate: To establish himself as Emperor, embracing a reign defined by power and spectacle, potentially mirroring or exceeding the ruthlessness he observes in Agrippinilla."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Britannicus stands at the mist-covered riverbank, his posture tense and distraught, his brow furrowed with grief. He confronts Narcissus with an intensity that reveals both his sorrow and anger. His movements are sharp, reflecting a mix of desperation and resolve as he demands answers regarding his father\'s death.',
        ap.emotional_state = 'Britannicus is engulfed in a tumult of grief, frustration, and anger. Externally, his voice trembles with a combination of sorrow and indignation, his eyes wide with disbelief. Internally, he grapples with feelings of betrayal and a desperate need for answers, revealing a young man caught between mourning and the fierce desire for justice. There\'s a simmering conflict as he battles with the weight of his responsibilities—a prince who has lost his father and feels the looming threat of danger.',
        ap.emotional_tags = ["britannicus is engulfed in a tumult of grief, frustration,", "anger. externally, his voice trembles with a combination of sorrow", "indignation, his eyes wide with disbelief. internally, he grapples with feelings of betrayal", "a desperate need for answers, revealing a young man caught between mourning", "the fierce desire for justice. there's a simmering conflict as he battles with the weight of his responsibilities\u2014a prince who has lost his father", "feels the looming threat of danger.", "britannicus is engulfed in a tumult of grief", "frustration", "and anger. externally", "his voice trembles with a combination of sorrow and indignation", "his eyes wide with disbelief. internally", "he grapples with feelings of betrayal and a desperate need for answers", "revealing a young man caught between mourning and the fierce desire for justice. there's a simmering conflict as he battles with the weight of his responsibilities\u2014a prince who has lost his father and feels the looming threat of danger."],
        ap.active_plans = ["To confront Narcissus and demand the truth about Claudius's death.", "To seek vengeance for his father's murder, refusing to flee despite the dangers.", "To assert his manhood and reclaim his place in the imperial hierarchy."],
        ap.beliefs = ["He believes that he is the rightful heir to the throne and must stand against all threats.", "He holds that familial loyalty should be honored, even in the face of betrayal.", "He thinks that confronting the truth is essential, even if it leads to danger."],
        ap.goals = ["Short-term: To understand the circumstances surrounding Claudius's death.", "Medium-term: To prepare himself for a confrontation with Agrippinilla and Nero.", "Ultimate: To reclaim his position as the rightful heir of Rome and avenge his father's death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands close to Britannicus, his face marked with deep lines of regret and sorrow. He leans slightly forward, his body tense as he shares his revelations about Claudius’s poisoning. His gestures are deliberate, each movement a blend of anguish and a desperate attempt to impart wisdom and warnings.',
        ap.emotional_state = 'Narcissus wrestles with profound regret and sorrow, his outward demeanor reflecting a heavy heart. He speaks slowly and deliberately, the weight of his failure evident in his tone. Internally, he grapples with guilt for not having foreseen the danger and a resolve to protect Britannicus, showcasing a blend of loyalty and remorse. He feels the crushing burden of his role as protector, knowing he could not save Claudius despite his best efforts.',
        ap.emotional_tags = ["narcissus wrestles with profound regret", "sorrow, his outward demeanor reflecting a heavy heart. he speaks slowly", "deliberately, the weight of his failure evident in his tone. internally, he grapples with guilt for not having foreseen the danger", "a resolve to protect britannicus, showcasing a blend of loyalty", "remorse. he feels the crushing burden of his role as protector, knowing he could not save claudius despite his best efforts.", "narcissus wrestles with profound regret and sorrow", "his outward demeanor reflecting a heavy heart. he speaks slowly and deliberately", "the weight of his failure evident in his tone. internally", "he grapples with guilt for not having foreseen the danger and a resolve to protect britannicus", "showcasing a blend of loyalty and remorse. he feels the crushing burden of his role as protector", "knowing he could not save claudius despite his best efforts."],
        ap.active_plans = ["To reveal the details of Claudius's poisoning to Britannicus.", "To express his regret and share the cunning methods used by Agrippinilla.", "To urge Britannicus to flee for his safety, fearing for his life."],
        ap.beliefs = ["He believes that loyalty to Claudius was paramount, even in the face of overwhelming betrayal.", "He holds a conviction that foresight could have prevented this tragedy, illustrating a sense of personal responsibility.", "He thinks that protecting Britannicus is essential for preserving the legitimate line of the Empire."],
        ap.goals = ["Short-term: To communicate the truth about Claudius\u2019s death to Britannicus.", "Medium-term: To find a way to protect Britannicus from impending danger.", "Ultimate: To seek redemption for his failure to protect Claudius and uphold the legacy of the rightful heirs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_2'})
    ON CREATE SET
        ap.current_status = 'The Sibyl materializes on the mist-shrouded riverbank, an ethereal figure emerging from the dim light as Narcissus and Britannicus discuss the late Emperor. She stands present and watchful, her form solidifying amidst the spectral atmosphere, ready to engage with the disembodied voice of Claudius.',
        ap.emotional_state = 'The Sibyl embodies ancient wisdom and detached knowing. Her tone is firm yet gentle, devoid of surprise at Claudius\'s spectral presence. She carries the weight of countless cycles of Roman history, speaking with an air of inevitability and a touch of world-weariness, yet with a guiding purpose to lead Claudius towards acceptance.',
        ap.emotional_tags = ["the sibyl embodies ancient wisdom", "detached knowing. her tone is firm yet gentle, devoid of surprise at claudius's spectral presence. she carries the weight of countless cycles of roman history, speaking with an air of inevitability", "a touch of world-weariness, yet with a guiding purpose to lead claudius towards acceptance.", "the sibyl embodies ancient wisdom and detached knowing. her tone is firm yet gentle", "devoid of surprise at claudius's spectral presence. she carries the weight of countless cycles of roman history", "speaking with an air of inevitability and a touch of world-weariness", "yet with a guiding purpose to lead claudius towards acceptance."],
        ap.active_plans = ["Correct Claudius's delusion that he has cheated death, firmly grounding him in the reality of his passing.", "Guide Claudius towards accepting his death and transitioning to the next stage, acting as a psychopomp in this liminal space.", "Deliver crucial prophecies regarding the fates of Britannicus, Narcissus, Nero, and the Roman Empire, fulfilling her role as an oracle of destiny."],
        ap.beliefs = ["Fate is an unyielding force, and destiny unfolds according to preordained cycles.", "The tragic patterns of Roman history are repetitive and inescapable, driven by ambition and betrayal.", "Death is not an end but a transition, a step towards a different narrative beyond the mortal realm."],
        ap.goals = ["short_term\": \"To ensure Claudius comprehends and accepts the finality of his death.", "medium_term\": \"To impart necessary prophecies that reveal the unfolding future of Rome and its key players.", "ultimate\": \"To maintain the cosmic order by guiding souls through transitions and upholding the immutable nature of fate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Claudius exists solely as a disembodied voice, emanating from beyond the veil of death. His spectral presence is marked by his distinct speech, responding to the Sibyl and engaging in a dialogue from the afterlife. He is present in essence, his voice echoing in the ethereal space of the Ferryman\'s Shore.',
        ap.emotional_state = 'Initially, Claudius expresses a wry amusement and a hint of defiance, clinging to the notion that he has outsmarted his assassins even in death. This quickly shifts to a tone of weary resignation and melancholy as the Sibyl gently but firmly corrects his misconception. Beneath the surface, a paternal concern for Britannicus lingers, revealing a final spark of earthly attachment.',
        ap.emotional_tags = ["initially, claudius expresses a wry amusement", "a hint of defiance, clinging to the notion that he has outsmarted his assassins even in death. this quickly shifts to a tone of weary resignation", "melancholy as the sibyl gently but firmly corrects his misconception. beneath the surface, a paternal concern for britannicus lingers, revealing a final spark of earthly attachment.", "initially", "claudius expresses a wry amusement and a hint of defiance", "clinging to the notion that he has outsmarted his assassins even in death. this quickly shifts to a tone of weary resignation and melancholy as the sibyl gently but firmly corrects his misconception. beneath the surface", "a paternal concern for britannicus lingers", "revealing a final spark of earthly attachment.", "initially, claudius expresses a wry amusement and a hint of defiance, clinging to the notion that he has outsmarted his assassins even in death. this quickly shifts to a tone of weary resignation and melancholy as the sibyl gently", "firmly corrects his misconception. beneath the surface, a paternal concern for britannicus lingers, revealing a final spark of earthly attachment."],
        ap.active_plans = ["Express his characteristic wry humor and initial delusion of having cheated death, showcasing his enduring personality even in the afterlife.", "Inquire about the fates of Britannicus and Narcissus, revealing his lingering concern for those he left behind and his awareness of the dangers they face.", "Seek insight into the future of the Roman Empire, indicating a continued, albeit spectral, connection to the realm he once ruled and a desire to understand its destiny."],
        ap.beliefs = ["He possesses a certain cunning and is often underestimated by those around him, even in the face of death.", "Britannicus's future is of paramount importance, reflecting a paternal affection and responsibility that transcends his own demise.", "The fate of the Roman Empire is a significant concern, even in his spectral state, demonstrating his lasting connection to his imperial legacy."],
        ap.goals = ["short_term\": \"To comprehend his current state of being and engage in meaningful communication with the Sibyl.", "medium_term\": \"To gain knowledge about the future, particularly regarding the well-being of Britannicus and the trajectory of Rome.", "ultimate\": \"To accept the finality of his death and transition peacefully into the afterlife, while retaining a spectral concern for his loved ones and his legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Claudius appears as a disembodied voice interjecting into the ethereal space of the Ferryman\'s Shore, expressing concern for Britannicus and Narcissus. He is depicted as weary yet resolute, his presence imbued with a recognition of mortality, signifying a profound acceptance of his fate.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect a melancholic acceptance of his impending death, tinged with sorrow for the fate of those he cares about. Beneath this, a deep-seated regret for the choices made and the fallout of his reign simmers, revealing his internal conflict between resignation and a desire to protect his remaining family.',
        ap.emotional_tags = ["claudius's surface emotions reflect a melancholic acceptance of his impending death, tinged with sorrow for the fate of those he cares about. beneath this, a deep-seated regret for the choices made", "the fallout of his reign simmers, revealing his internal conflict between resignation", "a desire to protect his remaining family.", "claudius's surface emotions reflect a melancholic acceptance of his impending death", "tinged with sorrow for the fate of those he cares about. beneath this", "a deep-seated regret for the choices made and the fallout of his reign simmers", "revealing his internal conflict between resignation and a desire to protect his remaining family."],
        ap.active_plans = ["To understand the fates of Britannicus and Narcissus through the Sibyl's prophecies.", "To convey concern for his family despite his own death, reflecting a paternal instinct.", "To confront the reality of his legacy and the consequences of his reign as he prepares for the afterlife."],
        ap.beliefs = ["The belief that one cannot escape their fate, illustrated by his acceptance of death.", "A conviction that family loyalty is paramount, driving his concern for Britannicus and Narcissus.", "A recognition of the cyclical nature of betrayal and power within his lineage, shaped by his own experiences."],
        ap.goals = ["Short-term: To gain insight into the fates of those he loves before his demise.", "Medium-term: To reckon with the consequences of his reign and the legacy he leaves behind.", "Ultimate: To ensure that his lineage does not fall into ruin, even as he himself departs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_3'})
    ON CREATE SET
        ap.current_status = 'The Sibyl\'s presence is ethereal and commanding, woven into the dim light of the Ferryman\'s Shore. She interacts with Claudius\'s spirit, delivering prophetic insights with chilling clarity. Her role is that of a guide, ushering Claudius towards acceptance of his fate while revealing the dark future awaiting his family.',
        ap.emotional_state = 'The Sibyl maintains an air of detached authority, her surface emotions are calm and resolute. Beneath this, however, lies a profound sadness, as she bears witness to the perpetual cycle of ambition and betrayal that defines the lives of those before her. There is a sense of inevitability in her tone, suggesting an awareness of the tragic patterns repeating in history.',
        ap.emotional_tags = ["the sibyl maintains an air of detached authority, her surface emotions are calm", "resolute. beneath this, however, lies a profound sadness, as she bears witness to the perpetual cycle of ambition", "betrayal that defines the lives of those before her. there is a sense of inevitability in her tone, suggesting an awareness of the tragic patterns repeating in history.", "the sibyl maintains an air of detached authority", "her surface emotions are calm and resolute. beneath this", "however", "lies a profound sadness", "as she bears witness to the perpetual cycle of ambition and betrayal that defines the lives of those before her. there is a sense of inevitability in her tone", "suggesting an awareness of the tragic patterns repeating in history."],
        ap.active_plans = ["To convey crucial prophecies concerning the fates of Britannicus and Narcissus.", "To guide Claudius towards acceptance of his death while emphasizing the darkness of the paths ahead.", "To fulfill her role as an oracle, ensuring that the truth of fate is laid bare before those who seek understanding."],
        ap.beliefs = ["The belief that fate is inescapable and that all actions lead to predetermined outcomes.", "A conviction that knowledge of the future serves as a burden and a guide, shaping destinies.", "A recognition of the cyclical nature of history, where the same patterns of ambition and betrayal repeat across generations."],
        ap.goals = ["Short-term: To reveal the grim fates awaiting Claudius's loved ones.", "Medium-term: To facilitate Claudius's acceptance of death, preparing him for the transition beyond life.", "Ultimate: To uphold the wisdom of the past, ensuring that the lessons of history are acknowledged, even as they repeat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_4'})
    ON CREATE SET
        ap.current_status = 'The Sibyl appears on the mist-shrouded Ferryman\'s Shore, a spectral figure woven into the very fabric of the dim light. She is actively engaging in a dialogue with the disembodied voice of Claudius, guiding him through the revelations of his death and the prophecies that await.',
        ap.emotional_state = 'The Sibyl maintains an air of ancient detachment, her voice pragmatic and devoid of sentimentality. Outwardly, she is blunt and direct, delivering harsh truths about Claudius\'s demise and the grim future. Internally, she embodies timeless wisdom, accepting the cyclical nature of Roman tragedy with weary resignation, yet focused on her role as a guide to the departed.',
        ap.emotional_tags = ["the sibyl maintains an air of ancient detachment, her voice pragmatic", "devoid of sentimentality. outwardly, she is blunt", "direct, delivering harsh truths about claudius's demise", "the grim future. internally, she embodies timeless wisdom, accepting the cyclical nature of roman tragedy with weary resignation, yet focused on her role as a guide to the departed.", "the sibyl maintains an air of ancient detachment", "her voice pragmatic and devoid of sentimentality. outwardly", "she is blunt and direct", "delivering harsh truths about claudius's demise and the grim future. internally", "she embodies timeless wisdom", "accepting the cyclical nature of roman tragedy with weary resignation", "yet focused on her role as a guide to the departed."],
        ap.active_plans = ["To firmly inform Claudius of his death and dispel any lingering illusions of survival.", "To deliver crucial prophecies regarding the fates of Britannicus, Narcissus, Nero, and the Roman Empire.", "To guide Claudius towards acceptance of his death and facilitate his transition to the afterlife, ensuring he understands it is time to depart."],
        ap.beliefs = ["Fate is an immutable force that dictates the course of history and individual destinies.", "Roman history is a repeating cycle of ambition, betrayal, and violence.", "There is a realm beyond mortal life, a different existence awaiting after death."],
        ap.goals = ["Short-term: To ensure Claudius comprehends and accepts the reality of his death.", "Medium-term: To impart essential prophecies about the future of Rome and its key figures.", "Ultimate: To oversee Claudius's peaceful passage to the afterlife and maintain the cosmic order by fulfilling her role as a psychopomp."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Claudius exists as a disembodied voice echoing from beyond the veil, engaging in a poignant conversation with the Sibyl. Initially, he expresses a playful denial of death, clinging to a sense of cunning. However, as the Sibyl\'s pronouncements unfold, he transitions into a state of weary acceptance, his inquiries focusing on the fates of those he cares for.',
        ap.emotional_state = 'Claudius initially manifests a surface amusement, a flicker of his old trickster persona, as he claims to have \'cheated them again,\' suggesting a playful defiance of death. Beneath this facade, a profound weariness permeates his tone, quickly giving way to resignation as the Sibyl confirms his demise. A deep paternal concern for Britannicus and loyal affection for Narcissus surface as he inquires about their futures, showcasing a poignant blend of acceptance and lingering care.',
        ap.emotional_tags = ["claudius initially manifests a surface amusement, a flicker of his old trickster persona, as he claims to have 'cheated them again,' suggesting a playful defiance of death. beneath this facade, a profound weariness permeates his tone, quickly giving way to resignation as the sibyl confirms his demise. a deep paternal concern for britannicus", "loyal affection for narcissus surface as he inquires about their futures, showcasing a poignant blend of acceptance", "lingering care.", "claudius initially manifests a surface amusement", "a flicker of his old trickster persona", "as he claims to have 'cheated them again", "' suggesting a playful defiance of death. beneath this facade", "a profound weariness permeates his tone", "quickly giving way to resignation as the sibyl confirms his demise. a deep paternal concern for britannicus and loyal affection for narcissus surface as he inquires about their futures", "showcasing a poignant blend of acceptance and lingering care."],
        ap.active_plans = ["To initially express a final, almost whimsical, triumph over his enemies, even in death's embrace.", "To seek reassurance and information regarding the destinies of Britannicus and Narcissus, reflecting his deep-seated paternal and loyal instincts.", "To ultimately accept the Sibyl's guidance and surrender to the inevitable journey to the afterlife, acknowledging the finality of his reign."],
        ap.beliefs = ["He initially holds onto a belief in his own cleverness and ability to outmaneuver his adversaries, even in the face of death.", "He harbors deep affection and responsibility for Britannicus and Narcissus, prioritizing their well-being even in his spectral state.", "He ultimately accepts the existence and authority of fate and prophecy, recognizing the Sibyl's pronouncements as undeniable truths."],
        ap.goals = ["Short-term: To gain clarity on the immediate future of his son and loyal advisor in the wake of his death.", "Medium-term: To come to terms with his own death and the prophecies revealed by the Sibyl, understanding the implications for his legacy and family.", "Ultimate: To transition peacefully into the afterlife, secure in the knowledge that his story, though burned, will be preserved, and perhaps find respite from the burdens of his earthly reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_5'})
    ON CREATE SET
        ap.current_status = 'The Sibyl appears in a misty, ethereal setting, her presence woven into the dim light. She stands as a spectral figure, exuding an aura of ancient wisdom and authority, guiding Claudius towards his final journey. Her voice carries the weight of prophecy and inevitability.',
        ap.emotional_state = 'The Sibyl\'s surface demeanor is calm and resolute, yet beneath lies a profound understanding of the gravity of her task. She embodies an eerie serenity, accepting the cyclical nature of life and death, while also displaying a tinge of sadness for the inevitable fates that befall Claudius and those he cares for.',
        ap.emotional_tags = ["the sibyl's surface demeanor is calm", "resolute, yet beneath lies a profound understanding of the gravity of her task. she embodies an eerie serenity, accepting the cyclical nature of life", "death, while also displaying a tinge of sadness for the inevitable fates that befall claudius", "those he cares for.", "the sibyl's surface demeanor is calm and resolute", "yet beneath lies a profound understanding of the gravity of her task. she embodies an eerie serenity", "accepting the cyclical nature of life and death", "while also displaying a tinge of sadness for the inevitable fates that befall claudius and those he cares for.", "the sibyl's surface demeanor is calm and resolute, yet beneath lies a profound understanding of the gravity of her task. she embodies an eerie serenity, accepting the cyclical nature of life and death,", "also displaying a tinge of sadness for the inevitable fates that befall claudius and those he cares for."],
        ap.active_plans = ["Guide Claudius towards the ferryman, facilitating his transition from the mortal realm.", "Provide him with reassurance about the afterlife, framing it as a peaceful journey.", "Deliver prophetic insights about the future of Rome and its rulers."],
        ap.beliefs = ["Fate is an inescapable force that governs the lives of mortals, and she is a messenger of that truth.", "Death is not an end but a transition to another existence, where peace and understanding await.", "The cycle of ambition and consequence is perpetual; each ruler faces the consequences of their actions."],
        ap.goals = ["Short-term: Deliver Claudius to the ferryman, ensuring his safe passage to the afterlife.", "Medium-term: Communicate the fates of those left behind, including Britannicus and Narcissus.", "Ultimate: Serve as a guide in the larger narrative of Rome's cyclical history, ensuring that each story is acknowledged."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_5'})
    ON CREATE SET
        ap.current_status = 'Claudius exists as a disembodied voice, marked by resignation and acceptance of his fate. His presence, although unseen, is felt through his dialogue, reflecting his weariness and the culmination of his tumultuous reign. His laugh, tinged with irony, suggests a complex mix of relief and sorrow.',
        ap.emotional_state = 'On the surface, Claudius exhibits a sense of dark humor, laughing as he acknowledges his death, but beneath this facade lies a deep sense of loss and solitude. His acceptance of mortality reveals a profound weariness and introspection, as he grapples with the implications of his legacy and the fate of those he has left behind.',
        ap.emotional_tags = ["on the surface, claudius exhibits a sense of dark humor, laughing as he acknowledges his death, but beneath this facade lies a deep sense of loss", "solitude. his acceptance of mortality reveals a profound weariness", "introspection, as he grapples with the implications of his legacy", "the fate of those he has left behind.", "on the surface", "claudius exhibits a sense of dark humor", "laughing as he acknowledges his death", "but beneath this facade lies a deep sense of loss and solitude. his acceptance of mortality reveals a profound weariness and introspection", "as he grapples with the implications of his legacy and the fate of those he has left behind.", "on the surface, claudius exhibits a sense of dark humor, laughing as he acknowledges his death,", "beneath this facade lies a deep sense of loss and solitude. his acceptance of mortality reveals a profound weariness and introspection, as he grapples with the implications of his legacy and the fate of those he has left behind."],
        ap.active_plans = ["Reflect on his life and the choices that brought him to this moment.", "Converse with the Sibyl about the fates of his family and Rome as he prepares to leave.", "Accept his impending death with a sense of irony and contemplative resolution."],
        ap.beliefs = ["Life is a performance filled with deception and masks, and even in death, he can manipulate the perceptions of others.", "His mortality is a release from the burdens of power, a chance to escape the political machinations that have plagued him.", "The legacy of his reign will live on through the stories of Rome and the individuals shaped by his actions."],
        ap.goals = ["Short-term: Seek closure and understanding of his life\u2019s impact as he prepares for death.", "Medium-term: Leave a sense of continuity for Rome's future, ensuring that the empire endures beyond his reign.", "Ultimate: Achieve a form of reconciliation with his identity and legacy as he transitions into the afterlife."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_2'}),
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caractacus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caractacus_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caractacus_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_7_6'}),
          (b:Event {uuid: 'event_7_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_6'}),
          (b:Event {uuid: 'event_7_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_7'}),
          (b:Event {uuid: 'event_7_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_7'}),
          (b:Event {uuid: 'event_7_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Event {uuid: 'event_10_6'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_5'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippinilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippinilla_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nero'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nero_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_old_king_log'})
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
MATCH (a:Agent {uuid: 'agent_britannicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_britannicus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sybill'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sybill'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sybill'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sybill'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sybill_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
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
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_3'})
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
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_2'}),
                      (e2:Event {uuid: 'event_10_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_3'}),
                      (e2:Event {uuid: 'event_10_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_4'}),
                      (e2:Event {uuid: 'event_10_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_5'}),
                      (e2:Event {uuid: 'event_10_6'})
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
