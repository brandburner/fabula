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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e05_graph.json',
        creation_timestamp: '2025-04-11T16:16:54.476194',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'Grandson of Augustus',
        a.description = 'Claudius, often underestimated due to his stammer and awkwardness, is the grandson of Livia Drusilla and Augustus. Despite being perceived as foolish, he possesses a keen intellect and a strong sense of loyalty. Over the course of his narrative, he gradually emerges from the shadows of familial scorn into a figure of influence and importance within the court.',
        a.traits = ["Timid", "Intelligent", "Loyal", "Undervalued"],
        a.sphere_of_influence = 'Imperial Affairs'
    ;
MERGE (a:Agent {uuid: 'agent_meno'})
    ON CREATE SET
        a.name = 'Meno',
        a.title = 'Servant',
        a.description = 'Meno is a loyal and helpful servant assisting Claudius in the Imperial Archive Cellar. He is proactive in his duties such as finding documents and tidying up, and he shows respectful deference to Claudius by addressing him as \'Caesar\'. His practical and focused nature provides steady support in contrast to Claudius\'s more scholarly personality.',
        a.traits = ["loyal", "helpful", "obedient", "respectful", "practical"],
        a.sphere_of_influence = 'domestic service'
    ;
MERGE (a:Agent {uuid: 'agent_germanicus'})
    ON CREATE SET
        a.name = 'Germanicus',
        a.title = 'None',
        a.description = 'Germanicus is mentioned as the supportive influence behind the suggestion that Claudius give a public reading of his book. Although physically absent from the scene, his influence is noted in contrast to Livia\'s dismissive authority, representing a more encouraging and less politically calculating perspective.',
        a.traits = ["Supportive (of Claudius)", "Influential (implied)", "Absent", "Well-regarded (implied)"],
        a.sphere_of_influence = 'Military'
    ;
MERGE (a:Agent {uuid: 'agent_augustus'})
    ON CREATE SET
        a.name = 'Augustus Caesar',
        a.title = 'Emperor',
        a.description = 'Augustus Caesar, though unseen in this scene, is the central figure whose declining health drives the political tension. Described as having fallen into a deep sleep after Tiberius\'s arrival, his failing condition and vulnerability greatly impact the succession and power dynamics within the imperial court.',
        a.traits = ["ailing", "vulnerable", "passive", "central_figure_absent"],
        a.sphere_of_influence = 'Roman Empire'
    ;
MERGE (a:Agent {uuid: 'agent_postumus_agrippa'})
    ON CREATE SET
        a.name = 'Postumus Agrippa',
        a.title = 'None',
        a.description = 'Postumus Agrippa, though not present on stage, is a pivotal figure whose unexpected elevation as beneficiary of Augustus\'s altered will throws the court into disarray. His status as the exiled and disinherited heir, along with being viewed as a threat to Tiberius\'s succession, marks him as a catalyst for conflict.',
        a.traits = ["Exiled", "Disinherited (formerly)", "Unexpected Heir", "Threat to Tiberius", "Catalyst for conflict"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_livilla'})
    ON CREATE SET
        a.name = 'Livilla',
        a.title = 'None',
        a.description = 'Livilla is an imperial family member, portrayed as vulnerable and fearful under the intense scrutiny of Livia Drusilla. As the wife of Castor and granddaughter to Livia, she reacts defensively to accusations, and her cunning in deflecting blame by suggesting others as sources of information adds layers to her character.',
        a.traits = ["fearful", "defensive", "anxious", "submissive", "cunning", "deceitful (potentially)"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_livia_drusilla'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'Empress Mother',
        a.description = 'Livia Drusilla is the Empress Mother, a master manipulator who exerts cold, calculating control over her family\'s legacy. Her relentless ambition and cunning drive her to orchestrate complex plots, making her a formidable force in the imperial court who balances charm with menace.',
        a.traits = ["Manipulative", "Cold", "Cunning", "Ambitious"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_castor'})
    ON CREATE SET
        a.name = 'Castor',
        a.title = 'None',
        a.description = 'Castor, who is Livilla\'s husband, is portrayed as a domestic figure associated with suspicion and potential abuse. Noted for his involvement in a volatile relationship and rumored domestic violence, his minor political significance is overshadowed by Livia\'s dismissal of his insights.',
        a.traits = ["jealous (implied)", "abusive (implied)", "perceptive (possibly)", "politically insignificant (in Livia's view)", "violent (implied)"],
        a.sphere_of_influence = 'Domestic Sphere'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Nero Caesar',
        a.title = 'None',
        a.description = 'Tiberius is depicted as a rigid and composed figure in the Senate Chamber, embodying duty and disciplined ambition. As Augustus\'s stepson and declared heir, he commands proceedings with authority while masking his internal emotions beneath a stoic exterior.',
        a.traits = ["Rigid", "Composed", "Authoritative", "Stoic"],
        a.sphere_of_influence = 'Imperial Succession'
    ;
MERGE (a:Agent {uuid: 'agent_marcellus'})
    ON CREATE SET
        a.name = 'Marcellus',
        a.title = 'None',
        a.description = 'Marcellus is remembered as Julia\'s first husband and is implicated in a past poisoning alleged by Postumus. His character, now deceased, serves as a reminder of the historical intrigues and accusations that haunt the imperial family\'s legacy.',
        a.traits = ["Deceased", "Victim (alleged)", "Julia's Husband (former)"],
        a.sphere_of_influence = 'Past Imperial Events'
    ;
MERGE (a:Agent {uuid: 'agent_julia'})
    ON CREATE SET
        a.name = 'Julia',
        a.title = 'None',
        a.description = 'Julia, the mother of Postumus, is depicted as a victim of Livia\'s long-term schemes. Her alleged systematic destruction over the years underscores the dark and ruthless nature of the court\'s internal conflicts.',
        a.traits = ["Victim (alleged)", "Postumus' Mother", "Deceased (possibly)", "Destroyed (allegedly)"],
        a.sphere_of_influence = 'Past Imperial Events'
    ;
MERGE (a:Agent {uuid: 'agent_agrippa'})
    ON CREATE SET
        a.name = 'Agrippa',
        a.title = 'None',
        a.description = 'Agrippa, believed to be Postumus\'s father, is suspected of having been poisoned by Livia. His role as a potential victim from the past accentuates the lethal undercurrents and historical grievances woven into the imperial family\'s narrative.',
        a.traits = ["Deceased (possibly)", "Victim (alleged)", "Postumus' Father"],
        a.sphere_of_influence = 'Past Imperial Events'
    ;
MERGE (a:Agent {uuid: 'agent_fabius_maximus'})
    ON CREATE SET
        a.name = 'Quintus Fabius Maximus',
        a.title = 'Advisor',
        a.description = 'Quintus Fabius Maximus is a pragmatic and loyal advisor to Augustus Caesar. Noted for his calm demeanor and sharp intellect, he challenges superstitious beliefs and provides sound counsel amidst the turbulent imperial politics, balancing authority with reason.',
        a.traits = ["Pragmatic", "Loyal", "Reasoned", "Diplomatic"],
        a.sphere_of_influence = 'Imperial Court'
    ;
MERGE (a:Agent {uuid: 'agent_camilla_pulchra'})
    ON CREATE SET
        a.name = 'Camilla Pulchra',
        a.title = 'Chief Vestal Virgin',
        a.description = 'Camilla Pulchra, as the Chief Vestal Virgin, embodies serenity, piety, and devotion to Roman religious traditions. Her presence in Livia\'s chambers hints at a potential entanglement with imperial affairs beyond her principal religious duties, remaining observant and reserved throughout the scene.',
        a.traits = ["Serene", "Pious", "Observant", "Devout", "Reserved"],
        a.sphere_of_influence = 'Religion'
    ;
MERGE (a:Agent {uuid: 'agent_praxis'})
    ON CREATE SET
        a.name = 'Praxis',
        a.title = 'Servant',
        a.description = 'Praxis is a dutiful servant in Livia\'s chambers, primarily tasked with announcing arrivals and attending to Livia\'s needs with discretion. Though his role is brief, his constant presence underscores the theme of servitude within the imperial household.',
        a.traits = ["Obedient", "Servile", "Discreet", "Attentive", "Loyal"],
        a.sphere_of_influence = 'Domestic Service'
    ;
MERGE (a:Agent {uuid: 'agent_montanus'})
    ON CREATE SET
        a.name = 'Montanus',
        a.title = 'Physician',
        a.description = 'Montanus is the concerned physician attending to Emperor Augustus in his secluded villa. His practical and rational approach to medicine contrasts with the emperor\'s erratic behavior, making him the voice of reason and professional care in the midst of imperial crisis.',
        a.traits = ["Practical", "Concerned", "Rational", "Professional"],
        a.sphere_of_influence = 'Medicine'
    ;
MERGE (a:Agent {uuid: 'agent_junius'})
    ON CREATE SET
        a.name = 'Junius',
        a.title = 'None',
        a.description = 'Junius is a courtier or attendant in Augustus\'s chambers, characterized by his playful nature and misfortune at the dice game. Penniless yet respectful, he adds levity to the scene, participating actively despite his lack of funds, and highlighting the intricate dynamics of courtly life.',
        a.traits = ["Playful", "Penniless", "Respectful", "Game-player"],
        a.sphere_of_influence = 'Courtly life'
    ;
MERGE (a:Agent {uuid: 'agent_sejanus'})
    ON CREATE SET
        a.name = 'Colonel Sejanus',
        a.title = 'Colonel',
        a.description = 'Colonel Sejanus is a dedicated officer in the Guard, known for his unwavering loyalty to the imperial family, especially Livia. Bearing the burden of his father\'s reputation, he navigates the treacherous court intrigues with a balance of ambition and duty.',
        a.traits = ["Loyal", "Ambitious", "Cautious", "Respectful"],
        a.sphere_of_influence = 'Guard'
    ;
MERGE (a:Agent {uuid: 'agent_quaestor'})
    ON CREATE SET
        a.name = 'Quaestor',
        a.title = 'Quaestor',
        a.description = 'The Quaestor is a state functionary responsible for reading Augustus Caesar\'s last will and testament to the Senate. Embodying formal officialdom and precision, he serves as the conduit for imperial decree during a pivotal transition of power.',
        a.traits = ["Official", "Functionary", "Precise", "Formal"],
        a.sphere_of_influence = 'Roman Law and Administration'
    ;
MERGE (a:Agent {uuid: 'agent_senators'})
    ON CREATE SET
        a.name = 'Senators',
        a.title = 'Senator',
        a.description = 'The Senators represent the assembled body of Roman political power, gathered to hear the reading of Augustus\'s will. Their stern and influential presence underscores the gravity of the political transition and the collective responsibility of governance.',
        a.traits = ["Stern", "Assembled", "Influential", "Political"],
        a.sphere_of_influence = 'Roman Governance'
    ;
MERGE (o:Object {uuid: 'object_last_will_and_testament_augustus_caesar'})
    ON CREATE SET
        o.name = 'The Last Will and Testament of Augustus Caesar',
        o.description = 'This is a significant historical document discovered by Claudius in the Imperial Archive Cellar. It is explicitly identified as \'Augustus\' will\', suggesting it contains the final directives and testamentary wishes of the former Emperor Augustus Caesar. Found among discarded items, it hints at being misplaced, hidden, or forgotten.',
        o.purpose = 'To document the final wishes and legal directives of Augustus Caesar, particularly regarding imperial succession and the distribution of his estate.',
        o.significance = 'Its discovery is a pivotal moment that may reveal secrets about the future of Rome and imperially impact the narrative.'
    ;
MERGE (o:Object {uuid: 'object_book'})
    ON CREATE SET
        o.name = 'Book',
        o.description = 'A book written by Claudius about religious changes during Augustus\'s reign. Although not physically present in the scene, it is mentioned by Livia as a potential source of embarrassment if publicly read, symbolizing Claudius\'s scholarly pursuits and Livia\'s desire to control the family\'s image.',
        o.purpose = 'Scholarly work and potential public reading.',
        o.significance = 'Symbolizes both Claudius’s intellect and Livia’s control over information, reflecting the family\'s concern with maintaining power and public competence.'
    ;
MERGE (o:Object {uuid: 'object_chess_game'})
    ON CREATE SET
        o.name = 'Chess Game',
        o.description = 'A half-finished game of chess set up on a small table in the private study, indicating a space for intellectual leisure. The incomplete game hints at interrupted activities and ongoing strategic considerations, mirroring the political maneuvers in the narrative.',
        o.purpose = 'A game of strategy showcasing intellectual pursuits.',
        o.significance = 'Symbolizes strategy and the intellectual games played both literally and metaphorically within the court.'
    ;
MERGE (o:Object {uuid: 'object_letters'})
    ON CREATE SET
        o.name = 'Letters',
        o.description = 'Letters used as a form of communication between Claudius and Germanicus. They convey sensitive information and hint at the dangers of intercepted communication, an issue underscored by the concerns about surveillance.',
        o.purpose = 'To facilitate communication.',
        o.significance = 'Represents the theme of communication and the ever-present fear of surveillance within the imperial court.'
    ;
MERGE (o:Object {uuid: 'object_mail'})
    ON CREATE SET
        o.name = 'Mail',
        o.description = 'Mail is referenced when Claudius states that his mail is opened by his grandmother Livia. This highlights Livia\'s pervasive control over communication and information within the imperial family and court.',
        o.purpose = 'To serve as a means of communication.',
        o.significance = 'Illustrates Livia\'s surveillance practices and her control over information.'
    ;
MERGE (o:Object {uuid: 'object_augustus_will'})
    ON CREATE SET
        o.name = 'Augustus\' Will',
        o.description = 'A document of immense political and personal significance, containing Augustus\'s final wishes and testamentary dispositions, including designations about imperial succession. Its presentation in the narrative suggests multiple versions due to recent alterations.',
        o.purpose = 'To outline Augustus\'s final wishes and establish the succession of power within Rome.',
        o.significance = 'Serves as a focal point for the power struggle and reveals implications that affect the imperial lineage.'
    ;
MERGE (o:Object {uuid: 'object_augustus_seal'})
    ON CREATE SET
        o.name = 'Augustus\'s Seal',
        o.description = 'An official instrument used to authenticate and validate imperial documents. Notably held by Camilla Pulchra for years, it plays a key role in attempting to access Augustus\'s will and represents imperial authority.',
        o.purpose = 'To authenticate and validate official documents.',
        o.significance = 'Acts as a symbol of imperial authority and is intricately linked to the legal power embedded in Augustus\'s will.'
    ;
MERGE (o:Object {uuid: 'object_augustus_ulcer_medicine'})
    ON CREATE SET
        o.name = 'Ulcer Medicine',
        o.description = 'A potion prescribed by Montanus to alleviate Augustus\'s abdominal pain caused by an ulcer. The emperor’s grimace upon consuming it highlights its harshness and underscores his physical vulnerability.',
        o.purpose = 'To alleviate Augustus\'s pain from his ulcer.',
        o.significance = 'Represents the physical decline of power and the desperate search for relief in the face of mortality.'
    ;
MERGE (o:Object {uuid: 'object_goblet_wine'})
    ON CREATE SET
        o.name = 'Goblet of Wine',
        o.description = 'A goblet of wine that is spilled by Claudius in a moment of nervous clumsiness. This spilled wine acts as a visual metaphor for Claudius\'s perceived incompetence and serves to momentarily divert attention during mounting tensions.',
        o.purpose = 'Used for drinking; its spilling symbolizes humiliation.',
        o.significance = 'Serves as a symbol of Claudius\'s clumsiness and exemplifies Livia\'s contempt toward him.'
    ;
MERGE (o:Object {uuid: 'object_will'})
    ON CREATE SET
        o.name = 'Will',
        o.description = 'This version of Augustus\'s will is specifically noted as altered, favoring Postumus. While it is not physically present in the scene, its existence ignites panic and strategic maneuvering among those vying for power.',
        o.purpose = 'To serve as a testamentary document and succession plan.',
        o.significance = 'Acts as a central symbol of imperial power and triggers the succession crisis, intensifying the conflict between key characters.'
    ;
MERGE (o:Object {uuid: 'object_dice'})
    ON CREATE SET
        o.name = 'Dice',
        o.description = 'Dice used for a game of chance in Augustus\'s chambers. They are described as being thrown repeatedly by Augustus, who boasts about achieving \'Venus\', the highest throw in Roman dice games.',
        o.purpose = 'For gambling and entertainment.',
        o.significance = 'Symbolizes chance, fortune, and serves as a metaphor for the unpredictable nature of fate and power struggles within the Roman court.'
    ;
MERGE (o:Object {uuid: 'object_figs_from_garden'})
    ON CREATE SET
        o.name = 'Figs from the Garden',
        o.description = 'Simple, ripe fruit from the garden that represent Augustus\'s misguided attempt at self-cure. Livia dismisses his diet, using the figs as a symbol to illustrate his irrational behavior.',
        o.purpose = 'To serve as Augustus\'s misguided attempt at dietary self-care.',
        o.significance = 'Symbolizes Augustus\'s detachment from rational decision-making and his descent into paranoia.'
    ;
MERGE (o:Object {uuid: 'object_medicine'})
    ON CREATE SET
        o.name = 'Medicine',
        o.description = 'A conventional treatment offered by Montanus intended to alleviate Augustus\'s digestive distress. However, Augustus rejects it, demanding nothing \'touched by human hand.\' This refusal underscores his growing paranoia and distrust.',
        o.purpose = 'To provide medicinal treatment for Augustus\'s digestive issues.',
        o.significance = 'Represents Augustus\'s paranoia and his rejection of conventional treatment, highlighting his isolation and decline.'
    ;
MERGE (o:Object {uuid: 'object_bed'})
    ON CREATE SET
        o.name = 'Bed',
        o.description = 'A large and imposing bed in the quarantine villa room where Augustus is confined. It dominates the space, symbolizing not only his physical vulnerability but also serving as a stage for the unfolding drama between him and Livia.',
        o.purpose = 'To provide rest and denote confinement.',
        o.significance = 'Symbolizes Augustus\'s vulnerability, physical decline, and the shifting dynamics of power within the empire.'
    ;
MERGE (o:Object {uuid: 'object_bulletins'})
    ON CREATE SET
        o.name = 'Bulletins',
        o.description = 'Written announcements that Livia promises to post on the door of the villa. Though not a tangible object directly present in the scene, they serve as a vehicle for controlled information dissemination.',
        o.purpose = 'To manage and control the spread of information regarding Augustus\'s condition.',
        o.significance = 'Represents Livia\'s strategic manipulation of public information and her grip on controlling the narrative during the imperial transition.'
    ;
MERGE (o:Object {uuid: 'object_scroll'})
    ON CREATE SET
        o.name = 'Scroll',
        o.description = 'A papyrus scroll rolled into a cylinder, held by the Quaestor. It embodies Augustus Caesar\'s last will and testament in a tangible form, containing the definitive legal and political directives of the deceased emperor.',
        o.purpose = 'To contain and convey the written will of Augustus Caesar.',
        o.significance = 'Represents the legal instrument of imperial succession, encapsulating the transfer of power in a formal document with profound political impact.'
    ;
MERGE (l:Location {uuid: 'location_imperial_archive_cellar'})
    ON CREATE SET
        l.name = 'Imperial Archive Cellar',
        l.description = 'The Imperial Archive Cellar is a dimly lit and cluttered subterranean space located beneath the palace. It is characterized by a dusty atmosphere with motes visible in the weak light filtering through a high, barred window. Disorganized shelves overflow with a variety of items including scrolls, broken statues, and discarded relics, alluding to storage for forgotten or less important imperial possessions. The heavy air carries the smells of damp parchment and decay, reinforcing its age and neglect.',
        l.type = 'Cellar'
    ;
MERGE (l:Location {uuid: 'location_senate_entrance'})
    ON CREATE SET
        l.name = 'Senate Entrance',
        l.description = 'The Senate Entrance is a grand plaza bathed in sunlight that serves as a vibrant backdrop for Rome’s ceremonies. The space resonates with trumpets and the roar of jubilant crowds celebrating military triumphs. Roman legions in gleaming armor parade through, symbolizing the Republic\'s glory and the imperial authority that now governs Rome.',
        l.type = 'Public Plaza'
    ;
MERGE (l:Location {uuid: 'location_private_study'})
    ON CREATE SET
        l.name = 'Private Study',
        l.description = 'A sparsely furnished room illuminated by flickering oil lamps that cast long, dancing shadows. Bookshelves line the walls, creating an atmosphere of learning and contemplation. A small table holding a half-finished game of chess suggests intellectual pursuits and quiet leisure, emphasizing the room\'s role as a private and intimate space.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_claudius_room'})
    ON CREATE SET
        l.name = 'Claudius\' Room',
        l.description = 'Claudius\'s Room is described as hot and uncomfortable, prompting its occupant to seek refuge in the cooler and more conducive Private Study. This personal space contrasts with the study, being less suitable for focused activities because of its oppressive heat.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_teutoberg_forest'})
    ON CREATE SET
        l.name = 'Teutoberg Forest',
        l.description = 'Teutoberg Forest is depicted as a gruesome and desolate landscape marked by horrific carnage and unburied bodies from a past Roman defeat. The terrain, filled with the remains of soldiers, symbolizes immense loss and suffering, reflecting the brutal aftermath of battle.',
        l.type = 'Forest'
    ;
MERGE (l:Location {uuid: 'location_livilla_room'})
    ON CREATE SET
        l.name = 'Livilla\'s Room',
        l.description = 'Livilla\'s Room is a private space within the imperial residence, used for intimate or clandestine encounters. It gains notoriety as the scene of betrayal and false accusation when Postumus is allegedly invited and then accused of attempted rape, highlighting dangerous court intrigues.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_imperial_gardens'})
    ON CREATE SET
        l.name = 'Imperial Gardens',
        l.description = 'The Imperial Gardens offer a verdant sanctuary amidst Rome’s clamor. Lush flora, tranquil fountains, and hidden shadows create a deceptive Eden that contrasts nature’s beauty with courtly intrigue. The gardens embody a balance of serenity and simmering betrayal as political conspiracies quietly unfold.',
        l.type = 'Garden'
    ;
MERGE (l:Location {uuid: 'location_livia_chambers'})
    ON CREATE SET
        l.name = 'Livia\'s Chambers',
        l.description = 'Livia\'s Chambers are opulent and richly decorated to reflect her imperial status. This private space, marked by elements such as a goblet of wine and shifts between intimate conversation and overt political confrontation, blends personal luxury with the undercurrents of power play.',
        l.type = 'Chambers'
    ;
MERGE (l:Location {uuid: 'location_rugged_island_retreat'})
    ON CREATE SET
        l.name = 'Rugged Island Retreat',
        l.description = 'A windswept island defined by rocky outcrops and a turbulent sea, the Rugged Island Retreat is marked by its harsh, desolate landscape. The raw terrain, with relentless waves crashing against rocks, metaphorically mirrors the internal turmoil of its isolated inhabitant as it sets the stage for a tense familial confrontation.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_augustus_bedchamber'})
    ON CREATE SET
        l.name = 'Augustus\'s Bedchamber',
        l.description = 'A dimly lit room suffused with an oppressive atmosphere reflecting Augustus\'s frailty and looming mortality. Modestly furnished with a large central bed and medical instruments hinting at his ailing condition, the bedchamber encapsulates the emperor’s personal struggle amid public decline.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_illyricum'})
    ON CREATE SET
        l.name = 'Illyricum',
        l.description = 'Illyricum is depicted as a distant region and an undesirable posting. As the destination where Tiberius is sent by Augustus, its mention underscores the emperor\'s disregard for Tiberius and the imposed geographical and emotional isolation.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_corsica'})
    ON CREATE SET
        l.name = 'Corsica',
        l.description = 'Corsica is portrayed as a remote island associated with exile and banishment. Marked by isolation and political marginalization, its relevance deepens with Augustus\'s secret visit and potential reconsideration of Postumus\'s status, infusing the location with hidden agendas.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_augustus_chambers'})
    ON CREATE SET
        l.name = 'Augustus\'s Chambers',
        l.description = 'In the evening, Augustus\'s Chambers transform into a boisterous gambling den where laughter, shouts, and clattering dice mask the emperor’s failing health. Torchlight plays across opulent furnishings, highlighting the forced merriment and underlying tension within this private space repurposed for temporary escapism.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    ON CREATE SET
        l.name = 'Secluded Quarantine Villa',
        l.description = 'The Secluded Quarantine Villa in Nola is depicted as a retreat for the ailing Emperor Augustus, located outside Rome. It is a place of hushed anticipation and controlled information, where a small waiting group and a vigilant Livia at the entrance highlight its role in managing the narrative of imperial decline.',
        l.type = 'Villa'
    ;
MERGE (l:Location {uuid: 'location_grand_senate_chamber'})
    ON CREATE SET
        l.name = 'Grand Senate Chamber',
        l.description = 'The Grand Senate Chamber is a vast, imposing space designed to command awe. With sunlight streaming through high windows onto majestic marble walls, it exudes dignity and solemnity, serving as the formal venue for debates and decisions that shape the fate of the empire.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_antechamber'})
    ON CREATE SET
        l.name = 'Antechamber',
        l.description = 'The Antechamber is a small, claustrophobic space adjacent to the Senate, its walls adorned with the faded grandeur of Roman artistry. Charged with tension, this area acts as a transitional zone where political intrigue and the undercurrents of monumental decisions converge.',
        l.type = 'Chamber'
    ;
MERGE (o:Organization {uuid: 'org_house_of_vestals'})
    ON CREATE SET
        o.name = 'House of the Vestals',
        o.description = 'The House of the Vestals is a sacred religious institution in Rome, serving as the home to the Vestal Virgins—priestesses dedicated to Vesta, the goddess of the hearth. It is currently in need of rebuilding and beautification, a project championed by Camilla Pulchra. Its physical condition reflects the state of Roman religious practices and the honor and resources allocated to them, with neglect by the Senate raising concerns and providing leverage for political manipulation by figures like Livia.',
        o.sphere_of_influence = 'Roman Religion'
    ;
MERGE (o:Organization {uuid: 'org_senate'})
    ON CREATE SET
        o.name = 'Senate',
        o.description = 'The Roman Senate is an ancient and powerful institution composed of patrician families and senior statesmen. It plays a central role in governance, advising rulers and overseeing law and administration. In this scene, the Senate is depicted assembled in its chamber to hear the reading of Augustus\'s will, underscoring its role in legitimizing imperial succession and maintaining the Roman power structure.',
        o.sphere_of_influence = 'Roman Governance'
    ;
MERGE (o:Organization {uuid: 'org_imperial_delegation'})
    ON CREATE SET
        o.name = 'Imperial Delegation',
        o.description = 'The Imperial Delegation is a group of officials or dignitaries from Rome, assembled outside Augustus\'s quarantine villa. They are awaiting news on the Emperor\'s condition, reflecting the political and public anxieties surrounding the impending power vacuum. Livia’s dismissive attitude towards them underscores their relatively minor power compared to the imperial family and her control over the flow of information.',
        o.sphere_of_influence = 'Roman Court'
    ;
MERGE (ep:Episode {uuid: 'episode_poison_is_queen'})
    ON CREATE SET
        ep.title = 'Poison Is Queen',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Discovery of the Will',
        s.description = 'In the dimly lit Imperial Archive Cellar, dust motes float through the weak light filtering from a high barred window, illuminating the chaos of forgotten relics and ancient scrolls. Claudius, a hesitant and scholarly figure, is engrossed in a document that has the potential to alter the course of the Roman Empire. The atmosphere is thick with the smell of damp parchment and decay, creating a tangible tension as he uncovers a significant piece of history. Nearby, Meno, a loyal servant, stands watch, the weight of secrecy palpable between them. The air is charged with anticipation, hinting at the disturbing revelations that the document, the Last Will and Testament of Augustus Caesar, may hold. This moment serves as a pivotal turning point in the narrative, laying the groundwork for the ensuing power struggles and betrayals within the imperial court.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_archive_cellar'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Claudius Uncovers the Will',
        e.description = 'Claudius, bent over a cluttered table, examines a document he has uncovered in the cellar. As his eyes scan the words, a mixture of disbelief and excitement courses through him. He realizes he has stumbled upon the Last Will and Testament of Augustus Caesar, a discovery that could change everything in the power dynamics of Rome. Meno stands by, watching Claudius’s reaction, sensing the gravity of the moment. This event marks the beginning of Claudius’s journey from obscurity to a pivotal player in the imperial intrigue.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Ah, that's what you said the l-l-last time we found something. It's incredible - the way people just dump things.", "What is this? 'The Last Will and Testament of Augustus Caesar'. Augustus' will!"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Triumphant Return from the Rhine',
        s.description = 'Under the radiant Roman sun, a vast plaza before the Senate pulsates with the energy of a city celebrating victory. The air vibrates with the blare of trumpets and the ecstatic roar of the populace, a deafening wave of adoration washing over the scene. Roman legions, the embodiment of imperial might, march in impeccable formation, their armor flashing like a thousand mirrors under the intense daylight. At the heart of this spectacle, Germanicus, a general radiating youthful charisma and heroic presence, stands before Augustus. The Emperor, positioned regally on a raised platform, receives his victorious commander amidst this grand display of Roman power. The scene is thick with the scent of laurel and the dust kicked up by marching feet, a sensory feast of imperial triumph. This moment serves to publicly solidify Germanicus\'s heroic stature and reinforce Augustus\'s image as a powerful and successful ruler, basking in the reflected glory of his military achievements. It subtly underscores the stability and might of Rome, even as undercurrents of political intrigue swirl beneath the surface of this outward show of strength and unity.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_entrance'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Legions Return in Glory',
        e.description = 'The scene erupts with the pomp and ceremony of a Roman triumph. Trumpets shatter the air with a fanfare as disciplined legions march into the sun-drenched plaza before the Senate. Their polished armor glints, reflecting the jubilant faces of the massive crowd lining their path. The sheer scale of the military procession underscores Rome\'s dominance and the victorious return of its forces from the German frontier. The ground trembles under the rhythmic beat of marching feet, a tangible display of imperial power.',
        e.sequence_within_scene = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Germanicus Hails Caesar',
        e.description = 'Germanicus, the celebrated general, steps forward from the ranks of his legions. Handsome and exuding natural leadership, he approaches Augustus, who is enthroned on a raised platform overlooking the plaza. With a resonant voice that carries over the cheering crowd, Germanicus formally greets the Emperor, acknowledging Augustus\'s supreme authority and attributing the victory to his leadership. This moment highlights the traditional Roman respect for hierarchy and the public submission of military glory to imperial power.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["GERMANICUS: Hail. Caesar! The Legions of Rome salute you on their return from the Rhine."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Victory on the Rhine Declared',
        e.description = 'Germanicus reports on the successful campaign in Germania. He confirms the Roman victory, emphasizing the decisive defeat of the German tribes and their plea for peace. He details the harsh punishments inflicted upon the enemy and the significant number of captives brought back to Rome as symbols of subjugation. The general underscores the restoration of peace and the renewed flow of tribute from the province, reinforcing the narrative of Roman strength and order imposed on the barbarian frontier. This report publicly validates Augustus\'s reign and the effectiveness of Roman military might.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["GERMANICUS: In triumph, Caesar! The German tribes are put down. They have sued for peace. Our punishments have been fierce and we have brought back many captives to Rome. The province is peaceful once more and her tribute flows again."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Legions Await Caesar\'s Command',
        e.description = 'Germanicus concludes his address by reaffirming the legions\' unwavering loyalty and readiness to serve Caesar. He states that they await Augustus\'s further orders, demonstrating their disciplined obedience and the Emperor\'s absolute command over the Roman military. This final declaration solidifies the image of Augustus as the ultimate authority, his power underpinned by the unwavering support of his victorious legions, bringing the scene to a crescendo of imperial acclaim and military might.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["GERMANICUS: Your legions await your further orders. Hail. Caesar!"]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Secrets in the Study',
        s.description = 'In the intimate confines of a sparsely furnished study, flickering oil lamps cast elongated shadows, creating an atmosphere steeped in secrecy. The space is filled with books, and a half-finished game of chess sits abandoned on a small table, underscoring the weight of the conversation about to unfold. Germanicus, the handsome and charismatic general, sits opposite Claudius, who appears hunched over a book, embodying the tension between his perceived foolishness and the truths he holds. Their dialogue oscillates between light-hearted banter and grave discussions about family, loyalty, and the conspiracies that plague their bloodline. The mood shifts as the brothers delve into darker revelations, particularly surrounding the accusations against Postumus and the insidious influence of Livia. The study serves as a microcosm of the larger imperial court, where betrayal lurks beneath familial bonds, and every word could have dire consequences. The tension culminates as Claudius shares Postumus’s chilling suspicions about Livia’s machinations, hinting at deeper currents of treachery that threaten to unravel the very fabric of their family.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Claudius and Germanicus Catch Up',
        e.description = 'In the subdued light of the study, Germanicus expresses concern for Claudius\'s eyesight while the two engage in playful banter about their respective family lives. Claudius reveals his discomfort with fatherhood, openly expressing disdain for his infant son, showcasing his struggle with self-worth and familial expectations. Their conversation reflects a camaraderie filled with light-hearted teasing yet hints at underlying tensions and deeper issues that plague their family.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: I don't like him very much. I think he's horrid.", "GERMANICUS: Oh, Claudius!"]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Postumus\'s Dangerous Revelation',
        e.description = 'As the conversation deepens, Claudius reveals critical information about Postumus\'s predicament, including his arrest and the charges against him. He explains that Postumus believes he was framed by Livilla with the scheme influenced by Livia. The gravity of the situation escalates as Claudius recounts what Postumus confided in him, emphasizing the sinister orchestration of events by their grandmother, which raises the stakes for both of them.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: That night he was arrested, he broke away from his guards and came to see me in my room.", "GERMANICUS: What did he tell you?", "CLAUDIUS: He believes that over the years she has systematically destroyed his mother, his two brothers and possibly his father, Agrippa."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Accusations Against Livia',
        e.description = 'As the revelation grows darker, Claudius details Postumus\'s accusations against Livia, suggesting she has poisoned key family members to secure her control. This moment shifts the tone from familial bonding to a chilling discussion of treachery, encapsulating the pervasive paranoia within their family. Germanicus responds with skepticism, prompting Claudius to reaffirm his belief in Postumus\'s innocence and the gravity of their grandmother\'s influence on the imperial court\'s machinations.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: He believes she's mad.", "GERMANICUS: Proof?", "CLAUDIUS: No."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Concluding Their Meeting',
        e.description = 'As the conversation nears its end, Claudius insists on the necessity of secrecy and the danger involved in speaking about their grandmother\'s manipulations. The brothers solidify their bond over shared stakes in their family\'s future, setting the stage for potential alliances against Livia\'s influence. The tension in the study underscores the fragile nature of power and truth in their world, culminating in a poignant realization of the alliances needed to navigate the treacherous political landscape.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: If you're in the mood to listen, I'll tell you what Postumus thinks of her.", "GERMANICUS: All right. I'm listening."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Pruning and Paranoia',
        s.description = 'Bathed in the bright Roman sunlight, Augustus meticulously tends to his garden, snipping at a bush with perhaps a bit too much force, while Livia watches with thinly veiled disapproval. The air, initially light with the sound of cheerful whistling, soon thickens with unspoken tensions.  Despite the idyllic setting of the Imperial Gardens, a subtle battle of wills unfolds between the aging emperor and his ever-watchful wife.  Livia\'s seemingly innocuous criticisms of Augustus\'s gardening quickly morph into pointed questions about his plans, revealing her deep-seated suspicion and desire for control. Augustus, weary of her constant scrutiny, deflects her inquiries with feigned nonchalance and petty retorts, emphasizing the growing chasm of mistrust and emotional distance that has opened between them. This scene acts as a microcosm of their fractured relationship, where even the simplest interactions are laced with political undertones and personal resentments, foreshadowing the larger power struggles at play within the empire.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Gardening Grievances and Marital Discord',
        e.description = 'Augustus, in the Imperial Gardens, is pruning a bush with excessive vigour, observed by a disapproving Livia. She criticizes his gardening, sparking a petty argument that quickly escalates into a passive-aggressive exchange, highlighting the deep-seated tensions and lack of genuine communication in their 50-year marriage.  The cheerful whistling clashes ironically with the sourness of their words, underscoring the superficiality of their public image versus the reality of their strained relationship.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: If you prune any more of that, there'll be nothing left.", "AUGUSTUS: What are you now, an expert on gardening? Is that something else you've become lately?", "AUGUSTUS: How long have we been married?", "LIVIA: Don't you remember?", "AUGUSTUS: 50 years. In all that time, you've never known been able to tell one plant from another and suddenly you know all there is to know about pruning. Wonderful!", "LIVIA: I think your brain's going soft, you know that? Nobody can talk to you anymore.", "AUGUSTUS: Anyone can talk to me any time - except you. You don't talk to people. You bully them.", "LIVIA: This conversation's becoming ridiculous.", "AUGUSTUS: Wrong. This conversation was ridiculous from the start."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Corsica Conspiracy and Livia\'s Suspicion',
        e.description = 'Livia, attempting a change of subject but still probing for information, reveals melon has arrived. She then casually questions Augustus about rumours of a trip to Corsica.  Augustus confirms his travel plans, stating it\'s for piracy matters, but Livia immediately expresses skepticism, questioning his motives and itinerary with thinly veiled suspicion.  She probes if he\'ll visit his banished grandson Postumus, revealing her awareness and concern about any potential shift in Augustus\'s plans for succession, while Augustus deflects her questions with feigned ignorance and offers her melon instead, further widening the emotional gulf between them. He then reveals Germanicus will accompany him part way, sending him to France, adding a layer of political maneuvering to the seemingly simple trip and subtly dismissing Livia’s concerns and offer to join.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Your melon's here.", "LIVIA: Is it true you're going to Corsica?", "AUGUSTUS: Yes.", "LIVIA: When?", "AUGUSTUS: Very soon.", "LIVIA: You never told me.", "AUGUSTUS: No?", "LIVIA: I don't know what's come over you. You seem to tell me nothing.", "AUGUSTUS: Haha. Well, you get to know everything anyway.", "LIVIA: Why are you going to Corsica?", "AUGUSTUS: Because the Corsicans asked me to go.", "LIVIA: What for?", "AUGUSTUS: In a matter of piracy. They've been complaining for years. They're losing business.", "LIVIA: Couldn't you have asked one of the Consuls to go?", "AUGUSTUS: Why should I?", "LIVIA: I know how you hate travelling by sea.", "AUGUSTUS: No. No, it doesn't bother me.", "LIVIA: Will you be stopping off anywhere on the way?", "AUGUSTUS: Such as where?", "LIVIA: I don't know! You'll be passing the island of your grandson's banishment.", "AUGUSTUS: Which one is that?", "LIVIA: Planasia. Had you forgotten?", "AUGUSTUS: I hadn't thought about it. Why should I stop off there?", "LIVIA: Well, I thought you might take this opportunity of inspecting it.", "AUGUSTUS: Have you tried this melon? They're from southern Spain. Try one.", "LIVIA: I don't want any!", "AUGUSTUS: You don't eat enough fruit. If you ate more fruit you wouldn't get so many wrinkles.", "LIVIA: Would you like me to come with you?", "AUGUSTUS: What for?", "LIVIA: It's an arduous journey to make at your age, on your own. You might fall ill and die.", "AUGUSTUS: Oh, the sea air will do me good. Besides, Germanicus is traveling with me part of the way. I'm sending him to France. What a pillar and support that boy's become.", "LIVIA: I see.", "AUGUSTUS: That's settled, then?", "LIVIA: Yes."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'The Web of Deceit',
        s.description = 'In the opulent yet suffocating confines of Livia\'s chambers, a confrontation brews as Livia confronts her granddaughter Livilla, her voice sharp and laden with accusation. The richly adorned room, with its heavy drapery and intoxicating scent of incense, feels like a trap, filled with the palpable tension of familial treachery. Livilla, caught in the web of her grandmother’s cunning, shrinks under Livia’s piercing gaze, each word exchanged thick with implications of betrayal and ambition. Livia’s relentless probing uncovers the whispers of power concerning Postumus Agrippa, revealing that secrets are not only currency but also weapons in this deadly game of thrones. The grandiosity of the chambers stands in stark contrast to the emotional turmoil unfolding within, encapsulating the ruthless pursuit of power that defines the Julio-Claudian dynasty. This scene is pivotal, heightening the stakes of familial loyalty against the backdrop of ambition and deceit, and revealing the lengths to which Livia will go to maintain control.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_livia_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Livia Confronts Livilla',
        e.description = 'Livia confronts Livilla, accusing her of double dealing, as the tension thickens in the air. Livilla, taken aback, insists she has not betrayed her grandmother, but Livia\'s sharp questioning exposes the cracks in Livilla\'s confidence. The conversation reveals Livilla\'s longing for Postumus Agrippa and hints at her dissatisfaction with her own marriage. Livia manipulates the dialogue, suggesting that Livilla could win Postumus\'s favor by exploiting her supposed victimhood. The exchange lays bare the ruthless ambitions fueled by familial strife, with Livia\'s power play starkly contrasting Livilla\'s vulnerability.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Double dealing, are we?", "No! It wasn't me, I swear it! Why should I?", "Come on, you're cleverer than that. You'd tell him I forced you into it and you'd beg his forgiveness and shed a few tears."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Unraveling Secrets',
        e.description = 'The dialogue continues as Livia pushes, suspecting that someone has informed Postumus of imperial secrets. Livilla insists it\'s not her fault that Castor knows something, revealing the complexities of their familial relationships. Livia\'s pointed remarks about Livilla\'s black eye hint at the tensions bubbling beneath the surface, while she dismisses the possibility of Claudius being involved, deeming him a fool. Livia\'s cold logic and manipulation are on full display as she considers the implications of knowledge and the peril of letting secrets slip, showcasing her ruthless ambition and keen instincts.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh, yes, Castor knows. That's why you got your black eye, wasn't it?", "The fool? His brains are addled. He sees nothing and he hears nothing."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Reunion on Barren Shores: Father and Banished Son',
        s.description = 'On a windswept, rugged island, the turbulent sea mirroring the emotional storm within, Augustus seeks out his exiled son, Postumus. The setting is stark, dominated by rocky outcrops and the relentless ocean, amplifying the rawness of their encounter. The air is thick with unspoken accusations and years of festering resentment. Postumus, gaunt and hardened by isolation, greets his father with biting sarcasm, his words sharp as the island\'s cliffs. Augustus, weary and aged, approaches with a mix of regret and paternal yearning, attempting to bridge the chasm of pain he has created. The scene pulsates with tension, a heart-wrenching clash between a father wrestling with his past mistakes and a son grappling with the scars of abandonment. This meeting is a crucial turning point, revealing Augustus\'s growing awareness of Livia\'s manipulations and his desperate attempt to reconcile with Postumus before it\'s too late, set against the unforgiving backdrop of nature\'s indifference.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_rugged_island_retreat'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Sarcastic Welcome on Exile\'s Isle',
        e.description = 'Postumus, thin and pale from years of isolation, greets Augustus and Fabius with cutting sarcasm. He immediately establishes a hostile tone, mocking the imperial visit to his desolate prison and questioning the \'tourists\' who have come to observe him. His words drip with bitterness, highlighting his confinement and the perceived cruelty of his father\'s actions, creating a palpable sense of unease and resentment from the outset.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["POSTUMUS: Well, well, well.. What have we here? Tourists? Have you come to see the beast in his cage? Is the rock bare enough for you, Father? Does it conform to your notions of smallness, or have you found a smaller one still?"]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Dismissal and Bitter Accusation',
        e.description = 'Augustus, observing Postumus\'s weakened state, attempts a gentle approach, but Postumus swiftly deflects any sympathy. He pointedly dismisses Fabius\'s presence, emphasizing the strained and personal nature of his relationship with Augustus. Once alone with his father, Postumus unleashes a torrent of pent-up resentment, accusing Augustus of neglect and indifference, setting the stage for a raw and emotionally charged confrontation between father and son on the desolate island.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: How thin you look. How pale.", "POSTUMUS: What did you expect? A fat, jolly man full of laughs and jokes? You must forgive me, Father. It's been four years since I saw a living soul apart from the guards. I wasn't prepared for visitors.", "AUGUSTUS: Leave us.", "POSTUMUS: They never told me it'd be like this.", "POSTUMUS: Well, what did you come for then? A tour around the island?"]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Confession of Mistakes and Plea for Understanding',
        e.description = 'Augustus, visibly moved by Postumus\'s pain, admits his culpability. He offers himself as a target for Postumus\'s anger, acknowledging that he deserves punishment for his actions.  His tearful demeanor and confession of \'mistakes\' reveal a deep-seated regret and a willingness to endure Postumus\'s wrath, highlighting his desire for some form of reconciliation, however painful, before his own time runs out.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: Don't, don't, don't say that.", "AUGUSTUS: Well, then wound me if you must. I deserve it. You have a knife in your hand. I wouldn't blame you if you used it!", "AUGUSTUS: Yes, tears come easily to me. I don't deny it.", "AUGUSTUS: Mistakes have been made...", "AUGUSTUS: Oh, Postumus..."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'Unleashing Years of Anguish and Fear',
        e.description = 'Postumus rejects Augustus\'s tears as insufficient, his bitterness erupting after years of solitary confinement. He recounts the psychological torment of his exile, revealing the depth of his emotional scars. He vividly describes the constant fear of assassination, highlighting the profound damage Augustus\'s actions have inflicted on his psyche and emphasizing the seemingly irreparable rift between them.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["POSTUMUS: Mistakes! Is that what you call them? You've made mistakes and you think a few tears will put them right?", "POSTUMUS: What have you done to me? Four years! What have you done with my life?", "POSTUMUS: When those guards came in, I thought, \"This is it. This is the end that he's planned for me. This is what I've waited four years for. He's sent them now to finish me off.\"", "AUGUSTUS: What can I say? What can I say?"]
    ;
MERGE (e:Event {uuid: 'event_6_5'})
    ON CREATE SET
        e.title = 'Revelation of Deception and Promise of Return',
        e.description = 'Augustus shifts from apology to explanation, revealing the influence of deceitful individuals, pointedly mentioning Livia\'s treachery as the primary source of his past errors. He discloses that Germanicus, through Claudius\'s information, unveiled the truth, marking Claudius as an unexpected source of insight.  Augustus offers a glimmer of hope, promising Postumus\'s return to Rome and hinting at the political machinations required to overturn his banishment, suggesting a path towards reconciliation and a restoration of Postumus\'s rightful place.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS: A day hasn't passed when I haven't thought of you.", "AUGUSTUS: There are such liars in the world, such cheats! And nowhere more, it seems, than among my own. I've had to live this long to find that out.", "POSTUMUS: They've made a fool of you.", "AUGUSTUS: There are places where they've made a god out of me, but my own family have made me a fool. And Livia, it seems, more than anyone.", "POSTUMUS: She lied to you.", "AUGUSTUS: Germanicus told me.", "AUGUSTUS: Claudius told him, apparently. What do you make of him, eh? He's a curious chap. I mean, he's a bit of a fool, isn't he?", "AUGUSTUS: I've been wrong about a lot of things. Well, I'm here to make amends. And to tell you it won't be long before you're back in Rome.", "AUGUSTUS: No, no, no. The Senate passed a decree making your banishment permanent. I must get that decree reversed. That will take a bit of time."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'A Delicate Conspiracy',
        s.description = 'Within the richly appointed chambers of Livia Drusilla, the air thick with incense, an intricate dance of power unfolds. Livia, imperious and sharp, welcomes Camilla Pulchra, the serene chief Vestal, whose beauty contrasts with the tension simmering just beneath their cordial facade. The chamber is adorned with tapestries, and the atmosphere is laden with unspoken agendas. As they engage in a seemingly benign discussion about the rebuilding of the House of the Vestals, a sinister undercurrent emerges; Livia’s keen intellect seeks to manipulate Camilla’s desires for her own ends. The conversation navigates through promises and political maneuvering, revealing the depth of Livia\'s ambition and the lengths to which both women will go to secure their positions amidst the chaos of impending change in Rome. This scene not only illustrates the strategic interplay between two powerful women but also hints at the larger machinations at play within the imperial court, setting the stage for further conflicts.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_livia_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Livia Welcomes Camilla',
        e.description = 'Livia, seated in her high-backed chair, greets Camilla Pulchra with courteous compliments, showcasing the veneer of civility that cloaks their underlying power play. Their interaction is filled with pleasantries that mask the tension between personal ambition and political necessity.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You look well, Lady, which is a blessing for Rome and for all of us.", "And you, my dear, are as beautiful and serene as ever."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'The Proposal of Rebuilding the Vestals',
        e.description = 'The discussion shifts to the long-desired rebuilding of the House of the Vestals. Livia expresses her shared dream and suggests that they may finally have the opportunity to persuade Augustus to fulfill promises made by the Senate. Camilla reveals her hopes and the Senate\'s repeated failures, revealing her vulnerability and desire for legacy.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["It's been a dream of mine to leave that House more beautiful than when I entered it.", "I think it's time we did something."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'The Allure of Augustus\'s Will',
        e.description = 'Livia reveals her suspicions regarding Augustus\'s will, suggesting he may have set aside a sum for the Vestals. Camilla\'s eagerness ignites as she confesses that Augustus has indeed altered his will and hints at the presence of Fabius Maximus as a witness, setting the stage for Livia\'s manipulative scheme.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["I have a feeling he's set aside a sum for it in his will.", "Oh, but that's nothing. I have the use of his seal."]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'A Conspiracy is Born',
        e.description = 'Livia\'s suggestion of a covert examination of Augustus\'s will unfolds as a tantalizing conspiracy, enticing Camilla to consider breaking her vows for the sake of their shared ambition. This moment encapsulates the moral compromise both women face as they navigate the treacherous waters of power within the court.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["What a pity we couldn't take it out and have a look at it.", "But in such a good cause."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Premonitions of Agrippa',
        s.description = 'Confined to his dimly lit bedchamber, Augustus writhes in pain, the ulcer in his belly a raging fire. Montanus, the physician, futilely attempts to soothe the Emperor with cold compresses and bitter potions, his medical pronouncements lost on Augustus’s fevered mind. The air is thick with the scent of illness and impending mortality, a stark contrast to the grandeur usually associated with the Emperor. Fabius, ever loyal, stands vigil, his face etched with concern. Augustus, gripped by premonitions of death, recounts chilling omens - an eagle circling Agrippa\'s temple and lightning striking the \'C\' from his statue\'s inscription. These signs, interpreted as a divine decree of his demise within a hundred days, weigh heavily on his spirit, overshadowing any medical advice. Despite Fabius’s gentle attempts to offer alternative interpretations, a palpable sense of dread permeates the room, the Emperor wrestling with the chilling certainty of his approaching end and the ominous message from the gods.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_bedchamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Agony and Futile Remedies',
        e.description = 'Augustus, consumed by agonizing pain, cries out for Montanus\'s help. The physician\'s attempts to alleviate the Emperor\'s suffering with cold compresses prove ineffective against the fiery ulcer tormenting him. Montanus offers a potion, which Augustus drinks with a grimace, finding little relief. The physician, resorting to medical reason, prescribes a bland diet and rest, suggesting a peaceful retreat to Capri to escape the burdens of rule and the relentless pain.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: Aaah! Oh, Montanus. Oh, help me, Montanus.", "MONTANUS: If you'd lie still and let the cold compresses work.", "AUGUSTUS: Oh, the pain's in my belly, you fool! Not in my head.", "MONTANUS: Here, drink this. It will ease the pain.", "AUGUSTUS: Oh, it's like a fire in there.", "MONTANUS: It's the ulcer again. I warned you. Too much work and too much worry. Will you follow a diet if I prescribe it?", "AUGUSTUS: Yes, yes.", "MONTANUS: Eat only milk products and eggs. And give up work for a while or I won't be responsible. When you feel a little better, take a holiday. Go to Capri or somewhere and rest. Paddle in the sea, get a breath of fresh air. I'll talk to the Lady Livia about it."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Ominous Signs and a Looming Death',
        e.description = 'Ignoring Montanus’s medical advice, Augustus shifts to a darker preoccupation: premonitions of death. He confides in Fabius, recounting two chilling omens. First, an eagle circling the temple of Marcus Agrippa, then landing on the \'A\' of Agrippa’s name. Second, lightning striking a statue of Caesar, melting the \'C\'. Augustus interprets these signs as a clear divine message: his reign is ending, and an Agrippa, specifically Postumus, is destined to succeed him. He believes the \'C\' struck off \'Caesar\' signifies \'Centum,\' Latin for a hundred, meaning he has only a hundred days left to live.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: I've had premonitions. Premonitions of death.", "FABIUS: We all have them.", "AUGUSTUS: No, no, no. This is serious. Listen, old friend, let me tell you. Two weeks after we came back from you know where, yes, I was in Mars Field giving a libation. A little ceremony. Well, you remember?", "FABIUS: Oh, I remember, but I wasn't there.", "AUGUSTUS: No?", "FABIUS: No.", "AUGUSTUS: Well, nearby, there's a temple built in the memory of Marcus Agrippa.", "FABIUS: Yes, I know it.", "AUGUSTUS: An eagle circled my head five times, then flew off and settled on the \"A\" of Agrippa's name.", "FABIUS: Well, Caesar...", "AUGUSTUS: No, no, no, don't lie to me. Don't lie to me. It's clear what it means, let's not pretend. It was telling me that my time had come and that I must give way to someone by the name of Agrippa.", "FABIUS: Postumus?", "AUGUSTUS: Who else?", "FABIUS: Did you consult an augur?", "AUGUSTUS: No. I don't need an augur, it's plain. Plain as the nose on your face.", "FABIUS: Well, there may be some other explanation. You're not an expert on the interpretation of signs.", "AUGUSTUS: Then listen to this. The following day, lightning melted the \"C\" on my name on a statue nearby. It struck the \"C\" off \"Caesar\". Do you follow, \"C\"? What does \"C\" mean?", "FABIUS: A hundred.", "AUGUSTUS: A hundred. Exactly! Livia saw it. She went to an augur to find out what it meant. She wouldn't tell me, but I forced it out of her. It means that I have only a hundred days to live. I shall die in a hundred days.", "FABIUS: Or weeks.", "AUGUSTUS: Eh?", "FABIUS: Why shouldn't it be weeks? Or months? Why shouldn't it mean that you'll live to be a hundred?"]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'A Glimmer of Hope or False Comfort?',
        e.description = 'Fabius, attempting to dispel Augustus’s morbid certainty, offers alternative interpretations of the omens. He suggests that \'C\' could represent weeks or months, or even that the augur Livia consulted might have been mistaken. This seeds a flicker of hope in Augustus, who, clinging to any possibility of reprieve, wonders if Livia sought out an incompetent or biased augur, momentarily easing his dread with a fragile possibility of extended life.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: Do you think so?", "FABIUS: Why not?", "AUGUSTUS: Perhaps she went to the wrong augur. Perhaps he looked at the wrong book."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Tensions in Livia\'s Lair',
        s.description = 'In the luxurious yet suffocating confines of Livia\'s chambers, opulence collides with cold ambition. The air is thick with tension as Claudius enters, his stammering facade masking a deeper awareness of the dangerous game being played around him. Livia\'s icy demeanor cuts through the warm morning light, her disdain palpable as she dismisses Claudius\'s aspirations and ridicules his stammer. This intimate yet hostile encounter lays bare the precarious nature of familial bonds within the imperial court. Tiberius\'s arrival shifts the atmosphere, revealing a son suffocated by years of neglect and ambition, while Livia\'s chilling revelations about Augustus\'s altered will drop like a bombshell, igniting a tempest of resentment and fear. As whispers of betrayal swirl, the scene encapsulates the treachery lurking beneath the surface of imperial power and the fragile dynamics that govern it.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_livia_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Claudius\'s Humiliation',
        e.description = 'Claudius enters Livia\'s chambers hesitantly, seeking news of Augustus\'s health. His stammer sets the tone for a demeaning exchange as Livia mocks his efforts to further his scholarly pursuits, threatening to reduce him to a mere object of ridicule. Despite his apologies and attempts to assert his intention, Claudius spills wine, compounding his embarrassment and vulnerability in Livia\'s eyes. This moment captures the power dynamics at play, illustrating his perceived foolishness against Livia\'s icy authority.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["G-G-Good morning, Grandmother. Mother and I would like to know if there's any ch-change in Augustus' health.", "You'll do no such thing.", "If that head of yours doesn't stop twitching, I'll have it off and stuck on a pole."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Tiberius\'s Cynicism',
        e.description = 'Tiberius enters, observing the interaction between Claudius and Livia with a cynical eye. His biting commentary highlights the dysfunction within the family and the court, revealing his own feelings of neglect and frustration towards Augustus. As he confronts Livia about Augustus\'s altered will, the atmosphere thickens with tension, underscoring the bitter rivalry and the stakes of power at play. Tiberius\'s explosive outburst reveals his pent-up resentment towards a father who has never acknowledged his efforts, setting the stage for further confrontations.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["That grandson of yours could wreck the empire... just by strolling through it.", "I'm sick of it! The gods know I've done my best!", "Well, damn him! I retired before and I can retire again!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Livia\'s Manipulation Revealed',
        e.description = 'Livia reveals that Augustus has altered his will in favor of Postumus, igniting turmoil within Tiberius. Her words, laced with cold calculation, pit Tiberius against the prospect of losing the throne to his stepson. The chilling premonition in Livia’s eyes as she suggests the potential for Augustus\'s demise underscores her manipulative nature, revealing the depths of her ambition. Tiberius\'s outburst reflects a mixture of anger, fear, and desperation, highlighting the volatile dynamics of power and family within the court.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["He's altered his will.", "Trust you to get it wrong. I must have been nodding when I gave birth to you.", "Well, don't bother on my account! I'm sick of it!"]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Whispers of Trust in the Imperial Garden',
        s.description = 'In the meticulously sculpted Imperial Gardens, a sanctuary of verdant calm, Emperor Augustus seeks out Claudius. Sunlight filters through the leaves, dappling the stone bench where Augustus sits, his weariness evident despite a veneer of resolve. The air is still, punctuated only by the gentle murmur of fountains and distant palace sounds, creating an atmosphere of fragile peace amidst the ever-present courtly tensions. Augustus, seemingly recovered from his illness but subtly frail, engages Claudius in conversation, initially feigning concern for Claudius’s mother as a pretext. The scene gradually shifts from polite pleasantries to a deeply personal and revealing exchange as Augustus confesses his misjudgment of Claudius and unveils his secret visit to Corsica and alterations to his will. The emotional atmosphere transitions from hesitant formality to a burgeoning intimacy and trust, underscored by Augustus\'s melancholic reflections on his reign and unexpected acknowledgement of Claudius as a newfound friend. This pivotal scene marks a significant turning point in their relationship, establishing an unlikely alliance and setting the stage for future confidences and dramatic revelations.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_gardens'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'An Emperor\'s Overtures in the Garden',
        e.description = 'Augustus intercepts Claudius in the palace gardens, initiating a seemingly casual conversation. He feigns concern for Claudius\'s mother and his scholarly pursuits, drawing Claudius into a private exchange away from the prying eyes of the court. Augustus\'s initial demeanor is polite but subtly probing, setting the stage for a deeper, more significant revelation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: I... I... I was just going to see your mother. I've heard she's not very well. I wanted to have a few words with you, but I'm dragging you away from your work.", "CLAUDIUS: N-no, really.", "AUGUSTUS: Are you sure? I'll only stay a minute, then I'll go."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Confession of Self-Cure and Distrust',
        e.description = 'Augustus recounts his self-proclaimed recovery from illness, detailing his self-imposed diet of milk and garden fruit. This anecdote reveals his deep-seated distrust of the palace kitchens and the court, hinting at a pervasive paranoia and a yearning for purity and control even in his most basic needs. His mention of Capri and Nola foreshadows his impending departure and the uncertain future.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: They put me on this diet, you know, but I cured myself. You know how? I refused to eat. Oh, a little milk and fruit. I got myself this cow and I milked it myself. And the fruit I picked from the garden, so it was untouched by human hand, you might say, except my own. You never know what gets into food when it goes into the kitchens. The slaves are so careless. Anyway, I'm still here. Yes. I'm going away for a little holiday. First to Capri and then to Nola. I'm a bit tired."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'An Emperor\'s Vulnerable Question',
        e.description = 'In a moment of unexpected vulnerability, Augustus directly asks Claudius if he harbors ill will towards him. This question cuts through the polite facade, revealing Augustus\'s deeper purpose: to assess Claudius\'s true feelings and intentions. It’s a poignant inquiry from a powerful ruler seeking genuine connection and reassurance in his twilight years, hinting at past misjudgments and regrets.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: ...Claudius, do you bear me any ill will?", "CLAUDIUS: Ill will? Why should I?"]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'Confession of Misjudgment and Praise from Germanicus',
        e.description = 'Augustus confesses his past misjudgment of Claudius, admitting that appearances can be deceiving and acknowledging his initial perception of Claudius as a fool. He reveals that Germanicus has spoken highly of Claudius, praising his loyalty to friends, Rome, and truth. This revelation marks a significant shift in Augustus\'s view of Claudius, acknowledging his hidden virtues and laying the foundation for trust.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Oh, it's so funny we can be so wrong about people. I was wrong about you. You see, we judge much too much on appearances. I mean, your appearance is against you. I mean, you know that, don't you? You give everybody the impression that you're a bit of a fool. No point in mincing matters. But you're not such a fool, are you?", "CLAUDIUS: I hope n-not.", "AUGUSTUS: Germanicus told me all about you. He said that you were loyal to three things - to your friends, to Rome and to the truth. I mean, that's a wonderful thing to say of a person. I'd be very proud if he said that about me."]
    ;
MERGE (e:Event {uuid: 'event_10_5'})
    ON CREATE SET
        e.title = 'Republican Heart and Secret Corsica Trip',
        e.description = 'Augustus reveals his republican ideals, confessing that he never intended to rule for so long and that circumstances led him down a different path. He then confides in Claudius about his secret trip to Corsica to visit someone – Postumus Agrippa – and implies Claudius\'s indirect role in facilitating this meeting through Germanicus. This disclosure underscores Augustus\'s growing trust in Claudius and hints at clandestine political maneuverings.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS: Well, well. He's a great man, you know. A fine Roman in the best tradition - even though he is a bit of a republican. What did you think? I didn't know? I'm a republican myself, at heart. I mean, you know that, don't you? I mean, it was never my intention to rule for so long, but...I don't know, things just didn't work out. I kept wanting to retire. Your father wanted me to retire. I don't know. It just never happened. So many things turn out different from the way you hoped. I went to Corsica, you know, and I paid a visit to a certain island and I saw a certain person. Now, none of that would have happened but for you. Germanicus told me everything."]
    ;
MERGE (e:Event {uuid: 'event_10_6'})
    ON CREATE SET
        e.title = 'Altering the Will and Seeking Trust',
        e.description = 'Augustus divulges the highly sensitive information that he altered his will at the Vestal Virgins after returning from Corsica. He emphasizes the secrecy of this act, stating that even Livia is unaware. By sharing this profound secret with Claudius and explicitly requesting his silence, Augustus offers the ultimate sign of trust, solidifying their burgeoning friendship and foreshadowing Claudius\'s crucial role in the unfolding succession crisis.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["AUGUSTUS: Anyway, when I got back, I paid a visit to the Vestal Virgins and I made some alterations to a certain document there that I'd left. Now, no one knows about that - not even your grandmother - so not a word.", "CLAUDIUS: Oh, you can tr-trust me.", "AUGUSTUS: Yes. I see now that I can."]
    ;
MERGE (e:Event {uuid: 'event_10_7'})
    ON CREATE SET
        e.title = 'A Newfound Friendship and Future Confidences',
        e.description = 'Augustus concludes the conversation by declaring that he has found a new friend in Claudius, expressing surprise and gratitude at this unexpected connection in his old age. He promises future conversations and confidences, cementing their alliance and hinting at Claudius\'s elevated status in Augustus\'s eyes as someone he can rely on and confide in during his final days. The scene ends on a note of fragile hope and newfound purpose for Claudius.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["AUGUSTUS: When I get back, we'll talk again. We'll talk many times, eh? I've found another friend. You see, even at my age, a man finds he has friends he never even dreamed of."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'A Game of Fate',
        s.description = 'The scene unfolds in Augustus\'s lavish chambers, alive with the sounds of laughter and excitement as a boisterous dice game captivates the participants. Augustus, flushed with exhilaration, throws the dice with childlike delight, reveling in his perceived luck and encouraging the others to join in the merriment. The air is thick with a heady mix of triumph and camaraderie, but beneath the surface, the tension simmers. Livia, ever the watchful strategist, urges Augustus to retire, her voice cutting through the revelry like a knife, a subtle reminder of the fragile line between joy and disaster. The atmosphere shifts dramatically as Augustus suddenly clutches his stomach in agony, the jovial laughter fading into a chilling premonition of fate’s cruel hand. The interplay of lightheartedness and impending doom encapsulates the duality of imperial life, where moments of joy can give way to chaos in an instant, mirroring the broader themes of power and mortality that haunt Rome.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Augustus Celebrates Victory',
        e.description = 'The night is alive with energy as Augustus throws the dice, his laughter echoing through the chamber. He boasts of his luck, claiming to have thrown Venus three times in a row, inviting his companions to join in the betting. The camaraderie among the group is palpable, with Augustus urging Junius to bet despite his lack of funds, showcasing the carefree nature of the moment. The stakes rise as bets are placed, and the dice are rolled, each throw heightening the tension and excitement until the jovial atmosphere is abruptly shattered by Augustus\'s sudden illness.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Oh... Oh, what luck, Livia! I've thrown Venus three times in a row! Come on, pay up, all of you!", "Junius, Junius, you're not betting.", "Well, it's only a game.", "What did I tell you? Come on, pay up."]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'The Sudden Illness',
        e.description = 'As Augustus revels in his victories, the atmosphere shifts dramatically when he suddenly clutches his stomach in pain. His joyful demeanor collapses into one of distress as he admits to feeling sick and retches. Livia, quick to respond, moves to support him, guiding him towards the door with an urgency that disrupts the previous revelry. This sudden turn from laughter to turmoil starkly highlights the fragility of life and power in the Roman court, where joy can swiftly descend into chaos.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["What's the matter?", "I feel sick... Take me to my room."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Figs and Fury',
        s.description = 'In a stark villa on the outskirts of Nola, Emperor Augustus, weakened and feverish, lies upon a simple bed. The room is sparsely furnished, emphasizing the emperor\'s rejection of opulence in his illness, a symbolic shedding of imperial grandeur as mortality closes in.  Sunlight struggles to penetrate through shuttered windows, casting long shadows that amplify the sense of confinement and illness. The atmosphere is tense, heavy with the emperor\'s stubborn will and the unspoken anxieties of those around him.  This scene underscores Augustus\'s deteriorating physical and mental state, highlighting his increasing paranoia and desperate attempts to exert control over his failing body.  His rejection of conventional food in favor of figs from the garden is not just a dietary whim, but a potent symbol of his desire to purge the \'poison\' of courtly life and reclaim a primal connection to nature, even in his final moments. The scene serves to heighten the sense of crisis and foreshadow the imminent power vacuum.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'The Emperor\'s Fig Decree',
        e.description = 'Confined to his sickbed in the austere villa, Augustus, frail yet resolute, vehemently refuses all nourishment offered to him. His voice, though weakened, carries the unmistakable weight of imperial command as he declares his exclusive diet of figs, to be personally plucked from the villa garden. This stubborn insistence on figs alone underscores his rejection of conventional care and perhaps symbolizes a deeper distrust of those around him, suggesting a fear of poisoning or manipulation. His demand to pick the figs himself further emphasizes his desperate need to maintain control, however small, amidst his failing health and the looming uncertainties of his reign.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: No food! Do you hear? I'll eat... I'll eat figs from the garden, nothing else. Nothing!", "AUGUSTUS: And I'll... I'll pick... pick them myself."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Descent into Madness',
        s.description = 'In the secluded confines of the Secluded Quarantine Villa, a space heavy with the scent of herbs and the oppressive atmosphere of dread, the frail figure of Augustus lies exposed, wrapped in the shadows of his mortality. Montanus, a worried physician, wrings his hands, filled with frustration and concern, as he examines the Emperor’s deteriorating condition. The villa, once a sanctuary of opulence, now feels like a gilded cage, echoing with Augustus\'s stubborn denial of medical assistance. The tension mounts as Augustus vehemently refuses any aid, invoking a fierce and paranoid loyalty to his own misguided wisdom. The air is thick with unspoken fears; Montanus’s pleas clash against Augustus’s frantic declarations, revealing the depths of the Emperor\'s madness and determination to reject human touch, even from Livia, his own wife. This scene captures the essence of Augustus\'s decline, both physically and mentally, as he clings to fig-based remedies, a desperate attempt to control his fate amidst the swirling chaos of impending death. It serves as a poignant reminder of the fragility of power and the lengths to which one will go to resist the inevitable.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Montanus Urges Medical Help',
        e.description = 'Montanus, the worried physician, inspects Augustus and expresses his frustration over the Emperor\'s refusal to accept treatment. He questions Augustus\'s sanity for insisting on consuming figs from the garden when there are more effective remedies available. Montanus\'s desperation highlights the urgency of Augustus\'s deteriorating health, as he implores the Emperor to allow him to administer medicine to avert further complications.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Are you mad? Figs from the garden? Aren't your bowels loose enough already? I must give you some medicine."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Augustus\'s Defiant Refusal',
        e.description = 'Augustus, filled with a fierce resolve, vehemently rejects Montanus\'s suggestions, declaring a curse upon all things touched by human hands—signifying his deep-seated paranoia and distrust. His repeated insistence on avoiding any form of human interaction, including from Livia, showcases his desperate attempt to exert control over his own impending fate, reflecting the madness that has begun to encroach upon his once-mighty psyche.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["No! Curse it! Nothing that's been touched by human hand, do you hear? Not even Livia's. Nothing. Nothing."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'The Emperor\'s Fig Fast',
        s.description = 'Outside the secluded villa, bathed in the harsh midday sun, physician Montanus urgently briefs Livia. The air is thick with unspoken anxiety, the tranquility of the villa exterior a deceptive mask for the turmoil within. Montanus, his voice hushed with concern, details Augustus\'s alarming refusal of all prepared food, clinging instead to a bizarre diet of figs plucked directly from the garden trees. This self-imposed regimen, steeped in an unnerving obsession with purity and distrust of human touch, underscores the Emperor\'s rapidly deteriorating condition.  The scene is charged with a palpable tension, hinting at the futility of conventional medicine and the encroaching shadow of mortality. Livia, ever composed, absorbs the information, her outward calm betraying the wheels of calculation turning behind her watchful eyes. The setting, though seemingly serene, becomes a stage for quiet desperation and veiled political maneuvering, as the health of the empire hangs precariously in the balance with each fig Augustus consumes. This isolated villa, meant for respite, now echoes with the grim pronouncements of illness and the subtle tremors of impending power shifts.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Physician\'s Ominous Report',
        e.description = 'Standing just outside the villa, Montanus conveys to Livia the dire nature of Augustus\'s current ailment. He emphasizes the Emperor\'s complete rejection of prepared food, fixating solely on figs gathered directly from the garden, untouched by human hands.  This peculiar dietary restriction, born from an unexplained obsession, baffles Montanus, yet he also acknowledges a past instance where Augustus seemingly healed himself through similar unconventional means.  The physician expresses his deep concern about Augustus\'s overall health, concluding with the stark assessment that the Emperor is far too unwell to undertake a journey back to Rome. This pronouncement seals Augustus\'s fate within the villa\'s walls, isolating him further and heightening the sense of impending crisis.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MONTANUS: It's a very bad attack. He'll eat no prepared food, none. Those are his instructions. Only figs from the tree.", "MONTANUS: Perhaps he's right, I don't know. He cured himself before, perhaps he'll do it again.", "LIVIA: Did he give any reason?", "MONTANUS: None. He has this obsession that it mustn't be touched by human hand, not even by yours.", "MONTANUS: But he's too ill to go to Rome. He'll have to stay here in Nola for a few days."]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'Livia\'s Manipulation',
        s.description = 'In the dimly lit confines of the Secluded Quarantine Villa, Livia sits beside Augustus\'s frail form, her expression a tapestry of feigned concern and underlying ambition. The room, heavy with the scent of incense and the weight of impending mortality, amplifies the tension of their fraught relationship. Livia’s words flow like a silken thread, laced with subtle accusations and veiled reminders of her loyalty to Augustus and to Rome. As she criticizes his stubbornness in refusing proper food, she simultaneously weaves a narrative that underscores her role as the true caretaker of the empire. The air crackles with unspoken power dynamics, as Livia deftly shifts the conversation to Tiberius, reminding Augustus of familial bonds and past grievances. Her insistence that Augustus has neglected Tiberius serves as both manipulation and a reminder of her own underestimated influence. The scene encapsulates the chilling atmosphere of political intrigue and personal betrayal, highlighting Livia\'s dual role as a devoted wife and a cunning strategist. It reveals her determination to assert control over the fate of Rome, even as she cloaks her ambitions in the guise of concern for her husband.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Livia\'s Careful Manipulation',
        e.description = 'Livia sits beside Augustus, cloaked in a facade of concern as she tries to coax him into eating. Her words drip with thinly veiled resentment, subtly accusing him of jeopardizing his health with his stubbornness over figs. She cleverly shifts the emphasis onto Tiberius, suggesting that Augustus has always favored one over the other, thus playing on Augustus\'s guilt while positioning herself as the voice of reason. Livia’s insistence on her loyalty and sacrifice for Rome, despite her own manipulative tactics, underscores her complex character and highlights the tension in their relationship. This moment serves to reveal the fractures in their familial bonds and the political implications of their discourse.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Are you feeling better? There's a delegation here from Rome. They're waiting to see you.", "I only came on this journey to look after you, and you won't let me or anyone else cook for you.", "I've often spoken to you about it. You made fish of one and foul of the other so often that no one knew where he was or what he was."]
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'The Emperor\'s Demise',
        s.description = 'Within the austere confines of Augustus’s quarantine villa, daylight filters through the shutters, casting long shadows across the chamber, amplifying the somber mood. The air is heavy with the unspoken weight of mortality, the silence punctuated only by the rustle of fabrics as Tiberius enters, his face a mask of grim anticipation. Livia, composed yet radiating an aura of chilling authority, stands near the lifeless form of Augustus. The room, stripped of its imperial grandeur, becomes a stage for the stark reality of death and the cold calculus of power. The emotional atmosphere is thick with a blend of practiced grief and ruthless ambition, a silent acknowledgment that with Augustus’s last breath, an era has ended and a new, potentially darker one is about to begin. This scene serves as the linchpin in the narrative, solidifying the succession and underscoring the themes of mortality, ambition, and the brutal transfer of power in Rome.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Inquiry of the Emperor\'s Condition',
        e.description = 'Tiberius enters the villa chamber, his expression grave, reflecting the gravity of the situation. He directly approaches Livia, his gaze seeking immediate information about Augustus\'s state. His simple question, \'How is he?\', cuts through the heavy atmosphere, demanding a definitive answer about the emperor\'s precarious condition. This query sets the stage for the pivotal revelation to come, highlighting Tiberius\'s anxious anticipation and the palpable tension in the room.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["TIBERIUS: How is he?"]
    ;
MERGE (e:Event {uuid: 'event_16_2'})
    ON CREATE SET
        e.title = 'The Death of Augustus Announced',
        e.description = 'Livia pauses, a beat of calculated drama, her eyes locking with Tiberius’s. In a voice devoid of overt emotion yet laden with finality, she delivers the monumental news: \'He\'s dead. Augustus is dead.\' This declaration hangs in the air, a stark pronouncement that shatters the fragile hope and confirms the empire\'s shift into a new era. The words are delivered with a chilling calmness, emphasizing Livia\'s control even in this moment of profound change, and highlighting the irreversible nature of Augustus\'s passing.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: He's dead. Augustus is dead."]
    ;
MERGE (e:Event {uuid: 'event_16_3'})
    ON CREATE SET
        e.title = 'Prophecy of Upheaval and Imperial Command',
        e.description = 'Tiberius absorbs the seismic news with a slow, deliberate nod, his gaze shifting towards the still form of Augustus. He murmurs, \'The earth will shake,\' recognizing the profound implications of this death for Rome and the world. Livia, already transitioning into her role as the power behind the new throne, rises and immediately directs Tiberius. She declares her intent to address the senators and consuls, asserting her command and instructing Tiberius to remain with Augustus\'s body until her return. This exchange underscores the immediate power vacuum and Livia\'s decisive move to seize control of the narrative and the political landscape.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: The earth will shake.", "LIVIA: I must go and see the senators and the consuls from Rome. Stay with him till I return."]
    ;
MERGE (e:Event {uuid: 'event_16_4'})
    ON CREATE SET
        e.title = 'The Chilling Warning: Figs Untouched',
        e.description = 'As Livia prepares to depart and face the political storm, she delivers a final, chilling directive, almost as an afterthought: \'By the way... don\'t touch the figs.\' This seemingly innocuous warning carries a heavy weight of implication, subtly hinting at the possibility of poison and underscoring Livia\'s absolute control, extending even into the realm of death and suspicion. The figs, previously associated with Augustus\'s desperate attempt at self-cure, now become a symbol of potential treachery and Livia\'s pervasive influence, a stark reminder of the dangerous undercurrents within the imperial court.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LIVIA: By the way... don't touch the figs."]
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'Livia\'s Deceptive Assurance',
        s.description = 'Set against the backdrop of the Secluded Quarantine Villa, the scene is imbued with an air of quiet foreboding. The villa looms with opulence yet feels suffocating in its isolation, as the sun casts sharp shadows across the faces of those gathered. Livia addresses a small group of anxious onlookers, her tone a carefully crafted blend of authority and false comfort. The mood is laced with tension as her deceptive narrative unfolds, revealing a calculated manipulation of the truth surrounding Augustus\'s condition. She presents the emperor\'s slumber as a natural consequence of his familial reunion, masking the gravity of his situation and the impending storm within the court. This scene plays a pivotal role in reinforcing Livia\'s character as a master manipulator, showcasing her ability to bend reality to her will while setting the stage for the intrigue and power plays that will follow. The themes of deception and control resonate strongly, illustrating how appearances can be dangerously misleading in the treacherous world of imperial Rome.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Livia Addresses the Crowd',
        e.description = 'Livia, poised and commanding, steps forward to address the small gathering outside the villa. Her voice, smooth and authoritative, assures the anxious onlookers that Augustus has fallen into a deep sleep, attributing this to his desire to wait for Tiberius. She dismisses the need for them to remain, promising to post bulletins on the door that will keep them informed. This moment reveals Livia\'s skill in manipulating public perception, presenting a façade of control and composure while masking the underlying reality of Augustus\'s deteriorating health.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Augustus has fallen into a deep sleep. He willed himself to stay awake until my son arrived and then, comforted by his return, he dozed off. There's no point in your waiting here. Come back again tomorrow. Between now and then, I will post bulletins on the door."]
    ;
MERGE (s:Scene {uuid: 'scene_18'})
    ON CREATE SET
        s.title = 'Shadows of Conspiracy: The Garden Assassination',
        s.description = 'In the moonlit seclusion of the villa gardens at Nola, a chilling transaction unfolds. The air is thick with the scent of night-blooming jasmine, yet heavy with unspoken menace. Shadows stretch long and distorted across the manicured lawns, concealing hushed whispers and deadly intent. Livia, draped in dark fabrics that blend with the night, summons Colonel Sejanus, her voice a low, dangerous purr amidst the garden\'s tranquility. The emotional atmosphere is charged with tension and secrecy, a stark contrast to the opulent setting. This scene is pivotal as it marks Livia\'s decisive move to eliminate Fabius Maximus, a key individual who possesses dangerous knowledge, ensuring a smoother path for Tiberius\'s ascent to power. The thematic undercurrents of betrayal and ruthless ambition permeate the scene, highlighting the lengths to which Livia will go to secure her family\'s dominance.',
        s.scene_number = 18
    
    WITH s
    MATCH (l:Location {uuid: 'location_secluded_quarantine_villa_nola'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_18_1'})
    ON CREATE SET
        e.title = 'Livia\'s Midnight Summons',
        e.description = 'Under the cloak of night in the villa gardens, Livia intercepts Colonel Sejanus. She swiftly confirms his identity and lineage, establishing her authority and his subservience. Her questions are curt and purposeful, cutting through any pretense of pleasantries, immediately establishing the clandestine nature of their encounter. Livia\'s veiled inquiries about Sejanus\'s understanding of his mission set a tone of grim efficiency, hinting at the dark purpose lurking beneath the surface of their exchange. The atmosphere is thick with unspoken commands and impending danger.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: You are Colonel Sejanus?", "SEJANUS: Yes, Lady.", "LIVIA: The son of the Commander of the Guard?", "SEJANUS: Yes, Lady.", "LIVIA: Your father has high regard for you.", "SEJANUS: I hope you won't find it misplaced.", "LIVIA: You know why you're here?", "SEJANUS: Yes. I'll leave at once."]
    ;
MERGE (e:Event {uuid: 'event_18_2'})
    ON CREATE SET
        e.title = 'The Order for Silent Demise',
        e.description = 'Livia, with chilling brevity, dismisses Sejanus, confirming her deadly intent with a single, loaded word: \'Good.\' Sejanus, understanding his grim task, immediately issues orders to an unseen assassin lurking nearby. His instruction to weight the body with stones and dispose of it at sea reveals the cold, calculated nature of the assassination, ensuring Fabius Maximus will be permanently silenced and erased. The scene shifts to the assassin approaching Fabius, under the guise of delivering a message, a deceptive tactic that underscores the treachery of the act. Fabius, unsuspecting, asks about the message, walking directly into his fatal trap.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Good.", "SEJANUS: Lady.", "SEJANUS (O.S) Weight it with stones. We'll bury it at sea.", "ASSASSIN: Are you Fabius Maximus?", "FABIUS: Yes. What's the message?", "ASSASSIN: It's here."]
    ;
MERGE (s:Scene {uuid: 'scene_19'})
    ON CREATE SET
        s.title = 'Reading of Augustus\'s Will',
        s.description = 'The Grand Senate Chamber, a grand hall steeped in history, is dominated by the imposing marble columns and the faint echo of hushed discussions. Sunlight streams through high windows, casting a warm glow over the stern faces of the assembled Senators, creating a stark contrast between light and shadow, hope and dread. Tiberius, standing rigidly beside the Quaestor, exudes authority as he commands the proceedings. The atmosphere is thick with tension, anticipation hanging palpably in the air as the will of the recently deceased Augustus Caesar is about to be unveiled. Each Senator leans forward, their eyes sharp with ambition and anxiety, ready to digest the implications of the Emperor\'s final wishes. This moment marks a significant pivot in the power dynamics of Rome, as the fate of the empire hangs in the balance, poised on the precipice of revelation. The reading of Augustus\'s will not only dictates the inheritance of the empire but also sets the stage for the ensuing power struggles that will ripple through the Senate and beyond, igniting conflicts that threaten to shatter the fragile peace of Rome.',
        s.scene_number = 19
    
    WITH s
    MATCH (l:Location {uuid: 'location_grand_senate_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_19_1'})
    ON CREATE SET
        e.title = 'Tiberius Commands the Will\'s Reading',
        e.description = 'Tiberius, with a commanding presence, declares the commencement of the reading of Augustus\'s will. His voice resonates through the chamber, invoking a sense of gravity and expectation. The Quaestor, a figure of authority, unrolls the scroll, a tangible representation of Augustus\'s last wishes that could alter the fate of the empire. As the words begin to flow, they carry the weight of history and legacy, setting the stage for the impending conflict among the Senators, each of whom is acutely aware of the stakes involved and the implications of what is about to be revealed.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Let the will be read."]
    ;
MERGE (e:Event {uuid: 'event_19_2'})
    ON CREATE SET
        e.title = 'The Will is Read',
        e.description = 'The Quaestor begins to read the will aloud, diction crisp and clear, as the tension in the chamber amplifies. The words echo off the marble walls, detailing Augustus\'s wishes for the distribution of his estate. Tiberius is named heir, a choice that solidifies his position but also ignites murmurs of discontent among the Senators, many of whom had hoped for a different succession. The reading of the will serves as a pivotal moment not just of legal transition, but as a catalyst of political intrigue, setting off a cascade of reactions that will ripple through the Senate and the empire, with every senator calculating their next move in response to this new information.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["\"This is the last will and testament of Augustus Caesar, formerly Gaius Octavius of the family of Julius...\""]
    ;
MERGE (s:Scene {uuid: 'scene_20'})
    ON CREATE SET
        s.title = 'Antechamber Accusation',
        s.description = 'In a dimly lit antechamber just outside the Senate Chamber, Livia maintains a regal composure while Claudius fidgets nervously. The hushed tones of the Quaestor reading Augustus\'s will drift from the Senate, creating an atmosphere of tense anticipation. Livia, impatient and dismissive, sharply interrogates Claudius, cutting through his stammering pleasantries with disdain. She reinforces his image as a fool, mirroring the Senate\'s low opinion, while subtly manipulating him to support Tiberius. The emotional atmosphere shifts from Livia\'s cold dominance to Claudius\'s bewildered attempts at conversation, and finally erupts into horrified accusation as Claudius unexpectedly uncovers the stolen will. The scene underscores the pervasive atmosphere of deceit and manipulation in the Roman court, highlighting Livia\'s ruthless control and Claudius\'s dawning realization of her wickedness. The antechamber becomes a stage for a pivotal confrontation, a space where veiled contempt gives way to open accusation, and the whispered word \'poison\' hangs heavy in the air.',
        s.scene_number = 20
    
    WITH s
    MATCH (l:Location {uuid: 'location_antechamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_20_1'})
    ON CREATE SET
        e.title = 'Condescending Condolences',
        e.description = 'Livia, standing just outside the Senate chamber, curtly summons Claudius into the antechamber. She immediately cuts through his nervous stammering and feigned condolences for Augustus, demanding to know his purpose. Her tone is sharp and impatient, reflecting her utter contempt for Claudius whom she openly considers a fool, mirroring the Senate\'s dismissive attitude.  This interaction establishes the power dynamic between them, highlighting Livia\'s cold authority and Claudius\'s perceived insignificance in the treacherous court. The emotional tone is tense and condescending, underlining Livia\'s dominance and Claudius\'s social awkwardness and vulnerability.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: Come in.", "LIVIA (sharply, cutting him off) What do you want?", "CLAUDIUS: M-m-m...", "LIVIA (impatiently) Spit it out, boy!", "CLAUDIUS: M-m-mother said I might come and offer my ccc...", "LIVIA: Condolences?", "CLAUDIUS: Condolences. Yes, Grandmother. It's a t-terrible tragedy.", "LIVIA: Have you been in the Senate?", "CLAUDIUS: On the steps. I'm not allowed in the Senate.", "LIVIA: No, neither am I. They won't allow me in because I'm a woman and they won't allow you in because you're a fool. Now, it's strange when you come to think of it because it's full of nothing but old women and fools!"]
    ;
MERGE (e:Event {uuid: 'event_20_2'})
    ON CREATE SET
        e.title = 'Foolish Prophecy and Pragmatic Advice',
        e.description = 'Livia probes Claudius about the Senate\'s proceedings, extracting information about Tiberius\'s reluctant ascension and the debate over deifying Augustus. Claudius, attempting to appear insightful, shares his Etruscan interpretation of a supposed omen from Jove, suggesting it foretold Augustus\'s divinity. Livia mocks his convoluted reasoning and perceived foolishness, yet shrewdly suggests he use this \'argument\' to advise Tiberius. This reveals Livia\'s manipulative nature – even Claudius\'s perceived idiocy can be exploited to serve her purposes. The emotional tone shifts subtly as Livia, while still condescending, acknowledges a potential, albeit foolish, utility in Claudius.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: They've read the will", "LIVIA: That's what they think.", "CLAUDIUS: Pardon?", "LIVIA: Where have they got to?", "CLAUDIUS: They asked Uncle T-Tiberius to take Augustus' place, but he refused.", "LIVIA: And I'll bet they asked him again, and I'll bet that he said yes.", "CLAUDIUS: Yes, he did.", "LIVIA: Well, what are they doing now?", "CLAUDIUS: Debating whether to make Augustus a god.", "LIVIA: Debating, are they? What do you think?", "CLAUDIUS: I think they should. I think it was f-f-foretold.", "LIVIA: Really, now? And who foretold it?", "CLAUDIUS: J-J-J-Jove.", "LIVIA: Jove, eh?", "CLAUDIUS: A hundred days ago, he melted the letter \"C\" on one of Augustus' statues.", "LIVIA: And what does that mean, idiot head?", "CLAUDIUS: If you strike out the letter \"C\" from \"Caesar\", the word \"Aesar\" is left, and in Etruscan, Aesar means \"god\".", "LIVIA: Deciphered some Etruscan now, have we?", "CLAUDIUS: Yes, Grandmother. I've been studying it.", "LIVIA: Oh, you fool. If Jove wanted to talk to us, don't you think he'd talk to us in Latin, not in Etruscan? What'd be the point of that? Hadn't thought of that, had you? All the same, I'd drop a note to your uncle Tiberius, if I were you. It sounds to me as if he could use all the arguments he could get."]
    ;
MERGE (e:Event {uuid: 'event_20_3'})
    ON CREATE SET
        e.title = 'Discovery and Accusation: \'Poison is Queen!\'',
        e.description = 'As Livia dismisses him with a condescending prophecy and a wave, Claudius, turning to leave, inadvertently spots Augustus\'s will lying openly on a nearby table.  Recognition dawns on him, and the stammer vanishes as he erupts in horrified realization. He directly accuses Livia of stealing the will, his voice rising in outrage and accusation. In a moment of profound insight, Claudius cries out, \'Poison is queen!\' – a visceral condemnation of Livia\'s wickedness and the corrupt nature of her power. This event marks a dramatic turning point for Claudius, shifting him from passive observer to active accuser, and shattering the facade of Livia\'s composed authority.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Will they make Augustus a g-god?", "LIVIA: Oh, yes. He is a god. And so shall I be one day, I prophesy. And here's another prophecy. If Jove ever melts the \"C\" off your name, what's left will turn out to mean \"jackass\". Bye-bye, Clau-Clau. Alright. You can go now. Hahaha!", "CLAUDIUS: You wicked woman! Wickedness! Here, what's this? Eh? Augustus' will! You stole it! His last will! Poison is queen! Poison is queen! Stop it! Stop it! Stop it! Stop it! Stop it! Stop it!"]
    ;
MATCH (a:Agent {uuid: 'agent_camilla_pulchra'}),
          (o:Organization {uuid: 'org_house_of_vestals'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_senators'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_book'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_augustus_will'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_augustus_seal'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_augustus_ulcer_medicine'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_will'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_figs_from_garden'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_medicine'}),
          (a:Agent {uuid: 'agent_montanus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bed'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bulletins'}),
          (a:Agent {uuid: 'agent_livia_drusilla'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scroll'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_camilla_pulchra'}),
          (o:Organization {uuid: 'org_house_of_vestals'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_senators'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_last_will_and_testament_augustus_caesar_event_1_1'})
    ON CREATE SET
        oi.description = 'The Last Will and Testament of Augustus Caesar is the pivotal object in this scene, acting as the catalyst for the entire event. Discovered by Meno amidst forgotten relics and brought to Claudius, the scroll becomes the focal point of Claudius\'s intense examination. As Claudius reads the ancient words, the will\'s very existence begins to reshape the narrative, shifting from a mere document to a potent instrument of destiny. It is through interaction with this object that Claudius\'s understanding of the imperial power dynamics undergoes a seismic shift, setting him on a path of intrigue and consequence.',
        oi.status_before = 'Prior to its discovery, the Last Will and Testament of Augustus Caesar lay hidden and forgotten amongst \'old rubbish\' in the Imperial Archive Cellar. Its location suggested neglect or deliberate concealment, its significance obscured by dust and time, effectively lost to the machinations of the imperial court.',
        oi.status_after = 'Following its unearthing and recognition by Claudius, the Last Will and Testament transforms from a discarded relic to a document of immense importance. It is now actively being scrutinized and deciphered by Claudius, its contents poised to become a critical piece of information that will irrevocably alter the course of the narrative and the fate of Rome, its secrets ready to be unleashed upon the unsuspecting court.'
    WITH oi
    MATCH (o:Object {uuid: 'object_last_will_and_testament_augustus_caesar'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Claudius, with his head bent low over a dusty table in the dimly lit archive cellar, is meticulously examining a scroll. His fingers trace the ancient script as his eyes dart across the lines, a growing intensity in his posture. He speaks, initially distracted by the archive\'s disorder, then his voice sharpens with dawning realization as he recognizes the document\'s title.',
        ap.emotional_state = 'Initially, Claudius displays his characteristic scholarly detachment, mildly exasperated by the disorganized state of the archives, a familiar annoyance for him. As he reads, this gives way to a potent mix of disbelief and burgeoning excitement. A spark of intellectual thrill ignites within him as he grasps the immense historical significance of the document before him, a sense of profound discovery washing over his features, hinting at a deeper shift from his usual reserved demeanor.',
        ap.emotional_tags = ["initially, claudius displays his characteristic scholarly detachment, mildly exasperated by the disorganized state of the archives, a familiar annoyance for him. as he reads, this gives way to a potent mix of disbelief", "burgeoning excitement. a spark of intellectual thrill ignites within him as he grasps the immense historical significance of the document before him, a sense of profound discovery washing over his features, hinting at a deeper shift from his usual reserved demeanor.", "initially", "claudius displays his characteristic scholarly detachment", "mildly exasperated by the disorganized state of the archives", "a familiar annoyance for him. as he reads", "this gives way to a potent mix of disbelief and burgeoning excitement. a spark of intellectual thrill ignites within him as he grasps the immense historical significance of the document before him", "a sense of profound discovery washing over his features", "hinting at a deeper shift from his usual reserved demeanor."],
        ap.active_plans = ["To meticulously read through the entire document, absorbing every word and nuance of Augustus's final directives.", "To verbally process his discovery with Meno, seeking to articulate the magnitude of what he's found and gauge Meno's reaction.", "To begin considering the immediate and far-reaching implications of this will for the future of Rome and his own position within the imperial family."],
        ap.beliefs = ["Ancient texts hold immense power and can reveal hidden truths about the past and influence the future.", "Order and proper record-keeping are essential for preserving history and maintaining control over knowledge.", "Despite being underestimated, he possesses a sharp intellect capable of uncovering and understanding complex information."],
        ap.goals = ["Short-term: To fully decipher and comprehend the complete contents of Augustus's will.", "Medium-term: To ascertain the historical and political weight of the will, understanding its potential impact on the current power structure.", "Ultimate: To leverage the knowledge gained from the will, potentially to protect Rome or to finally gain recognition for his intellectual capabilities, though the precise path remains unclear."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_meno_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Meno stands attentively beside Claudius, a silent observer to the scholar\'s intense focus on the discovered document. He is positioned as a supportive presence, readily responding to Claudius\'s queries and observing his changing reactions with a respectful distance. His posture is alert, ready to assist or offer any aid as needed.',
        ap.emotional_state = 'Meno embodies dutiful attentiveness, his demeanor reflecting respect and loyalty towards Claudius. He is keenly observant of Claudius’s reactions, sensing the growing importance of the discovery unfolding before him. Beneath his composed exterior, there\'s a quiet anticipation and curiosity about the document\'s contents, deferring to Claudius\'s scholarly expertise while remaining ready to acknowledge and support whatever revelation is at hand, his internal state tuned to Claudius’s lead.',
        ap.emotional_tags = ["meno embodies dutiful attentiveness, his demeanor reflecting respect", "loyalty towards claudius. he is keenly observant of claudius\u2019s reactions, sensing the growing importance of the discovery unfolding before him. beneath his composed exterior, there's a quiet anticipation", "curiosity about the document's contents, deferring to claudius's scholarly expertise while remaining ready to acknowledge", "support whatever revelation is at hand, his internal state tuned to claudius\u2019s lead.", "meno embodies dutiful attentiveness", "his demeanor reflecting respect and loyalty towards claudius. he is keenly observant of claudius\u2019s reactions", "sensing the growing importance of the discovery unfolding before him. beneath his composed exterior", "there's a quiet anticipation and curiosity about the document's contents", "deferring to claudius's scholarly expertise while remaining ready to acknowledge and support whatever revelation is at hand", "his internal state tuned to claudius\u2019s lead.", "meno embodies dutiful attentiveness, his demeanor reflecting respect and loyalty towards claudius. he is keenly observant of claudius\u2019s reactions, sensing the growing importance of the discovery unfolding before him. beneath his composed exterior, there's a quiet anticipation and curiosity about the document's contents, deferring to claudius's scholarly expertise", "remaining ready to acknowledge and support whatever revelation is at hand, his internal state tuned to claudius\u2019s lead."],
        ap.active_plans = ["To remain readily available to Claudius, anticipating any needs or requests that may arise as Claudius examines the document.", "To carefully observe Claudius\u2019s reactions and demeanor, attempting to gauge the significance of the discovery through his expressions and words.", "To offer practical assistance as needed, whether it's fetching additional materials, providing a clearer workspace, or simply maintaining a supportive presence."],
        ap.beliefs = ["Serving Claudius and the imperial household with diligence and loyalty is his primary duty.", "Claudius, despite his perceived eccentricities, is a man of learning and deserves respect as 'Caesar'.", "Important discoveries are often made in unexpected places, requiring attentiveness and a keen eye for detail."],
        ap.goals = ["Short-term: To ensure Claudius has everything he needs to effectively examine the will in the archive cellar.", "Medium-term: To continue providing reliable and efficient service to Claudius in his scholarly pursuits and other duties.", "Ultimate: To maintain his position as a trusted servant within the imperial household, ensuring stability and continued favor through his dependable service."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Germanicus strides confidently at the head of his victorious legions, their armor reflecting the bright sunlight as they march into the plaza. He moves with the assuredness of a celebrated general, his posture upright and commanding. Upon reaching the raised platform where Augustus is enthroned, he halts his troops and steps forward alone, a picture of disciplined respect and martial prowess.',
        ap.emotional_state = 'Germanicus radiates a triumphant yet respectful demeanor. Outwardly, he is the picture of Roman virtue – strong, dutiful, and deferential to authority.  Beneath this veneer of victorious humility, however, there is a palpable sense of pride in his accomplishments and perhaps a quiet ambition. He carries himself with the confidence of a man who knows his worth and the adoration he commands from both the legions and the Roman populace, carefully balancing pride with political prudence.',
        ap.emotional_tags = ["germanicus radiates a triumphant yet respectful demeanor. outwardly, he is the picture of roman virtue \u2013 strong, dutiful,", "deferential to authority.  beneath this veneer of victorious humility, however, there is a palpable sense of pride in his accomplishments", "perhaps a quiet ambition. he carries himself with the confidence of a man who knows his worth", "the adoration he commands from both the legions", "the roman populace, carefully balancing pride with political prudence.", "germanicus radiates a triumphant yet respectful demeanor. outwardly", "he is the picture of roman virtue \u2013 strong", "dutiful", "and deferential to authority.  beneath this veneer of victorious humility", "however", "there is a palpable sense of pride in his accomplishments and perhaps a quiet ambition. he carries himself with the confidence of a man who knows his worth and the adoration he commands from both the legions and the roman populace", "carefully balancing pride with political prudence."],
        ap.active_plans = ["Formally acknowledge Augustus's supreme authority and attribute the Rhine victory to his leadership, reinforcing the imperial hierarchy.", "Showcase the success of his military campaigns and the loyalty of his legions, bolstering his public image and standing within Rome.", "Await further orders from Caesar, demonstrating his continued obedience and availability for imperial service, while subtly positioning himself for future commands and responsibilities."],
        ap.beliefs = ["In the inherent superiority of Roman civilization and the necessity of military strength to maintain its dominance.", "In the importance of honoring and respecting the established imperial order and the authority of Caesar.", "That personal glory is best achieved through service to Rome and its emperor, and that public recognition is a valuable asset in political life."],
        ap.goals = ["Short-term: To deliver a compelling and respectful victory report to Augustus, ensuring it reinforces his image as a successful and loyal general.", "Medium-term: To consolidate his popular support and military reputation within Rome, positioning himself as a key figure in the future of the empire.", "Ultimate: To potentially ascend to greater power and influence within the Roman state, perhaps even imperial succession, while always maintaining the appearance of selfless service and loyalty to Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits enthroned on a raised platform, overlooking the sun-drenched plaza and the triumphant return of the legions. He is regal and composed, accepting the accolades of the crowd and the formal greeting of Germanicus.  Though seated and perhaps less physically imposing than the virile Germanicus, his presence is commanding, his gaze sharp and assessing as he observes the scene unfolding before him.',
        ap.emotional_state = 'Augustus projects an image of imperial satisfaction and composed authority. Outwardly, he appears pleased by the victory and the public display of Roman strength. However, beneath the surface of regal contentment, a lifetime of political maneuvering and suspicion likely colors his emotions. He may feel a mixture of pride in Germanicus\'s achievements and a calculating assessment of the general\'s ambition and popularity, ever aware of the undercurrents of power within his own family and court.  There\'s a weary satisfaction tinged with the ever-present weight of imperial responsibility.',
        ap.emotional_tags = ["augustus projects an image of imperial satisfaction", "composed authority. outwardly, he appears pleased by the victory", "the public display of roman strength. however, beneath the surface of regal contentment, a lifetime of political maneuvering", "suspicion likely colors his emotions. he may feel a mixture of pride in germanicus's achievements", "a calculating assessment of the general's ambition", "popularity, ever aware of the undercurrents of power within his own family", "court.  there's a weary satisfaction tinged with the ever-present weight of imperial responsibility.", "augustus projects an image of imperial satisfaction and composed authority. outwardly", "he appears pleased by the victory and the public display of roman strength. however", "beneath the surface of regal contentment", "a lifetime of political maneuvering and suspicion likely colors his emotions. he may feel a mixture of pride in germanicus's achievements and a calculating assessment of the general's ambition and popularity", "ever aware of the undercurrents of power within his own family and court.  there's a weary satisfaction tinged with the ever-present weight of imperial responsibility."],
        ap.active_plans = ["Publicly receive Germanicus's report and acknowledge the victory, reinforcing his image as the ultimate source of Roman triumph and authority.", "Assess Germanicus's demeanor and presentation, subtly gauging his ambition and loyalty through his words and actions in this public spectacle.", "Maintain a commanding and god-like imperial presence before the Roman populace and the legions, projecting strength and stability at a time of potential uncertainty regarding succession."],
        ap.beliefs = ["In the divine right of his imperial rule and the necessity of maintaining absolute authority over the Roman state and its military.", "That public perception and the projection of power are crucial for maintaining order and preventing challenges to his rule.", "That even in moments of triumph, vigilance and careful observation are essential for navigating the treacherous landscape of Roman politics and familial ambition."],
        ap.goals = ["Short-term: To effectively stage-manage this public event to maximize its propaganda value, reinforcing his image as a victorious and revered leader.", "Medium-term: To ensure a smooth transition of power and maintain stability within the empire, potentially considering Germanicus's role in his succession plans, while remaining wary of any threats to his authority.", "Ultimate: To secure a lasting legacy of peace and Roman dominance, ensuring the Julio-Claudian dynasty's continued reign and the enduring strength of the empire, even as his own mortality looms."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Germanicus stands confidently before the gathered crowd and Augustus, his posture exuding the pride of a victorious general. With a commanding voice, he delivers his report on the campaign in Germania, gesturing emphatically as he describes the fierce punishments inflicted on the German tribes and the restoration of peace, embodying Roman strength and resolve.',
        ap.emotional_state = 'Germanicus radiates triumph and pride, his face alight with the exhilaration of victory. While he outwardly exudes confidence, beneath the surface lies a subtle tension, aware of the expectations placed upon him by Augustus and the Senate. His mind is also preoccupied with the political implications of his success and the need to maintain his popularity in the face of potential rivalries.',
        ap.emotional_tags = ["germanicus radiates triumph", "pride, his face alight with the exhilaration of victory. while he outwardly exudes confidence, beneath the surface lies a subtle tension, aware of the expectations placed upon him by augustus", "the senate. his mind is also preoccupied with the political implications of his success", "the need to maintain his popularity in the face of potential rivalries.", "germanicus radiates triumph and pride", "his face alight with the exhilaration of victory. while he outwardly exudes confidence", "beneath the surface lies a subtle tension", "aware of the expectations placed upon him by augustus and the senate. his mind is also preoccupied with the political implications of his success and the need to maintain his popularity in the face of potential rivalries."],
        ap.active_plans = ["Reinforce his own reputation as a military hero in the eyes of the Roman populace.", "Secure Augustus's approval and favor to strengthen his position within the imperial court.", "Navigate the political landscape carefully to maintain solidarity within the legions and counter any emerging rivals."],
        ap.beliefs = ["He believes in the superiority of Roman military might and the necessity of decisive action against enemies.", "Germanicus holds a conviction that loyalty to Augustus and Rome is paramount, viewing his victory as a service to the empire.", "He considers his role as a leader not only to be of military importance but also as a moral obligation to ensure peace and stability in the provinces."],
        ap.goals = ["Short-term: To deliver a successful report on the campaign and gain public acclaim.", "Medium-term: To solidify alliances within the Senate and military that support his continued rise.", "Ultimate: To ensure a lasting legacy as one of Rome's greatest generals and potentially secure the throne for himself or a favored kin."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Augustus, seated on a raised platform, appears frail yet regal, adorned in his imperial robes. He leans slightly forward, his expression a mix of pride and weariness as he listens to Germanicus\'s report. His posture is dignified but reveals the burden of age and the weight of leadership as he acknowledges the cheers of the crowd.',
        ap.emotional_state = 'Augustus\'s outward demeanor conveys a semblance of satisfaction and pride in the accomplishments of his legions. However, internally, he grapples with the encroaching shadows of his mortality and the realization that his reign may be nearing its end. This duality creates an undercurrent of anxiety masked by public composure.',
        ap.emotional_tags = ["augustus's outward demeanor conveys a semblance of satisfaction", "pride in the accomplishments of his legions. however, internally, he grapples with the encroaching shadows of his mortality", "the realization that his reign may be nearing its end. this duality creates an undercurrent of anxiety masked by public composure.", "augustus's outward demeanor conveys a semblance of satisfaction and pride in the accomplishments of his legions. however", "internally", "he grapples with the encroaching shadows of his mortality and the realization that his reign may be nearing its end. this duality creates an undercurrent of anxiety masked by public composure."],
        ap.active_plans = ["To validate Germanicus's military success as a means of reinforcing his own legacy as a strong leader.", "To maintain control over the narrative surrounding his reign and the imperial succession.", "To ensure that the public's adoration for Germanicus does not overshadow his own position as emperor."],
        ap.beliefs = ["He believes that military victories are essential for the stability and prestige of the Roman Empire.", "Augustus holds a deep conviction that his legacy must be preserved through the successes of his heirs and supporters.", "He is aware that loyalty is fragile, and must navigate the competing ambitions within the court carefully."],
        ap.goals = ["Short-term: To appear strong and in control during the public celebration of the military victory.", "Medium-term: To consolidate his power by positioning himself as the respected leader who oversees the triumph.", "Ultimate: To secure the future of the empire and ensure a smooth succession that aligns with his vision for Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Germanicus, radiant in gleaming armor, stands erect before Augustus on the raised platform. He has just led a triumphant procession of Roman legions through the sun-drenched plaza and now addresses the Emperor, his posture reflecting a blend of military discipline and respectful deference. He delivers his report with clarity and strength, his voice projecting across the cheering crowds as he details the successful campaign.',
        ap.emotional_state = 'Germanicus exudes an aura of confident triumph and dutiful satisfaction. Outwardly, he displays pride in his military achievements and unwavering loyalty to Caesar, his tone respectful and assured. Beneath the surface of martial confidence, there\'s a genuine sense of accomplishment in having served Rome and Augustus effectively. He feels the weight of his success and the admiration of the legions and the Roman people, a potent mix of pride and purpose.',
        ap.emotional_tags = ["germanicus exudes an aura of confident triumph", "dutiful satisfaction. outwardly, he displays pride in his military achievements", "unwavering loyalty to caesar, his tone respectful", "assured. beneath the surface of martial confidence, there's a genuine sense of accomplishment in having served rome", "augustus effectively. he feels the weight of his success", "the admiration of the legions", "the roman people, a potent mix of pride", "purpose.", "germanicus exudes an aura of confident triumph and dutiful satisfaction. outwardly", "he displays pride in his military achievements and unwavering loyalty to caesar", "his tone respectful and assured. beneath the surface of martial confidence", "there's a genuine sense of accomplishment in having served rome and augustus effectively. he feels the weight of his success and the admiration of the legions and the roman people", "a potent mix of pride and purpose."],
        ap.active_plans = ["To formally report the successful conclusion of the Rhine campaign to Augustus.", "To showcase the discipline and unwavering loyalty of the Roman legions to the Emperor.", "To seek further commands from Augustus, demonstrating his continued readiness to serve and reinforcing the Emperor's authority."],
        ap.beliefs = ["Unquestioning loyalty to Rome and its Emperor is the highest virtue.", "Military prowess and victory are essential for Rome's strength and security.", "Respect for authority and the established imperial order is fundamental to Roman society."],
        ap.goals = ["short_term\": \"To receive Caesar's approval and commendation for the successful German campaign, solidifying his reputation as a victorious general.", "medium_term\": \"To maintain the peace and stability of the Roman province of Germania, ensuring continued tribute and Roman dominance.", "ultimate\": \"To serve Rome with honor and distinction, contributing to its glory and expansion under Augustus's rule, and potentially securing a prominent place in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Augustus, seated regally on a raised platform, receives Germanicus and the victorious legions in the vast plaza. Bathed in sunlight and amidst the roaring cheers of the crowd, he embodies the pinnacle of Roman imperial power. He listens intently to Germanicus\'s report, his posture and gaze conveying imperial authority and a sense of measured satisfaction at the displayed military success. He is the focal point of this triumphant display, the ultimate recipient of loyalty and victory.',
        ap.emotional_state = 'Augustus projects an image of serene imperial satisfaction and strength, befitting the Caesar receiving victorious legions. Outwardly, he maintains a composed and authoritative demeanor, acknowledging Germanicus\'s report with a degree of expected grandeur. Internally, while pleased with the military success that reinforces his reign, he might also be experiencing a weariness beneath the surface, a poignant contrast between the outward show of power and the inner knowledge of his declining health and the looming succession crisis. There\'s a complex mix of imperial pride and personal vulnerability.',
        ap.emotional_tags = ["augustus projects an image of serene imperial satisfaction", "strength, befitting the caesar receiving victorious legions. outwardly, he maintains a composed", "authoritative demeanor, acknowledging germanicus's report with a degree of expected grandeur. internally, while pleased with the military success that reinforces his reign, he might also be experiencing a weariness beneath the surface, a poignant contrast between the outward show of power", "the inner knowledge of his declining health", "the looming succession crisis. there's a complex mix of imperial pride", "personal vulnerability.", "augustus projects an image of serene imperial satisfaction and strength", "befitting the caesar receiving victorious legions. outwardly", "he maintains a composed and authoritative demeanor", "acknowledging germanicus's report with a degree of expected grandeur. internally", "while pleased with the military success that reinforces his reign", "he might also be experiencing a weariness beneath the surface", "a poignant contrast between the outward show of power and the inner knowledge of his declining health and the looming succession crisis. there's a complex mix of imperial pride and personal vulnerability.", "augustus projects an image of serene imperial satisfaction and strength, befitting the caesar receiving victorious legions. outwardly, he maintains a composed and authoritative demeanor, acknowledging germanicus's report with a degree of expected grandeur. internally,", "pleased with the military success that reinforces his reign, he might also be experiencing a weariness beneath the surface, a poignant contrast between the outward show of power and the inner knowledge of his declining health and the looming succession crisis. there's a complex mix of imperial pride and personal vulnerability."],
        ap.active_plans = ["To publicly receive and acknowledge Germanicus's report, reinforcing the image of Roman military might under his command.", "To project an image of unwavering imperial strength and stability to the Roman populace and the legions, despite his own failing health.", "To maintain absolute control over the Roman military, ensuring their continued loyalty and obedience to his imperial authority."],
        ap.beliefs = ["The Emperor's authority is divinely ordained and must be absolute and unquestioned.", "Roman military strength is the foundation of the empire's power and security.", "Public spectacles and displays of imperial grandeur are crucial for maintaining order, respect, and the perception of invincibility."],
        ap.goals = ["short_term\": \"To effectively preside over the triumphal return of the legions, reinforcing his image as a strong and victorious leader.", "medium_term\": \"To ensure the continued peace and prosperity of the Roman Empire through military strength and effective governance.", "ultimate\": \"To secure his legacy as the founder of a stable and enduring Roman Empire, ensuring its continued dominance and projecting an image of lasting imperial glory, even as his own mortality approaches."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_letters_event_3_2'})
    ON CREATE SET
        oi.description = 'The letters are referenced as a previous, less secure form of communication between Claudius and Germanicus. Claudius explains his prior reluctance to fully disclose sensitive information about Postumus in letters, citing fears of interception and reading by \'certain parties,\' explicitly mentioning Grandmother Livia. The mention of letters highlights the atmosphere of suspicion and surveillance within the imperial household, where even private correspondence is not safe from prying eyes. This insecurity surrounding written communication underscores the gravity and danger of the verbal revelations now being shared face-to-face.',
        oi.status_before = 'The letters existed as a channel for communication between Claudius and Germanicus, carrying hints and veiled concerns about Postumus\'s situation, but intentionally lacking in specific, sensitive details due to the perceived risk of interception.',
        oi.status_after = 'The letters, as a medium for conveying highly sensitive information, are effectively rendered insufficient and too risky. The conversation in the study supersedes the letters, becoming the primary and more direct method for sharing the dangerous revelation, highlighting the shift to a more confidential, albeit still risky, mode of communication.'
    WITH oi
    MATCH (o:Object {uuid: 'object_letters'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is hunched over a book in the dim light of the study, shifting awkwardly in his seat. As he converses with Germanicus, he fidgets with the pages, occasionally glancing up to engage in playful banter, revealing his discomfort with both the light and the conversation topic.',
        ap.emotional_state = 'Claudius exhibits a mix of discomfort and humor. He expresses disdain for his fatherhood, yet there\'s a vulnerability in his candor. His stammer reveals his inner tension, masking deeper feelings of inadequacy regarding family expectations. While he tries to maintain levity, there\'s an undercurrent of frustration and insecurity.',
        ap.emotional_tags = ["claudius exhibits a mix of discomfort", "humor. he expresses disdain for his fatherhood, yet there's a vulnerability in his candor. his stammer reveals his inner tension, masking deeper feelings of inadequacy regarding family expectations. while he tries to maintain levity, there's an undercurrent of frustration", "insecurity.", "claudius exhibits a mix of discomfort and humor. he expresses disdain for his fatherhood", "yet there's a vulnerability in his candor. his stammer reveals his inner tension", "masking deeper feelings of inadequacy regarding family expectations. while he tries to maintain levity", "there's an undercurrent of frustration and insecurity."],
        ap.active_plans = ["To engage in a light-hearted conversation with Germanicus to ease the tension of their familial situation.", "To express his true feelings about his son and the challenges of fatherhood, seeking understanding and camaraderie.", "To subtly communicate the dangers posed by Livia's surveillance and manipulation, while being cautious about how much he reveals."],
        ap.beliefs = ["He believes in the importance of honesty, even when it reveals his vulnerabilities.", "He sees his family dynamics as a complex web of manipulation, particularly regarding Livia's influence.", "He holds a conviction that his worth is often overlooked due to his stammer and perceived foolishness."],
        ap.goals = ["Short-term: To have a light-hearted conversation with Germanicus and connect as brothers amidst the tension.", "Medium-term: To seek validation and understanding about his role as a father and husband.", "Ultimate: To navigate the treacherous waters of familial loyalty while uncovering the truth about Livia's manipulations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Germanicus sits opposite Claudius in the private study, leaning forward slightly with a look of concern in his eyes. He gestures animatedly while exchanging banter, his demeanor open and encouraging, balancing the weight of the conversation with warmth as he interacts with his brother.',
        ap.emotional_state = 'Germanicus displays a nurturing concern for Claudius\'s well-being, particularly regarding his eyesight. His playful jests provide a comforting atmosphere, yet there’s an underlying seriousness to his inquiries about family and the burdens they bear. His emotional landscape combines affection with the weight of their shared familial struggles.',
        ap.emotional_tags = ["germanicus displays a nurturing concern for claudius's well-being, particularly regarding his eyesight. his playful jests provide a comforting atmosphere, yet there\u2019s an underlying seriousness to his inquiries about family", "the burdens they bear. his emotional landscape combines affection with the weight of their shared familial struggles.", "germanicus displays a nurturing concern for claudius's well-being", "particularly regarding his eyesight. his playful jests provide a comforting atmosphere", "yet there\u2019s an underlying seriousness to his inquiries about family and the burdens they bear. his emotional landscape combines affection with the weight of their shared familial struggles."],
        ap.active_plans = ["To reconnect with Claudius through light-hearted banter and family updates, reinforcing their brotherly bond.", "To probe deeper into Claudius's thoughts about Postumus and family dynamics, sensing an underlying tension.", "To maintain a protective stance over Claudius, ensuring he feels supported amidst their complex family affairs."],
        ap.beliefs = ["He believes in the strength of familial bonds and the importance of communication amidst turmoil.", "He holds a conviction that loyalty to family is paramount, even when faced with betrayal and manipulation.", "He trusts in the need to protect and support his brother, seeing potential within Claudius that others overlook."],
        ap.goals = ["Short-term: To uplift Claudius with humor while discussing their family life.", "Medium-term: To gather insights about Postumus and the underlying tensions within the family.", "Ultimate: To be an anchor for Claudius against the backdrop of their turbulent family politics, ensuring he does not feel isolated."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Claudius, hunched slightly over a book but with his attention fully on Germanicus, leans forward conspiratorially. He speaks in hushed tones, occasionally glancing around the sparsely furnished study as if fearing eavesdroppers, even within his own private space. His hands may fidget nervously as he recounts the sensitive information, emphasizing the need for secrecy and caution.',
        ap.emotional_state = 'Claudius is a mix of anxious and determined. Beneath a veneer of his usual awkwardness, there\'s a palpable tension and urgency in his demeanor. He\'s burdened by the dangerous knowledge Postumus entrusted to him and feels responsible for conveying it to Germanicus. There\'s also a flicker of fear, knowing the potential repercussions of revealing such damning information about Livia, yet a stronger current of loyalty and a desire for truth pushes him forward.',
        ap.emotional_tags = ["claudius is a mix of anxious", "determined. beneath a veneer of his usual awkwardness, there's a palpable tension", "urgency in his demeanor. he's burdened by the dangerous knowledge postumus entrusted to him", "feels responsible for conveying it to germanicus. there's also a flicker of fear, knowing the potential repercussions of revealing such damning information about livia, yet a stronger current of loyalty", "a desire for truth pushes him forward.", "claudius is a mix of anxious and determined. beneath a veneer of his usual awkwardness", "there's a palpable tension and urgency in his demeanor. he's burdened by the dangerous knowledge postumus entrusted to him and feels responsible for conveying it to germanicus. there's also a flicker of fear", "knowing the potential repercussions of revealing such damning information about livia", "yet a stronger current of loyalty and a desire for truth pushes him forward."],
        ap.active_plans = ["To fully disclose Postumus's version of events regarding Livilla and his arrest to Germanicus.", "To emphasize the danger and pervasive surveillance within the imperial family, particularly from Livia.", "To gauge Germanicus's reaction and hopefully enlist his brother's support in investigating or at least acknowledging the gravity of Postumus's claims."],
        ap.beliefs = ["He firmly believes Postumus's account of being framed by Livilla and manipulated by Livia.", "He believes Livia is a dangerous and ruthless manipulator capable of extreme deceit and violence.", "He believes Germanicus, despite his initial skepticism, is fundamentally honorable and will recognize the truth once presented with the evidence."],
        ap.goals = ["Short-term: To successfully convey the entirety of Postumus's revelation to Germanicus without being overheard or interrupted.", "Medium-term: To convince Germanicus of the validity of Postumus's claims and the danger posed by Livia.", "Ultimate: To see justice served for Postumus and to protect the imperial family from Livia's potentially destructive machinations, even if it means challenging her power directly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Germanicus initially sits relaxed, engaging in brotherly banter with Claudius, but his posture shifts as the conversation takes a serious turn. He leans in attentively, his gaze focused and intent on Claudius, absorbing the unfolding revelations. He listens intently, his expression becoming increasingly grave as the implications of Claudius\'s words sink in.',
        ap.emotional_state = 'Germanicus transitions from a lighthearted and affectionate mood to one of serious concern and growing unease. Initially, he is playfully dismissive of Claudius\'s worries about surveillance, but as Claudius details Postumus\'s accusations, a shadow of doubt and suspicion creeps into his demeanor. He is likely wrestling with disbelief and a desire to trust his family, yet the weight of Claudius\'s earnestness and the sinister nature of the allegations begin to unsettle him.',
        ap.emotional_tags = ["germanicus transitions from a lighthearted", "affectionate mood to one of serious concern", "growing unease. initially, he is playfully dismissive of claudius's worries about surveillance, but as claudius details postumus's accusations, a shadow of doubt", "suspicion creeps into his demeanor. he is likely wrestling with disbelief", "a desire to trust his family, yet the weight of claudius's earnestness", "the sinister nature of the allegations begin to unsettle him.", "germanicus transitions from a lighthearted and affectionate mood to one of serious concern and growing unease. initially", "he is playfully dismissive of claudius's worries about surveillance", "but as claudius details postumus's accusations", "a shadow of doubt and suspicion creeps into his demeanor. he is likely wrestling with disbelief and a desire to trust his family", "yet the weight of claudius's earnestness and the sinister nature of the allegations begin to unsettle him.", "germanicus transitions from a lighthearted and affectionate mood to one of serious concern and growing unease. initially, he is playfully dismissive of claudius's worries about surveillance,", "as claudius details postumus's accusations, a shadow of doubt and suspicion creeps into his demeanor. he is likely wrestling with disbelief and a desire to trust his family, yet the weight of claudius's earnestness and the sinister nature of the allegations begin to unsettle him."],
        ap.active_plans = ["To understand the 'hint' Claudius mentioned in his letters regarding Postumus's situation.", "To assess the credibility of Claudius's claims, carefully listening for inconsistencies or signs of paranoia.", "To determine the best course of action based on the information revealed, balancing his loyalty to family with the potential need to uncover the truth and ensure justice."],
        ap.beliefs = ["He believes in Claudius's honesty and loyalty, but may question his brother's judgment or tendency towards exaggeration.", "He believes in the importance of familial unity and might be initially resistant to believing accusations against Livia.", "He believes in justice and fairness, and if convinced of Postumus's innocence, he would feel compelled to act."],
        ap.goals = ["Short-term: To fully grasp the details of Postumus's situation and Claudius's concerns.", "Medium-term: To investigate the claims discreetly, seeking corroborating evidence or indicators of foul play.", "Ultimate: To maintain peace and stability within the imperial family and Rome, while ensuring justice is served and any wrongdoing is exposed and addressed appropriately, even if it implicates his own grandmother."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Claudius, hunched over a book, uses a cautious yet determined tone to share sensitive information about Postumus’s accusations against Livia, his voice laced with urgency as he navigates the complexity of family dynamics and treachery.',
        ap.emotional_state = 'Claudius exhibits a mix of anxiety and resolve; his stammer reveals his discomfort, yet there’s a fierce commitment to defend Postumus. Beneath the surface, a profound sense of loyalty and concern for his family\'s well-being fuels his accusations against Livia.',
        ap.emotional_tags = ["claudius exhibits a mix of anxiety", "resolve; his stammer reveals his discomfort, yet there\u2019s a fierce commitment to defend postumus. beneath the surface, a profound sense of loyalty", "concern for his family's well-being fuels his accusations against livia.", "claudius exhibits a mix of anxiety and resolve; his stammer reveals his discomfort", "yet there\u2019s a fierce commitment to defend postumus. beneath the surface", "a profound sense of loyalty and concern for his family's well-being fuels his accusations against livia.", "claudius exhibits a mix of anxiety and resolve", "his stammer reveals his discomfort, yet there\u2019s a fierce commitment to defend postumus. beneath the surface, a profound sense of loyalty and concern for his family's well-being fuels his accusations against livia."],
        ap.active_plans = ["To relay crucial information about Postumus's innocence and Livia's potential malice to Germanicus.", "To navigate the treacherous waters of familial loyalty while ensuring the safety of his own position.", "To reveal the truth about Livia's manipulations and to seek support from Germanicus in addressing the dangers within their family."],
        ap.beliefs = ["I believe in the inherent goodness of family, despite the treacheries that surround us.", "I trust Postumus's account over Livia's, viewing her as a manipulator rather than a matriarch.", "I feel that loyalty to truth is paramount, even if it puts me at odds with powerful family members."],
        ap.goals = ["Short-term: To convince Germanicus of the validity of Postumus's claims.", "Medium-term: To gather support against Livia's influence within the court.", "Ultimate: To protect the integrity of his family and expose the darker machinations at play."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Germanicus sits across from Claudius, maintaining a poised demeanor while listening intently to his brother’s concerns, his posture relaxed yet attentive, indicating his willingness to engage in this serious discussion.',
        ap.emotional_state = 'Germanicus displays skepticism mixed with concern. His response to Claudius\'s accusations reflects a protective instinct towards his family, yet he wrestles with disbelief regarding the gravity of Claudius\'s claims about Livia’s actions, creating a tension between familial loyalty and the desire for truth.',
        ap.emotional_tags = ["germanicus displays skepticism mixed with concern. his response to claudius's accusations reflects a protective instinct towards his family, yet he wrestles with disbelief regarding the gravity of claudius's claims about livia\u2019s actions, creating a tension between familial loyalty", "the desire for truth.", "germanicus displays skepticism mixed with concern. his response to claudius's accusations reflects a protective instinct towards his family", "yet he wrestles with disbelief regarding the gravity of claudius's claims about livia\u2019s actions", "creating a tension between familial loyalty and the desire for truth."],
        ap.active_plans = ["To critically assess Claudius\u2019s alarming claims about Livia's involvement in family betrayals.", "To maintain a supportive brotherly demeanor while questioning the validity of Claudius's accusations.", "To consider the implications of Claudius's claims on their family dynamics and the broader court."],
        ap.beliefs = ["I believe that familial bonds should be upheld, even in the face of doubt.", "I trust Claudius's intelligence but remain cautious about the weight of his accusations.", "I have faith in Livia's ability to guide the family, despite her complex nature."],
        ap.goals = ["Short-term: To understand the full context of Claudius's concerns and maintain the integrity of their familial bond.", "Medium-term: To investigate the claims further without causing unnecessary strife within the family.", "Ultimate: To ensure the stability of the family structure and safeguard against any threats to their legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Although Livia is not present, her influence looms over the conversation, as Claudius and Germanicus whisper about her manipulations. The mere mention of her name elicits a palpable tension, indicating her pervasive presence in their lives and discussions.',
        ap.emotional_state = 'While Livia does not directly express emotions in this scene, the fear and anxiety surrounding her reputation create a sense of dread. The brothers\' tone reflects the internal conflict and paranoia instilled by her cunning and manipulative nature, hinting at a deep-seated fear of her potential wrath.',
        ap.emotional_tags = ["while livia does not directly express emotions in this scene, the fear", "anxiety surrounding her reputation create a sense of dread. the brothers' tone reflects the internal conflict", "paranoia instilled by her cunning", "manipulative nature, hinting at a deep-seated fear of her potential wrath.", "while livia does not directly express emotions in this scene", "the fear and anxiety surrounding her reputation create a sense of dread. the brothers' tone reflects the internal conflict and paranoia instilled by her cunning and manipulative nature", "hinting at a deep-seated fear of her potential wrath."],
        ap.active_plans = ["To maintain her grip over the family's power dynamics, subtly influencing events from the shadows.", "To orchestrate schemes that eliminate any threats to her ambitions without revealing her hand.", "To ensure Tiberius ascends without opposition, consolidating her legacy and control."],
        ap.beliefs = ["I believe that power is essential and must be carefully maneuvered to secure my family's future.", "I trust in my ability to manipulate circumstances to my advantage, viewing others as pawns.", "I view any potential threat to my ambitions, including family members, as obstacles that must be managed strategically."],
        ap.goals = ["Short-term: To remain undetected while orchestrating her plans within the family.", "Medium-term: To eliminate any challenges to Tiberius\u2019s claim to the throne without drawing suspicion.", "Ultimate: To secure her legacy and place in history as the Empress who controlled the fate of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Claudius leans forward intently, his voice dropping to a near whisper as he emphasizes the critical need for secrecy. He gestures with earnest urgency, making sure Germanicus understands the gravity of the information shared and the inherent danger of discussing their grandmother\'s machinations openly within the palace walls. His physical posture reflects a blend of anxiety and determination.',
        ap.emotional_state = 'Beneath a surface of controlled apprehension, Claudius feels a deep sense of urgency and vulnerability. He is relieved to have confided in Germanicus, yet simultaneously burdened by the weight of the secrets they now share. There\'s an undercurrent of fear regarding potential repercussions from Livia, but also a burgeoning resolve to act against her manipulations, fueled by loyalty to Postumus and a growing sense of righteous indignation.',
        ap.emotional_tags = ["beneath a surface of controlled apprehension, claudius feels a deep sense of urgency", "vulnerability. he is relieved to have confided in germanicus, yet simultaneously burdened by the weight of the secrets they now share. there's an undercurrent of fear regarding potential repercussions from livia, but also a burgeoning resolve to act against her manipulations, fueled by loyalty to postumus", "a growing sense of righteous indignation.", "beneath a surface of controlled apprehension", "claudius feels a deep sense of urgency and vulnerability. he is relieved to have confided in germanicus", "yet simultaneously burdened by the weight of the secrets they now share. there's an undercurrent of fear regarding potential repercussions from livia", "but also a burgeoning resolve to act against her manipulations", "fueled by loyalty to postumus and a growing sense of righteous indignation.", "beneath a surface of controlled apprehension, claudius feels a deep sense of urgency and vulnerability. he is relieved to have confided in germanicus, yet simultaneously burdened by the weight of the secrets they now share. there's an undercurrent of fear regarding potential repercussions from livia,", "also a burgeoning resolve to act against her manipulations, fueled by loyalty to postumus and a growing sense of righteous indignation."],
        ap.active_plans = ["To impress upon Germanicus the absolute necessity of discretion and silence regarding their conversation.", "To solidify Germanicus's commitment to investigating and potentially challenging Livia's influence.", "To ensure their future communications remain secure and untraceable, given the pervasive surveillance within the household."],
        ap.beliefs = ["Livia is a formidable and ruthless manipulator capable of extreme measures to maintain power.", "Secrecy is the only viable shield against Livia's pervasive reach and surveillance.", "Germanicus is a trustworthy ally and possesses the integrity to act on the truth, even if it implicates their family."],
        ap.goals = ["short_term\": \"To conclude the meeting without raising suspicion and to ensure Germanicus fully grasps the need for absolute secrecy.", "medium_term\": \"To prompt Germanicus to initiate a discreet investigation into Livia's actions and the truth behind Postumus's exile.", "ultimate\": \"To expose Livia's manipulations and protect the innocent from her schemes, potentially restoring justice for Postumus and safeguarding their family's future from her corrosive influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Germanicus listens with focused intensity, his body language shifting from relaxed brotherly camaraderie to alert seriousness. He absorbs Claudius\'s hushed warnings, his gaze fixed on his brother, reflecting a growing understanding of the perilous situation. He nods slowly, acknowledging the weight of Claudius\'s words and the implied danger that surrounds them.',
        ap.emotional_state = 'Germanicus transitions from initial brotherly concern to a state of serious contemplation and growing unease. He is moved by Claudius\'s earnestness and begins to grapple with the unsettling implications of Livia\'s potential manipulations.  A protective instinct towards Claudius mixes with a dawning realization of the treacherous political landscape within his own family, fostering a somber determination to uncover the truth.',
        ap.emotional_tags = ["germanicus transitions from initial brotherly concern to a state of serious contemplation", "growing unease. he is moved by claudius's earnestness", "begins to grapple with the unsettling implications of livia's potential manipulations.  a protective instinct towards claudius mixes with a dawning realization of the treacherous political landscape within his own family, fostering a somber determination to uncover the truth.", "germanicus transitions from initial brotherly concern to a state of serious contemplation and growing unease. he is moved by claudius's earnestness and begins to grapple with the unsettling implications of livia's potential manipulations.  a protective instinct towards claudius mixes with a dawning realization of the treacherous political landscape within his own family", "fostering a somber determination to uncover the truth."],
        ap.active_plans = ["To fully absorb and process the gravity of Claudius's warnings about Livia's dangerous nature and pervasive surveillance.", "To mentally strategize about how to proceed with investigating these serious accusations without alerting Livia or jeopardizing Claudius.", "To reassure Claudius of his unwavering support and to solidify their alliance in the face of potential familial conflict."],
        ap.beliefs = ["Family loyalty is paramount, yet justice and truth must take precedence, even when confronting powerful family members.", "Claudius, despite his perceived eccentricities, possesses a keen intellect and a trustworthy character.", "Livia, while a respected matriarch, is also capable of significant political maneuvering and potentially harmful actions if Claudius's claims are valid."],
        ap.goals = ["short_term\": \"To conclude their meeting discreetly and to reassure Claudius of his support and shared concern.", "medium_term\": \"To carefully consider the best course of action for investigating Claudius's accusations and gathering further evidence without raising Livia's suspicion.", "ultimate\": \"To uncover the truth about Livia's actions and ensure justice prevails, even if it means confronting his own grandmother and potentially disrupting the established power dynamics of the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in the Imperial Gardens, vigorously pruning a bush with a focused intensity, his hands deftly shaping the plant. Despite his effort, his physical frame shows signs of decline, hinting at his frail health and age, contrasting sharply with the bright colors of the garden around him. He pauses occasionally to inspect his work, a slight furrow in his brow indicative of his concern over the plants.',
        ap.emotional_state = 'Surface emotions reveal Augustus\'s stubborn pride and defiance in engaging with Livia, who chastises him. Internally, he wrestles with frustration over Livia\'s criticisms, yet he masks his vulnerability behind his typical bravado, deflecting her remarks with sarcasm. Beneath the surface, a deep-rooted tension about their relationship looms, one that speaks to years of unaddressed grievances.',
        ap.emotional_tags = ["surface emotions reveal augustus's stubborn pride", "defiance in engaging with livia, who chastises him. internally, he wrestles with frustration over livia's criticisms, yet he masks his vulnerability behind his typical bravado, deflecting her remarks with sarcasm. beneath the surface, a deep-rooted tension about their relationship looms, one that speaks to years of unaddressed grievances.", "surface emotions reveal augustus's stubborn pride and defiance in engaging with livia", "who chastises him. internally", "he wrestles with frustration over livia's criticisms", "yet he masks his vulnerability behind his typical bravado", "deflecting her remarks with sarcasm. beneath the surface", "a deep-rooted tension about their relationship looms", "one that speaks to years of unaddressed grievances."],
        ap.active_plans = ["To continue pruning the garden as a means of finding solace in his work amidst marital tensions.", "To assert his independence and control over his environment, symbolized by the meticulous care of the plants.", "To maintain a sense of joviality and normalcy in public, despite the cracks in their relationship."],
        ap.beliefs = ["Believes in the importance of maintaining his personal domain as a reflection of his power and control.", "Holds onto the idea that he can still manage personal relationships despite declining health and increasing tensions.", "Values the appearance of strength and competence, especially in front of Livia and the court."],
        ap.goals = ["Short-term goal: Successfully prune the garden to his satisfaction, finding a moment of peace.", "Medium-term goal: To navigate the upcoming journey to Corsica without further turmoil with Livia.", "Ultimate goal: To preserve his legacy and authority in the eyes of Rome, even as his health declines."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands nearby, her posture rigid and disapproving as she watches Augustus with arms crossed. Her frown deepens as she critiques his gardening efforts, her tone laden with condescension. She shifts slightly, a silent display of impatience as Augustus responds to her remarks, her eyes narrowing in calculation and annoyance.',
        ap.emotional_state = 'Livia exhibits a surface layer of disapproval and irritation at Augustus\'s actions, revealing her desire for control in every aspect of their lives. Internally, she grapples with a simmering frustration over his stubbornness and the perceived incompetence that she associates with his gardening. Her motivations stem from a deeper ambition, as she seeks to assert her influence even in mundane matters, reflecting the power dynamics of their long marriage.',
        ap.emotional_tags = ["livia exhibits a surface layer of disapproval", "irritation at augustus's actions, revealing her desire for control in every aspect of their lives. internally, she grapples with a simmering frustration over his stubbornness", "the perceived incompetence that she associates with his gardening. her motivations stem from a deeper ambition, as she seeks to assert her influence even in mundane matters, reflecting the power dynamics of their long marriage.", "livia exhibits a surface layer of disapproval and irritation at augustus's actions", "revealing her desire for control in every aspect of their lives. internally", "she grapples with a simmering frustration over his stubbornness and the perceived incompetence that she associates with his gardening. her motivations stem from a deeper ambition", "as she seeks to assert her influence even in mundane matters", "reflecting the power dynamics of their long marriage."],
        ap.active_plans = ["To assert her stance on Augustus's gardening, hoping to provoke a reaction that reaffirms her control in their relationship.", "To gather information about Augustus's intentions regarding Corsica, subtly probing for details she can use to her advantage.", "To maintain her image as a dutiful wife while simultaneously manipulating the conversation to reflect her authority."],
        ap.beliefs = ["Believes that she must constantly assert her authority to maintain her position within the marriage and court.", "Thinks that knowledge and control over even trivial matters are essential to secure her influence.", "Holds a conviction that Augustus is becoming increasingly incompetent, which she views as a threat to her power."],
        ap.goals = ["Short-term goal: To redirect Augustus's focus back to matters she deems important, particularly regarding his journey.", "Medium-term goal: To undermine Augustus's confidence subtly, reinforcing her role as the competent partner.", "Ultimate goal: To solidify her power and influence over the imperial court, ensuring Tiberius's ascendency aligns with her ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the Imperial Gardens observing Augustus as he prunes a bush with excessive zeal. Her posture is rigid, her gaze fixed on Augustus, and her voice carries a sharp edge as she initiates conversation, ostensibly about his gardening habits but with a clear undercurrent of suspicion.',
        ap.emotional_state = 'On the surface, Livia projects an air of wifely concern and mild irritation, using complaints about the garden as a guise for her deeper anxieties. Internally, she is intensely suspicious and controlling, her mind racing to decipher Augustus\'s true intentions for the Corsica trip. Beneath her carefully constructed facade lies a simmering fear of losing control and a determination to uncover any threat to Tiberius\'s succession.',
        ap.emotional_tags = ["on the surface, livia projects an air of wifely concern", "mild irritation, using complaints about the garden as a guise for her deeper anxieties. internally, she is intensely suspicious", "controlling, her mind racing to decipher augustus's true intentions for the corsica trip. beneath her carefully constructed facade lies a simmering fear of losing control", "a determination to uncover any threat to tiberius's succession.", "on the surface", "livia projects an air of wifely concern and mild irritation", "using complaints about the garden as a guise for her deeper anxieties. internally", "she is intensely suspicious and controlling", "her mind racing to decipher augustus's true intentions for the corsica trip. beneath her carefully constructed facade lies a simmering fear of losing control and a determination to uncover any threat to tiberius's succession."],
        ap.active_plans = ["Uncover the real reason behind Augustus's sudden trip to Corsica, suspecting hidden motives.", "Determine if Augustus intends to meet with Postumus during his journey and assess the implications for the succession.", "Maintain her dominant position in the relationship and exert control over Augustus's actions, even as his health declines."],
        ap.beliefs = ["Augustus is increasingly unpredictable and potentially senile, requiring constant vigilance and manipulation to control.", "Any deviation from the established plan of Tiberius's succession is a direct threat to her power and the stability of Rome.", "She must always be one step ahead of Augustus and any potential rivals to maintain her influence and ensure her son's ascension."],
        ap.goals = ["short-term\": \"Extract concrete information from Augustus about his Corsica itinerary and any planned stops, especially regarding Planasia and Postumus.", "medium-term\": \"Prevent Augustus from altering the succession or taking any actions that could undermine Tiberius's claim to the throne.", "ultimate\": \"Secure Tiberius's seamless succession and solidify her own enduring power as Empress Mother, ensuring the continuation of her family's dominance over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Augustus is in the Imperial Gardens, actively and meticulously pruning a bush, his movements precise but perhaps a little too forceful. He engages in conversation with Livia while continuing his gardening, his tone laced with sarcasm and deflection as he parries her probing questions about his travel plans.',
        ap.emotional_state = 'Outwardly, Augustus displays a facade of dismissive amusement and playful sarcasm, using humor to deflect Livia\'s increasingly pointed inquiries. Beneath this veneer, he is determinedly secretive and guarded, acutely aware of Livia\'s manipulative nature and her relentless pursuit of control. There is a palpable sense of weariness and frustration in his interactions with her, a desire to maintain his autonomy and keep his true intentions concealed.',
        ap.emotional_tags = ["outwardly, augustus displays a facade of dismissive amusement", "playful sarcasm, using humor to deflect livia's increasingly pointed inquiries. beneath this veneer, he is determinedly secretive", "guarded, acutely aware of livia's manipulative nature", "her relentless pursuit of control. there is a palpable sense of weariness", "frustration in his interactions with her, a desire to maintain his autonomy", "keep his true intentions concealed.", "outwardly", "augustus displays a facade of dismissive amusement and playful sarcasm", "using humor to deflect livia's increasingly pointed inquiries. beneath this veneer", "he is determinedly secretive and guarded", "acutely aware of livia's manipulative nature and her relentless pursuit of control. there is a palpable sense of weariness and frustration in his interactions with her", "a desire to maintain his autonomy and keep his true intentions concealed."],
        ap.active_plans = ["Obfuscate his true purpose for the Corsica trip, specifically his intention to visit Postumus, by providing vague and misleading explanations.", "Gauge the extent of Livia's suspicion and concern regarding his travel plans and her potential knowledge of his intentions.", "Maintain an air of nonchalance and control over the conversation, subtly dismissing Livia's attempts to probe deeper into his motives."],
        ap.beliefs = ["Livia is inherently distrustful and will attempt to manipulate any situation to serve her own ambitions, especially regarding Tiberius's succession.", "Secrecy is paramount to execute his plans regarding Postumus and the will without Livia's interference or sabotage.", "He is justified in his deception towards Livia, as it is necessary to protect his own agency and ensure his final wishes for Rome are carried out."],
        ap.goals = ["short-term\": \"Successfully deflect Livia's questions and maintain ambiguity about his Corsica trip, preventing her from discovering his true agenda.", "medium-term\": \"Proceed with his secret plan to visit Postumus and potentially reassess the succession without Livia's knowledge or intervention.", "ultimate\": \"Ensure a just and stable succession for Rome, guided by his own judgment and potentially independent of Livia's manipulative influence, and to reclaim a sense of personal agency in his final days."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands tall and imposing, her posture radiating authority and dominance as she confronts Livilla. Her sharp gaze pierces through Livilla\'s defenses, and her gestures are precise and calculated, emphasizing her accusations and manipulation.',
        ap.emotional_state = 'Livia\'s surface demeanor is cold and commanding, betraying no hint of her inner ambition or frustration. Beneath this facade, however, lies a simmering intensity driven by her relentless pursuit of power and control. Her manipulative tactics reveal a deeper fear of losing authority within her family.',
        ap.emotional_tags = ["livia's surface demeanor is cold", "commanding, betraying no hint of her inner ambition or frustration. beneath this facade, however, lies a simmering intensity driven by her relentless pursuit of power", "control. her manipulative tactics reveal a deeper fear of losing authority within her family.", "livia's surface demeanor is cold and commanding", "betraying no hint of her inner ambition or frustration. beneath this facade", "however", "lies a simmering intensity driven by her relentless pursuit of power and control. her manipulative tactics reveal a deeper fear of losing authority within her family."],
        ap.active_plans = ["To extract information from Livilla about potential betrayals regarding Postumus Agrippa.", "To manipulate Livilla into believing that she could win Postumus's favor, thus gaining leverage over her granddaughter.", "To identify the source of rumors regarding Postumus to maintain her grip on power."],
        ap.beliefs = ["Power must be maintained through manipulation and fear.", "Family loyalty is secondary to ambition and control.", "Emotional manipulation can sway individuals to achieve her goals."],
        ap.goals = ["Short-term: To intimidate Livilla into revealing information about Postumus.", "Medium-term: To ensure that Livilla remains under her control and does not act against her interests.", "Ultimate: To solidify her family's power and influence in the Roman court, ensuring Tiberius's ascension."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Livilla stands nervously under Livia\'s scrutiny, her body language betraying her discomfort. She fidgets, shrinking under the weight of her grandmother\'s accusations, and her gestures are hesitant, reflecting her defensive posture as she tries to assert her innocence.',
        ap.emotional_state = 'Livilla\'s outward demeanor is one of fear and desperation as she denies Livia\'s accusations. Internally, she grapples with feelings of inadequacy and longing for Postumus, creating a tension between her defensive responses and her hidden desires. Her contradictions hint at her complex motivations and fears.',
        ap.emotional_tags = ["livilla's outward demeanor is one of fear", "desperation as she denies livia's accusations. internally, she grapples with feelings of inadequacy", "longing for postumus, creating a tension between her defensive responses", "her hidden desires. her contradictions hint at her complex motivations", "fears.", "livilla's outward demeanor is one of fear and desperation as she denies livia's accusations. internally", "she grapples with feelings of inadequacy and longing for postumus", "creating a tension between her defensive responses and her hidden desires. her contradictions hint at her complex motivations and fears."],
        ap.active_plans = ["To reassure Livia of her loyalty and innocence regarding any rumors about Postumus.", "To deflect blame onto others to escape her grandmother's wrath.", "To navigate the precarious dynamics of her marriage and her feelings for Postumus."],
        ap.beliefs = ["Family loyalty is paramount, but survival in this court demands cunning.", "Emotional manipulation can be both a weapon and a shield.", "Livia's power is fearsome, and she must tread carefully to avoid her ire."],
        ap.goals = ["Short-term: To absolve herself of any suspicion regarding Postumus's knowledge.", "Medium-term: To maintain her position in the family and avoid Livia's wrath.", "Ultimate: To find a way to reconnect with Postumus without alienating her husband."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands imperiously in her opulent chambers, her gaze fixed and sharp upon Livilla. She circles her granddaughter like a predator, her voice a silken lash as she probes for weakness and deceit. Her movements are deliberate, each gesture designed to intimidate and control, ensuring Livilla feels the full weight of her displeasure.',
        ap.emotional_state = 'Outwardly, Livia projects an icy composure, her tone laced with accusation but carefully controlled. Beneath this veneer, a storm of suspicion and controlled fury rages. She is deeply unsettled by the potential information leak, her mind racing to assess the damage and identify the culprit. There\'s a palpable tension between her regal facade and the simmering anxiety about losing control of her meticulously crafted plans.',
        ap.emotional_tags = ["outwardly, livia projects an icy composure, her tone laced with accusation but carefully controlled. beneath this veneer, a storm of suspicion", "controlled fury rages. she is deeply unsettled by the potential information leak, her mind racing to assess the damage", "identify the culprit. there's a palpable tension between her regal facade", "the simmering anxiety about losing control of her meticulously crafted plans.", "outwardly", "livia projects an icy composure", "her tone laced with accusation but carefully controlled. beneath this veneer", "a storm of suspicion and controlled fury rages. she is deeply unsettled by the potential information leak", "her mind racing to assess the damage and identify the culprit. there's a palpable tension between her regal facade and the simmering anxiety about losing control of her meticulously crafted plans.", "outwardly, livia projects an icy composure, her tone laced with accusation", "carefully controlled. beneath this veneer, a storm of suspicion and controlled fury rages. she is deeply unsettled by the potential information leak, her mind racing to assess the damage and identify the culprit. there's a palpable tension between her regal facade and the simmering anxiety about losing control of her meticulously crafted plans."],
        ap.active_plans = ["Uncover the source of the information leak concerning imperial secrets reaching Postumus.", "Intimidate Livilla into confessing any involvement or revealing any knowledge she might possess about the leak.", "Evaluate the credibility of Livilla's denials and suggestions of other potential sources like Castor and Claudius."],
        ap.beliefs = ["Absolute control over information is essential for maintaining power.", "Family members, even those closest, are potential sources of betrayal and must be constantly monitored.", "Any threat to her authority, no matter how small, must be swiftly and decisively neutralized."],
        ap.goals = ["short-term\": \"To extract the truth from Livilla about the potential information leak, determining if she is complicit or knowledgeable.", "medium-term\": \"To secure the succession of Tiberius and maintain her own influence by eliminating any threats to their power, including information leaks.", "ultimate\": \"To establish and solidify her family's dynasty as the unquestioned rulers of Rome, ensuring her enduring legacy of power and control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Livilla stands before Livia, physically recoiling under the Empress Mother\'s intense scrutiny. She shrinks inwards, her body language conveying fear and vulnerability. Her eyes dart nervously as she attempts to meet Livia\'s gaze, stammering denials and defensive justifications, desperate to escape her grandmother\'s wrath.',
        ap.emotional_state = 'Livilla is visibly terrified, her surface emotions a whirlwind of anxiety and fear. She pleads her innocence, her voice trembling under Livia\'s accusatory tone. Internally, she is likely a mixture of genuine fear and calculated manipulation. While denying direct involvement, she strategically suggests others as potential sources, revealing a cunning undercurrent beneath her frightened exterior, hinting at a desperate attempt to deflect blame and protect herself.',
        ap.emotional_tags = ["livilla is visibly terrified, her surface emotions a whirlwind of anxiety", "fear. she pleads her innocence, her voice trembling under livia's accusatory tone. internally, she is likely a mixture of genuine fear", "calculated manipulation. while denying direct involvement, she strategically suggests others as potential sources, revealing a cunning undercurrent beneath her frightened exterior, hinting at a desperate attempt to deflect blame", "protect herself.", "livilla is visibly terrified", "her surface emotions a whirlwind of anxiety and fear. she pleads her innocence", "her voice trembling under livia's accusatory tone. internally", "she is likely a mixture of genuine fear and calculated manipulation. while denying direct involvement", "she strategically suggests others as potential sources", "revealing a cunning undercurrent beneath her frightened exterior", "hinting at a desperate attempt to deflect blame and protect herself."],
        ap.active_plans = ["Vehemently deny any involvement in leaking information to Postumus to avoid Livia's punishment.", "Deflect suspicion away from herself by suggesting alternative culprits like Castor and Claudius.", "Maintain an appearance of fear and subservience to manipulate Livia's perception and appear non-threatening."],
        ap.beliefs = ["Livia is a powerful and ruthless figure whose anger is to be avoided at all costs.", "Self-preservation is paramount when facing Livia's accusations.", "Deception and deflection are necessary tools for survival within the imperial court's treacherous dynamics."],
        ap.goals = ["short-term\": \"To convince Livia of her innocence and escape the immediate interrogation without incurring her grandmother's wrath or punishment.", "medium-term\": \"To maintain a position of relative safety and avoid becoming a target of Livia's suspicion in the future.", "ultimate\": \"To navigate the dangerous currents of the imperial family, potentially seeking opportunities to advance her own position while primarily focusing on survival and avoiding conflict with more powerful figures like Livia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Postumus stands defiantly amidst the harsh, windswept landscape of the rugged island retreat. His gaunt frame is accentuated by the pale light, embodying years of isolation and bitterness. He gestures mockingly towards Augustus and Fabius, challenging their presence with cutting sarcasm, clearly unsettled by their intrusion.',
        ap.emotional_state = 'Surface-level, Postumus displays a fierce sarcasm and hostility, his bitterness palpable in every word. Internally, he wrestles with deep resentment and pain, feeling abandoned and betrayed by his father. His emotions are a tumultuous blend of anger, sorrow, and a yearning for acknowledgment, creating a heightened tension in his interactions.',
        ap.emotional_tags = ["surface-level, postumus displays a fierce sarcasm", "hostility, his bitterness palpable in every word. internally, he wrestles with deep resentment", "pain, feeling abandoned", "betrayed by his father. his emotions are a tumultuous blend of anger, sorrow,", "a yearning for acknowledgment, creating a heightened tension in his interactions.", "surface-level", "postumus displays a fierce sarcasm and hostility", "his bitterness palpable in every word. internally", "he wrestles with deep resentment and pain", "feeling abandoned and betrayed by his father. his emotions are a tumultuous blend of anger", "sorrow", "and a yearning for acknowledgment", "creating a heightened tension in his interactions."],
        ap.active_plans = ["To confront Augustus about his years of exile and isolation.", "To express his disdain for Augustus's perceived lack of empathy.", "To maintain a facade of strength despite his vulnerability."],
        ap.beliefs = ["He believes Augustus has failed him as a father and as an emperor.", "Postumus is convinced that his exile is a direct result of familial betrayal.", "He holds a deep-seated belief that emotional displays, like tears, are insufficient to address the gravity of his suffering."],
        ap.goals = ["Short-term: To express his anger directly to Augustus.", "Medium-term: To make Augustus understand the depth of his pain and resentment.", "Ultimate: To seek recognition and validation from his father, hoping for a return to Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Augustus approaches the island, his weary frame betraying the toll of years and the weight of regret. With a deep sorrow etched across his features, he interacts with Postumus amidst the stark and turbulent surroundings, looking out over the churning sea, symbolizing his own inner turmoil.',
        ap.emotional_state = 'Externally, Augustus appears regretful and sorrowful, struggling with the emotions his long-absent son elicits. Internally, he grapples with guilt, loss, and the painful recognition of his failings as a father. His attempts to connect with Postumus reveal a longing for reconciliation, even as he faces the harsh reality of their estrangement.',
        ap.emotional_tags = ["externally, augustus appears regretful", "sorrowful, struggling with the emotions his long-absent son elicits. internally, he grapples with guilt, loss,", "the painful recognition of his failings as a father. his attempts to connect with postumus reveal a longing for reconciliation, even as he faces the harsh reality of their estrangement.", "externally", "augustus appears regretful and sorrowful", "struggling with the emotions his long-absent son elicits. internally", "he grapples with guilt", "loss", "and the painful recognition of his failings as a father. his attempts to connect with postumus reveal a longing for reconciliation", "even as he faces the harsh reality of their estrangement."],
        ap.active_plans = ["To attempt a reconciliation with Postumus after years of separation.", "To express his regret over the past and the decisions that led to Postumus\u2019s exile.", "To prepare for the political ramifications of reversing Postumus's banishment."],
        ap.beliefs = ["He believes that he has made mistakes in his personal and familial relationships.", "Augustus is convinced that his imperfection as a father is tied to the complexities of power.", "He holds a belief that reconciliation is necessary, not only for Postumus but for his own peace."],
        ap.goals = ["Short-term: To communicate his regret to Postumus.", "Medium-term: To initiate the process of reversing Postumus\u2019s banishment.", "Ultimate: To restore his familial relationship and heal the wounds of the past."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Fabius stands as a silent observer, his calm demeanor contrasting sharply with the charged emotions of Augustus and Postumus. His presence provides a buffer as he bows slightly and withdraws, leaving the father and son to confront their fraught relationship.',
        ap.emotional_state = 'Fabius maintains a composed and diplomatic exterior, aware of the emotional turmoil between Augustus and Postumus. While he feels a sense of empathy for both men, he remains detached, focused on his role as advisor and mediator rather than participant in their conflict.',
        ap.emotional_tags = ["fabius maintains a composed", "diplomatic exterior, aware of the emotional turmoil between augustus", "postumus. while he feels a sense of empathy for both men, he remains detached, focused on his role as advisor", "mediator rather than participant in their conflict.", "fabius maintains a composed and diplomatic exterior", "aware of the emotional turmoil between augustus and postumus. while he feels a sense of empathy for both men", "he remains detached", "focused on his role as advisor and mediator rather than participant in their conflict."],
        ap.active_plans = ["To support Augustus in his attempt to reconnect with Postumus.", "To remain a neutral presence, allowing the father-son confrontation to unfold.", "To assess the political implications of the ongoing conflict between Augustus and Postumus."],
        ap.beliefs = ["He believes in the importance of family reconciliation and healing.", "Fabius holds that the truth of their past must be addressed for any future resolution.", "He is convinced that political stability hinges on personal relationships within the imperial family."],
        ap.goals = ["Short-term: To facilitate the dialogue between Postumus and Augustus.", "Medium-term: To ensure Augustus's well-being during this emotional confrontation.", "Ultimate: To help restore harmony within the imperial family and protect the stability of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Postumus stands gaunt and pale on the windswept, rocky island, a figure sculpted by isolation. He confronts Augustus with a posture of defiance, his body language sharp and unwelcoming. His words are laced with sarcasm as he questions the purpose of Augustus\'s visit, initially gesturing dismissively towards Fabius before focusing his bitter attention solely on his father.',
        ap.emotional_state = 'Postumus\'s surface emotion is a biting sarcasm, dripping with years of pent-up resentment and anger. Internally, he is deeply wounded, oscillating between rage and a profound sense of abandonment. Beneath the aggressive exterior lies a vulnerability born of prolonged isolation and a desperate, though buried, longing for paternal acknowledgment.  His unspoken conflict is the battle between his desire for validation from Augustus and the corrosive bitterness that has taken root in his heart.',
        ap.emotional_tags = ["postumus's surface emotion is a biting sarcasm, dripping with years of pent-up resentment", "anger. internally, he is deeply wounded, oscillating between rage", "a profound sense of abandonment. beneath the aggressive exterior lies a vulnerability born of prolonged isolation", "a desperate, though buried, longing for paternal acknowledgment.  his unspoken conflict is the battle between his desire for validation from augustus", "the corrosive bitterness that has taken root in his heart.", "postumus's surface emotion is a biting sarcasm", "dripping with years of pent-up resentment and anger. internally", "he is deeply wounded", "oscillating between rage and a profound sense of abandonment. beneath the aggressive exterior lies a vulnerability born of prolonged isolation and a desperate", "though buried", "longing for paternal acknowledgment.  his unspoken conflict is the battle between his desire for validation from augustus and the corrosive bitterness that has taken root in his heart."],
        ap.active_plans = ["To verbally wound Augustus, mirroring the emotional pain he has endured.", "To assert his independence and rejection of Augustus's authority after years of forced submission.", "To force Augustus to confront the reality and consequences of his actions, specifically his exile."],
        ap.beliefs = ["Augustus's exile was an act of profound cruelty and injustice.", "Augustus is ultimately self-serving and incapable of genuine empathy.", "His suffering has been immense and has irrevocably changed him."],
        ap.goals = ["short-term\": \"To inflict emotional pain on Augustus, making him understand the depth of Postumus's suffering.", "medium-term\": \"To extract a genuine acknowledgment of wrongdoing and perhaps an apology from Augustus, even if it feels insufficient.", "ultimate\": \"To achieve a form of catharsis by expressing his rage and pain, potentially paving the way for some semblance of closure, though true reconciliation seems distant."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Augustus arrives on the rugged island, weary and burdened by regret. He approaches Postumus with a tentative demeanor, his physical presence weakened but imbued with a paternal sorrow. He observes Postumus\'s frail condition with visible concern and attempts a gentle, conciliatory opening, though his words are initially overshadowed by Postumus\'s immediate hostility. He directs Fabius to withdraw, prioritizing a private and intimate confrontation.',
        ap.emotional_state = 'Augustus outwardly displays sorrow and regret, his tone tinged with weariness and remorse. Internally, he is wrestling with deep guilt and the weight of his past decisions regarding Postumus. There is a palpable tension between his desire for reconciliation and the daunting task of confronting Postumus\'s justified anger and pain. Unspoken conflicts include his need to seek forgiveness before death and his struggle to reconcile his imperial persona with his personal failings as a father figure.',
        ap.emotional_tags = ["augustus outwardly displays sorrow", "regret, his tone tinged with weariness", "remorse. internally, he is wrestling with deep guilt", "the weight of his past decisions regarding postumus. there is a palpable tension between his desire for reconciliation", "the daunting task of confronting postumus's justified anger", "pain. unspoken conflicts include his need to seek forgiveness before death", "his struggle to reconcile his imperial persona with his personal failings as a father figure.", "augustus outwardly displays sorrow and regret", "his tone tinged with weariness and remorse. internally", "he is wrestling with deep guilt and the weight of his past decisions regarding postumus. there is a palpable tension between his desire for reconciliation and the daunting task of confronting postumus's justified anger and pain. unspoken conflicts include his need to seek forgiveness before death and his struggle to reconcile his imperial persona with his personal failings as a father figure."],
        ap.active_plans = ["To initiate a dialogue with Postumus, aiming for reconciliation and forgiveness.", "To convey his remorse and acknowledge the mistakes he has made in exiling Postumus.", "To prepare Postumus for the news of his potential return to Rome and a reversal of his banishment."],
        ap.beliefs = ["He has made grave errors in his judgment and treatment of Postumus, influenced by deceitful counsel.", "It is essential to attempt to rectify his past wrongs and seek reconciliation with his estranged son before his death.", "Despite the years of separation and pain, there remains a possibility, however slim, of some form of paternal bond restoration."],
        ap.goals = ["short-term\": \"To communicate his regret and seek Postumus's forgiveness directly and sincerely.", "medium-term\": \"To set in motion the reversal of Postumus's banishment, facilitating his return to Rome and reintegration into the family.", "ultimate\": \"To achieve a measure of peace and redemption before his death by mending the fractured relationship with Postumus and securing his familial legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Fabius Maximus arrives alongside Augustus, maintaining a respectful distance yet remaining observant. He is physically present at the initial encounter between Augustus and Postumus, his posture suggesting attentiveness and readiness to assist if needed. When directed by Augustus to withdraw, he does so promptly and without question, demonstrating his loyalty and understanding of the delicate, personal nature of the meeting.',
        ap.emotional_state = 'Fabius maintains a composed and professional demeanor, his surface emotions reflecting neutrality and deference to Augustus. Internally, he is likely observing the emotionally charged scene with a mixture of concern and professional assessment, recognizing the gravity of the situation and the deep-seated pain between father and son. Unspoken conflicts are minimal, as his primary focus is on supporting Augustus and respecting the emperor\'s wishes.',
        ap.emotional_tags = ["fabius maintains a composed", "professional demeanor, his surface emotions reflecting neutrality", "deference to augustus. internally, he is likely observing the emotionally charged scene with a mixture of concern", "professional assessment, recognizing the gravity of the situation", "the deep-seated pain between father", "son. unspoken conflicts are minimal, as his primary focus is on supporting augustus", "respecting the emperor's wishes.", "fabius maintains a composed and professional demeanor", "his surface emotions reflecting neutrality and deference to augustus. internally", "he is likely observing the emotionally charged scene with a mixture of concern and professional assessment", "recognizing the gravity of the situation and the deep-seated pain between father and son. unspoken conflicts are minimal", "as his primary focus is on supporting augustus and respecting the emperor's wishes."],
        ap.active_plans = ["To accompany and provide discreet support to Augustus during this emotionally challenging encounter.", "To observe the initial interaction between Augustus and Postumus, gauging the atmosphere and potential for conflict.", "To comply fully with Augustus's instructions, ensuring the emperor has the privacy he requires for this delicate conversation."],
        ap.beliefs = ["Augustus is engaged in a deeply significant and personal mission to reconcile with Postumus.", "The meeting between Augustus and Postumus requires privacy and minimal external interference to allow for genuine communication.", "His role is to provide unwavering support and loyal service to Augustus, respecting the emperor's judgment and decisions."],
        ap.goals = ["short-term\": \"To ensure Augustus's safety and well-being throughout the duration of their visit to the island.", "medium-term\": \"To facilitate a private and uninterrupted conversation between Augustus and Postumus by respectfully withdrawing as directed.", "ultimate\": \"To contribute to a potentially positive outcome for Augustus's meeting with Postumus, hoping for reconciliation and a resolution that benefits both the emperor and Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Postumus stands defiantly on the rugged island, his gaunt figure a stark contrast against the harsh landscape. His posture is rigid and confrontational, reflecting years of pent-up resentment. He gestures with a knife, a literal and metaphorical weapon, as he hurls bitter words at Augustus, embodying both pain and anger.',
        ap.emotional_state = 'Postumus is a tempest of fury and sorrow, his surface emotions a volatile mix of contempt and longing for connection. Underneath, he grapples with deep-seated feelings of abandonment and betrayal, struggling between his desire for paternal reconciliation and the bitterness of his years in isolation. His emotional turmoil is palpable, revealing both a longing for understanding and an unyielding resentment toward Augustus.',
        ap.emotional_tags = ["postumus is a tempest of fury", "sorrow, his surface emotions a volatile mix of contempt", "longing for connection. underneath, he grapples with deep-seated feelings of abandonment", "betrayal, struggling between his desire for paternal reconciliation", "the bitterness of his years in isolation. his emotional turmoil is palpable, revealing both a longing for understanding", "an unyielding resentment toward augustus.", "postumus is a tempest of fury and sorrow", "his surface emotions a volatile mix of contempt and longing for connection. underneath", "he grapples with deep-seated feelings of abandonment and betrayal", "struggling between his desire for paternal reconciliation and the bitterness of his years in isolation. his emotional turmoil is palpable", "revealing both a longing for understanding and an unyielding resentment toward augustus."],
        ap.active_plans = ["To express his anger and pain directly to Augustus, holding him accountable for his years of suffering.", "To confront the past and force Augustus to acknowledge the consequences of his actions.", "To seek clarity about his future and the possibility of returning to Rome, despite his doubts."],
        ap.beliefs = ["He believes that emotional honesty is the only path to reconciliation.", "He holds a conviction that Augustus\u2019s tears and regrets cannot undo his years of suffering.", "He thinks that Augustus\u2019s actions were cowardly and misguided, leading to his current state of despair."],
        ap.goals = ["Short-term: To unleash his pent-up emotions and confront Augustus about his abandonment.", "Medium-term: To understand Augustus's intentions and the possibility of returning to Rome.", "Ultimate: To find a way to reclaim his identity and position in a family that has forsaken him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Augustus approaches Postumus with a weary gait, his frail form marked by the toll of time and regret. He stands amidst the rocky landscape, his demeanor one of vulnerability, as he attempts to connect with his son. His gestures are open, inviting, yet heavy with sorrow as he tries to bridge the chasm between them.',
        ap.emotional_state = 'Augustus is steeped in an overwhelming sense of regret, his tears revealing a deep vulnerability that clashes with his imperial identity. Outwardly, he seeks forgiveness and reconciliation, but internally he wrestles with guilt and the realization of his past mistakes. His emotional state is a complex interplay of sorrow, longing for redemption, and the weight of impending mortality.',
        ap.emotional_tags = ["augustus is steeped in an overwhelming sense of regret, his tears revealing a deep vulnerability that clashes with his imperial identity. outwardly, he seeks forgiveness", "reconciliation, but internally he wrestles with guilt", "the realization of his past mistakes. his emotional state is a complex interplay of sorrow, longing for redemption,", "the weight of impending mortality.", "augustus is steeped in an overwhelming sense of regret", "his tears revealing a deep vulnerability that clashes with his imperial identity. outwardly", "he seeks forgiveness and reconciliation", "but internally he wrestles with guilt and the realization of his past mistakes. his emotional state is a complex interplay of sorrow", "longing for redemption", "and the weight of impending mortality.", "augustus is steeped in an overwhelming sense of regret, his tears revealing a deep vulnerability that clashes with his imperial identity. outwardly, he seeks forgiveness and reconciliation,", "internally he wrestles with guilt and the realization of his past mistakes. his emotional state is a complex interplay of sorrow, longing for redemption, and the weight of impending mortality."],
        ap.active_plans = ["To express his remorse for the pain he has caused Postumus and acknowledge the mistakes of his past.", "To seek a way to reconnect with Postumus, hoping to mend their fractured relationship.", "To strategize on how to reverse the decree of banishment and bring Postumus back to Rome."],
        ap.beliefs = ["He believes in the redemptive power of confession and seeks forgiveness from his estranged son.", "He holds the conviction that understanding his mistakes is crucial to preventing further familial betrayal.", "He thinks that the bonds of blood, though strained, can be mended with time and effort, despite the enormity of his prior neglect."],
        ap.goals = ["Short-term: To gain Postumus's understanding and forgiveness during this emotional confrontation.", "Medium-term: To work towards reversing the decree of banishment and facilitating Postumus's return to Rome.", "Ultimate: To reconcile with his family and leave a legacy that includes his estranged son, countering his own mortality."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Postumus stands tall and gaunt against the harsh backdrop of his island prison, a figure sculpted by isolation and resentment. His posture is rigid, his movements sharp with contained fury as he confronts Augustus. He paces within his perceived cage, gesturing wildly as he unleashes a torrent of pent-up anguish, his physical presence embodying years of enforced solitude and simmering rage.',
        ap.emotional_state = 'On the surface, Postumus exudes scathing sarcasm and bitter contempt, mocking Augustus\'s tears and probing for the \'real\' reason for this visit. Beneath this aggressive exterior lies a profound well of pain and psychological scarring. Years of isolation and the constant dread of assassination have eroded his spirit, leaving him deeply distrustful and emotionally volatile. Unspoken is his desperate yearning for genuine paternal recognition, tragically buried beneath layers of hurt and fear, creating a volatile mix of rage and vulnerability.',
        ap.emotional_tags = ["on the surface, postumus exudes scathing sarcasm", "bitter contempt, mocking augustus's tears", "probing for the 'real' reason for this visit. beneath this aggressive exterior lies a profound well of pain", "psychological scarring. years of isolation", "the constant dread of assassination have eroded his spirit, leaving him deeply distrustful", "emotionally volatile. unspoken is his desperate yearning for genuine paternal recognition, tragically buried beneath layers of hurt", "fear, creating a volatile mix of rage", "vulnerability.", "on the surface", "postumus exudes scathing sarcasm and bitter contempt", "mocking augustus's tears and probing for the 'real' reason for this visit. beneath this aggressive exterior lies a profound well of pain and psychological scarring. years of isolation and the constant dread of assassination have eroded his spirit", "leaving him deeply distrustful and emotionally volatile. unspoken is his desperate yearning for genuine paternal recognition", "tragically buried beneath layers of hurt and fear", "creating a volatile mix of rage and vulnerability."],
        ap.active_plans = ["To verbally attack Augustus, forcing him to confront the consequences of his exile.", "To express the full extent of his psychological torment and make Augustus understand his suffering.", "To reject any superficial attempts at reconciliation, demanding genuine remorse and a reversal of his fate."],
        ap.beliefs = ["Augustus's exile was a deliberate and cruel act that has stolen years of his life.", "Augustus's tears and apologies are insincere and cannot undo the damage done.", "He has been unjustly imprisoned and deserves recognition for the profound suffering he has endured."],
        ap.goals = ["{type: short-term, objective: To unleash his pent-up anger and inflict emotional pain on Augustus, mirroring his own suffering.}", "{type: medium-term, objective: To force Augustus to acknowledge the depth of his error and genuinely repent for his actions.}", "{type: ultimate, objective: To be released from exile and potentially restored to a position of honor, reclaiming his stolen life and legacy.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Augustus arrives on the rugged island retreat, physically frail and emotionally burdened by regret. He approaches Postumus with a visible weariness, his posture stooped with age and guilt. He initially attempts a gentle, concerned approach, observing Postumus\'s thinness, but quickly retreats into a defensive posture as Postumus unleashes his fury. He remains physically present, enduring Postumus\'s verbal assault, his body language reflecting a mix of sorrow and resignation.',
        ap.emotional_state = 'Augustus outwardly expresses sorrow and regret through tears and apologetic words, attempting to convey remorse for his past actions. Internally, he is wrestling with deep guilt and the painful realization of the immense suffering he has inflicted upon Postumus. However, a layer of self-justification and a slight defensiveness remain, as evidenced by his mentioning of \'liars\' and \'cheats\' in his court, suggesting a partial deflection of responsibility. His unspoken motivation is to seek absolution and repair the fractured bond with his son before death, driven by a belated understanding of his mistakes and a desire for peace.',
        ap.emotional_tags = ["augustus outwardly expresses sorrow", "regret through tears", "apologetic words, attempting to convey remorse for his past actions. internally, he is wrestling with deep guilt", "the painful realization of the immense suffering he has inflicted upon postumus. however, a layer of self-justification", "a slight defensiveness remain, as evidenced by his mentioning of 'liars'", "'cheats' in his court, suggesting a partial deflection of responsibility. his unspoken motivation is to seek absolution", "repair the fractured bond with his son before death, driven by a belated understanding of his mistakes", "a desire for peace.", "augustus outwardly expresses sorrow and regret through tears and apologetic words", "attempting to convey remorse for his past actions. internally", "he is wrestling with deep guilt and the painful realization of the immense suffering he has inflicted upon postumus. however", "a layer of self-justification and a slight defensiveness remain", "as evidenced by his mentioning of 'liars' and 'cheats' in his court", "suggesting a partial deflection of responsibility. his unspoken motivation is to seek absolution and repair the fractured bond with his son before death", "driven by a belated understanding of his mistakes and a desire for peace."],
        ap.active_plans = ["To convey his remorse and apologize for exiling Postumus, seeking some measure of forgiveness.", "To inform Postumus of his plan to reverse the banishment and bring him back to Rome, offering a tangible promise of redemption.", "To explain Livia's manipulative influence in his past decisions, attempting to contextualize his actions and garner sympathy."],
        ap.beliefs = ["He made significant errors in judgment regarding Postumus, influenced by deceitful individuals like Livia.", "Tears and verbal apologies, coupled with a promise of future action, can mitigate the harm he has caused.", "He still possesses the authority to rectify past wrongs and ensure Postumus's return to Rome, despite the Senate's decree."],
        ap.goals = ["{type: short-term, objective: To elicit a more compassionate response from Postumus, softening his anger and paving the way for reconciliation.}", "{type: medium-term, objective: To successfully reverse the Senate decree and orchestrate Postumus's return to Rome, fulfilling his promise.}", "{type: ultimate, objective: To achieve genuine reconciliation with Postumus, securing his forgiveness and ensuring a more just and honorable legacy before his death, cleansing his conscience and family name.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Postumus stands defiantly against the backdrop of the rugged island, his gaunt frame and pale complexion stark against the harsh landscape. He gestures sharply with his words, embodying a mix of bitterness and resilience as he confronts Augustus, showcasing the deep scars of his isolation and estrangement.',
        ap.emotional_state = 'Postumus exhibits a tumultuous emotional state, oscillating between fierce resentment and a deep-seated yearning for reconciliation. Outwardly, he projects anger and defiance, but beneath that surface lies a profound sense of betrayal and a desperate desire for connection with his father, mingling regret with unresolved pain.',
        ap.emotional_tags = ["postumus exhibits a tumultuous emotional state, oscillating between fierce resentment", "a deep-seated yearning for reconciliation. outwardly, he projects anger", "defiance, but beneath that surface lies a profound sense of betrayal", "a desperate desire for connection with his father, mingling regret with unresolved pain.", "postumus exhibits a tumultuous emotional state", "oscillating between fierce resentment and a deep-seated yearning for reconciliation. outwardly", "he projects anger and defiance", "but beneath that surface lies a profound sense of betrayal and a desperate desire for connection with his father", "mingling regret with unresolved pain.", "postumus exhibits a tumultuous emotional state, oscillating between fierce resentment and a deep-seated yearning for reconciliation. outwardly, he projects anger and defiance,", "beneath that surface lies a profound sense of betrayal and a desperate desire for connection with his father, mingling regret with unresolved pain."],
        ap.active_plans = ["To confront Augustus about his long absence and the years of neglect he has endured.", "To express his disdain for Augustus\u2019s attempts at reconciliation while revealing the emotional turmoil caused by his exile.", "To assert his own worth and claim to legitimacy, challenging Augustus\u2019s authority and the lies that led to his banishment."],
        ap.beliefs = ["He believes that his father's neglect has severely damaged their relationship and his own life.", "He views Augustus's tears as insincere and manipulative, indicative of a deeper failure to protect him.", "He holds that true reconciliation must come with acknowledgment of the pain and betrayal he has suffered."],
        ap.goals = ["Short-term: To voice his resentment and demand acknowledgment from Augustus about the years lost to exile.", "Medium-term: To seek a pathway to return to Rome, reclaiming his rightful place amidst the imperial structure.", "Ultimate: To forge a renewed relationship with Augustus based on honesty and mutual recognition of past wrongs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Augustus approaches Postumus slowly, his weary figure shadowed by the weight of regret and the turbulent backdrop of the island retreat. He stands with a posture that betrays his frailty, struggling to maintain a facade of authority while grappling with the emotional fallout of their estrangement.',
        ap.emotional_state = 'Augustus reveals a complex emotional landscape marked by sorrow and guilt. He expresses regret for the past decisions that led to Postumus’s banishment, his outward demeanor wavering between authority and vulnerability. Internally, he is burdened by the realization of his failures and the weight of familial betrayal, particularly from Livia.',
        ap.emotional_tags = ["augustus reveals a complex emotional landscape marked by sorrow", "guilt. he expresses regret for the past decisions that led to postumus\u2019s banishment, his outward demeanor wavering between authority", "vulnerability. internally, he is burdened by the realization of his failures", "the weight of familial betrayal, particularly from livia.", "augustus reveals a complex emotional landscape marked by sorrow and guilt. he expresses regret for the past decisions that led to postumus\u2019s banishment", "his outward demeanor wavering between authority and vulnerability. internally", "he is burdened by the realization of his failures and the weight of familial betrayal", "particularly from livia."],
        ap.active_plans = ["To apologize to Postumus for his long absence and the hurt caused by his decisions.", "To explain the manipulations he has faced from Livia and others, seeking to earn Postumus\u2019s understanding.", "To reassure Postumus of his intention to facilitate his return to Rome, presenting hope amidst their tumultuous history."],
        ap.beliefs = ["He believes that acknowledging his past mistakes is essential for mending his relationship with Postumus.", "He holds a deep conviction that Livia's manipulative actions have significantly impacted his decisions regarding family.", "He thinks that through honesty and vulnerability, he can begin to repair the fractures within his family."],
        ap.goals = ["Short-term: To express his regret and initiate a dialogue about their fractured relationship.", "Medium-term: To work towards reversing Postumus's banishment, paving the way for his return to Rome.", "Ultimate: To restore his family\u2019s unity and address the legacy of betrayal that has poisoned their bonds."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Germanicus is mentioned in the dialogue as the catalyst for Augustus\'s discovery of deceit, symbolizing a supportive figure and a bridge between the estranged father and son. His influence, though absent, resonates through the fabric of the confrontation.',
        ap.emotional_state = 'Although physically absent, Germanicus evokes a sense of loyalty and integrity. He embodies the hope for truth within the imperial turmoil, his mention serving as a reminder of noble intentions amidst the prevailing treachery. His presence looms large as a moral compass guiding Augustus’s path towards honesty.',
        ap.emotional_tags = ["although physically absent, germanicus evokes a sense of loyalty", "integrity. he embodies the hope for truth within the imperial turmoil, his mention serving as a reminder of noble intentions amidst the prevailing treachery. his presence looms large as a moral compass guiding augustus\u2019s path towards honesty.", "although physically absent", "germanicus evokes a sense of loyalty and integrity. he embodies the hope for truth within the imperial turmoil", "his mention serving as a reminder of noble intentions amidst the prevailing treachery. his presence looms large as a moral compass guiding augustus\u2019s path towards honesty."],
        ap.active_plans = ["To support Augustus in uncovering the truth behind Livia's deception, enabling a path to reconciliation.", "To restore Postumus\u2019s rightful place within the family by advocating for his return to Rome.", "To maintain integrity and loyalty in the face of familial betrayal."],
        ap.beliefs = ["He believes in the importance of truth and loyalty, standing against the tide of deceit in the imperial court.", "He is convinced that family bonds should be repaired, acknowledging the need for reconciliation among the Julio-Claudians.", "He sees himself as a protector of honor and virtue, especially against Livia\u2019s manipulative tactics."],
        ap.goals = ["Short-term: To ensure that Augustus hears the truth about Livia\u2019s treachery and Postumus\u2019s innocence.", "Medium-term: To facilitate a reunion between Augustus and Postumus, healing the rift in their relationship.", "Ultimate: To foster a new era of integrity within the imperial family, moving away from deceit and manipulation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Claudius is referenced as the source of the crucial information that exposes Livia\'s machinations, highlighting his unexpected role as an insightful observer. His presence is felt as a pivotal influence that guides Augustus towards truth and reconciliation.',
        ap.emotional_state = 'Though not present, Claudius is perceived through the lens of both admiration and suspicion. His intellect challenges preconceived notions of foolishness, opening avenues for honesty amidst deception. There is a sense of respect associated with his role, marking him as a significant player in the unfolding drama.',
        ap.emotional_tags = ["though not present, claudius is perceived through the lens of both admiration", "suspicion. his intellect challenges preconceived notions of foolishness, opening avenues for honesty amidst deception. there is a sense of respect associated with his role, marking him as a significant player in the unfolding drama.", "though not present", "claudius is perceived through the lens of both admiration and suspicion. his intellect challenges preconceived notions of foolishness", "opening avenues for honesty amidst deception. there is a sense of respect associated with his role", "marking him as a significant player in the unfolding drama."],
        ap.active_plans = ["To provide insights that reveal the truth about the court\u2019s dynamics and Livia's deceit.", "To navigate the treacherous waters of familial loyalty while advocating for justice and truth.", "To strengthen his own position within the imperial court by fostering alliances based on shared truths."],
        ap.beliefs = ["He believes that truth, no matter how painful, is the key to mending familial bonds.", "He maintains that every member of the family, including Postumus, deserves recognition and a chance for redemption.", "He sees loyalty as paramount, aligning himself with those who uphold integrity against the backdrop of manipulation."],
        ap.goals = ["Short-term: To ensure that the truth about Livia\u2019s treachery is acknowledged within the family.", "Medium-term: To solidify his status as a trusted advisor in the imperial court, leveraging his insights for influence.", "Ultimate: To reshape the dynamics of the Julio-Claudian dynasty through transparency and accountability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Though not directly present in this scene, Livia is discussed as a manipulative force behind Augustus’s past decisions, embodying the treachery that has driven a wedge between father and son. Her presence looms ominously over the dialogue, serving as a reminder of her influence.',
        ap.emotional_state = 'Livia\'s emotional state remains cold and calculating, her machinations casting a long shadow over the familial interactions. She is perceived as a figure of disdain and treachery, embodying the negative consequences of unchecked ambition, thus instilling fear and animosity within the family dynamics.',
        ap.emotional_tags = ["livia's emotional state remains cold", "calculating, her machinations casting a long shadow over the familial interactions. she is perceived as a figure of disdain", "treachery, embodying the negative consequences of unchecked ambition, thus instilling fear", "animosity within the family dynamics.", "livia's emotional state remains cold and calculating", "her machinations casting a long shadow over the familial interactions. she is perceived as a figure of disdain and treachery", "embodying the negative consequences of unchecked ambition", "thus instilling fear and animosity within the family dynamics."],
        ap.active_plans = ["To maintain her grip on power by manipulating Augustus and undermining Postumus\u2019s legitimacy.", "To orchestrate further deceptions that ensure Tiberius's ascendancy while sidelining potential threats.", "To continue playing the role of the devoted wife while executing her hidden agenda."],
        ap.beliefs = ["She believes that power is best maintained through manipulation and deceit, viewing familial bonds as tools for her ambition.", "She holds that loyalty is a weakness, to be exploited rather than honored within the imperial court.", "She is convinced that the ends justify the means, no matter the collateral damage inflicted upon her family."],
        ap.goals = ["Short-term: To solidify Tiberius's position while ensuring Postumus remains a non-threat.", "Medium-term: To eliminate any potential rivalries within the family that could undermine her ambitions.", "Ultimate: To secure her legacy and that of her son, cementing their power through cunning and treachery."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_augustus_will_event_7_4'})
    ON CREATE SET
        oi.description = 'Augustus\'s will is at the center of Livia and Camilla\'s covert conversation, representing a tantalizing opportunity for power. Livia\'s suggestion to examine it reflects their shared ambition to reshape its contents for their benefit, while the will itself holds the keys to future influence over the Vestals and the Senate.',
        oi.status_before = 'The will exists in a state of secrecy, recently altered and shrouded in mystery, locked away with the potential to radically change the course of political power in Rome.',
        oi.status_after = 'The will\'s significance intensifies as Livia and Camilla contemplate conspiring to examine it, placing it at the forefront of their ambitions and moral compromises.'
    WITH oi
    MATCH (o:Object {uuid: 'object_augustus_will'})
    MATCH (e:Event {uuid: 'event_7_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_augustus_seal_event_7_4'})
    ON CREATE SET
        oi.description = 'Camilla reveals her possession of Augustus\'s seal, discussing its role in legitimizing documents even in his absence. This object embodies both authority and the potential for deception, as it becomes a means to access the will and manipulate its contents should Camilla choose to betray her vows.',
        oi.status_before = 'The seal is kept securely by Camilla, a trusted symbol of authenticity, used for official documentation during Augustus\'s absences.',
        oi.status_after = 'The seal\'s role shifts from a mere instrument of approval to a potential tool for conspiracy, as Livia and Camilla consider utilizing it to alter or access Augustus\'s will.'
    WITH oi
    MATCH (o:Object {uuid: 'object_augustus_seal'})
    MATCH (e:Event {uuid: 'event_7_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Livia is regally positioned in her opulent chambers, seated in a high-backed chair that emphasizes her authority. She welcomes Camilla with carefully chosen words of flattery, maintaining a composed and gracious demeanor. Her posture is relaxed yet alert, her eyes studying Camilla with a subtle intensity as she orchestrates the conversation.',
        ap.emotional_state = 'Livia outwardly presents an image of calm cordiality, expressing admiration for Camilla\'s serenity and feigning concern for the House of the Vestals. Beneath this veneer, she is calculating and manipulative, driven by a ruthless ambition to uncover the details of Augustus\'s will. Her pleasantries are laced with subtle pressure, designed to disarm Camilla and extract the desired information. There is a palpable tension between her saccharine words and her predatory intentions.',
        ap.emotional_tags = ["livia outwardly presents an image of calm cordiality, expressing admiration for camilla's serenity", "feigning concern for the house of the vestals. beneath this veneer, she is calculating", "manipulative, driven by a ruthless ambition to uncover the details of augustus's will. her pleasantries are laced with subtle pressure, designed to disarm camilla", "extract the desired information. there is a palpable tension between her saccharine words", "her predatory intentions.", "livia outwardly presents an image of calm cordiality", "expressing admiration for camilla's serenity and feigning concern for the house of the vestals. beneath this veneer", "she is calculating and manipulative", "driven by a ruthless ambition to uncover the details of augustus's will. her pleasantries are laced with subtle pressure", "designed to disarm camilla and extract the desired information. there is a palpable tension between her saccharine words and her predatory intentions."],
        ap.active_plans = ["To subtly probe Camilla for information regarding Augustus's recent alterations to his will.", "To create an atmosphere of false intimacy and shared female understanding to lower Camilla's guard.", "To gauge Camilla's level of knowledge about the will's contents, specifically concerning any provisions for the House of the Vestals."],
        ap.beliefs = ["She believes that manipulating Camilla's desire to rebuild the House of the Vestals is an effective way to gain access to information about the will.", "She believes that appearances and charm are powerful tools to control and deceive others.", "She believes that any means are justified to secure her son's succession and maintain her own power, even if it involves exploiting religious figures and sacred trusts."],
        ap.goals = ["Short-term: To ascertain whether Augustus has included provisions for the House of the Vestals in his will, and if so, the nature of these provisions.", "Medium-term: To use any information gleaned from Camilla to further her understanding of Augustus's will and its implications for Tiberius's succession.", "Ultimate: To ensure Tiberius becomes emperor and to solidify her own position as the power behind the throne, by controlling all information and manipulating key figures in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Camilla enters Livia\'s chambers with a composed and serene expression, her white Vestal robes signifying her purity and devotion. She greets Livia with polite deference, reciprocating the Empress\'s courteous words.  She accepts Livia\'s invitation to sit, maintaining an attentive posture as she listens to Livia’s carefully crafted conversation.',
        ap.emotional_state = 'Camilla outwardly projects an aura of Vestal serenity, her expressions and tone measured and calm. Internally, she is hopeful and perhaps a little flattered by Livia\'s attention and apparent interest in the House of the Vestals. There is an undercurrent of cautiousness, a subtle awareness of the political currents within the imperial household, yet she is also vulnerable to Livia\'s manipulation due to her genuine desire to secure funding for the Vestals\' House. She is caught between her devout nature and the worldly allure of imperial influence.',
        ap.emotional_tags = ["camilla outwardly projects an aura of vestal serenity, her expressions", "tone measured", "calm. internally, she is hopeful", "perhaps a little flattered by livia's attention", "apparent interest in the house of the vestals. there is an undercurrent of cautiousness, a subtle awareness of the political currents within the imperial household, yet she is also vulnerable to livia's manipulation due to her genuine desire to secure funding for the vestals' house. she is caught between her devout nature", "the worldly allure of imperial influence.", "camilla outwardly projects an aura of vestal serenity", "her expressions and tone measured and calm. internally", "she is hopeful and perhaps a little flattered by livia's attention and apparent interest in the house of the vestals. there is an undercurrent of cautiousness", "a subtle awareness of the political currents within the imperial household", "yet she is also vulnerable to livia's manipulation due to her genuine desire to secure funding for the vestals' house. she is caught between her devout nature and the worldly allure of imperial influence."],
        ap.active_plans = ["To politely engage with Livia and ascertain the Empress's intentions regarding the rebuilding of the House of the Vestals.", "To subtly probe Livia for concrete information about Augustus's will and any potential provisions for the Vestals.", "To maintain her composure and uphold the dignity of her position as Chief Vestal Virgin throughout the interaction."],
        ap.beliefs = ["She believes in the sanctity of her vows and the importance of maintaining her religious integrity, but also sees the practical need to secure funding for the Vestals.", "She believes that Livia, as Empress, holds significant influence and could be instrumental in persuading the Senate to support the Vestals.", "She believes in approaching interactions with members of the imperial family with respect and deference, hoping to achieve her goals through diplomacy and polite discourse."],
        ap.goals = ["Short-term: To gauge the sincerity of Livia's interest in rebuilding the House of the Vestals and to determine if Augustus has indeed made provisions in his will.", "Medium-term: To leverage Livia's influence, if genuine, to finally secure the necessary funds and support for the restoration of the House of the Vestals.", "Ultimate: To leave a lasting legacy of a restored and beautiful House of the Vestals for future generations, fulfilling her long-held dream and honoring her vows to the Vestal order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Livia sits imperiously in her high-backed chair, her sharp gaze fixed intently on Camilla. She gestures with calculated grace, drawing the chief Vestal into a delicate conversation about the rebuilding of the House of the Vestals. Her posture is one of authority and control, revealing the tension between her ambition and the fragile politeness she maintains.',
        ap.emotional_state = 'Outwardly, Livia presents a façade of cordiality, her words smooth like velvet, masking the intense ambition that drives her. Internally, she harbors a restless desire to manipulate the circumstances to her advantage, ready to exploit any opportunity that arises. Her motivations are layered with both urgency and cunning, revealing a subtle interplay of charm and menace.',
        ap.emotional_tags = ["outwardly, livia presents a fa\u00e7ade of cordiality, her words smooth like velvet, masking the intense ambition that drives her. internally, she harbors a restless desire to manipulate the circumstances to her advantage, ready to exploit any opportunity that arises. her motivations are layered with both urgency", "cunning, revealing a subtle interplay of charm", "menace.", "outwardly", "livia presents a fa\u00e7ade of cordiality", "her words smooth like velvet", "masking the intense ambition that drives her. internally", "she harbors a restless desire to manipulate the circumstances to her advantage", "ready to exploit any opportunity that arises. her motivations are layered with both urgency and cunning", "revealing a subtle interplay of charm and menace."],
        ap.active_plans = ["To coerce Augustus into including funds for the House of the Vestals in his will.", "To subtly manipulate Camilla into revealing information about Augustus's will and its changes.", "To ensure that the Vestals remain aligned with her ambitions and that their needs serve her broader goals."],
        ap.beliefs = ["That power is best wielded through manipulation and control over others.", "That her ambitions for Roman legacy can be achieved by aligning with influential figures like Camilla.", "That the facade of friendship can be a powerful tool in the pursuit of her goals."],
        ap.goals = ["Short-term: To persuade Camilla to assist in uncovering the contents of Augustus's will.", "Medium-term: To ensure that the rebuilding of the House of the Vestals aligns with her ambitions for influence.", "Ultimate: To secure her family's legacy and control over the imperial court in the wake of Augustus's death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Camilla sits gracefully, her demeanor serene, yet leaning slightly forward as she listens intently to Livia. Her posture is composed, but her eyes reveal a flicker of hope and vulnerability as the conversation about rebuilding the House of the Vestals unfolds. She subtly reaches into her robes, indicating her readiness to act should the opportunity present itself.',
        ap.emotional_state = 'On the surface, Camilla maintains a calm and serene exterior, embodying the piety expected of a Vestal. However, beneath this tranquility lies a deep yearning for legacy and recognition, reflecting her disappointment with the Senate\'s inaction. Her internal conflict between duty and ambition reveals her unspoken desires and fears about the future of the Vestals.',
        ap.emotional_tags = ["on the surface, camilla maintains a calm", "serene exterior, embodying the piety expected of a vestal. however, beneath this tranquility lies a deep yearning for legacy", "recognition, reflecting her disappointment with the senate's inaction. her internal conflict between duty", "ambition reveals her unspoken desires", "fears about the future of the vestals.", "on the surface", "camilla maintains a calm and serene exterior", "embodying the piety expected of a vestal. however", "beneath this tranquility lies a deep yearning for legacy and recognition", "reflecting her disappointment with the senate's inaction. her internal conflict between duty and ambition reveals her unspoken desires and fears about the future of the vestals."],
        ap.active_plans = ["To engage Livia in discussions about the potential for rebuilding the House of the Vestals.", "To reveal her knowledge of Augustus's will alterations in hopes of securing funds.", "To navigate the delicate balance between her sacred vows and the lure of imperial influence."],
        ap.beliefs = ["That the sanctity of the Vestals must be preserved and honored through the rebuilding of their house.", "That Livia's influence can help achieve her dream for the Vestals, despite the risks involved.", "That loyalty to her religious duties can coexist with the pursuit of personal aspirations."],
        ap.goals = ["Short-term: To confirm with Livia the potential for funding to rebuild the House of the Vestals.", "Medium-term: To secure support from Augustus and Livia for the Vestals' future.", "Ultimate: To leave a legacy that enhances the beauty and significance of the House of the Vestals, fulfilling her dreams and duty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Livia is seated regally in her opulent chambers, observing Camilla with sharp, calculating eyes. She initiates a seemingly casual conversation, steering it with subtle precision towards the topic of Augustus\'s will. Her movements are minimal, her power emanating from her stillness and controlled demeanor as she probes for information.',
        ap.emotional_state = 'On the surface, Livia exudes an air of graciousness and playful curiosity, complimenting Camilla and feigning lightheartedness about Augustus\'s \'mysterious\' nature.  Internally, she is intensely focused and manipulative, driven by a ruthless ambition to uncover the details of Augustus\'s will and assess any potential threats to her plans.  Beneath her charming facade lies a cold determination to control the narrative and secure her desired outcome.',
        ap.emotional_tags = ["on the surface, livia exudes an air of graciousness", "playful curiosity, complimenting camilla", "feigning lightheartedness about augustus's 'mysterious' nature.  internally, she is intensely focused", "manipulative, driven by a ruthless ambition to uncover the details of augustus's will", "assess any potential threats to her plans.  beneath her charming facade lies a cold determination to control the narrative", "secure her desired outcome.", "on the surface", "livia exudes an air of graciousness and playful curiosity", "complimenting camilla and feigning lightheartedness about augustus's 'mysterious' nature.  internally", "she is intensely focused and manipulative", "driven by a ruthless ambition to uncover the details of augustus's will and assess any potential threats to her plans.  beneath her charming facade lies a cold determination to control the narrative and secure her desired outcome."],
        ap.active_plans = ["To ascertain if Augustus altered his will regarding the Vestals and the House.", "To gauge Camilla's knowledge of the will's contents and her willingness to disclose information.", "To plant the seed of doubt and temptation in Camilla's mind, suggesting a joint, discreet examination of the will."],
        ap.beliefs = ["Information is power, and secrets are vulnerabilities to be exploited.", "Even the most pious individuals can be swayed by appealing to their desires and vanities.", "Augustus, despite his cunning, can be manipulated through flattery and strategic suggestion."],
        ap.goals = ["goals\": [\n          \"Short-term: To extract as much information as possible from Camilla about the altered will.", "Medium-term: To gain access to Augustus's will and understand its implications for succession and her power.", "Ultimate: To ensure Tiberius's unchallenged ascension to power and maintain her own dominant influence over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Livia sits imperiously in a high-backed chair, her sharp gaze fixed intently on Camilla. Her posture exudes confident authority while she navigates the conversation with calculated charm. Each gesture is deliberate, laced with a subtle hint of dominance as she weaves her web of manipulation.',
        ap.emotional_state = 'Livia presents an outwardly composed demeanor, her voice smooth and inviting. However, beneath this calm facade, she harbors an insatiable ambition, reminding herself of the stakes involved. The interplay between her desire for control and the thrill of orchestrating deceit fuels a quiet intensity within her.',
        ap.emotional_tags = ["livia presents an outwardly composed demeanor, her voice smooth", "inviting. however, beneath this calm facade, she harbors an insatiable ambition, reminding herself of the stakes involved. the interplay between her desire for control", "the thrill of orchestrating deceit fuels a quiet intensity within her.", "livia presents an outwardly composed demeanor", "her voice smooth and inviting. however", "beneath this calm facade", "she harbors an insatiable ambition", "reminding herself of the stakes involved. the interplay between her desire for control and the thrill of orchestrating deceit fuels a quiet intensity within her."],
        ap.active_plans = ["To entice Camilla into a conspiracy to access Augustus's will.", "To manipulate the outcome of Augustus's succession for her own benefit.", "To secure the restoration of the House of the Vestals under her influence."],
        ap.beliefs = ["Power must be seized and maintained at all costs.", "Women can be just as cunning and influential as men in the political sphere.", "Ambition and deception are necessary tools in the game of politics."],
        ap.goals = ["Short-term: To convince Camilla to aid her in examining Augustus's will.", "Medium-term: To solidify her influence over the Senate and the Vestals.", "Ultimate: To ensure Tiberius's ascension while maintaining her own power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Camilla enters Livia\'s chambers with a serene expression, presenting herself with poise as she engages in delicate conversation. While sitting, she leans forward, revealing a flicker of eagerness and anticipation as she contemplates Livia\'s suggestions.',
        ap.emotional_state = 'Camilla maintains a calm and composed exterior, yet her eyes betray a deep-seated hopefulness and ambition. Internally, she wrestles with the conflict of her sacred vows against her desire to see the House of the Vestals flourish, reflecting an emotional tension beneath her serene surface.',
        ap.emotional_tags = ["camilla maintains a calm", "composed exterior, yet her eyes betray a deep-seated hopefulness", "ambition. internally, she wrestles with the conflict of her sacred vows against her desire to see the house of the vestals flourish, reflecting an emotional tension beneath her serene surface.", "camilla maintains a calm and composed exterior", "yet her eyes betray a deep-seated hopefulness and ambition. internally", "she wrestles with the conflict of her sacred vows against her desire to see the house of the vestals flourish", "reflecting an emotional tension beneath her serene surface."],
        ap.active_plans = ["To gauge Livia's intentions regarding the will and potential funding for the Vestals.", "To consider the implications of breaking her vows for the sake of ambition.", "To explore the possibility of securing a tangible legacy for her years of service."],
        ap.beliefs = ["The sanctity of the Vestals must be preserved and valued by the state.", "Ambition can sometimes necessitate moral compromise.", "Influence and power are critical for achieving long-held dreams."],
        ap.goals = ["Short-term: To ascertain the details about Augustus's will.", "Medium-term: To secure funding for the restoration of the House of the Vestals.", "Ultimate: To leave a lasting legacy that honors her commitment to the Vestals."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_augustus_ulcer_medicine_event_8_1'})
    ON CREATE SET
        oi.description = 'The ulcer medicine is presented by Montanus as a potential remedy for Augustus\'s agonizing pain. Augustus drinks the potion directly from the offered container, grimacing at its taste, indicating it is not palatable. The act of drinking the medicine represents Augustus\'s desperate attempt to find relief and his reliance on Montanus\'s medical expertise, however, its efficacy is immediately called into question as Augustus expresses no noticeable improvement, highlighting the limitations of simple remedies against his deep-seated suffering and perhaps foreshadowing the futility of purely physical cures for his condition.',
        oi.status_before = 'The ulcer medicine is prepared and readily available, held by Montanus, intended to be a soothing and pain-relieving remedy for Augustus\'s ulcer.',
        oi.status_after = 'The ulcer medicine has been consumed by Augustus, entering his system. However, it has seemingly failed to provide significant relief from his pain, as he continues to moan and express discomfort, its intended purpose unfulfilled and its effectiveness cast into doubt.'
    WITH oi
    MATCH (o:Object {uuid: 'object_augustus_ulcer_medicine'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Augustus is confined to his bed, visibly suffering and in acute pain, clutching his belly. He is actively seeking relief, calling out to Montanus for help and grimacing as he drinks the potion offered. Despite his physical distress, he is mentally alert and engaged in conversation, albeit focused on his suffering and premonitions.',
        ap.emotional_state = 'On the surface, Augustus displays distress and desperation, vocalizing his pain and seeking immediate aid. Beneath this outward show, he is deeply anxious and fearful about his declining health, as evidenced by his talk of \'premonitions of death\'. There\'s a palpable tension between his imperial facade and his current vulnerability, revealing a man grappling with mortality and loss of control. He is also impatient and dismissive of Montanus’s initial suggestion, highlighting his inner turmoil and fear.',
        ap.emotional_tags = ["on the surface, augustus displays distress", "desperation, vocalizing his pain", "seeking immediate aid. beneath this outward show, he is deeply anxious", "fearful about his declining health, as evidenced by his talk of 'premonitions of death'. there's a palpable tension between his imperial facade", "his current vulnerability, revealing a man grappling with mortality", "loss of control. he is also impatient", "dismissive of montanus\u2019s initial suggestion, highlighting his inner turmoil", "fear.", "on the surface", "augustus displays distress and desperation", "vocalizing his pain and seeking immediate aid. beneath this outward show", "he is deeply anxious and fearful about his declining health", "as evidenced by his talk of 'premonitions of death'. there's a palpable tension between his imperial facade and his current vulnerability", "revealing a man grappling with mortality and loss of control. he is also impatient and dismissive of montanus\u2019s initial suggestion", "highlighting his inner turmoil and fear."],
        ap.active_plans = ["To find immediate relief from the intense abdominal pain he is experiencing.", "To understand the cause and implications of his pain, interpreting it through the lens of his premonitions.", "To explore potential remedies, both medical and perhaps even spiritual, to overcome his perceived impending death."],
        ap.beliefs = ["He believes his current pain is a serious and potentially fatal health crisis.", "He believes in omens and premonitions as genuine indicators of future events, particularly his own death.", "He believes that his physical suffering is directly linked to his fate and that supernatural forces are at play."],
        ap.goals = ["Short-term: To alleviate the immediate, agonizing pain that consumes him.", "Medium-term: To understand the deeper meaning of his premonitions and prepare for what he believes is his impending death, or find a way to avert it.", "Ultimate: To regain control over his health and destiny, or at least come to terms with his mortality and legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Montanus is attending to Augustus in a professional capacity, positioned beside the Emperor\'s bed, offering medical assistance and advice. He is actively trying to alleviate Augustus\'s suffering by suggesting cold compresses and administering a potion. He maintains a calm and rational demeanor, focused on practical medical solutions despite Augustus\'s distress and pronouncements.',
        ap.emotional_state = 'Montanus presents a calm and professional exterior, speaking in a measured tone and offering practical medical advice. Internally, he is likely concerned about the Emperor’s condition, recognizing the seriousness of an ulcer and the intensity of Augustus\'s pain. There might be a subtle undercurrent of professional concern mixed with a degree of resignation or perhaps weariness, as he attempts to apply rational medical approaches to a patient who is also an Emperor prone to superstition and resistant to simple remedies. He remains composed, prioritizing his duty to provide care.',
        ap.emotional_tags = ["montanus presents a calm", "professional exterior, speaking in a measured tone", "offering practical medical advice. internally, he is likely concerned about the emperor\u2019s condition, recognizing the seriousness of an ulcer", "the intensity of augustus's pain. there might be a subtle undercurrent of professional concern mixed with a degree of resignation or perhaps weariness, as he attempts to apply rational medical approaches to a patient who is also an emperor prone to superstition", "resistant to simple remedies. he remains composed, prioritizing his duty to provide care.", "montanus presents a calm and professional exterior", "speaking in a measured tone and offering practical medical advice. internally", "he is likely concerned about the emperor\u2019s condition", "recognizing the seriousness of an ulcer and the intensity of augustus's pain. there might be a subtle undercurrent of professional concern mixed with a degree of resignation or perhaps weariness", "as he attempts to apply rational medical approaches to a patient who is also an emperor prone to superstition and resistant to simple remedies. he remains composed", "prioritizing his duty to provide care."],
        ap.active_plans = ["To diagnose and treat Augustus\u2019s immediate physical ailment, focusing on the ulcer as the source of pain.", "To alleviate Augustus's pain using available medical treatments like cold compresses and potions.", "To prescribe a long-term health management plan, including dietary changes and rest, to prevent future episodes and improve Augustus\u2019s overall condition."],
        ap.beliefs = ["He believes in rational medical treatments and diagnoses based on physical symptoms and observable conditions.", "He believes Augustus's pain is primarily caused by a physical ailment \u2013 the ulcer \u2013 exacerbated by stress and poor diet.", "He believes in the efficacy of traditional medical remedies like potions, diet, and rest to treat physical ailments."],
        ap.goals = ["Short-term: To provide immediate relief from Augustus's current pain using the potion and cold compresses.", "Medium-term: To manage Augustus's ulcer through dietary restrictions and lifestyle changes, preventing future flare-ups.", "Ultimate: To restore Augustus to a state of improved health, ensuring his physical well-being to the best of his medical ability, and potentially prolonging his life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Augustus lies in bed, clearly suffering from abdominal pain. He is attended by Montanus and Fabius, engaging in a tense conversation filled with dark omens. His body is frail, and he exhibits signs of distress as he tries to articulate his fears.',
        ap.emotional_state = 'Augustus is caught in a whirlwind of fear and desperation. Outwardly, he projects a sense of urgency as he recounts his premonitions, but beneath that lies a profound vulnerability and a grappling with his mortality. His mental state oscillates between disbelief in the signs and a deep-seated dread of his impending death.',
        ap.emotional_tags = ["augustus is caught in a whirlwind of fear", "desperation. outwardly, he projects a sense of urgency as he recounts his premonitions, but beneath that lies a profound vulnerability", "a grappling with his mortality. his mental state oscillates between disbelief in the signs", "a deep-seated dread of his impending death.", "augustus is caught in a whirlwind of fear and desperation. outwardly", "he projects a sense of urgency as he recounts his premonitions", "but beneath that lies a profound vulnerability and a grappling with his mortality. his mental state oscillates between disbelief in the signs and a deep-seated dread of his impending death.", "augustus is caught in a whirlwind of fear and desperation. outwardly, he projects a sense of urgency as he recounts his premonitions,", "beneath that lies a profound vulnerability and a grappling with his mortality. his mental state oscillates between disbelief in the signs and a deep-seated dread of his impending death."],
        ap.active_plans = ["To confide in Fabius about his premonitions and the significance of the omens he has observed.", "To garner support from Fabius in validating his interpretations of the signs and to seek reassurance.", "To confront his own mortality by preparing for the inevitability of succession, especially concerning Postumus."],
        ap.beliefs = ["He believes that omens and signs from the gods reflect his fate and are worthy of serious consideration.", "He holds the conviction that his legacy is tied to the name Agrippa, which he interprets as a call for succession.", "He thinks that his time is limited, as indicated by the divine signs he believes he has witnessed."],
        ap.goals = ["Short-term: To alleviate his physical pain with Montanus's medicine and rest.", "Medium-term: To validate his interpretations of the omens with Fabius and secure his legacy.", "Ultimate: To ensure a smooth transition of power to Postumus, as he believes it is ordained by divine will."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Fabius stands by Augustus\'s bedside, listening intently to the emperor\'s confessions about his dark premonitions. He maintains a calm demeanor, ready to offer rational discourse amid the tension. His posture reflects concern as he leans in to engage Augustus in dialogue.',
        ap.emotional_state = 'Fabius exhibits a composed exterior but internally feels a tension between his loyalty to Augustus and the absurdity of the emperor\'s superstitions. He is worried for Augustus\'s health but also wishes to steer him towards a more rational understanding of his omens, reflecting the struggle between reason and fear.',
        ap.emotional_tags = ["fabius exhibits a composed exterior but internally feels a tension between his loyalty to augustus", "the absurdity of the emperor's superstitions. he is worried for augustus's health but also wishes to steer him towards a more rational understanding of his omens, reflecting the struggle between reason", "fear.", "fabius exhibits a composed exterior but internally feels a tension between his loyalty to augustus and the absurdity of the emperor's superstitions. he is worried for augustus's health but also wishes to steer him towards a more rational understanding of his omens", "reflecting the struggle between reason and fear.", "fabius exhibits a composed exterior", "internally feels a tension between his loyalty to augustus and the absurdity of the emperor's superstitions. he is worried for augustus's health", "also wishes to steer him towards a more rational understanding of his omens, reflecting the struggle between reason and fear."],
        ap.active_plans = ["To reassure Augustus regarding his health and propose logical alternatives to his interpretations of omens.", "To maintain a grounding influence on Augustus, urging him not to succumb to superstitions.", "To support Augustus in his recovery, ensuring he follows Montanus's medical advice."],
        ap.beliefs = ["He believes that health should be prioritized over superstition and that the emperor's fears may stem from his current physical condition.", "He holds a conviction that rational thinking can counteract undue anxiety caused by omens.", "He trusts in the wisdom of the medical profession, valuing Montanus's expertise in treating Augustus."],
        ap.goals = ["Short-term: To address Augustus's pain and encourage adherence to Montanus's medical advice.", "Medium-term: To help Augustus regain a sense of control over his health and mental state.", "Ultimate: To protect Augustus's reign from being undermined by irrational fears and ensure a stable succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Augustus remains confined to his bedchamber, his body weakened by illness and pain. He is physically still, having just ingested medicine, but his mind races with morbid thoughts. He is fixated on the omens he believes foretell his death, recounting them with a desperate intensity to Fabius, seeking validation and grappling with his premonitions.',
        ap.emotional_state = 'Initially consumed by dread and a fatalistic acceptance of impending death, Augustus is visibly shaken and fearful. However, Fabius\'s words ignite a fragile spark of hope within him. He latches onto the possibility that the omens might be misinterpreted or that Livia might have been misled, revealing a deep-seated desire to cling to life and escape his perceived destiny. Beneath the surface hope, a profound vulnerability and fear of death remain palpable.',
        ap.emotional_tags = ["initially consumed by dread", "a fatalistic acceptance of impending death, augustus is visibly shaken", "fearful. however, fabius's words ignite a fragile spark of hope within him. he latches onto the possibility that the omens might be misinterpreted or that livia might have been misled, revealing a deep-seated desire to cling to life", "escape his perceived destiny. beneath the surface hope, a profound vulnerability", "fear of death remain palpable.", "initially consumed by dread and a fatalistic acceptance of impending death", "augustus is visibly shaken and fearful. however", "fabius's words ignite a fragile spark of hope within him. he latches onto the possibility that the omens might be misinterpreted or that livia might have been misled", "revealing a deep-seated desire to cling to life and escape his perceived destiny. beneath the surface hope", "a profound vulnerability and fear of death remain palpable."],
        ap.active_plans = ["Seek reassurance and alternative interpretations of the omens from Fabius.", "Explore the possibility that Livia's augur was incompetent or biased to invalidate the death prediction.", "Cling to any glimmer of hope for extended life, however fragile."],
        ap.beliefs = ["Omens and divine signs are powerful indicators of future events, particularly his own mortality.", "Livia, while close, may not always be fully transparent or trustworthy in matters concerning his fate.", "There might be loopholes or errors in the interpretation of omens that could alter his predicted destiny."],
        ap.goals = ["Short-term: Alleviate his immediate fear and anxiety about his imminent death.", "Medium-term: Find concrete evidence or reassurance that the death prediction is incorrect, thus extending his perceived lifespan.", "Ultimate: Prolong his life and reign for as long as possible, defying the ominous predictions and maintaining his grip on power (though this is less prominent in this immediate scene)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Fabius stands attentively beside Augustus\'s bed, maintaining a composed and reassuring posture. He listens patiently to Augustus\'s recounting of the omens, offering counter-arguments and alternative perspectives in a calm and measured tone. His actions are deliberate and gentle, aimed at soothing the Emperor\'s anxieties and offering a semblance of rational comfort.',
        ap.emotional_state = 'Fabius presents a facade of calm reassurance and pragmatic rationality, attempting to dispel Augustus\'s morbid fears. Internally, he is likely deeply concerned about the Emperor\'s deteriorating health and the political instability it could trigger. He masks any personal anxiety or skepticism towards omens, focusing instead on providing Augustus with psychological comfort and a sense of hope, however tenuous, through reasoned discourse. There\'s a subtle tension between his outward calmness and the gravity of the situation.',
        ap.emotional_tags = ["fabius presents a facade of calm reassurance", "pragmatic rationality, attempting to dispel augustus's morbid fears. internally, he is likely deeply concerned about the emperor's deteriorating health", "the political instability it could trigger. he masks any personal anxiety or skepticism towards omens, focusing instead on providing augustus with psychological comfort", "a sense of hope, however tenuous, through reasoned discourse. there's a subtle tension between his outward calmness", "the gravity of the situation.", "fabius presents a facade of calm reassurance and pragmatic rationality", "attempting to dispel augustus's morbid fears. internally", "he is likely deeply concerned about the emperor's deteriorating health and the political instability it could trigger. he masks any personal anxiety or skepticism towards omens", "focusing instead on providing augustus with psychological comfort and a sense of hope", "however tenuous", "through reasoned discourse. there's a subtle tension between his outward calmness and the gravity of the situation."],
        ap.active_plans = ["Dispel Augustus's certainty of imminent death by offering alternative interpretations of the omens.", "Reassure Augustus by downplaying the definitiveness of omens and suggesting potential errors in their interpretation.", "Shift Augustus's focus from morbid predictions to more positive or at least ambiguous possibilities to improve his morale."],
        ap.beliefs = ["Omens are open to interpretation and should not be taken as absolute, unchangeable prophecies.", "Rationality and reasoned argument are more reliable guides than superstition, especially in times of stress and illness.", "Providing psychological comfort and hope to Augustus is crucial for his well-being and potentially his recovery, or at least his peace of mind."],
        ap.goals = ["Short-term: Alleviate Augustus's immediate distress and fear by offering comforting counter-interpretations of the omens.", "Medium-term: Encourage Augustus to adopt a more hopeful outlook and reduce his fixation on death, potentially improving his overall condition.", "Ultimate: Maintain stability and order within the empire by ensuring Augustus remains as calm and functional as possible for as long as possible (though this is a broader goal implied rather than explicitly stated in this scene)."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_goblet_wine_event_9_1'})
    ON CREATE SET
        oi.description = 'The goblet of wine serves as a physical manifestation of Claudius\'s nervousness and clumsiness. When he spills the wine, it accentuates his vulnerability and embarrassment, momentarily redirecting Livia\'s attention and emphasizing the power imbalance between them. The spill symbolizes his perceived incompetence and lack of control in a situation dominated by Livia\'s authority.',
        oi.status_before = 'The goblet of wine is intact, filled with wine, and poised in Claudius\'s hand as he nervously engages with Livia.',
        oi.status_after = 'The goblet is spilled, its contents staining the floor, symbolizing Claudius\'s humiliation and further emphasizing his awkwardness in Livia\'s presence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_goblet_wine'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Claudius enters Livia\'s chambers hesitantly, his posture slumped in a mixture of anxiety and vulnerability. He fidgets with his hands and stammers as he seeks news of Augustus\'s health, visibly struggling to maintain his composure in the face of Livia\'s contemptuous gaze.',
        ap.emotional_state = 'Claudius appears outwardly anxious and burdened by his stammer, which amplifies his feelings of inadequacy. Internally, he wrestles with humiliation and a desire for approval, feeling the weight of Livia\'s scorn as he navigates the conversation. His internal conflict between wanting to assert himself and his perceived foolishness creates a palpable tension.',
        ap.emotional_tags = ["claudius appears outwardly anxious", "burdened by his stammer, which amplifies his feelings of inadequacy. internally, he wrestles with humiliation", "a desire for approval, feeling the weight of livia's scorn as he navigates the conversation. his internal conflict between wanting to assert himself", "his perceived foolishness creates a palpable tension.", "claudius appears outwardly anxious and burdened by his stammer", "which amplifies his feelings of inadequacy. internally", "he wrestles with humiliation and a desire for approval", "feeling the weight of livia's scorn as he navigates the conversation. his internal conflict between wanting to assert himself and his perceived foolishness creates a palpable tension."],
        ap.active_plans = ["To inquire about Augustus's health and gather information that might provide comfort.", "To justify his scholarly pursuits and counter Livia's mockery.", "To maintain composure despite the humiliation and assert his worth to Livia."],
        ap.beliefs = ["He believes that knowledge and scholarship are valuable despite being dismissed as a fool.", "He holds a deep-seated desire for familial acceptance and recognition from Livia.", "He thinks that with preparation, he can overcome his stammer and present his ideas effectively."],
        ap.goals = ["Short-term: To gain information about Augustus's health.", "Medium-term: To read and share his scholarly work publicly.", "Ultimate: To earn the respect and acknowledgment of his family and overcome his perceived foolishness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands imperiously in her chambers, her posture exuding confidence and control. She turns and fixes Claudius with an icy glare as she dismisses him and mocks his efforts, her gestures sharp and condescending, clearly establishing her dominance in the interaction.',
        ap.emotional_state = 'Livia\'s surface emotions reflect contempt and amusement, as she cruelly belittles Claudius. Internally, she revels in her power and control, feeling vindicated in her disdain for him. Her motivations are driven by ambition and a desire to maintain her family\'s status, revealing an underlying ruthlessness beneath her icy demeanor.',
        ap.emotional_tags = ["livia's surface emotions reflect contempt", "amusement, as she cruelly belittles claudius. internally, she revels in her power", "control, feeling vindicated in her disdain for him. her motivations are driven by ambition", "a desire to maintain her family's status, revealing an underlying ruthlessness beneath her icy demeanor.", "livia's surface emotions reflect contempt and amusement", "as she cruelly belittles claudius. internally", "she revels in her power and control", "feeling vindicated in her disdain for him. her motivations are driven by ambition and a desire to maintain her family's status", "revealing an underlying ruthlessness beneath her icy demeanor."],
        ap.active_plans = ["To assert her authority over Claudius and discourage any thoughts of public speaking.", "To manipulate the narrative surrounding Augustus's health and maintain her control within the family dynamics.", "To ensure that Claudius remains perceived as a fool, reinforcing her family's image and her own power."],
        ap.beliefs = ["She believes that power is maintained through fear and ridicule of perceived weaknesses.", "Livia holds a conviction that her family's reputation must always be protected at all costs.", "She thinks that the only way to navigate power is through manipulation and ruthless control."],
        ap.goals = ["Short-term: To prevent Claudius from embarrassing the family with his public reading.", "Medium-term: To maneuver Augustus's will in her favor without causing disruption.", "Ultimate: To secure Tiberius's position and her own influence over the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters Livia\'s chambers, observing the aftermath of Claudius\'s humiliating exit with a cynical detachment. He immediately engages Livia with sarcastic remarks about her drinking habits, masking a deeper curiosity about the situation. He probes for information regarding Augustus\'s health and any underlying tensions within the family, maintaining a composed yet watchful stance as he navigates the conversation.',
        ap.emotional_state = 'Tiberius outwardly displays cynicism and sarcasm, using biting remarks to conceal his true feelings. Beneath the surface, he is a cauldron of resentment and insecurity. He feels deeply unappreciated by Augustus, a lifetime of service seemingly dismissed.  There\'s a palpable frustration simmering within him, a conflict between his desire for power and his perceived lack of paternal affection and recognition, fueled by the uncertainty surrounding the succession.',
        ap.emotional_tags = ["tiberius outwardly displays cynicism", "sarcasm, using biting remarks to conceal his true feelings. beneath the surface, he is a cauldron of resentment", "insecurity. he feels deeply unappreciated by augustus, a lifetime of service seemingly dismissed.  there's a palpable frustration simmering within him, a conflict between his desire for power", "his perceived lack of paternal affection", "recognition, fueled by the uncertainty surrounding the succession.", "tiberius outwardly displays cynicism and sarcasm", "using biting remarks to conceal his true feelings. beneath the surface", "he is a cauldron of resentment and insecurity. he feels deeply unappreciated by augustus", "a lifetime of service seemingly dismissed.  there's a palpable frustration simmering within him", "a conflict between his desire for power and his perceived lack of paternal affection and recognition", "fueled by the uncertainty surrounding the succession."],
        ap.active_plans = ["Assess the immediate atmosphere and understand the reason for Claudius's distress.", "Determine the true state of Augustus's health and any recent changes.", "Uncover the details of Augustus's altered will and its implications for his own succession."],
        ap.beliefs = ["He is entitled to the throne due to his years of loyal service and lineage.", "Augustus has always unfairly favored others over him, particularly Germanicus.", "Livia, despite her manipulations, possesses crucial information and insights into the workings of the imperial court."],
        ap.goals = ["Short-term: To understand the immediate threat posed by the altered will to his claim as heir.", "Medium-term: To secure his position as Augustus's successor, counteracting any moves to undermine his inheritance.", "Ultimate: To finally gain the imperial throne and the respect and recognition he believes he deserves, proving his worth to Augustus and Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Livia is in her private chambers, drinking wine after a dismissive and cruel encounter with Claudius. Upon Tiberius\'s arrival, she maintains a composed, albeit sharp, demeanor. She strategically reveals information about Augustus\'s altered will, observing Tiberius\'s reaction closely. She paces her revelations to maximize their impact and maintain control of the conversation, projecting an image of unflappable authority despite the unsettling news.',
        ap.emotional_state = 'Livia outwardly presents a facade of icy control and sharp sarcasm, dismissing Tiberius\'s probing questions with biting remarks. Internally, she is likely experiencing a surge of anxiety and frustration. Augustus\'s alteration of the will is a significant disruption to her carefully laid plans, creating a sense of urgency and threat. Beneath her composed exterior lies a ruthless determination to regain control and ensure Tiberius\'s ascension, fueled by a deep-seated ambition and a willingness to manipulate and control those around her to achieve her aims.',
        ap.emotional_tags = ["livia outwardly presents a facade of icy control", "sharp sarcasm, dismissing tiberius's probing questions with biting remarks. internally, she is likely experiencing a surge of anxiety", "frustration. augustus's alteration of the will is a significant disruption to her carefully laid plans, creating a sense of urgency", "threat. beneath her composed exterior lies a ruthless determination to regain control", "ensure tiberius's ascension, fueled by a deep-seated ambition", "a willingness to manipulate", "control those around her to achieve her aims.", "livia outwardly presents a facade of icy control and sharp sarcasm", "dismissing tiberius's probing questions with biting remarks. internally", "she is likely experiencing a surge of anxiety and frustration. augustus's alteration of the will is a significant disruption to her carefully laid plans", "creating a sense of urgency and threat. beneath her composed exterior lies a ruthless determination to regain control and ensure tiberius's ascension", "fueled by a deep-seated ambition and a willingness to manipulate and control those around her to achieve her aims."],
        ap.active_plans = ["Gauge Tiberius's emotional and strategic response to the news of the altered will.", "Control the narrative surrounding the will alteration, emphasizing the threat to Tiberius and the need for decisive action.", "Reinforce her position as the orchestrator of events and the key advisor to Tiberius in navigating this crisis."],
        ap.beliefs = ["Tiberius is her instrument for securing and maintaining power, though he needs constant manipulation and direction.", "Control over information and events is paramount to achieving her objectives and ensuring the Julio-Claudian dynasty's dominance.", "Postumus and any alternative heir represent a direct threat to her and Tiberius's ambitions and must be neutralized."],
        ap.goals = ["Short-term: To effectively communicate the gravity of the will alteration to Tiberius and provoke him into action.", "Medium-term: To reverse or circumvent the altered will, ensuring Tiberius remains the designated heir despite Augustus's change of heart.", "Ultimate: To secure absolute power and influence through Tiberius's reign, establishing herself as the true power behind the throne and guaranteeing her lasting legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the room, observing the interaction between Livia and Claudius with a cynical eye. He paces the room with a tense energy, embodying frustration and simmering resentment as he listens to Livia\'s revelations about Augustus\'s will.',
        ap.emotional_state = 'Tiberius displays a volatile mix of anger and desperation. Outwardly sarcastic, he battles internal fears of losing his position. His outburst reveals deep-seated feelings of neglect and frustration, showcasing his desire for validation and recognition amidst the turmoil.',
        ap.emotional_tags = ["tiberius displays a volatile mix of anger", "desperation. outwardly sarcastic, he battles internal fears of losing his position. his outburst reveals deep-seated feelings of neglect", "frustration, showcasing his desire for validation", "recognition amidst the turmoil.", "tiberius displays a volatile mix of anger and desperation. outwardly sarcastic", "he battles internal fears of losing his position. his outburst reveals deep-seated feelings of neglect and frustration", "showcasing his desire for validation and recognition amidst the turmoil."],
        ap.active_plans = ["To confront Livia about Augustus's changed will and its implications for his potential succession.", "To express his frustration regarding Augustus's perceived neglect and lack of gratitude for his loyalty.", "To assert his authority and determination to navigate the political landscape, despite feeling sidelined."],
        ap.beliefs = ["He believes that loyalty and service should be acknowledged and rewarded.", "He harbors a conviction that Augustus's favoritism towards Germanicus undermines his rightful place as heir.", "He perceives family dynamics as a battleground where power and recognition are constantly in flux."],
        ap.goals = ["Short-term: To gain a better understanding of Augustus's intentions regarding the succession.", "Medium-term: To position himself favorably within the court to secure his claim to the throne.", "Ultimate: To establish himself as a respected ruler who receives the acknowledgment he feels he deserves."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised and commanding, the embodiment of cold ambition. She reveals to Tiberius that Augustus has altered his will in favor of Postumus, her icy gaze betraying the delight she takes in stirring discord among her family members.',
        ap.emotional_state = 'Livia exudes a calm, calculated demeanor, masking the thrill of manipulation beneath her composed exterior. Her chilling premonition hints at her relentless ambition and the pleasure she derives from orchestrating power plays, revealing her ruthless nature.',
        ap.emotional_tags = ["livia exudes a calm, calculated demeanor, masking the thrill of manipulation beneath her composed exterior. her chilling premonition hints at her relentless ambition", "the pleasure she derives from orchestrating power plays, revealing her ruthless nature.", "livia exudes a calm", "calculated demeanor", "masking the thrill of manipulation beneath her composed exterior. her chilling premonition hints at her relentless ambition and the pleasure she derives from orchestrating power plays", "revealing her ruthless nature."],
        ap.active_plans = ["To assert her control over the narrative surrounding Augustus's will and ensure Postumus's position is solidified.", "To manipulate Tiberius by inciting feelings of fear and desperation regarding his status as heir.", "To maintain her grip on power by fostering discord and competition within her family."],
        ap.beliefs = ["She believes that power is best secured through manipulation and strategic planning.", "She holds a conviction that her family's legacy should be preserved at any cost.", "She sees Tiberius and Postumus as pawns in her larger game of control and ambition."],
        ap.goals = ["Short-term: To create unrest within Tiberius that will undermine his confidence in his position.", "Medium-term: To ensure that Postumus's claim to the throne is strengthened, positioning him as a viable alternative to Tiberius.", "Ultimate: To manipulate the political landscape to her advantage, ensuring her continued influence in the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits wearily on a stone bench in the palace gardens, appearing physically frail but maintaining a composed and resolute posture. He initiates a seemingly casual conversation with Claudius, drawing him away from his supposed work to engage in a private discussion. He gestures for Claudius to sit, creating an intimate setting within the tranquil garden.',
        ap.emotional_state = 'Beneath a veneer of polite cordiality and feigned casualness, Augustus harbors a complex mix of emotions. Outwardly, he presents a calm and almost avuncular demeanor, engaging in lighthearted banter about his health and the garden. However, internally, he is driven by a deep sense of vulnerability and a desperate yearning for genuine connection. He is testing Claudius, probing for any hidden resentment, while simultaneously seeking a trustworthy confidant in his twilight years, revealing a poignant blend of imperial weariness and human vulnerability.',
        ap.emotional_tags = ["beneath a veneer of polite cordiality", "feigned casualness, augustus harbors a complex mix of emotions. outwardly, he presents a calm", "almost avuncular demeanor, engaging in lighthearted banter about his health", "the garden. however, internally, he is driven by a deep sense of vulnerability", "a desperate yearning for genuine connection. he is testing claudius, probing for any hidden resentment, while simultaneously seeking a trustworthy confidant in his twilight years, revealing a poignant blend of imperial weariness", "human vulnerability.", "beneath a veneer of polite cordiality and feigned casualness", "augustus harbors a complex mix of emotions. outwardly", "he presents a calm and almost avuncular demeanor", "engaging in lighthearted banter about his health and the garden. however", "internally", "he is driven by a deep sense of vulnerability and a desperate yearning for genuine connection. he is testing claudius", "probing for any hidden resentment", "while simultaneously seeking a trustworthy confidant in his twilight years", "revealing a poignant blend of imperial weariness and human vulnerability.", "beneath a veneer of polite cordiality and feigned casualness, augustus harbors a complex mix of emotions. outwardly, he presents a calm and almost avuncular demeanor, engaging in lighthearted banter about his health and the garden. however, internally, he is driven by a deep sense of vulnerability and a desperate yearning for genuine connection. he is testing claudius, probing for any hidden resentment,", "simultaneously seeking a trustworthy confidant in his twilight years, revealing a poignant blend of imperial weariness and human vulnerability."],
        ap.active_plans = ["To discreetly assess Claudius's character and loyalty, moving beyond superficial judgments.", "To gauge Claudius's reaction to veiled references about the altered will and the Corsica visit, testing his discretion.", "To establish a nascent bond with Claudius, potentially forging an alliance for counsel and support in his final days, sensing a rare honesty in him."],
        ap.beliefs = ["Appearances are deceptive, and true character lies hidden beneath superficial judgments.", "Loyalty to friends, Rome, and truth are the highest virtues a person can possess.", "He is capable of misjudging individuals and is willing to reconsider his initial assessments based on new information and insight."],
        ap.goals = ["Short-term: To ascertain Claudius's sincerity and trustworthiness during this initial conversation.", "Medium-term: To cultivate a genuine, confidential relationship with Claudius, fostering a bond of trust and mutual respect.", "Ultimate: To secure his legacy and ensure the stability of Rome by identifying and nurturing a trustworthy advisor who embodies true Roman values, finding solace and genuine companionship in his final days."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands hesitantly near Augustus, his posture reflecting a mix of deference and surprise at the Emperor\'s direct approach. He responds to Augustus\'s inquiries with polite stammering, indicative of his characteristic nervousness and social unease in the presence of imperial authority. He readily accepts Augustus\'s invitation to sit, positioning himself attentively to listen to the Emperor\'s words in the tranquil garden setting.',
        ap.emotional_state = 'Claudius is initially taken aback and somewhat intimidated by Augustus\'s unexpected attention, feeling a surge of nervousness mixed with intense curiosity. He is cautiously hopeful that the Emperor might finally be perceiving him beyond his stammer and perceived foolishness, a possibility that sparks a flicker of anticipation beneath his outward composure. Internally, he is eager to prove his worth and loyalty, while navigating a complex blend of respect for Augustus and a quiet yearning for genuine recognition, carefully managing his stammer to present himself favorably.',
        ap.emotional_tags = ["claudius is initially taken aback", "somewhat intimidated by augustus's unexpected attention, feeling a surge of nervousness mixed with intense curiosity. he is cautiously hopeful that the emperor might finally be perceiving him beyond his stammer", "perceived foolishness, a possibility that sparks a flicker of anticipation beneath his outward composure. internally, he is eager to prove his worth", "loyalty, while navigating a complex blend of respect for augustus", "a quiet yearning for genuine recognition, carefully managing his stammer to present himself favorably.", "claudius is initially taken aback and somewhat intimidated by augustus's unexpected attention", "feeling a surge of nervousness mixed with intense curiosity. he is cautiously hopeful that the emperor might finally be perceiving him beyond his stammer and perceived foolishness", "a possibility that sparks a flicker of anticipation beneath his outward composure. internally", "he is eager to prove his worth and loyalty", "while navigating a complex blend of respect for augustus and a quiet yearning for genuine recognition", "carefully managing his stammer to present himself favorably.", "claudius is initially taken aback and somewhat intimidated by augustus's unexpected attention, feeling a surge of nervousness mixed with intense curiosity. he is cautiously hopeful that the emperor might finally be perceiving him beyond his stammer and perceived foolishness, a possibility that sparks a flicker of anticipation beneath his outward composure. internally, he is eager to prove his worth and loyalty,", "navigating a complex blend of respect for augustus and a quiet yearning for genuine recognition, carefully managing his stammer to present himself favorably."],
        ap.active_plans = ["To maintain a respectful and deferential demeanor towards the Emperor throughout the conversation.", "To clearly demonstrate his loyalty and trustworthiness, echoing the positive attributes attributed to him by Germanicus.", "To attentively discern the Emperor's true intentions behind initiating this private conversation and understand what Augustus expects of him."],
        ap.beliefs = ["Respect for the Emperor and imperial authority is paramount and must be consistently demonstrated.", "Loyalty, truthfulness, and friendship are core personal values that define his character, aligning with Germanicus's appraisal.", "He is often underestimated and misunderstood due to his stammer and perceived intellectual limitations, requiring him to constantly prove his true worth."],
        ap.goals = ["Short-term: To make a positive and lasting impression on Augustus, avoiding any missteps or foolish utterances during this encounter.", "Medium-term: To cultivate a relationship of trust and respect with Augustus, earning the Emperor's favor and confidence.", "Ultimate: To be recognized and valued for his true intellectual capabilities and inherent loyalty, transcending superficial perceptions and contributing meaningfully to Rome's well-being, gaining acceptance within his family and the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Augustus is seated on a stone bench in the palace gardens, appearing weary but resolute. His posture is slightly slumped, reflecting fatigue, yet he engages in conversation with Claudius, gesturing as he recounts his self-imposed diet and recovery. He looks around the serene garden, momentarily distracted by its beauty, before returning focus to Claudius.',
        ap.emotional_state = 'Augustus exhibits surface-level joviality and warmth in his conversation, striving to bridge the gap between himself and Claudius. However, underlying his cheerful demeanor is a profound sense of paranoia and vulnerability, revealing his fear of betrayal and distrust towards those he once relied upon. This internal conflict manifests as he hints at his self-cure and expresses a need for purity in his diet, suggesting a deeper unease about the court.',
        ap.emotional_tags = ["augustus exhibits surface-level joviality", "warmth in his conversation, striving to bridge the gap between himself", "claudius. however, underlying his cheerful demeanor is a profound sense of paranoia", "vulnerability, revealing his fear of betrayal", "distrust towards those he once relied upon. this internal conflict manifests as he hints at his self-cure", "expresses a need for purity in his diet, suggesting a deeper unease about the court.", "augustus exhibits surface-level joviality and warmth in his conversation", "striving to bridge the gap between himself and claudius. however", "underlying his cheerful demeanor is a profound sense of paranoia and vulnerability", "revealing his fear of betrayal and distrust towards those he once relied upon. this internal conflict manifests as he hints at his self-cure and expresses a need for purity in his diet", "suggesting a deeper unease about the court."],
        ap.active_plans = ["Reassure Claudius of his value and friendship by recalling Germanicus's praise to strengthen their bond.", "Reveal personal vulnerabilities to shift perceptions of power dynamics, aiming to establish trust with Claudius.", "Set the stage for an impending departure to Capri and Nola, subtly signaling his desire to distance himself from the court."],
        ap.beliefs = ["People often misjudge others based solely on appearances, leading to misconceptions.", "True loyalty is a rare and valuable quality worth recognizing and cultivating.", "Control over one's environment, even in diet, is essential for maintaining strength and sanity."],
        ap.goals = ["Short-term: Establish a rapport with Claudius to solidify their relationship.", "Medium-term: Successfully navigate the impending transition of power and secure his legacy.", "Ultimate: Achieve a sense of personal peace and stability before his impending departure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nearby, initially hesitant but gradually more engaged as Augustus speaks. He maintains a slightly awkward posture, indicative of his discomfort, but manages to respond affirmatively to Augustus\'s inquiries. His movements are subdued, reflecting a mix of respect and nervousness as he listens intently.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal a blend of admiration and anxiety, as he grapples with the weight of his family\'s legacy and his own perceived inadequacies. Internally, he harbors a desire for acceptance and recognition from Augustus, struggling against the stigma of being seen as a fool. This tension is evident in his stammering responses and careful choices of words, revealing a conflict between his self-perception and the respect he yearns for.',
        ap.emotional_tags = ["claudius's surface emotions reveal a blend of admiration", "anxiety, as he grapples with the weight of his family's legacy", "his own perceived inadequacies. internally, he harbors a desire for acceptance", "recognition from augustus, struggling against the stigma of being seen as a fool. this tension is evident in his stammering responses", "careful choices of words, revealing a conflict between his self-perception", "the respect he yearns for.", "claudius's surface emotions reveal a blend of admiration and anxiety", "as he grapples with the weight of his family's legacy and his own perceived inadequacies. internally", "he harbors a desire for acceptance and recognition from augustus", "struggling against the stigma of being seen as a fool. this tension is evident in his stammering responses and careful choices of words", "revealing a conflict between his self-perception and the respect he yearns for."],
        ap.active_plans = ["Engage in conversation to learn more about Augustus's thoughts and intentions, hoping to gain insight into his future role.", "Demonstrate loyalty and respect to Augustus, aiming to solidify his position within the court.", "Navigate the complex dynamics of familial relationships, especially regarding his brother Germanicus and their shared interests."],
        ap.beliefs = ["Loyalty to family and Rome is paramount, regardless of personal struggles.", "His perceived foolishness does not define his worth or potential contributions.", "Understanding and navigating courtly intrigue is crucial for survival and influence."],
        ap.goals = ["Short-term: Successfully engage Augustus in conversation to deepen their connection.", "Medium-term: Establish himself as a trustworthy ally within the court, leaning on his loyalty to Germanicus.", "Ultimate: Transform from a perceived fool into a respected figure in the imperial hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Augustus, weary yet possessing a core of resolve, sits on a stone bench in his meticulously kept palace gardens. He initiates a seemingly casual conversation with Claudius, drawing him away from his studies. Though physically present in this serene setting, his mind is clearly burdened by matters of state and personal reflection, his posture suggesting a man carrying the weight of an empire even in repose.',
        ap.emotional_state = 'Beneath a veneer of emperor-like composure, Augustus is profoundly vulnerable and contemplative. Outwardly, he adopts a conversational tone, speaking of his health and personal habits with a touch of feigned lightness. However, internally, he grapples with deep-seated anxieties about his legacy and the trustworthiness of those around him. His direct question to Claudius betrays a profound insecurity and a yearning for genuine connection, masked by years of imperial command and political calculation, revealing a man seeking solace and truth as his life wanes.',
        ap.emotional_tags = ["beneath a veneer of emperor-like composure, augustus is profoundly vulnerable", "contemplative. outwardly, he adopts a conversational tone, speaking of his health", "personal habits with a touch of feigned lightness. however, internally, he grapples with deep-seated anxieties about his legacy", "the trustworthiness of those around him. his direct question to claudius betrays a profound insecurity", "a yearning for genuine connection, masked by years of imperial command", "political calculation, revealing a man seeking solace", "truth as his life wanes.", "beneath a veneer of emperor-like composure", "augustus is profoundly vulnerable and contemplative. outwardly", "he adopts a conversational tone", "speaking of his health and personal habits with a touch of feigned lightness. however", "internally", "he grapples with deep-seated anxieties about his legacy and the trustworthiness of those around him. his direct question to claudius betrays a profound insecurity and a yearning for genuine connection", "masked by years of imperial command and political calculation", "revealing a man seeking solace and truth as his life wanes."],
        ap.active_plans = ["To subtly probe Claudius's true feelings and intentions towards him, moving beyond superficial courtly pleasantries.", "To assess Claudius's character based on Germanicus's positive endorsement, seeking confirmation of his loyalty and integrity.", "To hint at deeper, unrevealed secrets and future confidences, testing Claudius's discretion and gauging his suitability as a potential confidant in his final days."],
        ap.beliefs = ["Genuine connection and trust are rare and precious commodities, especially within the treacherous environment of the imperial court.", "Appearances can be profoundly deceptive, and true character is often hidden beneath carefully constructed facades.", "Loyalty to friends, Rome, and truth are the highest virtues a person can possess, qualities he now seeks and values above political expediency."],
        ap.goals = ["Short-term: To engage in an authentic and revealing conversation with Claudius, seeking honest feedback about his own character and reign.", "Medium-term: To identify and cultivate a genuine, trustworthy ally within his family, someone outside the immediate viper's nest of succession politics.", "Ultimate: To secure a lasting and positive legacy for Rome, potentially by entrusting key secrets and responsibilities to a person of proven integrity, like the unexpectedly insightful Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands somewhat awkwardly near Augustus in the palace gardens, initially hesitant and surprised by the Emperor\'s direct approach. He maintains a respectful distance, listening attentively to Augustus\'s words and responding with deference. When invited, he sits beside the Emperor, his posture suggesting a mix of nervousness and cautious curiosity, physically present but emotionally reserved, gauging the Emperor\'s unusual interest in him.',
        ap.emotional_state = 'On the surface, Claudius displays polite surprise and a touch of nervousness at being singled out by Augustus. His stammer becomes more pronounced, a typical outward manifestation of his social unease and deference to authority. Internally, he is likely experiencing a complex mix of emotions: confusion at the unexpected attention, hope that Augustus might finally be seeing beyond his perceived foolishness, and apprehension about the Emperor\'s true motives. He is acutely aware of his precarious position within the imperial family and the potential danger of misinterpreting Augustus\'s intentions, carefully balancing hope with ingrained caution.',
        ap.emotional_tags = ["on the surface, claudius displays polite surprise", "a touch of nervousness at being singled out by augustus. his stammer becomes more pronounced, a typical outward manifestation of his social unease", "deference to authority. internally, he is likely experiencing a complex mix of emotions: confusion at the unexpected attention, hope that augustus might finally be seeing beyond his perceived foolishness,", "apprehension about the emperor's true motives. he is acutely aware of his precarious position within the imperial family", "the potential danger of misinterpreting augustus's intentions, carefully balancing hope with ingrained caution.", "on the surface", "claudius displays polite surprise and a touch of nervousness at being singled out by augustus. his stammer becomes more pronounced", "a typical outward manifestation of his social unease and deference to authority. internally", "he is likely experiencing a complex mix of emotions: confusion at the unexpected attention", "hope that augustus might finally be seeing beyond his perceived foolishness", "and apprehension about the emperor's true motives. he is acutely aware of his precarious position within the imperial family and the potential danger of misinterpreting augustus's intentions", "carefully balancing hope with ingrained caution."],
        ap.active_plans = ["To remain respectful and agreeable to Augustus, avoiding any action or word that could be misinterpreted as disrespectful or foolish in the Emperor's eyes.", "To carefully listen to Augustus's statements and questions, attempting to discern the underlying purpose of this unusual private audience and the Emperor's true feelings towards him.", "To subtly convey his loyalty and trustworthiness, mirroring the virtues Germanicus attributed to him, hoping to solidify this newfound positive perception in Augustus's mind and potentially open doors to future favor."],
        ap.beliefs = ["Respect for the Emperor and the established imperial order is paramount for survival and social standing within the Julio-Claudian dynasty.", "Germanicus's positive opinion holds significant weight and has demonstrably influenced Augustus's current perception of him.", "Honesty and loyalty, as highlighted by Germanicus, are virtues that Augustus, despite his imperial persona, genuinely values and seeks in others."],
        ap.goals = ["Short-term: To successfully navigate this unexpected encounter with Augustus, ensuring he does not inadvertently offend or displease the Emperor.", "Medium-term: To cultivate a more positive and respectful relationship with Augustus, leveraging Germanicus's endorsement to gain imperial favor and recognition.", "Ultimate: To gradually emerge from the shadows of ridicule and be acknowledged for his true intellectual and moral worth within the Roman court, though this remains a distant and perhaps still unconscious aspiration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Augustus sits on a stone bench in the serene palace gardens, his posture weary yet resolute. As he speaks to Claudius, he gestures lightly with his hands, attempting to convey sincerity and openness, despite his frailty. His gaze wanders around the garden, occasionally returning to meet Claudius\'s eyes, reflecting a sense of both vulnerability and curiosity.',
        ap.emotional_state = 'Augustus outwardly displays a humorous and somewhat apologetic demeanor, masking his deeper anxieties about his health and legacy. Internally, he grapples with regret over his past misconceptions about Claudius, and a flicker of hope ignites as he recognizes Claudius\'s loyalty and potential. This emotional complexity reveals a man at the twilight of his power, seeking connection and validation.',
        ap.emotional_tags = ["augustus outwardly displays a humorous", "somewhat apologetic demeanor, masking his deeper anxieties about his health", "legacy. internally, he grapples with regret over his past misconceptions about claudius,", "a flicker of hope ignites as he recognizes claudius's loyalty", "potential. this emotional complexity reveals a man at the twilight of his power, seeking connection", "validation.", "augustus outwardly displays a humorous and somewhat apologetic demeanor", "masking his deeper anxieties about his health and legacy. internally", "he grapples with regret over his past misconceptions about claudius", "and a flicker of hope ignites as he recognizes claudius's loyalty and potential. this emotional complexity reveals a man at the twilight of his power", "seeking connection and validation."],
        ap.active_plans = ["To reconnect with Claudius and express his newfound appreciation for him.", "To share important secrets regarding his health and the future of the empire.", "To build trust with Claudius, laying the groundwork for a potential alliance."],
        ap.beliefs = ["Appearances can be deceiving, as demonstrated by his misjudgment of Claudius.", "Loyalty to friends, Rome, and truth are the highest virtues, as highlighted by Germanicus's words.", "Even at an advanced age, one can still find unexpected friendships and alliances."],
        ap.goals = ["Short-term: To reassure Claudius of his health and intentions.", "Medium-term: To cement a bond of trust with Claudius for future political support.", "Ultimate: To ensure a stable succession and the continued strength of the empire after his departure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Standing nearby, Claudius appears hesitant but attentive, his physical presence marked by slight fidgeting as he processes Augustus\'s words. His posture is slightly hunched, indicative of his uncertainty, yet he leans slightly toward Augustus, showing engagement. His facial expressions shift from apprehension to tentative hope as Augustus\'s praise unfolds.',
        ap.emotional_state = 'Claudius initially exhibits anxiety and uncertainty, grappling with the weight of Augustus\'s scrutiny. However, as Augustus acknowledges his loyalty, Claudius\'s apprehension gives way to a burgeoning sense of validation and pride. Internally, he feels a mix of disbelief and gratitude, battling a long-standing perception of himself as a fool.',
        ap.emotional_tags = ["claudius initially exhibits anxiety", "uncertainty, grappling with the weight of augustus's scrutiny. however, as augustus acknowledges his loyalty, claudius's apprehension gives way to a burgeoning sense of validation", "pride. internally, he feels a mix of disbelief", "gratitude, battling a long-standing perception of himself as a fool.", "claudius initially exhibits anxiety and uncertainty", "grappling with the weight of augustus's scrutiny. however", "as augustus acknowledges his loyalty", "claudius's apprehension gives way to a burgeoning sense of validation and pride. internally", "he feels a mix of disbelief and gratitude", "battling a long-standing perception of himself as a fool."],
        ap.active_plans = ["To absorb and understand Augustus's unexpected praise and acknowledgment.", "To express his loyalty and support for Augustus and the empire.", "To navigate the complexities of his newfound status in Augustus\u2019s eyes."],
        ap.beliefs = ["His perceived foolishness is a barrier to being truly valued in the court.", "Loyalty and integrity are vital, even when they go unrecognized.", "Augustus's perception of him could change and lead to newfound opportunities."],
        ap.goals = ["Short-term: To reassure Augustus of his trustworthiness.", "Medium-term: To establish a more favorable relationship with Augustus.", "Ultimate: To emerge as a respected figure within the imperial court, proving his worth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Augustus sits wearily on a stone bench in his palace gardens, his physical strength waning but his gaze sharp and probing. He initiates a seemingly casual conversation with Claudius, drawing him into the garden under the pretense of visiting Livia. Despite his frail appearance, Augustus remains resolute in his intentions, observing Claudius intently as he speaks of his health and upcoming travels.',
        ap.emotional_state = 'Augustus is a complex blend of weariness and shrewd calculation. Outwardly, he presents a facade of calm reflection, musing about his health and the beauty of the garden. However, beneath this veneer lies a deep-seated introspection and a yearning for genuine connection. He expresses regret for his past misjudgment of Claudius, hinting at a desire for redemption and a genuine friendship in his twilight years, though tinged with the ever-present suspicion of a seasoned ruler.',
        ap.emotional_tags = ["augustus is a complex blend of weariness", "shrewd calculation. outwardly, he presents a facade of calm reflection, musing about his health", "the beauty of the garden. however, beneath this veneer lies a deep-seated introspection", "a yearning for genuine connection. he expresses regret for his past misjudgment of claudius, hinting at a desire for redemption", "a genuine friendship in his twilight years, though tinged with the ever-present suspicion of a seasoned ruler.", "augustus is a complex blend of weariness and shrewd calculation. outwardly", "he presents a facade of calm reflection", "musing about his health and the beauty of the garden. however", "beneath this veneer lies a deep-seated introspection and a yearning for genuine connection. he expresses regret for his past misjudgment of claudius", "hinting at a desire for redemption and a genuine friendship in his twilight years", "though tinged with the ever-present suspicion of a seasoned ruler."],
        ap.active_plans = ["To assess Claudius's true character and loyalty, moving beyond superficial appearances and court gossip.", "To gauge Claudius's reaction to his republican sentiments and his secret Corsica trip, testing his discretion and trustworthiness.", "To forge a genuine human connection with Claudius, seeking solace and perhaps a reliable ally in a court rife with deceit and ambition."],
        ap.beliefs = ["Appearances are deceptive, and his initial judgment of Claudius as a fool was incorrect.", "Loyalty to friends, Rome, and truth are the highest virtues a person can possess.", "Despite being Emperor, his true political inclinations lean towards republican ideals, a sentiment he has had to suppress throughout his reign."],
        ap.goals = ["Short-term: To establish a moment of genuine connection and frank conversation with Claudius, away from the usual courtly artifice.", "Medium-term: To cultivate a trusting relationship with Claudius, potentially relying on him as a confidant and ally in the turbulent times ahead.", "Ultimate: To secure the future of Rome by identifying and nurturing individuals of true integrity, like Claudius, and to find some personal peace and understanding before his death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands hesitantly beside Augustus, initially surprised by the Emperor\'s direct address. He is polite and deferential, readily agreeing to sit with Augustus in the garden. He listens attentively, his posture reflecting a mix of nervousness and genuine interest in the Emperor\'s words, responding with careful consideration to Augustus\'s probing questions.',
        ap.emotional_state = 'Claudius is a mixture of surprise, humility, and cautious optimism. He is taken aback by Augustus\'s unexpected approach and the Emperor\'s apparent change of heart towards him. While outwardly composed and respectful, internally, he grapples with a sense of disbelief and a flicker of hope that he might finally be seen for who he truly is, not just the stammering fool the court perceives. There\'s an undercurrent of eagerness to prove himself worthy of Augustus\'s newfound attention and trust.',
        ap.emotional_tags = ["claudius is a mixture of surprise, humility,", "cautious optimism. he is taken aback by augustus's unexpected approach", "the emperor's apparent change of heart towards him. while outwardly composed", "respectful, internally, he grapples with a sense of disbelief", "a flicker of hope that he might finally be seen for who he truly is, not just the stammering fool the court perceives. there's an undercurrent of eagerness to prove himself worthy of augustus's newfound attention", "trust.", "claudius is a mixture of surprise", "humility", "and cautious optimism. he is taken aback by augustus's unexpected approach and the emperor's apparent change of heart towards him. while outwardly composed and respectful", "internally", "he grapples with a sense of disbelief and a flicker of hope that he might finally be seen for who he truly is", "not just the stammering fool the court perceives. there's an undercurrent of eagerness to prove himself worthy of augustus's newfound attention and trust."],
        ap.active_plans = ["To remain respectful and attentive to the Emperor, ensuring his responses are perceived as loyal and sincere.", "To carefully listen to Augustus's revelations and gauge the true purpose behind this unexpected conversation.", "To demonstrate the virtues that Germanicus praised \u2013 loyalty, truthfulness, and friendship \u2013 in his interactions with Augustus, hoping to solidify the Emperor's positive impression."],
        ap.beliefs = ["Augustus, despite his past dismissals, is still the Emperor and deserving of utmost respect and deference.", "Germanicus's positive endorsement has significantly influenced Augustus's perception of him.", "Honesty and loyalty are the best approaches when interacting with powerful figures like Augustus, and these virtues will ultimately be recognized and valued."],
        ap.goals = ["Short-term: To navigate this unexpected conversation with Augustus successfully, avoiding any missteps or misunderstandings.", "Medium-term: To cultivate a positive and trusting relationship with Augustus, capitalizing on this newfound opportunity for imperial favor.", "Ultimate: To transcend the court's perception of him as a fool and to potentially contribute meaningfully to Rome, proving his worth and intelligence to the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Augustus sits on a stone bench in the serene palace gardens, his posture weary yet resolute. He gestures with his hands as he speaks to Claudius, emphasizing points with careful movements, revealing a juxtaposition of frailty and authority. His surroundings reflect his inner turmoil, as he surveys the tranquil garden while grappling with his own mortality and the burden of secrecy.',
        ap.emotional_state = 'Outwardly, Augustus presents a facade of cordiality and warmth, speaking with a tone that is both casual and sincere. However, beneath this surface, a deep anxiety simmers; he is acutely aware of the precariousness of his situation and his own vulnerability. His confession to Claudius is tinged with both desperation and a hopeful yearning for trust, highlighting the unspoken weight of his impending legacy.',
        ap.emotional_tags = ["outwardly, augustus presents a facade of cordiality", "warmth, speaking with a tone that is both casual", "sincere. however, beneath this surface, a deep anxiety simmers; he is acutely aware of the precariousness of his situation", "his own vulnerability. his confession to claudius is tinged with both desperation", "a hopeful yearning for trust, highlighting the unspoken weight of his impending legacy.", "outwardly", "augustus presents a facade of cordiality and warmth", "speaking with a tone that is both casual and sincere. however", "beneath this surface", "a deep anxiety simmers; he is acutely aware of the precariousness of his situation and his own vulnerability. his confession to claudius is tinged with both desperation and a hopeful yearning for trust", "highlighting the unspoken weight of his impending legacy.", "outwardly, augustus presents a facade of cordiality and warmth, speaking with a tone that is both casual and sincere. however, beneath this surface, a deep anxiety simmers", "he is acutely aware of the precariousness of his situation and his own vulnerability. his confession to claudius is tinged with both desperation and a hopeful yearning for trust, highlighting the unspoken weight of his impending legacy."],
        ap.active_plans = ["To share the secret of his altered will with Claudius, solidifying their friendship.", "To seek reassurance and loyalty from Claudius during his declining health.", "To prepare for his trip to Capri and Nola, attempting to find respite from his burdens."],
        ap.beliefs = ["Trust is a rare and precious commodity in the imperial court.", "People can often be misjudged based on appearances alone.", "Loyalty to friends and family is of utmost importance, especially in times of uncertainty."],
        ap.goals = ["Short-term: To reassure Claudius of his intentions and establish a bond of trust.", "Medium-term: To secure Claudius\u2019s silence regarding the alterations to his will.", "Ultimate: To navigate the succession crisis with integrity and leave a legacy that reflects his values."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nearby, initially hesitant but gradually relaxing his posture as the conversation unfolds. He maintains eye contact with Augustus, his hands often fidgeting in a way that reveals his underlying anxiety. As he sits beside Augustus, he leans slightly forward, indicating his engagement and willingness to listen, despite his inherent awkwardness.',
        ap.emotional_state = 'Claudius\'s outward demeanor is marked by a blend of apprehension and curiosity. He struggles with his stammer but strives to convey his thoughts without faltering. Internally, he wrestles with a mix of surprise and hope as Augustus confides in him, highlighting a desire for recognition and acceptance in a world that often dismisses him. His heart races at the prospect of trust being extended to him.',
        ap.emotional_tags = ["claudius's outward demeanor is marked by a blend of apprehension", "curiosity. he struggles with his stammer but strives to convey his thoughts without faltering. internally, he wrestles with a mix of surprise", "hope as augustus confides in him, highlighting a desire for recognition", "acceptance in a world that often dismisses him. his heart races at the prospect of trust being extended to him.", "claudius's outward demeanor is marked by a blend of apprehension and curiosity. he struggles with his stammer but strives to convey his thoughts without faltering. internally", "he wrestles with a mix of surprise and hope as augustus confides in him", "highlighting a desire for recognition and acceptance in a world that often dismisses him. his heart races at the prospect of trust being extended to him.", "claudius's outward demeanor is marked by a blend of apprehension and curiosity. he struggles with his stammer", "strives to convey his thoughts without faltering. internally, he wrestles with a mix of surprise and hope as augustus confides in him, highlighting a desire for recognition and acceptance in a world that often dismisses him. his heart races at the prospect of trust being extended to him."],
        ap.active_plans = ["To listen attentively to Augustus and respond appropriately, hoping to affirm their newfound rapport.", "To maintain confidentiality about Augustus's altered will, understanding the gravity of the trust placed in him.", "To navigate the complexities of his relationship with Augustus, seeking to prove his loyalty and worth."],
        ap.beliefs = ["His stammer often leads others to underestimate him, but he recognizes his own value.", "Loyalty and integrity are vital in the treacherous landscape of imperial politics.", "Truth and open communication can forge genuine relationships, even in the shadow of power."],
        ap.goals = ["Short-term: To reassure Augustus of his loyalty and intentions.", "Medium-term: To strengthen his bond with Augustus and gain a deeper understanding of his position in the court.", "Ultimate: To emerge as a trusted advisor and ally in the unfolding succession crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_7'})
    ON CREATE SET
        ap.current_status = 'Augustus, though weary from his illness, sits with resolute posture on a stone bench in the palace gardens, engaging Claudius in an intimate conversation. He gestures calmly as he speaks of his self-cure and upcoming travels, his physical frailty juxtaposed with a lingering imperial presence. He is the one who initiated this meeting, drawing Claudius away from his usual pursuits to impart crucial information and assess his character.',
        ap.emotional_state = 'Beneath a veneer of weariness, Augustus is deeply introspective and searching for genuine connection in his twilight years. He expresses a surprising humility and regret for his past misjudgment of Claudius, revealing a vulnerability not often seen. There\'s a palpable desire for trust and loyalty, born from a weariness of courtly deceit, mixed with a poignant acceptance of his mortality and a yearning for authentic companionship before his final journey.',
        ap.emotional_tags = ["beneath a veneer of weariness, augustus is deeply introspective", "searching for genuine connection in his twilight years. he expresses a surprising humility", "regret for his past misjudgment of claudius, revealing a vulnerability not often seen. there's a palpable desire for trust", "loyalty, born from a weariness of courtly deceit, mixed with a poignant acceptance of his mortality", "a yearning for authentic companionship before his final journey.", "beneath a veneer of weariness", "augustus is deeply introspective and searching for genuine connection in his twilight years. he expresses a surprising humility and regret for his past misjudgment of claudius", "revealing a vulnerability not often seen. there's a palpable desire for trust and loyalty", "born from a weariness of courtly deceit", "mixed with a poignant acceptance of his mortality and a yearning for authentic companionship before his final journey."],
        ap.active_plans = ["To forge a genuine bond of friendship with Claudius in his old age, seeking solace and trustworthy companionship.", "To subtly test Claudius's loyalty and discretion by sharing sensitive information about his altered will and visit to Postumus.", "To assess Claudius's true character and intellect, moving beyond superficial impressions and court gossip, in order to find a reliable ally."],
        ap.beliefs = ["Appearances can be deceiving, and true worth is often hidden beneath superficial judgments.", "Loyalty to friends, Rome, and truth are the most admirable qualities a person can possess.", "Despite his imperial role, his true heart aligns with republican ideals, believing in a simpler, less power-hungry form of governance."],
        ap.goals = ["Short-term: To establish a comfortable and trusting rapport with Claudius through open and honest conversation.", "Medium-term: To secure Claudius as a confidant and ally, someone he can rely on for genuine counsel and discretion.", "Ultimate: To ensure the stability and future of Rome by fostering alliances based on true loyalty and wisdom, possibly through Claudius's unexpected virtues."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'})
    ON CREATE SET
        ap.current_status = 'Claudius stands initially hesitant and surprised by Augustus\'s summons in the palace gardens, his posture suggesting a mix of deference and uncertainty. He listens attentively to Augustus, nodding and responding with careful consideration, his stammer evident but not hindering his earnest engagement. As the conversation progresses, he sits beside Augustus, mirroring the Emperor\'s shift to a more relaxed and intimate exchange.',
        ap.emotional_state = 'Claudius is initially taken aback and likely nervous by the Emperor\'s unexpected approach, accustomed as he is to being overlooked or dismissed. As Augustus speaks, a mixture of surprise, relief, and burgeoning hope washes over him. He is deeply touched and validated by Augustus\'s acknowledgment of his worth and loyalty, a stark contrast to the usual courtly scorn. Beneath his outward humility, a quiet sense of pride and purpose begins to stir, fueled by the Emperor\'s newfound trust.',
        ap.emotional_tags = ["claudius is initially taken aback", "likely nervous by the emperor's unexpected approach, accustomed as he is to being overlooked or dismissed. as augustus speaks, a mixture of surprise, relief,", "burgeoning hope washes over him. he is deeply touched", "validated by augustus's acknowledgment of his worth", "loyalty, a stark contrast to the usual courtly scorn. beneath his outward humility, a quiet sense of pride", "purpose begins to stir, fueled by the emperor's newfound trust.", "claudius is initially taken aback and likely nervous by the emperor's unexpected approach", "accustomed as he is to being overlooked or dismissed. as augustus speaks", "a mixture of surprise", "relief", "and burgeoning hope washes over him. he is deeply touched and validated by augustus's acknowledgment of his worth and loyalty", "a stark contrast to the usual courtly scorn. beneath his outward humility", "a quiet sense of pride and purpose begins to stir", "fueled by the emperor's newfound trust."],
        ap.active_plans = ["To demonstrate unwavering respect and deference towards Emperor Augustus, ensuring he does not displease the powerful ruler.", "To attentively listen to Augustus's words, seeking to fully understand the Emperor's intentions and the significance of this unexpected conversation.", "To subtly convey his loyalty and trustworthiness to Augustus, hoping to solidify the Emperor's changing perception of him and foster a deeper connection."],
        ap.beliefs = ["Emperor Augustus is a figure deserving of utmost respect and obedience due to his imperial stature and wisdom.", "Germanicus, his brother, possesses keen judgment and insight, and his positive words about Claudius hold significant weight.", "Loyalty and truthfulness are paramount virtues that define his character and guide his actions in the treacherous court."],
        ap.goals = ["Short-term: To navigate this unexpected interaction with Augustus successfully, avoiding any missteps or displays of foolishness.", "Medium-term: To cultivate Augustus's newfound respect and trust, potentially opening doors to greater influence and recognition within the imperial family.", "Ultimate: To prove his true worth beyond the court's shallow perception of him, ultimately contributing to Rome's well-being and securing a meaningful place in its history, perhaps even beyond his wildest dreams."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_11_1'})
    ON CREATE SET
        oi.description = 'The dice serve as the focal point of Augustus\'s celebratory game, symbolizing chance and fortune. They are thrown repeatedly by Augustus, inciting excitement and friendly banter among the attendees, and ultimately influencing the dynamics of the evening with each roll that heightens the stakes and leads to the eventual disruption of the festivities when Augustus falls ill.',
        oi.status_before = 'The dice are unworn and polished, ready to be used for the evening\'s game, symbolizing the potential for fortune and misfortune among the players.',
        oi.status_after = 'After Augustus\'s sudden illness, the dice lie forgotten on the table, marking a sharp transition from merriment to concern, emblematic of the fragile nature of luck and health.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Augustus is seated among a jovial group, his face flushed with excitement as he throws the dice with exuberance. He gestures animatedly, drawing others into his playful betting game, exuding an air of victorious confidence.',
        ap.emotional_state = 'Augustus displays surface-level elation and triumph, reveling in the thrill of the dice game. However, beneath this facade, there is an undercurrent of distress as he begins to feel unwell, highlighting the tension between his celebratory demeanor and his failing health.',
        ap.emotional_tags = ["augustus displays surface-level elation", "triumph, reveling in the thrill of the dice game. however, beneath this facade, there is an undercurrent of distress as he begins to feel unwell, highlighting the tension between his celebratory demeanor", "his failing health.", "augustus displays surface-level elation and triumph", "reveling in the thrill of the dice game. however", "beneath this facade", "there is an undercurrent of distress as he begins to feel unwell", "highlighting the tension between his celebratory demeanor and his failing health."],
        ap.active_plans = ["To enjoy the game and maximize his winnings as he boasts of his luck.", "To maintain a light-hearted atmosphere among his companions, showcasing his status and charm.", "To ignore any signs of discomfort in order to prolong the evening's revelry."],
        ap.beliefs = ["Luck is a fleeting but essential aspect of life that should be embraced.", "His position as emperor grants him the right to indulge and enjoy life despite any personal struggles.", "The camaraderie of the court is vital for maintaining his image and power."],
        ap.goals = ["Short-term: To win more from the dice game and enjoy the revelry with his friends.", "Medium-term: To assert his jovial authority in the court, reinforcing his position as emperor.", "Ultimate: To distract himself from the impending reality of his health and secure his legacy through shared moments of joy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Junius is engaged in the game, animatedly discussing bets and joking with Augustus. He appears eager to join in the fun, despite his lack of funds, showcasing a playful and respectful demeanor amidst the revelry.',
        ap.emotional_state = 'Junius embodies a lighthearted spirit, expressing a sense of camaraderie and optimism despite his financial constraints. Internally, he may feel a twinge of embarrassment for not being able to contribute to the betting, but he masks it with humor.',
        ap.emotional_tags = ["junius embodies a lighthearted spirit, expressing a sense of camaraderie", "optimism despite his financial constraints. internally, he may feel a twinge of embarrassment for not being able to contribute to the betting, but he masks it with humor.", "junius embodies a lighthearted spirit", "expressing a sense of camaraderie and optimism despite his financial constraints. internally", "he may feel a twinge of embarrassment for not being able to contribute to the betting", "but he masks it with humor.", "junius embodies a lighthearted spirit, expressing a sense of camaraderie and optimism despite his financial constraints. internally, he may feel a twinge of embarrassment for not being able to contribute to the betting,", "he masks it with humor."],
        ap.active_plans = ["To participate in the game as much as possible, despite being out of money.", "To maintain a cheerful atmosphere and engage with Augustus, reinforcing his status as a loyal courtier.", "To express gratitude for Augustus\u2019s generosity while attempting to elicit further support."],
        ap.beliefs = ["The court's jovial spirit is essential for maintaining relationships and favor.", "Loyalty to Augustus is paramount, and supporting him in his revelry is a sign of respect.", "Even without money, one can still contribute to the enjoyment of the moment."],
        ap.goals = ["Short-term: To enjoy the game and camaraderie without the pressure of financial stakes.", "Medium-term: To keep Augustus entertained and bolster his spirits.", "Ultimate: To be seen as a valued member of the emperor's circle, ensuring his own standing in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Montanus is present as a concerned observer, his demeanor reflective and serious amid the raucous laughter. He maintains a watchful eye on Augustus, ready to intervene should the emperor\'s health take a turn for the worse.',
        ap.emotional_state = 'Montanus exhibits a veneer of calm professionalism, yet there is an underlying tension as he worries about Augustus’s well-being. His concern for the emperor clashes with the light-heartedness of the surroundings, creating a palpable sense of unease.',
        ap.emotional_tags = ["montanus exhibits a veneer of calm professionalism", "yet there is an underlying tension as he worries about augustus\u2019s well-being. his concern for the emperor clashes with the light-heartedness of the surroundings", "creating a palpable sense of unease."],
        ap.active_plans = ["To monitor Augustus's condition closely as he participates in the game.", "To prepare to intervene if Augustus shows clear signs of distress or health decline.", "To advocate for Augustus's health if the revelry threatens to escalate into recklessness."],
        ap.beliefs = ["The health of Augustus is paramount, and his well-being must come before revelry.", "Professional duty requires him to remain vigilant, even in moments of celebration.", "The court often overlooks health in favor of indulgence, which he finds troubling."],
        ap.goals = ["Short-term: To ensure Augustus remains within safe limits while enjoying the game.", "Medium-term: To balance the atmosphere of fun with the seriousness of Augustus's health needs.", "Ultimate: To safeguard Augustus\u2019s health and preserve the stability of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Augustus is the life of the party, enthusiastically engaging in a dice game with his companions. He\'s animated and physically involved, throwing the dice with gusto, gesturing emphatically as he boasts about his winning streak and urging everyone around him to continue playing and placing bets, clearly relishing the boisterous atmosphere he\'s created.',
        ap.emotional_state = 'On the surface, Augustus is radiating jovial confidence and excitement, expressing clear delight in his winning streak and the lively game. However, beneath this veneer of celebratory exuberance, there\'s a palpable undercurrent of forced gaiety. This display might be a desperate attempt to ignore or outrun his declining health, projecting an image of robust vitality even as his body betrays him. The sudden, sharp pain reveals the fragility masked by his forced merriment, hinting at an internal struggle to maintain control in the face of physical deterioration.',
        ap.emotional_tags = ["on the surface, augustus is radiating jovial confidence", "excitement, expressing clear delight in his winning streak", "the lively game. however, beneath this veneer of celebratory exuberance, there's a palpable undercurrent of forced gaiety. this display might be a desperate attempt to ignore or outrun his declining health, projecting an image of robust vitality even as his body betrays him. the sudden, sharp pain reveals the fragility masked by his forced merriment, hinting at an internal struggle to maintain control in the face of physical deterioration.", "on the surface", "augustus is radiating jovial confidence and excitement", "expressing clear delight in his winning streak and the lively game. however", "beneath this veneer of celebratory exuberance", "there's a palpable undercurrent of forced gaiety. this display might be a desperate attempt to ignore or outrun his declining health", "projecting an image of robust vitality even as his body betrays him. the sudden", "sharp pain reveals the fragility masked by his forced merriment", "hinting at an internal struggle to maintain control in the face of physical deterioration."],
        ap.active_plans = ["To dominate the dice game and enjoy a sense of triumph over his companions.", "To project an image of health and vigor, masking his underlying physical weakness from himself and others.", "To create a diversion and momentarily escape the looming reality of his failing health and the anxieties surrounding his succession."],
        ap.beliefs = ["He believes in the power of luck and fate, attributing his dice wins to 'Venus'.", "He believes in maintaining a facade of strength and control, even when physically vulnerable.", "He believes in seizing fleeting moments of joy and distraction as a temporary respite from his grim reality."],
        ap.goals = ["Short-term Goal: To win the current dice game and experience immediate gratification from the revelry.", "Medium-term Goal: To temporarily ignore his failing health and maintain an illusion of normalcy and power for himself and those around him.", "Ultimate Goal: To exert control over his final moments by dictating the atmosphere and projecting an image of a vital, fortunate ruler, defying the encroaching shadow of death for as long as possible."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_from_garden_event_12_1'})
    ON CREATE SET
        oi.description = 'The figs from the garden symbolize Augustus\'s stubborn refusal to accept conventional care. They are the sole sustenance he allows himself, representing both his rejection of the vulnerability that comes with illness and his desire to exert control over his circumstances. His insistence on personally picking them underscores a desperate attempt to connect with life\'s simplicity and purity amidst the political treachery surrounding him.',
        oi.status_before = 'The figs are ripe and abundant, growing in the villa garden, awaiting harvest. They symbolize freshness and vitality, a stark contrast to Augustus\'s deteriorating health.',
        oi.status_after = 'The figs remain in the garden, untouched by any other hands. Augustus\'s determination to pick them himself means they are not consumed, emblematic of his isolation and refusal to accept help.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs_from_garden'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Augustus lies in a simple bed within the austere confines of the villa, his frail body draped beneath a thin blanket. He gestures weakly yet emphatically, insisting on his fig-only diet, channeling the remnants of his imperial authority in a moment of desperation. His posture, though weakened, reflects a stubborn resolve as he grips the blanket, his fingers twitching slightly.',
        ap.emotional_state = 'On the surface, Augustus exhibits a fierce determination, his voice trembling with the remnants of regal command. Internally, however, he wrestles with paranoia and fear, suspecting betrayal by those around him. The refusal to eat signifies a deeper struggle with his mortality and a desperate need to reclaim agency in a world that feels increasingly out of control.',
        ap.emotional_tags = ["on the surface, augustus exhibits a fierce determination, his voice trembling with the remnants of regal command. internally, however, he wrestles with paranoia", "fear, suspecting betrayal by those around him. the refusal to eat signifies a deeper struggle with his mortality", "a desperate need to reclaim agency in a world that feels increasingly out of control.", "on the surface", "augustus exhibits a fierce determination", "his voice trembling with the remnants of regal command. internally", "however", "he wrestles with paranoia and fear", "suspecting betrayal by those around him. the refusal to eat signifies a deeper struggle with his mortality and a desperate need to reclaim agency in a world that feels increasingly out of control."],
        ap.active_plans = ["Insist on picking figs personally as a means to feel in control amidst his illness.", "Reject all other forms of nourishment in an act of defiance against perceived betrayals.", "Maintain a fa\u00e7ade of strength and authority, even in the face of his declining health."],
        ap.beliefs = ["Trusting no one in his court, believing all may conspire against him.", "Believing that control over even small decisions, such as his diet, can maintain his dignity.", "Viewing his diet of figs as a symbolic return to nature and purity amidst the corruption of his reign."],
        ap.goals = ["Short-term: To eat only figs from the garden to assert his will.", "Medium-term: To stabilize his health, however misguidedly, as a means of reclaiming authority.", "Ultimate: To retain what little power he has left and to confront the threats surrounding his legacy."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_from_garden_event_13_1'})
    ON CREATE SET
        oi.description = 'The figs from the garden are the sole sustenance Augustus is consuming, representing his desperate attempt at self-cure and rejection of the court\'s perceived contamination. He insists on them as a pure and natural remedy, directly defying Montanus\'s medical advice. The figs become a focal point of contention, symbolizing Augustus\'s paranoia and irrationality in the face of his deteriorating health, and his desperate grasp for control.',
        oi.status_before = 'Ripe and readily available in the villa\'s garden, seemingly wholesome and natural, representing a source of nourishment.',
        oi.status_after = 'Being actively consumed by Augustus, their state as fruit remains unchanged, but their symbolic significance is heightened as a symbol of Augustus\'s misguided self-treatment and defiance of conventional medical wisdom, further emphasizing his detachment from rational care.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs_from_garden'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_medicine_event_13_1'})
    ON CREATE SET
        oi.description = 'The medicine is offered by Montanus as a conventional and necessary treatment to alleviate Augustus\'s digestive distress. However, Augustus vehemently rejects it, viewing it with suspicion as something \'touched by human hand\' and thus potentially poisoned. The medicine represents rational medical care and Montanus\'s professional concern, directly juxtaposed with Augustus\'s paranoid and irrational approach to his illness. Its rejection highlights the Emperor\'s deep distrust and underscores the futility of reasoned intervention in his current state of mind.',
        oi.status_before = 'Prepared and readily available, held by Montanus, representing a potential remedy and a standard medical intervention.',
        oi.status_after = 'Rejected by Augustus and remaining unused, rendering it ineffective in treating the Emperor. Its state of being unused symbolizes the failure of conventional medicine in the face of imperial paranoia and stubbornness, and the deepening crisis of Augustus\'s health.'
    WITH oi
    MATCH (o:Object {uuid: 'object_medicine'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Montanus is actively examining Augustus, his brow furrowed with concern as he probes and observes the Emperor\'s weakened state. He gestures with a vial of medicine, attempting to reason with Augustus, his voice laced with professional urgency and a hint of exasperation at the Emperor\'s stubbornness.',
        ap.emotional_state = 'Outwardly, Montanus displays frustration and professional concern, his tone sharp as he questions Augustus\'s sanity. Internally, he is deeply worried about his patient\'s deteriorating health, feeling a sense of helplessness as his medical expertise is dismissed. He is conflicted between his duty to care for Augustus and the Emperor\'s irrational refusal of aid, creating a tension between professional obligation and personal frustration.',
        ap.emotional_tags = ["outwardly, montanus displays frustration", "professional concern, his tone sharp as he questions augustus's sanity. internally, he is deeply worried about his patient's deteriorating health, feeling a sense of helplessness as his medical expertise is dismissed. he is conflicted between his duty to care for augustus", "the emperor's irrational refusal of aid, creating a tension between professional obligation", "personal frustration.", "outwardly", "montanus displays frustration and professional concern", "his tone sharp as he questions augustus's sanity. internally", "he is deeply worried about his patient's deteriorating health", "feeling a sense of helplessness as his medical expertise is dismissed. he is conflicted between his duty to care for augustus and the emperor's irrational refusal of aid", "creating a tension between professional obligation and personal frustration."],
        ap.active_plans = ["To convince Augustus to accept medical treatment, emphasizing the severity of his condition.", "To counter Augustus's irrational insistence on the fig-only diet, highlighting its detrimental effects.", "To maintain a semblance of professional control in a situation spiraling towards medical crisis, despite the Emperor's defiance."],
        ap.beliefs = ["Conventional medicine is the rational and effective approach to treat Augustus's ailment.", "As a physician, his expertise is valuable and should be respected, especially in matters of health.", "Augustus's current insistence on figs and rejection of medicine is a sign of delirium and unsound judgment caused by his illness."],
        ap.goals = ["Short-term: To administer medicine to Augustus immediately to alleviate his symptoms.", "Medium-term: To stabilize Augustus's health and prevent further decline through proper medical care.", "Ultimate: To ensure Augustus's recovery and regain his health, fulfilling his professional duty and preserving the Emperor's life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Augustus lies in his secluded villa, weakened and irritable, as Montanus examines him. He vehemently refuses any medicine offered, waving a dismissive hand and insisting on his diet of figs from the garden. His voice, though frail, is firm with imperial command as he asserts his will, rejecting any intervention \'touched by human hand\'.',
        ap.emotional_state = 'On the surface, Augustus projects defiance and imperial stubbornness, his tone curt and dismissive towards Montanus. Beneath this facade, he is gripped by paranoia and fear, deeply distrustful of those around him, including his physician. He is internally battling desperation and a sense of losing control, clinging to the figs as a symbol of purity in a world he perceives as poisoned, masking his fear of death with a show of autocratic will.',
        ap.emotional_tags = ["on the surface, augustus projects defiance", "imperial stubbornness, his tone curt", "dismissive towards montanus. beneath this facade, he is gripped by paranoia", "fear, deeply distrustful of those around him, including his physician. he is internally battling desperation", "a sense of losing control, clinging to the figs as a symbol of purity in a world he perceives as poisoned, masking his fear of death with a show of autocratic will.", "on the surface", "augustus projects defiance and imperial stubbornness", "his tone curt and dismissive towards montanus. beneath this facade", "he is gripped by paranoia and fear", "deeply distrustful of those around him", "including his physician. he is internally battling desperation and a sense of losing control", "clinging to the figs as a symbol of purity in a world he perceives as poisoned", "masking his fear of death with a show of autocratic will."],
        ap.active_plans = ["To reject all forms of conventional medicine and maintain his self-prescribed fig-only diet.", "To assert his imperial authority and dismiss Montanus's medical advice, reinforcing his sense of control.", "To isolate himself from perceived contamination, believing that natural, untouched elements offer a safer path to recovery."],
        ap.beliefs = ["Anything 'touched by human hand', including medicine, is potentially tainted or poisoned by the corrupt court.", "Natural elements, like figs from his garden, represent purity and offer a genuine path to healing.", "His imperial will and personal judgment are superior to medical expertise, especially in matters concerning his own body and destiny."],
        ap.goals = ["Short-term: To continue consuming only figs and refuse Montanus's medicine *in this moment*.", "Medium-term: To cleanse his body and spirit of the perceived corruption and poison of the court through his natural diet.", "Ultimate: To regain his health and vitality, defying mortality and the perceived threats to his life, albeit through misguided and irrational methods."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Augustus lies on a bed, frail and visibly distressed, his body tense with the exertion of rejecting Montanus\'s advice. His brow is furrowed, and his hands clutch at the fabric of the bed, as he vehemently declares his refusal. His posture reflects both his weakened state and his fierce determination to assert control over his circumstances.',
        ap.emotional_state = 'Augustus is enveloped in a whirlwind of paranoia and defiance. Surface emotions manifest as anger and desperation, evident in his raised voice and clenched fists. Internally, he battles fear and a sense of impending doom, feeling besieged by the very people meant to nurture him, particularly Livia. The dissonance between his outward bravado and inward terror reveals the madness creeping into his once-mighty psyche.',
        ap.emotional_tags = ["augustus is enveloped in a whirlwind of paranoia", "defiance. surface emotions manifest as anger", "desperation, evident in his raised voice", "clenched fists. internally, he battles fear", "a sense of impending doom, feeling besieged by the very people meant to nurture him, particularly livia. the dissonance between his outward bravado", "inward terror reveals the madness creeping into his once-mighty psyche.", "augustus is enveloped in a whirlwind of paranoia and defiance. surface emotions manifest as anger and desperation", "evident in his raised voice and clenched fists. internally", "he battles fear and a sense of impending doom", "feeling besieged by the very people meant to nurture him", "particularly livia. the dissonance between his outward bravado and inward terror reveals the madness creeping into his once-mighty psyche."],
        ap.active_plans = ["To assert control over his health and fate by refusing any human intervention.", "To maintain a semblance of autonomy in the face of his failing body.", "To protect himself from the perceived betrayal and contamination associated with human contact."],
        ap.beliefs = ["Trust is a liability; he cannot afford to rely on anyone, not even those closest to him.", "Human touch is synonymous with betrayal and deception, especially from Livia.", "His mind must remain untainted by the influence of others in order to preserve his will."],
        ap.goals = ["Short-term: To avoid taking any medicine or food that he associates with human contact.", "Medium-term: To find a way to regain his health without depending on others.", "Ultimate: To confront his mortality on his own terms, seeking dignity in his decline."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_from_garden_event_14_1'})
    ON CREATE SET
        oi.description = 'The figs from the garden are presented by Montanus as the singular, peculiar element of Augustus\'s self-treatment. They are not merely food; they are the focal point of his irrational dietary restriction, representing his complete rejection of prepared food and his fixation on purity and untainted sustenance. Montanus emphasizes Augustus\'s insistence that these figs be \'untouched by human hand,\' highlighting the Emperor\'s deepening paranoia and detachment from the realities of courtly life and even basic human interaction. The figs, therefore, become a symbol of Augustus\'s declining health and increasingly erratic mental state, a tangible manifestation of his isolation and self-imposed exile from the imperial world.',
        oi.status_before = 'The figs are ripe on the trees in the villa garden, readily available as a natural food source. They are simply fruit, part of the natural surroundings of the villa, and intended for consumption, though not yet imbued with any particular symbolic significance beyond sustenance.',
        oi.status_after = 'The figs are elevated to a potent symbol of Augustus\'s deteriorating condition and his increasingly bizarre behavior in Livia\'s understanding. They are no longer just fruit but become a key piece of evidence in Montanus\'s ominous report, underscoring the severity of Augustus\'s illness and his growing detachment from reality. The figs now represent his isolation, his paranoia, and his physical and mental decline in Livia\'s strategic assessment of the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs_from_garden'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Montanus stands just outside the villa, his body language conveying a professional gravity. He leans in slightly towards Livia, lowering his voice to ensure discretion, yet his words carry the weight of his medical concern. He gestures with his hands as he explains Augustus\'s alarming refusal of prepared food and his singular, almost desperate, reliance on garden figs.',
        ap.emotional_state = 'Montanus is deeply troubled, his professional composure strained by the Emperor\'s erratic behavior. He is genuinely anxious about Augustus\'s \'very bad attack,\' a concern evident in his hushed tone and worried demeanor.  There\'s a hint of bewilderment and perhaps a touch of professional frustration at Augustus\'s unconventional self-treatment, yet he tempers this with a professional acknowledgment of past instances where such methods seemed to work.',
        ap.emotional_tags = ["montanus is deeply troubled, his professional composure strained by the emperor's erratic behavior. he is genuinely anxious about augustus's 'very bad attack,' a concern evident in his hushed tone", "worried demeanor.  there's a hint of bewilderment", "perhaps a touch of professional frustration at augustus's unconventional self-treatment, yet he tempers this with a professional acknowledgment of past instances where such methods seemed to work.", "montanus is deeply troubled", "his professional composure strained by the emperor's erratic behavior. he is genuinely anxious about augustus's 'very bad attack", "' a concern evident in his hushed tone and worried demeanor.  there's a hint of bewilderment and perhaps a touch of professional frustration at augustus's unconventional self-treatment", "yet he tempers this with a professional acknowledgment of past instances where such methods seemed to work."],
        ap.active_plans = ["To accurately and discreetly inform Livia of the severity of Augustus's illness.", "To convey the specifics of Augustus's unusual dietary fixation on figs, emphasizing the emperor's rejection of all prepared food.", "To implicitly seek guidance or further instructions from Livia, the power behind the throne, regarding the management of this delicate situation, while maintaining a respectful professional distance."],
        ap.beliefs = ["Conventional medical practices and prepared food are generally safe and necessary for recovery.", "Hygiene in food preparation is crucial, and lapses in kitchen staff cleanliness are a legitimate concern, though perhaps not the root cause of Augustus's issue.", "Augustus's self-prescribed fig-only diet is likely irrational and potentially detrimental to his health, despite past instances of self-cure."],
        ap.goals = ["Short-term: To ensure Livia fully grasps the seriousness of Augustus's condition and the unusual nature of his treatment.", "Medium-term: To maintain Augustus's physical stability and provide the best medical care possible within the constraints of the emperor's peculiar demands.", "Ultimate: To successfully navigate this imperial health crisis, preserving both Augustus's life and his own professional standing within the treacherous court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands composed and regal outside the villa, her posture radiating an air of controlled attentiveness as she listens to Montanus. Her gaze is fixed upon the physician, sharp and assessing, absorbing every nuance of his report. Though outwardly still, her internal gears are visibly turning, calculating the implications of Montanus’s ominous words for her carefully laid plans.',
        ap.emotional_state = 'Livia presents a veneer of concerned Empress, her expression carefully neutral yet hinting at a practiced sorrow. Beneath this facade, her mind races with cold calculation.  While she must feign concern for Augustus\'s well-being, her primary emotion is strategic assessment.  She is less interested in the medical details themselves and more focused on the political ramifications of Augustus\'s deteriorating health and isolation in Nola.  There\'s an undercurrent of impatience, perhaps even dismissal, of Montanus\'s professional anxieties, viewing them as secondary to the larger game of power.',
        ap.emotional_tags = ["livia presents a veneer of concerned empress, her expression carefully neutral yet hinting at a practiced sorrow. beneath this facade, her mind races with cold calculation.  while she must feign concern for augustus's well-being, her primary emotion is strategic assessment.  she is less interested in the medical details themselves", "more focused on the political ramifications of augustus's deteriorating health", "isolation in nola.  there's an undercurrent of impatience, perhaps even dismissal, of montanus's professional anxieties, viewing them as secondary to the larger game of power.", "livia presents a veneer of concerned empress", "her expression carefully neutral yet hinting at a practiced sorrow. beneath this facade", "her mind races with cold calculation.  while she must feign concern for augustus's well-being", "her primary emotion is strategic assessment.  she is less interested in the medical details themselves and more focused on the political ramifications of augustus's deteriorating health and isolation in nola.  there's an undercurrent of impatience", "perhaps even dismissal", "of montanus's professional anxieties", "viewing them as secondary to the larger game of power."],
        ap.active_plans = ["To extract precise information from Montanus regarding the true severity and nature of Augustus's illness, cutting through any medical jargon to grasp the core implications.", "To evaluate the immediate political fallout of Augustus being 'too ill to go to Rome,' recognizing the window of opportunity this isolation presents.", "To subtly probe Montanus for any signs of Augustus's mental state or pronouncements, seeking clues about the Emperor's intentions and any potential shifts in his favor that might affect the succession."],
        ap.beliefs = ["Power is the ultimate currency, and all events, including health crises, are viewed through the lens of political advantage.", "Medical professionals are useful informants and tools, but ultimately subservient to imperial will and strategic needs.", "Augustus\u2019s health, while significant, is now primarily a matter of timing and control in the unfolding succession drama; his personal well-being is secondary to the larger dynastic game."],
        ap.goals = ["Short-term: To fully understand the immediate threat or opportunity presented by Augustus's illness and his confinement to Nola.", "Medium-term: To ensure that Augustus's failing health, whether he recovers or not, serves to solidify Tiberius's path to the throne and her own continued dominance.", "Ultimate: To secure absolute and lasting power for herself and her lineage, maneuvering events to maintain control over the Roman Empire, regardless of personal cost or moral compromise."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_from_garden_event_15_1'})
    ON CREATE SET
        oi.description = 'The figs from the garden are central to Livia\'s criticisms of Augustus\'s health. She uses them as a symbol of his obstinacy, framing his insistence on consuming them as ridiculous and detrimental to his wellbeing. The figs serve to highlight his irrational behavior, reinforcing Livia\'s narrative of being the responsible caretaker overshadowed by Augustus\'s foolishness.',
        oi.status_before = 'The figs are fresh and ripe, harvested from the garden, symbolizing Augustus\'s misguided attempts at self-cure and his desire to cling to a semblance of control over his diet.',
        oi.status_after = 'The figs remain uneaten and untouched, their presence a lingering reminder of Augustus\'s stubbornness. They symbolize the tension between his desire for autonomy and Livia\'s manipulative control.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs_from_garden'})
    MATCH (e:Event {uuid: 'event_15_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_15_1'})
    ON CREATE SET
        oi.description = 'The bed serves as the focal point of Augustus\'s vulnerability, dominating the space where the exchange occurs. It represents both his physical decline and the intimate yet strained relationship with Livia, as she sits beside him, using the moment to exert her influence and control over his decisions.',
        oi.status_before = 'The bed is a grand and imposing structure, a symbol of Augustus\'s former power and current frailty, reflecting the gravity of his illness and the shifting dynamics of power in the imperial court.',
        oi.status_after = 'The bed remains a constant in the scene, now further associated with Augustus\'s precarious health and the emotional manipulation exerted by Livia, reinforcing the power dynamics at play.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_15_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Livia sits poised beside Augustus\'s bed, a picture of faux concern. She leans slightly forward, her body angled toward him in a way that betrays her attempt to dominate the conversation. Her hands gesture lightly as she scolds him about his diet and stubbornness, her posture exuding a blend of authority and mockery.',
        ap.emotional_state = 'Surface emotions reveal Livia\'s feigned concern masked by thinly veiled resentment. Her tone drips with sarcasm, contrasting with a simmering anger beneath. Internally, she wrestles with the tension of her ambitions and frustrations at Augustus\'s defiance, revealing a complex interplay of love, manipulation, and control.',
        ap.emotional_tags = ["surface emotions reveal livia's feigned concern masked by thinly veiled resentment. her tone drips with sarcasm, contrasting with a simmering anger beneath. internally, she wrestles with the tension of her ambitions", "frustrations at augustus's defiance, revealing a complex interplay of love, manipulation,", "control.", "surface emotions reveal livia's feigned concern masked by thinly veiled resentment. her tone drips with sarcasm", "contrasting with a simmering anger beneath. internally", "she wrestles with the tension of her ambitions and frustrations at augustus's defiance", "revealing a complex interplay of love", "manipulation", "and control."],
        ap.active_plans = ["To manipulate Augustus into feeling guilt over his health choices, shifting blame towards his past favoritism between Tiberius and Germanicus.", "To emphasize Tiberius's role as the obedient son who will 'do everything that has to be done,' thus positioning herself as a supportive mother and staunch ally.", "To assert her own loyalty and sacrifices for Augustus and Rome, reinforcing her importance within the family dynamic."],
        ap.beliefs = ["Power is best wielded through manipulation and emotional control.", "Her sacrifices for Augustus and Rome validate her authority and importance.", "Women should not be underestimated in their influence over political matters."],
        ap.goals = ["Short-term: To convince Augustus to eat and regain his health to prevent further embarrassment.", "Medium-term: To solidify Tiberius's position as the favored heir by emphasizing Augustus's past mistakes.", "Ultimate: To ensure her family's dominance and influence over the imperial succession, further embedding her power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Augustus lies in bed, frail and vulnerable, overshadowed by the imposing presence of Livia. His body is weakened, barely responsive as he listens to her words, a faint furrow of concern creasing his forehead as he processes her insinuations and admonishments.',
        ap.emotional_state = 'Outwardly, Augustus appears weary and resigned, his body language reflecting a deep-seated frustration with both his condition and Livia\'s incessant reminders of his failings. Internally, he battles feelings of guilt and regret regarding his relationship with Tiberius, feeling the weight of his past decisions pressing heavily upon him.',
        ap.emotional_tags = ["outwardly, augustus appears weary", "resigned, his body language reflecting a deep-seated frustration with both his condition", "livia's incessant reminders of his failings. internally, he battles feelings of guilt", "regret regarding his relationship with tiberius, feeling the weight of his past decisions pressing heavily upon him.", "outwardly", "augustus appears weary and resigned", "his body language reflecting a deep-seated frustration with both his condition and livia's incessant reminders of his failings. internally", "he battles feelings of guilt and regret regarding his relationship with tiberius", "feeling the weight of his past decisions pressing heavily upon him."],
        ap.active_plans = ["To gather the strength to face the delegation from Rome, despite his declining health.", "To navigate the complex dynamics with Livia and Tiberius, balancing his legacy while dealing with familial tensions.", "To assert some control over his health and choices, despite Livia's manipulative influence."],
        ap.beliefs = ["Family loyalty is paramount, and one must navigate its complexities with care.", "His decisions as emperor have lasting repercussions on his heirs and Rome.", "His health choices, although misguided, stem from a desire for autonomy in his declining years."],
        ap.goals = ["Short-term: To recover enough strength to engage with the Roman delegation.", "Medium-term: To reconcile his relationships with Tiberius and Livia, if possible.", "Ultimate: To leave behind a legacy that secures Rome's future and honors his lineage."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_figs_from_garden_event_16_4'})
    ON CREATE SET
        oi.description = 'The figs, once a symbol of Augustus\'s desperate attempts at self-cure, take on a darker significance as Livia warns Tiberius not to touch them. This seemingly innocuous warning hints at the possibility of poison and illustrates Livia\'s chilling control over life and death, further emphasizing the treacherous atmosphere within the imperial court.',
        oi.status_before = 'The figs are fresh, harvested from the garden, and associated with Augustus\'s irrational dietary choices, representing his futile quest for healing.',
        oi.status_after = 'The figs remain untouched, their potential as a tool for treachery lingering in the air, symbolic of Livia\'s manipulative grip even in the wake of death.'
    WITH oi
    MATCH (o:Object {uuid: 'object_figs_from_garden'})
    MATCH (e:Event {uuid: 'event_16_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the secluded villa chamber with a stern and grave expression, his posture reflecting the weight of the unfolding events. He moves directly towards Livia, his body language conveying a sense of urgency and focused intent. He seeks immediate clarity, bypassing any formalities and cutting straight to the heart of the matter by addressing Livia directly.',
        ap.emotional_state = 'Beneath a veneer of Roman stoicism, Tiberius is a cauldron of barely suppressed anxiety and anticipation. He is outwardly composed, his grim face a mask of controlled seriousness, yet internally he is wrestling with a storm of emotions. He is impatient for news, driven by ambition for the throne, tinged with a complex mixture of duty and perhaps a flicker of familial obligation towards Augustus, all overshadowed by his deep-seated resentment and Livia\'s manipulative influence.',
        ap.emotional_tags = ["beneath a veneer of roman stoicism, tiberius is a cauldron of barely suppressed anxiety", "anticipation. he is outwardly composed, his grim face a mask of controlled seriousness, yet internally he is wrestling with a storm of emotions. he is impatient for news, driven by ambition for the throne, tinged with a complex mixture of duty", "perhaps a flicker of familial obligation towards augustus, all overshadowed by his deep-seated resentment", "livia's manipulative influence.", "beneath a veneer of roman stoicism", "tiberius is a cauldron of barely suppressed anxiety and anticipation. he is outwardly composed", "his grim face a mask of controlled seriousness", "yet internally he is wrestling with a storm of emotions. he is impatient for news", "driven by ambition for the throne", "tinged with a complex mixture of duty and perhaps a flicker of familial obligation towards augustus", "all overshadowed by his deep-seated resentment and livia's manipulative influence."],
        ap.active_plans = ["To obtain definitive confirmation regarding Augustus's condition, ending the uncertainty.", "To assess Livia's disposition and gauge her control over the immediate situation.", "To mentally prepare himself for the imminent shift in power and the responsibilities it entails."],
        ap.beliefs = ["He believes Livia possesses the most accurate and current information about Augustus's health.", "He believes Augustus's death is inevitable and will trigger significant political upheaval.", "He believes in his own right to succeed Augustus and assume the mantle of emperor."],
        ap.goals = ["Short-term: To immediately ascertain whether Augustus is alive or dead.", "Medium-term: To understand the immediate ramifications of Augustus's death on the political landscape and his succession.", "Ultimate: To secure the imperial throne without challenge and establish a stable and powerful reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Livia is positioned within the villa chamber, maintaining an air of imperial composure despite the gravity of the moment. She pauses deliberately before responding to Tiberius\'s inquiry, a subtle manipulation to heighten the dramatic impact of her pronouncement. Even as she delivers momentous news, her final instruction about the figs underscores her unwavering attention to detail and control.',
        ap.emotional_state = 'Livia\'s outward demeanor is one of practiced control, a carefully constructed mask of imperial grief. Her pause before speaking is theatrical, designed to amplify the shock of her revelation. Internally, she is a complex tapestry of emotions: triumph at her long-laid plans coming to fruition, relief that Augustus\'s unpredictable reign is over, and a cold, calculating focus on securing the transition of power for Tiberius and, by extension, herself. Any genuine grief is deeply buried beneath layers of ambition and strategic calculation.',
        ap.emotional_tags = ["livia's outward demeanor is one of practiced control, a carefully constructed mask of imperial grief. her pause before speaking is theatrical, designed to amplify the shock of her revelation. internally, she is a complex tapestry of emotions: triumph at her long-laid plans coming to fruition, relief that augustus's unpredictable reign is over,", "a cold, calculating focus on securing the transition of power for tiberius and, by extension, herself. any genuine grief is deeply buried beneath layers of ambition", "strategic calculation.", "livia's outward demeanor is one of practiced control", "a carefully constructed mask of imperial grief. her pause before speaking is theatrical", "designed to amplify the shock of her revelation. internally", "she is a complex tapestry of emotions: triumph at her long-laid plans coming to fruition", "relief that augustus's unpredictable reign is over", "and a cold", "calculating focus on securing the transition of power for tiberius and", "by extension", "herself. any genuine grief is deeply buried beneath layers of ambition and strategic calculation."],
        ap.active_plans = ["To deliver the news of Augustus's death with maximum impact, asserting her control over the narrative.", "To immediately direct Tiberius's actions, ensuring he remains in place to solidify his claim.", "To reinforce her dominance even in this moment of imperial transition, demonstrated by her controlling remark about the figs."],
        ap.beliefs = ["She believes she is the true architect of the empire's stability and must remain in control to guide its future.", "She believes Tiberius is the most suitable heir and needs her guidance to secure his position effectively.", "She believes that maintaining control extends to even the smallest details, reinforcing her overall authority and influence."],
        ap.goals = ["Short-term: To effectively communicate Augustus's death to Tiberius and issue immediate directives.", "Medium-term: To orchestrate a seamless transfer of power to Tiberius, ensuring minimal disruption and maximum stability for her continued influence.", "Ultimate: To establish a lasting and powerful dynasty under her and Tiberius's control, securing her legacy as the true power behind the throne of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised, her body language radiating authority and calculated composure. Her eyes lock onto Tiberius\'s, a moment rich with unspoken implications. She delivers the news of Augustus’s death with a steady voice, her posture erect, betraying no hint of the emotional turmoil that often accompanies such profound loss.',
        ap.emotional_state = 'Livia maintains a façade of calm, her expression devoid of overt grief. Beneath this composed exterior, however, lies an undercurrent of triumph; she senses the impending shift in power dynamics. The news serves to reinforce her control, even as it marks the end of an era. Her internal motivations are far more complex, intertwining her ambition with the loss.',
        ap.emotional_tags = ["livia maintains a fa\u00e7ade of calm", "her expression devoid of overt grief. beneath this composed exterior", "however", "lies an undercurrent of triumph; she senses the impending shift in power dynamics. the news serves to reinforce her control", "even as it marks the end of an era. her internal motivations are far more complex", "intertwining her ambition with the loss.", "livia maintains a fa\u00e7ade of calm, her expression devoid of overt grief. beneath this composed exterior, however, lies an undercurrent of triumph", "she senses the impending shift in power dynamics. the news serves to reinforce her control, even as it marks the end of an era. her internal motivations are far more complex, intertwining her ambition with the loss."],
        ap.active_plans = ["To swiftly convey the news of Augustus's death to Tiberius, ensuring he understands the gravity of the situation and the inevitability of change.", "To assert her influence by instructing Tiberius to remain with the body, keeping him tethered to the past while she moves to communicate with the senators and consuls.", "To manipulate the narrative surrounding Augustus's death, ensuring her role as the power broker in this transition period is firmly established."],
        ap.beliefs = ["Livia believes that power is best maintained through calculated manipulation and control, seeing emotional displays as weaknesses.", "She holds a conviction that her own ambitions justify her actions, viewing Augustus's death as an opportunity rather than a tragedy.", "Livia believes in the necessity of legacy and will do whatever it takes to secure her family's grip on power, often at the expense of familial bonds."],
        ap.goals = ["Short-term: To communicate Augustus's death with a sense of authority, setting the stage for her influence in the ensuing power vacuum.", "Medium-term: To solidify Tiberius's position as emperor while reinforcing her role as his advisor and power behind the throne.", "Ultimate: To ensure the longevity of her family's rule over Rome, eliminating any threats to their power and legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters with a somber demeanor, his face grim as he receives the weighty news. He approaches Livia, standing close to Augustus\'s body, reflecting the gravity of the moment. His posture is rigid, reinforcing his role as the stoic heir, yet the faint tremor in his voice reveals the internal turmoil stirred by the announcement.',
        ap.emotional_state = 'While Tiberius outwardly exhibits a controlled emotional facade in response to Livia\'s announcement, internally he grapples with a mix of grim resignation and ambition. His declaration, \'The earth will shake,\' reveals a deep awareness of the profound ramifications of this moment, hinting at his unspoken fear and ambition as he contemplates the power shift now inevitable.',
        ap.emotional_tags = ["while tiberius outwardly exhibits a controlled emotional facade in response to livia's announcement, internally he grapples with a mix of grim resignation", "ambition. his declaration, 'the earth will shake,' reveals a deep awareness of the profound ramifications of this moment, hinting at his unspoken fear", "ambition as he contemplates the power shift now inevitable.", "while tiberius outwardly exhibits a controlled emotional facade in response to livia's announcement", "internally he grapples with a mix of grim resignation and ambition. his declaration", "'the earth will shake", "' reveals a deep awareness of the profound ramifications of this moment", "hinting at his unspoken fear and ambition as he contemplates the power shift now inevitable."],
        ap.active_plans = ["To absorb the news of his father's death and mentally prepare for the ensuing chaos that will follow.", "To maintain a composed exterior while calculating his next steps in securing his claim to the throne.", "To remain at the villa, as instructed by Livia, to project solidarity with Augustus's memory while also positioning himself for the political maneuvering to come."],
        ap.beliefs = ["Tiberius believes that power must be approached with stoicism and control, viewing emotional displays as signs of weakness.", "He holds a conviction that his lineage entitles him to the throne, and he must now step into his role as the rightful heir.", "Tiberius is aware of the ruthless nature of the political landscape, believing that one must be prepared to act decisively to maintain power."],
        ap.goals = ["Short-term: To acknowledge Augustus's death with a solemn demeanor, projecting strength to those around him.", "Medium-term: To solidify his position as the new emperor while navigating the treacherous waters of court politics.", "Ultimate: To assert control over the empire and establish his rule, ensuring that he is not merely a figurehead but a ruler with authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly in the secluded villa, absorbing the momentous news of Augustus\'s death. His body remains still, betraying little outward reaction beyond a slow, deliberate nod. His gaze drifts towards the lifeless form of Augustus, a silent acknowledgement of the seismic shift that has just occurred. He is a figure carved from granite, composed yet undeniably grim as the weight of empire settles upon him.',
        ap.emotional_state = 'Beneath a veneer of stoic acceptance, Tiberius grapples with a maelstrom of complex emotions. Relief at Augustus\'s passing may mingle with a profound sense of dread at the immensity of the responsibility now thrust upon him. His muttered prophecy, \'The earth will shake,\' hints at an internal apprehension regarding the political upheaval to come.  Years of suppressed resentment and ambition now surface, overshadowed by the chilling reality of absolute power and its inherent dangers.',
        ap.emotional_tags = ["beneath a veneer of stoic acceptance, tiberius grapples with a maelstrom of complex emotions. relief at augustus's passing may mingle with a profound sense of dread at the immensity of the responsibility now thrust upon him. his muttered prophecy, 'the earth will shake,' hints at an internal apprehension regarding the political upheaval to come.  years of suppressed resentment", "ambition now surface, overshadowed by the chilling reality of absolute power", "its inherent dangers.", "beneath a veneer of stoic acceptance", "tiberius grapples with a maelstrom of complex emotions. relief at augustus's passing may mingle with a profound sense of dread at the immensity of the responsibility now thrust upon him. his muttered prophecy", "'the earth will shake", "' hints at an internal apprehension regarding the political upheaval to come.  years of suppressed resentment and ambition now surface", "overshadowed by the chilling reality of absolute power and its inherent dangers."],
        ap.active_plans = ["Acknowledge and internalize the reality of Augustus's death and its immediate repercussions.", "Prepare mentally and emotionally for the immense burden of becoming Emperor of Rome.", "Defer to Livia's immediate directives, recognizing her strategic acumen and control in this critical moment."],
        ap.beliefs = ["The death of Augustus marks a cataclysmic turning point in Roman history.", "He is fated to inherit the empire, a destiny he accepts with grim duty rather than eager anticipation.", "Maintaining order and stability in Rome is paramount amidst the inevitable chaos of succession."],
        ap.goals = ["Short-term: To fully comprehend the immediate ramifications of Augustus's death and maintain outward composure.", "Medium-term: To consolidate his power and ensure a seamless transition to Emperor, quelling potential unrest and challenges.", "Ultimate: To rule Rome with an iron fist, establishing a reign of stability and order, however severe, in the wake of Augustus's long shadow."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands imperiously before Tiberius, her posture radiating cold authority even in the face of death. She delivers the news of Augustus\'s demise with a theatrical pause and stark pronouncement. Immediately after, she assumes command, rising to her feet and issuing direct instructions to Tiberius, dictating his actions while she prepares to manipulate the Senate and secure her grip on power. Her exit is swift and purposeful, leaving no room for doubt about her dominance.',
        ap.emotional_state = 'Livia projects an image of controlled resolve, her voice devoid of overt grief, instead laced with chilling pragmatism.  Beneath this facade, a calculated triumph likely simmers, the culmination of decades of relentless ambition.  However, any personal emotion is ruthlessly suppressed, secondary to her driving need for control.  Her focus is entirely on the immediate power vacuum and manipulating the political landscape to ensure a seamless transition for Tiberius – and, crucially, for herself.  The chillingly detached instruction regarding the figs underscores her absolute command and lack of sentimentality.',
        ap.emotional_tags = ["livia projects an image of controlled resolve, her voice devoid of overt grief, instead laced with chilling pragmatism.  beneath this facade, a calculated triumph likely simmers, the culmination of decades of relentless ambition.  however, any personal emotion is ruthlessly suppressed, secondary to her driving need for control.  her focus is entirely on the immediate power vacuum", "manipulating the political landscape to ensure a seamless transition for tiberius \u2013 and, crucially, for herself.  the chillingly detached instruction regarding the figs underscores her absolute command", "lack of sentimentality.", "livia projects an image of controlled resolve", "her voice devoid of overt grief", "instead laced with chilling pragmatism.  beneath this facade", "a calculated triumph likely simmers", "the culmination of decades of relentless ambition.  however", "any personal emotion is ruthlessly suppressed", "secondary to her driving need for control.  her focus is entirely on the immediate power vacuum and manipulating the political landscape to ensure a seamless transition for tiberius \u2013 and", "crucially", "for herself.  the chillingly detached instruction regarding the figs underscores her absolute command and lack of sentimentality."],
        ap.active_plans = ["Inform Tiberius of Augustus's death in a manner designed to maximize impact and assert her control.", "Immediately seize the narrative and initiate damage control by addressing the senators and consuls, shaping the official story of Augustus's passing.", "Delegate the symbolic duty of guarding Augustus's corpse to Tiberius, while she focuses on the realpolitik of securing power."],
        ap.beliefs = ["She is the architect of the Julio-Claudian dynasty's power and must remain its unwavering hand.", "Tiberius is her instrument, and she must guide him ruthlessly to ensure his successful ascension and her continued influence.", "Emotional displays are weaknesses to be exploited; power is secured through decisive action and manipulation, not sentimentality."],
        ap.goals = ["Short-term: To orchestrate the immediate aftermath of Augustus's death, ensuring Tiberius's swift and unchallenged succession.", "Medium-term: To maintain her position as the power behind the throne, guiding Tiberius and manipulating Roman politics to her advantage.", "Ultimate: To solidify the Julio-Claudian dynasty's rule over Rome, securing her place in history as the ultimate power broker and architect of the empire's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised, a figure of cold resolve, her posture straightened as she prepares to depart. With a subtle, calculated glance at Tiberius, she conveys the gravity of the situation. Her movements are measured, exuding a confidence that belies the turmoil surrounding them.',
        ap.emotional_state = 'On the surface, Livia appears composed and detached, her voice steady as she delivers the shocking news of Augustus\'s death. However, beneath this veneer lies a simmering intensity, a blend of triumph and anxiety over the impending political upheaval. The weight of her ambitions presses heavily upon her, alongside an awareness of the dangerous stakes involved.',
        ap.emotional_tags = ["on the surface, livia appears composed", "detached, her voice steady as she delivers the shocking news of augustus's death. however, beneath this veneer lies a simmering intensity, a blend of triumph", "anxiety over the impending political upheaval. the weight of her ambitions presses heavily upon her, alongside an awareness of the dangerous stakes involved.", "on the surface", "livia appears composed and detached", "her voice steady as she delivers the shocking news of augustus's death. however", "beneath this veneer lies a simmering intensity", "a blend of triumph and anxiety over the impending political upheaval. the weight of her ambitions presses heavily upon her", "alongside an awareness of the dangerous stakes involved."],
        ap.active_plans = ["To assert her dominance over the Senate and consolidate power in the wake of Augustus's death.", "To manipulate Tiberius and the other senators into aligning with her vision for the future of Rome.", "To maintain absolute control over the narrative surrounding Augustus's death and the succession."],
        ap.beliefs = ["Power must be seized and maintained through cunning and manipulation, even over family.", "The ends justify the means when it comes to securing her family's legacy.", "Trust is a weakness; one must always be wary of others' intentions."],
        ap.goals = ["Short-term: To ensure Augustus's death is framed in a way that benefits her and Tiberius.", "Medium-term: To solidify Tiberius's position as emperor while keeping her own influence intact.", "Ultimate: To craft a legacy that secures her family's power within the Roman Empire for generations."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bulletins_event_17_1'})
    ON CREATE SET
        oi.description = 'The bulletins are invoked by Livia as a promise of future communication, a strategic tool to manage the crowd\'s expectations and anxieties. By assuring them of regular updates posted on the door, Livia creates a semblance of transparency and control, suggesting a structured flow of information. However, the bulletins themselves are not yet created; their true purpose is to serve as a placeholder, a means to pacify the onlookers and buy Livia time. The very *idea* of these bulletins becomes a mechanism for Livia to exert authority and dictate the terms of information dissemination, even before a single word is written.',
        oi.status_before = 'The bulletins do not exist in any tangible form. They are merely a concept, an unformed idea in Livia\'s mind, yet to be realized or put into practice.',
        oi.status_after = 'The bulletins remain non-existent physically, but their status has shifted from a mere idea to a promised entity. They are now anticipated by the crowd, creating an expectation and a framework for future information flow dictated entirely by Livia. Their promised existence now serves as a tool for Livia\'s control, whether or not she intends to actually create truthful or detailed bulletins.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bulletins'})
    MATCH (e:Event {uuid: 'event_17_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands before the gathered crowd, a figure of imperial composure amidst the swirling anxieties. She positions herself as the authoritative voice, the conduit of information regarding the ailing Emperor. Her posture is erect, her gaze steady as she addresses the onlookers, every gesture calibrated to project an image of unwavering control and regal calm. She speaks with measured cadence, each word carefully chosen to soothe and direct the restless energy of the crowd.',
        ap.emotional_state = 'Outwardly, Livia presents a mask of serene authority, her voice smooth and reassuring, tinged with just the right measure of solemn concern expected of a devoted wife. However, beneath this polished facade, a cold calculation reigns.  She is acutely aware of the power vacuum Augustus\'s impending death will create, and her primary emotion is a tightly controlled ambition, masked by practiced grief. There\'s a subtle tension in her demeanor, a suppressed urgency to manage the narrative and ensure no stray anxieties disrupt her meticulously crafted plans for succession.',
        ap.emotional_tags = ["outwardly, livia presents a mask of serene authority, her voice smooth", "reassuring, tinged with just the right measure of solemn concern expected of a devoted wife. however, beneath this polished facade, a cold calculation reigns.  she is acutely aware of the power vacuum augustus's impending death will create,", "her primary emotion is a tightly controlled ambition, masked by practiced grief. there's a subtle tension in her demeanor, a suppressed urgency to manage the narrative", "ensure no stray anxieties disrupt her meticulously crafted plans for succession.", "outwardly", "livia presents a mask of serene authority", "her voice smooth and reassuring", "tinged with just the right measure of solemn concern expected of a devoted wife. however", "beneath this polished facade", "a cold calculation reigns.  she is acutely aware of the power vacuum augustus's impending death will create", "and her primary emotion is a tightly controlled ambition", "masked by practiced grief. there's a subtle tension in her demeanor", "a suppressed urgency to manage the narrative and ensure no stray anxieties disrupt her meticulously crafted plans for succession."],
        ap.active_plans = ["Disseminate a fabricated narrative of Augustus's condition to the public, portraying it as a peaceful sleep rather than a critical decline.", "Dismiss the gathering crowd, preventing them from lingering and potentially witnessing the true, dire state of the Emperor or causing unrest.", "Establish herself as the sole source of official information, controlling the flow of news and shaping public perception of events to her advantage."],
        ap.beliefs = ["Maintaining absolute control over information is crucial for wielding power and manipulating events.", "Public perception is malleable and can be shaped through carefully constructed narratives.", "Order and stability must be preserved at all costs, even if it requires deception and strategic falsehoods."],
        ap.goals = ["Short-term: To quell immediate public anxiety and disperse the crowd outside the villa.", "Medium-term: To manage the public narrative surrounding Augustus's death, ensuring a smooth and unchallenged transition of power to Tiberius.", "Ultimate: To solidify Tiberius's reign and maintain her own position as the power behind the throne, safeguarding the Julio-Claudian dynasty and her enduring influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands confidently in the garden, her posture rigid and commanding. She approaches Colonel Sejanus with a calculated demeanor, her gaze piercing as she swiftly confirms his identity and lineage, asserting her authority over him. Each movement is deliberate, her words curt and purposeful, reflecting her sharp mind and relentless ambition.',
        ap.emotional_state = 'Livia exudes an air of cold determination, her face a mask of steely resolve. Outwardly calm, she conceals a storm of ambition and ruthlessness beneath the surface. Her interaction is tinged with the tension of impending danger, as she deftly navigates the conversation with the intent of manipulating Sejanus to serve her machinations.',
        ap.emotional_tags = ["livia exudes an air of cold determination, her face a mask of steely resolve. outwardly calm, she conceals a storm of ambition", "ruthlessness beneath the surface. her interaction is tinged with the tension of impending danger, as she deftly navigates the conversation with the intent of manipulating sejanus to serve her machinations.", "livia exudes an air of cold determination", "her face a mask of steely resolve. outwardly calm", "she conceals a storm of ambition and ruthlessness beneath the surface. her interaction is tinged with the tension of impending danger", "as she deftly navigates the conversation with the intent of manipulating sejanus to serve her machinations."],
        ap.active_plans = ["To establish control over Colonel Sejanus and use him to execute her dark ambitions.", "To ensure the assassination of Fabius Maximus is carried out without complications.", "To reinforce her influence over the Guard through Sejanus, solidifying her position in the court."],
        ap.beliefs = ["Power must be maintained through calculated manipulation and control.", "Those who are weak must be eliminated to secure one's own ambitions.", "Loyalty is a tool to be wielded, not a bond to be cherished."],
        ap.goals = ["Short-term: To execute the assassination plan without drawing suspicion.", "Medium-term: To increase her power within the imperial court by using Sejanus as a pawn.", "Ultimate: To secure her family's legacy and maintain dominance over the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Colonel Sejanus stands at attention in the shadows of the garden, his posture reflecting a mix of deference and readiness. He responds promptly to Livia’s inquiries, his movements precise as he acknowledges her authority. However, his quick exit indicates his awareness of the urgency and gravity of their meeting.',
        ap.emotional_state = 'Sejanus appears composed, yet an undercurrent of tension runs through him. He respects Livia\'s authority but is also acutely aware of the dark task ahead. His surface calm masks a whirlpool of ambition and duty, revealing the conflict between loyalty to Livia and the moral implications of the assignment.',
        ap.emotional_tags = ["sejanus appears composed, yet an undercurrent of tension runs through him. he respects livia's authority but is also acutely aware of the dark task ahead. his surface calm masks a whirlpool of ambition", "duty, revealing the conflict between loyalty to livia", "the moral implications of the assignment.", "sejanus appears composed", "yet an undercurrent of tension runs through him. he respects livia's authority but is also acutely aware of the dark task ahead. his surface calm masks a whirlpool of ambition and duty", "revealing the conflict between loyalty to livia and the moral implications of the assignment.", "sejanus appears composed, yet an undercurrent of tension runs through him. he respects livia's authority", "is also acutely aware of the dark task ahead. his surface calm masks a whirlpool of ambition and duty, revealing the conflict between loyalty to livia and the moral implications of the assignment."],
        ap.active_plans = ["To comply with Livia\u2019s demands without question, demonstrating his loyalty.", "To ensure the mission is carried out efficiently, reflecting his father's reputation.", "To navigate the treacherous waters of court politics while maintaining his standing."],
        ap.beliefs = ["Loyalty to the imperial family is paramount, even at a personal cost.", "Ambition must be tempered with duty; actions must align with one's reputation.", "The success of a mission reflects not only on oneself but on one's family legacy."],
        ap.goals = ["Short-term: To complete the assignment as instructed by Livia.", "Medium-term: To solidify his position within the Guard through successful execution.", "Ultimate: To secure his father's legacy and rise to greater influence in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands imperiously in the garden shadows, her presence radiating cold authority as she confronts Colonel Sejanus. She engages in a brief, clipped exchange, her words precise and loaded with unspoken intent.  Her posture is likely still and composed, her gaze fixed and penetrating as she assesses Sejanus and confirms his understanding.',
        ap.emotional_state = 'Livia outwardly projects an image of icy control and calculated resolve. There\'s no hint of hesitation or emotion in her clipped dialogue; she is all business. Internally, she is driven by ruthless ambition and a chilling determination to eliminate threats. Beneath the surface lies a core of steely resolve, perfectly aligned with her external demeanor, focused solely on achieving her objectives with ruthless efficiency and without remorse.',
        ap.emotional_tags = ["livia outwardly projects an image of icy control", "calculated resolve. there's no hint of hesitation or emotion in her clipped dialogue; she is all business. internally, she is driven by ruthless ambition", "a chilling determination to eliminate threats. beneath the surface lies a core of steely resolve, perfectly aligned with her external demeanor, focused solely on achieving her objectives with ruthless efficiency", "without remorse.", "livia outwardly projects an image of icy control and calculated resolve. there's no hint of hesitation or emotion in her clipped dialogue; she is all business. internally", "she is driven by ruthless ambition and a chilling determination to eliminate threats. beneath the surface lies a core of steely resolve", "perfectly aligned with her external demeanor", "focused solely on achieving her objectives with ruthless efficiency and without remorse.", "livia outwardly projects an image of icy control and calculated resolve. there's no hint of hesitation or emotion in her clipped dialogue", "she is all business. internally, she is driven by ruthless ambition and a chilling determination to eliminate threats. beneath the surface lies a core of steely resolve, perfectly aligned with her external demeanor, focused solely on achieving her objectives with ruthless efficiency and without remorse."],
        ap.active_plans = ["Confirm Sejanus's identity and suitability for the task.", "Issue a veiled yet unmistakable order for Fabius Maximus's assassination.", "Ensure the assassination is carried out swiftly, silently, and without leaving traces back to her."],
        ap.beliefs = ["Ruthless measures are necessary to secure and maintain power.", "Fabius Maximus's knowledge and loyalty to Augustus pose a significant threat to her plans for Tiberius's succession.", "Sejanus is a reliable and expendable instrument for carrying out her clandestine orders."],
        ap.goals = ["Short-term: Eliminate Fabius Maximus to silence a potential threat and consolidate power.", "Medium-term: Secure Tiberius's unchallenged ascension to the throne by removing obstacles.", "Ultimate: Establish and maintain absolute control over Rome through manipulation and strategic eliminations, ensuring her family's dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Colonel Sejanus stands before Livia in the garden at night, responding respectfully and efficiently to her questions. He maintains a posture of military deference and attentiveness, acknowledging her rank and authority. Upon receiving her confirmation, he immediately turns to issue grim orders to the waiting assassin, demonstrating prompt obedience.',
        ap.emotional_state = 'Sejanus presents a facade of professional detachment and unwavering obedience, his tone is crisp and business-like, devoid of personal emotion. Internally, he is driven by a sense of duty and ambition, eager to prove his worth to Livia and advance his position. There might be a flicker of awareness of the brutality of the task, but it is suppressed beneath his desire to serve and impress, prioritizing duty over moral qualms in this instance.',
        ap.emotional_tags = ["sejanus presents a facade of professional detachment", "unwavering obedience, his tone is crisp", "business-like, devoid of personal emotion. internally, he is driven by a sense of duty", "ambition, eager to prove his worth to livia", "advance his position. there might be a flicker of awareness of the brutality of the task, but it is suppressed beneath his desire to serve", "impress, prioritizing duty over moral qualms in this instance.", "sejanus presents a facade of professional detachment and unwavering obedience", "his tone is crisp and business-like", "devoid of personal emotion. internally", "he is driven by a sense of duty and ambition", "eager to prove his worth to livia and advance his position. there might be a flicker of awareness of the brutality of the task", "but it is suppressed beneath his desire to serve and impress", "prioritizing duty over moral qualms in this instance.", "sejanus presents a facade of professional detachment and unwavering obedience, his tone is crisp and business-like, devoid of personal emotion. internally, he is driven by a sense of duty and ambition, eager to prove his worth to livia and advance his position. there might be a flicker of awareness of the brutality of the task,", "it is suppressed beneath his desire to serve and impress, prioritizing duty over moral qualms in this instance."],
        ap.active_plans = ["Confirm his identity and lineage to establish credibility and assure Livia of his background.", "Acknowledge and fully comprehend Livia's implicit command to assassinate Fabius Maximus.", "Relay clear and concise instructions to the assassin, ensuring the body's disposal is thorough and discreet by ordering it to be weighted and sunk at sea."],
        ap.beliefs = ["Loyalty to the imperial family, particularly Livia, is paramount for his advancement.", "Livia's commands are to be obeyed without question or hesitation, regardless of their nature.", "Discretion and efficiency in carrying out sensitive orders are crucial for maintaining trust and demonstrating competence."],
        ap.goals = ["Short-term: Execute Livia's assassination order flawlessly and discreetly.", "Medium-term: Gain Livia's favor and trust by demonstrating unwavering loyalty and competence in handling delicate matters.", "Ultimate: Rise through the ranks of the Praetorian Guard and gain significant influence within the imperial court by becoming an indispensable asset to Livia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Fabius Maximus is approached by an assassin in the garden at night, under the pretense of delivering a message. He stands calmly, facing the approaching figure, his posture relaxed and unsuspecting. He engages in a brief, fateful exchange, inquiring about the nature of the message, completely unaware of the mortal danger he is stepping into.',
        ap.emotional_state = 'Fabius displays a calm and unsuspecting demeanor, his tone is inquisitive and trusting, reflecting his lack of awareness of the imminent threat. Internally, he is likely in a state of neutral expectation, perhaps slightly curious about the message\'s content, assuming it is related to his duties or Augustus\'s condition. There is a stark contrast between his calm exterior and the deadly trap closing in around him, highlighting his tragic vulnerability and misplaced trust in the seeming order of the imperial court.',
        ap.emotional_tags = ["fabius displays a calm", "unsuspecting demeanor, his tone is inquisitive", "trusting, reflecting his lack of awareness of the imminent threat. internally, he is likely in a state of neutral expectation, perhaps slightly curious about the message's content, assuming it is related to his duties or augustus's condition. there is a stark contrast between his calm exterior", "the deadly trap closing in around him, highlighting his tragic vulnerability", "misplaced trust in the seeming order of the imperial court.", "fabius displays a calm and unsuspecting demeanor", "his tone is inquisitive and trusting", "reflecting his lack of awareness of the imminent threat. internally", "he is likely in a state of neutral expectation", "perhaps slightly curious about the message's content", "assuming it is related to his duties or augustus's condition. there is a stark contrast between his calm exterior and the deadly trap closing in around him", "highlighting his tragic vulnerability and misplaced trust in the seeming order of the imperial court."],
        ap.active_plans = ["Identify the approaching figure and determine if they are indeed a messenger.", "Inquire about the nature and content of the 'message' being delivered.", "Receive and process the message, assuming it pertains to imperial matters and responding accordingly, entirely oblivious to the true danger."],
        ap.beliefs = ["Communication within the imperial villa operates through established and trustworthy channels.", "Individuals approaching him in the garden at night are likely delivering official messages or information.", "He is in a secure environment, and no immediate physical threat is present in this setting within the imperial grounds."],
        ap.goals = ["Short-term: Receive and understand the message to fulfill his advisory duties.", "Medium-term: Continue to serve Augustus loyally and provide sound counsel based on new information.", "Ultimate: Maintain stability and order within the empire through his reasoned advice and loyal service, unaware that his life is about to be brutally cut short."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_19_1'})
    ON CREATE SET
        oi.description = 'The scroll serves as the physical embodiment of Augustus\'s last will and testament, held by the Quaestor as he prepares to read its contents aloud. Its significance is monumental, as it contains the directives that will determine the future of the empire and the political landscape of Rome. The unrolling of the scroll signifies the unveiling of secrets and the commencement of a pivotal moment in Roman history.',
        oi.status_before = 'Prior to the event, the scroll is securely stored within the Senate chambers, safeguarded as a critical document of imperial authority and legacy.',
        oi.status_after = 'After the reading, the scroll lies unrolled, the words spoken and the will\'s contents now public, forever marking its role in the transition of power and the fate of the Senators present.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_19_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_19_2'})
    ON CREATE SET
        oi.description = 'The scroll, heavy with imperial seals and aged parchment, is the central focus of the Senate Chamber. Held aloft by the Quaestor, it unfurls slowly, revealing the meticulously penned words of Augustus Caesar\'s last will. As the Quaestor reads, the scroll becomes the conduit of destiny, its contents dictating the future of Rome and the fates of those assembled. It is not merely an object but a vessel of power, its pronouncements reshaping the political landscape with each syllable uttered, holding the weight of an empire\'s transition within its rolled form.',
        oi.status_before = 'The scroll is sealed and authoritative, held securely by the Quaestor, its contents unknown to the assembled Senators, representing latent power and unrealized decrees. It is a symbol of anticipation and the impending revelation of Augustus\'s final wishes, charged with unspoken potential and the weight of imperial authority.',
        oi.status_after = 'Now unrolled and read aloud, the scroll\'s contents are public knowledge, its pronouncements having been unleashed upon the Senate. It transitions from a vessel of potential to a catalyst of action, its words setting in motion a chain reaction of political maneuvering and personal ambition. While its physical form remains unchanged, its narrative function is complete, having irrevocably altered the course of the story.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_19_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly beside the Quaestor, his posture straight and authoritative, emanating a palpable sense of command. As he speaks, his voice resonates with a controlled gravitas, demanding the attention of the assembled Senators, each of whom hangs on his words with bated breath.',
        ap.emotional_state = 'Outwardly, Tiberius presents a composed exterior, his face a mask of stoicism. Internally, however, he grapples with a mix of ambition and anxiety, aware of the significant implications of his command. He feels the weight of expectations and the mounting pressure of the Senate\'s scrutiny.',
        ap.emotional_tags = ["outwardly, tiberius presents a composed exterior, his face a mask of stoicism. internally, however, he grapples with a mix of ambition", "anxiety, aware of the significant implications of his command. he feels the weight of expectations", "the mounting pressure of the senate's scrutiny.", "outwardly", "tiberius presents a composed exterior", "his face a mask of stoicism. internally", "however", "he grapples with a mix of ambition and anxiety", "aware of the significant implications of his command. he feels the weight of expectations and the mounting pressure of the senate's scrutiny."],
        ap.active_plans = ["To assert his authority by commanding the reading of Augustus's will, establishing himself as the rightful heir.", "To gauge the reactions of the Senators as the will is read, assessing potential allies and foes within the chamber.", "To prepare for the inevitable political maneuvering that will follow the reading, positioning himself favorably amidst the looming power struggle."],
        ap.beliefs = ["He believes in the legitimacy of his claim to the throne as Augustus's heir, viewing it as both a right and a responsibility.", "Tiberius holds a conviction that strength and composure are essential in leadership, masking any vulnerability to maintain control.", "He believes that the Senate's support is crucial for his reign and will work to gain their trust through both transparency and calculated maneuvering."],
        ap.goals = ["Short-term: To successfully navigate the immediate proceedings of the will\u2019s reading without showing any signs of weakness.", "Medium-term: To consolidate power and support among the Senators following the reading, ensuring loyalty to his claim.", "Ultimate: To establish a stable reign marked by authority and respect, reinforcing his place as the Emperor of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_1'})
    ON CREATE SET
        ap.current_status = 'The Quaestor stands at the front of the chamber, holding the scroll with careful precision. He unrolls it with deliberate movements, his demeanor professional and focused, ready to relay the last wishes of Augustus Caesar to the assembled Senators.',
        ap.emotional_state = 'The Quaestor exhibits a calm and formal exterior, embodying the solemnity of the moment. Internally, he may feel a sense of apprehension and the burden of responsibility, as the contents of the scroll hold the potential to shift the balance of power in Rome.',
        ap.emotional_tags = ["the quaestor exhibits a calm", "formal exterior, embodying the solemnity of the moment. internally, he may feel a sense of apprehension", "the burden of responsibility, as the contents of the scroll hold the potential to shift the balance of power in rome.", "the quaestor exhibits a calm and formal exterior", "embodying the solemnity of the moment. internally", "he may feel a sense of apprehension and the burden of responsibility", "as the contents of the scroll hold the potential to shift the balance of power in rome."],
        ap.active_plans = ["To read the will with clarity and authority, ensuring that all Senators understand the weight of Augustus's final directives.", "To maintain an atmosphere of decorum and respect throughout the reading, despite the underlying tensions among the Senators.", "To act as a neutral party, avoiding any political entanglements while fulfilling his duties as a state functionary."],
        ap.beliefs = ["He believes in the sanctity of the legal process and the importance of following Augustus's wishes accurately.", "The Quaestor holds that his role is to serve the state faithfully, maintaining impartiality amidst political strife.", "He values the tradition of the Senate and sees the reading of the will as a pivotal moment that should be treated with the utmost respect."],
        ap.goals = ["Short-term: To execute the reading of the will flawlessly, without interruption or error.", "Medium-term: To ensure that the will is received in a manner that upholds the dignity of Augustus's memory.", "Ultimate: To contribute to a smooth transition of power that honors the legacy of Augustus and maintains stability within the Senate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Standing tall and erect, the Quaestor holds the heavy scroll, his voice ringing out with formal clarity across the vast Senate Chamber. Sunlight catches the polished surface of the parchment as he steadily unrolls it, his gaze fixed on the text, ensuring every word is delivered with precision and gravity. He is the instrument through which the Emperor\'s final decree is made known.',
        ap.emotional_state = 'Maintaining a facade of professional detachment, the Quaestor betrays little emotion, yet a subtle air of solemnity hangs about him. He understands the monumental weight of the words he speaks, the destiny-altering pronouncements contained within the scroll. Beneath the official mask, a flicker of awareness of the political currents in the room might exist, but duty demands impassivity.',
        ap.emotional_tags = ["maintaining a facade of professional detachment", "the quaestor betrays little emotion", "yet a subtle air of solemnity hangs about him. he understands the monumental weight of the words he speaks", "the destiny-altering pronouncements contained within the scroll. beneath the official mask", "a flicker of awareness of the political currents in the room might exist", "but duty demands impassivity.", "maintaining a facade of professional detachment, the quaestor betrays little emotion, yet a subtle air of solemnity hangs about him. he understands the monumental weight of the words he speaks, the destiny-altering pronouncements contained within the scroll. beneath the official mask, a flicker of awareness of the political currents in the room might exist,", "duty demands impassivity."],
        ap.active_plans = ["To read Augustus's will verbatim, without personal interpretation or hesitation.", "To project an image of unwavering official authority and impartiality.", "To ensure the Senate and Tiberius clearly understand every clause of the testament."],
        ap.beliefs = ["In the sanctity and legal authority of the Emperor's will.", "In the importance of order and protocol in Roman governance.", "In the necessity of fulfilling his official duty with utmost fidelity."],
        ap.goals = ["Short-term: To accurately and completely read the entire will to the assembled Senate.", "Medium-term: To facilitate the formal transition of power as dictated by Augustus's decree.", "Ultimate: To uphold the integrity of Roman law and contribute to the stability of the state."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_senators_event_19_2'})
    ON CREATE SET
        ap.current_status = 'The Senators, a sea of stern faces in togas, are rigidly positioned throughout the Grand Chamber, their bodies angled towards the Quaestor, ears straining to catch every syllable. Some lean forward, hands clasped upon their knees, others stand with arms crossed, their postures reflecting a mixture of anticipation and guarded calculation. They are a collective body poised on the brink of a new era, each member a silent observer and potential player in the unfolding drama.',
        ap.emotional_state = 'A palpable tension permeates the Senatorial ranks. Outwardly, they maintain the Roman ideal of stoic composure, yet beneath the surface, a storm of emotions churns. Ambition clashes with anxiety, hope with apprehension. Some Senators likely harbor desires for influence under the new regime, while others may fear displacement or a shift in the balance of power. The reading of the will is not just a legal formality, but a judgment on their collective future.',
        ap.emotional_tags = ["a palpable tension permeates the senatorial ranks. outwardly", "they maintain the roman ideal of stoic composure", "yet beneath the surface", "a storm of emotions churns. ambition clashes with anxiety", "hope with apprehension. some senators likely harbor desires for influence under the new regime", "while others may fear displacement or a shift in the balance of power. the reading of the will is not just a legal formality", "but a judgment on their collective future.", "a palpable tension permeates the senatorial ranks. outwardly, they maintain the roman ideal of stoic composure, yet beneath the surface, a storm of emotions churns. ambition clashes with anxiety, hope with apprehension. some senators likely harbor desires for influence under the new regime,", "others may fear displacement or a shift in the balance of power. the reading of the will is not just a legal formality, but a judgment on their collective future.", "a palpable tension permeates the senatorial ranks. outwardly, they maintain the roman ideal of stoic composure, yet beneath the surface, a storm of emotions churns. ambition clashes with anxiety, hope with apprehension. some senators likely harbor desires for influence under the new regime, while others may fear displacement or a shift in the balance of power. the reading of the will is not just a legal formality,", "a judgment on their collective future."],
        ap.active_plans = ["To meticulously analyze the implications of each clause of the will for their personal and factional interests.", "To gauge Tiberius's reaction to the will and assess his initial demeanor as the declared heir.", "To observe the reactions of their fellow senators, seeking to understand the emerging alliances and potential oppositions within the chamber."],
        ap.beliefs = ["In the enduring power of the Senate, even in the face of imperial decree.", "In the importance of seizing opportunities for personal advancement and influence.", "In the necessity of adapting to the shifting tides of Roman politics to maintain their positions."],
        ap.goals = ["Short-term: To fully comprehend the immediate ramifications of Augustus's will.", "Medium-term: To strategically position themselves to gain favor and leverage under Tiberius's rule.", "Ultimate: To preserve or enhance their power and status within the Roman state, navigating the uncertainties of the succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands like a statue carved from granite beside the Quaestor, his posture ramrod straight, his gaze fixed somewhere beyond the present moment. He emanates an aura of rigid control, his body language betraying nothing of the tumultuous emotions that may be swirling beneath. Clad in somber robes, he presents himself as the embodiment of Roman duty and disciplined authority, ready to assume the mantle of power.',
        ap.emotional_state = 'Beneath the stoic mask, Tiberius is a cauldron of complex feelings. Relief at finally being named heir must contend with the somber weight of Augustus\'s death and the daunting task ahead. Years of suppressed resentment and ambition may now be surfacing, mingled with a calculated awareness of the Senate\'s scrutiny. He is outwardly composed, a marble façade, but internally, a profound shift in his destiny is taking hold, a moment both anticipated and fraught with uncertainty.',
        ap.emotional_tags = ["beneath the stoic mask, tiberius is a cauldron of complex feelings. relief at finally being named heir must contend with the somber weight of augustus's death", "the daunting task ahead. years of suppressed resentment", "ambition may now be surfacing, mingled with a calculated awareness of the senate's scrutiny. he is outwardly composed, a marble fa\u00e7ade, but internally, a profound shift in his destiny is taking hold, a moment both anticipated", "fraught with uncertainty.", "beneath the stoic mask", "tiberius is a cauldron of complex feelings. relief at finally being named heir must contend with the somber weight of augustus's death and the daunting task ahead. years of suppressed resentment and ambition may now be surfacing", "mingled with a calculated awareness of the senate's scrutiny. he is outwardly composed", "a marble fa\u00e7ade", "but internally", "a profound shift in his destiny is taking hold", "a moment both anticipated and fraught with uncertainty.", "beneath the stoic mask, tiberius is a cauldron of complex feelings. relief at finally being named heir must contend with the somber weight of augustus's death and the daunting task ahead. years of suppressed resentment and ambition may now be surfacing, mingled with a calculated awareness of the senate's scrutiny. he is outwardly composed, a marble fa\u00e7ade,", "internally, a profound shift in his destiny is taking hold, a moment both anticipated and fraught with uncertainty."],
        ap.active_plans = ["To project an image of unwavering strength and resolve, demonstrating his fitness to rule.", "To carefully monitor the Senate's reaction to the will, assessing potential support or opposition.", "To establish his authority and command of the situation from this very first public moment as heir."],
        ap.beliefs = ["In his inherent right to succeed Augustus, forged through years of service and familial connection.", "In the paramount importance of order, discipline, and unwavering control in ruling Rome.", "In the necessity of projecting an image of invulnerability and decisive leadership to command respect and quell dissent."],
        ap.goals = ["Short-term: To secure his uncontested ascension to the imperial throne based on Augustus's will.", "Medium-term: To consolidate his power swiftly and establish a firm grip on the reins of the empire.", "Ultimate: To rule Rome with an iron fist, ensuring stability and demonstrating himself a worthy, if perhaps harsher, successor to the deified Augustus."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_augustus_will_event_20_3'})
    ON CREATE SET
        oi.description = 'Augustus\'s will lies openly on a nearby table, serving as the catalyst for Claudius\'s transformation from passive observer to active accuser. Its presence intensifies the tension in the room, symbolizing the stakes of power and the corruption hidden behind familial loyalty. Claudius\'s recognition of the will sparks his outburst, shattering Livia’s composed facade.',
        oi.status_before = 'The will is hidden in the shadows of the court’s manipulations, its existence barely acknowledged, yet it holds immense political significance as the key to Augustus’s legacy.',
        oi.status_after = 'After Claudius\'s accusation, the will becomes a focal point of conflict, exposed to the light of scrutiny, its implications now threatening Livia\'s control and igniting a confrontation that could reshape the court\'s power dynamics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_augustus_will'})
    MATCH (e:Event {uuid: 'event_20_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands regally in the antechamber, her posture erect and commanding, displaying an air of cold authority. She interrupts Claudius sharply, her gestures succinct and dismissive, embodying impatience as she dissects his feeble attempt to express condolences. Her piercing gaze studies him, assessing his worthlessness in her eyes, as her words slice through the air with venomous precision.',
        ap.emotional_state = 'Livia\'s surface demeanor is composed, but beneath lies a simmering disdain for Claudius, whom she perceives as a fool. Her impatience reveals a deeper frustration with the political maneuvering at play, driving her relentless ambition. This tension between her external poise and internal contempt manifests as a chilling authority, asserting her dominance over the situation.',
        ap.emotional_tags = ["livia's surface demeanor is composed, but beneath lies a simmering disdain for claudius, whom she perceives as a fool. her impatience reveals a deeper frustration with the political maneuvering at play, driving her relentless ambition. this tension between her external poise", "internal contempt manifests as a chilling authority, asserting her dominance over the situation.", "livia's surface demeanor is composed", "but beneath lies a simmering disdain for claudius", "whom she perceives as a fool. her impatience reveals a deeper frustration with the political maneuvering at play", "driving her relentless ambition. this tension between her external poise and internal contempt manifests as a chilling authority", "asserting her dominance over the situation.", "livia's surface demeanor is composed,", "beneath lies a simmering disdain for claudius, whom she perceives as a fool. her impatience reveals a deeper frustration with the political maneuvering at play, driving her relentless ambition. this tension between her external poise and internal contempt manifests as a chilling authority, asserting her dominance over the situation."],
        ap.active_plans = ["Maintain control over the narrative regarding Augustus's will and subsequent events.", "Diminish Claudius's confidence and authority, consolidating her power in the court.", "Strategically manipulate the Senate to solidify Tiberius's position as the successor."],
        ap.beliefs = ["Women, like herself, are unfairly sidelined in matters of power, yet she is determined to manipulate the situation to her advantage.", "Fools, like Claudius, can still play a role in her plans if they can be used as pawns.", "Power is best wielded through fear and manipulation, which justify her ruthless nature."],
        ap.goals = ["Short-term: Assert her dominance in the antechamber and intimidate Claudius.", "Medium-term: Ensure Tiberius's ascension is uncontested by manipulating the Senate's decisions.", "Ultimate: Secure her legacy and position as Empress, ultimately establishing herself as a divine figure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Claudius hovers nervously near Livia, fidgeting with his hands and stammering as he attempts to voice his thoughts. His awkward posture, hunched and uncertain, indicates his inner turmoil as he struggles to maintain composure in the presence of his formidable grandmother.',
        ap.emotional_state = 'On the surface, Claudius is anxious and intimidated, his stammer signaling his fear of Livia\'s judgment. However, beneath this exterior lies a burgeoning awareness of the political treachery surrounding him. His emotional conflict becomes apparent when he finally confronts Livia’s manipulation, revealing a flicker of courage beneath his perceived foolishness.',
        ap.emotional_tags = ["on the surface, claudius is anxious", "intimidated, his stammer signaling his fear of livia's judgment. however, beneath this exterior lies a burgeoning awareness of the political treachery surrounding him. his emotional conflict becomes apparent when he finally confronts livia\u2019s manipulation, revealing a flicker of courage beneath his perceived foolishness.", "on the surface", "claudius is anxious and intimidated", "his stammer signaling his fear of livia's judgment. however", "beneath this exterior lies a burgeoning awareness of the political treachery surrounding him. his emotional conflict becomes apparent when he finally confronts livia\u2019s manipulation", "revealing a flicker of courage beneath his perceived foolishness."],
        ap.active_plans = ["Offer condolences to Livia in a misguided attempt to establish rapport.", "Gather information on the Senate's deliberations regarding Augustus's will.", "Confront Livia with the knowledge of her deceitful actions about the will."],
        ap.beliefs = ["Despite being perceived as a fool, he believes there is value in his insights and knowledge.", "Family loyalty should compel him to challenge Livia's manipulative nature.", "There is a deeper purpose to his stammering and awkwardness, ultimately leading to a moment of clarity."],
        ap.goals = ["Short-term: Successfully communicate his condolences to Livia despite his anxiety.", "Medium-term: Uncover the truth about Augustus's will and Livia's manipulation.", "Ultimate: Emerge from the shadows of ridicule to assert his value and influence within the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Empress Livia stands imperiously in the antechamber, just outside the Senate\'s roaring debate. She is physically composed and regal, maintaining a posture of absolute control as she engages Claudius. Her sharp, direct questions and cutting remarks are delivered with an air of practiced authority, reflecting her dominance in any interaction.',
        ap.emotional_state = 'Livia outwardly projects an image of calm composure and supreme confidence, masking her underlying anxieties about the unfolding political situation within the Senate. Beneath the surface, she is impatient and contemptuous of Claudius, viewing him as an imbecile. However, her pragmatic nature allows her to momentarily see a potential, albeit foolish, utility in him, revealing a calculating mind always seeking advantage, even in the most unlikely sources.',
        ap.emotional_tags = ["livia outwardly projects an image of calm composure", "supreme confidence, masking her underlying anxieties about the unfolding political situation within the senate. beneath the surface, she is impatient", "contemptuous of claudius, viewing him as an imbecile. however, her pragmatic nature allows her to momentarily see a potential, albeit foolish, utility in him, revealing a calculating mind always seeking advantage, even in the most unlikely sources.", "livia outwardly projects an image of calm composure and supreme confidence", "masking her underlying anxieties about the unfolding political situation within the senate. beneath the surface", "she is impatient and contemptuous of claudius", "viewing him as an imbecile. however", "her pragmatic nature allows her to momentarily see a potential", "albeit foolish", "utility in him", "revealing a calculating mind always seeking advantage", "even in the most unlikely sources."],
        ap.active_plans = ["To extract information from Claudius regarding the Senate's progress and Tiberius's stance on accepting power.", "To subtly manipulate Claudius into potentially influencing Tiberius, using even his perceived foolishness as a tool.", "To maintain her image of control and authority, ensuring she remains at the center of information flow and decision-making during this critical period of transition."],
        ap.beliefs = ["She believes in her own intellectual superiority and the inherent foolishness of those around her, particularly Claudius.", "She believes in the absolute necessity of control and manipulation to achieve her political objectives.", "She believes in pragmatism above all else, willing to exploit any situation or individual, regardless of their perceived worth, if it serves her purpose."],
        ap.goals = ["Short-term: To gain immediate insight into the Senate's deliberations and Tiberius's actions.", "Medium-term: To secure a smooth transition of power to Tiberius and solidify her own position of influence within the new regime.", "Ultimate: To maintain absolute power and control over the Roman Empire, ensuring the continued dominance of her family and her own enduring legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Claudius hovers nervously in the antechamber, fidgeting with his hands and stammering as he attempts to engage with Livia. He is physically positioned as subservient and intimidated, his body language reflecting his discomfort and anxiety in her imposing presence. He struggles to articulate his condolences and share his interpretation of the omen.',
        ap.emotional_state = 'Claudius is outwardly anxious and intimidated by Livia, his stammer amplified by her sharp, condescending demeanor. Internally, he desires to be seen as more than just a fool, hoping to impress Livia with his supposed insight into Etruscan prophecy. There is a palpable tension between his nervousness and his yearning for recognition, revealing a fragile ego beneath his awkward exterior, desperate for a moment of validation from his disdainful grandmother.',
        ap.emotional_tags = ["claudius is outwardly anxious", "intimidated by livia, his stammer amplified by her sharp, condescending demeanor. internally, he desires to be seen as more than just a fool, hoping to impress livia with his supposed insight into etruscan prophecy. there is a palpable tension between his nervousness", "his yearning for recognition, revealing a fragile ego beneath his awkward exterior, desperate for a moment of validation from his disdainful grandmother.", "claudius is outwardly anxious and intimidated by livia", "his stammer amplified by her sharp", "condescending demeanor. internally", "he desires to be seen as more than just a fool", "hoping to impress livia with his supposed insight into etruscan prophecy. there is a palpable tension between his nervousness and his yearning for recognition", "revealing a fragile ego beneath his awkward exterior", "desperate for a moment of validation from his disdainful grandmother."],
        ap.active_plans = ["To convey condolences to Livia, fulfilling a familial duty despite his own apprehension.", "To demonstrate his intellectual capacity, hoping to alter Livia's low perception of him by sharing his Etruscan interpretation of the omen.", "To seek a modicum of acceptance or positive acknowledgement from Livia, even though he anticipates her usual scorn and dismissal."],
        ap.beliefs = ["He believes he is generally perceived as foolish and is constantly underestimated by his family, especially Livia.", "He believes intellectual pursuits and scholarly knowledge can offer him a path to respect and recognition, a way to transcend his perceived inadequacies.", "He believes in the power of omens and prophecies, interpreting them as meaningful signs, even if his interpretations are unconventional or easily mocked."],
        ap.goals = ["Short-term: To successfully deliver his condolences without further ridicule or humiliation from Livia.", "Medium-term: To subtly shift Livia's perception of him, hoping she might acknowledge a sliver of intelligence beneath his stammer.", "Ultimate: To overcome the label of 'fool' and be recognized for his true intellect and potential within his family and the Roman court, achieving a sense of self-worth and belonging."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Claudius hovers nervously near Livia, his hands fidgeting as he stammers through a half-hearted condolences offer. His posture reflects a mix of hesitation and anxiety, embodying the awkwardness of a boy caught in the web of a powerful woman’s disdain.',
        ap.emotional_state = 'Outwardly, Claudius shows nervousness, his stammer and fidgeting hands revealing his unease in Livia\'s presence. Internally, he experiences a tumult of realization and horror as he uncovers the truth about the will, transforming his fear into a surge of outrage and indignation.',
        ap.emotional_tags = ["outwardly, claudius shows nervousness, his stammer", "fidgeting hands revealing his unease in livia's presence. internally, he experiences a tumult of realization", "horror as he uncovers the truth about the will, transforming his fear into a surge of outrage", "indignation.", "outwardly", "claudius shows nervousness", "his stammer and fidgeting hands revealing his unease in livia's presence. internally", "he experiences a tumult of realization and horror as he uncovers the truth about the will", "transforming his fear into a surge of outrage and indignation."],
        ap.active_plans = ["Attempt to offer condolences to Livia, seeking to connect with her in a moment of grief.", "Gather information about the ongoing discussions in the Senate regarding Augustus's will.", "Confront Livia about the implications of what he has discovered regarding the will."],
        ap.beliefs = ["He believes that his family, despite their flaws, should prioritize loyalty and honor.", "He holds a conviction that truth must prevail, especially regarding Augustus's legacy.", "He thinks that his stammer does not define his intelligence and worth in the imperial court."],
        ap.goals = ["Short-term: Establish a connection with Livia through an offer of condolences.", "Medium-term: Understand the current situation in the Senate regarding Augustus's succession.", "Ultimate: Reveal the truth about Augustus's will and challenge Livia\u2019s deceitful hold over the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands regal and composed in the antechamber, her presence commanding and intimidating. She maintains an air of superiority, cutting off Claudius\'s attempts to speak with sharp retorts, her posture unwavering and confident as she manipulates the conversation.',
        ap.emotional_state = 'Livia outwardly expresses impatience and disdain, her sharp tone and condescending remarks masking her inner calculation and ambition. Beneath her composed facade, anxiety stirs as she oversees the potential revelation of her schemes. She feels the tension mounting as Claudius unwittingly inches closer to the truth.',
        ap.emotional_tags = ["livia outwardly expresses impatience", "disdain, her sharp tone", "condescending remarks masking her inner calculation", "ambition. beneath her composed facade, anxiety stirs as she oversees the potential revelation of her schemes. she feels the tension mounting as claudius unwittingly inches closer to the truth.", "livia outwardly expresses impatience and disdain", "her sharp tone and condescending remarks masking her inner calculation and ambition. beneath her composed facade", "anxiety stirs as she oversees the potential revelation of her schemes. she feels the tension mounting as claudius unwittingly inches closer to the truth."],
        ap.active_plans = ["Maintain control of the conversation with Claudius to dismiss his attempts at empathy.", "Gauge the developments in the Senate regarding Augustus's will to assess her standing post-Augustus.", "Prepare to counter any accusations or threats posed by Claudius, should he uncover her deception."],
        ap.beliefs = ["She believes in the absolute necessity of controlling power, even if it means using deceit.", "She holds a conviction that women must wield influence covertly in a male-dominated society.", "She perceives Claudius as a fool, yet acknowledges the need to manage him carefully to avoid any disruptions."],
        ap.goals = ["Short-term: Dismiss Claudius's concerns and maintain the facade of authority and control.", "Medium-term: Ensure that Augustus's will remains unchallenged and her plans secure.", "Ultimate: Solidify her influence and that of Tiberius in the Senate\u2019s decision-making post-Augustus."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Event {uuid: 'event_1_1'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_meno'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_meno_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_meno_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_postumus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_fabius_maximus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_fabius_maximus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_postumus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_postumus_agrippa_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_germanicus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_germanicus_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_camilla_pulchra'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_camilla_pulchra'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_camilla_pulchra'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_camilla_pulchra_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_montanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_fabius_maximus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_fabius_maximus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_6'}),
          (b:Event {uuid: 'event_10_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_10_7'}),
          (b:Event {uuid: 'event_10_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_7'}),
          (b:Event {uuid: 'event_10_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_junius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_montanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_11'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_12_1'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_montanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_montanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_montanus_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_2'}),
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_16'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_18'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_fabius_maximus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_fabius_maximus_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_19'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_senators'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_senators_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_senators_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_20'}),
          (ep:Episode {uuid: 'episode_poison_is_queen'})
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
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia_drusilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_drusilla_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);

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
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_2'})
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
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_2'})
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
                

                MATCH (e1:Event {uuid: 'event_18_1'}),
                      (e2:Event {uuid: 'event_18_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_19_1'}),
                      (e2:Event {uuid: 'event_19_2'})
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
