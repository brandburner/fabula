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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e03_graph.json',
        creation_timestamp: '2025-04-11T16:16:31.688193',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'Scholar',
        a.description = 'Claudius, nephew of Augustus, is a young man burdened by physical and social awkwardness. Despite his clumsiness, he possesses a sharp mind and keen awareness of his surroundings. He is eager to please and seeks acceptance, even though he is often dismissed as foolish within the imperial family.',
        a.traits = ["Awkward", "Intelligent", "Eager", "Observant"],
        a.sphere_of_influence = 'Scholarship and History'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'Empress Mother',
        a.description = 'Livia Drusilla, the Empress Mother, is a formidable and manipulative figure within the Roman imperial family. Pragmatic and politically astute, she works tirelessly to secure her family\'s power and lineage, and is fiercely protective of her son Tiberius while dismissing those she deems weak or inconvenient.',
        a.traits = ["Manipulative", "Strategic", "Ambitious", "Cunning"],
        a.sphere_of_influence = 'Political Manipulation'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius Julius Caesar Nero',
        a.title = 'Exiled Prince',
        a.description = 'Tiberius, the exiled prince of Rome, stands as a figure of ambition and anguish, shaped by conflict and resentment. Exiled to Rhodes, he is both formidable and haunted, his current state serving as both sanctuary and prison that dampens his once-imperial fire.',
        a.traits = ["Ambitious", "Resentful", "Stoic", "Haunted"],
        a.sphere_of_influence = 'Military and Political Power'
    ;
MERGE (a:Agent {uuid: 'agent_augustus'})
    ON CREATE SET
        a.name = 'Augustus',
        a.title = 'Emperor',
        a.description = 'The Emperor Augustus is a commanding presence showing signs of weariness and age. He is resolute and authoritarian, preoccupied with safeguarding Rome\'s future through traditional values and strict family matters. He rules with a stubborn, paternalistic style, haunted by the loss of his adopted son Gaius.',
        a.traits = ["Weary", "Authoritative", "Stubborn", "Paternalistic"],
        a.sphere_of_influence = 'Imperial Governance'
    ;
MERGE (a:Agent {uuid: 'agent_thasyllus'})
    ON CREATE SET
        a.name = 'Thasyllus',
        a.title = 'Astrologer',
        a.description = 'Thasyllus is a seasoned astrologer in his fifties, deeply engaged in interpreting celestial events for guidance. Despite uncertain predictions, he remains optimistic about Tiberius’s fortunes and is visibly anxious and opportunistic in his efforts to gain favor, highlighting his subservient and nervous nature.',
        a.traits = ["anxious", "opportunistic", "superstitious", "flattering", "nervous"],
        a.sphere_of_influence = 'Astrology, Prophecy'
    ;
MERGE (a:Agent {uuid: 'agent_julia'})
    ON CREATE SET
        a.name = 'Julia Augusta',
        a.title = 'Daughter of Caesar',
        a.description = 'Julia Augusta, daughter of the god-like Caesar, is known for her sharp wit and aristocratic bearing. Though elegant and charming, she carries a deep world-weariness from navigating the treacherous Roman court. In moments of crisis, her composure cracks to reveal raw fury and fear of Livia’s political machinations.',
        a.traits = ["Witty", "Observant", "Cynical", "Emotional"],
        a.sphere_of_influence = 'Imperial Family'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia Minor',
        a.title = 'None',
        a.description = 'Antonia Minor is a woman of quiet strength and reserved demeanor. Observing the chaotic world with a critical eye, she embodies Roman virtue, propriety, and restraint. Concerned with her family’s future and moral compromises, she remains diplomatic and observant.',
        a.traits = ["controlled", "disapproving", "concerned with propriety", "observant", "diplomatic"],
        a.sphere_of_influence = 'Roman Aristocracy'
    ;
MERGE (a:Agent {uuid: 'agent_agrippina_minor'})
    ON CREATE SET
        a.name = 'Agrippina Minor',
        a.title = 'None',
        a.description = 'Agrippina is portrayed as a dramatic and petulant child, quick to complain and seek intervention when slighted. Her outbursts, including dramatic declarations of not speaking to others, add youthful energy and sibling rivalry to the scene, though she can be easily calmed by parental figures.',
        a.traits = ["dramatic", "petulant", "sensitive", "childish", "easily soothed"],
        a.sphere_of_influence = 'Childhood'
    ;
MERGE (a:Agent {uuid: 'agent_germanicus'})
    ON CREATE SET
        a.name = 'Germanicus Julius Caesar',
        a.title = 'None',
        a.description = 'Germanicus is depicted as a boisterous and mischievous child, whose playful teasing and quick remorse underscore his generally good-natured character. His actions reveal a protective, brotherly care for Claudius and highlight typical sibling dynamics enriched with emerging empathy.',
        a.traits = ["boisterous", "mischievous", "apologetic", "playful", "responsible", "caring"],
        a.sphere_of_influence = 'Childhood'
    ;
MERGE (a:Agent {uuid: 'agent_claudius_minor'})
    ON CREATE SET
        a.name = 'Claudius Minor',
        a.title = 'None',
        a.description = 'Claudius Minor is portrayed as a sensitive child afflicted with a limp and a stammer, which causes others to underestimate his intelligence. Despite being seen as slow and \'stupid\' by some, his earnest nature and vulnerability shine through as he engages in everyday childhood activities and seeks acceptance among his siblings.',
        a.traits = ["afflicted", "stammering", "perceived as unintelligent", "sensitive", "vulnerable", "earnest", "accepted by siblings"],
        a.sphere_of_influence = 'Childhood'
    ;
MERGE (a:Agent {uuid: 'agent_livilla'})
    ON CREATE SET
        a.name = 'Livilla Julia',
        a.title = 'None',
        a.description = 'Livilla is depicted as an insensitive and dismissive child whose immediate possessiveness and mocking comments expose a selfish and cruel streak. Her actions, including a flippant reaction to serious events, lead to disciplinary measures from her caretakers, underscoring her impetuous nature.',
        a.traits = ["insensitive", "dismissive", "selfish", "cruel", "impetuous", "disrespectful"],
        a.sphere_of_influence = 'Childhood'
    ;
MERGE (a:Agent {uuid: 'agent_castor'})
    ON CREATE SET
        a.name = 'Castor Julius Caesar',
        a.title = 'None',
        a.description = 'Castor is portrayed as an observant and curious child who notices the eagles fighting and identifies the object they drop as a wolf cub. His keen observation and descriptive commentary underscore his childlike wonder and engagement with the dramatic events around him.',
        a.traits = ["observant", "curious", "descriptive", "childlike"],
        a.sphere_of_influence = 'Childhood'
    ;
MERGE (a:Agent {uuid: 'agent_lucius'})
    ON CREATE SET
        a.name = 'Lucius Julius Caesar',
        a.title = 'None',
        a.description = 'Lucius, Julia\'s son, is depicted as confident yet naive, easily manipulated by the scheming Livia. Once favored by Augustus and destined for high office, his defensive nature and admission of guilt reveal his inner turmoil as he struggles with familial loyalty and personal ambition.',
        a.traits = ["Naive", "Guilt-ridden", "Defensive", "Ambitious"],
        a.sphere_of_influence = 'Imperial Family Dynamics'
    ;
MERGE (a:Agent {uuid: 'agent_plautius'})
    ON CREATE SET
        a.name = 'Plautius Rufus',
        a.title = 'None',
        a.description = 'Plautius Rufus serves as an attendant to Lucius, navigating the intricate social settings of the court. His polite and complimentary demeanor, combined with nervousness around powerful figures, reflects his opportunistic nature and complicity in the political scandals that surround Julia.',
        a.traits = ["Opportunistic", "Servile", "Complicit", "Lover", "Betrayer"],
        a.sphere_of_influence = 'Roman Court'
    ;
MERGE (a:Agent {uuid: 'agent_postumus'})
    ON CREATE SET
        a.name = 'Postumus Agrippa',
        a.title = 'Adopted Heir',
        a.description = 'Postumus Agricppa is depicted as a troubled and anxious young man desperate to escape his current situation. His terse responses and pleas to go to Rome with Lucius reveal emotional distress and an overwhelming desire for change, marking him as a conflicted figure in matters of dynastic succession.',
        a.traits = ["Anxious", "Insecure", "Desiring Escape", "Frustrated"],
        a.sphere_of_influence = 'Dynastic Succession'
    ;
MERGE (a:Agent {uuid: 'agent_gnaeus_domitius_ahenobarbus'})
    ON CREATE SET
        a.name = 'Gnaeus Domitius Ahenobarbus',
        a.title = 'Priest',
        a.description = 'Gnaeus Domitius Ahenobarbus is a priest and omen-reader whose dramatic pronouncements set a grave tone to the narrative. As an augur, he interprets omens such as the eagles’ conflict and the wolf cub, delivering prophetic warnings about Rome and Claudius\'s future, and demands secrecy.',
        a.traits = ["priestly", "omen-reader", "augur", "prophetic", "dramatic", "authoritative", "grave"],
        a.sphere_of_influence = 'Roman Religion and Omens'
    ;
MERGE (a:Agent {uuid: 'agent_praxis'})
    ON CREATE SET
        a.name = 'Praxis',
        a.title = 'None',
        a.description = 'Praxis is an efficient and dutiful servant within Augustus\'s household. Observant of courtly protocol and sensitive to Augustus\'s moods, he executes his duties with formal respect, serving as a reliable intermediary within the imperial court.',
        a.traits = ["dutiful", "efficient", "respectful", "observant", "formal"],
        a.sphere_of_influence = 'Imperial Household'
    ;
MERGE (a:Agent {uuid: 'agent_herod_agrippa'})
    ON CREATE SET
        a.name = 'Herod Agrippa',
        a.title = 'Prince',
        a.description = 'Herod Agrippa is a young prince from Judea sent to Rome for his education. Exceptionally polite and well-spoken, he demonstrates a keen understanding of Roman customs and history while carrying a hint of personal sadness from his past.',
        a.traits = ["Polite", "Charming", "Educated", "Reflective"],
        a.sphere_of_influence = 'Cultural and Political Relations'
    ;
MERGE (a:Agent {uuid: 'agent_aelius_sextus_balbas'})
    ON CREATE SET
        a.name = 'Aelius Sextus Balbas',
        a.title = 'None',
        a.description = 'Aelius Sextus Balbas is a man embroiled in scandal and shame, implicated in an affair with Julia. His admission of guilt and involvement in the moral failings of the imperial family underscores the themes of betrayal and dishonor.',
        a.traits = ["Scandalous", "Guilty", "Submissive", "Fearful"],
        a.sphere_of_influence = 'Court Scandal'
    ;
MERGE (a:Agent {uuid: 'agent_marcus_volusius_saturninus'})
    ON CREATE SET
        a.name = 'Marcus Volusius Saturninus',
        a.title = 'None',
        a.description = 'Marcus Volusius Saturninus is implicated in the scandal involving Julia. His presence compounds the widespread involvement in the affair, deepening the sense of betrayal and familial humiliation within the imperial circle.',
        a.traits = ["Complicit", "Fearful", "Submissive", "Humiliated"],
        a.sphere_of_influence = 'Court Scandal'
    ;
MERGE (a:Agent {uuid: 'agent_publius_norbanus_flaccus'})
    ON CREATE SET
        a.name = 'Publius Norbanus Flaccus',
        a.title = 'None',
        a.description = 'Publius Norbanus Flaccus is drawn into the scandal surrounding Julia by his own admissions. His brief confession highlights the extent of compromise and betrayal within the imperial family, emphasizing the moral consequences of their actions.',
        a.traits = ["Guilty", "Fearful", "Submissive", "Humiliated"],
        a.sphere_of_influence = 'Court Scandal'
    ;
MERGE (a:Agent {uuid: 'agent_sentor'})
    ON CREATE SET
        a.name = 'Sentor',
        a.title = 'Guard',
        a.description = 'Sentor is a burly guard in Tiberius\'s service, exemplifying obedience and loyalty. His readiness to enforce Tiberius’s orders, even under dangerous circumstances, demonstrates his role as an intimidating and silent enforcer of the ruler\'s will.',
        a.traits = ["burly", "obedient", "loyal", "intimidating", "silent"],
        a.sphere_of_influence = 'Security, Enforcement'
    ;
MERGE (a:Agent {uuid: 'agent_courier'})
    ON CREATE SET
        a.name = 'Courier',
        a.title = 'Imperial Courier',
        a.description = 'The Courier is a breathless and professional messenger arriving directly from Rome, bearing urgent dispatches from Augustus to Tiberius. His dutiful and respectful demeanor, even under Tiberius\'s unsettling laughter, underscores his commitment to duty and adherence to protocol.',
        a.traits = ["breathless", "dutiful", "respectful", "formal", "professional"],
        a.sphere_of_influence = 'Imperial Communication'
    ;
MERGE (o:Object {uuid: 'object_livias_letter'})
    ON CREATE SET
        o.name = 'Livia\'s Letter',
        o.description = 'A sealed letter written by Livia to Tiberius, identified by Livia\'s signet. The letter contains Livia\'s message informing Tiberius of Augustus\'s refusal to allow his return to Rome, despite the death of Gaius and her pleas. It stands as a manifestation of Livia\'s manipulative influence and the political machinations within the imperial family.',
        o.purpose = 'To inform Tiberius of Augustus\'s decision and to manipulate events from afar.',
        o.significance = 'Reveals crucial plot information about Tiberius\'s exile and Augustus\'s motivations, highlighting Livia\'s controlling influence.'
    ;
MERGE (o:Object {uuid: 'object_scrolls_and_tablets'})
    ON CREATE SET
        o.name = 'Scrolls and Tablets',
        o.description = 'Numerous scrolls and tablets overflowing from the bookshelves in Tiberius\'s study. They represent the tools of scholarship and historical record-keeping, indicative of Claudius\'s scholarly pursuits and the rich historical context of the narrative.',
        o.purpose = 'Storage and display of written information and historical records.',
        o.significance = 'Symbolize knowledge, history, and Claudius\'s scholarly nature.'
    ;
MERGE (o:Object {uuid: 'object_writing_desk'})
    ON CREATE SET
        o.name = 'Writing Desk',
        o.description = 'A small writing desk in Tiberius\'s study, cluttered with papers. It serves as Claudius\'s workspace, suggesting his active engagement in reading and analyzing documents, while highlighting the physical tools of intellectual labor in the Roman era.',
        o.purpose = 'Workspace for reading, writing, and studying documents.',
        o.significance = 'Represents intellectual labor and the physical act of scholarship.'
    ;
MERGE (o:Object {uuid: 'object_papers'})
    ON CREATE SET
        o.name = 'Papers',
        o.description = 'A pile of papers cluttering the writing desk in Tiberius\'s study. They represent the disorganized nature of Claudius\'s research process and are linked to the discovery of crucial documents.',
        o.purpose = 'Contain written information and historical records being researched by Claudius.',
        o.significance = 'Represent the search for knowledge and the potential for uncovering hidden truths.'
    ;
MERGE (o:Object {uuid: 'object_bookshelves'})
    ON CREATE SET
        o.name = 'Bookshelves',
        o.description = 'Bookshelves lining the walls of Tiberius\'s study, overflowing with scrolls and tablets. They create a library-like atmosphere that emphasizes the depth of historical records and learning.',
        o.purpose = 'Storage for scrolls and tablets, creating a library-like atmosphere.',
        o.significance = 'Symbolize knowledge, learning, and the historical context of the story.'
    ;
MERGE (o:Object {uuid: 'object_sewing'})
    ON CREATE SET
        o.name = 'Sewing',
        o.description = 'Sewing or weaving undertaken by Antonia on the seaside terrace. This domestic activity reflects Antonia\'s traditional feminine role and highlights her meticulous nature, as she contrasts with the more politically engaged characters.',
        o.purpose = 'Domestic craft',
        o.significance = 'Symbolizes Antonia\'s domesticity and anxiety.'
    ;
MERGE (o:Object {uuid: 'object_sand'})
    ON CREATE SET
        o.name = 'Sand',
        o.description = 'Sand from the beach that Germanicus throws at Agrippina as a tease. It is a natural element integral to the seaside setting, symbolizing childish playfulness and minor sibling conflicts.',
        o.purpose = 'Child\'s plaything',
        o.significance = 'Represents childish conflict and the seaside setting.'
    ;
MERGE (o:Object {uuid: 'object_wolf_cub'})
    ON CREATE SET
        o.name = 'Wolf Cub',
        o.description = 'A bloodied wolf cub, dropped from the claws of fighting eagles near Claudius. Described as torn about the neck and shivering with fear, it is covered in blood and used as an omen foreshadowing Rome\'s vulnerability and Claudius\'s destiny.',
        o.purpose = 'Omen; Symbolic representation of Rome',
        o.significance = 'Foretells Rome\'s future and Claudius\'s destiny.'
    ;
MERGE (o:Object {uuid: 'object_eagles'})
    ON CREATE SET
        o.name = 'Eagles',
        o.description = 'Two eagles observed fighting in the sky above the seaside terrace. Their aerial struggle over the wolf cub, which they are battling over, is interpreted as a divine sign indicating impending conflict.',
        o.purpose = 'Divine Messengers; Omen Bearers',
        o.significance = 'Introduce the omen and represent divine intervention.'
    ;
MERGE (o:Object {uuid: 'object_memento'})
    ON CREATE SET
        o.name = 'Memento',
        o.description = 'An unspecified \'little present\' mentioned by Julia for Plautius, described as \'a memento of your visit\'. Though its nature is not fully clarified, it functions as a parting gift and subtle means of maintaining influence.',
        o.purpose = 'Parting gift; Social gesture',
        o.significance = 'Highlights Julia\'s social graces and subtle manipulation.'
    ;
MERGE (o:Object {uuid: 'object_bust_of_gaius'})
    ON CREATE SET
        o.name = 'Bust of Gaius',
        o.description = 'A newly delivered marble bust depicting Gaius, Augustus\'s late adopted son, crafted to immortalize his noble likeness. The bust, with its beautiful features and prominent brow, serves as a constant reminder of the tragic loss and dynastic anxieties.',
        o.purpose = 'Memento, Symbol of lost heir',
        o.significance = 'Symbolizes Augustus\'s grief, dynastic concerns, and Roman nobility.'
    ;
MERGE (o:Object {uuid: 'object_figs'})
    ON CREATE SET
        o.name = 'Figs',
        o.description = 'Fresh figs mentioned as part of Julia\'s diet, symbolizing her indulgence. Their consumption becomes a point of contention with Antonia, reflecting differing attitudes toward discipline and excess.',
        o.purpose = 'Food',
        o.significance = 'Symbol of Julia\'s self-indulgence and Antonia\'s disapproval.'
    ;
MERGE (o:Object {uuid: 'object_list_of_names'})
    ON CREATE SET
        o.name = 'List of Names',
        o.description = 'An unseen document, implied to be a scroll or tablet, containing a list of names used as evidence of Julia\'s scandalous affairs. Presented by Livia to Lucius, it serves as a tool for manipulation and the exposure of indiscretions.',
        o.purpose = 'Evidence of Julia\'s affairs',
        o.significance = 'Instrument of manipulation and redemption within the scandal.'
    ;
MERGE (o:Object {uuid: 'object_door_julias_chambers'})
    ON CREATE SET
        o.name = 'Door to Julia\'s Chambers',
        o.description = 'A heavy, presumably wooden door, now slammed shut, acting as a barrier for Julia. The door becomes the focal point of Julia’s desperation as she beats on it, symbolizing her confinement and isolation imposed by imperial power.',
        o.purpose = 'Barrier, confinement',
        o.significance = 'Symbol of Julia\'s imprisonment and isolation.'
    ;
MERGE (o:Object {uuid: 'object_ship'})
    ON CREATE SET
        o.name = 'Ship',
        o.description = 'A ship arriving in the harbor of Rhodes, observed from Tiberius\'s villa terrace. It is anticipated to be carrying letters and news from Rome, linking the exiled situation to the imperial center.',
        o.purpose = 'Transportation of people and messages',
        o.significance = 'Harbinger of news and potential change in Tiberius\'s fate.'
    ;
MERGE (o:Object {uuid: 'object_letters'})
    ON CREATE SET
        o.name = 'Letters',
        o.description = 'Expected letters from Rome, anticipated to arrive aboard the ship. These letters are central to the tension of the scene, symbolizing communication from the imperial center and holding the promise of new developments.',
        o.purpose = 'Communication of information',
        o.significance = 'Source of anticipated news and potential change.'
    ;
MERGE (o:Object {uuid: 'object_thrasyllus_horoscope'})
    ON CREATE SET
        o.name = 'Thrasyllus\'s Horoscope',
        o.description = 'An astrological chart used by Thrasyllus, which Tiberius pretends to examine as a means of intimidation. It is more a prop than a genuine tool of divination, used to manipulate and assert power.',
        o.purpose = 'Divination (ostensibly), intimidation',
        o.significance = 'Serves as a tool of manipulation and symbolizes false prophecy.'
    ;
MERGE (o:Object {uuid: 'object_cliff_path'})
    ON CREATE SET
        o.name = 'Cliff Path',
        o.description = 'A precarious path leading down the cliff face to the bay from Tiberius\'s villa. Its inherent danger is underscored by its intended use as the route for a potential fatal mishap, symbolizing imminent peril.',
        o.purpose = 'Passage, threat of danger',
        o.significance = 'Symbol of immediate peril and Tiberius\'s cruelty.'
    ;
MERGE (o:Object {uuid: 'object_imperial_dispatches'})
    ON CREATE SET
        o.name = 'Imperial Dispatches',
        o.description = 'Official messages from Augustus Caesar, delivered by the Courier to Tiberius. The dispatches contain momentous news including Lucius Caesar\'s death and a command for Tiberius to return to Rome, setting the stage for dramatic change.',
        o.purpose = 'Imperial communication, decree',
        o.significance = 'Catalyst for Tiberius\'s return and plot advancement.'
    ;
MERGE (o:Object {uuid: 'object_lucius_boat'})
    ON CREATE SET
        o.name = 'Lucius\'s Boat',
        o.description = 'The boat in which Lucius Caesar was traveling at the time of his death in a boating accident near Marseilles. Its overturning, shrouded in mystery and skepticism, is regarded as the cause of his demise, marking it as a pivotal plot element.',
        o.purpose = 'Transportation, (alleged) cause of death',
        o.significance = 'Instrument of Lucius\'s death and a catalyst for the unfolding narrative.'
    ;
MERGE (l:Location {uuid: 'location_tiberius_study'})
    ON CREATE SET
        l.name = 'Tiberius\'s Study',
        l.description = 'A modest study located within Tiberius\'s villa on the island of Rhodes. The room is lined with tall bookshelves filled with scrolls and tablets, and a small writing desk catches the sunlight streaming through the window. The space exudes organized chaos, serving as a scholar’s retreat with a view overlooking the vast expanse of the Aegean Sea.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_rhodes'})
    ON CREATE SET
        l.name = 'Rhodes',
        l.description = 'A sun-drenched island in the Aegean Sea, hosting Tiberius\'s villa and serving as his place of exile. Rhodes is depicted as a beautiful yet isolated location, embodying both the allure and confinement of a gilded cage far removed from the center of Roman power.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_aegean_sea'})
    ON CREATE SET
        l.name = 'Aegean Sea',
        l.description = 'A prominent sea visible from Tiberius\'s study, symbolizing both the beauty of Rhodes and the distance from Rome. The Aegean Sea provides a continuous, expansive backdrop that reinforces themes of exile and isolation.',
        l.type = 'Sea'
    ;
MERGE (l:Location {uuid: 'location_balcony'})
    ON CREATE SET
        l.name = 'Balcony Overlooking the Sea',
        l.description = 'A stark, windswept balcony offering a panoramic vista of the boundless Aegean Sea. It serves as a reflective and tense setting where Tiberius stands sentinel, his gaze mirroring the melancholy expanse and symbolizing isolation.',
        l.type = 'Outdoor Space'
    ;
MERGE (l:Location {uuid: 'location_seaside_terrace_ostia'})
    ON CREATE SET
        l.name = 'Seaside Terrace at Ostia',
        l.description = 'A spacious, sunlit terrace at a house in Ostia that overlooks the sea. The terrace offers a warm atmosphere typical of a Roman summer day, serving as a leisure space imbued with undercurrents of tension and familial discord.',
        l.type = 'Terrace'
    ;
MERGE (l:Location {uuid: 'location_ostia'})
    ON CREATE SET
        l.name = 'Ostia',
        l.description = 'A coastal city near Rome, known for its maritime character and leisurely escape from the oppressive energy of Rome. Ostia, with its defining proximity to the sea, sets the stage for both familial interactions and covert political discussions.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_rome'})
    ON CREATE SET
        l.name = 'Rome',
        l.description = 'The distant capital of the Roman Empire, serving as the epicenter of political intrigue and imperial power. Rome is juxtaposed against Tiberius\'s remote exile and represents both longing and the weight of imperial expectations.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_spain'})
    ON CREATE SET
        l.name = 'Spain',
        l.description = 'A distant province of the Roman Empire, designated as the military destination for Lucius Caesar. Spain embodies the themes of imperial duty and the unpredictable shifts within the narrative.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_formiae'})
    ON CREATE SET
        l.name = 'Formiae',
        l.description = 'A town referenced as Gnaeus Domitius\'s destination, serving as a key geographical point in the narrative and highlighting the broader expanse of the Roman world.',
        l.type = 'Town'
    ;
MERGE (l:Location {uuid: 'location_julias_house_ostia'})
    ON CREATE SET
        l.name = 'Julia\'s House in Ostia',
        l.description = 'Julia\'s residence in Ostia featuring a seaside terrace. Considered a place of comfort and beauty, the villa offers a domestic refuge distinct from the political intensity of Rome.',
        l.type = 'Villa'
    ;
MERGE (l:Location {uuid: 'location_room'})
    ON CREATE SET
        l.name = 'Room in Julia\'s House',
        l.description = 'An unspecified interior room within Julia\'s house that provides a refuge from the dramatic events unfolding on the terrace. It symbolizes domestic safety away from the looming ominous occurrences outside.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_julias_study'})
    ON CREATE SET
        l.name = 'Julia\'s Study',
        l.description = 'A private study within Julia\'s house where she keeps a \'little present\' for Plautius. This intimate space suggests personal affairs and trust, acting as both a sanctuary and a site of private exchanges.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_childrens_room'})
    ON CREATE SET
        l.name = 'Children\'s Room',
        l.description = 'A room designated for the children within the household, serving as a space for retreat and disciplinary action. It represents the domestic sphere that offers safety and separation from external tensions.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_private_reception_room'})
    ON CREATE SET
        l.name = 'Private Reception Room',
        l.description = 'A secluded room within the palace defined by dancing shadows and understated elegance. This space is used for clandestine conversations where the undercurrents of power and betrayal shape imperial dynamics.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_augustus_office'})
    ON CREATE SET
        l.name = 'Augustus\'s Office',
        l.description = 'A grand room within the Imperial Palace serving as Augustus\'s office, marked by imperial symbols and a marble bust of his deceased adopted son, Gaius. The space is designed to reflect authority, with sunlight highlighting its austere and majestic decor.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_julias_chambers'})
    ON CREATE SET
        l.name = 'Julia\'s Chambers',
        l.description = 'An opulent yet confining space within Julia\'s residence, filled with luxurious decor now turned into a gilded cage. The room’s rich fabrics and expensive adornments stand in stark contrast to the sense of imprisonment and despair emanating from its bolted door.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_livias_private_study'})
    ON CREATE SET
        l.name = 'Livia\'s Private Study',
        l.description = 'A sparsely furnished, dimly lit room dominated by a large writing desk. This space is steeped in political intrigue, reflecting Livia\'s cold, calculating nature and serving as the stage for secretive, power-laden confrontations.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_augustus_palace_audience_chamber'})
    ON CREATE SET
        l.name = 'Imperial Palace - Formal Hall',
        l.description = 'A stately, dimly lit hall within the Imperial Palace in Rome. The formal setting is heavy with tension and power dynamics, contrasting opulent surroundings with themes of betrayal and familial conflict.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_tiberius_villa_terrace'})
    ON CREATE SET
        l.name = 'Tiberius\'s Villa - Terrace',
        l.description = 'A stone terrace attached to Tiberius\'s villa in Rhodes, bathed in sunlight and overlooking a bustling harbor. This place for observation and contemplation melds the natural beauty of the island with the tense political undercurrents of Tiberius’s exile.',
        l.type = 'Terrace'
    ;
MERGE (l:Location {uuid: 'location_harbor_rhodes'})
    ON CREATE SET
        l.name = 'Harbor of Rhodes',
        l.description = 'A bustling harbor in Rhodes filled with arriving and departing ships. It signifies active trade and communication, offering a tangible connection to the wider world and contrasting Tiberius\'s isolation.',
        l.type = 'Harbor'
    ;
MERGE (l:Location {uuid: 'location_cliff_edge'})
    ON CREATE SET
        l.name = 'Cliff Edge',
        l.description = 'A precipitous cliff edge overlooking the bay of Rhodes. It serves as a symbol of danger and vulnerability, representing the sudden and fatal threats that loom within the narrative.',
        l.type = 'Natural Feature'
    ;
MERGE (l:Location {uuid: 'location_marseilles'})
    ON CREATE SET
        l.name = 'Marseilles',
        l.description = 'A port city noted for its association with Lucius Caesar\'s fatal boating accident. Marseilles acts as a critical transit point and highlights the unpredictable nature of fate within the broader Roman world.',
        l.type = 'Port City'
    ;
MERGE (o:Organization {uuid: 'org_noble_order_of_knights'})
    ON CREATE SET
        o.name = 'Noble Order of Knights',
        o.description = 'The Noble Order of Knights represents the bachelor elite of Roman society. They are summoned by Augustus to his office to be lectured on their lack of marriage and procreation, which he sees as essential for the continuation of Roman citizenry. As an unmarried group, they are perceived by Augustus as failing in their civic duty to Rome, and are thus subject to his marriage laws.',
        o.sphere_of_influence = 'Roman Society, Marriage Laws'
    ;
MERGE (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
    ON CREATE SET
        ep.title = 'Waiting in the Wings',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Unearthing a Viper\'s Missive',
        s.description = 'Inside Tiberius\'s study in Rhodes, a space lined with overflowing bookshelves and scattered scrolls, sunlight streams through a window overlooking the shimmering Aegean. Claudius, in a state of mild frenzy, rummages through a disorganized pile of documents on a cluttered writing desk. His initial frustration at the chaotic filing system of his secretaries gives way to focused determination as he seeks a specific letter. The atmosphere shifts from anxious searching to triumphant discovery as he locates the desired missive, sealed with Livia\'s imperial signet.  A sense of hushed excitement and dawning comprehension fills the room as Claudius breaks the seal and begins to read aloud, his voice adopting a mocking tone to impersonate Livia\'s manipulative words. The scene subtly underscores the clandestine nature of imperial communications and the hidden machinations at play within the seemingly tranquil exile.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Claudius Discovers Livia\'s Letter',
        e.description = 'Claudius, amidst the scholarly clutter of Tiberius\'s study, frantically searches for a specific document within a disorganized collection of papers. His initial muttering of frustration about the secretaries\' lack of system morphs into focused determination as he continues his hunt. Finally, with a triumphant exclamation, he locates a letter bearing Livia\'s signet. Relief and anticipation wash over him as he breaks the seal, recognizing the potential significance of this particular correspondence. The discovery marks a pivotal moment, suggesting Claudius is on the verge of uncovering crucial information about the imperial family\'s intricate dynamics and hidden agendas.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Where is it? There. Where is it? Where is it? Oh, where is it? No. I had it yesterday. What...? Oh, damned secretaries. No system. None at all. They just shove it anywhere. I mean, what do they care? It's just another piece of paper to them. Oh. I'm sure I had it yesterday. Yes, she wrote him a letter after Gaius died. What was it? \"The answer, I'm afraid, is no.\" Yes, that was it. \"My dear Tiberius, the answer, I'm afraid, is no.\" This is the one! Yes! Yes! Yes! This is it. Yes."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Claudius Reads Livia\'s Damning Words Aloud',
        e.description = 'Having found Livia\'s letter, Claudius begins to read it aloud, his voice initially mimicking Livia\'s formal tone before deepening into a mocking impersonation.  The letter reveals Livia\'s calculated message to Tiberius, confirming Augustus\'s refusal to allow his return to Rome even after Gaius\'s death. Livia\'s words subtly highlight Augustus\'s unwavering stance and attribute it to Tiberius\'s past actions concerning Julia, reinforcing the narrative of Tiberius\'s continued exile as a consequence of his own misdeeds and Livia\'s manipulative influence. Claudius\'s act of reading aloud emphasizes the weight and significance of Livia\'s words, exposing the cold political calculations behind the imperial family\'s public facade.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: \"My dear Tiberius, the answer, I'm afraid, is no, which is what I expected...\"", "CLAUDIUS: \"Augustus refuses to allow you to return to Rome. Refuses even to discuss it. Despite the sudden and unexplained death of his beloved Gaius, and despite my pleading with him, he is adamant that you will stay where you are. He has, of course, never forgiven you for what you did to Julia and frankly I'm not surprised.\""]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Astrologer\'s Prophecies',
        s.description = 'The scene unfolds on a windswept balcony overlooking the Aegean Sea, where Tiberius, with his stern expression, stands juxtaposed against the vibrant, ever-moving backdrop of the ocean. The sunlight glimmers off the waves, creating a serene yet deceptive environment that contrasts sharply with the storm of emotions brewing within Tiberius. Beside him, Thasyllus, the astrologer, poring over his charts, represents the intertwining of fate and ambition, attempting to divine Tiberius\'s future amidst the chaos of their present circumstances. The wind whips their robes, symbolizing the tumultuous nature of their discussions about power, family, and betrayal. As they converse, the tension rises, revealing Tiberius\'s underlying despair and frustration at his exile, while Thasyllus\'s insistence on optimism showcases the clash between hope and resignation. This scene serves as a crucial turning point, foreshadowing the political machinations taking shape back in Rome and hinting at Tiberius\'s impending return. Themes of ambition and the weight of family legacy resonate throughout, as each line exchanged reveals the precarious balance of their fates.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_balcony'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Tiberius Questions the Astrologer\'s Insights',
        e.description = 'Tiberius stands resolutely on the balcony, demanding clarity from Thasyllus, who claims the astrological charts predict favorable outcomes. Tiberius\'s skepticism surfaces as he expresses frustration over years of optimistic prophecies that have failed to alter his fate. The tension escalates as Thasyllus insists the planets are aligned for good news, specifically regarding Tiberius\'s potential return to Rome. This poignant dialogue underscores Tiberius\'s deep-seated frustrations and desperation for agency in his own life, revealing the personal stakes entangled within the grand political narrative.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You've been saying that for years. Perhaps if you found some disasters there my life might take a turn for the better.", "I shan't shed any tears for him.", "What else did you learn?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Revelations About Rome and Family',
        e.description = 'Thasyllus reveals critical information regarding the political landscape in Rome, detailing how Augustus is mourning the death of Gaius. Tiberius reacts with indifference, emphasizing his hardened demeanor towards past family ties and the political implications of Gaius\'s demise. Thasyllus continues by mentioning Lucius\'s new military command, which prompts Tiberius\'s scornful remark about Lucius\'s capabilities, further illustrating the disdain Tiberius holds for his family\'s perceived incompetence. This exchange highlights the underlying tensions within the Julio-Claudian dynasty and Tiberius\'s feelings of exclusion and resentment.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Augustus has taken the death of Gaius very hard.", "Lucius? He couldn't fight his way out of a harem!"]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Seaside Tensions and Ominous Portents',
        s.description = 'Bathed in the warm Mediterranean sun on a spacious terrace overlooking the glittering sea at Ostia, Julia and Antonia attempt to enjoy a moment of respite. Yet, beneath the veneer of polite conversation, unspoken tensions simmer between the two women. The idyllic scene is punctuated by the boisterous energy of children playing nearby, their squabbles mirroring the larger conflicts brewing within the imperial family. As Julia subtly probes Antonia about the suspicious death of Drusus and hints at Livia\'s manipulative nature, a disquiet settles over the gathering. The arrival of Lucius and Plautius further underscores the family\'s fractured state, while Postumus\'s quiet desperation hints at deeper unhappiness. The scene culminates in a dramatic celestial omen – eagles locked in a fierce aerial battle overhead, dropping a bloodied wolf cub at young Claudius\'s feet. This startling event casts a pall of dread over the once-pleasant terrace, as the priest Domitius interprets the omen as a harbinger of chaos for Rome, with Claudius, the family\'s perceived fool, destined to become an unlikely protector.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_seaside_terrace_ostia'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Strained Pleasantries and Cynical Barbs',
        e.description = 'Julia and Antonia engage in superficially polite conversation on the seaside terrace. Antonia hints at leaving, prompting Julia to press her to stay, revealing Julia\'s aversion to solitude and her need for company, even if critical. Their talk meanders through slaves and domestic duties, punctuated by Julia\'s cynical observations about her past marriage to Tiberius, painting a picture of emotional emptiness and dissatisfaction.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["JULIA: You could stay a few more days. What's the hurry?", "ANTONIA: Oh, no hurry, really.", "JULIA: When have I ever wanted to be on my own?", "JULIA: Well, living with Tiberius was not the fulfilling experience I'd expected--", "JULIA: --I was seldom filled and never full."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Children\'s Spat and Motherly Intervention',
        e.description = 'The tranquility is shattered by Agrippina\'s outburst, accusing Germanicus of throwing sand at her. Antonia, ever the peacemaker, gently scolds Germanicus, while Julia dismisses the childish drama with practiced ease, wiping sand from Agrippina’s face. This brief interlude highlights the contrasting parenting styles and the everyday familial dynamics amidst the looming imperial tensions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AGRIPPINA: Mother! Mother! Look what he did. Look what he did.", "AGRIPPINA: GERMANICUS. He threw sand all over me. It's in my face, on my hair, it's everywhere.", "GERMANICUS: I was only teasing. She threw it in mine. Oh, come on, Pina. I'm sorry.", "JULIA: Now, come here and let me wipe it off and stop being so dramatic."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Whispers of Suspicion and Dark Accusations',
        e.description = 'Antonia expresses concern over Claudius\'s future marriage prospects and her own difficulty feeling affection for him, revealing a mother\'s anxieties. Julia, however, steers the conversation into darker territory, subtly planting seeds of doubt in Antonia’s mind about Drusus\'s death, suggesting Livia\'s potential involvement and echoing Tiberius\'s own suspicions. This insidious insinuation creates a chilling undercurrent of paranoia and distrust.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["ANTONIA: What worries me is who's going to marry Claudius, with his foot and his stammer.", "ANTONIA: To tell you the truth Julia, I find it very hard to be affectionate to him. I suppose really I ought to love him more because of his afflictions, but I don't.", "JULIA: Tell me, did you never wonder about his death? I mean, did it never strike you as odd that it happened when LIVIA's personal physician was looking after him?", "JULIA: I said that I thought that Livia had a hand in it, and I still think so. And I know that Tiberius thought so."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Lucius\'s Abrupt Departure and Mother\'s Dismissal',
        e.description = 'Lucius and Plautius approach, announcing their imminent departure for Rome. Julia, with a mix of maternal affection and playful disdain, offers Plautius a parting gift, a \'memento,\' but pointedly excludes Lucius. Antonia inquires about Lucius\'s upcoming departure for Spain, highlighting his elevated position and Augustus\'s trust. Julia\'s dismissive attitude towards Lucius, calling him a \'deserter\', hints at underlying tensions and perhaps a preference for Plautius.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["JULIA: Are you leaving, Lucius?", "LUCIUS: Yes, Mother. If we leave now, we'll be in Rome before nightfall.", "JULIA: Well, you must come again. I've got a little present for you in my study. A memento of your visit.", "LUCIUS: Nothing for me, Mother?", "JULIA: You don't deserve anything leaving so soon!", "ANTONIA: When are you leaving for Spain?", "LUCIUS: In a few months.", "ANTONIA: Augustus must have great confidence in you.", "JULIA: Deserter."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Postumus\'s Desperate Plea and Domitius\'s Ominous Arrival',
        e.description = 'Postumus hesitantly approaches Lucius, pleading to accompany him back to Rome, revealing his deep unhappiness and desire to escape. Julia swiftly denies his request, showcasing her controlling nature. Simultaneously, Domitius arrives, his presence immediately casting a more serious tone. His formal greeting and mention of taking auspices for the deceased Gaius further darken the atmosphere, foreshadowing ill tidings.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["POSTUMUS: May I come with you?", "POSTUMUS: May I go with them, Mother?", "JULIA: Whatever for? Certainly not.", "DOMITIUS: I was on my way to Formiae. I felt I must call upon you, Lady.", "DOMITIUS: Ah, an honor, sir. I took the auspices for your brother GAIUS before he left for Syria. They were most favorable. I've never seen the liver of a ewe so clear. One could almost see through it. His death is inexplicable to me."]
    ;
MERGE (e:Event {uuid: 'event_3_6'})
    ON CREATE SET
        e.title = 'Celestial Carnage and a Fallen Omen',
        e.description = 'As Lucius and Plautius depart, Germanicus draws attention to eagles fighting fiercely in the sky. The children become engrossed in the aerial battle, observing something clutched in one eagle\'s talons. Suddenly, a bloodied wolf cub falls from the sky, landing at Claudius\'s feet. This shocking and violent omen shatters the relaxed atmosphere, replacing it with palpable dread and superstitious fear.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["GERMANICUS: Eagles. What are they fighting for?", "GERMANICUS: Eagles! They're fighting!", "POSTUMUS: Go and make it up with Livilla, you'll feel better.", "CASTOR: Oh look. One of them's got something! See, in its claws there. It's a small animal,", "AGRIPPINA: Mother, Mother, the eagles are fighting!", "CASTOR: They're fighting over something. Look out!", "CASTOR: It's a wolf cub.", "GERMANICUS: Mother, it dropped right from its claws."]
    ;
MERGE (e:Event {uuid: 'event_3_7'})
    ON CREATE SET
        e.title = 'Domitius\'s Grave Prophecy and Claudius\'s Unlikely Destiny',
        e.description = 'Julia, horrified by the bloodied cub, implores Domitius to interpret the omen. Antonia, sensing the gravity of the situation, demands he speak openly, even to the children, after making them swear secrecy by their gods. Domitius solemnly declares the wolf cub to be Rome itself, injured and vulnerable, and proclaims Claudius as its unlikely protector. This revelation is met with disbelief and derision from Livilla, highlighting the general underestimation of Claudius.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["JULIA: Look at the blood. Ye Gods, what does it mean? Domitius, tell us what it means.", "ANTONIA: You know what it means, I can see from your face. Tell us, I beg you. Children, go into the house.", "DOMITIUS: No! Let them stay. The sign was given to you all, and given now, perhaps, because I am here to read it. But they must be sworn to secrecy.", "DOMITIUS: The wolf cub is Rome. No doubt of it. Romulus was suckled by a wolf as her own cub, and Romulus was Rome. And look at it. All torn about the neck and shivering with fear. A wretched sight. Rome will be wretched one day. But he will protect it. He and no other.", "LIVILLA: Claudius as protector of Rome! I hope I shall be dead by then."]
    ;
MERGE (e:Event {uuid: 'event_3_8'})
    ON CREATE SET
        e.title = 'Punishment and a Child\'s Earnest Plea',
        e.description = 'Antonia, angered by Livilla\'s disrespectful scoffing at the grave omen, immediately punishes her, sending her to her room without food, underscoring the seriousness with which the omen is taken. Julia, wanting to diffuse the tense atmosphere and shield the children, ushers them inside. In the scene\'s final poignant beat, young Claudius, oblivious to the grand prophecy and focused on the immediate reality, earnestly pleads with his mother to keep the injured wolf cub, unknowingly embracing the destiny foretold.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["ANTONIA: Go to your room! You shall have nothing to eat for the rest of the day!", "JULIA: Children, come in. Come inside.", "CLAUDIUS: May I k-k-keep the cub, please, Mother? Please may I?"]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Livia\'s Web of Manipulation',
        s.description = 'In the dimly lit Private Reception Room, shadows dance across the walls, mirroring the tension that lingers in the air. Livia Drusilla, the ever-composed Empress Mother, sits with an air of authority opposite Plautius, a handsome yet visibly nervous Roman. The atmosphere is thick with unspoken implications as Livia expertly navigates the conversation, her voice dripping with charm and menace combined. She probes Plautius about his relationship with her daughter-in-law, Julia, revealing her intent to manipulate him for her own ends. Livia\'s regal demeanor belies her ruthless ambition as she skillfully weaves a web of intrigue, demanding a catalogue of Julia’s activities while presenting herself as a benefactor, all the while tightening her grip on the power dynamics at play. This scene encapsulates the essence of political maneuvering in Roman high society, showcasing Livia\'s cunning mind as she seeks to maintain control over the shifting tides of legacy and ambition within her family.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_private_reception_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Livia Interrogates Plautius',
        e.description = 'Livia skillfully interrogates Plautius about his relationship with her daughter-in-law, Julia. As she initially presents herself as an ally, her true intent becomes clear: to manipulate Plautius into gathering information about Julia’s activities. Livia\'s charm and veiled threats create an atmosphere of tension, revealing her ruthless nature as she subtly threatens Plautius\'s future while enticing him with promises of career advancement. She demands specifics about Julia’s affairs, indicating her desire to control the narrative and protect her family’s reputation while using Plautius as her unwitting tool.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Well, is it true? Have I heard right? Are you having my daughter-in-law? Come, you can be frank with me.", "I want a catalogue of my daughter-in-law's activities. I want names, dates, places."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Livia\'s Ultimatum',
        e.description = 'After establishing her power in the conversation, Livia delivers an ultimatum to Plautius, revealing the depths of her manipulative schemes. She instructs him not only to provide details about Julia’s indiscretions but also encourages him to pursue her, using their relationship to further her own agenda. This moment solidifies Livia’s role as the orchestrator of familial conflicts, demonstrating her willingness to exploit those around her to maintain control over her family\'s legacy and the empire.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I want a catalogue of my daughter-in-law's activities. I want names, dates, places. And far from breaking with her, you may encourage her all you like."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Imperial Fury and Matrimonial Maneuvering',
        s.description = 'Within the austere grandeur of Augustus\'s office, dominated by a prominent bust of his deceased son Gaius, the aging Emperor vents his frustration upon representatives of the Noble Order of Knights regarding the marriage laws. His weariness is palpable, yet his imperial command remains forceful as he uses the stammering Claudius as an awkward example of Roman progeny. The atmosphere shifts with the entrance of Livia, whose sharp gaze immediately falls upon Claudius with disdain before turning her attention to Augustus. She skillfully pivots the conversation to marriage arrangements within the imperial family, subtly maneuvering to bring her exiled son Tiberius back into favor while coldly dismissing Claudius\'s prospects. The scene underscores the themes of imperial expectation, familial duty, and Livia\'s relentless ambition, all set against the backdrop of Rome\'s dynastic anxieties.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Caesar\'s Chastisement of the Knights',
        e.description = 'Augustus, in a display of imperial impatience, confronts representatives of the Noble Order of Knights about their resistance to his marriage laws. Weary of their complaints, he summons Claudius and thrusts him forward as a living embodiment of the Roman children they should be producing. His voice, though strained with age, still carries the weight of absolute authority as he rebukes their bachelorhood and demands they fulfill their duty to Rome by marrying and procreating. The bust of Gaius looms in the background, a silent reminder of the dynasty\'s fragility and the need for heirs.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: I say stop complaining and get married!", "AUGUSTUS: Look at that. Do you know what that is? That is a child. A Roman child. And how in Hades do you think he got there? By a Roman man and a Roman woman coming together in the same bed."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Livia\'s Scornful Entrance and Claudius\'s Dismissal',
        e.description = 'Livia enters Augustus\'s office, her presence immediately altering the room\'s atmosphere. Her gaze, sharp and critical, fixes on Claudius, and she swiftly dismisses him with cold contempt, questioning his very right to exist. She openly expresses her disgust for his physical deformities and social awkwardness, revealing a deep-seated prejudice and highlighting Claudius\'s marginalized position within the imperial family. Claudius, visibly relieved to escape her scorn, shuffles away, highlighting his vulnerability and desire to avoid conflict.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: What are you doing here child? Get back to your lessons at once.", "LIVIA: A model of what? Idiocy?", "LIVIA: That child should have been exposed at birth."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Livia\'s Matrimonial Agenda and Tiberius Gambit',
        e.description = 'Livia, smoothly transitioning from her dismissal of Claudius, steers the conversation towards the politically crucial topic of marriage within the imperial family. She proposes betrothals for Agrippina and Germanicus, and Castor and Livilla, strategically aligning family unions to consolidate power. Subtly, she introduces the idea of Tiberius\'s return from exile, framing it as a harmless concession, a \'private citizen\' back in Rome. This marks the beginning of her calculated manipulation to reinstate her son and advance her own ambitions, using marriage as a key tool in her power plays.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: Marriage.", "LIVIA: On the subject of Tiberius...", "LIVIA: My dear, what harm would it do if he came back to Rome as a private citizen?"]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Augustus\'s Rejection of Tiberius and Marital Arrangements',
        e.description = 'Augustus, though weary, firmly shuts down any discussion of Tiberius\'s return, his past grievances against his stepson still burning intensely. He declares his mind closed on the matter, highlighting the deep rift between them. However, he readily agrees to Livia\'s proposed marriage arrangements for Agrippina, Germanicus, Castor, and Livilla, demonstrating his reliance on her political acumen in dynastic matters. When the question of Claudius\'s marriage arises, Livia coldly volunteers to \'find someone,\' her dismissive tone underscoring Claudius\'s perceived lack of worth and the pragmatic, loveless nature of marriages in their world.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Livia, leave me alone on the subject of Tiberius.", "AUGUSTUS: After what he did to Julia, I shall never forgive him.", "AUGUSTUS: Tiberius would never return!", "LIVIA: I'll find someone. It won't be easy, but I'll find someone."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Julia\'s Desperate Confrontation',
        s.description = 'In the dimly lit opulence of Julia\'s chambers, the air is thick with tension and unspoken accusations. The room, adorned with lavish silks and the remnants of a once-celebrated beauty, reflects Julia\'s inner turmoil. Shadows flicker on the walls, mirroring her agitation as she paces like a trapped lioness. The moonlight spills through the window, illuminating her fierce expression as she turns on Plautius, her voice sharp and laced with betrayal. \'Plautius, why didn\'t you save me from this beast?\' she demands, her desperation echoing in the silence. This confrontation encapsulates her struggle for agency as she grapples with the suffocating constraints of her imperial existence. Within this charged moment, familial ties fracture under the weight of ambition and treachery, highlighting the deepening rift within the Julio-Claudian dynasty. The stakes are high, revealing Julia\'s vulnerability and the dangerous game of power she finds herself ensnared in.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_julias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Julia Confronts Plautius',
        e.description = 'In a moment charged with emotion, Julia stands before Plautius, her agitation palpable. She confronts him with a piercing question, demanding to know why he did not intervene on her behalf against the forces threatening her. The weight of her words underscores the desperation of her situation, revealing Julia\'s frustration with her circumstances and her perceived betrayal by those she believed would support her. This event marks a pivotal moment in Julia\'s narrative arc, highlighting her struggle for agency and the deeply fractured relationships within her family as she faces the harsh realities of her imperial existence.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Plautius, why didn't you save me from this beast?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'An Exotic Admirer',
        s.description = 'Julia\'s opulent chambers are a testament to her lavish lifestyle, yet also hint at a deeper dissatisfaction. Discarded fabrics and rich furnishings litter the space, mirroring her restless spirit. She languidly dismisses her father\'s physician\'s advice, highlighting her self-indulgence and disregard for health warnings. Antonia, ever the embodiment of Roman austerity, observes with quiet disapproval, a stark contrast to Julia\'s flamboyant excess. The arrival of Claudius, nervously presenting the exotic Prince Herod Agrippa, injects a moment of intrigue and amusement into the scene. Herod\'s elaborate compliments and worldly charm temporarily captivate Julia, offering a fleeting distraction from her ennui. However, Antonia remains grounded, subtly reminding Julia of her responsibilities and the impending departure of her son\'s companion, hinting at the ephemeral nature of Julia\'s diversions and the underlying loneliness in her gilded cage.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_julias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Dismissing Medical Advice and Complaining of Boredom',
        e.description = 'Julia, surrounded by the opulent clutter of her chambers, recounts her dismissive interaction with her father\'s physician to Antonia. She mocks his simple advice to eat less, revealing her self-absorbed nature and disdain for sensible counsel. Her complaint about the physician\'s advice underscores her boredom and yearning for more excitement and less restriction in her life. This opening highlights Julia\'s character as self-indulgent and restless, setting the stage for her seeking amusement elsewhere.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["JULIA: So Father asked me to see his own personal physician, and just to please him, I did. And do you know what he told me? He told me not to eat so much. He said if I stopped eating so much, the palpitations would disappear. Now, I mean, I ask you, am I a big eater?", "ANTONIA: Well...", "JULIA: I mean, I can't live on a lettuce leaf. I'm not a caterpillar."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Claudius Introduces Herod Agrippa',
        e.description = 'Claudius enters Julia\'s chambers, leading a young and exotic-looking Herod Agrippa. He nervously presents Herod to Julia, stammering as he makes the introduction. Claudius\'s awkwardness contrasts with Herod\'s poised demeanor, setting up a dynamic where Herod\'s charm and sophistication will stand out against the more reserved Roman court. This introduction serves to bring a new, potentially intriguing element into Julia\'s isolated world, hinting at possible future developments.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: Hello, Aunt J-J-Julia.", "JULIA: Hello, dear. Who's that you've got there?", "CLAUDIUS: His name's HEROD. His grandfather is King of the J-J-Jews."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Herod\'s Flattery Captivates Julia and Antonia',
        e.description = 'Herod Agrippa immediately impresses Julia and Antonia with his polished manners and flattering words. He skillfully name-drops Marcus Agrippa, Julia\'s deceased husband, and demonstrates a surprising familiarity with the Roman imperial family, presenting himself as both knowledgeable and respectful. His compliments appeal to Julia\'s vanity and intrigue Antonia with his worldly awareness. This event showcases Herod\'s charm and political acumen, suggesting he is more than just a \'provincial\' and capable of navigating the complex Roman court.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["JULIA: Really? And what's he doing here?", "CLAUDIUS: He's been sent to be educated in Rome and he's been put in my class.", "JULIA: Well, how nice. He's a handsome lad, isn't he?", "HEROD: Thank you Lady. Do I have the honor of addressing the former wife of the great Agrippa?", "JULIA: Yes, dear, you do.", "HEROD: My name is Herod Agrippa. I was named after your illustrious husband Marcus Agrippa.", "JULIA: Really? Well, wasn't that nice of your father to do that?", "HEROD: No. It was my grandfather who did that.", "JULIA: Well, it was nice of him, then.", "HEROD: He's not very nice, Lady. He had my father executed soon after I was born.", "JULIA: Oh, dear. I am sorry.", "HEROD: Yes, so was my father.", "CLAUDIUS: This is my m-m-mother.", "HEROD: The great Lady ANTONIA, daughter of Mark Antony and wife of the noble Drusus.", "ANTONIA: My, you do know a lot about us.", "HEROD: I have studied you all. You are all known throughout the world. You are very famous."]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'Claudius and Herod Depart, Leaving Julia to Her Indulgences',
        e.description = 'After Herod\'s successful introduction, Claudius, ever eager to please, prepares to leave with Herod, suggesting they introduce him to Germanicus and Livilla next. Herod expresses his gratitude for the generous reception, reinforcing his polite and respectful image. As they exit, Antonia shifts her attention back to Julia, immediately returning to a tone of gentle reprimand, urging her not to eat more figs. This transition highlights Antonia\'s consistent disapproval of Julia\'s self-indulgence and sets up the following exchange about Lucius.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["ANTONIA: Well, you may come and visit us whenever you like. Have you introduced him to Germanicus and Livilla yet?", "CLAUDIUS: Not yet. C-c-come on, Herod.", "HEROD: Thank you for receiving a mere provincial so generously.", "ANTONIA: What a polite boy! And how well he speaks Latin. Julia, not another fig."]
    ;
MERGE (e:Event {uuid: 'event_7_5'})
    ON CREATE SET
        e.title = 'Julia Dismisses Antonia\'s Concern and Expresses Interest in Lucius\'s Friend',
        e.description = 'Antonia\'s gentle admonishment about the figs and her mention of Lucius\'s upcoming departure for Spain prompts Julia to dismiss her sister-in-law\'s concerns. Julia deflects Antonia\'s implied criticism by comparing her to Lucius, suggesting they both nag her.  She then reveals her true interest lies not with her son Lucius, but with his \'good-looking friend\', showcasing her continued pursuit of fleeting pleasures and her disregard for deeper emotional connections or familial responsibilities. This final exchange underscores Julia\'s superficiality and foreshadows potential future romantic entanglements.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["JULIA: Figs are good for you. You sound just like Lucius.", "ANTONIA: Well, I suppose you'll miss him when he goes to Spain.", "JULIA: Mmm. I shall miss that good-looking friend of his even more."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'The Web of Betrayal',
        s.description = 'In Livia\'s meticulously curated private study, the atmosphere is thick with tension as the Empress Mother scrutinizes a list of names, her expression grim and calculating. The room, sparsely furnished and dominated by a large writing desk, reflects her cold ambition. As Plautius, sweating slightly, stands before her, the air crackles with unspoken power dynamics. Livia\'s questions are sharp, each one probing for deeper loyalties and hidden ambitions. The conversation reveals a chilling undercurrent of betrayal, as Livia skillfully manipulates Plautius, leaving him grappling with the moral implications of turning against his friend\'s mother. This scene plays a critical role in illuminating Livia\'s ruthlessness and the lengths to which she will go to solidify her power, setting the stage for the perilous political games to come. The thematic elements of betrayal and ambition pulse through every exchange, underscoring the treacherous underbelly of Roman politics.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Livia Examines the List',
        e.description = 'Livia scrutinizes a list of names with a grim expression, probing Plautius about Gershon, a house slave from Africa. Her exploration of the names reveals her unyielding ambition and the lengths she is willing to go to ensure loyalty and control. Plautius, caught between respect and fear, attempts to defend his choices, but Livia’s chilling questions expose the tension between ambition and morality in the cutthroat world of Roman politics.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["What a collection! It certainly doesn't lack variety, does it? I hope these names will stand up to examination?", "Who, for example, is Gershon?"]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'The Revelation of Ambition',
        e.description = 'The conversation intensifies as Livia challenges Plautius about his willingness to betray his friend\'s mother, testing his ambition against his loyalties. Plautius responds cautiously, revealing the moral complexities of his role in Livia\'s schemes. Livia\'s cold manipulation becomes evident as she dismisses his concerns and suggests additional assignments, showcasing her power to exploit ambition for her own ends.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["You've no qualms about betraying your friend's mother?", "I may have another little assignment for you."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Exposing the Family Rot',
        s.description = 'Within the austere confines of Livia\'s private study, a chilling confrontation unfolds. The room, typically a sanctuary of calculated thought, becomes a stage for accusation and manipulation. Livia, with glacial fury, corners Lucius, her voice a low hiss of contempt. The air crackles with unspoken threats as she strips bare Lucius\'s complicity in his mother Julia\'s scandalous affairs. Shadowy lighting casts stark reliefs on their faces, emphasizing the grim gravity of the moment. This scene serves as a crucial turning point, revealing the depths of Julia\'s alleged depravity and Lucius\'s moral cowardice, while highlighting Livia\'s ruthless determination to control the narrative and use this scandal to her advantage. The scene underscores the thematic elements of family betrayal, the corrupting influence of power, and the cold machinations within the heart of the Roman imperial family.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Livia Accuses Lucius of Complicity',
        e.description = 'Livia, with icy rage barely concealed, confronts Lucius, accusing him of knowingly concealing Julia\'s scandalous behavior. She unleashes her fury, questioning his inaction and expressing her disgust at his perceived loyalty to Julia over the Emperor and the family\'s honor. Lucius, ineffectual and stammering, attempts a weak defense, claiming he believed Augustus was already aware and choosing to ignore the situation, inadvertently revealing his own lack of moral courage and judgement.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: You knew about it! You knew all along, but you did nothing. Nothing!", "LUCIUS: But what could I do, I'm not her keeper?", "LIVIA: You could have gone to Augustus.", "LUCIUS: But... But I thought that like everybody else he knew and had just closed his eyes to it.", "LIVIA: Shame on you! Shame that you should think him such a man when he thinks so highly of you!"]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Livia Accuses Lucius of Procuring for Julia',
        e.description = 'Livia\'s accusations escalate, turning from passive complicity to active participation in Julia\'s debauchery. She spits venomous words, accusing Lucius of acting as Julia\'s \'pimp and procurer\'. Livia reveals her knowledge of Plautius\'s role as Julia\'s lover and organizer of her orgies, directly implicating Lucius in facilitating these events by introducing Plautius to his mother. Lucius feebly denies the accusations, but his protestations ring hollow against Livia\'s forceful condemnation, highlighting the depth of his entanglement in the scandal.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: You acted as her pimp and her procurer!", "LUCIUS: That's not true!", "LIVIA: Liar! Do you deny that you introduced your friend Plautius to her for that purpose.", "LUCIUS: Plautius?", "LIVIA: Do you deny he's been her lover? Do you deny he was the chief organizer of her disgusting orgies at the house in Antium and here in Rome? And he's not the first of your friends to have wound up in her bed!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Livia Details the Ruin and Devises Lucius\'s Role',
        e.description = 'Livia paints a grim picture of the impending devastation for Augustus and the entire family, emphasizing the catastrophic blow Julia and Lucius have dealt to the Emperor\'s life and legacy. She positions herself as the reluctant exposer of this corruption, skillfully manipulating Lucius\'s guilt and desperation. Sensing an opportunity to turn the situation to her advantage, Livia offers Lucius a twisted path to redemption: he will be the one to reveal Julia\'s crimes. She hands him the damning list, making him a key player in his mother\'s downfall and solidifying her control over the unfolding scandal.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: How will it look to Augustus? Like mother, like son, that's how it will look. Oh! What a blow this will be to him. Not enough that his daughter is revealed as the town prostitute, but that her son, whom he groomed for the highest office, has connived with her, encouraged her and even supplied her with lovers.", "LUCIUS: What can I do?", "LIVIA: Nothing! There's nothing you can do. Between you and your mother, you will have destroyed the two dearest things in his life. And to think that I, his wife, should have to expose the corruption in his own family.", "LUCIUS: Let me do it! Please! Give me this once chance to make good. It's not as it seems, I swear it.", "LIVIA: You?", "LUCIUS: Please. My sin was one of omission, nothing else. Give me this chance to redeem myself. Give me the list.", "LIVIA: Very well, let it be your doing and not mine."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'The Emperor\'s Wrath',
        s.description = 'In the grand audience chamber of Augustus\'s palace, the atmosphere is thick with tension and foreboding. Sunlight streams through tall windows, illuminating the opulent decor, yet casting shadows over the faces of those present. AUGUSTUS, seated on a raised dais, embodies imperial authority tinged with disappointment and fury, while several men stand before him, heads bowed in shame. LUCIUS observes, caught between guilt and fear, as LIVIA watches silently behind the Emperor, her unreadable expression hinting at the political machinations at play. The chamber resonates with AUGUSTUS\'s thunderous voice, demanding truth and loyalty, as he confronts the shameful revelations of his daughter\'s indiscretions. The air crackles with anticipation, exacerbated by JULIA\'s desperate screams from outside, begging for mercy and understanding. This scene serves as a pivotal confrontation, unearthing deep-seated familial conflicts and setting the stage for the catastrophic consequences of betrayal within the heart of the empire. It reflects the themes of familial loyalty, the corrosive nature of power, and the tragic isolation that comes with being part of the imperial lineage.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_audience_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Augustus Confronts Balbas',
        e.description = 'AUGUSTUS\'s piercing gaze lands on AELIUS SEXTUS BALBAS, demanding a confession regarding his relationship with JULIA. The tension escalates as BALBAS stammers, finally admitting the truth. AUGUSTUS presses further, questioning other men present about their involvement with his daughter, each admission deepening the Emperor\'s rage and disappointment. The atmosphere grows increasingly charged as AUGUSTUS\'s authority is tested by the shameful revelations.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You, AELIUS SEXTUS BALBAS. Is it true? Have you slept with my daughter?", "Yes, Caesar.", "And you, MARCUS VOLUNSIUS SATURNIUS? Have you slept with my daughter?", "Yes, Caesar."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Augustus\'s Fury Unleashed',
        e.description = 'With mounting fury, AUGUSTUS demands the guards remove the men before him, unable to contain his disappointment in their betrayals. He declares that JULIA will be banished for life, stripping her of her place in the family and leaving her to suffer alone. In this moment, the depth of his feelings towards JULIA\'s indiscretions and the consequences that follow become brutally apparent.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Is there anyone in Rome who has not slept with my daughter? Take them out! I'll decide what to do with them later!", "I shall banish her! Banish her for life."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Julia\'s Desperate Plea',
        e.description = 'As AUGUSTUS declares his sentence, JULIA\'s anguished screams pierce the air from outside the chamber. Her desperate pleas for forgiveness echo off the opulent walls, revealing her vulnerability and fear. This dramatic moment highlights the emotional stakes of the scene, as JULIA confronts the harsh reality of her father\'s wrath and the impending isolation that awaits her. The sound of her cries starkly contrasts with the cold authority of AUGUSTUS.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Father! Father! Please! Please let me in! Let me talk to you! Let me explain! Father?", "Please don't send me away! Please, please, please don't send me away! I couldn't bear it!"]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Trapped Fury: Julia\'s Accusation',
        s.description = 'Confined within the opulent prison of her chambers, Julia\'s rage erupts against the closed door, her fists hammering in desperate defiance. The once lavish space, now a gilded cage, echoes with her fury as she directs a venomous tirade through the heavy oak, targeting the unseen presence of Livia on the other side. The emotional atmosphere is thick with Julia\'s raw desperation and accusatory paranoia, her voice laced with the bitter understanding of betrayal. This scene serves as the immediate aftermath of Julia\'s public shaming and banishment, highlighting the intense personal conflict between Julia and Livia, and underscoring Livia\'s manipulative power as perceived by her rivals. Thematic elements of familial betrayal, power struggle, and the suffocating nature of imperial control are powerfully underscored as Julia\'s confinement mirrors her broader entrapment within the dynasty\'s machinations.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_julias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Imprisonment and Desperate Outcry',
        e.description = 'The heavy door to Julia\'s chambers slams shut, sealing her within. In a paroxysm of rage and despair, Julia physically attacks the barrier, her fists pounding against the unyielding wood. Her actions convey a sense of being trapped, both physically and metaphorically, within the confines of her fate. This outburst is a visceral expression of her powerlessness and the dawning realization of her devastating situation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Direct Accusation of Livia\'s Plot',
        e.description = 'Through the closed door, Julia\'s voice rises, sharp with accusation. She directly addresses Livia, unseen but powerfully present, voicing her certainty that Livia is the architect of her downfall. Julia articulates her understanding of Livia\'s motives: to discredit Julia and pave the way for Tiberius\'s return from exile, revealing Julia\'s astute, albeit desperate, grasp of the political machinations at play. This accusation highlights the central conflict between these two powerful women and Julia\'s awareness of Livia\'s strategic brilliance and ruthless ambition.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["JULIA: This is your doing, isn't it? Don't think I don't know. You think you're very clever. You think that by discrediting me, he'll bring your son back from Rhodes. You're so transparent."]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Prophecy of Livia\'s Impending Irrelevance and Death Wish',
        e.description = 'Julia\'s fury escalates as she shifts from accusation to a scathing prophecy. She asserts the future dominance of her own sons, directly challenging Livia\'s long-term power and implying that Livia\'s influence is solely dependent on Augustus\'s life. In a final, venomous flourish, Julia suggests Livia\'s ultimate fate should be to join Augustus in death, a brutal dismissal of Livia\'s ambition and a stark declaration of the cutthroat nature of Roman imperial politics. This threat reveals Julia\'s own desperate desire for revenge and her understanding of the precarious nature of power within the dynasty.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["JULIA: You want that precious son of yours to follow him when he dies so you can come into your own. But I have two sons, and they both come before yours. So make your mind up to it, Livia. When my father dies, you won't be wanted anymore. So take my advice and climb on the funeral pyre with him!"]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'The Curse of Betrayal',
        s.description = 'In the opulent yet oppressive audience chamber of Augustus\'s Palace, the atmosphere is thick with tension and unresolved conflict. The walls, adorned with grand tapestries depicting Rome\'s victories, echo the silent struggles of its rulers. LIVIA stands composed, a stark contrast to JULIA’s furious outburst, her emotions boiling over after a lifetime of feeling trapped and scorned. AUGUSTUS, physically present, appears emotionally shattered, sinking back onto his chair, his demeanor reflecting despair and helplessness. The harsh light filtering through the chamber serves to illuminate the deep fissures in their familial ties. The air is suffused with the weight of accusations and the looming shadows of past decisions, revealing the catastrophic consequences of ambition and betrayal. This scene acts as a crucial pivot, laying bare the intricate dynamics of power, familial loyalty, and the despair that haunts the ruling class, as AUGUSTUS grapples with the fallout of his choices.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_audience_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Julia\'s Defiant Outburst',
        e.description = 'Julia, fueled by years of resentment, confronts Augustus, unleashing her anger over the banishment of her son, Lucius. Her passionate plea highlights her desperation and sense of injustice, as she accuses Augustus of being responsible for the tragedies that have befallen their family. This moment is pivotal, revealing the fracture within the family and setting the stage for further conflict.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I'm cursed, Livia. I'm cursed. First Gaius, then this. What have I done to deserve this?", "You must let my son come home. With Lucius in Spain, we need him here in Rome."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Augustus\'s Refusal',
        e.description = 'Augustus, overwhelmed by emotion, vehemently denies Livia\'s pleas to bring Tiberius back to Rome. His outburst reveals his deep-seated anguish and anger, blaming Lucius for setting Julia on a path of disgrace and destruction. This event emphasizes Augustus\'s defiance and the tragic consequences of familial ties strained by ambition and betrayal.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I'll never bring him back. Never! He drove her to it! He was the one that set her on that road."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Fortune Favors the Exiled',
        s.description = 'Sunlight bathes the stone terrace of Tiberius’s villa in Rhodes, overlooking a bustling harbor that hints at a world beyond exile. The air, thick with the scent of salt and the promise of distant lands, vibrates with unspoken tension. Tiberius, a man sculpted from granite and simmering resentment, stands with Thrasyllus, the astrologer whose honeyed words now taste like ash in his mouth. A ship arrives from Rome, a harbinger of fate, its sails promising news that could shatter the fragile equilibrium of Tiberius\'s exile. The scene crackles with anticipation, a deadly game of cat and mouse played out against the backdrop of the shimmering Aegean, where a casual threat masks a desperate yearning for a shift in fortune and the intoxicating allure of a return to power.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_villa_terrace'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Harbor Arrival and Ominous Horoscope',
        e.description = 'A ship arrives in Rhodes harbor, sparking a flicker of hope in the opportunistic astrologer, Thrasyllus. He attempts to reassure Tiberius that good news from Rome is imminent, citing his horoscope. However, Tiberius\'s stern demeanor and focus on Thrasyllus’s own astrological chart immediately establishes a menacing undercurrent, turning the usual dynamic on its head. The initial hope quickly morphs into palpable dread as Tiberius\'s veiled threat hangs heavy in the sun-drenched air.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["THRASILLUS: Excellency, there's a ship in the harbor.", "TIBERIUS: I know, I've seen it.", "THRASILLUS: I believe it comes from Rome. I'm sure it will bring important letters for you. In fact, I thought they might have already arrived before I got here.", "TIBERIUS: No, Thrasyllus, nothing has arrived.", "THRASILLUS: What do you see in your horoscope? It must be good news.", "TIBERIUS: I'm not looking at my horoscope, Thrasyllus. I'm looking at yours."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'The Cliffside Prophecy and a Deadly Bargain',
        e.description = 'Tiberius chillingly reveals that he is scrutinizing Thrasyllus\'s horoscope, not his own, and that the astrologer\'s fate is intertwined with the news from Rome. He cruelly jokes that if the news is displeasing, Thrasyllus will be thrown off the cliff, turning astrological prediction into a life-or-death gamble. This moment showcases Tiberius\'s ruthless nature and the precariousness of Thrasyllus\'s position, as the astrologer\'s forced humor masks his mounting terror.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: Mine has been so indecisive lately, I thought I thought it would make more sense if I examined yours.", "THRASILLUS: But why? What could that possibly tell you?", "TIBERIUS: Let me put it this way. I decided this morning that if nothing pleasing came off that boat, I would have you thrown down the face of the cliff into the bay.", "THRASILLUS: That's very funny. Very funny. What... What exactly does it say? Can you see anything?", "TIBERIUS: Oh, yes, it's very clear. It confirms my worst fears for your safety. Extraordinary how accurate these things are, isn't it. Who would have thought that I could have made a decision about you this morning and seen it clearly reflected in the chart this afternoon?"]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'Imperial Dispatch Interrupts Impending Doom',
        e.description = 'As Thrasyllus desperately tries to deflect Tiberius\'s grim pronouncements with forced optimism and flattery, a guard, Sentor, appears, announcing the arrival of an imperial courier with dispatches. This interruption momentarily halts Thrasyllus’s descent towards the cliff path, offering a sliver of reprieve from Tiberius’s menacing focus. The arrival of the courier shifts the scene’s tension from immediate physical threat to the anticipation of news from Rome, offering a potential shift in fortune.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["THRASILLUS: Perhaps... Perhaps you've cast it wrong.", "TIBERIUS: Not as wrong as you've been casting mine.", "THRASILLUS: Excellency, there's news coming from that boat. I'm sure of it. Didn't you see the eagle perched on your roof this morning?", "TIBERIUS: There are no eagles in Rhodes.", "THRASILLUS: Exactly! Yet why was it there? The whole town was pointing at it. It can mean only one thing, good news.", "TIBERIUS: Alas, but not for you. Sentor.", "SENTOR: Yes, master. An imperial courier has arrived with dispatches.", "TIBERIUS: Show him out. My friend can wait a while."]
    ;
MERGE (e:Event {uuid: 'event_13_4'})
    ON CREATE SET
        e.title = 'Lucius\'s Death and Tiberius\'s Recall to Rome',
        e.description = 'The courier delivers the imperial dispatch, which Tiberius reads, revealing the shocking news of Lucius Caesar\'s death in a boating accident. The message also announces Tiberius’s recall to Rome, abruptly ending his exile and dramatically altering his destiny. This moment is a pivotal turning point, shifting the narrative trajectory and unleashing a wave of complex emotions in Tiberius, from stunned disbelief to manic elation.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["COURIER: Imperial dispatch from Augustus Caesar for the noble Tiberius Claudius Nero.", "TIBERIUS: Lucius is dead. I am to return to Rome.", "THRASILLUS: Dead?"]
    ;
MERGE (e:Event {uuid: 'event_13_5'})
    ON CREATE SET
        e.title = 'Manic Laughter and Ironic Salvation',
        e.description = 'Tiberius reacts to the news of Lucius’s death with unsettling, almost hysterical laughter, a stark contrast to the courier\'s somber demeanor and Rome\'s supposed grief. He delves into the absurd details of Lucius\'s death—a fishing trip gone wrong—further fueling his manic amusement. In a darkly humorous twist, Tiberius then credits Thrasyllus\'s (inaccurate) prophecies for his change in fortune, releasing the terrified astrologer from immediate danger with a sardonic clap on the shoulder. The scene concludes with Tiberius\'s chilling laughter echoing against the backdrop of his newfound freedom, leaving Thrasyllus bewildered and the audience unsettled by the capriciousness of fate and imperial favor.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["TIBERIUS: Dead. HaHaHa...", "COURIER: Sir, all Rome is drowned in grief.", "TIBERIUS: Well, of course they are. That's only natural. HaHaHa. What happened?", "COURIER: It was terrible. A boating accident.", "TIBERIUS: A boating accident? HaHaHa. Where?", "COURIER: In Marseilles. He was on his way to Spain. He and his friend.", "TIBERIUS: His friend?", "COURIER: Caius Plautius Silvanus. They were travelling together. They were waiting for the boat to take them to Spain. And while they waited, they went out fishing.", "TIBERIUS: Fishing? HaHaHa.", "COURIER: I don't understand. Why are you laughing?", "TIBERIUS: Well, it's... It's nervous laughter. Umm. Go on with your story. HaHaHa. Well. go on, go on.", "COURIER: The boat overturned.", "TIBERIUS: Overturned? HaHaHa.", "COURIER: Yes. Shall I go on? Plautius behaved like a hero. He swam for two miles holding on to his friend in a desperate effort to save him, but when he got to the shore, his friend was dead and he himself in a state of total exhaustion.", "TIBERIUS: What a terrible thing. Gaius and Lucius within 18 months... and their mother banished in between. You know, that family is beginning to resemble a Greek tragedy. Is your ship returning to Rome?", "COURIER: Yes, sir. Tomorrow.", "TIBERIUS: We'll join it. You may go now. HaHaHa. Curious the fates are. My exile ended and you predicted it. Brave Thrasyllus. I never lost faith in you."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'A Reckoning in the Imperial Hall',
        s.description = 'The Imperial Palace\'s Formal Hall looms with stately grandeur, its dimly lit atmosphere thick with unspoken tensions. AUGUSTUS, weary but retaining regal authority, occupies a simple throne, flanked by LIVIA, whose presence radiates calculated power. The air is heavy with the complexities of familial dynamics and political machinations. As TIBERIUS enters, his expression is carefully neutral, masking the tumult within. AUGUSTUS starts a conversation, attempting to smooth over past grievances, but his rambling reveals a mind burdened by loss and familial strife. LIVIA interjects sharply, highlighting AUGUSTUS\'s faltering grasp on reality and the state of affairs. CLAUDIUS stumbles in, a figure of awkward innocence, followed by POSTUMUS and HEROD, introducing a layer of youthful anxiety about the future. The dialogue weaves between personal grievances and imperial responsibilities, underscoring the fractured relationships that plague the imperial family. This scene encapsulates the weight of legacy, the burden of expectation, and the chaotic undercurrents of loyalty and ambition that define their world.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_audience_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Tiberius Returns to Caesar',
        e.description = 'Tiberius enters the hall, facing Augustus with a neutral guise. Augustus acknowledges Tiberius\'s return with a mix of weariness and imperiousness, attempting to gloss over the past with platitudes about familial reconciliations. The tension is palpable as Tiberius listens, aware of the undercurrents of disdain and expectation woven into Augustus\'s words.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["So, you've come home?", "Yes, Caesar. I am here to do whatever you want."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Augustus\'s Struggles with Power',
        e.description = 'Augustus, burdened by the weight of his own failures, meanders through topics of familial expectations, his voice dripping with the fatigue of a ruler beleaguered by public outcry and loss. He references his grandsons and Julia, projecting a facade of indifference while revealing cracks in his authority and emotional state.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Families quarrel. They make it up. That's in the nature of things.", "But no, no, no, no. She's not my daughter anymore. I've forgotten her."]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Livia\'s Calculated Interjection',
        e.description = 'Livia, sensing Augustus\'s faltering grip on the narrative, steps in with a sharp, pointed remark about the supposed \'likeable little chap,\' revealing her awareness of the true political landscape. Her interjection showcases her ruthless intellect and serves to remind both men of the stakes at play.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["That likeable little chap he talks about is, in fact, now the king who's causing all the trouble."]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Awkward Entrance',
        e.description = 'Claudius stumbles into the hall, attempting to engage with Postumus, his awkward demeanor contrasting sharply with the heavy atmosphere. His cheerful demeanor is met with Postumus\'s anxiety, highlighting the generational divide and fear surrounding their respective positions in the imperial hierarchy.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Ch-ch-cheer up, Postumus. Come and play nuts. What's the m-m-matter?", "Nothing."]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'Herod\'s Attempt at Optimism',
        e.description = 'Herod, in a bid to uplift the mood, reminds Postumus of the honor bestowed upon him through his adoption into Caesar\'s family. Despite the optimism, the underlying tension remains palpable as Postumus expresses his fears about the implications of his adoption alongside his stepfather, revealing the anxiety that shadows their futures.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Oh, sir, be cheerful. Caesar has adopted you into his family and made you his heir. That is an honor.", "Yes, Herod. But he's adopted my stepfather too... and we both can't succeed him, can we?"]
    ;
MATCH (o:Object {uuid: 'object_livias_letter'}),
          (a:Agent {uuid: 'agent_livia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scrolls_and_tablets'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_writing_desk'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_papers'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bookshelves'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sewing'}),
          (a:Agent {uuid: 'agent_antonia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sand'}),
          (a:Agent {uuid: 'location_ostia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_wolf_cub'}),
          (a:Agent {uuid: 'agent_gnaeus_domitius_ahenobarbus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_memento'}),
          (a:Agent {uuid: 'agent_julia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bust_of_gaius'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_figs'}),
          (a:Agent {uuid: 'agent_julia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_list_of_names'}),
          (a:Agent {uuid: 'agent_livia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_door_julias_chambers'}),
          (a:Agent {uuid: 'agent_julia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_thrasyllus_horoscope'}),
          (a:Agent {uuid: 'agent_thasyllus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_imperial_dispatches'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_lucius_boat'}),
          (a:Agent {uuid: 'agent_lucius'})
    MERGE (a)-[:OWNS]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_papers_event_1_1'})
    ON CREATE SET
        oi.description = 'The pile of papers serves as the primary obstacle and focus of Claudius\'s frantic search. He actively rummages through them, scattering and reorganizing them in his desperate attempt to find the specific letter he seeks. The disorganized nature of the papers underscores the chaotic environment of Claudius\'s research and the challenge he faces in uncovering specific information. They are the repository of secrets, both mundane and significant, that Claudius is attempting to navigate.',
        oi.status_before = 'The papers are in a disorganized pile on the writing desk in Tiberius\'s study, representing the general state of Claudius\'s research materials. Their specific contents and arrangement are not yet narratively significant beyond their general cluttered state.',
        oi.status_after = 'The papers remain in a state of disarray, but now, significantly, Livia\'s letter has been extracted from them. While physically unchanged in their disorganized state, their narrative function shifts slightly as the sought-after document has been found, implying that they have yielded a crucial piece of information and their potential for containing further secrets is underscored.'
    WITH oi
    MATCH (o:Object {uuid: 'object_papers'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_livias_letter_event_1_1'})
    ON CREATE SET
        oi.description = 'Livia\'s letter is the central object of Claudius\'s search and the pivotal discovery of the event. Initially hidden within the pile of papers, it is located and identified by its seal. Claudius breaks the seal and reads the letter aloud, revealing its contents – Livia\'s message to Tiberius about Augustus\'s refusal to allow his return to Rome. The letter serves as a direct communication from Livia, showcasing her influence and providing crucial exposition regarding the political situation and familial tensions.',
        oi.status_before = 'The letter is sealed and concealed within the disorganized pile of papers, its contents unknown to Claudius and the audience. It exists as a potential source of information, its significance yet to be revealed.',
        oi.status_after = 'The letter is unsealed and its contents are revealed through Claudius\'s reading. It transforms from a hidden object to a key piece of narrative information, exposing Livia\'s manipulative role and solidifying the political constraints on Tiberius. Its status shifts from potential to actualized significance within the unfolding drama.'
    WITH oi
    MATCH (o:Object {uuid: 'object_livias_letter'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scrolls_and_tablets_event_1_1'})
    ON CREATE SET
        oi.description = 'The scrolls and tablets, while not directly handled during Claudius\'s frantic search for the letter, define the environment of Tiberius\'s study and Claudius\'s scholarly pursuits. Overflowing from the bookshelves, they visually represent the vast amount of historical information and family records that Claudius is immersed in. They are the silent witnesses to Claudius\'s discovery, emphasizing the setting as a place of research and the uncovering of historical truths. Their presence underscores the context of Claudius\'s quest for knowledge within a world of written records and historical accounts.',
        oi.status_before = 'The scrolls and tablets are neatly organized on the bookshelves, representing the accumulated knowledge and historical records available in the study. They are static elements of the setting, signifying the scholarly atmosphere.',
        oi.status_after = 'The scrolls and tablets remain unchanged in their physical state, still lining the walls of the study. However, their narrative significance is enhanced by the event. The discovery of Livia\'s letter amidst this scholarly environment reinforces the idea that crucial information is hidden within these records and that Claudius\'s scholarly efforts are beginning to yield important insights into the imperial family\'s secrets.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scrolls_and_tablets'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_livias_letter_event_1_2'})
    ON CREATE SET
        oi.description = 'Livia\'s letter serves as a critical piece of evidence revealing the cold calculations of the imperial family, particularly regarding Tiberius\'s continued exile. As Claudius reads the letter aloud, it not only communicates Livia\'s manipulative intent but also symbolizes the broader themes of betrayal and the familial power struggle. The letter reinforces the narrative of Tiberius as a scapegoat for the family\'s internal conflicts, amplifying Claudius\'s role as an unintended bearer of dark truths.',
        oi.status_before = 'The letter is sealed, hidden amongst a clutter of documents, representing the concealed truths and manipulations of Livia within the imperial family.',
        oi.status_after = 'After being read aloud by Claudius, the letter\'s seal is broken, its contents exposed and its manipulative implications laid bare, marking a significant shift in the awareness of family dynamics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_livias_letter'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is in a state of agitated searching within Tiberius\'s study. He\'s surrounded by piles of documents, frantically rummaging through them, his movements punctuated by frustrated muttering. He paces around the cluttered writing desk, his hands shuffling papers and scrolls in a desperate attempt to locate a specific letter, driven by an urgent need to find a particular piece of correspondence.',
        ap.emotional_state = 'Initially, Claudius is visibly frustrated and disorganized, expressing annoyance at the perceived inefficiency of secretaries. As he continues his search and finally locates the letter, a wave of triumph and relief washes over him. This is quickly followed by a surge of eager anticipation and focused curiosity as he breaks the seal, keen to uncover the secrets contained within Livia\'s missive. Underneath, there\'s a consistent current of earnestness, reflecting his desire to understand the truth.',
        ap.emotional_tags = ["initially, claudius is visibly frustrated", "disorganized, expressing annoyance at the perceived inefficiency of secretaries. as he continues his search", "finally locates the letter, a wave of triumph", "relief washes over him. this is quickly followed by a surge of eager anticipation", "focused curiosity as he breaks the seal, keen to uncover the secrets contained within livia's missive. underneath, there's a consistent current of earnestness, reflecting his desire to understand the truth.", "initially", "claudius is visibly frustrated and disorganized", "expressing annoyance at the perceived inefficiency of secretaries. as he continues his search and finally locates the letter", "a wave of triumph and relief washes over him. this is quickly followed by a surge of eager anticipation and focused curiosity as he breaks the seal", "keen to uncover the secrets contained within livia's missive. underneath", "there's a consistent current of earnestness", "reflecting his desire to understand the truth."],
        ap.active_plans = ["To locate the specific letter from Livia that he believes contains important information.", "To decipher the contents of the letter and understand its implications regarding Tiberius and Augustus.", "To use the information gleaned from the letter to further his understanding of the complex political dynamics within his family."],
        ap.beliefs = ["Hidden within seemingly insignificant documents are crucial pieces of information that can unlock deeper truths.", "Livia's correspondence is likely to be strategically crafted and reveal her manipulative influence within the imperial family.", "Persistent scholarly investigation and attention to detail are essential tools for uncovering hidden agendas and historical truths."],
        ap.goals = ["Short-term: Find the specific letter he is searching for amongst the disorganized papers.", "Medium-term: Comprehend the message within Livia's letter and assess its significance to the current political climate.", "Ultimate: To unravel the intricate web of secrets and manipulations within the Julio-Claudian dynasty, contributing to his broader understanding of his family's history and the empire's power structures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Claudius, hunched over a pile of documents, frantically searches for Livia\'s letter amidst the clutter. Upon finding it, he breaks the seal with a mixture of urgency and curiosity, the sunlight illuminating his slightly awkward demeanor as he begins to read aloud. His posture shifts from anxiousness to a semblance of authority as he adopts Livia\'s formal tone, then morphs into a mocking impersonation that reflects his disdain for her manipulative nature.',
        ap.emotional_state = 'Claudius exhibits surface-level excitement and urgency, evident in his frantic search and eager tone. However, beneath this excitement lies an undercurrent of frustration and resentment towards Livia\'s cold manipulation and the weight of the truths he uncovers. His mocking tone during the reading shows a blend of defiance and a yearning for acknowledgment, revealing his complex feelings about his family’s dynamics.',
        ap.emotional_tags = ["claudius exhibits surface-level excitement", "urgency, evident in his frantic search", "eager tone. however, beneath this excitement lies an undercurrent of frustration", "resentment towards livia's cold manipulation", "the weight of the truths he uncovers. his mocking tone during the reading shows a blend of defiance", "a yearning for acknowledgment, revealing his complex feelings about his family\u2019s dynamics.", "claudius exhibits surface-level excitement and urgency", "evident in his frantic search and eager tone. however", "beneath this excitement lies an undercurrent of frustration and resentment towards livia's cold manipulation and the weight of the truths he uncovers. his mocking tone during the reading shows a blend of defiance and a yearning for acknowledgment", "revealing his complex feelings about his family\u2019s dynamics."],
        ap.active_plans = ["To locate Livia's letter among the chaotic documents.", "To decipher and understand the implications of Livia\u2019s message about Tiberius's exile.", "To mockingly interpret Livia's words aloud, possibly aiming to unveil the manipulations of his family."],
        ap.beliefs = ["Power and influence within the family are wielded through deceit and manipulation.", "Knowledge of the past is critical to understanding the present dynamics of the imperial family.", "Humor can be a tool for coping with the weight of familial expectations and betrayals."],
        ap.goals = ["Short-term: To find Livia's letter to understand its contents.", "Medium-term: To reveal the manipulative politics at play within the family dynamics.", "Ultimate: To gain recognition and respect within the family by unearthing and confronting the truths of their history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands firm on the balcony, the wind whipping his robes around him as he gazes out at the sea. His posture is rigid, reflecting his inner tension. He directs sharp, pointed questions at Thasyllus, his body language conveying a mix of command and barely suppressed impatience as he demands definitive answers about his fate.',
        ap.emotional_state = 'Beneath a stern and controlled exterior, Tiberius is a tempest of conflicting emotions. Outwardly, he projects skepticism and a weariness of false hope, his voice laced with sarcasm and frustration at Thasyllus\'s repeated optimistic pronouncements. Internally, he is desperate for a change in his exiled status, yearning for any glimmer of good news from Rome, yet deeply distrustful of both fate and the machinations of his family, especially his mother. His skepticism is a shield against further disappointment, masking a profound vulnerability and a raw hunger for agency over his own life.',
        ap.emotional_tags = ["beneath a stern", "controlled exterior, tiberius is a tempest of conflicting emotions. outwardly, he projects skepticism", "a weariness of false hope, his voice laced with sarcasm", "frustration at thasyllus's repeated optimistic pronouncements. internally, he is desperate for a change in his exiled status, yearning for any glimmer of good news from rome, yet deeply distrustful of both fate", "the machinations of his family, especially his mother. his skepticism is a shield against further disappointment, masking a profound vulnerability", "a raw hunger for agency over his own life.", "beneath a stern and controlled exterior", "tiberius is a tempest of conflicting emotions. outwardly", "he projects skepticism and a weariness of false hope", "his voice laced with sarcasm and frustration at thasyllus's repeated optimistic pronouncements. internally", "he is desperate for a change in his exiled status", "yearning for any glimmer of good news from rome", "yet deeply distrustful of both fate and the machinations of his family", "especially his mother. his skepticism is a shield against further disappointment", "masking a profound vulnerability and a raw hunger for agency over his own life."],
        ap.active_plans = ["To aggressively interrogate Thasyllus to determine the genuine value of his astrological predictions, testing their reliability against the harsh reality of his prolonged exile.", "To extract specific details from Thasyllus about the 'good news' hinted at in his mother's letter, seeking concrete assurances rather than vague prophecies.", "To assert dominance over Thasyllus through intimidation, using the threat of physical violence to ensure the astrologer provides information to his 'liking', reflecting his desire to control his narrative, even through fear."],
        ap.beliefs = ["He believes his exile is unjust and a result of political maneuvering by his family, particularly his mother and Augustus.", "He believes that astrological predictions are likely unreliable and often manipulated to serve the astrologer's self-interest, yet he still seeks some form of external validation for his hopes.", "He believes that power is the only true currency in Rome, and his current powerlessness in exile is a deeply humiliating and unacceptable state."],
        ap.goals = ["{type: short-term, description: To discern whether Thasyllus possesses any genuine insight or is merely offering empty flattery to maintain favor, seeking immediate clarity on the current situation.}", "{type: medium-term, description: To secure concrete evidence or a reliable indication of a shift in his fortunes in Rome, specifically regarding the possibility of his recall from exile and a return to influence.}", "{type: ultimate, description: To end his exile permanently and reclaim his position and power within Roman society, ultimately aiming to regain his perceived birthright and exact revenge on those he believes have wronged him.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Thasyllus stands nervously beside Tiberius on the windy balcony, clutching astrological charts as if they are a shield. He gestures towards them, attempting to visually support his claims of favorable planetary alignments. His posture is submissive, angled towards Tiberius, and he speaks in a placating tone, eager to reassure and avoid incurring the exiled prince\'s wrath.',
        ap.emotional_state = 'On the surface, Thasyllus presents an air of forced optimism and professional confidence, repeatedly asserting the \'promising\' nature of the astrological charts and the \'good news\' from Rome. However, beneath this facade, he is palpably anxious and fearful, acutely aware of Tiberius\'s volatile temper and the precariousness of his own position. He is desperate to please Tiberius and avoid any displeasure, knowing his life literally hangs in the balance. His eagerness to offer positive interpretations clashes with his underlying terror, creating a performance of reassurance built on a foundation of self-preservation.',
        ap.emotional_tags = ["on the surface, thasyllus presents an air of forced optimism", "professional confidence, repeatedly asserting the 'promising' nature of the astrological charts", "the 'good news' from rome. however, beneath this facade, he is palpably anxious", "fearful, acutely aware of tiberius's volatile temper", "the precariousness of his own position. he is desperate to please tiberius", "avoid any displeasure, knowing his life literally hangs in the balance. his eagerness to offer positive interpretations clashes with his underlying terror, creating a performance of reassurance built on a foundation of self-preservation.", "on the surface", "thasyllus presents an air of forced optimism and professional confidence", "repeatedly asserting the 'promising' nature of the astrological charts and the 'good news' from rome. however", "beneath this facade", "he is palpably anxious and fearful", "acutely aware of tiberius's volatile temper and the precariousness of his own position. he is desperate to please tiberius and avoid any displeasure", "knowing his life literally hangs in the balance. his eagerness to offer positive interpretations clashes with his underlying terror", "creating a performance of reassurance built on a foundation of self-preservation."],
        ap.active_plans = ["To continuously emphasize the positive aspects of the astrological charts, highlighting favorable conjunctions and promising outcomes to appease Tiberius and maintain his patronage.", "To subtly probe Tiberius for information about the content of his mother's letter, seeking to align his predictions with any actual developments and appear genuinely insightful.", "To distract Tiberius from potentially negative interpretations by requesting a drink, attempting to lighten the tense atmosphere and ingratiate himself through a seemingly casual and subservient request."],
        ap.beliefs = ["He believes in the power of astrology to predict future events, though his interpretations are heavily influenced by his desire to please powerful figures like Tiberius.", "He believes that maintaining Tiberius's favor is essential for his own safety and comfort, and that his value lies in providing reassuring and optimistic prophecies.", "He believes that flattery and subservience are the most effective tools for navigating the dangerous political landscape and surviving in the orbit of volatile individuals like Tiberius."],
        ap.goals = ["{type: short-term, description: To successfully convince Tiberius of the positive astrological outlook and avoid any immediate negative repercussions, such as physical harm or dismissal.}", "{type: medium-term, description: To solidify his position as Tiberius's trusted astrologer by consistently delivering prophecies that align with Tiberius's desires and perceived outcomes, thus ensuring continued employment and influence.}", "{type: ultimate, description: To achieve long-term security and prosperity by leveraging his astrological skills to gain favor with powerful individuals, ultimately ensuring a comfortable and protected life within the Roman elite circles.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly on the balcony, his gaze fixed on the distant sea, while his posture reflects a blend of impatience and disdain. He engages Thasyllus with a stern expression, his arms crossed, conveying a sense of authority yet also a deep-seated frustration with the circumstances of his exile.',
        ap.emotional_state = 'Outwardly, Tiberius displays indifference, his countenance hardened by years of resentment towards his family and the political machinations of Rome. Internally, however, he grapples with conflicting emotions of bitterness and yearning, as he laments the injustices of his situation while forcing himself to remain aloof and detached from his familial ties.',
        ap.emotional_tags = ["outwardly, tiberius displays indifference, his countenance hardened by years of resentment towards his family", "the political machinations of rome. internally, however, he grapples with conflicting emotions of bitterness", "yearning, as he laments the injustices of his situation while forcing himself to remain aloof", "detached from his familial ties.", "outwardly", "tiberius displays indifference", "his countenance hardened by years of resentment towards his family and the political machinations of rome. internally", "however", "he grapples with conflicting emotions of bitterness and yearning", "as he laments the injustices of his situation while forcing himself to remain aloof and detached from his familial ties.", "outwardly, tiberius displays indifference, his countenance hardened by years of resentment towards his family and the political machinations of rome. internally, however, he grapples with conflicting emotions of bitterness and yearning, as he laments the injustices of his situation", "forcing himself to remain aloof and detached from his familial ties."],
        ap.active_plans = ["To gain intelligence from Thasyllus about the political landscape in Rome and any news regarding his return.", "To maintain a facade of indifference towards his family's affairs, masking any vulnerabilities that could be exploited.", "To assess the implications of Augustus's decisions on his own ambitions and future standing within the family."],
        ap.beliefs = ["Family loyalty is a facade that conceals betrayal and competition for power.", "The universe is controlled by celestial forces, but his fate is determined by the political machinations of those he despises.", "He believes that he deserves a rightful place in power, yet feels continually thwarted by his mother's manipulations and Augustus's indifference."],
        ap.goals = ["Short-term: To extract useful information from Thasyllus regarding Rome's current political climate.", "Medium-term: To strategize his return to power while navigating the obstacles posed by his family dynamics.", "Ultimate: To regain his position and authority in Rome, finally reclaiming his rightful place within the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Thasyllus stands beside Tiberius, poring over astrological charts with an anxious demeanor. His posture conveys eagerness, leaning slightly towards Tiberius, trying to capture his attention with optimistic predictions while searching for signs that could bolster his credibility.',
        ap.emotional_state = 'Thasyllus exhibits a façade of confidence, his voice laced with enthusiasm as he presents his interpretations of the stars. However, beneath this, there is an undercurrent of anxiety about how Tiberius will react, especially considering the troubling political developments he reveals. His nervous energy reflects a desperate need for approval and favor from the exiled prince.',
        ap.emotional_tags = ["thasyllus exhibits a fa\u00e7ade of confidence, his voice laced with enthusiasm as he presents his interpretations of the stars. however, beneath this, there is an undercurrent of anxiety about how tiberius will react, especially considering the troubling political developments he reveals. his nervous energy reflects a desperate need for approval", "favor from the exiled prince.", "thasyllus exhibits a fa\u00e7ade of confidence", "his voice laced with enthusiasm as he presents his interpretations of the stars. however", "beneath this", "there is an undercurrent of anxiety about how tiberius will react", "especially considering the troubling political developments he reveals. his nervous energy reflects a desperate need for approval and favor from the exiled prince."],
        ap.active_plans = ["To provide Tiberius with astrological insights that will encourage hope and patience regarding his return to Rome.", "To navigate Tiberius's skepticism while maintaining his credibility as a learned astrologer.", "To leverage his relationship with Tiberius to secure a stable position within the imperial circle upon Tiberius's return."],
        ap.beliefs = ["Astrology provides valuable insights into one's fate and the unfolding political landscape.", "Favorable cosmic alignments can influence personal fortunes, even in dire circumstances.", "His role is to serve and support Tiberius, thereby ensuring his own survival and relevance within the turbulent imperial environment."],
        ap.goals = ["Short-term: To convince Tiberius that the stars align favorably for his ambitions.", "Medium-term: To establish himself as an essential advisor to Tiberius as he prepares for a potential return to power.", "Ultimate: To secure a favored status within the court of Tiberius, allowing him to thrive in the political landscape of Rome."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sewing_event_3_1'})
    ON CREATE SET
        oi.description = 'Antonia actively engages in sewing throughout her conversation with Julia. The sewing is a constant presence, held in her hands and worked on as they speak. It visually represents Antonia\'s domesticity, her focus on practical tasks, and her more reserved demeanor in contrast to Julia\'s idle elegance. The rhythmic act of sewing offers Antonia a way to occupy herself and possibly manage her unease during the strained social interaction with Julia, providing a subtle anchor of normalcy amidst potentially uncomfortable topics of conversation.',
        oi.status_before = 'The sewing is in progress, assumed to be a piece of domestic work that Antonia has brought with her to Ostia or started during her stay. It is functional and ordinary, representing a typical activity for a Roman woman of her status and time.',
        oi.status_after = 'The sewing\'s status remains largely unchanged by the event itself. It continues to be in progress, neither completed nor abandoned. Its presence throughout the scene emphasizes Antonia\'s character and her role in the interaction, continuing to symbolize her practicality and domestic focus amidst the unfolding dialogue.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sewing'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sand_event_3_2'})
    ON CREATE SET
        oi.description = 'The sand is used by Germanicus as a playful projectile aimed at Agrippina, igniting their brief sibling quarrel. It serves as a symbol of childhood playfulness and the minor conflicts that arise within familial relationships, encapsulating the innocent yet tumultuous nature of their interactions.',
        oi.status_before = 'The sand lies on the terrace, a natural element of the seaside environment, unassuming and part of the children\'s playful landscape.',
        oi.status_after = 'Following the incident, the sand remains scattered about, a testament to the playful argument that unfolded, echoing the children\'s escalating emotions and marking the terrace with remnants of their brief conflict.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sand'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_memento_event_3_4'})
    ON CREATE SET
        oi.description = 'The memento, a parting gift offered by Julia to Plautius, symbolizes her desire to maintain influence and goodwill as he departs for Rome. Its unspecified nature carries emotional weight, acting as a token of connection amidst familial tensions. Julia\'s selection of this gift indicates her manipulation of relationships within the family.',
        oi.status_before = 'Prior to the event, the memento exists as an abstract concept, a representation of Julia\'s intent to cultivate relationships and leverage influence.',
        oi.status_after = 'After the event, the memento embodies Julia\'s strategic effort to ensure Plautius\'s loyalty and serves as a reminder of their connection, potentially impacting his actions in the future.'
    WITH oi
    MATCH (o:Object {uuid: 'object_memento'})
    MATCH (e:Event {uuid: 'event_3_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_eagles_event_3_6'})
    ON CREATE SET
        oi.description = 'The two eagles engage in a fierce aerial battle, drawing the children’s attention and sparking excitement. Their struggle culminates in one eagle dropping a bloodied wolf cub, an event laden with ominous significance and interpreted as a dire omen relating to Rome\'s future.',
        oi.status_before = 'The eagles soar freely in the sky, engaged in a natural act of competition, symbolizing power and dominance.',
        oi.status_after = 'The eagles, having lost one of their possessions, disappear from view after the wolf cub falls, leaving behind a sense of foreboding that lingers with the children.'
    WITH oi
    MATCH (o:Object {uuid: 'object_eagles'})
    MATCH (e:Event {uuid: 'event_3_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wolf_cub_event_3_6'})
    ON CREATE SET
        oi.description = 'The bloodied wolf cub falls from the sky into Claudius\'s vicinity, becoming a central focal point of shock and superstitious fear. Its appearance is interpreted as a dark omen, foreboding conflict and turmoil for Rome and foreshadowing Claudius\'s destiny as a protector.',
        oi.status_before = 'The wolf cub is in the talons of an eagle, alive but likely struggling within the power dynamics of its natural environment.',
        oi.status_after = 'The wolf cub, bloodied and shivering, lies at Claudius\'s feet, representing vulnerability and a prophetic sign that will loom over the narrative henceforth.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wolf_cub'})
    MATCH (e:Event {uuid: 'event_3_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wolf_cub_event_3_7'})
    ON CREATE SET
        oi.description = 'The wolf cub dramatically enters the scene, dropped from the talons of fighting eagles directly in front of Claudius. It becomes the central object of the omen, described as bloodied and shivering, immediately capturing the horrified attention of Julia and becoming the focus of Domitius\'s prophecy. Domitius interprets it as a symbol of Rome itself, wounded and vulnerable, and declares Claudius its protector. Claudius then asks to keep the cub, taking it into his possession, unknowingly embracing his prophesied destiny. The cub serves as a potent visual and symbolic representation of Rome\'s plight and Claudius\'s future role.',
        oi.status_before = 'The wolf cub\'s status before the event is as a helpless animal, captured by an eagle, presumably alive but terrified and injured from the aerial struggle between eagles. Its origin is unknown, but it is implied to have been snatched from its natural habitat by one of the eagles, placing it in a position of extreme vulnerability.',
        oi.status_after = 'After the event, the wolf cub is in the possession of Claudius, physically present on the terrace and being held by him. Symbolically, its status transforms from a mere animal to a powerful omen, representing Rome and her vulnerability. Its future is now intertwined with Claudius\'s destiny as its protector, imbued with a narrative weight far beyond its literal existence as a young animal.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wolf_cub'})
    MATCH (e:Event {uuid: 'event_3_7'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wolf_cub_event_3_8'})
    ON CREATE SET
        oi.description = 'The bloodied wolf cub, dropped by the fighting eagles, serves as a pivotal omen foreshadowing Rome\'s vulnerability and Claudius\'s destiny. Its appearance creates a sense of foreboding, influencing the characters\' interactions and deepening the tension around the prophecy as the children react to its condition. Claudius\'s earnest plea to keep the cub underscores his innocence amid the heavy implications of the omen.',
        oi.status_before = 'The wolf cub was intact, though frightened, within the talons of the eagles, symbolizing the raw power and ferocity of nature.',
        oi.status_after = 'The wolf cub is now bloodied and injured, having fallen to the ground, embodying the ominous warning for Rome\'s future and becoming a focal point of emotional and familial dynamics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wolf_cub'})
    MATCH (e:Event {uuid: 'event_3_8'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Julia lounges elegantly on the seaside terrace, engaging Antonia in seemingly casual conversation. She gestures expansively, her body language suggesting a relaxed hostess, yet her sharp eyes constantly assess Antonia\'s reactions. She leans forward conspiratorially when discussing Tiberius and Livia, attempting to draw Antonia into her cynical worldview.',
        ap.emotional_state = 'Beneath a veneer of boredom and aristocratic amusement, Julia is restless and craves company to alleviate her isolation. She projects an air of detached cynicism and world-weariness, masking deeper feelings of dissatisfaction with her life and family. There\'s a subtle undercurrent of malice in her remarks about Livia and Tiberius, suggesting suppressed resentment and a need to provoke a reaction from Antonia.',
        ap.emotional_tags = ["beneath a veneer of boredom", "aristocratic amusement, julia is restless", "craves company to alleviate her isolation. she projects an air of detached cynicism", "world-weariness, masking deeper feelings of dissatisfaction with her life", "family. there's a subtle undercurrent of malice in her remarks about livia", "tiberius, suggesting suppressed resentment", "a need to provoke a reaction from antonia.", "beneath a veneer of boredom and aristocratic amusement", "julia is restless and craves company to alleviate her isolation. she projects an air of detached cynicism and world-weariness", "masking deeper feelings of dissatisfaction with her life and family. there's a subtle undercurrent of malice in her remarks about livia and tiberius", "suggesting suppressed resentment and a need to provoke a reaction from antonia."],
        ap.active_plans = ["To persuade Antonia to prolong her stay at Ostia for Julia's own entertainment and to avoid solitude.", "To maintain a facade of social grace while subtly expressing her cynical views on marriage and family.", "To probe Antonia's thoughts and feelings about Livia and Tiberius, attempting to sow seeds of doubt and discord."],
        ap.beliefs = ["Life within the imperial family is inherently tedious and unfulfilling.", "Domestic duties are best left to slaves, yet even they are often incompetent and lazy.", "Her marriage to Tiberius was a loveless and emotionally barren experience."],
        ap.goals = ["Short-term: To escape boredom and enjoy the distraction of Antonia's company at Ostia.", "Medium-term: To subtly influence Antonia's perception of Livia and Tiberius, reinforcing Julia's own negative opinions.", "Ultimate: To find some semblance of amusement and agency within her constrained and politically precarious life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Antonia sits composedly, diligently sewing while engaging in conversation with Julia. Her posture is slightly stiff, and her movements are precise and economical, reflecting her reserved nature. She maintains eye contact with Julia but avoids overly expressive gestures, suggesting a cautious and measured approach to the interaction.',
        ap.emotional_state = 'Antonia is outwardly polite and agreeable, yet a subtle anxiety underlies her demeanor. She hints at wanting to leave, suggesting a desire to distance herself from Julia, possibly sensing the underlying cynicism and potential for conflict. While she participates in the conversation, she remains emotionally guarded, becoming visibly uncomfortable and defensive when Julia\'s remarks turn critical of Livia, revealing her loyalty and moral uprightness.',
        ap.emotional_tags = ["antonia is outwardly polite", "agreeable, yet a subtle anxiety underlies her demeanor. she hints at wanting to leave, suggesting a desire to distance herself from julia, possibly sensing the underlying cynicism", "potential for conflict. while she participates in the conversation, she remains emotionally guarded, becoming visibly uncomfortable", "defensive when julia's remarks turn critical of livia, revealing her loyalty", "moral uprightness.", "antonia is outwardly polite and agreeable", "yet a subtle anxiety underlies her demeanor. she hints at wanting to leave", "suggesting a desire to distance herself from julia", "possibly sensing the underlying cynicism and potential for conflict. while she participates in the conversation", "she remains emotionally guarded", "becoming visibly uncomfortable and defensive when julia's remarks turn critical of livia", "revealing her loyalty and moral uprightness."],
        ap.active_plans = ["To politely decline Julia's invitation to stay longer at Ostia, prioritizing her own schedule and comfort.", "To maintain social decorum and engage in polite conversation, while keeping the interaction superficial and avoiding deep emotional engagement.", "To deflect or gently rebuke Julia's more cynical and potentially scandalous remarks, especially those concerning Livia and Drusus's death."],
        ap.beliefs = ["Domestic tasks like sewing should be done properly, and slaves are often unreliable requiring oversight.", "Family members, especially those with vulnerabilities like Claudius, deserve compassion and affection, regardless of personal feelings.", "Serious accusations, especially those implicating someone in poisoning, require concrete evidence and should not be made lightly or in jest."],
        ap.goals = ["Short-term: To politely conclude the visit and return to her own household and responsibilities.", "Medium-term: To maintain a respectful but emotionally distant relationship with Julia, navigating the complexities of their familial ties.", "Ultimate: To uphold moral standards and familial propriety within the imperial family, even as she observes its increasing dysfunction and moral decay."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Julia sits on the terrace, effortlessly wiping sand from Agrippina\'s face while maintaining a light-hearted banter with Antonia. Her posture is relaxed, embodying a motherly presence as she navigates the chaos of children playing nearby.',
        ap.emotional_state = 'Julia outwardly displays exasperation mixed with amusement at the children\'s antics. Internally, she grapples with the complexity of motherhood amidst the imperial tensions, yearning for deeper connection while maintaining her composure. Her sharp wit serves as both shield and weapon against her frustrations.',
        ap.emotional_tags = ["julia outwardly displays exasperation mixed with amusement at the children's antics. internally, she grapples with the complexity of motherhood amidst the imperial tensions, yearning for deeper connection while maintaining her composure. her sharp wit serves as both shield", "weapon against her frustrations.", "julia outwardly displays exasperation mixed with amusement at the children's antics. internally", "she grapples with the complexity of motherhood amidst the imperial tensions", "yearning for deeper connection while maintaining her composure. her sharp wit serves as both shield and weapon against her frustrations.", "julia outwardly displays exasperation mixed with amusement at the children's antics. internally, she grapples with the complexity of motherhood amidst the imperial tensions, yearning for deeper connection", "maintaining her composure. her sharp wit serves as both shield and weapon against her frustrations."],
        ap.active_plans = ["To mediate the quarrel between Agrippina and Germanicus with a light touch.", "To maintain a calm atmosphere for the children while navigating familial duties.", "To subtly assert her role as a mother amidst the political turmoil surrounding her."],
        ap.beliefs = ["Family is paramount, and resolving conflicts is essential for harmony.", "Playfulness is a necessary component of childhood that should be nurtured.", "Her experience with Tiberius has made her wary of emotional vulnerability."],
        ap.goals = ["Short-term: To soothe Agrippina after the sand incident.", "Medium-term: To foster a sense of togetherness among the children despite their rivalries.", "Ultimate: To create a nurturing environment that shields them from the dangers of the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Antonia sits beside Julia, sewing quietly while observing the children with a mixture of concern and maternal affection. She leans forward slightly, her hands stilling at the outburst from Agrippina, ready to intervene.',
        ap.emotional_state = 'Antonia displays a calm exterior, although there is underlying anxiety regarding the children\'s interactions and the imperial family\'s complexities. She feels a protective instinct towards Agrippina, yet struggles with her own feelings of affection for Claudius, revealing a tension between duty and personal sentiment.',
        ap.emotional_tags = ["antonia displays a calm exterior, although there is underlying anxiety regarding the children's interactions", "the imperial family's complexities. she feels a protective instinct towards agrippina, yet struggles with her own feelings of affection for claudius, revealing a tension between duty", "personal sentiment.", "antonia displays a calm exterior", "although there is underlying anxiety regarding the children's interactions and the imperial family's complexities. she feels a protective instinct towards agrippina", "yet struggles with her own feelings of affection for claudius", "revealing a tension between duty and personal sentiment."],
        ap.active_plans = ["To mediate the bickering between Agrippina and Germanicus gently.", "To ensure the children engage in wholesome play rather than petty spats.", "To maintain a sense of order and propriety in the environment."],
        ap.beliefs = ["It is important to uphold decorum and stability within family dynamics.", "Children should be taught respect and kindness from a young age.", "Affection must be tempered with realism, especially towards those deemed different."],
        ap.goals = ["Short-term: To calm the situation and prevent further conflict between the children.", "Medium-term: To strengthen her relationship with Julia while navigating the challenges of motherhood.", "Ultimate: To cultivate a nurturing family environment that promotes unity and stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands with a dramatic flair, her face smeared with sand, clearly upset and seeking reassurance from her mother. She gestures animatedly, demanding attention and validation for her grievances.',
        ap.emotional_state = 'Agrippina displays surface-level outrage and distress at being sanded by Germanicus. Beneath her petulance, there is a yearning for attention and protection from her mother, revealing her childlike vulnerability amidst the sibling squabble.',
        ap.emotional_tags = ["agrippina displays surface-level outrage", "distress at being sanded by germanicus. beneath her petulance, there is a yearning for attention", "protection from her mother, revealing her childlike vulnerability amidst the sibling squabble.", "agrippina displays surface-level outrage and distress at being sanded by germanicus. beneath her petulance", "there is a yearning for attention and protection from her mother", "revealing her childlike vulnerability amidst the sibling squabble."],
        ap.active_plans = ["To garner sympathy and support from her mother against Germanicus.", "To assert herself in the sibling dynamics by highlighting her grievances.", "To seek reassurance and validation from her family."],
        ap.beliefs = ["Justice must be served when wronged; sibling rivalry should be acknowledged.", "Attention from her parents is vital for her self-worth.", "Being dramatic is a valid means to express her feelings."],
        ap.goals = ["Short-term: To gain her mother's immediate attention and protection from Germanicus.", "Medium-term: To establish herself as deserving of respect among her siblings.", "Ultimate: To feel secure and valued within the family structure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Germanicus stands nearby, cheeks flushed with mischief and a hint of remorse. He defends his teasing, eager to show he meant no harm while trying to playfully engage with Agrippina.',
        ap.emotional_state = 'Germanicus initially projects confidence and playfulness, but quickly shifts to a more apologetic demeanor upon realizing Agrippina\'s distress. This duality reflects the innocence of childhood, where mischief can quickly turn to concern for a sibling\'s feelings.',
        ap.emotional_tags = ["germanicus initially projects confidence", "playfulness, but quickly shifts to a more apologetic demeanor upon realizing agrippina's distress. this duality reflects the innocence of childhood, where mischief can quickly turn to concern for a sibling's feelings.", "germanicus initially projects confidence and playfulness", "but quickly shifts to a more apologetic demeanor upon realizing agrippina's distress. this duality reflects the innocence of childhood", "where mischief can quickly turn to concern for a sibling's feelings.", "germanicus initially projects confidence and playfulness,", "quickly shifts to a more apologetic demeanor upon realizing agrippina's distress. this duality reflects the innocence of childhood, where mischief can quickly turn to concern for a sibling's feelings."],
        ap.active_plans = ["To tease Agrippina in a playful manner without causing genuine harm.", "To repair his relationship with Agrippina after the sand incident.", "To engage with the other children and maintain the playful atmosphere."],
        ap.beliefs = ["Siblings should be able to tease one another as a sign of affection.", "Playfulness is a key part of childhood interactions.", "Apologies are necessary to mend relationships when feelings are hurt."],
        ap.goals = ["Short-term: To smooth things over with Agrippina and return to playful activities.", "Medium-term: To strengthen his bonds with his siblings through lighthearted interactions.", "Ultimate: To navigate the complexities of family dynamics while asserting his own identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Julia lounges elegantly on the seaside terrace, engaging Antonia in seemingly casual conversation while children play nearby. She initiates the discussion, steering it from pleasantries to more pointed personal inquiries about family matters and then subtly shifting the tone towards darker suspicions regarding Livia.',
        ap.emotional_state = 'Beneath a veneer of languid boredom and aristocratic amusement, Julia is sharp and calculating. She is restless in her exile, seeking to alleviate her ennui by engaging Antonia. However, a simmering resentment towards Livia and a penchant for sowing discord are evident, as she subtly probes Antonia\'s vulnerabilities and plants seeds of doubt about Drusus\'s death. There is a calculated coolness to her seemingly casual insinuations.',
        ap.emotional_tags = ["beneath a veneer of languid boredom", "aristocratic amusement, julia is sharp", "calculating. she is restless in her exile, seeking to alleviate her ennui by engaging antonia. however, a simmering resentment towards livia", "a penchant for sowing discord are evident, as she subtly probes antonia's vulnerabilities", "plants seeds of doubt about drusus's death. there is a calculated coolness to her seemingly casual insinuations.", "beneath a veneer of languid boredom and aristocratic amusement", "julia is sharp and calculating. she is restless in her exile", "seeking to alleviate her ennui by engaging antonia. however", "a simmering resentment towards livia and a penchant for sowing discord are evident", "as she subtly probes antonia's vulnerabilities and plants seeds of doubt about drusus's death. there is a calculated coolness to her seemingly casual insinuations."],
        ap.active_plans = ["To alleviate her boredom and find amusement in conversation with Antonia during her exile.", "To subtly plant seeds of suspicion in Antonia\u2019s mind regarding Livia\u2019s potential involvement in Drusus\u2019s death, aiming to undermine Livia's influence.", "To gauge Antonia\u2019s perception of Livia and potentially forge a shared sense of distrust or unease towards the Empress Mother within the family."],
        ap.beliefs = ["Livia is a dangerous and manipulative woman capable of extreme acts, including murder, to achieve her ambitions.", "Tiberius shares her suspicions about Livia and might even have been banished partly due to his awareness of Livia's true nature.", "Antonia, while virtuous and well-meaning, is somewhat naive to the darker currents within the imperial family and needs to be awakened to Livia's treachery."],
        ap.goals = ["Short-term: To alleviate her boredom and engage in stimulating conversation, breaking the monotony of exile.", "Medium-term: To sow seeds of doubt and paranoia about Livia within Antonia, subtly weakening Livia's perceived power and influence within the family circle.", "Ultimate: To undermine Livia\u2019s authority and potentially destabilize her position within the dynasty, possibly creating future opportunities for Julia or her sons, driven by resentment and a desire for retribution against Livia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Antonia sits with Julia on the sun-drenched terrace, occupied with sewing, a picture of domesticity amidst the subtle tensions. Initially focused on everyday concerns about her children, particularly Claudius, she listens with growing unease as Julia steers the conversation toward darker, more conspiratorial topics.',
        ap.emotional_state = 'Antonia begins the scene in a state of gentle maternal worry, fretting over Claudius\'s future and confessing her struggle to feel deep affection for him. As Julia introduces the unsettling topic of Drusus\'s death and implicates Livia, Antonia becomes increasingly uncomfortable and distressed. She displays initial resistance to Julia\'s accusations, reflecting her inherent loyalty and virtuous nature, yet Julia\'s insinuations visibly disturb her, planting seeds of doubt and paranoia despite her outward denials.',
        ap.emotional_tags = ["antonia begins the scene in a state of gentle maternal worry, fretting over claudius's future", "confessing her struggle to feel deep affection for him. as julia introduces the unsettling topic of drusus's death", "implicates livia, antonia becomes increasingly uncomfortable", "distressed. she displays initial resistance to julia's accusations, reflecting her inherent loyalty", "virtuous nature, yet julia's insinuations visibly disturb her, planting seeds of doubt", "paranoia despite her outward denials.", "antonia begins the scene in a state of gentle maternal worry", "fretting over claudius's future and confessing her struggle to feel deep affection for him. as julia introduces the unsettling topic of drusus's death and implicates livia", "antonia becomes increasingly uncomfortable and distressed. she displays initial resistance to julia's accusations", "reflecting her inherent loyalty and virtuous nature", "yet julia's insinuations visibly disturb her", "planting seeds of doubt and paranoia despite her outward denials."],
        ap.active_plans = ["To enjoy a peaceful and sociable visit with Julia at her seaside villa, seeking respite from the pressures of Rome.", "To engage in light, domestic conversation with Julia, focusing on familial matters and the upbringing of their children.", "To maintain social decorum and avoid confrontation, initially attempting to deflect Julia's more provocative and accusatory statements regarding Livia."],
        ap.beliefs = ["Maintaining family harmony and adhering to Roman virtues of propriety and restraint are paramount.", "Accusing someone of a heinous crime like poisoning without concrete evidence is morally reprehensible and socially disruptive.", "She carries a sense of maternal duty and guilt regarding Claudius, believing she *should* feel more affection for him despite her genuine struggles to connect with his perceived intellectual limitations."],
        ap.goals = ["Short-term: To have a pleasant and relaxing social interaction with Julia, enjoying the seaside setting and the company of family.", "Medium-term: To address her anxieties about Claudius's future prospects and her own emotional distance from him in a safe and understanding environment.", "Ultimate: To preserve a semblance of peace and stability within her family, shielding them from scandal and open conflict, and to uphold the moral standards she believes are essential for Roman society, even as those standards are increasingly challenged by the actions of her kin."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Julia sits gracefully on the terrace, her elegance contrasting with her pointed words. She engages with Antonia while addressing her son Lucius and Plautius, displaying maternal affection laced with sarcasm. Her gestures, often dismissive and teasing, reflect a complex interplay of love and frustration.',
        ap.emotional_state = 'Outwardly playful and flirtatious, Julia\'s surface charm belies an undercurrent of resentment towards Lucius for his impending departure. Internally, she grapples with feelings of abandonment and a longing for connection, suggesting a strained relationship with her son amid her affection for Plautius.',
        ap.emotional_tags = ["outwardly playful", "flirtatious, julia's surface charm belies an undercurrent of resentment towards lucius for his impending departure. internally, she grapples with feelings of abandonment", "a longing for connection, suggesting a strained relationship with her son amid her affection for plautius.", "outwardly playful and flirtatious", "julia's surface charm belies an undercurrent of resentment towards lucius for his impending departure. internally", "she grapples with feelings of abandonment and a longing for connection", "suggesting a strained relationship with her son amid her affection for plautius."],
        ap.active_plans = ["To maintain her influence over Plautius through the parting gift, subtly reinforcing their bond.", "To navigate the emotional landscape of her family dynamics, balancing affection and criticism.", "To assert her position within the family hierarchy, particularly in her interactions with Lucius."],
        ap.beliefs = ["The importance of maintaining familial bonds, even if strained.", "The inseparability of affection and sacrifice within her relationships.", "That power dynamics in the family often dictate personal interactions."],
        ap.goals = ["Short-term: To send Plautius away with a sense of connection and appreciation.", "Medium-term: To keep Lucius close emotionally, despite his physical departure.", "Ultimate: To navigate the treacherous waters of familial loyalty and assert her role as matriarch."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Antonia sits next to Julia, engaged in sewing, her demeanor reserved but attentive. She interacts with Julia and the children, displaying a nurturing presence. Her body language reflects concern, especially regarding Lucius and the family dynamics unfolding.',
        ap.emotional_state = 'Antonia exhibits a mix of anxiety and resolve, feeling the weight of familial expectations. While she strives to maintain harmony, her underlying worry about the future of the family and its members, particularly regarding Lucius\'s well-being, creates tension beneath her composed exterior.',
        ap.emotional_tags = ["antonia exhibits a mix of anxiety", "resolve, feeling the weight of familial expectations. while she strives to maintain harmony, her underlying worry about the future of the family", "its members, particularly regarding lucius's well-being, creates tension beneath her composed exterior.", "antonia exhibits a mix of anxiety and resolve", "feeling the weight of familial expectations. while she strives to maintain harmony", "her underlying worry about the future of the family and its members", "particularly regarding lucius's well-being", "creates tension beneath her composed exterior."],
        ap.active_plans = ["To support Julia and uphold the family\u2019s integrity amidst rising tensions.", "To instill a sense of responsibility in the children, particularly regarding Lucius.", "To address Julia\u2019s dismissive attitude towards Lucius and advocate for clearer understanding."],
        ap.beliefs = ["Family loyalty must be prioritized, even amidst personal differences.", "It is essential to nurture the younger generation to prevent future conflicts.", "Strong moral values should guide their interactions and decisions."],
        ap.goals = ["Short-term: To foster a peaceful and supportive environment for the children.", "Medium-term: To ensure Lucius is prepared for his upcoming duties in Rome.", "Ultimate: To reinforce familial bonds and create a legacy of strength and virtue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Lucius stands confidently, preparing to depart with Plautius, his demeanor reflecting youthful enthusiasm but tinged with naivety. He engages with his mother and peers, showing signs of impatience as he is eager to leave.',
        ap.emotional_state = 'Lucius exudes confidence, yet there is a hint of defensiveness when Julia calls him a \'deserter.\' Internally, he struggles with the expectations placed upon him by his mother and Augustus, revealing an underlying tension between loyalty to family and personal ambition.',
        ap.emotional_tags = ["lucius exudes confidence, yet there is a hint of defensiveness when julia calls him a 'deserter.' internally, he struggles with the expectations placed upon him by his mother", "augustus, revealing an underlying tension between loyalty to family", "personal ambition.", "lucius exudes confidence", "yet there is a hint of defensiveness when julia calls him a 'deserter.' internally", "he struggles with the expectations placed upon him by his mother and augustus", "revealing an underlying tension between loyalty to family and personal ambition."],
        ap.active_plans = ["To leave for Rome and fulfill his duties under Augustus, demonstrating his capability.", "To shrug off his mother's teasing, maintaining a facade of maturity.", "To navigate his role in the family while seeking approval from Augustus."],
        ap.beliefs = ["Family loyalty is paramount, yet personal ambition must not be sacrificed.", "He is deserving of trust from his family and Augustus due to his lineage.", "Youthful exuberance can be a strength, yet it can also lead to misinterpretations."],
        ap.goals = ["Short-term: To complete his journey to Rome and gain recognition.", "Medium-term: To build a reputation as a capable leader in Augustus's eyes.", "Ultimate: To secure a stable position within the imperial hierarchy and gain familial respect."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Plautius stands by Lucius, eager to engage with Julia while displaying a polite demeanor. His nervousness around Julia and the imperial family is evident in his cautious words and movements, reflecting an opportunistic yet respectful nature.',
        ap.emotional_state = 'Plautius feels a mix of admiration and anxiety, striving to impress Julia while navigating the complexities of familial dynamics. Internally, he grapples with the implications of his role in the court and the delicate balance of authority and subservience.',
        ap.emotional_tags = ["plautius feels a mix of admiration", "anxiety, striving to impress julia while navigating the complexities of familial dynamics. internally, he grapples with the implications of his role in the court", "the delicate balance of authority", "subservience.", "plautius feels a mix of admiration and anxiety", "striving to impress julia while navigating the complexities of familial dynamics. internally", "he grapples with the implications of his role in the court and the delicate balance of authority and subservience.", "plautius feels a mix of admiration and anxiety, striving to impress julia", "navigating the complexities of familial dynamics. internally, he grapples with the implications of his role in the court and the delicate balance of authority and subservience."],
        ap.active_plans = ["To maintain a favorable rapport with Julia through his interactions.", "To support Lucius during their journey to Rome, ensuring camaraderie.", "To subtly position himself as a valuable ally within the imperial family."],
        ap.beliefs = ["Loyalty to the family is crucial for survival and advancement within the court.", "Respect must be shown to powerful figures, especially women like Julia.", "Opportunism in court politics is necessary for personal success."],
        ap.goals = ["Short-term: To secure Julia's favor through his polite behavior.", "Medium-term: To establish a reputation as a trusted aide to Lucius.", "Ultimate: To rise within the social hierarchy by leveraging family connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Julia lounges elegantly on the seaside terrace, engaged in seemingly casual conversation with Antonia, while observing her children playing nearby.  She maintains a relaxed posture, gesturing dismissively when Postumus approaches, her movements suggesting an air of aristocratic leisure and detachment from any immediate concerns.',
        ap.emotional_state = 'Beneath a veneer of boredom and casual amusement, Julia harbors a controlling nature, evident in her swift dismissal of Postumus\'s plea. There\'s a subtle impatience in her tone, suggesting a weariness with familial demands.  Internally, she\'s likely indifferent to Postumus\'s distress, prioritizing her own comfort and social performance over genuine maternal concern, masking deeper anxieties about her position and Livia\'s influence.',
        ap.emotional_tags = ["beneath a veneer of boredom", "casual amusement, julia harbors a controlling nature, evident in her swift dismissal of postumus's plea. there's a subtle impatience in her tone, suggesting a weariness with familial demands.  internally, she's likely indifferent to postumus's distress, prioritizing her own comfort", "social performance over genuine maternal concern, masking deeper anxieties about her position", "livia's influence.", "beneath a veneer of boredom and casual amusement", "julia harbors a controlling nature", "evident in her swift dismissal of postumus's plea. there's a subtle impatience in her tone", "suggesting a weariness with familial demands.  internally", "she's likely indifferent to postumus's distress", "prioritizing her own comfort and social performance over genuine maternal concern", "masking deeper anxieties about her position and livia's influence."],
        ap.active_plans = ["Maintain a facade of aristocratic indifference and leisure.", "Control her children's movements and activities, especially Postumus's.", "Continue her subtle probing of Antonia regarding the suspicious circumstances surrounding Drusus's death, seeking to sow seeds of doubt about Livia."],
        ap.beliefs = ["Her children are extensions of her social standing and should adhere to her will.", "Displays of vulnerability are unbecoming of her status and should be suppressed.", "Livia is a dangerous and manipulative force within the family, capable of dark deeds."],
        ap.goals = ["Short-term: Enjoy a peaceful and socially acceptable afternoon at the seaside.", "Medium-term: Uphold her image as a sophisticated and unbothered noblewoman despite her exile.", "Ultimate: Regain influence and power within the Julio-Claudian dynasty, potentially by undermining Livia's authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Lucius stands formally with Plautius, preparing to depart from Ostia back to Rome. He listens to Postumus\'s plea with a detached politeness, his body language suggesting a desire to conclude the interaction quickly. He directs Postumus to Julia, avoiding direct involvement in the familial tension.',
        ap.emotional_state = 'Lucius projects an air of polite indifference, masking a potential internal conflict between familial obligation and personal ambition. He appears somewhat uncomfortable with Postumus\'s emotional display, preferring to maintain a superficial pleasantness.  Beneath the surface, he may be relieved to be leaving the strained atmosphere of Ostia, eager to return to Rome and focus on his upcoming assignment in Spain, prioritizing his own career over family disputes.',
        ap.emotional_tags = ["lucius projects an air of polite indifference, masking a potential internal conflict between familial obligation", "personal ambition. he appears somewhat uncomfortable with postumus's emotional display, preferring to maintain a superficial pleasantness.  beneath the surface, he may be relieved to be leaving the strained atmosphere of ostia, eager to return to rome", "focus on his upcoming assignment in spain, prioritizing his own career over family disputes.", "lucius projects an air of polite indifference", "masking a potential internal conflict between familial obligation and personal ambition. he appears somewhat uncomfortable with postumus's emotional display", "preferring to maintain a superficial pleasantness.  beneath the surface", "he may be relieved to be leaving the strained atmosphere of ostia", "eager to return to rome and focus on his upcoming assignment in spain", "prioritizing his own career over family disputes."],
        ap.active_plans = ["Depart Ostia smoothly and without further familial complications.", "Maintain a polite but distant facade towards his family members.", "Return to Rome and prepare for his departure to Spain, focusing on his imperial duties."],
        ap.beliefs = ["Maintaining a composed and agreeable demeanor is crucial for social and political advancement.", "Directly engaging in family drama is detrimental to his own interests.", "Obeying his mother's directives, while perhaps not always agreeable, is the safest course of action."],
        ap.goals = ["Short-term: Escape the emotionally charged atmosphere of Ostia without incident.", "Medium-term: Successfully execute his responsibilities in Spain, proving his competence to Augustus.", "Ultimate: Secure a prominent position within the Roman hierarchy, gaining favor with Augustus and advancing his political career."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Postumus approaches Lucius with visible agitation, his posture slumped and his tone pleading as he asks to accompany Lucius back to Rome. He is restless and unhappy, seeking an escape from his current surroundings and interactions, his movements conveying a desperate desire for change.',
        ap.emotional_state = 'Postumus is deeply anxious and unhappy, his desperation palpable as he pleads with Lucius. He feels trapped and suffocated, likely by the pressures of his family and potentially a souring relationship with Livilla, hinted at by Lucius\'s comment. Internally, he is yearning for freedom and escape, his emotional state dominated by a profound desire to alter his circumstances, driven by a sense of unease and a wish to flee from his current discontent.',
        ap.emotional_tags = ["postumus is deeply anxious", "unhappy, his desperation palpable as he pleads with lucius. he feels trapped", "suffocated, likely by the pressures of his family", "potentially a souring relationship with livilla, hinted at by lucius's comment. internally, he is yearning for freedom", "escape, his emotional state dominated by a profound desire to alter his circumstances, driven by a sense of unease", "a wish to flee from his current discontent.", "postumus is deeply anxious and unhappy", "his desperation palpable as he pleads with lucius. he feels trapped and suffocated", "likely by the pressures of his family and potentially a souring relationship with livilla", "hinted at by lucius's comment. internally", "he is yearning for freedom and escape", "his emotional state dominated by a profound desire to alter his circumstances", "driven by a sense of unease and a wish to flee from his current discontent."],
        ap.active_plans = ["Persuade Lucius and Julia to allow him to return to Rome.", "Escape the unpleasant situation at Ostia, possibly to avoid Livilla or other familial pressures.", "Seek a change of scenery and environment to alleviate his current unhappiness."],
        ap.beliefs = ["Rome offers a potential escape from his current distress.", "Lucius, as an elder brother, might offer a path to freedom.", "His mother, Julia, is likely to be unyielding and controlling, but it's worth trying to persuade her through Lucius."],
        ap.goals = ["Short-term: Gain permission to leave Ostia immediately and travel to Rome with Lucius.", "Medium-term: Find a way to improve his emotional state and escape the pressures of his familial life.", "Ultimate: Define his own path, potentially away from the suffocating expectations of his imperial family, though this goal remains vague and undefined."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Domitius arrives at the seaside terrace, his entrance marked by a formal and deliberate stride. He greets Julia and Lucius with a solemn gravitas, immediately establishing a more serious and portentous atmosphere. His presence and pronouncements command attention, his gestures deliberate and weighty.',
        ap.emotional_state = 'Domitius embodies a serious and portentous demeanor, his expressions and tone conveying a sense of gravity and foreboding. He carries himself as a messenger of fate, his emotional state aligned with the weight of the omens he is prepared to interpret. Internally, he is likely in a state of heightened awareness, attuned to divine signs and ready to deliver pronouncements, approaching his role with solemnity and a belief in the significance of his interpretations.',
        ap.emotional_tags = ["domitius embodies a serious", "portentous demeanor, his expressions", "tone conveying a sense of gravity", "foreboding. he carries himself as a messenger of fate, his emotional state aligned with the weight of the omens he is prepared to interpret. internally, he is likely in a state of heightened awareness, attuned to divine signs", "ready to deliver pronouncements, approaching his role with solemnity", "a belief in the significance of his interpretations.", "domitius embodies a serious and portentous demeanor", "his expressions and tone conveying a sense of gravity and foreboding. he carries himself as a messenger of fate", "his emotional state aligned with the weight of the omens he is prepared to interpret. internally", "he is likely in a state of heightened awareness", "attuned to divine signs and ready to deliver pronouncements", "approaching his role with solemnity and a belief in the significance of his interpretations."],
        ap.active_plans = ["Pay a formal visit to Julia, ostensibly en route to Formiae.", "Introduce an element of gravity and foreboding into the relaxed seaside setting.", "Observe the family dynamics and surroundings, potentially seeking or anticipating further omens to interpret and reveal."],
        ap.beliefs = ["Divine will is communicated through omens and signs.", "He has a sacred duty to interpret and reveal these omens to those who need to hear them.", "Events are often predetermined and foreshadowed by divine interventions in the natural world."],
        ap.goals = ["Short-term: Fulfill social obligations by visiting Julia while traveling.", "Medium-term: Act as a conduit for divine communication, interpreting and delivering omens accurately.", "Ultimate: Serve the gods and provide guidance to mortals through his prophetic abilities, upholding the traditional Roman religious practices."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Julia, elegant and sharp-tongued, remains seated on the terrace, conversing with Antonia while watching her children play nearby. Her posture is relaxed, but her demeanor shifts as the scene escalates, reflecting her deep concern at the sudden turn of events.',
        ap.emotional_state = 'Julia initially embodies a sense of lightheartedness, but as the eagles clash and the wolf cub falls, her anxiety heightens. She becomes increasingly alarmed, revealing a growing fear about the implications of the omen and the potential danger it represents for her family.',
        ap.emotional_tags = ["julia initially embodies a sense of lightheartedness, but as the eagles clash", "the wolf cub falls, her anxiety heightens. she becomes increasingly alarmed, revealing a growing fear about the implications of the omen", "the potential danger it represents for her family.", "julia initially embodies a sense of lightheartedness", "but as the eagles clash and the wolf cub falls", "her anxiety heightens. she becomes increasingly alarmed", "revealing a growing fear about the implications of the omen and the potential danger it represents for her family.", "julia initially embodies a sense of lightheartedness,", "as the eagles clash and the wolf cub falls, her anxiety heightens. she becomes increasingly alarmed, revealing a growing fear about the implications of the omen and the potential danger it represents for her family."],
        ap.active_plans = ["Engage in light conversation to maintain a relaxed atmosphere among the adults.", "Monitor the children to ensure their safety while they play.", "Process the shocking omen of the wolf cub and how it may affect her family's position."],
        ap.beliefs = ["The supernatural holds significance in interpreting events surrounding her family.", "She is protective of her children, believing that they should be shielded from impending dangers.", "Family dynamics are fraught with danger and manipulation, as evidenced by Livia's influences."],
        ap.goals = ["Short-term: Maintain a sense of normalcy and calmness among the children and guests.", "Medium-term: Navigate the implications of the omen and protect her family's legacy.", "Ultimate: Ensure the safety and stability of her family amidst rising political tensions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Germanicus, lively and mischievous, is engaged in playful banter with Agrippina and the other children. He points excitedly at the eagles fighting in the sky, drawing attention to the aerial spectacle, but his demeanor shifts to concern when the wolf cub falls.',
        ap.emotional_state = 'Initially playful and teasing, Germanicus\'s mood changes to one of concern as the wolf cub falls from the sky. He exhibits a protective instinct towards his siblings, trying to ease Agrippina\'s distress after the incident.',
        ap.emotional_tags = ["initially playful", "teasing, germanicus's mood changes to one of concern as the wolf cub falls from the sky. he exhibits a protective instinct towards his siblings, trying to ease agrippina's distress after the incident.", "initially playful and teasing", "germanicus's mood changes to one of concern as the wolf cub falls from the sky. he exhibits a protective instinct towards his siblings", "trying to ease agrippina's distress after the incident."],
        ap.active_plans = ["Engage the other children in playful observation of the eagles.", "Support Agrippina and reassure her after the shocking event.", "Assist in keeping the atmosphere light despite the ominous occurrence."],
        ap.beliefs = ["Children should be able to play and enjoy their time together without fear.", "Family bonds are important and should be protected, especially among siblings.", "The world around them can be dangerous, and awareness of such dangers is vital."],
        ap.goals = ["Short-term: Keep the children's spirits high and prevent panic.", "Medium-term: Foster a sense of unity and support among his siblings.", "Ultimate: Ensure the safety of his family amidst the uncertainty the omen brings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Postumus stands nearby, slightly withdrawn from the playful interactions. He observes the departure of Lucius with apprehension, and his body language reflects anxiety regarding his future and place within the family.',
        ap.emotional_state = 'Postumus feels conflicted and anxious, experiencing a sense of longing for acceptance and belonging. The ominous fall of the wolf cub amplifies his feelings of insecurity and foreboding, intensifying his desire to escape his current situation.',
        ap.emotional_tags = ["postumus feels conflicted", "anxious, experiencing a sense of longing for acceptance", "belonging. the ominous fall of the wolf cub amplifies his feelings of insecurity", "foreboding, intensifying his desire to escape his current situation.", "postumus feels conflicted and anxious", "experiencing a sense of longing for acceptance and belonging. the ominous fall of the wolf cub amplifies his feelings of insecurity and foreboding", "intensifying his desire to escape his current situation."],
        ap.active_plans = ["Consider his options for leaving with Lucius and what that might mean.", "Navigate familial dynamics carefully, aware of the tensions surrounding him.", "Seek reassurance from his family regarding his role and future."],
        ap.beliefs = ["Family loyalty and connection are vital, but they come with heavy burdens.", "His worth is continually questioned due to his troubled past and familial expectations.", "The dynamics of succession and power create instability and fear for his future."],
        ap.goals = ["Short-term: Express desire to leave with Lucius, seeking escape from the current tension.", "Medium-term: Understand his place in the family amid growing conflict.", "Ultimate: Find stability and recognition within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Castor is observant and curious, watching the eagles as they fight. His excitement grows as he identifies the wolf cub falling, showcasing his engagement with the unfolding drama and innocence amid the tension.',
        ap.emotional_state = 'Castor\'s initial excitement transforms into a mixture of awe and concern as he witnesses the violence of nature, feeling a childlike wonder but also a budding sense of foreboding at the implications of the fallen omens.',
        ap.emotional_tags = ["castor's initial excitement transforms into a mixture of awe", "concern as he witnesses the violence of nature, feeling a childlike wonder but also a budding sense of foreboding at the implications of the fallen omens.", "castor's initial excitement transforms into a mixture of awe and concern as he witnesses the violence of nature", "feeling a childlike wonder but also a budding sense of foreboding at the implications of the fallen omens.", "castor's initial excitement transforms into a mixture of awe and concern as he witnesses the violence of nature, feeling a childlike wonder", "also a budding sense of foreboding at the implications of the fallen omens."],
        ap.active_plans = ["Vocalize observations about the eagles and encourage the others to pay attention.", "Engage with his siblings to make sense of the spectacle above.", "Navigate his emotions regarding the shocking fall and its implications."],
        ap.beliefs = ["Nature holds secrets and messages that can reveal truths about the world.", "Family interactions are important, and he enjoys sharing experiences with his siblings.", "Curiosity about the world is essential, even in frightening circumstances."],
        ap.goals = ["Short-term: Share the excitement of the eagles with his siblings.", "Medium-term: Understand the significance of the wolf cub's fall and its impact.", "Ultimate: Develop a greater understanding of the world around him and his family's role in it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Claudius, sensitive and vulnerable, stands among the other children, observing the spectacle. As the wolf cub lands at his feet, he initially seems bewildered, before displaying a desperate yearning to protect the creature.',
        ap.emotional_state = 'Claudius feels a rush of conflicting emotions—excitement from the attention, fear from the violent omen, and a strong instinctual desire to care for the wounded cub. His stammer may reflect his struggle to articulate his feelings.',
        ap.emotional_tags = ["claudius feels a rush of conflicting emotions\u2014excitement from the attention, fear from the violent omen,", "a strong instinctual desire to care for the wounded cub. his stammer may reflect his struggle to articulate his feelings.", "claudius feels a rush of conflicting emotions\u2014excitement from the attention", "fear from the violent omen", "and a strong instinctual desire to care for the wounded cub. his stammer may reflect his struggle to articulate his feelings."],
        ap.active_plans = ["Draw closer to the wolf cub, seeking to comfort and protect it.", "Navigate interactions with his siblings, desiring inclusion and understanding.", "Make sense of the ominous event and its implications for his family."],
        ap.beliefs = ["He believes in the importance of compassion and care for the vulnerable.", "Being part of the family means facing dangers, but he yearns to be included despite his limitations.", "Nature can be both beautiful and cruel, and understanding this duality is crucial."],
        ap.goals = ["Short-term: Protect the wolf cub that has landed at his feet.", "Medium-term: Gain acceptance and understanding from his siblings and family.", "Ultimate: Find his place within the family and navigate his complex identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands with her siblings, visibly upset after Germanicus\'s teasing. However, the fall of the wolf cub captures her attention, shifting her focus from sibling rivalry to the unfolding drama.',
        ap.emotional_state = 'Initially petulant and dramatic over her brother\'s antics, Agrippina\'s mood shifts to concern and fear upon witnessing the bloody omen. Her emotional responses fluctuate quickly, revealing her youthful impulsiveness and strong attachment to family.',
        ap.emotional_tags = ["initially petulant", "dramatic over her brother's antics, agrippina's mood shifts to concern", "fear upon witnessing the bloody omen. her emotional responses fluctuate quickly, revealing her youthful impulsiveness", "strong attachment to family.", "initially petulant and dramatic over her brother's antics", "agrippina's mood shifts to concern and fear upon witnessing the bloody omen. her emotional responses fluctuate quickly", "revealing her youthful impulsiveness and strong attachment to family."],
        ap.active_plans = ["Seek reassurance from her mother while navigating the tension with Germanicus.", "Focus on the fallen wolf cub and process the implications of the omen.", "Engage with her siblings to understand the significance of the event."],
        ap.beliefs = ["Family bonds are paramount, and conflicts should be resolved promptly.", "The world is filled with dangers that can appear suddenly, affecting her loved ones.", "Children are entitled to express their emotions freely, regardless of the situation."],
        ap.goals = ["Short-term: Resolve her feelings of annoyance with Germanicus.", "Medium-term: Understand the impact of the wolf cub's fall on her family.", "Ultimate: Navigate her place within the family structure and seek acceptance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Livilla observes the chaotic scene with a dismissive attitude, showing little concern for the fallen wolf cub. She rushes to claim the cub as her own, revealing a selfish streak amidst the turmoil.',
        ap.emotional_state = 'Livilla\'s flippant response to the ominous event demonstrates insensitivity and a lack of awareness about the gravity of the situation. Her actions illustrate a self-centered nature, seeking immediate gratification without considering the implications.',
        ap.emotional_tags = ["livilla's flippant response to the ominous event demonstrates insensitivity", "a lack of awareness about the gravity of the situation. her actions illustrate a self-centered nature, seeking immediate gratification without considering the implications.", "livilla's flippant response to the ominous event demonstrates insensitivity and a lack of awareness about the gravity of the situation. her actions illustrate a self-centered nature", "seeking immediate gratification without considering the implications."],
        ap.active_plans = ["Assert ownership over the fallen wolf cub as a means of claiming attention.", "Dismiss the gravity of the situation in favor of her own desires.", "Influence the other children to align with her viewpoint."],
        ap.beliefs = ["Personal desires trump the needs and feelings of others.", "Attention and ownership are paramount in maintaining social status among peers.", "The world revolves around her enjoyment and satisfaction."],
        ap.goals = ["Short-term: Claim the wolf cub for her own amusement.", "Medium-term: Maintain her social standing by asserting dominance over the other children.", "Ultimate: Ensure her needs and desires are prioritized in family dynamics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Julia is initially horrified by the sight of the bloodied wolf cub, recoiling from it and immediately seeking an explanation for this disturbing omen. She turns to Domitius, her elegant composure momentarily shattered by a visceral dread, urging him to decipher the violent sign from the heavens. She stands back, observing Domitius with a mixture of fear and morbid fascination.',
        ap.emotional_state = 'Julia is deeply disturbed and anxious. Her surface emotion is horror at the gruesome omen, evident in her recoiling and urgent questioning. Internally, she is gripped by fear and dread, sensing a shift in the balance of fate, and possibly linking it to her own precarious position. Her unspoken conflict is her aristocratic disdain battling with a primal fear of the unknown and the potential downfall it foretells.',
        ap.emotional_tags = ["julia is deeply disturbed", "anxious. her surface emotion is horror at the gruesome omen, evident in her recoiling", "urgent questioning. internally, she is gripped by fear", "dread, sensing a shift in the balance of fate,", "possibly linking it to her own precarious position. her unspoken conflict is her aristocratic disdain battling with a primal fear of the unknown", "the potential downfall it foretells.", "julia is deeply disturbed and anxious. her surface emotion is horror at the gruesome omen", "evident in her recoiling and urgent questioning. internally", "she is gripped by fear and dread", "sensing a shift in the balance of fate", "and possibly linking it to her own precarious position. her unspoken conflict is her aristocratic disdain battling with a primal fear of the unknown and the potential downfall it foretells."],
        ap.active_plans = ["Understand the meaning of the omen to alleviate her fear.", "Maintain a semblance of control by seeking rational explanation from Domitius.", "Protect her children from potential danger by understanding the prophecy."],
        ap.beliefs = ["Omens and divine signs are significant indicators of future events.", "As a member of the imperial family, she is susceptible to the whims of fate and divine will.", "Understanding the future allows for some measure of control or preparation."],
        ap.goals = ["Short-term: Decipher the immediate meaning of the omen.", "Medium-term: Prepare herself and her family for potential negative consequences.", "Ultimate: Secure her family's future and maintain her own status amidst uncertain times."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Antonia observes the unfolding scene with serious attention, her initial reaction one of grave concern. She swiftly takes charge, demanding Domitius interpret the omen openly. She ensures the children understand the gravity of the situation by making them swear an oath of secrecy, highlighting her responsible nature. When Livilla mocks the prophecy, Antonia firmly disciplines her, showcasing her protective and morally upright stance.',
        ap.emotional_state = 'Antonia is deeply serious and apprehensive. Outwardly, she is composed but firm, taking decisive action to manage the situation. Internally, she is filled with anxiety about the omen\'s implications, sensing a genuine threat. There\'s a tension between her desire to shield the children and her understanding that they must also face the realities of their world, revealed in her decision to have them witness the prophecy but swear secrecy.',
        ap.emotional_tags = ["antonia is deeply serious", "apprehensive. outwardly, she is composed but firm, taking decisive action to manage the situation. internally, she is filled with anxiety about the omen's implications, sensing a genuine threat. there's a tension between her desire to shield the children", "her understanding that they must also face the realities of their world, revealed in her decision to have them witness the prophecy but swear secrecy.", "antonia is deeply serious and apprehensive. outwardly", "she is composed but firm", "taking decisive action to manage the situation. internally", "she is filled with anxiety about the omen's implications", "sensing a genuine threat. there's a tension between her desire to shield the children and her understanding that they must also face the realities of their world", "revealed in her decision to have them witness the prophecy but swear secrecy.", "antonia is deeply serious and apprehensive. outwardly, she is composed", "firm, taking decisive action to manage the situation. internally, she is filled with anxiety about the omen's implications, sensing a genuine threat. there's a tension between her desire to shield the children and her understanding that they must also face the realities of their world, revealed in her decision to have them witness the prophecy", "swear secrecy."],
        ap.active_plans = ["Ensure full disclosure of the omen's meaning, even if unpleasant.", "Maintain order and control amidst a potentially chaotic situation.", "Protect the children from the immediate emotional impact and ensure their discretion."],
        ap.beliefs = ["Honesty and directness are crucial in serious matters.", "Children, even if young, must learn to face difficult truths and responsibilities.", "Maintaining decorum and discipline is important in the face of unsettling events."],
        ap.goals = ["Short-term: Obtain a clear and honest interpretation of the omen.", "Medium-term: Prepare the family psychologically for any potential future events predicted by the omen.", "Ultimate: Uphold moral order and familial stability amidst the uncertainties of fate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Domitius enters with an air of divine authority, his presence immediately shifting the mood to one of solemnity and foreboding. When Julia seeks his interpretation, he becomes the voice of prophecy, gravely pronouncing the wolf cub as an omen for Rome. He insists on a sacred oath from all present before revealing the full weight of his interpretation, emphasizing the gravity and secrecy required for such divine pronouncements. He stands as a conduit of fate, delivering a message heavy with consequence.',
        ap.emotional_state = 'Domitius is solemn and authoritative, embodying the gravity of his role as an omen-reader. His surface demeanor is serious and imposing, reflecting the weight of the prophecy he carries. Internally, he is likely composed and focused, believing in the divine significance of the omen. There is a sense of self-importance and perhaps a touch of theatricality in his pronouncements, highlighting his professional role and the dramatic nature of prophecy in Roman society.',
        ap.emotional_tags = ["domitius is solemn", "authoritative, embodying the gravity of his role as an omen-reader. his surface demeanor is serious", "imposing, reflecting the weight of the prophecy he carries. internally, he is likely composed", "focused, believing in the divine significance of the omen. there is a sense of self-importance", "perhaps a touch of theatricality in his pronouncements, highlighting his professional role", "the dramatic nature of prophecy in roman society.", "domitius is solemn and authoritative", "embodying the gravity of his role as an omen-reader. his surface demeanor is serious and imposing", "reflecting the weight of the prophecy he carries. internally", "he is likely composed and focused", "believing in the divine significance of the omen. there is a sense of self-importance and perhaps a touch of theatricality in his pronouncements", "highlighting his professional role and the dramatic nature of prophecy in roman society."],
        ap.active_plans = ["Interpret the omen according to his priestly knowledge and tradition.", "Ensure the prophecy is delivered with appropriate gravitas and respect for the gods.", "Maintain secrecy among witnesses to preserve the sanctity and impact of the omen."],
        ap.beliefs = ["Divine omens are sent to warn and guide mortals.", "Priests and augurs have a sacred duty to interpret and reveal these divine messages.", "Secrecy and ritual are essential to the proper handling of sacred knowledge."],
        ap.goals = ["Short-term: Accurately interpret and deliver the omen's message.", "Medium-term: Ensure his interpretation is respected and heeded by the family.", "Ultimate: Uphold his reputation as a skilled and reliable interpreter of divine will and maintain his standing within Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Livilla is initially curious about the wolf cub, wanting to possess it immediately and showing a typical childish desire for the novelty. However, upon hearing Domitius\'s grave prophecy and its implication for Claudius, she reacts with immediate disbelief and derision. She openly mocks the idea of Claudius as Rome\'s protector, expressing a cruel and dismissive view of her brother, culminating in her being punished by Antonia and sent to her room.',
        ap.emotional_state = 'Livilla is characterized by dismissive mockery and childish cruelty. Outwardly, she expresses disbelief and scorn, laughing at the prophecy and belittling Claudius. Internally, she is likely motivated by jealousy or a general lack of empathy, unable to grasp the seriousness of the moment or the potential significance of the prophecy. Her unspoken conflict is her selfish desire for attention and her inability to understand or respect the solemnity of the situation.',
        ap.emotional_tags = ["livilla is characterized by dismissive mockery", "childish cruelty. outwardly, she expresses disbelief", "scorn, laughing at the prophecy", "belittling claudius. internally, she is likely motivated by jealousy or a general lack of empathy, unable to grasp the seriousness of the moment or the potential significance of the prophecy. her unspoken conflict is her selfish desire for attention", "her inability to understand or respect the solemnity of the situation.", "livilla is characterized by dismissive mockery and childish cruelty. outwardly", "she expresses disbelief and scorn", "laughing at the prophecy and belittling claudius. internally", "she is likely motivated by jealousy or a general lack of empathy", "unable to grasp the seriousness of the moment or the potential significance of the prophecy. her unspoken conflict is her selfish desire for attention and her inability to understand or respect the solemnity of the situation."],
        ap.active_plans = ["Initially, possess the wolf cub as a novelty.", "Express her disbelief and mockery of Domitius's prophecy.", "Belittle Claudius to assert her own perceived superiority."],
        ap.beliefs = ["Claudius is inherently weak and incapable of anything significant.", "Prophecies about Claudius being important are inherently ridiculous.", "Immediate gratification and childish desires are more important than serious matters."],
        ap.goals = ["Short-term: Belittle Claudius and undermine the prophecy in the immediate moment.", "Medium-term: Maintain her position of perceived superiority within the sibling dynamic.", "Ultimate: Continue to disregard and mock Claudius, reinforcing her own self-image and social standing within the family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Castor is observant and curious, initially drawn to the spectacle of the eagles fighting and quick to notice the object they drop. He identifies the object as a wolf cub, showing a keen eye for detail and an innocent fascination with the dramatic event unfolding. He listens attentively to Domitius\'s prophecy, absorbing the seriousness of the moment despite his young age.',
        ap.emotional_state = 'Castor is primarily curious and engaged. Outwardly, he is observant and descriptive, pointing out the details of the eagles\' fight and the wolf cub. Internally, he is likely experiencing a mix of excitement and apprehension, drawn into the drama but also sensing the shift in tone towards something serious and perhaps ominous. His unspoken state is the wonder of a child witnessing a dramatic and unusual event, coupled with a growing awareness of its potential significance.',
        ap.emotional_tags = ["castor is primarily curious", "engaged. outwardly, he is observant", "descriptive, pointing out the details of the eagles' fight", "the wolf cub. internally, he is likely experiencing a mix of excitement", "apprehension, drawn into the drama but also sensing the shift in tone towards something serious", "perhaps ominous. his unspoken state is the wonder of a child witnessing a dramatic", "unusual event, coupled with a growing awareness of its potential significance.", "castor is primarily curious and engaged. outwardly", "he is observant and descriptive", "pointing out the details of the eagles' fight and the wolf cub. internally", "he is likely experiencing a mix of excitement and apprehension", "drawn into the drama but also sensing the shift in tone towards something serious and perhaps ominous. his unspoken state is the wonder of a child witnessing a dramatic and unusual event", "coupled with a growing awareness of its potential significance.", "castor is primarily curious and engaged. outwardly, he is observant and descriptive, pointing out the details of the eagles' fight and the wolf cub. internally, he is likely experiencing a mix of excitement and apprehension, drawn into the drama", "also sensing the shift in tone towards something serious and perhaps ominous. his unspoken state is the wonder of a child witnessing a dramatic and unusual event, coupled with a growing awareness of its potential significance."],
        ap.active_plans = ["Observe and understand the dramatic events unfolding around him.", "Inform others of what he is seeing and discovering.", "Listen to and understand the interpretation of the omen."],
        ap.beliefs = ["Dramatic events in nature can hold significance.", "Adults possess knowledge and understanding of events that children do not.", "Paying attention to details is important to understanding the world."],
        ap.goals = ["Short-term: Understand what is happening with the eagles and the wolf cub.", "Medium-term: Learn from Domitius's interpretation of the omen.", "Ultimate: Expand his understanding of the world and the significance of events within it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Germanicus, initially engaged in playful sibling rivalry, is drawn into the unfolding drama by the sight of fighting eagles. He calls attention to the eagles, directing Postumus to look, demonstrating a desire to share the spectacle. He then witnesses the wolf cub falling and remains present as Domitius interprets the omen, shifting from playful to attentive in response to the gravity of the situation.',
        ap.emotional_state = 'Germanicus transitions from playful to serious. Outwardly, he is initially excited by the eagles and then becomes attentive and somewhat subdued as the omen is interpreted. Internally, he is likely curious and perhaps a little awed by the dramatic shift in atmosphere, sensing the importance of the moment. His unspoken conflict is the shift from carefree play to the sudden weight of adult seriousness and prophetic pronouncements.',
        ap.emotional_tags = ["germanicus transitions from playful to serious. outwardly, he is initially excited by the eagles", "then becomes attentive", "somewhat subdued as the omen is interpreted. internally, he is likely curious", "perhaps a little awed by the dramatic shift in atmosphere, sensing the importance of the moment. his unspoken conflict is the shift from carefree play to the sudden weight of adult seriousness", "prophetic pronouncements.", "germanicus transitions from playful to serious. outwardly", "he is initially excited by the eagles and then becomes attentive and somewhat subdued as the omen is interpreted. internally", "he is likely curious and perhaps a little awed by the dramatic shift in atmosphere", "sensing the importance of the moment. his unspoken conflict is the shift from carefree play to the sudden weight of adult seriousness and prophetic pronouncements."],
        ap.active_plans = ["Share the spectacle of the eagles with his siblings.", "Observe and understand the unfolding dramatic event.", "Listen to and comprehend Domitius's interpretation of the omen."],
        ap.beliefs = ["Shared experiences are valuable and exciting.", "Dramatic events are worth observing and understanding.", "Adult pronouncements, especially from figures like Domitius, are important and should be listened to."],
        ap.goals = ["Short-term: Witness and share the excitement of the eagles fighting.", "Medium-term: Understand the meaning of the omen being revealed.", "Ultimate: Learn about the world and the significance of dramatic events, transitioning from childhood play to understanding more serious matters."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Agrippina, initially focused on her sibling squabble with Germanicus, is drawn into the larger drama by the commotion around the eagles. She points out the fighting eagles to her mother, showing a childlike urgency and seeking her mother\'s attention and explanation. She witnesses the wolf cub falling and is present for Domitius\'s interpretation, shifting her focus from personal grievance to the dramatic omen.',
        ap.emotional_state = 'Agrippina transitions from petulant to concerned and curious. Outwardly, she initially displays dramatic indignation about being teased, but quickly shifts to excited alarm at the sight of the eagles. Internally, she is likely easily distracted and drawn to spectacle, her attention shifting from her personal issues to the more dramatic event. Her unspoken conflict is the rapid shift from self-centered childhood drama to the larger, more mysterious adult world of omens and prophecies.',
        ap.emotional_tags = ["agrippina transitions from petulant to concerned", "curious. outwardly, she initially displays dramatic indignation about being teased, but quickly shifts to excited alarm at the sight of the eagles. internally, she is likely easily distracted", "drawn to spectacle, her attention shifting from her personal issues to the more dramatic event. her unspoken conflict is the rapid shift from self-centered childhood drama to the larger, more mysterious adult world of omens", "prophecies.", "agrippina transitions from petulant to concerned and curious. outwardly", "she initially displays dramatic indignation about being teased", "but quickly shifts to excited alarm at the sight of the eagles. internally", "she is likely easily distracted and drawn to spectacle", "her attention shifting from her personal issues to the more dramatic event. her unspoken conflict is the rapid shift from self-centered childhood drama to the larger", "more mysterious adult world of omens and prophecies.", "agrippina transitions from petulant to concerned and curious. outwardly, she initially displays dramatic indignation about being teased,", "quickly shifts to excited alarm at the sight of the eagles. internally, she is likely easily distracted and drawn to spectacle, her attention shifting from her personal issues to the more dramatic event. her unspoken conflict is the rapid shift from self-centered childhood drama to the larger, more mysterious adult world of omens and prophecies."],
        ap.active_plans = ["Seek her mother's attention and intervention regarding the eagles fighting.", "Observe and understand the unfolding dramatic event.", "Be present and witness the interpretation of the omen."],
        ap.beliefs = ["Mothers are figures to turn to in moments of distress or excitement.", "Dramatic events are worth pointing out and getting attention for.", "Adult explanations are needed to understand unusual occurrences."],
        ap.goals = ["Short-term: Get her mother's attention about the eagles and seek explanation.", "Medium-term: Witness and understand the unfolding drama of the omen.", "Ultimate: Expand her understanding of the world and the role of dramatic events, moving from childhood self-interest to broader awareness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially a background figure, having been looking for shells, but becomes central when the wolf cub falls near him. He is the one to whom the omen is delivered, and he innocently asks to keep the bloodied cub, showing an earnest and perhaps naive acceptance of this unusual gift from the heavens. He stands clutching the cub, unaware of the full weight of the prophecy being laid upon him.',
        ap.emotional_state = 'Claudius is earnest and vulnerable, displaying a gentle and innocent nature. Outwardly, he is quiet and unassuming until he asks to keep the cub, his plea simple and direct. Internally, he is likely a mix of curiosity and perhaps a childlike sense of wonder at receiving the cub. His unspoken state is his unawareness of the prophecy\'s burden and his simple, genuine desire to care for the creature, highlighting the contrast between his innocent perspective and the grand destiny being proclaimed for him.',
        ap.emotional_tags = ["claudius is earnest", "vulnerable, displaying a gentle", "innocent nature. outwardly, he is quiet", "unassuming until he asks to keep the cub, his plea simple", "direct. internally, he is likely a mix of curiosity", "perhaps a childlike sense of wonder at receiving the cub. his unspoken state is his unawareness of the prophecy's burden", "his simple, genuine desire to care for the creature, highlighting the contrast between his innocent perspective", "the grand destiny being proclaimed for him.", "claudius is earnest and vulnerable", "displaying a gentle and innocent nature. outwardly", "he is quiet and unassuming until he asks to keep the cub", "his plea simple and direct. internally", "he is likely a mix of curiosity and perhaps a childlike sense of wonder at receiving the cub. his unspoken state is his unawareness of the prophecy's burden and his simple", "genuine desire to care for the creature", "highlighting the contrast between his innocent perspective and the grand destiny being proclaimed for him."],
        ap.active_plans = ["Care for the wolf cub that has fallen near him.", "Seek permission to keep the cub as a pet.", "Observe the reactions of the adults to the omen and his possession of the cub."],
        ap.beliefs = ["Animals in need should be cared for.", "Asking politely will often lead to getting what he wants.", "The events happening around him, while dramatic, are part of the world he is learning about."],
        ap.goals = ["Short-term: Keep and care for the wolf cub.", "Medium-term: Integrate the wolf cub into his life and understand its significance (as much as a child can).", "Ultimate: Unknowingly begin to fulfill the destiny prophesied for him, starting with the symbolic act of embracing the wounded cub."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Antonia exudes a stern presence, her posture rigid as she delivers a swift reprimand to Livilla, her voice sharp with authority as she punishes her for her disrespectful scoffing. She radiates a palpable tension, embodying the weight of parental duty.',
        ap.emotional_state = 'Antonia\'s surface emotions reflect righteous anger and concern for propriety. Internally, she grapples with frustration over Livilla’s impetuousness and the rapid deterioration of familial respect. There\'s a hidden worry about the implications of the ominous omen on their family’s future.',
        ap.emotional_tags = ["antonia's surface emotions reflect righteous anger", "concern for propriety. internally, she grapples with frustration over livilla\u2019s impetuousness", "the rapid deterioration of familial respect. there's a hidden worry about the implications of the ominous omen on their family\u2019s future.", "antonia's surface emotions reflect righteous anger and concern for propriety. internally", "she grapples with frustration over livilla\u2019s impetuousness and the rapid deterioration of familial respect. there's a hidden worry about the implications of the ominous omen on their family\u2019s future."],
        ap.active_plans = ["To instill discipline in Livilla and reinforce respect for serious matters.", "To protect the younger children from the unsettling implications of the prophecy.", "To ensure her family maintains decorum during the tense situation."],
        ap.beliefs = ["Respect and adherence to familial hierarchies are paramount.", "Children should learn the gravity of omens and prophecies.", "Discipline is necessary for the preservation of family honor."],
        ap.goals = ["Short-term: To punish Livilla for her disrespect.", "Medium-term: To ensure the children understand the seriousness of the omen.", "Ultimate: To maintain familial cohesion and protect her children's futures in a treacherous political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Julia stands poised to diffuse the tense atmosphere among her children, leading them away from conflict. She gestures with a welcoming hand, embodying maternal warmth as she ushers them inside, her elegant demeanor a stark contrast to the chaos around her.',
        ap.emotional_state = 'Julia\'s outward demeanor reflects calm and composure, cloaking her inner anxiety about the implications of the omen. Beneath, she feels a deep-seated worry for her children\'s well-being and the looming shadow of Livia\'s ruthless politics, stoking her protective instincts.',
        ap.emotional_tags = ["julia's outward demeanor reflects calm", "composure, cloaking her inner anxiety about the implications of the omen. beneath, she feels a deep-seated worry for her children's well-being", "the looming shadow of livia's ruthless politics, stoking her protective instincts.", "julia's outward demeanor reflects calm and composure", "cloaking her inner anxiety about the implications of the omen. beneath", "she feels a deep-seated worry for her children's well-being and the looming shadow of livia's ruthless politics", "stoking her protective instincts."],
        ap.active_plans = ["To shield the children from the foreboding atmosphere surrounding the omen.", "To maintain peace and familial affection among the siblings.", "To redirect the focus away from the omen's implications toward a more comforting narrative."],
        ap.beliefs = ["Family unity is crucial amidst the chaos of imperial politics.", "The innocence of childhood should be preserved from the burdens of adult conflicts.", "Superstitions and omens must be handled delicately to avoid unnecessary fear."],
        ap.goals = ["Short-term: To calm the situation and protect the children from emotional turmoil.", "Medium-term: To foster a nurturing family environment despite external threats.", "Ultimate: To secure her children\u2019s futures and maintain their innocence in a treacherous world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Livilla scoffs at the ominous implications surrounding the wolf cub, her demeanor flippant and dismissive as she fails to grasp the gravity of the situation. She stands apart from the other children, embodying youthful insensitivity.',
        ap.emotional_state = 'Her surface emotions exude arrogance and defiance, masking a deeper insecurity about her place within the family. Livilla\'s mocking tone reveals a lack of understanding and a desire for attention, showcasing her immaturity in the face of serious matters.',
        ap.emotional_tags = ["her surface emotions exude arrogance", "defiance, masking a deeper insecurity about her place within the family. livilla's mocking tone reveals a lack of understanding", "a desire for attention, showcasing her immaturity in the face of serious matters.", "her surface emotions exude arrogance and defiance", "masking a deeper insecurity about her place within the family. livilla's mocking tone reveals a lack of understanding and a desire for attention", "showcasing her immaturity in the face of serious matters."],
        ap.active_plans = ["To assert her independence and challenge the authority of adults.", "To provoke a reaction from those around her, seeking validation.", "To distance herself from the implications of the omen as a means of coping."],
        ap.beliefs = ["Childhood should be free from the burdens of adult superstition.", "Mocking serious events is a way to deflect fear and anxiety.", "She is superior to the younger siblings and should not be reprimanded."],
        ap.goals = ["Short-term: To win the attention and approval of her peers through bravado.", "Medium-term: To assert herself among the older children as a leader.", "Ultimate: To navigate her role within the family without being overshadowed by the gravity of the omen."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Castor stands observantly, eyes wide with curiosity as he watches the dramatic events unfold around him, his youthful energy directed towards the commotion of the eagles fighting and the resulting wolf cub. His excitement is palpable.',
        ap.emotional_state = 'His visible enthusiasm and childlike wonder highlight a carefree innocence, yet beneath that, there is a burgeoning awareness of the gravity of the omen. He oscillates between playful excitement and concern for his siblings, embodying youthful duality.',
        ap.emotional_tags = ["his visible enthusiasm", "childlike wonder highlight a carefree innocence, yet beneath that, there is a burgeoning awareness of the gravity of the omen. he oscillates between playful excitement", "concern for his siblings, embodying youthful duality.", "his visible enthusiasm and childlike wonder highlight a carefree innocence", "yet beneath that", "there is a burgeoning awareness of the gravity of the omen. he oscillates between playful excitement and concern for his siblings", "embodying youthful duality."],
        ap.active_plans = ["To engage with his siblings in playful exploration of their environment.", "To learn from the events surrounding the omen and understand its implications.", "To protect his sister Agrippina from distress caused by others."],
        ap.beliefs = ["Curiosity and adventure are paramount to childhood experiences.", "Omen and signs, though serious, can still hold an element of wonder.", "Siblings should look out for each other amidst chaos."],
        ap.goals = ["Short-term: To enjoy the unfolding drama of the eagles and wolf cub.", "Medium-term: To bond with siblings and witness their interactions.", "Ultimate: To understand the dynamics of family and power through observation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Germanicus is animated and boisterous, caught up in the excitement of the eagles fighting, calling attention to their struggle as he encourages the younger children to observe. His playful teasing adds levity to the atmosphere.',
        ap.emotional_state = 'His outward demeanor is exuberant and mischievous, reflecting typical childhood exuberance. Internally, he feels a mix of protective affection for his siblings and a desire to assert his role as the older brother amidst the chaos.',
        ap.emotional_tags = ["his outward demeanor is exuberant", "mischievous, reflecting typical childhood exuberance. internally, he feels a mix of protective affection for his siblings", "a desire to assert his role as the older brother amidst the chaos.", "his outward demeanor is exuberant and mischievous", "reflecting typical childhood exuberance. internally", "he feels a mix of protective affection for his siblings and a desire to assert his role as the older brother amidst the chaos."],
        ap.active_plans = ["To entertain his siblings with tales and observations about the eagles.", "To maintain a playful atmosphere while navigating sibling dynamics.", "To protect Agrippina from feeling upset while still engaging in playful teasing."],
        ap.beliefs = ["Play and adventure are essential to childhood.", "Being a big brother means being both playful and protective.", "The world is filled with mysteries to explore and engage with."],
        ap.goals = ["Short-term: To create a fun atmosphere for his siblings amidst the tension.", "Medium-term: To solidify his role as an older brother who can be both a source of fun and a protector.", "Ultimate: To navigate the complexities of familial relationships while enjoying childhood innocence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands in a fluster, dramatically recounting her grievances about Germanicus and expressing distress over the sand thrown on her. Her posture is animated, exuding the energy of youthful indignation.',
        ap.emotional_state = 'Surface emotions reveal her dramatic flair, but beneath lies genuine frustration and hurt feelings. She seeks validation and comfort as she navigates her relationships with her siblings, revealing the complexities of sibling rivalry.',
        ap.emotional_tags = ["surface emotions reveal her dramatic flair, but beneath lies genuine frustration", "hurt feelings. she seeks validation", "comfort as she navigates her relationships with her siblings, revealing the complexities of sibling rivalry.", "surface emotions reveal her dramatic flair", "but beneath lies genuine frustration and hurt feelings. she seeks validation and comfort as she navigates her relationships with her siblings", "revealing the complexities of sibling rivalry.", "surface emotions reveal her dramatic flair,", "beneath lies genuine frustration and hurt feelings. she seeks validation and comfort as she navigates her relationships with her siblings, revealing the complexities of sibling rivalry."],
        ap.active_plans = ["To seek attention and support from her mother regarding her grievances.", "To express her feelings without fear of reprimand in a dramatic fashion.", "To navigate sibling dynamics while seeking to assert her feelings."],
        ap.beliefs = ["Emotional expression is valid, and grievances should be acknowledged.", "Siblings should respect one another's boundaries, especially when it comes to teasing.", "Being heard is a fundamental part of familial relationships."],
        ap.goals = ["Short-term: To receive comfort from her mother regarding her current distress.", "Medium-term: To ensure her feelings are taken seriously and addressed by her family.", "Ultimate: To establish her place in the sibling hierarchy while maintaining close relationships."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Claudius stands quietly at the side, observing the tumult around him with wide eyes, his earnest demeanor reflecting a mix of innocence and longing to be included. His body language reveals a subtle hope as he interacts with the wolf cub.',
        ap.emotional_state = 'His emotional state is one of innocence and yearning. While he may feel overshadowed by his siblings, his gentle determination to keep the wolf cub reveals a deeper understanding of connection and affection that he clings to amidst familial chaos.',
        ap.emotional_tags = ["his emotional state is one of innocence", "yearning. while he may feel overshadowed by his siblings, his gentle determination to keep the wolf cub reveals a deeper understanding of connection", "affection that he clings to amidst familial chaos.", "his emotional state is one of innocence and yearning. while he may feel overshadowed by his siblings", "his gentle determination to keep the wolf cub reveals a deeper understanding of connection and affection that he clings to amidst familial chaos."],
        ap.active_plans = ["To approach his mother and earnestly plead to keep the wolf cub.", "To seek acceptance and validation from his family.", "To navigate his own aspirations in light of the familial dynamics at play."],
        ap.beliefs = ["Compassion and care for helpless creatures is a noble pursuit.", "He longs for familial affection and acceptance despite his struggles.", "Every voice within the family deserves to be heard, including his."],
        ap.goals = ["Short-term: To convince his mother to allow him to keep the wolf cub.", "Medium-term: To prove his worth and earn a place within his family.", "Ultimate: To find a sense of belonging in a world that often overlooks him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Empress Livia sits regally in a secluded reception room, directly facing Plautius. Her posture is composed yet commanding, her gaze unwavering as she initiates a seemingly casual yet pointed interrogation. She leans forward slightly, using subtle gestures to draw Plautius into her web, creating an intimate yet intensely controlled atmosphere. Her physical presence, though still, exudes power and authority, dominating the space and the interaction.',
        ap.emotional_state = 'On the surface, Livia projects an air of sophisticated curiosity, employing charm and veiled amusement to disarm Plautius and feign an almost conspiratorial camaraderie. However, beneath this veneer lies a core of cold calculation and ruthless determination. She is emotionally detached, viewing Plautius merely as a pawn in her larger game, her internal state driven by a singular focus on information extraction and manipulation, masking her true, strategic intentions with practiced imperial grace.',
        ap.emotional_tags = ["on the surface, livia projects an air of sophisticated curiosity, employing charm", "veiled amusement to disarm plautius", "feign an almost conspiratorial camaraderie. however, beneath this veneer lies a core of cold calculation", "ruthless determination. she is emotionally detached, viewing plautius merely as a pawn in her larger game, her internal state driven by a singular focus on information extraction", "manipulation, masking her true, strategic intentions with practiced imperial grace.", "on the surface", "livia projects an air of sophisticated curiosity", "employing charm and veiled amusement to disarm plautius and feign an almost conspiratorial camaraderie. however", "beneath this veneer lies a core of cold calculation and ruthless determination. she is emotionally detached", "viewing plautius merely as a pawn in her larger game", "her internal state driven by a singular focus on information extraction and manipulation", "masking her true", "strategic intentions with practiced imperial grace."],
        ap.active_plans = ["Uncover the full extent and nature of Plautius's affair with Julia, seeking concrete details and evidence.", "Assess Plautius's character, vulnerabilities, and susceptibility to manipulation to determine his usefulness as an informant.", "Intimidate and subtly threaten Plautius to ensure his compliance and establish her dominance in the interaction."],
        ap.beliefs = ["Information is power, and controlling the flow of information is crucial to maintaining influence and authority.", "People are inherently motivated by self-interest and can be manipulated through appeals to their ambition or fear.", "Maintaining the stability and reputation of her family and the dynasty justifies morally ambiguous actions and ruthless strategies."],
        ap.goals = ["Short-term: To extract a detailed confession from Plautius regarding his affair with Julia.", "Medium-term: To recruit Plautius as a loyal informant who will provide ongoing intelligence about Julia's activities.", "Ultimate: To consolidate her control over the Julio-Claudian dynasty by preemptively managing and suppressing any scandals or threats to her family's power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Plautius is seated across from Livia, visibly nervous and shifting uncomfortably under her intense gaze. He attempts to maintain a polite and agreeable demeanor, initially flattering Livia in a bid to deflect her probing questions. He hesitates in his responses, betraying his unease and the weight of Livia’s scrutiny. As the interrogation progresses, he becomes increasingly compliant, leaning in as Livia gestures, indicating his growing submission and entrapment.',
        ap.emotional_state = 'Plautius initially presents a facade of nervous charm, attempting to appear cooperative and harmless. Internally, he is a maelstrom of conflicting emotions: fear of Livia\'s power and potential wrath clashes with a burgeoning ambition ignited by her veiled promises of advancement. He is acutely aware of the precariousness of his situation, caught between the allure of imperial favor and the danger of betraying Julia and Lucius. His surface politeness thinly veils a growing sense of dread and opportunistic calculation.',
        ap.emotional_tags = ["plautius initially presents a facade of nervous charm, attempting to appear cooperative", "harmless. internally, he is a maelstrom of conflicting emotions: fear of livia's power", "potential wrath clashes with a burgeoning ambition ignited by her veiled promises of advancement. he is acutely aware of the precariousness of his situation, caught between the allure of imperial favor", "the danger of betraying julia", "lucius. his surface politeness thinly veils a growing sense of dread", "opportunistic calculation.", "plautius initially presents a facade of nervous charm", "attempting to appear cooperative and harmless. internally", "he is a maelstrom of conflicting emotions: fear of livia's power and potential wrath clashes with a burgeoning ambition ignited by her veiled promises of advancement. he is acutely aware of the precariousness of his situation", "caught between the allure of imperial favor and the danger of betraying julia and lucius. his surface politeness thinly veils a growing sense of dread and opportunistic calculation."],
        ap.active_plans = ["Initially, to deflect Livia's questions and minimize his involvement with Julia, hoping to escape the interrogation unscathed.", "To gauge Livia's true intentions and understand what she expects from him, carefully listening for clues and shifts in her demeanor.", "Ultimately, to align himself with Livia's demands, calculating that cooperation, however treacherous, offers the best path to personal gain and survival."],
        ap.beliefs = ["Powerful figures like Livia hold immense sway over one's fate, and their favor is essential for advancement in Roman society.", "Personal ambition and self-preservation should take precedence over loyalty or moral considerations in the treacherous world of Roman politics.", "Flattery and compliance are effective tools for navigating dangerous social situations and manipulating those in power."],
        ap.goals = ["Short-term: To survive Livia's interrogation without incurring her displeasure or revealing too much incriminating information.", "Medium-term: To leverage this encounter with Livia to his advantage, potentially securing her patronage and advancing his career.", "Ultimate: To climb the social ladder and achieve a position of influence and wealth within Roman society, possibly through exploiting his connection to the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Livia sits poised and regal, her presence commanding the room as she leans slightly forward, her gaze piercing through Plautius. Her fingers delicately tap on the table, a calculated gesture that conveys both authority and control. She maintains an air of composure while subtly orchestrating the conversation, her posture relaxed yet predatory.',
        ap.emotional_state = 'Livia exudes a calm confidence, her surface emotions masked by an inscrutable smile. Internally, she grapples with a fierce determination to manipulate the situation to her advantage, revealing a complex interplay of amusement and disdain towards Plautius. Her motivations intertwine ambition and maternal protectiveness as she seeks to maintain control over her family\'s narrative.',
        ap.emotional_tags = ["livia exudes a calm confidence, her surface emotions masked by an inscrutable smile. internally, she grapples with a fierce determination to manipulate the situation to her advantage, revealing a complex interplay of amusement", "disdain towards plautius. her motivations intertwine ambition", "maternal protectiveness as she seeks to maintain control over her family's narrative.", "livia exudes a calm confidence", "her surface emotions masked by an inscrutable smile. internally", "she grapples with a fierce determination to manipulate the situation to her advantage", "revealing a complex interplay of amusement and disdain towards plautius. her motivations intertwine ambition and maternal protectiveness as she seeks to maintain control over her family's narrative."],
        ap.active_plans = ["To extract information regarding Julia's activities and relationships from Plautius.", "To manipulate Plautius into becoming a willing accomplice in her schemes.", "To use her influence to reestablish control over Julia's actions and ensure her family's legacy remains untainted."],
        ap.beliefs = ["Power is best wielded through manipulation and strategic alliances.", "Family loyalty is paramount, but can be exploited for personal gain.", "Age does not diminish one's ability to attract and control others."],
        ap.goals = ["Short-term: To gather intelligence on Julia's indiscretions.", "Medium-term: To manipulate Plautius into a position where he assists her rather than threatens her.", "Ultimate: To secure her family's power and legacy within the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Plautius sits nervously across from Livia, his posture tense and shoulders slightly hunched. He fidgets with his hands and avoids direct eye contact, conveying his discomfort and anxiety. As Livia beckons him closer, he hesitates before complying, revealing his reluctance yet underlying desire to please the Empress.',
        ap.emotional_state = 'Plautius displays overt nervousness, his tone shaky and hesitantly conciliatory. Beneath the surface, however, he is grappling with conflicting emotions: the thrill of attention from Livia juxtaposed with fear of her power. His internal turmoil reveals a deep-seated desire for advancement, tempered by an awareness of the dangerous game he is playing.',
        ap.emotional_tags = ["plautius displays overt nervousness, his tone shaky", "hesitantly conciliatory. beneath the surface, however, he is grappling with conflicting emotions: the thrill of attention from livia juxtaposed with fear of her power. his internal turmoil reveals a deep-seated desire for advancement, tempered by an awareness of the dangerous game he is playing.", "plautius displays overt nervousness", "his tone shaky and hesitantly conciliatory. beneath the surface", "however", "he is grappling with conflicting emotions: the thrill of attention from livia juxtaposed with fear of her power. his internal turmoil reveals a deep-seated desire for advancement", "tempered by an awareness of the dangerous game he is playing."],
        ap.active_plans = ["To navigate the conversation carefully, balancing honesty with self-preservation.", "To seek Livia's favor and influence to secure his own future.", "To maintain his friendship with Lucius while managing Livia\u2019s expectations."],
        ap.beliefs = ["Opportunism is essential for survival in the treacherous political landscape.", "Flattery and compliance can lead to advancement despite the risks involved.", "Maintaining friendships is important, but loyalty must be adaptable."],
        ap.goals = ["Short-term: To appease Livia and deflect her inquiries about Julia.", "Medium-term: To leverage his relationship with Julia to gain favor from Livia.", "Ultimate: To secure a more influential position within the imperial court."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bust_of_gaius_event_5_1'})
    ON CREATE SET
        oi.description = 'The bust of Gaius is prominently positioned in Augustus\'s office, serving as a silent yet potent symbol throughout the scene. Augustus initially directs Praxis\'s attention to it, highlighting Gaius\'s \'beautiful face\' and \'noble brow\' and lamenting his \'tragic loss for Rome.\' The bust functions as a visual reminder of Augustus\'s deceased adopted son and heir, underscoring the theme of dynastic succession and the Emperor\'s anxieties about the future of Rome. It visually reinforces Augustus\'s subsequent chastisement of the Knights for failing to produce heirs, implicitly contrasting their barrenness with the lost promise of Gaius\'s lineage. The bust remains static, observing the unfolding drama as a marble embodiment of Augustus\'s grief and imperial expectations.',
        oi.status_before = 'Newly delivered to Augustus\'s office, presumably recently crafted and in pristine condition, positioned as a focal point within the room.',
        oi.status_after = 'The bust remains in Augustus\'s office, its physical state unchanged. However, its symbolic weight within the narrative is amplified, having served as a key prop in Augustus\'s confrontation with the Knights, further solidifying its representation of dynastic anxiety and imperial legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bust_of_gaius'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Augustus, though showing signs of weariness in his posture, stands with imperial authority in his office, initially examining the bust of Gaius with Praxis. He then turns his attention to the assembled Knights, beckoning Claudius forward and physically presenting him to the group as a symbol of Roman posterity. He addresses the Knights with a commanding voice, gesturing emphatically as he rebukes their bachelorhood.',
        ap.emotional_state = 'Beneath a veneer of imperial command, Augustus is deeply troubled and impatient. He expresses outward frustration and anger towards the Knights for their resistance to his laws, using harsh and demeaning language. Internally, he is burdened by grief for Gaius and anxiety about the future of Rome, feeling a paternalistic responsibility to ensure its continuation. There\'s a tension between his public role as an unyielding emperor and his private grief and worry.',
        ap.emotional_tags = ["beneath a veneer of imperial command, augustus is deeply troubled", "impatient. he expresses outward frustration", "anger towards the knights for their resistance to his laws, using harsh", "demeaning language. internally, he is burdened by grief for gaius", "anxiety about the future of rome, feeling a paternalistic responsibility to ensure its continuation. there's a tension between his public role as an unyielding emperor", "his private grief", "worry.", "beneath a veneer of imperial command", "augustus is deeply troubled and impatient. he expresses outward frustration and anger towards the knights for their resistance to his laws", "using harsh and demeaning language. internally", "he is burdened by grief for gaius and anxiety about the future of rome", "feeling a paternalistic responsibility to ensure its continuation. there's a tension between his public role as an unyielding emperor and his private grief and worry."],
        ap.active_plans = ["To forcefully address the Noble Order of Knights and compel them to adhere to his marriage laws.", "To use Claudius as a visual and rhetorical tool to shame the Knights into marrying and producing heirs for Rome.", "To swiftly dismiss the Knights and transition to other pressing matters, such as discussions about dynastic marriages with Livia, while avoiding the painful topic of Tiberius."],
        ap.beliefs = ["Marriage and procreation are fundamental duties of Roman citizens, especially the elite, to ensure Rome's future.", "The complaints of the bachelor Knights are frivolous and self-serving, indicative of a decline in Roman virtue and duty.", "As Emperor, it is his responsibility to enforce laws that guide and correct Roman society, even if they are unpopular."],
        ap.goals = ["{type: short-term, description: To immediately silence the complaints of the Noble Order of Knights and assert his imperial authority on the matter of marriage laws.}", "{type: medium-term, description: To increase the marriage rate among Roman elites, thereby boosting the Roman population and securing future generations of Roman citizens and soldiers.}", "{type: ultimate, description: To safeguard the long-term stability and prosperity of Rome by ensuring a healthy population and a continuation of Roman traditions and values, securing his legacy as a wise and effective ruler.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Praxis enters Augustus\'s office with a formal bow, announcing the arrival of the representatives from the Noble Order of Knights. He speaks respectfully to Augustus, acknowledging the bust of Gaius and its significance. After delivering his message and receiving Augustus\'s instructions, Praxis promptly exits the office, maintaining a deferential posture throughout his brief presence.',
        ap.emotional_state = 'Praxis maintains a composed and professional demeanor, exhibiting respect and deference towards Augustus. He is outwardly calm and focused on executing his duties efficiently. Internally, Praxis likely experiences a degree of formality and awareness of the imperial court\'s protocol, understanding the gravity of his role as an intermediary for the Emperor. There is a sense of dutiful service without overt emotional expression.',
        ap.emotional_tags = ["praxis maintains a composed", "professional demeanor, exhibiting respect", "deference towards augustus. he is outwardly calm", "focused on executing his duties efficiently. internally, praxis likely experiences a degree of formality", "awareness of the imperial court's protocol, understanding the gravity of his role as an intermediary for the emperor. there is a sense of dutiful service without overt emotional expression.", "praxis maintains a composed and professional demeanor", "exhibiting respect and deference towards augustus. he is outwardly calm and focused on executing his duties efficiently. internally", "praxis likely experiences a degree of formality and awareness of the imperial court's protocol", "understanding the gravity of his role as an intermediary for the emperor. there is a sense of dutiful service without overt emotional expression."],
        ap.active_plans = ["To inform Augustus of the Knights' arrival in a timely and respectful manner.", "To accurately convey Augustus's instructions and intentions to the Knights or other court members as needed.", "To maintain proper courtly etiquette and ensure the smooth flow of imperial proceedings within Augustus's office."],
        ap.beliefs = ["Serving Caesar Augustus is his primary duty and responsibility.", "Maintaining order and protocol within the imperial court is essential for its functioning.", "Respect and obedience are due to the Emperor and other figures of authority within the Roman hierarchy."],
        ap.goals = ["{type: short-term, description: To successfully and promptly deliver the message about the Knights' arrival and fulfill any immediate tasks assigned by Augustus.}", "{type: medium-term, description: To continue performing his duties reliably and efficiently, maintaining his position and trust within Augustus's household.}", "{type: ultimate, description: To serve the Roman Empire through loyal service to its Emperor, contributing to the smooth operation of the imperial court and the execution of Augustus's will.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is abruptly summoned by Augustus and awkwardly approaches him, exhibiting physical nervousness through twitching and stammering. He is then thrust forward to face the Noble Order of Knights, standing uncomfortably as Augustus uses him as an example. Claudius attempts to respond to Augustus but is quickly dismissed, shuffling away with visible relief at being released from the Emperor\'s attention.',
        ap.emotional_state = 'Claudius is profoundly uncomfortable and anxious in Augustus\'s presence, displaying surface nervousness through his physical tics and stammering. He feels exposed and vulnerable being used as a public spectacle before the Knights. Internally, he is likely experiencing a mix of fear, embarrassment, and a deep-seated insecurity about his perceived inadequacies. His relief at being dismissed, even by Livia\'s scorn, suggests a desire to escape the scrutiny and judgment of the imperial court.',
        ap.emotional_tags = ["claudius is profoundly uncomfortable", "anxious in augustus's presence, displaying surface nervousness through his physical tics", "stammering. he feels exposed", "vulnerable being used as a public spectacle before the knights. internally, he is likely experiencing a mix of fear, embarrassment,", "a deep-seated insecurity about his perceived inadequacies. his relief at being dismissed, even by livia's scorn, suggests a desire to escape the scrutiny", "judgment of the imperial court.", "claudius is profoundly uncomfortable and anxious in augustus's presence", "displaying surface nervousness through his physical tics and stammering. he feels exposed and vulnerable being used as a public spectacle before the knights. internally", "he is likely experiencing a mix of fear", "embarrassment", "and a deep-seated insecurity about his perceived inadequacies. his relief at being dismissed", "even by livia's scorn", "suggests a desire to escape the scrutiny and judgment of the imperial court."],
        ap.active_plans = ["To obey Augustus's summons without question, despite his discomfort and apprehension.", "To endure the Emperor's unexpected use of him as an example, attempting to remain as inconspicuous as possible.", "To escape the uncomfortable situation and return to his own pursuits, seeking refuge from the public eye and imperial demands."],
        ap.beliefs = ["He is an awkward and inadequate member of the imperial family, constantly subjected to ridicule and dismissal.", "Obedience to Augustus and other senior family members is mandatory, regardless of personal discomfort or humiliation.", "He is primarily seen as a figure of amusement or embarrassment by those around him, rather than someone of value or respect."],
        ap.goals = ["{type: short-term, description: To minimize negative attention from Augustus and the Knights during this unexpected public display and avoid further reprimand.}", "{type: medium-term, description: To return to his scholarly pursuits and maintain a low profile, avoiding situations that draw unwanted attention to his perceived flaws.}", "{type: ultimate, description: To find a place of quiet acceptance and purpose within the imperial family, perhaps through his scholarship, despite the constant challenges posed by his physical and social awkwardness.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livia enters Augustus\'s office with an air of authority, her sharp gaze immediately locking onto Claudius. She dismisses him with disdain, her posture rigid and imperious, embodying contempt as she confronts his presence.',
        ap.emotional_state = 'Livia\'s surface emotions reflect scorn and impatience; her tone drips with condescension as she critiques Claudius. Internally, she harbors a deep-seated prejudice against perceived weakness, revealing an unwavering conviction that those like Claudius are unworthy of existence within the imperial family.',
        ap.emotional_tags = ["livia's surface emotions reflect scorn", "impatience; her tone drips with condescension as she critiques claudius. internally, she harbors a deep-seated prejudice against perceived weakness, revealing an unwavering conviction that those like claudius are unworthy of existence within the imperial family.", "livia's surface emotions reflect scorn and impatience; her tone drips with condescension as she critiques claudius. internally", "she harbors a deep-seated prejudice against perceived weakness", "revealing an unwavering conviction that those like claudius are unworthy of existence within the imperial family.", "livia's surface emotions reflect scorn and impatience", "her tone drips with condescension as she critiques claudius. internally, she harbors a deep-seated prejudice against perceived weakness, revealing an unwavering conviction that those like claudius are unworthy of existence within the imperial family."],
        ap.active_plans = ["Reinforce her dominance over the family dynamic by asserting disdain for Claudius.", "Persuade Augustus to focus on strategic matters such as marriage arrangements for their children, positioning herself as a key architect of the family's legacy.", "Diminish Claudius's standing to further isolate him within the family hierarchy."],
        ap.beliefs = ["Weakness is intolerable, and those who embody it, like Claudius, should be dismissed.", "Family honor is paramount, and it must be preserved through strategic marriages and control over perceived threats.", "Her son's potential for power is contingent upon removing obstacles, including those she sees as inferior, like Claudius."],
        ap.goals = ["Short-term: Assert her control over Augustus to influence marriage decisions favorably.", "Medium-term: Ensure Tiberius returns to Rome, thus solidifying her family's power.", "Ultimate: Eliminate any challenges to her family's dominance, particularly from Claudius and others she deems weak."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands awkwardly in Augustus\'s office, physically hunched and twitching as he interacts with Augustus. Upon Livia\'s entrance, he instinctively shrinks back, expressing his relief as he shuffles away from her contemptuous gaze.',
        ap.emotional_state = 'On the surface, Claudius displays anxiety and timidity, his stammer revealing his discomfort. Internally, he grapples with feelings of inadequacy and the sting of rejection, sensing Livia\'s disdain as a painful reminder of his marginalized position within the imperial family.',
        ap.emotional_tags = ["on the surface, claudius displays anxiety", "timidity, his stammer revealing his discomfort. internally, he grapples with feelings of inadequacy", "the sting of rejection, sensing livia's disdain as a painful reminder of his marginalized position within the imperial family.", "on the surface", "claudius displays anxiety and timidity", "his stammer revealing his discomfort. internally", "he grapples with feelings of inadequacy and the sting of rejection", "sensing livia's disdain as a painful reminder of his marginalized position within the imperial family."],
        ap.active_plans = ["Seek approval from Augustus, hoping to prove his worth despite Livia's scorn.", "Avoid confrontation with Livia, prioritizing his safety and emotional well-being over familial connection.", "Continue to learn and grow, desiring acceptance within the imperial family despite the obstacles."],
        ap.beliefs = ["His worth is constantly questioned due to his physical and social awkwardness.", "Acceptance by Augustus and the family is essential for his sense of self-worth.", "Livia's scorn represents a broader societal prejudice against those deemed flawed or weak."],
        ap.goals = ["Short-term: Escape Livia's criticism and avoid further humiliation.", "Medium-term: Establish himself as a competent member of the family by learning and engaging in imperial matters.", "Ultimate: Find a place of belonging and respect within the imperial family despite the challenges he faces."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his office, presenting a commanding presence, yet there is a weariness to his demeanor. He engages with Claudius before Livia\'s entrance, showcasing a mixture of paternalistic concern and frustration as he addresses the Knights.',
        ap.emotional_state = 'Augustus conveys a mix of weariness and authority; his tone oscillates between commanding and exasperated. Internally, he feels the weight of familial duty and the pain of loss, particularly concerning Gaius, which colors his interactions with both Claudius and Livia.',
        ap.emotional_tags = ["augustus conveys a mix of weariness", "authority; his tone oscillates between commanding", "exasperated. internally, he feels the weight of familial duty", "the pain of loss, particularly concerning gaius, which colors his interactions with both claudius", "livia.", "augustus conveys a mix of weariness and authority; his tone oscillates between commanding and exasperated. internally", "he feels the weight of familial duty and the pain of loss", "particularly concerning gaius", "which colors his interactions with both claudius and livia.", "augustus conveys a mix of weariness and authority", "his tone oscillates between commanding and exasperated. internally, he feels the weight of familial duty and the pain of loss, particularly concerning gaius, which colors his interactions with both claudius and livia."],
        ap.active_plans = ["Address the Knights regarding marriage laws, reinforcing his authority as Emperor.", "Manage Livia's expectations and assert control over family matters to maintain stability within the household.", "Protect Claudius from Livia's harsh judgment, attempting to shield him from the worst of her scorn."],
        ap.beliefs = ["The stability of Rome is contingent upon strong familial unions, thus marriage laws must be upheld.", "Though flawed, every family member has a role to play, including Claudius, who should be kept out of harm's way.", "Livia's overreach and ambition must be tempered for the good of the family and the empire."],
        ap.goals = ["Short-term: Successfully address the Noble Order of Knights to quell their complaints about marriage laws.", "Medium-term: Navigate the complexities of family dynamics, particularly Livia's ambitions, while maintaining authority.", "Ultimate: Secure a stable legacy for Rome through strategic marriages and strong leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Livia enters Augustus\'s office with a purposeful stride, her attention immediately drawn to Claudius, whom she dismisses with sharp disdain. She then smoothly redirects her focus to Augustus, engaging him in a seemingly casual conversation about family matters, subtly maneuvering him towards her strategic objectives. Her physical presence is commanding yet graceful, each movement calculated to exert influence.',
        ap.emotional_state = 'Livia outwardly projects an air of calm control and imperial poise, masking her ruthlessly ambitious nature. Beneath the surface, she is intensely focused and manipulative, driven by a burning desire to reinstate Tiberius and solidify her family\'s power. Her disdain for Claudius is openly expressed, revealing her intolerance for weakness. While appearing to engage in a general discussion, her underlying emotional drive is to subtly advance her agenda concerning Tiberius.',
        ap.emotional_tags = ["livia outwardly projects an air of calm control", "imperial poise, masking her ruthlessly ambitious nature. beneath the surface, she is intensely focused", "manipulative, driven by a burning desire to reinstate tiberius", "solidify her family's power. her disdain for claudius is openly expressed, revealing her intolerance for weakness. while appearing to engage in a general discussion, her underlying emotional drive is to subtly advance her agenda concerning tiberius.", "livia outwardly projects an air of calm control and imperial poise", "masking her ruthlessly ambitious nature. beneath the surface", "she is intensely focused and manipulative", "driven by a burning desire to reinstate tiberius and solidify her family's power. her disdain for claudius is openly expressed", "revealing her intolerance for weakness. while appearing to engage in a general discussion", "her underlying emotional drive is to subtly advance her agenda concerning tiberius."],
        ap.active_plans = ["Dismiss Claudius from Augustus's presence to ensure a private and focused conversation with the Emperor.", "Propose strategic marriages within the imperial family to consolidate power and maintain dynastic stability, suggesting betrothals for Agrippina/Germanicus and Castor/Livilla.", "Introduce the idea of Tiberius's return to Rome in a seemingly innocuous manner, framing it as a harmless return of a 'private citizen' to subtly test Augustus's resistance and plant the seed of his eventual reinstatement."],
        ap.beliefs = ["Strategic marriages are essential tools for political leverage and securing the future of the dynasty.", "Tiberius, despite his past exile, is vital to the strength of the Julio-Claudian family and deserves to be back in Rome.", "Individuals perceived as weak or ineffective, like Claudius, are liabilities and should be marginalized or removed from positions of influence."],
        ap.goals = ["short_term\": \"Secure Augustus's agreement to the proposed betrothals to strengthen the family's alliances and control.", "medium_term\": \"Persuade Augustus to consider Tiberius's return from exile as a practical and acceptable option, gradually softening his opposition.", "ultimate\": \"Orchestrate Tiberius's full reinstatement into Roman society and ultimately position him to inherit or significantly influence imperial power, ensuring the dominance of her lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Augustus, initially preoccupied with the bust of Gaius, is drawn into a conversation with Livia. He stands wearily in his office, his physical presence still commanding but showing signs of age and fatigue. He gestures dismissively towards Claudius and the Knights, indicating his impatience with their presence and concerns. His movements are less energetic, reflecting his weariness.',
        ap.emotional_state = 'Augustus displays a complex emotional state, marked by weariness and a lingering grief for Gaius, symbolized by the bust. He is easily irritated by perceived trivialities, such as the Knights\' complaints and Claudius\'s stammer, indicating a short temper and declining patience. Beneath his authoritarian exterior, there\'s a hint of vulnerability and a deep-seated pain regarding Tiberius and Julia, making him resistant to discussing past family conflicts. He is emotionally closed off and weary of familial dramas, yet duty-bound to address them.',
        ap.emotional_tags = ["augustus displays a complex emotional state, marked by weariness", "a lingering grief for gaius, symbolized by the bust. he is easily irritated by perceived trivialities, such as the knights' complaints", "claudius's stammer, indicating a short temper", "declining patience. beneath his authoritarian exterior, there's a hint of vulnerability", "a deep-seated pain regarding tiberius", "julia, making him resistant to discussing past family conflicts. he is emotionally closed off", "weary of familial dramas, yet duty-bound to address them.", "augustus displays a complex emotional state", "marked by weariness and a lingering grief for gaius", "symbolized by the bust. he is easily irritated by perceived trivialities", "such as the knights' complaints and claudius's stammer", "indicating a short temper and declining patience. beneath his authoritarian exterior", "there's a hint of vulnerability and a deep-seated pain regarding tiberius and julia", "making him resistant to discussing past family conflicts. he is emotionally closed off and weary of familial dramas", "yet duty-bound to address them."],
        ap.active_plans = ["To quickly dismiss the issue of marriage laws with the Noble Order of Knights, using Claudius as a prop to shame them into compliance and end the audience swiftly.", "Avoid engaging with Livia on the topic of Tiberius, attempting to shut down any discussion about his exiled son and maintain his firm stance against Tiberius's return.", "Delegate the practical arrangements of family marriages to Livia, such as finding a suitable match for Claudius, showing a desire to offload these familial responsibilities and focus on broader imperial matters."],
        ap.beliefs = ["Roman citizens have a duty to marry and procreate to ensure the strength and continuity of Rome.", "Tiberius's past actions, particularly concerning Julia, are unforgivable and warrant his continued exile.", "While family matters are important for dynastic stability, they are often tiresome and best handled by Livia, allowing him to concentrate on larger imperial concerns."],
        ap.goals = ["short_term\": \"End the uncomfortable audience with the Knights and dismiss Claudius to regain a semblance of peace and order in his office.", "medium_term\": \"Maintain his firm stance against Tiberius's return from exile, reinforcing his authority and resisting Livia's persistent influence on this matter.", "ultimate\": \"Secure the future of Rome and the Julio-Claudian dynasty, albeit while increasingly weary and emotionally detached, relying on Livia to manage the intricate web of familial and political marriages while he focuses on the broader, fading grandeur of his empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Augustus, though weary and commanding, engages with Claudius and addresses the representatives of the Noble Order of Knights. He oscillates between frustration and authority, gesturing vaguely as he berates the knights for their complaints about marriage laws while attempting to emphasize the importance of procreation in Rome.',
        ap.emotional_state = 'Augustus appears weary yet resolute, projecting frustration and paternal authority. His emotional armor, however, cracks slightly under the weight of past grievances, particularly regarding Tiberius, revealing the lingering pain of loss and familial discord.',
        ap.emotional_tags = ["augustus appears weary yet resolute, projecting frustration", "paternal authority. his emotional armor, however, cracks slightly under the weight of past grievances, particularly regarding tiberius, revealing the lingering pain of loss", "familial discord.", "augustus appears weary yet resolute", "projecting frustration and paternal authority. his emotional armor", "however", "cracks slightly under the weight of past grievances", "particularly regarding tiberius", "revealing the lingering pain of loss and familial discord."],
        ap.active_plans = ["Firmly shut down any discussion regarding Tiberius's return to Rome, reinforcing his stance with emotional weight.", "Address and reprimand the knights about their complaints regarding his marriage laws, emphasizing the need for procreation.", "Seek to arrange marriages among the younger generation, indicating a strong reliance on Livia\u2019s political acumen."],
        ap.beliefs = ["Strongly believes in the importance of traditional family values and procreation to secure Rome's future.", "Views Tiberius's actions and past as irredeemable, reinforcing his decision to keep him in exile.", "Maintains that personal grievances should not undermine the broader goals of the empire."],
        ap.goals = ["Short-term: Manage the marriage laws and address the complaints from the knights.", "Medium-term: Establish marital arrangements for younger family members to strengthen alliances.", "Ultimate: Preserve the integrity and legacy of the Julio-Claudian dynasty amid personal and familial turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Livia enters the scene with a dismissive demeanor, immediately focusing on Claudius with disdain and expressing her desire to speak with Augustus about Tiberius. Her posture is confident, and her words are laced with condescension as she critiques Claudius\'s presence and advocates for Tiberius\'s return.',
        ap.emotional_state = 'Livia expresses annoyance and impatience, particularly regarding Claudius’s presence and perceived weaknesses. Beneath her cold exterior, however, lies a fierce determination for her son Tiberius\'s reintegration into Rome, driven by maternal loyalty and political strategy.',
        ap.emotional_tags = ["livia expresses annoyance", "impatience, particularly regarding claudius\u2019s presence", "perceived weaknesses. beneath her cold exterior, however, lies a fierce determination for her son tiberius's reintegration into rome, driven by maternal loyalty", "political strategy.", "livia expresses annoyance and impatience", "particularly regarding claudius\u2019s presence and perceived weaknesses. beneath her cold exterior", "however", "lies a fierce determination for her son tiberius's reintegration into rome", "driven by maternal loyalty and political strategy."],
        ap.active_plans = ["Dismiss Claudius's presence and undermine his worth, reinforcing her perception of him as a liability.", "Persuade Augustus to reconsider Tiberius's return to Rome, framing it as a beneficial move for the family.", "Coordinate marriage arrangements for family members, asserting her control over dynastic decisions."],
        ap.beliefs = ["Believes in the superiority of her lineage and the necessity of preserving it through strategic marriages.", "Views Claudius as an embarrassment, contributing to her disdain for weaknesses within the family.", "Maintains that maternal instincts justify her ambitions for Tiberius, regardless of Augustus's opposition."],
        ap.goals = ["Short-term: Successfully advocate for Tiberius\u2019s return to Rome as a private citizen.", "Medium-term: Secure advantageous marriage arrangements for Agrippina and Germanicus.", "Ultimate: Solidify her family's power, ensuring the survival of her lineage through strategic political maneuvers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Julia, in her opulent yet now suffocating chambers, stands imperiously before Plautius. Her body language radiates a restless energy, pacing slightly as she confronts him, her eyes burning with a mixture of fury and desperation. She is actively questioning Plautius, her voice sharp and demanding, seeking answers for her predicament.',
        ap.emotional_state = 'Julia\'s surface emotion is a potent blend of anger and agitation, her words laced with accusation and hurt. Beneath this outward fury, there\'s a palpable layer of fear and vulnerability. She feels betrayed and abandoned by those she thought were in her orbit.  Internally, she is wrestling with the dawning realization of her precarious position, a conflict between her aristocratic pride and the raw fear of her impending downfall. She is desperate for answers, but also deeply afraid of the truths she might uncover.',
        ap.emotional_tags = ["julia's surface emotion is a potent blend of anger", "agitation, her words laced with accusation", "hurt. beneath this outward fury, there's a palpable layer of fear", "vulnerability. she feels betrayed", "abandoned by those she thought were in her orbit.  internally, she is wrestling with the dawning realization of her precarious position, a conflict between her aristocratic pride", "the raw fear of her impending downfall. she is desperate for answers, but also deeply afraid of the truths she might uncover.", "julia's surface emotion is a potent blend of anger and agitation", "her words laced with accusation and hurt. beneath this outward fury", "there's a palpable layer of fear and vulnerability. she feels betrayed and abandoned by those she thought were in her orbit.  internally", "she is wrestling with the dawning realization of her precarious position", "a conflict between her aristocratic pride and the raw fear of her impending downfall. she is desperate for answers", "but also deeply afraid of the truths she might uncover.", "julia's surface emotion is a potent blend of anger and agitation, her words laced with accusation and hurt. beneath this outward fury, there's a palpable layer of fear and vulnerability. she feels betrayed and abandoned by those she thought were in her orbit.  internally, she is wrestling with the dawning realization of her precarious position, a conflict between her aristocratic pride and the raw fear of her impending downfall. she is desperate for answers,", "also deeply afraid of the truths she might uncover."],
        ap.active_plans = ["Demand an explanation from Plautius regarding his inaction.", "Gauge Plautius's loyalty and assess if he can still be of any use to her.", "Vent her pent-up frustration and rage at a perceived ally who failed her."],
        ap.beliefs = ["Those within her circle owe her loyalty and protection.", "Her aristocratic status should afford her a certain level of immunity and support.", "Plautius, as someone within her sphere of influence, should have intervened to prevent her current crisis."],
        ap.goals = ["Short-term: To extract an admission of guilt or explanation from Plautius.", "Medium-term: To identify who is truly responsible for her downfall and understand the extent of the betrayal.", "Ultimate: To salvage her reputation and power, or at the very least, to understand why she was unable to be saved from this crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Plautius stands in Julia’s lavish chambers, facing her wrathful interrogation. His posture is likely defensive and subservient, possibly shrinking under the intensity of Julia’s gaze. He is listening intently to her accusatory question, his body language suggesting nervousness and a desire to avoid direct confrontation. He may be fidgeting or avoiding eye contact, trying to minimize his presence in the face of Julia’s fury.',
        ap.emotional_state = 'Plautius is primarily experiencing fear and anxiety, acutely aware of Julia\'s volatile emotions and the precariousness of his own position. He is outwardly polite and compliant, attempting to placate Julia’s anger, but internally he is wracked with guilt and self-preservation instincts.  Beneath the surface, he is likely conflicted, possibly feeling a flicker of remorse for his inaction, overshadowed by a stronger fear of implicating himself and incurring the wrath of more powerful figures like Livia. His unspoken conflict is between his self-interest and the potential consequences of Julia\'s displeasure.',
        ap.emotional_tags = ["plautius is primarily experiencing fear", "anxiety, acutely aware of julia's volatile emotions", "the precariousness of his own position. he is outwardly polite", "compliant, attempting to placate julia\u2019s anger, but internally he is wracked with guilt", "self-preservation instincts.  beneath the surface, he is likely conflicted, possibly feeling a flicker of remorse for his inaction, overshadowed by a stronger fear of implicating himself", "incurring the wrath of more powerful figures like livia. his unspoken conflict is between his self-interest", "the potential consequences of julia's displeasure.", "plautius is primarily experiencing fear and anxiety", "acutely aware of julia's volatile emotions and the precariousness of his own position. he is outwardly polite and compliant", "attempting to placate julia\u2019s anger", "but internally he is wracked with guilt and self-preservation instincts.  beneath the surface", "he is likely conflicted", "possibly feeling a flicker of remorse for his inaction", "overshadowed by a stronger fear of implicating himself and incurring the wrath of more powerful figures like livia. his unspoken conflict is between his self-interest and the potential consequences of julia's displeasure.", "plautius is primarily experiencing fear and anxiety, acutely aware of julia's volatile emotions and the precariousness of his own position. he is outwardly polite and compliant, attempting to placate julia\u2019s anger,", "internally he is wracked with guilt and self-preservation instincts.  beneath the surface, he is likely conflicted, possibly feeling a flicker of remorse for his inaction, overshadowed by a stronger fear of implicating himself and incurring the wrath of more powerful figures like livia. his unspoken conflict is between his self-interest and the potential consequences of julia's displeasure."],
        ap.active_plans = ["Deflect Julia's accusations and avoid taking responsibility for her situation.", "Maintain a facade of loyalty and concern to appease Julia's immediate anger.", "Assess the damage and determine how to best navigate the fallout from Julia's scandal to ensure his own survival and continued standing in the court."],
        ap.beliefs = ["Self-preservation is the most crucial priority in the treacherous Roman court.", "Powerful figures like Julia, even in her downfall, are dangerous to antagonize directly.", "Remaining inconspicuous and avoiding blame is the best strategy for navigating political storms."],
        ap.goals = ["Short-term: To survive Julia's interrogation without becoming the target of her anger or blame.", "Medium-term: To distance himself from Julia's scandal as much as possible to protect his own reputation and position.", "Ultimate: To continue to thrive in the court by aligning himself with those in power and avoiding any association with fallen figures."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_event_7_4'})
    ON CREATE SET
        oi.description = 'The figs are present as a tangible symbol of Julia\'s self-indulgence and immediate gratification. Julia is actively eating them, using them as a source of comfort or pleasure, despite Antonia\'s implied disapproval of her dietary habits. The figs become a focal point of minor contention between Julia and Antonia, representing their differing views on discipline and excess. Antonia\'s reprimand concerning the figs underscores her role as a moral compass, contrasting with Julia\'s more hedonistic approach to life.',
        oi.status_before = 'The figs are available in Julia\'s chambers, presumably fresh and ripe, signifying her access to luxury and indulgence as part of her daily life. They are simply present as a readily available snack.',
        oi.status_after = 'The figs remain in Julia\'s chambers, uneaten but now charged with a new layer of meaning. They are no longer just a snack but have become a symbol of Julia\'s perceived lack of self-control and a point of mild conflict with Antonia, highlighting the ongoing tension regarding Julia\'s behavior and image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs'})
    MATCH (e:Event {uuid: 'event_7_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Julia sits amidst the opulent disarray of her chambers, surrounded by expensive fabrics and discarded finery, expressing both boredom and disdain. As she recounts her dismissive interaction with her father\'s physician, she gestures animatedly, reflecting her self-indulgent nature.',
        ap.emotional_state = 'Julia\'s surface emotions are marked by sarcasm and impatience, as she mocks the physician\'s advice. Beneath this facade, she grapples with feelings of restlessness and dissatisfaction, revealing a yearning for excitement and a life unbound by restrictions.',
        ap.emotional_tags = ["julia's surface emotions are marked by sarcasm", "impatience, as she mocks the physician's advice. beneath this facade, she grapples with feelings of restlessness", "dissatisfaction, revealing a yearning for excitement", "a life unbound by restrictions.", "julia's surface emotions are marked by sarcasm and impatience", "as she mocks the physician's advice. beneath this facade", "she grapples with feelings of restlessness and dissatisfaction", "revealing a yearning for excitement and a life unbound by restrictions."],
        ap.active_plans = ["To dismiss the physician's advice, showcasing her defiance against authority.", "To seek amusement elsewhere, reflecting her need for excitement and distraction.", "To engage Antonia in conversation, hoping to divert attention from her own dissatisfaction."],
        ap.beliefs = ["Life should be lived in indulgence rather than restraint.", "Her status affords her the luxury of dismissing advice she finds trivial.", "Boredom is to be remedied with amusement and social engagement."],
        ap.goals = ["Short-term: To express her discontent with the physician's advice and seek validation from Antonia.", "Medium-term: To explore new sources of amusement and excitement beyond her current confines.", "Ultimate: To reclaim a sense of agency and excitement in her life, defying the limitations imposed by her familial duties."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Antonia stands nearby, embodying controlled disapproval as she listens to Julia\'s complaints. Her posture is slightly rigid, reflecting her concern for Julia\'s well-being and the propriety expected of their station.',
        ap.emotional_state = 'Antonia\'s surface emotions are marked by a calm demeanor, but beneath lies a sense of concern for Julia’s well-being and choices. She struggles with her role as a moral compass amidst Julia\'s self-indulgence, feeling the tension between familial loyalty and the necessity of restraint.',
        ap.emotional_tags = ["antonia's surface emotions are marked by a calm demeanor, but beneath lies a sense of concern for julia\u2019s well-being", "choices. she struggles with her role as a moral compass amidst julia's self-indulgence, feeling the tension between familial loyalty", "the necessity of restraint.", "antonia's surface emotions are marked by a calm demeanor", "but beneath lies a sense of concern for julia\u2019s well-being and choices. she struggles with her role as a moral compass amidst julia's self-indulgence", "feeling the tension between familial loyalty and the necessity of restraint.", "antonia's surface emotions are marked by a calm demeanor,", "beneath lies a sense of concern for julia\u2019s well-being and choices. she struggles with her role as a moral compass amidst julia's self-indulgence, feeling the tension between familial loyalty and the necessity of restraint."],
        ap.active_plans = ["To provide gentle guidance, attempting to steer Julia towards healthier choices.", "To maintain a sense of propriety and reinforce familial expectations in the face of Julia's indulgences.", "To engage with Julia in conversation, hoping to ease her restlessness with companionship."],
        ap.beliefs = ["Discipline and restraint are virtues essential for maintaining dignity.", "Family loyalty compels her to care for Julia's well-being, despite their differing perspectives.", "Excess in behavior can lead to social and personal downfall, particularly for women of their status."],
        ap.goals = ["Short-term: To express her disapproval of Julia's eating habits while maintaining a supportive presence.", "Medium-term: To encourage Julia to consider healthier lifestyle choices without provoking rebellion.", "Ultimate: To protect Julia's reputation and future, striving to uphold their family's dignity in the eyes of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius enters Julia\'s opulent chambers, gently guiding young Herod Agrippa by the arm. He stands slightly behind Herod, physically manifesting his nervous demeanor. His posture is somewhat hunched, and he stammers noticeably as he attempts to introduce Herod to his Aunt Julia, indicating his discomfort and eagerness to perform well in her presence.',
        ap.emotional_state = 'Claudius is a bundle of nervous anticipation mixed with a flicker of pride. Outwardly, his stammer and hesitant movements betray his anxiety. Inwardly, he hopes to gain favor by presenting someone interesting to Julia and Antonia. He likely feels a sense of responsibility to ensure Herod\'s smooth introduction, while also yearning for a moment of validation and acceptance from his imperial relatives, a common desire for him within this formidable family.',
        ap.emotional_tags = ["claudius is a bundle of nervous anticipation mixed with a flicker of pride. outwardly, his stammer", "hesitant movements betray his anxiety. inwardly, he hopes to gain favor by presenting someone interesting to julia", "antonia. he likely feels a sense of responsibility to ensure herod's smooth introduction, while also yearning for a moment of validation", "acceptance from his imperial relatives, a common desire for him within this formidable family.", "claudius is a bundle of nervous anticipation mixed with a flicker of pride. outwardly", "his stammer and hesitant movements betray his anxiety. inwardly", "he hopes to gain favor by presenting someone interesting to julia and antonia. he likely feels a sense of responsibility to ensure herod's smooth introduction", "while also yearning for a moment of validation and acceptance from his imperial relatives", "a common desire for him within this formidable family.", "claudius is a bundle of nervous anticipation mixed with a flicker of pride. outwardly, his stammer and hesitant movements betray his anxiety. inwardly, he hopes to gain favor by presenting someone interesting to julia and antonia. he likely feels a sense of responsibility to ensure herod's smooth introduction,", "also yearning for a moment of validation and acceptance from his imperial relatives, a common desire for him within this formidable family."],
        ap.active_plans = ["To successfully introduce Herod Agrippa to Julia and Antonia.", "To make a positive impression on Julia by bringing someone of apparent interest.", "To ensure Herod feels welcomed and comfortable in this new environment, reflecting well on Claudius himself."],
        ap.beliefs = ["Presenting well-connected and interesting individuals to his family will increase his standing in their eyes.", "Politeness and proper introductions are crucial for navigating social interactions within the imperial family.", "He should always be respectful and deferential to his elders and superiors, especially Julia and Antonia."],
        ap.goals = ["Short-term: Complete the introduction smoothly and without major social awkwardness.", "Medium-term: Foster a connection between Herod and his family, potentially benefiting from this association.", "Ultimate: Earn greater acceptance and respect within the imperial family, moving beyond his perceived role as the family fool."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Julia is initially reclining amidst the luxurious disarray of her chambers, seemingly bored and preoccupied with her own minor complaints about her physician\'s advice. However, her posture shifts as Claudius enters with Herod. She turns towards them, her eyes widening with a spark of intrigue. She observes Herod with open curiosity, assessing him as a new and potentially diverting presence in her otherwise monotonous day.',
        ap.emotional_state = 'Julia transitions from weary boredom to piqued interest upon Herod\'s arrival. Outwardly, she displays aristocratic politeness and a flirtatious charm as she engages with Herod, her tone shifting from complaining to playfully curious. Inwardly, she is likely craving novelty and distraction from her increasingly restricted and scrutinized life. Herod represents a potential escape from the suffocating routine and the ever-present threat of scandal, offering a glimmer of amusement and perhaps something more.',
        ap.emotional_tags = ["julia transitions from weary boredom to piqued interest upon herod's arrival. outwardly, she displays aristocratic politeness", "a flirtatious charm as she engages with herod, her tone shifting from complaining to playfully curious. inwardly, she is likely craving novelty", "distraction from her increasingly restricted", "scrutinized life. herod represents a potential escape from the suffocating routine", "the ever-present threat of scandal, offering a glimmer of amusement", "perhaps something more.", "julia transitions from weary boredom to piqued interest upon herod's arrival. outwardly", "she displays aristocratic politeness and a flirtatious charm as she engages with herod", "her tone shifting from complaining to playfully curious. inwardly", "she is likely craving novelty and distraction from her increasingly restricted and scrutinized life. herod represents a potential escape from the suffocating routine and the ever-present threat of scandal", "offering a glimmer of amusement and perhaps something more."],
        ap.active_plans = ["To assess Herod as a potential source of amusement and distraction from her boredom.", "To engage Herod in witty conversation and gauge his personality and potential for further interaction.", "To subtly assert her social dominance and aristocratic charm in front of this new, exotic individual."],
        ap.beliefs = ["Her own entertainment and personal gratification are paramount in her current constrained circumstances.", "People of interest, especially those from different backgrounds, can provide temporary relief from her ennui.", "She is entitled to attention and admiration, and her wit and charm are powerful tools to command it."],
        ap.goals = ["Short-term: Enjoy a stimulating conversation with Herod and gauge his potential for future entertainment.", "Medium-term: Cultivate a relationship with Herod if he proves to be sufficiently engaging and diverting.", "Ultimate: Alleviate her boredom and find some measure of personal satisfaction and agency within her gilded cage, potentially through new connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Herod Agrippa is led into Julia\'s chambers by a nervous Claudius. He stands tall and composed, radiating an air of exotic charm and confidence. He immediately addresses Julia with polished Latin and flattery, making direct eye contact and demonstrating a keen awareness of Roman customs and social hierarchies. His posture is open and respectful, yet subtly assertive, indicating his ambition beneath the veneer of politeness.',
        ap.emotional_state = 'Herod presents a facade of polite admiration and respectful deference. Outwardly, he is charming, well-spoken, and seemingly eager to please. Inwardly, he is likely calculating and ambitious, carefully observing Julia and Antonia and strategically deploying flattery to make a positive first impression. He carries a hint of melancholy, revealed in his mention of his father\'s execution, suggesting a depth beneath his polished surface, and a strategic deployment of vulnerability to gain sympathy.',
        ap.emotional_tags = ["herod presents a facade of polite admiration", "respectful deference. outwardly, he is charming, well-spoken,", "seemingly eager to please. inwardly, he is likely calculating", "ambitious, carefully observing julia", "antonia", "strategically deploying flattery to make a positive first impression. he carries a hint of melancholy, revealed in his mention of his father's execution, suggesting a depth beneath his polished surface,", "a strategic deployment of vulnerability to gain sympathy.", "herod presents a facade of polite admiration and respectful deference. outwardly", "he is charming", "well-spoken", "and seemingly eager to please. inwardly", "he is likely calculating and ambitious", "carefully observing julia and antonia and strategically deploying flattery to make a positive first impression. he carries a hint of melancholy", "revealed in his mention of his father's execution", "suggesting a depth beneath his polished surface", "and a strategic deployment of vulnerability to gain sympathy."],
        ap.active_plans = ["To make an excellent first impression on Julia and Antonia, establishing himself as a charming and knowledgeable young man.", "To showcase his understanding of Roman culture and history, demonstrating his suitability for Roman society.", "To subtly ingratiate himself with the imperial family, opening doors for future opportunities and advancement."],
        ap.beliefs = ["Flattery and respect are essential tools for navigating Roman high society and gaining favor with powerful figures.", "Knowledge of Roman history and family lineages is crucial for demonstrating sophistication and earning respect.", "Establishing connections with influential families like the Julio-Claudians is vital for his personal and political advancement."],
        ap.goals = ["Short-term: Be warmly received by Julia and Antonia during this initial encounter.", "Medium-term: Cultivate relationships with members of the imperial family, expanding his social network and influence within Rome.", "Ultimate: Secure a position of influence and power in Rome, potentially leveraging his connections to benefit his own kingdom and future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Julia sits amid the opulent disarray of her chambers, surrounded by expensive fabrics and discarded garments, reflecting both her wealth and emotional turmoil. She engages actively in conversation, gesturing animatedly as she discusses her health and the physician\'s advice.',
        ap.emotional_state = 'Julia displays surface-level irritation and sarcasm regarding her physician\'s comments on her eating habits, masking deeper feelings of vulnerability and frustration with her father’s expectations. Her charm and wit are a facade, concealing her internal struggles with self-image and autonomy.',
        ap.emotional_tags = ["julia displays surface-level irritation", "sarcasm regarding her physician's comments on her eating habits, masking deeper feelings of vulnerability", "frustration with her father\u2019s expectations. her charm", "wit are a facade, concealing her internal struggles with self-image", "autonomy.", "julia displays surface-level irritation and sarcasm regarding her physician's comments on her eating habits", "masking deeper feelings of vulnerability and frustration with her father\u2019s expectations. her charm and wit are a facade", "concealing her internal struggles with self-image and autonomy."],
        ap.active_plans = ["To assert her independence by questioning and challenging the advice given by her father\u2019s physician.", "To engage and impress young Herod Agrippa, perhaps using her charm to forge new connections.", "To maintain a fa\u00e7ade of normalcy and control in her relationships, despite the turmoil in her life."],
        ap.beliefs = ["She believes that her worth is tied to her charm and social standing, which compels her to be entertaining and engaging.", "She feels entitled to enjoy pleasures, including food, as a defiance against the strictures of her family's expectations.", "She holds a deep-seated belief that her personal struggles should not diminish her public persona, leading her to mask her vulnerabilities."],
        ap.goals = ["Short-term: To deflect the physician's criticism and maintain her current lifestyle without guilt.", "Medium-term: To cultivate a new friendship or influence with Herod Agrippa that could serve her interests.", "Ultimate: To reclaim her agency and freedom from the oppressive expectations of her family, particularly Livia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Antonia stands nearby, her posture upright yet relaxed, embodying controlled disapproval. She observes Julia’s antics and Herod\'s entrance with a critical yet diplomatic demeanor, choosing her words carefully as she converses.',
        ap.emotional_state = 'Antonia exhibits a calm exterior, displaying mild disapproval of Julia\'s choices while hiding her concerns about the family\'s reputation. Internally, she feels a protective urge over Julia’s well-being, but she also grapples with the frustration of Julia’s reckless indulgences.',
        ap.emotional_tags = ["antonia exhibits a calm exterior", "displaying mild disapproval of julia's choices while hiding her concerns about the family's reputation. internally", "she feels a protective urge over julia\u2019s well-being", "but she also grapples with the frustration of julia\u2019s reckless indulgences.", "antonia exhibits a calm exterior, displaying mild disapproval of julia's choices", "hiding her concerns about the family's reputation. internally, she feels a protective urge over julia\u2019s well-being, but she also grapples with the frustration of julia\u2019s reckless indulgences.", "antonia exhibits a calm exterior, displaying mild disapproval of julia's choices while hiding her concerns about the family's reputation. internally, she feels a protective urge over julia\u2019s well-being,", "she also grapples with the frustration of julia\u2019s reckless indulgences."],
        ap.active_plans = ["To guide Julia towards healthier choices and a more responsible lifestyle.", "To evaluate Herod\u2019s potential as a beneficial acquaintance for the family and assess his manners.", "To maintain decorum and uphold family honor in front of their guest."],
        ap.beliefs = ["She believes that discipline and propriety are essential virtues for maintaining the family's image.", "She holds a conviction that indulgence can lead to chaos, and thus seeks to curb such behaviors in Julia.", "She feels a strong sense of duty to protect her family\u2019s reputation and navigate the complexities of court life with grace."],
        ap.goals = ["Short-term: To dissuade Julia from overindulgence and encourage her to be more cautious.", "Medium-term: To foster a positive relationship with Herod Agrippa, recognizing his potential influence.", "Ultimate: To preserve the integrity and stability of the family amidst the turbulent political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Herod Agrippa stands confidently yet respectfully in Julia\'s chambers, showcasing polished manners as he engages with the imperial family. He smiles and makes eye contact, demonstrating poise as he introduces himself and navigates the conversation.',
        ap.emotional_state = 'Herod displays a composed demeanor, masking any underlying sadness about his family\'s history with charm and intelligence. He is keenly aware of his surroundings, eager to impress but also burdened by the weight of his lineage’s past.',
        ap.emotional_tags = ["herod displays a composed demeanor, masking any underlying sadness about his family's history with charm", "intelligence. he is keenly aware of his surroundings, eager to impress but also burdened by the weight of his lineage\u2019s past.", "herod displays a composed demeanor", "masking any underlying sadness about his family's history with charm and intelligence. he is keenly aware of his surroundings", "eager to impress but also burdened by the weight of his lineage\u2019s past.", "herod displays a composed demeanor, masking any underlying sadness about his family's history with charm and intelligence. he is keenly aware of his surroundings, eager to impress", "also burdened by the weight of his lineage\u2019s past."],
        ap.active_plans = ["To establish a favorable impression on Julia and Antonia, showcasing his education and manners.", "To ingratiate himself within the Roman elite while subtly revealing his noble lineage.", "To navigate the political landscape of Rome by leveraging relationships with influential figures."],
        ap.beliefs = ["He believes that knowledge and charm are crucial for gaining acceptance in the Roman court.", "He holds that personal connections can help mitigate the shadows of his family's past.", "He feels a deep sense of responsibility to honor his grandfather\u2019s legacy through his actions."],
        ap.goals = ["Short-term: To make a memorable impression on Julia and Antonia during his introductory visit.", "Medium-term: To secure a place within Roman society by aligning himself with well-known families.", "Ultimate: To rise in status and influence, perhaps in hopes of one day shaping the political landscape himself."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Antonia stands composed and observant in Julia\'s opulent chambers, watching the interactions unfold with a measured gaze. Though physically present and engaging in polite conversation with Herod, her attention is primarily fixed on Julia, particularly her sister-in-law\'s self-indulgent snacking. She maintains a reserved posture, embodying Roman restraint amidst Julia\'s excess.',
        ap.emotional_state = 'Antonia projects an air of controlled disapproval, her surface emotions revealing polite interest in Herod but underlying concern and slight exasperation with Julia\'s behavior. Internally, she feels a sense of duty and perhaps frustration, witnessing Julia\'s continued self-indulgence and lack of discipline. There\'s an unspoken conflict between her sense of propriety and Julia\'s defiant disregard for it.',
        ap.emotional_tags = ["antonia projects an air of controlled disapproval, her surface emotions revealing polite interest in herod but underlying concern", "slight exasperation with julia's behavior. internally, she feels a sense of duty", "perhaps frustration, witnessing julia's continued self-indulgence", "lack of discipline. there's an unspoken conflict between her sense of propriety", "julia's defiant disregard for it.", "antonia projects an air of controlled disapproval", "her surface emotions revealing polite interest in herod but underlying concern and slight exasperation with julia's behavior. internally", "she feels a sense of duty and perhaps frustration", "witnessing julia's continued self-indulgence and lack of discipline. there's an unspoken conflict between her sense of propriety and julia's defiant disregard for it.", "antonia projects an air of controlled disapproval, her surface emotions revealing polite interest in herod", "underlying concern and slight exasperation with julia's behavior. internally, she feels a sense of duty and perhaps frustration, witnessing julia's continued self-indulgence and lack of discipline. there's an unspoken conflict between her sense of propriety and julia's defiant disregard for it."],
        ap.active_plans = ["To maintain decorum during Herod's visit.", "To subtly guide Julia away from excessive indulgence, specifically regarding the figs.", "To ensure social niceties are observed, particularly towards their guest Herod."],
        ap.beliefs = ["Self-control and moderation are essential virtues, especially for women of their status.", "Julia's self-indulgence reflects poorly on the family and its reputation.", "Maintaining a semblance of Roman virtue is important even amidst personal failings."],
        ap.goals = ["Short-term: Prevent Julia from eating more figs at this moment.", "Medium-term: Encourage Julia to adopt more disciplined habits for her own good and public image.", "Ultimate: Uphold the family's reputation and moral standing, even while grappling with internal familial chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Julia lounges amidst the luxurious chaos of her chambers, initially bored and dismissive as she complains about her physician\'s advice. However, she perks up with the arrival of Claudius and the intriguing Herod Agrippa, her posture shifting from languid boredom to curious appraisal. She engages Herod with practiced charm, yet quickly becomes defensive when Antonia gently rebukes her for eating figs, retreating back into self-justification.',
        ap.emotional_state = 'Julia outwardly expresses boredom and self-amusement, masking a deeper yearning for distraction and validation. She is superficially charmed by Herod’s flattery, enjoying the novelty of his presence. Beneath the surface, there\'s a defensiveness and a subtle defiance towards Antonia\'s implied criticism, revealing a tension between her desire for pleasure and the unspoken expectations of her status.  She feels misunderstood and perhaps unjustly scrutinized.',
        ap.emotional_tags = ["julia outwardly expresses boredom", "self-amusement, masking a deeper yearning for distraction", "validation. she is superficially charmed by herod\u2019s flattery, enjoying the novelty of his presence. beneath the surface, there's a defensiveness", "a subtle defiance towards antonia's implied criticism, revealing a tension between her desire for pleasure", "the unspoken expectations of her status.  she feels misunderstood", "perhaps unjustly scrutinized.", "julia outwardly expresses boredom and self-amusement", "masking a deeper yearning for distraction and validation. she is superficially charmed by herod\u2019s flattery", "enjoying the novelty of his presence. beneath the surface", "there's a defensiveness and a subtle defiance towards antonia's implied criticism", "revealing a tension between her desire for pleasure and the unspoken expectations of her status.  she feels misunderstood and perhaps unjustly scrutinized."],
        ap.active_plans = ["To seek amusement and distraction from her ennui, finding temporary interest in Herod's arrival.", "To deflect Antonia's disapproval of her eating habits, justifying her indulgence.", "To maintain a semblance of control over her personal pleasures amidst the constraints of her life."],
        ap.beliefs = ["She is entitled to pleasure and indulgence, especially given the restrictions in her life.", "Antonia's criticisms are unwarranted and meddling, stemming from a lack of understanding of her needs.", "External appearances are important, but personal satisfaction is equally valid, even if it means defying expectations."],
        ap.goals = ["Short-term: Continue to enjoy the figs, asserting her right to simple pleasures.", "Medium-term: Find more substantial sources of amusement and distraction to alleviate her boredom and discontent.", "Ultimate: Reclaim a sense of personal agency and freedom, even within the gilded cage of her imperial life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Claudius enters Julia\'s chambers tentatively, leading a somewhat hesitant Herod Agrippa by the arm. He stands awkwardly, stammering as he introduces Herod to Julia and Antonia, eager to facilitate a positive interaction. He positions himself as a helpful intermediary, pleased to be of service and to introduce someone new and interesting to his aunts.',
        ap.emotional_state = 'Claudius is visibly nervous and eager to please, his stammer amplified by his desire to make a good impression. He feels a sense of accomplishment in bringing Herod to meet Julia, hoping to be seen as helpful and socially adept. There\'s an underlying desire for acceptance and recognition from his more esteemed family members, which motivates his eagerness to facilitate social interactions.',
        ap.emotional_tags = ["claudius is visibly nervous", "eager to please, his stammer amplified by his desire to make a good impression. he feels a sense of accomplishment in bringing herod to meet julia, hoping to be seen as helpful", "socially adept. there's an underlying desire for acceptance", "recognition from his more esteemed family members, which motivates his eagerness to facilitate social interactions.", "claudius is visibly nervous and eager to please", "his stammer amplified by his desire to make a good impression. he feels a sense of accomplishment in bringing herod to meet julia", "hoping to be seen as helpful and socially adept. there's an underlying desire for acceptance and recognition from his more esteemed family members", "which motivates his eagerness to facilitate social interactions."],
        ap.active_plans = ["To successfully introduce Herod to Julia and Antonia, ensuring a smooth and polite encounter.", "To be perceived as helpful and useful within the family, gaining approval through his actions.", "To transition smoothly and depart with Herod to continue their introductions to other family members."],
        ap.beliefs = ["Family connections are important, and fostering positive relationships is a valuable endeavor.", "Politeness and proper introductions are crucial for social harmony.", "Being helpful to his family members is a way to gain acceptance and improve his standing."],
        ap.goals = ["Short-term: Execute a successful introduction and depart gracefully with Herod.", "Medium-term: Continue to be a helpful and agreeable family member, strengthening his social bonds.", "Ultimate: Earn genuine acceptance and respect within the imperial family, overcoming his perceived foolishness and awkwardness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Herod Agrippa enters Julia\'s chambers with Claudius, maintaining a composed and polite demeanor. He stands respectfully, engaging Julia and Antonia with eloquent and flattering language, demonstrating his knowledge of Roman customs and family history. He makes direct eye contact and uses graceful gestures, presenting himself as a sophisticated and well-mannered young prince.',
        ap.emotional_state = 'Herod outwardly projects politeness and respect, carefully managing his expressions to appear gracious and well-educated. Internally, he is likely calculating and ambitious, aware of the social and political significance of this encounter. He is determined to make a positive first impression, masking any potential nervousness or personal feelings with a veneer of aristocratic poise and practiced charm.',
        ap.emotional_tags = ["herod outwardly projects politeness", "respect, carefully managing his expressions to appear gracious", "well-educated. internally, he is likely calculating", "ambitious, aware of the social", "political significance of this encounter. he is determined to make a positive first impression, masking any potential nervousness or personal feelings with a veneer of aristocratic poise", "practiced charm.", "herod outwardly projects politeness and respect", "carefully managing his expressions to appear gracious and well-educated. internally", "he is likely calculating and ambitious", "aware of the social and political significance of this encounter. he is determined to make a positive first impression", "masking any potential nervousness or personal feelings with a veneer of aristocratic poise and practiced charm."],
        ap.active_plans = ["To make a favorable impression on Julia and Antonia, establishing himself as a well-mannered and intelligent guest.", "To demonstrate his knowledge of Roman history and customs, showcasing his education and sophistication.", "To secure future opportunities for interaction and advancement within the influential Julio-Claudian family."],
        ap.beliefs = ["Making strong social connections is crucial for advancement in Roman society.", "Politeness, flattery, and respect are effective tools for navigating imperial circles.", "Knowledge and eloquence are valuable assets for gaining favor and influence."],
        ap.goals = ["Short-term: Impress Julia and Antonia and establish a positive initial interaction.", "Medium-term: Cultivate relationships with members of the imperial family, leveraging these connections for future opportunities.", "Ultimate: Advance his position and influence within Rome, potentially securing political or social advantages through his imperial connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Julia sits amidst the opulent disarray of her chambers, surrounded by expensive fabrics and discarded finery that reflect her self-indulgent lifestyle. She engages in conversation with Antonia, her body language a mix of dismissiveness and intrigue, particularly as she evaluates the young Herod. Her movements are fluid yet tinged with a certain entitlement, as she navigates the dialogue with practiced charm.',
        ap.emotional_state = 'Outwardly, Julia presents a facade of nonchalance and humor, brushing off Antonia\'s concerns with sarcasm. Beneath this, however, lies a simmering discontent and a yearning for deeper emotional connections, which she is reluctant to confront. The juxtaposition of her lighthearted banter and the underlying complexity of her relationships creates a tension in her demeanor, revealing a woman seeking validation through fleeting pleasures rather than familial bonds.',
        ap.emotional_tags = ["outwardly, julia presents a facade of nonchalance", "humor, brushing off antonia's concerns with sarcasm. beneath this, however, lies a simmering discontent", "a yearning for deeper emotional connections, which she is reluctant to confront. the juxtaposition of her lighthearted banter", "the underlying complexity of her relationships creates a tension in her demeanor, revealing a woman seeking validation through fleeting pleasures rather than familial bonds.", "outwardly", "julia presents a facade of nonchalance and humor", "brushing off antonia's concerns with sarcasm. beneath this", "however", "lies a simmering discontent and a yearning for deeper emotional connections", "which she is reluctant to confront. the juxtaposition of her lighthearted banter and the underlying complexity of her relationships creates a tension in her demeanor", "revealing a woman seeking validation through fleeting pleasures rather than familial bonds."],
        ap.active_plans = ["To deflect Antonia's concerns regarding her health and lifestyle choices by employing humor and sarcasm.", "To explore her interest in Lucius's 'good-looking friend' rather than acknowledging her emotional needs or responsibilities as a mother.", "To maintain her self-image as a charming, witty figure in her circle, despite her internal struggles."],
        ap.beliefs = ["Pleasure and charm are more valuable than familial responsibility and emotional depth.", "Superficial relationships can provide temporary escape from the harsh realities of her life.", "The power dynamics of her family do not require her to engage deeply with emotional truths."],
        ap.goals = ["Short-term: To dismiss Antonia's concerns and maintain her carefree persona.", "Medium-term: To foster a connection with Lucius's friend, seeking validation and excitement.", "Ultimate: To navigate the treacherous waters of her family's expectations while finding personal fulfillment outside of marriage and motherhood."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Antonia stands nearby, a picture of controlled disapproval, her posture reflecting both concern and restraint. As Julia speaks, Antonia\'s body language is slightly closed, suggesting her unease with the conversation and a desire to maintain propriety in the chaotic environment of Julia\'s chambers.',
        ap.emotional_state = 'Antonia\'s surface demeanor is calm and composed, yet her eyes betray a sense of worry for Julia\'s well-being and their family\'s future. She embodies a quiet strength, struggling with the need to guide Julia while navigating her own disapproval of Julia\'s indulgent lifestyle. The conflict between her maternal instincts and the reality of their situation creates a palpable tension in her emotional state.',
        ap.emotional_tags = ["antonia's surface demeanor is calm", "composed, yet her eyes betray a sense of worry for julia's well-being", "their family's future. she embodies a quiet strength, struggling with the need to guide julia while navigating her own disapproval of julia's indulgent lifestyle. the conflict between her maternal instincts", "the reality of their situation creates a palpable tension in her emotional state.", "antonia's surface demeanor is calm and composed", "yet her eyes betray a sense of worry for julia's well-being and their family's future. she embodies a quiet strength", "struggling with the need to guide julia while navigating her own disapproval of julia's indulgent lifestyle. the conflict between her maternal instincts and the reality of their situation creates a palpable tension in her emotional state.", "antonia's surface demeanor is calm and composed, yet her eyes betray a sense of worry for julia's well-being and their family's future. she embodies a quiet strength, struggling with the need to guide julia", "navigating her own disapproval of julia's indulgent lifestyle. the conflict between her maternal instincts and the reality of their situation creates a palpable tension in her emotional state."],
        ap.active_plans = ["To gently admonish Julia about her eating habits and express concern for her health.", "To maintain a diplomatic stance while advocating for family values and responsibilities.", "To subtly encourage Julia to focus on familial bonds and the implications of Lucius\u2019s departure."],
        ap.beliefs = ["Family health and well-being should take precedence over indulgence and superficial pleasures.", "Nurturing relationships within the family is vital for their collective survival in the face of external pressures.", "Maintaining propriety and respect within the family is essential for preserving their reputation."],
        ap.goals = ["Short-term: To express her concerns to Julia without causing a rift.", "Medium-term: To foster a sense of responsibility in Julia regarding her family dynamics and decisions.", "Ultimate: To guide her family towards a more united and principled existence amidst the chaos of imperial life."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_list_of_names_event_8_1'})
    ON CREATE SET
        oi.description = 'The list of names is the focal point of the scene, meticulously examined by Livia as she questions Plautius about its content and implications. Livia uses the list as a tool to dissect Julia\'s scandalous affairs, probing Plautius about specific entries, such as \'Gershon\', to assess the list\'s credibility and Plautius\'s diligence. The list serves as tangible evidence of Julia\'s alleged indiscretions and functions narratively as a catalyst for Livia’s manipulative machinations, enabling her to solidify her control and orchestrate Julia\'s downfall by leveraging this damning information.',
        oi.status_before = 'Prior to the scene, the list of names was likely compiled under Livia\'s direction, possibly by Plautius or someone under his supervision, detailing individuals allegedly involved in scandalous activities with Julia. It is assumed to be a written document, possibly a scroll or tablet, and is in Livia\'s possession, held in her private study, ready for her strategic review and interrogation of Plautius.',
        oi.status_after = 'Following the scene, the list of names remains in Livia\'s possession, its status as incriminating evidence reinforced through Livia\'s thorough examination and Plautius\'s confirmations. Its narrative relevance is amplified as Livia explicitly states her intention to use the list, albeit indirectly, to inform Caesar Augustus, transforming it from a document of names into a potent weapon in Livia\'s arsenal for political manipulation and familial destruction.'
    WITH oi
    MATCH (o:Object {uuid: 'object_list_of_names'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Empress Livia stands in her private study, positioned behind her large writing desk, meticulously examining a list of names. Her posture is erect and commanding, her gaze sharp as she scrutinizes the document and observes Plautius, who stands nervously before her. Her movements are minimal, focused intently on the list and her interrogation.',
        ap.emotional_state = 'Livia outwardly projects an air of icy composure and calculated detachment as she questions Plautius. Her tone is deceptively conversational, yet laced with an undercurrent of grim determination and barely suppressed fury at the unfolding scandal surrounding Julia. Internally, she is seething with controlled rage, her mind racing to strategize how to best weaponize this information to further her own ruthless ambitions and consolidate power.',
        ap.emotional_tags = ["livia outwardly projects an air of icy composure", "calculated detachment as she questions plautius. her tone is deceptively conversational, yet laced with an undercurrent of grim determination", "barely suppressed fury at the unfolding scandal surrounding julia. internally, she is seething with controlled rage, her mind racing to strategize how to best weaponize this information to further her own ruthless ambitions", "consolidate power.", "livia outwardly projects an air of icy composure and calculated detachment as she questions plautius. her tone is deceptively conversational", "yet laced with an undercurrent of grim determination and barely suppressed fury at the unfolding scandal surrounding julia. internally", "she is seething with controlled rage", "her mind racing to strategize how to best weaponize this information to further her own ruthless ambitions and consolidate power."],
        ap.active_plans = ["Assess the veracity and strategic value of the list of names in exposing Julia's alleged indiscretions.", "Evaluate Plautius's reliability, obedience, and willingness to betray for future manipulations and assignments.", "Identify a suitable intermediary to deliver the damning information to Caesar Augustus in a way that deflects suspicion from herself and maximizes the impact of the revelation."],
        ap.beliefs = ["Unwavering control and manipulation are paramount in maintaining power and achieving political objectives.", "Personal loyalty is a transactional commodity, easily discarded when it conflicts with the greater ambitions of the dynasty.", "Ruthlessness and strategic foresight are essential virtues for survival and dominance in the treacherous world of Roman politics."],
        ap.goals = ["goals_short_term\": \"Verify the list's accuracy and Plautius's usefulness in her schemes within this immediate interaction.", "goals_medium_term\": \"Orchestrate Julia's downfall using the scandal revealed by the list, thereby removing a potential obstacle to her dynastic ambitions.", "goals_ultimate\": \"Secure Tiberius's unchallenged succession to the imperial throne, ensuring the enduring power and legacy of her lineage through any means necessary."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Plautius stands nervously before Livia in her austere study, sweating subtly as he attempts to maintain a respectful posture. He gestures slightly as he answers her probing questions about the list, his movements constrained and hesitant, reflecting his unease under Livia\'s intense scrutiny. He bows deeply as he is dismissed, eager to escape her presence.',
        ap.emotional_state = 'Plautius outwardly attempts to project an image of polite compliance and eager service, answering Livia\'s questions with a deferential tone. However, beneath the surface, he is palpably anxious and intimidated by Livia\'s formidable power, evidenced by his sweating and nervous demeanor. He is torn between his ambition to gain favor with Livia and a flicker of unease about betraying Julia, though ambition clearly outweighs any moral qualms. He internally hopes to please Livia and secure future opportunities.',
        ap.emotional_tags = ["plautius outwardly attempts to project an image of polite compliance", "eager service, answering livia's questions with a deferential tone. however, beneath the surface, he is palpably anxious", "intimidated by livia's formidable power, evidenced by his sweating", "nervous demeanor. he is torn between his ambition to gain favor with livia", "a flicker of unease about betraying julia, though ambition clearly outweighs any moral qualms. he internally hopes to please livia", "secure future opportunities.", "plautius outwardly attempts to project an image of polite compliance and eager service", "answering livia's questions with a deferential tone. however", "beneath the surface", "he is palpably anxious and intimidated by livia's formidable power", "evidenced by his sweating and nervous demeanor. he is torn between his ambition to gain favor with livia and a flicker of unease about betraying julia", "though ambition clearly outweighs any moral qualms. he internally hopes to please livia and secure future opportunities."],
        ap.active_plans = ["Validate the credibility of the list and his role in its compilation to Livia, ensuring she sees its value and his competence.", "Demonstrate unwavering obedience and eagerness to serve Livia, hoping to solidify his position as a useful asset in her schemes.", "Ascertain the nature of his 'next assignment' and prepare himself mentally and strategically to execute it to Livia's satisfaction."],
        ap.beliefs = ["Advancement in Roman society is achieved through unwavering loyalty and service to those in power, regardless of moral compromises.", "Livia is a dangerous but indispensable figure to impress if one desires influence and status within the imperial court.", "Moral considerations are secondary to political expediency and personal gain in the ruthless world of Roman power dynamics."],
        ap.goals = ["goals_short_term\": \"Successfully navigate this tense encounter with Livia, satisfying her immediate questions and escaping her study without incurring her displeasure.", "goals_medium_term\": \"Cultivate a position of trust and favor with Livia, becoming a reliable instrument in her manipulations and gaining access to greater influence.", "goals_ultimate\": \"Elevate his own standing and wealth within Roman society by aligning himself with powerful figures like Livia, securing a more prominent and comfortable life through political maneuvering."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands at her large writing desk, examining the list of names with a grim expression. Her posture is commanding, exuding authority as she questions Plautius about the details of the individuals on the list, each query delivered with a careful, probing intensity. She paces the room, her movements sharp and deliberate, embodying the restless energy of a predator assessing its prey.',
        ap.emotional_state = 'Livia\'s surface demeanor is one of calm control, yet beneath lies a simmering fury at the betrayal and weaknesses of those around her. Her sharp gaze pierces through Plautius, revealing her disdain for his hesitations and her determination to bend him to her will. She is a master of manipulation, cloaking her true intentions with a veneer of cordiality while masking her deeper frustrations.',
        ap.emotional_tags = ["livia's surface demeanor is one of calm control, yet beneath lies a simmering fury at the betrayal", "weaknesses of those around her. her sharp gaze pierces through plautius, revealing her disdain for his hesitations", "her determination to bend him to her will. she is a master of manipulation, cloaking her true intentions with a veneer of cordiality while masking her deeper frustrations.", "livia's surface demeanor is one of calm control", "yet beneath lies a simmering fury at the betrayal and weaknesses of those around her. her sharp gaze pierces through plautius", "revealing her disdain for his hesitations and her determination to bend him to her will. she is a master of manipulation", "cloaking her true intentions with a veneer of cordiality while masking her deeper frustrations.", "livia's surface demeanor is one of calm control, yet beneath lies a simmering fury at the betrayal and weaknesses of those around her. her sharp gaze pierces through plautius, revealing her disdain for his hesitations and her determination to bend him to her will. she is a master of manipulation, cloaking her true intentions with a veneer of cordiality", "masking her deeper frustrations."],
        ap.active_plans = ["To extract information from Plautius about potential betrayals within the court.", "To solidify her influence over Plautius by testing his loyalty and ambition.", "To find a scapegoat for the scandals she orchestrates, diverting blame away from herself."],
        ap.beliefs = ["Power must be wielded with cunning and deceit to maintain control.", "Loyalty is a currency to be traded for personal advantage, not a virtue.", "The ends justify the means, particularly in the realm of politics."],
        ap.goals = ["Short-term: To gather intelligence on her political enemies and potential leverage against them.", "Medium-term: To manipulate the court dynamics to her advantage, strengthening her family's position.", "Ultimate: To secure her legacy and that of her son Tiberius, ensuring their supremacy in the Roman power structure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Plautius stands before Livia, visibly sweating as he defends his actions regarding the list of names. His posture is slightly hunched, reflecting both reverence and apprehension, as he navigates the precarious nature of their conversation. He maintains eye contact, yet there is a nervous energy in his fidgeting, betraying his unease under Livia\'s scrutiny.',
        ap.emotional_state = 'Outwardly, Plautius attempts to project confidence, but internally, he is deeply conflicted, grappling with guilt over betraying his friend\'s mother. His words reveal a cautious evasiveness, as he fears the implications of his actions and Livia’s potential wrath. The tension between his ambition and his moral reservations creates a palpable discomfort.',
        ap.emotional_tags = ["outwardly, plautius attempts to project confidence, but internally, he is deeply conflicted, grappling with guilt over betraying his friend's mother. his words reveal a cautious evasiveness, as he fears the implications of his actions", "livia\u2019s potential wrath. the tension between his ambition", "his moral reservations creates a palpable discomfort.", "outwardly", "plautius attempts to project confidence", "but internally", "he is deeply conflicted", "grappling with guilt over betraying his friend's mother. his words reveal a cautious evasiveness", "as he fears the implications of his actions and livia\u2019s potential wrath. the tension between his ambition and his moral reservations creates a palpable discomfort.", "outwardly, plautius attempts to project confidence,", "internally, he is deeply conflicted, grappling with guilt over betraying his friend's mother. his words reveal a cautious evasiveness, as he fears the implications of his actions and livia\u2019s potential wrath. the tension between his ambition and his moral reservations creates a palpable discomfort."],
        ap.active_plans = ["To assure Livia of the veracity of the information he provided, seeking her approval.", "To navigate Livia's questions without revealing too much about his own insecurities or doubts.", "To leverage this opportunity to gain favor and further his own ambitions within the court."],
        ap.beliefs = ["Position and power within the court dictate one's worth and influence.", "Survival in this environment necessitates strategic alliances, even if it means compromising morals.", "Betrayal can be a necessary tool in the pursuit of ambition."],
        ap.goals = ["Short-term: To successfully complete Livia's demands without jeopardizing his standing.", "Medium-term: To position himself as a trusted ally to Livia, thus securing his place at court.", "Ultimate: To rise in rank and influence, ensuring he has the power to shape future decisions."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_list_of_names_event_9_3'})
    ON CREATE SET
        oi.description = 'The list of names is presented by Livia as tangible proof of Julia\'s extensive and scandalous affairs. Livia brandishes the list as a weapon, using it to shock and overwhelm Lucius with the undeniable reality of his mother\'s debauchery and his own complicity. It serves as a crucial tool for Livia to manipulate Lucius, forcing him to confront the gravity of the situation and accept her plan for him to expose Julia. The list becomes a symbol of Julia\'s ruin and Lucius\'s forced involvement in her downfall, solidifying Livia\'s control over both.',
        oi.status_before = 'The list is in Livia\'s possession, a closely guarded piece of incriminating evidence she has likely compiled and verified. It is a tool of power held exclusively by Livia, representing her knowledge and control over Julia\'s secrets, ready to be deployed for maximum impact.',
        oi.status_after = 'The list is physically transferred to Lucius, transitioning from Livia\'s exclusive weapon to a shared instrument of destruction. It becomes a heavy burden for Lucius, forcing him to confront the evidence of his mother\'s betrayal and his own complicity. The list now represents Lucius\'s entanglement in Livia\'s scheme and his forced role in his mother\'s impending ruin, making him a key player in Livia\'s machinations.'
    WITH oi
    MATCH (o:Object {uuid: 'object_list_of_names'})
    MATCH (e:Event {uuid: 'event_9_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Empress Livia stands imperiously in her private study, a figure of controlled fury. She confronts Lucius with a rigid posture, her gaze piercing and unwavering.  She paces slightly as she speaks, each movement deliberate and sharp, emphasizing the weight of her accusations. Her voice, though measured, vibrates with suppressed rage, every word a calculated strike against Lucius\'s crumbling defenses.',
        ap.emotional_state = 'Livia outwardly projects icy rage and moral indignation, her tone laced with contempt for Lucius\'s perceived weakness and complicity. Beneath this facade, a calculating mind works furiously, assessing the damage Julia\'s scandal inflicts and strategizing damage control.  There\'s a deep-seated frustration at the incompetence of those around her and a ruthless determination to steer the situation to her advantage, masking any personal emotional turmoil under a veneer of imperial resolve.',
        ap.emotional_tags = ["livia outwardly projects icy rage", "moral indignation, her tone laced with contempt for lucius's perceived weakness", "complicity. beneath this facade, a calculating mind works furiously, assessing the damage julia's scandal inflicts", "strategizing damage control.  there's a deep-seated frustration at the incompetence of those around her", "a ruthless determination to steer the situation to her advantage, masking any personal emotional turmoil under a veneer of imperial resolve.", "livia outwardly projects icy rage and moral indignation", "her tone laced with contempt for lucius's perceived weakness and complicity. beneath this facade", "a calculating mind works furiously", "assessing the damage julia's scandal inflicts and strategizing damage control.  there's a deep-seated frustration at the incompetence of those around her and a ruthless determination to steer the situation to her advantage", "masking any personal emotional turmoil under a veneer of imperial resolve."],
        ap.active_plans = ["To extract a full confession from Lucius regarding his knowledge and involvement in Julia's affairs.", "To manipulate Lucius into accepting responsibility and delivering the damning news to Augustus, shielding herself from direct blame.", "To reinforce her image as the moral guardian of the family, contrasting her righteousness with the perceived corruption of Julia and Lucius."],
        ap.beliefs = ["Unwavering loyalty to the imperial family and its reputation is paramount.", "Any weakness or moral failing within the family must be ruthlessly excised to maintain power.", "She is the only one capable of truly safeguarding the dynasty from internal and external threats."],
        ap.goals = ["short-term\": \"Secure Lucius's cooperation in exposing Julia's scandal and his own complicity.", "medium-term\": \"Minimize the negative impact of the scandal on Augustus and the family's public image, while subtly shifting blame away from herself.", "ultimate\": \"Strengthen her control over the imperial family and ensure the smooth transition of power to Tiberius, solidifying her dynasty's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Lucius stands before Livia, physically shrinking under her intense scrutiny. His head is bowed in a posture of shame and submission, his body language conveying weakness and defensiveness. He stammers and avoids eye contact, fidgeting nervously as Livia unleashes her accusations.  He is trapped, cornered in the austere space of Livia\'s study, desperately seeking an escape from her wrath.',
        ap.emotional_state = 'Lucius displays a surface of shame, fear, and flustered defensiveness, his stammering and weak protests revealing his inner turmoil. Internally, he is wracked with conflicting loyalties and dawning panic as he realizes the gravity of his situation. He is torn between his filial affection for Julia and his fear of imperial reprisal.  His naive belief that Augustus was aware and indifferent is shattered, leaving him exposed and desperately trying to minimize the damage to himself.',
        ap.emotional_tags = ["lucius displays a surface of shame, fear,", "flustered defensiveness, his stammering", "weak protests revealing his inner turmoil. internally, he is wracked with conflicting loyalties", "dawning panic as he realizes the gravity of his situation. he is torn between his filial affection for julia", "his fear of imperial reprisal.  his naive belief that augustus was aware", "indifferent is shattered, leaving him exposed", "desperately trying to minimize the damage to himself.", "lucius displays a surface of shame", "fear", "and flustered defensiveness", "his stammering and weak protests revealing his inner turmoil. internally", "he is wracked with conflicting loyalties and dawning panic as he realizes the gravity of his situation. he is torn between his filial affection for julia and his fear of imperial reprisal.  his naive belief that augustus was aware and indifferent is shattered", "leaving him exposed and desperately trying to minimize the damage to himself."],
        ap.active_plans = ["To weakly deny direct involvement in Julia's affairs, focusing on his 'omission' rather than active participation.", "To appeal to Livia's potential mercy or understanding by emphasizing his familial loyalty to Julia.", "To find any avenue for redemption or escape from Livia's accusations, even if it means betraying his mother further to save himself."],
        ap.beliefs = ["Filial duty, though perhaps misguided, should be acknowledged and might offer some protection.", "He can still somehow minimize the personal repercussions of the scandal through appeasement and submission.", "Livia, despite her harshness, might be swayed by appeals to family or a chance for him to 'redeem' himself."],
        ap.goals = ["short-term\": \"Survive Livia's immediate interrogation and avoid her harshest judgment.", "medium-term\": \"Limit the damage to his own reputation and standing within the imperial family, distancing himself from Julia's scandal.", "ultimate\": \"Maintain some semblance of his previously favored position and future prospects, even if it means sacrificing his mother's reputation and accepting Livia's manipulative 'path to redemption'."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised and imposing, her gaze piercing as she confronts Lucius. Her posture is rigid, exuding authority while she gestures sharply to emphasize her accusations, her voice a venomous whip that cuts through the air, compelling Lucius to meet her fierce scrutiny.',
        ap.emotional_state = 'Livia\'s surface demeanor is one of cold fury, her voice dripping with disdain as she chastises Lucius. Internally, she battles a mix of frustration and determination, driven by her fierce need to control the narrative and protect her family\'s legacy. There is an undercurrent of disappointment that her own son has failed to act in their family\'s best interest.',
        ap.emotional_tags = ["livia's surface demeanor is one of cold fury, her voice dripping with disdain as she chastises lucius. internally, she battles a mix of frustration", "determination, driven by her fierce need to control the narrative", "protect her family's legacy. there is an undercurrent of disappointment that her own son has failed to act in their family's best interest.", "livia's surface demeanor is one of cold fury", "her voice dripping with disdain as she chastises lucius. internally", "she battles a mix of frustration and determination", "driven by her fierce need to control the narrative and protect her family's legacy. there is an undercurrent of disappointment that her own son has failed to act in their family's best interest."],
        ap.active_plans = ["To publicly accuse Lucius and force him to reckon with his complicity in Julia's scandal.", "To ensure that Lucius understands the gravity of the situation and the potential consequences he faces from Augustus.", "To manipulate Lucius into taking action that will align with her own goals, making him believe he still has agency in the situation."],
        ap.beliefs = ["Family loyalty is paramount, and any betrayal must be dealt with harshly.", "The preservation of her family's reputation is more important than individual feelings.", "Manipulation and control are necessary tools to navigate the treacherous politics of Rome."],
        ap.goals = ["Short-term: To intimidate Lucius into revealing the truth about Julia's affairs.", "Medium-term: To position herself as the protector of Augustus\u2019s legacy by exposing family corruption.", "Ultimate: To eliminate threats to her family's power and ensure the continuation of her lineage's dominance over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Lucius stands before Livia, head bowed and posture submissive, wringing his hands nervously as he struggles to articulate his defense. His body language is tense, indicating both his fear of Livia’s wrath and his own inner turmoil as he grapples with guilt and desperation.',
        ap.emotional_state = 'Outwardly, Lucius appears anxious and defensive, his voice trembling as he attempts to justify his actions. Inside, he wrestles with shame and guilt over his perceived failures, torn between loyalty to his mother and the weight of Livia\'s accusations. He feels cornered and betrayed, questioning his own judgment and decisions.',
        ap.emotional_tags = ["outwardly, lucius appears anxious", "defensive, his voice trembling as he attempts to justify his actions. inside, he wrestles with shame", "guilt over his perceived failures, torn between loyalty to his mother", "the weight of livia's accusations. he feels cornered", "betrayed, questioning his own judgment", "decisions.", "outwardly", "lucius appears anxious and defensive", "his voice trembling as he attempts to justify his actions. inside", "he wrestles with shame and guilt over his perceived failures", "torn between loyalty to his mother and the weight of livia's accusations. he feels cornered and betrayed", "questioning his own judgment and decisions."],
        ap.active_plans = ["To defend himself against Livia's accusations by minimizing his involvement.", "To persuade Livia that his actions were not malicious and he deserves a chance to rectify the situation.", "To gain access to the list of names Livia holds, hoping it will help him shift blame and take control of the narrative."],
        ap.beliefs = ["Family loyalty should come before all else, even if it means protecting his mother\u2019s failings.", "He believes he is not responsible for Julia's actions, feeling trapped by circumstance.", "He holds a na\u00efve view of Augustus's infallibility, thinking the Emperor is unaware of Julia's indiscretions."],
        ap.goals = ["Short-term: To convince Livia of his innocence and negotiate a way out of his predicament.", "Medium-term: To regain favor with Augustus and protect his own prospects for power.", "Ultimate: To distance himself from the scandal while preserving his family\u2019s honor and securing his future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands in her private study, dominating the space and Lucius with her commanding presence. She is actively pacing as she delivers her accusations, her movements sharp and purposeful, emphasizing the gravity of the situation she is outlining. Her gestures are controlled yet forceful, underscoring her authority and unwavering resolve to control the unfolding scandal.',
        ap.emotional_state = 'Livia projects an outward display of righteous fury and moral indignation, her tone laced with scorn and disappointment towards Lucius\'s inaction. Beneath this facade of anger, she is calculating and controlled, her emotions strategically deployed to manipulate Lucius. There is a chilling satisfaction in her voice as she unveils the extent of Julia\'s ruin and Lucius\'s complicity, revealing her ruthless pragmatism and ambition.',
        ap.emotional_tags = ["livia projects an outward display of righteous fury", "moral indignation, her tone laced with scorn", "disappointment towards lucius's inaction. beneath this facade of anger, she is calculating", "controlled, her emotions strategically deployed to manipulate lucius. there is a chilling satisfaction in her voice as she unveils the extent of julia's ruin", "lucius's complicity, revealing her ruthless pragmatism", "ambition.", "livia projects an outward display of righteous fury and moral indignation", "her tone laced with scorn and disappointment towards lucius's inaction. beneath this facade of anger", "she is calculating and controlled", "her emotions strategically deployed to manipulate lucius. there is a chilling satisfaction in her voice as she unveils the extent of julia's ruin and lucius's complicity", "revealing her ruthless pragmatism and ambition."],
        ap.active_plans = ["Force Lucius to acknowledge the catastrophic consequences of his and Julia's actions for Augustus.", "Position herself as the morally righteous figure forced to expose the corruption within Augustus's family.", "Manipulate Lucius into becoming the bearer of bad news to Augustus, thereby shifting blame and solidifying her own control over the narrative."],
        ap.beliefs = ["Unwavering loyalty to the dynasty and its image is paramount, even above familial bonds.", "Any weakness or scandal within the imperial family must be ruthlessly purged to maintain power.", "She is justified in using any means necessary, including manipulation and emotional coercion, to protect and advance her family's interests."],
        ap.goals = ["goals\": [\n          \"Short-term: Ensure Lucius takes the 'list' and exposes Julia, thus distancing herself from the immediate scandal.", "Medium-term: Leverage Julia's downfall to further consolidate her own power and influence over Augustus and the succession.", "Ultimate: Secure the long-term dominance of her lineage and legacy within the Roman Empire, ensuring Tiberius's ascendance and her continued influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Though physically absent, Augustus looms large as the central figure whose reaction dictates the stakes of this scene. He is imagined enthroned, unaware yet implicitly present in Livia and Lucius\'s dialogue as the ultimate judge and arbiter. His looming presence fills the study, a silent, unseen force shaping every word and manipulation.',
        ap.emotional_state = 'Augustus is presumed to be in a state of trusting expectation towards Lucius, and righteous paternal authority concerning his family\'s conduct. Unbeknownst to him, he is on the precipice of devastating betrayal and profound personal blow. His presumed emotional state is one of impending shock and rage, a volcano about to erupt when the truth is revealed.',
        ap.emotional_tags = ["augustus is presumed to be in a state of trusting expectation towards lucius,", "righteous paternal authority concerning his family's conduct. unbeknownst to him, he is on the precipice of devastating betrayal", "profound personal blow. his presumed emotional state is one of impending shock", "rage, a volcano about to erupt when the truth is revealed.", "augustus is presumed to be in a state of trusting expectation towards lucius", "and righteous paternal authority concerning his family's conduct. unbeknownst to him", "he is on the precipice of devastating betrayal and profound personal blow. his presumed emotional state is one of impending shock and rage", "a volcano about to erupt when the truth is revealed."],
        ap.active_plans = ["To maintain his image of a strong, morally upright leader and emperor, unaware that this image is about to be shattered.", "To continue relying on Lucius as a trusted family member and potential heir, oblivious to Lucius's complicity.", "To uphold traditional Roman values and family honor, principles that are about to be violently contradicted by his own kin."],
        ap.beliefs = ["His authority as Emperor is absolute and his family should reflect his values of order and morality.", "Lucius is a virtuous and capable young man, deserving of his trust and high expectations.", "Scandal and betrayal within his family are not just personal failings but threats to the stability and moral fabric of Rome itself."],
        ap.goals = ["Short-term: Remain ignorant and content in his assumed control over his family and the empire, for now.", "Medium-term: Secure a legacy of strength and moral rectitude for Rome through his chosen successors (unaware of the looming crisis).", "Ultimate: Leave behind a stable and respected Roman Empire, founded on the principles of order, duty, and traditional Roman virtue \u2013 a legacy about to be deeply challenged."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Julia is an absent presence, yet the very subject of the intense confrontation, her scandalous actions casting a dark shadow over the scene. She is imagined in her own chambers, oblivious to this specific conversation yet vulnerable and exposed, her fate being decided in her absence. Her actions have placed her at the epicenter of a storm she may be ill-prepared to weather.',
        ap.emotional_state = 'Julia is likely operating with a mix of defiant recklessness and perhaps a degree of denial about the true danger of her actions. She may feel a sense of liberation in her scandalous behavior, yet also carries an underlying anxiety about potential consequences. Her emotional state is a volatile blend of bravado and suppressed fear, teetering on the brink of catastrophic exposure.',
        ap.emotional_tags = ["julia is likely operating with a mix of defiant recklessness", "perhaps a degree of denial about the true danger of her actions. she may feel a sense of liberation in her scandalous behavior, yet also carries an underlying anxiety about potential consequences. her emotional state is a volatile blend of bravado", "suppressed fear, teetering on the brink of catastrophic exposure.", "julia is likely operating with a mix of defiant recklessness and perhaps a degree of denial about the true danger of her actions. she may feel a sense of liberation in her scandalous behavior", "yet also carries an underlying anxiety about potential consequences. her emotional state is a volatile blend of bravado and suppressed fear", "teetering on the brink of catastrophic exposure."],
        ap.active_plans = ["To continue pursuing personal freedom and pleasure outside the confines of her imperial role, despite the growing risks.", "To maintain a public facade of imperial decorum to delay suspicion, though this facade is rapidly crumbling.", "Perhaps to underestimate Livia's ruthlessness and her capacity to orchestrate her downfall, blinded by her own desires and perceived invulnerability."],
        ap.beliefs = ["She is entitled to personal happiness and fulfillment, even if it defies the rigid expectations of her imperial status.", "Her position as Caesar's daughter offers a degree of protection, perhaps overestimating her immunity to consequences.", "She may believe she can outmaneuver or charm her way out of trouble, underestimating the severity of the forces arrayed against her."],
        ap.goals = ["Short-term: Prolong her freedom and enjoyment of her scandalous affairs for as long as possible.", "Medium-term: Navigate the escalating crisis and attempt to minimize the damage to her reputation and social standing.", "Ultimate: Secure a life of personal autonomy and perhaps even influence, despite the constraints and dangers of her imperial lineage \u2013 a goal rapidly slipping from her grasp."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS sits on a raised dais, his posture rigid and authoritative. He leans forward, gaze fixed intently on BALBAS, demanding a confession regarding his daughter. His voice rises in anger as he questions the gathered men, his demeanor a blend of disappointment and simmering rage.',
        ap.emotional_state = 'AUGUSTUS\'s surface emotions are a tempest of fury and betrayal, his face etched with disappointment. Internally, he wrestles with feelings of powerlessness and humiliation as the implications of his daughter\'s actions unfold, burdened by the shame brought upon his legacy.',
        ap.emotional_tags = ["augustus's surface emotions are a tempest of fury", "betrayal, his face etched with disappointment. internally, he wrestles with feelings of powerlessness", "humiliation as the implications of his daughter's actions unfold, burdened by the shame brought upon his legacy.", "augustus's surface emotions are a tempest of fury and betrayal", "his face etched with disappointment. internally", "he wrestles with feelings of powerlessness and humiliation as the implications of his daughter's actions unfold", "burdened by the shame brought upon his legacy."],
        ap.active_plans = ["To extract confessions from the men regarding their involvement with JULIA.", "To assert his authority and protect the reputation of his family.", "To decide on a punishment for JULIA, signaling his control over the situation."],
        ap.beliefs = ["Honor and reputation of the imperial family are paramount.", "Disloyalty must be met with severe consequences to maintain order.", "As emperor, it is his duty to safeguard Rome's moral integrity."],
        ap.goals = ["Short-term: To publicly confront those involved in the scandal.", "Medium-term: To reinforce his authority and restore the family's honor.", "Ultimate: To prevent any further damage to his legacy and ensure the stability of the imperial line."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelius_sextus_balbas_event_10_1'})
    ON CREATE SET
        ap.current_status = 'BALBAS stands before AUGUSTUS, visibly nervous and trembling. He avoids eye contact, his posture slumped in shame as he stammers out his admission. His hands fidget anxiously, betraying his inner turmoil as he faces the Emperor\'s wrath.',
        ap.emotional_state = 'BALBAS\'s surface emotion is one of fear and guilt, his voice quaking with the weight of his confession. Internally, he grapples with shame and terror as he realizes the gravity of his actions and the potential consequences that loom over him.',
        ap.emotional_tags = ["balbas's surface emotion is one of fear", "guilt, his voice quaking with the weight of his confession. internally, he grapples with shame", "terror as he realizes the gravity of his actions", "the potential consequences that loom over him.", "balbas's surface emotion is one of fear and guilt", "his voice quaking with the weight of his confession. internally", "he grapples with shame and terror as he realizes the gravity of his actions and the potential consequences that loom over him."],
        ap.active_plans = ["To confess his involvement to AUGUSTUS, hoping for mercy.", "To navigate the Emperor's anger and avoid further repercussions.", "To deflect blame and minimize personal consequences amidst the scandal."],
        ap.beliefs = ["Personal honor is vital, and shame must be confronted.", "Survival in this political landscape often necessitates sacrifice.", "The Emperor's wrath is unpredictable, influencing his actions."],
        ap.goals = ["Short-term: To admit his wrongdoing to AUGUSTUS.", "Medium-term: To seek forgiveness or leniency from the Emperor.", "Ultimate: To preserve his standing and reputation, despite the scandal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_volusius_saturninus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'SATURNINUS stands among the gathered men, his head bowed in submission. He shifts uncomfortably, anxiety etched on his face as AUGUSTUS\'s questions pierce the air. He acknowledges his involvement with JULIA, his demeanor revealing both resignation and fear.',
        ap.emotional_state = 'SATURNINUS\'s outward expression is one of dread and shame, his voice barely above a whisper as he answers AUGUSTUS. Internally, he wrestles with a sense of betrayal, both of himself and of the familial bonds that have disintegrated in the light of scandal.',
        ap.emotional_tags = ["saturninus's outward expression is one of dread", "shame, his voice barely above a whisper as he answers augustus. internally, he wrestles with a sense of betrayal, both of himself", "of the familial bonds that have disintegrated in the light of scandal.", "saturninus's outward expression is one of dread and shame", "his voice barely above a whisper as he answers augustus. internally", "he wrestles with a sense of betrayal", "both of himself and of the familial bonds that have disintegrated in the light of scandal."],
        ap.active_plans = ["To admit his involvement and hope for AUGUSTUS's mercy.", "To distance himself from the scandal as much as possible.", "To gauge the mood of the Emperor and align his responses to diffuse the tension."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, but personal survival is crucial.", "The familial bond should have protected him, but disloyalty has severed it.", "Consequences for betrayal must be faced with humility."],
        ap.goals = ["Short-term: To confess his actions before the Emperor.", "Medium-term: To mitigate any fallout from the confession.", "Ultimate: To retain his position and avoid severe punishment for his actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits enthroned, a figure of immense power but now visibly consumed by fury and disappointment. He interrogates the men before him with sharp, accusatory questions, his voice escalating from controlled anger to outright rage. He commands his guards to remove the men, a gesture of dismissal and disgust. Finally, he rises abruptly, his voice booming as he delivers the devastating sentence of banishment upon Julia, his daughter.',
        ap.emotional_state = 'Augustus is a tempest of rage barely contained beneath his imperial facade. Outwardly, his voice thunders with righteous anger, his commands sharp and unforgiving. However, beneath this surface fury lies a profound sense of betrayal and wounded pride. He is deeply disappointed in Julia\'s actions, feeling personally dishonored and perhaps even questioning his own ability to maintain order within his family. There is a palpable tension between his public role as the unshakeable Emperor and his private pain as a father betrayed.',
        ap.emotional_tags = ["augustus is a tempest of rage barely contained beneath his imperial facade. outwardly, his voice thunders with righteous anger, his commands sharp", "unforgiving. however, beneath this surface fury lies a profound sense of betrayal", "wounded pride. he is deeply disappointed in julia's actions, feeling personally dishonored", "perhaps even questioning his own ability to maintain order within his family. there is a palpable tension between his public role as the unshakeable emperor", "his private pain as a father betrayed.", "augustus is a tempest of rage barely contained beneath his imperial facade. outwardly", "his voice thunders with righteous anger", "his commands sharp and unforgiving. however", "beneath this surface fury lies a profound sense of betrayal and wounded pride. he is deeply disappointed in julia's actions", "feeling personally dishonored and perhaps even questioning his own ability to maintain order within his family. there is a palpable tension between his public role as the unshakeable emperor and his private pain as a father betrayed."],
        ap.active_plans = ["Uncover the full extent of the betrayal by interrogating those involved.", "Assert his absolute authority and demonstrate that no one, not even his own daughter, is above imperial judgment.", "Restore order and perceived morality to his household by decisively punishing Julia and making an example of her transgression."],
        ap.beliefs = ["The imperial family must embody moral rectitude and serve as an unblemished example to Rome.", "Disloyalty and scandal within his family are direct affronts to his divine authority and the stability of the empire.", "Swift and severe punishment is the only way to maintain order, deter future transgressions, and cleanse the stain on his family's honor."],
        ap.goals = ["{short_term: To immediately punish the men involved in the scandal, asserting his dominance and control in the present moment., medium_term: To banish Julia permanently, removing the source of scandal and restoring his family's image in the eyes of Rome., ultimate: To secure the long-term stability and moral integrity of Rome by upholding traditional values and ensuring unquestioning respect for imperial authority, even within his own household, thereby safeguarding his legacy.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Lucius stands aside in the grand audience chamber, a somewhat detached observer amidst the unfolding imperial drama. His posture is marked by a visible tension, a mixture of guilt and apprehension. He watches as Augustus unleashes his fury upon the confessed men and then pronounces Julia\'s banishment. He attempts to address Augustus, uttering \'Grandfather...\', but his words are cut short by the Emperor\'s escalating rage, rendering him powerless and silent.',
        ap.emotional_state = 'Lucius is caught in a maelstrom of conflicting emotions. He is outwardly trepidatious, aware of the gravity of the situation he has initiated and the Emperor\'s volatile wrath. Inwardly, he is wrestling with guilt for betraying his mother\'s secret and the subsequent harsh consequences, yet he also likely feels a sense of conflicted duty towards his grandfather and the perceived honor of the family. There\'s an unspoken conflict between his loyalty to Julia and his upbringing within the rigid imperial system, leaving him emotionally adrift and regretful.',
        ap.emotional_tags = ["lucius is caught in a maelstrom of conflicting emotions. he is outwardly trepidatious, aware of the gravity of the situation he has initiated", "the emperor's volatile wrath. inwardly, he is wrestling with guilt for betraying his mother's secret", "the subsequent harsh consequences, yet he also likely feels a sense of conflicted duty towards his grandfather", "the perceived honor of the family. there's an unspoken conflict between his loyalty to julia", "his upbringing within the rigid imperial system, leaving him emotionally adrift", "regretful.", "lucius is caught in a maelstrom of conflicting emotions. he is outwardly trepidatious", "aware of the gravity of the situation he has initiated and the emperor's volatile wrath. inwardly", "he is wrestling with guilt for betraying his mother's secret and the subsequent harsh consequences", "yet he also likely feels a sense of conflicted duty towards his grandfather and the perceived honor of the family. there's an unspoken conflict between his loyalty to julia and his upbringing within the rigid imperial system", "leaving him emotionally adrift and regretful."],
        ap.active_plans = ["Observe Augustus's reactions and gauge the full extent of the Emperor's anger and the severity of the unfolding judgment.", "Remain unobtrusive and avoid drawing the Emperor's direct ire towards himself amidst the familial storm.", "Potentially seek a moment to intercede on behalf of his mother, though his hesitant approach suggests a lack of confidence or conviction in his ability to sway Augustus's decision."],
        ap.beliefs = ["Loyalty to the Emperor and the established order of Rome is a primary obligation, even when it involves familial conflict.", "Family honor and public image are paramount, and scandals must be addressed decisively to maintain social stability.", "Honesty and confession, while painful, are ultimately necessary for maintaining integrity within the imperial system, even if it leads to severe repercussions for loved ones."],
        ap.goals = ["{short_term: To survive the immediate fallout of his revelations without incurring personal punishment from Augustus, navigating the Emperor's volatile emotions., medium_term: To assess the damage caused by his actions and understand the long-term consequences for his family, especially his mother Julia, and his own position within the imperial structure., ultimate: To reconcile his actions with his conscience and find a path forward that maintains his standing within the family and the Roman hierarchy, even amidst the devastating personal and familial turmoil he has helped unleash.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Seated on a raised dais, Augustus emanates a formidable presence, his body tense with disappointment and indignation. He stands abruptly, his movements sharp and commanding, as he commands the room with authority, his raised voice echoing against the opulent walls. His posture reflects a mix of anger and paternal concern, underscoring the gravity of his declarations.',
        ap.emotional_state = 'Augustus experiences a maelstrom of emotions; on the surface, he is resolute, displaying anger and disappointment towards the men before him. Yet beneath that, there lurks an agonizing sense of betrayal, a deeper pain stemming from his daughter\'s actions. His paternal instincts clash with the public necessity of maintaining authority, creating an internal conflict that fuels his reaction.',
        ap.emotional_tags = ["augustus experiences a maelstrom of emotions; on the surface, he is resolute, displaying anger", "disappointment towards the men before him. yet beneath that, there lurks an agonizing sense of betrayal, a deeper pain stemming from his daughter's actions. his paternal instincts clash with the public necessity of maintaining authority, creating an internal conflict that fuels his reaction.", "augustus experiences a maelstrom of emotions; on the surface", "he is resolute", "displaying anger and disappointment towards the men before him. yet beneath that", "there lurks an agonizing sense of betrayal", "a deeper pain stemming from his daughter's actions. his paternal instincts clash with the public necessity of maintaining authority", "creating an internal conflict that fuels his reaction.", "augustus experiences a maelstrom of emotions", "on the surface, he is resolute, displaying anger and disappointment towards the men before him. yet beneath that, there lurks an agonizing sense of betrayal, a deeper pain stemming from his daughter's actions. his paternal instincts clash with the public necessity of maintaining authority, creating an internal conflict that fuels his reaction."],
        ap.active_plans = ["To publicly address the scandal surrounding Julia, asserting his authority as Emperor and patriarch.", "To issue a decree banishing Julia as a consequence of her actions, reinforcing traditional values in the eyes of Rome.", "To demonstrate control over his family dynamics and restore his image as a strong ruler amidst familial chaos."],
        ap.beliefs = ["Family honor and reputation are paramount to the stability of the empire.", "Public perception of virtue and morality must be upheld, even at the cost of personal relationships.", "As Emperor, he bears the burden of enforcing order and discipline, even against his own kin."],
        ap.goals = ["Short-term: To confront the men involved with Julia and extract admissions of guilt.", "Medium-term: To solidify his authority by making an example of Julia, ensuring that her actions have serious consequences.", "Ultimate: To preserve the integrity of the Julio-Claudian dynasty and maintain the respect of the Roman populace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Lucius stands at the side, visibly tense and anxious, his head bowed slightly as he observes the proceedings with a mixture of guilt and trepidation. His body language reflects his unease, fidgeting as he grapples with the weight of his family\'s scandal and his own complicity in it.',
        ap.emotional_state = 'Lucius is caught in a spiral of guilt and fear as the proceedings unfold. His confidence is shaken, revealing a deep internal conflict between loyalty to his mother and the demands of his grandfather. His eyes flicker with concern as Julia\'s desperate cries echo from outside, amplifying his sense of helplessness and impending loss.',
        ap.emotional_tags = ["lucius is caught in a spiral of guilt", "fear as the proceedings unfold. his confidence is shaken, revealing a deep internal conflict between loyalty to his mother", "the demands of his grandfather. his eyes flicker with concern as julia's desperate cries echo from outside, amplifying his sense of helplessness", "impending loss.", "lucius is caught in a spiral of guilt and fear as the proceedings unfold. his confidence is shaken", "revealing a deep internal conflict between loyalty to his mother and the demands of his grandfather. his eyes flicker with concern as julia's desperate cries echo from outside", "amplifying his sense of helplessness and impending loss."],
        ap.active_plans = ["To navigate the fallout of the scandal while maintaining his position within the family and court.", "To mitigate the emotional fallout from Julia's banishment, especially considering his feelings for her.", "To remain in Augustus\u2019s good graces while grappling with the guilt of his family's actions."],
        ap.beliefs = ["Family loyalty is paramount, yet navigating the treacherous waters of imperial politics requires caution.", "His mother's actions, while scandalous, deserve compassion rather than condemnation.", "Maintaining his own future in the face of familial chaos is critical, and he must tread carefully."],
        ap.goals = ["Short-term: To manage his anxiety regarding the scandal and avoid drawing his grandfather's ire.", "Medium-term: To find a way to support Julia without risking his own standing.", "Ultimate: To establish himself as a capable leader in the imperial family, despite the chaos surrounding him."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_door_julias_chambers_event_11_1'})
    ON CREATE SET
        oi.description = 'The heavy door to Julia\'s chambers is violently slammed shut, transforming instantly from a threshold to a formidable barrier. It functions as the instrument of Julia\'s imprisonment, physically sealing her off from the outside world and becoming the focal point of her desperate attempts to break free. The door absorbs the force of Julia\'s fists and her desperate cries, symbolizing the unyielding nature of her confinement and the imperial power that has trapped her. It represents the boundary between Julia\'s former freedom and her current state of isolation and powerlessness.',
        oi.status_before = 'The door was in a state of passage, likely open or easily traversable, allowing Julia free access to and from her chambers. It served its normal function as a room divider, offering privacy but not restriction.',
        oi.status_after = 'The door is now firmly shut and likely locked, becoming an impassable barrier. It is now a symbol of confinement and control exerted over Julia, bearing the marks of her physical assault and representing her isolation from the outside world. Its function has shifted from access point to instrument of imprisonment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_door_julias_chambers'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_door_julias_chambers_event_11_2'})
    ON CREATE SET
        oi.description = 'The heavy door to Julia\'s chambers stands as a physical barrier, symbolizing her confinement and isolation. As Julia beats on it in desperation, the door becomes a focal point of her emotional outburst, representing not only her physical separation from Livia but also the entrapment she feels within the imperial family\'s treacherous dynamics. The door absorbs her fury, embodying the conflict between Julia and Livia.',
        oi.status_before = 'The door stands firmly closed, a solid barrier representing the divide between Julia and the outside world, particularly Livia\'s scheming.',
        oi.status_after = 'The door remains closed, yet it bears the marks of Julia\'s emotional turmoil, reflecting her desperate attempt to confront her adversary despite the physical separation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_door_julias_chambers'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_door_julias_chambers_event_11_3'})
    ON CREATE SET
        oi.description = 'The heavy door to Julia\'s chambers becomes a critical focal point in this event, acting as a stark physical and symbolic barrier. Julia directs her fury and accusations at Livia through this object, pounding on it in a futile attempt to break free from her confinement and reach her adversary. The door serves as a sounding board for Julia\'s desperation, amplifying her isolation and powerlessness. It becomes a stage for her theatrical outburst, and a silent testament to the imperial power that imprisons her, effectively cutting off her voice and agency from the world beyond her chambers, and from Livia herself who remains deliberately out of sight.',
        oi.status_before = 'The door was likely closed for privacy within Julia\'s chambers, but not necessarily locked or functioning as a symbol of confinement until the onset of Julia\'s banishment and subsequent isolation.',
        oi.status_after = 'The door remains firmly shut, now definitively locked and acting as an imposing barrier, enforcing Julia\'s confinement. It transitions from a simple door to a potent symbol of her imprisonment and the absolute power wielded against her, marking the end of her freedom and signifying her enforced isolation from the imperial court and any potential influence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_door_julias_chambers'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Trapped within her chambers, Julia unleashes a torrent of physical and verbal fury against the heavy door that confines her. She is described as beating on the door with her fists, her body a conduit for her escalating desperation and rage at her sudden imprisonment. This physical display underscores her complete lack of agency in this moment.',
        ap.emotional_state = 'Julia is consumed by a volatile mix of surface rage and profound internal despair. Outwardly, she vents her fury through physical violence and accusatory shouts, directly addressing Livia and expressing her bitter understanding of Livia\'s manipulations. Beneath this aggressive exterior, there is a deep current of fear and powerlessness as the reality of her confinement and its implications sink in. Her accusations reveal a desperate attempt to assert some control by understanding and naming her oppressor, even as she is physically restrained.',
        ap.emotional_tags = ["julia is consumed by a volatile mix of surface rage", "profound internal despair. outwardly, she vents her fury through physical violence", "accusatory shouts, directly addressing livia", "expressing her bitter understanding of livia's manipulations. beneath this aggressive exterior, there is a deep current of fear", "powerlessness as the reality of her confinement", "its implications sink in. her accusations reveal a desperate attempt to assert some control by understanding", "naming her oppressor, even as she is physically restrained.", "julia is consumed by a volatile mix of surface rage and profound internal despair. outwardly", "she vents her fury through physical violence and accusatory shouts", "directly addressing livia and expressing her bitter understanding of livia's manipulations. beneath this aggressive exterior", "there is a deep current of fear and powerlessness as the reality of her confinement and its implications sink in. her accusations reveal a desperate attempt to assert some control by understanding and naming her oppressor", "even as she is physically restrained."],
        ap.active_plans = ["To physically break through the door or at least create enough disturbance to attract attention and potential aid.", "To verbally confront Livia, even through the closed door, aiming to wound her with accusations and assert her own continued relevance, particularly through her sons.", "To express the depth of her outrage and injustice at her situation, ensuring her voice is heard and her resistance is known, even if it cannot immediately change her circumstances."],
        ap.beliefs = ["She believes Livia is the sole architect of her downfall, driven by a relentless ambition to secure power for Tiberius and ultimately herself.", "She believes her sons represent her future power and leverage against Livia's machinations, seeing them as a shield and a claim to continued influence.", "She believes Livia's ambition is ultimately self-serving and that Livia is willing to sacrifice anyone, including Julia, to achieve her goals, seeing Livia's actions as transparent and predictable in their ruthlessness."],
        ap.goals = ["short_term\": \"To escape her physical confinement within the chambers immediately, regaining her freedom of movement and action.", "medium_term\": \"To expose and discredit Livia's manipulations to others, undermining Livia's influence and potentially turning allies against her.", "ultimate\": \"To safeguard the future of her sons and to reclaim or at least maintain a position of power and influence within the Roman dynasty, despite her current setback, ensuring her family's continued prominence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Julia stands resolutely in her chambers, fists pounding against the heavy door, her features contorted in anguish and fury. She is a tempest of emotion, physically asserting her desperation against the barrier that separates her from Livia.',
        ap.emotional_state = 'Julia\'s surface emotions are a blend of rage and desperation as she lashes out at Livia, her voice sharp and accusatory. Internally, she experiences a tumultuous mix of fear and defiance, aware of the stakes at play while combating feelings of vulnerability and impending doom. The unspoken conflict within her revolves around her determination to protect her sons against Livia\'s ambitions.',
        ap.emotional_tags = ["julia's surface emotions are a blend of rage", "desperation as she lashes out at livia, her voice sharp", "accusatory. internally, she experiences a tumultuous mix of fear", "defiance, aware of the stakes at play while combating feelings of vulnerability", "impending doom. the unspoken conflict within her revolves around her determination to protect her sons against livia's ambitions.", "julia's surface emotions are a blend of rage and desperation as she lashes out at livia", "her voice sharp and accusatory. internally", "she experiences a tumultuous mix of fear and defiance", "aware of the stakes at play while combating feelings of vulnerability and impending doom. the unspoken conflict within her revolves around her determination to protect her sons against livia's ambitions.", "julia's surface emotions are a blend of rage and desperation as she lashes out at livia, her voice sharp and accusatory. internally, she experiences a tumultuous mix of fear and defiance, aware of the stakes at play", "combating feelings of vulnerability and impending doom. the unspoken conflict within her revolves around her determination to protect her sons against livia's ambitions."],
        ap.active_plans = ["To confront Livia and make her aware of Julia's knowledge regarding her manipulations.", "To assert her position within the family, demonstrating that her sons are more valuable than Tiberius to the future of the imperial line.", "To rally against the forces seeking to undermine her, hoping to reclaim agency in her own narrative."],
        ap.beliefs = ["That familial loyalty should outweigh ambition, especially in the pursuit of power.", "That she must protect her sons at all costs, even if it means inciting conflict.", "That Livia's machinations are transparent and can be publicly challenged."],
        ap.goals = ["Short-term: To force Livia's recognition of her culpability in Julia's disgrace.", "Medium-term: To undermine Livia's influence over Augustus and secure her sons' futures.", "Ultimate: To reclaim her position and dignity within the imperial family, ensuring her legacy endures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Although Livia is not physically present in the scene, her influence looms large over Julia\'s frenzied accusations. Julia’s fury is directed at her unseen adversary, making Livia\'s presence felt through the weight of her scheming. The door serves as a barrier to Livia’s machinations.',
        ap.emotional_state = 'Livia\'s emotional state is one of calm superiority and calculated indifference, aware of Julia\'s desperation and anger but not shaken by it. Internally, she relishes the turmoil caused by her machinations, viewing Julia\'s outburst as a sign of weakness. Unspoken motivations include a fierce determination to secure Tiberius\'s position and a contempt for Julia\'s perceived threats.',
        ap.emotional_tags = ["livia's emotional state is one of calm superiority", "calculated indifference, aware of julia's desperation", "anger but not shaken by it. internally, she relishes the turmoil caused by her machinations, viewing julia's outburst as a sign of weakness. unspoken motivations include a fierce determination to secure tiberius's position", "a contempt for julia's perceived threats.", "livia's emotional state is one of calm superiority and calculated indifference", "aware of julia's desperation and anger but not shaken by it. internally", "she relishes the turmoil caused by her machinations", "viewing julia's outburst as a sign of weakness. unspoken motivations include a fierce determination to secure tiberius's position and a contempt for julia's perceived threats.", "livia's emotional state is one of calm superiority and calculated indifference, aware of julia's desperation and anger", "not shaken by it. internally, she relishes the turmoil caused by her machinations, viewing julia's outburst as a sign of weakness. unspoken motivations include a fierce determination to secure tiberius's position and a contempt for julia's perceived threats."],
        ap.active_plans = ["To manipulate the perceptions of Augustus regarding Julia's character and loyalty.", "To ensure that Tiberius's return is seen as necessary for the stability of the empire.", "To eliminate Julia as a political threat, solidifying her own family's power."],
        ap.beliefs = ["That ambition must be ruthlessly pursued, often at the expense of familial bonds.", "That Julia's downfall serves a greater purpose for the family and the empire.", "That her power lies in her ability to craft narratives that favor her lineage."],
        ap.goals = ["Short-term: To maintain control over Augustus's decisions regarding Julia's fate.", "Medium-term: To position Tiberius as the rightful heir upon his return from exile.", "Ultimate: To secure her legacy as the architect of the imperial lineage, ensuring her family reigns supreme."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Confined within her chambers, Julia is physically separated from Livia by the heavy door. In a display of raw desperation and fury, she pounds on the door with her fists, each strike echoing her confinement and rage. Her voice, amplified by fury, projects through the door, directly addressing and accusing Livia of orchestrating her downfall. ',
        ap.emotional_state = 'Julia is consumed by a tempest of emotions. Outwardly, her fury is palpable; she screams accusations and threats, her physical violence against the door a testament to her rage. Beneath this surface anger lies deep desperation and fear. She feels betrayed and utterly powerless, recognizing Livia\'s calculated hand in her ruin. There\'s a stark conflict between her explosive external rage and the underlying terror of her now precarious situation and the looming threat of Livia\'s unchecked power.',
        ap.emotional_tags = ["julia is consumed by a tempest of emotions. outwardly, her fury is palpable; she screams accusations", "threats, her physical violence against the door a testament to her rage. beneath this surface anger lies deep desperation", "fear. she feels betrayed", "utterly powerless, recognizing livia's calculated hand in her ruin. there's a stark conflict between her explosive external rage", "the underlying terror of her now precarious situation", "the looming threat of livia's unchecked power.", "julia is consumed by a tempest of emotions. outwardly", "her fury is palpable; she screams accusations and threats", "her physical violence against the door a testament to her rage. beneath this surface anger lies deep desperation and fear. she feels betrayed and utterly powerless", "recognizing livia's calculated hand in her ruin. there's a stark conflict between her explosive external rage and the underlying terror of her now precarious situation and the looming threat of livia's unchecked power.", "julia is consumed by a tempest of emotions. outwardly, her fury is palpable", "she screams accusations and threats, her physical violence against the door a testament to her rage. beneath this surface anger lies deep desperation and fear. she feels betrayed and utterly powerless, recognizing livia's calculated hand in her ruin. there's a stark conflict between her explosive external rage and the underlying terror of her now precarious situation and the looming threat of livia's unchecked power."],
        ap.active_plans = ["To directly confront Livia with accusations of manipulation and treachery, ensuring Livia is fully aware that Julia understands her schemes.", "To assert the future power and dominance of her own sons, explicitly challenging Livia's long-term ambitions and suggesting her eventual irrelevance.", "To deliver a venomous prophecy of Livia's demise, wishing for her death as a final act of defiance and revenge."],
        ap.beliefs = ["Livia is the sole architect of her banishment, driven by a relentless ambition to elevate Tiberius.", "Livia's power is entirely contingent on Augustus's life and will diminish upon his death.", "Her own sons represent a significant future power base that Livia will eventually have to contend with."],
        ap.goals = ["Short-term: To unleash her pent-up rage and frustration directly at Livia, ensuring her accusations are heard and understood.", "Medium-term: To plant seeds of doubt and fear in Livia regarding the future, emphasizing the potential threat of Julia's sons.", "Ultimate: To survive Livia's machinations and ultimately witness the downfall of Livia and the rise of her own lineage, securing revenge and lasting power for her family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Positioned on the other side of the door, Livia remains physically removed from Julia\'s immediate presence, yet is the direct recipient of Julia\'s furious tirade. Her physical actions are not described, but her status is defined by her silent, unseen presence beyond the barrier, absorbing Julia\'s accusations without direct confrontation. She is the intended audience, the unmoved object of Julia\'s passionate outburst.',
        ap.emotional_state = 'Livia maintains a facade of icy composure, likely betraying no outward emotion in response to Julia\'s outburst. Beneath this impassive exterior, she is undoubtedly calculating and assessing the situation. While seemingly indifferent to Julia\'s rage, she likely experiences a cold satisfaction in witnessing Julia\'s predictable descent into fury, confirming her assessment of Julia\'s volatile nature. Her internal state is driven by pragmatic calculation, focused on maintaining control and ensuring her long-term plans for Tiberius\'s succession remain unthreatened by Julia\'s desperate pronouncements.',
        ap.emotional_tags = ["livia maintains a facade of icy composure, likely betraying no outward emotion in response to julia's outburst. beneath this impassive exterior, she is undoubtedly calculating", "assessing the situation. while seemingly indifferent to julia's rage, she likely experiences a cold satisfaction in witnessing julia's predictable descent into fury, confirming her assessment of julia's volatile nature. her internal state is driven by pragmatic calculation, focused on maintaining control", "ensuring her long-term plans for tiberius's succession remain unthreatened by julia's desperate pronouncements.", "livia maintains a facade of icy composure", "likely betraying no outward emotion in response to julia's outburst. beneath this impassive exterior", "she is undoubtedly calculating and assessing the situation. while seemingly indifferent to julia's rage", "she likely experiences a cold satisfaction in witnessing julia's predictable descent into fury", "confirming her assessment of julia's volatile nature. her internal state is driven by pragmatic calculation", "focused on maintaining control and ensuring her long-term plans for tiberius's succession remain unthreatened by julia's desperate pronouncements."],
        ap.active_plans = ["To maintain complete silence and non-engagement, refusing to dignify Julia's accusations with a response and thereby asserting her superior position and control.", "To observe and analyze Julia's emotional state and pronouncements, gathering further insights into Julia's weaknesses and potential future actions.", "To continue focusing on her overarching strategy to secure Tiberius's succession, disregarding Julia's threats as the impotent rage of a defeated opponent."],
        ap.beliefs = ["Julia poses a significant threat to her and Tiberius's ambitions and her banishment is a necessary and justified act of political expediency.", "Emotional outbursts and uncontrolled rage, like Julia's, are signs of weakness and political ineptitude.", "Power is secured and maintained through strategic silence, calculated action, and ruthless pragmatism, not through emotional appeals or familial sentiment."],
        ap.goals = ["Short-term: To remain completely unprovoked by Julia's outburst, denying her any satisfaction of a reaction or engagement.", "Medium-term: To ensure Julia's continued isolation and political neutralization, solidifying her banishment and preventing any potential resurgence of her influence.", "Ultimate: To successfully orchestrate Tiberius's ascension to power and establish her own enduring legacy as the architect of the Julio-Claudian dynasty's continued dominance, securing her own long-term influence and authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Julia stands defiantly in front of Augustus, her posture rigid with pent-up fury. Her hands are clenched into fists, her voice a tempest as she unleashes her pent-up resentment over Lucius\'s banishment, her body language exuding both vulnerability and strength.',
        ap.emotional_state = 'Julia\'s surface emotions are a volatile mix of anger and desperation, her tone passionate and accusatory. Internally, she is tormented by feelings of helplessness and injustice, grappling with the weight of her family\'s tragedies. The conflict between her love for her son and her hatred for Augustus\'s decision creates a palpable tension.',
        ap.emotional_tags = ["julia's surface emotions are a volatile mix of anger", "desperation, her tone passionate", "accusatory. internally, she is tormented by feelings of helplessness", "injustice, grappling with the weight of her family's tragedies. the conflict between her love for her son", "her hatred for augustus's decision creates a palpable tension.", "julia's surface emotions are a volatile mix of anger and desperation", "her tone passionate and accusatory. internally", "she is tormented by feelings of helplessness and injustice", "grappling with the weight of her family's tragedies. the conflict between her love for her son and her hatred for augustus's decision creates a palpable tension."],
        ap.active_plans = ["To confront Augustus about the injustices faced by Lucius and herself.", "To evoke sympathy from Augustus by highlighting the suffering of their family.", "To manipulate Augustus's guilt in order to achieve Lucius's return."],
        ap.beliefs = ["Family bonds should outweigh political ambitions.", "Her son deserves to be treated with dignity, not as a pawn.", "Augustus's decisions are deeply flawed and unjust."],
        ap.goals = ["Short-term: To persuade Augustus to reconsider Lucius's banishment.", "Medium-term: To strengthen her position within the family dynamics.", "Ultimate: To reclaim her family's honor and safeguard her son's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sinks heavily back into his chair, his body language betraying his frailty. His movements are slow, and he appears overwhelmed by Julia\'s passionate outburst, reflecting his internal conflict and emotional turmoil.',
        ap.emotional_state = 'Outwardly, Augustus presents a facade of anger and authority, but internally, he is shaken and fearful, grappling with feelings of guilt and dread over his family\'s disintegration. His repeated assertions of refusal signify a deep struggle between paternal instinct and imperious duty.',
        ap.emotional_tags = ["outwardly, augustus presents a facade of anger", "authority, but internally, he is shaken", "fearful, grappling with feelings of guilt", "dread over his family's disintegration. his repeated assertions of refusal signify a deep struggle between paternal instinct", "imperious duty.", "outwardly", "augustus presents a facade of anger and authority", "but internally", "he is shaken and fearful", "grappling with feelings of guilt and dread over his family's disintegration. his repeated assertions of refusal signify a deep struggle between paternal instinct and imperious duty.", "outwardly, augustus presents a facade of anger and authority,", "internally, he is shaken and fearful, grappling with feelings of guilt and dread over his family's disintegration. his repeated assertions of refusal signify a deep struggle between paternal instinct and imperious duty."],
        ap.active_plans = ["To maintain his stance on Lucius's banishment as a matter of principle.", "To assert his authority and control over the family narrative.", "To protect his own legacy from the implications of familial scandal."],
        ap.beliefs = ["Maintaining order within the family is essential for the stability of the empire.", "Banishment is a necessary punishment for betrayal.", "His decisions, though harsh, are ultimately for the greater good of Rome."],
        ap.goals = ["Short-term: To quell Julia's outrage and reaffirm his control over the situation.", "Medium-term: To distance himself from Lucius's fate to protect his own image.", "Ultimate: To ensure the empire remains intact despite familial upheaval."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Livia remains poised and composed, her posture regal and unyielding as she observes the confrontation between Julia and Augustus. Her demeanor is cool and calculating, suggesting she is entirely unfazed by the emotional turmoil around her.',
        ap.emotional_state = 'Livia\'s surface emotions are calm and collected, exuding confidence and authority. Internally, her thoughts are likely machinations for future moves in the political game, as she harbors a smoldering desire to manipulate the situation to her advantage. She is both an observer and a potential catalyst for conflict.',
        ap.emotional_tags = ["livia's surface emotions are calm", "collected, exuding confidence", "authority. internally, her thoughts are likely machinations for future moves in the political game, as she harbors a smoldering desire to manipulate the situation to her advantage. she is both an observer", "a potential catalyst for conflict.", "livia's surface emotions are calm and collected", "exuding confidence and authority. internally", "her thoughts are likely machinations for future moves in the political game", "as she harbors a smoldering desire to manipulate the situation to her advantage. she is both an observer and a potential catalyst for conflict."],
        ap.active_plans = ["To subtly support Augustus's decisions while steering the narrative away from her own son\u2019s culpability.", "To position herself as the voice of reason, advocating for Tiberius's return.", "To exploit Julia's emotional state for her own strategic ends."],
        ap.beliefs = ["The survival of her family\u2019s legacy is paramount above all else.", "Emotions are tools to be wielded in the game of power.", "Manipulation is essential for maintaining control over her son and the dynasty."],
        ap.goals = ["Short-term: To reinforce Augustus's authority in the moment.", "Medium-term: To navigate the fallout of the current scandal while preparing for Tiberius's eventual return.", "Ultimate: To secure her family's power and eliminate threats to their legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Augustus, seated heavily in his imperial chair, appears physically diminished, his body language conveying defeat. He leans back, almost collapsing into the throne, his posture reflecting the emotional weight crushing him. His primary action is verbal, a vehement outburst directed at Livia, punctuated by emphatic pronouncements and repeated denials, though his physical presence is one of a ruler losing his grip.',
        ap.emotional_state = 'Augustus is a tempest of raw, conflicting emotions. Outwardly, he explodes in anger and resolute denial, his voice booming with imperial authority as he rejects Livia\'s suggestion. However, beneath this surface rage lies a profound anguish and despair. He feels cursed and personally wounded by recent family catastrophes, revealing a deep-seated grief and a sense of helplessness.  He is torn between his fury at Julia and a persistent, perhaps manipulated, resentment towards Tiberius, revealing a complex inner turmoil where personal pain battles against political pragmatism.',
        ap.emotional_tags = ["augustus is a tempest of raw, conflicting emotions. outwardly, he explodes in anger", "resolute denial, his voice booming with imperial authority as he rejects livia's suggestion. however, beneath this surface rage lies a profound anguish", "despair. he feels cursed", "personally wounded by recent family catastrophes, revealing a deep-seated grief", "a sense of helplessness.  he is torn between his fury at julia", "a persistent, perhaps manipulated, resentment towards tiberius, revealing a complex inner turmoil where personal pain battles against political pragmatism.", "augustus is a tempest of raw", "conflicting emotions. outwardly", "he explodes in anger and resolute denial", "his voice booming with imperial authority as he rejects livia's suggestion. however", "beneath this surface rage lies a profound anguish and despair. he feels cursed and personally wounded by recent family catastrophes", "revealing a deep-seated grief and a sense of helplessness.  he is torn between his fury at julia and a persistent", "perhaps manipulated", "resentment towards tiberius", "revealing a complex inner turmoil where personal pain battles against political pragmatism."],
        ap.active_plans = ["To forcefully reject Livia's suggestion to recall Tiberius, ensuring his exiled son remains banished.", "To reassert his authority as Emperor through a definitive and unwavering decree, despite his inner turmoil.", "To deflect blame from himself and Livia by fixating on Lucius as the instigator of Julia's downfall, avoiding deeper self-reflection or acknowledgement of his own role in the family's dysfunction."],
        ap.beliefs = ["He believes deeply in the concept of divine justice and punishment, feeling personally cursed by the gods for some unknown transgression.", "He firmly believes that Tiberius is fundamentally responsible for Julia's scandalous behavior and the resulting family disgrace, possibly influenced by Livia's manipulations.", "He holds an unwavering conviction in the absolute power of his imperial will and decrees, believing his pronouncements are final and unchangeable, even when driven by emotion rather than reason."],
        ap.goals = ["Short-term Goal: To immediately and unequivocally shut down Livia's request, asserting his dominance in the conversation and ending her line of reasoning.", "Medium-term Goal: To maintain the facade of a strong, decisive emperor, projecting an image of control despite his internal emotional chaos and the crumbling state of his family.", "Ultimate Goal: To preserve his legacy and the stability of Rome, though his current emotional outburst and reactive decision-making may paradoxically undermine this long-term objective by preventing potentially necessary political maneuvers."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ship_event_13_1'})
    ON CREATE SET
        oi.description = 'The ship arriving in the harbor serves as the focal point of Tiberius and Thrasyllus\'s conversation. It represents the potential for shifting fortunes, carrying letters and news from Rome that could significantly alter Tiberius\'s status. The mere sight of the ship ignites hope and dread, as its cargo holds the weight of destiny.',
        oi.status_before = 'The ship is en route from Rome, filled with anticipated dispatches and letters, and is seen approaching the harbor with the promise of important news.',
        oi.status_after = 'The ship has docked, its presence confirmed, and Tiberius eagerly awaits the arrival of the courier with dispatches, indicating a shift towards impending revelations that could affect his exile.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ship'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_thrasyllus_horoscope_event_13_1'})
    ON CREATE SET
        oi.description = 'Thrasyllus\'s horoscope is used as a tool for intimidation by Tiberius, who pretends to read it to reflect upon Thrasyllus\'s fate. The horoscope serves more as a prop in a game of psychological manipulation, amplifying the scene\'s tension as Tiberius humorously threatens Thrasyllus based on its predictions.',
        oi.status_before = 'The horoscope is complete and ready for interpretation, held by Thrasyllus as he engages in conversation with Tiberius about its meanings.',
        oi.status_after = 'The horoscope remains a source of threat and humor, having reinforced Tiberius\'s control over Thrasyllus, leaving its actual astrological insights overshadowed by the looming threat of Tiberius\'s intentions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_thrasyllus_horoscope'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_letters_event_13_1'})
    ON CREATE SET
        oi.description = 'The letters carried by the ship are the crux of the event, representing the potential for new developments in Tiberius\'s life. They are anticipated with both hope and dread, as they contain news that could shift the balance of power for Tiberius, heralding either opportunity or disaster.',
        oi.status_before = 'The letters are yet to be delivered, circulating between the ship and Tiberius\'s anticipation on the terrace, their contents unknown but highly significant.',
        oi.status_after = 'The letters are now in the possession of Tiberius, revealing the shocking news of Lucius\'s death, thereby marking a pivotal moment that propels Tiberius back into the political fray of Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_letters'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_thrasyllus_horoscope_event_13_2'})
    ON CREATE SET
        oi.description = 'Thrasyllus\'s horoscope is presented by Tiberius as the central focus of the scene, though it is revealed to be a prop in Tiberius\'s cruel manipulation. Tiberius pretends to scrutinize it, claiming it foretells Thrasyllus\'s imminent doom if the news from Rome is unfavorable. The horoscope becomes a symbol of Thrasyllus\'s precarious existence, wielded by Tiberius as a tool of psychological torture and a means to assert his absolute power over the astrologer. It serves as a focal point for the power dynamic between the two men, embodying the life-or-death stakes of their interaction.',
        oi.status_before = 'The horoscope exists as Thrasyllus\'s professional tool, presumably prepared by him and believed (at least by Thrasyllus) to hold genuine astrological significance and predictive power. It represents his livelihood and his perceived value to Tiberius as an astrologer.',
        oi.status_after = 'The horoscope\'s status is fundamentally altered; it is exposed as a mere instrument of intimidation, devoid of any real predictive value in Tiberius\'s eyes. It becomes a symbol of Thrasyllus\'s vulnerability and the capricious nature of Tiberius\'s power, its purpose shifted from divination to manipulation and control. Its value as a tool of genuine insight is undermined, replaced by its function as a prop in Tiberius\'s power play.'
    WITH oi
    MATCH (o:Object {uuid: 'object_thrasyllus_horoscope'})
    MATCH (e:Event {uuid: 'event_13_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_imperial_dispatches_event_13_3'})
    ON CREATE SET
        oi.description = 'The imperial dispatches represent a pivotal moment in the scene, as they arrive bearing significant news from Augustus Caesar. Their introduction shifts the focus from personal threats between Tiberius and Thrasyllus to the far-reaching implications of Lucius\'s death and Tiberius\'s subsequent return to Rome, altering the entire dynamic of power.',
        oi.status_before = 'Prior to the event, the dispatches were en route from Rome, their contents unknown but laden with potential significance for Tiberius.',
        oi.status_after = 'After the event, the dispatches are revealed to contain news of Lucius\'s death, marking a profound turning point for Tiberius, indicating his impending return to power and signaling a shift in the political landscape of Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_imperial_dispatches'})
    MATCH (e:Event {uuid: 'event_13_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_imperial_dispatches_event_13_4'})
    ON CREATE SET
        oi.description = 'The Imperial Dispatches, sealed and official, are the physical embodiment of Augustus\'s imperial will reaching Tiberius in exile. Delivered by the Courier, they are the sole source of the momentous news that dramatically reshapes Tiberius\'s destiny. Tiberius reads the scroll, and the stark words within – \'Lucius is dead. I am to return to Rome\' – act as a catalyst, unleashing a torrent of complex emotions and triggering a pivotal shift in the narrative. The dispatches are not merely pieces of parchment; they are the instrument of fate, conveying life-altering information that propels Tiberius from exile back into the heart of Roman power.',
        oi.status_before = 'The Imperial Dispatches are en route from Rome to Rhodes, held by the Courier, carrying vital and as-yet-undisclosed information from Emperor Augustus to Tiberius. They represent the authority of Rome and the potential for significant change in Tiberius\'s exiled life, though their specific contents remain unknown until delivered.',
        oi.status_after = 'Having been delivered and read by Tiberius, the Imperial Dispatches have served their primary function of conveying critical information. They are now discarded, their physical form becoming insignificant compared to the seismic shift in Tiberius\'s destiny that their contents have initiated. The dispatches have become a symbol of the abrupt and dramatic turning point in Tiberius\'s life, marking the end of his exile and the beginning of his return to Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_imperial_dispatches'})
    MATCH (e:Event {uuid: 'event_13_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus stands nervously beside Tiberius on the sunlit terrace, his anxious eyes darting from the ship arriving in the harbor to Tiberius, attempting to maintain an air of optimism. He adjusts his toga repeatedly, betraying his anxiety about the implications of the ship\'s arrival.',
        ap.emotional_state = 'Thrasyllus exhibits a facade of hopefulness, trying to reassure Tiberius that the arriving ship will bring good news. However, beneath this veneer, he is deeply anxious and fearful of Tiberius\'s wrath, especially as Tiberius humorously threatens his life based on the horoscope.',
        ap.emotional_tags = ["thrasyllus exhibits a facade of hopefulness, trying to reassure tiberius that the arriving ship will bring good news. however, beneath this veneer, he is deeply anxious", "fearful of tiberius's wrath, especially as tiberius humorously threatens his life based on the horoscope.", "thrasyllus exhibits a facade of hopefulness", "trying to reassure tiberius that the arriving ship will bring good news. however", "beneath this veneer", "he is deeply anxious and fearful of tiberius's wrath", "especially as tiberius humorously threatens his life based on the horoscope."],
        ap.active_plans = ["To convince Tiberius that the ship from Rome will bring favorable news that could benefit him.", "To interpret his horoscope in a way that aligns with Tiberius's desires, hoping to win favor and secure his own position.", "To deflect Tiberius's threats humorously while subtly seeking to protect himself from potential danger."],
        ap.beliefs = ["A strong belief in astrology and its power to predict outcomes, hoping to leverage it for his advantage.", "A conviction that aligning with Tiberius's ambitions will ensure his own survival and relevance.", "An underlying fear that Tiberius's dissatisfaction may lead to his demise, thus fostering his anxious demeanor."],
        ap.goals = ["Short-term: To calm Tiberius and convince him of the favorable news from Rome.", "Medium-term: To maintain his role as Tiberius's advisor and avoid being cast aside or harmed.", "Ultimate: To ensure his own safety and prosperity within the treacherous political landscape of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands sternly on the terrace, observing the ship with a calculating gaze. His body language is tense, and he displays a commanding presence as he engages in a darkly humorous exchange with Thrasyllus, subtly asserting control over the conversation.',
        ap.emotional_state = 'Tiberius presents a facade of indifference and dark humor, masking a tempest of emotions beneath. He revels in the power he holds over Thrasyllus while grappling with his own anxieties about the implications of the ship\'s arrival and what it may mean for his future.',
        ap.emotional_tags = ["tiberius presents a facade of indifference", "dark humor, masking a tempest of emotions beneath. he revels in the power he holds over thrasyllus while grappling with his own anxieties about the implications of the ship's arrival", "what it may mean for his future.", "tiberius presents a facade of indifference and dark humor", "masking a tempest of emotions beneath. he revels in the power he holds over thrasyllus while grappling with his own anxieties about the implications of the ship's arrival and what it may mean for his future.", "tiberius presents a facade of indifference and dark humor, masking a tempest of emotions beneath. he revels in the power he holds over thrasyllus", "grappling with his own anxieties about the implications of the ship's arrival and what it may mean for his future."],
        ap.active_plans = ["To ascertain the contents of the letters arriving from Rome, which may significantly impact his ambitions.", "To exert psychological dominance over Thrasyllus, using humor and veiled threats to remind him of his precarious position.", "To prepare for his potential return to power in Rome, depending on the news contained in the dispatches."],
        ap.beliefs = ["A firm belief in his own destiny and rightful place within the imperial hierarchy, driving his ambitions.", "A conviction that power can be wielded through intimidation and manipulation of those around him.", "A growing realization that he is at the mercy of the unfolding events from Rome, despite his efforts to maintain control."],
        ap.goals = ["Short-term: To learn the news from the ship and determine how it affects his plans.", "Medium-term: To leverage the information from the dispatches to reclaim his position in Rome.", "Ultimate: To dismantle any obstacles to his power and secure his place as the ruler of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus stands on the sunlit terrace with Tiberius, initially attempting to appear composed but quickly unraveling as Tiberius reveals the deadly game. He gesticulates nervously, adjusting his toga and darting his eyes towards the cliff edge, a physical manifestation of his rising panic. He tries to deflect Tiberius\'s threats with forced laughter and desperate appeals to astrology, clinging to any hope of survival.',
        ap.emotional_state = 'On the surface, Thrasyllus feigns amusement and attempts to maintain a jovial tone, but beneath this facade lies profound terror. His forced laughter and strained jokes thinly veil his desperate fear for his life. Internally, he is consumed by anxiety and a desperate need to appease Tiberius. He is caught in a terrifying emotional bind, knowing any wrong word or gesture could be his last, his opportunistic nature now turning against him as his flattery fails to sway the ruthless prince.',
        ap.emotional_tags = ["on the surface, thrasyllus feigns amusement", "attempts to maintain a jovial tone, but beneath this facade lies profound terror. his forced laughter", "strained jokes thinly veil his desperate fear for his life. internally, he is consumed by anxiety", "a desperate need to appease tiberius. he is caught in a terrifying emotional bind, knowing any wrong word or gesture could be his last, his opportunistic nature now turning against him as his flattery fails to sway the ruthless prince.", "on the surface", "thrasyllus feigns amusement and attempts to maintain a jovial tone", "but beneath this facade lies profound terror. his forced laughter and strained jokes thinly veil his desperate fear for his life. internally", "he is consumed by anxiety and a desperate need to appease tiberius. he is caught in a terrifying emotional bind", "knowing any wrong word or gesture could be his last", "his opportunistic nature now turning against him as his flattery fails to sway the ruthless prince.", "on the surface, thrasyllus feigns amusement and attempts to maintain a jovial tone,", "beneath this facade lies profound terror. his forced laughter and strained jokes thinly veil his desperate fear for his life. internally, he is consumed by anxiety and a desperate need to appease tiberius. he is caught in a terrifying emotional bind, knowing any wrong word or gesture could be his last, his opportunistic nature now turning against him as his flattery fails to sway the ruthless prince."],
        ap.active_plans = ["Attempt to deflect Tiberius's threat through forced humor and denial.", "Argue for the unreliability of horoscopes when it suits his survival.", "Invent positive omens (the eagle) to suggest good news and appease Tiberius.", "Plead to examine the horoscope himself, hoping to manipulate the situation."],
        ap.beliefs = ["Astrology can be manipulated and interpreted to fit desired outcomes.", "Flattery and subservience are his best tools for survival in a dangerous court.", "Tiberius is capricious and capable of extreme cruelty.", "His own life is entirely dependent on Tiberius's whims."],
        ap.goals = ["Short-term: To survive the immediate threat of being thrown off the cliff.", "Medium-term: To regain Tiberius's favor and ensure his continued employment.", "Ultimate: To maintain his position and influence, securing his own safety and comfort within Tiberius's circle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius dominates the scene with a chillingly calm demeanor, observing Thrasyllus with predatory amusement. He stands tall on the terrace, gazing out at the harbor, his posture conveying absolute control. He reveals his manipulation of Thrasyllus’s horoscope with deliberate cruelty, relishing the astrologer’s mounting fear. Even his laughter is unsettling, devoid of warmth and dripping with dark satisfaction.',
        ap.emotional_state = 'Tiberius outwardly projects an air of cold amusement and detached control, but internally he is experiencing a surge of ruthless satisfaction. He savors his power over Thrasyllus, enjoying the astrologer\'s terror as a form of entertainment. Beneath the surface, there\'s a simmering anticipation for the news from Rome, a controlled excitement masked by his cruel game. He feels vindicated in his resentment and empowered by the ability to toy with another\'s life, showcasing a deep-seated ruthlessness born from his exile and past injustices.',
        ap.emotional_tags = ["tiberius outwardly projects an air of cold amusement", "detached control, but internally he is experiencing a surge of ruthless satisfaction. he savors his power over thrasyllus, enjoying the astrologer's terror as a form of entertainment. beneath the surface, there's a simmering anticipation for the news from rome, a controlled excitement masked by his cruel game. he feels vindicated in his resentment", "empowered by the ability to toy with another's life, showcasing a deep-seated ruthlessness born from his exile", "past injustices.", "tiberius outwardly projects an air of cold amusement and detached control", "but internally he is experiencing a surge of ruthless satisfaction. he savors his power over thrasyllus", "enjoying the astrologer's terror as a form of entertainment. beneath the surface", "there's a simmering anticipation for the news from rome", "a controlled excitement masked by his cruel game. he feels vindicated in his resentment and empowered by the ability to toy with another's life", "showcasing a deep-seated ruthlessness born from his exile and past injustices.", "tiberius outwardly projects an air of cold amusement and detached control,", "internally he is experiencing a surge of ruthless satisfaction. he savors his power over thrasyllus, enjoying the astrologer's terror as a form of entertainment. beneath the surface, there's a simmering anticipation for the news from rome, a controlled excitement masked by his cruel game. he feels vindicated in his resentment and empowered by the ability to toy with another's life, showcasing a deep-seated ruthlessness born from his exile and past injustices."],
        ap.active_plans = ["Intimidate and terrorize Thrasyllus for his own amusement and to assert dominance.", "Test Thrasyllus's loyalty and fear through a life-or-death threat.", "Await the arrival of news from Rome with an outward show of indifference but inner anticipation.", "Reaffirm his power and control over those around him, using fear as a tool."],
        ap.beliefs = ["Fear is the most effective tool for maintaining control.", "Astrologers are easily manipulated and their predictions are inconsequential.", "He is entitled to exercise power ruthlessly due to his imperial status and past suffering.", "Human life has little value when weighed against his own ambitions and desires."],
        ap.goals = ["Short-term: To derive amusement from Thrasyllus's fear and reinforce his own sense of power.", "Medium-term: To receive and assess the news from Rome, understanding its implications for his future.", "Ultimate: To return to Rome and reclaim his rightful place, securing ultimate power and ending his exile."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Thasyllus stands nervously before Tiberius, adjusting his toga as he tries to maintain composure, but his anxious demeanor suggests a palpable fear of impending doom. He is physically positioned in a way that indicates his desire to escape Tiberius\'s intense gaze, making small gestures that betray his anxiety.',
        ap.emotional_state = 'Thasyllus exhibits surface-level nervousness, evidenced by his fidgeting and forced laughter, yet internally he is a tempest of anxiety and desperation. His attempts to remain optimistic clash with his fear of Tiberius\'s wrath, revealing a profound internal conflict between self-preservation and loyalty.',
        ap.emotional_tags = ["thasyllus exhibits surface-level nervousness, evidenced by his fidgeting", "forced laughter, yet internally he is a tempest of anxiety", "desperation. his attempts to remain optimistic clash with his fear of tiberius's wrath, revealing a profound internal conflict between self-preservation", "loyalty.", "thasyllus exhibits surface-level nervousness", "evidenced by his fidgeting and forced laughter", "yet internally he is a tempest of anxiety and desperation. his attempts to remain optimistic clash with his fear of tiberius's wrath", "revealing a profound internal conflict between self-preservation and loyalty."],
        ap.active_plans = ["To deflect Tiberius's grim humor with flattery and optimism.", "To convince Tiberius that the upcoming news from Rome will be beneficial.", "To secure his own safety amidst Tiberius's menacing threats."],
        ap.beliefs = ["Astrological interpretations hold power and can influence fate.", "Maintaining favor with Tiberius is crucial for his own survival.", "Good news is imminent, as indicated by the arrival of the ship."],
        ap.goals = ["Short-term: Alleviate Tiberius's anger and avoid punishment.", "Medium-term: Leverage the anticipated news from Rome to improve his standing.", "Ultimate: Ensure survival and continued relevance in Tiberius's court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands tall and imposing, casting a long shadow on the terrace as he engages with Thrasyllus. His stern posture and calculating expressions emphasize his control over the situation, even as he toys with Thrasyllus\'s fate with a menacing sense of amusement.',
        ap.emotional_state = 'Tiberius exudes confidence and dark amusement, masking a deeper, simmering rage beneath the surface. His laughter, while seemingly light-hearted, carries a chilling edge, revealing his enjoyment in wielding power over Thrasyllus while grappling with his own ambition and resentment towards the events unfolding.',
        ap.emotional_tags = ["tiberius exudes confidence", "dark amusement, masking a deeper, simmering rage beneath the surface. his laughter, while seemingly light-hearted, carries a chilling edge, revealing his enjoyment in wielding power over thrasyllus while grappling with his own ambition", "resentment towards the events unfolding.", "tiberius exudes confidence and dark amusement", "masking a deeper", "simmering rage beneath the surface. his laughter", "while seemingly light-hearted", "carries a chilling edge", "revealing his enjoyment in wielding power over thrasyllus while grappling with his own ambition and resentment towards the events unfolding.", "tiberius exudes confidence and dark amusement, masking a deeper, simmering rage beneath the surface. his laughter,", "seemingly light-hearted, carries a chilling edge, revealing his enjoyment in wielding power over thrasyllus", "grappling with his own ambition and resentment towards the events unfolding."],
        ap.active_plans = ["To intimidate Thrasyllus while maintaining a facade of humor.", "To assess the news from the imperial dispatch as a potential turning point in his circumstances.", "To prepare for his impending return to Rome and the opportunities it may bring."],
        ap.beliefs = ["Fate is fickle, and those who flatter often have ulterior motives.", "Power is best wielded through fear and manipulation.", "The arrival of news from Rome could alter his current state of exile."],
        ap.goals = ["Short-term: Establish dominance over Thrasyllus and assert control.", "Medium-term: Use the news from Rome to reclaim his position and influence.", "Ultimate: Secure his legacy and authority as the rightful heir to the imperial throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sentor_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Sentor stands quietly behind Thrasyllus, his burly presence a stark reminder of Tiberius\'s authority. He remains vigilant, ready to act on Tiberius\'s command, embodying the silent enforcer of the prince’s will, his posture resolute and unyielding.',
        ap.emotional_state = 'Sentor\'s demeanor is one of dutiful loyalty, reflecting a calm certainty in the face of potential chaos. While he does not share his thoughts, his body language suggests readiness to execute Tiberius’s orders without hesitation, fully aware of the gravity of the situation.',
        ap.emotional_tags = ["sentor's demeanor is one of dutiful loyalty", "reflecting a calm certainty in the face of potential chaos. while he does not share his thoughts", "his body language suggests readiness to execute tiberius\u2019s orders without hesitation", "fully aware of the gravity of the situation."],
        ap.active_plans = ["To stand ready to carry out Tiberius's commands.", "To ensure Thrasyllus remains aware of the consequences of Tiberius's whims.", "To guard against any potential threats to Tiberius\u2019s authority."],
        ap.beliefs = ["Loyalty to Tiberius is paramount for survival and stability.", "The whims of the powerful must be respected and executed without question.", "A firm hand is necessary to maintain order and discipline."],
        ap.goals = ["Short-term: Maintain order and protect Tiberius from perceived threats.", "Medium-term: Ensure Tiberius\u2019s decisions are carried out efficiently.", "Ultimate: Uphold the authority of Tiberius and secure his own position of trust."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_4'})
    ON CREATE SET
        ap.current_status = 'The Courier bursts onto the terrace, breathless from his journey and bows deeply before Tiberius, maintaining a respectful posture throughout the encounter. He stands rigidly as he delivers the imperial dispatch and recounts the tragic news of Lucius\'s death, his tone formal and devoid of personal emotion, focused solely on conveying the message accurately and efficiently as per his duty.',
        ap.emotional_state = 'On the surface, the Courier presents a professional demeanor, exhibiting dutiful respect and adherence to protocol. However, beneath this facade, there\'s a subtle bewilderment and perhaps unease at Tiberius\'s unexpected and unsettling laughter in response to tragic news. He remains outwardly composed, but internally, he might be processing the strangeness of Tiberius\'s reaction to the grim tidings he delivers.',
        ap.emotional_tags = ["on the surface, the courier presents a professional demeanor, exhibiting dutiful respect", "adherence to protocol. however, beneath this facade, there's a subtle bewilderment", "perhaps unease at tiberius's unexpected", "unsettling laughter in response to tragic news. he remains outwardly composed, but internally, he might be processing the strangeness of tiberius's reaction to the grim tidings he delivers.", "on the surface", "the courier presents a professional demeanor", "exhibiting dutiful respect and adherence to protocol. however", "beneath this facade", "there's a subtle bewilderment and perhaps unease at tiberius's unexpected and unsettling laughter in response to tragic news. he remains outwardly composed", "but internally", "he might be processing the strangeness of tiberius's reaction to the grim tidings he delivers.", "on the surface, the courier presents a professional demeanor, exhibiting dutiful respect and adherence to protocol. however, beneath this facade, there's a subtle bewilderment and perhaps unease at tiberius's unexpected and unsettling laughter in response to tragic news. he remains outwardly composed,", "internally, he might be processing the strangeness of tiberius's reaction to the grim tidings he delivers."],
        ap.active_plans = ["To deliver the imperial dispatch from Augustus Caesar to Tiberius.", "To accurately convey the news of Lucius Caesar's death and the circumstances surrounding it.", "To maintain professional decorum and respect for Tiberius, despite the unexpected reaction."],
        ap.beliefs = ["Loyalty and obedience to the Emperor are paramount.", "Official imperial messages must be delivered with utmost fidelity and respect.", "Maintaining composure and professionalism is essential, regardless of personal feelings or unusual circumstances."],
        ap.goals = ["Short-term: Successfully deliver the dispatch and communicate its contents to Tiberius.", "Medium-term: Fulfill his duty as a courier and return to Rome with confirmation of delivery.", "Ultimate: Serve the Roman Empire faithfully and efficiently in his role as a messenger."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius initially stands observing the approaching ship, projecting an outward calm while subtly testing Thrasyllus’s anxieties. Upon receiving the dispatch, he reads it with a stone-faced expression, momentarily stunned by the news. This gives way to manic, unsettling laughter as the reality of Lucius\'s death and his recall to Rome sinks in. He questions the courier for details, his laughter punctuating his morbid curiosity, and finally declares his return to Rome, masking his elation with dark humor.',
        ap.emotional_state = 'Beneath a veneer of sardonic composure, Tiberius is a tempest of conflicting emotions. Initially, he is anxious and impatient for news, masking it with cruel games aimed at Thrasyllus. Upon hearing of Lucius’s death and his recall, he experiences a potent mix of disbelief, vindication, and overwhelming elation, bordering on mania. This manic joy is a release of years of pent-up resentment and ambition, yet tinged with a chilling detachment from the tragedy itself, revealing a man hardened and perhaps warped by exile and injustice.',
        ap.emotional_tags = ["beneath a veneer of sardonic composure, tiberius is a tempest of conflicting emotions. initially, he is anxious", "impatient for news, masking it with cruel games aimed at thrasyllus. upon hearing of lucius\u2019s death", "his recall, he experiences a potent mix of disbelief, vindication,", "overwhelming elation, bordering on mania. this manic joy is a release of years of pent-up resentment", "ambition, yet tinged with a chilling detachment from the tragedy itself, revealing a man hardened", "perhaps warped by exile", "injustice.", "beneath a veneer of sardonic composure", "tiberius is a tempest of conflicting emotions. initially", "he is anxious and impatient for news", "masking it with cruel games aimed at thrasyllus. upon hearing of lucius\u2019s death and his recall", "he experiences a potent mix of disbelief", "vindication", "and overwhelming elation", "bordering on mania. this manic joy is a release of years of pent-up resentment and ambition", "yet tinged with a chilling detachment from the tragedy itself", "revealing a man hardened and perhaps warped by exile and injustice."],
        ap.active_plans = ["To ascertain the news from Rome and understand its implications for his own fate.", "To assert his dominance over Thrasyllus by toying with his fears and perceived prophecies.", "To process the shocking news of Lucius's death and his unexpected recall to Rome, and formulate his next steps."],
        ap.beliefs = ["Fate and destiny are forces to be reckoned with, and he might be finally favored by them.", "Power is his birthright, unjustly denied, and he is entitled to reclaim it.", "Exile is a profound injustice, and his return to Rome signifies a correction of that wrong.", "Emotional control is a sign of strength, even amidst extreme circumstances."],
        ap.goals = ["Short-term: Return to Rome and assess the changed political landscape.", "Medium-term: Re-establish himself in Roman society and regain his lost influence and power.", "Ultimate: Become the Emperor of Rome, fulfilling what he believes is his destiny and exacting revenge on those who wronged him, including his family and fate itself."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus anxiously hovers near Tiberius, his gaze darting nervously between the approaching ship and the prince\'s stern face. He attempts to reassure Tiberius with hopeful pronouncements about horoscopes and omens, his tone laced with desperation. When threatened with being thrown off the cliff, he visibly pales and stammers, his attempts at humor falling flat. He remains bewildered and relieved in turns as the scene unfolds, struggling to grasp Tiberius\'s shifting moods.',
        ap.emotional_state = 'Thrasyllus is consumed by anxiety and fear for his own safety, his opportunism overshadowed by genuine terror. He outwardly attempts to appear confident in his astrological predictions, but his nervousness betrays his inner turmoil. He is desperate to appease Tiberius and avoid his wrath, his emotions swinging wildly between hope for good news and dread of impending doom.  Beneath the surface, he is purely driven by self-preservation and a desperate desire to regain Tiberius\'s favor after his inaccurate predictions.',
        ap.emotional_tags = ["thrasyllus is consumed by anxiety", "fear for his own safety, his opportunism overshadowed by genuine terror. he outwardly attempts to appear confident in his astrological predictions, but his nervousness betrays his inner turmoil. he is desperate to appease tiberius", "avoid his wrath, his emotions swinging wildly between hope for good news", "dread of impending doom.  beneath the surface, he is purely driven by self-preservation", "a desperate desire to regain tiberius's favor after his inaccurate predictions.", "thrasyllus is consumed by anxiety and fear for his own safety", "his opportunism overshadowed by genuine terror. he outwardly attempts to appear confident in his astrological predictions", "but his nervousness betrays his inner turmoil. he is desperate to appease tiberius and avoid his wrath", "his emotions swinging wildly between hope for good news and dread of impending doom.  beneath the surface", "he is purely driven by self-preservation and a desperate desire to regain tiberius's favor after his inaccurate predictions.", "thrasyllus is consumed by anxiety and fear for his own safety, his opportunism overshadowed by genuine terror. he outwardly attempts to appear confident in his astrological predictions,", "his nervousness betrays his inner turmoil. he is desperate to appease tiberius and avoid his wrath, his emotions swinging wildly between hope for good news and dread of impending doom.  beneath the surface, he is purely driven by self-preservation and a desperate desire to regain tiberius's favor after his inaccurate predictions."],
        ap.active_plans = ["To interpret any incoming news as favorable to Tiberius, regardless of its actual content.", "To placate Tiberius and avoid being punished for his recent inaccurate astrological readings.", "To observe Tiberius\u2019s reactions closely and adapt his behavior to ensure his own survival and continued employment."],
        ap.beliefs = ["Astrology is a powerful tool, but its interpretation is subjective and can be manipulated to please powerful figures.", "Tiberius is capricious and dangerous, capable of extreme cruelty on a whim.", "Survival depends on maintaining Tiberius's favor, even if it requires dishonesty and flattery.", "Good fortune can be influenced or at least predicted by celestial signs, though these are often unreliable."],
        ap.goals = ["Short-term: Avoid being thrown off the cliff and survive Tiberius's immediate anger.", "Medium-term: Re-establish himself as a valuable asset to Tiberius by aligning his predictions with Tiberius's desires.", "Ultimate: Secure long-term security and prosperity by remaining in the service of powerful patrons, navigating their unpredictable whims through strategic flattery and opportunistic readings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands on the terrace, a stern figure cloaked in sunlight, his posture rigid but eyes keen, absorbing the arrival of a ship in the harbor. His demeanor shifts from calculating to manic as he processes the news of Lucius\'s death, erupting into unsettling laughter that echoes across the terrace.',
        ap.emotional_state = 'Tiberius oscillates between a façade of calm confidence and manic amusement, reflecting a complex internal struggle. His laughter feels hollow, masking a deeper rage and resentment over his past and the absurdity of Lucius\'s fate, revealing a fractured psyche wrestling with both ambition and loss.',
        ap.emotional_tags = ["tiberius oscillates between a fa\u00e7ade of calm confidence", "manic amusement, reflecting a complex internal struggle. his laughter feels hollow, masking a deeper rage", "resentment over his past", "the absurdity of lucius's fate, revealing a fractured psyche wrestling with both ambition", "loss.", "tiberius oscillates between a fa\u00e7ade of calm confidence and manic amusement", "reflecting a complex internal struggle. his laughter feels hollow", "masking a deeper rage and resentment over his past and the absurdity of lucius's fate", "revealing a fractured psyche wrestling with both ambition and loss."],
        ap.active_plans = ["To assert his dominance and manipulate Thrasyllus by pretending to read his horoscope.", "To derive amusement from the tragic news of Lucius, flipping the narrative of loss into one of opportunity.", "To prepare for his return to Rome, seizing the moment as a chance to reclaim power."],
        ap.beliefs = ["The unpredictability of fate often opens new avenues for power.", "He believes that manipulating those around him will assert his control over his own narrative.", "His mother's machinations have left him with a distrust of omens and prophecies."],
        ap.goals = ["Short-term: Amuse himself at Thrasyllus's expense while awaiting news from Rome.", "Medium-term: Use Lucius's death as a catalyst to return to power in Rome.", "Ultimate: Overcome his exile and reclaim his rightful place in Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_5'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus stands nervously beside Tiberius, visibly anxious as he clutches his toga. His demeanor is jittery and subservient, shifting as Tiberius teases him about his horoscope, an uneasy mix of fear and opportunism swirling in his posture as he attempts to avoid the threat of being sent to his doom.',
        ap.emotional_state = 'Thrasyllus is wrapped in layers of anxiety and tension, feeling the weight of impending doom as he vies for Tiberius\'s favor. His nervousness is palpable as he tries to deflect Tiberius\'s mockery, embodying a mixture of desperation to please and fear of the consequences if he fails.',
        ap.emotional_tags = ["thrasyllus is wrapped in layers of anxiety", "tension, feeling the weight of impending doom as he vies for tiberius's favor. his nervousness is palpable as he tries to deflect tiberius's mockery, embodying a mixture of desperation to please", "fear of the consequences if he fails.", "thrasyllus is wrapped in layers of anxiety and tension", "feeling the weight of impending doom as he vies for tiberius's favor. his nervousness is palpable as he tries to deflect tiberius's mockery", "embodying a mixture of desperation to please and fear of the consequences if he fails."],
        ap.active_plans = ["To reassure Tiberius that good news awaits from the ship.", "To leverage any favorable omens to regain Tiberius's trust and mitigate his own danger.", "To convince Tiberius to reconsider his threats, believing in the potential for positive fortune."],
        ap.beliefs = ["Astrological readings can influence fate and guide decisions if interpreted correctly.", "He believes his safety hinges on Tiberius's mood and the fortunes predicted.", "Despite his nervousness, he retains a sliver of hope that good news from Rome will change his fortunes."],
        ap.goals = ["Short-term: Avoid being thrown from the cliff by convincing Tiberius of a favorable future.", "Medium-term: Gain Tiberius's favor through accurate predictions and avoid further threats.", "Ultimate: Secure a position of influence by establishing himself as a trusted advisor to Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_5'})
    ON CREATE SET
        ap.current_status = 'The courier stands breathless, bowing deeply to Tiberius as he delivers the imperial dispatch. His posture is respectful yet alert, keenly aware of the tense atmosphere surrounding him as he announces the devastating news of Lucius\'s death.',
        ap.emotional_state = 'The courier balances professionalism with underlying tension. His commitment to duty is evident, but he is also acutely aware of the weight of the message he bears. He maintains a respectful demeanor, even as Tiberius\'s unsettling laughter seems to mock the seriousness of his delivery.',
        ap.emotional_tags = ["the courier balances professionalism with underlying tension. his commitment to duty is evident", "but he is also acutely aware of the weight of the message he bears. he maintains a respectful demeanor", "even as tiberius's unsettling laughter seems to mock the seriousness of his delivery.", "the courier balances professionalism with underlying tension. his commitment to duty is evident,", "he is also acutely aware of the weight of the message he bears. he maintains a respectful demeanor, even as tiberius's unsettling laughter seems to mock the seriousness of his delivery."],
        ap.active_plans = ["To deliver the imperial dispatch with accuracy and decorum.", "To maintain calm and professionalism despite the unpredictable reactions of Tiberius.", "To ensure the message is received and understood properly, facilitating Tiberius's next steps."],
        ap.beliefs = ["The emperor's wishes must be delivered promptly and respectfully, regardless of the circumstances.", "He believes in the gravity of the news he carries and its potential impact on the political landscape.", "His actions reflect a belief that maintaining protocol can shield him from the chaos surrounding imperial affairs."],
        ap.goals = ["Short-term: Successfully deliver the dispatch and maintain order in the volatile situation.", "Medium-term: Ensure that Tiberius understands the gravity of his return to Rome.", "Ultimate: Uphold the honor of the imperial courier service amid the tumult of imperial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Emperor Augustus is enthroned in the dimly lit hall, projecting an image of weary authority. He sits rigidly, his posture still commanding despite the evident signs of age and fatigue etched on his face. He addresses Tiberius with a blend of imperial expectation and paternal condescension, gesturing slightly with a dismissive wave of his hand as he speaks of family matters and state affairs.',
        ap.emotional_state = 'Augustus masks his deeper emotions with a veneer of imperial detachment, yet a profound weariness permeates his tone. Outwardly, he attempts a casual, almost jovial air, suggesting forgiveness and reconciliation. However, beneath this facade lies a deep-seated grief over the loss of his grandsons and the scandal of Julia. He is internally conflicted, torn between the desire for familial harmony and the harsh realities of imperial power, revealing a man burdened by the weight of his decisions and the decay within his own house.',
        ap.emotional_tags = ["augustus masks his deeper emotions with a veneer of imperial detachment, yet a profound weariness permeates his tone. outwardly, he attempts a casual, almost jovial air, suggesting forgiveness", "reconciliation. however, beneath this facade lies a deep-seated grief over the loss of his grandsons", "the scandal of julia. he is internally conflicted, torn between the desire for familial harmony", "the harsh realities of imperial power, revealing a man burdened by the weight of his decisions", "the decay within his own house.", "augustus masks his deeper emotions with a veneer of imperial detachment", "yet a profound weariness permeates his tone. outwardly", "he attempts a casual", "almost jovial air", "suggesting forgiveness and reconciliation. however", "beneath this facade lies a deep-seated grief over the loss of his grandsons and the scandal of julia. he is internally conflicted", "torn between the desire for familial harmony and the harsh realities of imperial power", "revealing a man burdened by the weight of his decisions and the decay within his own house."],
        ap.active_plans = ["To project an image of strength and control despite his personal grief and the unfolding family drama.", "To quickly address Tiberius's return and move past the uncomfortable subject of his exile by focusing on external matters of state.", "To postpone any genuine emotional or political reckoning, deferring deeper conversations to a later time when he feels more mentally prepared."],
        ap.beliefs = ["Maintaining the appearance of familial unity is essential for the stability of the Roman Empire.", "His imperial will is absolute and should be obeyed without question.", "Superficial reconciliation and avoidance of difficult emotions are preferable to confronting painful truths."],
        ap.goals = ["Short-term: To smoothly reintegrate Tiberius back into the Roman court without dwelling on past conflicts in this public setting.", "Medium-term: To shift the focus from internal family scandals to external threats to Rome, like the Parthians and German unrest.", "Ultimate: To secure the legacy of his dynasty, though his current actions suggest a growing detachment and a lack of clear long-term planning due to his declining mental state and emotional exhaustion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the Imperial Hall with a carefully composed demeanor, his expression deliberately neutral as he faces Augustus. He stands formally before the Emperor, maintaining a respectful posture and making measured movements. His physical presence is controlled and reserved, suggesting a man acutely aware of the power dynamics at play and determined to project an image of deference and obedience.',
        ap.emotional_state = 'Beneath Tiberius\'s neutral exterior simmers a complex mix of emotions. Outwardly, he presents an image of calm compliance, responding to Augustus with formal respect. Internally, however, he is undoubtedly navigating a turbulent sea of feelings - resentment from his unjust exile, cautious anticipation for his return to power, and deep-seated wariness of both Augustus and Livia\'s true intentions. His carefully constructed neutrality is a mask concealing a mind acutely calculating his next move in this treacherous family game.',
        ap.emotional_tags = ["beneath tiberius's neutral exterior simmers a complex mix of emotions. outwardly, he presents an image of calm compliance, responding to augustus with formal respect. internally, however, he is undoubtedly navigating a turbulent sea of feelings - resentment from his unjust exile, cautious anticipation for his return to power,", "deep-seated wariness of both augustus", "livia's true intentions. his carefully constructed neutrality is a mask concealing a mind acutely calculating his next move in this treacherous family game.", "beneath tiberius's neutral exterior simmers a complex mix of emotions. outwardly", "he presents an image of calm compliance", "responding to augustus with formal respect. internally", "however", "he is undoubtedly navigating a turbulent sea of feelings - resentment from his unjust exile", "cautious anticipation for his return to power", "and deep-seated wariness of both augustus and livia's true intentions. his carefully constructed neutrality is a mask concealing a mind acutely calculating his next move in this treacherous family game."],
        ap.active_plans = ["To present himself as completely subservient to Augustus's will, emphasizing his readiness to obey any command and dispel any notion of rebellion.", "To subtly assess the current political climate in Rome, paying close attention to Augustus's mental state and Livia's influence to gauge the shifting power dynamics.", "To secure a private audience with Livia later in the evening, recognizing her as the key orchestrator of power and influence within the family."],
        ap.beliefs = ["Power in Rome is obtained through strategic patience and calculated manipulation, not through open defiance.", "His exile was a profound injustice that he is now positioned to rectify through a strategic return to favor.", "Livia holds significant, if not dominant, control over Roman politics, and her favor is crucial for his advancement."],
        ap.goals = ["Short-term: To successfully reintegrate himself into Roman society and the Imperial court without triggering suspicion or hostility from Augustus or Livia.", "Medium-term: To re-establish his political influence and secure a prominent position within the Roman power structure, capitalizing on Augustus's declining health and mental state.", "Ultimate: To maneuver himself into the line of succession, ultimately aiming to become the next Emperor of Rome, reclaiming his birthright and avenging the humiliation of his exile."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits regally on a simple throne, his weary frame contrasting with the authority of his position. He gestures slightly with his hands, creating an air of casual authority, yet his posture betrays fatigue as he navigates the emotional weight of his words.',
        ap.emotional_state = 'Surface emotions reveal a mixture of indifference and deep-seated fatigue, marked by a weary tone as he reflects on familial conflicts and public outcry. Internally, he wrestles with profound grief over his grandsons and a sense of failure regarding Julia\'s banishment, creating a poignant disconnect between the facade of a ruler and the vulnerable man beneath.',
        ap.emotional_tags = ["surface emotions reveal a mixture of indifference", "deep-seated fatigue, marked by a weary tone as he reflects on familial conflicts", "public outcry. internally, he wrestles with profound grief over his grandsons", "a sense of failure regarding julia's banishment, creating a poignant disconnect between the facade of a ruler", "the vulnerable man beneath.", "surface emotions reveal a mixture of indifference and deep-seated fatigue", "marked by a weary tone as he reflects on familial conflicts and public outcry. internally", "he wrestles with profound grief over his grandsons and a sense of failure regarding julia's banishment", "creating a poignant disconnect between the facade of a ruler and the vulnerable man beneath."],
        ap.active_plans = ["To navigate the tumultuous waters of public opinion regarding Julia's exile and familial discord.", "To establish a sense of control and authority over Tiberius and the events unfolding in Germany and with the Parthians.", "To project a fa\u00e7ade of stability while internally grappling with the losses that threaten his reign."],
        ap.beliefs = ["Family is paramount, yet loyalty can be fragile and dangerous.", "Emotional vulnerability is a weakness that must be masked in public life.", "Power must be maintained through calculated indifference and authoritative displays."],
        ap.goals = ["Short-term: To quell public unrest regarding Julia's exile and reassert control over the narrative surrounding the family.", "Medium-term: To stabilize Rome's political landscape while managing threats from external forces like the Parthians.", "Ultimate: To secure a lasting legacy for his dynasty, ensuring its survival amidst the treachery and ambition of those around him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands tall and composed beside Augustus, a silent sentinel observing the unfolding scene. As Augustus descends into rambling reminiscence, she subtly shifts her weight, her gaze sharpening as she prepares to interject. With a measured step forward and a controlled tone, she delivers her correction, her voice a precise instrument cutting through the Emperor\'s hazy pronouncements, ensuring the conversation returns to the realm of political reality.',
        ap.emotional_state = 'Livia radiates an outward calm, her features an impassive mask, yet beneath this serene facade simmers a potent mix of impatience and controlled calculation. She observes Augustus\'s mental decline with a critical eye, recognizing the increasing fragility of his grip on power. While outwardly respectful, internally she is steeling herself, a subtle tension betraying her awareness of the precariousness of the situation and her resolve to maintain control, her focus unwavering despite the Emperor\'s meandering thoughts.',
        ap.emotional_tags = ["livia radiates an outward calm, her features an impassive mask, yet beneath this serene facade simmers a potent mix of impatience", "controlled calculation. she observes augustus's mental decline with a critical eye, recognizing the increasing fragility of his grip on power. while outwardly respectful, internally she is steeling herself, a subtle tension betraying her awareness of the precariousness of the situation", "her resolve to maintain control, her focus unwavering despite the emperor's meandering thoughts.", "livia radiates an outward calm", "her features an impassive mask", "yet beneath this serene facade simmers a potent mix of impatience and controlled calculation. she observes augustus's mental decline with a critical eye", "recognizing the increasing fragility of his grip on power. while outwardly respectful", "internally she is steeling herself", "a subtle tension betraying her awareness of the precariousness of the situation and her resolve to maintain control", "her focus unwavering despite the emperor's meandering thoughts."],
        ap.active_plans = ["To subtly correct Augustus's factual inaccuracies and re-establish a sense of grounded reality in the conversation.", "To assert her own sharp intellect and political acumen, contrasting it with Augustus's fading mental clarity.", "To subtly guide the narrative, ensuring that the discussion remains focused on the pressing matters of state and dynastic succession, rather than drifting into irrelevant anecdotes."],
        ap.beliefs = ["Unwavering control and precise information are paramount for effective rule.", "Sentimentality and nostalgia are dangerous distractions in the ruthless world of Roman politics.", "She is the most capable individual to safeguard the stability of the empire and ensure the smooth transition of power."],
        ap.goals = ["Short-term: To swiftly and efficiently correct Augustus's error, preventing any further derailment of the conversation.", "Medium-term: To reinforce her position as the astute and reliable advisor, subtly eclipsing Augustus's weakening authority in Tiberius's eyes.", "Ultimate: To secure the Julio-Claudian dynasty's future by ensuring a firm and capable hand guides Rome, a role she envisions herself and Tiberius fulfilling."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stumbles into the hall, his posture awkward as he attempts to engage Postumus. His movements are hesitant, characterized by a nervous energy, as he tries to maintain eye contact despite his stammer hindering his speech. His cheerful demeanor contrasts sharply with the somber atmosphere surrounding the imperial family.',
        ap.emotional_state = 'On the surface, Claudius appears cheerful, attempting to lighten the mood with a friendly greeting. However, beneath this façade lies a deep-seated anxiety fueled by feelings of inadequacy and the weight of family expectations. His clumsiness reflects an internal struggle as he yearns for acceptance while grappling with the reality of his own perceived foolishness.',
        ap.emotional_tags = ["on the surface, claudius appears cheerful, attempting to lighten the mood with a friendly greeting. however, beneath this fa\u00e7ade lies a deep-seated anxiety fueled by feelings of inadequacy", "the weight of family expectations. his clumsiness reflects an internal struggle as he yearns for acceptance while grappling with the reality of his own perceived foolishness.", "on the surface", "claudius appears cheerful", "attempting to lighten the mood with a friendly greeting. however", "beneath this fa\u00e7ade lies a deep-seated anxiety fueled by feelings of inadequacy and the weight of family expectations. his clumsiness reflects an internal struggle as he yearns for acceptance while grappling with the reality of his own perceived foolishness.", "on the surface, claudius appears cheerful, attempting to lighten the mood with a friendly greeting. however, beneath this fa\u00e7ade lies a deep-seated anxiety fueled by feelings of inadequacy and the weight of family expectations. his clumsiness reflects an internal struggle as he yearns for acceptance", "grappling with the reality of his own perceived foolishness."],
        ap.active_plans = ["To connect with Postumus and ease his evident anxiety, attempting to create a moment of camaraderie.", "To assert his presence within the imperial hierarchy, despite being seen as the family fool.", "To navigate the awkward dynamics of the family and establish his position without attracting hostility."],
        ap.beliefs = ["I must prove my worth to my family, despite their dismissive attitudes.", "Connection and friendship can alleviate the weight of familial pressures.", "My awkwardness does not define my intelligence or my potential."],
        ap.goals = ["Short-term: To engage Postumus in conversation and ease the tension in the room.", "Medium-term: To find a place of belonging within the imperial family.", "Ultimate: To carve out a role for himself that is valued, despite his stammer and perceived foolishness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Postumus stands anxiously, his posture tense as he grapples with the implications of being adopted into Augustus’s family. He avoids eye contact with Claudius, his body language reflecting his inner turmoil and fear surrounding his precarious position in the imperial hierarchy.',
        ap.emotional_state = 'Postumus exhibits surface-level anxiety, deeply affected by his uncertain status and the looming shadow of familial rivalry. Beneath this anxiety is an overwhelming sadness, rooted in his longing for connection with his mother and brothers, which contrasts with the expectations thrust upon him by his new status. His internal conflict reveals a fear of unworthiness and a desperate wish for familial support.',
        ap.emotional_tags = ["postumus exhibits surface-level anxiety, deeply affected by his uncertain status", "the looming shadow of familial rivalry. beneath this anxiety is an overwhelming sadness, rooted in his longing for connection with his mother", "brothers, which contrasts with the expectations thrust upon him by his new status. his internal conflict reveals a fear of unworthiness", "a desperate wish for familial support.", "postumus exhibits surface-level anxiety", "deeply affected by his uncertain status and the looming shadow of familial rivalry. beneath this anxiety is an overwhelming sadness", "rooted in his longing for connection with his mother and brothers", "which contrasts with the expectations thrust upon him by his new status. his internal conflict reveals a fear of unworthiness and a desperate wish for familial support."],
        ap.active_plans = ["To seek reassurance from those around him about his standing in the family.", "To voice his feelings of fear and uncertainty regarding the future.", "To express his desire for familial connection and emotional support as he navigates his new role."],
        ap.beliefs = ["I am overshadowed by my stepfather and cannot succeed him.", "My family is my anchor, and without them, I feel lost and frightened.", "I need to navigate the treacherous waters of imperial politics with caution."],
        ap.goals = ["Short-term: To express his desire for connection with his family and find solace in their presence.", "Medium-term: To understand his place within the imperial family and quell his fears for the future.", "Ultimate: To secure his identity and legacy amidst the complexities of imperial succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Postumus stands within the grand hall of the Imperial Palace, physically present but emotionally withdrawn. He barely reacts to Herod\'s attempts at encouragement, his posture slumped and his gaze unfocused.  He remains rooted to the spot, his body language conveying a deep-seated reluctance and anxiety rather than any active engagement with his surroundings or Herod\'s words.',
        ap.emotional_state = 'Postumus outwardly displays a palpable fear and despondency, evident in his terse responses and downcast demeanor. Beneath this surface, a profound anxiety churns within him, stemming from the precariousness of his newly appointed position as heir alongside Tiberius. He is internally conflicted, yearning for the vanished comfort of his mother and brothers, a stark contrast to the intimidating reality of imperial succession and the looming presence of Tiberius, his stepfather and rival heir. Unspoken is his terror at being thrust into a dangerous game of power he neither understands nor desires.',
        ap.emotional_tags = ["postumus outwardly displays a palpable fear", "despondency, evident in his terse responses", "downcast demeanor. beneath this surface, a profound anxiety churns within him, stemming from the precariousness of his newly appointed position as heir alongside tiberius. he is internally conflicted, yearning for the vanished comfort of his mother", "brothers, a stark contrast to the intimidating reality of imperial succession", "the looming presence of tiberius, his stepfather", "rival heir. unspoken is his terror at being thrust into a dangerous game of power he neither understands nor desires.", "postumus outwardly displays a palpable fear and despondency", "evident in his terse responses and downcast demeanor. beneath this surface", "a profound anxiety churns within him", "stemming from the precariousness of his newly appointed position as heir alongside tiberius. he is internally conflicted", "yearning for the vanished comfort of his mother and brothers", "a stark contrast to the intimidating reality of imperial succession and the looming presence of tiberius", "his stepfather and rival heir. unspoken is his terror at being thrust into a dangerous game of power he neither understands nor desires."],
        ap.active_plans = ["Express his fear and anxiety, albeit indirectly, through questions about his mother and brothers.", "Seek a semblance of comfort or reassurance, however futile it may be, from those around him.", "Avoid direct engagement with the complexities of imperial politics, focusing instead on his personal feelings of insecurity and longing."],
        ap.beliefs = ["Adoption into Caesar's family, especially alongside Tiberius, is a perilous situation rather than an honor.", "His true family \u2013 his mother and brothers \u2013 represents safety and emotional security, a stark contrast to the intimidating imperial court.", "The existence of two heirs inevitably leads to conflict and danger, placing him in a vulnerable and exposed position."],
        ap.goals = ["goals\": [\n          \"Short-term: To articulate his fear and be acknowledged, even if his concerns are dismissed.", "Medium-term: To find a way to escape the dangerous predicament of being a co-heir, potentially by rejecting the position if possible.", "Ultimate: To secure his personal safety and emotional well-being, distancing himself from the treacherous game of imperial succession and returning to a simpler, less threatening life, even if that means forfeiting any claim to power."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gnaeus_domitius_ahenobarbus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gnaeus_domitius_ahenobarbus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gnaeus_domitius_ahenobarbus_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_castor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_castor_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_minor_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius_minor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_minor_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_praxis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_praxis_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_6_1'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_agrippa_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_plautius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_plautius_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_9_2'}),
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
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelius_sextus_balbas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelius_sextus_balbas_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelius_sextus_balbas_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_volusius_saturninus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_volusius_saturninus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_volusius_saturninus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sentor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sentor_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sentor_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_courier'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thasyllus_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_courier'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_courier_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_waiting_in_the_wings'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_2'})
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
