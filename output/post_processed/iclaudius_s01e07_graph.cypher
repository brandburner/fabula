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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e07_graph.json',
        creation_timestamp: '2025-04-11T16:17:13.924158',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'None',
        a.description = 'Claudius, grandson of Livia, is a thoughtful and introspective observer of the tumultuous Julio-Claudian dynasty. Often underestimated due to his physical ailments and perceived timidity, he possesses a keen intellect and a detached perspective on the power struggles around him. In this scene, he is contemplative and melancholic as he reflects on the impending death of Livia, a figure of immense power in his life.',
        a.traits = ["Thoughtful", "Introspective", "Timid", "Melancholic"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_lollia'})
    ON CREATE SET
        a.name = 'Lollia',
        a.title = 'None',
        a.description = 'Lollia is referenced by Agrippina as a victim of Tiberius\'s cruelty. Agrippina claims that Tiberius \'degraded and humiliated\' her, leading to her suicide. Her tragic fate underscores the brutal consequences of imperial cruelty and fuels the tension and moral outrage in the scene.',
        a.traits = ["Victim of Tiberius", "Humiliated", "Deceased", "Example of Imperial Cruelty"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_titus'})
    ON CREATE SET
        a.name = 'Titus',
        a.title = 'None',
        a.description = 'Titus is introduced as Lollia\'s husband. Initially lighthearted, his tone turns to alarm and distress as Lollia recounts her traumatic experience. His mixture of disbelief, horror, and impotent rage highlights his role as a loving and protective husband deeply affected by Tiberius\'s tyranny.',
        a.traits = ["Loving", "Protective", "Distressed", "Powerless", "Furious"],
        a.sphere_of_influence = 'Roman Society'
    ;
MERGE (a:Agent {uuid: 'agent_agrippina'})
    ON CREATE SET
        a.name = 'Agrippina',
        a.title = 'None',
        a.description = 'Agrippina, granddaughter of Augustus, is portrayed as fiercely independent and outspoken. Unafraid to confront the Emperor, she accuses Tiberius of hypocrisy and persecution by giving detailed examples of his cruelties. Although driven by anger, she reveals weariness and a desire for peace, marking her as both a moral authority and a pragmatic political actor.',
        a.traits = ["Independent", "Bold", "Outspoken", "Moral authority"],
        a.sphere_of_influence = 'Political justice'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Nero',
        a.title = 'Emperor',
        a.description = 'Tiberius, the haunted Emperor of Rome, is depicted amidst private supplication as he struggles with inner turmoil and weariness. Confronted by Agrippina\'s accusations, he shifts to defensive authority, exposing deep-seated paranoia and guilt. His complex nature combines tyrannical control with personal vulnerability as he justifies abuses as necessary for state stability.',
        a.traits = ["Weary", "Paranoid", "Defensive", "Authoritarian", "Guilt-ridden"],
        a.sphere_of_influence = 'Roman Empire'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'None',
        a.description = 'Livia Drusilla, Claudius\'s grandmother, is a powerful and manipulative figure within the Julio-Claudian dynasty. She is characterized by ruthless ambition and a willingness to employ treachery to secure her legacy, revealing a cold pragmatism in her quest for power.',
        a.traits = ["Ambitious", "Manipulative", "Ruthless", "Pragmatic"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_thrasyllus'})
    ON CREATE SET
        a.name = 'Thrasyllus',
        a.title = 'Astrologer',
        a.description = 'Thrasyllus is the imperial court astrologer, navigating political intrigue with a blend of caution and ambition. While his nervous demeanor and obsequious manner underscore his precarious position, his astuteness in understanding court dynamics makes him a key, if discreet, advisor.',
        a.traits = ["Nervous", "Obsequious", "Astute", "Cautious"],
        a.sphere_of_influence = 'Astrology and Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_sejanus'})
    ON CREATE SET
        a.name = 'Sejanus',
        a.title = 'Praetorian Prefect',
        a.description = 'Sejanus, the Praetorian Prefect, is a master manipulator whose cunning ambition guides his political schemes. By intercepting Claudius and challenging his marital decisions, he reveals his determination to serve his own family\'s interests. His charm masks a ruthless streak as he engineers alliances to consolidate power.',
        a.traits = ["Manipulative", "Confident", "Power-hungry", "Deceptive"],
        a.sphere_of_influence = 'Politics'
    ;
MERGE (a:Agent {uuid: 'agent_caligula'})
    ON CREATE SET
        a.name = 'Gaius Caligula',
        a.title = 'None',
        a.description = 'Gaius Caligula is portrayed as a sinister figure within the imperial court, embodying malevolence and ruthless ambition. His dark humor and manipulative interactions, particularly with his Uncle Claudius, hint at an emerging tyrannical nature and a deeper, unsettling madness.',
        a.traits = ["Malevolent", "Ambitious", "Cruel", "Manipulative"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_varro'})
    ON CREATE SET
        a.name = 'Varro',
        a.title = 'Centurion',
        a.description = 'Varro is a centurion and legal advisor representing the State Senate. Tasked with enforcing the Senate\'s orders during the arrest of Silius Caecina, he embodies the authority of both legal and military power in ancient Rome, executing his duty with cautious pragmatism.',
        a.traits = ["Cautious", "Pragmatic", "Authoritative", "Dedicated"],
        a.sphere_of_influence = 'Legal and Military'
    ;
MERGE (a:Agent {uuid: 'agent_castor'})
    ON CREATE SET
        a.name = 'Castor',
        a.title = 'Son of Tiberius',
        a.description = 'Castor, the son of Emperor Tiberius, navigates the troubled dynamics of imperial power with skepticism and protectiveness. His questioning of the legitimacy of Varro\'s actions and his concern for the unjustly targeted reflect the weight of legacy and expectation in the imperial family.',
        a.traits = ["Skeptical", "Protective", "World-weary", "Aristocratic"],
        a.sphere_of_influence = 'Imperial Family'
    ;
MERGE (a:Agent {uuid: 'agent_guard_1'})
    ON CREATE SET
        a.name = 'Guard 1',
        a.title = 'Guard',
        a.description = 'Guard 1 is a minor character in the palace antechamber, serving to maintain protocol and order. His impassive and obedient demeanor underscores the strict hierarchical structure of the imperial court.',
        a.traits = ["Impassive", "Obedient", "Formal", "Silent Observer"],
        a.sphere_of_influence = 'Palace Security'
    ;
MERGE (a:Agent {uuid: 'agent_silius_caecina'})
    ON CREATE SET
        a.name = 'Silius Caecina',
        a.title = 'None',
        a.description = 'Silius Caecina is Agrippina\'s friend who has been arrested and accused of treasonable utterances. His situation, marked by persecution under Tiberius, serves to underscore the oppressive and paranoid nature of imperial rule.',
        a.traits = ["Victim of persecution", "Friend of Agrippina", "Accused of treason"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_livilla'})
    ON CREATE SET
        a.name = 'Livilla',
        a.title = 'None',
        a.description = 'Livilla, the sister of Claudius, is portrayed as detached from literary and intellectual pursuits. Known for her superficial tastes, she is more aligned with the political and social maneuverings of the Roman court.',
        a.traits = ["Detached", "Superficial", "Politically inclined", "Not culturally engaged"],
        a.sphere_of_influence = 'Imperial court dynamics'
    ;
MERGE (a:Agent {uuid: 'agent_helen'})
    ON CREATE SET
        a.name = 'Helen',
        a.title = 'None',
        a.description = 'Helen is the daughter of Castor and Livilla, depicted as a gentle and affectionate young girl on the cusp of adolescence. Her brief appearance as a dutiful daughter highlights the private familial dynamics amid the larger political intrigues.',
        a.traits = ["Affectionate", "Dutiful", "Innocent", "Youthful"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_herod'})
    ON CREATE SET
        a.name = 'Herod',
        a.title = 'Judean Prince',
        a.description = 'Herod is a shrewd Judean courtier known for his cynical wit and pragmatic advice. Positioned as an outsider amid the Julio-Claudian madness, his observations and clever commentary provide practical, albeit dark-humored, insights into the political chaos of Rome.',
        a.traits = ["Shrewd", "Cynical", "Pragmatic", "Observant"],
        a.sphere_of_influence = 'Political maneuvering'
    ;
MERGE (a:Agent {uuid: 'agent_germanicus'})
    ON CREATE SET
        a.name = 'Germanicus',
        a.title = 'None',
        a.description = 'Germanicus, mentioned as Agrippina\'s deceased husband, is a pivotal figure whose death profoundly affected her life. His loss represents a significant turning point for Agrippina and continues to influence the political and emotional landscape of the imperial court.',
        a.traits = ["Deceased", "Agrippina's husband", "Significant loss for Agrippina"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_piso'})
    ON CREATE SET
        a.name = 'Piso',
        a.title = 'None',
        a.description = 'Piso is referenced by Tiberius as a figure from his past whom he was compelled to act against due to Agrippina\'s influence. Although only briefly mentioned, his presence hints at unresolved resentment and complex manipulations underlying the relationship between Tiberius and Agrippina.',
        a.traits = ["Subject of past conflict", "Victim of Tiberius (at Agrippina's behest)", "Source of Tiberius's resentment"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_nero'})
    ON CREATE SET
        a.name = 'Nero',
        a.title = 'None',
        a.description = 'Nero, one of Agrippina\'s sons, is characterized by the neglect he suffers from Tiberius. His sidelined status contrasts with the favoritism shown to Caligula, highlighting the vulnerabilities and familial tensions within the imperial household.',
        a.traits = ["Agrippina's son", "Neglected by Tiberius", "Brother of Drusus and Caligula"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_drusus'})
    ON CREATE SET
        a.name = 'Drusus',
        a.title = 'None',
        a.description = 'Drusus, another son of Agrippina, suffers from Tiberius\'s neglect alongside his brother Nero. His mention serves to further underscore Agrippina\'s maternal concerns and the disparities in imperial favor that exacerbate familial vulnerability.',
        a.traits = ["Agrippina's son", "Neglected by Tiberius", "Brother of Nero and Caligula"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_augustus'})
    ON CREATE SET
        a.name = 'Augustus',
        a.title = 'Divine',
        a.description = 'Augustus, the deified first Roman Emperor, is invoked for his enduring legacy as a divine figurehead and symbol of imperial authority. His influence pervades the narrative, serving as a moral and historical touchstone for the actions and justifications of both Tiberius and Agrippina.',
        a.traits = ["Deified", "First Roman Emperor", "Symbol of Roman Imperial Authority", "Augustus's Grandfather"],
        a.sphere_of_influence = 'Roman Empire (Posthumous)'
    ;
MERGE (a:Agent {uuid: 'agent_postumus'})
    ON CREATE SET
        a.name = 'Postumus Agrippa',
        a.title = 'None',
        a.description = 'Postumus Agrippa is mentioned by Agrippina as a figure persecuted by Tiberius in the past. His mention, particularly as a point of familial comparison, underscores the recurring theme of internal strife and ruthless persecution within the imperial lineage.',
        a.traits = ["Augustus's grandson", "Persecuted by Tiberius (and possibly Augustus)", "Brother of Agrippina (implied)"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_aelia'})
    ON CREATE SET
        a.name = 'Aelia',
        a.title = 'None',
        a.description = 'Aelia is introduced as Sejanus\'s sister and the proposed bride for Claudius. Though she does not appear in the scene, Sejanus describes her as beautiful and independent, suggesting that her political usefulness and ambition make her a desirable match intended to serve as a strategic tool in his power plays.',
        a.traits = ["Beautiful (as described by Sejanus)", "Independent (as described by Sejanus)", "Politically Useful", "Ambitious (implied through Sejanus's plan)"],
        a.sphere_of_influence = 'Marriage Alliance'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia',
        a.title = 'None',
        a.description = 'Antonia acts as a voice of reason within the chaotic imperial court. Her rational perspective and moral awareness position her as a protective figure who challenges questionable decisions and provides grounded advice amidst the political intrigue.',
        a.traits = ["Rational", "Concerned", "Protective", "Morally aware"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (o:Object {uuid: 'object_knife'})
    ON CREATE SET
        o.name = 'Knife',
        o.description = 'The knife is mentioned by Lollia as a symbolic object of intended self-harm and violent rejection of her defilement. Lollia states she would have used it to \'cut out\' the \'befouled\' part of herself, highlighting her extreme distress, suicidal ideation, and desire to purge the trauma inflicted by Tiberius.',
        o.purpose = 'Symbolic self-harm and expression of despair.',
        o.significance = 'Represents Lollia\'s trauma and suicidal thoughts.'
    ;
MERGE (o:Object {uuid: 'object_erotic_paintings'})
    ON CREATE SET
        o.name = 'Erotic Paintings',
        o.description = 'The erotic paintings in Tiberius\'s secret palace room depict scenes of \'incredible beastliness\' that are shocking and morally repugnant, serving as evidence of Tiberius\'s depravity. These paintings are used as tools of psychological manipulation and indicators of the court\'s moral decay.',
        o.purpose = 'Erotic display, psychological manipulation, and indication of depravity.',
        o.significance = 'Symbolize Tiberius\'s corruption and the moral decay of the court.'
    ;
MERGE (o:Object {uuid: 'object_livia_horoscope'})
    ON CREATE SET
        o.name = 'Livia\'s Horoscope',
        o.description = 'An astrological chart intended to predict Livia\'s future, particularly her lifespan. Initially cast by Thrasyllus at Tiberius\'s behest, it symbolically represents the interplay between control, familial tension, and political calculation within the imperial family.',
        o.purpose = 'Astrological prediction of Livia\'s future.',
        o.significance = 'Symbol of Tiberius\'s resentment and desire to control Livia\'s fate, reflecting the broader manipulations within the family.'
    ;
MERGE (o:Object {uuid: 'object_treason_reports'})
    ON CREATE SET
        o.name = 'Verbatim Reports of Conversations',
        o.description = 'Scrolls containing \'verbatim reports of conversations taken down by my agents,\' as recounted by Sejanus. These scrolls document secret discussions and serve as tangible evidence of widespread treason and disloyalty, underpinning the oppressive surveillance system within Rome.',
        o.purpose = 'Provides evidence of treason and disloyalty.',
        o.significance = 'Symbol of surveillance and political control, fueling Tiberius\'s paranoia.'
    ;
MERGE (o:Object {uuid: 'object_antique_statue'})
    ON CREATE SET
        o.name = 'Antique Statue',
        o.description = 'A small, antique statue gifted from Caligula to Tiberius. Allegedly originating from Elephantis in Egypt and 200 years old, it was presented as an \'anniversary\' gift. Its high cost and the means by which Caligula acquired it underscore its superficial display of familial affection and opportunism.',
        o.purpose = 'Gift and decorative object.',
        o.significance = 'Symbol of superficial familial affection and Caligula\'s opportunism.'
    ;
MERGE (o:Object {uuid: 'object_evidence_silius_caecina_impeachment'})
    ON CREATE SET
        o.name = 'Evidence for Impeaching Silius Caecina',
        o.description = 'A collection of evidence, largely derived from the \'verbatim reports\', which Sejanus presents as a case for impeaching Silius Caecina in the Senate. Though not a tangible physical object in the traditional sense, it is narratively crucial as it drives the plot regarding the manufacture of treason accusations.',
        o.purpose = 'Legal basis for impeaching Silius Caecina.',
        o.significance = 'Symbol of political manipulation and manufactured treason.'
    ;
MERGE (o:Object {uuid: 'object_bed'})
    ON CREATE SET
        o.name = 'Bed',
        o.description = 'A substantial piece of furniture in Castor\'s bedchamber, likely made of wood and adorned with rich textiles. It is the central fixture of the room where Castor rests at the end of a tiring day, marking the transition from wakefulness to sleep.',
        o.purpose = 'Resting and sleeping.',
        o.significance = 'Sets the stage for private conversation and reflects Castor\'s weariness.'
    ;
MERGE (o:Object {uuid: 'object_scroll_livias_invitation'})
    ON CREATE SET
        o.name = 'Scroll',
        o.description = 'A scroll serving as Livia\'s invitation to Claudius for dinner on her birthday. The formal and somewhat menacing wording of the invitation highlights Livia\'s unpredictable influence and the tension inherent in her interactions with Claudius.',
        o.purpose = 'Invitation to dinner.',
        o.significance = 'Acts as the catalyst inciting Claudius\'s anxiety and driving the scene\'s dialogue.'
    ;
MERGE (o:Object {uuid: 'object_bust_of_sejanus'})
    ON CREATE SET
        o.name = 'Bust of Sejanus',
        o.description = 'A replica bust depicting the head of Sejanus, originally part of a statue erected at Pompey Theatre. Made of stone or plaster, it is widely available in the Roman Forum and reflects the rising political influence of Sejanus as well as the state-sponsored promotion of his image.',
        o.purpose = 'Political propaganda and decorative object.',
        o.significance = 'Symbolizes Sejanus\'s power and the pervasive political climate of the time.'
    ;
MERGE (o:Object {uuid: 'object_wine'})
    ON CREATE SET
        o.name = 'Wine',
        o.description = 'Wine, mentioned by Herod, is suggested as something Claudius should bring to dinner at Livia\'s. The reference implies potential danger, as the wine could be a vehicle for poisoning or other treachery within the intrigues of the Roman court.',
        o.purpose = 'Beverage and potential means of poison.',
        o.significance = 'Symbolizes potential danger and the intrigue that pervades the court.'
    ;
MERGE (o:Object {uuid: 'object_statue_of_augustus'})
    ON CREATE SET
        o.name = 'Statue of Augustus',
        o.description = 'A grand statue, likely crafted from marble or bronze, that dominates Tiberius\'s Private Temple. Depicting the deified first Roman Emperor in a dignified pose, the statue provides a focal point for worship, illustrating the enduring legacy of Augustus and the ideological weight it bears on Tiberius.',
        o.purpose = 'Object of worship and supplication.',
        o.significance = 'Embodies the imperial legacy and divine authority of Augustus.'
    ;
MERGE (o:Object {uuid: 'object_libation'})
    ON CREATE SET
        o.name = 'Libation',
        o.description = 'A ritual offering, likely consisting of wine or oil, poured by Tiberius before the statue of Augustus. This act, meant to ensure divine favor and legitimacy, becomes a focal point of criticism when juxtaposed with Agrippina\'s accusations of hypocrisy.',
        o.purpose = 'Ritual offering to a deity.',
        o.significance = 'Highlights Tiberius\'s attempt to reconcile his public religious devotion with his morally dubious actions.'
    ;
MERGE (o:Object {uuid: 'object_indian_vase'})
    ON CREATE SET
        o.name = 'Indian Vase',
        o.description = 'A beautifully crafted vase from India presented by Claudius as a birthday gift to Livia. The vase not only displays opulence but also serves as an instrument through which Claudius attempts to bridge the emotional distance with his grandmother amid familial tensions.',
        o.purpose = 'To serve as a birthday gift and symbol of goodwill.',
        o.significance = 'Reflects Claudius\'s desire for approval and his position within complex family dynamics.'
    ;
MERGE (o:Object {uuid: 'object_sibylline_scroll'})
    ON CREATE SET
        o.name = 'Sibylline Verses Scroll',
        o.description = 'A scroll containing rejected Sibylline verses that Livia gifts to Claudius. It carries a prophetic message regarding Claudius\'s potential future as Emperor, intertwining themes of fate, ambition, and manipulation within the political landscape.',
        o.purpose = 'To communicate a prophecy that Claudius will one day become Emperor.',
        o.significance = 'Embodies the themes of fate and ambition and influences Claudius\'s future trajectory.'
    ;
MERGE (o:Object {uuid: 'object_coin'})
    ON CREATE SET
        o.name = 'Coin',
        o.description = 'A simple ancient Roman coin, likely bronze or silver, intended for the traditional payment to Charon, the ferryman of the underworld. Its presence underscores the customs surrounding death and the transition from life to afterlife.',
        o.purpose = 'To pay Charon for passage to the afterlife.',
        o.significance = 'Symbolizes Livia\'s impending death and traditional beliefs about the afterlife.'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_reception_chamber'})
    ON CREATE SET
        l.name = 'Imperial Palace Reception Chamber',
        l.description = 'The reception chamber within the Imperial Palace is depicted as a space of opulent decadence, yet underscored by moral corruption. Erotic paintings adorn the walls, suggesting a perversion and objectification inherent in this seat of power. Rich furnishings clash with an underlying sense of decay, hinting at a society where outward appearances mask inner rot. This room serves as a stage for private gatherings among the Roman elite, where appearances are maintained even as scandalous truths are revealed.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_antioch'})
    ON CREATE SET
        l.name = 'Antioch',
        l.description = 'Antioch is a distant province where Lollia and Titus first encountered the performer who entertained their guests. It is referenced as a place of origin outside of Rome, representing a source of exotic entertainment and a contrast to Rome’s perceived sophistication and corruption. It highlights the wider reach of Roman influence and cultural exchange.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_palace_tiberius_erotic_art_room'})
    ON CREATE SET
        l.name = 'Palace Room with Erotic Art',
        l.description = 'This secret room within Tiberius\'s Palace is designed specifically for receptions of a perverse nature. The walls are hung with erotic art depicting scenes of incredible beastliness, reflecting a disturbing aesthetic favored by the Emperor. As a hidden chamber of imperial depravity, it stands in stark contrast to the rest of the opulent Imperial Palace, revealing a hidden layer of darkness within power.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_roman_street'})
    ON CREATE SET
        l.name = 'Roman Street',
        l.description = 'The Roman Street is a bustling thoroughfare in ancient Rome, filled with the vibrant sounds of daily life. Merchants, citizens, and soldiers contribute to its lively atmosphere against a backdrop of grand, intricately adorned buildings. It serves as a stage for imperial announcements amidst the ordinary hustle of the city.',
        l.type = 'Street'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_audience_hall'})
    ON CREATE SET
        l.name = 'Imperial Palace - Audience Hall',
        l.description = 'The audience hall within the Imperial Palace is a formal, imposing space designed to impress and intimidate. Dark, brooding décor, heavy draperies, and oil lamps create an atmosphere of secrecy and hidden agendas. This hall is used for official business and whispering plots, reflecting the oppressive nature of Tiberius\'s rule.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_rhodes'})
    ON CREATE SET
        l.name = 'Rhodes',
        l.description = 'Rhodes is an island in the Aegean Sea mentioned by Tiberius as a place he wishes he had stayed, symbolizing a period of tranquility and escape from imperial burdens. It stands in stark contrast to the politically charged atmosphere of Rome and the Imperial Palace, representing peace and personal freedom.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_elephantis'})
    ON CREATE SET
        l.name = 'Elephantis',
        l.description = 'Elephantis is a city in Egypt mentioned as the origin of the antique statue gifted to Tiberius by Caligula. Known as a trading hub for exotic goods and antiquities, it adds a note of mystery and exoticism to the narrative.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_egypt'})
    ON CREATE SET
        l.name = 'Egypt',
        l.description = 'Egypt is a province of the Roman Empire, characterized as a distant land rich in history and exotic goods, connected to Rome through thriving trade routes. It provides the backdrop for the arrival of antiquities and adds to the opulence of the Empire.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_roman_villa_secluded_garden'})
    ON CREATE SET
        l.name = 'Roman Villa - Secluded Garden',
        l.description = 'This secluded garden within a vast Roman villa is encircled by ivy-clad walls, creating a private oasis away from the attention of the imperial court. Soft light, lush greenery, and night-blooming jasmine enhance its intimate and secretive ambiance, making it the perfect setting for clandestine conspiracies and heated discussions.',
        l.type = 'Garden'
    ;
MERGE (l:Location {uuid: 'location_castors_bedchamber'})
    ON CREATE SET
        l.name = 'Castor\'s Bedchamber',
        l.description = 'Castor\'s bedchamber is a dimly lit and intimate space within a Roman villa. Characterized by a single oil lamp and a central bed that offers sanctuary after a long day, the room reflects personal retreat amidst the demands of public life. It becomes a setting for clandestine intentions and subtle tensions between characters.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_roman_forum'})
    ON CREATE SET
        l.name = 'Roman Forum',
        l.description = 'The Roman Forum is depicted as a bustling public space at the heart of Rome. This marketplace and meeting area is alive with commerce, political discussions, and lively interactions, serving as a central hub for the city\'s public life and social dynamics.',
        l.type = 'Public Forum'
    ;
MERGE (l:Location {uuid: 'location_pompey_theatre'})
    ON CREATE SET
        l.name = 'Pompey Theatre',
        l.description = 'Pompey Theatre is a significant public space in Rome where a statue of Sejanus has been erected. While it is traditionally associated with entertainment and public gatherings, in this context it also serves as a site for political statement and propaganda, reflecting Sejanus\'s rising status.',
        l.type = 'Theatre'
    ;
MERGE (l:Location {uuid: 'location_livias_residence'})
    ON CREATE SET
        l.name = 'Livia\'s Residence',
        l.description = 'Livia\'s Residence is implied as the destination for Claudius\'s upcoming dinner. It is defined by its formality and the potential for tension, given Livia’s powerful and somewhat intimidating presence. This residence carries weight in the narrative as a symbol of both personal and political gravity.',
        l.type = 'Residence'
    ;
MERGE (l:Location {uuid: 'location_judea'})
    ON CREATE SET
        l.name = 'Judea',
        l.description = 'Judea is mentioned in a retort by Claudius to Herod, highlighting it as Herod\'s place of origin. It serves as a contrasting location to Rome, emphasizing the outsider status and complex relationship Herod has with his homeland.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_tiberius_private_temple'})
    ON CREATE SET
        l.name = 'Tiberius\'s Private Temple',
        l.description = 'Tiberius\'s Private Temple is an intimate and solemn space for personal worship and reflection. Housing a statue of the deified Augustus, it symbolizes imperial ideology and ancestor veneration. Its peaceful, reverent atmosphere is starkly disrupted when Agrippina intrudes, highlighting the collision between private piety and public political power.',
        l.type = 'Temple'
    ;
MERGE (l:Location {uuid: 'location_lavish_banquet_hall'})
    ON CREATE SET
        l.name = 'Lavish Banquet Hall',
        l.description = 'The banquet hall is opulently decorated with torchlight reflecting off gold and jewels. Dominated by a long table laden with exotic foods and lavish gifts, it provides a setting for political maneuvering and familial rivalry, where superficial smiles conceal deeper ambitions and treachery.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_palace_antechamber'})
    ON CREATE SET
        l.name = 'Palace Antechamber',
        l.description = 'The palace antechamber is a subdued, shadowy space within the palace designed for waiting and private conversations away from the main halls. It functions as a transitional area for interception and discreet talks, its tension underlined by the presence of a guard and the secretive nature of palace intrigues.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_corridor'})
    ON CREATE SET
        l.name = 'Palace Corridor',
        l.description = 'The palace corridor is a grand passageway lined with marble columns and adorned with tapestries and intricate mosaics depicting the Julio-Claudian dynasty. Flickering torches cast dancing shadows, imbuing the space with both opulence and an undercurrent of political intrigue.',
        l.type = 'Corridor'
    ;
MERGE (l:Location {uuid: 'location_palace_gardens'})
    ON CREATE SET
        l.name = 'Palace Gardens',
        l.description = 'The palace gardens extend from the imperial residence as a meticulously cultivated sanctuary. Winding paths, groves of cypress and laurel, marble statues, and softly murmuring fountains create a tranquil retreat that contrasts with the intense political machinations within the palace.',
        l.type = 'Garden'
    ;
MERGE (l:Location {uuid: 'location_livias_bedchamber'})
    ON CREATE SET
        l.name = 'Livia\'s Bedchamber',
        l.description = 'Livia\'s Bedchamber is a somber and private space within the palace, marked by dim light, quiet echoes, and the lingering scent of incense. It embodies the fading power and imminent loss associated with Livia, reflecting both personal tragedy and the weight of political decline.',
        l.type = 'Room'
    ;
MERGE (o:Organization {uuid: 'org_roman_senate'})
    ON CREATE SET
        o.name = 'Roman Senate',
        o.description = 'The Roman Senate is the governing and advisory assembly of the Roman Republic. Composed of patrician and plebeian upper classes, it maintained a legislative and judicial role even in the imperial era, albeit with significantly curtailed powers under an emperor. It serves as a venue for political maneuvering and trials, including discussions such as the impeachment of Silius Caecina.',
        o.sphere_of_influence = 'Political Governance'
    ;
MERGE (o:Organization {uuid: 'org_roman_army'})
    ON CREATE SET
        o.name = 'Roman Army',
        o.description = 'The Roman Army is the expansive military apparatus of ancient Rome, tasked with territorial expansion, defense, and internal order. It is structured into legions, regiments, and auxiliary units, with deployments across the empire, such as along the Rhine frontier, and is noted for episodes of mutiny and political instability, evidencing its significant influence and the critical importance of soldier loyalty.',
        o.sphere_of_influence = 'Military, Roman Empire'
    ;
MERGE (o:Organization {uuid: 'org_imperial_court'})
    ON CREATE SET
        o.name = 'Imperial Court',
        o.description = 'The Imperial Court of Rome was the epicenter of power and intrigue during the Julio-Claudian dynasty. It comprised the Emperor, his family, advisors, officials, nobles, and courtiers. Known for its opulence and formality, the court was also a hotbed of political rivalry, ambition, and betrayal, serving as the setting for pivotal political decisions and personal conflicts.',
        o.sphere_of_influence = 'Roman Politics, Imperial Administration'
    ;
MERGE (ep:Episode {uuid: 'episode_queen_of_heaven'})
    ON CREATE SET
        ep.title = 'Queen of Heaven',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Lollia\'s Sacrifice',
        s.description = 'The scene unfolds in the opulent reception chamber of the Imperial Palace, adorned with erotic paintings that reflect the duality of beauty and moral decay. The atmosphere is charged with tension and trepidation, a microcosm of the anxieties pervading the Julio-Claudian dynasty. As Lollia reveals the harrowing account of her encounter with Tiberius, her desperation and anguish seep into the air, transforming what begins as a celebration into a confessional of unimaginable sacrifice. The emotional atmosphere oscillates between celebration and horror, echoing the intricate dance of power and subjugation that defines this court. This scene plays a pivotal role in exposing the depths of imperial depravity and the lengths to which Lollia will go to protect her daughter, Camilla, vividly capturing the brutal realities of a mother\'s love. Key themes of familial loyalty, sacrifice, and the corruption of power are woven throughout, laying bare the human cost of ambition within the treacherous landscape of Roman politics.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'The Performance Unveiled',
        e.description = 'In an opulent chamber, Lollia initiates a celebration only to unveil a shocking truth regarding her daughter. As she recounts her experience with Tiberius, the atmosphere shifts from festivity to dread, exposing the dangers lurking in the imperial court. The revelation that Tiberius summoned Camilla, and Lollia\'s decision to accompany her, lays the groundwork for the ensuing emotional turmoil. The juxtaposition of their earlier merriment against the backdrop of Lollia’s horrifying tale starkly illustrates the precariousness of their position within the imperial hierarchy.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Beautiful. Lollia! Where did you find her?", "LOLLIA: Thank you Claudius, but I wasn't inviting a compliment. It's just that I have something to perform."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'The Horrifying Summons',
        e.description = 'Lollia reveals the harrowing details of Tiberius\'s interest in Camilla and the summons she received, which she chose not to disclose to Titus to avoid panic. This revelation signifies a turning point, as Lollia\'s protective instincts clash with the realization of their daughter’s vulnerability. The horror escalates as she recounts Tiberius\'s inappropriate behavior during their meeting, highlighting the corrupting influence of power and the lengths to which Lollia must go to shield her child from the depravity of the emperor.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LOLLIA: A summons to the Emperor is not something to be refused, but naturally I wouldn't let my daughter go alone, knowing his reputation.", "TITUS: What? A summons? You never told me."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Lollia\'s Desperate Bargain',
        e.description = 'In a heart-wrenching emotional climax, Lollia makes the harrowing decision to offer herself to Tiberius in place of Camilla, underscoring the depths of a mother\'s love and sacrifice. She articulates the abomination of the acts she endured, painting a vivid picture of the imperial court\'s moral decay. This moment crystallizes the themes of sacrifice and the extreme measures one can be driven to protect their kin, transforming Lollia from a mere mother into a tragic heroine ensnared by the greed and depravity of power.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LOLLIA: Yes, Titus, my husband... to save my daughter, I offered myself in her place.", "LOLLIA: If I'd had this with me then, I'd have used it on him."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'The Aftermath of Trauma',
        e.description = 'The emotional fallout from Lollia\'s sacrifice reverberates through the chamber, as she describes the horrific experiences she endured at Tiberius\'s behest. Her agony becomes palpable, revealing her struggle to reconcile her love for Titus with the trauma inflicted upon her. The weight of her suffering looms heavy, producing a moment of stark vulnerability that challenges the very fabric of her relationship with Titus. This event encapsulates the haunting legacy of power and the moral compromises that define their lives.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LOLLIA: I should have gone to the gate... into the room, out again... No one would have been the wiser.", "LOLLIA: If there'd been just one part of me befouled by his lust, I should have come home and cut it out!"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Street Intercept',
        s.description = 'A bustling Roman street, filled with the sounds of everyday life, is suddenly disrupted by the urgent shouts of approaching soldiers. The Emperor\'s procession forces its way through the crowded thoroughfare, creating a stark contrast between imperial power and the common citizenry. The air crackles with anticipation and perhaps a hint of fear as people are pushed aside to clear the path. This public space becomes a stage for a private, yet intensely dramatic, confrontation as Livia intercepts her son, Emperor Tiberius, their exchange immediately charged with familial tension and political undertones. The scene highlights the ever-present awareness of imperial authority in Rome and the personal battles fought even in the most public of settings, revealing the complex and often corrosive dynamics within the ruling family.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Emperor\'s Approach Announced',
        e.description = 'The clamor of approaching soldiers shatters the everyday sounds of the Roman street. Their urgent cries demand that civilians clear the way for the Emperor\'s procession, instantly establishing a sense of imperial authority and the disruption it imposes on daily life. The forceful commands create an atmosphere of both anticipation and slight unease as the unseen Emperor\'s arrival is heralded.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["SOLDIER (O.S.): Make way, there! Move aside for the Emperor! Don't block the road! Make way, there! Stand aside! Clear the road for the Emperor! Make way!"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Livia\'s Street Confrontation',
        e.description = 'Livia, having anticipated her son\'s route, intercepts Tiberius directly in the street.  She immediately launches into a barbed greeting, dripping with sarcasm and thinly veiled criticism about his \'affectionate eagerness\' to see her.  Her tone is accusatory and demanding from the outset, setting the stage for a tense and public familial argument.  She wastes no time in pivoting to her grievances, questioning him about treason trials and his perceived neglect of her, revealing her constant need for validation and control even over the Emperor himself.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Well, well! Is it my son who greets his mother with such affectionate eagerness?", "TIBERIUS: Good day, Mother.", "LIVIA: In a hurry, are you? What is it, another treason trial? Who is it today?", "TIBERIUS: There are no trials today, Mother.", "LIVIA: Slipped up have you? Ran out of people to prosecute? Well, perhaps you'll have more time to spend with your mother."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Escalating Maternal Demands',
        e.description = 'Livia persists in her public harangue, dismissing Tiberius\' attempts to de-escalate with pointed accusations of deafness and emotional neglect. She then shifts to a direct demand for recognition and power, berating him for refusing a temple in her honor and explicitly stating her birthday expectations.  Her relentless questioning and sharp tone highlight her domineering personality and her expectation of absolute obedience and lavish displays of respect from her son, the Emperor.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: There is no need to shout, I'm not deaf.", "LIVIA: You've been deaf to me for years. Why did you refuse the ambassador's from Spain permission to erect a temple to me?"]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Tiberius\' Curt Dismissal and Livia\'s Bitter Jab',
        e.description = 'Tiberius attempts to shut down the public argument, asserting his imperial prerogative by refusing to discuss \'such matters in the street\' and curtly wishing Livia \'Good day\' twice, signaling his desire to escape the confrontation.  However, Livia has the last word, firing a final, venomous barb about her birthday gift and contrasting Tiberius unfavorably with his deceased brother Drusus. This parting shot underscores her deep-seated disappointment in Tiberius and her continuing manipulation, even as he attempts to distance himself.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["TIBERIUS: I will not discuss such matters in the street. Good day, Mother. Move on. Good day.", "LIVIA: It's my birthday next month! What are you going to buy me? I heard about Lollia! Disgusting! Your brother Drusus was worth ten of you!"]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Weight of Ambition',
        s.description = 'The scene unfolds in the brooding audience hall of the Imperial Palace, where the air is thick with tension and the shadows stretch ominously across the walls. Tiberius, the weary Emperor of Rome, stands impatiently, his furrowed brow and haunted gaze revealing the heavy burden of his reign. Dark draperies hang, absorbing the flickering oil lamp light, setting a somber mood that underscores the gravity of the conversations taking place. Tiberius\'s frustration with his mother Livia\'s incessant presence looms large as he summons the astrologer Thrasyllus to cast her horoscope, a task he approaches with ironic disdain, hinting at his deep-seated conflict with her influence. The dynamic shifts with the arrival of Sejanus, his ambitious advisor, whose subtle machinations and observant demeanor add a layer of manipulation to the proceedings. As they discuss treasonous whispers echoing through the city, the atmosphere grows increasingly charged. The entrance of Caligula, radiating youthful exuberance, serves as a jarring contrast to the oppressive foreboding, revealing the delicate balance of power and the impending chaos that brews beneath the surface. This scene encapsulates the intricate dance of ambition, paranoia, and familial tension that characterizes the Julio-Claudian dynasty, highlighting the precarious nature of power in ancient Rome.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_audience_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Tiberius Summons the Astrologer',
        e.description = 'Tiberius, visibly weary, impatiently awaits the arrival of Thrasyllus, the astrologer. His frustration with the constant interference of his mother Livia is palpable as he expresses a desire to understand how much longer he must endure her presence. The tension underscores an Emperor grappling with familial obligations and personal disdain.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Thrasyllus! Where is that damned astrologer?", "Because I want to know how much longer I have to put up with her, that's what's for."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Sejanus Offers Insight',
        e.description = 'Sejanus, observing the tension between Tiberius and Livia\'s influence, suggests that Tiberius could simply ask Livia for her horoscope, highlighting his role as a power broker within the court. His subtle smile hints at deeper ambitions as he continues to manipulate the dynamics at play.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Why don't you ask her? It's her birthday soon. You could tell her son wants to make a present of her horoscope."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Discussion of Treason',
        e.description = 'As the conversation shifts, Sejanus presents reports of treasonous conversations, revealing the paranoia that grips Rome. Tiberius\'s sardonic remarks on the pervasive treachery in the city highlight his own sense of isolation and frustration with the political landscape.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Doesn't anybody in this city ever say anything that isn't either vicious or treasonable?", "We've had more treason trials than in the whole of the previous ten!"]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Caligula’s Entrance',
        e.description = 'Caligula bursts into the room, radiating manic energy and presenting a gift to Tiberius. His carefree demeanor contrasts sharply with the heavy atmosphere, injecting a moment of levity before the seriousness of the political discussions resumes. The antique statue he presents serves as both a token of affection and an unsettling reminder of his unpredictable nature.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["I brought you a present.", "It took me a year to find it."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Sejanus Suggests Impeachment',
        e.description = 'Sejanus seizes the opportunity to discuss the possibility of impeaching Silius Caecina for treason, highlighting the calculated nature of his ambitions. The conversations illustrate the politically charged atmosphere in the court, where every small insult or slight can lead to dangerous ramifications.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["I would like you to examine the evidence to see if there's a case for impeaching Silius Caecina in the Senate.", "Never mind precedent. I want Silius Caecina impeached on a charge of treason."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Secrets and Suspicions in the Garden',
        s.description = 'In the tranquil yet secluded garden of the Roman villa, ivy-clad walls and soft shadows create an atmosphere of clandestine whispers. The air hangs heavy with the intoxicating aroma of night-blooming jasmine, a fragrant veil for the tense confrontation unfolding. Castor stands before his father, Tiberius, his posture rigid with frustration, while Livilla observes from the periphery, her expression a mask of veiled anxiety. The scene is thick with unspoken accusations and simmering resentments as Castor attempts to pierce Tiberius\'s delusion regarding Sejanus\'s ambition. The gentle lighting casts long, dancing shadows, amplifying the secretive nature of their conversation and the underlying paranoia that permeates the imperial family. This hidden garden becomes a stage for familial discord, a place where suspicions bloom as vividly as the surrounding jasmine, revealing the deep-seated mistrust and political maneuvering that defines their world.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_villa_secluded_garden'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Accusation of Enmity',
        e.description = 'Castor initiates a heated exchange with Tiberius, vehemently denying that Germanicus was ever Tiberius\'s enemy. Tiberius, however, is resolute in his belief, asserting that Germanicus harbored ambitions against him and that he possesses proof of this in his files. He reveals his distrust of Germanicus and his widow, setting the stage for the central conflict regarding Sejanus\'s influence.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CASTOR: Germanicus was never your enemy!", "TIBERIUS: I tell you he was my enemy! I know what his ambitions were. I have the proof here in the files. And I know how his widow conspires against me now."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Warning Against Sejanus\'s Manipulation',
        e.description = 'Castor, growing increasingly agitated, challenges Tiberius\'s reliance on Sejanus. He questions the source of Tiberius\'s \'proof,\' pointedly asking if it originates from Sejanus. Castor accuses Sejanus of manipulating Tiberius, arguing that Sejanus controls the information Tiberius receives and the people he sees, painting a picture of Sejanus\'s insidious control over the Emperor.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CASTOR: Proof? From SEJANUS?", "TIBERIUS: Yes! From Sejanus. Well, he at least, unlike my son, keeps me informed of what goes on in this city!", "CASTOR: Oh, Father, open your eyes! The man is using you. You know nothing he doesn't want you to know and you see no one he doesn't want you to see."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Tiberius Defends Sejanus and Accuses Castor of Envy',
        e.description = 'Tiberius vehemently defends Sejanus, proclaiming him a \'partner\' in his labors and dismissing Castor\'s concerns as mere envy. He throws back Castor\'s past indiscretions, contrasting Castor\'s perceived frivolous lifestyle with Sejanus\'s dedicated service, highlighting a deep-seated resentment and a refusal to acknowledge Sejanus\'s potential treachery.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: He is the partner of my labors.", "CASTOR: Yes. And soon he'll be your colleague, but even that won't be enough for him. That man has an apetite for power unknown to you and me.", "TIBERIUS: Envy! Envy! You envy him because for years he worked while you and that Judean friend of yours, Herod, spent your days and nights whoring around the city! He worked to relieve me of some my labors!"]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'Castor Foresees Sejanus\'s Tyranny',
        e.description = 'Ignoring Tiberius\'s accusations, Castor persists in his warning, painting a stark picture of Sejanus\'s ambition. He describes Sejanus\'s growing public presence—statues and spy network—as the construction of a metaphorical prison for Rome, predicting a future tyranny under Sejanus after Tiberius\'s death. His impassioned plea underscores the gravity of the threat he perceives.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CASTOR: Well, that's true, but if you think he's working for you, you're mistaken. He's working for himself, and how hard he works!", "CASTOR: Yes. And soon he'll be your colleague, but even that won't be enough for him. That man has an apetite for power unknown to you and me.", "CASTOR: His statue is now to be seen in Pompey theatre and replicas of it are to be found all over Rome! He's built a network of spies that have spread like an infection through the city. Well, don't you see? He's building a prison here, stone by stone, and one day, when you're gone, we'll all wake up and find the doors locked and the bolts down!"]
    ;
MERGE (e:Event {uuid: 'event_4_5'})
    ON CREATE SET
        e.title = 'Tiberius Dismisses Castor and Demands Report',
        e.description = 'Tiberius abruptly cuts off Castor\'s warnings, refusing to engage further with the topic of Sejanus. He demands Castor proceed with the report on coastal defenses, effectively shutting down the conversation and signaling his complete dismissal of Castor\'s concerns and insights.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["TIBERIUS: Have you finished?", "CASTOR: No, I have not finished!", "TIBERIUS: Did you have a report to make on the coastal defenses?", "CASTOR: Yes.", "TIBERIUS: Well, then, make it!"]
    ;
MERGE (e:Event {uuid: 'event_4_6'})
    ON CREATE SET
        e.title = 'Castor\'s Despair and Observation of Caligula',
        e.description = 'Frustrated and defeated, Castor makes a final, despairing comment on Tiberius\'s preoccupations—treason trials and pornography—highlighting the Emperor\'s detachment from meaningful governance. He mentions Caligula\'s involvement with pornographic books, hinting at a disturbing connection and shared interest between Tiberius and the young Caligula, further deepening Castor’s unease.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CASTOR: He's interested in nothing nowadays except treason trials and pornographic books. You know, he had one with him. I think CALIGULA had bought it for him."]
    ;
MERGE (e:Event {uuid: 'event_4_7'})
    ON CREATE SET
        e.title = 'Livilla and Castor Discuss Caligula\'s Ominous Nature',
        e.description = 'Livilla observes the seemingly good relationship between Tiberius and Caligula. Castor responds with a shudder, expressing his profound unease about Caligula\'s character. He voices his disbelief that Germanicus and Agrippina, whom he presumably admired, could have produced such a disturbing offspring, emphasizing Caligula\'s unsettling and potentially dangerous nature.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["LIVILLA: They seem to get on well, those two.", "CASTOR: Yes, that young man gives me the shudders. How Germanicus and Agrippina could've ever produced him, I don't know."]
    ;
MERGE (e:Event {uuid: 'event_4_8'})
    ON CREATE SET
        e.title = 'Livilla Downplays Sejanus\'s Ambition; Castor Reasserts His Warning',
        e.description = 'Livilla questions if Castor is exaggerating the threat posed by Sejanus, suggesting that Sejanus\'s ambitions are limited to a high but not imperial position. Castor firmly denies exaggeration, reiterating his belief that Sejanus aspires to the ultimate power, to usurp Tiberius\'s throne, highlighting the fundamental disagreement in their perceptions of Sejanus\'s true intentions.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["LIVILLA: Did you quarrel with your father?", "CASTOR: We had an argument over Sejanus. I mean, he's blind to that man's ambition.", "LIVILLA: Don't you think you exaggerate?", "CASTOR: No.", "LIVILLA: Well, what can he aspire to - a commander of the guard?", "CASTOR: I sometimes think he aspires to sit where my father sits."]
    ;
MERGE (e:Event {uuid: 'event_4_9'})
    ON CREATE SET
        e.title = 'Livilla Suggests Rest; Castor Acknowledges Fatigue',
        e.description = 'Livilla, perhaps sensing Castor\'s distress or wishing to end the tense conversation, suggests he should go to sleep. Castor, agreeing, acknowledges feeling unusually tired, possibly from the emotional strain of the argument and his journey, creating a moment of weary resignation at the scene\'s close.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["LIVILLA: He doesn't realize how much he's frown to depend upon him. He seeks his advice on everything.", "LIVILLA: Why don't you go to sleep?", "CASTOR: I don't know why I'm so tired.", "LIVILLA: You've had a long journey."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'A Tired Reunion',
        s.description = 'In the dim light of Castor\'s bedchamber, fatigue hangs heavy in the air. Castor sits on the edge of his bed, weary from the day\'s burdens, his expression a blend of exhaustion and parental love. The room is sparsely decorated, evoking a sense of personal space yet tinged with the vibrant life of the family. Helen, youthful and buoyant, stands in the doorway, her innocence illuminating the somber atmosphere. As she bids goodnight, a hint of tension lingers in the space shared with Livilla, who lingers near the entrance like a shadow. The emotional air thickens as Castor acknowledges the growing beauty of Helen, yet Livilla\'s interjection about their daughter\'s skin reflects a mother\'s concern, revealing unspoken pressures and maternal instincts. Their exchange, layered with familial love and subtle unease, encapsulates a moment of connection tinged with fatigue and underlying complexities.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_castors_bedchamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Helen Bids Goodnight',
        e.description = 'Helen enters Castor\'s bedchamber, her youthful energy contrasting with Castor\'s fatigue. She expresses her gladness at his return and offers a comforting goodnight. This moment highlights the bond between father and daughter, showcasing a fleeting moment of familial warmth against the backdrop of Castor\'s weariness. The dialogue emphasizes the innocence of youth amidst the complexities of adult burdens.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["HELEN: I came to say goodnight, Father.", "CASTOR: Goodnight.", "HELEN: I'm glad you're back."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'A Father\'s Observations',
        e.description = 'As Helen exits, Castor reflects on her beauty, a moment filled with fatherly pride. Livilla\'s response subtly shifts the mood, hinting at underlying concerns about their daughter’s health and appearance. This exchange not only underscores Castor’s affection but also Livilla’s protective instincts, revealing the tension between parental love and societal expectations. The dialogue serves as a reminder of the pressures they face as a family within the imperial context.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CASTOR: She's becoming very beautiful.", "LIVILLA: Yes. Her skin's not all that it should be though."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'A Moment of Intimacy',
        e.description = 'Castor compliments Livilla\'s beauty, a moment that brushes against intimacy but is quickly deflected. Livilla, aware of Castor\'s tiredness, chooses not to stay, further emphasizing the complexities of their relationship. This moment captures the tension between affection and the burdens of exhaustion, hinting at the emotional distance that may exist between them despite their shared history. Castor\'s fatigue becomes a metaphor for the weary state of their marriage.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CASTOR: You too are looking beautiful.", "LIVILLA: Thank you.", "CASTOR: Why don't you stay?", "LIVILLA: Not tonight. You're tired. You'll sleep better alone."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Castor\'s Weary Retreat',
        e.description = 'As the conversation winds down, Castor succumbs to his exhaustion, lying back on the bed with his eyes closing. Livilla watches him, her expression flickering with unease, hinting at deeper concerns about their relationship and the challenges they face within the confines of their lives. This final moment encapsulates the strain of familial responsibilities and unspoken worries, leaving the audience with a sense of foreboding about the fragile state of their union.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CASTOR: Yes, you're right. I really can't keep my eyes open."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'A Deadly Proposition',
        s.description = 'In the shadowy intimacy of Castor\'s bedchamber, lit only by the flickering glow of an oil lamp, Livilla and Sejanus engage in a clandestine rendezvous. The air is thick with hushed urgency and illicit desire, contrasting sharply with the vulnerability of the sleeping Castor nearby. Livilla, pale and anxious, is impatient, but Sejanus, ever the calculating strategist, slows the pace, steering their dangerous conversation towards a darker path. The room, usually a sanctuary of domesticity, transforms into a conspiratorial space as they plot in whispers, the dim light casting long, distorted shadows that amplify the scene\'s sinister undertones. The narrative significance of this scene lies in its revelation of Livilla\'s escalating desperation and Sejanus\'s manipulative control, marking a critical turning point in their treacherous alliance and setting the stage for future deadly actions. The thematic elements of forbidden love, ambition, and moral decay are palpable, underscoring the corrupting influence of power within the Julio-Claudian dynasty.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_castors_bedchamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Secret Rendezvous and Dangerous Hesitation',
        e.description = 'Sejanus slips into Castor\'s dimly lit bedchamber to meet Livilla. He confirms Castor is deeply asleep, a consequence of Livilla drugging his wine. Livilla is on edge, eager to proceed, but Sejanus deliberately delays, asserting his control over the situation and hinting at the gravity of their illicit affair. His initial lines convey a sense of calculated caution, contrasting with Livilla\'s nervous anticipation, immediately establishing the power dynamic and the perilous nature of their clandestine meeting.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["SEJANUS: Is he asleep?", "LIVILLA: Yes.", "SEJANUS: Is he fast asleep?", "LIVILLA: Yes. Quick, please.", "SEJANUS: No, wait. Don't be in such a hurry."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Threat of Separation and Livilla\'s Despair',
        e.description = 'Sejanus abruptly declares this must be their \'last time\' together, citing the extreme risk of their continued affair. This statement throws Livilla into immediate distress. The prospect of separation is unbearable to her, revealing the depth of her dependence on Sejanus and the intensity of her forbidden passion. Her emotional outburst underscores her vulnerability and the high stakes of their illicit relationship, highlighting the personal cost of their dangerous game.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SEJANUS: Do? We're going to make love for the last time.", "LIVILLA: Last time?", "SEJANUS: Hmmm.", "LIVILLA: No. No! I couldn't bear it! I couldn't bear it!", "SEJANUS: Livilla...", "LIVILLA: He'll go away again."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Drugging as a Temporary Fix and the Escalating Risk',
        e.description = 'Livilla, desperate to maintain their affair, suggests continuing to drug Castor\'s wine. Sejanus dismisses this as unsustainable and increasingly dangerous. He articulates the practical problems – Castor\'s growing suspicion and tolerance to the drug – and chillingly foreshadows the potential for accidental death due to escalating dosages. This exchange reveals Sejanus\'s pragmatic and manipulative nature, while also highlighting Livilla\'s reckless passion blinding her to long-term consequences.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVILLA: We could still meet.", "SEJANUS: How?", "LIVILLA: I could do what I did tonight.", "SEJANUS: Drug his wine? He'll begin to grow suspicious if he falls asleep every night. Besides, his body would grow accustomed to it and it will gradually cease to have any affect. And then, my darling, one night - in your eagerness to see him sleep - you might kill him."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'The Murderous Proposal and Mutual Agreement',
        e.description = 'In a chilling escalation, Livilla wonders aloud if a larger dose could be fatal. Sejanus, instead of recoiling, seizes on this dark suggestion, recognizing the opportunity to eliminate Castor permanently. He introduces the idea of a stronger, undetectable poison. Livilla readily agrees to murder her husband, driven by her obsessive desire for Sejanus. Their mutual assent to commit murder marks a point of no return, solidifying their dangerous pact and foreshadowing the tragic consequences of their ambition and passion.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LIVILLA: Would a large dose really kill him?", "SEJANUS: What are you saying?", "LIVILLA: I can't live without you. I can't. I can't. I think I'd die if you didn't come into my bed every night. It's such a little step to take from making him sleep at night to making him sleep forever.", "SEJANUS: Then, you'll need something stronger. Something that can be used in small doses that will never detected.", "LIVILLA: Get it for me.", "SEJANUS: Are you sure?", "LIVILLA: Yes! Yes! Are you?", "SEJANUS: If you are."]
    ;
MERGE (e:Event {uuid: 'event_6_5'})
    ON CREATE SET
        e.title = 'Post-Murder Promises and Domination Fantasy',
        e.description = 'Livilla, having agreed to murder her husband, looks to the future, questioning what will happen \'afterwards\'. Sejanus paints a picture of their marriage, promising to divorce his wife and claim Livilla for himself. However, he quickly transitions into a disturbing fantasy of control and domination. He describes scenarios of locking her away and forcing her submission, revealing a darker, possessive side to his \'love\'. This final exchange underscores the power imbalance in their relationship and hints at a potentially abusive dynamic should they achieve their murderous aims, ending the scene on a chilling note of implied future tyranny.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVILLA: And afterwards?", "SEJANUS: I'll divorce my wife and we'll get married. And then I'll have you all to myself. No more lovers for you, then. You'll have to behave.", "LIVILLA: And if I don't?", "SEJANUS: If you don't? Then I'll lock you in a room without any clothes, and I'll visit you three or four times a day.", "LIVILLA: Perhaps you'll be too tired. Perhaps you'll only manage once.", "SEJANUS: Then I'll send my guards to stand in for me.", "LIVILLA: Would you really?", "SEJANUS: Yes.", "LIVILLA: How many?", "SEJANUS: Three or four.", "LIVILLA: I might not let them.", "SEJANUS: You'll be forced.", "LIVILLA: Against my will?", "SEJANUS: Yes.", "LIVILLA: While you were there?", "SEJANUS: Yes.", "LIVILLA: I'd struggle and scream.", "SEJANUS: But no use.", "LIVILLA: You'd like that, wouldn't you?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Claudius Receives an Invitation',
        s.description = 'In the bustling Roman Forum, the air vibrates with the chatter of citizens and the calls of vendors, the grand architecture looming as a backdrop to the unfolding drama. CLAUDIUS, looking flustered and clutching a scroll, is interrupted by HEROD and CASTOR, who tease him about the invitation from Livia for her birthday. Tension simmers beneath their banter, reflecting Claudius\'s nerves about attending a family gathering after years of estrangement. The lively atmosphere contrasts sharply with Claudius\'s apprehensive demeanor, adding layers to the narrative as he prepares to confront his familial ties and their complex undertones. The scene serves to highlight Claudius\'s vulnerability and the societal expectations surrounding him, while also foreshadowing the impending tensions at Livia\'s banquet. This moment encapsulates the themes of family, personal insecurity, and political maneuvering within the heart of ancient Rome.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_forum'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Claudius Intercepts Invitation',
        e.description = 'CLAUDIUS arrives in the forum, visibly flustered and holding a scroll. He is intercepted by HEROD and CASTOR, who question his hurried demeanor. As he presents the scroll detailing Livia\'s invitation to her birthday dinner, Claudius\'s nervousness becomes apparent, highlighting his complicated relationship with Livia. The laughter and jesting from HEROD and CASTOR serve to underscore Claudius\'s anxiety, revealing the contrasting dynamics of familial expectation and personal insecurity. This event marks a pivotal moment as Claudius prepares to engage in a perilous familial gathering after years of estrangement.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Oh, yes. Look at this. It came this morning.", "HEROD: What it says, I imagine.", "CLAUDIUS: Yes, but w-what can it mean?"]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Discussion of Livia\'s Invitation',
        e.description = 'HEROD reads the contents of the scroll, revealing Livia\'s expectation for Tiberius Claudius Drusus to dine with her. Claudius expresses his nervousness about being summoned after years of silence, particularly recalling their last interaction filled with disdain. HEROD and CASTOR respond with light-hearted banter, reflecting on Claudius\'s family dynamics, but they also reveal the underlying tension of attending Livia\'s gathering. The joviality contrasts with Claudius\'s inner turmoil, emphasizing the theme of familial obligation versus personal fear as he prepares to confront the complex relationships within his family.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: We haven't even spoken for seven years.", "HEROD: Your family are all lunatics, you know that, don't you?", "CASTOR: What a dear, divine fool my cousin is."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Reluctant Departure',
        e.description = 'Despite the teasing from HEROD and CASTOR, Claudius maintains his focus on finding a present for Livia. As he looks at a nearby vendor\'s offerings, he struggles with the absurdity of selecting a bust of Sejanus, a man who symbolizes the very courtly intrigues he seeks to navigate. Claudius\'s reluctance to accept the bust reflects his discomfort with his family\'s expectations and the political implications of such gifts. In a bid to leave the conversation, Claudius dismisses them, signaling his desire to escape the weight of familial obligations and the absurdity of the court, yet his exit leaves the two men discussing his nervousness.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: I must go.", "HEROD: Here, have one.", "CASTOR: Oh, it'll pass. You worry so much."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Public Accusation in the Forum',
        s.description = 'The bustling Roman Forum, a public space usually filled with commerce and debate, is suddenly disrupted by the forceful arrival of Roman guards. They barge through the startled crowd, creating a circle around Silius Caecina and Centurion Varro, immediately signaling an official and unwelcome intrusion. The air, typically alive with the sounds of daily Roman life, crackles with sudden tension and hushed whispers as onlookers realize something significant is unfolding. Castor arrives, drawn by the commotion, initially assuming it\'s a misunderstanding. However, the grim pronouncements of Varro reveal a stark reality: Silius is being publicly arrested for treason, a charge carrying immense weight and danger in the Roman political landscape. The scene shifts from confusion to a chilling display of state power, highlighting the precarious nature of status and favor in Rome, where accusations can swiftly turn public opinion and imperial relationships sour. The thematic undercurrents of betrayal and the swift, brutal application of Roman justice are starkly presented in this open forum, turning a place of public life into a stage for political drama.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_forum'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Silius Caecina\'s Public Arrest',
        e.description = 'Roman guards, commanded by Centurion Varro, forcefully push through the crowd in the Roman Forum, creating a perimeter around Silius Caecina. The abrupt arrival of armed soldiers in a public space immediately draws attention and creates an atmosphere of unease and anticipation. The guards\' actions clearly indicate an official intervention, disrupting the everyday life of the Forum and singling out Silius for a dramatic public arrest.',
        e.sequence_within_scene = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Castor Intervenes, Varro Declares Senate\'s Mandate',
        e.description = 'Castor, arriving on the scene, demands to know what is happening, his tone initially suggesting disbelief or a belief in some mistake. Varro, with cold formality, announces that Silius Caecina is under arrest by order of the State Senate on charges of treason. Silius, with sardonic defiance, acknowledges the accusation, implying it stems from criticizing Castor\'s father. Castor attempts to dismiss the arrest as absurd, leveraging his imperial status to intimidate Varro. However, Varro firmly rebuffs Castor, asserting that he is acting under the Senate\'s authority and cannot be deterred, even by the Emperor\'s son, underscoring the reach of the Senate\'s power and the gravity of the charges against Silius.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CASTOR (O.S.): Halt! Silius Caecina. What's this?", "SILIUS CAECINA: I'm to be arrested, it seems.", "CASTOR: By whose order?", "VARRO: By order of the State Senate.", "CASTOR: On what grounds?", "VARRO: On the grounds of treason. Gaius Silius Caecina is to be impeached before the Senate.", "SILIUS CAECINA: It seems I made some defamatory remarks about your father. I don't recall them.", "CASTOR: Now, this must be some sort of joke, Varro. You'll be laughed out of the house.", "VARRO: I don't think so. Please stand aside, sir. I'm on state business and may not be interfered with even by the Emperor's son."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Confrontation in the Temple',
        s.description = 'In the solemn confines of Tiberius\'s private temple, the air is thick with incense and the weight of imperial legacy. Tiberius, donned in simple robes, kneels before a grand statue of Augustus, his face a mask of weariness, reflecting the burdens of a ruler haunted by his lineage. The flickering torchlight casts long shadows, accentuating the tension that permeates the space. The atmosphere shifts dramatically as Agrippina storms in, her fierce demeanor challenging the tranquility of the setting. Their clash encapsulates the struggle for power and the emotional turmoil within the imperial family. The scene oscillates between reverence and accusation, revealing the fragile dynamics of loyalty, ambition, and the toll of tyranny. As Tiberius and Agrippina confront each other, the bitter legacy of Augustus looms large, illustrating the dark undercurrents of their relationship and the consequences of their choices. This moment of confrontation serves as a critical commentary on the oppressive nature of the imperial rule and the personal costs entwined with political ambition.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_private_temple'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Tiberius Offers a Libation',
        e.description = 'Tiberius kneels reverently before the statue of Augustus, pouring a libation as he seeks guidance and peace. His words reveal the internal conflict and exhaustion he feels as the Emperor, besieged by the shadows of his past and the weight of power. This moment not only illustrates his desperation for divine favor but also sets the tone for the impending clash with Agrippina, highlighting his vulnerability amidst the opulence of the temple.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["O divine Augustus, take these offerings I beg, poor as they are and help me, your unworthy successor to rule wisely in your place.", "Help me too, oh my father, divine ruler of the world... to calm the raging spirit inside me, and lighten the dark shadows of my soul.. and bring me peace. Peace."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Agrippina\'s Accusation',
        e.description = 'Agrippina enters with fierce determination, immediately confronting Tiberius about his hypocrisy. Her accusatory tone starkly contrasts with the solemnity of the temple, igniting a passionate debate over loyalty and the consequences of Tiberius\'s actions. She names friends who have suffered under his regime, driving home the personal impact of his reign. This exchange reveals the deep-seated animosity between them and sets the stage for a confrontation that blends personal anguish with political stakes.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Hypocrite. Hypocrite. You sacrifice to Augustus, but you persecute his grandchildren.", "I'm not talking of my brother Postumus. I'm talking of me. Of me!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Tiberius Defends His Actions',
        e.description = 'In response to Agrippina\'s fiery accusations, Tiberius rises, his demeanor hardening as he defends his actions. His retort illustrates the paranoia that accompanies his rule, as he deflects blame from himself and justifies the persecution of those deemed treasonous. This exchange not only heightens the emotional stakes but also underscores Tiberius\'s isolation as an emperor, entangled in a web of mistrust and fear.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["What grandchildren do I persecute that he himself did not persecute?", "I will not be screamed at even by the granddaughter of Augustus!"]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Agrippina\'s Plea',
        e.description = 'As the heat of the argument subsides, Agrippina softens, revealing her own vulnerabilities. She expresses her weariness and disillusionment since the death of Germanicus, shifting the tone from confrontation to a heartfelt plea for understanding. This moment humanizes both characters, revealing their shared grief and the burdens of their respective legacies, while simultaneously invoking the theme of familial bonds strained by ambition and power.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Tiberius... perhaps I do you wrong in thinking you persecute me because of my friends. But you too do me wrong in thinking me ambitious. I'm tired.", "All I want is to be left alone... and... Be good to my children."]
    ;
MERGE (e:Event {uuid: 'event_9_5'})
    ON CREATE SET
        e.title = 'Tiberius\'s Conditional Acceptance',
        e.description = 'Tiberius responds with a defensive acknowledgment of Agrippina\'s concerns for her children, asserting that he will treat them with kindness. However, he reminds Agrippina of the past actions she forced him to take against Piso, indicating that trust is a fragile concept for him. This moment encapsulates the complexity of their relationship, as past grievances resurface amidst the desire for peace, reflecting the intricate dance of power and familial obligation in the imperial court.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["As for your children, they are guiltless of any crime. I will look upon them as friends. As for you... I will never forget what you made me do to Piso."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Birthday Confessions Amidst Opulence',
        s.description = 'The lavish banquet hall is a spectacle of Roman excess, shimmering with torchlight that dances off gold and jewels. A long table groans under the weight of exotic delicacies and extravagant gifts, a testament to Livia\'s power. Yet, beneath the veneer of celebration, the atmosphere is thick with unspoken tension and veiled agendas. Livia, regal and ancient, presides at the head of the table, her every word carrying the weight of imperial authority. Claudius, bearing a vase from distant India as a birthday offering, approaches her with hesitant steps, his stammer a subtle indication of his unease. Caligula, a youthful predator, circles nearby, his sinister grin a flash of menace in the festive light. The scene is a crucible of familial intrigue, where polite greetings mask deadly ambitions and birthday wishes are laced with the poison of courtly machinations. Amidst the opulence, Livia unveils her true nature, confessing to a lifetime of calculated murders in her ruthless pursuit of power and, now, immortality.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_lavish_banquet_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Birthday Greetings and a Vase from India',
        e.description = 'Claudius, bearing an Indian vase, nervously approaches Livia to offer his birthday greetings. His stammer is evident as he wishes her a happy birthday, a gesture that is both polite and laced with familial tension. Livia, ever the pragmatist, immediately assesses the vase\'s value, more interested in its exotic origin and potential cost-effectiveness than the sentiment behind the gift. Caligula observes this exchange with a sardonic amusement, already sensing the undercurrents of manipulation at play within this family gathering.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Happy b-b-birthday, Grandmother.", "LIVIA: Oh, is that for me?", "CLAUDIUS: Yes. It's a v-v-vase. From India.", "LIVIA: How very pretty. And from such a distant place. It's a pity we never got that far. So many fine things we could have picked up cheap."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Horoscope and Impending Demise',
        e.description = 'Livia shifts the conversation to her horoscope, a birthday gift from Tiberius, delivered by a visibly nervous Thrasyllus. She openly mocks Tiberius\'s hidden motive—to ascertain her lifespan—revealing her cynical understanding of her son\'s anxieties. Thrasyllus, caught in Livia\'s sharp wit, stumbles in his reassurances, highlighting the Empress Mother\'s domineering presence and her dismissive attitude towards flattery and falsehoods. She declares her imminent death next year, a pronouncement delivered with unsettling nonchalance, underscoring her control even over the narrative of her own mortality.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Several, my dear. And Thrasyllus has drawn me the most detailed horoscope for my birthday. Such work has gone into it. Amazing.", "THRASYLLUS: A horoscope full of incident and prophecy. I was amazed at it myself.", "LIVIA: It was a present from Tiberius. Wasn't that nice of him? Of course, what he really wanted to know is how much longer I'm going to live.", "LIVIA: Oh, shut up. It's a foolish mother who doesn't know her son.", "LIVIA: Oh, yes, yes. I shall die soon. Next year sometime. My son will be relieved."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Caligula, the \'Monster\', and a Green Talisman',
        e.description = 'Livia turns her attention to Caligula, mockingly calling him a \'monster\' and referencing a green talisman she found in his room. This talisman, similar to one worn by Claudius\'s deceased brother, hints at dark secrets and potential foreshadowing of Caligula\'s malevolence. Livia, in a calculated move, declares Claudius safe from Caligula due to a prophecy stating Claudius will avenge Caligula\'s death, subtly positioning Claudius as both protected and potentially powerful in the future power dynamics. The exchange reveals Livia\'s manipulative tactics, using both threat and prophecy to control those around her.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: What are you grinning at, monster? You are a monster, aren't you?", "CALIGULA: Whatever you say, Great Grandmother. Did you know your nephew was a monster, Claudius?", "CLAUDIUS: Oh, is he old enough to have acquired that t-title?", "LIVIA: Oh, he started very young, didn't you, monster? I searched his room one day and I found a little green talisman that told me a very remarkable story - or rather confirmed one I'd heard from another quarter.", "CLAUDIUS: A g-green talisman? Like my brother wore?", "LIVIA: The one your brother wore.", "LIVIA: Oh, he's quite safe. And remember this, monster, your Uncle Claudius here is a phenomenon. He's so old fashioned that because he's sworn to protect his brother's children, he will never harm you. And remember this too, Thrasyllus has prophesied that he will avenge your death, so you cannot harm him."]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'Private Audience: Livia\'s Imperial Vision for Caligula',
        e.description = 'After dismissing Caligula and Thrasyllus, Livia requests a private conversation with Claudius, immediately revealing her strategic mind by noting Caligula\'s morbid fascination with her aging body. She then shocks Claudius by stating her conviction that Caligula will be the next Emperor, dismissing the claims of Castor and Caligula\'s older brothers. Her rationale is steeped in political cynicism: Tiberius\'s vanity will drive him to choose a successor who makes him look good by comparison, thus ensuring posthumous adoration. This blunt assessment of imperial succession exposes the ruthless pragmatism that defines Livia\'s worldview.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LIVIA: My body fascinates him because it's so old. You'd think it would repel him, wouldn't you?", "LIVIA: Because it pleases him. And because he will be the next Emperor. You don't believe me, do you?", "CLAUDIUS: If you say so, Grandmother. You know I don't concern myself with high politics, but still what about Castor? And Caligula has two older brothers.", "LIVIA: Castor is ill and Thrasyllus says he won't recover. He also says that Tiberius will choose Caligula to succeed him.", "CLAUDIUS: Why?", "LIVIA: Vanity. Tiberius wants to be loved - at least after his death if not before. And the best way to ensure that...", "CLAUDIUS: Is to have someone w-worse to follow him. Yes, naturally. Well, he's certainly no fool."]
    ;
MERGE (e:Event {uuid: 'event_10_5'})
    ON CREATE SET
        e.title = 'The Goddess Ambition and a Pact for Immortality',
        e.description = 'Livia, cutting through Claudius\'s observant facade, acknowledges his perceptiveness. She reveals her ultimate ambition: to become a goddess after death. This shocking confession exposes the depth of her vanity and her fear of eternal punishment for her past deeds. She explains her pact with Caligula: in exchange for keeping a secret (implied to be Caligula\'s monstrous nature or a specific act), he will deify her upon becoming Emperor. Livia then demands Claudius\'s oath to ensure her deification, driven by a primal fear of hell and a desperate yearning for divine status, showcasing the twisted logic of her ambition.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: He's the biggest fool in my family. I always thought that that was you... but I think now I was wrong.", "CLAUDIUS: Grandmother, after all these years, you didn't invite me to dinner just to tell me this.", "LIVIA: The wine has made you bold, hasn't it.", "CLAUDIUS: You said you kept in with Caligula because he was to be the next Emperor.", "LIVIA: Lost your stutter too, I see.", "CLAUDIUS: But if by then you're dead, what difference can it make to you?", "LIVIA: Oh, it makes a lot of difference. And that's really why you're here. I want to be a goddess, Claudius.", "CLAUDIUS: Why are you so anxious to become a goddess?", "LIVIA: Oh, don't you understand? Claudius, do you believe that the souls of great criminals suffer eternal torment?", "CLAUDIUS: Certainly.", "LIVIA: But that the immortal gods, whatever crimes they have committed, are free from fear of punishment?", "CLAUDIUS: Of course.", "LIVIA: I've done many terrible things, Claudius. Well, no ruler could do otherwise. But I've always put the good of the Empire above all else.", "LIVIA: That's why I tolerate Caligula. He's sworn, if I keep his secret... he'll make me a goddess as soon as he becomes Emperor. Now, you too must swear that you'll do everything you can to see that it happens. Don't you see? If he doesn't make me a goddess, I'll be in hell. Hell, suffering torments day and night, year after year after year."]
    ;
MERGE (e:Event {uuid: 'event_10_6'})
    ON CREATE SET
        e.title = 'Confession of a Lifetime: Livia\'s Catalogue of Murders',
        e.description = 'Claudius agrees to Livia\'s request on the condition of learning the truth of the past, revealing his historian\'s mind at work. He directly questions Livia about the deaths that have haunted their family. In a chillingly candid confession, Livia admits to orchestrating a series of murders: Marcellus, Agrippa, Gaius, Lucius, and Postumus, each eliminated for the perceived good of the Empire and to secure Tiberius\'s path to power. She even confesses to poisoning Augustus himself, admitting it was the \'hardest thing\' she ever did, highlighting the depth of her calculated ruthlessness and the sacrifices she made for her ambition.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: Grandmother, p-please don't distress yourself. Of course I'll do what I can.", "CLAUDIUS: On one small condition. You see, there's so much I want to know. I'm an historian and I want to know the truth. When people die, so much dies with them, and all that's left is just pieces of paper that tell lies. Lies, lies.", "CLAUDIUS: Grandmother, who killed Marcellus?", "LIVIA: I did. The Empire needed Agrippa more than it needed Marcellus. And then I poisoned Agrippa later because I knew that his wife was in love with Tiberius, and if Tiberius married her, Augustus would make him Emperor. My son botched that up, of course.", "CLAUDIUS: And J-Julia's sons by Agrippa. How did they die?", "LIVIA: Gaius I had poisoned when he was in Syria.", "CLAUDIUS: You have a long reach.", "LIVIA: The Empire's very large. I need one. Lucius was drowned in a boating accident arranged by his friend Plautius.", "CLAUDIUS: And Postumus?", "LIVIA: He was useless. I had to get rid of Postumus. He was a threat to Tiberius. Besides, he knew I'd had his mother banished.", "CLAUDIUS: And what about my father, who was your son, and Germanicus, who was my dear brother - did you poison them?", "LIVIA: No. Your father died of his wound. And Plancina poisoned Germanicus without instructions from me. But I'd marked them both down for death.", "CLAUDIUS: Why?", "LIVIA: They were both infected with that infantile disorder known as Republicanism.", "CLAUDIUS: And what about Augustus? Did you poison him?", "LIVIA: Yes. Yes, I did. I smeared the poison on the figs while they were still on the tree. I had no choice. He would only eat them if he'd picked them himself. It took me all night to do it.", "CLAUDIUS: How could you have done that, Grandmother, when you'd lived with him for so long?", "LIVIA: Yes. That was hard. Very hard. That was the hardest thing I ever had to do."]
    ;
MERGE (e:Event {uuid: 'event_10_7'})
    ON CREATE SET
        e.title = 'Sibylline Prophecy and a Royal Farewell',
        e.description = 'Exhausted by the weight of her confessions, Livia abruptly ends the conversation, handing Claudius a scroll of rejected Sibylline verses. She reveals a prophecy within the scroll foretelling Claudius\'s future emperorship, a revelation meant to intrigue and perhaps manipulate him further. Claudius, amused and disbelieving, laughs off the prophecy but subtly plays along, promising to help Livia become the \'Queen of Heaven\' if he becomes Emperor. He bows and exits, clutching the scroll, leaving Livia to watch him go, her expression unreadable, hinting at the complex game of power and manipulation still unfolding.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["LIVIA: Oh, you've made me tired with all your questions. You must go away. Take this. Read it sometime. That is a collection of Sibylline verses rejected from the official book.", "LIVIA: Because it's prophesied there that you will one day be Emperor.", "CLAUDIUS: Oh... (laughs)", "LIVIA: Yes. You.", "CLAUDIUS: Anything you say, Grandmother.", "LIVIA: You won't forget your promise?", "CLAUDIUS: No, I won't. If I can become Emperor, you can certainly become the Queen of Heaven!"]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Sejanus\'s Manipulation',
        s.description = 'In a shadowy antechamber of the Imperial Palace, dim lighting casts long shadows as SEJANUS leans against the cold marble walls, exuding confidence and charm. The atmosphere is thick with tension, a palpable sense of intrigue and manipulation. CLAUDIUS, the nervous nephew of the Emperor, enters hesitantly, his gait punctuated by a distinct limp, a visual representation of his social awkwardness. The GUARD stands at attention, seemingly disinterested in the unfolding psychological battle. As Sejanus engages Claudius in conversation, the mood oscillates between friendly banter and veiled threats, revealing Sejanus\'s true intent to control Claudius\'s fate. Sejanus\'s probing questions about Claudius\'s wife, coupled with the suggestion of divorce, unveil the treachery lurking beneath the façade of camaraderie. This scene is crucial as it illustrates Sejanus\'s manipulative prowess and sets the stage for Claudius\'s entrapment within the deadly games of power. The themes of ambition and betrayal are woven into their dialogue, reflecting the broader currents of intrigue that suffuse the Imperial Court.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_antechamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Sejanus Greets Claudius',
        e.description = 'SEJANUS intercepts CLAUDIUS in the antechamber, greeting him with a disarming smile that belies his true intentions. Claudius, fidgeting with anxiety, expresses his concern about his sick brother Castor, revealing his familial ties and underlying vulnerabilities. Sejanus, with calculated ease, brushes off Claudius\'s worries, steering the conversation toward more sinister topics.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Claudius: I w-was on my way to see Castor. I'm told he's v-very bad.", "Sejanus: Yes, but he'll recover, I'm sure. Your sister is taking such good care of him."]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Sejanus Reveals Pregnancy',
        e.description = 'SEJANUS slyly reveals the explosive news that Claudius\'s wife is pregnant, a fact that Claudius was unaware of. This moment shatters Claudius\'s composure, exposing his ignorance and vulnerability. Sejanus\'s insinuations suggest a future filled with political consequences, intensifying the tension as Claudius\'s world begins to unravel.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Sejanus: This may seem an odd question to put to a husband, but did you know your wife was pregnant?", "Claudius: No. N-n-no, I d-didn't. How do you know?"]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Sejanus Advises Divorce',
        e.description = 'With a mischievous glint, SEJANUS advises CLAUDIUS that he must divorce his wife due to the pregnancy, framing it as a necessity for maintaining imperial dignity. Claudius, confused and overwhelmed, acquiesces to Sejanus\'s suggestion, revealing his susceptibility to manipulation. This advice marks a pivotal moment, as it unravels Claudius’s marital ties and places him firmly in Sejanus\'s machinations.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Sejanus: You'll have to divorce her now.", "Claudius: What for?", "Sejanus: Well, you can't be married to a woman who's going to bear someone else's child."]
    ;
MERGE (e:Event {uuid: 'event_11_4'})
    ON CREATE SET
        e.title = 'Sejanus Proposes a New Marriage',
        e.description = 'Sejanus, sensing an opportunity, proposes a new match for Claudius—his own sister, Aelia. This proposition intertwines familial loyalty with political maneuvering, showcasing Sejanus\'s ambition. Claudius, still reeling from the conversation about divorce, is both flattered and bewildered, further illustrating his ineptitude in the treacherous waters of Roman politics.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Sejanus: I have just the woman for you. She's beautiful, independent - she'll leave you alone as much as you like.", "Claudius: W-who is she?", "Sejanus: My sister. Aelia."]
    ;
MERGE (e:Event {uuid: 'event_11_5'})
    ON CREATE SET
        e.title = 'Claudius Accepts the Proposal',
        e.description = 'In a moment of reluctant acceptance, CLAUDIUS agrees to the arranged marriage to Aelia, illustrating his desperation to appease Sejanus and the Emperor despite his self-doubt. This decision marks a significant turning point in Claudius’s character arc, as he unwittingly steps deeper into the machinations of the imperial court, setting the stage for future conflict.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Claudius: Oh, in that case, anything you say, Sejanus.", "Sejanus: Good! Well, that's settled then."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Whispers of Betrayal and Dynastic Pragmatism',
        s.description = 'A somber mood permeates the palace corridor as news of Castor\'s death spreads. Livilla, consumed by grief, rushes past Claudius, her despair a stark reminder of the personal cost of imperial life.  Claudius continues down the corridor where he encounters Herod, Antonia, and Agrippina engaged in hushed, anxious conversation. The marble walls and dim lighting of the corridor create an atmosphere of secrecy and unease, reflecting the treacherous political climate. Herod, with calculating detachment, outlines his survival strategy, highlighting the ruthlessness required to navigate Roman court. The conversation then pivots to Claudius\'s impending marriage to Sejanus\' sister, revealing the manipulative machinations of Sejanus and the political naivete of Claudius.  The scene underscores the pervasive fear and suspicion within the imperial family, the ruthless ambition of Sejanus, and Claudius\'s passive, survival-oriented approach to the deadly games of power. The thematic elements of betrayal, dynastic ambition, and pragmatic survival are powerfully present, emphasized by the contrast between Livilla\'s raw emotion and Herod\'s cold calculation.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Livilla\'s Grief-Stricken Exit',
        e.description = 'Livilla, visibly distraught and weeping, bursts from an antechamber and rushes past Claudius in the palace corridor. Her anguished exclamation, \"He\'s dying. Dying,\" immediately establishes a tone of mourning and hints at a significant personal loss, creating an atmosphere of unease and sorrow as the scene begins.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVILLA: He's dying. Dying."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Herod\'s Cynical Realpolitik',
        e.description = 'Claudius proceeds down the corridor and encounters Herod in conversation with Antonia and Agrippina. Herod explains his failed attempt to offer condolences to Tiberius and his pragmatic plan to leave for Edom, the land of his grandfather. He reveals his cynical view of Judea and his strategic approach to navigating treacherous family politics, emphasizing survival through cunning and calculated alliances rather than loyalty or sentimentality. This sets a tone of political pragmatism and self-preservation.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["HEROD: I asked to see the Emperor to convey my sympathies on the death of his son. He sent word he never wanted to see me again. A nod is as good as a wink from that direction!", "HEROD: No, no. To Edom. My grandfather, Herod the Great came from there. It was your father, Lady, Mark Antony, who made him King of the Jews. He did them no favor, believe me. On the other hand, he did my grandfather no favor either, for the Jews are a quarrelsome people and drive all their rulers mad.", "HEROD: Oh, I shall.. You know. My Grandfather's domains were divided among his three surviving sons. That he had three left is a miracle for he murdered all the rest. I think he overlooked them!", "HEROD: If black is colorful, he was colorful. From there, I shall decide which of my three uncles is the safest touch and make my plans accordingly.", "HEROD: No, Lady. We Jews believe in marrying only among ourselves.", "HEROD: Well, practical There are so many things we can't eat, no Gentile woman would stand it for a moment!"]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'The Scandalous Marriage Proposal',
        e.description = 'Agrippina, probing for information, directly questions Claudius about rumors of his impending marriage. Antonia, surprised, confirms Claudius is already married. Agrippina reveals the shocking detail that Claudius is divorcing his current wife to marry Sejanus\' sister. This revelation exposes Sejanus\'s audacious ambition to further connect himself to the imperial family and Claudius\'s passive compliance in the scheme.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AGRIPPINA: And what's this, Claudius, about a marriage for you?", "ANTONIA: For Claudius? Why, he's already married.", "AGRIPPINA: But he's getting a divorce to marry Sejanus' sister. Isn't that right?", "ANTONIA: Is this true?", "CLAUDIUS: Well, I... S-S-Sejanus t-t...", "ANTONIA: Oh, get it out!", "CLAUDIUS: Well, my wife, Urganalilla, is apparently having a baby and it's not mine.", "ANTONIA: It shouldn't think it is. You never see her.", "CLAUDIUS: Well, that's the p-point. So Sejanus suggested I divorce her and m-m-marry his sister."]
    ;
MERGE (e:Event {uuid: 'event_12_4'})
    ON CREATE SET
        e.title = 'Antonia and Agrippina\'s Outrage and Accusation',
        e.description = 'Antonia and Agrippina react with fury and disbelief to Claudius\'s acceptance of Sejanus\'s marriage proposal. Antonia expresses disgust at the \"monstrously wicked\" plan and rebukes Claudius for his foolishness. Agrippina, echoing Antonia\'s sentiment, accuses Claudius of being a fool and betraying their family\'s values, directly contrasting him unfavorably with Germanicus. She explicitly points out Sejanus\'s ambition and his alleged affair with Livilla, painting a picture of a court consumed by moral decay and dangerous conspiracies.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["ANTONIA: I've never heard anything so monstrously wicked in all my life. You're an even bigger fool than I thought.", "CLAUDIUS: Well, w-what difference does it make to me? I shan't be seeing her either.", "AGRIPPINA: You're a fool, Claudius. And Germanicus would have had no patience with you.", "AGRIPPINA: Can't you see the vile ambition that drives that man? Can't you see it's just another step on the way. By this marriage, he relates himself to the Imperial family. And then what? Livilla? Does he plan to marry her?", "ANTONIA: Livilla? What has he to do with Livilla?", "AGRIPPINA: He's her lover.", "ANTONIA: But Sejanus is married and has two children!", "AGRIPPINA: For heaven's sake, what kind of world do you think we're living in? I'm sorry. I'm upset. Castor's dead. Silius Caecina committed suicide this morning, even before the trial had ended. One by one my friends vanish. Where will it end? You've betrayed us!", "CLAUDIUS: Oh, Pina...", "ANTONIA: Why did you agree to it?", "CLAUDIUS: Well.. He asked me.", "ANTONIA: Is that all you can say? You blockhead!"]
    ;
MERGE (e:Event {uuid: 'event_12_5'})
    ON CREATE SET
        e.title = 'Herod\'s Pragmatic Justification of Claudius',
        e.description = 'Herod interjects, defending Claudius from Antonia and Agrippina\'s harsh criticisms. He argues that Claudius\'s seemingly weak and cowardly approach is actually a pragmatic survival strategy. Herod suggests that while others might have rejected Sejanus\'s proposal outright, Claudius\'s willingness to \"sway and bend\" has allowed him to endure in the dangerous political climate, highlighting the brutal realities of Roman court life where survival trumps pride or principle.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["HEROD: No. He's not a blockhead. It's we who are the blockheads. If Sejanus had come to us with a proposal like that, we'd have given him his marching orders. But Claudius knows better. Claudius sways and bends with each little wind that blows.", "AGRIPPINA: By which you mean he's weak and cowardly.", "HEROD: Perhaps. But at least he's still here!"]
    ;
MERGE (e:Event {uuid: 'event_12_6'})
    ON CREATE SET
        e.title = 'Claudius\'s Resigned Internal Monologue',
        e.description = 'Claudius\'s voiceover concludes the scene with a melancholic reflection on Herod\'s words, \"But at least he\'s still here.\" He acknowledges the truth in Herod\'s cynical observation and contrasts his own survival with the fate of those who are now gone. His thoughts drift to Livia, envisioning her as a malevolent force dreaming in hell, before correcting himself and recognizing her mortality as she is now dying. This internal monologue reinforces Claudius\'s passive survivor role and the pervasive atmosphere of loss and decay.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS (V.O.) But at least he's still here. Yes, still here. And they've all gone, every one of them. It's like a dream - dreamed by Livia sleeping fitfully down in hell. No. Livia is dying. Dying."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Claudius in Contemplation',
        s.description = 'In the serene yet hauntingly beautiful palace gardens, Claudius walks alone, his expression pensive and lost in thought. The lush greenery around him seems to contrast with the turmoil of the imperial court, as the camera draws close to capture the deep furrows of concern etched on his face. The vibrant flowers and manicured hedges symbolize a facade of tranquility, yet the gentle breeze carries an undercurrent of impending chaos. The sunlight dapples through the leaves, illuminating Claudius’s face, but the image blurs momentarily, reflecting his disconnection from the world and the heavy burden of Livia\'s deteriorating health. His words, \'The mother of the nation is dying,\' resonate with an ominous weight, suggesting a pivotal moment in the power dynamics of Rome. This scene encapsulates Claudius\'s isolation amid the court\'s intrigues, serving as a poignant reminder of his struggles for recognition and the looming shadow of his family\'s dark legacy.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Claudius Reflects on Livia\'s Illness',
        e.description = 'Claudius wanders through the vibrant palace gardens, contemplating the grave situation surrounding Livia\'s declining health. His contemplative state reveals his deeper fears about the implications of Livia\'s potential death on the political landscape of Rome. With the lush garden surrounding him juxtaposed against the inner turmoil he feels, Claudius\'s introspection pulls the viewer into his emotional struggle — a conflict between loyalty to a mother figure and the oppressive reality of political necessity. The blurring of the image signifies his emotional detachment and the weight of the imperial legacy he bears, painting a picture of a man caught in the web of ambition and familial duty.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: The mother of the nation is dying."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'The Queen\'s Dying Wish',
        s.description = 'In the dimly lit, private bedchamber of Livia, the air hangs heavy with the scent of incense and the quietude of impending death. The room, once a stage for imperial power, now reflects the Empress\'s fading grip on life. Antonia, her face a mask of sorrow mixed with weary resignation, stands guard near the doorway, ushering Claudius into the somber space. Livia lies frail and shallowly breathing on her deathbed, a stark contrast to her once formidable presence. The emotional atmosphere is thick with a tragic sense of finality, punctuated by moments of cruel irony as Caligula bursts in with youthful malice, shattering the solemnity with his chilling pronouncements of power and damnation. Claudius, ever the hesitant observer, is drawn into this final act, caught between pity for his dying grandmother and the grotesque theater of Roman ambition playing out even in the face of death. This scene serves as a poignant farewell to Livia, highlighting the corrosive nature of her ambition and foreshadowing the dark reign of Caligula, while underscoring Claudius\'s inherent compassion and his reluctant role in this dynastic drama. The thematic elements of mortality, legacy, and the twisted pursuit of divinity are starkly present.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_bedchamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Antonia\'s Grave Tidings',
        e.description = 'Antonia, standing vigil at the entrance to Livia\'s bedchamber, delivers the stark news of the Empress\'s imminent death to a hesitant Claudius. Her tone is a blend of grief and impatience, underscoring the urgency of the situation and the inevitability of Livia\'s demise. She conveys the somber reality that Livia is fading rapidly, her \'cold\' having settled into a fatal illness, and that the dying Empress has specifically requested Claudius\'s presence, a request Antonia finds puzzling but dutifully relays. This moment sets the scene\'s tone of mournful anticipation and initiates Claudius\'s reluctant entry into Livia\'s final moments.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["ANTONIA: Livia is dying. She's sent for you. She wants to see you. Why, I can't imagine.", "CLAUDIUS: Dying?", "ANTONIA: Yes.", "CLAUDIUS: But it was only a cold.", "ANTONIA: It's settled on her lungs. She's sinking fast. And she's asked to see you. Well, are you going to sit there all night?"]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'A Dying Empress\'s Plea',
        e.description = 'Claudius approaches Livia\'s bedside, his demeanor hesitant and respectful. Livia, weakened and frail, fixes her gaze upon him, her first words revealing her enduring obsession: her promise of deification.  Even on her deathbed, her ambition to transcend mortality persists, demonstrating the all-consuming nature of her desire for godhood. Her question, weak yet insistent, underscores the central theme of her life\'s ambition and her desperate hope that Claudius will fulfill her ultimate wish, revealing her deep-seated need for legacy and eternal recognition.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: I hear you're dying, Great Grandmother.", "LIVIA: You won't forget your promise, will you?"]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Caligula\'s Cruel Godhood Declaration',
        e.description = 'Caligula bursts into the somber bedchamber, his presence a stark intrusion of cruel vitality into the scene of death. Ignoring Claudius entirely, he directs his venomous energy at his dying great-grandmother. He mocks Livia\'s desire for godhood, cruelly dismissing her as a \'filthy smelly old woman\' unworthy of divinity. Caligula then proclaims his own impending deification, citing a prophecy that foretells his ascension to become the \'greatest god\', surpassing even Augustus. His chillingly gleeful vision of Livia suffering in hell further emphasizes his sadistic nature and his ruthless ambition, highlighting the generational contrast in their pursuit of power and legacy. This event underscores Caligula\'s inherent cruelty and foreshadows his tyrannical future reign, contrasting sharply with Livia\'s calculated ambition and Claudius\'s quiet compassion.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CALIGULA: To make you a goddess? And what makes you think that a filthy smelly old woman like you could become a goddess? I don't need you any more, you see, Great Grandmother. My secret will die with you. You're going to stew in hell for ever and ever. Let me tell you something. Thrasyllus has made another prophecy. He told Tiberius. He said one who is going to die soon will become the greatest god the world has ever known. No temples to be dedicated to anyone but him in the whole Roman world. Not even to Augustus. And do you know who that one is? Me. Me! I shall become the greatest god of all, and I shall look down on you, suffering all the torments of hell, and I shall say... \"Leave her there. Leave her there for ever and ever and ever.\"", "Goodbye, Great Grandmother."]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Compassionate Promise',
        e.description = 'Left shaken and gasping by Caligula\'s brutal pronouncements, Livia is comforted by Claudius. Overwhelmed by Caligula\'s cruelty and her fear of eternal damnation, Livia fixates on her desire to be a goddess, desperately seeking reassurance. Claudius, in a moment of profound pity and empathy, promises to fulfill her wish, assuring her she \'shall be the Queen of Heaven\'. This promise, born out of compassion rather than political ambition, highlights Claudius\'s fundamentally decent nature, contrasting sharply with the ruthless power plays of Livia and Caligula. It\'s a moment of unexpected tenderness amidst the grim backdrop of imperial intrigue and death, revealing Claudius\'s capacity for kindness even towards those who have manipulated him.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: How are you, Grandmother? D-don't cry.", "LIVIA: He was here... Caligula was here. He said he wouldn't make me a goddess.", "CLAUDIUS: I'll see that he does, Grandmother.", "LIVIA: He said... He said he'd leave me to stew in hell. I want to be a goddess, Claudius. I deserve it.", "CLAUDIUS: You shall be the Queen of Heaven. I promise you.", "LIVIA: Really?", "CLAUDIUS: Yes."]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'A Coin for Charon: Livia\'s Final Journey',
        e.description = 'In her final moments, Livia clings to Claudius\'s promise, her ambition intertwined with a practical concern for the afterlife. She instructs Claudius to \'go on playing the fool\' – a recognition of his survival strategy in the treacherous court – and requests him to stay with her until her death.  Her last earthly request is for a coin to pay Charon, the ferryman of the dead, for her journey to the underworld, a poignant blend of imperial ambition and basic human fear of death. Claudius, with sadness and solemnity, retrieves a coin and gently places it in her mouth, fulfilling her wish and bidding her a quiet, respectful farewell. This final act is a poignant conclusion to Livia\'s life, underscored by Claudius\'s gentle compassion and the symbolic coin representing the finality of death and the journey beyond.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: Go on playing the fool, Claudius. Stay with me till I go. Put a coin in my mouth... to pay the ferryman... for the journey.", "CLAUDIUS: Goodbye, Grandmother. Safe journey."]
    ;
MATCH (a:Agent {uuid: 'agent_varro'}),
          (o:Organization {uuid: 'org_roman_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_knife'}),
          (a:Agent {uuid: 'agent_lollia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_erotic_paintings'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_livia_horoscope'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_treason_reports'}),
          (a:Agent {uuid: 'agent_sejanus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_antique_statue'}),
          (a:Agent {uuid: 'agent_caligula'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_evidence_silius_caecina_impeachment'}),
          (a:Agent {uuid: 'agent_sejanus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bed'}),
          (a:Agent {uuid: 'agent_castor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scroll_livias_invitation'}),
          (a:Agent {uuid: 'agent_livia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_wine'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_libation'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_indian_vase'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sibylline_scroll'}),
          (a:Agent {uuid: 'agent_livia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_coin'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_varro'}),
          (o:Organization {uuid: 'org_roman_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_knife_event_1_3'})
    ON CREATE SET
        oi.description = 'The knife is invoked by Lollia not as a weapon physically brandished but as a potent symbol of her profound defilement and suicidal ideation. She uses the imagery of the knife to articulate her extreme distress, stating she would have used it to \'cut out\' the \'befouled\' part of herself, if only the defilement were merely physical. The knife becomes a metaphorical representation of her desire for purification, self-harm, and violent rejection of the trauma inflicted by Tiberius. Its mention amplifies the emotional intensity of her confession and underscores the depth of her psychological torment.',
        oi.status_before = 'Prior to Lollia\'s dramatic declaration, the knife exists as a mundane, everyday object, likely present within the household or possibly brought by Lollia to the reception chamber. It holds no particular narrative significance beyond its functional purpose.',
        oi.status_after = 'Following Lollia\'s emotionally charged speech, the knife transcends its ordinary status and becomes a powerful symbol of her trauma, despair, and suicidal thoughts. It is now imbued with heavy metaphorical weight, representing the profound and lasting impact of Tiberius\'s depravity on Lollia\'s psyche. While physically unchanged, its narrative significance is dramatically elevated, embodying the extremity of her suffering and her desperate desire for release from her torment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_knife'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_knife_event_1_4'})
    ON CREATE SET
        oi.description = 'The knife clutched by Lollia serves as a powerful symbol of her internal struggle and trauma. She references it in a moment of anguish, expressing a desire to use it as a means of purification from the defilement she endured at Tiberius\'s hands. The mere mention of the knife encapsulates her emotional turmoil and the extreme measures she contemplates in her quest for personal dignity and closure.',
        oi.status_before = 'Prior to the event, the knife was likely a mundane household item, carrying no particular significance beyond its practical use. It existed within Lollia\'s domestic sphere, embodying a tool for daily life rather than emotional trauma.',
        oi.status_after = 'Following the event, the knife takes on heightened emotional significance, becoming a representation of Lollia’s profound hurt and desire for absolution. It symbolizes the extreme measures she feels compelled to consider, lingering as a haunting reminder of her trauma and the quest for reclaiming agency over her body and mind.'
    WITH oi
    MATCH (o:Object {uuid: 'object_knife'})
    MATCH (e:Event {uuid: 'event_1_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Lollia stands in her opulent reception chamber, initially playing the gracious host, having just presented entertainment and a beautiful dinner.  She gathers her \'dearest friends\' as witnesses, her demeanor shifting from celebratory to intensely serious as she prepares to deliver a shocking revelation. She is positioned as the central performer of a tragic unveiling, her posture conveying a mix of resolve and profound distress.',
        ap.emotional_state = 'Lollia is a vortex of barely contained trauma and anguish. Outwardly, she attempts to maintain composure while hosting, but beneath the surface roils a tempest of horror, shame, and fury. Her voice trembles, betraying the immense emotional strain of recounting her ordeal with Tiberius.  Internally, she is battling the fresh wounds of violation, grappling with the unbearable memory of her experience, and wrestling with the conflict between her love for her family and the defilement she has endured.',
        ap.emotional_tags = ["lollia is a vortex of barely contained trauma", "anguish. outwardly, she attempts to maintain composure while hosting, but beneath the surface roils a tempest of horror, shame,", "fury. her voice trembles, betraying the immense emotional strain of recounting her ordeal with tiberius.  internally, she is battling the fresh wounds of violation, grappling with the unbearable memory of her experience,", "wrestling with the conflict between her love for her family", "the defilement she has endured.", "lollia is a vortex of barely contained trauma and anguish. outwardly", "she attempts to maintain composure while hosting", "but beneath the surface roils a tempest of horror", "shame", "and fury. her voice trembles", "betraying the immense emotional strain of recounting her ordeal with tiberius.  internally", "she is battling the fresh wounds of violation", "grappling with the unbearable memory of her experience", "and wrestling with the conflict between her love for her family and the defilement she has endured.", "lollia is a vortex of barely contained trauma and anguish. outwardly, she attempts to maintain composure", "hosting, but beneath the surface roils a tempest of horror, shame, and fury. her voice trembles, betraying the immense emotional strain of recounting her ordeal with tiberius.  internally, she is battling the fresh wounds of violation, grappling with the unbearable memory of her experience, and wrestling with the conflict between her love for her family and the defilement she has endured.", "lollia is a vortex of barely contained trauma and anguish. outwardly, she attempts to maintain composure while hosting,", "beneath the surface roils a tempest of horror, shame, and fury. her voice trembles, betraying the immense emotional strain of recounting her ordeal with tiberius.  internally, she is battling the fresh wounds of violation, grappling with the unbearable memory of her experience, and wrestling with the conflict between her love for her family and the defilement she has endured."],
        ap.active_plans = ["To expose the monstrous depravity of Emperor Tiberius to a select group of influential Romans.", "To articulate the full horror of her personal sacrifice made to protect her daughter, Camilla.", "To seek emotional catharsis and validation by sharing her traumatic experience with trusted confidantes, hoping to find some solace or understanding."],
        ap.beliefs = ["A mother's duty is to protect her child at any cost, even through self-sacrifice.", "Tiberius's actions are not only depraved but represent a profound moral corruption at the heart of Roman power.", "Silence in the face of such atrocity is untenable; the truth, however painful, must be revealed to those who might understand and potentially act."],
        ap.goals = ["{type: short-term, desire: To completely unburden herself by narrating the graphic details of her encounter with Tiberius to her assembled guests.}", "{type: medium-term, desire: To elicit a reaction of shock and outrage from her audience, thereby validating the enormity of her sacrifice and the injustice she has suffered.}", "{type: ultimate, desire: To somehow cleanse herself of the defilement she feels, even if symbolically, and to find a path forward, however fractured, after experiencing such profound trauma and violation.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is present as a guest in Lollia\'s reception chamber, initially partaking in the convivial atmosphere of the evening. He listens attentively as Lollia begins her \'performance\', his posture shifting from relaxed guest to intently focused observer. He is positioned as a witness to Lollia\'s shocking confession, his presence underscoring his role as a chronicler of the unfolding horrors within the Julio-Claudian dynasty. He is physically still, absorbing the gravity of Lollia’s words.',
        ap.emotional_state = 'Claudius begins the evening in a state of polite enjoyment, complimenting Lollia and appreciating the presented entertainment. As Lollia\'s narrative unfolds, his emotional state transitions to profound shock and somber contemplation.  He is outwardly silent, but inwardly horrified by the graphic depiction of Tiberius’s cruelty and Lollia\'s suffering. He is grappling with the chilling realization of the depths of depravity within the imperial family, recognizing the pervasive corruption and moral decay that threatens to consume Rome. His unspoken conflict is his intellectual understanding of the court\'s darkness versus his personal vulnerability within it.',
        ap.emotional_tags = ["claudius begins the evening in a state of polite enjoyment, complimenting lollia", "appreciating the presented entertainment. as lollia's narrative unfolds, his emotional state transitions to profound shock", "somber contemplation.  he is outwardly silent, but inwardly horrified by the graphic depiction of tiberius\u2019s cruelty", "lollia's suffering. he is grappling with the chilling realization of the depths of depravity within the imperial family, recognizing the pervasive corruption", "moral decay that threatens to consume rome. his unspoken conflict is his intellectual understanding of the court's darkness versus his personal vulnerability within it.", "claudius begins the evening in a state of polite enjoyment", "complimenting lollia and appreciating the presented entertainment. as lollia's narrative unfolds", "his emotional state transitions to profound shock and somber contemplation.  he is outwardly silent", "but inwardly horrified by the graphic depiction of tiberius\u2019s cruelty and lollia's suffering. he is grappling with the chilling realization of the depths of depravity within the imperial family", "recognizing the pervasive corruption and moral decay that threatens to consume rome. his unspoken conflict is his intellectual understanding of the court's darkness versus his personal vulnerability within it.", "claudius begins the evening in a state of polite enjoyment, complimenting lollia and appreciating the presented entertainment. as lollia's narrative unfolds, his emotional state transitions to profound shock and somber contemplation.  he is outwardly silent,", "inwardly horrified by the graphic depiction of tiberius\u2019s cruelty and lollia's suffering. he is grappling with the chilling realization of the depths of depravity within the imperial family, recognizing the pervasive corruption and moral decay that threatens to consume rome. his unspoken conflict is his intellectual understanding of the court's darkness versus his personal vulnerability within it."],
        ap.active_plans = ["To meticulously observe and absorb every detail of Lollia's revelation, seeking to understand the full scope of Tiberius's depravity.", "To gauge the reactions of the other guests, assessing the political undercurrents and potential ramifications of Lollia's public confession.", "To offer silent support and witness to Lollia's trauma, recognizing the importance of bearing witness to such atrocities within the context of his own historical perspective."],
        ap.beliefs = ["The Julio-Claudian dynasty is inherently corrupt and prone to monstrous acts of cruelty and abuse of power.", "Lollia is a victim of a brutal and unjust system, her suffering a stark example of the human cost of imperial decadence.", "Truth, however horrifying, must be acknowledged and understood, even if direct action is impossible or too dangerous for him to undertake."],
        ap.goals = ["{type: short-term, desire: To fully comprehend the immediate impact of Lollia's confession on the present gathering and the individuals involved.}", "{type: medium-term, desire: To integrate Lollia's testimony into his broader understanding of the Julio-Claudian dynasty's moral decay and the tyrannical nature of Tiberius's rule.}", "{type: ultimate, desire: To survive the treacherous political landscape of Rome by accumulating knowledge and understanding, positioning himself as an astute observer capable of navigating the dangers and potentially outlasting the current reign of terror.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Lollia stands in the reception chamber, her body tense and posture rigid as she recounts a horrifying experience. Her hands tremble slightly, and she grips the knife tightly, an embodiment of her inner turmoil. Her voice wavers, reflecting the weight of her revelations as she unveils the sordid truths of Tiberius\'s intentions and actions.',
        ap.emotional_state = 'Lollia is engulfed by a tumultuous mix of fear, anger, and guilt. Outwardly, she displays a brave front, determined to protect her daughter and reveal the truth. However, internally, she is tormented by her actions and the trauma she endured, struggling to reconcile her past with her role as a mother. Her desperation is palpable as she grapples with the haunting memories of her defilement.',
        ap.emotional_tags = ["lollia is engulfed by a tumultuous mix of fear, anger,", "guilt. outwardly, she displays a brave front, determined to protect her daughter", "reveal the truth. however, internally, she is tormented by her actions", "the trauma she endured, struggling to reconcile her past with her role as a mother. her desperation is palpable as she grapples with the haunting memories of her defilement.", "lollia is engulfed by a tumultuous mix of fear", "anger", "and guilt. outwardly", "she displays a brave front", "determined to protect her daughter and reveal the truth. however", "internally", "she is tormented by her actions and the trauma she endured", "struggling to reconcile her past with her role as a mother. her desperation is palpable as she grapples with the haunting memories of her defilement."],
        ap.active_plans = ["To protect her daughter Camilla from the corrupting influence of Tiberius, using her own body as a shield.", "To reveal the depravity of Tiberius to her husband and friends, hoping to incite action or change in the court.", "To confront her feelings of shame and guilt regarding her sacrifice, seeking understanding and perhaps forgiveness from Titus."],
        ap.beliefs = ["A mother's love knows no bounds and justifies extreme actions for the sake of her child.", "Power corrupts absolutely, and those in high positions are often devoid of morality.", "The familial bonds should be prioritized above all else, even at the cost of personal dignity."],
        ap.goals = ["Short-term: To communicate the horror of her experience to Titus and their friends to instigate protective measures for Camilla.", "Medium-term: To find a way to emotionally heal from her trauma and reclaim her sense of self.", "Ultimate: To ensure that Camilla remains safe and untouched by the vile intentions of Tiberius and the corrupt court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Titus stands beside Lollia, his expression shifting from lightheartedness to alarm as the gravity of her revelations sinks in. He leans forward, arms crossed protectively, his brow furrowed in concern. His body language becomes increasingly agitated as he struggles with disbelief and horror at the tale unfolding before him.',
        ap.emotional_state = 'Titus exhibits a complex emotional response, initially masked by a facade of joviality but quickly evolving into distress and anger. His disbelief transforms into protective rage as he processes the implications of Lollia\'s sacrifice and the threat posed by Tiberius. Internally, he grapples with feelings of helplessness and a fierce desire to protect his family from the imperial corruption.',
        ap.emotional_tags = ["titus exhibits a complex emotional response, initially masked by a facade of joviality but quickly evolving into distress", "anger. his disbelief transforms into protective rage as he processes the implications of lollia's sacrifice", "the threat posed by tiberius. internally, he grapples with feelings of helplessness", "a fierce desire to protect his family from the imperial corruption.", "titus exhibits a complex emotional response", "initially masked by a facade of joviality but quickly evolving into distress and anger. his disbelief transforms into protective rage as he processes the implications of lollia's sacrifice and the threat posed by tiberius. internally", "he grapples with feelings of helplessness and a fierce desire to protect his family from the imperial corruption.", "titus exhibits a complex emotional response, initially masked by a facade of joviality", "quickly evolving into distress and anger. his disbelief transforms into protective rage as he processes the implications of lollia's sacrifice and the threat posed by tiberius. internally, he grapples with feelings of helplessness and a fierce desire to protect his family from the imperial corruption."],
        ap.active_plans = ["To confront Tiberius regarding his behavior and assert the protection of his family.", "To support Lollia through her trauma, providing an emotional anchor amid her turmoil.", "To gather allies in the court to challenge Tiberius's authority and prevent any further harm to Camilla."],
        ap.beliefs = ["A husband's duty is to protect his wife and family against any threat, especially against corrupt power.", "The sanctity of family is paramount, and must be defended against moral decay.", "Loyalty to one's spouse and offspring supersedes allegiance to the emperor or the state."],
        ap.goals = ["Short-term: To understand the full scope of Lollia's experience and devise a plan to safeguard Camilla.", "Medium-term: To confront the moral decay within the court and rally support for a shift in power dynamics.", "Ultimate: To maintain the integrity of his family and legacy, ensuring that they are not further harmed by imperial tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Lollia stands before her assembled friends, her voice trembling but resolute as she recounts the horrific ordeal she endured at the hands of Tiberius. She gestures emphatically, her body language conveying a profound sense of violation and despair as she relives the traumatic events in vivid detail.',
        ap.emotional_state = 'Lollia is a maelstrom of anguish and fury. On the surface, she is tearful and visibly shaken, her voice cracking with emotion as she describes the \'abominable filth\'. Beneath this outward display of distress lies a deeper well of trauma and shame, intertwined with a fierce, unwavering maternal love. She is wrestling with the unbearable memory of her defilement and the agonizing impact it has on her sense of self and her marriage, creating a palpable tension between her desire for catharsis and the profound pain of reliving her ordeal.',
        ap.emotional_tags = ["lollia is a maelstrom of anguish", "fury. on the surface, she is tearful", "visibly shaken, her voice cracking with emotion as she describes the 'abominable filth'. beneath this outward display of distress lies a deeper well of trauma", "shame, intertwined with a fierce, unwavering maternal love. she is wrestling with the unbearable memory of her defilement", "the agonizing impact it has on her sense of self", "her marriage, creating a palpable tension between her desire for catharsis", "the profound pain of reliving her ordeal.", "lollia is a maelstrom of anguish and fury. on the surface", "she is tearful and visibly shaken", "her voice cracking with emotion as she describes the 'abominable filth'. beneath this outward display of distress lies a deeper well of trauma and shame", "intertwined with a fierce", "unwavering maternal love. she is wrestling with the unbearable memory of her defilement and the agonizing impact it has on her sense of self and her marriage", "creating a palpable tension between her desire for catharsis and the profound pain of reliving her ordeal."],
        ap.active_plans = ["To fully disclose the abhorrent nature of Tiberius's acts to her trusted circle, ensuring they understand the true depravity of the Emperor.", "To articulate the irreparable damage inflicted upon her psyche and marriage, emphasizing the lasting scars of her sacrifice.", "To use the symbolic presence of a knife to underscore the extremity of her emotional pain and suicidal ideation, conveying the depth of her defilement and her desire for purification or self-annihilation."],
        ap.beliefs = ["A mother's love knows no bounds and compels ultimate sacrifice for the safety and purity of her children.", "Tiberius embodies absolute moral corruption and represents the grotesque decay at the heart of imperial power.", "The violation she suffered has irrevocably tainted her, leaving an indelible mark on her soul and destroying her sense of self-worth and marital sanctity."],
        ap.goals = ["Short-term: To unburden herself by confessing the full horror of her experience, seeking validation and understanding from her friends.", "Medium-term: To find a way to purge the defilement and reclaim some semblance of inner peace, although she expresses profound doubt about this possibility.", "Ultimate: To expose the moral bankruptcy of Tiberius and the imperial court, even at the cost of her own reputation and emotional stability, thereby highlighting the human cost of unchecked power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Titus is initially jovial, engaging in light banter with Lollia and their friends. However, as Lollia begins to recount her experience, his demeanor shifts dramatically. He becomes increasingly agitated, his initial confusion giving way to alarm and then palpable distress. He attempts to interrupt Lollia, pleading with her to stop, his body language conveying a mixture of horror and helplessness as he absorbs the gravity of her revelation.',
        ap.emotional_state = 'Titus experiences a rapid shift from lighthearted amusement to profound shock and distress. Outwardly, he displays growing alarm, interrupting Lollia and begging her to cease her account, indicating his deep discomfort and inability to cope with the graphic nature of her trauma. Internally, he is battling a complex mix of disbelief, horror, and impotent rage. He is deeply concerned for Lollia\'s well-being and devastated by the implications of her confession for their marriage and their family\'s honor. Beneath the surface, a simmering fury towards Tiberius begins to ignite, fueled by his love for Lollia and his outrage at the Emperor\'s cruelty.',
        ap.emotional_tags = ["titus experiences a rapid shift from lighthearted amusement to profound shock", "distress. outwardly, he displays growing alarm, interrupting lollia", "begging her to cease her account, indicating his deep discomfort", "inability to cope with the graphic nature of her trauma. internally, he is battling a complex mix of disbelief, horror,", "impotent rage. he is deeply concerned for lollia's well-being", "devastated by the implications of her confession for their marriage", "their family's honor. beneath the surface, a simmering fury towards tiberius begins to ignite, fueled by his love for lollia", "his outrage at the emperor's cruelty.", "titus experiences a rapid shift from lighthearted amusement to profound shock and distress. outwardly", "he displays growing alarm", "interrupting lollia and begging her to cease her account", "indicating his deep discomfort and inability to cope with the graphic nature of her trauma. internally", "he is battling a complex mix of disbelief", "horror", "and impotent rage. he is deeply concerned for lollia's well-being and devastated by the implications of her confession for their marriage and their family's honor. beneath the surface", "a simmering fury towards tiberius begins to ignite", "fueled by his love for lollia and his outrage at the emperor's cruelty."],
        ap.active_plans = ["To initially understand the 'surprise' Lollia has planned, moving from lighthearted curiosity to growing unease as her narrative unfolds.", "To protect Lollia from further emotional pain by attempting to halt her graphic recounting of the traumatic events, driven by his love and concern.", "To grapple with the shocking reality of Tiberius's actions and their devastating impact on Lollia and their relationship, struggling to process the enormity of the violation."],
        ap.beliefs = ["Certain matters, especially those concerning familial shame and trauma, are best kept private and not publicly disclosed.", "The Emperor's power is absolute and untouchable, making direct retaliation impossible and potentially suicidal.", "His primary role is to protect Lollia and his family, yet he feels utterly powerless to redress the wrongs inflicted upon them by Tiberius."],
        ap.goals = ["Short-term: To immediately stop Lollia from further verbalizing the horrific details of her experience in front of their friends, driven by a desire to shield her and perhaps himself from further distress.", "Medium-term: To offer comfort and support to Lollia in the aftermath of her trauma, though he is clearly overwhelmed and unsure how to effectively do so.", "Ultimate: To protect his family from the pervasive corruption and danger of the imperial court, a goal that now seems increasingly futile given the devastating reach of Tiberius's depravity and power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Lollia stands at the center of the reception chamber, her posture tense and her hands trembling as she recounts the horrific ordeal she endured at Tiberius\'s hands. Her voice quivers with emotion, punctuated by moments of anguish as she recalls the degradation she faced. She clutches a knife in her hand, wavering between despair and the fierce determination to articulate her suffering.',
        ap.emotional_state = 'Lollia\'s surface emotions reflect deep distress and torment, as tears well in her eyes and her voice quakes with heartache. Internally, she experiences a tumultuous conflict between maternal love and self-loathing, grappling with the horror of her sacrifice. Her spoken words reveal an unspoken fear that the trauma will irreparably fracture her bond with Titus, leading to a profound sense of isolation.',
        ap.emotional_tags = ["lollia's surface emotions reflect deep distress", "torment, as tears well in her eyes", "her voice quakes with heartache. internally, she experiences a tumultuous conflict between maternal love", "self-loathing, grappling with the horror of her sacrifice. her spoken words reveal an unspoken fear that the trauma will irreparably fracture her bond with titus, leading to a profound sense of isolation.", "lollia's surface emotions reflect deep distress and torment", "as tears well in her eyes and her voice quakes with heartache. internally", "she experiences a tumultuous conflict between maternal love and self-loathing", "grappling with the horror of her sacrifice. her spoken words reveal an unspoken fear that the trauma will irreparably fracture her bond with titus", "leading to a profound sense of isolation."],
        ap.active_plans = ["To confront Titus with the truth of her sacrifice and the horror she faced.", "To seek understanding and empathy from Titus, hoping for the restoration of their relationship.", "To articulate the injustice of Tiberius's actions in the hope of rallying support against the tyranny."],
        ap.beliefs = ["A mother's love knows no bounds, justifying her actions for the sake of her daughter.", "Personal dignity is paramount, and the defilement she suffered is an unbearable burden.", "The truth must be spoken, even if it risks further emotional pain for herself and her husband."],
        ap.goals = ["Short-term: To reveal the truth to Titus and alleviate the burden of her secret.", "Medium-term: To protect Camilla from Tiberius's predatory nature.", "Ultimate: To find peace within herself and restore her marriage with Titus despite the trauma."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Titus stands rigidly, his expression shifting from a lighthearted demeanor to one of alarm and disbelief. He shifts his weight from foot to foot, his hands clenched, visibly struggling to process the horror of Lollia\'s revelation. The concern etched on his face reflects a growing storm of protective instinct, love, and a deep-seated fear for his family.',
        ap.emotional_state = 'On the surface, Titus displays shock and sorrow, grappling with disbelief and a protective fury as Lollia recounts her traumatic experience. Internally, he stirs with anger towards Tiberius and a profound helplessness, feeling overwhelmed by the implications of his wife\'s sacrifice. His emotional conflict intensifies as he battles the desire to support Lollia while facing the unsettling reality of their vulnerability in Tiberius\'s world.',
        ap.emotional_tags = ["on the surface, titus displays shock", "sorrow, grappling with disbelief", "a protective fury as lollia recounts her traumatic experience. internally, he stirs with anger towards tiberius", "a profound helplessness, feeling overwhelmed by the implications of his wife's sacrifice. his emotional conflict intensifies as he battles the desire to support lollia while facing the unsettling reality of their vulnerability in tiberius's world.", "on the surface", "titus displays shock and sorrow", "grappling with disbelief and a protective fury as lollia recounts her traumatic experience. internally", "he stirs with anger towards tiberius and a profound helplessness", "feeling overwhelmed by the implications of his wife's sacrifice. his emotional conflict intensifies as he battles the desire to support lollia while facing the unsettling reality of their vulnerability in tiberius's world.", "on the surface, titus displays shock and sorrow, grappling with disbelief and a protective fury as lollia recounts her traumatic experience. internally, he stirs with anger towards tiberius and a profound helplessness, feeling overwhelmed by the implications of his wife's sacrifice. his emotional conflict intensifies as he battles the desire to support lollia", "facing the unsettling reality of their vulnerability in tiberius's world."],
        ap.active_plans = ["To protect Lollia from further emotional harm and provide comfort.", "To confront Tiberius about his actions and the threat he poses to their family.", "To seek justice for Lollia's suffering, even if it risks political repercussions."],
        ap.beliefs = ["Family is of utmost importance, and he must protect his loved ones at all costs.", "Love and loyalty should prevail over the cruelty of the imperial court.", "The truth of Lollia's experience is vital and must be acknowledged to heal."],
        ap.goals = ["Short-term: To support Lollia in her time of distress and ensure her emotional safety.", "Medium-term: To confront Tiberius and protect Camilla from his advances.", "Ultimate: To restore their family's honor and navigate the treacherous waters of imperial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands to the side of the chamber, her expression one of fierce resolve. She listens intently to Lollia\'s harrowing tale, her posture strong yet tinged with empathy. As Lollia speaks, Agrippina occasionally exchanges glances with Titus, her presence a stabilizing force amid the emotional turmoil.',
        ap.emotional_state = 'Agrippina outwardly displays concern and a protective instinct towards Lollia, her brow furrowing in sympathy. Internally, she wrestles with a mix of anger towards Tiberius and a desire for justice, yet she balances this with the understanding that Lollia’s trauma must not overshadow her strength. Her conviction to support Lollia is unwavering, fueled by the knowledge of the moral decay surrounding them.',
        ap.emotional_tags = ["agrippina outwardly displays concern", "a protective instinct towards lollia, her brow furrowing in sympathy. internally, she wrestles with a mix of anger towards tiberius", "a desire for justice, yet she balances this with the understanding that lollia\u2019s trauma must not overshadow her strength. her conviction to support lollia is unwavering, fueled by the knowledge of the moral decay surrounding them.", "agrippina outwardly displays concern and a protective instinct towards lollia", "her brow furrowing in sympathy. internally", "she wrestles with a mix of anger towards tiberius and a desire for justice", "yet she balances this with the understanding that lollia\u2019s trauma must not overshadow her strength. her conviction to support lollia is unwavering", "fueled by the knowledge of the moral decay surrounding them."],
        ap.active_plans = ["To provide emotional support to Lollia and validate her experience.", "To seek allies among the gathered friends to confront Tiberius\u2019s behavior.", "To advocate for a collective response to the injustices faced by women in the court."],
        ap.beliefs = ["Women must stand together against the tyranny and cruelty of men in power.", "The truth of personal trauma must be voiced to bring about change.", "Strength in unity is vital in challenging the corrupt nature of the imperial court."],
        ap.goals = ["Short-term: To comfort Lollia and encourage her to express her pain.", "Medium-term: To galvanize support from their friends against Tiberius's cruelty.", "Ultimate: To create a safer environment for women in Rome's political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands confidently on the Roman street, her posture erect and commanding as she intercepts her son Tiberius. She gestures animatedly, her arms slicing through the air as she delivers her barbed greeting, her face painted with a sardonic smile that contrasts sharply with the tension in her voice.',
        ap.emotional_state = 'Surface emotions reveal a facade of playful sarcasm, yet beneath the surface lies a deep well of frustration and disappointment. Livia feels neglected and disrespected by her son, manifesting in her sharp comments and thinly veiled criticisms. The unspoken conflict arises from her desperate need for attention and validation, battling against Tiberius\'s growing detachment.',
        ap.emotional_tags = ["surface emotions reveal a facade of playful sarcasm, yet beneath the surface lies a deep well of frustration", "disappointment. livia feels neglected", "disrespected by her son, manifesting in her sharp comments", "thinly veiled criticisms. the unspoken conflict arises from her desperate need for attention", "validation, battling against tiberius's growing detachment.", "surface emotions reveal a facade of playful sarcasm", "yet beneath the surface lies a deep well of frustration and disappointment. livia feels neglected and disrespected by her son", "manifesting in her sharp comments and thinly veiled criticisms. the unspoken conflict arises from her desperate need for attention and validation", "battling against tiberius's growing detachment."],
        ap.active_plans = ["To confront Tiberius about his neglect and regain the influence she feels slipping away.", "To publicly assert her authority and remind Tiberius of her place within the imperial family.", "To provoke a reaction from Tiberius that affirms her importance and the need for her validation."],
        ap.beliefs = ["Power is retained through manipulation and emotional control over her family.", "Loyalty is fleeting, and one must constantly assert dominance to stay relevant.", "The importance of legacy drives her actions, compelling her to demand recognition from Tiberius."],
        ap.goals = ["Short-term: To extract from Tiberius an acknowledgment of her influence and importance.", "Medium-term: To secure her status as a revered figure in the empire, particularly as her birthday approaches.", "Ultimate: To establish lasting power and legacy within the Julio-Claudian dynasty, ensuring her name endures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius strides purposefully through the crowded street, flanked by soldiers who clear the way. He carries himself with a measured demeanor, but his eyes flicker with irritation as he encounters Livia. He maintains a formal posture, his arms at his sides, responding tersely to her provocations, trying to dismiss her with a wave of his hand.',
        ap.emotional_state = 'Though Tiberius\'s tone is calm, a current of irritation and frustration simmers beneath. He feels cornered by Livia\'s relentless questioning and barbed remarks, revealing his internal conflict as he struggles to balance familial duty with the need to assert his authority. The tension reflects his burdensome legacy and the weight of expectations he feels from both Livia and the empire.',
        ap.emotional_tags = ["though tiberius's tone is calm, a current of irritation", "frustration simmers beneath. he feels cornered by livia's relentless questioning", "barbed remarks, revealing his internal conflict as he struggles to balance familial duty with the need to assert his authority. the tension reflects his burdensome legacy", "the weight of expectations he feels from both livia", "the empire.", "though tiberius's tone is calm", "a current of irritation and frustration simmers beneath. he feels cornered by livia's relentless questioning and barbed remarks", "revealing his internal conflict as he struggles to balance familial duty with the need to assert his authority. the tension reflects his burdensome legacy and the weight of expectations he feels from both livia and the empire."],
        ap.active_plans = ["To deflect Livia's criticisms and maintain his authority as Emperor.", "To avoid engaging in a public argument that could undermine his position.", "To establish boundaries with Livia, indicating that he will not be controlled by her demands."],
        ap.beliefs = ["Authority is paramount, and he must present a strong front to maintain control.", "Family ties should not interfere with his role as Emperor; personal grievances must be managed privately.", "The legacy and stability of the empire take precedence over personal relationships."],
        ap.goals = ["Short-term: To quell Livia's demands without escalating the confrontation.", "Medium-term: To navigate the political landscape without showing weakness or vulnerability.", "Ultimate: To secure his reign and legacy, ensuring that his rule is characterized by strength and decisiveness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Livia intercepts Tiberius in a bustling Roman street, positioning herself directly in his path as he is escorted by soldiers. She stands tall and imperious, her voice cutting through the ambient noise to publicly confront her son, ensuring her words are heard not just by him but also by his retinue and any onlookers. She gestures emphatically as she speaks, emphasizing her displeasure and demands.',
        ap.emotional_state = 'Livia is radiating indignation and entitlement, her surface emotions a mix of scorn and imperious demand.  Beneath this outward display, she is driven by a deep-seated need for validation and power, feeling slighted by Tiberius\' perceived lack of respect. There\'s an undercurrent of bitterness and resentment stemming from her desire for greater public recognition and her feeling that Tiberius is failing to adequately honor her status. Her sharp tone and accusatory questions betray a controlling nature and a deep-seated insecurity about her influence waning.',
        ap.emotional_tags = ["livia is radiating indignation", "entitlement, her surface emotions a mix of scorn", "imperious demand.  beneath this outward display, she is driven by a deep-seated need for validation", "power, feeling slighted by tiberius' perceived lack of respect. there's an undercurrent of bitterness", "resentment stemming from her desire for greater public recognition", "her feeling that tiberius is failing to adequately honor her status. her sharp tone", "accusatory questions betray a controlling nature", "a deep-seated insecurity about her influence waning.", "livia is radiating indignation and entitlement", "her surface emotions a mix of scorn and imperious demand.  beneath this outward display", "she is driven by a deep-seated need for validation and power", "feeling slighted by tiberius' perceived lack of respect. there's an undercurrent of bitterness and resentment stemming from her desire for greater public recognition and her feeling that tiberius is failing to adequately honor her status. her sharp tone and accusatory questions betray a controlling nature and a deep-seated insecurity about her influence waning."],
        ap.active_plans = ["Publicly assert her maternal authority over Tiberius, reminding him and any witnesses of her power.", "Force Tiberius to acknowledge her demands for a temple and a lavish birthday gift, extracting public promises if possible.", "Undermine Tiberius' authority by publicly criticizing his decisions and comparing him unfavorably to his deceased brother, Drusus."],
        ap.beliefs = ["As the Emperor's mother and a figure of significant historical importance, she is entitled to unquestioning respect and lavish displays of public honor.", "Tiberius is indebted to her for his position and should therefore be subservient to her will.", "Public perception of power is as important as actual power, and she must constantly reinforce her image of dominance."],
        ap.goals = ["short-term\": \"To publicly humiliate Tiberius and extract an immediate commitment to her demands in front of witnesses.", "medium-term\": \"To ensure the construction of a temple in her honor and receive an extravagant birthday gift, thereby solidifying her public image and influence.", "ultimate\": \"To achieve a form of immortality through public veneration and lasting legacy, ensuring her continued dominance even beyond her physical life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius is moving through the Roman street in a formal procession, surrounded by his soldiers, projecting an image of imperial authority. When Livia confronts him, he halts his procession reluctantly, turning to face her with visible impatience. He maintains a controlled posture, attempting to keep the exchange brief and dismissive, eager to resume his journey and escape the public harangue.',
        ap.emotional_state = 'Tiberius is visibly annoyed and impatient, his surface emotion a strained politeness masking irritation. Internally, he is likely seething with resentment and frustration at being publicly accosted by his mother. He feels trapped and manipulated, resenting Livia\'s constant demands and public displays of control. There\'s a palpable tension between his outward attempt to maintain imperial composure and his inner desire to escape the confrontation and assert his independence from her domineering influence.',
        ap.emotional_tags = ["tiberius is visibly annoyed", "impatient, his surface emotion a strained politeness masking irritation. internally, he is likely seething with resentment", "frustration at being publicly accosted by his mother. he feels trapped", "manipulated, resenting livia's constant demands", "public displays of control. there's a palpable tension between his outward attempt to maintain imperial composure", "his inner desire to escape the confrontation", "assert his independence from her domineering influence.", "tiberius is visibly annoyed and impatient", "his surface emotion a strained politeness masking irritation. internally", "he is likely seething with resentment and frustration at being publicly accosted by his mother. he feels trapped and manipulated", "resenting livia's constant demands and public displays of control. there's a palpable tension between his outward attempt to maintain imperial composure and his inner desire to escape the confrontation and assert his independence from her domineering influence."],
        ap.active_plans = ["De-escalate the public confrontation with Livia as quickly as possible to avoid a scene and maintain his imperial dignity.", "Dismiss Livia's accusations and demands with curt responses, avoiding any substantive engagement or commitment.", "Reassert his authority by abruptly ending the conversation and ordering his procession to move on, demonstrating his control over the situation despite her interruption."],
        ap.beliefs = ["Public displays of familial conflict are unbecoming of an Emperor and undermine his authority.", "Livia's demands are excessive and motivated by her insatiable hunger for power and recognition, which he is increasingly unwilling to indulge.", "Matters of state, such as temple construction, should be decided by him alone, without maternal interference or public pressure."],
        ap.goals = ["short-term\": \"To escape Livia's public confrontation and resume his procession without further delay or public spectacle.", "medium-term\": \"To diminish Livia's influence over his decisions and public image, establishing his independence from her control.", "ultimate\": \"To consolidate his power as Emperor and rule autonomously, free from the constant manipulation and demands of his mother, even if it means strained familial relations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands confidently on the street, her posture upright and assertive, as she engages Tiberius. She gestures animatedly with her hands, emphasizing her points, her voice carrying a sharp edge that commands attention amidst the noise of the soldiers. Despite the thrumming tension, she maintains an air of haughty superiority, her gaze piercing as she challenges her son’s authority.',
        ap.emotional_state = 'Outwardly, Livia exudes a facade of playful banter, but beneath the surface lies a simmering frustration and disappointment with Tiberius. Her sharp, sarcastic tone reveals her contempt for his perceived weakness, while the mention of her birthday underscores a hidden yearning for validation and connection. Her unspoken conflict is palpable, as she grapples with the fading bond between mother and son, longing for respect that has been eclipsed by Tiberius\'s dismissive behavior.',
        ap.emotional_tags = ["outwardly, livia exudes a facade of playful banter, but beneath the surface lies a simmering frustration", "disappointment with tiberius. her sharp, sarcastic tone reveals her contempt for his perceived weakness, while the mention of her birthday underscores a hidden yearning for validation", "connection. her unspoken conflict is palpable, as she grapples with the fading bond between mother", "son, longing for respect that has been eclipsed by tiberius's dismissive behavior.", "outwardly", "livia exudes a facade of playful banter", "but beneath the surface lies a simmering frustration and disappointment with tiberius. her sharp", "sarcastic tone reveals her contempt for his perceived weakness", "while the mention of her birthday underscores a hidden yearning for validation and connection. her unspoken conflict is palpable", "as she grapples with the fading bond between mother and son", "longing for respect that has been eclipsed by tiberius's dismissive behavior.", "outwardly, livia exudes a facade of playful banter, but beneath the surface lies a simmering frustration and disappointment with tiberius. her sharp, sarcastic tone reveals her contempt for his perceived weakness,", "the mention of her birthday underscores a hidden yearning for validation and connection. her unspoken conflict is palpable, as she grapples with the fading bond between mother and son, longing for respect that has been eclipsed by tiberius's dismissive behavior.", "outwardly, livia exudes a facade of playful banter,", "beneath the surface lies a simmering frustration and disappointment with tiberius. her sharp, sarcastic tone reveals her contempt for his perceived weakness, while the mention of her birthday underscores a hidden yearning for validation and connection. her unspoken conflict is palpable, as she grapples with the fading bond between mother and son, longing for respect that has been eclipsed by tiberius's dismissive behavior."],
        ap.active_plans = ["To provoke Tiberius into acknowledging her authority and importance within the family hierarchy.", "To delve into Tiberius's recent activities, particularly any trials or actions that reinforce her influence over the empire.", "To assert her maternal dominance by reminding Tiberius of his inadequacies compared to his deceased brother Drusus, thereby cementing her manipulative grip over him."],
        ap.beliefs = ["Power is derived from familial loyalty, and she expects her son to fulfill this role.", "Emotional connections are a tool for manipulation; she believes that expressing affection is merely a strategy.", "The legacy of the Julio-Claudian dynasty must be upheld, and she sees herself as the rightful guardian of its history and honor."],
        ap.goals = ["Short-term: To engage Tiberius in conversation that reveals his vulnerabilities.", "Medium-term: To manipulate Tiberius into making political decisions that favor her position in the empire.", "Ultimate: To secure her legacy and ensure her place in history as a powerful matriarch of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius strides down the Roman street, flanked by soldiers as he attempts to maintain an air of imperial authority. He stands with arms crossed, exuding unease as he engages Livia; he shifts his weight from foot to foot, signaling both impatience and discomfort with the public confrontation. His curt nods and averted gaze illustrate his desire to escape this familial exchange as quickly as possible.',
        ap.emotional_state = 'Tiberius displays a surface-level calm, his tone clipped and authoritative, yet beneath this veneer lies a storm of frustration and weariness. He feels cornered by Livia\'s pointed remarks and is acutely aware of his mother\'s criticism. The duality of his position—both Emperor and son—creates an internal conflict; he grapples with the expectation to uphold imperial authority while yearning for a more personal connection with his mother, which he has resisted for years.',
        ap.emotional_tags = ["tiberius displays a surface-level calm, his tone clipped", "authoritative, yet beneath this veneer lies a storm of frustration", "weariness. he feels cornered by livia's pointed remarks", "is acutely aware of his mother's criticism. the duality of his position\u2014both emperor", "son\u2014creates an internal conflict; he grapples with the expectation to uphold imperial authority while yearning for a more personal connection with his mother, which he has resisted for years.", "tiberius displays a surface-level calm", "his tone clipped and authoritative", "yet beneath this veneer lies a storm of frustration and weariness. he feels cornered by livia's pointed remarks and is acutely aware of his mother's criticism. the duality of his position\u2014both emperor and son\u2014creates an internal conflict; he grapples with the expectation to uphold imperial authority while yearning for a more personal connection with his mother", "which he has resisted for years.", "tiberius displays a surface-level calm, his tone clipped and authoritative, yet beneath this veneer lies a storm of frustration and weariness. he feels cornered by livia's pointed remarks and is acutely aware of his mother's criticism. the duality of his position\u2014both emperor and son\u2014creates an internal conflict", "he grapples with the expectation to uphold imperial authority while yearning for a more personal connection with his mother, which he has resisted for years.", "tiberius displays a surface-level calm, his tone clipped and authoritative, yet beneath this veneer lies a storm of frustration and weariness. he feels cornered by livia's pointed remarks and is acutely aware of his mother's criticism. the duality of his position\u2014both emperor and son\u2014creates an internal conflict; he grapples with the expectation to uphold imperial authority", "yearning for a more personal connection with his mother, which he has resisted for years."],
        ap.active_plans = ["To assert his authority as Emperor by insisting on the separation of personal matters from public discourse.", "To dismiss Livia's provocations and avoid further engagement in an uncomfortable conversation.", "To maintain his composure and minimize any public display of familial discord that could undermine his rule."],
        ap.beliefs = ["Imperial authority must remain unchallenged, and personal matters should not interfere with governance.", "Family loyalty is secondary to political pragmatism, and emotional ties can be a liability.", "Discussions of power and legacy are best handled privately to preserve the dignity of the empire."],
        ap.goals = ["Short-term: To end the conversation with Livia and move on with his duties.", "Medium-term: To reinforce his position as Emperor by avoiding any signs of weakness or familial discord.", "Ultimate: To distance himself from the manipulative nature of his family while maintaining control over the empire."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_treason_reports_event_3_3'})
    ON CREATE SET
        oi.description = 'The stack of \'Verbatim Reports of Conversations\' is presented by Sejanus to Tiberius as tangible proof of widespread treasonous sentiment within Rome. Sejanus actively uses these scrolls to direct the conversation, selecting specific reports, like Silius Caecina\'s, to highlight and emphasize the perceived threats to Tiberius\'s rule. These reports serve as instruments of manipulation, enabling Sejanus to instill paranoia in Tiberius and steer him towards taking action against individuals deemed disloyal, thus advancing Sejanus\'s own agenda.',
        oi.status_before = 'Prior to the event, the \'Verbatim Reports of Conversations\' are compiled and held by Sejanus, representing gathered intelligence from his network of agents. They exist as dormant pieces of information, awaiting strategic deployment to influence political dynamics and consolidate power, stored as scrolls ready for presentation.',
        oi.status_after = 'Following the event, the \'Verbatim Reports of Conversations\' remain in Sejanus\'s possession, having successfully served their immediate purpose. They have transitioned from mere intelligence to active tools of manipulation, effectively used to influence Tiberius and initiate actions against perceived threats like Silius Caecina, solidifying Sejanus\'s control and influence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_treason_reports'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_antique_statue_event_3_4'})
    ON CREATE SET
        oi.description = 'The antique statue is presented by Caligula as a gift to Tiberius, symbolizing a complex blend of familial affection and underlying opportunism. Its presence momentarily lightens the tense atmosphere of the audience hall, though it also serves as a reminder of Caligula\'s unpredictable nature and ambitions. The statue represents both a token of goodwill and an unsettling implication of Caligula\'s desire to ingratiate himself with Tiberius while asserting his own position within the imperial court.',
        oi.status_before = 'The statue was a prized possession in Caligula\'s collection, carefully sourced from a merchant known for rare antiquities, reflecting Caligula\'s desire to impress Tiberius.',
        oi.status_after = 'Following the presentation, the statue becomes a focal point in the audience hall, now transiently belonging to Tiberius, who must navigate the implications of receiving such a significant gift amidst the political machinations at play.'
    WITH oi
    MATCH (o:Object {uuid: 'object_antique_statue'})
    MATCH (e:Event {uuid: 'event_3_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_evidence_silius_caecina_impeachment_event_3_5'})
    ON CREATE SET
        oi.description = 'The scrolls containing \'verbatim reports\' are presented by Sejanus to Tiberius and then specifically highlighted to Varro as incriminating evidence against Silius Caecina. Sejanus uses these documents to suggest the impeachment of Silius for treason, strategically pointing out Silius\'s alleged boastful and disloyal comments. The evidence is instrumental in driving the event forward, serving as the catalyst for the discussion of impeachment and placing Varro in a position where he is pressured to initiate legal action against Silius. The scrolls act as a tool of manipulation, shaping perceptions and driving the political agenda within the scene.',
        oi.status_before = 'Prior to the event, the \'evidence\' exists as a collection of scrolls compiled by Sejanus\'s agents, containing reported conversations deemed politically sensitive or incriminating. These scrolls are under Sejanus\'s control and have already been used to brief Tiberius, forming the basis of Sejanus\'s accusation against Silius Caecina.',
        oi.status_after = 'Following the event, the \'evidence\' scrolls are now in the possession of Varro, who is tasked with examining them to build a legal case for impeachment. The status of the \'evidence\' shifts from being a tool of manipulation in Sejanus\'s hands to becoming the foundation for potential legal proceedings, albeit proceedings initiated and driven by political motives rather than genuine legal merit. The scrolls have successfully served their purpose of instigating the impeachment process against Silius.'
    WITH oi
    MATCH (o:Object {uuid: 'object_evidence_silius_caecina_impeachment'})
    MATCH (e:Event {uuid: 'event_3_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Emperor Tiberius stands center stage in his dimly lit audience hall, his posture rigid with barely contained impatience. He paces slightly as he barks orders for Thrasyllus\'s immediate arrival, revealing his agitated state. His movements are sharp and abrupt, reflecting his inner turmoil and a kingly expectation of prompt obedience from his court. Despite his imperial bearing, a weariness hangs about him, a sense of being burdened by the very power he wields.',
        ap.emotional_state = 'Outwardly, Tiberius displays a veneer of imperial irritation and impatience, snapping at the absent Thrasyllus and expressing exasperation about his mother. Beneath this surface agitation simmers a deeper resentment and exhaustion. He is psychologically strained by Livia\'s enduring presence and influence, feeling trapped and oppressed by her shadow. His desire to know her lifespan speaks to a hidden desperation to be free from her control, revealing a conflict between his public image of authority and his private vulnerability.',
        ap.emotional_tags = ["outwardly, tiberius displays a veneer of imperial irritation", "impatience, snapping at the absent thrasyllus", "expressing exasperation about his mother. beneath this surface agitation simmers a deeper resentment", "exhaustion. he is psychologically strained by livia's enduring presence", "influence, feeling trapped", "oppressed by her shadow. his desire to know her lifespan speaks to a hidden desperation to be free from her control, revealing a conflict between his public image of authority", "his private vulnerability.", "outwardly", "tiberius displays a veneer of imperial irritation and impatience", "snapping at the absent thrasyllus and expressing exasperation about his mother. beneath this surface agitation simmers a deeper resentment and exhaustion. he is psychologically strained by livia's enduring presence and influence", "feeling trapped and oppressed by her shadow. his desire to know her lifespan speaks to a hidden desperation to be free from her control", "revealing a conflict between his public image of authority and his private vulnerability."],
        ap.active_plans = ["Summon Thrasyllus to cast Livia's horoscope and determine her lifespan.", "Express his frustration and weariness regarding Livia's continued presence and influence to those around him.", "Maintain an image of imperial command and control, despite his internal turmoil and weariness."],
        ap.beliefs = ["Astrology can provide genuine insights into the future and the lifespans of individuals.", "His mother, Livia, is a significant and oppressive force in his life, causing him considerable personal and political strain.", "As Emperor, he deserves respite from the burdens and familial pressures that weigh upon him."],
        ap.goals = ["Short-term: Obtain information from Thrasyllus about Livia's future and potential lifespan.", "Medium-term: Lessen or eliminate Livia's interference in his rule and personal life.", "Ultimate: Achieve a sense of peace and stability in his reign, free from the constant familial and political pressures exerted by his mother."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus enters the Imperial Palace audience hall in a state of nervous haste, practically propelled into the Emperor\'s presence. He moves quickly, almost tripping in his eagerness to obey Tiberius\'s summons. His posture is stooped, shoulders hunched as if to minimize his presence, and his gestures are quick and fluttery, betraying his anxiety. He arrives ready to serve, his physical being radiating subservience and a desire to please the Emperor.',
        ap.emotional_state = 'Thrasyllus is palpably nervous and apprehensive. His hurried entrance and immediate deference signal surface-level anxiety in the face of imperial authority. Internally, he likely feels a mixture of fear and ambition. He understands the precarious nature of his position; displeasing the Emperor could have dire consequences, while successfully fulfilling Tiberius\'s request might elevate his standing.  He is caught between the desire to serve and the fear of misstepping in the treacherous court environment, his inner state a careful balancing act of professional duty and self-preservation.',
        ap.emotional_tags = ["thrasyllus is palpably nervous", "apprehensive. his hurried entrance", "immediate deference signal surface-level anxiety in the face of imperial authority. internally, he likely feels a mixture of fear", "ambition. he understands the precarious nature of his position; displeasing the emperor could have dire consequences, while successfully fulfilling tiberius's request might elevate his standing.  he is caught between the desire to serve", "the fear of misstepping in the treacherous court environment, his inner state a careful balancing act of professional duty", "self-preservation.", "thrasyllus is palpably nervous and apprehensive. his hurried entrance and immediate deference signal surface-level anxiety in the face of imperial authority. internally", "he likely feels a mixture of fear and ambition. he understands the precarious nature of his position; displeasing the emperor could have dire consequences", "while successfully fulfilling tiberius's request might elevate his standing.  he is caught between the desire to serve and the fear of misstepping in the treacherous court environment", "his inner state a careful balancing act of professional duty and self-preservation.", "thrasyllus is palpably nervous and apprehensive. his hurried entrance and immediate deference signal surface-level anxiety in the face of imperial authority. internally, he likely feels a mixture of fear and ambition. he understands the precarious nature of his position", "displeasing the emperor could have dire consequences, while successfully fulfilling tiberius's request might elevate his standing.  he is caught between the desire to serve and the fear of misstepping in the treacherous court environment, his inner state a careful balancing act of professional duty and self-preservation.", "thrasyllus is palpably nervous and apprehensive. his hurried entrance and immediate deference signal surface-level anxiety in the face of imperial authority. internally, he likely feels a mixture of fear and ambition. he understands the precarious nature of his position; displeasing the emperor could have dire consequences,", "successfully fulfilling tiberius's request might elevate his standing.  he is caught between the desire to serve and the fear of misstepping in the treacherous court environment, his inner state a careful balancing act of professional duty and self-preservation."],
        ap.active_plans = ["Immediately respond to Tiberius's summons and present himself before the Emperor.", "Assess the Emperor's mood and the specifics of his request to ensure he provides the desired service.", "Manage expectations regarding the limitations of astrology, especially concerning the lack of precise birth information."],
        ap.beliefs = ["Astrology is a valid and valuable practice, capable of providing insights into the future, albeit with limitations.", "Obedience and deference to imperial authority are essential for survival and advancement in court.", "Livia is a significant and influential figure, making any astrological readings about her potentially sensitive and politically charged."],
        ap.goals = ["Short-term: Obtain the necessary information to attempt to cast Livia's horoscope, as requested by Tiberius.", "Medium-term: Successfully deliver an astrological reading that satisfies Tiberius and maintains his favor as court astrologer.", "Ultimate: Secure long-term stability and influence within the imperial court through his astrological skills and by navigating the complex political landscape effectively."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands off to the side, a subtle smile playing on his lips as he observes the tension between Tiberius and the influence of Livia. His posture is relaxed yet alert, embodying the calm confidence of a seasoned manipulator.',
        ap.emotional_state = 'Sejanus exudes a veneer of calm, but inside, he revels in the chaos of courtly intrigue. While he appears supportive and strategically pleasant, his internal motivations betray a deeper ambition, keenly aware of the dynamics shifting around him, and eager to exploit them.',
        ap.emotional_tags = ["sejanus exudes a veneer of calm, but inside, he revels in the chaos of courtly intrigue. while he appears supportive", "strategically pleasant, his internal motivations betray a deeper ambition, keenly aware of the dynamics shifting around him,", "eager to exploit them.", "sejanus exudes a veneer of calm", "but inside", "he revels in the chaos of courtly intrigue. while he appears supportive and strategically pleasant", "his internal motivations betray a deeper ambition", "keenly aware of the dynamics shifting around him", "and eager to exploit them.", "sejanus exudes a veneer of calm,", "inside, he revels in the chaos of courtly intrigue. while he appears supportive and strategically pleasant, his internal motivations betray a deeper ambition, keenly aware of the dynamics shifting around him, and eager to exploit them."],
        ap.active_plans = ["To manipulate Tiberius into further isolating himself by encouraging his reliance on astrological interpretations of Livia's influence.", "To position himself as an indispensable advisor, solidifying his power and influence over Tiberius\u2019s decisions.", "To gather intelligence on potential rivals through the reports of conversations, using them strategically for future political maneuvering."],
        ap.beliefs = ["Power is best wielded through subtle manipulation rather than overt aggression.", "The loyalty of those in power is fleeting, and one must constantly assess potential threats.", "Ambition justifies the means, and personal gain is paramount in the treacherous landscape of imperial Rome."],
        ap.goals = ["Short-term: To manipulate Tiberius into asking Livia for her horoscope, thereby deepening Tiberius's dependence on Sejanus.", "Medium-term: To undermine potential rivals like Silius Caecina by using the gathered reports as leverage.", "Ultimate: To consolidate power within the Senate and ensure his position as the primary advisor to Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands at the center of the audience hall, his posture tense and impatient. He shifts his weight, his brow furrowed with weariness as he waits for the astrologer, reflecting his burdened state. His body language reveals a man grappling with authority and familial obligation.',
        ap.emotional_state = 'Tiberius outwardly displays irritation and impatience, a mask for his deeper fear and vulnerability regarding Livia\'s influence over his reign. Beneath the surface, he wrestles with paranoia and a sense of entrapment, longing for the escape of his past life in Rhodes, feeling suffocated by the demands of his position.',
        ap.emotional_tags = ["tiberius outwardly displays irritation", "impatience, a mask for his deeper fear", "vulnerability regarding livia's influence over his reign. beneath the surface, he wrestles with paranoia", "a sense of entrapment, longing for the escape of his past life in rhodes, feeling suffocated by the demands of his position.", "tiberius outwardly displays irritation and impatience", "a mask for his deeper fear and vulnerability regarding livia's influence over his reign. beneath the surface", "he wrestles with paranoia and a sense of entrapment", "longing for the escape of his past life in rhodes", "feeling suffocated by the demands of his position."],
        ap.active_plans = ["To ascertain Livia's longevity and by extension, his own influence over the empire's future.", "To maintain a semblance of control in the face of his mother's dominance and Livia's manipulative ways.", "To gather information on potential threats to his power, particularly through the reports Sejanus presents."],
        ap.beliefs = ["Authority is a heavy burden that requires constant vigilance against betrayal.", "Trust is a luxury he cannot afford in a court rife with deceit and treachery.", "His mother's influence is both a blessing and a curse, complicating his reign and decisions."],
        ap.goals = ["Short-term: To have Livia's horoscope cast to gauge her influence over him.", "Medium-term: To stabilize his rule by deciphering the loyalty and intentions of those around him.", "Ultimate: To reclaim his own sense of autonomy and establish a legacy free from his mother's shadow."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands wearily in the dimly lit audience hall, his posture reflecting impatience and a deep-seated fatigue. He is initially focused on his astrologer, Thrasyllus, seeking to discern Livia\'s future through a horoscope. As Sejanus presents the treason reports, Tiberius shifts his attention, listening with a sardonic detachment while physically remaining still, absorbing the presented information.',
        ap.emotional_state = 'Outwardly, Tiberius displays weariness and sarcasm, using cynical remarks to mask his deeper anxieties about the pervasive treachery within Rome. Beneath this facade lies a profound paranoia and frustration, stemming from his isolation and the constant threat of betrayal. He expresses a longing to escape Rome, revealing an internal state of profound unhappiness and a sense of being trapped by his imperial responsibilities and the machinations around him.',
        ap.emotional_tags = ["outwardly, tiberius displays weariness", "sarcasm, using cynical remarks to mask his deeper anxieties about the pervasive treachery within rome. beneath this facade lies a profound paranoia", "frustration, stemming from his isolation", "the constant threat of betrayal. he expresses a longing to escape rome, revealing an internal state of profound unhappiness", "a sense of being trapped by his imperial responsibilities", "the machinations around him.", "outwardly", "tiberius displays weariness and sarcasm", "using cynical remarks to mask his deeper anxieties about the pervasive treachery within rome. beneath this facade lies a profound paranoia and frustration", "stemming from his isolation and the constant threat of betrayal. he expresses a longing to escape rome", "revealing an internal state of profound unhappiness and a sense of being trapped by his imperial responsibilities and the machinations around him."],
        ap.active_plans = ["To gauge Livia's remaining lifespan through astrological means to anticipate the duration of her influence.", "To assess the severity of the alleged treasonous remarks and their potential threat to his rule.", "To rely on Sejanus to filter and manage the overwhelming burden of information and political intrigue, seeking relief from his imperial duties."],
        ap.beliefs = ["Rome is rife with disloyalty and treason, reflecting a deep cynicism about the integrity of his court and the populace.", "His reign is a heavy burden, causing him personal misery and a yearning for escape from the responsibilities of emperorship.", "Sejanus is a necessary and valuable asset, essential for managing the complexities and threats of Roman governance, reinforcing his dependence on his advisor."],
        ap.goals = ["Short-term: To acquire astrological insight into Livia's future to better understand the shifting power dynamics within his family.", "Medium-term: To maintain control over the perceived treasonous elements within Rome, ensuring the stability of his rule and suppressing dissent.", "Ultimate: To alleviate his personal burden and escape the oppressive demands of being Emperor, possibly by retreating from Rome or finding a way to lessen his responsibilities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands attentively near Tiberius, observing the Emperor\'s reactions with a subtle, controlled demeanor. He gestures towards the stack of treason reports, actively presenting and narrating their contents to Tiberius. His posture is confident and poised, reflecting his calculated influence and strategic positioning within the scene as he manipulates the information flow.',
        ap.emotional_state = 'Sejanus outwardly projects an air of calm competence and loyal service to Tiberius, maintaining a respectful and helpful facade. However, beneath this veneer lies a calculating ambition and subtle manipulation. His \'subtle smile\' hints at his internal satisfaction with his control over information and his ability to influence Tiberius\'s perceptions and decisions, revealing a strategic and self-serving emotional undercurrent.',
        ap.emotional_tags = ["sejanus outwardly projects an air of calm competence", "loyal service to tiberius, maintaining a respectful", "helpful facade. however, beneath this veneer lies a calculating ambition", "subtle manipulation. his 'subtle smile' hints at his internal satisfaction with his control over information", "his ability to influence tiberius's perceptions", "decisions, revealing a strategic", "self-serving emotional undercurrent.", "sejanus outwardly projects an air of calm competence and loyal service to tiberius", "maintaining a respectful and helpful facade. however", "beneath this veneer lies a calculating ambition and subtle manipulation. his 'subtle smile' hints at his internal satisfaction with his control over information and his ability to influence tiberius's perceptions and decisions", "revealing a strategic and self-serving emotional undercurrent."],
        ap.active_plans = ["To manipulate Tiberius into perceiving a significant threat from the reported conversations, particularly those of Silius Caecina.", "To leverage the treason reports to solidify his own position as Tiberius's indispensable advisor and chief protector against internal threats.", "To initiate the legal process against Silius Caecina, using the reports as justification to eliminate a potential rival and demonstrate his power to act decisively."],
        ap.beliefs = ["Information is a powerful tool for manipulation and control, essential for navigating and dominating Roman politics.", "Tiberius is reliant on him for managing the complexities of Roman governance and interpreting threats, reinforcing his sense of importance.", "Ruthless action and strategic prosecution of perceived enemies are necessary to maintain order and consolidate power in the treacherous Roman court."],
        ap.goals = ["Short-term: To convince Tiberius of the immediate danger posed by Silius Caecina based on the presented treason reports.", "Medium-term: To orchestrate the impeachment and downfall of Silius Caecina, thereby removing a potential obstacle and showcasing his influence.", "Ultimate: To steadily increase his own power and authority within Rome, ultimately aiming for a position of supreme influence, possibly even beyond that of an advisor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Caligula bursts into the audience hall with a palpable energy, his movements exuberant as he presents an antique statue to Tiberius. His posture is open and inviting, contrasting with the oppressive atmosphere, and he gestures animatedly as he speaks, radiating a sense of childlike enthusiasm.',
        ap.emotional_state = 'Caligula\'s surface demeanor is carefree and vibrant, masking a deeper, more chaotic energy. He expresses delight in his gift but beneath lies an unpredictable nature, hinting at possible underlying ambitions or discontent. His emotional contradictions suggest a desire for approval while also reveling in the thrill of disruption.',
        ap.emotional_tags = ["caligula's surface demeanor is carefree", "vibrant, masking a deeper, more chaotic energy. he expresses delight in his gift but beneath lies an unpredictable nature, hinting at possible underlying ambitions or discontent. his emotional contradictions suggest a desire for approval while also reveling in the thrill of disruption.", "caligula's surface demeanor is carefree and vibrant", "masking a deeper", "more chaotic energy. he expresses delight in his gift but beneath lies an unpredictable nature", "hinting at possible underlying ambitions or discontent. his emotional contradictions suggest a desire for approval while also reveling in the thrill of disruption.", "caligula's surface demeanor is carefree and vibrant, masking a deeper, more chaotic energy. he expresses delight in his gift but beneath lies an unpredictable nature, hinting at possible underlying ambitions or discontent. his emotional contradictions suggest a desire for approval", "also reveling in the thrill of disruption.", "caligula's surface demeanor is carefree and vibrant, masking a deeper, more chaotic energy. he expresses delight in his gift", "beneath lies an unpredictable nature, hinting at possible underlying ambitions or discontent. his emotional contradictions suggest a desire for approval while also reveling in the thrill of disruption."],
        ap.active_plans = ["To present Tiberius with the antique statue as a token of affection and to re-establish familial bonds.", "To inject levity into the tense atmosphere of the audience hall, contrasting with the ongoing political discussions.", "To showcase his resourcefulness and charm in front of Tiberius and the court, reinforcing his status within the family."],
        ap.beliefs = ["Family bonds should be leveraged to gain favor and influence.", "Chaos can serve as a tool to assert dominance and control, even within familial relationships.", "The perception of loyalty and affection can be strategically manipulated for personal gain."],
        ap.goals = ["Short-term: To amuse Tiberius and gain his approval through the gift.", "Medium-term: To position himself as a favored family member, strengthening his influence within the imperial court.", "Ultimate: To pave the way for his own ascent to power, using charm and unpredictability as his weapons."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands in the audience hall, initially impatient and weary. He regards Caligula with a blend of annoyance and intrigue as the young man bursts in, his demeanor shifting to one of reluctant amusement as he accepts the statue, his posture relaxing slightly in response to Caligula\'s exuberance.',
        ap.emotional_state = 'Tiberius projects a façade of irritation, his weariness evident as he grapples with his responsibilities as Emperor. However, the unexpected gift from Caligula brings a flicker of warmth to his demeanor, hinting at a buried affection for his grand-nephew. His internal conflict reveals a longing for familial connection amidst the burdens of his role.',
        ap.emotional_tags = ["tiberius projects a fa\u00e7ade of irritation", "his weariness evident as he grapples with his responsibilities as emperor. however", "the unexpected gift from caligula brings a flicker of warmth to his demeanor", "hinting at a buried affection for his grand-nephew. his internal conflict reveals a longing for familial connection amidst the burdens of his role."],
        ap.active_plans = ["To maintain authority while managing the unpredictable dynamics of his family.", "To assess Caligula\u2019s intentions and gauge the implications of his gift in the broader context of court politics.", "To navigate the tension of familial relationships while maintaining the fa\u00e7ade of imperial control."],
        ap.beliefs = ["Authority must be maintained at all costs, even amidst familial ties.", "The unpredictability of family members, like Caligula, poses a potential threat that must be managed carefully.", "Genuine affection is a luxury that can be overshadowed by the demands of power."],
        ap.goals = ["Short-term: To accept the gift graciously while maintaining an air of control and authority.", "Medium-term: To understand Caligula's motives and establish boundaries within the dynamic of their relationship.", "Ultimate: To preserve the stability of his reign and manage his family's ambitions without compromising his position."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands attentively beside Tiberius, initially appearing as a helpful advisor during Tiberius\'s impatient wait for Thrasyllus. He subtly steers the conversation towards political matters by presenting a stack of \'verbatim reports\'. With a calculated demeanor, he isolates the report concerning Silius Caecina and strategically highlights the potentially treasonous implications of Silius\'s words to Tiberius, all while maintaining a veneer of respectful servitude.',
        ap.emotional_state = 'Sejanus projects an outward calm and composed demeanor, masking his underlying ambition and manipulative intent. Beneath the surface of his helpfulness, he is calculating and opportunistic, seizing the moment to advance his agenda. He feels a sense of control as he subtly manipulates Tiberius\'s paranoia and insecurity, while internally driven by a desire for greater power and influence.',
        ap.emotional_tags = ["sejanus projects an outward calm", "composed demeanor, masking his underlying ambition", "manipulative intent. beneath the surface of his helpfulness, he is calculating", "opportunistic, seizing the moment to advance his agenda. he feels a sense of control as he subtly manipulates tiberius's paranoia", "insecurity, while internally driven by a desire for greater power", "influence.", "sejanus projects an outward calm and composed demeanor", "masking his underlying ambition and manipulative intent. beneath the surface of his helpfulness", "he is calculating and opportunistic", "seizing the moment to advance his agenda. he feels a sense of control as he subtly manipulates tiberius's paranoia and insecurity", "while internally driven by a desire for greater power and influence.", "sejanus projects an outward calm and composed demeanor, masking his underlying ambition and manipulative intent. beneath the surface of his helpfulness, he is calculating and opportunistic, seizing the moment to advance his agenda. he feels a sense of control as he subtly manipulates tiberius's paranoia and insecurity,", "internally driven by a desire for greater power and influence."],
        ap.active_plans = ["To convince Tiberius that Silius Caecina poses a threat to his rule.", "To instigate legal proceedings against Silius Caecina by persuading Varro to take the case.", "To solidify his position as Tiberius's indispensable advisor by demonstrating his vigilance against perceived treason."],
        ap.beliefs = ["Power is best acquired through strategic manipulation and control of information.", "Eliminating potential rivals, even through fabricated accusations, is a necessary step to consolidate power.", "Tiberius is susceptible to manipulation through appeals to his inherent paranoia and fear of betrayal."],
        ap.goals = ["short_term\": \"Secure Varro's agreement to prosecute Silius Caecina for treason.", "medium_term\": \"Initiate the impeachment and downfall of Silius Caecina, removing him as a potential obstacle.", "ultimate\": \"Further consolidate his own power and influence within the Roman court, becoming an even more indispensable figure to Tiberius and potentially beyond."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Varro is summoned by Sejanus and presented with the \'evidence\' against Silius Caecina. He attentively examines the scrolls and listens to Sejanus\'s proposition to prosecute Silius for treason in the Senate. Initially hesitant, Varro raises concerns about the lack of legal precedent and the political ramifications of targeting a respected figure like Silius. However, under Sejanus\'s subtle pressure and veiled threat, Varro ultimately concedes and agrees to take the case, albeit with a clear understanding of the politically motivated nature of the prosecution.',
        ap.emotional_state = 'Varro exhibits a cautious and pragmatic emotional state. He is aware of the dangerous political currents within the court and approaches Sejanus\'s request with initial reservation and professional circumspection. He feels the pressure of Sejanus\'s influence and understands the implicit threat behind the request, leading to a reluctant compliance tinged with apprehension about the potential consequences of prosecuting a man like Silius Caecina.',
        ap.emotional_tags = ["varro exhibits a cautious", "pragmatic emotional state. he is aware of the dangerous political currents within the court", "approaches sejanus's request with initial reservation", "professional circumspection. he feels the pressure of sejanus's influence", "understands the implicit threat behind the request, leading to a reluctant compliance tinged with apprehension about the potential consequences of prosecuting a man like silius caecina.", "varro exhibits a cautious and pragmatic emotional state. he is aware of the dangerous political currents within the court and approaches sejanus's request with initial reservation and professional circumspection. he feels the pressure of sejanus's influence and understands the implicit threat behind the request", "leading to a reluctant compliance tinged with apprehension about the potential consequences of prosecuting a man like silius caecina."],
        ap.active_plans = ["To carefully assess the 'evidence' presented by Sejanus to determine if a legal case for treason can be constructed against Silius Caecina.", "To weigh the political risks and benefits of prosecuting Silius, considering his powerful allies and the potential backlash.", "To navigate the situation without directly opposing Sejanus, ensuring his own professional and personal safety within the treacherous court environment."],
        ap.beliefs = ["Legal precedent and established norms are important but ultimately secondary to political expediency in the Roman court.", "Survival in Roman politics requires careful obedience to those in power, especially figures like Sejanus.", "Prudence and pragmatism are essential for navigating the dangerous and unpredictable nature of Roman imperial politics."],
        ap.goals = ["short_term\": \"Examine the evidence and provide a legal assessment on the viability of impeaching Silius Caecina based on the presented charges.", "medium_term\": \"Proceed with the prosecution of Silius Caecina as directed by Sejanus, while attempting to minimize personal and professional risks associated with a politically charged case.", "ultimate\": \"Maintain his position and influence as a legal advisor within the Roman Senate, ensuring his continued survival and professional standing in the volatile political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Castor stands tensely in the secluded garden, his posture rigid and hands clenching with frustration as he passionately defends Germanicus against Tiberius\'s accusations. He moves closer to his father, leaning in to emphasize his points, his face betraying a mix of determination and concern.',
        ap.emotional_state = 'Castor exhibits surface frustration and concern for his family, his voice rising with urgency as he tries to convince Tiberius of the danger posed by Sejanus. Internally, he struggles with anxiety, fearing for the empire\'s future and Tiberius’s increasing paranoia. His commitment to truth clashes with his father’s refusal to see the reality of his situation.',
        ap.emotional_tags = ["castor exhibits surface frustration", "concern for his family, his voice rising with urgency as he tries to convince tiberius of the danger posed by sejanus. internally, he struggles with anxiety, fearing for the empire's future", "tiberius\u2019s increasing paranoia. his commitment to truth clashes with his father\u2019s refusal to see the reality of his situation.", "castor exhibits surface frustration and concern for his family", "his voice rising with urgency as he tries to convince tiberius of the danger posed by sejanus. internally", "he struggles with anxiety", "fearing for the empire's future and tiberius\u2019s increasing paranoia. his commitment to truth clashes with his father\u2019s refusal to see the reality of his situation."],
        ap.active_plans = ["To convince Tiberius that Germanicus poses no threat and that Sejanus is manipulating him.", "To protect his family from the impending danger posed by Sejanus's rising power.", "To assert his own position as a voice of reason within the imperial family, hoping to influence Tiberius's decisions."],
        ap.beliefs = ["He believes in the loyalty of Germanicus and the threat Sejanus poses to the empire's stability.", "He holds that blind trust in advisors can lead to ruin, reflecting a deep-seated understanding of the treachery inherent in their political landscape.", "He is convinced that family unity is essential to withstand external threats, contrasting with Tiberius's growing isolation."],
        ap.goals = ["Short-term: To convince Tiberius to reconsider his views on Germanicus and Sejanus during this heated confrontation.", "Medium-term: To establish a stronger bond with Tiberius to influence future decisions regarding the imperial council.", "Ultimate: To create a safer environment for his family and protect the legacy of the Julio-Claudian dynasty from treacherous influencers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands resolutely before Castor, his body tense and arms crossed, exuding authority as he insists on his views regarding Germanicus. His facial expression is hardened, showing both anger and hurt as he feels his authority is being challenged, while he clutches a set of files tightly in his hand.',
        ap.emotional_state = 'Tiberius oscillates between anger and defensiveness, visibly stung by Castor\'s accusations. He projects a façade of control, but internally, he wrestles with paranoia and fear of betrayal, feeling cornered by his son\'s insistence. The conversation triggers deep-seated insecurities about his leadership and judgment.',
        ap.emotional_tags = ["tiberius oscillates between anger", "defensiveness, visibly stung by castor's accusations. he projects a fa\u00e7ade of control, but internally, he wrestles with paranoia", "fear of betrayal, feeling cornered by his son's insistence. the conversation triggers deep-seated insecurities about his leadership", "judgment.", "tiberius oscillates between anger and defensiveness", "visibly stung by castor's accusations. he projects a fa\u00e7ade of control", "but internally", "he wrestles with paranoia and fear of betrayal", "feeling cornered by his son's insistence. the conversation triggers deep-seated insecurities about his leadership and judgment.", "tiberius oscillates between anger and defensiveness, visibly stung by castor's accusations. he projects a fa\u00e7ade of control,", "internally, he wrestles with paranoia and fear of betrayal, feeling cornered by his son's insistence. the conversation triggers deep-seated insecurities about his leadership and judgment."],
        ap.active_plans = ["To assert his authority and reinforce his beliefs about the threats posed by Germanicus and Sejanus.", "To dismiss Castor's concerns as envy and a lack of understanding of the political landscape.", "To maintain control over the narrative of loyalty and treachery within the court, solidifying his position as the ultimate authority."],
        ap.beliefs = ["He believes in the necessity of control and the need to eliminate any perceived threats to his power.", "He holds a conviction that his experiences grant him insight into the ambitions of others, especially Germanicus.", "He thinks that loyalty must be enforced through fear and suspicion, reflecting his deep-seated paranoia."],
        ap.goals = ["Short-term: To quell Castor's challenge to his authority and reaffirm his stance against Germanicus.", "Medium-term: To solidify his alliance with Sejanus, believing it to be crucial for his reign's stability.", "Ultimate: To maintain his grip on power and eliminate threats to his legacy, ensuring that Rome remains under his control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Castor stands face to face with his father, Tiberius, in the secluded garden. His body is tense, reflecting his inner turmoil, and he gestures emphatically as he speaks, trying to pierce through Tiberius\'s defenses. He paces slightly, his movements agitated, underscoring the urgency and gravity of his warnings about Sejanus\'s growing influence.',
        ap.emotional_state = 'Castor is deeply anxious and frustrated. Outwardly, his voice is sharp with concern and laced with a hint of desperation as he tries to reason with his father. Internally, he is battling fear and a growing sense of powerlessness as he witnesses Tiberius\'s willful blindness. He is torn between his filial duty to warn his father and the disheartening realization that his warnings are falling on deaf ears, creating a palpable tension between his outward attempts at persuasion and his inner despair.',
        ap.emotional_tags = ["castor is deeply anxious", "frustrated. outwardly, his voice is sharp with concern", "laced with a hint of desperation as he tries to reason with his father. internally, he is battling fear", "a growing sense of powerlessness as he witnesses tiberius's willful blindness. he is torn between his filial duty to warn his father", "the disheartening realization that his warnings are falling on deaf ears, creating a palpable tension between his outward attempts at persuasion", "his inner despair.", "castor is deeply anxious and frustrated. outwardly", "his voice is sharp with concern and laced with a hint of desperation as he tries to reason with his father. internally", "he is battling fear and a growing sense of powerlessness as he witnesses tiberius's willful blindness. he is torn between his filial duty to warn his father and the disheartening realization that his warnings are falling on deaf ears", "creating a palpable tension between his outward attempts at persuasion and his inner despair."],
        ap.active_plans = ["To dismantle Tiberius's trust in Sejanus by highlighting Sejanus's manipulative tactics.", "To provide concrete examples of Sejanus's ambition and control, such as the statues and spy network.", "To appeal to Tiberius's sense of reason and self-preservation by portraying Sejanus as a direct threat to the Emperor's authority and legacy."],
        ap.beliefs = ["Sejanus is a power-hungry manipulator who is deceiving Tiberius for his own gain.", "Tiberius is dangerously naive and isolated, unable to see the true intentions of those around him.", "Familial loyalty and truthfulness are paramount, even when delivering unwelcome news to authority figures."],
        ap.goals = ["Short-term: To make Tiberius question Sejanus's loyalty and motives in this immediate confrontation.", "Medium-term: To initiate an investigation into Sejanus's activities and expose his manipulative network within Rome.", "Ultimate: To safeguard the Julio-Claudian dynasty and prevent Sejanus from usurping power, ensuring stability and justice within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly, facing Castor in the garden, his posture embodying imperial authority and dismissal. He listens to Castor\'s passionate warnings with a mask of impatience, occasionally interrupting with sharp, defensive rebuttals. His movements are minimal, mostly dismissive gestures of his hand, indicating his unwillingness to engage seriously with Castor\'s accusations and his desire to shut down the conversation.',
        ap.emotional_state = 'Tiberius outwardly displays irritation and condescension towards Castor, his tone laced with scorn and parental disapproval. Beneath this surface of autocratic dismissal, however, lies a deeper layer of paranoia and insecurity. He is internally wrestling with the fear of betrayal and the weight of his imperial responsibilities. His reliance on Sejanus stems from a need for control and reassurance, making him resistant to any suggestion that his trusted advisor might be a threat. There\'s a hidden conflict between his need to appear strong and in control, and his underlying vulnerability to manipulation and fear.',
        ap.emotional_tags = ["tiberius outwardly displays irritation", "condescension towards castor, his tone laced with scorn", "parental disapproval. beneath this surface of autocratic dismissal, however, lies a deeper layer of paranoia", "insecurity. he is internally wrestling with the fear of betrayal", "the weight of his imperial responsibilities. his reliance on sejanus stems from a need for control", "reassurance, making him resistant to any suggestion that his trusted advisor might be a threat. there's a hidden conflict between his need to appear strong", "in control,", "his underlying vulnerability to manipulation", "fear.", "tiberius outwardly displays irritation and condescension towards castor", "his tone laced with scorn and parental disapproval. beneath this surface of autocratic dismissal", "however", "lies a deeper layer of paranoia and insecurity. he is internally wrestling with the fear of betrayal and the weight of his imperial responsibilities. his reliance on sejanus stems from a need for control and reassurance", "making him resistant to any suggestion that his trusted advisor might be a threat. there's a hidden conflict between his need to appear strong and in control", "and his underlying vulnerability to manipulation and fear."],
        ap.active_plans = ["To immediately shut down Castor's dissenting voice and reassert his paternal and imperial authority.", "To defend his judgment in trusting Sejanus by highlighting Sejanus's perceived loyalty and efficiency.", "To deflect from the uncomfortable truth of potential manipulation by accusing Castor of envy and youthful naivety."],
        ap.beliefs = ["Sejanus is a loyal and indispensable partner who alleviates the burdens of emperorship.", "Castor's warnings are motivated by jealousy of Sejanus's position and a lack of understanding of imperial affairs.", "As Emperor, his judgment is superior and not to be questioned, especially by his own son."],
        ap.goals = ["Short-term: To end the argument with Castor swiftly and decisively, reaffirming his dominance.", "Medium-term: To maintain his current power structure, relying on Sejanus as a key advisor and protector against perceived threats.", "Ultimate: To secure his reign and legacy as Emperor, even if it means remaining willfully blind to potential dangers within his inner circle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Castor stands tensely before Tiberius, his posture rigid with frustration. He gestures emphatically as he pleads his case, his brow furrowed in concern. He moves closer to his father, leaning in slightly to emphasize his point, his voice a mix of urgency and defiance.',
        ap.emotional_state = 'Castor\'s surface emotions reveal anxiety and exasperation as he tries to shake his father\'s delusions. His brow is furrowed, and his voice carries a sharp edge as he speaks. Internally, he grapples with a fierce loyalty to his family, yet feels a deep sense of foreboding regarding Sejanus\'s influence over Tiberius, leading to a silent conflict between love for his father and fear for the Empire\'s future.',
        ap.emotional_tags = ["castor's surface emotions reveal anxiety", "exasperation as he tries to shake his father's delusions. his brow is furrowed,", "his voice carries a sharp edge as he speaks. internally, he grapples with a fierce loyalty to his family, yet feels a deep sense of foreboding regarding sejanus's influence over tiberius, leading to a silent conflict between love for his father", "fear for the empire's future.", "castor's surface emotions reveal anxiety and exasperation as he tries to shake his father's delusions. his brow is furrowed", "and his voice carries a sharp edge as he speaks. internally", "he grapples with a fierce loyalty to his family", "yet feels a deep sense of foreboding regarding sejanus's influence over tiberius", "leading to a silent conflict between love for his father and fear for the empire's future."],
        ap.active_plans = ["To expose Sejanus's manipulation of Tiberius and undermine his influence.", "To convince Tiberius to reconsider his trust in Sejanus, despite the emotional and political risks involved.", "To protect the Empire from the potential dangers posed by Sejanus's ambitions."],
        ap.beliefs = ["Loyalty to family must not blind one to the truth of betrayal.", "Sejanus is a dangerous opportunist masking his true intentions.", "The legacy of their lineage is worth fighting for, and they must not allow it to be corrupted."],
        ap.goals = ["Short-term: To make Tiberius see Sejanus's true nature and the threat he poses.", "Medium-term: To rally support from other family members against Sejanus's growing influence.", "Ultimate: To protect the integrity of the imperial legacy and ensure a stable succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands with a rigid demeanor, arms crossed defensively as he faces Castor. He gestures emphatically to emphasize his points, his voice rising with irritation. His posture is one of authority, albeit tinged with stubbornness, as he dismisses his son\'s concerns.',
        ap.emotional_state = 'Tiberius exudes a mix of indignation and paranoia, his tone sharp and dismissive when confronted by Castor. Beneath this bluster lies a deep-seated fear of losing control and a growing mistrust that clouds his judgment. His internal struggle manifests in his defensive stance, reflecting his vulnerability as he clings to Sejanus as an ally in a world rife with betrayal.',
        ap.emotional_tags = ["tiberius exudes a mix of indignation", "paranoia, his tone sharp", "dismissive when confronted by castor. beneath this bluster lies a deep-seated fear of losing control", "a growing mistrust that clouds his judgment. his internal struggle manifests in his defensive stance, reflecting his vulnerability as he clings to sejanus as an ally in a world rife with betrayal.", "tiberius exudes a mix of indignation and paranoia", "his tone sharp and dismissive when confronted by castor. beneath this bluster lies a deep-seated fear of losing control and a growing mistrust that clouds his judgment. his internal struggle manifests in his defensive stance", "reflecting his vulnerability as he clings to sejanus as an ally in a world rife with betrayal."],
        ap.active_plans = ["To confirm his trust in Sejanus, believing him to be a loyal ally.", "To assert his authority over Castor, reinforcing the familial hierarchy.", "To distance himself from any personal accountability regarding Sejanus's ambitions."],
        ap.beliefs = ["Sejanus is a loyal partner whose insights are invaluable for maintaining power.", "Dismissing criticism from family members is crucial to preserve his authority.", "The perception of threats is often exaggerated, and he must not show weakness."],
        ap.goals = ["Short-term: To silence Castor and assert his dominance in the conversation.", "Medium-term: To maintain control over the political landscape with Sejanus's help.", "Ultimate: To solidify his legacy and ensure that he does not appear vulnerable to his enemies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Castor stands before his father, Tiberius, in the secluded garden, his posture tense and his voice strained with urgency. He gesticulates emphatically as he speaks, trying to break through Tiberius\'s denial. He is actively engaged in a direct and confrontational argument, his physical presence conveying a desperate attempt to get his father to understand the danger he perceives.',
        ap.emotional_state = 'Castor is driven by a potent mix of fear and frustration. Outwardly, he expresses anger and exasperation at Tiberius\'s stubborn refusal to see Sejanus\'s true nature. Beneath this anger lies a deep-seated anxiety about the future of Rome and his family under Sejanus\'s unchecked ambition. He is emotionally torn between filial duty and the overwhelming need to protect his loved ones, creating an internal conflict between respect and alarm.',
        ap.emotional_tags = ["castor is driven by a potent mix of fear", "frustration. outwardly, he expresses anger", "exasperation at tiberius's stubborn refusal to see sejanus's true nature. beneath this anger lies a deep-seated anxiety about the future of rome", "his family under sejanus's unchecked ambition. he is emotionally torn between filial duty", "the overwhelming need to protect his loved ones, creating an internal conflict between respect", "alarm.", "castor is driven by a potent mix of fear and frustration. outwardly", "he expresses anger and exasperation at tiberius's stubborn refusal to see sejanus's true nature. beneath this anger lies a deep-seated anxiety about the future of rome and his family under sejanus's unchecked ambition. he is emotionally torn between filial duty and the overwhelming need to protect his loved ones", "creating an internal conflict between respect and alarm."],
        ap.active_plans = ["To dismantle Tiberius's unwavering trust in Sejanus by presenting irrefutable warnings about Sejanus's ambition.", "To awaken Tiberius to the manipulative nature of Sejanus and the impending danger he poses to the imperial family and Rome.", "To safeguard his family and the future of Rome from the tyrannical grip he believes Sejanus is slowly tightening."],
        ap.beliefs = ["Sejanus is not a loyal servant but a dangerously ambitious manipulator seeking to usurp power.", "Tiberius is dangerously naive and blinded by Sejanus's facade of loyalty, making him vulnerable to exploitation.", "Open and honest confrontation, even with his own father, is necessary to avert the looming catastrophe of Sejanus's rule."],
        ap.goals = ["Short-term: To make Tiberius listen and acknowledge the validity of his concerns regarding Sejanus during this tense confrontation.", "Medium-term: To instigate an investigation into Sejanus's activities and expose his treachery to Tiberius, thereby dismantling his influence.", "Ultimate: To prevent Sejanus from seizing power and to ensure the stability and safety of the Julio-Claudian dynasty and Rome beyond Tiberius's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly in the garden, facing Castor with an air of imperial detachment that barely conceals his irritation. He interrupts Castor frequently, dismissing his son\'s passionate warnings with curt pronouncements and accusations. He maintains a physical barrier, both literally and figuratively, refusing to engage with the substance of Castor\'s concerns, his body language conveying a desire to end the uncomfortable confrontation.',
        ap.emotional_state = 'Tiberius is primarily defensive and dismissive, projecting anger and paternal authority to shut down Castor\'s dissenting voice. Internally, he is wrestling with deep-seated paranoia and insecurity. He relies heavily on Sejanus for reassurance and control, and Castor\'s words threaten to unravel this fragile sense of stability. There\'s an unspoken conflict between his need for control and his fear of being undermined, making him resistant to any criticism of Sejanus, whom he sees as a vital ally.',
        ap.emotional_tags = ["tiberius is primarily defensive", "dismissive, projecting anger", "paternal authority to shut down castor's dissenting voice. internally, he is wrestling with deep-seated paranoia", "insecurity. he relies heavily on sejanus for reassurance", "control,", "castor's words threaten to unravel this fragile sense of stability. there's an unspoken conflict between his need for control", "his fear of being undermined, making him resistant to any criticism of sejanus, whom he sees as a vital ally.", "tiberius is primarily defensive and dismissive", "projecting anger and paternal authority to shut down castor's dissenting voice. internally", "he is wrestling with deep-seated paranoia and insecurity. he relies heavily on sejanus for reassurance and control", "and castor's words threaten to unravel this fragile sense of stability. there's an unspoken conflict between his need for control and his fear of being undermined", "making him resistant to any criticism of sejanus", "whom he sees as a vital ally."],
        ap.active_plans = ["To immediately shut down Castor's line of questioning and reaffirm his own authority and judgment as Emperor.", "To defend Sejanus and his own decision to trust him, reinforcing his belief in Sejanus's loyalty and competence.", "To quickly end the argument and escape the discomfort of facing potential threats to his carefully constructed world, retreating back into his preferred reality."],
        ap.beliefs = ["Sejanus is a trustworthy and indispensable partner who alleviates his burdens of rule, offering reliable support and information.", "Castor is driven by envy and disrespect, failing to appreciate Sejanus's value and questioning his father's imperial wisdom.", "Maintaining a firm and unchallenged facade of authority is crucial for preserving order and preventing further anxieties and challenges to his rule."],
        ap.goals = ["Short-term: To silence Castor's dissent and re-establish dominance in the conversation, ending the uncomfortable challenge to his authority in this immediate exchange.", "Medium-term: To maintain the status quo and his dependence on Sejanus, reinforcing his chosen support system against perceived threats from within his own family.", "Ultimate: To preserve his power and maintain control over the empire, even if it means remaining willfully blind to potential dangers and clinging to a distorted perception of reality for comfort and security."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Castor stands tensely before Tiberius, his posture rigid with urgency as he passionately defends Germanicus. He gestures emphatically, attempting to convey the gravity of Sejanus\'s ambition while remaining vigilant, casting anxious glances toward Livilla, who watches the exchange with concern.',
        ap.emotional_state = 'Castor outwardly displays frustration and determination, his voice rising with desperation as he tries to pierce Tiberius\'s stubbornness. Beneath the surface, he wrestles with a profound fear that his father\'s blindness to Sejanus\'s ambition could lead to irrevocable consequences for their family. There is an underlying sense of helplessness as he confronts Tiberius\'s dismissal.',
        ap.emotional_tags = ["castor outwardly displays frustration", "determination, his voice rising with desperation as he tries to pierce tiberius's stubbornness. beneath the surface, he wrestles with a profound fear that his father's blindness to sejanus's ambition could lead to irrevocable consequences for their family. there is an underlying sense of helplessness as he confronts tiberius's dismissal.", "castor outwardly displays frustration and determination", "his voice rising with desperation as he tries to pierce tiberius's stubbornness. beneath the surface", "he wrestles with a profound fear that his father's blindness to sejanus's ambition could lead to irrevocable consequences for their family. there is an underlying sense of helplessness as he confronts tiberius's dismissal."],
        ap.active_plans = ["To convince Tiberius of the true nature of Sejanus's ambitions and the danger he poses.", "To protect his family's legacy by highlighting the threat to their power.", "To assert his position and influence in the imperial hierarchy, despite Tiberius's authority."],
        ap.beliefs = ["Sejanus is a manipulator seeking personal power over the well-being of the empire.", "Blind loyalty to ambitious individuals can lead to the downfall of the ruling family.", "Family legacy and safety must be prioritized above all else."],
        ap.goals = ["Short-term: To inform Tiberius about the potential threat posed by Sejanus.", "Medium-term: To strengthen his position within the imperial family and gain Tiberius's trust.", "Ultimate: To secure the safety and integrity of the Julio-Claudian dynasty from internal threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius remains seated, his posture exuding an air of authority and irritation. He dismisses Castor\'s concerns with a wave of his hand, his eyes narrowing with defensiveness. Tiberius\'s voice is clipped and firm, reflecting his refusal to accept any criticism against his trusted advisor, Sejanus.',
        ap.emotional_state = 'Tiberius exhibits a fierce but brittle arrogance, masking his inner vulnerability with a veneer of authority. He feels threatened by Castor\'s insubordination, leading to a simmering anger beneath his surface. Tiberius grapples with paranoia, convinced of the loyalty of those around him, while simultaneously feeling isolated in his decisions.',
        ap.emotional_tags = ["tiberius exhibits a fierce but brittle arrogance", "masking his inner vulnerability with a veneer of authority. he feels threatened by castor's insubordination", "leading to a simmering anger beneath his surface. tiberius grapples with paranoia", "convinced of the loyalty of those around him", "while simultaneously feeling isolated in his decisions.", "tiberius exhibits a fierce but brittle arrogance, masking his inner vulnerability with a veneer of authority. he feels threatened by castor's insubordination, leading to a simmering anger beneath his surface. tiberius grapples with paranoia, convinced of the loyalty of those around him,", "simultaneously feeling isolated in his decisions.", "tiberius exhibits a fierce", "brittle arrogance, masking his inner vulnerability with a veneer of authority. he feels threatened by castor's insubordination, leading to a simmering anger beneath his surface. tiberius grapples with paranoia, convinced of the loyalty of those around him, while simultaneously feeling isolated in his decisions."],
        ap.active_plans = ["To maintain his control over the narrative of power dynamics within Rome.", "To assert his authority and dismiss any perceived challenges to his judgment.", "To reinforce his partnership with Sejanus, seeing him as a necessary ally in governance."],
        ap.beliefs = ["Authority must be upheld at all costs, and dissent will not be tolerated.", "Sejanus is a loyal subordinate who provides crucial information for governance.", "Loyalty is paramount, and questioning it is a direct challenge to his leadership."],
        ap.goals = ["Short-term: To redirect the conversation towards more pressing imperial matters, like coastal defenses.", "Medium-term: To fortify his alliance with Sejanus and consolidate power.", "Ultimate: To maintain his reign unchallenged, ensuring the stability of the empire despite mounting paranoia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Castor stands wearily in the secluded garden, his posture slumped with defeat. He paces slightly as he speaks to Livilla, his movements lacking their usual energy. He gestures with a dismissive wave of his hand when mentioning Tiberius\'s preoccupations, and a shiver runs through him as he recalls Caligula, his unease palpable in his stance.',
        ap.emotional_state = 'Castor is consumed by frustration and a deep despair. Outwardly, his tone is laced with exhaustion and resignation as he speaks of his father\'s blindness. Internally, he is wrestling with a sense of helplessness and foreboding about the future of Rome under Tiberius\'s increasingly detached rule and Sejanus\'s growing power. The mention of Caligula ignites a visceral revulsion and fear within him, hinting at a deeper, unspoken dread for what the future holds.',
        ap.emotional_tags = ["castor is consumed by frustration", "a deep despair. outwardly, his tone is laced with exhaustion", "resignation as he speaks of his father's blindness. internally, he is wrestling with a sense of helplessness", "foreboding about the future of rome under tiberius's increasingly detached rule", "sejanus's growing power. the mention of caligula ignites a visceral revulsion", "fear within him, hinting at a deeper, unspoken dread for what the future holds.", "castor is consumed by frustration and a deep despair. outwardly", "his tone is laced with exhaustion and resignation as he speaks of his father's blindness. internally", "he is wrestling with a sense of helplessness and foreboding about the future of rome under tiberius's increasingly detached rule and sejanus's growing power. the mention of caligula ignites a visceral revulsion and fear within him", "hinting at a deeper", "unspoken dread for what the future holds."],
        ap.active_plans = ["To articulate his deep concerns about Sejanus's ambition to Livilla, hoping she might understand the gravity of the situation.", "To express his profound disappointment and disillusionment with Tiberius's leadership and judgment.", "To process his own feelings of helplessness and fear by sharing them with someone he might trust, even if it's just a lament."],
        ap.beliefs = ["Sejanus is a dangerously ambitious man who is manipulating Tiberius for his own gain and will ultimately become a tyrant.", "Tiberius is tragically blind to Sejanus's true nature and is making decisions that are detrimental to Rome.", "Caligula is a sinister and disturbing figure, possibly embodying a future threat to the stability of Rome, and his association with Tiberius is ominous."],
        ap.goals = ["Short-term: To vent his frustrations and seek some form of emotional validation or agreement from Livilla regarding his assessment of Sejanus and Tiberius.", "Medium-term: To somehow awaken Tiberius to the danger posed by Sejanus, although he seems to recognize this is increasingly unlikely.", "Ultimate: To see Rome governed justly and wisely, and to prevent the looming tyranny he fears, even though he feels powerless to stop it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_7'})
    ON CREATE SET
        ap.current_status = 'Livilla stands nearby, her posture tense yet subtly poised, absorbing the tension between Castor and Tiberius. As she witnesses the discussion unfold, her gaze flickers between the two men, reflecting her unease about the implications of their conversation regarding Caligula.',
        ap.emotional_state = 'Livilla\'s surface demeanor is calm, but internally, she wrestles with anxiety and concern regarding the power dynamics at play. She senses the potential danger that Caligula embodies, feeling a protective instinct towards her family while also questioning the loyalty of Tiberius. Her conflict is palpable, as she balances her loyalty to her brother with the growing threat of their cousin.',
        ap.emotional_tags = ["livilla's surface demeanor is calm, but internally, she wrestles with anxiety", "concern regarding the power dynamics at play. she senses the potential danger that caligula embodies, feeling a protective instinct towards her family while also questioning the loyalty of tiberius. her conflict is palpable, as she balances her loyalty to her brother with the growing threat of their cousin.", "livilla's surface demeanor is calm", "but internally", "she wrestles with anxiety and concern regarding the power dynamics at play. she senses the potential danger that caligula embodies", "feeling a protective instinct towards her family while also questioning the loyalty of tiberius. her conflict is palpable", "as she balances her loyalty to her brother with the growing threat of their cousin.", "livilla's surface demeanor is calm, but internally, she wrestles with anxiety and concern regarding the power dynamics at play. she senses the potential danger that caligula embodies, feeling a protective instinct towards her family", "also questioning the loyalty of tiberius. her conflict is palpable, as she balances her loyalty to her brother with the growing threat of their cousin.", "livilla's surface demeanor is calm,", "internally, she wrestles with anxiety and concern regarding the power dynamics at play. she senses the potential danger that caligula embodies, feeling a protective instinct towards her family while also questioning the loyalty of tiberius. her conflict is palpable, as she balances her loyalty to her brother with the growing threat of their cousin."],
        ap.active_plans = ["To subtly gauge Castor's concerns about Caligula's character without escalating the tension with Tiberius.", "To maintain a facade of calmness while fostering dialogue that may reveal more about Castor's views.", "To protect her family's interests by keeping a close eye on the relationships forming between Tiberius, Caligula, and Sejanus."],
        ap.beliefs = ["Family loyalty is paramount, but it must be tempered with caution in the face of ambition.", "The imperial court is rife with treachery, and one must stay vigilant.", "Tiberius's judgment is clouded, leading to potential dangers for their family if not addressed."],
        ap.goals = ["Short-term: To ensure the family remains united amid growing tensions around Caligula.", "Medium-term: To navigate the dangerous terrain of court politics without drawing attention to her concerns.", "Ultimate: To safeguard her family's legacy and integrity within the tumultuous power dynamics of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_7'})
    ON CREATE SET
        ap.current_status = 'Castor stands in a defensive posture, agitation evident in the furrow of his brow and clenched fists as he confronts Tiberius. His movements are animated, punctuating his words with gestures of disbelief and urgency as he articulates his concerns about Sejanus and Caligula.',
        ap.emotional_state = 'On the surface, Castor\'s emotions are a mix of frustration and protective indignation. He feels an urgent need to awaken Tiberius to the looming threat posed by Sejanus’s ambition. Internally, he wrestles with fear and anger, acknowledging the inadequacy of his father\'s judgment while grappling with the weight of expectations placed upon him as a son of the Emperor.',
        ap.emotional_tags = ["on the surface, castor's emotions are a mix of frustration", "protective indignation. he feels an urgent need to awaken tiberius to the looming threat posed by sejanus\u2019s ambition. internally, he wrestles with fear", "anger, acknowledging the inadequacy of his father's judgment while grappling with the weight of expectations placed upon him as a son of the emperor.", "on the surface", "castor's emotions are a mix of frustration and protective indignation. he feels an urgent need to awaken tiberius to the looming threat posed by sejanus\u2019s ambition. internally", "he wrestles with fear and anger", "acknowledging the inadequacy of his father's judgment while grappling with the weight of expectations placed upon him as a son of the emperor.", "on the surface, castor's emotions are a mix of frustration and protective indignation. he feels an urgent need to awaken tiberius to the looming threat posed by sejanus\u2019s ambition. internally, he wrestles with fear and anger, acknowledging the inadequacy of his father's judgment", "grappling with the weight of expectations placed upon him as a son of the emperor."],
        ap.active_plans = ["To persuade Tiberius of the imminent dangers posed by Sejanus and Caligula's growing power.", "To assert his own understanding of the political landscape and regain his father's trust.", "To seek reassurance from Livilla about their family's safety amid the swirling conspiracies."],
        ap.beliefs = ["Sejanus is a manipulative figure with ambitions that threaten the imperial family.", "Blind loyalty to allies can lead to destruction and betrayal.", "As a member of the imperial family, it is his duty to protect their legacy, even if it strains familial bonds."],
        ap.goals = ["Short-term: To convince Tiberius to reconsider his alliance with Sejanus and remain vigilant.", "Medium-term: To strengthen his own position in the court by demonstrating his insight and loyalty.", "Ultimate: To safeguard the Julio-Claudian dynasty from corruption and betrayal, ensuring a stable future for the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_8'})
    ON CREATE SET
        ap.current_status = 'Livilla stands nearby as Castor and Tiberius clash, her posture composed yet alert. She observes the escalating tension, interjecting with a seemingly calm question directed at Castor, aiming to diffuse the heated exchange and subtly undermine Castor\'s alarming accusations against Sejanus.',
        ap.emotional_state = 'On the surface, Livilla projects an air of measured skepticism, her tone suggesting a rational counterpoint to Castor\'s perceived overreaction. Internally, she is likely more calculating, possibly feigning nonchalance to mask her own agenda or alliance with Sejanus. There\'s a subtle tension between her outward composure and the underlying political currents she navigates, hinting at unspoken motivations to protect Sejanus\'s growing influence.',
        ap.emotional_tags = ["on the surface, livilla projects an air of measured skepticism, her tone suggesting a rational counterpoint to castor's perceived overreaction. internally, she is likely more calculating, possibly feigning nonchalance to mask her own agenda or alliance with sejanus. there's a subtle tension between her outward composure", "the underlying political currents she navigates, hinting at unspoken motivations to protect sejanus's growing influence.", "on the surface", "livilla projects an air of measured skepticism", "her tone suggesting a rational counterpoint to castor's perceived overreaction. internally", "she is likely more calculating", "possibly feigning nonchalance to mask her own agenda or alliance with sejanus. there's a subtle tension between her outward composure and the underlying political currents she navigates", "hinting at unspoken motivations to protect sejanus's growing influence."],
        ap.active_plans = ["To de-escalate the immediate conflict between Castor and Tiberius regarding Sejanus.", "To subtly discredit Castor's warnings about Sejanus's ambition, portraying them as exaggerations.", "To maintain a veneer of stability and control within the court by downplaying potential threats to the established order."],
        ap.beliefs = ["In the effectiveness of subtle manipulation and indirect influence over direct confrontation.", "That maintaining a calm facade is crucial for navigating courtly intrigue and preserving her own position.", "That Castor is prone to alarmism and lacks a nuanced understanding of political dynamics."],
        ap.goals = ["Short-term: To quell the argument and restore a semblance of peace in the immediate setting.", "Medium-term: To safeguard Sejanus's position and continue benefiting from their alliance or his power.", "Ultimate: To secure and enhance her own influence within the Roman court, potentially through Sejanus's ascendance or by playing different factions strategically."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_8'})
    ON CREATE SET
        ap.current_status = 'Castor stands rigidly before his father, Tiberius, his body language radiating tension and frustration. He speaks with urgency and directness, using strong language to convey the gravity of his warnings about Sejanus. His movements are likely sharp and emphatic as he attempts to break through Tiberius\'s denial.',
        ap.emotional_state = 'Castor is outwardly agitated and deeply concerned, his voice rising in frustration as he tries to penetrate Tiberius\'s stubbornness. Internally, he is wrestling with a mixture of fear and exasperation. He is genuinely worried about the danger Sejanus poses, feeling a growing sense of helplessness and despair as his father dismisses his warnings. Beneath the surface frustration lies a deep-seated anxiety for the future of his family and Rome.',
        ap.emotional_tags = ["castor is outwardly agitated", "deeply concerned, his voice rising in frustration as he tries to penetrate tiberius's stubbornness. internally, he is wrestling with a mixture of fear", "exasperation. he is genuinely worried about the danger sejanus poses, feeling a growing sense of helplessness", "despair as his father dismisses his warnings. beneath the surface frustration lies a deep-seated anxiety for the future of his family", "rome.", "castor is outwardly agitated and deeply concerned", "his voice rising in frustration as he tries to penetrate tiberius's stubbornness. internally", "he is wrestling with a mixture of fear and exasperation. he is genuinely worried about the danger sejanus poses", "feeling a growing sense of helplessness and despair as his father dismisses his warnings. beneath the surface frustration lies a deep-seated anxiety for the future of his family and rome."],
        ap.active_plans = ["To directly warn Tiberius about the imminent threat posed by Sejanus's unchecked ambition.", "To present concrete examples of Sejanus's manipulative tactics and power grabs, like the statues and spy network.", "To appeal to Tiberius's reason and paternal instincts, urging him to see the truth before it's too late."],
        ap.beliefs = ["That Sejanus is a dangerous and power-hungry individual who aims to usurp Tiberius's position.", "That Tiberius is dangerously blind to Sejanus's true nature, blinded by manipulation and isolation.", "In the importance of familial duty and protecting his father and the empire from internal threats."],
        ap.goals = ["Short-term: To make Tiberius acknowledge the validity of his concerns about Sejanus in this immediate confrontation.", "Medium-term: To weaken Sejanus's influence over Tiberius and initiate an investigation into his activities.", "Ultimate: To remove Sejanus from power entirely and secure the stability of the Julio-Claudian dynasty, ensuring his family's safety and the empire's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_9'})
    ON CREATE SET
        ap.current_status = 'Livilla stands nearby, tense and anxious, her posture reflecting a mix of concern and desire for peace. She watches Castor and Tiberius with a furrowed brow, her hands fidgeting slightly, betraying her unease amidst the familial conflict.',
        ap.emotional_state = 'Outwardly, Livilla displays a composed demeanor, yet an undercurrent of anxiety bubbles beneath her calm façade. She is worried about the escalating tensions between her father and brother, feeling the weight of their unresolved issues. Her internal conflict reveals a desire to mediate and restore harmony, even while fearing the consequences of their strife.',
        ap.emotional_tags = ["outwardly, livilla displays a composed demeanor, yet an undercurrent of anxiety bubbles beneath her calm fa\u00e7ade. she is worried about the escalating tensions between her father", "brother, feeling the weight of their unresolved issues. her internal conflict reveals a desire to mediate", "restore harmony, even while fearing the consequences of their strife.", "outwardly", "livilla displays a composed demeanor", "yet an undercurrent of anxiety bubbles beneath her calm fa\u00e7ade. she is worried about the escalating tensions between her father and brother", "feeling the weight of their unresolved issues. her internal conflict reveals a desire to mediate and restore harmony", "even while fearing the consequences of their strife.", "outwardly, livilla displays a composed demeanor, yet an undercurrent of anxiety bubbles beneath her calm fa\u00e7ade. she is worried about the escalating tensions between her father and brother, feeling the weight of their unresolved issues. her internal conflict reveals a desire to mediate and restore harmony, even", "fearing the consequences of their strife."],
        ap.active_plans = ["To subtly guide the conversation towards resolution and peace between Castor and Tiberius, possibly to prevent further conflict.", "To assess the true nature of Sejanus's influence on her father, gauging whether she should take action.", "To alleviate Castor's distress by suggesting rest, hoping to create a moment of respite from the tension."],
        ap.beliefs = ["Family unity is essential for survival in the treacherous court of Rome.", "Sejanus poses a significant threat to her family's stability and must be closely monitored.", "Emotional support is integral to maintaining familial relationships amidst political strife."],
        ap.goals = ["Short-term: Encourage Castor to take care of himself and rest, reducing immediate tension.", "Medium-term: Foster a united front against external threats, particularly from Sejanus.", "Ultimate: Ensure the safety and well-being of her family, navigating the dangers of imperial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_9'})
    ON CREATE SET
        ap.current_status = 'Castor stands tense before his father, his arms crossed defensively, casting quick, frustrated glances at Tiberius as he argues passionately. He shifts his weight, revealing his agitation, and occasionally glances at Livilla, seeking her support in this fraught exchange.',
        ap.emotional_state = 'Externally, Castor exhibits frustration and indignation towards Tiberius, his voice rising with urgency. Internally, he grapples with feelings of helplessness and concern over his father\'s blind trust in Sejanus. He is torn between the need to protect his father and the recognition that his warnings may go unheeded.',
        ap.emotional_tags = ["externally, castor exhibits frustration", "indignation towards tiberius, his voice rising with urgency. internally, he grapples with feelings of helplessness", "concern over his father's blind trust in sejanus. he is torn between the need to protect his father", "the recognition that his warnings may go unheeded.", "externally", "castor exhibits frustration and indignation towards tiberius", "his voice rising with urgency. internally", "he grapples with feelings of helplessness and concern over his father's blind trust in sejanus. he is torn between the need to protect his father and the recognition that his warnings may go unheeded."],
        ap.active_plans = ["To convince Tiberius of the danger Sejanus poses, attempting to open his father's eyes to the truth.", "To affirm his loyalty to his family while expressing concern for their safety in the face of Sejanus's ambition.", "To advocate for a proactive approach against perceived threats, struggling against Tiberius's complacency."],
        ap.beliefs = ["Blind trust in advisors like Sejanus can lead to disaster for the imperial family.", "It is his duty as a son to protect his father and family from internal threats.", "Ambition can corrupt even the most seemingly loyal allies, as demonstrated by Sejanus."],
        ap.goals = ["Short-term: Persuade Tiberius to reconsider his alliance with Sejanus and acknowledge the threat.", "Medium-term: Strengthen his position within the family by proving his loyalty and insight.", "Ultimate: Ensure the safety of the imperial family by dismantling the influence of dangerous figures like Sejanus."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_5_3'})
    ON CREATE SET
        oi.description = 'The bed is the central piece of furniture within Castor\'s bedchamber, serving as the focal point of his weariness and impending rest. Castor sits on the edge of the bed, signifying the transition from activity to repose, and later lies back onto it, indicating his surrender to sleep. The bed becomes a silent witness to the brief, emotionally muted interaction between Castor and Livilla, highlighting the lack of intimacy and the prevalence of exhaustion in their relationship. It is the locus of Castor\'s vulnerability and need for rest, contrasting with the subtle emotional dynamics playing out around it.',
        oi.status_before = 'The bed is in its usual state within Castor\'s bedchamber, presumably made and ready for use, awaiting Castor\'s return for the night. It is a passive object, part of the familiar setting of the room.',
        oi.status_after = 'The bed remains physically unchanged, but its status has shifted to become the place where Castor is now settling down for sleep. It has transitioned from being a piece of furniture in the room to being actively used for its intended purpose – rest and sleep – further emphasizing Castor\'s fatigue and the conclusion of the day\'s events for him.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_5_4'})
    ON CREATE SET
        oi.description = 'The bed serves as the central piece of furniture in Castor\'s chamber, where he finds rest after a strenuous day. As Castor lies back, the bed transforms from mere furniture into a sanctuary, symbolizing the weight of familial responsibilities that he carries. It is a space where vulnerability meets the harsh realities of their lives.',
        oi.status_before = 'The bed is adorned with rich textiles, maintaining its status as a luxurious yet personal space for Castor, reflecting the aristocratic nature of their household.',
        oi.status_after = 'Following the event, the bed remains unchanged, yet it now carries the weight of Castor\'s weariness and Livilla\'s unease, embodying the emotional landscape of their relationship.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_5_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Helen stands in the doorway of her father\'s bedchamber, her youthful frame outlined against the light from the hallway. She has come to bid Castor goodnight, stepping tentatively into the room as she speaks to him where he sits wearily on the edge of his bed. Her movements are gentle, respectful of his obvious fatigue.',
        ap.emotional_state = 'Helen\'s surface emotions are clearly warm and affectionate. She expresses gladness at her father\'s return, indicating a loving bond and perhaps a sense of worry during his absence. Internally, she is likely feeling a simple, childlike concern for her father\'s well-being, noticing his tiredness and wanting to offer comfort and reassurance in her innocent way. There are no apparent hidden conflicts; her emotions seem genuine and straightforward.',
        ap.emotional_tags = ["helen's surface emotions are clearly warm", "affectionate. she expresses gladness at her father's return, indicating a loving bond", "perhaps a sense of worry during his absence. internally, she is likely feeling a simple, childlike concern for her father's well-being, noticing his tiredness", "wanting to offer comfort", "reassurance in her innocent way. there are no apparent hidden conflicts; her emotions seem genuine", "straightforward.", "helen's surface emotions are clearly warm and affectionate. she expresses gladness at her father's return", "indicating a loving bond and perhaps a sense of worry during his absence. internally", "she is likely feeling a simple", "childlike concern for her father's well-being", "noticing his tiredness and wanting to offer comfort and reassurance in her innocent way. there are no apparent hidden conflicts; her emotions seem genuine and straightforward.", "helen's surface emotions are clearly warm and affectionate. she expresses gladness at her father's return, indicating a loving bond and perhaps a sense of worry during his absence. internally, she is likely feeling a simple, childlike concern for her father's well-being, noticing his tiredness and wanting to offer comfort and reassurance in her innocent way. there are no apparent hidden conflicts", "her emotions seem genuine and straightforward."],
        ap.active_plans = ["To express her affection for her father before he rests.", "To reassure Castor that his tiredness is temporary and he will feel better.", "To fulfill her nightly routine of saying goodnight to both parents."],
        ap.beliefs = ["Family members should express care and concern for each other.", "A goodnight wish is a comforting and important ritual.", "Parents need to be reassured and cared for, especially when they are tired or unwell."],
        ap.goals = ["Short-term: To say goodnight to her father and mother.", "Medium-term: To maintain a loving and supportive relationship with her parents.", "Ultimate: To grow up in a secure and affectionate family environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Castor sits heavily on the edge of his bed, his posture slouched with weariness. He responds to Helen\'s entrance with simple, tired words, his movements minimal as he acknowledges her presence. He lies back on the bed as the interaction progresses, his eyes already beginning to close, indicating a deep exhaustion that is overpowering his ability to stay awake and engage.',
        ap.emotional_state = 'Castor outwardly expresses a subdued affection for Helen, responding to her goodnight wishes and complimenting her beauty. However, beneath this surface, his primary emotional state is one of profound fatigue, both physically and emotionally. He seems drained, not just from the day\'s events but perhaps from the ongoing pressures and complexities of his life within the imperial family. There might be a subtle undercurrent of resignation or detachment, as he seems to accept his weariness as a constant state.',
        ap.emotional_tags = ["castor outwardly expresses a subdued affection for helen, responding to her goodnight wishes", "complimenting her beauty. however, beneath this surface, his primary emotional state is one of profound fatigue, both physically", "emotionally. he seems drained, not just from the day's events but perhaps from the ongoing pressures", "complexities of his life within the imperial family. there might be a subtle undercurrent of resignation or detachment, as he seems to accept his weariness as a constant state.", "castor outwardly expresses a subdued affection for helen", "responding to her goodnight wishes and complimenting her beauty. however", "beneath this surface", "his primary emotional state is one of profound fatigue", "both physically and emotionally. he seems drained", "not just from the day's events but perhaps from the ongoing pressures and complexities of his life within the imperial family. there might be a subtle undercurrent of resignation or detachment", "as he seems to accept his weariness as a constant state.", "castor outwardly expresses a subdued affection for helen, responding to her goodnight wishes and complimenting her beauty. however, beneath this surface, his primary emotional state is one of profound fatigue, both physically and emotionally. he seems drained, not just from the day's events", "perhaps from the ongoing pressures and complexities of his life within the imperial family. there might be a subtle undercurrent of resignation or detachment, as he seems to accept his weariness as a constant state."],
        ap.active_plans = ["To acknowledge Helen's goodnight and reciprocate her affection.", "To politely engage in brief conversation with both Helen and Livilla despite his exhaustion.", "To quickly transition to sleep and seek rest from his weariness."],
        ap.beliefs = ["It is important to be polite and responsive to his daughter, even when tired.", "Rest is essential for physical and mental recovery.", "Maintaining a semblance of normal family interactions is necessary, despite underlying tensions."],
        ap.goals = ["Short-term: To get to sleep as quickly as possible.", "Medium-term: To recover from his current state of exhaustion and regain energy.", "Ultimate: To find some peace and respite from the burdens and pressures of his imperial life, even if only in sleep."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Castor sits wearily on the edge of his bed, physically exhausted from the day’s demands. He speaks softly to his daughter, Helen, displaying a mix of affection and fatigue. As she leaves, he shifts his attention to Livilla, complimenting her beauty, which reveals his lingering feelings for her. His posture is slumped, indicating his tiredness, while his words reflect a fatherly pride in his daughter’s appearance.',
        ap.emotional_state = 'Castor expresses surface-level affection through his comments about Helen’s beauty and Livilla’s charm. However, beneath his weariness lies a protective concern for his family\'s health, hinting at deeper worries about their daughter’s well-being and the societal pressures that may be affecting her. There’s a tension between his fatherly pride and the creeping dread that comes with being part of a family entwined in the machinations of the imperial court.',
        ap.emotional_tags = ["castor expresses surface-level affection through his comments about helen\u2019s beauty", "livilla\u2019s charm. however, beneath his weariness lies a protective concern for his family's health, hinting at deeper worries about their daughter\u2019s well-being", "the societal pressures that may be affecting her. there\u2019s a tension between his fatherly pride", "the creeping dread that comes with being part of a family entwined in the machinations of the imperial court.", "castor expresses surface-level affection through his comments about helen\u2019s beauty and livilla\u2019s charm. however", "beneath his weariness lies a protective concern for his family's health", "hinting at deeper worries about their daughter\u2019s well-being and the societal pressures that may be affecting her. there\u2019s a tension between his fatherly pride and the creeping dread that comes with being part of a family entwined in the machinations of the imperial court."],
        ap.active_plans = ["To support his daughter, Helen, by acknowledging her growth and beauty, thereby reinforcing his role as a caring father.", "To maintain a harmonious relationship with Livilla by complimenting her, suggesting a desire for intimacy and connection despite current tensions.", "To prioritize rest and recovery, recognizing his limits as he navigates life within the imperial court."],
        ap.beliefs = ["Family is of utmost importance, and he feels a deep responsibility to protect Helen while expressing pride in her development.", "Aesthetic beauty is significant in their world, which he acknowledges both in Helen and Livilla, reflecting societal expectations.", "Growth and health should be nurtured, which fuels his worry about Helen's appearance and well-being."],
        ap.goals = ["Short-term: To reassure Helen of his affection and provide comfort before she goes to bed.", "Medium-term: To foster a supportive family environment that shields his children from the court's darker influences.", "Ultimate: To navigate the treacherous waters of imperial life while ensuring the safety and happiness of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livilla stands near the entrance, observing the exchange between Castor and their daughter. Her body language is slightly tense, and she watches with a flicker of unease, her expression revealing a hidden concern for Helen\'s health. Despite the compliments exchanged, she maintains a distance, suggesting her emotional detachment from the moment.',
        ap.emotional_state = 'While Livilla outwardly appears poised and polite, internally she wrestles with anxiety regarding Helen’s health and beauty. Her comments about Helen\'s skin indicate a protective instinct but also an awareness of societal pressures that may affect their daughter. The unease on her face hints at unspoken worries about their family\'s image and wellbeing, reflecting a complex internal struggle between maternal love and the harsh realities of imperial expectations.',
        ap.emotional_tags = ["while livilla outwardly appears poised", "polite, internally she wrestles with anxiety regarding helen\u2019s health", "beauty. her comments about helen's skin indicate a protective instinct but also an awareness of societal pressures that may affect their daughter. the unease on her face hints at unspoken worries about their family's image", "wellbeing, reflecting a complex internal struggle between maternal love", "the harsh realities of imperial expectations.", "while livilla outwardly appears poised and polite", "internally she wrestles with anxiety regarding helen\u2019s health and beauty. her comments about helen's skin indicate a protective instinct but also an awareness of societal pressures that may affect their daughter. the unease on her face hints at unspoken worries about their family's image and wellbeing", "reflecting a complex internal struggle between maternal love and the harsh realities of imperial expectations.", "while livilla outwardly appears poised and polite, internally she wrestles with anxiety regarding helen\u2019s health and beauty. her comments about helen's skin indicate a protective instinct", "also an awareness of societal pressures that may affect their daughter. the unease on her face hints at unspoken worries about their family's image and wellbeing, reflecting a complex internal struggle between maternal love and the harsh realities of imperial expectations."],
        ap.active_plans = ["To subtly convey her concern for Helen's health without alarming Castor, indicating her protective instincts as a mother.", "To maintain her social grace while navigating the complexities of her relationship with Castor, demonstrating her role in keeping harmony.", "To prepare for potential challenges that may arise from Helen's interactions in the imperial court, as she is acutely aware of the dangers."],
        ap.beliefs = ["A mother's duty is to protect her children, which drives her concern for Helen's appearance and wellbeing.", "Societal expectations of beauty and health are critical, and she feels the weight of these pressures on her family.", "Her role as a mother and wife requires navigating delicate dynamics, especially within the treacherous environment of the imperial court."],
        ap.goals = ["Short-term: To ensure a peaceful night for her family by managing her concerns discreetly during Castor\u2019s moment with Helen.", "Medium-term: To maintain her daughter\u2019s health and beauty in line with societal expectations, reflecting her protective nature.", "Ultimate: To navigate the complexities of family life while shielding her loved ones from the harsh realities of their political environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Castor is seated on the edge of his bed in his bedchamber, visibly fatigued. He engages in a brief exchange with his daughter, Helen, and then with Livilla, expressing his exhaustion and preparing to lie down to sleep. He is physically present in his personal space, ready to conclude his day.',
        ap.emotional_state = 'Castor is emotionally drained and weary. Outwardly, he is polite and somewhat affectionate towards both Helen and Livilla, but his dominant emotion is profound tiredness. Internally, he seems resigned to his exhaustion, perhaps indicative of a deeper weariness with his circumstances or life in general. There\'s a palpable lack of energy, both physical and emotional.',
        ap.emotional_tags = ["castor is emotionally drained", "weary. outwardly, he is polite", "somewhat affectionate towards both helen", "livilla, but his dominant emotion is profound tiredness. internally, he seems resigned to his exhaustion, perhaps indicative of a deeper weariness with his circumstances or life in general. there's a palpable lack of energy, both physical", "emotional.", "castor is emotionally drained and weary. outwardly", "he is polite and somewhat affectionate towards both helen and livilla", "but his dominant emotion is profound tiredness. internally", "he seems resigned to his exhaustion", "perhaps indicative of a deeper weariness with his circumstances or life in general. there's a palpable lack of energy", "both physical and emotional.", "castor is emotionally drained and weary. outwardly, he is polite and somewhat affectionate towards both helen and livilla,", "his dominant emotion is profound tiredness. internally, he seems resigned to his exhaustion, perhaps indicative of a deeper weariness with his circumstances or life in general. there's a palpable lack of energy, both physical and emotional."],
        ap.active_plans = ["To end the day and seek rest in his bed.", "To acknowledge and reciprocate the goodnight wishes from Helen and Livilla.", "To politely accept Livilla's decision not to stay, prioritizing his need for sleep."],
        ap.beliefs = ["He believes he is genuinely too tired to stay awake any longer.", "He believes Livilla is correct in her assessment that he will sleep better alone.", "He likely believes that any deeper intimacy with Livilla is not expected or appropriate given his current state of exhaustion, or perhaps in their relationship generally."],
        ap.goals = ["Short-term: To fall asleep quickly and obtain restful sleep to alleviate his fatigue.", "Medium-term: To recover his energy and feel refreshed in the morning.", "Ultimate: To find some measure of peace or respite from the burdens he carries, though this is subtly implied rather than explicitly stated."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Livilla is positioned near the entrance of Castor\'s bedchamber, observing the interaction between Castor and Helen. She engages in a brief, polite exchange with Helen and then with Castor. She offers a compliment to Castor but ultimately declines his implicit invitation to stay, maintaining a physical and emotional distance.',
        ap.emotional_state = 'Livilla displays a veneer of politeness and attentiveness, particularly in her brief interactions with Helen and Castor. However, beneath the surface, there is a subtle \'flicker of unease\' in her expression, hinting at a more complex internal state. While she offers a compliment, her decision to leave suggests emotional detachment or a calculated avoidance of intimacy with Castor. Her politeness feels somewhat performative, masking potentially deeper emotional reserves or calculated intentions.',
        ap.emotional_tags = ["livilla displays a veneer of politeness", "attentiveness, particularly in her brief interactions with helen", "castor. however, beneath the surface, there is a subtle 'flicker of unease' in her expression, hinting at a more complex internal state. while she offers a compliment, her decision to leave suggests emotional detachment or a calculated avoidance of intimacy with castor. her politeness feels somewhat performative, masking potentially deeper emotional reserves or calculated intentions.", "livilla displays a veneer of politeness and attentiveness", "particularly in her brief interactions with helen and castor. however", "beneath the surface", "there is a subtle 'flicker of unease' in her expression", "hinting at a more complex internal state. while she offers a compliment", "her decision to leave suggests emotional detachment or a calculated avoidance of intimacy with castor. her politeness feels somewhat performative", "masking potentially deeper emotional reserves or calculated intentions."],
        ap.active_plans = ["To observe the familial interaction between Castor and Helen, maintaining a polite and peripheral presence.", "To offer a superficial compliment to Castor, fulfilling social expectations without genuine warmth.", "To strategically avoid deeper intimacy or prolonged engagement with Castor by politely declining to stay, ensuring emotional distance is maintained."],
        ap.beliefs = ["She likely believes Castor is genuinely tired, using it as a convenient excuse to avoid intimacy.", "She probably believes her presence is not truly desired by Castor beyond social formality, or that her own presence would be unwelcome for unspoken reasons.", "She may believe that maintaining emotional distance from Castor is beneficial to her own undisclosed objectives or emotional state."],
        ap.goals = ["Short-term: To gracefully exit Castor's bedchamber without any expectation of intimacy or prolonged conversation.", "Medium-term: To maintain a publicly acceptable but emotionally distant marital relationship with Castor, managing appearances.", "Ultimate: To potentially pursue her own ambitions and desires outside of her marriage, where emotional detachment from Castor is a necessary component of her broader strategy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Castor sits on the edge of his bed, weary from the day\'s burdens. As he lies back, his eyes begin to close, signaling his exhaustion. His posture reflects a man worn down by the weight of expectations and familial obligations, seeking solace in the quiet of his chamber.',
        ap.emotional_state = 'Outwardly, Castor appears tired, his voice heavy with fatigue. Internally, there is a palpable tension as he battles feelings of inadequacy and the pressures of his lineage. His weariness hints at deeper anxieties about his role within the family and the impermanence of peace.',
        ap.emotional_tags = ["outwardly, castor appears tired, his voice heavy with fatigue. internally, there is a palpable tension as he battles feelings of inadequacy", "the pressures of his lineage. his weariness hints at deeper anxieties about his role within the family", "the impermanence of peace.", "outwardly", "castor appears tired", "his voice heavy with fatigue. internally", "there is a palpable tension as he battles feelings of inadequacy and the pressures of his lineage. his weariness hints at deeper anxieties about his role within the family and the impermanence of peace."],
        ap.active_plans = ["To rest and recover from exhaustion.", "To re-establish a sense of normalcy within his family dynamics.", "To reflect on his relationship with Livilla amidst the mounting pressures of their world."],
        ap.beliefs = ["Family is paramount, and he must fulfill his role as a protector.", "Rest is essential for dealing with the stress of imperial life.", "There is beauty in fragility, particularly in his daughter's growth."],
        ap.goals = ["Short-term: To get a good night's sleep to recover his strength.", "Medium-term: To foster a closer relationship with his daughter as she matures.", "Ultimate: To find a balance between his responsibilities and personal well-being within the family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Livilla lingers near the entrance of the bedchamber, observing Castor with an expression that betrays her unease. She stands poised yet tense, her body language hinting at the complexities of her feelings as she watches her husband succumb to exhaustion.',
        ap.emotional_state = 'Livilla\'s outward demeanor is calm, but internally, she is troubled. The flicker of unease in her expression reveals her concerns about their relationship and the pressures surrounding them. She wrestles with the fear of vulnerability in the face of their shared realities.',
        ap.emotional_tags = ["livilla's outward demeanor is calm, but internally, she is troubled. the flicker of unease in her expression reveals her concerns about their relationship", "the pressures surrounding them. she wrestles with the fear of vulnerability in the face of their shared realities.", "livilla's outward demeanor is calm", "but internally", "she is troubled. the flicker of unease in her expression reveals her concerns about their relationship and the pressures surrounding them. she wrestles with the fear of vulnerability in the face of their shared realities.", "livilla's outward demeanor is calm,", "internally, she is troubled. the flicker of unease in her expression reveals her concerns about their relationship and the pressures surrounding them. she wrestles with the fear of vulnerability in the face of their shared realities."],
        ap.active_plans = ["To maintain a sense of stability within her family despite unspoken tensions.", "To protect her daughter from potential threats that loom over them.", "To navigate her own feelings of detachment while remaining supportive of Castor."],
        ap.beliefs = ["The appearance of harmony is essential for familial unity.", "Personal sacrifices are necessary for the well-being of her children.", "Love can often come burdened with unspoken concerns."],
        ap.goals = ["Short-term: To create a peaceful atmosphere for her family during Castor's recovery.", "Medium-term: To strengthen her relationship with both Castor and Helen amid the chaos of their lives.", "Ultimate: To secure a future where family bonds are preserved despite the dangers surrounding them."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Livilla stands anxiously beside Castor\'s bed, her body tense with a mixture of anticipation and apprehension. She is positioned as a shadowy figure in the dimly lit room, her pale face reflecting the faint light of the oil lamp. Her movements are quick and nervous as she urges Sejanus to hasten, betraying her eagerness and underlying fear of discovery.',
        ap.emotional_state = 'Livilla is a whirlwind of conflicting emotions. On the surface, she projects impatience and desire, her words hurried and breathy as she pushes Sejanus to proceed. However, beneath this veneer of eagerness lies a deep-seated anxiety and vulnerability. Her fear of losing Sejanus is palpable, driving her to desperate measures. There\'s a hint of guilt or unease about drugging Castor, yet her overwhelming desire for Sejanus eclipses any moral qualms, creating a tense internal battle between passion and conscience.',
        ap.emotional_tags = ["livilla is a whirlwind of conflicting emotions. on the surface, she projects impatience", "desire, her words hurried", "breathy as she pushes sejanus to proceed. however, beneath this veneer of eagerness lies a deep-seated anxiety", "vulnerability. her fear of losing sejanus is palpable, driving her to desperate measures. there's a hint of guilt or unease about drugging castor, yet her overwhelming desire for sejanus eclipses any moral qualms, creating a tense internal battle between passion", "conscience.", "livilla is a whirlwind of conflicting emotions. on the surface", "she projects impatience and desire", "her words hurried and breathy as she pushes sejanus to proceed. however", "beneath this veneer of eagerness lies a deep-seated anxiety and vulnerability. her fear of losing sejanus is palpable", "driving her to desperate measures. there's a hint of guilt or unease about drugging castor", "yet her overwhelming desire for sejanus eclipses any moral qualms", "creating a tense internal battle between passion and conscience."],
        ap.active_plans = ["To continue her clandestine affair with Sejanus under the cover of night.", "To ensure Castor remains unconscious and unaware of her betrayal.", "To reaffirm Sejanus's love and commitment to her, seeking reassurance in their dangerous liaison."],
        ap.beliefs = ["She believes her happiness is inextricably linked to her relationship with Sejanus, to the point of dependency.", "She believes drugging Castor is a necessary, though risky, measure to maintain their affair.", "She believes in the power of her love for Sejanus to overcome any obstacles, even moral boundaries."],
        ap.goals = ["Short-term: To spend a secret, intimate moment with Sejanus in Castor's bedchamber.", "Medium-term: To sustain her affair with Sejanus without detection, navigating the increasing risks.", "Ultimate: To secure a future with Sejanus, free from the constraints of her marriage to Castor, even if it requires extreme measures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the bedchamber with a measured, almost predatory quietness, his movements deliberate and controlled. He surveys the scene, his eyes scanning Livilla and the sleeping Castor, ensuring the coast is clear. He maintains a physical distance initially, not rushing into intimacy but establishing his dominance through calculated pacing and questioning, asserting his control over the clandestine encounter.',
        ap.emotional_state = 'Sejanus projects an outward calm and collected demeanor, his tone laced with a playful yet authoritative edge. He is in command of the situation, masking his true feelings beneath a veneer of pragmatic control. Internally, he is calculating and strategic, weighing the risks of their affair and considering the long-term implications. While desire for Livilla is evident, it\'s tempered by a strong self-preservation instinct and ambition. He uses playful banter and teasing dominance to both seduce and manipulate Livilla, revealing a complex interplay of lust and calculated self-interest.',
        ap.emotional_tags = ["sejanus projects an outward calm", "collected demeanor, his tone laced with a playful yet authoritative edge. he is in command of the situation, masking his true feelings beneath a veneer of pragmatic control. internally, he is calculating", "strategic, weighing the risks of their affair", "considering the long-term implications. while desire for livilla is evident, it's tempered by a strong self-preservation instinct", "ambition. he uses playful banter", "teasing dominance to both seduce", "manipulate livilla, revealing a complex interplay of lust", "calculated self-interest.", "sejanus projects an outward calm and collected demeanor", "his tone laced with a playful yet authoritative edge. he is in command of the situation", "masking his true feelings beneath a veneer of pragmatic control. internally", "he is calculating and strategic", "weighing the risks of their affair and considering the long-term implications. while desire for livilla is evident", "it's tempered by a strong self-preservation instinct and ambition. he uses playful banter and teasing dominance to both seduce and manipulate livilla", "revealing a complex interplay of lust and calculated self-interest."],
        ap.active_plans = ["To assess the immediate danger and ensure the secrecy of their rendezvous.", "To reassert his dominance in the relationship, reminding Livilla of the risks and his control over their actions.", "To subtly gauge Livilla's willingness to escalate their affair, probing her readiness to consider more drastic solutions to their predicament."],
        ap.beliefs = ["He believes their affair is becoming increasingly risky and unsustainable in its current form, requiring a decisive resolution.", "He believes in maintaining control and calculated pragmatism in all his actions, especially in dangerous liaisons.", "He believes he can manipulate Livilla's passion and desperation to his advantage, potentially pushing her towards extreme actions that serve his own ambition."],
        ap.goals = ["Short-term: To enjoy a secret encounter with Livilla while carefully managing the immediate risks of exposure.", "Medium-term: To resolve the increasingly precarious nature of their affair, potentially through the removal of Castor as an obstacle.", "Ultimate: To advance his own power and social standing, potentially through a strategic alliance or marriage with Livilla should circumstances align to his benefit."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Livilla stands beside Castor\'s bed, her pale face a stark contrast to the dimly lit room. She exudes tension, her posture rigid as she anxiously awaits Sejanus\'s arrival. Her eyes dart nervously, reflecting her inner turmoil as she engages in a whispered conversation, leaning closer to Sejanus while her hands fidget with her clothing, betraying her unease.',
        ap.emotional_state = 'Livilla is engulfed by an overwhelming emotional storm. Outwardly, she displays anxiety and desperation, her voice quivering as she pleads with Sejanus. Internally, she wrestles with profound fear and helplessness at the thought of losing him. Her passionate declaration of love contrasts sharply with her fearful anticipation of separation, revealing her vulnerability and the intensity of her feelings.',
        ap.emotional_tags = ["livilla is engulfed by an overwhelming emotional storm. outwardly, she displays anxiety", "desperation, her voice quivering as she pleads with sejanus. internally, she wrestles with profound fear", "helplessness at the thought of losing him. her passionate declaration of love contrasts sharply with her fearful anticipation of separation, revealing her vulnerability", "the intensity of her feelings.", "livilla is engulfed by an overwhelming emotional storm. outwardly", "she displays anxiety and desperation", "her voice quivering as she pleads with sejanus. internally", "she wrestles with profound fear and helplessness at the thought of losing him. her passionate declaration of love contrasts sharply with her fearful anticipation of separation", "revealing her vulnerability and the intensity of her feelings."],
        ap.active_plans = ["Ensure the safety of her affair with Sejanus by drugging Castor's wine.", "Engage in one last intimate encounter with Sejanus before potential separation.", "Explore the possibility of obtaining stronger poison to secure her freedom from Castor."],
        ap.beliefs = ["Love is worth risking everything, even if it means jeopardizing her marriage.", "The stakes of her affair are life-threatening, yet her emotional dependency on Sejanus blinds her to the risks.", "Her worth and happiness are tied to her relationship with Sejanus, making separation intolerable."],
        ap.goals = ["Short-term: To have one last romantic encounter with Sejanus.", "Medium-term: To find a way to ensure her continued relationship with Sejanus without risking exposure.", "Ultimate: To escape her marriage to Castor and secure a future with Sejanus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the dimly lit chamber with a calculated grace, his demeanor exuding confidence as he quickly assesses the situation. He approaches Livilla with a subtle charm, leaning closer to her and maintaining a low voice, which intensifies the furtive atmosphere. His movements are deliberate, conveying both authority and intimacy.',
        ap.emotional_state = 'Sejanus projects an air of calm, but beneath the surface lies a complex mix of desire and strategic calculation. His confidence masks a manipulative streak, as he seeks to control the narrative. He appears affectionate towards Livilla, but his insistence on caution hints at his self-serving nature, revealing the duality of love and ambition in his character.',
        ap.emotional_tags = ["sejanus projects an air of calm, but beneath the surface lies a complex mix of desire", "strategic calculation. his confidence masks a manipulative streak, as he seeks to control the narrative. he appears affectionate towards livilla, but his insistence on caution hints at his self-serving nature, revealing the duality of love", "ambition in his character.", "sejanus projects an air of calm", "but beneath the surface lies a complex mix of desire and strategic calculation. his confidence masks a manipulative streak", "as he seeks to control the narrative. he appears affectionate towards livilla", "but his insistence on caution hints at his self-serving nature", "revealing the duality of love and ambition in his character.", "sejanus projects an air of calm,", "beneath the surface lies a complex mix of desire and strategic calculation. his confidence masks a manipulative streak, as he seeks to control the narrative. he appears affectionate towards livilla,", "his insistence on caution hints at his self-serving nature, revealing the duality of love and ambition in his character."],
        ap.active_plans = ["Reinforce the need for secrecy in their affair to prevent discovery.", "Secure stronger poison for Livilla to eliminate Castor as a threat.", "Propose a future together, contingent upon Livilla's compliance and the success of their plans."],
        ap.beliefs = ["Relationship safety hinges on remaining discreet and strategic.", "Love must be tempered with caution to avoid fatal consequences.", "Power dynamics in their relationship necessitate manipulation for desired outcomes."],
        ap.goals = ["Short-term: To enjoy one last romantic encounter with Livilla.", "Medium-term: To obtain the right poison to ensure Castor's permanent elimination.", "Ultimate: To marry Livilla after divorcing his wife, consolidating power and passion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Livilla stands anxiously beside Castor\'s bed, shrouded in the dim light of a single oil lamp. She is positioned as a sentinel, confirming the success of her desperate act: Castor is indeed asleep, felled by the drug she administered. Her posture is tense, reflecting her eagerness for Sejanus and the illicit rendezvous she craves.',
        ap.emotional_state = 'Livilla is a whirlwind of conflicting emotions. Superficially, she exudes impatience and a raw desire for Sejanus, her words hurried and breathy. Yet, beneath this veneer of passion lies a deeper desperation – a fear of losing Sejanus that borders on obsession. She is emotionally reckless, blinded by her immediate desires and unwilling to consider the long-term dangers of her actions. Her plea to continue drugging Castor reveals a volatile mix of longing and a dangerous naivety regarding the escalating risks.',
        ap.emotional_tags = ["livilla is a whirlwind of conflicting emotions. superficially, she exudes impatience", "a raw desire for sejanus, her words hurried", "breathy. yet, beneath this veneer of passion lies a deeper desperation \u2013 a fear of losing sejanus that borders on obsession. she is emotionally reckless, blinded by her immediate desires", "unwilling to consider the long-term dangers of her actions. her plea to continue drugging castor reveals a volatile mix of longing", "a dangerous naivety regarding the escalating risks.", "livilla is a whirlwind of conflicting emotions. superficially", "she exudes impatience and a raw desire for sejanus", "her words hurried and breathy. yet", "beneath this veneer of passion lies a deeper desperation \u2013 a fear of losing sejanus that borders on obsession. she is emotionally reckless", "blinded by her immediate desires and unwilling to consider the long-term dangers of her actions. her plea to continue drugging castor reveals a volatile mix of longing and a dangerous naivety regarding the escalating risks."],
        ap.active_plans = ["To immediately engage in a passionate encounter with Sejanus, seizing this stolen moment.", "To persuade Sejanus that drugging Castor is a viable, ongoing solution to their need for secrecy.", "To secure Sejanus's continued affection and presence in her life, even if it means escalating risky behaviors."],
        ap.beliefs = ["She believes her intense desire for Sejanus justifies the risks involved in their affair.", "She believes that drugging Castor is a manageable and repeatable method to facilitate their meetings, at least for now.", "She believes in the depth and sincerity of Sejanus's love for her, despite his pragmatic and manipulative tendencies."],
        ap.goals = ["Short-term Goal: To experience physical intimacy and emotional connection with Sejanus in this stolen moment.", "Medium-term Goal: To establish a sustainable pattern of clandestine meetings with Sejanus, circumventing the obstacles of her marriage.", "Ultimate Goal: To secure a future with Sejanus, free from the constraints of her marriage to Castor, potentially envisioning a life where their love is openly acknowledged and celebrated."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the dimly lit bedchamber with a quiet, measured tread, his presence immediately contrasting Livilla\'s anxious energy. He stands composed, observing both Livilla and the sleeping Castor before engaging. His posture is controlled, his movements deliberate, indicative of his calculating and cautious nature as he assesses the situation and maintains command of the unfolding encounter.',
        ap.emotional_state = 'Sejanus projects an air of calm pragmatism, dismissing Livilla\'s impulsiveness with a veneer of sensible concern. Outwardly, he expresses worry about the risks of their affair, masking his true, manipulative intent. Internally, he is coldly strategic, prioritizing his own safety and long-term ambitions above Livilla\'s emotional needs. There is a calculated detachment in his demeanor, a chilling contrast to Livilla\'s passionate desperation, revealing his willingness to exploit her vulnerability for his own purposes, while feigning concern for her well-being.',
        ap.emotional_tags = ["sejanus projects an air of calm pragmatism, dismissing livilla's impulsiveness with a veneer of sensible concern. outwardly, he expresses worry about the risks of their affair, masking his true, manipulative intent. internally, he is coldly strategic, prioritizing his own safety", "long-term ambitions above livilla's emotional needs. there is a calculated detachment in his demeanor, a chilling contrast to livilla's passionate desperation, revealing his willingness to exploit her vulnerability for his own purposes, while feigning concern for her well-being.", "sejanus projects an air of calm pragmatism", "dismissing livilla's impulsiveness with a veneer of sensible concern. outwardly", "he expresses worry about the risks of their affair", "masking his true", "manipulative intent. internally", "he is coldly strategic", "prioritizing his own safety and long-term ambitions above livilla's emotional needs. there is a calculated detachment in his demeanor", "a chilling contrast to livilla's passionate desperation", "revealing his willingness to exploit her vulnerability for his own purposes", "while feigning concern for her well-being.", "sejanus projects an air of calm pragmatism, dismissing livilla's impulsiveness with a veneer of sensible concern. outwardly, he expresses worry about the risks of their affair, masking his true, manipulative intent. internally, he is coldly strategic, prioritizing his own safety and long-term ambitions above livilla's emotional needs. there is a calculated detachment in his demeanor, a chilling contrast to livilla's passionate desperation, revealing his willingness to exploit her vulnerability for his own purposes,", "feigning concern for her well-being."],
        ap.active_plans = ["To carefully assess the immediate danger of their clandestine meeting and ensure discretion.", "To firmly reject Livilla's unsustainable suggestion of continuing to drug Castor, emphasizing the escalating risks and impracticality.", "To manipulate Livilla into accepting the curtailment of their current affair by invoking the threat of discovery and subtly steering her towards more drastic, permanent solutions that align with his own agenda."],
        ap.beliefs = ["He believes that maintaining control and minimizing personal risk are paramount, even at the expense of Livilla's immediate desires.", "He believes that Livilla is emotionally susceptible and can be manipulated through a combination of feigned concern and veiled promises.", "He believes that escalating the situation to more extreme measures, such as permanently silencing Castor, might become a necessary step to secure his ambitions and their relationship, and he tests Livilla's readiness for such escalation."],
        ap.goals = ["Short-term Goal: To end the current risky encounter swiftly and decisively, reasserting control over the situation and Livilla's impulses.", "Medium-term Goal: To manage and control the affair, reducing personal risk while maintaining Livilla's infatuation and potential usefulness to his schemes.", "Ultimate Goal: To advance his own power and status within Roman society, potentially leveraging his relationship with Livilla to eliminate obstacles and consolidate his influence, even if it requires extreme and ruthless actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Livilla stands beside Castor\'s bed, her face pale under the dim light of an oil lamp. She appears anxious and fidgety, shifting her weight from one foot to another, nervously glancing at the sleeping figure of Castor. As Sejanus enters, she engages with him eagerly, reflecting her desperation and urgency.',
        ap.emotional_state = 'Livilla is torn between fear and longing. Outwardly, she expresses anxiety, her voice shaky as she pleads with Sejanus. Internally, there is a tumult of obsessive desire and dread, particularly at the thought of losing Sejanus forever. She grapples with the horrifying possibility of murder, revealing a deep conflict between her love for Sejanus and her duty to her husband.',
        ap.emotional_tags = ["livilla is torn between fear", "longing. outwardly, she expresses anxiety, her voice shaky as she pleads with sejanus. internally, there is a tumult of obsessive desire", "dread, particularly at the thought of losing sejanus forever. she grapples with the horrifying possibility of murder, revealing a deep conflict between her love for sejanus", "her duty to her husband.", "livilla is torn between fear and longing. outwardly", "she expresses anxiety", "her voice shaky as she pleads with sejanus. internally", "there is a tumult of obsessive desire and dread", "particularly at the thought of losing sejanus forever. she grapples with the horrifying possibility of murder", "revealing a deep conflict between her love for sejanus and her duty to her husband."],
        ap.active_plans = ["To assist Sejanus in eliminating her husband, Castor, by procuring poison.", "To maintain her illicit relationship with Sejanus while managing the dangers of their affair.", "To seek a future with Sejanus, potentially at the cost of her husband's life."],
        ap.beliefs = ["Love justifies extreme actions, including murder.", "Her relationship with Sejanus is worth any risk, including the potential consequences of her actions.", "She believes her happiness is contingent upon her union with Sejanus, even if it requires betrayal."],
        ap.goals = ["Short-term: To successfully drug Castor and secure more time with Sejanus.", "Medium-term: To obtain a stronger poison to eliminate Castor without suspicion.", "Ultimate: To marry Sejanus and escape the constraints of her current life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the dim room with an air of authority, maintaining a calm demeanor despite the gravity of the situation. He approaches Livilla, asserting his presence as she expresses distress. His movements are calculated, reflecting his ability to navigate the complexities of manipulation and desire.',
        ap.emotional_state = 'Sejanus exhibits a composed exterior, yet beneath lies a cunning ambition. He appears confident, even amused by Livilla\'s desperation. Internally, he is calculating the risks, weighing the potential rewards against the danger of exposure. His manipulation of Livilla\'s emotions reveals a darker side to his affection.',
        ap.emotional_tags = ["sejanus exhibits a composed exterior", "yet beneath lies a cunning ambition. he appears confident", "even amused by livilla's desperation. internally", "he is calculating the risks", "weighing the potential rewards against the danger of exposure. his manipulation of livilla's emotions reveals a darker side to his affection."],
        ap.active_plans = ["To persuade Livilla to commit to poisoning Castor, ensuring their affair remains hidden.", "To maintain control over the situation, guiding Livilla\u2019s decisions to eliminate any threats to their relationship.", "To secure a stronger poison that can be administered without detection, facilitating the elimination of Castor."],
        ap.beliefs = ["Manipulation is a necessary tool in the pursuit of power and desire.", "The ends justify the means, including murder, to secure personal satisfaction.", "Love can be transactional, and he must control Livilla to protect both their interests."],
        ap.goals = ["Short-term: To solidify their plan to drug Castor.", "Medium-term: To obtain a highly effective poison that can be used undetectably.", "Ultimate: To marry Livilla and eliminate all obstacles to their future together."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Livilla stands beside Castor\'s bed in the dimly lit chamber, her body still, but her mind racing. She is positioned close to the sleeping form of her husband, the deed of drugging his wine already completed.  She is actively engaged in a hushed, intense conversation with Sejanus, her whispered words betraying a mix of anxiety and desperate longing as she seeks reassurance about their future.',
        ap.emotional_state = 'Livilla is a whirlwind of conflicting emotions. On the surface, she presents an air of impatient anticipation, eager to move forward with their plans, yet beneath this veneer lies a deep well of insecurity and fear. She yearns for Sejanus\'s love and validation, desperately seeking confirmation of his commitment.  However, there\'s an undercurrent of unease as she confronts the dark implications of their actions and the potentially controlling nature of the relationship she is entering, masked by her passionate desire.',
        ap.emotional_tags = ["livilla is a whirlwind of conflicting emotions. on the surface, she presents an air of impatient anticipation, eager to move forward with their plans, yet beneath this veneer lies a deep well of insecurity", "fear. she yearns for sejanus's love", "validation, desperately seeking confirmation of his commitment.  however, there's an undercurrent of unease as she confronts the dark implications of their actions", "the potentially controlling nature of the relationship she is entering, masked by her passionate desire.", "livilla is a whirlwind of conflicting emotions. on the surface", "she presents an air of impatient anticipation", "eager to move forward with their plans", "yet beneath this veneer lies a deep well of insecurity and fear. she yearns for sejanus's love and validation", "desperately seeking confirmation of his commitment.  however", "there's an undercurrent of unease as she confronts the dark implications of their actions and the potentially controlling nature of the relationship she is entering", "masked by her passionate desire."],
        ap.active_plans = ["To confirm Sejanus's promise of marriage and a future together after Castor's death.", "To gauge the depth and sincerity of Sejanus's love for her, seeking emotional reassurance amidst the treacherous plot.", "To subtly test the boundaries of their relationship and understand the power dynamics that will define their future."],
        ap.beliefs = ["Her happiness and fulfillment are inextricably linked to a life with Sejanus.", "Securing Sejanus's commitment and love is worth the extreme risk and moral compromise of murder.", "A future with Sejanus, even if potentially volatile, is preferable to her current loveless and constrained existence."],
        ap.goals = ["Short-term Goal: To receive immediate verbal confirmation from Sejanus about their marriage plans and his feelings for her.", "Medium-term Goal: To successfully execute the plan to murder Castor and remove him as an obstacle to her relationship with Sejanus.", "Ultimate Goal: To establish a lasting and passionate union with Sejanus, achieving personal happiness and social elevation through their relationship, even if it means embracing a darker path."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the dimly lit room with a quiet confidence, his movements deliberate and controlled. He stands near Livilla, but maintains a slight distance, positioning himself as the dominant figure in the intimate space. He is actively engaging Livilla in conversation, but his words are carefully chosen, designed to manipulate and control her, subtly shifting from romantic promises to chilling assertions of power.',
        ap.emotional_state = 'Sejanus projects an outward demeanor of calm assurance and calculated desire. He speaks of love, but his tone quickly shifts to one of possessiveness and control, revealing a darker, more calculating emotional landscape. Internally, he is driven by ambition and a hunger for dominance. While he expresses affection for Livilla, it\'s intertwined with a need to exert power over her, suggesting a manipulative and potentially abusive nature beneath the surface charm. His primary emotion is a cold, strategic calculation of how to best secure his own desires and maintain control.',
        ap.emotional_tags = ["sejanus projects an outward demeanor of calm assurance", "calculated desire. he speaks of love, but his tone quickly shifts to one of possessiveness", "control, revealing a darker, more calculating emotional landscape. internally, he is driven by ambition", "a hunger for dominance. while he expresses affection for livilla, it's intertwined with a need to exert power over her, suggesting a manipulative", "potentially abusive nature beneath the surface charm. his primary emotion is a cold, strategic calculation of how to best secure his own desires", "maintain control.", "sejanus projects an outward demeanor of calm assurance and calculated desire. he speaks of love", "but his tone quickly shifts to one of possessiveness and control", "revealing a darker", "more calculating emotional landscape. internally", "he is driven by ambition and a hunger for dominance. while he expresses affection for livilla", "it's intertwined with a need to exert power over her", "suggesting a manipulative and potentially abusive nature beneath the surface charm. his primary emotion is a cold", "strategic calculation of how to best secure his own desires and maintain control.", "sejanus projects an outward demeanor of calm assurance and calculated desire. he speaks of love,", "his tone quickly shifts to one of possessiveness and control, revealing a darker, more calculating emotional landscape. internally, he is driven by ambition and a hunger for dominance. while he expresses affection for livilla, it's intertwined with a need to exert power over her, suggesting a manipulative and potentially abusive nature beneath the surface charm. his primary emotion is a cold, strategic calculation of how to best secure his own desires and maintain control."],
        ap.active_plans = ["To solidify Livilla's commitment to the plan of murdering Castor by reinforcing the promise of marriage and a future together.", "To establish his dominance in their relationship, subtly asserting control and setting the stage for a potentially tyrannical dynamic.", "To manage the immediate risk of their affair and future murder being discovered, while simultaneously indulging in a fantasy of possessive control over Livilla."],
        ap.beliefs = ["He is entitled to control and possess Livilla, viewing her as a prize to be won and dominated.", "Fear and the threat of force are effective tools for maintaining control in a relationship.", "His own desires and ambitions supersede Livilla's needs or feelings, justifying manipulative and potentially abusive behavior."],
        ap.goals = ["Short-term Goal: To ensure Livilla remains committed to murdering Castor and does not waver in her resolve.", "Medium-term Goal: To marry Livilla and leverage this union to further his political and social standing in Rome.", "Ultimate Goal: To achieve absolute power and control, both in his political life and his personal relationships, realizing a fantasy of dominance and unchallenged authority, even if it means resorting to manipulation and cruelty."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_livias_invitation_event_7_1'})
    ON CREATE SET
        oi.description = 'The scroll serves as the catalyst for the interaction among Claudius, Herod, and Castor. As Claudius presents the invitation, its formal wording reveals Livia\'s expectations and the tension inherent in their familial dynamics. The scroll symbolizes Claudius’s connection to Livia, weighing heavily on him as he contemplates the implications of attending her birthday dinner after years of estrangement. It represents both an invitation and a potential trap, illustrating the precarious balance of power in their relationship.',
        oi.status_before = 'The scroll is new, freshly delivered that morning, carrying the weight of Livia\'s authoritative tone and expectations.',
        oi.status_after = 'The scroll becomes a point of contention and concern among the characters, its physical presence in Claudius\'s hand solidifying the gravity of Livia\'s invitation and the ensuing decisions he must make about attending the dinner.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll_livias_invitation'})
    MATCH (e:Event {uuid: 'event_7_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bust_of_sejanus_event_7_3'})
    ON CREATE SET
        oi.description = 'The bust of Sejanus serves as a significant representation of the political climate in Rome and the growing influence of Sejanus himself. When Claudius inspects the bust, it symbolizes his discomfort with the court’s power dynamics and the expectations placed upon him to participate in this world. The object becomes a source of tension, as it reflects the absurdity of gifting a representation of a man who embodies the very intrigues Claudius wishes to avoid.',
        oi.status_before = 'The bust of Sejanus is readily available at a vendor\'s stall in the bustling forum, a product of popular demand as citizens and courtiers alike buy into Sejanus\'s political persona.',
        oi.status_after = 'The bust remains at the vendor\'s stall, as Claudius ultimately rejects the notion of purchasing it, indicating his internal conflict regarding the political implications of such a gift and his reluctance to engage with the expectations of his family.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bust_of_sejanus'})
    MATCH (e:Event {uuid: 'event_7_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the bustling Roman forum, his demeanor flustered as he grips a scroll tightly in his hand. His posture is slightly hunched, indicative of his internal anxiety, and his movements are quick and jittery, reflecting his nervousness before encountering Herod and Castor. As he speaks to them, his voice carries a tremor of unease, and he tries to present the scroll with a semblance of casualness, although his agitation is palpable.',
        ap.emotional_state = 'Claudius displays a mix of fear and anticipation, his outward demeanor betraying his deep-seated anxiety about being summoned by Livia after years of estrangement. The surface of his anxiety is evident in his fidgeting and stammering, while internally, he grapples with a tumultuous blend of dread and a desperate need for acceptance. Beneath his fluster lies an unspoken conflict about his family\'s dangerous legacy and his tenuous place within it.',
        ap.emotional_tags = ["claudius displays a mix of fear", "anticipation, his outward demeanor betraying his deep-seated anxiety about being summoned by livia after years of estrangement. the surface of his anxiety is evident in his fidgeting", "stammering, while internally, he grapples with a tumultuous blend of dread", "a desperate need for acceptance. beneath his fluster lies an unspoken conflict about his family's dangerous legacy", "his tenuous place within it.", "claudius displays a mix of fear and anticipation", "his outward demeanor betraying his deep-seated anxiety about being summoned by livia after years of estrangement. the surface of his anxiety is evident in his fidgeting and stammering", "while internally", "he grapples with a tumultuous blend of dread and a desperate need for acceptance. beneath his fluster lies an unspoken conflict about his family's dangerous legacy and his tenuous place within it.", "claudius displays a mix of fear and anticipation, his outward demeanor betraying his deep-seated anxiety about being summoned by livia after years of estrangement. the surface of his anxiety is evident in his fidgeting and stammering,", "internally, he grapples with a tumultuous blend of dread and a desperate need for acceptance. beneath his fluster lies an unspoken conflict about his family's dangerous legacy and his tenuous place within it."],
        ap.active_plans = ["To decipher the true meaning of Livia's invitation and understand its implications for his relationship with her.", "To procure a suitable gift for Livia's birthday dinner, hoping to appease her and perhaps gain her favor.", "To navigate the unsettling dynamics of the family gathering and mitigate his feelings of inadequacy."],
        ap.beliefs = ["He believes that familial connections, no matter how fraught, hold importance and may dictate his future.", "Claudius holds a conviction that his awkwardness and perceived weakness can still be masked by intelligence and thoughtfulness.", "He fears the unpredictable nature of Livia's power and how it shapes his fate within the Julio-Claudian dynasty."],
        ap.goals = ["Short-term: To successfully attend Livia's birthday dinner without incident.", "Medium-term: To rebuild a connection with Livia and understand the family dynamics better.", "Ultimate: To find his own place of stability and acceptance within the turbulent tides of the Roman imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Herod stands with an air of shrewdness, his posture relaxed but watchful as he observes Claudius’s flustered entrance. With a knowing smirk, he engages in light banter, gesturing animatedly while questioning Claudius. His movements are confident and purposeful, highlighting his role as the outsider offering a cynical perspective on the tensions within the imperial family.',
        ap.emotional_state = 'Herod exudes a wry amusement, clearly entertained by Claudius’s discomfort, which he finds relatable yet absurd. He possesses a surface-level charm, masking an underlying awareness of the precariousness of their political environment. His internal state reflects a mixture of empathy for Claudius\'s plight and a calculated detachment, as he leverages Claudius’s anxiety for his own amusement.',
        ap.emotional_tags = ["herod exudes a wry amusement, clearly entertained by claudius\u2019s discomfort, which he finds relatable yet absurd. he possesses a surface-level charm, masking an underlying awareness of the precariousness of their political environment. his internal state reflects a mixture of empathy for claudius's plight", "a calculated detachment, as he leverages claudius\u2019s anxiety for his own amusement.", "herod exudes a wry amusement", "clearly entertained by claudius\u2019s discomfort", "which he finds relatable yet absurd. he possesses a surface-level charm", "masking an underlying awareness of the precariousness of their political environment. his internal state reflects a mixture of empathy for claudius's plight and a calculated detachment", "as he leverages claudius\u2019s anxiety for his own amusement."],
        ap.active_plans = ["To provoke a reaction from Claudius by teasing him about his nervousness regarding Livia.", "To subtly showcase his own cleverness and pragmatism in a volatile political landscape.", "To maintain his relationship with both Claudius and Castor, ensuring he remains relevant in the court's machinations."],
        ap.beliefs = ["He believes that humor and wit are essential tools for navigating the treacherous waters of Roman politics.", "Herod is convinced that understanding the weaknesses of others provides leverage in the unpredictable court of Tiberius.", "He has a fundamental belief that loyalty is fluid and should be crafted with pragmatism, rather than blind devotion."],
        ap.goals = ["Short-term: To elicit laughter and lighten the mood in the tense atmosphere surrounding Claudius.", "Medium-term: To position himself as a trusted advisor to Claudius, maintaining his relevance in the court.", "Ultimate: To expand his own influence within the political sphere by aligning with those who hold power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Castor stands confidently beside Herod, his body language relaxed yet slightly guarded as he watches Claudius with a mix of concern and amusement. He leans against a vendor\'s stall, his posture casual as he engages in light-hearted banter with Claudius, attempting to lighten the mood while also keeping an eye on his cousin\'s emotional state.',
        ap.emotional_state = 'Castor appears outwardly nonchalant, masking a deeper concern for Claudius’s well-being. Outwardly, he projects confidence and charm, but internally, he grapples with worries about the implications of Livia\'s invitation for his family. He understands the danger that accompanies their lineage and feels a desire to protect Claudius from the burdens of their heritage.',
        ap.emotional_tags = ["castor appears outwardly nonchalant, masking a deeper concern for claudius\u2019s well-being. outwardly, he projects confidence", "charm, but internally, he grapples with worries about the implications of livia's invitation for his family. he understands the danger that accompanies their lineage", "feels a desire to protect claudius from the burdens of their heritage.", "castor appears outwardly nonchalant", "masking a deeper concern for claudius\u2019s well-being. outwardly", "he projects confidence and charm", "but internally", "he grapples with worries about the implications of livia's invitation for his family. he understands the danger that accompanies their lineage and feels a desire to protect claudius from the burdens of their heritage.", "castor appears outwardly nonchalant, masking a deeper concern for claudius\u2019s well-being. outwardly, he projects confidence and charm,", "internally, he grapples with worries about the implications of livia's invitation for his family. he understands the danger that accompanies their lineage and feels a desire to protect claudius from the burdens of their heritage."],
        ap.active_plans = ["To keep the atmosphere light and humorous in hopes of calming Claudius\u2019s nerves.", "To subtly gauge Claudius\u2019s feelings about Livia and the impending family dinner.", "To maintain a supportive presence for Claudius, as their familial ties are strained but vital."],
        ap.beliefs = ["He believes that familial loyalty should be tempered by personal safety and well-being.", "Castor holds a conviction that humor can diffuse tension and create bonds, even in the direst situations.", "He is aware that the Julio-Claudian legacy carries weight, but believes in carving one\u2019s own path despite that burden."],
        ap.goals = ["Short-term: To reassure Claudius and help him prepare for the dinner with Livia.", "Medium-term: To maintain peace within the family by fostering a supportive environment for Claudius.", "Ultimate: To navigate the treacherous waters of imperial politics while ensuring his family's survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the bustling Roman Forum in a state of agitation, clutching a scroll as if it were a venomous serpent. Upon being intercepted by Herod and Castor, he immediately thrusts the scroll towards Herod, seeking external validation and interpretation of its contents. He gestures nervously and shifts his weight as he recounts his past, humiliating encounter with Livia, his physical unease mirroring his internal turmoil.',
        ap.emotional_state = 'Claudius is visibly flustered and anxious, his surface emotions a clear display of his deep-seated unease regarding Livia\'s invitation. Beneath this outward nervousness lies a profound insecurity and fear of his grandmother, stemming from past dismissals and a general sense of being an outsider within his own family. He reveals a vulnerability and a longing for understanding, contrasting sharply with the casual indifference of Herod and Castor, highlighting his emotional isolation.',
        ap.emotional_tags = ["claudius is visibly flustered", "anxious, his surface emotions a clear display of his deep-seated unease regarding livia's invitation. beneath this outward nervousness lies a profound insecurity", "fear of his grandmother, stemming from past dismissals", "a general sense of being an outsider within his own family. he reveals a vulnerability", "a longing for understanding, contrasting sharply with the casual indifference of herod", "castor, highlighting his emotional isolation.", "claudius is visibly flustered and anxious", "his surface emotions a clear display of his deep-seated unease regarding livia's invitation. beneath this outward nervousness lies a profound insecurity and fear of his grandmother", "stemming from past dismissals and a general sense of being an outsider within his own family. he reveals a vulnerability and a longing for understanding", "contrasting sharply with the casual indifference of herod and castor", "highlighting his emotional isolation."],
        ap.active_plans = ["Decipher the true meaning and implications of Livia's unexpected invitation to dinner.", "Articulate his anxieties and seek reassurance from Herod and Castor, hoping to glean some insight or advice.", "Procure a suitable gift for Livia, viewing it as a necessary, albeit daunting, obligation to navigate this unfamiliar social summons."],
        ap.beliefs = ["Livia's intentions are likely manipulative and potentially harmful, given her history and reputation within the family.", "He is perceived as foolish and insignificant by his family, making him vulnerable in their power games.", "Social interactions with his family, especially Livia, are fraught with danger and the potential for humiliation."],
        ap.goals = ["Short-term: Find a presentable gift for Livia to fulfill the immediate social expectation of the dinner invitation.", "Medium-term: Survive the dinner with Livia without incurring her displeasure or becoming entangled in any schemes.", "Ultimate: Navigate his complex family dynamics in a way that minimizes personal risk and potentially gains a modicum of respect or acceptance, however unlikely."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Herod intercepts Claudius with an air of worldly amusement, his posture relaxed and confident in the bustling forum. He takes the scroll from Claudius and reads it aloud with a slightly theatrical flourish, injecting a hint of sarcasm into his delivery. Throughout the conversation, he maintains eye contact with both Claudius and Castor, his gestures economical and precise, reflecting his shrewd and observant nature.',
        ap.emotional_state = 'Herod projects an outward demeanor of cynical amusement and detached bemusement at Claudius\'s predicament and the Julio-Claudian family\'s eccentricities. Internally, he is likely assessing the situation with pragmatic detachment, viewing the invitation as another potential power play within the imperial family. While appearing light-hearted, his underlying emotional state is one of guarded calculation, always aware of the precariousness of his position and the potential dangers of the Roman court.',
        ap.emotional_tags = ["herod projects an outward demeanor of cynical amusement", "detached bemusement at claudius's predicament", "the julio-claudian family's eccentricities. internally, he is likely assessing the situation with pragmatic detachment, viewing the invitation as another potential power play within the imperial family. while appearing light-hearted, his underlying emotional state is one of guarded calculation, always aware of the precariousness of his position", "the potential dangers of the roman court.", "herod projects an outward demeanor of cynical amusement and detached bemusement at claudius's predicament and the julio-claudian family's eccentricities. internally", "he is likely assessing the situation with pragmatic detachment", "viewing the invitation as another potential power play within the imperial family. while appearing light-hearted", "his underlying emotional state is one of guarded calculation", "always aware of the precariousness of his position and the potential dangers of the roman court."],
        ap.active_plans = ["Gauge the level of Claudius's anxiety and apprehension regarding Livia's invitation, possibly to assess his vulnerability.", "Offer cynical but practical advice, such as bringing his own wine, to subtly highlight the potential dangers of dining with Livia.", "Maintain a detached and humorous facade to deflect from the underlying tension of the situation and assert his own pragmatic perspective."],
        ap.beliefs = ["The Julio-Claudian family is inherently chaotic and prone to dramatic, often dangerous, power struggles.", "Cynicism and pragmatism are essential tools for navigating the treacherous waters of Roman court life.", "Claudius, while perhaps intellectually capable, is emotionally naive and easily manipulated by his family."],
        ap.goals = ["Short-term: Amuse himself and Castor with Claudius's nervous reaction and witty banter.", "Medium-term: Maintain his position and influence within the Roman court by providing insightful (if cynical) observations and advice.", "Ultimate: Secure his long-term survival and prosperity by aligning himself with the most advantageous power structures while remaining detached enough to avoid being consumed by their conflicts."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Castor stands alongside Herod, intercepting Claudius in the Roman Forum, his physical presence less assertive than Herod\'s. He listens to Claudius and Herod\'s exchange, occasionally interjecting with brief comments or questions. He gestures towards a vendor suggesting a gift for Livia and later mentions feeling unwell, his movements and posture slightly subdued, reflecting his physical discomfort.',
        ap.emotional_state = 'Castor appears somewhat subdued and less overtly expressive than Herod, his emotional state colored by his admitted ill health. While participating in the light-hearted banter, there\'s a subtle undercurrent of weariness and perhaps genuine concern for Claudius, albeit masked by courtly nonchalance. Internally, he may be preoccupied with his own physical discomfort and the general anxieties of court life, making him less invested in the immediate drama of Livia\'s invitation than Herod.',
        ap.emotional_tags = ["castor appears somewhat subdued", "less overtly expressive than herod, his emotional state colored by his admitted ill health. while participating in the light-hearted banter, there's a subtle undercurrent of weariness", "perhaps genuine concern for claudius, albeit masked by courtly nonchalance. internally, he may be preoccupied with his own physical discomfort", "the general anxieties of court life, making him less invested in the immediate drama of livia's invitation than herod.", "castor appears somewhat subdued and less overtly expressive than herod", "his emotional state colored by his admitted ill health. while participating in the light-hearted banter", "there's a subtle undercurrent of weariness and perhaps genuine concern for claudius", "albeit masked by courtly nonchalance. internally", "he may be preoccupied with his own physical discomfort and the general anxieties of court life", "making him less invested in the immediate drama of livia's invitation than herod."],
        ap.active_plans = ["Observe the interaction between Claudius and Herod, gauging Claudius's reaction to the invitation and Herod's cynical advice.", "Offer a practical suggestion for a gift to Livia, attempting to move the conversation towards a less fraught topic.", "Subtly downplay his own ill health while acknowledging it, perhaps seeking a degree of sympathy or understanding without dwelling on it."],
        ap.beliefs = ["Maintaining a composed and somewhat detached demeanor is expected behavior within the imperial family and court.", "Claudius, while perhaps a 'fool' in some respects, is still family and warrants a degree of polite, if somewhat condescending, interaction.", "Personal health issues should be managed privately and not become a source of public weakness or concern."],
        ap.goals = ["Short-term: Participate in the social interaction with Claudius and Herod in a manner befitting his status, offering a helpful suggestion and light banter.", "Medium-term: Manage his health and fulfill his familial and courtly obligations without drawing undue attention to his condition.", "Ultimate: Secure his position within the imperial family and navigate the complexities of court life while maintaining a semblance of personal well-being and control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the forum looking flustered, a scroll tightly clutched in his hand. He appears frazzled, with a slight limp as he maneuvers through the bustling crowd, visibly anxious about the impending dinner with Livia. His body language is tense, as he thrusts the scroll towards Herod, gesturing emphatically while scanning the vendors.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal a mix of anxiety and nervousness, emphasizing his discomfort with familial obligations. He clings to humor as a defense mechanism, yet his internal state is fraught with dread and uncertainty, particularly at the thought of Livia\'s expectations. The contrasting panic in his tone suggests he feels overwhelmed and out of place in the court\'s absurd dynamics, revealing a hidden conflict between his desire for approval and his fear of failure.',
        ap.emotional_tags = ["claudius's surface emotions reveal a mix of anxiety", "nervousness, emphasizing his discomfort with familial obligations. he clings to humor as a defense mechanism, yet his internal state is fraught with dread", "uncertainty, particularly at the thought of livia's expectations. the contrasting panic in his tone suggests he feels overwhelmed", "out of place in the court's absurd dynamics, revealing a hidden conflict between his desire for approval", "his fear of failure.", "claudius's surface emotions reveal a mix of anxiety and nervousness", "emphasizing his discomfort with familial obligations. he clings to humor as a defense mechanism", "yet his internal state is fraught with dread and uncertainty", "particularly at the thought of livia's expectations. the contrasting panic in his tone suggests he feels overwhelmed and out of place in the court's absurd dynamics", "revealing a hidden conflict between his desire for approval and his fear of failure."],
        ap.active_plans = ["To decipher the meaning of Livia's dinner invitation and prepare himself for the encounter.", "To find a suitable gift for Livia, hoping to appease her and secure a more favorable relationship.", "To escape the conversation with Herod and Castor, seeking solace from the weight of expectations."],
        ap.beliefs = ["Believes that family connections, no matter how strained, are crucial for survival in the imperial court.", "Thinks that humor can deflect the pressure of his family\u2019s expectations.", "Feels that his awkwardness is a liability in securing his position in the family."],
        ap.goals = ["Short-term: To procure a gift for Livia that will meet her expectations and alleviate his anxiety.", "Medium-term: To establish a more direct line of communication with Livia to avoid future misunderstandings.", "Ultimate: To carve out his own identity within the Julio-Claudian family and gain respect as a member of the dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Herod stands confidently in the forum, arms crossed as he observes Claudius\'s flustered entrance. He interjects with sardonic quips, maintaining an air of detached amusement while engaging in banter with Claudius and Castor, positioning himself as a cynical observer of the unfolding drama.',
        ap.emotional_state = 'Herod\'s surface emotions are characterized by a mocking amusement, his tone dripping with cynicism as he teases Claudius. Beneath this facade, he exhibits a pragmatic understanding of the court\'s intricacies and the absurdity of familial dynamics, revealing a blend of skepticism towards the imperial family\'s antics and a sense of superiority in his own detachment from their madness.',
        ap.emotional_tags = ["herod's surface emotions are characterized by a mocking amusement, his tone dripping with cynicism as he teases claudius. beneath this facade, he exhibits a pragmatic understanding of the court's intricacies", "the absurdity of familial dynamics, revealing a blend of skepticism towards the imperial family's antics", "a sense of superiority in his own detachment from their madness.", "herod's surface emotions are characterized by a mocking amusement", "his tone dripping with cynicism as he teases claudius. beneath this facade", "he exhibits a pragmatic understanding of the court's intricacies and the absurdity of familial dynamics", "revealing a blend of skepticism towards the imperial family's antics and a sense of superiority in his own detachment from their madness."],
        ap.active_plans = ["To provide Claudius with pragmatic advice, albeit laced with sarcasm, highlighting the absurdity of his situation.", "To maintain his role as an observer, enjoying the chaos of the Julio-Claudian court without becoming embroiled in it.", "To subtly manipulate the dynamics between Claudius and Castor, while reinforcing his own position as an outsider."],
        ap.beliefs = ["Believes that the chaos of the imperial court is a reflection of the madness inherent in power.", "Thinks that keeping a distance from familial squabbles allows him to survive in the treacherous political landscape.", "Considers humor a vital tool to critique and navigate the absurdities of court life."],
        ap.goals = ["Short-term: To entertain himself by provoking Claudius and observing the reaction from Castor.", "Medium-term: To solidify his position as a reliable advisor, using his insights to navigate his own survival.", "Ultimate: To position himself as a key player in court politics while remaining a step removed from the dangers of direct involvement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Castor stands slightly apart, observing the interaction between Claudius and Herod with a mix of concern and amusement. He gestures towards a nearby vendor, attempting to guide Claudius towards selecting a gift yet also displaying signs of weariness from recent travels. His posture is somewhat relaxed yet weary.',
        ap.emotional_state = 'Castor\'s surface emotions display a blend of lightheartedness and concern for Claudius\'s well-being. While he pokes fun at Claudius\'s nervousness, internally he is aware of the pressures faced by his cousin. This creates an unspoken conflict, as he balances his familial loyalty with his own weariness from the burdens of imperial expectations.',
        ap.emotional_tags = ["castor's surface emotions display a blend of lightheartedness", "concern for claudius's well-being. while he pokes fun at claudius's nervousness, internally he is aware of the pressures faced by his cousin. this creates an unspoken conflict, as he balances his familial loyalty with his own weariness from the burdens of imperial expectations.", "castor's surface emotions display a blend of lightheartedness and concern for claudius's well-being. while he pokes fun at claudius's nervousness", "internally he is aware of the pressures faced by his cousin. this creates an unspoken conflict", "as he balances his familial loyalty with his own weariness from the burdens of imperial expectations."],
        ap.active_plans = ["To encourage Claudius to select a suitable gift for Livia, attempting to ease his cousin\u2019s anxiety.", "To maintain a light-hearted banter with Herod, reinforcing camaraderie while deflecting his own concerns.", "To subtly assess Claudius's mental state, recognizing the weight of familial expectations on him."],
        ap.beliefs = ["Believes that humor can diffuse tension and help navigate the family\u2019s complex dynamics.", "Thinks that support within the family is crucial, even if it comes in the form of teasing.", "Feels a sense of duty to protect Claudius from the harsher realities of their familial legacy."],
        ap.goals = ["Short-term: To help Claudius choose a gift that will satisfy Livia and ease his nerves.", "Medium-term: To strengthen his bond with Claudius, offering a semblance of support amidst courtly absurdities.", "Ultimate: To navigate his own role within the imperial family while ensuring that Claudius is equipped to face their tumultuous legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Centurion Varro stands authoritatively amidst a throng of Roman guards in the bustling Forum, orchestrating the forceful encirclement of Silius Caecina. He directs his soldiers with sharp, decisive gestures, ensuring a tight perimeter is established to contain the unfolding arrest. Varro\'s posture is rigid, his voice firm as he articulates the official mandate from the State Senate, asserting his position as a representative of Roman law and order.',
        ap.emotional_state = 'Varro maintains a stern and professional demeanor, betraying little emotion outwardly. Beneath this composed exterior, there\'s a palpable sense of duty and cautious pragmatism. He is focused on executing his orders efficiently, aware of the potential for public unrest or resistance, especially with Castor\'s unexpected intervention. He suppresses any personal feelings to ensure the Senate\'s decree is carried out without escalation or challenge.',
        ap.emotional_tags = ["varro maintains a stern", "professional demeanor, betraying little emotion outwardly. beneath this composed exterior, there's a palpable sense of duty", "cautious pragmatism. he is focused on executing his orders efficiently, aware of the potential for public unrest or resistance, especially with castor's unexpected intervention. he suppresses any personal feelings to ensure the senate's decree is carried out without escalation or challenge.", "varro maintains a stern and professional demeanor", "betraying little emotion outwardly. beneath this composed exterior", "there's a palpable sense of duty and cautious pragmatism. he is focused on executing his orders efficiently", "aware of the potential for public unrest or resistance", "especially with castor's unexpected intervention. he suppresses any personal feelings to ensure the senate's decree is carried out without escalation or challenge."],
        ap.active_plans = ["Execute the Senate's arrest warrant on Silius Caecina swiftly and publicly.", "Assert the authority of the State Senate over any potential interference, including from members of the imperial family.", "Maintain control of the situation in the crowded Roman Forum, preventing any public disorder or attempts to obstruct the arrest."],
        ap.beliefs = ["The State Senate's authority is paramount and must be upheld.", "Adherence to legal orders is essential for maintaining Roman stability.", "Public displays of justice, even arrests, are necessary to deter treason and maintain order."],
        ap.goals = ["short-term\": \"Successfully apprehend Silius Caecina and escort him away from the Forum without incident.", "medium-term\": \"Deliver Silius Caecina into the custody of the Senate to face impeachment proceedings.", "ultimate\": \"Reinforce the Senate's legal power and contribute to the suppression of perceived threats to Roman order and Tiberius's rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Silius Caecina finds himself abruptly surrounded by Roman guards in the vibrant Roman Forum, his daily life shattered by the sudden, forceful intervention. He stands amidst the soldiers, visibly taken aback by the public spectacle of his arrest, yet he attempts to project an air of nonchalance. He engages in a barbed exchange with Castor and Varro, verbally sparring with sarcasm and defiance even as he is physically constrained and led away.',
        ap.emotional_state = 'Initially, Silius is surprised and disbelieving, struggling to grasp the gravity of the situation as armed guards encircle him in a public space. This quickly transitions into indignation and defiance, masking an underlying current of fear and vulnerability. His sarcastic remarks about \'defamatory remarks\' are a veneer of bravado, concealing his anxiety about the serious charges of treason and the potential consequences under Tiberius\'s paranoid regime. He is fighting to maintain his dignity amidst public humiliation.',
        ap.emotional_tags = ["initially, silius is surprised", "disbelieving, struggling to grasp the gravity of the situation as armed guards encircle him in a public space. this quickly transitions into indignation", "defiance, masking an underlying current of fear", "vulnerability. his sarcastic remarks about 'defamatory remarks' are a veneer of bravado, concealing his anxiety about the serious charges of treason", "the potential consequences under tiberius's paranoid regime. he is fighting to maintain his dignity amidst public humiliation.", "initially", "silius is surprised and disbelieving", "struggling to grasp the gravity of the situation as armed guards encircle him in a public space. this quickly transitions into indignation and defiance", "masking an underlying current of fear and vulnerability. his sarcastic remarks about 'defamatory remarks' are a veneer of bravado", "concealing his anxiety about the serious charges of treason and the potential consequences under tiberius's paranoid regime. he is fighting to maintain his dignity amidst public humiliation."],
        ap.active_plans = ["Understand the precise charges against him and the authority behind his arrest.", "Attempt to publicly downplay the accusations as trivial or fabricated, maintaining a semblance of innocence.", "Seek to leverage Castor's presence to challenge the arrest or at least delay the proceedings, hoping for an intervention."],
        ap.beliefs = ["The charges of treason are likely politically motivated, stemming from his perceived opposition or Agrippina's circle.", "Public opinion and appearances matter, even in the face of state power.", "There might still be avenues to negotiate or resist his arrest, especially given the confusion and Castor's unexpected arrival."],
        ap.goals = ["short-term\": \"Delay or deflect the arrest if possible, using wit and challenging the grounds of the accusation.", "medium-term\": \"Discover the true nature and extent of the evidence against him and strategize a defense against the treason charges.", "ultimate\": \"Avoid severe punishment, maintain his reputation, and potentially navigate his way out of this perilous situation to regain his freedom and standing in Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Castor approaches the scene with an air of authority, confronting the guards who have taken Silius Caecina. He stands tall, arms crossed, his posture radiating disbelief and protectiveness, questioning the legitimacy of the situation. His eyes gleam with determination as he asserts his influence.',
        ap.emotional_state = 'Initially, Castor\'s surface emotion is one of disbelief, with his brow furrowed and voice tinged with incredulity. Internally, he feels a mix of indignation and concern for Silius, reflecting the pressure of his lineage and the expectation to defend those unjustly accused. He grapples with the weight of his position and the fear of overstepping.',
        ap.emotional_tags = ["initially, castor's surface emotion is one of disbelief, with his brow furrowed", "voice tinged with incredulity. internally, he feels a mix of indignation", "concern for silius, reflecting the pressure of his lineage", "the expectation to defend those unjustly accused. he grapples with the weight of his position", "the fear of overstepping.", "initially", "castor's surface emotion is one of disbelief", "with his brow furrowed and voice tinged with incredulity. internally", "he feels a mix of indignation and concern for silius", "reflecting the pressure of his lineage and the expectation to defend those unjustly accused. he grapples with the weight of his position and the fear of overstepping."],
        ap.active_plans = ["To assert his authority as the Emperor's son and challenge Varro's actions.", "To protect Silius Caecina from what he perceives as an unwarranted arrest.", "To gather information about the charges being leveled against Silius and the Senate's intentions."],
        ap.beliefs = ["He believes in the importance of loyalty and justice, particularly towards those close to him.", "He holds a conviction that the Senate should not overreach its authority.", "He believes that as the Emperor's son, he has a duty to protect his allies from political dangers."],
        ap.goals = ["Short-term: To intervene in the arrest and prevent Silius from being taken away.", "Medium-term: To clarify the situation and expose any political machinations behind the charges.", "Ultimate: To establish himself as a protector of the innocent and a capable leader in the eyes of the Roman populace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Varro stands with military composure, surrounded by guards as they press forward with the arrest. His posture is rigid, and his tone is unyielding, suggesting he is fully committed to executing the Senate\'s orders. He gestures confidently to the soldiers, asserting his authority.',
        ap.emotional_state = 'Varro exhibits a calm and collected exterior, with an expression that reflects the seriousness of his duty. Internally, he feels the weight of his responsibilities and the tension of being caught between the authority of the Senate and the potential backlash from the imperial family. He remains steadfast, unwilling to show vulnerability.',
        ap.emotional_tags = ["varro exhibits a calm", "collected exterior, with an expression that reflects the seriousness of his duty. internally, he feels the weight of his responsibilities", "the tension of being caught between the authority of the senate", "the potential backlash from the imperial family. he remains steadfast, unwilling to show vulnerability.", "varro exhibits a calm and collected exterior", "with an expression that reflects the seriousness of his duty. internally", "he feels the weight of his responsibilities and the tension of being caught between the authority of the senate and the potential backlash from the imperial family. he remains steadfast", "unwilling to show vulnerability."],
        ap.active_plans = ["To ensure the arrest of Silius Caecina is executed without interference.", "To assert the authority of the Senate in the face of Castor's objections.", "To maintain discipline among the guards and ensure smooth compliance with orders."],
        ap.beliefs = ["He believes in the supremacy of the Senate's authority over personal or familial ties.", "He holds that loyalty to the state is paramount, even at the cost of personal relationships.", "He believes that executing his duty is essential to maintain order and stability in Rome."],
        ap.goals = ["Short-term: To successfully arrest Silius Caecina as per the Senate's orders.", "Medium-term: To reinforce the Senate's power and authority in matters of state.", "Ultimate: To establish himself as a competent and loyal servant of the Senate, ensuring his position and influence within the military."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Silius Caecina stands at the center of the commotion, slightly restrained by the guards. He maintains a sardonic demeanor, his posture relaxed despite the seriousness of the situation. He responds to Castor and Varro with a tone of feigned innocence, shrugging off the charges against him.',
        ap.emotional_state = 'On the surface, Silius appears defiant and somewhat amused by the absurdity of his predicament, a smirk playing on his lips. Beneath this facade, he feels a sense of dread and anxiety about the implications of the charges against him and the ramifications of his past remarks about Castor\'s father. There is an undercurrent of desperation masked by his bravado.',
        ap.emotional_tags = ["on the surface, silius appears defiant", "somewhat amused by the absurdity of his predicament, a smirk playing on his lips. beneath this facade, he feels a sense of dread", "anxiety about the implications of the charges against him", "the ramifications of his past remarks about castor's father. there is an undercurrent of desperation masked by his bravado.", "on the surface", "silius appears defiant and somewhat amused by the absurdity of his predicament", "a smirk playing on his lips. beneath this facade", "he feels a sense of dread and anxiety about the implications of the charges against him and the ramifications of his past remarks about castor's father. there is an undercurrent of desperation masked by his bravado."],
        ap.active_plans = ["To downplay the significance of the accusations against him and maintain his dignity.", "To seek support from Castor in the hope of avoiding imprisonment.", "To gather information about the motivations behind his arrest, assessing the political landscape."],
        ap.beliefs = ["He believes that his past connections and friendship with Agrippina should protect him from serious consequences.", "He holds the conviction that the Senate's actions are often politically motivated rather than based on true justice.", "He believes in leveraging humor and charm to navigate tense situations."],
        ap.goals = ["Short-term: To avoid arrest and humiliation by using wit and charm.", "Medium-term: To secure an intervention from Castor to reverse the Senate's decision.", "Ultimate: To restore his standing within the court and avoid becoming another victim of the political machinations of the Senate."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_libation_event_9_1'})
    ON CREATE SET
        oi.description = 'The libation, likely wine or oil, is the physical manifestation of Tiberius\'s prayer. He reverently pours it at the base of the statue of Augustus as an offering, a symbolic gesture of seeking divine favor and guidance. This act is central to the event, illustrating Tiberius\'s attempt to connect with the divine and legitimize his rule through traditional Roman religious practice. However, it also becomes a point of contention when Agrippina accuses him of hypocrisy, contrasting his outward piety with his perceived unjust actions.',
        oi.status_before = 'The libation is prepared and contained, ready to be offered. It is intended to be a pure and respectful offering, signifying devotion and supplication.',
        oi.status_after = 'The libation has been poured out, completing the ritual act of offering. It is now presented to the statue of Augustus, having served its purpose in Tiberius\'s prayer for guidance and peace, though its sincerity is immediately challenged by Agrippina\'s entrance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_libation'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_of_augustus_event_9_1'})
    ON CREATE SET
        oi.description = 'The statue of Augustus dominates Tiberius\'s private temple, serving as the focal point of his prayer and the recipient of the libation. It embodies the deified first Emperor, representing the legitimacy and divine mandate Tiberius seeks to invoke. Tiberius kneels before it, addressing it directly as he voices his pleas for guidance and peace. The statue acts as a silent witness to Tiberius\'s vulnerability and internal turmoil, and its imposing presence underscores the weight of Augustus\'s legacy and the expectations placed upon Tiberius as his successor. It becomes a backdrop against which the confrontation with Agrippina unfolds, highlighting the contrast between Tiberius\'s public piety and the accusations of hypocrisy.',
        oi.status_before = 'The statue stands in its place within Tiberius\'s private temple, an enduring symbol of Roman imperial power and deified authority, revered and respected.',
        oi.status_after = 'The statue remains unchanged physically, continuing to stand as a symbol of Augustus and Roman imperial power. However, its symbolic significance is enriched by the event; it has now witnessed Tiberius\'s private supplication and the subsequent challenge to his piety, becoming a silent observer to the complex dynamics of power, faith, and familial conflict within the Julio-Claudian dynasty.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_of_augustus'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Kneeling before the imposing statue of Augustus, Tiberius pours a libation, his movements slow and deliberate. He speaks in hushed tones, addressing the statue and the spirit of Augustus, seeking solace and guidance. As Agrippina enters, he rises abruptly, his posture shifting from supplication to a rigid defensiveness, ready to confront the challenge to his authority.',
        ap.emotional_state = 'Initially, Tiberius is steeped in weariness and internal conflict, his prayer revealing a deep longing for peace and a release from the \'dark shadows of his soul\'. However, Agrippina\'s accusations ignite a defensive anger within him. He outwardly projects imperial authority, hardening his expression and tone, yet beneath this facade, a palpable paranoia and guilt simmer, fueled by the accusations of hypocrisy and persecution.',
        ap.emotional_tags = ["initially, tiberius is steeped in weariness", "internal conflict, his prayer revealing a deep longing for peace", "a release from the 'dark shadows of his soul'. however, agrippina's accusations ignite a defensive anger within him. he outwardly projects imperial authority, hardening his expression", "tone, yet beneath this facade, a palpable paranoia", "guilt simmer, fueled by the accusations of hypocrisy", "persecution.", "initially", "tiberius is steeped in weariness and internal conflict", "his prayer revealing a deep longing for peace and a release from the 'dark shadows of his soul'. however", "agrippina's accusations ignite a defensive anger within him. he outwardly projects imperial authority", "hardening his expression and tone", "yet beneath this facade", "a palpable paranoia and guilt simmer", "fueled by the accusations of hypocrisy and persecution."],
        ap.active_plans = ["To seek divine guidance and peace from Augustus through prayer and ritualistic offering.", "To assert his authority and imperial status in the face of Agrippina's confrontational accusations.", "To justify his actions and policies, particularly regarding the persecution of those close to Agrippina, by framing them as necessary for state security."],
        ap.beliefs = ["He believes in the divine power of Augustus and the necessity of seeking his favor for successful rule.", "He believes that challenges to the Emperor's authority, even through 'utterances', directly threaten the stability of the Roman state.", "He believes Agrippina is a potential political threat due to her lineage and popularity, and that her ambition must be contained."],
        ap.goals = ["**Short-term:** To find inner peace and alleviate his weariness through spiritual supplication.", "**Medium-term:** To maintain his rule and quell any perceived threats to his authority, including Agrippina and her circle.", "**Ultimate:** To be seen as a worthy and wise ruler, despite his internal struggles and the shadows of his past, and to secure his legacy as a capable Emperor of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Agrippina enters the private temple with fierce determination, her posture assertive and confrontational. She stands defiantly before Tiberius, gesturing emphatically as she accuses him of hypocrisy, her voice cutting through the solemn atmosphere of the temple.',
        ap.emotional_state = 'Agrippina exudes a mix of fury and weariness. On the surface, her anger is palpable, her brow furrowed and voice raised. Yet beneath this rage lies a deep-seated exhaustion, a longing for peace and acknowledgment amidst her familial strife, revealing her as both a passionate advocate and a weary victim of the imperial machinations.',
        ap.emotional_tags = ["agrippina exudes a mix of fury", "weariness. on the surface, her anger is palpable, her brow furrowed", "voice raised. yet beneath this rage lies a deep-seated exhaustion, a longing for peace", "acknowledgment amidst her familial strife, revealing her as both a passionate advocate", "a weary victim of the imperial machinations.", "agrippina exudes a mix of fury and weariness. on the surface", "her anger is palpable", "her brow furrowed and voice raised. yet beneath this rage lies a deep-seated exhaustion", "a longing for peace and acknowledgment amidst her familial strife", "revealing her as both a passionate advocate and a weary victim of the imperial machinations."],
        ap.active_plans = ["Challenge Tiberius on his treatment of her friends and family.", "Articulate her grievances against the Emperor to hold him accountable.", "Seek a dialogue that might lead to a better understanding of her position and desires."],
        ap.beliefs = ["Power should be wielded with fairness and consideration for the innocent.", "She believes her family's suffering under Tiberius's rule is unjust and must be confronted.", "Friendship and loyalty should not lead to persecution but rather to shared strength."],
        ap.goals = ["Short-term: Confront Tiberius about the persecution of her friends.", "Medium-term: Secure safety and justice for her allies and family members.", "Ultimate: Establish a more equitable rule that respects the legacy of Augustus and protects her children."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius, initially kneeling before the statue of Augustus, rises to meet Agrippina\'s accusations with a hardened gaze. His body tenses, and he adopts a defensive posture, signaling his unwillingness to yield to her confrontational approach.',
        ap.emotional_state = 'Tiberius vacillates between weariness and irritation. Outwardly, he projects authority and resolve, but beneath this veneer lies a tumultuous mix of guilt, paranoia, and defensiveness. His concern about being perceived as persecuting his own family reveals a deep internal conflict, highlighting his struggle with the burdens of rulership and familial expectations.',
        ap.emotional_tags = ["tiberius vacillates between weariness", "irritation. outwardly, he projects authority", "resolve, but beneath this veneer lies a tumultuous mix of guilt, paranoia,", "defensiveness. his concern about being perceived as persecuting his own family reveals a deep internal conflict, highlighting his struggle with the burdens of rulership", "familial expectations.", "tiberius vacillates between weariness and irritation. outwardly", "he projects authority and resolve", "but beneath this veneer lies a tumultuous mix of guilt", "paranoia", "and defensiveness. his concern about being perceived as persecuting his own family reveals a deep internal conflict", "highlighting his struggle with the burdens of rulership and familial expectations.", "tiberius vacillates between weariness and irritation. outwardly, he projects authority and resolve,", "beneath this veneer lies a tumultuous mix of guilt, paranoia, and defensiveness. his concern about being perceived as persecuting his own family reveals a deep internal conflict, highlighting his struggle with the burdens of rulership and familial expectations."],
        ap.active_plans = ["Defend his actions against Agrippina's accusations.", "Justify the necessity of his decisions as Emperor in the interest of state stability.", "Maintain control over the narrative regarding his treatment of Agrippina and her associates."],
        ap.beliefs = ["The actions he takes, no matter how harsh, are justified for the stability of the empire.", "He believes that his authority as Emperor must be defended against perceived threats.", "He holds that the legacy of Augustus must be upheld, even if that means making difficult decisions."],
        ap.goals = ["Short-term: Dispel Agrippina's accusations and assert his authority.", "Medium-term: Reinforce his position and actions to maintain imperial stability.", "Ultimate: Secure his legacy as a ruler who upheld Augustus\u2019s ideals, even amidst personal turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius, initially kneeling in devout supplication before the statue of Augustus, rises to his feet as Agrippina enters. He shifts from a posture of humility to one of imperial rigidity, his body language becoming defensive. He stands tall, attempting to assert authority through his physical presence, though his face remains etched with the weariness that preceded Agrippina\'s arrival.',
        ap.emotional_state = 'Beneath a veneer of imperial composure, Tiberius is a cauldron of conflicting emotions. Outwardly, he projects irritation and hardened resolve, his voice taking on an edge of defensiveness as he parries Agrippina’s accusations. Internally, however, he is wrestling with deep-seated paranoia and guilt. His justifications for persecutions betray a man attempting to rationalize his own cruelty, revealing a profound insecurity masked by autocratic pronouncements. The weariness from his opening prayer lingers, suggesting a soul burdened by the weight of his own actions and the isolation of power.',
        ap.emotional_tags = ["beneath a veneer of imperial composure, tiberius is a cauldron of conflicting emotions. outwardly, he projects irritation", "hardened resolve, his voice taking on an edge of defensiveness as he parries agrippina\u2019s accusations. internally, however, he is wrestling with deep-seated paranoia", "guilt. his justifications for persecutions betray a man attempting to rationalize his own cruelty, revealing a profound insecurity masked by autocratic pronouncements. the weariness from his opening prayer lingers, suggesting a soul burdened by the weight of his own actions", "the isolation of power.", "beneath a veneer of imperial composure", "tiberius is a cauldron of conflicting emotions. outwardly", "he projects irritation and hardened resolve", "his voice taking on an edge of defensiveness as he parries agrippina\u2019s accusations. internally", "however", "he is wrestling with deep-seated paranoia and guilt. his justifications for persecutions betray a man attempting to rationalize his own cruelty", "revealing a profound insecurity masked by autocratic pronouncements. the weariness from his opening prayer lingers", "suggesting a soul burdened by the weight of his own actions and the isolation of power."],
        ap.active_plans = ["To reassert his imperial authority in the face of Agrippina's challenge.", "To justify his actions, particularly the persecutions, as necessary for the stability of the state and in line with Augustan precedent.", "To deflect Agrippina\u2019s accusations by questioning her motives and subtly suggesting her own potential for ambition, thus shifting the focus away from his own culpability."],
        ap.beliefs = ["Maintaining imperial authority and the stability of the state justifies harsh measures and the persecution of perceived threats.", "Criticism of the Emperor, regardless of its source or validity, is inherently treasonous and undermines the foundations of Roman power.", "He is a legitimate and wise ruler, burdened by the necessities of governance, and his actions, while perhaps severe, are ultimately for the greater good of Rome."],
        ap.goals = ["Short-term: To silence Agrippina's accusations and end the confrontation swiftly and decisively, reaffirming his dominance.", "Medium-term: To rationalize his actions and alleviate his own internal conflict by convincing himself and Agrippina of their necessity and legitimacy.", "Ultimate: To secure his legacy as a strong and effective ruler, even if it requires resorting to cruelty and isolating himself from genuine human connection and familial warmth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Agrippina bursts into Tiberius\'s private temple, her entrance marked by fierce determination and righteous anger. She stands directly before Tiberius, her posture confrontational, eyes blazing with indignation. Her movements are sharp and purposeful as she gestures emphatically while delivering her scathing accusations, making no attempt to soften her stance or temper her words in the Emperor’s presence.',
        ap.emotional_state = 'Agrippina is consumed by righteous fury, her surface emotions dominated by outrage and a profound sense of injustice. Her tone is accusatory and scornful, reflecting her disgust at Tiberius\'s hypocrisy and cruelty. Beneath this fiery exterior, however, lies a deep well of weariness and grief, stemming from the loss of Germanicus and the relentless persecutions she has witnessed. There\'s a palpable tension between her anger and a suppressed longing for peace, hinting at a spirit worn down by constant conflict but still fiercely protective of her principles and loved ones.',
        ap.emotional_tags = ["agrippina is consumed by righteous fury, her surface emotions dominated by outrage", "a profound sense of injustice. her tone is accusatory", "scornful, reflecting her disgust at tiberius's hypocrisy", "cruelty. beneath this fiery exterior, however, lies a deep well of weariness", "grief, stemming from the loss of germanicus", "the relentless persecutions she has witnessed. there's a palpable tension between her anger", "a suppressed longing for peace, hinting at a spirit worn down by constant conflict but still fiercely protective of her principles", "loved ones.", "agrippina is consumed by righteous fury", "her surface emotions dominated by outrage and a profound sense of injustice. her tone is accusatory and scornful", "reflecting her disgust at tiberius's hypocrisy and cruelty. beneath this fiery exterior", "however", "lies a deep well of weariness and grief", "stemming from the loss of germanicus and the relentless persecutions she has witnessed. there's a palpable tension between her anger and a suppressed longing for peace", "hinting at a spirit worn down by constant conflict but still fiercely protective of her principles and loved ones.", "agrippina is consumed by righteous fury, her surface emotions dominated by outrage and a profound sense of injustice. her tone is accusatory and scornful, reflecting her disgust at tiberius's hypocrisy and cruelty. beneath this fiery exterior, however, lies a deep well of weariness and grief, stemming from the loss of germanicus and the relentless persecutions she has witnessed. there's a palpable tension between her anger and a suppressed longing for peace, hinting at a spirit worn down by constant conflict", "still fiercely protective of her principles and loved ones."],
        ap.active_plans = ["To directly confront Tiberius with his hypocrisy and the cruelty of his actions, specifically citing the cases of Lollia and Silius Caecina.", "To challenge Tiberius's justifications for his persecutions, exposing them as personal vendettas rather than legitimate acts of statecraft.", "To appeal to Tiberius's humanity, however buried it may be, by expressing her weariness and pleading for him to be kind to her children, attempting a shift from confrontation to a more conciliatory approach."],
        ap.beliefs = ["Tiberius's actions are a betrayal of Augustus's legacy and principles of just rule, rendering his piety hypocritical.", "The persecutions are driven by Tiberius's personal paranoia and cruelty, not by genuine concerns for state security or justice.", "Family and friendship are sacred bonds that should be protected, not punished, and that her loyalty to these values is morally superior to Tiberius's political machinations."],
        ap.goals = ["Short-term: To make Tiberius acknowledge the injustice of his actions and the suffering he has inflicted upon her friends and loved ones, forcing him to confront his own cruelty.", "Medium-term: To halt the ongoing persecutions, secure the release of Silius Caecina, and ensure the safety and well-being of her remaining friends and her children.", "Ultimate: To restore some semblance of justice and morality to the Julio-Claudian court, even if it means risking her own safety and challenging the Emperor directly, hoping for a future where compassion and reason prevail over fear and tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands fiercely in the temple, her posture tense yet resolute as she confronts Tiberius. Her gestures are animated, punctuating her words as she accuses him, revealing a warrior spirit masked beneath her weariness.',
        ap.emotional_state = 'On the surface, Agrippina radiates anger and defiance, her fierce expression a testament to her unyielding spirit. Beneath this exterior, however, lies a profound fatigue and disillusionment stemming from the loss of her brother, Germanicus, and the burdens of her legacy. Her plea reveals a vulnerability that contrasts sharply with her initial accusations.',
        ap.emotional_tags = ["on the surface, agrippina radiates anger", "defiance, her fierce expression a testament to her unyielding spirit. beneath this exterior, however, lies a profound fatigue", "disillusionment stemming from the loss of her brother, germanicus,", "the burdens of her legacy. her plea reveals a vulnerability that contrasts sharply with her initial accusations.", "on the surface", "agrippina radiates anger and defiance", "her fierce expression a testament to her unyielding spirit. beneath this exterior", "however", "lies a profound fatigue and disillusionment stemming from the loss of her brother", "germanicus", "and the burdens of her legacy. her plea reveals a vulnerability that contrasts sharply with her initial accusations."],
        ap.active_plans = ["To confront Tiberius about his persecution of her friends and family.", "To defend Lollia's dignity and lament her tragic fate.", "To forge a connection with Tiberius by revealing her own exhaustion and desire for peace."],
        ap.beliefs = ["Friendship and loyalty should not be punished by the ruling authority.", "The legacy of Augustus should be honored through justice rather than tyranny.", "The personal cost of ambition and power is too high and must be acknowledged."],
        ap.goals = ["Short-term: To make Tiberius aware of the emotional and political damage his actions have caused.", "Medium-term: To protect her children from the dangers of imperial politics.", "Ultimate: To foster a more just and humane rule in Rome, free from the shadows of ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly before the statue of Augustus, a posture of weariness layered with defensive authority. His movements are deliberate and measured as he shifts from kneeling to confronting Agrippina, his expression hardening under her accusations.',
        ap.emotional_state = 'Tiberius displays an initial veneer of authority and defensiveness, his hardened gaze reflecting a deep-seated paranoia. However, beneath this façade lies weariness and vulnerability, as he grapples with the weight of his choices and the ghosts of his lineage, feeling both threatened and guilty at the same time.',
        ap.emotional_tags = ["tiberius displays an initial veneer of authority", "defensiveness, his hardened gaze reflecting a deep-seated paranoia. however, beneath this fa\u00e7ade lies weariness", "vulnerability, as he grapples with the weight of his choices", "the ghosts of his lineage, feeling both threatened", "guilty at the same time.", "tiberius displays an initial veneer of authority and defensiveness", "his hardened gaze reflecting a deep-seated paranoia. however", "beneath this fa\u00e7ade lies weariness and vulnerability", "as he grapples with the weight of his choices and the ghosts of his lineage", "feeling both threatened and guilty at the same time."],
        ap.active_plans = ["To assert his authority in response to Agrippina's accusations.", "To justify his actions regarding the arrests and persecutions as necessary for state stability.", "To maintain control over the narrative surrounding his rule and the legacy of Augustus."],
        ap.beliefs = ["Power must sometimes be wielded harshly to maintain order and stability.", "The legacy of Augustus is paramount and must be protected at all costs.", "His actions, although harsh, are justified in the name of safeguarding the empire."],
        ap.goals = ["Short-term: To quell Agrippina's dissent and reassert his dominance.", "Medium-term: To navigate the treacherous waters of familial and political loyalty without losing control.", "Ultimate: To secure his legacy as a ruler who upheld the principles of Augustus amidst a backdrop of treachery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius begins the scene kneeling in quiet supplication before the statue of Augustus, head bowed in prayer and offering a libation. Upon Agrippina\'s fierce entrance, he swiftly rises to his feet, abandoning his posture of piety for one of imperial defensiveness. He stands tall, attempting to reassert his authority through physical presence and verbal command, meeting Agrippina\'s accusations with a hardening gaze and voice.',
        ap.emotional_state = 'Initially, Tiberius is steeped in weariness and a longing for inner peace, evident in his prayer for solace and guidance. However, Agrippina\'s accusations immediately ignite a defensive posture, revealing underlying paranoia and resentment. He outwardly projects an image of controlled authority, yet beneath the surface simmers a complex mix of guilt, insecurity, and lingering bitterness over past conflicts, particularly regarding Piso. He is emotionally guarded, unwilling to show vulnerability or admit fault.',
        ap.emotional_tags = ["initially, tiberius is steeped in weariness", "a longing for inner peace, evident in his prayer for solace", "guidance. however, agrippina's accusations immediately ignite a defensive posture, revealing underlying paranoia", "resentment. he outwardly projects an image of controlled authority, yet beneath the surface simmers a complex mix of guilt, insecurity,", "lingering bitterness over past conflicts, particularly regarding piso. he is emotionally guarded, unwilling to show vulnerability or admit fault.", "initially", "tiberius is steeped in weariness and a longing for inner peace", "evident in his prayer for solace and guidance. however", "agrippina's accusations immediately ignite a defensive posture", "revealing underlying paranoia and resentment. he outwardly projects an image of controlled authority", "yet beneath the surface simmers a complex mix of guilt", "insecurity", "and lingering bitterness over past conflicts", "particularly regarding piso. he is emotionally guarded", "unwilling to show vulnerability or admit fault."],
        ap.active_plans = ["Defend his imperial actions and authority against Agrippina's direct accusations of hypocrisy and persecution.", "Reassert his dominance in the conversation by shifting blame back onto Agrippina and her perceived ambitions.", "Offer a carefully worded, conditional assurance about Agrippina's children to attempt de-escalation without genuine reconciliation."],
        ap.beliefs = ["He believes in the necessity of maintaining imperial authority at all costs, even if it requires harsh measures and perceived injustices.", "He believes that any criticism of the Emperor equates to an attack on the stability of the Roman state.", "He believes Agrippina, despite her denials, harbors ambitions for power and influence that threaten his own position."],
        ap.goals = ["Short-term: To silence Agrippina's accusations and regain control of the immediate situation in his private temple.", "Medium-term: To reinforce his image as a firm, albeit burdened, ruler who is acting in the best interests of Rome, despite Agrippina's dissent.", "Ultimate: To secure his legacy as a strong emperor, even if it means remaining emotionally isolated and distrustful, perpetually haunted by past decisions and conflicts."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Agrippina bursts into Tiberius\'s private temple, disrupting his solitary prayer with a forceful and accusatory entrance. She stands directly before him, posture erect and unwavering, her presence filling the space with righteous indignation. Her actions are confrontational and immediate, moving directly to challenge Tiberius\'s hypocrisy and perceived cruelty. She uses strong, declarative language and pointed examples of his actions against her and her allies, demanding accountability.',
        ap.emotional_state = 'Agrippina is consumed by a fierce and righteous anger, fueled by the perceived injustices against her friends and family, most recently the tragic fate of Lollia. Her surface emotion is one of unbridled fury and moral outrage, directly confronting Tiberius with accusations of hypocrisy and persecution. Yet, beneath this anger, there\'s a palpable weariness and grief, hinted at when she speaks of being lost since Germanicus\'s death. She oscillates between aggressive accusation and a plea for peace and consideration, revealing a complex emotional state beyond simple rage.',
        ap.emotional_tags = ["agrippina is consumed by a fierce", "righteous anger, fueled by the perceived injustices against her friends", "family, most recently the tragic fate of lollia. her surface emotion is one of unbridled fury", "moral outrage, directly confronting tiberius with accusations of hypocrisy", "persecution. yet, beneath this anger, there's a palpable weariness", "grief, hinted at when she speaks of being lost since germanicus's death. she oscillates between aggressive accusation", "a plea for peace", "consideration, revealing a complex emotional state beyond simple rage.", "agrippina is consumed by a fierce and righteous anger", "fueled by the perceived injustices against her friends and family", "most recently the tragic fate of lollia. her surface emotion is one of unbridled fury and moral outrage", "directly confronting tiberius with accusations of hypocrisy and persecution. yet", "beneath this anger", "there's a palpable weariness and grief", "hinted at when she speaks of being lost since germanicus's death. she oscillates between aggressive accusation and a plea for peace and consideration", "revealing a complex emotional state beyond simple rage."],
        ap.active_plans = ["To directly confront Tiberius about his perceived persecution of her and her circle, demanding he acknowledge the cruelty of his actions.", "To expose Tiberius's hypocrisy by contrasting his public piety towards Augustus with his private acts of cruelty against Augustus's descendants.", "To appeal to Tiberius's paternal instincts, or at least his sense of political pragmatism, by requesting kindness and consideration for her children, Nero and Drusus."],
        ap.beliefs = ["She believes Tiberius is acting out of personal malice and paranoia, unjustly targeting her and her friends based on unfounded suspicions.", "She believes in the moral authority of Augustus's lineage and feels entitled to protection and respect as his granddaughter.", "She believes that true strength lies not in tyrannical oppression but in just and compassionate rule, ideals she feels Tiberius has abandoned."],
        ap.goals = ["Short-term: To vent her pent-up anger and frustration directly to Tiberius, forcing him to hear and acknowledge her grievances.", "Medium-term: To secure a promise of better treatment and safety for her sons, Nero and Drusus, shielding them from Tiberius's potential cruelty.", "Ultimate: To achieve a measure of peace and security for herself and her family within the dangerous political landscape of Rome, even if it requires a fragile and uneasy truce with Tiberius."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_indian_vase_event_10_1'})
    ON CREATE SET
        oi.description = 'The Indian vase, presented by Claudius as a birthday gift to Livia, serves as a focal point of tension and manipulation. Livia\'s immediate assessment of its value illustrates her pragmatic nature, viewing the vase not as a sentimental offering, but as a bargaining chip in the dynamics of power.',
        oi.status_before = 'The vase is in pristine condition and holds significant symbolic weight as Claudius\'s attempt to bridge familial distance, emblematic of his hope for approval from Livia.',
        oi.status_after = 'The vase, after being presented, remains a mere decorative object but is now intertwined with the underlying complexities of familial relationships, serving as a reminder of the transactional nature of their interactions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_indian_vase'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sibylline_scroll_event_10_7'})
    ON CREATE SET
        oi.description = 'The Sibylline scroll is presented by Livia to Claudius as a gift containing prophetic verses about his future as Emperor. This act serves as a pivotal moment in the manipulation of Claudius, intertwining themes of fate and ambition. The scroll\'s revelation hints at Livia\'s desire to secure her legacy through Claudius, while also igniting Claudius\'s curiosity about his own destiny within the treacherous political landscape.',
        oi.status_before = 'The scroll exists as a collection of rejected Sibylline verses, unacknowledged and hidden from public view, embodying the potential for prophecy and power.',
        oi.status_after = 'After the event, the scroll is handed to Claudius, signifying a shift in its status from ignored artifact to a crucial element of Claudius\'s future ambitions and Livia\'s schemes, now firmly in his possession.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sibylline_scroll'})
    MATCH (e:Event {uuid: 'event_10_7'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nervously before Livia, clutching the Indian vase with a slight tremble, his posture awkward as he attempts to present it as a gift. His movements are hesitant, reflecting his discomfort in the opulent yet oppressive atmosphere of the banquet hall.',
        ap.emotional_state = 'Claudius exhibits surface-level anxiety, evidenced by his stammer and fidgeting. Beneath this facade lies a deeper turmoil of familial tension and fear of Livia\'s manipulative nature, as he grapples with the weight of his heritage and his role within the dangerous dynamics of the court.',
        ap.emotional_tags = ["claudius exhibits surface-level anxiety, evidenced by his stammer", "fidgeting. beneath this facade lies a deeper turmoil of familial tension", "fear of livia's manipulative nature, as he grapples with the weight of his heritage", "his role within the dangerous dynamics of the court.", "claudius exhibits surface-level anxiety", "evidenced by his stammer and fidgeting. beneath this facade lies a deeper turmoil of familial tension and fear of livia's manipulative nature", "as he grapples with the weight of his heritage and his role within the dangerous dynamics of the court."],
        ap.active_plans = ["To wish Livia a happy birthday and present her with the vase as a gesture of goodwill.", "To navigate the treacherous waters of familial politics while attempting to establish a connection with Livia.", "To subtly glean information about the true nature of Livia's ambitions and the implications for his own standing within the family."],
        ap.beliefs = ["Family loyalty is paramount, even if it comes at a personal cost.", "The world of power is fraught with danger, requiring careful navigation to avoid being a pawn.", "His intelligence and understanding of history can shield him from the more brutal tactics employed by his relatives."],
        ap.goals = ["Short-term: To successfully present the gift without drawing negative attention.", "Medium-term: To secure a degree of favor and protection from Livia amidst the political turmoil.", "Ultimate: To uncover the truth about his family's past and his own potential role in the future of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Livia sits imperiously at the head of the table, her posture regal yet threateningly authoritative. She regards Claudius with a keen gaze, evaluating the vase\'s worth with an air of calculated indifference, her gestures deliberate as she invites him to sit.',
        ap.emotional_state = 'Livia\'s surface demeanor appears calm and composed, but internally, she harbors a simmering ambition and a relentless need for control. Her dismissive comments reveal her contempt for weakness and her ruthless pragmatism regarding familial bonds and loyalty.',
        ap.emotional_tags = ["livia's surface demeanor appears calm", "composed, but internally, she harbors a simmering ambition", "a relentless need for control. her dismissive comments reveal her contempt for weakness", "her ruthless pragmatism regarding familial bonds", "loyalty.", "livia's surface demeanor appears calm and composed", "but internally", "she harbors a simmering ambition and a relentless need for control. her dismissive comments reveal her contempt for weakness and her ruthless pragmatism regarding familial bonds and loyalty.", "livia's surface demeanor appears calm and composed,", "internally, she harbors a simmering ambition and a relentless need for control. her dismissive comments reveal her contempt for weakness and her ruthless pragmatism regarding familial bonds and loyalty."],
        ap.active_plans = ["To maintain her power and influence over the family dynamics at the banquet.", "To manipulate Claudius's gesture into a reminder of her authority and the fragility of their familial ties.", "To secure her legacy and desired elevation to goddess status through strategic relationships and threats."],
        ap.beliefs = ["Ambition justifies any means, including betrayal of family.", "Her power is inherently tied to her ability to control perceptions within the court.", "The gods reward those who assert their will over others, and she aims to become one."],
        ap.goals = ["Short-term: To assert dominance over Claudius and control the narrative surrounding her birthday.", "Medium-term: To position herself favorably with Caligula to ensure her eventual deification.", "Ultimate: To solidify her legacy as a goddess and escape the torment of mortal consequence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Caligula lurks nearby, his posture relaxed but predatory, an unsettling grin playing on his lips as he observes the interactions. His presence is marked by an air of menace, as he revels in the tension unfolding between Claudius and Livia.',
        ap.emotional_state = 'Caligula exhibits a facade of playful amusement, yet beneath lies a darker current of sadistic pleasure derived from manipulating the anxieties of his relatives. He relishes the chaos of familial power struggles, viewing them as a game to dominate.',
        ap.emotional_tags = ["caligula exhibits a facade of playful amusement", "yet beneath lies a darker current of sadistic pleasure derived from manipulating the anxieties of his relatives. he relishes the chaos of familial power struggles", "viewing them as a game to dominate."],
        ap.active_plans = ["To undermine Claudius's confidence with mocking remarks about his gift.", "To ingratiate himself with Livia, positioning himself as a favored heir.", "To observe and exploit any weaknesses in Claudius and Livia's relationship for his future advantage."],
        ap.beliefs = ["Power is a game best played with cunning and cruelty.", "Weakness in others is an opportunity to assert dominance.", "The chaos of court life is an arena where he can thrive and ultimately become Emperor."],
        ap.goals = ["Short-term: To create discord and amusement at Claudius's expense.", "Medium-term: To solidify his position as a favored successor to Tiberius.", "Ultimate: To seize the throne and rule with unchecked tyranny, fulfilling his dark aspirations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Empress Livia, regal and ancient, presides over her birthday banquet, seated at the head of the opulent table. She engages Claudius and Thrasyllus with sharp, dismissive pronouncements, her posture unwavering as she orchestrates the conversation around her horoscope and mortality. Her gestures are minimal yet commanding, each word delivered with the weight of imperial authority.',
        ap.emotional_state = 'Livia exudes an air of icy detachment, masking any vulnerability with cynical amusement. Outwardly, she appears to revel in her control, mocking Tiberius\'s anxieties and Thrasyllus\'s nervousness with biting wit. Beneath the surface, however, lies a profound ambition for deification and a deep-seated fear of oblivion, driving her pronouncements about her impending death and her relentless pursuit of godhood. There\'s a subtle tension between her proclaimed acceptance of death and her desperate desire to transcend it.',
        ap.emotional_tags = ["livia exudes an air of icy detachment, masking any vulnerability with cynical amusement. outwardly, she appears to revel in her control, mocking tiberius's anxieties", "thrasyllus's nervousness with biting wit. beneath the surface, however, lies a profound ambition for deification", "a deep-seated fear of oblivion, driving her pronouncements about her impending death", "her relentless pursuit of godhood. there's a subtle tension between her proclaimed acceptance of death", "her desperate desire to transcend it.", "livia exudes an air of icy detachment", "masking any vulnerability with cynical amusement. outwardly", "she appears to revel in her control", "mocking tiberius's anxieties and thrasyllus's nervousness with biting wit. beneath the surface", "however", "lies a profound ambition for deification and a deep-seated fear of oblivion", "driving her pronouncements about her impending death and her relentless pursuit of godhood. there's a subtle tension between her proclaimed acceptance of death and her desperate desire to transcend it."],
        ap.active_plans = ["To assert her intellectual dominance and control over the narrative of her life and death.", "To manipulate Claudius by revealing her 'impending demise' and gauging his reaction to her ambition of becoming a goddess.", "To subtly remind everyone present of her power and influence, even as she speaks of her mortality, ensuring her legacy remains central to the court's discourse."],
        ap.beliefs = ["Astrologers are inherently deceptive but can be exploited for political and personal gain.", "Control over information and perception is paramount to maintaining power and influence.", "She is an exceptional figure who has shaped the Roman Empire and deserves divine recognition for her contributions, seeing deification as a logical extension of her earthly power."],
        ap.goals = ["short_term\": \"To dominate the birthday banquet conversation and enjoy the spectacle of her own influence.", "medium_term\": \"To secure Claudius's promise to support her deification after her death, ensuring her post-mortem legacy.", "ultimate\": \"To achieve immortality and escape the dreaded eternal torment, becoming a goddess to transcend human limitations and punishments."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus hovers nervously in the background, his posture suggesting unease and deference. He presents Livia with her horoscope, a gift from Tiberius, his movements hesitant and his voice trembling slightly as he attempts to reassure the Empress. He avoids direct eye contact, his presence shrinking under Livia\'s piercing gaze and sharp pronouncements.',
        ap.emotional_state = 'Thrasyllus is visibly anxious and insecure, desperately seeking Livia\'s approval while fearing her sharp tongue and unpredictable reactions. He is caught in a precarious position, aware of Tiberius\'s hidden agenda behind the horoscope and Livia\'s cynical understanding of it. Internally, he is likely battling professional obligation against self-preservation, striving to deliver news that is both palatable and seemingly truthful, a near impossible task in Livia\'s presence. His reassurances are laced with desperation to escape unscathed.',
        ap.emotional_tags = ["thrasyllus is visibly anxious", "insecure, desperately seeking livia's approval while fearing her sharp tongue", "unpredictable reactions. he is caught in a precarious position, aware of tiberius's hidden agenda behind the horoscope", "livia's cynical understanding of it. internally, he is likely battling professional obligation against self-preservation, striving to deliver news that is both palatable", "seemingly truthful, a near impossible task in livia's presence. his reassurances are laced with desperation to escape unscathed.", "thrasyllus is visibly anxious and insecure", "desperately seeking livia's approval while fearing her sharp tongue and unpredictable reactions. he is caught in a precarious position", "aware of tiberius's hidden agenda behind the horoscope and livia's cynical understanding of it. internally", "he is likely battling professional obligation against self-preservation", "striving to deliver news that is both palatable and seemingly truthful", "a near impossible task in livia's presence. his reassurances are laced with desperation to escape unscathed.", "thrasyllus is visibly anxious and insecure, desperately seeking livia's approval", "fearing her sharp tongue and unpredictable reactions. he is caught in a precarious position, aware of tiberius's hidden agenda behind the horoscope and livia's cynical understanding of it. internally, he is likely battling professional obligation against self-preservation, striving to deliver news that is both palatable and seemingly truthful, a near impossible task in livia's presence. his reassurances are laced with desperation to escape unscathed."],
        ap.active_plans = ["To deliver the horoscope from Tiberius to Livia as instructed, fulfilling his duty to the Emperor.", "To offer vague yet reassuring interpretations of the horoscope, attempting to appease Livia without committing to specific or falsifiable predictions.", "To extricate himself from the conversation with Livia as quickly and discreetly as possible, minimizing his exposure to her critical scrutiny and potential wrath."],
        ap.beliefs = ["Flattery and placation are essential survival tools when dealing with powerful and capricious figures like Livia.", "Livia possesses a keen intellect and sees through superficial reassurances, making genuine conviction and cautious ambiguity necessary.", "His professional standing and personal safety depend on navigating the treacherous court politics and pleasing those in power, even if it means compromising on absolute truth."],
        ap.goals = ["short_term\": \"To successfully present the horoscope and escape Livia's presence without incurring her displeasure or anger.", "medium_term\": \"To maintain his position as court astrologer by demonstrating a semblance of usefulness and loyalty to both Livia and Tiberius, despite their conflicting agendas.", "ultimate\": \"To ensure his long-term survival and professional success within the volatile political landscape of the Julio-Claudian court by skillfully maneuvering through its intrigues and dangers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Livia, presenting the Indian vase with a slight stammer, maintaining a posture of respectful deference. He observes the interaction between Livia and Thrasyllus with keen interest, his outward awkwardness concealing a sharp mind processing the nuances of the courtly exchange. He engages in polite conversation, his gestures measured and observant.',
        ap.emotional_state = 'Claudius outwardly displays a calm and polite demeanor, his stammer and apparent timidity serving as a mask for his inner contemplation. Beneath the surface, he is intensely observant and intellectually engaged, dissecting Livia\'s pronouncements and Thrasyllus\'s nervous reactions. He is likely intrigued by Livia\'s open discussion of her mortality and ambition, sensing the undercurrents of manipulation and power play inherent in the conversation. There\'s a subtle curiosity mixed with caution as he navigates this delicate interaction.',
        ap.emotional_tags = ["claudius outwardly displays a calm", "polite demeanor, his stammer", "apparent timidity serving as a mask for his inner contemplation. beneath the surface, he is intensely observant", "intellectually engaged, dissecting livia's pronouncements", "thrasyllus's nervous reactions. he is likely intrigued by livia's open discussion of her mortality", "ambition, sensing the undercurrents of manipulation", "power play inherent in the conversation. there's a subtle curiosity mixed with caution as he navigates this delicate interaction.", "claudius outwardly displays a calm and polite demeanor", "his stammer and apparent timidity serving as a mask for his inner contemplation. beneath the surface", "he is intensely observant and intellectually engaged", "dissecting livia's pronouncements and thrasyllus's nervous reactions. he is likely intrigued by livia's open discussion of her mortality and ambition", "sensing the undercurrents of manipulation and power play inherent in the conversation. there's a subtle curiosity mixed with caution as he navigates this delicate interaction."],
        ap.active_plans = ["To present a polite and appropriate birthday gift to Livia, fulfilling familial expectations and maintaining a semblance of goodwill.", "To carefully observe Livia's behavior and pronouncements, gathering information about her true intentions and the dynamics of the court through subtle cues and veiled statements.", "To engage in conversation in a way that appears unassuming and non-threatening, avoiding drawing undue attention to his own intellect or political aspirations while still participating in the social ritual."],
        ap.beliefs = ["The Julio-Claudian court is a theater of deception where appearances often mask true intentions and power struggles.", "Livia is a formidable and manipulative figure whose words and actions must be carefully analyzed for hidden meanings.", "Maintaining a low profile and observing from the periphery is a prudent strategy for survival in the treacherous environment of the imperial court, allowing him to gather knowledge without becoming a target."],
        ap.goals = ["short_term\": \"To navigate the birthday banquet without attracting negative attention or becoming entangled in courtly intrigues.", "medium_term\": \"To deepen his understanding of Livia's character and ambitions, particularly regarding her impending death and her desire for deification, gaining insight into the power structures of his family.", "ultimate\": \"To survive in the dangerous court environment and potentially leverage his knowledge and observations for his own future, remaining an astute observer while subtly positioning himself for unforeseen opportunities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Livia sits imperiously at the head of the lavish banquet table, her posture regal yet commanding. She leans slightly forward, her gaze piercing as she addresses Caligula, a mockery lacing her words. Her gestures are deliberate, using her hands to emphasize her control and manipulation over the conversation, particularly when discussing the \'monster\' and the green talisman.',
        ap.emotional_state = 'Outwardly, Livia displays confidence and mockery, her tone sharp as she taunts Caligula. Internally, she harbors a ruthless ambition, feeling an undercurrent of fear about losing power. The tension between her facade of control and the lurking threat of betrayal from her descendants reveals a complex emotional landscape filled with ambition and paranoia.',
        ap.emotional_tags = ["outwardly, livia displays confidence", "mockery, her tone sharp as she taunts caligula. internally, she harbors a ruthless ambition, feeling an undercurrent of fear about losing power. the tension between her facade of control", "the lurking threat of betrayal from her descendants reveals a complex emotional landscape filled with ambition", "paranoia.", "outwardly", "livia displays confidence and mockery", "her tone sharp as she taunts caligula. internally", "she harbors a ruthless ambition", "feeling an undercurrent of fear about losing power. the tension between her facade of control and the lurking threat of betrayal from her descendants reveals a complex emotional landscape filled with ambition and paranoia."],
        ap.active_plans = ["To maintain her influence over the family dynamics by sowing discord between Caligula and Claudius.", "To manipulate Claudius into swearing allegiance to her ambitions of becoming a goddess by appealing to his scholarly nature.", "To protect her legacy and position by ensuring Caligula bears the burden of her secrets and potential future actions."],
        ap.beliefs = ["Power must be obtained and maintained at all costs, even if it requires manipulation and treachery.", "Prophecies can be used as tools to exert control over others and enhance her status.", "Family ties are secondary to ambition, as demonstrated by her willingness to sacrifice even her own kin."],
        ap.goals = ["Short-term: To assert control over the current banquet and establish her dominance in the familial hierarchy.", "Medium-term: To ensure Caligula\u2019s support in her quest for divinity, leveraging his ambition and familial loyalty.", "Ultimate: To become a goddess and secure her legacy in history, thus escaping the torment of her past actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Caligula lurks nearby, his demeanor predatory and confident. He leans against the wall, arms crossed, a sinister grin playing on his lips as he engages with Claudius. His body language radiates a mixture of arrogance and menace, especially as he challenges Claudius and responds to Livia’s mockery.',
        ap.emotional_state = 'Caligula projects an air of playful malevolence, relishing the control he exerts over the situation. Beneath this facade, there’s a simmering madness and ambition that hints at his future tyranny. The tension between his outward charm and the darker impulses lurking within reveals a complex identity driven by both youthful arrogance and a thirst for power.',
        ap.emotional_tags = ["caligula projects an air of playful malevolence, relishing the control he exerts over the situation. beneath this facade, there\u2019s a simmering madness", "ambition that hints at his future tyranny. the tension between his outward charm", "the darker impulses lurking within reveals a complex identity driven by both youthful arrogance", "a thirst for power.", "caligula projects an air of playful malevolence", "relishing the control he exerts over the situation. beneath this facade", "there\u2019s a simmering madness and ambition that hints at his future tyranny. the tension between his outward charm and the darker impulses lurking within reveals a complex identity driven by both youthful arrogance and a thirst for power."],
        ap.active_plans = ["To undermine Claudius by mocking him, reinforcing his own sense of superiority.", "To play the role of the 'monster' while concealing his true ambitions, testing the waters of familial loyalty.", "To ingratiate himself with Livia by confirming her dark suspicions about his nature, ensuring her support for his future ascendancy."],
        ap.beliefs = ["The world is a stage for his amusement, and those around him are mere players to be manipulated.", "Power is his birthright, and he will stop at nothing to claim it, seeing his family members as obstacles.", "Fear can be wielded as a weapon to maintain control over others, particularly Claudius and Livia."],
        ap.goals = ["Short-term: To assert his dominance within the family by playing off their fears and insecurities.", "Medium-term: To position himself as the favored heir, enhancing his claim to the throne.", "Ultimate: To unleash his tyrannical potential and become the undisputed ruler of Rome, unbound by the expectations of his lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Livia, holding the Indian vase with a fidgety posture, his stammering speech betraying his nervousness. He shifts his weight uneasily, trying to maintain eye contact while grappling with the tension in the room. His gestures are subdued, reflecting his role as an awkward observer in this intense familial exchange.',
        ap.emotional_state = 'Claudius outwardly exhibits anxiety and hesitation, his stammer a physical manifestation of his discomfort. Internally, he grapples with the weight of his family\'s dark history and the implications of Livia\'s manipulations. His emotional conflict reveals a deep-seated desire for approval from Livia, paralleled by an emerging awareness of the danger that surrounds him.',
        ap.emotional_tags = ["claudius outwardly exhibits anxiety", "hesitation, his stammer a physical manifestation of his discomfort. internally, he grapples with the weight of his family's dark history", "the implications of livia's manipulations. his emotional conflict reveals a deep-seated desire for approval from livia, paralleled by an emerging awareness of the danger that surrounds him.", "claudius outwardly exhibits anxiety and hesitation", "his stammer a physical manifestation of his discomfort. internally", "he grapples with the weight of his family's dark history and the implications of livia's manipulations. his emotional conflict reveals a deep-seated desire for approval from livia", "paralleled by an emerging awareness of the danger that surrounds him."],
        ap.active_plans = ["To navigate the treacherous dynamics of the banquet while seeking Livia's approval.", "To gather insight into Livia\u2019s true nature and the extent of her manipulations.", "To position himself strategically within the family by leveraging Livia's desires for his own understanding of power."],
        ap.beliefs = ["Family is a source of both support and peril, and he must tread carefully to survive.", "Knowledge and understanding of the past are crucial for navigating the treacherous waters of Roman politics.", "His perceived weaknesses can be transformed into strengths, enabling him to outmaneuver the more overtly ambitious members of the family."],
        ap.goals = ["Short-term: To maintain his composure in front of Livia and avoid her ire.", "Medium-term: To uncover the truth behind Livia's ambitions and the dark secrets of his family's past.", "Ultimate: To secure his own survival and potentially reclaim the family's honor amidst the chaos of ambition and treachery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Empress Livia sits regally at the banquet table, having dismissed Caligula and Thrasyllus to engage Claudius in a private audience. She is physically imposing despite her age, her gaze sharp and calculating as she initiates the conversation by dissecting Caligula\'s peculiar fascination with her aging form, immediately establishing her strategic and observant nature.',
        ap.emotional_state = 'Livia is a fortress of calculated pragmatism, her emotions masked beneath layers of imperial composure. Beneath the surface, a deep-seated fear of mortality and eternal damnation fuels her desperate ambition for deification. She exudes a cynical detachment, particularly regarding her son Tiberius, whom she views with thinly veiled contempt, and a manipulative shrewdness as she assesses and steers Claudius.',
        ap.emotional_tags = ["livia is a fortress of calculated pragmatism, her emotions masked beneath layers of imperial composure. beneath the surface, a deep-seated fear of mortality", "eternal damnation fuels her desperate ambition for deification. she exudes a cynical detachment, particularly regarding her son tiberius, whom she views with thinly veiled contempt,", "a manipulative shrewdness as she assesses", "steers claudius.", "livia is a fortress of calculated pragmatism", "her emotions masked beneath layers of imperial composure. beneath the surface", "a deep-seated fear of mortality and eternal damnation fuels her desperate ambition for deification. she exudes a cynical detachment", "particularly regarding her son tiberius", "whom she views with thinly veiled contempt", "and a manipulative shrewdness as she assesses and steers claudius."],
        ap.active_plans = ["Secure her legacy by ensuring Caligula\u2019s ascension to Emperor, thus fulfilling Caligula's promise to deify her post-mortem.", "Assess Claudius's pliability and potential usefulness in her grand scheme, probing his loyalty and historical curiosity.", "Extract a binding promise from Claudius to support her deification efforts, leveraging his scholarly nature and family obligation."],
        ap.beliefs = ["Caligula's ascension to the throne is inevitable, driven by Tiberius's vanity and manipulated by her own design.", "Achieving goddess status is not merely desirable but absolutely necessary to escape eternal torment for her actions in securing the Empire.", "Ruthless pragmatism and manipulation are not only acceptable but essential tools for wielding power and ensuring the Julio-Claudian dynasty's continued dominance."],
        ap.goals = ["{type: short-term, description: Obtain Claudius's explicit commitment to advocate for her deification, solidifying a crucial alliance for her posthumous ambitions.}", "{type: medium-term, description: Solidify Caligula's path to emperorship, ensuring the fulfillment of his promise and the execution of her post-mortem plans.}", "{type: ultimate, description: Achieve deification and transcend mortal judgment, securing eternal veneration and escaping the specter of hellish punishment for her ruthless actions in life.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Livia, initially presenting a vase as a birthday gift, a gesture of familial duty. He listens intently as Livia speaks, his posture attentive yet subtly reserved. As the conversation progresses and Livia reveals her machinations, Claudius becomes more engaged, his stammer diminishing as his intellectual curiosity is piqued and he leans in to understand the historical truths buried beneath imperial lies.',
        ap.emotional_state = 'Claudius is a complex blend of deference and detached observation. He begins with a respectful, almost melancholic formality towards his grandmother, tinged with a weariness born from years of navigating courtly intrigue. As Livia\'s revelations unfold, his curiosity sharpens, overriding his initial reserve. He is intrigued by the historical significance of her confessions, his scholarly mind grappling with the enormity of her actions and the dark truths of his family\'s past, displaying a controlled fascination rather than overt emotional reaction.',
        ap.emotional_tags = ["claudius is a complex blend of deference", "detached observation. he begins with a respectful, almost melancholic formality towards his grandmother, tinged with a weariness born from years of navigating courtly intrigue. as livia's revelations unfold, his curiosity sharpens, overriding his initial reserve. he is intrigued by the historical significance of her confessions, his scholarly mind grappling with the enormity of her actions", "the dark truths of his family's past, displaying a controlled fascination rather than overt emotional reaction.", "claudius is a complex blend of deference and detached observation. he begins with a respectful", "almost melancholic formality towards his grandmother", "tinged with a weariness born from years of navigating courtly intrigue. as livia's revelations unfold", "his curiosity sharpens", "overriding his initial reserve. he is intrigued by the historical significance of her confessions", "his scholarly mind grappling with the enormity of her actions and the dark truths of his family's past", "displaying a controlled fascination rather than overt emotional reaction."],
        ap.active_plans = ["Elicit genuine confessions from Livia regarding the deaths and manipulations that have shaped the Julio-Claudian dynasty, driven by his historical inquisitiveness.", "Understand Livia's strategic vision for the future of the Empire, specifically her intentions regarding Caligula's succession, to better grasp the shifting power dynamics.", "Secure tangible historical artifacts or documents from Livia, such as the Sibylline Verses scroll, recognizing their potential for deeper historical understanding and perhaps future political leverage."],
        ap.beliefs = ["Livia is the key to unlocking the true, often brutal, history of the Julio-Claudian dynasty, holding within her the secrets of its ascent and the cost of its power.", "Historical truth, even when grim and uncomfortable, is essential for understanding the present and navigating the future, a conviction deeply rooted in his scholarly nature.", "His perceived weakness and disinterest in power are assets, allowing him to observe and learn from the machinations of others, like Livia, without being seen as a direct threat."],
        ap.goals = ["{type: short-term, description: Obtain explicit and detailed confessions from Livia about the key deaths and power plays within the Julio-Claudian family, satisfying his immediate historical curiosity.}", "{type: medium-term, description: Comprehend the intricate web of Livia's political strategies and her long-term vision for the Empire, especially regarding the succession and Caligula's role.}", "{type: ultimate, description: Become a comprehensive historian of his dynasty, uncovering and preserving the unvarnished truth, potentially using this knowledge for future survival and influence in the treacherous Roman court, even if he currently disavows political ambition.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Livia sits at the head of the lavish banquet hall, her ancient eyes piercing through the ambient light, exuding authority as she engages Claudius. Her gestures are controlled, her posture regal, reflecting her dominance and the weight of her ambitions. As she leans slightly towards Claudius while revealing her desires, her demeanor shifts from the imperious matriarch to a vulnerable yet menacing figure, illustrating her desperation for immortality.',
        ap.emotional_state = 'Livia\'s surface demeanor oscillates between confident assertiveness and underlying dread. While she outwardly revels in her power and sharp wit, her internal state reveals a primal fear of eternal punishment for her past deeds. Her ambition drives her, yet the vulnerability of realizing her mortality is palpable, exposing a complex tapestry of vanity and desperation for divine recognition.',
        ap.emotional_tags = ["livia's surface demeanor oscillates between confident assertiveness", "underlying dread. while she outwardly revels in her power", "sharp wit, her internal state reveals a primal fear of eternal punishment for her past deeds. her ambition drives her, yet the vulnerability of realizing her mortality is palpable, exposing a complex tapestry of vanity", "desperation for divine recognition.", "livia's surface demeanor oscillates between confident assertiveness and underlying dread. while she outwardly revels in her power and sharp wit", "her internal state reveals a primal fear of eternal punishment for her past deeds. her ambition drives her", "yet the vulnerability of realizing her mortality is palpable", "exposing a complex tapestry of vanity and desperation for divine recognition."],
        ap.active_plans = ["To ingratiate herself with Claudius by revealing her ambitions to ensure his loyalty.", "To secure a pact with Caligula, ensuring her deification in exchange for his secret, thus navigating her path to immortality.", "To manipulate the familial dynamics to her advantage, leveraging Claudius's loyalty as a means to solidify her legacy."],
        ap.beliefs = ["The belief in the divine right of rulers, which justifies her ambition to become a goddess.", "The conviction that her past actions, however ruthless, were necessary for the stability of the Empire.", "The notion that power and fear of punishment dictate the moral landscape of her family and the Empire."],
        ap.goals = ["Short-term: To manipulate Claudius into swearing loyalty to her ambitions.", "Medium-term: To ensure Caligula becomes Emperor, fulfilling her pact for deification.", "Ultimate: To become a goddess, escaping the fear of eternal torment for her past deeds."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Livia, his frame slightly hunched, reflecting an aura of both deference and contemplation. The Indian vase he clutches represents his attempt to connect with her, yet his stuttering reveals his discomfort in the oppressive atmosphere. As he engages with Livia, he shifts between nervousness and a deeper understanding of the deadly game they are embroiled in, suggesting a transition from passive observer to reluctant participant.',
        ap.emotional_state = 'On the surface, Claudius appears anxious, his stammer betraying his unease in the presence of his formidable grandmother. Internally, however, he grapples with a mix of curiosity and dread as Livia unveils her dark ambitions. This juxtaposition reveals a complex emotional landscape where his desire for knowledge and truth collides with the chilling revelations of his family\'s legacy, highlighting his struggle between loyalty and survival.',
        ap.emotional_tags = ["on the surface, claudius appears anxious, his stammer betraying his unease in the presence of his formidable grandmother. internally, however, he grapples with a mix of curiosity", "dread as livia unveils her dark ambitions. this juxtaposition reveals a complex emotional landscape where his desire for knowledge", "truth collides with the chilling revelations of his family's legacy, highlighting his struggle between loyalty", "survival.", "on the surface", "claudius appears anxious", "his stammer betraying his unease in the presence of his formidable grandmother. internally", "however", "he grapples with a mix of curiosity and dread as livia unveils her dark ambitions. this juxtaposition reveals a complex emotional landscape where his desire for knowledge and truth collides with the chilling revelations of his family's legacy", "highlighting his struggle between loyalty and survival."],
        ap.active_plans = ["To extract vital truths about his family\u2019s past from Livia, hoping to understand the machinations of their dynasty.", "To navigate Livia's manipulations while maintaining his own integrity and sense of self.", "To seek a deeper understanding of the implications of Livia\u2019s pact with Caligula and how it will potentially affect him."],
        ap.beliefs = ["The belief that knowledge of his family's history is essential to navigate the treacherous waters of Roman politics.", "The conviction that unravelling the truth is crucial for his survival and potential rise to power.", "The notion that moral decisions, even in a corrupt system, have significant implications for one\u2019s legacy."],
        ap.goals = ["Short-term: To gain insights about Livia\u2019s ambitions and the truth behind his family's history.", "Medium-term: To find a way to protect himself and possibly restore some moral order within the chaos of his family.", "Ultimate: To eventually assume a position of power, informed by the lessons of betrayal and ambition surrounding him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Empress Livia reigns from her seat at the banquet\'s head, a figure of formidable age yet undiminished authority amidst the opulent display. She commands the space, her presence radiating power as she engages Claudius. She orchestrates the conversation, guiding it towards her desired confession and extracting his promise, all while maintaining an air of regal composure and control over the unfolding drama.',
        ap.emotional_state = 'Livia presents a facade of imperial calm, even amusement, yet beneath this veneer lies a turbulent sea of anxieties. She is haunted by the specter of mortality and divine retribution, her confession a desperate attempt to alleviate her fear of eternal torment. There\'s a palpable tension between her outward detachment as she recounts horrific deeds and her inner vulnerability, revealed in her desperate plea for deification, showcasing a mind wrestling with its legacy and eternal fate.',
        ap.emotional_tags = ["livia presents a facade of imperial calm, even amusement, yet beneath this veneer lies a turbulent sea of anxieties. she is haunted by the specter of mortality", "divine retribution, her confession a desperate attempt to alleviate her fear of eternal torment. there's a palpable tension between her outward detachment as she recounts horrific deeds", "her inner vulnerability, revealed in her desperate plea for deification, showcasing a mind wrestling with its legacy", "eternal fate.", "livia presents a facade of imperial calm", "even amusement", "yet beneath this veneer lies a turbulent sea of anxieties. she is haunted by the specter of mortality and divine retribution", "her confession a desperate attempt to alleviate her fear of eternal torment. there's a palpable tension between her outward detachment as she recounts horrific deeds and her inner vulnerability", "revealed in her desperate plea for deification", "showcasing a mind wrestling with its legacy and eternal fate."],
        ap.active_plans = ["Secure a promise from Claudius to ensure her deification after death, viewing it as her only path to salvation.", "Unburden herself by confessing her past crimes to Claudius, seeking a form of absolution or at least understanding from a family member.", "Assess Claudius's reaction to her confession to gauge his potential future threat or usefulness, maintaining control over familial narratives."],
        ap.beliefs = ["Deification is a real possibility and the only way to escape divine punishment for her earthly actions.", "Ruthlessness and calculated actions are necessary for maintaining power and ensuring the stability of the Empire, justifying her past deeds.", "Family, despite its treacherous nature, still holds a form of obligation and Claudius, bound by familial ties and perceived as harmless, can be manipulated."],
        ap.goals = ["short_term\": \"Elicit a firm commitment from Claudius to support her deification.", "medium_term\": \"Ensure her legacy is secured as a goddess, thereby negating any potential eternal punishment.", "ultimate\": \"Achieve immortality and divine status, transcending mortal judgment and securing a place amongst the gods, validating her life's ambition and actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands initially in a posture of respectful grandson, presenting a gift to Livia at the lavish banquet. He listens attentively, his stammer initially betraying a hint of nervousness in the imposing presence of his grandmother. As the conversation deepens into Livia\'s confession, Claudius shifts, becoming more direct and less hesitant, engaging her with focused questions and a penetrating gaze, driven by his historical curiosity.',
        ap.emotional_state = 'Claudius begins with polite deference, yet beneath this surface lies a keen, analytical mind hungry for historical truth. As Livia confesses, his initial nervousness transforms into a detached fascination, absorbing the shocking revelations with an almost scholarly curiosity. He remains outwardly composed, maintaining decorum, but internally he is processing the enormity of Livia\'s crimes and the dark legacy of his family, revealing a complex mix of horror, intrigue, and a historian\'s thirst for understanding.',
        ap.emotional_tags = ["claudius begins with polite deference, yet beneath this surface lies a keen, analytical mind hungry for historical truth. as livia confesses, his initial nervousness transforms into a detached fascination, absorbing the shocking revelations with an almost scholarly curiosity. he remains outwardly composed, maintaining decorum, but internally he is processing the enormity of livia's crimes", "the dark legacy of his family, revealing a complex mix of horror, intrigue,", "a historian's thirst for understanding.", "claudius begins with polite deference", "yet beneath this surface lies a keen", "analytical mind hungry for historical truth. as livia confesses", "his initial nervousness transforms into a detached fascination", "absorbing the shocking revelations with an almost scholarly curiosity. he remains outwardly composed", "maintaining decorum", "but internally he is processing the enormity of livia's crimes and the dark legacy of his family", "revealing a complex mix of horror", "intrigue", "and a historian's thirst for understanding.", "claudius begins with polite deference, yet beneath this surface lies a keen, analytical mind hungry for historical truth. as livia confesses, his initial nervousness transforms into a detached fascination, absorbing the shocking revelations with an almost scholarly curiosity. he remains outwardly composed, maintaining decorum,", "internally he is processing the enormity of livia's crimes and the dark legacy of his family, revealing a complex mix of horror, intrigue, and a historian's thirst for understanding."],
        ap.active_plans = ["Use the occasion of Livia's birthday dinner to subtly probe into the long-murmured secrets of his family's past, leveraging her age and reflective mood.", "Agree to Livia's request for deification as a strategic maneuver to gain her trust and elicit a full and honest confession of her past actions.", "Document and mentally archive Livia's confession, recognizing the historical significance of her revelations and their impact on his understanding of the Julio-Claudian dynasty."],
        ap.beliefs = ["Uncovering and understanding the truth of history is paramount, even when confronting deeply disturbing and morally compromising realities.", "Politeness and outward compliance can be valuable tools to gain access to information and navigate treacherous social and familial dynamics.", "Livia, in her twilight years, might be more inclined to reveal the truth, presenting a unique opportunity to grasp the full scope of her influence and actions."],
        ap.goals = ["short_term\": \"Extract a detailed confession from Livia regarding the deaths of key members of the Julio-Claudian family.", "medium_term\": \"Comprehend the underlying motivations and justifications behind Livia's actions, gaining a deeper insight into the workings of power in Rome.", "ultimate\": \"Assemble a comprehensive and truthful historical account of the Julio-Claudian dynasty, ensuring that the realities of power and ambition are not obscured by propaganda or lies, even if it means confronting uncomfortable truths about his own family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_7'})
    ON CREATE SET
        ap.current_status = 'Livia sits at the head of the opulent banquet table, her posture regal yet weary as she hands Claudius the scroll. Her movements are deliberate, underscoring her control over the conversation. She leans forward slightly, her ancient eyes glinting with a mix of ambition and exhaustion, embodying a commanding presence even as she reveals her vulnerabilities.',
        ap.emotional_state = 'Livia\'s surface demeanor is one of calm authority, masking an undercurrent of anxiety and desperation. There’s a flicker of fear regarding her mortality mixed with a fierce determination to secure her legacy. Beneath her composed exterior lies a chilling ambition, as she seeks to manipulate Claudius into fulfilling her desires, even as she grapples with her waning power.',
        ap.emotional_tags = ["livia's surface demeanor is one of calm authority, masking an undercurrent of anxiety", "desperation. there\u2019s a flicker of fear regarding her mortality mixed with a fierce determination to secure her legacy. beneath her composed exterior lies a chilling ambition, as she seeks to manipulate claudius into fulfilling her desires, even as she grapples with her waning power.", "livia's surface demeanor is one of calm authority", "masking an undercurrent of anxiety and desperation. there\u2019s a flicker of fear regarding her mortality mixed with a fierce determination to secure her legacy. beneath her composed exterior lies a chilling ambition", "as she seeks to manipulate claudius into fulfilling her desires", "even as she grapples with her waning power."],
        ap.active_plans = ["To secure Claudius's loyalty and manipulate him into supporting her desire to become a goddess.", "To instill fear in Claudius regarding the potential threats from Caligula and Tiberius.", "To cement her legacy and ensure her status is preserved through Claudius's future emperorship."],
        ap.beliefs = ["That power and legacy require ruthless ambition and manipulation.", "That the gods are free of punishment, while mortals suffer the consequences of their actions.", "That her sacrifices for the Empire justify her ruthless actions throughout her life."],
        ap.goals = ["Short-term: To convince Claudius to support her quest for divinity.", "Medium-term: To ensure Caligula becomes Emperor and secures her place in history.", "Ultimate: To achieve immortality and be recognized as a goddess, escaping the hell she fears awaits her."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Livia, clutching the Sibylline scroll. His posture is slightly hunched, a sign of his inner turmoil and the weight of familial obligation. He engages in the conversation with a mix of hesitance and thoughtfulness, occasionally stammering, reflecting his struggle to assert himself amidst the imperial grandeur.',
        ap.emotional_state = 'Claudius exhibits a blend of bemusement and anxiety, his laughter at Livia\'s prophecy masking deeper apprehensions about his family\'s dark history and future. Internally, he grapples with conflicting feelings of loyalty to Livia and the horror of her revelations, leaving him feeling both intrigued and repulsed by the implications of what he has heard.',
        ap.emotional_tags = ["claudius exhibits a blend of bemusement", "anxiety, his laughter at livia's prophecy masking deeper apprehensions about his family's dark history", "future. internally, he grapples with conflicting feelings of loyalty to livia", "the horror of her revelations, leaving him feeling both intrigued", "repulsed by the implications of what he has heard.", "claudius exhibits a blend of bemusement and anxiety", "his laughter at livia's prophecy masking deeper apprehensions about his family's dark history and future. internally", "he grapples with conflicting feelings of loyalty to livia and the horror of her revelations", "leaving him feeling both intrigued and repulsed by the implications of what he has heard."],
        ap.active_plans = ["To navigate the dangerous waters of his grandmother's ambitions while preserving his own safety.", "To learn the truth about his family's past and the dark secrets that shape their legacy.", "To play along with Livia's schemes in hopes of gathering information while maintaining his own moral integrity."],
        ap.beliefs = ["That knowledge of the past is crucial to understanding the present and shaping the future.", "That familial bonds complicate his moral compass, tying him to ambitious and dangerous relatives.", "That power struggles within the family threaten not only their lives but the integrity of Rome itself."],
        ap.goals = ["Short-term: To gain insight into Livia's manipulations and the truth about the family's dark history.", "Medium-term: To protect himself and his interests while navigating Livia's ambitions.", "Ultimate: To break free from the cycle of ambition and betrayal that defines the Julio-Claudian dynasty, potentially restoring the Republic."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands confidently in the shadowy antechamber, having strategically positioned himself to intercept Claudius. He greets Claudius with a disarming smile, a practiced gesture intended to put his target at ease and mask his manipulative agenda. Sejanus leans slightly forward, maintaining eye contact with Claudius, ensuring he holds the conversational and physical dominance in this encounter.',
        ap.emotional_state = 'On the surface, Sejanus exudes an air of friendly concern and helpfulness, his tone smooth and affable as he engages Claudius. However, beneath this veneer of cordiality lies a calculating and ambitious mind. He is driven by a desire for control and advancement, viewing Claudius as a pawn in his larger schemes. There is a palpable tension between his outward charm and his cold, strategic intentions, as he expertly manipulates Claudius\'s vulnerabilities for his own gain.',
        ap.emotional_tags = ["on the surface, sejanus exudes an air of friendly concern", "helpfulness, his tone smooth", "affable as he engages claudius. however, beneath this veneer of cordiality lies a calculating", "ambitious mind. he is driven by a desire for control", "advancement, viewing claudius as a pawn in his larger schemes. there is a palpable tension between his outward charm", "his cold, strategic intentions, as he expertly manipulates claudius's vulnerabilities for his own gain.", "on the surface", "sejanus exudes an air of friendly concern and helpfulness", "his tone smooth and affable as he engages claudius. however", "beneath this veneer of cordiality lies a calculating and ambitious mind. he is driven by a desire for control and advancement", "viewing claudius as a pawn in his larger schemes. there is a palpable tension between his outward charm and his cold", "strategic intentions", "as he expertly manipulates claudius's vulnerabilities for his own gain."],
        ap.active_plans = ["To manipulate Claudius into divorcing his current wife.", "To propose his sister, Aelia, as Claudius's next wife, securing a strategic family alliance.", "To exert his influence over Claudius, reinforcing his position as a key player in Roman court politics."],
        ap.beliefs = ["Strategic marriages are essential tools for consolidating power and influence in Rome.", "Claudius is a weak and easily controlled individual, ripe for manipulation.", "Advancing his family's status is a primary objective, justifying calculated actions.", "Charm and deception are effective instruments for achieving political goals."],
        ap.goals = ["short_term\": \"To obtain Claudius's immediate agreement to divorce and remarry.", "medium_term\": \"To solidify a powerful alliance with the Julio-Claudian family through marriage, increasing his family's prestige and his own influence.", "ultimate\": \"To ascend in Roman society and potentially gain even greater power by strategically positioning himself and his family within the imperial orbit."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles nervously in the antechamber, his posture indicating discomfort and anxiety as Sejanus intercepts him. He fidgets and avoids direct eye contact, revealing his unease in the face of Sejanus\'s assertive presence. He mentions his intention to visit Castor, highlighting his familial concern and attempting to deflect from the unfolding, unwanted interaction with Sejanus. His movements are hesitant and uncertain, reflecting his internal apprehension.',
        ap.emotional_state = 'Claudius is initially preoccupied with concern for Castor\'s well-being, showcasing his inherent familial loyalty. However, upon being intercepted by Sejanus, his surface emotion is palpable nervousness and deference. His stammering speech betrays his anxiety and lack of confidence in dealing with the Praetorian Prefect. Internally, he is likely confused and overwhelmed by Sejanus\'s sudden, forceful pronouncements about his personal life. He feels vulnerable and manipulated, struggling to comprehend and respond to the rapid-fire demands being made upon him, revealing a deep-seated insecurity and a learned passivity in the face of authority.',
        ap.emotional_tags = ["claudius is initially preoccupied with concern for castor's well-being, showcasing his inherent familial loyalty. however, upon being intercepted by sejanus, his surface emotion is palpable nervousness", "deference. his stammering speech betrays his anxiety", "lack of confidence in dealing with the praetorian prefect. internally, he is likely confused", "overwhelmed by sejanus's sudden, forceful pronouncements about his personal life. he feels vulnerable", "manipulated, struggling to comprehend", "respond to the rapid-fire demands being made upon him, revealing a deep-seated insecurity", "a learned passivity in the face of authority.", "claudius is initially preoccupied with concern for castor's well-being", "showcasing his inherent familial loyalty. however", "upon being intercepted by sejanus", "his surface emotion is palpable nervousness and deference. his stammering speech betrays his anxiety and lack of confidence in dealing with the praetorian prefect. internally", "he is likely confused and overwhelmed by sejanus's sudden", "forceful pronouncements about his personal life. he feels vulnerable and manipulated", "struggling to comprehend and respond to the rapid-fire demands being made upon him", "revealing a deep-seated insecurity and a learned passivity in the face of authority."],
        ap.active_plans = ["To visit Castor and check on his condition, motivated by genuine familial concern.", "To politely navigate the unexpected encounter with Sejanus, seeking to avoid conflict.", "To understand the reason for Sejanus's interception and the direction of the conversation, though clearly unprepared for its personal nature."],
        ap.beliefs = ["He is perceived as weak and inconsequential by those in power, making him susceptible to manipulation.", "Compliance with powerful figures like Sejanus is often the safest course of action to avoid trouble.", "His personal desires and preferences are secondary to the political machinations of the Roman court.", "Familial duties and affections, like concern for Castor, remain important to him amidst the court's treachery."],
        ap.goals = ["short_term\": \"To extricate himself from the uncomfortable and confusing conversation with Sejanus as quickly as possible.", "medium_term\": \"To maintain a low profile within the court and avoid attracting unwanted attention from powerful figures like Sejanus, preferring to remain an observer.", "ultimate\": \"To survive the treacherous political landscape of Rome with as little personal disruption and danger as possible, seeking a quiet existence away from the central power struggles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands confidently in the shadowy antechamber, exuding a manipulative charm as he intercepts Claudius. His posture is relaxed yet predatory, with an easy smile that belies his ulterior motives. He gestures subtly, drawing Claudius into a web of his insinuations regarding the pregnancy, keenly observing the shifting emotions on Claudius\'s face as he speaks.',
        ap.emotional_state = 'Sejanus displays a surface-level charm and confidence, yet beneath lies a calculated intent. He relishes the power of the secret he wields, enjoying the moment where he can manipulate Claudius\'s emotions. The smug satisfaction of revealing a truth that destabilizes Claudius fuels his interaction, as he intends to reshape Claudius’s future decisions to his advantage.',
        ap.emotional_tags = ["sejanus displays a surface-level charm", "confidence, yet beneath lies a calculated intent. he relishes the power of the secret he wields, enjoying the moment where he can manipulate claudius's emotions. the smug satisfaction of revealing a truth that destabilizes claudius fuels his interaction, as he intends to reshape claudius\u2019s future decisions to his advantage.", "sejanus displays a surface-level charm and confidence", "yet beneath lies a calculated intent. he relishes the power of the secret he wields", "enjoying the moment where he can manipulate claudius's emotions. the smug satisfaction of revealing a truth that destabilizes claudius fuels his interaction", "as he intends to reshape claudius\u2019s future decisions to his advantage."],
        ap.active_plans = ["To assert control over Claudius by revealing the pregnancy news and manipulating his emotional state.", "To subtly push Claudius towards a divorce, thereby creating an opportunity to propose a marriage alliance with his sister Aelia.", "To solidify his own family's position by fostering a connection with Claudius through potential marriage."],
        ap.beliefs = ["Power must be seized through manipulation and deceit to secure one's position.", "Political alliances are paramount, and marriage can be a strategic tool to enhance power.", "The end justifies the means, even if it involves subverting familial and marital ties."],
        ap.goals = ["Short-term: To unsettle Claudius by revealing the pregnancy and prompting a divorce.", "Medium-term: To arrange a marriage for Claudius with his sister Aelia to strengthen family ties.", "Ultimate: To increase his family's influence within the imperial court through strategic manipulation of Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nervously in the antechamber, his posture hunched, reflecting his discomfort in the presence of Sejanus. He shuffles slightly, fidgeting as he processes the shocking news about his wife. His speech is stuttered, revealing his anxiety and vulnerability, especially as Sejanus\'s words pierce through his composure.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal shock and confusion as he grapples with the unexpected revelation of his wife\'s pregnancy. Internally, he is overwhelmed by a sense of betrayal and vulnerability, struggling to maintain his dignity in front of Sejanus. There’s an underlying fear of the political ramifications of this news, showcasing a tension between his desire to assert himself and the fear of how this revelation will alter his standing.',
        ap.emotional_tags = ["claudius's surface emotions reveal shock", "confusion as he grapples with the unexpected revelation of his wife's pregnancy. internally, he is overwhelmed by a sense of betrayal", "vulnerability, struggling to maintain his dignity in front of sejanus. there\u2019s an underlying fear of the political ramifications of this news, showcasing a tension between his desire to assert himself", "the fear of how this revelation will alter his standing.", "claudius's surface emotions reveal shock and confusion as he grapples with the unexpected revelation of his wife's pregnancy. internally", "he is overwhelmed by a sense of betrayal and vulnerability", "struggling to maintain his dignity in front of sejanus. there\u2019s an underlying fear of the political ramifications of this news", "showcasing a tension between his desire to assert himself and the fear of how this revelation will alter his standing."],
        ap.active_plans = ["To understand the implications of the pregnancy on his marital status and personal reputation.", "To seek counsel regarding the divorce and what it means for his future.", "To navigate the political landscape with caution, ensuring he does not appear weak or na\u00efve in front of Sejanus."],
        ap.beliefs = ["Family honor is paramount, and any scandal threatens his standing within the court.", "The political machinations of the court are treacherous, and he must tread carefully.", "His perceived weaknesses can be exploited, and he must seek ways to regain control over his narrative."],
        ap.goals = ["Short-term: To process the shocking news and determine immediate actions regarding his wife.", "Medium-term: To maintain his dignity and reputation in the eyes of the court.", "Ultimate: To navigate the treacherous waters of Roman politics while upholding his family's legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands confidently in the shadowy antechamber, having intercepted Claudius as he attempted to visit Castor. He positions himself as an advisor and guide, directly addressing Claudius and maintaining a composed and assured physical presence. His posture is likely upright and relaxed, suggesting control and authority in the situation. He initiates the conversation, steering it towards his manipulative agenda with practiced ease.',
        ap.emotional_state = 'On the surface, Sejanus projects an air of helpfulness and amicable concern, speaking in a seemingly friendly and reassuring tone. However, beneath this veneer of geniality lies a cold, calculating ambition. He is emotionally detached, viewing Claudius as a pawn in his strategic game. Sejanus feels confident and in control, relishing his ability to manipulate Claudius and advance his own family\'s standing. His internal state is driven by self-interest and a desire for increased power.',
        ap.emotional_tags = ["on the surface, sejanus projects an air of helpfulness", "amicable concern, speaking in a seemingly friendly", "reassuring tone. however, beneath this veneer of geniality lies a cold, calculating ambition. he is emotionally detached, viewing claudius as a pawn in his strategic game. sejanus feels confident", "in control, relishing his ability to manipulate claudius", "advance his own family's standing. his internal state is driven by self-interest", "a desire for increased power.", "on the surface", "sejanus projects an air of helpfulness and amicable concern", "speaking in a seemingly friendly and reassuring tone. however", "beneath this veneer of geniality lies a cold", "calculating ambition. he is emotionally detached", "viewing claudius as a pawn in his strategic game. sejanus feels confident and in control", "relishing his ability to manipulate claudius and advance his own family's standing. his internal state is driven by self-interest and a desire for increased power."],
        ap.active_plans = ["Manipulate Claudius into divorcing his current wife, using the pregnancy as leverage.", "Secure a politically advantageous marriage for Claudius with his sister, Aelia.", "Strengthen his family's influence and standing within the Julio-Claudian dynasty by forging an alliance through marriage."],
        ap.beliefs = ["Claudius is weak-willed and easily manipulated due to his perceived inadequacies.", "Strategic alliances, especially through marriage, are crucial for consolidating power in Rome.", "Personal charm and calculated advice are effective tools for influencing others and achieving political objectives."],
        ap.goals = ["goals_short_term\": \"To convince Claudius to agree to the divorce and the proposed marriage within this brief encounter.", "goals_medium_term\": \"To establish a strong familial tie to Claudius and thereby increase his own access to imperial favor and influence.", "goals_ultimate\": \"To rise in power and prominence within Roman society, potentially even beyond his current position as Praetorian Prefect, securing lasting advantages for his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles nervously in the shadowy antechamber, intercepted unexpectedly by Sejanus. He is physically hesitant, his movements reflecting his unease and lack of confidence. He stands passively, listening to Sejanus, his body language suggesting a desire to avoid confrontation. He responds to Sejanus\'s pronouncements with stammering confusion and reluctant agreement, indicating his vulnerability and susceptibility to manipulation.',
        ap.emotional_state = 'Claudius is initially surprised and confused by Sejanus\'s sudden approach, his surface demeanor one of mild bewilderment and anxiety. He outwardly expresses confusion regarding the need for divorce and the rapid suggestion of a new marriage. Internally, Claudius feels overwhelmed and insecure, accustomed to being directed by others and lacking confidence in his own judgment. He is emotionally resigned to his fate, anticipating further manipulation and passively accepting Sejanus\'s forceful suggestions without resistance. He may harbor a deep-seated loneliness and a faint, perhaps unconscious, hope for acceptance or connection, even in a forced marriage.',
        ap.emotional_tags = ["claudius is initially surprised", "confused by sejanus's sudden approach, his surface demeanor one of mild bewilderment", "anxiety. he outwardly expresses confusion regarding the need for divorce", "the rapid suggestion of a new marriage. internally, claudius feels overwhelmed", "insecure, accustomed to being directed by others", "lacking confidence in his own judgment. he is emotionally resigned to his fate, anticipating further manipulation", "passively accepting sejanus's forceful suggestions without resistance. he may harbor a deep-seated loneliness", "a faint, perhaps unconscious, hope for acceptance or connection, even in a forced marriage.", "claudius is initially surprised and confused by sejanus's sudden approach", "his surface demeanor one of mild bewilderment and anxiety. he outwardly expresses confusion regarding the need for divorce and the rapid suggestion of a new marriage. internally", "claudius feels overwhelmed and insecure", "accustomed to being directed by others and lacking confidence in his own judgment. he is emotionally resigned to his fate", "anticipating further manipulation and passively accepting sejanus's forceful suggestions without resistance. he may harbor a deep-seated loneliness and a faint", "perhaps unconscious", "hope for acceptance or connection", "even in a forced marriage."],
        ap.active_plans = ["Originally, Claudius intended to visit the ailing Castor, showcasing a rare moment of familial concern.", "Now, his immediate plan shifts to navigating this unexpected and uncomfortable encounter with Sejanus, trying to understand his demands.", "His overriding strategy becomes passive compliance, agreeing to whatever Sejanus proposes to avoid conflict and expedite the interaction."],
        ap.beliefs = ["He believes himself to be inherently flawed and undesirable, referring to himself as a \"lame, sick fool\", reinforcing his low self-esteem.", "He believes that powerful figures like Sejanus possess superior judgment and authority, and therefore their directives should be followed without question.", "He believes that marriage is a matter of political arrangement and familial duty, not personal choice or romantic desire, thus accepting the imposed marriage as inevitable."],
        ap.goals = ["goals_short_term\": \"To escape this awkward and pressured conversation with Sejanus as quickly as possible, agreeing to his demands to end the interaction.", "goals_medium_term\": \"To maintain a low profile and avoid attracting unwanted attention or further manipulation from powerful figures in the court.", "goals_ultimate\": \"To find a measure of peace and quietude in his life, even if it means passively accepting his predetermined role and sacrificing personal autonomy for a semblance of stability and acceptance within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands confidently in the shadowy antechamber, his posture relaxed yet authoritative. He intercepts Claudius with a charming smile, embodying a predatory confidence that belies his manipulative intentions. His gestures are smooth and deliberate, creating an atmosphere of familiarity while steering the conversation toward his agenda.',
        ap.emotional_state = 'Sejanus exudes an air of casual assurance, masking his underlying ambition with a facade of concern for Claudius\'s well-being. While he presents himself as a friend offering guidance, underneath lies a cunning strategist, eager to consolidate his family\'s power through Claudius\'s vulnerability. His internal satisfaction at maneuvering Claudius into an uncomfortable position is palpable.',
        ap.emotional_tags = ["sejanus exudes an air of casual assurance", "masking his underlying ambition with a facade of concern for claudius's well-being. while he presents himself as a friend offering guidance", "underneath lies a cunning strategist", "eager to consolidate his family's power through claudius's vulnerability. his internal satisfaction at maneuvering claudius into an uncomfortable position is palpable."],
        ap.active_plans = ["To manipulate Claudius into considering a divorce from his wife, thus destabilizing Claudius's personal life.", "To propose his sister Aelia as a potential new bride for Claudius, thereby strengthening his family's political ties.", "To cultivate Claudius as a pawn in his political schemes, ensuring his own influence within the imperial court."],
        ap.beliefs = ["Power is best wielded through manipulation and strategic alliances.", "Family loyalty is paramount; leveraging familial connections is a way to secure influence.", "Weakness in others can be exploited for personal gain, particularly in the cutthroat environment of Roman politics."],
        ap.goals = ["Short-term: To convince Claudius to consider a divorce, thereby creating chaos in his personal life.", "Medium-term: To secure a marriage alliance between Claudius and Aelia, strengthening Sejanus's position in the court.", "Ultimate: To enhance his own influence within the imperial hierarchy through strategic manipulation and control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nervously in the antechamber, his body language tense and uncertain. He shuffles slightly, fidgeting as he engages in conversation with Sejanus. His demeanor is marked by hesitation, highlighting his discomfort in navigating the political intrigue surrounding his marriage.',
        ap.emotional_state = 'Claudius displays surface-level confusion and anxiety at the unexpected conversation about his wife\'s pregnancy and the implications of divorce. Internally, he grapples with feelings of inadequacy and bewilderment, sensing the power dynamics at play but struggling to assert himself. His self-deprecating remarks reveal a deep-seated sense of inferiority amidst the sharp machinations of Roman politics.',
        ap.emotional_tags = ["claudius displays surface-level confusion", "anxiety at the unexpected conversation about his wife's pregnancy", "the implications of divorce. internally, he grapples with feelings of inadequacy", "bewilderment, sensing the power dynamics at play but struggling to assert himself. his self-deprecating remarks reveal a deep-seated sense of inferiority amidst the sharp machinations of roman politics.", "claudius displays surface-level confusion and anxiety at the unexpected conversation about his wife's pregnancy and the implications of divorce. internally", "he grapples with feelings of inadequacy and bewilderment", "sensing the power dynamics at play but struggling to assert himself. his self-deprecating remarks reveal a deep-seated sense of inferiority amidst the sharp machinations of roman politics.", "claudius displays surface-level confusion and anxiety at the unexpected conversation about his wife's pregnancy and the implications of divorce. internally, he grapples with feelings of inadequacy and bewilderment, sensing the power dynamics at play", "struggling to assert himself. his self-deprecating remarks reveal a deep-seated sense of inferiority amidst the sharp machinations of roman politics."],
        ap.active_plans = ["To seek clarity on the situation regarding his wife's supposed pregnancy and the implications it carries.", "To navigate his impending divorce while attempting to maintain some semblance of dignity.", "To avoid entanglement in further political schemes that threaten to undermine his already precarious position in the court."],
        ap.beliefs = ["Family bonds are complex and often fraught with betrayal, making trust a rarity.", "His physical ailments render him unworthy of the expectations placed upon him by his family.", "Navigating court politics requires a delicate balance of compliance and self-preservation."],
        ap.goals = ["Short-term: To understand the implications of Sejanus's revelations about his wife's pregnancy.", "Medium-term: To manage the fallout from his divorce and maintain his standing in the court.", "Ultimate: To find a way to navigate the treacherous waters of power dynamics without losing his identity or dignity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Sejanus, embodying confidence and control, intercepts Claudius in the dimly lit antechamber. He stands assertively, blocking Claudius\'s path, his posture radiating authority. Sejanus\'s movements are deliberate and purposeful as he guides the conversation, using gestures to emphasize his points and maintain Claudius\'s attention. He acts as the orchestrator of this encounter, dictating the pace and direction of their exchange.',
        ap.emotional_state = 'Beneath a veneer of affable concern and helpfulness, Sejanus is emotionally detached and calculating. His surface emotions are carefully constructed to appear friendly and persuasive, employing a tone of camaraderie. Internally, he is driven by cold ambition and strategic calculation, viewing Claudius as a pawn in his power plays. There is a stark contrast between his outwardly pleasant demeanor and his manipulative intent to exploit Claudius for his own and his family\'s advancement.',
        ap.emotional_tags = ["beneath a veneer of affable concern", "helpfulness, sejanus is emotionally detached", "calculating. his surface emotions are carefully constructed to appear friendly", "persuasive, employing a tone of camaraderie. internally, he is driven by cold ambition", "strategic calculation, viewing claudius as a pawn in his power plays. there is a stark contrast between his outwardly pleasant demeanor", "his manipulative intent to exploit claudius for his own", "his family's advancement.", "beneath a veneer of affable concern and helpfulness", "sejanus is emotionally detached and calculating. his surface emotions are carefully constructed to appear friendly and persuasive", "employing a tone of camaraderie. internally", "he is driven by cold ambition and strategic calculation", "viewing claudius as a pawn in his power plays. there is a stark contrast between his outwardly pleasant demeanor and his manipulative intent to exploit claudius for his own and his family's advancement."],
        ap.active_plans = ["Secure a strategic alliance with the Julio-Claudian family through marriage.", "Increase his personal influence by becoming Claudius's brother-in-law, gaining closer access to the imperial circle.", "Control Claudius's marital life to ensure it benefits Sejanus's own political agenda and family interests."],
        ap.beliefs = ["Political marriages are essential tools for consolidating power and forging alliances in Rome.", "Claudius is a weak and easily manipulated figure, ripe for exploitation.", "Family advancement and consolidating personal power are paramount objectives in the Roman court."],
        ap.goals = ["{short_term: Ensure Claudius agrees to divorce his current wife and marry Sejanus's sister, Aelia, within this encounter., medium_term: Solidify his family's position and influence within the Roman aristocracy through this advantageous marriage., ultimate: Rise to a position of greater power and control within Rome, potentially even beyond his current role as Praetorian Prefect, using Claudius as a stepping stone.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles nervously into the shadowy antechamber, his physical presence marked by hesitation and unease. Intercepted by Sejanus, he is physically positioned as subordinate and reactive, allowing Sejanus to dictate the interaction. His movements are tentative and uncertain, reflecting his internal discomfort and lack of agency. Claudius\'s posture is slumped and defensive, his stammering speech further emphasizing his vulnerability in this encounter.',
        ap.emotional_state = 'Claudius displays surface emotions of nervousness and self-deprecation, emphasizing his perceived inadequacy as a \'lame, sick fool\'. Internally, he is resigned and melancholic, accustomed to being manipulated and controlled by more powerful figures. He feels a deep sense of powerlessness and a lack of self-worth, readily accepting Sejanus\'s suggestions without resistance. There is an underlying current of weary acceptance of his fate as a pawn in the political games of the imperial court, contrasting with any potential desire for personal autonomy or happiness.',
        ap.emotional_tags = ["claudius displays surface emotions of nervousness", "self-deprecation, emphasizing his perceived inadequacy as a 'lame, sick fool'. internally, he is resigned", "melancholic, accustomed to being manipulated", "controlled by more powerful figures. he feels a deep sense of powerlessness", "a lack of self-worth, readily accepting sejanus's suggestions without resistance. there is an underlying current of weary acceptance of his fate as a pawn in the political games of the imperial court, contrasting with any potential desire for personal autonomy or happiness.", "claudius displays surface emotions of nervousness and self-deprecation", "emphasizing his perceived inadequacy as a 'lame", "sick fool'. internally", "he is resigned and melancholic", "accustomed to being manipulated and controlled by more powerful figures. he feels a deep sense of powerlessness and a lack of self-worth", "readily accepting sejanus's suggestions without resistance. there is an underlying current of weary acceptance of his fate as a pawn in the political games of the imperial court", "contrasting with any potential desire for personal autonomy or happiness."],
        ap.active_plans = ["Initially, Claudius intends to visit the ailing Castor, possibly motivated by familial duty or genuine concern, but this plan is immediately derailed by Sejanus.", "Avoid confrontation with Sejanus and comply with his demands as quickly and painlessly as possible to minimize personal discomfort and potential repercussions.", "Maintain his usual low profile and avoid drawing any unwanted attention to himself, seeking to remain invisible within the dangerous political landscape of the court."],
        ap.beliefs = ["He is inherently flawed and undesirable, believing himself to be a 'lame, sick fool' unworthy of genuine consideration or happiness.", "Resistance against powerful figures like Sejanus and the Emperor is futile and will only lead to greater trouble for himself.", "His personal desires and preferences are insignificant compared to the expectations and machinations of the imperial family and court."],
        ap.goals = ["{short_term: Escape the uncomfortable and unwanted interaction with Sejanus as swiftly as possible by agreeing to his proposals., medium_term: Continue to navigate the treacherous court by remaining compliant and unobtrusive, hoping to avoid becoming a target of political intrigue., ultimate: Find a measure of peace and solitude, perhaps through scholarly pursuits or simply being left alone, even if it means sacrificing personal agency and romantic fulfillment.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Livilla bursts from the antechamber, her disheveled appearance and tear-streaked face highlighting her emotional turmoil. She rushes past Claudius, her pace frantic, embodying desperation as her hands shake slightly, indicating her distress.',
        ap.emotional_state = 'Surface emotions display raw grief and panic; her voice trembles as she repeats, \'He\'s dying. Dying.\' Internally, Livilla wrestles with fear and guilt, feeling a profound sense of loss that contradicts her outward urgency. The depth of her sorrow suggests layers of unspoken conflict regarding her relationship with the dying individual.',
        ap.emotional_tags = ["surface emotions display raw grief", "panic; her voice trembles as she repeats, 'he's dying. dying.' internally, livilla wrestles with fear", "guilt, feeling a profound sense of loss that contradicts her outward urgency. the depth of her sorrow suggests layers of unspoken conflict regarding her relationship with the dying individual.", "surface emotions display raw grief and panic; her voice trembles as she repeats", "'he's dying. dying.' internally", "livilla wrestles with fear and guilt", "feeling a profound sense of loss that contradicts her outward urgency. the depth of her sorrow suggests layers of unspoken conflict regarding her relationship with the dying individual.", "surface emotions display raw grief and panic", "her voice trembles as she repeats, 'he's dying. dying.' internally, livilla wrestles with fear and guilt, feeling a profound sense of loss that contradicts her outward urgency. the depth of her sorrow suggests layers of unspoken conflict regarding her relationship with the dying individual."],
        ap.active_plans = ["To convey her grief and alert others about the impending death, seeking support or understanding from Claudius.", "To process her emotions and assess the implications of this loss on her standing in the court.", "To navigate the immediate aftermath of this death, potentially preparing for the political ramifications it may bring."],
        ap.beliefs = ["The importance of familial bonds, believing that loyalty to her loved ones is paramount.", "The conviction that emotional displays are essential for garnering sympathy and support in the court.", "The belief that the death of a loved one can shift the balance of power within the court, impacting her position."],
        ap.goals = ["Short-term: To seek comfort from Claudius and share her grief.", "Medium-term: To navigate the political fallout from the death and secure her position within the court.", "Ultimate: To preserve her family's legacy and ensure that the deceased's memory is honored within the tumultuous dynamics of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands still in the corridor, a contemplative figure as Livilla rushes past him. His posture reflects a blend of concern and resignation; he appears slightly hunched, as if bearing the weight of his thoughts. He watches her leave, his expression one of muted empathy mixed with an undercurrent of confusion about the state of affairs.',
        ap.emotional_state = 'Externally, Claudius exhibits a calm demeanor, yet internally he grapples with a swell of melancholy and foreboding. He feels the tension of impending loss, recognizing its implications for both family and court. His thoughts betray a deeper conflict regarding his own powerlessness amidst the turmoil of those around him.',
        ap.emotional_tags = ["externally, claudius exhibits a calm demeanor, yet internally he grapples with a swell of melancholy", "foreboding. he feels the tension of impending loss, recognizing its implications for both family", "court. his thoughts betray a deeper conflict regarding his own powerlessness amidst the turmoil of those around him.", "externally", "claudius exhibits a calm demeanor", "yet internally he grapples with a swell of melancholy and foreboding. he feels the tension of impending loss", "recognizing its implications for both family and court. his thoughts betray a deeper conflict regarding his own powerlessness amidst the turmoil of those around him."],
        ap.active_plans = ["To understand the nature of Livilla's distress and its implications for his own life and position.", "To maintain a fa\u00e7ade of composure amid the chaos, reflecting on the significance of mortality in his family.", "To prepare for potential confrontations or shifts in power dynamics following the news of death."],
        ap.beliefs = ["The belief that family bonds are essential, yet often fraught with tension and betrayal.", "The conviction that he must remain observant and adaptable in the shifting sands of court politics.", "The understanding that loss, while deeply personal, is also a matter of political consequence in his world."],
        ap.goals = ["Short-term: To discern the reason for Livilla's distress and offer support if possible.", "Medium-term: To navigate the implications of the death and consider how it may affect his status and relationships in the court.", "Ultimate: To emerge as a figure of stability and understanding even as the court descends further into chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Herod stands in the palace corridor, engaged in a seemingly casual yet pointed conversation with Antonia, Agrippina, and Claudius. He gestures subtly as he speaks, outlining his plans to depart Rome after being rebuffed by Tiberius. His posture is relaxed but alert, suggesting a man accustomed to navigating shifting political landscapes, ready to move on to his next strategic play.',
        ap.emotional_state = 'Herod projects an air of cynical amusement and worldly detachment. He is neither bitter about Tiberius\'s rejection nor overly concerned about the escalating tensions in Rome. Beneath his sardonic humor, there\'s a pragmatic calculation, a sense that emotions are a luxury he cannot afford. He views the Roman court with a detached, almost anthropological interest, observing the madness with a dark, knowing smile.',
        ap.emotional_tags = ["herod projects an air of cynical amusement", "worldly detachment. he is neither bitter about tiberius's rejection nor overly concerned about the escalating tensions in rome. beneath his sardonic humor, there's a pragmatic calculation, a sense that emotions are a luxury he cannot afford. he views the roman court with a detached, almost anthropological interest, observing the madness with a dark, knowing smile.", "herod projects an air of cynical amusement and worldly detachment. he is neither bitter about tiberius's rejection nor overly concerned about the escalating tensions in rome. beneath his sardonic humor", "there's a pragmatic calculation", "a sense that emotions are a luxury he cannot afford. he views the roman court with a detached", "almost anthropological interest", "observing the madness with a dark", "knowing smile."],
        ap.active_plans = ["Depart Rome immediately and travel to Edom, his ancestral homeland.", "Assess the political landscape in Edom, evaluating which of his uncles presents the safest and most advantageous alliance.", "Secure a politically beneficial marriage within the Jewish community to reinforce his cultural and social standing, prioritizing practicality over romantic considerations."],
        ap.beliefs = ["Jewish people are inherently difficult to govern, destined to frustrate and drive their rulers to madness.", "Political power is a treacherous game where survival depends on cunning and self-preservation, not loyalty or sentimentality.", "Marrying within one's own community is a practical necessity, dictated by cultural and dietary differences rather than arrogance."],
        ap.goals = ["Short-term: Escape the increasingly dangerous and unpredictable Roman court.", "Medium-term: Re-establish himself in Edom and secure a stable political position by aligning with a powerful uncle.", "Ultimate: Ensure his long-term survival and potentially regain influence and power, adapting to circumstances outside of Judea and Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Antonia stands in the palace corridor, listening intently to Herod\'s cynical pronouncements, her face etched with worry and concern. She engages directly with both Herod and Claudius, her posture conveying a mix of apprehension and moral disapproval. She is clearly disturbed by the unfolding events and the casual acceptance of treachery she witnesses.',
        ap.emotional_state = 'Antonia is deeply troubled and morally indignant. She expresses disbelief and shock at both Herod\'s cynical pragmatism and Claudius\'s passive acceptance of Sejanus\'s manipulations. Beneath her outward composure, she is anxious about the escalating dangers and the moral decay she perceives within the Roman court. Her tone is sharp and laced with disappointment, particularly towards Claudius, whom she sees as failing to grasp the gravity of the situation.',
        ap.emotional_tags = ["antonia is deeply troubled", "morally indignant. she expresses disbelief", "shock at both herod's cynical pragmatism", "claudius's passive acceptance of sejanus's manipulations. beneath her outward composure, she is anxious about the escalating dangers", "the moral decay she perceives within the roman court. her tone is sharp", "laced with disappointment, particularly towards claudius, whom she sees as failing to grasp the gravity of the situation.", "antonia is deeply troubled and morally indignant. she expresses disbelief and shock at both herod's cynical pragmatism and claudius's passive acceptance of sejanus's manipulations. beneath her outward composure", "she is anxious about the escalating dangers and the moral decay she perceives within the roman court. her tone is sharp and laced with disappointment", "particularly towards claudius", "whom she sees as failing to grasp the gravity of the situation."],
        ap.active_plans = ["Understand Herod's intentions and assess the implications of his departure from Rome.", "Challenge Claudius directly regarding his decision to divorce and marry Sejanus' sister, attempting to dissuade him from this dangerous alliance.", "Express her moral outrage and warn Claudius and Agrippina about the manipulative and dangerous nature of Sejanus's ambition, highlighting the threat he poses to the imperial family."],
        ap.beliefs = ["Moral principles and ethical considerations should guide decisions, even in the treacherous world of Roman politics.", "Family loyalty and traditional values are crucial, and the proposed marriage is a monstrous violation of these principles.", "Sejanus is a fundamentally wicked and power-hungry individual whose ambition threatens to corrupt and destroy the very fabric of Roman society."],
        ap.goals = ["Short-term: Protect Claudius from making a disastrous mistake by marrying into Sejanus's family.", "Medium-term: Uphold a sense of moral order and reason within her immediate circle, even as chaos engulfs the court.", "Ultimate: Safeguard Claudius and Agrippina from the machinations of the court and the rising threat of Sejanus, preserving what little stability and integrity remains within the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands in the palace corridor, her body language tense and agitated as she confronts Claudius. Her face is etched with grief and anger, her voice sharp as she voices her accusations. She is deeply affected by recent events, her posture conveying a mixture of sorrow, outrage, and a growing sense of despair at the relentless tide of betrayal and death.',
        ap.emotional_state = 'Agrippina is consumed by a potent mix of grief, anger, and fear. The recent deaths and suicides of her friends have left her raw and exposed, fueling her outrage at the perceived injustice and cruelty of the regime. She directs her fury at Claudius, seeing his passive acceptance of Sejanus\'s plan as a betrayal. Beneath her anger, there\'s a deep weariness and a sense of encroaching doom, a fear that the escalating violence and treachery will ultimately consume them all.',
        ap.emotional_tags = ["agrippina is consumed by a potent mix of grief, anger,", "fear. the recent deaths", "suicides of her friends have left her raw", "exposed, fueling her outrage at the perceived injustice", "cruelty of the regime. she directs her fury at claudius, seeing his passive acceptance of sejanus's plan as a betrayal. beneath her anger, there's a deep weariness", "a sense of encroaching doom, a fear that the escalating violence", "treachery will ultimately consume them all.", "agrippina is consumed by a potent mix of grief", "anger", "and fear. the recent deaths and suicides of her friends have left her raw and exposed", "fueling her outrage at the perceived injustice and cruelty of the regime. she directs her fury at claudius", "seeing his passive acceptance of sejanus's plan as a betrayal. beneath her anger", "there's a deep weariness and a sense of encroaching doom", "a fear that the escalating violence and treachery will ultimately consume them all."],
        ap.active_plans = ["Express her profound grief and outrage over the deaths of Castor and Silius Caecina, highlighting the devastating consequences of Tiberius's reign.", "Directly confront Claudius, accusing him of weakness and foolishness for agreeing to marry Sejanus' sister, and for failing to recognize Sejanus's dangerous ambition.", "Warn Antonia and Claudius about the imminent threat posed by Sejanus, emphasizing his ruthless ambition and the devastating consequences of his unchecked power."],
        ap.beliefs = ["Sejanus is driven by vile and unchecked ambition, posing a grave threat to the imperial family and Rome itself.", "Claudius is fundamentally weak and cowardly, incapable of understanding or resisting Sejanus's manipulations.", "The current political climate is characterized by relentless persecution and betrayal, where friends vanish and justice is nonexistent."],
        ap.goals = ["Short-term: Vent her immediate anger and frustration, confronting Claudius with the gravity of his actions and inactions.", "Medium-term: Warn Claudius and Antonia of the dangers of Sejanus, hoping to awaken them to the severity of the threat.", "Ultimate: Survive the current political turmoil and protect herself and her remaining allies from further harm, although her hope for long-term stability or justice appears to be dwindling, replaced by a grim acceptance of the escalating chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Claudius walks down the palace corridor and encounters Herod, Antonia, and Agrippina. He stands somewhat awkwardly amidst their intense conversation, listening passively and responding in his characteristic stammering manner when addressed. His physical presence is unassuming, almost blending into the background, as he absorbs the information and emotional intensity swirling around him.',
        ap.emotional_state = 'Claudius is emotionally detached and melancholic, accepting the unfolding events with a sense of weary resignation. He appears unmoved by both Herod\'s cynical pragmatism and Agrippina\'s passionate accusations. Beneath his stammering exterior, there\'s a deep-seated sense of fatalism, a belief that he is powerless to change the course of events. He is neither defensive nor engaged, simply observing the emotional outbursts of others with a detached sadness.',
        ap.emotional_tags = ["claudius is emotionally detached", "melancholic, accepting the unfolding events with a sense of weary resignation. he appears unmoved by both herod's cynical pragmatism", "agrippina's passionate accusations. beneath his stammering exterior, there's a deep-seated sense of fatalism, a belief that he is powerless to change the course of events. he is neither defensive nor engaged, simply observing the emotional outbursts of others with a detached sadness.", "claudius is emotionally detached and melancholic", "accepting the unfolding events with a sense of weary resignation. he appears unmoved by both herod's cynical pragmatism and agrippina's passionate accusations. beneath his stammering exterior", "there's a deep-seated sense of fatalism", "a belief that he is powerless to change the course of events. he is neither defensive nor engaged", "simply observing the emotional outbursts of others with a detached sadness."],
        ap.active_plans = ["Politely engage in the conversation with Herod, Antonia, and Agrippina, offering minimal responses and avoiding direct confrontation.", "Explain his situation regarding the divorce and remarriage to Sejanus' sister when questioned, emphasizing his passive role in the decision.", "Observe and absorb the information and opinions expressed by Herod, Antonia, and Agrippina, particularly Herod's cynical worldview and Agrippina's passionate condemnation of Sejanus and himself."],
        ap.beliefs = ["He is fundamentally powerless and insignificant within the larger political machinations of the Julio-Claudian court.", "Resistance to powerful figures like Sejanus is futile and potentially dangerous, making compliance the safest path to survival.", "His own desires and opinions are irrelevant, and he must accept the decisions made by others, even if they are morally questionable or personally undesirable."],
        ap.goals = ["Short-term: Navigate the immediate social interaction without exacerbating the emotional tension or drawing undue attention to himself.", "Medium-term: Comply with Sejanus's demands regarding the divorce and remarriage, minimizing personal risk and maintaining a low profile.", "Ultimate: Simply survive the current political turmoil, accepting a life of quiet obscurity and detachment, devoid of personal agency or meaningful connection, as the price of endurance in the treacherous Roman court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands assertively within the palace corridor, her posture tense as she directly questions Claudius about the swirling rumors of his marriage. She leans slightly forward, exuding a sense of urgency and determination, her eyes narrowed as if daring Claudius to evade her inquiries.',
        ap.emotional_state = 'Agrippina is driven by a sense of urgency mixed with indignation. Outwardly, her voice conveys a fierce determination to uncover the truth, but beneath, there’s a simmering anxiety about the implications of Claudius\'s potential marriage to Sejanus\' sister, revealing her protective instincts for the family and the empire.',
        ap.emotional_tags = ["agrippina is driven by a sense of urgency mixed with indignation. outwardly, her voice conveys a fierce determination to uncover the truth, but beneath, there\u2019s a simmering anxiety about the implications of claudius's potential marriage to sejanus' sister, revealing her protective instincts for the family", "the empire.", "agrippina is driven by a sense of urgency mixed with indignation. outwardly", "her voice conveys a fierce determination to uncover the truth", "but beneath", "there\u2019s a simmering anxiety about the implications of claudius's potential marriage to sejanus' sister", "revealing her protective instincts for the family and the empire.", "agrippina is driven by a sense of urgency mixed with indignation. outwardly, her voice conveys a fierce determination to uncover the truth,", "beneath, there\u2019s a simmering anxiety about the implications of claudius's potential marriage to sejanus' sister, revealing her protective instincts for the family and the empire."],
        ap.active_plans = ["To probe Claudius for information about the marriage rumors and to challenge his passivity regarding Sejanus's ambitions.", "To safeguard the family's integrity by highlighting the potential dangers of Claudius's compliance.", "To rally her allies against Sejanus's manipulative tactics and protect against his rise in power."],
        ap.beliefs = ["Strongly believes in the importance of familial loyalty and integrity, particularly in the face of treachery.", "Holds a conviction that power should not be wielded by those who lack moral integrity, such as Sejanus.", "Believes that knowledge is power and that uncovering truths is essential to navigate the political landscape."],
        ap.goals = ["Short-term: To get Claudius to acknowledge the rumors about his marriage and defend his intentions.", "Medium-term: To thwart Sejanus's ambitions by rallying support against him within the court.", "Ultimate: To restore a sense of honor and strength to her family amidst the decaying morals of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Antonia stands nearby, her expression a blend of shock and incredulity as Agrippina confronts Claudius about the marriage rumors. Her arms are crossed, and she leans slightly back, as if bracing herself against the weight of the scandal being revealed.',
        ap.emotional_state = 'Antonia\'s surface emotions reflect disbelief and concern, as she reacts sharply to the news of Claudius\'s divorce. Internally, she feels a mix of urgency to protect Claudius from further folly and fear for the implications of his compliance with Sejanus\'s manipulative schemes.',
        ap.emotional_tags = ["antonia's surface emotions reflect disbelief", "concern, as she reacts sharply to the news of claudius's divorce. internally, she feels a mix of urgency to protect claudius from further folly", "fear for the implications of his compliance with sejanus's manipulative schemes.", "antonia's surface emotions reflect disbelief and concern", "as she reacts sharply to the news of claudius's divorce. internally", "she feels a mix of urgency to protect claudius from further folly and fear for the implications of his compliance with sejanus's manipulative schemes."],
        ap.active_plans = ["To challenge Claudius on the morality of his actions and encourage him to reconsider his decisions.", "To raise awareness of Sejanus's ambitions among the court, emphasizing the danger he poses.", "To provide guidance to Claudius, steering him toward wiser choices in the face of political machinations."],
        ap.beliefs = ["Believes in the importance of moral integrity and the responsibilities that come with power.", "Holds a conviction that personal relationships should not be sacrificed for political gain or ambition.", "Values loyalty and honesty as cornerstones of familial strength and unity."],
        ap.goals = ["Short-term: To dissuade Claudius from proceeding with the divorce and marriage to Sejanus's sister.", "Medium-term: To strengthen alliances against Sejanus by raising awareness of his manipulations.", "Ultimate: To restore stability and moral integrity within the imperial court, ensuring that power remains in the hands of those with honorable intentions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the corridor, his body language betraying his unease as he fumbles through his words when confronted about the impending marriage. He shifts his weight from one foot to the other, his gaze darting nervously between Agrippina and Antonia, reflecting his internal struggle and societal pressures.',
        ap.emotional_state = 'Claudius exhibits a facade of resignation mixed with apprehension. Outwardly, he appears defeated and hesitant, but internally, he wrestles with feelings of confusion and fear regarding his identity and role in the court’s ruthless games, underscoring his isolation and vulnerability.',
        ap.emotional_tags = ["claudius exhibits a facade of resignation mixed with apprehension. outwardly, he appears defeated", "hesitant, but internally, he wrestles with feelings of confusion", "fear regarding his identity", "role in the court\u2019s ruthless games, underscoring his isolation", "vulnerability.", "claudius exhibits a facade of resignation mixed with apprehension. outwardly", "he appears defeated and hesitant", "but internally", "he wrestles with feelings of confusion and fear regarding his identity and role in the court\u2019s ruthless games", "underscoring his isolation and vulnerability.", "claudius exhibits a facade of resignation mixed with apprehension. outwardly, he appears defeated and hesitant,", "internally, he wrestles with feelings of confusion and fear regarding his identity and role in the court\u2019s ruthless games, underscoring his isolation and vulnerability."],
        ap.active_plans = ["To navigate the scrutiny of Agrippina and Antonia while attempting to clarify the situation regarding his marriage.", "To find a way to balance Sejanus's demands with the expectations of his peers in the court.", "To maintain his position within the political landscape without attracting further animosity or suspicion."],
        ap.beliefs = ["Believes that avoiding conflict is the best way to maintain peace, even if it means compromising his values.", "Holds a sense of fatalism regarding his role in the empire's power dynamics, feeling like a pawn in a larger game.", "Questions the reliability of familial bonds in a court where betrayal is commonplace, leading to his passive demeanor."],
        ap.goals = ["Short-term: To defuse the tension surrounding the rumors and buy time for clarity regarding his marriage.", "Medium-term: To assess Sejanus's influence and how it impacts his standing within the court.", "Ultimate: To survive in the perilous political landscape of Rome while grappling with his own sense of identity and integrity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Antonia stands in the palace corridor, initially in conversation with Herod and Agrippina, her face etched with concern. Upon Claudius\'s arrival and the revelation of his impending marriage to Sejanus\'s sister, she turns her attention sharply to him. She directly confronts Claudius, her posture firm and her gaze unwavering as she demands an explanation for his astonishing decision.',
        ap.emotional_state = 'Antonia is deeply disturbed by the news, her surface emotion shifting from general worry to outright indignation. Her tone is sharp and accusatory, reflecting her profound disgust at what she perceives as a morally repugnant and politically naive decision by Claudius. Beneath this outward anger lies a deeper layer of frustration and disappointment in Claudius, whom she clearly expects to possess more discernment and backbone in the treacherous court.',
        ap.emotional_tags = ["antonia is deeply disturbed by the news, her surface emotion shifting from general worry to outright indignation. her tone is sharp", "accusatory, reflecting her profound disgust at what she perceives as a morally repugnant", "politically naive decision by claudius. beneath this outward anger lies a deeper layer of frustration", "disappointment in claudius, whom she clearly expects to possess more discernment", "backbone in the treacherous court.", "antonia is deeply disturbed by the news", "her surface emotion shifting from general worry to outright indignation. her tone is sharp and accusatory", "reflecting her profound disgust at what she perceives as a morally repugnant and politically naive decision by claudius. beneath this outward anger lies a deeper layer of frustration and disappointment in claudius", "whom she clearly expects to possess more discernment and backbone in the treacherous court."],
        ap.active_plans = ["To ascertain the truth of the rumour regarding Claudius's marriage to Sejanus's sister.", "To express her vehement moral opposition to the proposed marriage and Sejanus's machinations.", "To awaken Claudius to the dangerous political implications of aligning himself with Sejanus."],
        ap.beliefs = ["Moral principles should not be compromised for political expediency.", "Sejanus is a dangerous and manipulative figure whose ambition poses a threat to the Imperial family.", "Claudius, despite his perceived foolishness, is capable of understanding and acting with greater wisdom and strength."],
        ap.goals = ["Short-term: To immediately convey her disapproval and shock to Claudius.", "Medium-term: To persuade Claudius to reconsider and reject the marriage proposal.", "Ultimate: To protect the integrity and safety of the Imperial family from the insidious influence of Sejanus and morally corrupt schemes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Agrippina is present in the palace corridor, initially engaged in a worried discussion with Antonia and Herod. When Claudius appears, her focus immediately shifts to him. She stands assertively, her body language projecting anger and disappointment as she confronts Claudius directly about his agreement to marry Sejanus\'s sister, her words sharp and accusatory.',
        ap.emotional_state = 'Agrippina is consumed by outrage and disbelief. Her surface emotions are raw anger and bitter disappointment directed at Claudius. She is not merely expressing political concern but personal betrayal, feeling that Claudius has let down the values and memory of their family, particularly Germanicus. Beneath this anger, there\'s a palpable sense of fear and despair about the escalating threats and moral decay within the court, viewing Claudius\'s action as a critical misstep.',
        ap.emotional_tags = ["agrippina is consumed by outrage", "disbelief. her surface emotions are raw anger", "bitter disappointment directed at claudius. she is not merely expressing political concern but personal betrayal, feeling that claudius has let down the values", "memory of their family, particularly germanicus. beneath this anger, there's a palpable sense of fear", "despair about the escalating threats", "moral decay within the court, viewing claudius's action as a critical misstep.", "agrippina is consumed by outrage and disbelief. her surface emotions are raw anger and bitter disappointment directed at claudius. she is not merely expressing political concern but personal betrayal", "feeling that claudius has let down the values and memory of their family", "particularly germanicus. beneath this anger", "there's a palpable sense of fear and despair about the escalating threats and moral decay within the court", "viewing claudius's action as a critical misstep.", "agrippina is consumed by outrage and disbelief. her surface emotions are raw anger and bitter disappointment directed at claudius. she is not merely expressing political concern", "personal betrayal, feeling that claudius has let down the values and memory of their family, particularly germanicus. beneath this anger, there's a palpable sense of fear and despair about the escalating threats and moral decay within the court, viewing claudius's action as a critical misstep."],
        ap.active_plans = ["To directly confront Claudius about the marriage proposal and express her intense disapproval.", "To highlight the dangerous ambition of Sejanus and warn Claudius of the political trap he is walking into.", "To evoke the memory of Germanicus to shame Claudius into recognizing the gravity of his betrayal of family values."],
        ap.beliefs = ["Loyalty to family and their values, especially those of Germanicus, should be paramount.", "Sejanus is driven by 'vile ambition' and poses a significant threat to the family's security and honour.", "Claudius is fundamentally foolish and weak, failing to grasp the dangerous implications of his actions and betraying the family legacy."],
        ap.goals = ["Short-term: To vent her fury at Claudius and make him understand the depth of her disappointment.", "Medium-term: To persuade Claudius to reject the marriage and recognize Sejanus's manipulative intentions.", "Ultimate: To preserve the honour and legacy of her family, particularly Germanicus, and to resist the encroaching corruption and danger posed by figures like Sejanus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the palace corridor from the antechamber, walking somewhat awkwardly. He is immediately intercepted by Antonia and Agrippina who are already in a state of agitation. He stands defensively, stammering as he attempts to respond to their barrage of accusations, his physical presence suggesting discomfort and a desire to retreat from the intense emotional confrontation.',
        ap.emotional_state = 'Claudius displays a surface emotion of mild defensiveness and resignation, stammering and downplaying the significance of the marriage. He appears emotionally detached, almost indifferent to the passionate outrage directed at him. Internally, he is likely feeling overwhelmed and wanting to avoid conflict. He seems to be operating from a place of apathy and perceived powerlessness, believing resistance to Sejanus is futile and that his personal feelings are irrelevant in the grand scheme of courtly politics.',
        ap.emotional_tags = ["claudius displays a surface emotion of mild defensiveness", "resignation, stammering", "downplaying the significance of the marriage. he appears emotionally detached, almost indifferent to the passionate outrage directed at him. internally, he is likely feeling overwhelmed", "wanting to avoid conflict. he seems to be operating from a place of apathy", "perceived powerlessness, believing resistance to sejanus is futile", "that his personal feelings are irrelevant in the grand scheme of courtly politics.", "claudius displays a surface emotion of mild defensiveness and resignation", "stammering and downplaying the significance of the marriage. he appears emotionally detached", "almost indifferent to the passionate outrage directed at him. internally", "he is likely feeling overwhelmed and wanting to avoid conflict. he seems to be operating from a place of apathy and perceived powerlessness", "believing resistance to sejanus is futile and that his personal feelings are irrelevant in the grand scheme of courtly politics."],
        ap.active_plans = ["To explain his situation in the simplest terms, minimizing his own agency in the decision.", "To deflect the intense criticism from Antonia and Agrippina by portraying himself as having no choice or personal investment in the matter.", "To disengage from the emotional confrontation as quickly as possible and retreat from the uncomfortable situation."],
        ap.beliefs = ["His personal desires and opinions hold little weight in the face of powerful figures like Sejanus.", "Resisting Sejanus is a dangerous and pointless endeavor, likely to lead to further trouble for himself.", "Survival in the court necessitates compliance and avoidance of conflict, even if it means compromising personal integrity or familial expectations."],
        ap.goals = ["Short-term: To escape the immediate verbal attack from Antonia and Agrippina.", "Medium-term: To maintain a low profile and avoid drawing further negative attention from powerful figures like Sejanus or his critics.", "Ultimate: To survive in the treacherous political landscape of the Julio-Claudian court by remaining inconspicuous and compliant, even at the cost of personal honour or familial expectations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Herod stands in the corridor, speaking with poise and confidence. His posture is relaxed yet assertive, hands gesturing slightly as he converses, maintaining eye contact with Claudius and the group around him. He embodies a pragmatic presence amidst the chaos of emotion around him.',
        ap.emotional_state = 'Herod projects a calm exterior, masking any internal tension. Outwardly, he appears unfazed by the criticisms directed at Claudius, yet beneath this facade lies a sharp awareness of the precariousness of their political situation. His motivations are rooted in survival, indicating a blend of concern and self-preservation.',
        ap.emotional_tags = ["herod projects a calm exterior, masking any internal tension. outwardly, he appears unfazed by the criticisms directed at claudius, yet beneath this facade lies a sharp awareness of the precariousness of their political situation. his motivations are rooted in survival, indicating a blend of concern", "self-preservation.", "herod projects a calm exterior", "masking any internal tension. outwardly", "he appears unfazed by the criticisms directed at claudius", "yet beneath this facade lies a sharp awareness of the precariousness of their political situation. his motivations are rooted in survival", "indicating a blend of concern and self-preservation."],
        ap.active_plans = ["To defend Claudius against the criticisms of Antonia and Agrippina, emphasizing the need for pragmatism in survival.", "To navigate the political landscape by suggesting that adaptability is essential for enduring the court's dangers.", "To position himself as a voice of reason and practical counsel amidst the emotional turbulence of the others."],
        ap.beliefs = ["Survival in the imperial court requires flexibility and a willingness to 'sway and bend' to shifting allegiances.", "Pride and principles can be detrimental in a world where power dynamics shift unpredictably.", "The harsh realities of ruling often necessitate decisions that may appear cowardly but are fundamentally pragmatic."],
        ap.goals = ["Short-term: To provide immediate support and justification for Claudius's actions, helping him maintain his standing in the court.", "Medium-term: To secure his own position within the shifting power structures of Rome, ensuring his continued relevance.", "Ultimate: To survive the brutal political landscape while navigating the treachery of the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands with her arms crossed, her body language tight and defensive. She leans slightly forward, her brows furrowed, indicating her intense engagement in the conversation and irritation at Claudius\'s choices. Her gestures are sharp, emphasizing her frustration.',
        ap.emotional_state = 'Agrippina is visibly upset, her emotions a tumultuous mix of anger and concern. Outwardly, she expresses frustration towards Claudius\'s weakness, revealing her deep-seated desire for honor and integrity in the court. Internally, she grapples with the fear of losing more allies and friends in the treacherous political landscape.',
        ap.emotional_tags = ["agrippina is visibly upset, her emotions a tumultuous mix of anger", "concern. outwardly, she expresses frustration towards claudius's weakness, revealing her deep-seated desire for honor", "integrity in the court. internally, she grapples with the fear of losing more allies", "friends in the treacherous political landscape.", "agrippina is visibly upset", "her emotions a tumultuous mix of anger and concern. outwardly", "she expresses frustration towards claudius's weakness", "revealing her deep-seated desire for honor and integrity in the court. internally", "she grapples with the fear of losing more allies and friends in the treacherous political landscape."],
        ap.active_plans = ["To confront Claudius about his decision to consider a marriage to Sejanus' sister, emphasizing the moral implications.", "To rally support against Sejanus by highlighting the dangers of his ambition and plotting.", "To assert her authority in the conversation, aiming to influence Claudius towards a more honorable path."],
        ap.beliefs = ["Power should be wielded with integrity and honor, not through cowardice or manipulation.", "The court is rife with danger, and one must maintain vigilance to navigate its treachery.", "Loyalty to friends and family must prevail over political expediency."],
        ap.goals = ["Short-term: To dissuade Claudius from his plans to divorce and marry Sejanus' sister, instilling a sense of honor.", "Medium-term: To build a coalition against Sejanus, positioning herself as a leader who values loyalty.", "Ultimate: To restore integrity and trust within the imperial family while ensuring the safety of her own legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Antonia stands upright, her posture straight and authoritative. She exchanges glances with Agrippina, her expression one of disbelief and concern as she addresses Claudius. Her gestures are minimal but precise, conveying her urgency.',
        ap.emotional_state = 'Antonia exhibits a mix of shock and disappointment in response to Claudius’s decisions. Outwardly, she challenges Claudius, pressing for clarity and accountability, while internally, she feels the weight of the court\'s moral decay and her own frustration at the cycle of ambition and betrayal.',
        ap.emotional_tags = ["antonia exhibits a mix of shock", "disappointment in response to claudius\u2019s decisions. outwardly, she challenges claudius, pressing for clarity", "accountability, while internally, she feels the weight of the court's moral decay", "her own frustration at the cycle of ambition", "betrayal.", "antonia exhibits a mix of shock and disappointment in response to claudius\u2019s decisions. outwardly", "she challenges claudius", "pressing for clarity and accountability", "while internally", "she feels the weight of the court's moral decay and her own frustration at the cycle of ambition and betrayal.", "antonia exhibits a mix of shock and disappointment in response to claudius\u2019s decisions. outwardly, she challenges claudius, pressing for clarity and accountability,", "internally, she feels the weight of the court's moral decay and her own frustration at the cycle of ambition and betrayal."],
        ap.active_plans = ["To challenge Claudius regarding his willingness to consider a marriage to Sejanus' sister, seeking clarity on his motivations.", "To lend her voice to Agrippina\u2019s concerns, reinforcing the dangers posed by Sejanus.", "To position herself as a moral compass within the court, advocating for integrity and wisdom in decision-making."],
        ap.beliefs = ["Moral integrity is essential in leadership, and one must act with honor even amidst chaos.", "The political landscape is fraught with peril, and vigilance is necessary to protect oneself and allies.", "Betrayal is a corrosive force that must be addressed rather than ignored."],
        ap.goals = ["Short-term: To gain clarity from Claudius about his marriage decisions and instill a sense of responsibility.", "Medium-term: To unite others against Sejanus's ambitions, advocating for a more honorable approach to politics.", "Ultimate: To help restore a sense of integrity and moral compass to the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands somewhat awkwardly, his posture reflecting his discomfort in the tense conversation. He fidgets slightly, his eyes shifting as he responds to the criticisms and revelations about Sejanus\'s intentions, embodying his internal conflict.',
        ap.emotional_state = 'Claudius feels a deep sense of melancholy and apprehension as he contemplates his place in this deadly game of ambition. Outwardly, he appears hesitant and uncertain, struggling to articulate his thoughts. Internally, he battles feelings of inadequacy and the heavy burden of his family\'s legacy, realizing the implications of Sejanus\'s proposal.',
        ap.emotional_tags = ["claudius feels a deep sense of melancholy", "apprehension as he contemplates his place in this deadly game of ambition. outwardly, he appears hesitant", "uncertain, struggling to articulate his thoughts. internally, he battles feelings of inadequacy", "the heavy burden of his family's legacy, realizing the implications of sejanus's proposal.", "claudius feels a deep sense of melancholy and apprehension as he contemplates his place in this deadly game of ambition. outwardly", "he appears hesitant and uncertain", "struggling to articulate his thoughts. internally", "he battles feelings of inadequacy and the heavy burden of his family's legacy", "realizing the implications of sejanus's proposal."],
        ap.active_plans = ["To clarify his position regarding Sejanus's proposal to marry his sister, attempting to assert himself despite his stammering.", "To navigate the criticisms from Agrippina and Antonia while maintaining his fragile standing in the court.", "To seek understanding regarding his role in the web of intrigue surrounding him, especially in light of Livia's impending death."],
        ap.beliefs = ["Navigating the treacherous political landscape requires cautious adaptability, even if it appears cowardly.", "The weight of my family's legacy burdens my decisions, forcing me into uncomfortable compromises.", "Survival in the court often necessitates aligning with powerful figures, regardless of their morality."],
        ap.goals = ["Short-term: To explain his situation regarding Urganalilla and Sejanus without further alienating his allies.", "Medium-term: To understand the implications of the court's shifting dynamics while preserving his own safety.", "Ultimate: To carve out a place for himself in the Julio-Claudian dynasty without succumbing to its darker ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_6'})
    ON CREATE SET
        ap.current_status = 'Claudius is alone in his mind, his voice echoing as a voiceover. He is physically absent from the scene in terms of action, but his internal world is intensely active. He is processing the conversation he just had, specifically Herod\'s cynical remark and its implications for his own life within the treacherous court. He is in motion mentally, tracing the contours of his reality.',
        ap.emotional_state = 'Claudius is imbued with a profound melancholy and resignation. A sense of weary acceptance washes over him as he recognizes the truth in Herod\'s bleak assessment of his survival. He is not overtly expressing sadness, but a deep undercurrent of sorrow pervades his thoughts as he contemplates the fates of those who are \'gone.\' There\'s a hint of self-deprecation, yet also a stoic understanding of his position as a survivor in a deadly game.',
        ap.emotional_tags = ["claudius is imbued with a profound melancholy", "resignation. a sense of weary acceptance washes over him as he recognizes the truth in herod's bleak assessment of his survival. he is not overtly expressing sadness, but a deep undercurrent of sorrow pervades his thoughts as he contemplates the fates of those who are 'gone.' there's a hint of self-deprecation, yet also a stoic understanding of his position as a survivor in a deadly game.", "claudius is imbued with a profound melancholy and resignation. a sense of weary acceptance washes over him as he recognizes the truth in herod's bleak assessment of his survival. he is not overtly expressing sadness", "but a deep undercurrent of sorrow pervades his thoughts as he contemplates the fates of those who are 'gone.' there's a hint of self-deprecation", "yet also a stoic understanding of his position as a survivor in a deadly game.", "claudius is imbued with a profound melancholy and resignation. a sense of weary acceptance washes over him as he recognizes the truth in herod's bleak assessment of his survival. he is not overtly expressing sadness,", "a deep undercurrent of sorrow pervades his thoughts as he contemplates the fates of those who are 'gone.' there's a hint of self-deprecation, yet also a stoic understanding of his position as a survivor in a deadly game."],
        ap.active_plans = ["To passively observe and absorb the lessons of the court's brutality, using his detached perspective as a shield.", "To continue his strategy of 'swaying and bending,' prioritizing survival over active participation or confrontation.", "To internally process the implications of Livia's impending death and what it signifies for the future of the dynasty and his own fate."],
        ap.beliefs = ["Survival in the Julio-Claudian court necessitates a degree of passivity and adaptability, as Herod's observation suggests.", "Power within his family is inherently corrupting and destructive, leading to the downfall of even the most powerful figures.", "His own perceived weakness and insignificance are paradoxical strengths, allowing him to remain unnoticed and thus, alive, while others around him fall."],
        ap.goals = ["Short-term: To maintain his unobtrusive presence in the court, avoiding becoming a target of suspicion or ambition.", "Medium-term: To outlast the current turmoil and power struggles, recognizing that longevity is a form of victory in this environment.", "Ultimate: To understand the dynamics of power and survival within his family, perhaps with a long-term, unspoken aspiration to one day leverage his accumulated knowledge and experience, though this remains deeply subconscious in this moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Claudius walks slowly through the vibrant palace gardens, his hands tucked into the folds of his tunic. His posture is hunched, suggesting both introspection and a weighty burden. He pauses frequently, gazing at the blooming flowers around him but appearing detached from their beauty, as if they only serve to amplify his internal turmoil.',
        ap.emotional_state = 'On the surface, Claudius shows a melancholic demeanor, his brow furrowed and lips pressed into a thin line, reflecting a profound sadness. Internally, he battles a mix of fear and uncertainty regarding Livia\'s illness. This fear is compounded by the realization that her death could unravel the fragile political landscape of Rome, creating a tension between his loyalty to her and the looming threat of political upheaval.',
        ap.emotional_tags = ["on the surface, claudius shows a melancholic demeanor, his brow furrowed", "lips pressed into a thin line, reflecting a profound sadness. internally, he battles a mix of fear", "uncertainty regarding livia's illness. this fear is compounded by the realization that her death could unravel the fragile political landscape of rome, creating a tension between his loyalty to her", "the looming threat of political upheaval.", "on the surface", "claudius shows a melancholic demeanor", "his brow furrowed and lips pressed into a thin line", "reflecting a profound sadness. internally", "he battles a mix of fear and uncertainty regarding livia's illness. this fear is compounded by the realization that her death could unravel the fragile political landscape of rome", "creating a tension between his loyalty to her and the looming threat of political upheaval."],
        ap.active_plans = ["To contemplate the implications of Livia's declining health on his own position and future in the court.", "To reconcile his feelings of loyalty toward Livia with the harsh realities of political necessity.", "To prepare himself for the potential shifts in power dynamics that her death might provoke."],
        ap.beliefs = ["Belief in the necessity of political maneuvering for survival within the dangerous game of the Roman court.", "Conviction that familial loyalty can be both a strength and a vulnerability.", "Understanding that power in Rome is fleeting and must be navigated with caution."],
        ap.goals = ["Short-term: To adequately process Livia's illness and its implications without succumbing to despair.", "Medium-term: To position himself strategically in the event of Livia's death to safeguard his own interests.", "Ultimate: To emerge from Livia's shadow and assert his own agency within the court dynamics."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_coin_event_14_5'})
    ON CREATE SET
        oi.description = 'The coin is the central object of a poignant ritual in Livia\'s final moments. Upon her explicit request, Claudius retrieves the coin from his tunic and gently places it into her mouth. This act is performed to ensure Livia has the necessary payment for Charon, the ferryman of the underworld, as per Roman tradition. The coin serves as a tangible representation of mortality, the transition to the afterlife, and the fulfillment of Livia\'s last wish, blending her imperial ambition with a basic human concern for the journey beyond death. It is a crucial element in enacting a culturally significant funerary rite.',
        oi.status_before = 'Prior to the event, the coin is in Claudius\'s possession, carried within his tunic. Its exact origin or purpose for being carried by Claudius is not explicitly stated, but it is implied that he might carry it as a customary practice or in anticipation of such a need, demonstrating a preparedness or awareness of Roman funerary traditions.',
        oi.status_after = 'After the event, the coin is placed inside Livia\'s mouth and remains with her as she passes away. It transitions from a common currency to a symbolic funerary object, now integral to Livia\'s body and her preparation for the afterlife journey. The coin\'s status is elevated from a simple item of value to a culturally significant artifact accompanying the deceased into the underworld, marking the finality of her earthly existence and the beginning of her supposed journey beyond.'
    WITH oi
    MATCH (o:Object {uuid: 'object_coin'})
    MATCH (e:Event {uuid: 'event_14_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Antonia stands firmly positioned near the doorway of Livia\'s private bedchamber, acting as an impassable barrier until Claudius moves. Her body language is stiff, conveying a sense of duty and grim resignation. She directly addresses Claudius, her words clipped and urgent, delivering the stark pronouncement of Livia\'s impending death with a tone that brooks no argument or delay.',
        ap.emotional_state = 'Antonia\'s surface emotions are a palpable blend of grief and impatience, her face etched with sorrow yet her voice sharp with urgency. Internally, she is wrestling with the sadness of Livia\'s decline and perhaps a weariness of the endless courtly dramas, even at death\'s door. There\'s an unspoken conflict between her genuine grief and her pragmatic need to manage the situation efficiently, reflecting her role as a grounded, rational figure amidst the chaos.',
        ap.emotional_tags = ["antonia's surface emotions are a palpable blend of grief", "impatience, her face etched with sorrow yet her voice sharp with urgency. internally, she is wrestling with the sadness of livia's decline", "perhaps a weariness of the endless courtly dramas, even at death's door. there's an unspoken conflict between her genuine grief", "her pragmatic need to manage the situation efficiently, reflecting her role as a grounded, rational figure amidst the chaos.", "antonia's surface emotions are a palpable blend of grief and impatience", "her face etched with sorrow yet her voice sharp with urgency. internally", "she is wrestling with the sadness of livia's decline and perhaps a weariness of the endless courtly dramas", "even at death's door. there's an unspoken conflict between her genuine grief and her pragmatic need to manage the situation efficiently", "reflecting her role as a grounded", "rational figure amidst the chaos."],
        ap.active_plans = ["Inform Claudius of the grave nature of Livia's condition and her imminent death.", "Relay Livia's specific request for Claudius to visit her bedside, despite her own bewilderment at the Empress's motives.", "Urge Claudius to promptly enter Livia's bedchamber, emphasizing the urgency of the situation and the limited time remaining."],
        ap.beliefs = ["Death is an undeniable and solemn event that demands recognition and respect.", "Family members, regardless of personal feelings, have a responsibility to be present during a relative's final moments.", "Practicality and directness are necessary, even in emotionally charged situations, to ensure clarity and appropriate action."],
        ap.goals = ["short_term\": \"Ensure Claudius understands the severity of Livia's condition and the need for immediate action.", "medium_term\": \"Facilitate a meeting between Claudius and Livia as per the dying Empress's request, regardless of her own understanding.", "ultimate\": \"Maintain a semblance of order and familial duty amidst the unfolding tragedy, upholding decorum and managing expectations within the imperial household."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles hesitantly into the scene, his movements slow and uncertain as he absorbs Antonia\'s pronouncement. He initially remains stationary, \'sitting there\', his posture suggesting a degree of disbelief or reluctance to accept the news. Only under Antonia\'s prompting does he begin to move, advancing slowly and cautiously towards Livia\'s bedchamber, his physical presence reflecting his internal hesitation.',
        ap.emotional_state = 'Claudius outwardly displays a mixture of shock and disbelief at Antonia\'s stark news, questioning the suddenness of Livia\'s decline (\'Dying? But it was only a cold.\'). Internally, he is likely navigating a complex web of emotions—sadness at the impending death of his powerful grandmother, perhaps tinged with a sense of relief or detachment given their fraught relationship. He seems overwhelmed by the gravity of the situation, needing a moment to process the implications of Livia\'s imminent demise and her unexpected summons.',
        ap.emotional_tags = ["claudius outwardly displays a mixture of shock", "disbelief at antonia's stark news, questioning the suddenness of livia's decline ('dying? but it was only a cold.'). internally, he is likely navigating a complex web of emotions\u2014sadness at the impending death of his powerful grandmother, perhaps tinged with a sense of relief or detachment given their fraught relationship. he seems overwhelmed by the gravity of the situation, needing a moment to process the implications of livia's imminent demise", "her unexpected summons.", "claudius outwardly displays a mixture of shock and disbelief at antonia's stark news", "questioning the suddenness of livia's decline ('dying? but it was only a cold.'). internally", "he is likely navigating a complex web of emotions\u2014sadness at the impending death of his powerful grandmother", "perhaps tinged with a sense of relief or detachment given their fraught relationship. he seems overwhelmed by the gravity of the situation", "needing a moment to process the implications of livia's imminent demise and her unexpected summons."],
        ap.active_plans = ["Process the unexpected and impactful news of Livia's rapidly approaching death, attempting to reconcile it with his previous understanding of her health.", "Comprehend the reason behind Livia's sudden and specific request for his presence at her deathbed, pondering her potential motives.", "Reluctantly comply with Antonia's directive to approach Livia's bedside, despite his internal reservations and the somber atmosphere of the scene."],
        ap.beliefs = ["The course of illness can be unpredictable and swift, capable of turning a seemingly minor ailment into a fatal condition.", "Familial obligations, even towards complex and manipulative figures like Livia, are generally expected and should be observed.", "His own presence and opinions are often undervalued or dismissed by the more powerful members of his family, making his role in such situations uncertain."],
        ap.goals = ["short_term\": \"Grasp the immediate reality of Livia's situation and understand the implications of Antonia's announcement.", "medium_term\": \"Ascertain Livia's intentions in summoning him and determine the appropriate way to respond to her dying wishes.", "ultimate\": \"Navigate the treacherous dynamics of his family and the imperial court while minimizing personal vulnerability and maintaining a position of cautious observation, even in moments of familial crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the dim room with a hesitant shuffle, his demeanor marked by a deep respect and trepidation as he approaches the frail figure of Livia on her deathbed. His body language is closed; shoulders slightly hunched and movements slow, reflecting his internal struggle with the gravity of the moment.',
        ap.emotional_state = 'Claudius exhibits a surface-level calmness, but his trembling hands and wavering voice betray his inner turmoil and sorrow. He is torn between his familial duty and the looming specter of loss, grappling with the weight of his grandmother\'s impending death and her haunting ambitions.',
        ap.emotional_tags = ["claudius exhibits a surface-level calmness, but his trembling hands", "wavering voice betray his inner turmoil", "sorrow. he is torn between his familial duty", "the looming specter of loss, grappling with the weight of his grandmother's impending death", "her haunting ambitions.", "claudius exhibits a surface-level calmness", "but his trembling hands and wavering voice betray his inner turmoil and sorrow. he is torn between his familial duty and the looming specter of loss", "grappling with the weight of his grandmother's impending death and her haunting ambitions.", "claudius exhibits a surface-level calmness,", "his trembling hands and wavering voice betray his inner turmoil and sorrow. he is torn between his familial duty and the looming specter of loss, grappling with the weight of his grandmother's impending death and her haunting ambitions."],
        ap.active_plans = ["To comfort Livia in her final moments, providing her solace and companionship.", "To reassure Livia of her wish to become a goddess, attempting to fulfill her desperate need for legacy.", "To navigate the emotional complexity of his family's tumultuous legacy while grappling with his own identity."],
        ap.beliefs = ["He believes in the importance of familial loyalty and duty, driving him to be present for Livia.", "He harbors a conviction that legacy and recognition are paramount, which influences his promise to Livia.", "He holds a deep-seated fear of the brutal ambitions prevalent in his lineage, complicating his interactions."],
        ap.goals = ["Short-term: To provide emotional support to Livia as she faces death.", "Medium-term: To navigate the treacherous dynamics of the imperial court while maintaining his integrity.", "Ultimate: To reconcile his heritage with his own identity and perhaps rise above the legacy of ambition and betrayal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Livia lies frail and weak on her deathbed, her breathing shallow, a mere shadow of her former imposing self. She is positioned under dim light, her gaze fixated on Claudius, embodying a desperate need for affirmation. Her gestures are minimal, but her words are charged with ambition.',
        ap.emotional_state = 'Despite her physical decline, Livia\'s surface emotion is one of fierce determination, clinging to her ambition for deification even as she faces death. Internally, she grapples with fear and desperation, revealing a vulnerability masked by her lifelong ambition and a need for legacy.',
        ap.emotional_tags = ["despite her physical decline, livia's surface emotion is one of fierce determination, clinging to her ambition for deification even as she faces death. internally, she grapples with fear", "desperation, revealing a vulnerability masked by her lifelong ambition", "a need for legacy.", "despite her physical decline", "livia's surface emotion is one of fierce determination", "clinging to her ambition for deification even as she faces death. internally", "she grapples with fear and desperation", "revealing a vulnerability masked by her lifelong ambition and a need for legacy."],
        ap.active_plans = ["To extract a promise from Claudius to ensure her deification after death, reflecting her enduring ambition.", "To secure her legacy and eternal recognition, demonstrating that her life and power have not been in vain.", "To confront her fears of being forgotten or damned, seeking reassurance and fulfillment of her desires in her last moments."],
        ap.beliefs = ["She believes that achieving godhood is the ultimate validation of her life's ambitions and sacrifices.", "She is convinced that her legacy must continue beyond death, reflecting her desire for immortality.", "She holds a pragmatic view of power, seeing it as the key to legacy and self-worth, even in her dying moments."],
        ap.goals = ["Short-term: To receive comfort and assurance from Claudius, solidifying her influence over him even in death.", "Medium-term: To ensure that her legacy is secured through the promise of deification.", "Ultimate: To be remembered as a powerful figure who transcended mortality, leaving a lasting impact on the world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Livia lies frail and weak in her bedchamber, her breathing shallow and labored as death approaches. She is physically diminished, barely able to move, confined to her bed and reliant on others. Despite her physical weakness, her mind is still sharp, focused on her desires for legacy and godhood, as she listens to Caligula and then Claudius with intent.',
        ap.emotional_state = 'Livia is a complex mix of desperation and fading hope. Initially, she clings to her ambition of becoming a goddess, seeking validation of her promise from Claudius. Caligula\'s cruel rejection devastates her, plunging her into despair and fear of hell. Yet, beneath the surface, her fierce desire for immortality persists, evident in her urgent plea to Claudius and her final request for the coin, showing an underlying terror of oblivion.',
        ap.emotional_tags = ["livia is a complex mix of desperation", "fading hope. initially, she clings to her ambition of becoming a goddess, seeking validation of her promise from claudius. caligula's cruel rejection devastates her, plunging her into despair", "fear of hell. yet, beneath the surface, her fierce desire for immortality persists, evident in her urgent plea to claudius", "her final request for the coin, showing an underlying terror of oblivion.", "livia is a complex mix of desperation and fading hope. initially", "she clings to her ambition of becoming a goddess", "seeking validation of her promise from claudius. caligula's cruel rejection devastates her", "plunging her into despair and fear of hell. yet", "beneath the surface", "her fierce desire for immortality persists", "evident in her urgent plea to claudius and her final request for the coin", "showing an underlying terror of oblivion."],
        ap.active_plans = ["Secure Claudius's promise to deify her after death, ensuring her legacy.", "Express her terror and despair at Caligula's rejection of her godhood.", "Make arrangements for her passage to the afterlife by requesting the coin for Charon."],
        ap.beliefs = ["Believes in the Roman pantheon and the possibility of mortals becoming gods.", "Believes she deserves divine status due to her earthly power and ambition.", "Believes in the necessity of traditional rituals for the afterlife, such as payment to Charon."],
        ap.goals = ["Short-term: To receive reassurance from Claudius and secure the coin for her journey to the underworld.", "Medium-term: To be deified and remembered as the 'Queen of Heaven' after her death.", "Ultimate: To transcend mortality and achieve a form of immortality through divine status and lasting legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Caligula bursts into the room, radiating a disturbing vitality amidst the somber atmosphere of death. He stands over Livia\'s bed, dominating the space with his cruel energy, ignoring Claudius\'s presence entirely as if he were insignificant. After delivering his venomous speech, he sweeps out with theatrical flair, leaving chaos and despair in his wake.',
        ap.emotional_state = 'Caligula is gleefully sadistic and utterly devoid of empathy. He derives pleasure from Livia\'s suffering and vulnerability, reveling in the power he holds over her in her dying moments. His emotions are a chilling mix of triumph, contempt, and self-aggrandizement, expressing a complete lack of respect or familial affection. Beneath this cruelty, there\'s a narcissistic desire for recognition and power, driving his need to assert his dominance over everyone, even the dying.',
        ap.emotional_tags = ["caligula is gleefully sadistic", "utterly devoid of empathy. he derives pleasure from livia's suffering", "vulnerability, reveling in the power he holds over her in her dying moments. his emotions are a chilling mix of triumph, contempt,", "self-aggrandizement, expressing a complete lack of respect or familial affection. beneath this cruelty, there's a narcissistic desire for recognition", "power, driving his need to assert his dominance over everyone, even the dying.", "caligula is gleefully sadistic and utterly devoid of empathy. he derives pleasure from livia's suffering and vulnerability", "reveling in the power he holds over her in her dying moments. his emotions are a chilling mix of triumph", "contempt", "and self-aggrandizement", "expressing a complete lack of respect or familial affection. beneath this cruelty", "there's a narcissistic desire for recognition and power", "driving his need to assert his dominance over everyone", "even the dying."],
        ap.active_plans = ["Humiliate and torment Livia in her final moments, denying her the godhood she craves.", "Assert his own impending deification, proclaiming himself greater than Augustus.", "Intimidate Claudius by completely disregarding him, reinforcing his own sense of superiority and power."],
        ap.beliefs = ["Believes in his own destiny to become a god, fueled by prophecy and narcissism.", "Believes Livia is now weak and insignificant, no longer useful to him.", "Believes in a hierarchical structure of power, where he is destined to be at the apex, surpassing even established deities."],
        ap.goals = ["Short-term: Inflict maximum emotional pain on Livia, assert his dominance in the room, and make a dramatic exit.", "Medium-term: To be officially deified after Tiberius's death, establishing a cult of personality around himself.", "Ultimate: To become the supreme god of the Roman world, surpassing all others in power and worship, achieving unparalleled and terrifying legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the bedchamber hesitantly, shuffling with his characteristic awkwardness. He stands back initially, observing Antonia and then approaching Livia\'s bedside with a subdued demeanor. He remains largely passive during Caligula\'s outburst, focusing on Livia after Caligula\'s dramatic exit. He then steps forward to comfort her, retrieves the coin, and performs the traditional act of placing it in her mouth.',
        ap.emotional_state = 'Claudius is a somber mix of grief and compassion. He is saddened by Livia\'s imminent death and initially expresses awkward sympathy. Witnessing Caligula\'s cruelty, he feels a surge of pity for Livia and perhaps a quiet apprehension about Caligula\'s increasingly apparent madness.  Beneath his outward awkwardness, there\'s a deep-seated sense of empathy and a resigned acceptance of the tragic nature of his family, contrasting sharply with Caligula\'s sadistic glee.',
        ap.emotional_tags = ["claudius is a somber mix of grief", "compassion. he is saddened by livia's imminent death", "initially expresses awkward sympathy. witnessing caligula's cruelty, he feels a surge of pity for livia", "perhaps a quiet apprehension about caligula's increasingly apparent madness.  beneath his outward awkwardness, there's a deep-seated sense of empathy", "a resigned acceptance of the tragic nature of his family, contrasting sharply with caligula's sadistic glee.", "claudius is a somber mix of grief and compassion. he is saddened by livia's imminent death and initially expresses awkward sympathy. witnessing caligula's cruelty", "he feels a surge of pity for livia and perhaps a quiet apprehension about caligula's increasingly apparent madness.  beneath his outward awkwardness", "there's a deep-seated sense of empathy and a resigned acceptance of the tragic nature of his family", "contrasting sharply with caligula's sadistic glee."],
        ap.active_plans = ["Visit Livia in her final moments as requested, showing familial duty despite their complex relationship.", "Offer comfort and reassurance to Livia after Caligula's cruel departure, mitigating the damage of Caligula\u2019s words.", "Fulfill Livia's last wish by providing the coin for Charon, participating in the traditional Roman death rite."],
        ap.beliefs = ["Believes in Roman traditions and customs surrounding death, including the need for Charon's coin.", "Believes in showing a degree of compassion and respect to family, even those as manipulative as Livia, especially in death.", "Believes in the inherent cruelty and instability of his family, accepting it as an unavoidable aspect of his lineage."],
        ap.goals = ["Short-term: To provide comfort to Livia in her dying moments and perform the necessary rituals for her passing.", "Medium-term: To navigate the dangerous political landscape after Livia's death, potentially by remaining underestimated and observant.", "Ultimate: To survive the Julio-Claudian dynasty and potentially find a measure of peace and stability amidst the chaos, perhaps by outliving those consumed by ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the dimly lit chamber, his posture hesitant and weighted with concern. He shuffles slowly toward Livia\'s frail figure on the bed, his movements deliberate, conveying both his respect and apprehension. As he approaches, he leans over her, a gesture filled with compassion, seeking to connect with her in her moment of vulnerability.',
        ap.emotional_state = 'Claudius’s surface emotions reflect deep concern and sorrow; his voice quivers with empathy as he tries to reassure Livia. Internally, he grapples with a mix of pity and fear, recognizing the gravity of her condition and the implications of her desperation for divine acknowledgment. There is a clear tension between his desire to comfort her and the knowledge of their family’s dark legacy.',
        ap.emotional_tags = ["claudius\u2019s surface emotions reflect deep concern", "sorrow; his voice quivers with empathy as he tries to reassure livia. internally, he grapples with a mix of pity", "fear, recognizing the gravity of her condition", "the implications of her desperation for divine acknowledgment. there is a clear tension between his desire to comfort her", "the knowledge of their family\u2019s dark legacy.", "claudius\u2019s surface emotions reflect deep concern and sorrow; his voice quivers with empathy as he tries to reassure livia. internally", "he grapples with a mix of pity and fear", "recognizing the gravity of her condition and the implications of her desperation for divine acknowledgment. there is a clear tension between his desire to comfort her and the knowledge of their family\u2019s dark legacy.", "claudius\u2019s surface emotions reflect deep concern and sorrow", "his voice quivers with empathy as he tries to reassure livia. internally, he grapples with a mix of pity and fear, recognizing the gravity of her condition and the implications of her desperation for divine acknowledgment. there is a clear tension between his desire to comfort her and the knowledge of their family\u2019s dark legacy."],
        ap.active_plans = ["To comfort Livia in her final moments and provide reassurance amid her fear of dying.", "To fulfill Livia's wish for immortality by promising her a place among the gods, despite the absurdity of the claim.", "To maintain a sense of dignity and familial connection as Livia faces her imminent death."],
        ap.beliefs = ["Claudius believes in the sanctity of family and feels a deep-rooted obligation to support Livia during her decline.", "He holds onto a hope that kindness can transcend the manipulative cruelty that has defined his family's legacy.", "Claudius believes that by promising Livia immortality, he can offer her a semblance of peace, even if it is only a temporary comfort."],
        ap.goals = ["Short-term: To provide comfort to Livia in her time of need.", "Medium-term: To convince Livia that her desire to be a goddess is achievable, serving as a final act of kindness.", "Ultimate: To forge a path of his own, emerging from the shadows and establishing his identity apart from the brutality of his family's politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Livia lies frail and gasping on the bed, her body a shadow of its former self. The light around her is dim, enhancing the sense of her decline. She struggles to articulate her desires, leaning on her last remaining strength to convey her wish to Claudius. Her gestures are feeble, marked by desperation as she reaches out for comfort.',
        ap.emotional_state = 'Outwardly, Livia displays fear and vulnerability, her shallow breaths punctuating her desperate need for validation. Deep down, she is consumed by a mix of dread regarding her mortality and a fierce longing for her legacy to be secured through divinity. Her confrontation with Caligula’s cruelty exacerbates her internal conflicts, illustrating her hidden insecurities and the existential dread of being forgotten.',
        ap.emotional_tags = ["outwardly, livia displays fear", "vulnerability, her shallow breaths punctuating her desperate need for validation. deep down, she is consumed by a mix of dread regarding her mortality", "a fierce longing for her legacy to be secured through divinity. her confrontation with caligula\u2019s cruelty exacerbates her internal conflicts, illustrating her hidden insecurities", "the existential dread of being forgotten.", "outwardly", "livia displays fear and vulnerability", "her shallow breaths punctuating her desperate need for validation. deep down", "she is consumed by a mix of dread regarding her mortality and a fierce longing for her legacy to be secured through divinity. her confrontation with caligula\u2019s cruelty exacerbates her internal conflicts", "illustrating her hidden insecurities and the existential dread of being forgotten."],
        ap.active_plans = ["To secure Claudius's promise of becoming a goddess as a means to validate her life and legacy.", "To confront her fears of damnation and seek reassurance from Claudius amid the emotional turmoil.", "To manipulate Claudius's compassion in a final bid to maintain control over her narrative and destiny."],
        ap.beliefs = ["Livia believes that achieving divinity is the ultimate affirmation of her power and legacy.", "She holds a conviction that vulnerability is a weakness in the political arena, yet she allows herself to be vulnerable with Claudius out of necessity.", "Livia believes in the importance of familial bonds, particularly in her last moments, revealing a complexity beneath her usual coldness."],
        ap.goals = ["Short-term: To find solace and comfort in Claudius as she faces death.", "Medium-term: To ensure her legacy by persuading Claudius to promise her a divine status.", "Ultimate: To transcend her impending death by securing an immortal legacy that would solidify her influence even in death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Claudius shuffles hesitantly into Livia\'s somber bedchamber, his movements slow and respectful in the face of death. He stands near Livia\'s bedside, listening attentively as she speaks, his gaze fixed upon her frail form.  Responding to her request, he fumbles within his tunic and retrieves a coin, his actions deliberate and gentle as he places it into her mouth, a final act of solemn farewell.',
        ap.emotional_state = 'A deep melancholy permeates Claudius\'s demeanor as he witnesses Livia\'s final moments. Outwardly, he is composed and respectful, addressing her formally as \'Great Grandmother\' and \'Grandmother\'. However, internally, he is moved by a profound sadness at her impending death, tinged with a quiet compassion for her vulnerability in the face of mortality. He expresses a tender concern, attempting to comfort her distress after Caligula\'s cruel outburst, revealing a capacity for empathy despite the treacherous court dynamics.',
        ap.emotional_tags = ["a deep melancholy permeates claudius's demeanor as he witnesses livia's final moments. outwardly, he is composed", "respectful, addressing her formally as 'great grandmother'", "'grandmother'. however, internally, he is moved by a profound sadness at her impending death, tinged with a quiet compassion for her vulnerability in the face of mortality. he expresses a tender concern, attempting to comfort her distress after caligula's cruel outburst, revealing a capacity for empathy despite the treacherous court dynamics.", "a deep melancholy permeates claudius's demeanor as he witnesses livia's final moments. outwardly", "he is composed and respectful", "addressing her formally as 'great grandmother' and 'grandmother'. however", "internally", "he is moved by a profound sadness at her impending death", "tinged with a quiet compassion for her vulnerability in the face of mortality. he expresses a tender concern", "attempting to comfort her distress after caligula's cruel outburst", "revealing a capacity for empathy despite the treacherous court dynamics."],
        ap.active_plans = ["To offer comfort and reassurance to Livia in her final moments, despite her complex and manipulative nature.", "To fulfill Livia's explicit request to place a coin in her mouth for Charon, ensuring her peaceful passage into the afterlife.", "To continue playing the role of the 'fool', acknowledging Livia's advice and understanding the strategic value of this persona for his own survival in the dangerous court."],
        ap.beliefs = ["The ritualistic traditions surrounding death, such as providing payment for Charon, are important and should be respected.", "Even those who wielded great power and were manipulative deserve compassion and dignity in their final moments.", "Maintaining a facade of naivety and harmlessness is a crucial strategy for navigating the treacherous politics of the Julio-Claudian court and ensuring personal survival."],
        ap.goals = ["short-term\": \"To provide Livia with a peaceful and dignified passing, fulfilling her last wishes and offering a measure of comfort in her final moments.", "medium-term\": \"To navigate the power vacuum left by Livia's death cautiously, leveraging his perceived harmlessness to remain outside the immediate line of fire in any succession struggles.", "ultimate\": \"To survive the turbulent reign of the Julio-Claudian dynasty, potentially outmaneuvering more overtly ambitious figures through his underestimated intellect and strategic 'fool' persona."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Livia lies frail and fading in her bedchamber, her breathing shallow and labored, signaling her imminent demise.  Though physically weak, her mind remains fixated on her ambitions, even in death. She clings to Claudius\'s presence, her words a mixture of command and plea as she seeks reassurance about her deification and instructs him regarding the coin for Charon, her final earthly concern intertwined with otherworldly anxieties.',
        ap.emotional_state = 'Beneath a veneer of imperious expectation, Livia reveals a deep-seated fear of oblivion and hell in her dying moments.  Outwardly, she demands Claudius remember his promise to make her a goddess, projecting an unwavering ambition. Internally, she is vulnerable and anxious, especially after Caligula’s brutal rejection of her divine aspirations, revealing a desperate need for validation and a terror of a negative afterlife.  Her request for the coin underscores a primal fear of death\'s unknown journey, contrasting sharply with her grand ambitions.',
        ap.emotional_tags = ["beneath a veneer of imperious expectation, livia reveals a deep-seated fear of oblivion", "hell in her dying moments.  outwardly, she demands claudius remember his promise to make her a goddess, projecting an unwavering ambition. internally, she is vulnerable", "anxious, especially after caligula\u2019s brutal rejection of her divine aspirations, revealing a desperate need for validation", "a terror of a negative afterlife.  her request for the coin underscores a primal fear of death's unknown journey, contrasting sharply with her grand ambitions.", "beneath a veneer of imperious expectation", "livia reveals a deep-seated fear of oblivion and hell in her dying moments.  outwardly", "she demands claudius remember his promise to make her a goddess", "projecting an unwavering ambition. internally", "she is vulnerable and anxious", "especially after caligula\u2019s brutal rejection of her divine aspirations", "revealing a desperate need for validation and a terror of a negative afterlife.  her request for the coin underscores a primal fear of death's unknown journey", "contrasting sharply with her grand ambitions."],
        ap.active_plans = ["To secure a promise from Claudius regarding her deification, ensuring her legacy and transcendence beyond mortal existence.", "To ensure she has the necessary coin for Charon, facilitating her passage to the underworld and adhering to the traditional Roman customs for death.", "To impart a final piece of strategic advice to Claudius ('Go on playing the fool'), recognizing his survival tactic and perhaps acknowledging its effectiveness within the treacherous court she dominated for so long."],
        ap.beliefs = ["Becoming a goddess is the ultimate achievement, even in death, and remains a crucial part of her legacy and ambition.", "The Roman traditions and beliefs about the afterlife, particularly the necessity of paying Charon, are real and must be observed for a successful transition beyond life.", "Claudius, despite his perceived foolishness, is someone she can rely upon in her final moments to fulfill her wishes and understand the complex dynamics of the court."],
        ap.goals = ["short-term\": \"To die with the assurance that her wishes regarding deification and passage to the afterlife will be honored, easing her fear of oblivion and hell.", "medium-term\": \"To achieve goddess status in the afterlife, transcending mortal limitations and securing a place of divine power and remembrance.", "ultimate\": \"To attain a form of immortality, ensuring her enduring influence and legacy beyond her physical death, solidifying her place in Roman history and mythology."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_lollia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lollia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_titus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lollia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_titus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lollia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lollia_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_titus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_titus_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thrasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'}),
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
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_varro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Event {uuid: 'event_4_7'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_6'}),
          (b:Event {uuid: 'event_4_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_8'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_7'}),
          (b:Event {uuid: 'event_4_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_9'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_8'}),
          (b:Event {uuid: 'event_4_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_7'}),
          (b:Event {uuid: 'event_4_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_7'}),
          (b:Event {uuid: 'event_4_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_8'}),
          (b:Event {uuid: 'event_4_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_8'}),
          (b:Event {uuid: 'event_4_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_4_9'}),
          (b:Event {uuid: 'event_4_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_4_9'}),
          (b:Event {uuid: 'event_4_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_helen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_2'}),
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
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_1'}),
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
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
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
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_varro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_silius_caecina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_varro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_varro_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_silius_caecina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_silius_caecina_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Event {uuid: 'event_10_7'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_6'}),
          (b:Event {uuid: 'event_10_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thrasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_7'}),
          (b:Event {uuid: 'event_10_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'}),
          (b:Event {uuid: 'event_10_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Event {uuid: 'event_12_6'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_5'}),
          (b:Event {uuid: 'event_12_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_12_5'}),
          (b:Event {uuid: 'event_12_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_12_5'}),
          (b:Event {uuid: 'event_12_5'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_6'}),
          (b:Event {uuid: 'event_12_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
          (ep:Episode {uuid: 'episode_queen_of_heaven'})
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
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'}),
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'}),
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
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_4'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_5'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_6'}),
                      (e2:Event {uuid: 'event_4_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_4'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_5'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_6'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_7'}),
                      (e2:Event {uuid: 'event_4_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_4'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_5'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_6'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_7'}),
                      (e2:Event {uuid: 'event_4_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_8'}),
                      (e2:Event {uuid: 'event_4_9'})
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
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_2'})
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
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_2'}),
                      (e2:Event {uuid: 'event_10_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_3'}),
                      (e2:Event {uuid: 'event_10_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_4'}),
                      (e2:Event {uuid: 'event_10_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_5'}),
                      (e2:Event {uuid: 'event_10_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_6'}),
                      (e2:Event {uuid: 'event_10_7'})
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
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_2'}),
                      (e2:Event {uuid: 'event_12_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_3'}),
                      (e2:Event {uuid: 'event_12_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_4'}),
                      (e2:Event {uuid: 'event_12_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_5'}),
                      (e2:Event {uuid: 'event_12_6'})
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
