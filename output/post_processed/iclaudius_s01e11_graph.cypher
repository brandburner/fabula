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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e11_graph.json',
        creation_timestamp: '2025-04-11T16:17:50.352520',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_cestias'})
    ON CREATE SET
        a.name = 'Cestias',
        a.title = 'None',
        a.description = 'Cestias is a Senator who embodies the traditional Roman resistance to autocratic rule and the overreach of the Praetorian Guard. He voices the Senate\'s constitutional objections to Claudius\'s ascension and represents the old guard\'s struggle to maintain power in the face of military force. Formal, direct, and unwavering, he reflects the Senate\'s deep-seated resentment and underestimation of Claudius\'s capabilities.',
        a.traits = ["Authoritative", "Principled", "Challenging", "Formal", "Resistant"],
        a.sphere_of_influence = 'Roman Law and Senate Procedures'
    ;
MERGE (a:Agent {uuid: 'agent_appius_junius_silanus'})
    ON CREATE SET
        a.name = 'Appius Junius Silanus',
        a.title = 'Senator',
        a.description = 'Appius Junius Silanus is a Senator characterized by deep resentment and a sense of betrayal towards Claudius. Embodying Republican ideals in conflict with autocracy, he is defiant and desperate in his attempt to reclaim honor, even if it means resorting to violence as he faces the dire consequences of his actions.',
        a.traits = ["Defiant", "Passionate", "Desperate", "Honor-bound"],
        a.sphere_of_influence = 'Senatorial Influence'
    ;
MERGE (a:Agent {uuid: 'agent_caligula'})
    ON CREATE SET
        a.name = 'Caligula',
        a.title = 'Emperor',
        a.description = 'Caligula is the recently deceased Emperor of Rome whose tyrannical and mad reign serves as a catalyst for the scene\'s events. Though absent, his negative legacy of oppression and tyranny heavily influences the political dynamics and gives impetus to the senators’ desire to restore the Republic.',
        a.traits = ["Deceased", "Tyrannical (implied)", "Mad (implied)", "Despised (by some)"],
        a.sphere_of_influence = 'Roman Empire (formerly)'
    ;
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius',
        a.title = 'Emperor of Rome',
        a.description = 'Tiberius Claudius is the stammering, underestimated Emperor navigating the treacherous waters of Roman politics. Confronted by both betrayal and the heavy burdens of leadership, his vulnerability is starkly exposed during his confrontation with Silanus\'s attempted assassination, reflecting the emotional and political turmoil of his reign.',
        a.traits = ["Insecure", "Intellectual", "Compassionate", "Vulnerable"],
        a.sphere_of_influence = 'Imperial Authority'
    ;
MERGE (a:Agent {uuid: 'agent_gratus'})
    ON CREATE SET
        a.name = 'Gratus',
        a.title = 'Praetorian Guard',
        a.description = 'Gratus is a burly Praetorian Guard loyal to Emperor Claudius. His demeanor is straightforward and brash, mixed with a touch of humor and frustration regarding the political orders. Gratus exemplifies the military’s direct approach and the tension between military discipline and the subtleties of political power.',
        a.traits = ["Loyal", "Brash", "Humorous", "Pragmatic"],
        a.sphere_of_influence = 'Military Power'
    ;
MERGE (a:Agent {uuid: 'agent_rufrius'})
    ON CREATE SET
        a.name = 'Rufrius',
        a.title = 'Guard',
        a.description = 'Rufrius is a Praetorian Guard noted for his swift and brutal enforcement actions on behalf of Claudius\'s rule. Arriving immediately after Silanus\'s attack, he acts decisively to suppress dissent and protect the Emperor, embodying the raw power and intimidation employed by the Praetorian Guard.',
        a.traits = ["Loyal", "Brutal", "Efficient", "Authoritarian"],
        a.sphere_of_influence = 'Law Enforcement'
    ;
MERGE (a:Agent {uuid: 'agent_herod'})
    ON CREATE SET
        a.name = 'Herod Agrippa',
        a.title = 'King',
        a.description = 'Herod Agrippa of Bashan is a shrewd and worldly advisor to Claudius, renowned for his pragmatic counsel and keen observation of courtly dynamics. His insight into the treacherous nature of Roman politics gives him a distinct role as both advisor and cynical observer amid the unfolding drama.',
        a.traits = ["Shrewd", "Worldly", "Pragmatic", "Cynical"],
        a.sphere_of_influence = 'Diplomacy and Kingship'
    ;
MERGE (a:Agent {uuid: 'agent_marcus'})
    ON CREATE SET
        a.name = 'Marcus',
        a.title = 'Senator',
        a.description = 'Marcus is a principled Senator deeply concerned with upholding constitutional law and order. He challenges Claudius by questioning the legality of his appointment by the Praetorian Guard, embodying traditional Roman governance and the Senate\'s contention against military intervention in political succession.',
        a.traits = ["Principled", "Legalistic", "Challenging", "Traditionalist", "Assertive"],
        a.sphere_of_influence = 'Roman Law and Senate Procedures'
    ;
MERGE (a:Agent {uuid: 'agent_asprenas'})
    ON CREATE SET
        a.name = 'Asprenas',
        a.title = 'Senator',
        a.description = 'Asprenas is a blunt and confrontational Senator who questions Claudius\'s competence and draws comparisons with the despised Caligula. His dismissive attitude and vocal skepticism reflect the Senate\'s deep-seated contempt and low expectations for Claudius\'s ability to rule effectively.',
        a.traits = ["Dismissive", "Confrontational", "Disrespectful", "Skeptical", "Vocal"],
        a.sphere_of_influence = 'Senate Opinion and Political Discourse'
    ;
MERGE (a:Agent {uuid: 'agent_vinicius'})
    ON CREATE SET
        a.name = 'Vinicius',
        a.title = 'Senator',
        a.description = 'Vinicius is a reserved but influential Senator present during Claudius\'s address. Although he doesn’t speak in the scene, his inclusion among those barred from the immediate meeting indicates a notable role within the Senate and an undercurrent of opposition to Claudius’s rule.',
        a.traits = ["Reserved", "Influential (Implied)", "Senator", "Present", "Observant"],
        a.sphere_of_influence = 'Senate Politics'
    ;
MERGE (a:Agent {uuid: 'agent_cassius_chaerea'})
    ON CREATE SET
        a.name = 'Cassius Chaerea',
        a.title = 'None',
        a.description = 'Cassius Chaerea is a conspirator in the assassination of Caligula, defiant and unrepentant before Claudius. Claiming his actions were for the sake of the Republic, his bold demeanor and chilling prophecy reflect both personal vendetta and the dangerous instability underlying imperial power.',
        a.traits = ["Defiant", "Unrepentant", "Principled (Self-Proclaimed)", "Bold", "Prophetic"],
        a.sphere_of_influence = 'Conspiracy and Assassination'
    ;
MERGE (a:Agent {uuid: 'agent_gaius_sabinus'})
    ON CREATE SET
        a.name = 'Gaius Sabinus',
        a.title = 'None',
        a.description = 'Gaius Sabinus is a conspirator involved in the assassination plot against Caligula and Claudius. His subsequent suicide upon the conspiracy’s failure underscores the brutal and desperate nature of the opposition against the new imperial regime.',
        a.traits = ["Conspirator", "Deceased", "Desperate", "Fearful (Implied)", "Officer"],
        a.sphere_of_influence = 'Conspiracy and Military Rebellion'
    ;
MERGE (a:Agent {uuid: 'agent_caesonia'})
    ON CREATE SET
        a.name = 'Caesonia',
        a.title = 'Lady',
        a.description = 'Lady Caesonia is the deceased wife of Caligula, remembered as an innocent victim murdered by conspirators. Her tragic fate is invoked by Claudius to highlight the brutality of the assassination plot and to underscore the moral consequences of political violence.',
        a.traits = ["Deceased", "Victim", "Innocent", "Former Empress (Wife of Caligula)", "Murdered"],
        a.sphere_of_influence = 'Victim of Political Violence'
    ;
MERGE (a:Agent {uuid: 'agent_messalina'})
    ON CREATE SET
        a.name = 'Messalina',
        a.title = 'None',
        a.description = 'Messalina, Claudius\'s wife, exhibits a cunning and manipulative nature. Masterfully using her beauty and charm to hide her true ambitions, she is both a devoted spouse and a power-hungry political player, deeply entangled in the chaotic interplay of Roman politics.',
        a.traits = ["Cunning", "Manipulative", "Ambitious", "Deceptive"],
        a.sphere_of_influence = 'Roman Politics'
    ;
MERGE (a:Agent {uuid: 'agent_domitia'})
    ON CREATE SET
        a.name = 'Domitia',
        a.title = 'None',
        a.description = 'Domitia is the mother of Messalina, representing traditional Roman womanhood and the conflict between maternal loyalty and the ruthless demands of political power. Her protective instincts are clouded by naivety and emotional distress amid the power struggles surrounding her family.',
        a.traits = ["Protective", "Naive", "Distressed", "Traditional"],
        a.sphere_of_influence = 'Domestic Affairs'
    ;
MERGE (a:Agent {uuid: 'agent_midwife'})
    ON CREATE SET
        a.name = 'Midwife',
        a.title = 'None',
        a.description = 'The midwife attends to Messalina during childbirth, providing practical care and reassurance. While not politically influential, her role underscores the domestic and personal aspects of royal life in contrast to the state affairs.',
        a.traits = ["Supportive", "Reassuring", "Practical"],
        a.sphere_of_influence = 'Childbirth and Caregiving'
    ;
MERGE (a:Agent {uuid: 'agent_narcissus'})
    ON CREATE SET
        a.name = 'Narcissus',
        a.title = 'Freedman',
        a.description = 'Narcissus is one of Claudius\'s powerful freedmen, noted for his sharp financial acumen and pragmatic nature. Focused on the material aspects of governance, he is deeply involved in Rome\'s economic affairs and is quick to defend financial decisions, even amidst the chaos of political betrayals.',
        a.traits = ["Financially Astute", "Pragmatic", "Self-serving", "Opportunistic"],
        a.sphere_of_influence = 'Imperial Finances'
    ;
MERGE (a:Agent {uuid: 'agent_pallas'})
    ON CREATE SET
        a.name = 'Pallas',
        a.title = 'None',
        a.description = 'Pallas is one of Claudius\'s trusted freedmen and serves as a key administrator in the Roman Empire. His pragmatic and observant approach, combined with a loyal yet cynical perspective, makes him an essential advisor in maintaining order during the unfolding crisis.',
        a.traits = ["Pragmatic", "Loyal", "Observant", "Cynical"],
        a.sphere_of_influence = 'Imperial Administration'
    ;
MERGE (a:Agent {uuid: 'agent_slave_1'})
    ON CREATE SET
        a.name = 'Slave',
        a.title = 'None',
        a.description = 'This unnamed slave of Claudius\'s household acts as a messenger, efficiently and urgently delivering the news of the Emperor\'s child\'s birth. His brief but pivotal appearance shifts the scene’s focus, reinforcing the importance of personal matters within the imperial context.',
        a.traits = ["dutiful", "efficient", "respectful", "urgent"],
        a.sphere_of_influence = 'Imperial Household'
    ;
MERGE (a:Agent {uuid: 'agent_xenophon'})
    ON CREATE SET
        a.name = 'Xenophon',
        a.title = 'Greek Doctor',
        a.description = 'Xenophon is a Greek doctor who offers clinical and detached medical advice to Emperor Claudius. His practical, no-nonsense demeanor, along with his authoritative approach, provides critical insights into the Emperor’s health, contrasting sharply with the surrounding political complexities.',
        a.traits = ["Detached", "Pragmatic", "Authoritative", "Insightful"],
        a.sphere_of_influence = 'Medical Practice'
    ;
MERGE (a:Agent {uuid: 'agent_tortius'})
    ON CREATE SET
        a.name = 'Tortius',
        a.title = 'Chief Engineer',
        a.description = 'Tortius is Claudius\'s Chief Engineer, tasked with overseeing the harbor reconstruction project. His discomfort, evasiveness, and inability to justify inflated cost estimates highlight his complicity in bureaucratic corruption and underscore a broader theme of inefficiency and dishonesty within the administration.',
        a.traits = ["Corrupt", "Evasive", "Incompetent", "Dishonest"],
        a.sphere_of_influence = 'Engineering'
    ;
MERGE (o:Object {uuid: 'object_infant_son'})
    ON CREATE SET
        o.name = 'Caligula\'s Infant Son',
        o.description = 'The infant son of the recently deceased Emperor Caligula, now in the care of Claudius and Messalina. He is presented on the balcony as a symbol of legitimacy and continuity in the face of political upheaval. The child represents both a personal connection for Claudius, who expresses affection for him, and a political tool for Messalina, who seeks to consolidate power through maternal imagery.',
        o.purpose = 'To reinforce Claudius\'s legitimacy as Emperor and to signify continuity of the imperial lineage.',
        o.significance = 'The child embodies the hope and continuity of the imperial line, serving as a political symbol in the complex web of Roman power dynamics.'
    ;
MERGE (o:Object {uuid: 'object_book_claudius_family_history'})
    ON CREATE SET
        o.name = 'Book about My Family',
        o.description = 'A book that Claudius intends to write about his family history. It includes \'kitchen details\' and gossip, aiming to reveal the plain facts and honor the memory of his deceased friends, Postumus and Germanicus.',
        o.purpose = 'To document family history truthfully.',
        o.significance = 'Represents Claudius\'s character, his historical perspective, and the theme of truth.'
    ;
MERGE (o:Object {uuid: 'object_architectural_plans'})
    ON CREATE SET
        o.name = 'Architectural Plans',
        o.description = 'Detailed maps and blueprints for rebuilding the harbor at Ostia. The plans include two sets: one from the time of \'Divine Julius\' (Julius Caesar) showing a superior, efficient design, and a more recent inflated set produced by Tortius\'s engineers, revealing corruption and bribery.',
        o.purpose = 'To guide the rebuilding of Ostia Harbor.',
        o.significance = 'Symbolizes Claudius\'s commitment to efficient governance and his uncovering of corruption, highlighting the decay of Roman administration since Julius Caesar\'s time.'
    ;
MERGE (o:Object {uuid: 'object_gold_pieces'})
    ON CREATE SET
        o.name = 'Gold Pieces',
        o.description = 'Roman currency mentioned in the context of harbor reconstruction costs. Julius Caesar\'s plan estimated four million gold pieces, while Tortius\'s estimate was fifteen million, symbolizing the economic stakes of the project and the potential for financial malfeasance.',
        o.purpose = 'Roman currency, used for imperial expenses.',
        o.significance = 'Represents the financial resources of Rome and the potential for corruption in large public works projects.'
    ;
MERGE (o:Object {uuid: 'object_earth'})
    ON CREATE SET
        o.name = 'Earth',
        o.description = 'Soil and ground material that needs to be excavated for the harbor construction. It correctly identifies the need to cut through \'earth\' in Julius Caesar\'s plans, representing the tangible, physical reality of the construction project.',
        o.purpose = 'Construction material to be excavated.',
        o.significance = 'Represents the physical reality of the project and highlights the falsification of data by corrupt officials.'
    ;
MERGE (o:Object {uuid: 'object_rock'})
    ON CREATE SET
        o.name = 'Rock',
        o.description = 'Hard stone material falsely claimed by Tortius\'s surveyors to be the primary material needing excavation for the harbor. The claim is used to justify higher costs and longer timelines, contrasting with the accurate depiction of \'earth\'.',
        o.purpose = 'Construction material (falsely claimed).',
        o.significance = 'Represents the fabricated excuses used to justify corruption and inflated costs.'
    ;
MERGE (l:Location {uuid: 'location_senate_chamber'})
    ON CREATE SET
        l.name = 'Senate Chamber',
        l.description = 'The ancient Senate Chamber is a large, formal hall with dim, filtered light and dust motes dancing in weak sunlight. Its aged, decaying features and grand scale create an atmosphere of traditional political power waning, as senators engage in hushed conversations that reflect their uncertain and precarious position.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_state_chamber'})
    ON CREATE SET
        l.name = 'Imperial State Chamber',
        l.description = 'The Imperial State Chamber is a stately room within the palatial complex, characterized by marble décor and classical architecture. Soft light enhances the solemnity of deliberations, making it a space where imperial authority intersects with personal struggles, notably those of Claudius.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    ON CREATE SET
        l.name = 'Imperial Palace - Reception Hall',
        l.description = 'The Reception Hall of the Imperial Palace is a grand and imposing space with vaulted ceilings, massive marble columns, and arched windows that let in streams of sunlight. Serving as a transitional zone between the public imperial face and its internal machinations, the hall exudes both splendor and an undercurrent of political tension.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_balcony'})
    ON CREATE SET
        l.name = 'Imperial Palace - Balcony',
        l.description = 'The balcony of the Imperial Palace is a dramatic vantage point adorned with intricate designs, overlooking a bustling courtyard where citizens assemble. Bathed in sunlight, it serves as the stage for the Emperor’s public appearance, juxtaposing royal vulnerability with the weight of imperial duty.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_claudius_private_study'})
    ON CREATE SET
        l.name = 'Claudius\'s Private Study',
        l.description = 'A richly appointed study within the Imperial Palace, filled with books and warmed by a crackling hearth. This private sanctuary serves as a backdrop for scholarly pursuits, intimate conversations, and personal revelations, contrasting markedly with the public splendor and political intrigue of the larger palace.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace'})
    ON CREATE SET
        l.name = 'Imperial Palace',
        l.description = 'The Imperial Palace is the vast and opulent residence of the Emperor, embodying Roman power and grandeur. Within its walls, multiple chambers and halls—ranging from private studies to grand reception rooms—interweave domestic life with high-stakes imperial politics.',
        l.type = 'Palace'
    ;
MERGE (l:Location {uuid: 'location_messalinas_bedchamber'})
    ON CREATE SET
        l.name = 'Messalina\'s Bedchamber',
        l.description = 'Messalina\'s Bedchamber is a private and intimate bedroom set within the opulent Imperial Palace. Characterized by soft lighting and luxurious furnishings, this space blends personal serenity with the weight of royal politics as Messalina navigates her roles as both mother and political figure.',
        l.type = 'Bedroom'
    ;
MERGE (l:Location {uuid: 'location_claudius_study'})
    ON CREATE SET
        l.name = 'Claudius\'s Study',
        l.description = 'Claudius\'s Study is a private chamber inside the Imperial Palace dedicated to scholarly and administrative pursuits. Furnished with a spacious table for architectural plans and private meetings involving key figures like his freedmen Narcissus and Pallas, this room operates as both a workspace and a secluded venue for statecraft.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_private_suite'})
    ON CREATE SET
        l.name = 'Claudius\'s Chambers',
        l.description = 'Claudius\'s Chambers is an intimate room within the Imperial Palace, richly adorned and filled with personal touches that reveal both the trappings of imperial power and the Emperor\'s private vulnerabilities. The space balances the solemnity of state matters with a personal, almost hidden, aspect of his life.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_grand_council_chamber'})
    ON CREATE SET
        l.name = 'Grand Council Chamber',
        l.description = 'The Grand Council Chamber is a large, imposing room within the Imperial Palace designed for formal meetings and state business. With tall windows that let in ample sunlight and detailed maps spread across a massive marble table, the space transforms from an arena of bureaucratic process to a stage for shock and violence during unexpected political upheavals.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_archives'})
    ON CREATE SET
        l.name = 'Archives',
        l.description = 'The Archives are a repository of historical documents and records, housed within the Imperial Palace complex. This repository not only stores invaluable historical artifacts like Julius Caesar\'s harbor plans but also serves as a bridge connecting Rome\'s storied past with the present intrigues of its court.',
        l.type = 'Library/Repository'
    ;
MERGE (l:Location {uuid: 'location_ostia_harbor'})
    ON CREATE SET
        l.name = 'Ostia Harbor',
        l.description = 'Ostia Harbor is the vital port city at the mouth of the Tiber River, crucial for Rome\'s grain supply and trade. Although only discussed in terms of its importance to the empire, the harbor\'s need for rebuilding and the surrounding corruption clamor for attention as a critical infrastructure project.',
        l.type = 'Port City'
    ;
MERGE (l:Location {uuid: 'location_spain'})
    ON CREATE SET
        l.name = 'Spain',
        l.description = 'Spain is a Roman province referenced as the origin of Silanus before he is summoned to Rome by Claudius. As a distant territory of the empire, it symbolizes both remoteness from the central political turmoil and the broader expanse of Roman power.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_imperial_assembly_hall'})
    ON CREATE SET
        l.name = 'Imperial Assembly Hall',
        l.description = 'The Imperial Assembly Hall is a vast, austere space defined by cold marble and long, echoing corridors. Its unadorned architecture and heavy atmosphere underscore themes of betrayal and the unforgiving nature of Roman political machinations, serving as a central arena for the confrontation of authority.',
        l.type = 'Government Hall'
    ;
MERGE (o:Organization {uuid: 'org_senate'})
    ON CREATE SET
        o.name = 'Senate',
        o.description = 'The Roman Senate is the traditional governing body of Rome, composed of patricians and influential citizens. While historically powerful, its authority is being challenged by the rise of imperial power and the Praetorian Guard. In this scene, Silanus, a senator, embodies the republican ideals in conflict with the imperial autocracy represented by Claudius.',
        o.sphere_of_influence = 'Roman Governance'
    ;
MERGE (o:Organization {uuid: 'org_praetorian_guard'})
    ON CREATE SET
        o.name = 'Praetorian Guard',
        o.description = 'The Praetorian Guard is the elite unit tasked with protecting the Emperor and maintaining order in the Roman Empire. They wield significant military power and influence, often acting as kingmakers in the political arena. In this scene, they are represented by Rufrius and other guards who respond to Claudius\'s call for help, underscoring their role as enforcers of imperial authority.',
        o.sphere_of_influence = 'Imperial Security'
    ;
MERGE (ep:Episode {uuid: 'episode_fool\'s_luck'})
    ON CREATE SET
        ep.title = 'Fool\'s Luck',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Whispers of Republic, Roar of the Guard',
        s.description = 'The Senate Chamber, a space designed for reasoned debate, is now cloaked in an atmosphere of nervous anticipation.  Weak daylight struggles to penetrate the gloom, casting long shadows across the ancient marble. Senators, a mix of seasoned politicians and opportunistic newcomers, are gathered, their hushed conversations a low murmur against the backdrop of the imposing architecture. The air, still heavy with the residue of Caligula\'s tyrannical reign, vibrates with uncertainty and a fragile hope for change.  Dust motes dance in the shafts of light, highlighting the wear and tear on the once-grand chamber, mirroring the fractured state of Roman governance itself.  This scene serves to establish the immediate aftermath of Caligula\'s death, showcasing the Senate\'s initial yearning for a return to republican ideals before the brutal reality of the Praetorian Guard\'s power shatters their aspirations and sets the stage for Claudius\'s unexpected ascension.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Silanus Advocates for a Republic',
        e.description = 'Cestias calls upon Appius Junius Silanus to address the Senate. Silanus, recently arrived from Spain, expresses his relief at Caligula\'s death and uses the metaphor of being \'summoned to Rome\' as a euphemism for death, a phrase he hopes will be banished forever. He passionately advocates for a return to the Republic, evoking a sense of longing for a bygone era of Roman governance and igniting a spark of hope for liberty among the assembled senators.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["SILANUS: Senators, I was summoned here from Spain by our Emperor. By our late Emperor.", "SILANUS: I need hardly describe to you the feelings with which I made the journey. A few months ago, hearing that an old friend was sick, I went to see him. \"What is it that ails you?\" I asked him. He smiled. \"APPIUS SILANUS\", he said, \"I have been summoned to Rome\". He meant, of course, that he was dying. I arrived here yesterday. Today, the Emperor is dead instead of me. Let that notorious phrase - summoned to Rome - perish with him from our language forever. And let us return once again to the sanity of a republic!"]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Senate Cheers the Republican Ideal',
        e.description = 'Silanus\'s speech resonates deeply with the Senators.  A wave of enthusiastic cheering erupts as they embrace the idea of restoring the Republic.  Many senators rise to their feet, applauding vigorously, their faces reflecting a shared desire to escape the tyranny of emperors and reclaim their own power. The chamber is filled with the sound of hopeful resurgence, a fleeting moment of unity in the face of political uncertainty.',
        e.sequence_within_scene = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Cestias Announces Claudius\'s Proclamation',
        e.description = 'As the cheering subsides, Cestias, struggling to regain order, delivers a jarring announcement that shatters the Senate\'s republican fervor. He reveals that the Praetorian Guard has seized Claudius, Caligula\'s ridiculed uncle, and proclaimed him Emperor.  His words are met with stunned silence initially, before disbelief and derisive laughter ripple through the chamber. The senators\' hopes for a Republic are instantly dashed by the brute force of the Praetorian Guard, who have once again asserted their role as kingmakers of Rome.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CESTIAS: Senators! Senators! Senators! The Praetorian Guards have carried off CALIGULA's Uncle CLAUDIUS and proclaimed him Emperor. Did you not hear what I said? The Guards have proclaimed TIBERIUS CLAUDIUS Emperor."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Disbelieving Laughter Greets Claudius\'s Name',
        e.description = 'Cestias\'s announcement is met with loud, disbelieving laughter from the senators. The idea of Claudius, a figure of public mockery and scholarly recluse, as Emperor is seen as absurd and comical. The laughter is laced with derision and a complete lack of respect for Claudius, highlighting the Senate\'s underestimation of him and their immediate dismissal of his legitimacy as a ruler.  The scene ends on this note of ironic humor and profound misjudgment, setting the stage for the unfolding drama of Claudius\'s unexpected reign.',
        e.sequence_within_scene = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Reluctant Emperor',
        s.description = 'In the dimly lit Imperial State Chamber, a palace steeped in the grandeur of Rome, the air is thick with unease. Marble columns rise majestically, but the atmosphere is suffused with tension as Claudius, disheveled and visibly uncomfortable, sits awkwardly upon a makeshift throne. The subdued lighting casts shadows over his sweating brow, highlighting his internal struggle against the imperial mantle thrust upon him. Guard Gratus, burly and jovial, attempts to break the ice with wine, while Rufrius paces with barely concealed impatience, each moment underscoring Claudius’s reluctance. As the weight of power settles uneasily upon his shoulders, an unexpected visitor enters: Herod Agrippa, the King of Bashan, with an air of confidence and authority. His arrival brings both congratulations and a chilling reminder of the dangerous game of politics Claudius must now navigate. Herod’s words echo with urgency, urging Claudius to abandon thoughts of a Republic and embrace his role as Emperor, lest he and his family face dire consequences. This scene lays bare the precarious balance of power, laying the groundwork for the tumultuous path ahead for Claudius as he confronts the shadows lurking within the imperial court.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_state_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Claudius Resists His Role',
        e.description = 'Claudius, visibly sweating and agitated, firmly expresses his refusal to accept the title of Emperor, asserting his belief in the Republic. Gratus, the guard, attempts to lighten the mood, acknowledging Claudius\'s uniqueness in not wanting power. This moment illustrates Claudius’s inner turmoil and foreshadows the conflicts he will face in accepting the mantle of leadership.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I d-don't want any wine.", "I've told you a d-dozen times, I d-don't want to be Emperor."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Herod Agrippa Enters',
        e.description = 'King Herod Agrippa enters with confidence, congratulating Claudius on his election. His presence commands attention and he quickly assesses the tension in the room. He warns Claudius about the dangers of relinquishing power to the Senate, emphasizing the need to embrace the imperial role fully. Herod’s counsel reveals the brutality of Roman politics and the immediate threats to Claudius’s life and reign.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Congratulations, Caesar, on your election!", "You mustn't! First, it would be signal for civil war."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'The Threat of Assassination',
        e.description = 'Herod warns Claudius that the assassins have already killed Caesonia and her child, revealing the deadly stakes of his new role. This shocking revelation serves to heighten the tension and underscores the violent reality of the power struggle in Rome, forcing Claudius to grapple with the consequences of his political beliefs.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["A Republic necessitates the death of the whole Imperial family, not just Caligula."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'The Senate\'s Call',
        e.description = 'Rufrius interrupts to announce the arrival of the Senate\'s envoys, who demand Claudius’s immediate attendance. Claudius\'s irritation flares as he protests against their insistence, reflecting his reluctance to engage with the political machinations of the Senate. This moment highlights the growing disconnect between Claudius’s ideals and the harsh realities of power.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Stop c-calling me that!", "Tell them I am unable, for the moment, to comply with their request."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Reluctant Emperor Defends His Throne',
        s.description = 'The grand reception hall of the Imperial Palace is now a stage for political theater. Sunlight streams through the arched windows, casting a stark light on the nervous assembly of Roman Senators.  The air is thick with unspoken tension as Claudius, the newly proclaimed Emperor, stands before them, a figure both awkward and surprisingly resolute. He is dressed in imperial robes that seem to weigh him down, yet his voice, though stammering, carries a newfound authority. The emotional atmosphere is charged with defiance and apprehension, as Claudius parries the Senate\'s challenges to his legitimacy. This scene is pivotal in establishing Claudius\'s unexpected strength and cunning, demonstrating his ability to navigate the treacherous waters of Roman politics, and setting the stage for his reign amidst the chaos and power struggles following Caligula\'s assassination. The themes of legitimacy, power, and the contrast between appearance and reality are central, as the \'fool\' reveals a sharp intellect and a steely resolve.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Claudius Asserts His Unwanted Authority',
        e.description = 'Claudius addresses the assembled Senators, acknowledging their opposition to his unexpected ascension. He cleverly uses self-deprecation and sharp wit to disarm their criticisms and highlight their own hypocrisy.  He acknowledges his lack of desire for the throne, yet firmly asserts his position, reminding them of the Praetorian Guard\'s backing and their own role in creating the conditions for imperial rule.  This moment is crucial for Claudius establishing a foundation of authority, not through brute force, but through intellectual agility and a pragmatic understanding of the current power dynamics.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Senators, I understand you d-d-do not want another Emperor. But it seems you've b-been given one.", "CLAUDIUS: I agree, but there are 4,000 Praetorian Guards who d-do not.", "CLAUDIUS: It is also against the constitution to m-murder one! But if you hadn't done so, Marcus, we shouldn't b-be in this absurd position!", "CLAUDIUS: Senators, I shall do nothing unconstitutional. I shall appear at the next session of the Senate where you may confirm me in my position or not, as you wish. But if it pleases you not to, explain your reasons to them, not to me!"]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Herod\'s Reassurance and Grim News of Sabinus\'s Suicide',
        e.description = 'As the Senators depart, leaving a select few behind, Claudius expresses his self-doubt to Herod, confessing to feeling like a fraud. Herod, ever the pragmatist, reassures him, emphasizing the work ahead and acknowledging Claudius\'s capable performance in the face of senatorial opposition.  This brief moment of private vulnerability is abruptly interrupted by Rufrius\'s grave entrance and the announcement of Gaius Sabinus\'s suicide. This news casts a pall over the scene, highlighting the brutal consequences of the recent conspiracy and the dangers that still loom.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: ... I feel a f-fraud.", "HEROD: You won't when you begin work. There's much to do. You're doing very well.", "RUFRIUS: Caesar, Gaius Sabinus is dead. He's taken his own life. All the officers involved in the conspiracy have been arrested and are awaiting trial and execution."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Claudius Confronts Cassius About the Murders',
        e.description = 'Claudius turns his attention to Cassius Chaerea, one of Caligula\'s assassins, who is brought before him.  While acknowledging he doesn\'t condemn Cassius for Caligula\'s death, Claudius focuses on the brutal murders of Caesonia and her child, emphasizing their innocence. He seeks to understand the extent of the conspiracy and Cassius\'s role in expanding the kill order beyond Caligula. This confrontation reveals Claudius\'s moral compass and his concern for justice, even as he navigates the treacherous world of Roman power.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: I cannot find it in me to condemn you for killing my nephew. But you also murdered the Lady CAESONIA and the child, and you meant to murder me and my wife. None of whom had ever done you any harm.", "CASSIUS: I did it for the Republic and I would do it again.", "CLAUDIUS: What w-weighs with me is w-what I've heard - that it was agreed among you that only Caligula should die. But that you took it upon yourself to kill us all, Is that true?", "CASSIUS: Why should I deny it? When your very existence here proves that only your death would have ensured the return of the Republic."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Claudius Delivers His First Death Sentence',
        e.description = 'Faced with Cassius\'s unapologetic defiance and admission of expanding the assassination plot to include innocents, Claudius pronounces his first death sentence.  He condemns Cassius not for killing Caligula, but for the murders of Caesonia and her child.  Cassius, dragged away, hurls a chilling curse at Claudius, questioning how long it will be before the cycle of violence turns against the new Emperor. This event marks a significant turning point for Claudius, forcing him to embrace the brutal realities of imperial justice and foreshadowing the dangers that await him as Emperor.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: Then you leave me no choice... b-but to condemn you for the murder of Caesonia and the child. Take him away.", "CASSIUS: Congratulations, Caesar. You've passed your first sentence of death. How many more will you pass before they grow tired of you and pass one on you? Isn't that the way we've set for ourselves? Think about it, Caesar! Think about it!"]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'The Balance of Power',
        s.description = 'The scene unfolds on the sun-drenched balcony of the Imperial Palace, where a crowd has gathered below, their voices a chorus of adoration for their new Emperor, Claudius. With Caligula\'s infant son cradled in his arms, Claudius stands alongside his wife, Messalina, embodying the conflicted nature of power in Rome. The air is thick with a sense of public spectacle, mingling joy and hidden tensions as Claudius expresses his affection for both Messalina and their child. The backdrop of political maneuvering looms large as Messalina subtly asserts her influence over Claudius, urging him to recognize her contributions to his reign and to claim her rightful position as a power in her own right, akin to Livia\'s legacy. The conversation dances between personal affection and political ambition, revealing the delicate balance between love and the ruthless pursuit of power. As the scene progresses, the stark realities of their relationship surface, with Messalina\'s manipulations intertwined with her maternal instincts, crafting an intricate tapestry of familial duty and strategic ambition.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_balcony'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Claudius Presents His Son',
        e.description = 'On the balcony, Claudius, holding Caligula\'s infant son, addresses the enthusiastic crowd below, showcasing both his public role as Emperor and his personal connection to the child. He revels in the crowd\'s adoration, demonstrating his desire to be seen as a beloved ruler. Messalina, however, questions the necessity of this display, hinting at her own ambitions and the burdens of motherhood she is willing to shoulder for the sake of the empire. Claudius expresses his love for both the child and Messalina, showcasing his emotional vulnerability, while she seizes the opportunity to assert her influence by discussing her administrative contributions and her desire to be a co-ruler akin to Livia.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["The investigation into this affair is closed.", "Oh, here. Oh, wait. He's dribbling.", "Next to you, he's the most imp-portant thing in my life. I can't thank you enough for him."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Messalina\'s Ambition Revealed',
        e.description = 'As Claudius expresses gratitude for Messalina\'s support, she transitions the conversation toward her aspirations within the political sphere. Messalina asserts her desire to be like Livia, emphasizing that she possesses intelligence and capability that should not be wasted merely in motherhood. Her words subtly challenge Claudius’s perception of her role, pushing for a more active participation in governance. This moment reveals the underlying tension between her maternal duties and her ambition, laying the groundwork for future manipulations.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I want to be Livia to your Augustus.", "I'll never be content just to be the mother of children."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Domitia’s Concern',
        e.description = 'The conversation shifts as Domitia, Messalina\'s mother, enters the dialogue. She expresses concern over Messalina\'s involvement in state affairs, reinforcing traditional gender roles and questioning the appropriateness of her daughter\'s ambitions. Messalina counters this by asserting her right to engage in political matters, a bold defiance against the norms of her time. The tension between mother and daughter underscores the generational clash in attitudes toward women\'s roles in Rome.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["It's not a woman's place.", "It may not be yours, Mother, but it's mine."]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'Secrets and Manipulations',
        e.description = 'The dialogue takes a turn as Messalina artfully hints at romantic connections between Domitia and Appius Silanus, revealing her strategic mind at work. While Domitia reminisces about the past, Messalina’s probing questions suggest ulterior motives, as she seeks to manipulate her mother\'s affections for political gain. This clever maneuvering emphasizes Messalina\'s cunning ability to weave personal relationships into the fabric of her ambitions, further foreshadowing the complex schemes that drive the narrative.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Weren't you fond of him once?", "Perhaps he lacked encouragement."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Deifying Livia and Sowing Seeds of Mistrust',
        s.description = 'Night envelops Claudius\'s private study, a sanctuary lined with scrolls and illuminated by a crackling hearth, casting dancing shadows on the walls. Emperor Claudius, the scholar-turned-ruler, sits in earnest conversation with King Herod Agrippa, a seasoned player in the game of thrones. Messalina, ever-present and radiating youthful ambition, subtly weaves herself into their discussion, her beauty a deceptive veil for her calculating mind. The scene is thick with political undertones, a delicate dance between genuine pronouncements and veiled manipulations. The air, though intimate within the study\'s confines, is charged with the unspoken tensions of power, as Livia\'s deification is declared, a royal pregnancy is unveiled, and the seeds of future courtly intrigue are sown with Herod\'s departing words of stark warning.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_private_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Livia Ascends to Godhood',
        e.description = 'Claudius, with a quiet satisfaction, announces that the Senate has formally deified Livia, fulfilling his promise to elevate her to godhood. Messalina, with theatrical piety, embellishes the pronouncement with a romantic vision of Livia\'s heavenly welcome, showcasing her performative devotion and sharp wit. Herod observes with a hint of cynicism, acknowledging the excessive romanticism while Claudius beams, pleased with fulfilling his familial duty.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: So Livia is a goddess at last? That will please her. I think she wanted that more than anything.", "CLAUDIUS: Yes, I've kept my promise, though I never dreamed I'd ever be able to. But the Senate f-formally granted my request this morning. Livia takes her p-place among the gods.", "MESSALINA: I should like to be there in Heaven when she arrives, and the Divine Augustus takes her by the hand and shows her to all the gods. Oh, how proud he'll be.", "HEROD: The Lady Messalina is excessively romantic."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'A Royal Pregnancy is Declared',
        e.description = 'In a moment of domestic revelation framed as state news, Claudius excitedly announces Messalina\'s second pregnancy to Herod. Messalina playfully deflects Herod\'s surprised reaction, while Claudius, in his scholarly naivete, explains his understanding of breastfeeding as a contraceptive, oblivious to the courtly and biological realities. The announcement hangs in the air, a mix of imperial pronouncement and Claudius\'s endearing cluelessness.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: Yes. I'm a l-l-lucky man, am I not? Shall we tell him?", "MESSALINA: Since he's going away, let him be the first to know.", "CLAUDIUS: She's pregnant again.", "HEROD: So soon?", "MESSALINA: You see, even Herod thinks it's too soon.", "CLAUDIUS: Well, my love, it wasn't my fault.", "HEROD: Well, whose fault was it then, eh?", "CLAUDIUS: Well, no... I mean, she gave our little son out to be nursed. Well, I understood. She does so much work for me. It was inconvenient. But it's well known breast feeding is a sure guarantee against pregnancy.", "HEROD: When is it due?", "MESSALINA: In July."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Seeking Counsel, Naming a Successor',
        e.description = 'As Herod prepares to depart, Claudius expresses genuine distress at losing his trusted advisor, pleading for him to stay and continue offering guidance on matters of state. Messalina, seizing the moment with calculated precision, suggests Appius Silanus as Herod\'s replacement. She subtly proposes a marriage between Silanus and her widowed mother, Domitia, revealing her strategic mind at work, weaving familial alliances to consolidate her influence. Herod, ever perceptive, recognizes the political maneuver and dryly comments on Messalina\'s forward-thinking, while also warning Claudius of Silanus\'s Republican leanings.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: What am I going to do without you, my friend? Won't you change your mind and stay?", "HEROD: No, Caesar, you don't need me anymore.", "CLAUDIUS: I need you. Who's going to tell me how to borrow money or what the corn factors are saying in the city?", "HEROD: You have good people about you now who can tell you far more than I can.", "CLAUDIUS: Messalina, make him change his mind.", "MESSALINA: He has kingdoms of his own to govern. And you've given him several more than he had when he arrived.", "MESSALINA: But it's true, all your principal advisers are freedmen. It would be good to find a nobleman to take the place of King Herod on whom you could absolutely rely.", "MESSALINA: Appius Silanus.", "MESSALINA: It's only a suggestion, but you know my mother was fond of him once. It would please her to marry again, and I'm sure that Silanus would not be adverse to a connection by marriage with the Emperor's family.", "HEROD: He has Republican sentiments.", "HEROD: He spoke out strongly against you in the Senate after the assassination.", "HEROD: I have a feeling the Lady Messalina is ahead of us."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'A Stark Warning: Trust No One',
        e.description = 'After Messalina gracefully exits, leaving the two men alone, Herod delivers a final, chilling piece of advice to Claudius. Shedding all pretense, he urges the Emperor to trust absolutely no one – not freedmen, friends, children, or even his own wife. This stark warning hangs heavy in the firelit study, a brutal summation of the treacherous world Claudius now inhabits. Claudius, seemingly shaken, directly questions if this includes even Herod himself, highlighting the depth of the isolation and paranoia inherent in his position.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["HEROD: Listen, Claudius. Let me give you a piece of advice.", "HEROD: One last piece and then I'm done. Trust no one, my friend, no one. Not your most grateful freedman, not your most intimate friend, not your dearest child, not the wife of your bosom. Trust no one.", "CLAUDIUS: No one? Not even you?"]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Birth of Ambition',
        s.description = 'In the dimly lit sanctuary of Messalina\'s bedchamber, a sense of anticipation hangs heavy in the air. The room, cloaked in shadows, is adorned with soft silks and muted hues, a stark contrast to the cold realities of the world outside. The MIDWIFE hovers nearby, her presence both comforting and clinical, her practiced hands delivering life amidst the tension of imperial politics. Suddenly, the plaintive cry of a newborn pierces the silence, a fragile sound heralding the arrival of new life. Messalina, her face a mask of feigned innocence, eagerly inquires about the child\'s gender, her ambition simmering just beneath the surface. This moment, though intimate, serves as a reminder of the intricate dance of power and familial ties that will shape the future of Rome. As a new life enters the world, the weight of potential and ambition looms large, foreshadowing the ruthless games that will unfold in the corridors of power.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_messalinas_bedchamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Birth Announcement',
        e.description = 'In a moment of palpable tension, the MIDWIFE announces the arrival of a newborn, her voice filled with warmth and reverence. The soft cries of the infant fill the room, an echo of new beginnings amidst the storm of political intrigue. Messalina\'s eyes sparkle with a mix of maternal instinct and calculating ambition as she seeks to determine the sex of her child, her eagerness betraying her underlying desires for power and legacy. This birth marks not only the introduction of a new life but also the continuation of Messalina\'s intricate plans to solidify her influence within the empire.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Is it all right?", "Beautiful. Beautiful.", "Is it a boy or a girl?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Interruption: A Daughter is Born',
        s.description = 'Claudius is in his private study, poring over architectural plans for a winter harbor at Ostia with his shrewd freedmen, Narcissus and Pallas. The room is filled with scrolls and maps, hinting at Claudius\'s scholarly nature amidst the trappings of imperial power. The atmosphere is initially business-like as they discuss the feasibility and cost of the ambitious project. However, this pragmatic discussion is abruptly shattered by the urgent arrival of a slave, bearing joyous news. The emotional tone shifts dramatically as the slave announces the birth of Claudius\'s daughter. Overwhelmed with paternal joy and relief, Claudius\'s focus instantly turns from state matters to personal happiness, showcasing his inherent goodness and vulnerability amidst the cynical world of Roman politics. Meanwhile, Narcissus and Pallas, left alone with the plans, reveal their self-serving motivations, their concerns shifting from public benefit to personal profit, exposing the pervasive corruption at the heart of the empire. This scene highlights the contrast between Claudius\'s genuine intentions and the self-interest of those around him, underscoring the challenges he faces in ruling Rome.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Harbor Plans Halted',
        e.description = 'Claudius is engaged in a discussion about architectural plans for a winter harbor at Ostia with his freedmen, Narcissus and Pallas. He expresses his desire to finally realize this long-considered project, brushing aside concerns about its potential cost. Claudius, despite his imperial status, approaches the matter with a practical, almost scholarly interest, wanting to investigate the feasibility before committing fully. He instructs his freedmen to arrange for engineers to survey the site and provide a cost estimate, demonstrating his intention to move forward with the public works project.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Well, let us at least get the engineers to survey it. We've always w-wanted a safe winter harbor. Everybody's always said it would cost too much. Well, let us find out."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Joyful Interruption: A Daughter Arrives',
        e.description = 'Just as Claudius is about to delve deeper into the harbor plans, a slave bursts into the study, interrupting the meeting with urgent news. The slave\'s excited announcement reveals the long-awaited birth of Claudius\'s child. Initially confused and disbelieving, Claudius quickly grasps the joyful news – it\'s a daughter. Overwhelmed with emotion, he expresses gratitude to Lucina, the goddess of childbirth, and declares an immediate end to the discussion, eager to embrace his newborn child. His spontaneous joy and pious exclamation reveal a deeply personal and vulnerable side of the Emperor, momentarily overshadowing his political responsibilities.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SLAVE: Caesar, Caesar! The child is born!", "CLAUDIUS: What?", "NARCISSUS: Caesar, your child is born.", "CLAUDIUS: But...?", "SLAVE: The child is born, Caesar. It's a girl.", "CLAUDIUS: Oh, Lucina be praised! She's heard my prayers. I'm coming. Let's have no more discussion. Get the engineers to make that survey. Then we'll decide."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Freedmen\'s Selfish Calculation',
        e.description = 'Left alone after Claudius\'s hasty departure, Narcissus and Pallas immediately resume their discussion, but their focus has shifted entirely to personal gain. Narcissus initiates the cynical turn by estimating the harbor\'s exorbitant cost. Pallas swiftly picks up on this, suggesting that the high cost itself might be a desirable outcome, effectively shelving the project. Their true motivation is revealed as they discuss their investments in the corn trade. They openly acknowledge that a more efficient harbor, capable of handling larger winter shipments, would drive down corn prices, directly impacting their personal wealth. Their dialogue exposes a blatant disregard for the public good and a prioritization of their own financial interests, highlighting the corruption and self-serving nature of Claudius\'s inner circle.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["NARCISSUS: It'll cost ten million. More.", "PALLAS: Well, the more expensive it is, the less likely it is it will ever be built.", "NARCISSUS: What are you suggesting? That we exaggerate the cost?", "PALLAS: Well, my dear Narcissus, you have money in corn. I have money in corn. Lots of people have money in corn. The more corn that can be landed in winter, the lower the price will be. That worries me.", "NARCISSUS: That could be construed as a very selfish point of view.", "PALLAS: Are you saying there is less selfishness in wanting the price of corn to be low rather than high?", "NARCISSUS: There are more people who want it to be low.", "PALLAS: Doesn't that add up to more selfishness rather than less?", "NARCISSUS: That is sheer sophistry. One cannot argue with you.", "PALLAS: Well, let's get the engineer's report and I'm sure the cost will take care of the philosophical considerations."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'A Delicate Proposal',
        s.description = 'In the soft glow of the private chamber, an intimate yet charged atmosphere envelops Claudius and Messalina. The room, adorned with tasteful decor, offers a fleeting sanctuary from the tumult of imperial life. Claudius, weary and burdened by the weight of rule, sits on a couch, while Messalina stands nearby, her concern evident. Their dialogue flows with a mix of tenderness and tension as Messalina expresses her worries over another pregnancy, ultimately proposing a temporary separation in their sleeping arrangements. Claudius\'s vulnerability shines through his stuttered responses, revealing a depth of emotion as he grapples with the implications of her request. Messalina\'s charm dances on the edge of manipulation, as her intentions suggest a calculated strategy behind her seemingly innocuous plea. This scene encapsulates the complexities of their relationship, marked by love, ambition, and the ever-present specter of power dynamics. It serves as a pivotal moment, highlighting the delicate balance between personal desires and imperial expectations, thus foreshadowing the future strains on their marriage.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_private_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Claudius Awakens to Concern',
        e.description = 'Claudius stirs from sleep on the couch, acknowledging his fatigue. Messalina, standing nearby, expresses concern for his well-being, suggesting he works too hard. Their conversation reveals both intimacy and the strains of imperial life, with Messalina reminding Claudius of his age and urging him to seek medical advice. Claudius reveals plans to consult a Greek doctor recommended by Herod, hinting at his vulnerability in navigating his health and duties as Emperor.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Oh. I must have fallen asleep.", "You're tired. You don't look well.", "Well, I'm going to see another doctor soon. A G-Greek, recommended by Herod."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'The Proposal for Separation',
        e.description = 'Messalina, seeking to safeguard their marriage, delicately proposes the idea of sleeping apart to avoid the risk of a third pregnancy so soon. Claudius\'s initial shock reveals his insecurity, prompting questions about their love and intimacy. Messalina reassures him of her affection, framing her proposal as a protective measure for their relationship. The conversation underscores their emotional connection while also hinting at Messalina\'s strategic thinking, as she skillfully navigates Claudius\'s feelings, ensuring he feels cherished even as she seeks to reestablish boundaries.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Could you possibly allow me to sleep in a bedroom of my own for a little while?", "But d-do you not l-love me anymore? I could understand that.", "Oh, my dear! I love you more than I ever did. Don't you know that?"]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Tender Negotiation',
        e.description = 'Claudius, still reeling from Messalina\'s request, struggles with the prospect of separation. Messalina deftly navigates his concerns, explaining that physical intimacy under pressure could harm their marriage. She skillfully reassures him of her love and hints at playful encounters during this separation, framing it as a fun challenge rather than a withdrawal. Their dialogue shifts from tension to a playful tone, revealing the complexities of their relationship dynamics and Messalina\'s calculated approach to maintaining control and affection.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["How l-long would you want the s-separation to last?", "I shall slip into your room now and then when you least expect it. I think that could be even more fun, don't you?"]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Separate Suites, Separate Lives',
        s.description = 'In the opulent yet stifling confines of Claudius\'s private suite, Messalina orchestrates a calculated separation from her husband, cloaking her ambition in the guise of marital wisdom. The richly decorated chamber, intended as a sanctuary for the Emperor, becomes a stage for manipulation as Messalina, with practiced ease, convinces Claudius that separate living arrangements are not only sensible but beneficial for their marriage. Her honeyed words and feigned concern mask a cold, strategic intent – to create space for her own machinations and sever any lingering intimacy with Claudius. As she speaks of temptation and convenience, the true temptation is power, and the convenience is for her unfolding schemes. The arrival of Silanus interrupts this subtle power play, ushering in a new element of courtly intrigue as Messalina, with a final, practiced smile, exits, leaving Claudius increasingly isolated and under her subtle, yet iron, control. The scene is thick with unspoken agendas, the gilded setting a stark contrast to the emotional chill permeating the room.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_private_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Silanus\'s Arrival Announced',
        e.description = 'A discreet knock breaks the tense quiet of the Emperor\'s chambers, and Pallas enters, his presence formal and deferential. He announces the arrival of Appius Junius Silanus, fulfilling Claudius\'s request to be informed immediately upon the noble\'s arrival from Spain. This news acts as a catalyst, setting in motion Messalina\'s carefully laid plan to distance herself from Claudius.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PALLAS: Pardon me, Caesar, but you asked me to let you know the moment the noble APPIUS JUNIUS SILANUS arrived. He is here."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Messalina Proposes Separation',
        e.description = 'Seizing the opportune moment presented by Silanus\'s arrival, Messalina swiftly pivots to her calculated strategy. She initially feigns to leave, then dramatically pauses, using Silanus\'s presence as a pretext to introduce her scheme for separate suites.  She positions the idea as beneficial to Claudius and their marriage, subtly manipulating him into believing it is a mutual decision born of wisdom and consideration.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MESSALINA: Oh, no, wait. I'm leaving. Let him come in. Well, he's had a long journey.", "CLAUDIUS: Oh, yes. Very well, my love. If you think it would be good for our m-marriage to be apart for a little while."]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Claudius Naively Concurs',
        e.description = 'Claudius, ever trusting and eager to please Messalina, readily agrees to her proposal. He interprets her manipulative suggestion as a sign of her wisdom and care for their relationship. His stammering agreement highlights his vulnerability and his reliance on Messalina\'s perceived guidance, completely oblivious to the underlying power play at work.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: If you think it would be good for our m-marriage to be apart for a little while. Women know more about these matters than men."]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Messalina Escalates the Separation',
        e.description = 'Not content with merely separate bedrooms, Messalina amplifies her plan, suggesting a complete relocation to a suite adjacent to her mother in the new palace wing. She frames this move as a matter of convenience, citing her offices being located there, further solidifying the separation and her own independence from Claudius\'s direct influence and scrutiny. This strategic move underscores her ambition and desire for autonomy.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["MESSALINA: Oh, there's no need for that. Well, since you've agreed that it's a very sensible proposal. Let's do it properly and remove all temptation. I'll move into a suite next to my mother in the new palace. Well, after all, my offices are there too. It'll be much more convenient."]
    ;
MERGE (e:Event {uuid: 'event_9_5'})
    ON CREATE SET
        e.title = 'Silanus Enters the Emperor\'s Presence',
        e.description = 'Pallas, with a formal announcement, presents Appius Junius Silanus to Caesar. Silanus enters, bowing respectfully, his demeanor reflecting the gravity of an audience with the Emperor. His arrival marks a shift in the scene\'s dynamic, introducing a new character and a fresh layer of political intrigue into the intimate setting of Claudius\'s private chambers.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["PALLAS: The noble Appius Junius Silanus, Caesar.", "SILANUS: Hail. Caesar."]
    ;
MERGE (e:Event {uuid: 'event_9_6'})
    ON CREATE SET
        e.title = 'Awkward Pleasantries and Messalina\'s Swift Exit',
        e.description = 'Claudius, with a semblance of cordiality, inquires about Silanus\'s journey. He then introduces Silanus to Messalina, prompting an exchange of subtly charged pleasantries. Messalina, with practiced charm, acknowledges a past acquaintance with Silanus, complimenting his gallantry while masking any deeper meaning.  Using the social niceties as a cover, she swiftly exits, leaving Claudius and Silanus alone, effectively concluding her manipulative maneuver and setting the stage for whatever business Claudius has with Silanus, now with herself strategically removed.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: Did you have a good journey?", "SILANUS: Excellent. The roads are in good shape.", "CLAUDIUS: Do you know my wife, the Lady Messalina?", "SILANUS: Only as a girl. You are even more beautiful than you were then.", "MESSALINA: I'm so glad you're here. You shall be a great help to my husband. I'll tell my mother you've arrived. Perhaps we can all meet at dinner?", "SILANUS: It will give me great pleasure to see her again."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'The Doctor\'s Consultation',
        s.description = 'In the intimate confines of Claudius\'s chambers, the atmosphere is tinged with vulnerability as the Greek doctor Xenophon examines Claudius. The walls, lined with scrolls and artifacts that hint at both power and fragility, provide a backdrop to their interaction. Sunlight filters through the windows, casting a warm glow on the scene, yet the undercurrents of tension remain palpable as Claudius grapples with his physical ailments. The emotional atmosphere oscillates between the mundane practicalities of health and the looming specter of imperial responsibility, the air heavy with unspoken fears about his capacity to rule. This consultation not only highlights Claudius\'s physical weaknesses but serves as a microcosm of his larger struggles as Emperor. The scene underscores the theme of vulnerability in power, revealing the fragile human beneath the imperial facade.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_private_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Xenophon Examines Claudius',
        e.description = 'As the Greek doctor Xenophon begins his examination, he probes into Claudius\'s medical history, revealing insights into his past ailments and current condition. The clinical detachment of the doctor contrasts sharply with Claudius\'s underlying insecurities about his health and capability. Their dialogue unveils not only Claudius\'s physical struggles but also hints at the burdens of leadership he bears. Xenophon offers practical advice, urging Claudius to prioritize his health over his duties, inadvertently shedding light on the delicate balance between personal well-being and the demands of being Emperor.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["XENOPHON: Your eyes are inflamed, but I can deal with that.", "CLAUDIUS: Well, we had a wedding yesterday. Appius Silanus married my mother-in-law. I probably ate too much.", "XENOPHON: You must stop that. Never get up from a table without wishing you'd like something more.", "CLAUDIUS: And what about the cramps in my stomach?", "XENOPHON: If you will eat large meals quickly in a state of nervous excitement, you must expect cramp."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Exposing Corruption and Unleashing Fury',
        s.description = 'The Grand Council Chamber, usually a space of stately deliberation, transforms into an arena of tense confrontation. Sunlight streams in, harshly illuminating the marble table where Caesar\'s original harbor plans are laid out, starkly contrasting with the inflated estimates of Tortius. The atmosphere is initially controlled and intellectual as Claudius, with a deceptive stammer, meticulously exposes the corruption of his engineers and corn factors. This intellectual dominance shifts abruptly to chaos and violence as Silanus, simmering with resentment, suddenly lunges at Claudius. The emotional tone swings from controlled authority and intellectual superiority to shock, fear, and then bewildered anger. The scene serves to highlight Claudius\'s unexpected sharpness and the simmering political and personal resentments within his court. It underscores the themes of corruption, betrayal, and the volatile nature of power in Rome, setting the stage for further personal and political turmoil.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_grand_council_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Questioning the Harbor Plans',
        e.description = 'Claudius, in the Grand Council Chamber, initiates a review of the Ostia harbor rebuilding plans. He meticulously compares Caesar\'s original plans with the current estimates presented by Tortius, observed by Pallas and Narcissus. His fidgeting and initial question, \'Well, w-what is it?\', mask a sharp intellect about to dissect the proposed project.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Well, w-what is it?", "PALLAS: It's a plan for rebuilding the harbor at Ostia.", "CLAUDIUS: Of course it is! Whose is it?", "PALLAS: It was made in the time of the Divine Julius. Where did you find it, Caesar?", "CLAUDIUS: In the archives. It's almost identical to the one Tortius has just produced. Come and look at it SILANUS. Here. What's the matter with you? Are you ill?", "SILANUS: No, Caesar.", "PALLAS: What relevance have these plans to us Caesar?"]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Exposing the Inflated Estimates',
        e.description = 'Continuing his interrogation, Claudius reveals the startling discrepancy between the original cost and timeline estimates from Caesar\'s era and the current figures. He pointedly questions the dramatic increase, highlighting the implausibility of material cost increases alone accounting for the difference. Tortius fidgets, becoming visibly uncomfortable as Claudius\'s scrutiny intensifies, hinting at the underlying corruption.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: Well, you'll be interested to learn that the engineers working under the D-Divine Julius estimated this rebuilding would take four years and cost four million gold pieces. The estimates presented to me are for t-ten years and 15 million gold pieces.", "NARCISSUS: But, Caesar, those estimates are 90 years old.", "CLAUDIUS: Are there less days in a year now than there were then? Or less hours in a day?", "NARCISSUS: There's been an increase in the costs of materials since then.", "CLAUDIUS: The prices have risen by no more than a quarter. How, then, do you explain my chief engineer's estimate?", "TORTIUS: Well.."]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Unmasking the Bribes and Corn Factors\' Scheme',
        e.description = 'Claudius, with an air of scholarly detachment, directly accuses Tortius\'s surveyors of taking bribes from the corn factors. He elucidates the scheme: artificially inflated earth-moving estimates designed to maintain high corn prices by slowing down harbor improvements, thus limiting grain imports. Tortius\'s stammered denials are weak against Claudius\'s reasoned accusation, which is confirmed by Silanus, solidifying the emperor\'s astute deductions and exposing the pervasive corruption.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: I will explain. Everywhere, for instance, you underestimate the amount of earth that one hundred men can move in a day. I mean, are men weaker now than they were then? The topography remains unchanged, yet on the Divine Julius' plan they were cutting through earth. In yours, you claim we were cutting through r-r-rock.", "TORTIUS: I can't understand it.", "CLAUDIUS: Let me explain it then. Your surveyors have been taking bribes from the corn factors.", "TORTIUS: Caesar!", "CLAUDIUS: Sh-sh-shocking, isn't it?", "TORTIUS: Well, I-I can't think why they should.", "CLAUDIUS: I can. To keep up the price of corn. Wouldn't you agree, Silanus?", "SILANUS: Yes, Caesar."]
    ;
MERGE (e:Event {uuid: 'event_11_4'})
    ON CREATE SET
        e.title = 'Issuing Imperial Orders and Financial Leverage',
        e.description = 'Claudius asserts his authority, ordering Tortius to proceed with the harbor reconstruction based on Caesar\'s plans, adjusted for inflation. When Pallas questions the funding, Claudius reveals his plan to extract a \'loan\' from the corn factors—a thinly veiled extortion leveraging his threat of investigating their bribery. This move showcases Claudius\'s cunning and his resolve to finance the project by targeting the very source of corruption, much to Pallas\'s disbelief.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: Well, Tortius. You will begin work on the basis of these estimates, revised, of course, for the difference in prices.", "PALLAS: Even so, Caesar, where is the money to come from? It's not in the purse.", "CLAUDIUS: We shall get the first million on loan from the corn factors.", "PALLAS: Haha. A million? They can't raise that kind of money.", "CLAUDIUS: Oh, you will be amazed, Pallas, at what they can raise in return for my agreement not to begin an inquiry into allegations of b-bribing my officials. Yes. Now it's very late. You may all go. We'll visit the harbor tomorrow."]
    ;
MERGE (e:Event {uuid: 'event_11_5'})
    ON CREATE SET
        e.title = 'Silanus Requests a Private Audience',
        e.description = 'As the meeting concludes and others prepare to depart, Silanus requests a private word with Claudius. Claudius, seemingly oblivious to any impending threat and still focused on the harbor plans, readily agrees, inviting Silanus to examine the documents further. This moment sets a false sense of scholarly camaraderie before the sudden eruption of violence, highlighting Claudius\'s vulnerability and Silanus\'s concealed intentions.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["SILANUS: I should like a word with you alone, Caesar.", "CLAUDIUS: Oh, very well. Come and look at these plans, Silanus. You didn't take much notice of them. The Divine Julius certainly knew what he was about. Yes. They are remarkable. In many ways, much better than the ones T-Tortius has produced. The only thing they leave out is the building of the island between the two moles. Come and look..."]
    ;
MERGE (e:Event {uuid: 'event_11_6'})
    ON CREATE SET
        e.title = 'Violent Assault and Emperor\'s Fall',
        e.description = 'Without warning, Silanus abruptly lunges at Claudius, physically attacking him and knocking him to the ground. This act of sudden violence shatters the preceding intellectual discourse and throws the chamber into chaos. Pallas and Narcissus react with apparent shock and horror, while Claudius cries out for help, highlighting his physical vulnerability despite his imperial status and intellectual prowess.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: Help! Get off me! Help me! Help me! Help me! Help me! ... Wait! Wait! Get up! Get up!", "PALLAS: What happened? Caesar! You're hurt!", "NARCISSUS: I'll fetch the doctor."]
    ;
MERGE (e:Event {uuid: 'event_11_7'})
    ON CREATE SET
        e.title = 'Accusations of Tyranny and Dishonor',
        e.description = 'Rufrius and guards swiftly intervene, seizing Silanus. Claudius, bewildered and demanding an explanation for the attack, is met with Silanus\'s defiant accusation of \'Tyrant!\'. Silanus further elaborates, claiming Claudius used marriage to dishonor him by intending to make Messalina his mistress, thereby revealing a deeply personal and politically charged motive for his attempted regicide. Silanus\'s outburst exposes the festering resentments against imperial power and the perceived moral corruption of Claudius\'s court.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["CLAUDIUS: Silanus tried to kill me. Why? Why?", "RUFRIUS: Let me have him, Caesar. He'll talk.", "CLAUDIUS: Why, Silanus, why?", "SILANUS: Tyrant!", "CLAUDIUS: Tyrant? I don't understand. What harm have I ever done you? I brought you back from Spain, I made you a minister. I connected you by marriage with my family.", "SILANUS: Yes! To put me in bed with your wife and service her like a bull!", "CLAUDIUS: What do you mean? W-what do you mean?", "SILANUS: You're all the same. Don't toy with me, Caesar, I'm not a slave. Do what you have to do.", "CLAUDIUS: I ask you again, w-what do you mean?", "SILANUS: You know what I mean! How predictable you Emperors are. All your reigns begin and end the same. From vices timidly concealed to vices openly displayed. One follows the other as surely as decay follows death."]
    ;
MERGE (e:Event {uuid: 'event_11_8'})
    ON CREATE SET
        e.title = 'Summoning Messalina and Domitia for Clarification',
        e.description = 'Deeply disturbed and demanding clarification regarding Silanus\'s shocking accusations against Messalina and Domitia, Claudius commands that both women be brought to the Grand Council Chamber immediately. This action signifies Claudius\'s need to understand the truth behind Silanus\'s claims and sets the stage for the next dramatic confrontation involving Messalina and her mother.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["CLAUDIUS: Fetch the Lady M-Messalina, and fetch her mother!", "SILANUS: Oh, get it over with Caesar. We've seen this play before, don't make us sit through it till the end.", "CLAUDIUS: You will explain that calumny on my wife and on her mother. And if you do not or will not to my satisfaction, you will surely die for this attempt on my life!"]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Shadows of Betrayal',
        s.description = 'The Imperial Assembly Hall stands as a stark backdrop, its cold marble echoing the tension of impending doom. Messalina, radiant yet cunning, stands beside her distressed mother, Domitia, as they confront Claudius, flanked by the unwavering Pallas. Appius Silanus, a defiant figure caught in the web of treachery, is guarded by soldiers, his fate hanging in the balance. The atmosphere is thick with deception, each character performing their part in this grim political theater. As accusations fly like arrows, the dark undercurrents of love, betrayal, and ambition intertwine, culminating in a tragic spectacle that brings the flaws and frailties of power into sharp relief. Claudius, once a scholar, now grapples with the weight of his position, torn between affection for Messalina and the brutal realities of Silanus\'s accusations. The scene captures the essence of Roman intrigue, where loyalty is a fleeting illusion and the thirst for power often leads to grim consequences.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_assembly_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Accusation of Treachery',
        e.description = 'In a charged atmosphere, Messalina and Domitia confront Claudius about the alleged assassination attempt by Appius Silanus. Domitia expresses disbelief and anger, questioning Messalina\'s loyalty. Messalina deflects, insisting she is innocent and urges her mother to support her claims. The tension escalates as Silanus\'s character comes under fire, revealing hidden motives and the fragility of familial bonds. Messalina\'s true feelings for Silanus begin to surface, adding layers to the unfolding drama.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Appius Silanus has tried to kill the Emperor.", "What do you know about this?", "I know nothing. Nothing!"]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Silanus\'s Defiance',
        e.description = 'Facing Claudius, Silanus openly admits his desire to assassinate the Emperor, revealing the tangled web of familial and romantic entanglements. He speaks of Messalina\'s manipulations and expresses his intent to strike a blow for Rome, positioning himself as a martyr for the Republic. His defiance resonates in the hall, challenging Claudius\'s authority while the emotions of Messalina and Domitia collide in a swirling vortex of love and betrayal.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I told your husband what you told me.", "To strike a last blow for Rome and end this plague of Emperors!"]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Verdict',
        e.description = 'Amidst the chaos, Claudius grapples with the conflicting narratives presented by Messalina and Silanus. Torn between his affection for his wife and the accusations against Silanus, he ultimately concedes to the demands of justice, declaring Silanus\'s fate. The emotional weight of the decision crushes him, revealing the vulnerabilities of a ruler caught in the snare of treachery. Claudius\'s proclamation signals not just the end of Silanus but the deepening shadows of his own reign.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Then you leave me no choice!", "I sentence you to die, as you sentenced me."]
    ;
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcus'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_vinicius'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_book_claudius_family_history'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_architectural_plans'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcus'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_vinicius'}),
          (o:Organization {uuid: 'org_senate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Appius Junius Silanus stands in the Senate Chamber, addressing his fellow senators. He speaks with deliberate pauses and rising passion, gesturing emphatically as he recounts his journey from Spain and his reaction to the news of Caligula\'s death. He uses a poignant anecdote about the phrase \'summoned to Rome\' to connect with his audience and set the stage for his political appeal.',
        ap.emotional_state = 'Silanus is outwardly relieved and invigorated by Caligula\'s demise, expressing a sense of hope for the future of Rome. Beneath this surface of optimism, there\'s a deep-seated cynicism about the current state of affairs, tempered by a genuine, almost desperate, longing for a return to the Republic. He speaks with a sardonic undertone, suggesting past disappointments, but his voice carries a resonant conviction, indicating a rekindled belief in the possibility of change.',
        ap.emotional_tags = ["silanus is outwardly relieved", "invigorated by caligula's demise, expressing a sense of hope for the future of rome. beneath this surface of optimism, there's a deep-seated cynicism about the current state of affairs, tempered by a genuine, almost desperate, longing for a return to the republic. he speaks with a sardonic undertone, suggesting past disappointments, but his voice carries a resonant conviction, indicating a rekindled belief in the possibility of change.", "silanus is outwardly relieved and invigorated by caligula's demise", "expressing a sense of hope for the future of rome. beneath this surface of optimism", "there's a deep-seated cynicism about the current state of affairs", "tempered by a genuine", "almost desperate", "longing for a return to the republic. he speaks with a sardonic undertone", "suggesting past disappointments", "but his voice carries a resonant conviction", "indicating a rekindled belief in the possibility of change.", "silanus is outwardly relieved and invigorated by caligula's demise, expressing a sense of hope for the future of rome. beneath this surface of optimism, there's a deep-seated cynicism about the current state of affairs, tempered by a genuine, almost desperate, longing for a return to the republic. he speaks with a sardonic undertone, suggesting past disappointments,", "his voice carries a resonant conviction, indicating a rekindled belief in the possibility of change."],
        ap.active_plans = ["To sway the Senate's opinion towards republican ideals.", "To publicly denounce the fear and tyranny associated with Caligula's reign.", "To ignite a spark of hope and inspire action among the senators for political reform."],
        ap.beliefs = ["The Republican system of governance is inherently superior to autocratic rule.", "Caligula's reign was a dark chapter of Roman history marked by fear and injustice that must be definitively closed.", "The Senate holds the legitimate power to guide Rome back to stability and virtue through a restored Republic."],
        ap.goals = ["short-term\": \"To secure immediate applause and verbal support from the Senate for the concept of restoring the Republic.", "medium-term\": \"To initiate formal discussions and propose concrete steps within the Senate towards dismantling imperial structures and reinstating Republican institutions.", "ultimate\": \"To witness the full restoration of the Roman Republic, eradicating the emperorship and ushering in an era of senatorial governance and civic liberty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Cestias stands formally in the Senate Chamber, acting as a figure of authority. He initially calls upon Silanus to speak, fulfilling a procedural role. After Silanus\'s passionate address and the Senate\'s enthusiastic reaction, Cestias attempts to regain order, raising his voice to be heard above the cheering and laughter. He then delivers the jarring news of the Praetorian Guard\'s actions.',
        ap.emotional_state = 'Cestias begins with a neutral, procedural demeanor, but transitions to a state of increasing frustration and alarm.  He likely feels a growing sense of disbelief and concern as the Senate erupts in laughter and celebration, seemingly missing the gravity of the unfolding situation with the Praetorian Guard. Beneath his formal exterior, there\'s an undercurrent of urgency and a mounting anxiety about the Senate\'s misjudgment of the power dynamics at play and the implications of the Guard\'s actions.',
        ap.emotional_tags = ["cestias begins with a neutral, procedural demeanor, but transitions to a state of increasing frustration", "alarm.  he likely feels a growing sense of disbelief", "concern as the senate erupts in laughter", "celebration, seemingly missing the gravity of the unfolding situation with the praetorian guard. beneath his formal exterior, there's an undercurrent of urgency", "a mounting anxiety about the senate's misjudgment of the power dynamics at play", "the implications of the guard's actions.", "cestias begins with a neutral", "procedural demeanor", "but transitions to a state of increasing frustration and alarm.  he likely feels a growing sense of disbelief and concern as the senate erupts in laughter and celebration", "seemingly missing the gravity of the unfolding situation with the praetorian guard. beneath his formal exterior", "there's an undercurrent of urgency and a mounting anxiety about the senate's misjudgment of the power dynamics at play and the implications of the guard's actions.", "cestias begins with a neutral, procedural demeanor,", "transitions to a state of increasing frustration and alarm.  he likely feels a growing sense of disbelief and concern as the senate erupts in laughter and celebration, seemingly missing the gravity of the unfolding situation with the praetorian guard. beneath his formal exterior, there's an undercurrent of urgency and a mounting anxiety about the senate's misjudgment of the power dynamics at play and the implications of the guard's actions."],
        ap.active_plans = ["To maintain decorum and procedural order within the Senate assembly.", "To effectively communicate the critical information regarding the Praetorian Guard's proclamation of Claudius as Emperor to the assembled senators.", "To refocus the Senate's attention from celebratory republican rhetoric to the immediate and serious challenge posed by the Praetorian Guard's unilateral action."],
        ap.beliefs = ["The Senate's authority and traditional procedures must be upheld, even in times of crisis.", "The Praetorian Guard's proclamation of an Emperor without Senate consultation is an egregious overreach of military power and a violation of Roman governance.", "The Senate must confront and address the challenge posed by the Praetorian Guard to preserve its own legitimacy and influence."],
        ap.goals = ["short-term\": \"To immediately deliver the news of Claudius's proclamation and ensure the Senate acknowledges this critical development.", "medium-term\": \"To prompt the Senate to recognize the gravity of the Praetorian Guard's actions and initiate a strategic discussion on how to respond and reassert senatorial authority.", "ultimate\": \"To safeguard the Senate's power and constitutional role in Roman governance, preventing military factions from dictating imperial succession and maintaining the balance of power within Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Silanus stands at the forefront of the Senate Chamber, his posture rigid with authority, gesturing emphatically as he delivers his speech. His voice rises above the murmurs, resonating with fervor as he captures the senators’ attention, invoking the memory of a Republic long forgotten.',
        ap.emotional_state = 'Outwardly, Silanus displays confidence and determination, his voice steady and strong. Internally, however, he is driven by a tumultuous mix of resentment and urgency, yearning for the restoration of republican ideals while grappling with the reality of his precarious position in a Senate that leans towards chaos.',
        ap.emotional_tags = ["outwardly, silanus displays confidence", "determination, his voice steady", "strong. internally, however, he is driven by a tumultuous mix of resentment", "urgency, yearning for the restoration of republican ideals while grappling with the reality of his precarious position in a senate that leans towards chaos.", "outwardly", "silanus displays confidence and determination", "his voice steady and strong. internally", "however", "he is driven by a tumultuous mix of resentment and urgency", "yearning for the restoration of republican ideals while grappling with the reality of his precarious position in a senate that leans towards chaos.", "outwardly, silanus displays confidence and determination, his voice steady and strong. internally, however, he is driven by a tumultuous mix of resentment and urgency, yearning for the restoration of republican ideals", "grappling with the reality of his precarious position in a senate that leans towards chaos."],
        ap.active_plans = ["To galvanize the senators into a collective movement towards restoring the Republic.", "To publicly condemn the rise of Claudius and the tyranny of emperors.", "To solidify his own position as a leader among the dissenting senators, rallying support against the Praetorian Guard."],
        ap.beliefs = ["A deep conviction in the ideals of the Republic and its necessity for Rome's future.", "A belief that the Senators possess the power to reclaim their autonomy and resist the tide of imperial rule.", "An inherent distrust of Claudius, viewing him as an unwitting pawn in a corrupt game of power."],
        ap.goals = ["Short-term: To inspire the Senate to reject Claudius's rule and embrace republican ideals.", "Medium-term: To establish himself as a prominent figure leading the charge against imperial autocracy.", "Ultimate: To restore the Republic and eliminate the threat posed by the remnants of imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Cestias stands in the Senate Chamber, his senatorial robes emphasizing his formal stance amidst the growing disorder. He raises his hands in a gesture aimed at quieting the room, his physical actions reflecting a desperate attempt to regain control of the escalating situation. His posture is rigid, his movements sharp as he tries to cut through the senators\' escalating mirth and disbelief with the gravity of his pronouncement. He is the bearer of unwelcome news, a herald of the Republic\'s fading hopes.',
        ap.emotional_state = 'Outwardly, Cestias displays a strained composure, his voice sharp and insistent as he struggles to be heard over the rising tide of laughter and derision. Beneath this forced calm, however, lies a deep frustration and mounting anxiety. He is witnessing the Senate\'s authority crumble in real-time, their aspirations for a Republic dissolving into mockery. There is a palpable tension between his duty to inform and his internal dread at the implications of his own message, a sense of helplessness as the Praetorian Guard\'s will overrides senatorial desires.',
        ap.emotional_tags = ["outwardly, cestias displays a strained composure, his voice sharp", "insistent as he struggles to be heard over the rising tide of laughter", "derision. beneath this forced calm, however, lies a deep frustration", "mounting anxiety. he is witnessing the senate's authority crumble in real-time, their aspirations for a republic dissolving into mockery. there is a palpable tension between his duty to inform", "his internal dread at the implications of his own message, a sense of helplessness as the praetorian guard's will overrides senatorial desires.", "outwardly", "cestias displays a strained composure", "his voice sharp and insistent as he struggles to be heard over the rising tide of laughter and derision. beneath this forced calm", "however", "lies a deep frustration and mounting anxiety. he is witnessing the senate's authority crumble in real-time", "their aspirations for a republic dissolving into mockery. there is a palpable tension between his duty to inform and his internal dread at the implications of his own message", "a sense of helplessness as the praetorian guard's will overrides senatorial desires."],
        ap.active_plans = ["To regain order and silence within the Senate Chamber, despite the senators' dismissive reaction.", "To clearly and audibly communicate the Praetorian Guard's proclamation of Claudius as Emperor to the assembled senators.", "To underscore the gravity and unexpected nature of this announcement, attempting to penetrate the senators' disbelief and derision."],
        ap.beliefs = ["The Senate is the rightful body to determine the leadership of Rome, not the Praetorian Guard.", "The proclamation of Claudius as Emperor is a blatant disregard for Republican ideals and senatorial authority.", "The laughter and disbelief of the senators, while understandable, are a dangerous underestimation of the Praetorian Guard's power and Claudius's potential emperorship."],
        ap.goals = ["Short-term: To deliver the news of Claudius's proclamation effectively and ensure the Senate understands the situation.", "Medium-term: To prompt the Senate to recognize the shift in power dynamics and consider a unified response (though in this moment, this seems unlikely given the senators' laughter).", "Ultimate: To uphold the authority of the Senate and the principles of the Republic, even in the face of this forceful assertion of imperial power by the Praetorian Guard."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Silanus stands at the center of the Senate Chamber, his posture erect and authoritative, as he addresses the gathered senators. His movements are animated, using his hands to emphasize his points, his voice rising above the murmurs and laughter that punctuate the air. He projects a mix of confidence and urgency to rally support for a return to republican ideals.',
        ap.emotional_state = 'Silanus exhibits surface emotions of determination and righteous indignation, his expression fierce as he implores the senators to heed his words. Beneath this, however, lies a simmering frustration and despair at the absurdity of Claudius\'s ascension, feeling the weight of betrayal and the loss of a republic slipping through his fingers. His internal conflict is palpable as he grapples with the reality of his circumstances in a now autocratic regime.',
        ap.emotional_tags = ["silanus exhibits surface emotions of determination", "righteous indignation, his expression fierce as he implores the senators to heed his words. beneath this, however, lies a simmering frustration", "despair at the absurdity of claudius's ascension, feeling the weight of betrayal", "the loss of a republic slipping through his fingers. his internal conflict is palpable as he grapples with the reality of his circumstances in a now autocratic regime.", "silanus exhibits surface emotions of determination and righteous indignation", "his expression fierce as he implores the senators to heed his words. beneath this", "however", "lies a simmering frustration and despair at the absurdity of claudius's ascension", "feeling the weight of betrayal and the loss of a republic slipping through his fingers. his internal conflict is palpable as he grapples with the reality of his circumstances in a now autocratic regime."],
        ap.active_plans = ["To inspire the senate to reject Claudius's rule and restore the republic.", "To rally fellow senators to acknowledge the absurdity of Claudius's appointment as Emperor.", "To leverage his position and voice against the Praetorian Guard's overreach of power."],
        ap.beliefs = ["The republic is the rightful form of governance for Rome, and Claudius's ascension undermines it.", "Senatorial authority should be restored to ensure the Republic's values are upheld.", "Caligula's madness should not result in further chaos but rather inspire a return to sanity and order."],
        ap.goals = ["Short-term: To instigate a reaction from the Senate that underscores their disdain for Claudius's rule.", "Medium-term: To build a coalition of senators who will actively oppose Claudius's legitimacy.", "Ultimate: To restore the Republic, dismantling the imperial structure and returning power to the Senate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Cestias stands amidst the senators, his demeanor a blend of formality and urgency as he attempts to quell the laughter and regain control of the chamber. He gestures emphatically to Silanus, trying to redirect the focus of the assembly back to the gravity of the situation rather than their mockery. His voice cuts through the din, embodying the Senate\'s political resistance.',
        ap.emotional_state = 'Cestias displays surface emotions of frustration and authority, a deep frown etched on his face as he reacts to the senators\' derision. Internally, he wrestles with feelings of exasperation and a strong desire to uphold the Senate\'s dignity in the face of chaos. He understands the implications of Claudius\'s ascension and feels a growing urgency to assert the Senate\'s power amidst the absurdity.',
        ap.emotional_tags = ["cestias displays surface emotions of frustration", "authority, a deep frown etched on his face as he reacts to the senators' derision. internally, he wrestles with feelings of exasperation", "a strong desire to uphold the senate's dignity in the face of chaos. he understands the implications of claudius's ascension", "feels a growing urgency to assert the senate's power amidst the absurdity.", "cestias displays surface emotions of frustration and authority", "a deep frown etched on his face as he reacts to the senators' derision. internally", "he wrestles with feelings of exasperation and a strong desire to uphold the senate's dignity in the face of chaos. he understands the implications of claudius's ascension and feels a growing urgency to assert the senate's power amidst the absurdity."],
        ap.active_plans = ["To command the senators' attention and refocus the discussion on the implications of Claudius's proclamation.", "To assert the Senate's authority over the situation and discourage the mockery of Claudius's name.", "To prepare the Senate to confront the Praetorian Guard's actions and strategize a response."],
        ap.beliefs = ["The Senate must retain its dignity and authority in the face of autocratic rule.", "Claudius's ascension is an affront to the principles of republican governance.", "The Praetorian Guard's power must be challenged to prevent further erosion of senatorial influence."],
        ap.goals = ["Short-term: To restore order and seriousness to the Senate's proceedings regarding Claudius's unexpected rise.", "Medium-term: To galvanize the Senate into action against the Praetorian Guard's influence.", "Ultimate: To reclaim the Senate's power and restore a functioning Republic free from imperial tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Perched uncomfortably on a makeshift throne, Claudius is a picture of disarray. Sweat beads on his brow as he fidgets, his body language screaming rejection of the imperial mantle thrust upon him. He pointedly refuses the offered wine, waving away the guard\'s attempts at joviality. Every gesture, every twitch, underscores his deep-seated wish to be anywhere but in this gilded cage, burdened by a power he vehemently denies wanting.',
        ap.emotional_state = 'Beneath a veneer of outward agitation and vocal denial, Claudius is a maelstrom of conflicting emotions. Disbelief wars with a rising tide of fear, the sheer absurdity of his elevation battling his ingrained republican ideals. He is trapped, a scholar forced onto a stage of brutal political theatre. His stammer, usually a mark of his scholarly nature, now amplifies his protestations, revealing a raw vulnerability beneath the unwelcome purple. He yearns for the quietude of his books, far from this suffocating grandeur.',
        ap.emotional_tags = ["beneath a veneer of outward agitation", "vocal denial, claudius is a maelstrom of conflicting emotions. disbelief wars with a rising tide of fear, the sheer absurdity of his elevation battling his ingrained republican ideals. he is trapped, a scholar forced onto a stage of brutal political theatre. his stammer, usually a mark of his scholarly nature, now amplifies his protestations, revealing a raw vulnerability beneath the unwelcome purple. he yearns for the quietude of his books, far from this suffocating grandeur.", "beneath a veneer of outward agitation and vocal denial", "claudius is a maelstrom of conflicting emotions. disbelief wars with a rising tide of fear", "the sheer absurdity of his elevation battling his ingrained republican ideals. he is trapped", "a scholar forced onto a stage of brutal political theatre. his stammer", "usually a mark of his scholarly nature", "now amplifies his protestations", "revealing a raw vulnerability beneath the unwelcome purple. he yearns for the quietude of his books", "far from this suffocating grandeur."],
        ap.active_plans = ["Verbally reject the title 'Emperor' and all associated honors.", "Physically distance himself from the symbols of imperial power, like refusing wine offered as a gesture of respect.", "Express his unwavering belief in the Republic, hoping to sway those around him and perhaps find a way out of his unwanted emperorship."],
        ap.beliefs = ["The Roman Republic represents a more just and desirable form of governance than an autocratic Empire.", "He is fundamentally unsuited and unwilling to rule as Emperor, lacking the temperament and ambition for such a role.", "Personal desires and scholarly pursuits are far more valuable than the corrupting allure of political power."],
        ap.goals = ["short_term\": \"To make it unequivocally clear to the Praetorian Guard and anyone within earshot that he does not accept or desire the position of Emperor.", "medium_term\": \"To find a way to relinquish the unwanted power and return Rome to a Republican system, or at least a form of shared governance with the Senate.", "ultimate\": \"To escape the treacherous world of Roman politics entirely and retreat to a life dedicated to scholarship and intellectual pursuits, far from the dangers and moral compromises of imperial rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Gratus, a robust figure of the Praetorian Guard, stands close to Claudius, a wine cup in hand. He attempts to inject a note of levity into the tense atmosphere, offering wine with a casual air and then helping himself when refused. His stance is relaxed, his tone conversational, yet his presence is a constant, solid reminder of the force compelling Claudius to this unwanted throne.',
        ap.emotional_state = 'Gratus exudes a surface joviality, a soldier\'s attempt to make light of a peculiar situation. He\'s amused by Claudius\'s staunch rejection of power, finding it an anomaly in his experience. Beneath this outward ease, there\'s a hint of professional pragmatism and perhaps a touch of impatience with Claudius\'s \'awkwardness\'. He\'s a man of action, accustomed to orders and clear hierarchies, and Claudius\'s philosophical objections are likely baffling and slightly irksome to him. He is motivated by duty and a simple understanding of power dynamics.',
        ap.emotional_tags = ["gratus exudes a surface joviality, a soldier's attempt to make light of a peculiar situation. he's amused by claudius's staunch rejection of power, finding it an anomaly in his experience. beneath this outward ease, there's a hint of professional pragmatism", "perhaps a touch of impatience with claudius's 'awkwardness'. he's a man of action, accustomed to orders", "clear hierarchies,", "claudius's philosophical objections are likely baffling", "slightly irksome to him. he is motivated by duty", "a simple understanding of power dynamics.", "gratus exudes a surface joviality", "a soldier's attempt to make light of a peculiar situation. he's amused by claudius's staunch rejection of power", "finding it an anomaly in his experience. beneath this outward ease", "there's a hint of professional pragmatism and perhaps a touch of impatience with claudius's 'awkwardness'. he's a man of action", "accustomed to orders and clear hierarchies", "and claudius's philosophical objections are likely baffling and slightly irksome to him. he is motivated by duty and a simple understanding of power dynamics."],
        ap.active_plans = ["Offer wine to Claudius as a gesture of camaraderie, hoping to ease tension and encourage acceptance.", "Employ humor and lighthearted banter to normalize the situation and make Claudius feel more comfortable with his new role.", "Reassure Claudius that he is not a prisoner, but the Emperor, reinforcing the Praetorian Guard's decision and the supposed legitimacy of his rule."],
        ap.beliefs = ["The Praetorian Guard's decree is law, and Claudius's appointment as Emperor is a fait accompli that must be accepted.", "Claudius's reluctance is an unusual, perhaps even humorous, quirk, but ultimately inconsequential to the established reality.", "A bit of wine and good-natured persuasion can smooth over most difficulties and encourage compliance."],
        ap.goals = ["short_term\": \"To get Claudius to drink and relax, making him more amenable to accepting his role.", "medium_term\": \"To ensure Claudius's outward acceptance of the Emperor title, thus solidifying the Praetorian Guard's authority and maintaining order.", "ultimate\": \"To uphold the stability of Rome and the Praetorian Guard's position as kingmakers by securing a functioning Emperor, regardless of Claudius's personal desires."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits awkwardly on a makeshift throne, his body language tense and disheveled. He sweats profusely, fidgeting in his seat as he engages with Gratus and Rufrius, conveying his discomfort with their banter and the monumental expectations placed upon him.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect anxiety and reluctance; his stammer surfaces as he grapples with the absurdity of his situation. Internally, he wrestles with feelings of inadequacy and the heavy burden of responsibility that conflicts with his desire for a republic. The tension between his scholarly ideals and the harsh reality of his newfound role creates a profound sense of internal conflict.',
        ap.emotional_tags = ["claudius's surface emotions reflect anxiety", "reluctance; his stammer surfaces as he grapples with the absurdity of his situation. internally, he wrestles with feelings of inadequacy", "the heavy burden of responsibility that conflicts with his desire for a republic. the tension between his scholarly ideals", "the harsh reality of his newfound role creates a profound sense of internal conflict.", "claudius's surface emotions reflect anxiety and reluctance; his stammer surfaces as he grapples with the absurdity of his situation. internally", "he wrestles with feelings of inadequacy and the heavy burden of responsibility that conflicts with his desire for a republic. the tension between his scholarly ideals and the harsh reality of his newfound role creates a profound sense of internal conflict.", "claudius's surface emotions reflect anxiety and reluctance", "his stammer surfaces as he grapples with the absurdity of his situation. internally, he wrestles with feelings of inadequacy and the heavy burden of responsibility that conflicts with his desire for a republic. the tension between his scholarly ideals and the harsh reality of his newfound role creates a profound sense of internal conflict."],
        ap.active_plans = ["To assert his desire for a republic and resist the pressure to embrace the imperial role.", "To navigate the dangers posed by the Senate and the political machinations surrounding his ascension to power.", "To protect himself and his family from the threats looming over the imperial family after Caligula's assassination."],
        ap.beliefs = ["A firm belief in the principles of a republic over imperial rule.", "The conviction that relinquishing power to the Senate would lead to chaos and civil war.", "A strong desire to safeguard his family's legacy and life amidst the treachery of Roman politics."],
        ap.goals = ["Short-term: To maintain his safety and that of his family in the face of political turmoil.", "Medium-term: To navigate the Senate's demands while upholding his ideals of governance.", "Ultimate: To transform Rome into a more stable republic, free from tyranny and bloodshed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Herod enters the chamber with an air of confidence, immediately commanding attention. He stands tall, radiating authority as he addresses Claudius, assessing the underlying tensions in the room. His posture is assertive, and his demeanor is calculated, suggesting he is in control of the situation.',
        ap.emotional_state = 'Herod\'s surface emotions display confidence and reassurance as he congratulates Claudius. Underneath, however, lies a shrewd awareness of the precariousness of Claudius\'s position as emperor. He feels a sense of urgency to convince Claudius to embrace his role, recognizing the significant implications for both of them in the turbulent political landscape.',
        ap.emotional_tags = ["herod's surface emotions display confidence", "reassurance as he congratulates claudius. underneath, however, lies a shrewd awareness of the precariousness of claudius's position as emperor. he feels a sense of urgency to convince claudius to embrace his role, recognizing the significant implications for both of them in the turbulent political landscape.", "herod's surface emotions display confidence and reassurance as he congratulates claudius. underneath", "however", "lies a shrewd awareness of the precariousness of claudius's position as emperor. he feels a sense of urgency to convince claudius to embrace his role", "recognizing the significant implications for both of them in the turbulent political landscape."],
        ap.active_plans = ["To persuade Claudius to fully accept his role as Emperor and reject the allure of republican ideals.", "To alert Claudius about the dangers posed by the Senate and potential threats to his life.", "To position himself as a trusted advisor in the shifting power dynamics of Rome, ensuring his own safety and influence."],
        ap.beliefs = ["The conviction that power must be embraced and wielded decisively to prevent chaos.", "A pragmatic understanding that the Senate is filled with ambition and treachery, requiring strong leadership.", "The belief that survival in the political sphere necessitates ruthless pragmatism and the dismissal of outdated ideals."],
        ap.goals = ["Short-term: To maintain his influence and position within the court while advising Claudius.", "Medium-term: To prevent civil unrest by ensuring Claudius acts decisively as Emperor.", "Ultimate: To solidify his own power and status within the Roman Empire, leveraging his relationship with Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits awkwardly upon the makeshift throne, his discomfort evident in his slumped posture and sweating brow. He is in the midst of a conversation with Herod, leaning forward slightly, his gaze fixed on the King as he absorbs the shocking news being delivered.  His initial reluctance to engage with the imperial proceedings is momentarily forgotten as the gravity of Herod\'s words sinks in.',
        ap.emotional_state = 'Initially resistant and self-deprecating, Claudius is plunged into shock and horror by Herod\'s revelation. His surface emotions shift from annoyance at being hailed Emperor to disbelief and then fear. Internally, a profound sense of vulnerability takes root as he grapples with the brutal reality of Roman politics and the very real danger to himself and his family. The news shatters his naive hope of a peaceful transition, forcing him to confront the life-or-death stakes.',
        ap.emotional_tags = ["initially resistant", "self-deprecating, claudius is plunged into shock", "horror by herod's revelation. his surface emotions shift from annoyance at being hailed emperor to disbelief", "then fear. internally, a profound sense of vulnerability takes root as he grapples with the brutal reality of roman politics", "the very real danger to himself", "his family. the news shatters his naive hope of a peaceful transition, forcing him to confront the life-or-death stakes.", "initially resistant and self-deprecating", "claudius is plunged into shock and horror by herod's revelation. his surface emotions shift from annoyance at being hailed emperor to disbelief and then fear. internally", "a profound sense of vulnerability takes root as he grapples with the brutal reality of roman politics and the very real danger to himself and his family. the news shatters his naive hope of a peaceful transition", "forcing him to confront the life-or-death stakes."],
        ap.active_plans = ["To understand the full implications of Herod's warning and verify the information about Caesonia and her child.", "To assess the immediate danger to himself and Messalina.", "To re-evaluate his desire to relinquish power to the Senate in light of this new threat, potentially shifting towards self-preservation."],
        ap.beliefs = ["Initially believes in the possibility of a return to a Republican system, or at least a less autocratic rule.", "Believes in the inherent justice and order of the Roman system, now challenged by the blatant assassinations.", "Holds a degree of naivete about the true nature of power and political violence, which is rapidly being eroded."],
        ap.goals = ["Short-term: To ascertain the truth of Herod's claims and the extent of the threat.", "Medium-term: To ensure the safety of Messalina and himself.", "Ultimate:  To navigate this crisis in a way that minimizes bloodshed and potentially allows him to return to a life of scholarship, though this goal is increasingly distant."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Herod stands before Claudius with an air of controlled urgency, his posture confident and his gaze direct. He speaks with measured gravity, ensuring his words carry the weight of their grim message.  He uses persuasive and direct language, leaning in to emphasize the danger and the necessity of Claudius accepting his new role.',
        ap.emotional_state = 'Herod presents a facade of pragmatic concern, masking a deeper calculation. Outwardly, he expresses worry for Claudius\'s safety and the stability of Rome.  Internally, he is likely driven by self-interest, understanding that a stable Rome under Claudius is beneficial to his own kingdom. He likely feels a degree of cynicism towards Claudius\'s idealistic views, seeing them as naive and dangerous in the current climate. There\'s an undercurrent of strategic manipulation in his \'advice\'.',
        ap.emotional_tags = ["herod presents a facade of pragmatic concern, masking a deeper calculation. outwardly, he expresses worry for claudius's safety", "the stability of rome.  internally, he is likely driven by self-interest, understanding that a stable rome under claudius is beneficial to his own kingdom. he likely feels a degree of cynicism towards claudius's idealistic views, seeing them as naive", "dangerous in the current climate. there's an undercurrent of strategic manipulation in his 'advice'.", "herod presents a facade of pragmatic concern", "masking a deeper calculation. outwardly", "he expresses worry for claudius's safety and the stability of rome.  internally", "he is likely driven by self-interest", "understanding that a stable rome under claudius is beneficial to his own kingdom. he likely feels a degree of cynicism towards claudius's idealistic views", "seeing them as naive and dangerous in the current climate. there's an undercurrent of strategic manipulation in his 'advice'."],
        ap.active_plans = ["To shock Claudius into recognizing the immediate danger he faces and the futility of relinquishing power.", "To persuade Claudius to accept the role of Emperor as the only path to survival, both for himself and potentially for Rome's stability.", "To solidify his position as a trusted advisor by providing crucial, albeit brutal, information and guidance during this crisis."],
        ap.beliefs = ["Believes in the brutal realities of power and the necessity of decisive action in a chaotic political landscape.", "Believes that the Republic is no longer viable and that strong imperial rule is necessary for Rome's survival.", "Believes in self-preservation and strategic alliances as the keys to navigating treacherous political waters."],
        ap.goals = ["Short-term: To deliver the warning effectively and ensure Claudius understands the stakes.", "Medium-term: To establish a strong advisory relationship with Claudius, influencing his decisions and securing his own position.", "Ultimate: To maintain stability in Rome, which indirectly protects his own kingdom, and to enhance his own power and influence within the Roman sphere."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits awkwardly on a makeshift throne, visibly disheveled and sweating profusely. His posture is tense, as he tries to assert himself against the intimidating presence of the guards around him. He gestures defensively when confronted about his title, his discomfort palpable.',
        ap.emotional_state = 'Claudius exhibits a blend of irritation and anxiety, struggling to assert his identity against the overwhelming pressure of being proclaimed Emperor. Externally, he expresses defiance through his dismissive comments, yet internally, he grapples with feelings of inadequacy and the fear of the political machinations surrounding him. There\'s a stark contrast between his desire for a Republic and the reality he faces.',
        ap.emotional_tags = ["claudius exhibits a blend of irritation", "anxiety, struggling to assert his identity against the overwhelming pressure of being proclaimed emperor. externally, he expresses defiance through his dismissive comments, yet internally, he grapples with feelings of inadequacy", "the fear of the political machinations surrounding him. there's a stark contrast between his desire for a republic", "the reality he faces.", "claudius exhibits a blend of irritation and anxiety", "struggling to assert his identity against the overwhelming pressure of being proclaimed emperor. externally", "he expresses defiance through his dismissive comments", "yet internally", "he grapples with feelings of inadequacy and the fear of the political machinations surrounding him. there's a stark contrast between his desire for a republic and the reality he faces."],
        ap.active_plans = ["To refuse the title and the responsibilities it imposes, maintaining his stance on the Republic.", "To navigate the Senate's demands without compromising his ideals.", "To seek a way to escape the immediate pressures of imperial power while retaining some semblance of control."],
        ap.beliefs = ["A firm belief in the value of the Republic and the dangers of imperial rule.", "The conviction that his ascension is an aberration that does not reflect true leadership.", "A distrust of the Senate and those who seek power for their own gain."],
        ap.goals = ["Short-term: To avoid immediate engagement with the Senate and their demands.", "Medium-term: To find a way to restore some element of Republican governance.", "Ultimate: To protect his family and himself from the dangers associated with being Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Rufrius stands nearby, pacing assertively, embodying the physicality of the Praetorian Guard. His presence is commanding, and he speaks with authority, actively participating in the dialogue and dismissing the Senate\'s envoys as he protects Claudius\'s position.',
        ap.emotional_state = 'Rufrius demonstrates a resolute and aggressive demeanor. He exudes confidence in his role as protector, but there’s an underlying tension as he grapples with the precarious nature of Claudius\'s rule and the potential chaos that could erupt from the Senate\'s insistence. His loyalty to the Emperor is tempered by the reality of the political landscape.',
        ap.emotional_tags = ["rufrius demonstrates a resolute", "aggressive demeanor. he exudes confidence in his role as protector, but there\u2019s an underlying tension as he grapples with the precarious nature of claudius's rule", "the potential chaos that could erupt from the senate's insistence. his loyalty to the emperor is tempered by the reality of the political landscape.", "rufrius demonstrates a resolute and aggressive demeanor. he exudes confidence in his role as protector", "but there\u2019s an underlying tension as he grapples with the precarious nature of claudius's rule and the potential chaos that could erupt from the senate's insistence. his loyalty to the emperor is tempered by the reality of the political landscape.", "rufrius demonstrates a resolute and aggressive demeanor. he exudes confidence in his role as protector,", "there\u2019s an underlying tension as he grapples with the precarious nature of claudius's rule and the potential chaos that could erupt from the senate's insistence. his loyalty to the emperor is tempered by the reality of the political landscape."],
        ap.active_plans = ["To maintain control over the situation and protect Claudius from the Senate's demands.", "To assert the Praetorian Guard's influence and authority in the palace.", "To dismiss any threats to Claudius's power, ensuring the Emperor's safety."],
        ap.beliefs = ["A strong belief in the necessity of a strong leader to prevent chaos, which he sees Claudius as failing to embody.", "The conviction that the Senate is filled with self-serving individuals who threaten the stability of Rome.", "A loyalty to the Praetorian Guard and its role as enforcers of imperial authority."],
        ap.goals = ["Short-term: To ensure Claudius remains in power and is not overrun by the Senate's influence.", "Medium-term: To stabilize Claudius's rule by asserting the Guard's power.", "Ultimate: To secure a position for the Praetorian Guard in the new imperial order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius stands before the assembled Senators in the grand Reception Hall of the Imperial Palace, his posture a mix of forced authority and underlying discomfort. He addresses them directly, his voice, though still marked by his stammer, resonating with newfound firmness. He gestures calmly as he speaks, attempting to project an image of control despite the palpable tension in the room, meeting their accusations with a surprising blend of humility and sharp wit.',
        ap.emotional_state = 'Beneath a veneer of imperial composure, Claudius is a cauldron of conflicting emotions. Outwardly, he displays a wry amusement and intellectual confidence, effectively parrying the Senators\' attacks with clever retorts. However, his self-deprecating remarks and later confession of feeling like a \'fraud\' to Herod reveal a deep-seated insecurity and reluctance about his position. He is torn between the imposed role of Emperor and his own scholarly inclinations, masking his inner turmoil with a facade of pragmatic acceptance.',
        ap.emotional_tags = ["beneath a veneer of imperial composure, claudius is a cauldron of conflicting emotions. outwardly, he displays a wry amusement", "intellectual confidence, effectively parrying the senators' attacks with clever retorts. however, his self-deprecating remarks", "later confession of feeling like a 'fraud' to herod reveal a deep-seated insecurity", "reluctance about his position. he is torn between the imposed role of emperor", "his own scholarly inclinations, masking his inner turmoil with a facade of pragmatic acceptance.", "beneath a veneer of imperial composure", "claudius is a cauldron of conflicting emotions. outwardly", "he displays a wry amusement and intellectual confidence", "effectively parrying the senators' attacks with clever retorts. however", "his self-deprecating remarks and later confession of feeling like a 'fraud' to herod reveal a deep-seated insecurity and reluctance about his position. he is torn between the imposed role of emperor and his own scholarly inclinations", "masking his inner turmoil with a facade of pragmatic acceptance."],
        ap.active_plans = ["Establish a semblance of authority and control over the hostile Senate.", "Disarm the Senators' opposition through a display of intellectual superiority and self-awareness.", "Navigate the immediate crisis without resorting to brute force, seeking a fragile truce based on pragmatism."],
        ap.beliefs = ["He believes he is fundamentally unsuited and unwilling to be Emperor, yet accepts his imposed fate.", "He believes the Senate's outrage is hypocritical, given their own history and actions.", "He believes intellectual agility and pragmatism are his best tools to manage the political chaos."],
        ap.goals = ["{short_term: Survive the immediate challenge from the Senate and prevent open rebellion., medium_term: Gain grudging acceptance from the Senate, or at least neutralize their active opposition, establishing a working relationship., ultimate: Maintain order and stability in Rome, fulfilling his duty as Emperor despite his personal reservations and feelings of inadequacy.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Senator Marcus stands amidst his peers, his posture rigid with indignation as he confronts Claudius. He speaks with firm resolve, articulating the Senate\'s constitutional objections to Claudius\'s ascension. He maintains direct eye contact with Claudius, his voice clear and unwavering as he challenges the Emperor\'s legitimacy, embodying the Senate\'s formal and legalistic opposition.',
        ap.emotional_state = 'Marcus is driven by a deep sense of principled outrage and constitutional righteousness. He is outwardly assertive and unwavering, expressing the Senate\'s discontent with resolute conviction. Beneath this surface, there is likely a simmering frustration and anger at the Praetorian Guard\'s overreach and Claudius\'s acceptance of power outside of traditional senatorial appointment. He feels a strong sense of duty to uphold Roman law and tradition, viewing Claudius\'s emperorship as an affront to the Republic\'s foundations.',
        ap.emotional_tags = ["marcus is driven by a deep sense of principled outrage", "constitutional righteousness. he is outwardly assertive", "unwavering, expressing the senate's discontent with resolute conviction. beneath this surface, there is likely a simmering frustration", "anger at the praetorian guard's overreach", "claudius's acceptance of power outside of traditional senatorial appointment. he feels a strong sense of duty to uphold roman law", "tradition, viewing claudius's emperorship as an affront to the republic's foundations.", "marcus is driven by a deep sense of principled outrage and constitutional righteousness. he is outwardly assertive and unwavering", "expressing the senate's discontent with resolute conviction. beneath this surface", "there is likely a simmering frustration and anger at the praetorian guard's overreach and claudius's acceptance of power outside of traditional senatorial appointment. he feels a strong sense of duty to uphold roman law and tradition", "viewing claudius's emperorship as an affront to the republic's foundations."],
        ap.active_plans = ["Challenge Claudius's legitimacy based on constitutional principles and established Roman law.", "Assert the Senate's exclusive right to appoint an Emperor, rejecting military intervention in political succession.", "Undermine Claudius's perceived authority and garner support among fellow Senators to resist his rule."],
        ap.beliefs = ["He firmly believes in the supremacy of the Roman constitution and the Senate's authority as its guardian.", "He believes Claudius's appointment by the Praetorian Guard is a blatant violation of Roman law and tradition.", "He believes the Senate must stand firm against military overreach and uphold the principles of the Republic."],
        ap.goals = ["{short_term: Voice the Senate's formal protest and legal objections to Claudius's claim to the throne., medium_term: Persuade Claudius to acknowledge the Senate's authority and potentially negotiate a more constitutionally sound arrangement, or even step aside., ultimate: Restore the traditional power of the Senate and ensure future imperial successions adhere to constitutional norms, safeguarding the Republic's foundations.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Senator Cestias stands firmly in the senatorial ranks, his demeanor conveying a controlled disdain as he addresses Claudius. He delivers pointed criticisms regarding Claudius\'s perceived inadequacies—his hearing, speech, and lack of experience—his posture stiff and formal, reflecting the Senate\'s collective disapproval. He acts as a direct and unwavering voice of senatorial skepticism.',
        ap.emotional_state = 'Cestias is imbued with a sense of senatorial superiority and contempt for Claudius. He outwardly expresses dismissive skepticism, his tone sharp and critical, reflecting a deep-seated underestimation of Claudius\'s capabilities. He likely feels secure in his judgment, believing Claudius is demonstrably unfit for rule. Beneath the surface, there is a cold certainty and a lack of empathy, viewing Claudius as a weak and laughable figure undeserving of the imperial mantle.',
        ap.emotional_tags = ["cestias is imbued with a sense of senatorial superiority", "contempt for claudius. he outwardly expresses dismissive skepticism, his tone sharp", "critical, reflecting a deep-seated underestimation of claudius's capabilities. he likely feels secure in his judgment, believing claudius is demonstrably unfit for rule. beneath the surface, there is a cold certainty", "a lack of empathy, viewing claudius as a weak", "laughable figure undeserving of the imperial mantle.", "cestias is imbued with a sense of senatorial superiority and contempt for claudius. he outwardly expresses dismissive skepticism", "his tone sharp and critical", "reflecting a deep-seated underestimation of claudius's capabilities. he likely feels secure in his judgment", "believing claudius is demonstrably unfit for rule. beneath the surface", "there is a cold certainty and a lack of empathy", "viewing claudius as a weak and laughable figure undeserving of the imperial mantle."],
        ap.active_plans = ["Articulate specific criticisms targeting Claudius's perceived physical and intellectual shortcomings to undermine his credibility.", "Reinforce the Senate's narrative of Claudius's unfitness for leadership, swaying wavering Senators and public opinion.", "Contribute to a collective senatorial pressure campaign aimed at forcing Claudius to concede or abdicate."],
        ap.beliefs = ["He believes physical and communicative abilities are essential prerequisites for effective imperial leadership.", "He believes Claudius's perceived disabilities and lack of governmental experience fundamentally disqualify him from ruling.", "He believes the Senate, composed of experienced statesmen, is inherently more qualified to govern than an 'unfit' individual like Claudius."],
        ap.goals = ["{short_term: Publicly voice the Senate's detailed concerns about Claudius's fitness, aiming to weaken his initial authority., medium_term: Persuade Claudius and the Praetorian Guard that his rule is untenable due to his perceived incapacities and senatorial opposition., ultimate: Replace Claudius with a figure deemed more competent and acceptable by the Senate, restoring senatorial influence and control over imperial selection.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Senator Asprenas stands forward, his posture aggressively confrontational as he directly addresses Claudius. He delivers blunt and insulting remarks, questioning Claudius\'s fitness to rule and drawing a harsh comparison to the reviled Caligula. His tone is dismissive and scornful, his gestures sharp, embodying the most extreme and openly contemptuous faction within the Senate.',
        ap.emotional_state = 'Asprenas is consumed by outright contempt and disdain for Claudius, his outward demeanor radiating scorn and disrespect. He is emotionally charged, driven by a visceral rejection of Claudius as Emperor. Beneath the surface, there is a raw anger and a sense of outrage that such a figure could be elevated to power. He sees Claudius as a pathetic joke and is unafraid to express his revulsion directly and aggressively, seeking to wound and belittle him publicly.',
        ap.emotional_tags = ["asprenas is consumed by outright contempt", "disdain for claudius, his outward demeanor radiating scorn", "disrespect. he is emotionally charged, driven by a visceral rejection of claudius as emperor. beneath the surface, there is a raw anger", "a sense of outrage that such a figure could be elevated to power. he sees claudius as a pathetic joke", "is unafraid to express his revulsion directly", "aggressively, seeking to wound", "belittle him publicly.", "asprenas is consumed by outright contempt and disdain for claudius", "his outward demeanor radiating scorn and disrespect. he is emotionally charged", "driven by a visceral rejection of claudius as emperor. beneath the surface", "there is a raw anger and a sense of outrage that such a figure could be elevated to power. he sees claudius as a pathetic joke and is unafraid to express his revulsion directly and aggressively", "seeking to wound and belittle him publicly."],
        ap.active_plans = ["Deliver the most cutting and insulting criticisms possible, aiming to provoke Claudius and shatter any illusion of imperial authority.", "Publicly humiliate Claudius in front of the Senate, demonstrating the depth of senatorial contempt and encouraging bolder opposition.", "Radicalize senatorial opposition by pushing for immediate and forceful action against Claudius, rejecting any compromise or negotiation."],
        ap.beliefs = ["He believes Claudius is not only incompetent but also utterly ridiculous and unworthy of any respect.", "He believes Claudius's rule is a direct insult to the dignity of Rome and no better than the tyranny of Caligula.", "He believes only direct, aggressive confrontation can effectively dislodge Claudius and restore a semblance of order and respect to the Empire."],
        ap.goals = ["{short_term: Express his absolute contempt for Claudius in the most publicly humiliating manner., medium_term: Incite a stronger, more aggressive senatorial stance against Claudius, pushing for immediate deposition and rejection., ultimate: Overthrow Claudius and replace him with a leader he deems worthy, or ideally, restore the Republic, purging the imperial stain from Roman governance.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_vinicius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Senator Vinicius remains a more reserved figure among the assembled Senators, his physical presence less overtly confrontational than Marcus, Cestias, or Asprenas. He stands silently, observing the exchange between Claudius and his outspoken colleagues. His stillness suggests a posture of careful assessment rather than direct challenge, his gaze likely fixed on Claudius, analyzing the Emperor\'s responses and demeanor.',
        ap.emotional_state = 'Vinicius embodies a more cautious and calculating emotional state compared to the overtly hostile Senators. His silence suggests a degree of internal reservation and strategic observation. He is likely experiencing a mix of skepticism towards Claudius\'s legitimacy and a prudent wariness of openly confronting the newly proclaimed Emperor. Beneath his composed exterior, there may be a careful evaluation of the political landscape, weighing the risks and benefits of different courses of action, and a reluctance to commit prematurely to a definitive stance.',
        ap.emotional_tags = ["vinicius embodies a more cautious", "calculating emotional state compared to the overtly hostile senators. his silence suggests a degree of internal reservation", "strategic observation. he is likely experiencing a mix of skepticism towards claudius's legitimacy", "a prudent wariness of openly confronting the newly proclaimed emperor. beneath his composed exterior, there may be a careful evaluation of the political landscape, weighing the risks", "benefits of different courses of action,", "a reluctance to commit prematurely to a definitive stance.", "vinicius embodies a more cautious and calculating emotional state compared to the overtly hostile senators. his silence suggests a degree of internal reservation and strategic observation. he is likely experiencing a mix of skepticism towards claudius's legitimacy and a prudent wariness of openly confronting the newly proclaimed emperor. beneath his composed exterior", "there may be a careful evaluation of the political landscape", "weighing the risks and benefits of different courses of action", "and a reluctance to commit prematurely to a definitive stance."],
        ap.active_plans = ["Primarily observe and analyze the unfolding confrontation between Claudius and the Senate's vocal opposition.", "Assess Claudius's character, intellect, and leadership potential based on his responses to senatorial challenges.", "Gauge the overall level of senatorial unity and resolve in opposing Claudius, identifying potential allies and gauging the strength of resistance."],
        ap.beliefs = ["He likely believes the Senate should maintain a significant role in imperial affairs and be wary of autocratic power.", "He is probably uncertain about Claudius's suitability as Emperor and remains open to being convinced or further dissuaded.", "He believes in careful deliberation and strategic action, prioritizing informed decisions over rash emotional responses in political matters."],
        ap.goals = ["{short_term: Gather comprehensive information about Claudius and the Senate's dynamics during this critical encounter., medium_term: Formulate a well-considered strategy based on his observations, aligning himself with the most prudent and effective course of action for Rome's stability and the Senate's influence., ultimate: Promote stable and effective governance in Rome, whether under Claudius or another leader, while safeguarding the Senate's position and influence within the imperial structure.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the grand Reception Hall, visibly overwhelmed yet determined. His posture is tense, his hands fidgeting with uncertainty as he addresses the Senators. Despite his stammer, his voice carries a newfound assertiveness as he challenges their accusations, revealing both vulnerability and strength.',
        ap.emotional_state = 'Claudius exhibits a complex emotional landscape. Outwardly, he shows signs of determination mixed with self-doubt, his stutter betraying his internal struggle. Deep down, he feels fraudulent and burdened by the weight of expectations, grappling with the fear of inadequacy in a role he never sought. His vulnerability is laid bare as he confronts the implications of his newfound position.',
        ap.emotional_tags = ["claudius exhibits a complex emotional landscape. outwardly, he shows signs of determination mixed with self-doubt, his stutter betraying his internal struggle. deep down, he feels fraudulent", "burdened by the weight of expectations, grappling with the fear of inadequacy in a role he never sought. his vulnerability is laid bare as he confronts the implications of his newfound position.", "claudius exhibits a complex emotional landscape. outwardly", "he shows signs of determination mixed with self-doubt", "his stutter betraying his internal struggle. deep down", "he feels fraudulent and burdened by the weight of expectations", "grappling with the fear of inadequacy in a role he never sought. his vulnerability is laid bare as he confronts the implications of his newfound position."],
        ap.active_plans = ["To assert his authority as Emperor despite the Senators' objections.", "To convince the Senators of his legitimacy and capability to rule.", "To navigate the treacherous political landscape while maintaining his integrity."],
        ap.beliefs = ["Authority should derive from the will of the people, even amidst chaos.", "Experience and observation can provide true wisdom beyond formal training.", "Survival in the political arena requires both honesty and cunning."],
        ap.goals = ["Short-term: To establish himself as a legitimate Emperor in front of the Senate.", "Medium-term: To gain the Senators' trust and support for his rule.", "Ultimate: To secure the stability of the Empire and protect his family from political fallout."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Herod approaches Claudius with a calm demeanor, his posture relaxed yet commanding. He reassures Claudius about his performance, embodying the pragmatic advisor. His gestures are subtle, reflecting confidence as he navigates the tense atmosphere, attempting to instill a sense of purpose within the Emperor.',
        ap.emotional_state = 'Herod displays a facade of calm assurance, masking the sharp awareness of the political treachery surrounding them. Internally, he remains calculating and observant, recognizing the gravity of the situation while evaluating Claudius\'s responses. His motives are layered, aiming to ensure his own influence remains intact amidst the brewing chaos.',
        ap.emotional_tags = ["herod displays a facade of calm assurance, masking the sharp awareness of the political treachery surrounding them. internally, he remains calculating", "observant, recognizing the gravity of the situation while evaluating claudius's responses. his motives are layered, aiming to ensure his own influence remains intact amidst the brewing chaos.", "herod displays a facade of calm assurance", "masking the sharp awareness of the political treachery surrounding them. internally", "he remains calculating and observant", "recognizing the gravity of the situation while evaluating claudius's responses. his motives are layered", "aiming to ensure his own influence remains intact amidst the brewing chaos.", "herod displays a facade of calm assurance, masking the sharp awareness of the political treachery surrounding them. internally, he remains calculating and observant, recognizing the gravity of the situation", "evaluating claudius's responses. his motives are layered, aiming to ensure his own influence remains intact amidst the brewing chaos."],
        ap.active_plans = ["To provide Claudius with the reassurance he needs to face the Senate.", "To subtly guide Claudius towards making politically advantageous decisions.", "To maintain his position of influence by being a trusted advisor to the Emperor."],
        ap.beliefs = ["Power is best wielded through strategic counsel and manipulation.", "Survival in the political landscape requires adaptability and pragmatism.", "Loyalty is a fleeting concept in the realm of ambition."],
        ap.goals = ["Short-term: To boost Claudius's confidence and stabilize his rule.", "Medium-term: To position himself as an indispensable ally to Claudius.", "Ultimate: To ensure his own power remains unchallenged while steering Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Rufrius enters the hall with a grave demeanor, his posture rigid and authoritative. His presence commands immediate attention, and he delivers the news of Gaius Sabinus\'s suicide with a somber tone. His actions are deliberate, embodying the brutal efficiency of the Praetorian Guard as he stands as a sentinel of Claudius\'s power.',
        ap.emotional_state = 'Rufrius\'s emotional state is marked by a sense of duty and responsibility, yet tinged with the weight of the grim news he must convey. He remains focused and unyielding, reflecting the harsh realities of political power struggles. There is no room for doubt or fear in his demeanor, as he stands ready to enforce the Emperor\'s will.',
        ap.emotional_tags = ["rufrius's emotional state is marked by a sense of duty", "responsibility, yet tinged with the weight of the grim news he must convey. he remains focused", "unyielding, reflecting the harsh realities of political power struggles. there is no room for doubt or fear in his demeanor, as he stands ready to enforce the emperor's will.", "rufrius's emotional state is marked by a sense of duty and responsibility", "yet tinged with the weight of the grim news he must convey. he remains focused and unyielding", "reflecting the harsh realities of political power struggles. there is no room for doubt or fear in his demeanor", "as he stands ready to enforce the emperor's will."],
        ap.active_plans = ["To report the news of Gaius Sabinus's suicide to Claudius and the Senate.", "To reassure Claudius of the Praetorian Guard's loyalty and readiness to protect him.", "To prepare for the ensuing trials and executions of the conspirators involved."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, even amidst bloodshed.", "The ends justify the means when preserving authority.", "Power must be maintained through strength and decisive action."],
        ap.goals = ["Short-term: To convey the news of Sabinus\u2019s suicide efficiently and effectively.", "Medium-term: To reinforce the security and stability of Claudius's reign.", "Ultimate: To eliminate threats to the Emperor's power and ensure the Praetorian Guard's dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the grand Reception Hall, addressing the senators with a mix of emperor\'s authority and personal unease. He faces Cassius, who is brought before him under guard. Though his physical stance is upright, his stammer is pronounced, betraying an inner turmoil as he navigates this confrontation. He questions Cassius directly, seeking clarity on the brutal murders.',
        ap.emotional_state = 'Claudius outwardly projects a sense of imperial resolve, attempting to command respect from the senators and the defiant Cassius. However, beneath this facade, he feels like a \'fraud\', revealing deep-seated insecurity about his legitimacy. He is genuinely disturbed by the murders of Caesonia and her child, showcasing a moral core wrestling with the grim necessities of power. There\'s a palpable tension between his scholarly nature and the harsh realities of Roman leadership he must now embody.',
        ap.emotional_tags = ["claudius outwardly projects a sense of imperial resolve, attempting to command respect from the senators", "the defiant cassius. however, beneath this facade, he feels like a 'fraud', revealing deep-seated insecurity about his legitimacy. he is genuinely disturbed by the murders of caesonia", "her child, showcasing a moral core wrestling with the grim necessities of power. there's a palpable tension between his scholarly nature", "the harsh realities of roman leadership he must now embody.", "claudius outwardly projects a sense of imperial resolve", "attempting to command respect from the senators and the defiant cassius. however", "beneath this facade", "he feels like a 'fraud'", "revealing deep-seated insecurity about his legitimacy. he is genuinely disturbed by the murders of caesonia and her child", "showcasing a moral core wrestling with the grim necessities of power. there's a palpable tension between his scholarly nature and the harsh realities of roman leadership he must now embody."],
        ap.active_plans = ["Establish his authority as the new Emperor, despite his own doubts and the Senate's opposition.", "Uncover the full truth behind the conspiracy, particularly concerning the murders of Caesonia and her child.", "Determine a just course of action for Cassius, balancing his personal morality with the demands of imperial justice."],
        ap.beliefs = ["Justice should be served, especially for the innocent victims of violence.", "The Senate's criticisms are hypocritical, given their own history and actions.", "He is not naturally suited to be Emperor, but he has a duty to rule justly and fairly."],
        ap.goals = ["short-term\": \"To understand Cassius's motivations and the scope of the conspiracy.", "medium-term\": \"To establish order and a sense of justice in Rome, starting with the punishment of Caligula's assassins.", "ultimate\": \"To prove himself a capable and just Emperor, despite his initial reluctance and the circumstances of his ascension."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Cassius is brought before Claudius, held captive but unbroken. He stands defiantly, facing the new Emperor with a chillingly calm demeanor. He meets Claudius\'s questions with unwavering conviction, admitting his role in the assassination and asserting his republican ideals. Even when sentenced, his posture remains firm, his voice carrying curses and prophecies as he is dragged away.',
        ap.emotional_state = 'Cassius is overtly defiant and unrepentant, expressing no remorse for his actions, which he justifies as necessary for the Republic. Beneath this bravado, there is a sense of bitter resignation, acknowledging the likely failure of his republican ideals against the tide of imperial power. His chilling prophecy of future assassinations hints at a grim acceptance of the violent cycle of Roman politics. He is driven by a potent mix of ideological conviction and personal grievance, masking any fear with steely resolve.',
        ap.emotional_tags = ["cassius is overtly defiant", "unrepentant, expressing no remorse for his actions, which he justifies as necessary for the republic. beneath this bravado, there is a sense of bitter resignation, acknowledging the likely failure of his republican ideals against the tide of imperial power. his chilling prophecy of future assassinations hints at a grim acceptance of the violent cycle of roman politics. he is driven by a potent mix of ideological conviction", "personal grievance, masking any fear with steely resolve.", "cassius is overtly defiant and unrepentant", "expressing no remorse for his actions", "which he justifies as necessary for the republic. beneath this bravado", "there is a sense of bitter resignation", "acknowledging the likely failure of his republican ideals against the tide of imperial power. his chilling prophecy of future assassinations hints at a grim acceptance of the violent cycle of roman politics. he is driven by a potent mix of ideological conviction and personal grievance", "masking any fear with steely resolve."],
        ap.active_plans = ["Articulate and defend his republican ideals as the justification for his actions, even in the face of death.", "Challenge Claudius's legitimacy and warn him of the dangers inherent in imperial rule and the cycle of violence it perpetuates.", "Maintain his defiant stance to the end, refusing to beg for mercy or show any sign of regret."],
        ap.beliefs = ["Tyrannicide is justified when aimed at restoring the Republic and removing a tyrant.", "The Republic represents true Roman virtue and is superior to imperial rule.", "Claudius, like Caligula, is a threat to the Republic, regardless of his apparent mildness."],
        ap.goals = ["short-term\": \"To use his final moments to declare his republican convictions and challenge Claudius's authority.", "medium-term\": \"To serve as a martyr for the republican cause, even in defeat.", "ultimate\": \"(Unrealistic) To inspire a future resurgence of republicanism and the eventual downfall of the Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the gathered Senators, his posture a mix of determination and vulnerability. His stammer underscores his anxiety as he confronts their hostility. He gestures with a trembling hand, emphasizing his points with desperation, striving to assert his authority despite the overwhelming pressure of the moment.',
        ap.emotional_state = 'Claudius is overwhelmed but resolute, grappling with self-doubt as he faces the Senators\' scorn. Outwardly, he appears anxious, his stammer betraying his inner turmoil. Internally, he wrestles with the weight of his newfound power, feeling like an imposter while outwardly attempting to project strength and legitimacy. The conflict between his fears and the necessity of authority weighs heavily on him.',
        ap.emotional_tags = ["claudius is overwhelmed but resolute, grappling with self-doubt as he faces the senators' scorn. outwardly, he appears anxious, his stammer betraying his inner turmoil. internally, he wrestles with the weight of his newfound power, feeling like an imposter while outwardly attempting to project strength", "legitimacy. the conflict between his fears", "the necessity of authority weighs heavily on him.", "claudius is overwhelmed but resolute", "grappling with self-doubt as he faces the senators' scorn. outwardly", "he appears anxious", "his stammer betraying his inner turmoil. internally", "he wrestles with the weight of his newfound power", "feeling like an imposter while outwardly attempting to project strength and legitimacy. the conflict between his fears and the necessity of authority weighs heavily on him.", "claudius is overwhelmed but resolute, grappling with self-doubt as he faces the senators' scorn. outwardly, he appears anxious, his stammer betraying his inner turmoil. internally, he wrestles with the weight of his newfound power, feeling like an imposter", "outwardly attempting to project strength and legitimacy. the conflict between his fears and the necessity of authority weighs heavily on him.", "claudius is overwhelmed", "resolute, grappling with self-doubt as he faces the senators' scorn. outwardly, he appears anxious, his stammer betraying his inner turmoil. internally, he wrestles with the weight of his newfound power, feeling like an imposter while outwardly attempting to project strength and legitimacy. the conflict between his fears and the necessity of authority weighs heavily on him."],
        ap.active_plans = ["To assert his legitimacy as Emperor despite the Senators' objections.", "To navigate the political landscape carefully and maintain control over the Senate.", "To deliver a death sentence to Cassius Chaerea, marking his first decisive act of imperial authority."],
        ap.beliefs = ["The legitimacy of power must be acknowledged, even if it comes from violent means.", "Leadership requires tough decisions, including the condemnation of traitors.", "Survival in this political arena hinges on both cunning and assertiveness."],
        ap.goals = ["Short-term: To convince the Senators of his capability as Emperor.", "Medium-term: To establish his authority and prevent any immediate threats to his reign.", "Ultimate: To secure a stable and lasting rule over the Empire, maintaining order and reducing dissent."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Cassius stands defiant, unrepentant as he faces Claudius. His posture is rigid, exuding confidence and unwavering resolve despite the dire situation. His eyes are sharp, reflecting a mixture of contempt and conviction as he challenges Claudius\'s authority, fully aware of the consequences that loom.',
        ap.emotional_state = 'Cassius embodies a fierce defiance, projecting anger and disdain towards Claudius. Outwardly, he appears assured, his bold declarations reflecting a deep-seated belief in his cause. Internally, he feels justified in his actions for the sake of the Republic, yet his admission of guilt reveals a complex web of personal vengeance and ideological fervor. He faces the prospect of death with a chilling calmness.',
        ap.emotional_tags = ["cassius embodies a fierce defiance, projecting anger", "disdain towards claudius. outwardly, he appears assured, his bold declarations reflecting a deep-seated belief in his cause. internally, he feels justified in his actions for the sake of the republic, yet his admission of guilt reveals a complex web of personal vengeance", "ideological fervor. he faces the prospect of death with a chilling calmness.", "cassius embodies a fierce defiance", "projecting anger and disdain towards claudius. outwardly", "he appears assured", "his bold declarations reflecting a deep-seated belief in his cause. internally", "he feels justified in his actions for the sake of the republic", "yet his admission of guilt reveals a complex web of personal vengeance and ideological fervor. he faces the prospect of death with a chilling calmness."],
        ap.active_plans = ["To confront Claudius and assert that his actions were for the Republic.", "To provoke Claudius into a reaction that could undermine his authority.", "To reinforce his belief in the necessity of his actions, framing them as noble rather than malicious."],
        ap.beliefs = ["His actions, while violent, are justified in the name of restoring the Republic.", "The ends justify the means, even if it involves the murder of innocents.", "There is a moral obligation to act against tyranny, regardless of personal consequences."],
        ap.goals = ["Short-term: To assert his viewpoint on the Republic's needs and challenge Claudius's legitimacy.", "Medium-term: To incite further unrest against Claudius\u2019s rule.", "Ultimate: To inspire a return to republican ideals, even if it costs him his life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Rufrius enters the hall with a grave demeanor, a soldier\'s physicality etched into his presence. He stands alert, commanding attention as he delivers the dire news of Gaius Sabinus\'s death. His movements are decisive, embodying the weight of his role as a protector of Claudius\'s nascent rule.',
        ap.emotional_state = 'Rufrius exhibits a stoic resolve, his expression a mask of seriousness befitting the grim news he bears. Outwardly calm and collected, he feels the underlying tension of the room, sensing the precarious balance of power shifting with the execution of traitors. His dedication to Claudius\'s safety is unwavering, yet the brutality of the situation looms heavy over him.',
        ap.emotional_tags = ["rufrius exhibits a stoic resolve, his expression a mask of seriousness befitting the grim news he bears. outwardly calm", "collected, he feels the underlying tension of the room, sensing the precarious balance of power shifting with the execution of traitors. his dedication to claudius's safety is unwavering, yet the brutality of the situation looms heavy over him.", "rufrius exhibits a stoic resolve", "his expression a mask of seriousness befitting the grim news he bears. outwardly calm and collected", "he feels the underlying tension of the room", "sensing the precarious balance of power shifting with the execution of traitors. his dedication to claudius's safety is unwavering", "yet the brutality of the situation looms heavy over him."],
        ap.active_plans = ["To report the developments regarding Gaius Sabinus and the conspirators.", "To reassure Claudius of his security and the measures taken against potential threats.", "To maintain order and loyalty within the Praetorian Guard during this turbulent time."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, even in the face of adversity.", "The brutal execution of traitors serves as a necessary means to stabilize the Empire.", "Strength and decisiveness are essential for survival in the volatile political landscape."],
        ap.goals = ["Short-term: To keep Claudius informed and secure from any remaining threats.", "Medium-term: To uphold the authority of the Praetorian Guard and reinforce loyalty to Claudius.", "Ultimate: To ensure the stability of the Empire through unwavering support for the Emperor."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_infant_son_event_4_1'})
    ON CREATE SET
        oi.description = 'Caligula\'s infant son is physically held by Claudius and presented to the cheering crowd on the balcony. He acts as a visual symbol of continuity and legitimacy, linking Claudius\'s new regime to the previous imperial lineage. Claudius uses the infant to evoke positive emotions from the crowd and to project an image of paternal warmth and stability. Messalina views the infant more pragmatically, as a political pawn and a symbol of motherhood that she is willing to manage but not be defined by, as she prioritizes her political ambitions.',
        oi.status_before = 'The infant son is under the care of Claudius and Messalina within the Imperial Palace, having recently lost his father, Caligula, and mother, Caesonia, to political purges. His status is precarious, dependent on Claudius\'s favor and serving as a symbolic figurehead.',
        oi.status_after = 'The infant son remains in Claudius and Messalina\'s care within the palace. His public presentation has reinforced his symbolic role, further embedding him into the political narrative of Claudius\'s reign, albeit still as a largely passive figure whose future is determined by the adults around him and the ever-shifting tides of Roman politics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_infant_son'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands on the Imperial Palace balcony, cradling Caligula\'s infant son. He beams at the cheering crowd below, occasionally chuckling and cooing at the baby. He gestures to the crowd, clearly enjoying the adoration and the display of familial affection he projects. He speaks to Messalina with a mix of affection and slight defensiveness regarding his actions.',
        ap.emotional_state = 'Claudius is outwardly joyful and proud, basking in the crowd\'s approval and feeling a paternal connection to the infant. Beneath the surface, there\'s a hint of insecurity and a desire to be seen as a good and loving ruler and father figure. He seems genuinely touched by Messalina\'s apparent support and praises, yet also slightly vulnerable to her subtle criticisms and manipulations. He is eager to please and be loved, both by the masses and by his wife.',
        ap.emotional_tags = ["claudius is outwardly joyful", "proud, basking in the crowd's approval", "feeling a paternal connection to the infant. beneath the surface, there's a hint of insecurity", "a desire to be seen as a good", "loving ruler", "father figure. he seems genuinely touched by messalina's apparent support", "praises, yet also slightly vulnerable to her subtle criticisms", "manipulations. he is eager to please", "be loved, both by the masses", "by his wife.", "claudius is outwardly joyful and proud", "basking in the crowd's approval and feeling a paternal connection to the infant. beneath the surface", "there's a hint of insecurity and a desire to be seen as a good and loving ruler and father figure. he seems genuinely touched by messalina's apparent support and praises", "yet also slightly vulnerable to her subtle criticisms and manipulations. he is eager to please and be loved", "both by the masses and by his wife."],
        ap.active_plans = ["Project an image of stability and continuity to the Roman populace by presenting Caligula's son.", "Reinforce his legitimacy as Emperor through a public display of paternal affection and connection to the previous regime's lineage.", "Seek validation and reassurance from Messalina regarding his actions and his role as Emperor and husband."],
        ap.beliefs = ["Public displays of affection and family are important for an Emperor to maintain popular support.", "Messalina is a crucial partner and advisor in his rule, and her opinions are highly valued.", "He is capable of being a loving and caring figure, despite his perceived flaws and past ridicule."],
        ap.goals = ["Short-term: To elicit continued cheers and adoration from the crowd.", "Medium-term: To solidify his public image as a benevolent and stable ruler.", "Ultimate: To secure his dynasty and legacy as a respected and loved Emperor, with Messalina by his side as a powerful consort."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands beside Claudius on the balcony, observing the scene with a composed demeanor. While Claudius interacts with the crowd and the infant, she maintains a regal posture, her expressions carefully controlled. She engages in conversation with Claudius, steering it towards her own ambitions and contributions to his rule, using the public moment to subtly assert her influence.',
        ap.emotional_state = 'Messalina outwardly presents an image of wifely support and imperial composure, but internally she is calculating and ambitious. She views the public display as a performance and is more concerned with political leverage than genuine sentimentality.  She is subtly impatient with Claudius\'s emotional display, prioritizing strategic power over public relations. There is a clear undercurrent of ambition and a desire for control masked by her outwardly supportive facade.',
        ap.emotional_tags = ["messalina outwardly presents an image of wifely support", "imperial composure, but internally she is calculating", "ambitious. she views the public display as a performance", "is more concerned with political leverage than genuine sentimentality.  she is subtly impatient with claudius's emotional display, prioritizing strategic power over public relations. there is a clear undercurrent of ambition", "a desire for control masked by her outwardly supportive facade.", "messalina outwardly presents an image of wifely support and imperial composure", "but internally she is calculating and ambitious. she views the public display as a performance and is more concerned with political leverage than genuine sentimentality.  she is subtly impatient with claudius's emotional display", "prioritizing strategic power over public relations. there is a clear undercurrent of ambition and a desire for control masked by her outwardly supportive facade.", "messalina outwardly presents an image of wifely support and imperial composure,", "internally she is calculating and ambitious. she views the public display as a performance and is more concerned with political leverage than genuine sentimentality.  she is subtly impatient with claudius's emotional display, prioritizing strategic power over public relations. there is a clear undercurrent of ambition and a desire for control masked by her outwardly supportive facade."],
        ap.active_plans = ["Assess the public's reaction to Claudius and the infant son for political insight.", "Subtly downplay the importance of sentimental displays and redirect the conversation to her own political contributions and ambitions.", "Plant the idea in Claudius's mind, and potentially the public's, that she is an indispensable co-ruler, akin to Livia, and that her role extends beyond motherhood."],
        ap.beliefs = ["Power is achieved through strategic manipulation and assertion, not merely through public affection.", "Motherhood is secondary to political power and should not impede her ambitions.", "She is intellectually superior to Claudius and possesses the strategic acumen necessary to rule effectively alongside him, or even in his stead."],
        ap.goals = ["Short-term: To subtly assert her influence over Claudius in this public setting.", "Medium-term: To establish herself as a key political figure, equal to or surpassing Claudius in influence.", "Ultimate: To consolidate and expand her power, potentially becoming the true power behind the throne, shaping the future of Rome to her design, and securing her place in history as a powerful Empress."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently beside Claudius on the balcony, her posture exuding authority while she engages in conversation. Her gestures are deliberate as she emphasizes her points, showcasing her ambition and capability. She maintains eye contact with Claudius, asserting her presence and influence within the public spectacle.',
        ap.emotional_state = 'On the surface, Messalina projects a blend of affection and ambition, her tone sweet yet laced with underlying determination. Internally, she navigates a tension between her maternal role and her drive for political power, hinting at the complexity of her desires. She is not just a supportive wife but a shrewd player in the political arena, revealing a hidden conflict between loyalty to Claudius and her personal ambitions.',
        ap.emotional_tags = ["on the surface, messalina projects a blend of affection", "ambition, her tone sweet yet laced with underlying determination. internally, she navigates a tension between her maternal role", "her drive for political power, hinting at the complexity of her desires. she is not just a supportive wife but a shrewd player in the political arena, revealing a hidden conflict between loyalty to claudius", "her personal ambitions.", "on the surface", "messalina projects a blend of affection and ambition", "her tone sweet yet laced with underlying determination. internally", "she navigates a tension between her maternal role and her drive for political power", "hinting at the complexity of her desires. she is not just a supportive wife but a shrewd player in the political arena", "revealing a hidden conflict between loyalty to claudius and her personal ambitions.", "on the surface, messalina projects a blend of affection and ambition, her tone sweet yet laced with underlying determination. internally, she navigates a tension between her maternal role and her drive for political power, hinting at the complexity of her desires. she is not just a supportive wife", "a shrewd player in the political arena, revealing a hidden conflict between loyalty to claudius and her personal ambitions."],
        ap.active_plans = ["To assert her role in governance by convincing Claudius of her value beyond motherhood.", "To manipulate Claudius's perception of her mothering role to align with her political aspirations.", "To position herself as a powerful figure in the empire, akin to Livia, and gain more influence over state affairs."],
        ap.beliefs = ["That a woman's intelligence and capability should be acknowledged and utilized in governance.", "That motherhood should not limit her ambitions and opportunities for power.", "That she can effectively manipulate Claudius's affections to achieve her political goals."],
        ap.goals = ["Short-term: To convince Claudius of her value in political matters.", "Medium-term: To gain a more active role in governance by revising the senatorial roll.", "Ultimate: To become a co-ruler alongside Claudius, exercising significant influence over the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands on the balcony, visibly engaged with the crowd below, holding Caligula\'s infant son. His stance is slightly slumped, indicative of the burdens he bears as Emperor. He interacts with Messalina, his gestures showing affection but also an underlying confusion as he navigates their conversation.',
        ap.emotional_state = 'Claudius displays a mix of joy and confusion, his chuckles and comments toward the baby showing a paternal affection. However, he is also grappling with insecurity and uncertainty regarding his role as Emperor and husband, reflected in his stammering responses to Messalina\'s ambitions. He occasionally exhibits moments of vulnerability, revealing his struggle to assert his authority in the face of Messalina’s growing ambitions.',
        ap.emotional_tags = ["claudius displays a mix of joy", "confusion, his chuckles", "comments toward the baby showing a paternal affection. however, he is also grappling with insecurity", "uncertainty regarding his role as emperor", "husband, reflected in his stammering responses to messalina's ambitions. he occasionally exhibits moments of vulnerability, revealing his struggle to assert his authority in the face of messalina\u2019s growing ambitions.", "claudius displays a mix of joy and confusion", "his chuckles and comments toward the baby showing a paternal affection. however", "he is also grappling with insecurity and uncertainty regarding his role as emperor and husband", "reflected in his stammering responses to messalina's ambitions. he occasionally exhibits moments of vulnerability", "revealing his struggle to assert his authority in the face of messalina\u2019s growing ambitions."],
        ap.active_plans = ["To maintain a public image of a loving father and Emperor, showcasing unity with Messalina.", "To support Messalina in her endeavors while trying to understand the implications of her ambitions.", "To balance his responsibilities as Emperor with his personal feelings and affection for his family."],
        ap.beliefs = ["That showing affection publicly strengthens his bond with Messalina and the crowd.", "That he must allow Messalina to have her say in matters to keep peace at home.", "That his role as Emperor requires the support of his wife and the loyalty of the people, creating a facade of stability."],
        ap.goals = ["Short-term: To present an image of a united family to the public.", "Medium-term: To maintain Claudius's authority while navigating Messalina's emerging ambitions.", "Ultimate: To ensure the stability of his reign and protect his family, while grappling with the realities of leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Domitia enters the scene and listens to Messalina\'s assertive declarations regarding her role in state affairs. She observes her daughter\'s dismissal of breastfeeding and her ambition to be Livia to Claudius\'s Augustus. Domitia reacts with concern, questioning Messalina\'s choices and expressing traditional views on a woman\'s place. She engages in a direct dialogue with Messalina, probing her intentions and future plans, particularly regarding children and marriage.',
        ap.emotional_state = 'Domitia is primarily characterized by maternal concern and a sense of traditional Roman values being challenged. Outwardly, she expresses worry and gentle disapproval, questioning Messalina\'s ambitions. Internally, she is likely feeling a mix of anxiety and perhaps a slight fear of her daughter\'s increasingly assertive and unconventional nature. There\'s an unspoken conflict between her desire to protect her daughter and her inability to understand or control Messalina\'s driving ambition.',
        ap.emotional_tags = ["domitia is primarily characterized by maternal concern", "a sense of traditional roman values being challenged. outwardly, she expresses worry", "gentle disapproval, questioning messalina's ambitions. internally, she is likely feeling a mix of anxiety", "perhaps a slight fear of her daughter's increasingly assertive", "unconventional nature. there's an unspoken conflict between her desire to protect her daughter", "her inability to understand or control messalina's driving ambition.", "domitia is primarily characterized by maternal concern and a sense of traditional roman values being challenged. outwardly", "she expresses worry and gentle disapproval", "questioning messalina's ambitions. internally", "she is likely feeling a mix of anxiety and perhaps a slight fear of her daughter's increasingly assertive and unconventional nature. there's an unspoken conflict between her desire to protect her daughter and her inability to understand or control messalina's driving ambition."],
        ap.active_plans = ["Express her disapproval of Messalina's intense involvement in state affairs, believing it is not a woman's role.", "Reinforce the traditional Roman view of women being primarily responsible for domestic duties and motherhood.", "Understand Messalina's future intentions regarding having more children and challenge her decision to forgo breastfeeding, reflecting traditional maternal roles."],
        ap.beliefs = ["A woman's primary role is within the domestic sphere, not in the public and political arena of state affairs.", "Motherhood and nurturing children are essential and defining aspects of a woman's life.", "Messalina's ambition and desire for political power are unusual and potentially inappropriate for a woman in Roman society."],
        ap.goals = ["short-term\": \"Voice her immediate concerns to Messalina about her deviation from traditional feminine roles.", "medium-term\": \"Influence Messalina to reconsider her focus on state affairs and prioritize more traditional aspects of womanhood.", "ultimate\": \"Protect Messalina from potential dangers associated with overreaching ambition and ensure she adheres to what Domitia believes are safer and more appropriate roles for women in their society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently, having just concluded a conversation with Claudius where she secured his agreement to her increased role in state matters.  She now turns to her mother, Domitia, maintaining an air of self-assuredness and control. Messalina dismisses Domitia\'s traditional concerns with a hint of condescension, asserting her own ambition and intelligence. She actively steers the conversation, probing her mother about remarriage to gauge Domitia\'s openness to her manipulative schemes.',
        ap.emotional_state = 'Messalina projects an outward image of unwavering confidence and ambition, speaking with assuredness and a dismissive tone towards traditional views. Internally, she is driven by a relentless hunger for power and recognition, feeling constrained by traditional gender roles and determined to break free. There is a subtle undercurrent of impatience and perhaps even disdain for her mother\'s traditional mindset, highlighting the widening gap between their worldviews and Messalina\'s ambition to transcend societal limitations.',
        ap.emotional_tags = ["messalina projects an outward image of unwavering confidence", "ambition, speaking with assuredness", "a dismissive tone towards traditional views. internally, she is driven by a relentless hunger for power", "recognition, feeling constrained by traditional gender roles", "determined to break free. there is a subtle undercurrent of impatience", "perhaps even disdain for her mother's traditional mindset, highlighting the widening gap between their worldviews", "messalina's ambition to transcend societal limitations.", "messalina projects an outward image of unwavering confidence and ambition", "speaking with assuredness and a dismissive tone towards traditional views. internally", "she is driven by a relentless hunger for power and recognition", "feeling constrained by traditional gender roles and determined to break free. there is a subtle undercurrent of impatience and perhaps even disdain for her mother's traditional mindset", "highlighting the widening gap between their worldviews and messalina's ambition to transcend societal limitations."],
        ap.active_plans = ["Assert her ambition to be actively involved in ruling Rome, explicitly stating her intention to be like Livia to Claudius's Augustus.", "Dismiss her mother's traditional views on women's roles as outdated and irrelevant to her own aspirations.", "Plant the seed of remarriage in Domitia's mind, specifically mentioning Appius Silanus, as part of her broader scheme to consolidate power through strategic alliances."],
        ap.beliefs = ["Women are equally capable as men in wielding political power and should not be confined to domestic roles.", "Traditional Roman societal expectations for women are restrictive and should be challenged and overcome.", "She possesses the intelligence and ambition necessary to become a powerful figure in Rome, deserving of influence and control equal to, if not greater than, Claudius."],
        ap.goals = ["short-term\": \"Convince Domitia that her ambition is not only acceptable but also a natural progression for a woman of her capabilities.", "medium-term\": \"Establish herself as a co-ruler with Claudius, actively participating in and influencing state affairs, mirroring Livia's powerful role.", "ultimate\": \"Achieve absolute power and lasting influence in Rome, potentially surpassing Claudius in authority and leaving a significant mark on the empire's history, securing her legacy as a powerful and influential figure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Domitia stands beside Messalina on the balcony, observing the crowd from a familial distance. Her posture is a mixture of pride and trepidation as she engages in conversation about family and politics, her movements reflecting a cautious yet maternal demeanor.',
        ap.emotional_state = 'Domitia exhibits a surface-level confidence tinged with anxiety. While she is proud of her daughter\'s position, there is an underlying fear of losing her to the ruthless ambitions that characterize the imperial court. Her internal conflict between maternal loyalty and concern for Messalina\'s dangerous path is palpable.',
        ap.emotional_tags = ["domitia exhibits a surface-level confidence tinged with anxiety. while she is proud of her daughter's position, there is an underlying fear of losing her to the ruthless ambitions that characterize the imperial court. her internal conflict between maternal loyalty", "concern for messalina's dangerous path is palpable.", "domitia exhibits a surface-level confidence tinged with anxiety. while she is proud of her daughter's position", "there is an underlying fear of losing her to the ruthless ambitions that characterize the imperial court. her internal conflict between maternal loyalty and concern for messalina's dangerous path is palpable."],
        ap.active_plans = ["To protect her daughter from the harsh realities of political ambition.", "To maintain her role as a supportive mother figure amidst the chaos of power struggles.", "To navigate the complexities of familial and political relationships while preserving her own status."],
        ap.beliefs = ["A woman's place is primarily in the home, nurturing her family.", "One must tread carefully in the treacherous waters of politics, especially as a woman.", "Maternal instincts should guide her actions, prioritizing family over ambition."],
        ap.goals = ["Short-term: To ensure Messalina feels supported and understood in her new role as Empress.", "Medium-term: To maintain peace within the family and prevent any rifts caused by ambition.", "Ultimate: To protect her family's legacy and avoid the pitfalls of political intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently beside Claudius on the balcony, exuding poise and control. She gestures towards the crowd with a practiced ease, her body language both inviting and commanding, as she discusses state affairs with Claudius and subtly probes Domitia’s thoughts.',
        ap.emotional_state = 'Messalina radiates confidence in her role, though beneath the surface lies an insatiable ambition. She displays warmth towards Claudius, but her internal motivation is strategic, as she maneuvers to position herself favorably in the political landscape while keeping her mother\'s loyalties in check.',
        ap.emotional_tags = ["messalina radiates confidence in her role", "though beneath the surface lies an insatiable ambition. she displays warmth towards claudius", "but her internal motivation is strategic", "as she maneuvers to position herself favorably in the political landscape while keeping her mother's loyalties in check.", "messalina radiates confidence in her role, though beneath the surface lies an insatiable ambition. she displays warmth towards claudius, but her internal motivation is strategic, as she maneuvers to position herself favorably in the political landscape", "keeping her mother's loyalties in check.", "messalina radiates confidence in her role, though beneath the surface lies an insatiable ambition. she displays warmth towards claudius,", "her internal motivation is strategic, as she maneuvers to position herself favorably in the political landscape while keeping her mother's loyalties in check."],
        ap.active_plans = ["To solidify her influence as a co-ruler alongside Claudius.", "To manipulate her mother's affections for Appius Silanus to serve her political ambitions.", "To establish herself as a powerful figure in the court, akin to Livia."],
        ap.beliefs = ["Women can wield power and influence just as effectively as men, if not more so.", "Political ambition is essential to secure her legacy and that of her children.", "She is destined for greatness and will not settle for being merely a supportive wife."],
        ap.goals = ["Short-term: To gain Domitia's support for her political maneuvers.", "Medium-term: To secure her position alongside Claudius by demonstrating her political acumen.", "Ultimate: To become a powerful and respected figure in her own right, like Livia, transforming the role of Empress."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his private study, surrounded by scrolls and the comforting glow of the hearth, engaging in conversation with Herod. He leans back, seemingly relaxed, occasionally gesturing with a hand as he speaks of Livia\'s deification and Messalina\'s pregnancy, a picture of domestic contentment in the heart of imperial power.',
        ap.emotional_state = 'A quiet satisfaction radiates from Claudius as he announces Livia\'s deification, a promise kept and a familial duty fulfilled. Beneath this surface contentment, there\'s a hint of naivete, a genuine belief in the romanticized pronouncements of Messalina. He seems genuinely pleased by the domestic scene, yet slightly dependent on Herod\'s wisdom, revealing a gentle vulnerability beneath his imperial facade. He is eager to share his happiness, seeking external validation and perhaps a touch of reassurance in the complex world he now inhabits.',
        ap.emotional_tags = ["a quiet satisfaction radiates from claudius as he announces livia's deification, a promise kept", "a familial duty fulfilled. beneath this surface contentment, there's a hint of naivete, a genuine belief in the romanticized pronouncements of messalina. he seems genuinely pleased by the domestic scene, yet slightly dependent on herod's wisdom, revealing a gentle vulnerability beneath his imperial facade. he is eager to share his happiness, seeking external validation", "perhaps a touch of reassurance in the complex world he now inhabits.", "a quiet satisfaction radiates from claudius as he announces livia's deification", "a promise kept and a familial duty fulfilled. beneath this surface contentment", "there's a hint of naivete", "a genuine belief in the romanticized pronouncements of messalina. he seems genuinely pleased by the domestic scene", "yet slightly dependent on herod's wisdom", "revealing a gentle vulnerability beneath his imperial facade. he is eager to share his happiness", "seeking external validation and perhaps a touch of reassurance in the complex world he now inhabits."],
        ap.active_plans = ["To share the news of Livia's deification with Herod before his departure, seeking validation for his actions.", "To persuade Herod to remain in Rome, demonstrating his reliance on Herod's counsel and experience in navigating political intricacies.", "To agree with Messalina's suggestion of Appius Silanus as a replacement advisor, trusting in her judgment and seeking to maintain domestic harmony."],
        ap.beliefs = ["Keeping promises, especially to family, is a matter of honor and importance.", "Breastfeeding is a reliable method of contraception, reflecting a somewhat naive understanding of practical matters.", "Adopting Augustus's seemingly tolerant approach to political beliefs is a wise and just way to rule, showcasing his desire for a less tyrannical reign."],
        ap.goals = ["Short-term: To enjoy a moment of domestic bliss and share positive news with his trusted advisor, Herod.", "Medium-term: To find a capable and trustworthy replacement for Herod's counsel, ensuring stability and informed decision-making in his rule.", "Ultimate: To rule justly and effectively, honoring his family and maintaining a semblance of peace and order within the empire, while also pursuing his scholarly interests like writing his family history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands gracefully in Claudius\'s study, positioned near both Claudius and Herod, her presence radiating youthful beauty and poised attentiveness. She interjects into the conversation with theatrical flair, embellishing Claudius\'s announcement of Livia\'s deification with romantic pronouncements and subtle suggestions, moving with calculated elegance within the intimate setting.',
        ap.emotional_state = 'Messalina projects an image of pious romanticism, waxing lyrical about Livia\'s heavenly ascent and her own domestic bliss. However, beneath this veneer of wifely devotion and sentimental piety, lies a coolly calculating ambition. Her suggestion of Appius Silanus is delivered with practiced casualness, masking her strategic intent to introduce a powerful nobleman into Claudius\'s inner circle, furthering her own political agenda. There is a palpable tension between her performed sweetness and her underlying manipulative drive, a duality that defines her interaction.',
        ap.emotional_tags = ["messalina projects an image of pious romanticism, waxing lyrical about livia's heavenly ascent", "her own domestic bliss. however, beneath this veneer of wifely devotion", "sentimental piety, lies a coolly calculating ambition. her suggestion of appius silanus is delivered with practiced casualness, masking her strategic intent to introduce a powerful nobleman into claudius's inner circle, furthering her own political agenda. there is a palpable tension between her performed sweetness", "her underlying manipulative drive, a duality that defines her interaction.", "messalina projects an image of pious romanticism", "waxing lyrical about livia's heavenly ascent and her own domestic bliss. however", "beneath this veneer of wifely devotion and sentimental piety", "lies a coolly calculating ambition. her suggestion of appius silanus is delivered with practiced casualness", "masking her strategic intent to introduce a powerful nobleman into claudius's inner circle", "furthering her own political agenda. there is a palpable tension between her performed sweetness and her underlying manipulative drive", "a duality that defines her interaction."],
        ap.active_plans = ["To reinforce her image as a devoted and pious wife, enhancing her public persona and influence over Claudius.", "To subtly introduce and promote Appius Silanus as a valuable advisor to Claudius, paving the way for her own political maneuverings.", "To propose the marriage between Silanus and her mother, Domitia, solidifying her family's connection to the imperial court and expanding her power base."],
        ap.beliefs = ["Public perception and the performance of virtue are essential tools for wielding influence and achieving political goals.", "Strategic marriages are crucial for consolidating power and expanding familial influence within the Roman elite.", "Noble advisors are preferable to freedmen in positions of power, reflecting a desire to align herself with traditional Roman aristocracy and consolidate power within established structures."],
        ap.goals = ["Short-term: To successfully plant the idea of Appius Silanus as a replacement advisor in Claudius's mind, gaining initial traction for her plan.", "Medium-term: To orchestrate the marriage between Silanus and Domitia, creating a powerful alliance and enhancing her family's standing at court.", "Ultimate: To increase her own political power and influence, ultimately aiming for co-rule alongside Claudius, securing a dominant position within the Roman Empire for herself and her lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Herod sits with Claudius in the private study, listening intently to the Emperor and Messalina, his posture composed and observant. He engages in the conversation with measured responses and subtle cynicism, occasionally directing his gaze between Claudius and Messalina, a seasoned courtier assessing the dynamics of the imperial household.',
        ap.emotional_state = 'Herod maintains a facade of polite diplomacy, engaging in courtly pleasantries and acknowledging Messalina\'s \'romanticism\' with a dry tone. Internally, he harbors a deep cynicism towards the Roman court and its inhabitants, recognizing the manipulative undercurrents in Messalina\'s words and Claudius\'s naivete. He is world-weary and pragmatic, his emotional state marked by a detached observation of the unfolding drama, tinged with a subtle concern for Claudius\'s blind trust.',
        ap.emotional_tags = ["herod maintains a facade of polite diplomacy, engaging in courtly pleasantries", "acknowledging messalina's 'romanticism' with a dry tone. internally, he harbors a deep cynicism towards the roman court", "its inhabitants, recognizing the manipulative undercurrents in messalina's words", "claudius's naivete. he is world-weary", "pragmatic, his emotional state marked by a detached observation of the unfolding drama, tinged with a subtle concern for claudius's blind trust.", "herod maintains a facade of polite diplomacy", "engaging in courtly pleasantries and acknowledging messalina's 'romanticism' with a dry tone. internally", "he harbors a deep cynicism towards the roman court and its inhabitants", "recognizing the manipulative undercurrents in messalina's words and claudius's naivete. he is world-weary and pragmatic", "his emotional state marked by a detached observation of the unfolding drama", "tinged with a subtle concern for claudius's blind trust."],
        ap.active_plans = ["To maintain amicable relations with Claudius and Messalina before his departure, ensuring continued favor and advantageous terms for his own kingdom.", "To offer subtle warnings and pragmatic advice to Claudius, even while recognizing the Emperor's likely disregard for his counsel, fulfilling his role as a seasoned advisor.", "To conclude his Roman visit successfully, securing increased territories and resources, and preparing for his return to his own kingdom, enriched by Roman patronage."],
        ap.beliefs = ["The Roman court is a viper pit of ambition and treachery, where appearances are deceiving and trust is a dangerous illusion.", "Pragmatism and self-interest are essential for survival and success in political life, requiring a detached and strategic approach.", "Naivete and romanticism are weaknesses in the ruthless world of power politics, making Claudius vulnerable to manipulation and deceit."],
        ap.goals = ["Short-term: To gracefully exit the Roman court, concluding his visit without incurring any disfavor and maintaining his advantageous position.", "Medium-term: To secure the long-term stability and prosperity of his own kingdom, leveraging his Roman connections and recent gains.", "Ultimate: To navigate the treacherous political landscapes of both Rome and his own region, ensuring his continued reign and influence through shrewd diplomacy and pragmatic decision-making, always prioritizing self-preservation and strategic advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits comfortably in his richly appointed study, exuding a mix of scholarly pride and naive excitement as he announces Messalina\'s second pregnancy. His posture is relaxed, reflecting a sense of domestic happiness and confidence in sharing this news. As he speaks, he gestures animatedly, his hands moving to emphasize his points about Livia’s deification.',
        ap.emotional_state = 'Claudius displays a buoyant enthusiasm about Livia being declared a goddess and his wife\'s pregnancy, his face lighting up with joy, yet there\'s an undertone of obliviousness to the potential political implications. Internally, he wrestles with ignorance regarding the realities of court life and the expectations of leadership, feeling secure yet unaware of the scheming that surrounds him.',
        ap.emotional_tags = ["claudius displays a buoyant enthusiasm about livia being declared a goddess", "his wife's pregnancy, his face lighting up with joy, yet there's an undertone of obliviousness to the potential political implications. internally, he wrestles with ignorance regarding the realities of court life", "the expectations of leadership, feeling secure yet unaware of the scheming that surrounds him.", "claudius displays a buoyant enthusiasm about livia being declared a goddess and his wife's pregnancy", "his face lighting up with joy", "yet there's an undertone of obliviousness to the potential political implications. internally", "he wrestles with ignorance regarding the realities of court life and the expectations of leadership", "feeling secure yet unaware of the scheming that surrounds him."],
        ap.active_plans = ["To share the joyous news of Messalina's pregnancy as a royal proclamation, reinforcing his position as Emperor.", "To foster a sense of unity and happiness around his family, projecting an image of stability to his court.", "To seek Herod's continued counsel on state matters, despite his impending departure, showcasing a desire for wisdom in governance."],
        ap.beliefs = ["Claudius believes that familial bonds and public announcements enhance his legitimacy as Emperor.", "He holds a conviction that knowledge and reason should govern decisions, even if his understanding is naive.", "Claudius embraces a hopeful view of marriage as a partnership that strengthens his rule."],
        ap.goals = ["Short-term: To celebrate his wife's pregnancy and share it joyfully with Herod and the court.", "Medium-term: To cultivate a stable public image as a family man, balancing his personal life with political responsibilities.", "Ultimate: To solidify his reign and establish a legacy that honors both Livia and his own family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands nearby, elegantly poised, her demeanor charming and playful as she engages in the conversation about Livia\'s deification and her own pregnancy. She uses subtle gestures to deflect Herod’s surprise, presenting an image of supportive wife while concealing her manipulative intentions.',
        ap.emotional_state = 'While outwardly expressing excitement and pride about her pregnancy, Messalina’s internal state is one of calculated ambition. She remains conscious of the implications of her position and uses her charm to ensure Claudius remains oblivious to her true motives. There\'s an undercurrent of ambition in her tone, as she subtly maneuvers the dialogue to her advantage.',
        ap.emotional_tags = ["while outwardly expressing excitement", "pride about her pregnancy, messalina\u2019s internal state is one of calculated ambition. she remains conscious of the implications of her position", "uses her charm to ensure claudius remains oblivious to her true motives. there's an undercurrent of ambition in her tone, as she subtly maneuvers the dialogue to her advantage.", "while outwardly expressing excitement and pride about her pregnancy", "messalina\u2019s internal state is one of calculated ambition. she remains conscious of the implications of her position and uses her charm to ensure claudius remains oblivious to her true motives. there's an undercurrent of ambition in her tone", "as she subtly maneuvers the dialogue to her advantage."],
        ap.active_plans = ["To deflect any surprise from Herod regarding her pregnancy, maintaining the illusion of a happy family life.", "To manipulate Claudius into considering Appius Silanus for a position close to him, furthering her own ambitions.", "To solidify her influence over Claudius and the political landscape by portraying herself as a devoted wife."],
        ap.beliefs = ["Messalina believes that a carefully curated image of motherhood will enhance her power and control within the court.", "She holds the conviction that manipulating those around her, especially Claudius, is essential for her survival and ascent.", "Messalina views political alliances through marriage as a key strategy for consolidating her position."],
        ap.goals = ["Short-term: To project loyalty and love for Claudius while maintaining her cunning edge.", "Medium-term: To establish Appius Silanus as a trusted ally, strengthening her political network.", "Ultimate: To ascend to a position of power equal to or greater than Claudius, possibly as a co-ruler."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Herod sits across from Claudius, observing the dynamics unfold with the keen eye of a seasoned politician. He leans slightly forward, offering his insights, and uses measured gestures to emphasize his points, particularly when questioning the timing of the pregnancy.',
        ap.emotional_state = 'Herod projects a blend of feigned surprise and underlying cynicism regarding Claudius\'s naivety about court politics and family dynamics. Although he expresses joy for the pregnancy, internally he grapples with the knowledge of the potential ramifications of Messalina\'s ambitions, remaining wary of their implications.',
        ap.emotional_tags = ["herod projects a blend of feigned surprise", "underlying cynicism regarding claudius's naivety about court politics", "family dynamics. although he expresses joy for the pregnancy, internally he grapples with the knowledge of the potential ramifications of messalina's ambitions, remaining wary of their implications.", "herod projects a blend of feigned surprise and underlying cynicism regarding claudius's naivety about court politics and family dynamics. although he expresses joy for the pregnancy", "internally he grapples with the knowledge of the potential ramifications of messalina's ambitions", "remaining wary of their implications."],
        ap.active_plans = ["To subtly challenge Claudius's assumptions about family and political influence, testing his awareness.", "To ensure he leaves a lasting impression of caution regarding trust and loyalty in the court.", "To advise Claudius on the potential dangers of aligning too closely with someone like Appius Silanus."],
        ap.beliefs = ["Herod believes that caution and strategic distance are essential in the realm of politics, especially when dealing with ambitious figures.", "He holds a conviction that the dynamics of power are always shifting, requiring constant vigilance.", "Herod perceives the importance of self-preservation in the volatile environment of Roman politics."],
        ap.goals = ["Short-term: To provide counsel to Claudius while maintaining a safe distance as he prepares to depart.", "Medium-term: To ensure that Claudius remains cautious and aware of potential threats within his circle.", "Ultimate: To navigate the political landscape of Rome while safeguarding his own interests."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his private study, surrounded by books, engaging in conversation with Herod and Messalina. He expresses satisfaction that Livia is now formally deified and shares the news of Messalina\'s pregnancy. He pleads with Herod to reconsider his departure, revealing his reliance on Herod\'s counsel.',
        ap.emotional_state = 'Claudius is presented as emotionally vulnerable and somewhat naive. He is pleased about fulfilling his promise to deify Livia, displaying a sense of duty. He shows genuine distress at the prospect of Herod leaving, indicating a deep-seated insecurity about his ability to rule effectively without trusted advisors. He is also delighted about Messalina\'s pregnancy, seemingly oblivious to any manipulative undertones in her actions.',
        ap.emotional_tags = ["claudius is presented as emotionally vulnerable", "somewhat naive. he is pleased about fulfilling his promise to deify livia, displaying a sense of duty. he shows genuine distress at the prospect of herod leaving, indicating a deep-seated insecurity about his ability to rule effectively without trusted advisors. he is also delighted about messalina's pregnancy, seemingly oblivious to any manipulative undertones in her actions.", "claudius is presented as emotionally vulnerable and somewhat naive. he is pleased about fulfilling his promise to deify livia", "displaying a sense of duty. he shows genuine distress at the prospect of herod leaving", "indicating a deep-seated insecurity about his ability to rule effectively without trusted advisors. he is also delighted about messalina's pregnancy", "seemingly oblivious to any manipulative undertones in her actions."],
        ap.active_plans = ["To persuade Herod to remain in Rome as his advisor.", "To share the news of Messalina's pregnancy and gauge reactions.", "To reaffirm his commitment to Livia's deification and its political implications."],
        ap.beliefs = ["Promises, even to the deceased, should be honored.", "Personal relationships and friendships are vital for guidance and support in leadership.", "Breastfeeding is an effective form of contraception (misinformed belief, highlighting his scholarly detachment from practical realities)."],
        ap.goals = ["short-term\": \"Retain Herod's services and counsel to navigate the complexities of Roman governance.", "medium-term\": \"Ensure the health and well-being of Messalina and their unborn child, securing the imperial lineage.", "ultimate\": \"Achieve a stable and well-governed Rome, though his approach is often reliant on others' advice rather than his own initiative."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands in Claudius\'s study, subtly positioned to influence the conversation between Claudius and Herod. She interjects with seemingly supportive remarks, guiding the discussion towards her strategic objectives, particularly regarding Herod\'s replacement and her mother\'s potential marriage.',
        ap.emotional_state = 'Messalina projects an air of wifely devotion and romantic sentimentality, praising Livia and feigning concern for Claudius\'s well-being. Beneath this facade, she is calculating and manipulative, using charm and apparent thoughtfulness to advance her political agenda. Her subtle power plays are masked by expressions of affection and domesticity, creating a deceptive image of a supportive consort.',
        ap.emotional_tags = ["messalina projects an air of wifely devotion", "romantic sentimentality, praising livia", "feigning concern for claudius's well-being. beneath this facade, she is calculating", "manipulative, using charm", "apparent thoughtfulness to advance her political agenda. her subtle power plays are masked by expressions of affection", "domesticity, creating a deceptive image of a supportive consort.", "messalina projects an air of wifely devotion and romantic sentimentality", "praising livia and feigning concern for claudius's well-being. beneath this facade", "she is calculating and manipulative", "using charm and apparent thoughtfulness to advance her political agenda. her subtle power plays are masked by expressions of affection and domesticity", "creating a deceptive image of a supportive consort."],
        ap.active_plans = ["To subtly suggest Appius Silanus as Herod's replacement, thereby gaining influence through a strategically positioned nobleman.", "To propose a marriage between Silanus and her mother, Domitia, strengthening her family's ties to the imperial court and increasing her own power base.", "To maintain Claudius's affection and trust by appearing supportive and helpful, ensuring he remains pliable to her suggestions."],
        ap.beliefs = ["Political power is best consolidated through strategic alliances and familial connections.", "Claudius is easily swayed by flattery and the illusion of domestic harmony.", "Noblemen, even with Republican leanings, can be useful if strategically bound to the imperial family through marriage."],
        ap.goals = ["short-term\": \"Secure Claudius's approval for Silanus's appointment and her mother's marriage, setting the stage for increased influence.", "medium-term\": \"Expand her family's power and influence within the Roman court, creating a network of loyal allies.", "ultimate\": \"Become a dominant force in Roman politics, wielding significant control behind the throne and potentially surpassing Claudius in actual power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Herod is in Claudius\'s study, preparing for his departure from Rome. He engages in a final conversation with Claudius and Messalina, offering his pragmatic perspectives and seasoned observations on the unfolding events, particularly Messalina\'s subtle manipulations.',
        ap.emotional_state = 'Herod maintains a detached and cynical demeanor, observing the courtly intrigues with a worldly weariness. He is amused by Messalina\'s \'romantic\' pronouncements and recognizes her strategic maneuvering, offering dry, understated commentary. While he expresses genuine concern for Claudius\'s naivety, his emotional investment seems limited to imparting a final piece of crucial advice.',
        ap.emotional_tags = ["herod maintains a detached", "cynical demeanor, observing the courtly intrigues with a worldly weariness. he is amused by messalina's 'romantic' pronouncements", "recognizes her strategic maneuvering, offering dry, understated commentary. while he expresses genuine concern for claudius's naivety, his emotional investment seems limited to imparting a final piece of crucial advice.", "herod maintains a detached and cynical demeanor", "observing the courtly intrigues with a worldly weariness. he is amused by messalina's 'romantic' pronouncements and recognizes her strategic maneuvering", "offering dry", "understated commentary. while he expresses genuine concern for claudius's naivety", "his emotional investment seems limited to imparting a final piece of crucial advice."],
        ap.active_plans = ["To depart Rome as scheduled, concluding his advisory role to Claudius.", "To offer a final, stark warning to Claudius about trusting no one in the treacherous Roman court.", "To maintain amicable relations with Claudius despite recognizing the emperor's vulnerability and the court's inherent dangers."],
        ap.beliefs = ["The Roman court is inherently corrupt and driven by self-interest, where trust is a dangerous liability.", "Claudius, despite his intelligence, is fundamentally naive and susceptible to manipulation, especially by those closest to him.", "Pragmatism and self-preservation are essential for survival and success in the ruthless world of politics."],
        ap.goals = ["short-term\": \"Ensure a smooth and advantageous departure from Rome, securing continued favor from Claudius despite his leaving.", "medium-term\": \"Safeguard his own kingdom and political standing by maintaining a shrewd distance from the escalating intrigues of the Roman court.", "ultimate\": \"Survive and prosper in a world dominated by political machinations, prioritizing his own interests and security above all else."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his richly appointed study, the weight of the imperial mantle heavy upon him. His posture appears slightly hunched as he leans forward, engaged in conversation with Herod, a man he greatly respects. His hands fidget somewhat, betraying his anxiety as he processes the implications of Herod\'s stark warning.',
        ap.emotional_state = 'Claudius exhibits a blend of bemusement and concern, his usual stammer accentuating his uncertainty. On the surface, he seeks reassurance in his fortune and the loyalty of those around him, yet internally, a growing unease emerges as he grapples with the reality of Herod\'s chilling advice. This conflict hints at a deeper vulnerability, as his trust is now called into question, particularly regarding those closest to him.',
        ap.emotional_tags = ["claudius exhibits a blend of bemusement", "concern, his usual stammer accentuating his uncertainty. on the surface, he seeks reassurance in his fortune", "the loyalty of those around him, yet internally, a growing unease emerges as he grapples with the reality of herod's chilling advice. this conflict hints at a deeper vulnerability, as his trust is now called into question, particularly regarding those closest to him.", "claudius exhibits a blend of bemusement and concern", "his usual stammer accentuating his uncertainty. on the surface", "he seeks reassurance in his fortune and the loyalty of those around him", "yet internally", "a growing unease emerges as he grapples with the reality of herod's chilling advice. this conflict hints at a deeper vulnerability", "as his trust is now called into question", "particularly regarding those closest to him."],
        ap.active_plans = ["To share the news of Livia's deification, celebrating a personal victory in the court.", "To seek guidance from Herod on navigating the complexities of power dynamics in Rome.", "To establish a potential political alliance through the suggestion of Appius Silanus as a close advisor."],
        ap.beliefs = ["Loyalty among friends and advisors is paramount in governance.", "Power should be wielded with trust and confidence in those selected to serve.", "The legacy of his family and friends deserves to be honored through truth-telling."],
        ap.goals = ["Short-term: To solidify his relationship with Herod before his departure.", "Medium-term: To successfully integrate trusted advisors into his court.", "Ultimate: To secure a legacy of stability and truth through his written history and rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Herod stands confidently, his posture straight and assured as he engages Claudius. With an air of authority, he gestures subtly, emphasizing the weight of his words as he delivers his stark warning. His demeanor shifts from a supportive ally to a foreboding counselor, revealing the depths of his understanding of Roman treachery.',
        ap.emotional_state = 'Herod\'s surface demeanor is calm and composed, but beneath lies a calculated awareness of the dangers that surround Claudius. He expresses a mix of camaraderie and cynicism, knowing that trust is a luxury in their political world. His warning carries an undertone of concern for Claudius’s naivete, showcasing a blend of loyalty and self-interest.',
        ap.emotional_tags = ["herod's surface demeanor is calm", "composed, but beneath lies a calculated awareness of the dangers that surround claudius. he expresses a mix of camaraderie", "cynicism, knowing that trust is a luxury in their political world. his warning carries an undertone of concern for claudius\u2019s naivete, showcasing a blend of loyalty", "self-interest.", "herod's surface demeanor is calm and composed", "but beneath lies a calculated awareness of the dangers that surround claudius. he expresses a mix of camaraderie and cynicism", "knowing that trust is a luxury in their political world. his warning carries an undertone of concern for claudius\u2019s naivete", "showcasing a blend of loyalty and self-interest.", "herod's surface demeanor is calm and composed,", "beneath lies a calculated awareness of the dangers that surround claudius. he expresses a mix of camaraderie and cynicism, knowing that trust is a luxury in their political world. his warning carries an undertone of concern for claudius\u2019s naivete, showcasing a blend of loyalty and self-interest."],
        ap.active_plans = ["To reinforce the importance of caution and distrust in Claudius's court.", "To prepare Claudius for the inevitable betrayals that come with power.", "To subtly distance himself from the emotional attachments that bind Claudius."],
        ap.beliefs = ["Trust is a dangerous fallacy in the game of power.", "Survival in Rome requires a shrewd understanding of people and their motivations.", "True loyalty is an illusion, and one must always be prepared for betrayal."],
        ap.goals = ["Short-term: To impart wisdom that ensures Claudius\u2019s survival in a treacherous environment.", "Medium-term: To distance himself from the political turmoil that may arise from Claudius's rule.", "Ultimate: To maintain stability in his own kingdom while leveraging Claudius's challenges to his advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_midwife_event_6_1'})
    ON CREATE SET
        ap.current_status = 'The midwife is positioned beside Messalina\'s bed, cradling the newborn infant gently in her arms. Her posture is attentive and caring, focused on the well-being of both mother and child. She speaks in a soothing tone, announcing the baby\'s arrival and describing it as \'beautiful\', indicating a successful delivery and a healthy infant.',
        ap.emotional_state = 'Outwardly, the midwife projects warmth and professional reassurance, her voice gentle and encouraging. Internally, she is likely experiencing a sense of professional satisfaction and relief at a successful childbirth.  She may also feel a degree of reverence or awe in the presence of the Empress and the newborn heir, understanding the significance of this birth for the imperial family, though she maintains a professional distance and composure.',
        ap.emotional_tags = ["outwardly, the midwife projects warmth", "professional reassurance, her voice gentle", "encouraging. internally, she is likely experiencing a sense of professional satisfaction", "relief at a successful childbirth.  she may also feel a degree of reverence or awe in the presence of the empress", "the newborn heir, understanding the significance of this birth for the imperial family, though she maintains a professional distance", "composure.", "outwardly", "the midwife projects warmth and professional reassurance", "her voice gentle and encouraging. internally", "she is likely experiencing a sense of professional satisfaction and relief at a successful childbirth.  she may also feel a degree of reverence or awe in the presence of the empress and the newborn heir", "understanding the significance of this birth for the imperial family", "though she maintains a professional distance and composure."],
        ap.active_plans = ["Ensure the newborn baby is healthy, stable, and presented safely to the mother.", "Reassure Messalina about the successful delivery and the baby's condition.", "Provide immediate postnatal care and answer any initial questions Messalina might have about the infant."],
        ap.beliefs = ["Childbirth is a momentous and delicate event requiring skilled care and attention.", "The health and well-being of both mother and child are paramount in her professional duties.", "Respect and decorum are essential when attending to members of the Imperial family."],
        ap.goals = ["short_term\": \"To ensure the immediate health and safety of both Messalina and her newborn child.", "medium_term\": \"To provide ongoing postnatal support and guidance to Messalina in the initial days following childbirth.", "ultimate\": \"To contribute to the health and continuation of the Imperial lineage through competent and compassionate midwifery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Messalina lies in her bed, recovering from childbirth, but her mind is already racing beyond the immediate physical experience. She is actively engaging with the midwife, directly questioning about the baby\'s condition and, crucially, its sex. Though physically recumbent, her posture is alert, her gaze sharp and focused on the midwife and the newborn.',
        ap.emotional_state = 'On the surface, Messalina displays a veneer of maternal curiosity and perhaps some expected joy at the arrival of her child, asking if \'it\'s all right\' and showing interest in the baby\'s beauty. However, beneath this facade lies a palpable tension driven by her ambition. Her immediate and pointed question about the baby\'s sex betrays her underlying strategic calculations. Any genuine maternal emotion is instantly filtered through the lens of political advantage and legacy, revealing a complex and calculating inner state.',
        ap.emotional_tags = ["on the surface, messalina displays a veneer of maternal curiosity", "perhaps some expected joy at the arrival of her child, asking if 'it's all right'", "showing interest in the baby's beauty. however, beneath this facade lies a palpable tension driven by her ambition. her immediate", "pointed question about the baby's sex betrays her underlying strategic calculations. any genuine maternal emotion is instantly filtered through the lens of political advantage", "legacy, revealing a complex", "calculating inner state.", "on the surface", "messalina displays a veneer of maternal curiosity and perhaps some expected joy at the arrival of her child", "asking if 'it's all right' and showing interest in the baby's beauty. however", "beneath this facade lies a palpable tension driven by her ambition. her immediate and pointed question about the baby's sex betrays her underlying strategic calculations. any genuine maternal emotion is instantly filtered through the lens of political advantage and legacy", "revealing a complex and calculating inner state."],
        ap.active_plans = ["Assess the health and viability of her newborn child to ensure it can serve its purpose in her dynastic ambitions.", "Determine the sex of the child immediately, as this will drastically impact her subsequent political strategies and power plays.", "Begin formulating plans for how to leverage this new child to further solidify her own influence and control within the Roman Empire."],
        ap.beliefs = ["Children are primarily instruments of power and legacy within the Roman imperial system.", "Her own ambition and strategic maneuvering are essential for survival and dominance in the ruthless world of Roman politics.", "The sex of her child is not merely a personal matter but a crucial factor in determining its value and potential within the imperial succession and her own power base."],
        ap.goals = ["short_term\": \"To confirm the health and sex of the newborn infant.", "medium_term\": \"To utilize this child, particularly if it is a son, to strengthen her position and influence at court and secure the imperial lineage.", "ultimate\": \"To establish a lasting dynasty under her control, ensuring her continued power and shaping the future of Rome through her offspring."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_architectural_plans_event_7_1'})
    ON CREATE SET
        oi.description = 'The architectural plans serve as the focal point of Claudius\'s discussion with Narcissus and Pallas, outlining the proposed designs for the winter harbor at Ostia. They represent the potential progress and modernization of Rome, igniting Claudius\'s ambition to realize this long-delayed project and highlighting the tension between fiscal responsibility and imperial aspirations.',
        oi.status_before = 'The plans are detailed blueprints saved from the time of Julius Caesar, showcasing a vision for an efficient harbor, contrasting with a more recent, inflated design intended for corrupt purposes.',
        oi.status_after = 'The plans remain a key reference point as Claudius decides to prioritize the survey, signaling a commitment to the project despite the financial concerns raised by Narcissus and Pallas, further embedding the plans into the narrative of political ambition and public works.'
    WITH oi
    MATCH (o:Object {uuid: 'object_architectural_plans'})
    MATCH (e:Event {uuid: 'event_7_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at a table, engaged in discussion with Narcissus and Pallas, examining architectural plans with a practical eagerness. His posture is slightly hunched over the plans, hands gesturing animatedly as he makes points about the feasibility of the harbor project, his excitement palpable.',
        ap.emotional_state = 'Claudius displays a mix of joy and determination, his face lighting up with the prospect of his daughter\'s birth. Beneath this surface delight, anxiety lingers, a reminder of the heavy burdens of leadership and the uncertainty of his reign. His transition from focused discussion to joyful anticipation is stark.',
        ap.emotional_tags = ["claudius displays a mix of joy", "determination, his face lighting up with the prospect of his daughter's birth. beneath this surface delight, anxiety lingers, a reminder of the heavy burdens of leadership", "the uncertainty of his reign. his transition from focused discussion to joyful anticipation is stark.", "claudius displays a mix of joy and determination", "his face lighting up with the prospect of his daughter's birth. beneath this surface delight", "anxiety lingers", "a reminder of the heavy burdens of leadership and the uncertainty of his reign. his transition from focused discussion to joyful anticipation is stark."],
        ap.active_plans = ["To have the engineers survey the site for the winter harbor project.", "To push forward with the long-discussed public works project despite potential costs.", "To prioritize the safety and well-being of his newborn daughter, demonstrating his sense of duty as a father."],
        ap.beliefs = ["The harbor project is essential for Rome's survival during winter.", "Leadership involves making practical decisions based on feasibility rather than pure cost.", "His family and legacy are intertwined with the stability of the empire."],
        ap.goals = ["Short-term: Ensure the engineers conduct a thorough survey of the harbor site.", "Medium-term: Solidify his reputation as a capable emperor through successful public works.", "Ultimate: Create a lasting legacy that benefits Rome and secures his family's future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands beside Claudius, his arms crossed, exuding a mix of skepticism and financial caution as he listens to Claudius\'s ambitious plans. His posture is rigid, reflecting a careful calculation of the costs involved as he prepares to challenge Claudius\'s optimism.',
        ap.emotional_state = 'Narcissus appears pragmatic yet slightly irritated by Claudius\'s naivety. His brow furrows as he considers the implications of the harbor project, revealing an underlying tension between loyalty to Claudius and his own financial savvy. The joy of the child\'s birth does little to sway his financial concerns.',
        ap.emotional_tags = ["narcissus appears pragmatic yet slightly irritated by claudius's naivety. his brow furrows as he considers the implications of the harbor project, revealing an underlying tension between loyalty to claudius", "his own financial savvy. the joy of the child's birth does little to sway his financial concerns.", "narcissus appears pragmatic yet slightly irritated by claudius's naivety. his brow furrows as he considers the implications of the harbor project", "revealing an underlying tension between loyalty to claudius and his own financial savvy. the joy of the child's birth does little to sway his financial concerns."],
        ap.active_plans = ["To assess the financial feasibility of the winter harbor project carefully.", "To engage in a debate about the potential costs, emphasizing the need for caution.", "To seek ways to protect his financial interests related to the corn trade in light of the harbor plans."],
        ap.beliefs = ["Excessive costs can lead to greater political instability.", "The safety of grain prices must be considered when planning public works.", "Financial prudence is essential for maintaining influence in the imperial court."],
        ap.goals = ["Short-term: Ensure that the harbor project does not jeopardize his financial interests.", "Medium-term: Maintain his influence over Claudius's decisions by advising caution.", "Ultimate: Secure a stable financial environment for himself and the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Pallas is seated at the table, leaning forward slightly, his fingers tracing the architectural plans as he engages in a philosophical debate with Narcissus. His demeanor is calm yet assertive, embodying the role of a mediator between Claudius’s enthusiasm and Narcissus’s caution.',
        ap.emotional_state = 'Pallas exhibits a composed and analytical demeanor, but beneath lies the thrill of engaging in a battle of wits with Narcissus. He feels a sense of responsibility to guide Claudius wisely, balancing ambition with realism. His calm exterior masks a keen awareness of the underlying tensions in the room.',
        ap.emotional_tags = ["pallas exhibits a composed", "analytical demeanor, but beneath lies the thrill of engaging in a battle of wits with narcissus. he feels a sense of responsibility to guide claudius wisely, balancing ambition with realism. his calm exterior masks a keen awareness of the underlying tensions in the room.", "pallas exhibits a composed and analytical demeanor", "but beneath lies the thrill of engaging in a battle of wits with narcissus. he feels a sense of responsibility to guide claudius wisely", "balancing ambition with realism. his calm exterior masks a keen awareness of the underlying tensions in the room.", "pallas exhibits a composed and analytical demeanor,", "beneath lies the thrill of engaging in a battle of wits with narcissus. he feels a sense of responsibility to guide claudius wisely, balancing ambition with realism. his calm exterior masks a keen awareness of the underlying tensions in the room."],
        ap.active_plans = ["To facilitate a constructive dialogue between Claudius and Narcissus regarding the harbor plans.", "To ensure that both practical and philosophical considerations are addressed in their discussion.", "To prepare for the engineers' report by emphasizing the importance of the harbor for Rome."],
        ap.beliefs = ["Philosophical considerations must be weighed against practical needs in governance.", "Political decisions should benefit the broader public, not just individual interests.", "Collaboration and dialogue are essential for effective decision-making in the imperial court."],
        ap.goals = ["Short-term: Achieve a consensus on moving forward with the harbor project.", "Medium-term: Position himself as an essential advisor through insightful contributions.", "Ultimate: Help Claudius navigate the complexities of rule while protecting the stability of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated at a table in his study, deeply engrossed in reviewing architectural plans with Narcissus and Pallas. He leans over the plans, gesturing and speaking with a focused intensity about the harbor project, his initial stammer momentarily subdued by his engagement with the practicalities of governance. He is abruptly interrupted by the slave\'s urgent entrance, momentarily looking up in confusion.',
        ap.emotional_state = 'Initially preoccupied with the details of the harbor plans, Claudius is taken completely by surprise by the slave\'s announcement. His confusion quickly melts away into an overwhelming wave of pure, unadulterated joy. He is genuinely moved and deeply grateful for the arrival of his daughter, his pious exclamation to Lucina revealing a profound emotional depth beneath his scholarly and imperial facade. This moment of personal happiness completely eclipses his earlier focus on state affairs, showcasing a vulnerable and deeply human side.',
        ap.emotional_tags = ["initially preoccupied with the details of the harbor plans, claudius is taken completely by surprise by the slave's announcement. his confusion quickly melts away into an overwhelming wave of pure, unadulterated joy. he is genuinely moved", "deeply grateful for the arrival of his daughter, his pious exclamation to lucina revealing a profound emotional depth beneath his scholarly", "imperial facade. this moment of personal happiness completely eclipses his earlier focus on state affairs, showcasing a vulnerable", "deeply human side.", "initially preoccupied with the details of the harbor plans", "claudius is taken completely by surprise by the slave's announcement. his confusion quickly melts away into an overwhelming wave of pure", "unadulterated joy. he is genuinely moved and deeply grateful for the arrival of his daughter", "his pious exclamation to lucina revealing a profound emotional depth beneath his scholarly and imperial facade. this moment of personal happiness completely eclipses his earlier focus on state affairs", "showcasing a vulnerable and deeply human side."],
        ap.active_plans = ["To finalize the discussion with Narcissus and Pallas regarding the harbor survey and instruct them to proceed with the engineers.", "To express his profound joy and gratitude for the birth of his daughter, acknowledging divine intervention.", "To immediately leave the study and go to see Messalina and his newborn child, prioritizing this personal event over state matters."],
        ap.beliefs = ["Family and children are a divine blessing and a source of profound personal joy.", "Divine entities like Lucina directly influence personal events, especially childbirth.", "Moments of personal joy and family are paramount and can justifiably interrupt even pressing state matters."],
        ap.goals = ["Short-term: To immediately embrace his newborn daughter and share in the joy of her arrival with Messalina.", "Medium-term: To ensure the well-being and prosperity of his growing family.", "Ultimate: To balance his responsibilities as Emperor with his desire for a fulfilling family life, though the feasibility of this in the treacherous Roman court remains uncertain."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_slave_1_event_7_2'})
    ON CREATE SET
        ap.current_status = 'The slave bursts into Claudius\'s study, moving with urgency and purpose. He interrupts the ongoing meeting between Claudius, Narcissus, and Pallas, his demeanor conveying the importance of his message. He speaks directly to Claudius, announcing the birth of the child with clear and excited pronouncements, fulfilling his duty as a messenger with efficiency and immediacy.',
        ap.emotional_state = 'The slave is animated and excited, reflecting the joyful nature of the news he carries. His urgency suggests an awareness of the significance of the event for Claudius and the imperial household. He is focused on delivering the message effectively and eliciting a positive reaction from the Emperor, likely experiencing a vicarious sense of excitement and anticipation.',
        ap.emotional_tags = ["the slave is animated", "excited, reflecting the joyful nature of the news he carries. his urgency suggests an awareness of the significance of the event for claudius", "the imperial household. he is focused on delivering the message effectively", "eliciting a positive reaction from the emperor, likely experiencing a vicarious sense of excitement", "anticipation.", "the slave is animated and excited", "reflecting the joyful nature of the news he carries. his urgency suggests an awareness of the significance of the event for claudius and the imperial household. he is focused on delivering the message effectively and eliciting a positive reaction from the emperor", "likely experiencing a vicarious sense of excitement and anticipation."],
        ap.active_plans = ["To interrupt the ongoing meeting in Claudius's study without hesitation.", "To clearly and urgently announce the birth of Claudius's child, specifying that it is a girl.", "To await Claudius's reaction and any further instructions, demonstrating deference and respect."],
        ap.beliefs = ["Delivering news, especially of births within the imperial family, is a critical duty.", "Prompt and respectful communication with Caesar is paramount for a slave's service.", "The birth of a royal child is a momentous occasion that warrants immediate and urgent announcement."],
        ap.goals = ["Short-term: To successfully and swiftly deliver the news of the birth to Claudius.", "Medium-term: To perform his duties as a slave and messenger effectively, ensuring he is seen as reliable and efficient.", "Ultimate: To maintain his position within Claudius's household by consistently serving his master's needs and expectations, avoiding reprimand and potentially earning favor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus is seated at the table in Claudius\'s study, engaged in a discussion about architectural plans for the harbor at Ostia with Claudius and Pallas. He is focused on the financial implications of the project, his attention directed towards the plans spread before them. When the slave interrupts, Narcissus acknowledges the announcement with a pragmatic nod, clarifying the news for Claudius in a matter-of-fact manner before swiftly returning to the financial discussion with Pallas after Claudius\'s departure.',
        ap.emotional_state = 'Narcissus remains composed and pragmatic throughout the interruption, his emotional state largely unaffected by the news of the birth. While acknowledging the event, his primary focus remains on the practical and financial aspects of governance. He displays a certain impatience with the interruption of state business, quickly pivoting back to the harbor project discussion with Pallas, suggesting a prioritization of pragmatic concerns over emotional or personal matters of the Emperor.',
        ap.emotional_tags = ["narcissus remains composed", "pragmatic throughout the interruption, his emotional state largely unaffected by the news of the birth. while acknowledging the event, his primary focus remains on the practical", "financial aspects of governance. he displays a certain impatience with the interruption of state business, quickly pivoting back to the harbor project discussion with pallas, suggesting a prioritization of pragmatic concerns over emotional or personal matters of the emperor.", "narcissus remains composed and pragmatic throughout the interruption", "his emotional state largely unaffected by the news of the birth. while acknowledging the event", "his primary focus remains on the practical and financial aspects of governance. he displays a certain impatience with the interruption of state business", "quickly pivoting back to the harbor project discussion with pallas", "suggesting a prioritization of pragmatic concerns over emotional or personal matters of the emperor."],
        ap.active_plans = ["To continue the discussion with Pallas regarding the financial viability and potential cost-cutting measures for the harbor project.", "To pragmatically acknowledge and clarify the slave's announcement for Claudius, ensuring the Emperor understands the news.", "To resume the financial discussion with Pallas immediately after Claudius leaves, minimizing the disruption to state business caused by the personal event."],
        ap.beliefs = ["State matters, particularly financial and infrastructural projects, are of paramount importance and should take precedence.", "Emotional displays should be minimized in the conduct of state business, prioritizing efficiency and pragmatism.", "Personal events, while acknowledged, should not significantly disrupt the ongoing operations of governance and financial planning."],
        ap.goals = ["Short-term: To efficiently conclude the discussion on the harbor survey costs and move towards actionable steps for the project.", "Medium-term: To ensure the harbor project is executed in a financially responsible manner, potentially in a way that aligns with his own financial interests in the corn trade.", "Ultimate: To solidify his influence and power within Claudius's court by demonstrating fiscal responsibility and effectively managing state finances, thereby securing his own position and wealth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Narcissus remains seated at the table, a calculating expression on his face as he leans slightly forward, fully engaged in the discussion of the harbor\'s cost. His hands gesture dismissively, indicating skepticism towards the feasibility of the project.',
        ap.emotional_state = 'Surface emotions reveal Narcissus\'s cynicism, as he expresses doubt about the harbor\'s construction. Internally, he harbors a blend of greed and opportunism, keenly aware of how the project could affect his wealth. There is a hint of tension in his brow, reflecting his concern about the implications of a more efficient harbor for his investments in the corn market.',
        ap.emotional_tags = ["surface emotions reveal narcissus's cynicism, as he expresses doubt about the harbor's construction. internally, he harbors a blend of greed", "opportunism, keenly aware of how the project could affect his wealth. there is a hint of tension in his brow, reflecting his concern about the implications of a more efficient harbor for his investments in the corn market.", "surface emotions reveal narcissus's cynicism", "as he expresses doubt about the harbor's construction. internally", "he harbors a blend of greed and opportunism", "keenly aware of how the project could affect his wealth. there is a hint of tension in his brow", "reflecting his concern about the implications of a more efficient harbor for his investments in the corn market."],
        ap.active_plans = ["To inflate the costs of the harbor project to protect personal financial interests.", "To engage in philosophical debate to distract from the real motivations at play.", "To maintain his influence over Claudius by navigating the political landscape opportunistically."],
        ap.beliefs = ["Wealth and power are the ultimate goals in governance.", "Manipulation of information is essential for maintaining control.", "The needs of the public are secondary to personal gain."],
        ap.goals = ["Short-term: To ensure the harbor project does not proceed, preserving personal profits.", "Medium-term: To retain power and influence within Claudius's court through economic maneuvering.", "Ultimate: To amass significant wealth and secure a lasting position of authority in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Pallas sits across from Narcissus, his posture relaxed yet alert, fingers steepled as he considers the implications of the harbor\'s costs. He leans back slightly, exuding a calm authority as he counters Narcissus\'s points with sharp, strategic insights.',
        ap.emotional_state = 'Pallas displays a composed facade, but beneath lies a pragmatic determination to secure his financial interests. He feels a mix of amusement and frustration at Narcissus\'s arguments, recognizing their self-serving nature. His internal state is marked by a blend of loyalty to Claudius and a self-serving desire for profit, revealing a duality in his motivations.',
        ap.emotional_tags = ["pallas displays a composed facade, but beneath lies a pragmatic determination to secure his financial interests. he feels a mix of amusement", "frustration at narcissus's arguments, recognizing their self-serving nature. his internal state is marked by a blend of loyalty to claudius", "a self-serving desire for profit, revealing a duality in his motivations.", "pallas displays a composed facade", "but beneath lies a pragmatic determination to secure his financial interests. he feels a mix of amusement and frustration at narcissus's arguments", "recognizing their self-serving nature. his internal state is marked by a blend of loyalty to claudius and a self-serving desire for profit", "revealing a duality in his motivations.", "pallas displays a composed facade,", "beneath lies a pragmatic determination to secure his financial interests. he feels a mix of amusement and frustration at narcissus's arguments, recognizing their self-serving nature. his internal state is marked by a blend of loyalty to claudius and a self-serving desire for profit, revealing a duality in his motivations."],
        ap.active_plans = ["To persuade Narcissus to acknowledge the potential downsides of the harbor project.", "To ensure that whatever decisions are made will not negatively impact his financial holdings.", "To manipulate the discussion so that the focus remains on philosophical concerns instead of the actual implications for their wealth."],
        ap.beliefs = ["Economic stability is paramount for personal success and power.", "Self-serving motives should be cleverly disguised as concern for the greater good.", "Philosophical discourse can be a useful tool to obfuscate true intentions."],
        ap.goals = ["Short-term: To delay any decisions regarding the harbor to protect his interests.", "Medium-term: To ensure that his investments in corn remain profitable and unchallenged.", "Ultimate: To solidify his role as a key advisor in Claudius's court, gaining influence over economic policies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is in a state of drowsy awakening, sitting wearily on a couch in his private suite. He is physically present but sluggish, his movements heavy with fatigue. He responds to Messalina\'s prompting, engaging in conversation about his health and daughter, his weariness evident in his posture and slow speech, punctuated by his characteristic stammer.',
        ap.emotional_state = 'Claudius displays a surface weariness, acknowledging his fatigue and feeling unwell. Beneath this, there\'s a deep-seated vulnerability and insecurity, particularly regarding his age and health in relation to his younger wife, Messalina. He craves affection and reassurance, evident in his anxious question about her love and his readiness to accept her explanation for separate bedrooms. He is also genuinely concerned about his daughter\'s teething pain, showcasing his paternal tenderness.',
        ap.emotional_tags = ["claudius displays a surface weariness, acknowledging his fatigue", "feeling unwell. beneath this, there's a deep-seated vulnerability", "insecurity, particularly regarding his age", "health in relation to his younger wife, messalina. he craves affection", "reassurance, evident in his anxious question about her love", "his readiness to accept her explanation for separate bedrooms. he is also genuinely concerned about his daughter's teething pain, showcasing his paternal tenderness.", "claudius displays a surface weariness", "acknowledging his fatigue and feeling unwell. beneath this", "there's a deep-seated vulnerability and insecurity", "particularly regarding his age and health in relation to his younger wife", "messalina. he craves affection and reassurance", "evident in his anxious question about her love and his readiness to accept her explanation for separate bedrooms. he is also genuinely concerned about his daughter's teething pain", "showcasing his paternal tenderness."],
        ap.active_plans = ["Seek medical advice from the Greek doctor recommended by Herod to address his health concerns.", "Maintain domestic tranquility and affection with Messalina, despite his underlying insecurities about their relationship.", "Continue to fulfill his duties as Emperor, even while battling fatigue and health issues, demonstrating a sense of responsibility despite his personal struggles."],
        ap.beliefs = ["Frankness, kindness, and understanding are the cornerstones of a loving relationship, principles he values and seeks to uphold.", "His age and health make him potentially less desirable to Messalina, fueling his insecurity and need for reassurance.", "Seeking medical advice from various sources is a sensible approach to managing his health, trusting in Herod's recommendation of the Greek doctor."],
        ap.goals = ["short_term\": \"To alleviate his current fatigue and health issues through medical consultation.", "medium_term\": \"To preserve his marriage and maintain a loving relationship with Messalina, navigating the complexities of their age difference and her desires.", "ultimate\": \"To secure his reign and ensure the stability and well-being of Rome, even while grappling with personal vulnerabilities and manipulative forces within his own household."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands near Claudius, adopting a posture of concerned attentiveness. She initiates the conversation, drawing attention to Claudius\'s fatigue and unwell appearance. She moves closer to him, placing a hand on his arm, a gesture designed to convey empathy and wifely care as she guides the conversation towards her desired outcome, maintaining a facade of loving concern.',
        ap.emotional_state = 'On the surface, Messalina expertly projects concern and loving solicitude for Claudius. Her tone is gentle, her expressions crafted to appear worried and sympathetic. However, beneath this facade lies a calculated manipulation. Her \'concern\' is a tool to soften Claudius and make him receptive to her request for separate bedrooms. Her internal state is driven by ambition and a desire for freedom, masked by a performance of wifely devotion. The unspoken conflict is her calculated deceit versus the genuine affection she feigns.',
        ap.emotional_tags = ["on the surface, messalina expertly projects concern", "loving solicitude for claudius. her tone is gentle, her expressions crafted to appear worried", "sympathetic. however, beneath this facade lies a calculated manipulation. her 'concern' is a tool to soften claudius", "make him receptive to her request for separate bedrooms. her internal state is driven by ambition", "a desire for freedom, masked by a performance of wifely devotion. the unspoken conflict is her calculated deceit versus the genuine affection she feigns.", "on the surface", "messalina expertly projects concern and loving solicitude for claudius. her tone is gentle", "her expressions crafted to appear worried and sympathetic. however", "beneath this facade lies a calculated manipulation. her 'concern' is a tool to soften claudius and make him receptive to her request for separate bedrooms. her internal state is driven by ambition and a desire for freedom", "masked by a performance of wifely devotion. the unspoken conflict is her calculated deceit versus the genuine affection she feigns."],
        ap.active_plans = ["Manipulate Claudius into agreeing to sleep in separate bedrooms by playing on his insecurities and desire to please her.", "Maintain her public image as a loving and devoted wife to Claudius, reinforcing her position and influence within the court.", "Subtly guide Claudius towards trusting the Greek doctor recommended by Herod, potentially as part of a larger, undisclosed scheme."],
        ap.beliefs = ["Deception and manipulation are acceptable and necessary tools to achieve her personal and political objectives.", "Claudius is easily swayed by emotional appeals and flattery, making him susceptible to her manipulations.", "Maintaining a facade of marital harmony is crucial for preserving her power and freedom of action within the imperial court."],
        ap.goals = ["short_term\": \"To successfully persuade Claudius to allow them to sleep in separate bedrooms without arousing his suspicion or damaging his affection for her.", "medium_term\": \"To increase her personal freedom and autonomy within the palace, enabling her to pursue her own agendas and relationships unhindered.", "ultimate\": \"To consolidate and expand her power and influence within Rome, potentially to a level where she wields significant control, operating from a position of apparent wifely devotion but actual dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands near Claudius, her posture slightly leaning towards him, signaling both concern and intimacy. She places a gentle hand on his arm, a gesture emphasizing her emotional investment in the conversation. Her movements are deliberate and measured, exuding an air of calm authority as she navigates their delicate discussion.',
        ap.emotional_state = 'Messalina\'s surface emotions are tinged with genuine concern for Claudius\'s health, evident in her caring tone and attentive demeanor. Internally, she displays a complex blend of love and strategic manipulation; she recognizes the potential risks of a third pregnancy but also sees an opportunity to assert control over their relationship dynamics. Her unspoken motivation is to safeguard their marriage while simultaneously pursuing her own ambitions.',
        ap.emotional_tags = ["messalina's surface emotions are tinged with genuine concern for claudius's health, evident in her caring tone", "attentive demeanor. internally, she displays a complex blend of love", "strategic manipulation; she recognizes the potential risks of a third pregnancy but also sees an opportunity to assert control over their relationship dynamics. her unspoken motivation is to safeguard their marriage while simultaneously pursuing her own ambitions.", "messalina's surface emotions are tinged with genuine concern for claudius's health", "evident in her caring tone and attentive demeanor. internally", "she displays a complex blend of love and strategic manipulation; she recognizes the potential risks of a third pregnancy but also sees an opportunity to assert control over their relationship dynamics. her unspoken motivation is to safeguard their marriage while simultaneously pursuing her own ambitions.", "messalina's surface emotions are tinged with genuine concern for claudius's health, evident in her caring tone and attentive demeanor. internally, she displays a complex blend of love and strategic manipulation", "she recognizes the potential risks of a third pregnancy but also sees an opportunity to assert control over their relationship dynamics. her unspoken motivation is to safeguard their marriage while simultaneously pursuing her own ambitions.", "messalina's surface emotions are tinged with genuine concern for claudius's health, evident in her caring tone and attentive demeanor. internally, she displays a complex blend of love and strategic manipulation; she recognizes the potential risks of a third pregnancy but also sees an opportunity to assert control over their relationship dynamics. her unspoken motivation is to safeguard their marriage", "simultaneously pursuing her own ambitions.", "messalina's surface emotions are tinged with genuine concern for claudius's health, evident in her caring tone and attentive demeanor. internally, she displays a complex blend of love and strategic manipulation; she recognizes the potential risks of a third pregnancy", "also sees an opportunity to assert control over their relationship dynamics. her unspoken motivation is to safeguard their marriage while simultaneously pursuing her own ambitions."],
        ap.active_plans = ["Propose a temporary separation to avoid the risks of another pregnancy.", "Reassure Claudius of her affection to mitigate his insecurities.", "Utilize the proposal to establish boundaries in their relationship while maintaining emotional intimacy."],
        ap.beliefs = ["Preserving the emotional bond with Claudius is essential for their marriage.", "Strategic manipulation is necessary to navigate the complexities of their relationship.", "Her role as a wife can coexist with her ambitions for power."],
        ap.goals = ["Short-term: To initiate a conversation about sleeping arrangements without instigating conflict.", "Medium-term: To ensure Claudius feels secure in their love while reducing the risk of another pregnancy.", "Ultimate: To maintain her influence over Claudius and shape their relationship according to her needs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits wearily on the couch, his body language expressing fatigue and vulnerability. His posture is slightly slumped, indicating the weight of his responsibilities as Emperor. He engages in the conversation with a hesitant stammer, revealing his caution and insecurity about their relationship.',
        ap.emotional_state = 'Surface emotions reflect anxiety and insecurity regarding Messalina\'s proposal, as he fears it may signal a waning of her affection. Internally, he grapples with his vulnerability as an aging husband, feeling the pressure of maintaining intimacy despite his advanced age. Claudius\'s underlying conflict emerges from his desire for closeness juxtaposed with the fear of rejection.',
        ap.emotional_tags = ["surface emotions reflect anxiety", "insecurity regarding messalina's proposal, as he fears it may signal a waning of her affection. internally, he grapples with his vulnerability as an aging husband, feeling the pressure of maintaining intimacy despite his advanced age. claudius's underlying conflict emerges from his desire for closeness juxtaposed with the fear of rejection.", "surface emotions reflect anxiety and insecurity regarding messalina's proposal", "as he fears it may signal a waning of her affection. internally", "he grapples with his vulnerability as an aging husband", "feeling the pressure of maintaining intimacy despite his advanced age. claudius's underlying conflict emerges from his desire for closeness juxtaposed with the fear of rejection."],
        ap.active_plans = ["Express concern for Messalina's well-being and their relationship.", "Seek reassurance about her feelings towards him.", "Consider the implications of her proposal and respond thoughtfully."],
        ap.beliefs = ["Love requires physical closeness and intimacy.", "His age and perceived inadequacies may threaten his marriage.", "Communication is crucial in navigating their relationship dynamics."],
        ap.goals = ["Short-term: To understand Messalina's intentions behind her proposal.", "Medium-term: To preserve their intimacy and emotional connection.", "Ultimate: To maintain a harmonious marriage amid the pressures of imperial life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits heavily on a couch in his private chamber, his posture slumped with weariness. He speaks slowly, initially disoriented, as if just waking from a deep sleep. He focuses on Messalina, reacting to her words and observing her demeanor, trying to decipher her intentions behind the request for separation. His movements are minimal, reflecting his physical and emotional exhaustion.',
        ap.emotional_state = 'Beneath a veneer of fatigue, Claudius is deeply insecure and vulnerable. He outwardly expresses confusion and a hint of sadness at Messalina\'s request, questioning her love. Internally, he grapples with fear of rejection and abandonment, amplified by his age and perceived inadequacies. He is emotionally fragile, desperately seeking reassurance of Messalina\'s affection, while simultaneously battling a deep-seated anxiety about losing her, revealing a profound emotional dependency on his younger wife.',
        ap.emotional_tags = ["beneath a veneer of fatigue, claudius is deeply insecure", "vulnerable. he outwardly expresses confusion", "a hint of sadness at messalina's request, questioning her love. internally, he grapples with fear of rejection", "abandonment, amplified by his age", "perceived inadequacies. he is emotionally fragile, desperately seeking reassurance of messalina's affection, while simultaneously battling a deep-seated anxiety about losing her, revealing a profound emotional dependency on his younger wife.", "beneath a veneer of fatigue", "claudius is deeply insecure and vulnerable. he outwardly expresses confusion and a hint of sadness at messalina's request", "questioning her love. internally", "he grapples with fear of rejection and abandonment", "amplified by his age and perceived inadequacies. he is emotionally fragile", "desperately seeking reassurance of messalina's affection", "while simultaneously battling a deep-seated anxiety about losing her", "revealing a profound emotional dependency on his younger wife.", "beneath a veneer of fatigue, claudius is deeply insecure and vulnerable. he outwardly expresses confusion and a hint of sadness at messalina's request, questioning her love. internally, he grapples with fear of rejection and abandonment, amplified by his age and perceived inadequacies. he is emotionally fragile, desperately seeking reassurance of messalina's affection,", "simultaneously battling a deep-seated anxiety about losing her, revealing a profound emotional dependency on his younger wife."],
        ap.active_plans = ["To understand the real reason behind Messalina's request for separate bedrooms.", "To seek reassurance of Messalina's love and continued affection despite her proposition.", "To subtly negotiate a compromise that maintains some level of intimacy, like sharing the same bed, even if separate rooms are agreed upon."],
        ap.beliefs = ["He believes in the 'temple of love' pillars: frankness, kindness, and understanding, hoping they apply to their current situation.", "He believes his age makes him less desirable and that Messalina might be losing interest in him.", "He believes that physical intimacy is a crucial component of marriage and love, and separation might signify a decline in their relationship."],
        ap.goals = ["Short-term: To elicit a clear and honest explanation from Messalina regarding her desire for separate bedrooms.", "Medium-term: To maintain a sense of closeness and intimacy with Messalina despite the proposed physical separation.", "Ultimate: To preserve his marriage and ensure Messalina's continued love and devotion, solidifying his sense of security and emotional well-being within the relationship."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands close to Claudius, initially presenting a facade of concern and attentiveness. She moves deliberately, placing a hand on his arm in a gesture of feigned affection and reassurance. Her posture is controlled and poised, suggesting a calculated approach to the conversation. She uses her physical presence to manipulate Claudius emotionally, ensuring she remains the focus of his attention and softens him for her request.',
        ap.emotional_state = 'Messalina outwardly displays concern and loving affection for Claudius, using terms of endearment and gentle touches to manipulate his emotions. Internally, she is cold and calculating, driven by her ambition to gain personal freedom and control over the relationship. Her \'concern\' is a performance, masking her true objective. There is a stark contrast between her saccharine words and her underlying, self-serving intentions, revealing her mastery of deception and emotional manipulation.',
        ap.emotional_tags = ["messalina outwardly displays concern", "loving affection for claudius, using terms of endearment", "gentle touches to manipulate his emotions. internally, she is cold", "calculating, driven by her ambition to gain personal freedom", "control over the relationship. her 'concern' is a performance, masking her true objective. there is a stark contrast between her saccharine words", "her underlying, self-serving intentions, revealing her mastery of deception", "emotional manipulation.", "messalina outwardly displays concern and loving affection for claudius", "using terms of endearment and gentle touches to manipulate his emotions. internally", "she is cold and calculating", "driven by her ambition to gain personal freedom and control over the relationship. her 'concern' is a performance", "masking her true objective. there is a stark contrast between her saccharine words and her underlying", "self-serving intentions", "revealing her mastery of deception and emotional manipulation."],
        ap.active_plans = ["To convince Claudius that separate bedrooms are her idea to protect their marriage and his health, not a rejection of him.", "To preemptively address Claudius's insecurities about her love for him, reassuring him verbally and physically to prevent resistance.", "To frame the separation as a playful and temporary arrangement, suggesting future 'secret' encounters to maintain his desire and control the narrative of their intimacy."],
        ap.beliefs = ["She believes Claudius is easily manipulated through emotional appeals and flattery, especially concerning his insecurities about their age difference and her affection.", "She believes that controlling the narrative around their intimacy is crucial for maintaining her power within the marriage and achieving her personal goals.", "She believes that a show of concern and 'selflessness' will effectively mask her true, self-serving motives and make her request more palatable to Claudius."],
        ap.goals = ["Short-term: To successfully persuade Claudius to agree to separate bedrooms without arousing suspicion or damaging her carefully constructed image as a loving wife.", "Medium-term: To gain personal freedom and autonomy by establishing physical separation, allowing her to pursue her own agendas unchecked while maintaining the public appearance of a devoted empress.", "Ultimate: To solidify her power and influence within the imperial court and potentially beyond, using her control over Claudius and the facade of their marriage as key instruments in her ascent."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Pallas enters the private suite with an air of formal deference, standing upright and poised. His demeanor is composed, reflecting both his role as a servant of the Emperor and his understanding of the political tension surrounding Claudius. He announces the arrival of Silanus with a respectful bow, his words measured and professional.',
        ap.emotional_state = 'While outwardly calm, Pallas conceals a deeper current of anxiety, acutely aware of the volatile dynamics at play within the palace. His expression remains neutral, yet there\'s an undercurrent of concern for Claudius, knowing that Silanus\'s arrival may shift the balance of power. The tension in the air is palpable, hinting at the potentially explosive impact of the meeting.',
        ap.emotional_tags = ["while outwardly calm", "pallas conceals a deeper current of anxiety", "acutely aware of the volatile dynamics at play within the palace. his expression remains neutral", "yet there's an undercurrent of concern for claudius", "knowing that silanus's arrival may shift the balance of power. the tension in the air is palpable", "hinting at the potentially explosive impact of the meeting."],
        ap.active_plans = ["To inform Claudius promptly about Silanus's arrival, adhering to the Emperor's request.", "To maintain a professional distance while gauging the atmosphere and dynamics in the suite.", "To observe and report any significant developments that may arise from the meeting between Claudius and Silanus."],
        ap.beliefs = ["Loyalty to Claudius is paramount, and he believes in the necessity of maintaining order in a chaotic political landscape.", "Knowledge is power, and observing the interactions between Claudius and Silanus is crucial for making informed decisions.", "The Roman court is a dangerous place, and manipulation is a constant threat that requires vigilance."],
        ap.goals = ["Short-term: To convey information about Silanus's arrival without delay.", "Medium-term: To support Claudius in navigating the complexities of his rule and to protect him from potential threats.", "Ultimate: To ensure the stability of Claudius's reign and preserve order within the empire amidst growing tensions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits within the confines of his private suite, his posture slightly slumped, betraying the weight of his responsibilities. He responds to Pallas\'s announcement with a sense of mild surprise and acquiescence, indicating a desire to please both his wife and the noble Silanus. His speech is punctuated by his characteristic stammer, revealing his ongoing struggle with confidence.',
        ap.emotional_state = 'Claudius exhibits a veneer of calm but is internally conflicted. He feels a mix of anticipation and anxiety regarding Silanus\'s arrival, acutely aware of the political implications. The tension with Messalina adds to his unease, as he grapples with the precariousness of his position and the genuine desire to maintain harmony in his marriage.',
        ap.emotional_tags = ["claudius exhibits a veneer of calm but is internally conflicted. he feels a mix of anticipation", "anxiety regarding silanus's arrival, acutely aware of the political implications. the tension with messalina adds to his unease, as he grapples with the precariousness of his position", "the genuine desire to maintain harmony in his marriage.", "claudius exhibits a veneer of calm but is internally conflicted. he feels a mix of anticipation and anxiety regarding silanus's arrival", "acutely aware of the political implications. the tension with messalina adds to his unease", "as he grapples with the precariousness of his position and the genuine desire to maintain harmony in his marriage.", "claudius exhibits a veneer of calm", "is internally conflicted. he feels a mix of anticipation and anxiety regarding silanus's arrival, acutely aware of the political implications. the tension with messalina adds to his unease, as he grapples with the precariousness of his position and the genuine desire to maintain harmony in his marriage."],
        ap.active_plans = ["To engage with Appius Junius Silanus and discuss matters of state that may benefit from his insights.", "To demonstrate his willingness to accommodate Messalina's wishes to strengthen their marital bond.", "To navigate the delicate balance of power between Silanus, Messalina, and himself as the Emperor."],
        ap.beliefs = ["He believes in the necessity of cooperation and seeks to cultivate goodwill among the Roman elite.", "Claudius holds a conviction that women possess wisdom in domestic matters, allowing Messalina's influence to shape his actions.", "He fears the fragility of his reign and is acutely aware that his position hinges on the support of others."],
        ap.goals = ["Short-term: To greet Silanus politely and ascertain his intentions for the meeting.", "Medium-term: To maintain a stable and supportive relationship with Messalina while managing the potential threat posed by Silanus.", "Ultimate: To secure his rule as Emperor by fostering alliances and navigating the treacherous waters of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands in the private suite, her posture confident and poised, masking her underlying scheming nature. She interjects with a decisive tone, consistently directing the flow of conversation to align with her strategic objectives. Her smile is warm and inviting, a calculated facade as she navigates the dynamics of her husband and Silanus.',
        ap.emotional_state = 'Messalina exhibits a surface-level charm, engaging warmly with Silanus, yet beneath this lies a calculating mind. She feels a sense of excitement at the prospect of asserting her influence through the separation from Claudius, viewing it as a tactical advantage in her broader ambitions. There is a clear tension between her public persona and private desires.',
        ap.emotional_tags = ["messalina exhibits a surface-level charm, engaging warmly with silanus, yet beneath this lies a calculating mind. she feels a sense of excitement at the prospect of asserting her influence through the separation from claudius, viewing it as a tactical advantage in her broader ambitions. there is a clear tension between her public persona", "private desires.", "messalina exhibits a surface-level charm", "engaging warmly with silanus", "yet beneath this lies a calculating mind. she feels a sense of excitement at the prospect of asserting her influence through the separation from claudius", "viewing it as a tactical advantage in her broader ambitions. there is a clear tension between her public persona and private desires."],
        ap.active_plans = ["To orchestrate her separation from Claudius to create an opportunity for closer ties with Silanus.", "To manipulate the situation to ensure that Silanus is aligned with her interests while remaining distanced from Claudius.", "To reinforce her role as a supportive wife while subtly consolidating her own power."],
        ap.beliefs = ["Messalina believes that power is derived from control over relationships, especially within the dynamics of marriage.", "She holds a conviction that maintaining appearances of loyalty and affection is essential for her machinations.", "Manipulation is a necessary tool in her pursuit of ambition, and she is prepared to use charm to achieve her goals."],
        ap.goals = ["Short-term: To facilitate Silanus's arrival and establish a favorable impression.", "Medium-term: To solidify her influence over both Claudius and Silanus through strategic positioning.", "Ultimate: To elevate her power and position within the empire, potentially usurping Claudius's authority through calculated maneuvers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Messalina is in command of the scene, initially feigning departure to pique Claudius\'s interest before pivoting to her true objective. She pauses her exit, turning back to Claudius with an air of thoughtful consideration, using Silanus\'s arrival as a convenient backdrop to introduce her manipulative proposition. She maintains a composed and charming demeanor, smiling at Silanus to further her facade of graciousness.',
        ap.emotional_state = 'Messalina is outwardly projecting wifely consideration and gentle persuasion, using phrases like \'if you think it would be good for our m-marriage\' to mask her manipulative intent. Beneath this veneer of concern, she is cold, calculating, and utterly self-serving. Her true emotion is ambition, a driving force masked by practiced charm. There\'s a stark disconnect between her saccharine words and her ruthless desire for greater autonomy and power, using Claudius\'s naivete to her advantage.',
        ap.emotional_tags = ["messalina is outwardly projecting wifely consideration", "gentle persuasion, using phrases like 'if you think it would be good for our m-marriage' to mask her manipulative intent. beneath this veneer of concern, she is cold, calculating,", "utterly self-serving. her true emotion is ambition, a driving force masked by practiced charm. there's a stark disconnect between her saccharine words", "her ruthless desire for greater autonomy", "power, using claudius's naivete to her advantage.", "messalina is outwardly projecting wifely consideration and gentle persuasion", "using phrases like 'if you think it would be good for our m-marriage' to mask her manipulative intent. beneath this veneer of concern", "she is cold", "calculating", "and utterly self-serving. her true emotion is ambition", "a driving force masked by practiced charm. there's a stark disconnect between her saccharine words and her ruthless desire for greater autonomy and power", "using claudius's naivete to her advantage."],
        ap.active_plans = ["Secure Claudius's immediate agreement to separate living quarters within the palace.", "Frame the separation as a mutually beneficial arrangement, ostensibly for the good of their marriage, thus deflecting suspicion.", "Utilize Silanus's arrival as a catalyst and justification for her proposal, making it seem like a spontaneous, well-timed suggestion rather than a pre-planned maneuver."],
        ap.beliefs = ["She believes Claudius is easily manipulated and will readily accept her suggestions if presented with enough charm and a veneer of logic.", "She believes separate suites are essential to achieving her broader ambitions and maintaining control over her own actions without Claudius's interference.", "She believes her own intelligence and cunning far surpass those of Claudius and the men around her, granting her the ability to orchestrate events to her advantage."],
        ap.goals = ["short_term\": \"To immediately obtain Claudius's verbal consent to move into a separate suite, solidifying the first step of her plan.", "medium_term\": \"To establish physical and emotional distance from Claudius, granting her greater freedom of movement and reduced scrutiny over her activities.", "ultimate\": \"To consolidate her own power and influence within the Roman court, potentially positioning herself as the true power behind the throne, free from the constraints of a close marital relationship with Claudius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is physically present and receptive to Messalina\'s suggestions, demonstrating a passive and agreeable posture. He readily concedes to her proposal of separate suites, stammering his agreement and deferring to her perceived wisdom on marital matters. He welcomes Silanus with polite formality but seems primarily focused on Messalina\'s pronouncements and desires.',
        ap.emotional_state = 'Claudius is emotionally naive and trusting, readily accepting Messalina\'s manipulative framing of the separation as being \'good for our m-marriage\'. He exhibits a desire for domestic harmony and is eager to please Messalina, even if it means agreeing to a potentially isolating arrangement. There\'s a hint of insecurity in his reliance on her judgment (\'Women know more about these matters than men\'), suggesting a vulnerability to her manipulations and a deep-seated loneliness masked by his imperial facade. He appears genuinely clueless about Messalina\'s true intentions, accepting her performance at face value.',
        ap.emotional_tags = ["claudius is emotionally naive", "trusting, readily accepting messalina's manipulative framing of the separation as being 'good for our m-marriage'. he exhibits a desire for domestic harmony", "is eager to please messalina, even if it means agreeing to a potentially isolating arrangement. there's a hint of insecurity in his reliance on her judgment ('women know more about these matters than men'), suggesting a vulnerability to her manipulations", "a deep-seated loneliness masked by his imperial facade. he appears genuinely clueless about messalina's true intentions, accepting her performance at face value.", "claudius is emotionally naive and trusting", "readily accepting messalina's manipulative framing of the separation as being 'good for our m-marriage'. he exhibits a desire for domestic harmony and is eager to please messalina", "even if it means agreeing to a potentially isolating arrangement. there's a hint of insecurity in his reliance on her judgment ('women know more about these matters than men')", "suggesting a vulnerability to her manipulations and a deep-seated loneliness masked by his imperial facade. he appears genuinely clueless about messalina's true intentions", "accepting her performance at face value."],
        ap.active_plans = ["Agree with Messalina's proposal to avoid conflict and maintain a semblance of domestic peace, however misguided.", "Politely welcome Silanus as a new advisor, fulfilling his imperial duties of courtly reception.", "Delegate the practical arrangements for the separation to his servants, demonstrating a detachment from the personal implications of Messalina's scheme and focusing on the administrative aspects."],
        ap.beliefs = ["He believes Messalina is acting in their shared marital interest, or at least is offering a sensible solution to some perceived marital tension, however fabricated by her.", "He believes in traditional gender roles, accepting the notion that women possess superior insight into matters of the heart and domestic life.", "He believes that maintaining outward appearances of harmony and order are crucial to his reign, even if it means overlooking or ignoring potential underlying issues and manipulations."],
        ap.goals = ["short_term\": \"To quickly resolve the immediate situation by agreeing with Messalina and avoiding any potential marital discord or argument.", "medium_term\": \"To maintain a superficial sense of marital stability and public image, even if it is based on a foundation of deceit and separation.", "ultimate\": \"To achieve a peaceful and stable reign, believing that domestic tranquility, however illusory, contributes to overall imperial stability, remaining tragically unaware of the true threat posed by Messalina's ambition to his rule and his life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his private suite, his posture slightly slumped yet eager, as he engages with Pallas and prepares to welcome Silanus. His response to Messalina\'s suggestion shows a blend of trust and naive compliance, indicating his reliance on her judgment.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect a mix of anxious eagerness and misplaced confidence; he smiles at Messalina\'s suggestion, interpreting it as thoughtful wisdom. Internally, he grapples with vulnerability and a desire for approval, blissfully unaware of the manipulative undertones driving Messalina\'s actions. His internal conflict lies in his affection for her clashing with the growing realization of his political insignificance.',
        ap.emotional_tags = ["claudius's surface emotions reflect a mix of anxious eagerness", "misplaced confidence; he smiles at messalina's suggestion, interpreting it as thoughtful wisdom. internally, he grapples with vulnerability", "a desire for approval, blissfully unaware of the manipulative undertones driving messalina's actions. his internal conflict lies in his affection for her clashing with the growing realization of his political insignificance.", "claudius's surface emotions reflect a mix of anxious eagerness and misplaced confidence; he smiles at messalina's suggestion", "interpreting it as thoughtful wisdom. internally", "he grapples with vulnerability and a desire for approval", "blissfully unaware of the manipulative undertones driving messalina's actions. his internal conflict lies in his affection for her clashing with the growing realization of his political insignificance.", "claudius's surface emotions reflect a mix of anxious eagerness and misplaced confidence", "he smiles at messalina's suggestion, interpreting it as thoughtful wisdom. internally, he grapples with vulnerability and a desire for approval, blissfully unaware of the manipulative undertones driving messalina's actions. his internal conflict lies in his affection for her clashing with the growing realization of his political insignificance."],
        ap.active_plans = ["To maintain harmony in his marriage by complying with Messalina's wishes.", "To welcome Appius Junius Silanus and establish a rapport that benefits his reign.", "To navigate the complexities of his new role without upsetting the fragile dynamics within the palace."],
        ap.beliefs = ["Women possess greater wisdom regarding emotional matters than men.", "Maintaining a peaceful domestic life is essential for a stable reign.", "Trusting Messalina is crucial for binding their marital alliance."],
        ap.goals = ["Short-term: To accommodate Messalina's request for a separate suite to preserve their marriage.", "Medium-term: To position himself as a benevolent and trusting ruler in the eyes of his court.", "Ultimate: To secure a lasting legacy as a respected Emperor, despite his shortcomings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands confidently in the suite, her posture poised and commanding as she speaks with Claudius. Her actions are deliberate, guiding the conversation towards her proposal with an air of authority, masking her true intentions behind a facade of marital concern.',
        ap.emotional_state = 'Messalina\'s outward demeanor is charming and sweetly persuasive, but beneath lies a calculating mind, reveling in the manipulation of Claudius. Her internal state is layered with ambition and satisfaction; she feels empowered by the control she exerts over both Claudius and Silanus. The emotional contradiction surfaces as she feigns loyalty while plotting her ascent to power.',
        ap.emotional_tags = ["messalina's outward demeanor is charming", "sweetly persuasive, but beneath lies a calculating mind, reveling in the manipulation of claudius. her internal state is layered with ambition", "satisfaction; she feels empowered by the control she exerts over both claudius", "silanus. the emotional contradiction surfaces as she feigns loyalty while plotting her ascent to power.", "messalina's outward demeanor is charming and sweetly persuasive", "but beneath lies a calculating mind", "reveling in the manipulation of claudius. her internal state is layered with ambition and satisfaction; she feels empowered by the control she exerts over both claudius and silanus. the emotional contradiction surfaces as she feigns loyalty while plotting her ascent to power.", "messalina's outward demeanor is charming and sweetly persuasive, but beneath lies a calculating mind, reveling in the manipulation of claudius. her internal state is layered with ambition and satisfaction", "she feels empowered by the control she exerts over both claudius and silanus. the emotional contradiction surfaces as she feigns loyalty while plotting her ascent to power.", "messalina's outward demeanor is charming and sweetly persuasive, but beneath lies a calculating mind, reveling in the manipulation of claudius. her internal state is layered with ambition and satisfaction; she feels empowered by the control she exerts over both claudius and silanus. the emotional contradiction surfaces as she feigns loyalty", "plotting her ascent to power.", "messalina's outward demeanor is charming and sweetly persuasive,", "beneath lies a calculating mind, reveling in the manipulation of claudius. her internal state is layered with ambition and satisfaction; she feels empowered by the control she exerts over both claudius and silanus. the emotional contradiction surfaces as she feigns loyalty while plotting her ascent to power."],
        ap.active_plans = ["To manipulate Claudius into agreeing to her proposal for a separate suite, securing her position and freedom.", "To maintain the guise of a devoted wife while simultaneously positioning Silanus as a potential ally or pawn.", "To consolidate her influence over Claudius by demonstrating her perceived care for their marriage and family."],
        ap.beliefs = ["Power and influence are best acquired through cunning and manipulation.", "A woman's strength lies in her ability to control perceptions and emotions.", "Her marriage to Claudius is a means to an end; loyalty is secondary to her ambitions."],
        ap.goals = ["Short-term: To successfully arrange living arrangements that enhance her control over Claudius.", "Medium-term: To cement alliances with key figures like Silanus to further her political ambitions.", "Ultimate: To establish herself as a co-ruler beside Claudius, wielding power from the shadows."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Messalina stands gracefully in the imperial suite, engaging in conversation with Claudius and Pallas. She listens attentively to Claudius\'s stammered agreement about separate bedrooms, then swiftly escalates the situation. With a decisive air, she proposes moving her entire residence to a suite near her mother in the new palace wing, citing the location of her offices as a practical reason. Her movements are fluid and controlled, her posture confident as she manipulates the situation to her advantage.',
        ap.emotional_state = 'On the surface, Messalina projects an image of wifely consideration and practical sense. She smiles charmingly and speaks in a sweet, agreeable tone, feigning concern for the well-being of her marriage and Claudius\'s wishes. However, beneath this facade lies a calculating ambition. She is coolly determined and subtly triumphant, feeling a surge of power as her plan for greater autonomy takes shape. There is a distinct lack of genuine emotion; her outward expressions are carefully crafted tools to achieve her strategic goals.',
        ap.emotional_tags = ["on the surface, messalina projects an image of wifely consideration", "practical sense. she smiles charmingly", "speaks in a sweet, agreeable tone, feigning concern for the well-being of her marriage", "claudius's wishes. however, beneath this facade lies a calculating ambition. she is coolly determined", "subtly triumphant, feeling a surge of power as her plan for greater autonomy takes shape. there is a distinct lack of genuine emotion; her outward expressions are carefully crafted tools to achieve her strategic goals.", "on the surface", "messalina projects an image of wifely consideration and practical sense. she smiles charmingly and speaks in a sweet", "agreeable tone", "feigning concern for the well-being of her marriage and claudius's wishes. however", "beneath this facade lies a calculating ambition. she is coolly determined and subtly triumphant", "feeling a surge of power as her plan for greater autonomy takes shape. there is a distinct lack of genuine emotion; her outward expressions are carefully crafted tools to achieve her strategic goals.", "on the surface, messalina projects an image of wifely consideration and practical sense. she smiles charmingly and speaks in a sweet, agreeable tone, feigning concern for the well-being of her marriage and claudius's wishes. however, beneath this facade lies a calculating ambition. she is coolly determined and subtly triumphant, feeling a surge of power as her plan for greater autonomy takes shape. there is a distinct lack of genuine emotion", "her outward expressions are carefully crafted tools to achieve her strategic goals."],
        ap.active_plans = ["To fully separate herself from Claudius's direct control and scrutiny, establishing physical and operational independence.", "To manipulate Claudius into believing the separation is his idea or mutually beneficial, thus avoiding suspicion and maintaining her position.", "To strengthen her alliance and proximity to her mother, Domitia, potentially for collaborative scheming and mutual support in their power plays."],
        ap.beliefs = ["She believes that physical separation from Claudius is crucial for her to exert greater power and pursue her own ambitions without hindrance.", "She believes Claudius is naive and easily swayed by her charm and carefully constructed justifications, making him a manageable obstacle.", "She believes that consolidating her influence and independence is essential for her long-term goals of power and control within the Roman court."],
        ap.goals = ["Short-term Goal: To secure Claudius's immediate and unquestioning approval for her relocation to the new palace suite.", "Medium-term Goal: To establish a more autonomous sphere of influence within the palace, operating independently of Claudius's direct oversight.", "Ultimate Goal: To become a dominant power player in Rome, potentially surpassing Claudius in influence and control, using her newfound independence as a strategic advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Pallas enters the private suite with a formal demeanor, announcing the arrival of Appius Junius Silanus to Caesar. He stands upright, exuding confidence and authority, reflecting his role as a trusted advisor in this delicate moment.',
        ap.emotional_state = 'Pallas maintains a professional composure, though beneath the surface lies an awareness of the political currents swirling around him. He is keenly observant, recognizing the gravity of Silanus\'s arrival and the implications it holds for Claudius’s reign.',
        ap.emotional_tags = ["pallas maintains a professional composure, though beneath the surface lies an awareness of the political currents swirling around him. he is keenly observant, recognizing the gravity of silanus's arrival", "the implications it holds for claudius\u2019s reign.", "pallas maintains a professional composure", "though beneath the surface lies an awareness of the political currents swirling around him. he is keenly observant", "recognizing the gravity of silanus's arrival and the implications it holds for claudius\u2019s reign."],
        ap.active_plans = ["To ensure Claudius is informed about Silanus's arrival at the opportune moment.", "To maintain the decorum and formality expected in the presence of the Emperor and a visiting Senator.", "To navigate the political landscape by acting as a stabilizing force amidst the shifting allegiances."],
        ap.beliefs = ["Political stability is essential for the Empire's survival.", "Loyalty to Claudius is paramount, even as the court becomes increasingly treacherous.", "Understanding the dynamics of power is critical in advising the Emperor effectively."],
        ap.goals = ["Short-term: Facilitate a smooth introduction for Silanus to Claudius.", "Medium-term: Strengthen Claudius's position by ensuring he is adequately informed and prepared for upcoming political challenges.", "Ultimate: Secure a lasting order in the Empire amidst the chaotic power struggles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated in his private suite, his posture relaxed yet subtly marked by the weight of his position. He responds to Pallas with a measured tone, revealing both his authority and his characteristic stammer as he contemplates the implications of Silanus\'s arrival.',
        ap.emotional_state = 'On the surface, Claudius appears composed, eager to welcome Silanus. However, internally, he grapples with anxiety and uncertainty, aware that the political landscape is fraught with potential betrayal. His stutter betrays his nervousness as he navigates the expectations of leadership.',
        ap.emotional_tags = ["on the surface, claudius appears composed, eager to welcome silanus. however, internally, he grapples with anxiety", "uncertainty, aware that the political landscape is fraught with potential betrayal. his stutter betrays his nervousness as he navigates the expectations of leadership.", "on the surface", "claudius appears composed", "eager to welcome silanus. however", "internally", "he grapples with anxiety and uncertainty", "aware that the political landscape is fraught with potential betrayal. his stutter betrays his nervousness as he navigates the expectations of leadership."],
        ap.active_plans = ["To engage with Silanus and assess his intentions regarding the Senate.", "To maintain a facade of confidence and authority in front of his advisors and guests.", "To explore potential alliances that could strengthen his rule amidst the Senate\u2019s ambitions."],
        ap.beliefs = ["Leadership requires both strength and sensitivity to the complexities of human relationships.", "Betrayal is an ever-present threat in the political arena.", "Every interaction holds the potential for both alliance and conflict."],
        ap.goals = ["Short-term: Successfully greet and converse with Silanus to gauge his loyalty and intentions.", "Medium-term: Establish a rapport with Silanus to utilize his Republican ideals for stability.", "Ultimate: Reinforce his position as Emperor while navigating the treacherous political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Silanus enters the suite with a respectful bow, his demeanor poised and serious. He carries the weight of his journey, both physically and metaphorically, reflecting his status as a Senator entangled in the complexities of Roman politics.',
        ap.emotional_state = 'Silanus is outwardly composed but inwardly charged with a mix of resentment and hope. He views this meeting as an opportunity to align himself with Claudius but is acutely aware of the dangers that such an alliance may entail.',
        ap.emotional_tags = ["silanus is outwardly composed but inwardly charged with a mix of resentment", "hope. he views this meeting as an opportunity to align himself with claudius but is acutely aware of the dangers that such an alliance may entail.", "silanus is outwardly composed", "inwardly charged with a mix of resentment and hope. he views this meeting as an opportunity to align himself with claudius", "is acutely aware of the dangers that such an alliance may entail."],
        ap.active_plans = ["To present himself as a loyal ally to Claudius and gauge the political atmosphere.", "To explore the potential for influence within the new court and assert his Republican ideals.", "To reconnect with Messalina, hoping that their shared past could aid his political aspirations."],
        ap.beliefs = ["The ideals of the Republic must be preserved, regardless of personal risk.", "Ambition and loyalty are often at odds in the treacherous waters of Roman politics.", "Personal connections can be leveraged for political advantage."],
        ap.goals = ["Short-term: Make a positive impression on Claudius and establish his purpose for visiting.", "Medium-term: Secure a position of influence within Claudius's court, potentially reestablishing his status.", "Ultimate: Restore the ideals of the Republic and combat the autocracy through strategic alliances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in his private suite, greeting Silanus with a hesitant cordiality. He gestures slightly, indicating a welcome, his posture suggesting a man attempting to fulfill the expected role of an Emperor receiving a dignitary, though a subtle awkwardness underlies his movements. He is physically present but seems somewhat reliant on Messalina to navigate the social interaction smoothly.',
        ap.emotional_state = 'Claudius is outwardly attempting to project a welcoming and gracious demeanor, masking an inner current of unease and perhaps a touch of social anxiety. He appears somewhat relieved to have Messalina present to manage the social niceties, suggesting an underlying insecurity in these kinds of interactions. Beneath the surface, he is likely preoccupied with the complexities of state and his own self-doubt, hoping to project authority but feeling uncertain.',
        ap.emotional_tags = ["claudius is outwardly attempting to project a welcoming", "gracious demeanor, masking an inner current of unease", "perhaps a touch of social anxiety. he appears somewhat relieved to have messalina present to manage the social niceties, suggesting an underlying insecurity in these kinds of interactions. beneath the surface, he is likely preoccupied with the complexities of state", "his own self-doubt, hoping to project authority but feeling uncertain.", "claudius is outwardly attempting to project a welcoming and gracious demeanor", "masking an inner current of unease and perhaps a touch of social anxiety. he appears somewhat relieved to have messalina present to manage the social niceties", "suggesting an underlying insecurity in these kinds of interactions. beneath the surface", "he is likely preoccupied with the complexities of state and his own self-doubt", "hoping to project authority but feeling uncertain.", "claudius is outwardly attempting to project a welcoming and gracious demeanor, masking an inner current of unease and perhaps a touch of social anxiety. he appears somewhat relieved to have messalina present to manage the social niceties, suggesting an underlying insecurity in these kinds of interactions. beneath the surface, he is likely preoccupied with the complexities of state and his own self-doubt, hoping to project authority", "feeling uncertain."],
        ap.active_plans = ["To appear welcoming and gracious to Silanus, as befits an Emperor receiving a noble.", "To maintain a semblance of cordiality in his interactions, even if he feels personally awkward.", "To rely on Messalina's social skills to ensure the encounter proceeds smoothly."],
        ap.beliefs = ["He believes in the importance of maintaining social protocols and decorum, even in political situations.", "He believes Messalina possesses superior social acumen and trusts her judgment in social matters.", "He believes that appearing strong and in control is essential for an Emperor, even if he doesn't feel it internally."],
        ap.goals = ["Short-term: To successfully navigate this initial meeting with Silanus without social blunder.", "Medium-term: To establish a working relationship with Silanus, potentially leveraging his experience for the empire.", "Ultimate: To secure his reign and maintain order in Rome, which he believes requires appearing competent and in control, even when he feels otherwise."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Messalina is present in Claudius\'s suite, initially appearing to be part of the welcoming party. However, her actions quickly reveal a different agenda. She engages in brief, charming pleasantries with Silanus, her smile calculated and controlled. She uses the moment of Silanus\'s arrival as a pretext to announce her departure and the move to separate bedrooms, executing her plan with swift efficiency and masking her true intentions behind a facade of wifely consideration.',
        ap.emotional_state = 'Messalina projects an outward appearance of charm and politeness, especially towards Silanus, her smile and words carefully calibrated to create a specific impression. Beneath this veneer, she is cold, calculating, and determined.  There\'s a sense of impatience and control in her swift execution of the bedroom separation plan, suggesting she is focused on strategic objectives and views social interactions as tools to achieve her goals. Any warmth is performative, masking her ambition.',
        ap.emotional_tags = ["messalina projects an outward appearance of charm", "politeness, especially towards silanus, her smile", "words carefully calibrated to create a specific impression. beneath this veneer, she is cold, calculating,", "determined.  there's a sense of impatience", "control in her swift execution of the bedroom separation plan, suggesting she is focused on strategic objectives", "views social interactions as tools to achieve her goals. any warmth is performative, masking her ambition.", "messalina projects an outward appearance of charm and politeness", "especially towards silanus", "her smile and words carefully calibrated to create a specific impression. beneath this veneer", "she is cold", "calculating", "and determined.  there's a sense of impatience and control in her swift execution of the bedroom separation plan", "suggesting she is focused on strategic objectives and views social interactions as tools to achieve her goals. any warmth is performative", "masking her ambition."],
        ap.active_plans = ["To use the social interaction to finalize and announce her separation from Claudius, positioning it as a mutual decision for the sake of their 'marriage'.", "To assess Silanus briefly, gauging his reaction to her charm and perhaps subtly planting seeds for future manipulation.", "To maintain a facade of wifely duty and concern, ensuring Claudius remains oblivious to her true motives and believes in her fabricated justifications."],
        ap.beliefs = ["She believes in the power of manipulation and charm to achieve her objectives.", "She believes that physical separation from Claudius is crucial for her freedom and future schemes.", "She believes that men are easily manipulated by flattery and social niceties, particularly Claudius."],
        ap.goals = ["Short-term: To successfully and convincingly establish separate living arrangements from Claudius.", "Medium-term: To increase her personal freedom and political maneuverability by distancing herself from Claudius.", "Ultimate: To consolidate her own power and influence within Rome, potentially surpassing Claudius's own authority, using any means necessary."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Silanus enters Claudius\'s suite, bowing respectfully and maintaining a formal posture. He responds to Claudius\'s greeting with polite acknowledgement of his journey. When introduced to Messalina, he offers a gallant, if somewhat traditional, compliment, acknowledging her beauty and recalling her from childhood. His physical presence is composed and dignified, reflecting his senatorial background and attempt to navigate the imperial court with appropriate decorum.',
        ap.emotional_state = 'Silanus outwardly presents a composed and respectful demeanor, masking any inner turmoil or resentment he might harbor. His politeness is likely a carefully constructed facade, hiding potential skepticism or even hostility towards Claudius and the imperial court. Beneath the surface, he could be feeling a mix of wariness, curiosity, and perhaps a sense of forced duty, trying to assess the situation and his role within it while concealing his true feelings.',
        ap.emotional_tags = ["silanus outwardly presents a composed", "respectful demeanor, masking any inner turmoil or resentment he might harbor. his politeness is likely a carefully constructed facade, hiding potential skepticism or even hostility towards claudius", "the imperial court. beneath the surface, he could be feeling a mix of wariness, curiosity,", "perhaps a sense of forced duty, trying to assess the situation", "his role within it while concealing his true feelings.", "silanus outwardly presents a composed and respectful demeanor", "masking any inner turmoil or resentment he might harbor. his politeness is likely a carefully constructed facade", "hiding potential skepticism or even hostility towards claudius and the imperial court. beneath the surface", "he could be feeling a mix of wariness", "curiosity", "and perhaps a sense of forced duty", "trying to assess the situation and his role within it while concealing his true feelings.", "silanus outwardly presents a composed and respectful demeanor, masking any inner turmoil or resentment he might harbor. his politeness is likely a carefully constructed facade, hiding potential skepticism or even hostility towards claudius and the imperial court. beneath the surface, he could be feeling a mix of wariness, curiosity, and perhaps a sense of forced duty, trying to assess the situation and his role within it", "concealing his true feelings."],
        ap.active_plans = ["To present himself respectfully to Claudius, fulfilling the expected protocol for a visiting noble.", "To observe and assess the dynamics of the imperial court, particularly the relationship between Claudius and Messalina.", "To gather information about Claudius's intentions and his own potential role in the new regime, remaining cautious and observant."],
        ap.beliefs = ["He believes in adhering to social and political protocols, at least outwardly, even in a court he may despise.", "He believes in maintaining personal dignity and composure, even in potentially uncomfortable or treacherous situations.", "He likely still holds Republican ideals, though he may recognize the futility of openly expressing them in Claudius's court."],
        ap.goals = ["Short-term: To make a positive initial impression on Claudius and Messalina, or at least avoid causing immediate offense.", "Medium-term: To understand his position and potential influence within Claudius's court, seeking to navigate the political landscape to his advantage or at least survival.", "Ultimate: While unlikely to be immediately achievable, his underlying goal might still be to see a return to Republican values in Rome, even if he has to operate within the imperial system for now."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_xenophon_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Xenophon, the Greek doctor, stands over Claudius as he conducts a medical examination, prodding and poking with an air of clinical detachment. He moves with efficient precision, noting Claudius\'s physical ailments, offering advice with a matter-of-fact demeanor that reflects his professional distance from the emperor\'s vulnerabilities.',
        ap.emotional_state = 'Xenophon exhibits a calm, clinical demeanor, his focus entirely on Claudius’s health. There is no trace of empathy; instead, he appears almost indifferent to the weight of the emperor\'s burdens, maintaining a professional facade that underscores the stark contrast between his medical expertise and the emotional turmoil of his patient.',
        ap.emotional_tags = ["xenophon exhibits a calm, clinical demeanor, his focus entirely on claudius\u2019s health. there is no trace of empathy; instead, he appears almost indifferent to the weight of the emperor's burdens, maintaining a professional facade that underscores the stark contrast between his medical expertise", "the emotional turmoil of his patient.", "xenophon exhibits a calm", "clinical demeanor", "his focus entirely on claudius\u2019s health. there is no trace of empathy; instead", "he appears almost indifferent to the weight of the emperor's burdens", "maintaining a professional facade that underscores the stark contrast between his medical expertise and the emotional turmoil of his patient.", "xenophon exhibits a calm, clinical demeanor, his focus entirely on claudius\u2019s health. there is no trace of empathy", "instead, he appears almost indifferent to the weight of the emperor's burdens, maintaining a professional facade that underscores the stark contrast between his medical expertise and the emotional turmoil of his patient."],
        ap.active_plans = ["Assess Claudius's physical condition and history with thorough examination.", "Provide practical medical advice to improve Claudius's health.", "Encourage Claudius to prioritize self-care over political duties."],
        ap.beliefs = ["Good health is paramount and should take precedence over social conventions.", "Medical knowledge is rooted in observation and rationality, not superstition.", "Emperors, despite their power, must adhere to the same health principles as anyone else."],
        ap.goals = ["Short-term: Diagnose Claudius\u2019s immediate health issues.", "Medium-term: Establish a treatment plan to address Claudius's ailments.", "Ultimate: Ensure that Claudius maintains better health to fulfill his duties as Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits under Xenophon\'s scrutiny, appearing vulnerable and somewhat anxious. He responds to the doctor’s questions and observations, his posture betraying his unease as he contemplates the implications of his health and the burdens of leadership.',
        ap.emotional_state = 'Claudius displays a mixture of embarrassment and resignation, struggling with his health insecurities and the realization of his physical limitations. Beneath the surface, he feels an internal conflict between his duty as Emperor and his desire for personal well-being, highlighting the constant pressure he faces in his role.',
        ap.emotional_tags = ["claudius displays a mixture of embarrassment", "resignation, struggling with his health insecurities", "the realization of his physical limitations. beneath the surface, he feels an internal conflict between his duty as emperor", "his desire for personal well-being, highlighting the constant pressure he faces in his role.", "claudius displays a mixture of embarrassment and resignation", "struggling with his health insecurities and the realization of his physical limitations. beneath the surface", "he feels an internal conflict between his duty as emperor and his desire for personal well-being", "highlighting the constant pressure he faces in his role."],
        ap.active_plans = ["Engage with Xenophon to gain insights into his health.", "Seek practical advice to improve his physical condition.", "Balance his responsibilities as Emperor with the need for self-care."],
        ap.beliefs = ["Leadership and strength are often tied to physical health.", "He must be capable and strong to fulfill his duties as Emperor.", "Health issues can undermine his authority and perception among others."],
        ap.goals = ["Short-term: Address immediate health concerns raised by Xenophon.", "Medium-term: Implement changes in lifestyle to improve his health.", "Ultimate: Maintain his position and authority as Emperor while managing personal vulnerabilities."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_architectural_plans_event_11_1'})
    ON CREATE SET
        oi.description = 'The architectural plans are central to the event, acting as the physical evidence that Claudius uses to expose the corruption. He meticulously compares the \'Divine Julius\' plans with Tortius\'s versions, highlighting discrepancies in estimated costs, labor, and materials. The plans become a tool for Claudius to dismantle the web of deceit woven by his corrupt officials, visually demonstrating their greed and incompetence. They are not merely blueprints but instruments of truth and justice wielded by Claudius.',
        oi.status_before = 'The plans from \'Divine Julius\' were hidden away in the archives, forgotten and gathering dust, representing a past era of perhaps greater integrity and efficiency. Tortius\'s plans were recently produced, presented as the current, inflated estimates for the harbor rebuilding project, concealing the underlying corruption and bribery.',
        oi.status_after = 'The \'Divine Julius\' plans are brought into the light, their value and accuracy reaffirmed as evidence of past competence and present corruption. Tortius\'s plans are discredited and exposed as fraudulent, becoming symbols of the deceit and greed Claudius is attempting to combat. The plans, once mere documents, now represent the turning point in Claudius\'s confrontation with corruption.'
    WITH oi
    MATCH (o:Object {uuid: 'object_architectural_plans'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_architectural_plans_event_11_2'})
    ON CREATE SET
        oi.description = 'The architectural plans serve as the focal point of the discussion, revealing critical discrepancies between the original estimates from Julius Caesar\'s time and the current inflated figures. Claudius uses these plans to challenge Tortius\'s credibility and highlight the corruption ingrained in the administration. Their presence is pivotal as they catalyze the confrontation that leads to Silanus\'s violent outburst.',
        oi.status_before = 'The plans are neatly organized and stored within the archives, awaiting examination. They represent the legacy of a more efficient Rome, untouched by the corruption that now plagues its governance.',
        oi.status_after = 'After the confrontation and Silanus\'s attack, the plans lie on the table, now disheveled and partially crumpled from the chaos, symbolizing the disruption of order and the unveiling of corruption within the Imperial administration.'
    WITH oi
    MATCH (o:Object {uuid: 'object_architectural_plans'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_earth_event_11_3'})
    ON CREATE SET
        oi.description = 'The object \'earth\' becomes a crucial point of factual reference as Claudius contrasts Caesar\'s accurate harbor plans with Tortius\'s inflated estimates. Claudius highlights that Caesar\'s plans correctly identify \'earth\' as the primary material to be excavated, representing a manageable and less costly undertaking. This mention of \'earth\' is not merely descriptive but serves as a narrative tool to expose the surveyors\' deceit. By pointing out the discrepancy regarding \'earth\' versus \'rock\', Claudius effectively demonstrates the surveyors\' deliberate inflation of the project\'s difficulty, thereby revealing the underlying bribery scheme to all present and solidifying his accusations against Tortius.',
        oi.status_before = 'Prior to the event, \'earth\' exists as the actual, physical ground material at the harbor site, a natural component of the landscape and the true substance to be excavated according to the original, honest plans. Its status is that of a factual, understated element in the construction project, representing the realistic scale of work.',
        oi.status_after = 'Following the event, \'earth\' retains its physical state, but its narrative significance is elevated. It becomes a symbol of truth and accuracy, contrasting sharply with the fabricated \'rock\'. \'Earth\' now represents the factual basis against which the corruption is measured and exposed. Its mention resonates as a key piece of evidence in Claudius\'s successful unmasking of the bribery, solidifying its role as a silent witness to the unfolding deception.'
    WITH oi
    MATCH (o:Object {uuid: 'object_earth'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rock_event_11_3'})
    ON CREATE SET
        oi.description = 'The object \'rock\' is introduced as a deliberate misrepresentation by Tortius\'s surveyors, a fabrication used to justify inflated costs and extended timelines for the harbor reconstruction. Claudius reveals that the surveyors falsely claimed they would be cutting through \'rock\', a material far more challenging and expensive to excavate than the actual \'earth\' identified in Caesar\'s original plans. \'Rock\', in this context, is not a genuine geological obstacle but a narrative device employed to mask corruption. Its presence in Tortius\'s estimates is a key indicator of the bribery scheme, enabling Claudius to expose the falsehood and deceit at the heart of the project\'s inflated budget.',
        oi.status_before = 'Before the event, \'rock\' exists as a potential geological material at the harbor site, but in the context of Tortius\'s plans, it is a dishonest exaggeration, a fabricated element introduced to inflate costs and deceive the emperor. Its status is that of a hidden lie, an unspoken element of corruption embedded within the official documentation.',
        oi.status_after = 'After the event, \'rock\' is publicly exposed as a fabrication, stripped of its deceptive purpose. It transforms from a supposed justification for inflated costs into a symbol of corruption and dishonesty. \'Rock\' becomes narratively significant as the central lie that Claudius dismantles, highlighting the emperor\'s acumen in uncovering deceit and the surveyors\' failed attempt to manipulate the harbor project for personal gain. It remains physically unchanged, but its symbolic weight shifts to represent falsehood and exposed corruption.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rock'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gold_pieces_event_11_4'})
    ON CREATE SET
        oi.description = 'The gold pieces represent the financial stakes involved in the harbor reconstruction project. Claudius uses the figure of four million gold pieces from Julius Caesar’s original estimate as a contrast to the inflated fifteen million proposed by Tortius, highlighting the systemic corruption within the administration. This currency becomes a pivotal element in Claudius\'s strategy to leverage the corn factors for a loan, illustrating the intersection of finance and politics in his imperial governance.',
        oi.status_before = 'Prior to the event, the gold pieces are abstract figures in financial estimates—ideas tied to the potential funding of the harbor project, but not yet actively engaged in the political machinations.',
        oi.status_after = 'Following the event, the gold pieces gain a tangible role as Claudius\'s plan to procure a loan from the corn factors makes them central to the harbor reconstruction. They symbolize both the economic burden of corruption and Claudius\'s resolve to exploit this dynamic for the benefit of the project.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gold_pieces'})
    MATCH (e:Event {uuid: 'event_11_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_architectural_plans_event_11_5'})
    ON CREATE SET
        oi.description = 'The architectural plans for the harbor at Ostia serve as the central physical object in this event, around which the interaction between Claudius and Silanus unfolds. Claudius uses them to showcase his scholarly diligence and to expose the corruption of Tortius and the corn factors, drawing Silanus into a seemingly intellectual discussion. The plans become a deceptive focal point, masking the underlying tension and Silanus\'s true intentions. By inviting Silanus to examine them closely in private, Claudius inadvertently sets the stage for Silanus\'s attack, the plans becoming a silent witness to the eruption of violence that shatters the facade of scholarly discourse and reveals the raw political animosity.',
        oi.status_before = 'The architectural plans are spread out on the large marble table in the Grand Council Chamber, having been the subject of discussion during the meeting. They are in good condition, representing both Caesar\'s original vision and the more recent, corrupted estimates, ready to be examined and compared.',
        oi.status_after = 'The architectural plans remain on the marble table in the Grand Council Chamber, physically unchanged. However, their narrative significance is now dramatically heightened. They are no longer just documents of state business but have become the backdrop for a violent assassination attempt. They are now imbued with the tension and drama of the event, serving as a stark reminder of the political treachery and violence lurking beneath the surface of imperial affairs.'
    WITH oi
    MATCH (o:Object {uuid: 'object_architectural_plans'})
    MATCH (e:Event {uuid: 'event_11_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Claudius, initially appearing hesitant and fidgety as he gestures towards the architectural plans spread across the table, soon reveals a commanding presence. He moves deliberately, pointing out discrepancies between the old and new plans, his stammer becoming less pronounced as his focus sharpens. He scrutinizes Tortius and his advisors with an increasingly direct gaze, his initial vulnerability replaced by a steely resolve.',
        ap.emotional_state = 'Beneath a veneer of scholarly distraction and feigned confusion, Claudius is in fact sharply focused and controlled. Outwardly, he maintains a semblance of his usual stammer and nervous gestures, but internally, he is driven by a righteous anger at the discovered corruption. He is determined to expose the deceit, masking his strategic intent with a facade of bewildered inquiry, carefully controlling his temper to maintain the upper hand in the unfolding confrontation.',
        ap.emotional_tags = ["beneath a veneer of scholarly distraction", "feigned confusion, claudius is in fact sharply focused", "controlled. outwardly, he maintains a semblance of his usual stammer", "nervous gestures, but internally, he is driven by a righteous anger at the discovered corruption. he is determined to expose the deceit, masking his strategic intent with a facade of bewildered inquiry, carefully controlling his temper to maintain the upper hand in the unfolding confrontation.", "beneath a veneer of scholarly distraction and feigned confusion", "claudius is in fact sharply focused and controlled. outwardly", "he maintains a semblance of his usual stammer and nervous gestures", "but internally", "he is driven by a righteous anger at the discovered corruption. he is determined to expose the deceit", "masking his strategic intent with a facade of bewildered inquiry", "carefully controlling his temper to maintain the upper hand in the unfolding confrontation.", "beneath a veneer of scholarly distraction and feigned confusion, claudius is in fact sharply focused and controlled. outwardly, he maintains a semblance of his usual stammer and nervous gestures,", "internally, he is driven by a righteous anger at the discovered corruption. he is determined to expose the deceit, masking his strategic intent with a facade of bewildered inquiry, carefully controlling his temper to maintain the upper hand in the unfolding confrontation."],
        ap.active_plans = ["To expose the corruption and bribery related to the inflated harbor rebuilding costs.", "To reassert his authority and demonstrate his competence to his advisors and the court.", "To ensure the harbor project is completed efficiently and according to the original, cost-effective plan."],
        ap.beliefs = ["Justice and fairness should be upheld, even in the face of entrenched corruption.", "The wisdom of the past (represented by Julius Caesar's plans) is valuable and should be respected.", "Efficient governance and fiscal responsibility are essential for the stability of Rome."],
        ap.goals = ["Short-term: To publicly reveal Tortius's corruption and force him to revise the harbor estimates.", "Medium-term: To secure funding for the harbor project by leveraging the corn factors' illicit gains.", "Ultimate: To establish a reputation for being a just and effective ruler who cannot be easily manipulated or deceived."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Pallas observes Claudius with a calculating gaze, his posture controlled and watchful. He interjects with pragmatic questions about the relevance of old plans and the source of funding, maintaining a veneer of concerned advisor while subtly probing Claudius\'s true intentions and the depth of his knowledge about the corruption.',
        ap.emotional_state = 'Pallas projects an outward calm and professional demeanor, but beneath the surface, he is likely anxious and assessing the potential implications of Claudius\'s investigation. He is wary of any disruption to the established order and concerned about potential financial repercussions for himself and his associates if the corruption is thoroughly exposed. His pragmatism masks a self-serving nature, focused on maintaining his own influence and wealth.',
        ap.emotional_tags = ["pallas projects an outward calm", "professional demeanor, but beneath the surface, he is likely anxious", "assessing the potential implications of claudius's investigation. he is wary of any disruption to the established order", "concerned about potential financial repercussions for himself", "his associates if the corruption is thoroughly exposed. his pragmatism masks a self-serving nature, focused on maintaining his own influence", "wealth.", "pallas projects an outward calm and professional demeanor", "but beneath the surface", "he is likely anxious and assessing the potential implications of claudius's investigation. he is wary of any disruption to the established order and concerned about potential financial repercussions for himself and his associates if the corruption is thoroughly exposed. his pragmatism masks a self-serving nature", "focused on maintaining his own influence and wealth.", "pallas projects an outward calm and professional demeanor,", "beneath the surface, he is likely anxious and assessing the potential implications of claudius's investigation. he is wary of any disruption to the established order and concerned about potential financial repercussions for himself and his associates if the corruption is thoroughly exposed. his pragmatism masks a self-serving nature, focused on maintaining his own influence and wealth."],
        ap.active_plans = ["To gauge the extent of Claudius's awareness of the corruption and his resolve to address it.", "To subtly deflect blame from himself and other powerful figures who might be implicated.", "To ensure any changes to the harbor project do not negatively impact his own financial interests or influence."],
        ap.beliefs = ["Pragmatism and financial stability are paramount in governance.", "The existing power structures and financial arrangements are necessary for the smooth functioning of Rome, even if they involve some corruption.", "Maintaining order and control is more important than abstract ideals of justice."],
        ap.goals = ["Short-term: To understand Claudius's immediate plan and its potential impact on the current financial system.", "Medium-term: To minimize any financial losses or disruptions caused by Claudius's investigation.", "Ultimate: To preserve his position of power and influence within Claudius's administration, ensuring continued personal enrichment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Narcissus initially appears dismissive of Claudius\'s discovery, attempting to downplay the significance of the older plans by citing the passage of time and increased material costs. He stands with an air of practiced confidence, but his fidgeting colleague Tortius betrays the underlying tension. As Claudius presses his points, Narcissus becomes more defensive, his attempts to rationalize the inflated estimates growing increasingly strained.',
        ap.emotional_state = 'Narcissus begins the scene with an air of assuredness, confident in his ability to manage Claudius\'s concerns. However, as Claudius methodically dismantles the justifications for the inflated costs, Narcissus\'s confidence visibly erodes. He becomes increasingly anxious and defensive, feeling the pressure of exposure and the potential consequences for his own involvement in the corrupt financial schemes. His outward pragmatism is now tinged with a palpable unease.',
        ap.emotional_tags = ["narcissus begins the scene with an air of assuredness, confident in his ability to manage claudius's concerns. however, as claudius methodically dismantles the justifications for the inflated costs, narcissus's confidence visibly erodes. he becomes increasingly anxious", "defensive, feeling the pressure of exposure", "the potential consequences for his own involvement in the corrupt financial schemes. his outward pragmatism is now tinged with a palpable unease.", "narcissus begins the scene with an air of assuredness", "confident in his ability to manage claudius's concerns. however", "as claudius methodically dismantles the justifications for the inflated costs", "narcissus's confidence visibly erodes. he becomes increasingly anxious and defensive", "feeling the pressure of exposure and the potential consequences for his own involvement in the corrupt financial schemes. his outward pragmatism is now tinged with a palpable unease."],
        ap.active_plans = ["To quickly dismiss Claudius's concerns by emphasizing the age of the plans and legitimate cost increases.", "To deflect attention from the surveyors' bribery by focusing on general economic factors.", "To assess how much Claudius truly knows and to gauge the level of threat to his own financial dealings."],
        ap.beliefs = ["Financial pragmatism justifies bending rules when necessary for economic efficiency (or personal gain).", "Maintaining the flow of resources is more important than strict adherence to outdated plans.", "Protecting established financial interests is essential for the stability of the empire."],
        ap.goals = ["Short-term: To convince Claudius that the inflated estimates are reasonable and necessary.", "Medium-term: To prevent a full-scale inquiry into the harbor project and the corn factors' activities.", "Ultimate: To safeguard his own financial empire and maintain his position as a trusted and influential freedman, even if it requires subtle manipulation and deflection."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Silanus is initially quiet and reserved, observing the exchange between Claudius and his freedmen. He is summoned to look at the plans, his physical posture suggesting a detached weariness. When Claudius seeks his agreement, Silanus offers a brief, confirming \'Yes, Caesar,\' his demeanor suggesting a man burdened by disillusionment, yet acknowledging the truth of Claudius\'s words.',
        ap.emotional_state = 'Silanus is emotionally withdrawn and cynical, his earlier republican fervor seemingly dampened by the realities of imperial Rome. He observes Claudius\'s actions with a detached skepticism, perhaps tinged with a flicker of surprise at the Emperor\'s unexpected competence. He is weary of political games and manipulations, his internal state marked by a profound sense of resignation and a suppressed resentment towards the imperial system he despises.',
        ap.emotional_tags = ["silanus is emotionally withdrawn", "cynical, his earlier republican fervor seemingly dampened by the realities of imperial rome. he observes claudius's actions with a detached skepticism, perhaps tinged with a flicker of surprise at the emperor's unexpected competence. he is weary of political games", "manipulations, his internal state marked by a profound sense of resignation", "a suppressed resentment towards the imperial system he despises.", "silanus is emotionally withdrawn and cynical", "his earlier republican fervor seemingly dampened by the realities of imperial rome. he observes claudius's actions with a detached skepticism", "perhaps tinged with a flicker of surprise at the emperor's unexpected competence. he is weary of political games and manipulations", "his internal state marked by a profound sense of resignation and a suppressed resentment towards the imperial system he despises."],
        ap.active_plans = ["To observe Claudius and his advisors, assessing the dynamics of power and corruption within the court.", "To remain non-committal and avoid direct involvement unless specifically asked by Claudius.", "To gauge whether Claudius represents a genuine shift from the tyranny of Caligula or merely a different face of autocracy."],
        ap.beliefs = ["The Republic is a superior form of government to the Empire, even if it is now lost.", "Corruption is inherent in imperial power and difficult to eradicate.", "Personal integrity and honor are valuable, even in a corrupt political system."],
        ap.goals = ["Short-term: To understand Claudius's true character and motivations.", "Medium-term: To determine if there is any possibility of influencing Claudius towards more virtuous governance (though he likely doubts this).", "Ultimate: To maintain his personal integrity and republican ideals, even if it means opposing the Emperor and risking his own life (as hinted by his later actions)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands at the large marble table, animatedly fidgeting with the architectural plans as he scrutinizes the inflated estimates. His posture is tense, embodying a blend of curiosity and latent authority, as he engages with Pallas, Narcissus, and Tortius, his voice rising in frustration and disbelief.',
        ap.emotional_state = 'Claudius displays surface-level irritation and determination, his brow furrowed as he confronts the discrepancies in the plans. Internally, however, he grapples with frustration at the corruption evident in the estimates, feeling a mix of betrayal and the weight of responsibility as Emperor. His vulnerability is highlighted by the unexpected attack that follows, marking a profound moment of realization about the treachery surrounding him.',
        ap.emotional_tags = ["claudius displays surface-level irritation", "determination, his brow furrowed as he confronts the discrepancies in the plans. internally, however, he grapples with frustration at the corruption evident in the estimates, feeling a mix of betrayal", "the weight of responsibility as emperor. his vulnerability is highlighted by the unexpected attack that follows, marking a profound moment of realization about the treachery surrounding him.", "claudius displays surface-level irritation and determination", "his brow furrowed as he confronts the discrepancies in the plans. internally", "however", "he grapples with frustration at the corruption evident in the estimates", "feeling a mix of betrayal and the weight of responsibility as emperor. his vulnerability is highlighted by the unexpected attack that follows", "marking a profound moment of realization about the treachery surrounding him."],
        ap.active_plans = ["To expose the corruption behind the inflated harbor reconstruction estimates.", "To assert his authority over his advisors and regain control of the situation.", "To ensure that the harbor project is managed efficiently and transparently, avoiding the pitfalls of bureaucratic greed."],
        ap.beliefs = ["Honesty and efficiency are paramount for the stability of Rome.", "Leadership requires both intellect and the courage to confront corruption.", "One must not underestimate the power of seemingly weak individuals, as they may harbor hidden strengths."],
        ap.goals = ["Short-term: To clarify the discrepancies in the harbor project estimates and identify corruption.", "Medium-term: To rebuild the harbor at Ostia according to the original, efficient plans laid out by Julius Caesar.", "Ultimate: To restore faith in his leadership and the integrity of the Roman administration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Narcissus stands by, observing Claudius as he questions the validity of the harbor project estimates. His arms are crossed, and he maintains an air of calculated detachment, ready to interject with a pragmatic perspective if needed but also wary of the tension building in the room.',
        ap.emotional_state = 'Narcissus remains outwardly calm, exuding an air of control despite the chaos unfurling before him. Internally, he feels a sense of urgency to protect his position and the Emperor, understanding the volatile nature of the situation. His mind races through potential implications and strategies to maintain power amidst the brewing conflict.',
        ap.emotional_tags = ["narcissus remains outwardly calm, exuding an air of control despite the chaos unfurling before him. internally, he feels a sense of urgency to protect his position", "the emperor, understanding the volatile nature of the situation. his mind races through potential implications", "strategies to maintain power amidst the brewing conflict.", "narcissus remains outwardly calm", "exuding an air of control despite the chaos unfurling before him. internally", "he feels a sense of urgency to protect his position and the emperor", "understanding the volatile nature of the situation. his mind races through potential implications and strategies to maintain power amidst the brewing conflict."],
        ap.active_plans = ["To support Claudius in uncovering the truth behind the inflated estimates.", "To manage the fallout from any potential accusations of corruption.", "To ensure that their financial interests remain unaffected by the investigation into the harbor project."],
        ap.beliefs = ["Pragmatism and financial acuity are essential to navigating politics.", "Power dynamics can shift rapidly; maintaining favor is crucial.", "Understanding the motivations behind corruption is key to controlling it."],
        ap.goals = ["Short-term: To assist Claudius in resolving the harbor project issues without further conflict.", "Medium-term: To solidify his influence in Claudius's administration and protect his own interests.", "Ultimate: To establish a stable economic environment that benefits his position and the emperor's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Tortius fidgets uncomfortably as Claudius scrutinizes the estimates he presented. He stands slightly hunched, avoiding eye contact with the Emperor, and his hands tremble slightly, indicating his mounting anxiety as the pressure intensifies around him.',
        ap.emotional_state = 'Tortius exhibits visible anxiety and fear, grappling with the implications of Claudius\'s accusations. Outwardly, he tries to maintain composure, but internally, he is panicked about the potential fallout from being exposed for corruption, fearing for his reputation and position.',
        ap.emotional_tags = ["tortius exhibits visible anxiety", "fear, grappling with the implications of claudius's accusations. outwardly, he tries to maintain composure, but internally, he is panicked about the potential fallout from being exposed for corruption, fearing for his reputation", "position.", "tortius exhibits visible anxiety and fear", "grappling with the implications of claudius's accusations. outwardly", "he tries to maintain composure", "but internally", "he is panicked about the potential fallout from being exposed for corruption", "fearing for his reputation and position.", "tortius exhibits visible anxiety and fear, grappling with the implications of claudius's accusations. outwardly, he tries to maintain composure,", "internally, he is panicked about the potential fallout from being exposed for corruption, fearing for his reputation and position."],
        ap.active_plans = ["To deflect blame and redirect the conversation away from his involvement in the inflated estimates.", "To minimize the fallout from Claudius's scrutiny and maintain his role as Chief Engineer.", "To possibly negotiate terms of forgiveness should Claudius pursue disciplinary action."],
        ap.beliefs = ["Survival in politics often requires bending the truth.", "Corruption is a necessary evil in the world of power.", "Perception can be manipulated to protect oneself from scrutiny."],
        ap.goals = ["Short-term: To avoid immediate repercussions from Claudius's interrogation.", "Medium-term: To maintain his position without further investigation into his actions.", "Ultimate: To escape the grasp of corruption while continuing to maneuver within the bureaucratic landscape of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Emperor Claudius stands at the head of a large marble table in the Grand Council Chamber, meticulously comparing two sets of architectural plans under the bright daylight streaming in. He gestures animatedly at the documents, his fingers tracing lines and pointing out discrepancies between Caesar\'s original harbor plans and the current, inflated estimates presented by Tortius. His physical presence is assertive as he orchestrates the exposure of the corruption.',
        ap.emotional_state = 'Beneath a veneer of scholarly curiosity and detached inquiry, Claudius is sharp and focused, his stammer becoming more pronounced as his suspicion solidifies into certainty. He is experiencing a quiet satisfaction as his intellectual deductions prove correct and the corruption begins to unravel. There\'s a simmering undercurrent of imperial resolve hardening within him, a shift from the hesitant scholar to a ruler asserting authority against deceit. Yet, a weariness might also be present, a sigh at the endless burden of uncovering and confronting dishonesty within his empire.',
        ap.emotional_tags = ["beneath a veneer of scholarly curiosity", "detached inquiry, claudius is sharp", "focused, his stammer becoming more pronounced as his suspicion solidifies into certainty. he is experiencing a quiet satisfaction as his intellectual deductions prove correct", "the corruption begins to unravel. there's a simmering undercurrent of imperial resolve hardening within him, a shift from the hesitant scholar to a ruler asserting authority against deceit. yet, a weariness might also be present, a sigh at the endless burden of uncovering", "confronting dishonesty within his empire.", "beneath a veneer of scholarly curiosity and detached inquiry", "claudius is sharp and focused", "his stammer becoming more pronounced as his suspicion solidifies into certainty. he is experiencing a quiet satisfaction as his intellectual deductions prove correct and the corruption begins to unravel. there's a simmering undercurrent of imperial resolve hardening within him", "a shift from the hesitant scholar to a ruler asserting authority against deceit. yet", "a weariness might also be present", "a sigh at the endless burden of uncovering and confronting dishonesty within his empire."],
        ap.active_plans = ["Expose the corruption within the harbor reconstruction project and identify those responsible.", "Reassert imperial authority by demonstrating his attentiveness to detail and his intolerance for dishonesty.", "Ensure the harbor project is completed efficiently and at a fair cost, adhering to Caesar's original vision."],
        ap.beliefs = ["Justice and accountability are essential for effective governance, even if it requires confronting powerful vested interests.", "His intellectual abilities, often underestimated, are a valuable tool in ruling and discerning truth from falsehood.", "Rome's prosperity depends on honest administration and the elimination of corruption that leeches resources and trust."],
        ap.goals = ["Short-term: Force Tortius and the surveyors to confess to their roles in the bribery scheme during this confrontation.", "Medium-term: Recoup the misappropriated funds and redirect them back into the harbor project, ensuring its timely and cost-effective completion.", "Ultimate: Establish a reputation as a just and vigilant ruler who will not tolerate corruption, thereby strengthening his reign and the empire's foundations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Tortius stands before Emperor Claudius in the Grand Council Chamber, visibly sweating and shifting his weight uncomfortably. He fidgets and avoids direct eye contact, his body language betraying his inner turmoil as Claudius methodically dismantles his inflated harbor estimates. He stammers weak, defensive justifications, his voice lacking conviction and his demeanor radiating guilt and anxiety.',
        ap.emotional_state = 'Tortius is gripped by mounting panic and fear as Claudius\'s interrogation intensifies. His surface emotions are a thin veil of feigned confusion and indignation, but underneath, he is terrified of exposure and the potential repercussions of his corruption. He feels trapped and desperate, his carefully constructed scheme crumbling under Claudius\'s astute scrutiny. Resentment at being caught might also flicker, mixed with self-pity for his predicament.',
        ap.emotional_tags = ["tortius is gripped by mounting panic", "fear as claudius's interrogation intensifies. his surface emotions are a thin veil of feigned confusion", "indignation, but underneath, he is terrified of exposure", "the potential repercussions of his corruption. he feels trapped", "desperate, his carefully constructed scheme crumbling under claudius's astute scrutiny. resentment at being caught might also flicker, mixed with self-pity for his predicament.", "tortius is gripped by mounting panic and fear as claudius's interrogation intensifies. his surface emotions are a thin veil of feigned confusion and indignation", "but underneath", "he is terrified of exposure and the potential repercussions of his corruption. he feels trapped and desperate", "his carefully constructed scheme crumbling under claudius's astute scrutiny. resentment at being caught might also flicker", "mixed with self-pity for his predicament.", "tortius is gripped by mounting panic and fear as claudius's interrogation intensifies. his surface emotions are a thin veil of feigned confusion and indignation,", "underneath, he is terrified of exposure and the potential repercussions of his corruption. he feels trapped and desperate, his carefully constructed scheme crumbling under claudius's astute scrutiny. resentment at being caught might also flicker, mixed with self-pity for his predicament."],
        ap.active_plans = ["Deny any personal involvement in or knowledge of the bribery scheme.", "Attribute the inflated estimates to honest mistakes or misunderstandings by his surveyors.", "Attempt to deflect blame and minimize the severity of the discrepancies, hoping Claudius will lose interest or be satisfied with a superficial explanation."],
        ap.beliefs = ["Corruption is a pervasive and accepted part of the Roman system, and he is simply participating in standard practice.", "His position as Chief Engineer offers him a degree of protection and plausible deniability.", "Emperors are too detached from day-to-day administration to notice or care about minor financial irregularities."],
        ap.goals = ["Short-term: Escape this confrontation without admitting guilt or facing immediate punishment.", "Medium-term: Salvage his reputation and position within the administration, minimizing the damage from this exposure.", "Ultimate: Continue profiting from corrupt practices within the harbor project and other ventures, maintaining his wealth and influence within the system."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Silanus stands beside Claudius, observing the unfolding confrontation with a stoic and grim demeanor. He is invited by Claudius to examine the plans and confirm the emperor\'s suspicions regarding the corn factors\' bribery. He nods in agreement, lending his senatorial authority to Claudius\'s accusations and solidifying the emperor\'s position in exposing the corruption. His posture is reserved, his gaze sharp and assessing.',
        ap.emotional_state = 'Silanus harbors deep-seated resentment towards Claudius and the imperial system, yet in this moment, he experiences a cold, grim satisfaction as Claudius exposes the corruption. He is likely cynical about the extent of Claudius\'s commitment to real reform, viewing this as perhaps a performative act rather than a genuine shift. Beneath the surface, there\'s a simmering anger at the pervasive corruption of the empire, a disdain for the venality he witnesses, and a profound weariness with the state of Rome. His agreement is less about loyalty to Claudius and more about a confirmation of his own pessimistic view of the imperial regime.',
        ap.emotional_tags = ["silanus harbors deep-seated resentment towards claudius", "the imperial system, yet in this moment, he experiences a cold, grim satisfaction as claudius exposes the corruption. he is likely cynical about the extent of claudius's commitment to real reform, viewing this as perhaps a performative act rather than a genuine shift. beneath the surface, there's a simmering anger at the pervasive corruption of the empire, a disdain for the venality he witnesses,", "a profound weariness with the state of rome. his agreement is less about loyalty to claudius", "more about a confirmation of his own pessimistic view of the imperial regime.", "silanus harbors deep-seated resentment towards claudius and the imperial system", "yet in this moment", "he experiences a cold", "grim satisfaction as claudius exposes the corruption. he is likely cynical about the extent of claudius's commitment to real reform", "viewing this as perhaps a performative act rather than a genuine shift. beneath the surface", "there's a simmering anger at the pervasive corruption of the empire", "a disdain for the venality he witnesses", "and a profound weariness with the state of rome. his agreement is less about loyalty to claudius and more about a confirmation of his own pessimistic view of the imperial regime."],
        ap.active_plans = ["Observe Claudius's handling of the corruption and gauge his true intentions and depth of understanding.", "Offer terse confirmation of Claudius's accusations, using his own credibility to underscore the emperor's findings.", "Remain vigilant for opportunities to further undermine Claudius's authority and expose the systemic flaws of the imperial system, even if through subtle acts of dissent."],
        ap.beliefs = ["The Republic's ideals of honesty and integrity have been utterly corrupted under the Empire.", "Claudius, despite this apparent act of exposing corruption, is still fundamentally a flawed and illegitimate ruler.", "The rot within Rome is deep and pervasive, and isolated acts of reform are unlikely to effect meaningful change."],
        ap.goals = ["Short-term: Use this moment to observe and analyze Claudius's character and approach to governance.", "Medium-term: Identify further instances of corruption and systemic weakness within the imperial administration.", "Ultimate: Contribute to the eventual downfall of the imperial system and the restoration of Republican principles, though his methods are evolving towards more desperate measures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands at the large marble table, surrounded by maps of Ostia\'s harbor. He fidgets nervously, flipping through the plans and engaging with his advisors. His posture is slightly hunched, reflecting his stammering persona, yet there is a newfound assertiveness in his demeanor as he challenges the inflated estimates presented by Tortius.',
        ap.emotional_state = 'Claudius exhibits a mix of determination and anxiety. Outwardly, he is resolute, exhibiting confidence as he asserts his authority over the harbor plans. Internally, however, he grapples with a fear of being undermined, a tension between his scholarly inclinations and the brutal realities of political maneuvering that weigh heavily on his mind.',
        ap.emotional_tags = ["claudius exhibits a mix of determination", "anxiety. outwardly, he is resolute, exhibiting confidence as he asserts his authority over the harbor plans. internally, however, he grapples with a fear of being undermined, a tension between his scholarly inclinations", "the brutal realities of political maneuvering that weigh heavily on his mind.", "claudius exhibits a mix of determination and anxiety. outwardly", "he is resolute", "exhibiting confidence as he asserts his authority over the harbor plans. internally", "however", "he grapples with a fear of being undermined", "a tension between his scholarly inclinations and the brutal realities of political maneuvering that weigh heavily on his mind."],
        ap.active_plans = ["To assert his authority by ordering Tortius to proceed with the harbor reconstruction based on Julius Caesar's plans.", "To expose the corruption within his administration, specifically targeting the bribery of officials.", "To secure funding for the harbor project by leveraging his threat of investigating the corn factors' bribery."],
        ap.beliefs = ["The Empire needs to reconnect with its past glories and restore infrastructure.", "Corruption must be confronted and eradicated to ensure Rome's survival.", "Power must be wielded deftly to maintain authority amidst treachery."],
        ap.goals = ["Short-term: To finalize the plan for the harbor reconstruction using accurate estimates.", "Medium-term: To secure financial backing from the corn factors without initiating any investigations.", "Ultimate: To restore stability and efficiency to the empire's infrastructure and governance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Tortius stands at the edge of the table, visibly uncomfortable as he fidgets with his hands. He avoids eye contact with Claudius and appears anxious, his body language signaling a mix of defensiveness and unease as he struggles to justify the inflated estimates.',
        ap.emotional_state = 'Outwardly, Tortius displays anxiety and discomfort, often stammering or hesitating in his responses. Internally, he experiences a deep fear of exposure as Claudius\'s probing questions reveal the potential corruption in his work. He feels trapped between his role in the bureaucracy and the looming threat of Claudius\'s authority.',
        ap.emotional_tags = ["outwardly, tortius displays anxiety", "discomfort, often stammering or hesitating in his responses. internally, he experiences a deep fear of exposure as claudius's probing questions reveal the potential corruption in his work. he feels trapped between his role in the bureaucracy", "the looming threat of claudius's authority.", "outwardly", "tortius displays anxiety and discomfort", "often stammering or hesitating in his responses. internally", "he experiences a deep fear of exposure as claudius's probing questions reveal the potential corruption in his work. he feels trapped between his role in the bureaucracy and the looming threat of claudius's authority."],
        ap.active_plans = ["To deflect responsibility for the inflated estimates regarding the harbor project.", "To maintain his position and avoid repercussions from Claudius's inquiry.", "To preserve the status quo within the engineering department despite the growing scrutiny."],
        ap.beliefs = ["Maintaining the current estimates is critical for his own self-preservation.", "Corruption is a necessary evil in the bureaucracy to navigate the political landscape.", "Authority should ideally be unquestioned, and he fears the repercussions of challenging it."],
        ap.goals = ["Short-term: To avoid being implicated in any allegations of corruption.", "Medium-term: To regain Claudius's trust and continue his work without interference.", "Ultimate: To maintain his position within the imperial administration and escape the consequences of his failures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Pallas stands observing Claudius and the interactions among the advisors, arms crossed and a skeptical expression on his face. He remains close to the table, ready to interject with pragmatic advice but also wary of the escalating tensions surrounding the harbor project.',
        ap.emotional_state = 'Pallas projects a calm exterior but internally feels a mix of cynicism and concern. He is keenly aware of the political machinations at play and the potential fallout from Claudius\'s bold decisions. He grapples with a sense of loyalty to Claudius while being acutely aware of the risks involved in challenging entrenched corruption.',
        ap.emotional_tags = ["pallas projects a calm exterior but internally feels a mix of cynicism", "concern. he is keenly aware of the political machinations at play", "the potential fallout from claudius's bold decisions. he grapples with a sense of loyalty to claudius while being acutely aware of the risks involved in challenging entrenched corruption.", "pallas projects a calm exterior but internally feels a mix of cynicism and concern. he is keenly aware of the political machinations at play and the potential fallout from claudius's bold decisions. he grapples with a sense of loyalty to claudius", "being acutely aware of the risks involved in challenging entrenched corruption.", "pallas projects a calm exterior", "internally feels a mix of cynicism and concern. he is keenly aware of the political machinations at play and the potential fallout from claudius's bold decisions. he grapples with a sense of loyalty to claudius while being acutely aware of the risks involved in challenging entrenched corruption."],
        ap.active_plans = ["To offer insights and counsel to Claudius regarding the harbor reconstruction.", "To subtly gauge the reactions of Tortius and other advisors to prevent further discord.", "To ensure that Claudius\u2019s decisions do not lead to unnecessary conflict with powerful figures in the Senate."],
        ap.beliefs = ["Pragmatism is crucial for survival in the volatile political landscape of Rome.", "Corruption must be confronted strategically to avoid a backlash.", "Loyalty to Claudius must be balanced with the need for political savvy."],
        ap.goals = ["Short-term: To assist Claudius in navigating the complexities of the harbor project.", "Medium-term: To maintain stability and avoid open conflict within the council.", "Ultimate: To safeguard his position and influence within the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Claudius, still engrossed in the affairs of state even as the meeting concludes, remains standing at the large marble table, gesturing animatedly towards the architectural plans spread across it. He invites Silanus to join him in examining the documents, his posture open and inviting, completely unaware of the simmering danger in Silanus\'s presence. He is focused on the details of the plans, seemingly eager to share his discovery and intellectual insights.',
        ap.emotional_state = 'On the surface, Claudius exhibits a scholarly enthusiasm, eager to discuss the historical plans and their implications for the harbor project. He appears intellectually stimulated and perhaps even slightly pleased with himself for uncovering Caesar\'s original designs. Beneath this facade of intellectual engagement, there might be a subtle undercurrent of anxiety about the ongoing corruption and the weight of his imperial responsibilities, which he momentarily sets aside in his scholarly pursuits. He is utterly oblivious to the intense resentment brewing within Silanus, misinterpreting Silanus\'s compliance as genuine engagement.',
        ap.emotional_tags = ["on the surface, claudius exhibits a scholarly enthusiasm, eager to discuss the historical plans", "their implications for the harbor project. he appears intellectually stimulated", "perhaps even slightly pleased with himself for uncovering caesar's original designs. beneath this facade of intellectual engagement, there might be a subtle undercurrent of anxiety about the ongoing corruption", "the weight of his imperial responsibilities, which he momentarily sets aside in his scholarly pursuits. he is utterly oblivious to the intense resentment brewing within silanus, misinterpreting silanus's compliance as genuine engagement.", "on the surface", "claudius exhibits a scholarly enthusiasm", "eager to discuss the historical plans and their implications for the harbor project. he appears intellectually stimulated and perhaps even slightly pleased with himself for uncovering caesar's original designs. beneath this facade of intellectual engagement", "there might be a subtle undercurrent of anxiety about the ongoing corruption and the weight of his imperial responsibilities", "which he momentarily sets aside in his scholarly pursuits. he is utterly oblivious to the intense resentment brewing within silanus", "misinterpreting silanus's compliance as genuine engagement."],
        ap.active_plans = ["Elaborate on the historical significance and superior efficiency of Caesar's harbor plans to Silanus.", "Cultivate a moment of scholarly camaraderie with Silanus, hoping to foster a sense of connection and shared purpose.", "Subtly reinforce his own intellectual acumen and attention to detail by contrasting the old and new plans."],
        ap.beliefs = ["Intellectual pursuits and historical analysis are valuable tools for effective governance and problem-solving.", "Rational discourse and shared understanding can bridge political divides and personal animosities.", "Appealing to reason and shared intellectual interests can diffuse tension and build trust, even in politically charged environments."],
        ap.goals = ["short-term\": \"Engage Silanus in a detailed discussion about the architectural plans, demonstrating their superiority.", "medium-term\": \"Ensure the harbor project is rebuilt efficiently and cost-effectively, using Caesar's original vision as a guide.", "ultimate\": \"Establish a reputation as a wise and capable ruler who values intellect and efficiency, thereby solidifying his legitimacy and improving Rome's infrastructure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Silanus initially stands beside Claudius, appearing to listen and observe the architectural plans as Claudius directs his attention. However, his posture is tense, his body language betraying a suppressed agitation. While seemingly compliant in the immediate moment, his gaze is not truly focused on the plans but rather calculating and assessing Claudius\'s vulnerability in this private setting. He is coiled and ready to strike, his request for a private audience a calculated move to isolate Claudius.',
        ap.emotional_state = 'Beneath a veneer of strained politeness, Silanus is seething with a potent cocktail of resentment, humiliation, and righteous fury. He outwardly maintains a facade of senatorial decorum, but inwardly, he is consumed by a burning sense of betrayal and dishonor. He feels deeply wronged by Claudius\'s perceived manipulation and sees him as a tyrant deserving of punishment. His surface compliance is a deceptive mask for his volatile rage, which is about to erupt in a violent confrontation. He is emotionally driven by a desperate need to reclaim his honor and strike back against what he perceives as imperial corruption.',
        ap.emotional_tags = ["beneath a veneer of strained politeness, silanus is seething with a potent cocktail of resentment, humiliation,", "righteous fury. he outwardly maintains a facade of senatorial decorum, but inwardly, he is consumed by a burning sense of betrayal", "dishonor. he feels deeply wronged by claudius's perceived manipulation", "sees him as a tyrant deserving of punishment. his surface compliance is a deceptive mask for his volatile rage, which is about to erupt in a violent confrontation. he is emotionally driven by a desperate need to reclaim his honor", "strike back against what he perceives as imperial corruption.", "beneath a veneer of strained politeness", "silanus is seething with a potent cocktail of resentment", "humiliation", "and righteous fury. he outwardly maintains a facade of senatorial decorum", "but inwardly", "he is consumed by a burning sense of betrayal and dishonor. he feels deeply wronged by claudius's perceived manipulation and sees him as a tyrant deserving of punishment. his surface compliance is a deceptive mask for his volatile rage", "which is about to erupt in a violent confrontation. he is emotionally driven by a desperate need to reclaim his honor and strike back against what he perceives as imperial corruption.", "beneath a veneer of strained politeness, silanus is seething with a potent cocktail of resentment, humiliation, and righteous fury. he outwardly maintains a facade of senatorial decorum,", "inwardly, he is consumed by a burning sense of betrayal and dishonor. he feels deeply wronged by claudius's perceived manipulation and sees him as a tyrant deserving of punishment. his surface compliance is a deceptive mask for his volatile rage, which is about to erupt in a violent confrontation. he is emotionally driven by a desperate need to reclaim his honor and strike back against what he perceives as imperial corruption."],
        ap.active_plans = ["Isolate Claudius by requesting a private audience, creating an opportunity for confrontation.", "Express his deep-seated resentment and accusations of tyranny directly to Claudius, making his grievances known.", "Execute a violent act against Claudius, potentially assassination, as a desperate measure of revenge and a symbolic strike against imperial power."],
        ap.beliefs = ["Claudius is a tyrannical ruler who has betrayed the ideals of the Republic and corrupted Roman values.", "Personal honor and dignity are paramount, and violence is a justifiable response to egregious violations of these principles.", "Taking drastic action, even at personal cost, is necessary to oppose tyranny and reclaim lost honor and justice."],
        ap.goals = ["short-term\": \"Secure a private moment alone with Claudius to voice his accusations and grievances directly to the Emperor.", "medium-term\": \"Avenge the perceived dishonor and humiliation inflicted upon him by Claudius, potentially through a violent act of retribution.", "ultimate\": \"Make a dramatic and impactful statement against imperial tyranny, even if futile, in a desperate attempt to restore some semblance of Republican ideals and reclaim his personal honor in the face of overwhelming autocratic power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Silanus launches himself at Claudius, knocking him to the ground with force. His movements are fueled by desperation and rage, reflecting a calculated decision to violently confront the emperor amidst the tension of their conversation.',
        ap.emotional_state = 'Silanus is consumed by a mix of rage and betrayal. Outwardly, he displays fury through his aggressive actions, while internally, he grapples with the weight of perceived dishonor and the desperation of a man willing to risk everything. His aggression stems from a deep-rooted belief in the righteousness of his cause against Claudius\'s reign.',
        ap.emotional_tags = ["silanus is consumed by a mix of rage", "betrayal. outwardly, he displays fury through his aggressive actions, while internally, he grapples with the weight of perceived dishonor", "the desperation of a man willing to risk everything. his aggression stems from a deep-rooted belief in the righteousness of his cause against claudius's reign.", "silanus is consumed by a mix of rage and betrayal. outwardly", "he displays fury through his aggressive actions", "while internally", "he grapples with the weight of perceived dishonor and the desperation of a man willing to risk everything. his aggression stems from a deep-rooted belief in the righteousness of his cause against claudius's reign.", "silanus is consumed by a mix of rage and betrayal. outwardly, he displays fury through his aggressive actions,", "internally, he grapples with the weight of perceived dishonor and the desperation of a man willing to risk everything. his aggression stems from a deep-rooted belief in the righteousness of his cause against claudius's reign."],
        ap.active_plans = ["To physically confront Claudius as an act of rebellion against imperial authority.", "To express his rage and expose Claudius's perceived hypocrisy regarding power dynamics.", "To provoke a response that might lead to Claudius's downfall or at least disrupt the imperial order."],
        ap.beliefs = ["Claudius epitomizes the corruption of imperial power that undermines the Republic.", "Violence is a necessary means to reclaim honor amidst overwhelming betrayal.", "All emperors succumb to the same vices, leading to predictable ruin."],
        ap.goals = ["Short-term: To confront Claudius, challenging his authority through violence.", "Medium-term: To incite chaos that might awaken the Senate's spirit of rebellion.", "Ultimate: To dismantle the imperial regime that he believes is corrupting Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Claudius finds himself unexpectedly assaulted by Silanus, falling to the ground. His physical posture shifts from one of intellectual engagement to vulnerability as he cries out for help, exposing his frailty in this moment of violence.',
        ap.emotional_state = 'Claudius experiences a visceral shock and confusion, oscillating between disbelief and fear. His stammering reflects his internal panic, revealing the emotional turmoil of a ruler faced with betrayal from a once-trusted senator. He grapples with feelings of vulnerability, helplessness, and a desperate plea for understanding.',
        ap.emotional_tags = ["claudius experiences a visceral shock", "confusion, oscillating between disbelief", "fear. his stammering reflects his internal panic, revealing the emotional turmoil of a ruler faced with betrayal from a once-trusted senator. he grapples with feelings of vulnerability, helplessness,", "a desperate plea for understanding.", "claudius experiences a visceral shock and confusion", "oscillating between disbelief and fear. his stammering reflects his internal panic", "revealing the emotional turmoil of a ruler faced with betrayal from a once-trusted senator. he grapples with feelings of vulnerability", "helplessness", "and a desperate plea for understanding."],
        ap.active_plans = ["To understand Silanus's motives behind the attack.", "To maintain control of the situation despite the chaos erupting around him.", "To seek justice for the attack and protect his position as emperor."],
        ap.beliefs = ["His authority as Emperor must be upheld against any form of rebellion.", "Loyalty is fragile in the face of ambition, a reality he continues to grapple with.", "He must remain composed to restore order and assert his legitimacy amidst the chaos."],
        ap.goals = ["Short-term: To defend himself and regain control of the situation.", "Medium-term: To uncover the truth behind Silanus's accusations and actions.", "Ultimate: To solidify his rule and prevent any further threats to his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Pallas stands witness to the unexpected violence, his expression shifting from shock to concern. He instinctively reacts to Silanus\'s attack, embodying the pragmatic vigilance of a trusted advisor in a moment of crisis.',
        ap.emotional_state = 'Pallas is alarmed and alert, feeling an urgent sense of responsibility. His face reveals a mixture of disbelief and anxiety about the implications of the assault on Claudius\'s authority. His loyalty to Claudius drives his immediate reaction to assist.',
        ap.emotional_tags = ["pallas is alarmed", "alert, feeling an urgent sense of responsibility. his face reveals a mixture of disbelief", "anxiety about the implications of the assault on claudius's authority. his loyalty to claudius drives his immediate reaction to assist.", "pallas is alarmed and alert", "feeling an urgent sense of responsibility. his face reveals a mixture of disbelief and anxiety about the implications of the assault on claudius's authority. his loyalty to claudius drives his immediate reaction to assist."],
        ap.active_plans = ["To assess the situation and ensure Claudius's safety amidst the chaos.", "To coordinate with the guards to apprehend Silanus and restore order.", "To support Claudius in regaining control over the council after the attack."],
        ap.beliefs = ["The stability of Claudius's reign must be protected at all costs.", "Loyalty to the Emperor is paramount, especially during moments of crisis.", "Order must be swiftly restored to prevent further unrest in the Senate."],
        ap.goals = ["Short-term: To intervene in the attack and assist Claudius.", "Medium-term: To help manage the fallout from the assault and maintain order.", "Ultimate: To ensure the continuity of Claudius's reign and safeguard the Empire from internal threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Narcissus\'s reaction to the attack is one of shock, quickly transitioning to a mindset focused on damage control. He prepares to summon assistance, indicating a proactive stance in the face of the crisis unfolding before him.',
        ap.emotional_state = 'Narcissus is unsettled yet determined. His shock at the violence is soon overshadowed by a sense of urgency to protect Claudius and stabilize the situation. Internally, he fears for the implications this may have on Roman politics and his own position, prompting swift action.',
        ap.emotional_tags = ["narcissus is unsettled yet determined. his shock at the violence is soon overshadowed by a sense of urgency to protect claudius", "stabilize the situation. internally, he fears for the implications this may have on roman politics", "his own position, prompting swift action.", "narcissus is unsettled yet determined. his shock at the violence is soon overshadowed by a sense of urgency to protect claudius and stabilize the situation. internally", "he fears for the implications this may have on roman politics and his own position", "prompting swift action."],
        ap.active_plans = ["To quickly fetch help for Claudius and manage the chaotic scene.", "To assess the implications of the attack on their political stability.", "To safeguard Claudius's interests in the aftermath of the assault."],
        ap.beliefs = ["The Emperor's safety is crucial for the stability of the Empire.", "Swift action is necessary to mitigate any fallout from the attack.", "Political chaos can threaten not only Claudius but also their positions."],
        ap.goals = ["Short-term: To ensure Claudius receives immediate assistance.", "Medium-term: To re-establish order and manage the Senate's response to the attack.", "Ultimate: To protect Claudius\u2019s reign and navigate through the political turmoil following the incident."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_7'})
    ON CREATE SET
        ap.current_status = 'Claudius begins the scene examining harbor plans, initially focused on uncovering discrepancies and corruption within his administration. He engages Silanus in the discussion, seeking his senatorial perspective. However, he is suddenly and violently attacked by Silanus, thrown to the ground, and cries out for help. Once Silanus is restrained, Claudius, though shaken, immediately demands an explanation for the assault, his authority challenged and his person violated.',
        ap.emotional_state = 'Initially, Claudius is in an analytical and somewhat self-satisfied mood, pleased with his discovery of the harbor plan discrepancy. This quickly shifts to shock and fear during the physical attack, his stammer amplified by panic.  Beneath the surface, confusion and hurt begin to emerge as he grapples with Silanus\'s unexpected violence, struggling to understand the motivation behind this betrayal from someone he believed he had favored. He is deeply bewildered by the accusations of tyranny and dishonor.',
        ap.emotional_tags = ["initially, claudius is in an analytical", "somewhat self-satisfied mood, pleased with his discovery of the harbor plan discrepancy. this quickly shifts to shock", "fear during the physical attack, his stammer amplified by panic.  beneath the surface, confusion", "hurt begin to emerge as he grapples with silanus's unexpected violence, struggling to understand the motivation behind this betrayal from someone he believed he had favored. he is deeply bewildered by the accusations of tyranny", "dishonor.", "initially", "claudius is in an analytical and somewhat self-satisfied mood", "pleased with his discovery of the harbor plan discrepancy. this quickly shifts to shock and fear during the physical attack", "his stammer amplified by panic.  beneath the surface", "confusion and hurt begin to emerge as he grapples with silanus's unexpected violence", "struggling to understand the motivation behind this betrayal from someone he believed he had favored. he is deeply bewildered by the accusations of tyranny and dishonor."],
        ap.active_plans = ["Expose corruption within the harbor project and enforce honest accounting.", "Understand the motives behind Silanus's attack and accusations.", "Reassert his imperial authority in the face of open violence and disrespect."],
        ap.beliefs = ["Justice and fairness are essential principles of governance, and corruption must be rooted out.", "Rational discourse and explanation can resolve conflict and misunderstanding.", "As Emperor, he is entitled to respect and obedience, and violence against him is unacceptable."],
        ap.goals = ["Short-term: To survive the physical assault and regain control of the situation.", "Medium-term: To uncover the full truth behind Silanus's actions and the accusations leveled against him and his family.", "Ultimate: To maintain stability and order in his reign, and to be seen as a just and effective ruler, despite the growing threats and personal betrayals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_7'})
    ON CREATE SET
        ap.current_status = 'Silanus initially observes Claudius and the harbor plans with a suppressed intensity, his internal turmoil masked by outward compliance.  He abruptly transitions to violent action, lunging at Claudius and attempting to overpower him. Once subdued by the guards, he stands defiant and unyielding, spitting accusations of tyranny and dishonor at Claudius, his body language conveying contempt and unwavering conviction in his actions.',
        ap.emotional_state = 'Beneath a veneer of forced composure, Silanus is consumed by simmering rage and a profound sense of betrayal. His attack is an explosion of long-held resentment and a desperate act of defiance. Outwardly, he is contemptuous and accusatory, showing no remorse for his violence. Internally, he is driven by a burning sense of injustice and dishonor, believing he is acting on principle against a corrupt regime. There is a tragic resignation in his defiance, suggesting he anticipates the consequences of his actions but is determined to speak his truth regardless.',
        ap.emotional_tags = ["beneath a veneer of forced composure, silanus is consumed by simmering rage", "a profound sense of betrayal. his attack is an explosion of long-held resentment", "a desperate act of defiance. outwardly, he is contemptuous", "accusatory, showing no remorse for his violence. internally, he is driven by a burning sense of injustice", "dishonor, believing he is acting on principle against a corrupt regime. there is a tragic resignation in his defiance, suggesting he anticipates the consequences of his actions but is determined to speak his truth regardless.", "beneath a veneer of forced composure", "silanus is consumed by simmering rage and a profound sense of betrayal. his attack is an explosion of long-held resentment and a desperate act of defiance. outwardly", "he is contemptuous and accusatory", "showing no remorse for his violence. internally", "he is driven by a burning sense of injustice and dishonor", "believing he is acting on principle against a corrupt regime. there is a tragic resignation in his defiance", "suggesting he anticipates the consequences of his actions but is determined to speak his truth regardless.", "beneath a veneer of forced composure, silanus is consumed by simmering rage and a profound sense of betrayal. his attack is an explosion of long-held resentment and a desperate act of defiance. outwardly, he is contemptuous and accusatory, showing no remorse for his violence. internally, he is driven by a burning sense of injustice and dishonor, believing he is acting on principle against a corrupt regime. there is a tragic resignation in his defiance, suggesting he anticipates the consequences of his actions", "is determined to speak his truth regardless."],
        ap.active_plans = ["Assassinate Claudius to end his perceived tyranny (immediate, though failed).", "Publicly denounce Claudius as a tyrant and expose his alleged dishonorable intentions regarding Messalina and Domitia.", "Reclaim his personal honor and make a final, desperate stand for Republican values against imperial corruption."],
        ap.beliefs = ["Claudius is a tyrant and a hypocrite, undeserving of the imperial throne.", "Personal honor and integrity are worth more than life itself, especially when faced with dishonor.", "Violence is a justifiable response to tyranny and personal violation when all other avenues are closed."],
        ap.goals = ["Short-term: To inflict mortal harm on Claudius and articulate his grievances before death.", "Medium-term: To expose the perceived moral bankruptcy of Claudius's court and inspire resistance against imperial rule.", "Ultimate: To be remembered as a martyr for Republican ideals and personal honor, even in defeat, and to strike a blow against what he sees as the corruption of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_11_7'})
    ON CREATE SET
        ap.current_status = 'Rufrius bursts into the Grand Council Chamber at Claudius\'s cries for help, accompanied by guards. He acts swiftly and decisively, immediately taking control of the situation by restraining Silanus and ensuring Claudius\'s safety. His presence is commanding and authoritative, embodying the Praetorian Guard\'s role as enforcers of imperial power and security.',
        ap.emotional_state = 'Rufrius is characterized by professional efficiency and unwavering loyalty to Claudius. His emotional state is likely focused on duty and action, with a sense of urgency in responding to the Emperor\'s distress. He displays no hesitation or questioning, immediately moving to neutralize the threat posed by Silanus. Beneath the surface of his professional demeanor, there is an implied readiness to use force and brutality to protect the Emperor and maintain order, reflecting the Praetorian Guard\'s ruthless reputation.',
        ap.emotional_tags = ["rufrius is characterized by professional efficiency", "unwavering loyalty to claudius. his emotional state is likely focused on duty", "action, with a sense of urgency in responding to the emperor's distress. he displays no hesitation or questioning, immediately moving to neutralize the threat posed by silanus. beneath the surface of his professional demeanor, there is an implied readiness to use force", "brutality to protect the emperor", "maintain order, reflecting the praetorian guard's ruthless reputation.", "rufrius is characterized by professional efficiency and unwavering loyalty to claudius. his emotional state is likely focused on duty and action", "with a sense of urgency in responding to the emperor's distress. he displays no hesitation or questioning", "immediately moving to neutralize the threat posed by silanus. beneath the surface of his professional demeanor", "there is an implied readiness to use force and brutality to protect the emperor and maintain order", "reflecting the praetorian guard's ruthless reputation."],
        ap.active_plans = ["Immediately respond to Claudius's call for help and secure the area.", "Subdue and restrain Silanus, preventing further harm to Claudius.", "Prepare to extract information from Silanus and ensure he faces the consequences of his actions."],
        ap.beliefs = ["The Emperor's safety is paramount, and the Praetorian Guard's primary duty is to protect him.", "Swift and decisive action is necessary to quell threats to imperial authority.", "Disobedience and violence against the Emperor must be met with brutal force and punishment."],
        ap.goals = ["Short-term: To neutralize the immediate threat posed by Silanus and secure the Council Chamber.", "Medium-term: To ensure Silanus is interrogated and punished for his attempted regicide, sending a clear message against future attacks.", "Ultimate: To maintain the stability of Claudius's reign and the unchallenged authority of the Praetorian Guard as protectors of the Emperor and the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_8'})
    ON CREATE SET
        ap.current_status = 'Claudius stands at the marble table, fidgeting with the architectural plans of the harbor. He shifts his weight nervously, his eyes dart between the maps and Silanus, seeking clarity amidst the tension. The sudden lunge from Silanus catches him off guard, knocking him to the ground as he calls for help, revealing both his physical vulnerability and the precariousness of his position as Emperor.',
        ap.emotional_state = 'Claudius exhibits a facade of confusion and shock, his stutter betraying his fear and disbelief at the sudden turn of events. Internally, he is grappling with feelings of betrayal and vulnerability, questioning the loyalty of those around him. His mind races as he desperately seeks understanding of Silanus\'s accusations against his wife, caught between his role as a ruler and his personal attachments.',
        ap.emotional_tags = ["claudius exhibits a facade of confusion", "shock, his stutter betraying his fear", "disbelief at the sudden turn of events. internally, he is grappling with feelings of betrayal", "vulnerability, questioning the loyalty of those around him. his mind races as he desperately seeks understanding of silanus's accusations against his wife, caught between his role as a ruler", "his personal attachments.", "claudius exhibits a facade of confusion and shock", "his stutter betraying his fear and disbelief at the sudden turn of events. internally", "he is grappling with feelings of betrayal and vulnerability", "questioning the loyalty of those around him. his mind races as he desperately seeks understanding of silanus's accusations against his wife", "caught between his role as a ruler and his personal attachments."],
        ap.active_plans = ["Demand clarification from Silanus regarding the shocking accusations against Messalina.", "Establish authority over the council by insisting on an investigation into the claims made by Silanus.", "Prepare to summon Messalina and her mother for confrontation to uncover the truth behind the insinuations."],
        ap.beliefs = ["Believes in the importance of loyalty and honor among those close to him, especially within his family.", "Holds a conviction that his role as Emperor requires him to protect the integrity of his reign and those he loves.", "Trusts in the validity of the past and the wisdom of his predecessors, which influences his decision-making."],
        ap.goals = ["Short-term: To understand the truth of Silanus's accusations against Messalina and Domitia.", "Medium-term: To assert his authority by taking decisive action against corruption among his officials.", "Ultimate: To protect his reign and family, ensuring stability within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_8'})
    ON CREATE SET
        ap.current_status = 'Silanus, filled with defiance, lunges at Claudius, knocking him down in a desperate act of rebellion. His posture is aggressive, fueled by a sense of betrayal and a desire to confront the Emperor. As guards seize him, Silanus remains steadfast in his accusations, defiantly challenging Claudius\'s authority and the corruption he perceives within the imperial court.',
        ap.emotional_state = 'Silanus\'s exterior is one of rage and resolution, driven by a deep-seated resentment towards Claudius. Beneath the surface, he grapples with feelings of betrayal and disillusionment, believing he has been wronged both politically and personally. His emotional conflict manifests in his explosive actions, revealing a man pushed to the brink by the machinations of imperial power.',
        ap.emotional_tags = ["silanus's exterior is one of rage", "resolution, driven by a deep-seated resentment towards claudius. beneath the surface, he grapples with feelings of betrayal", "disillusionment, believing he has been wronged both politically", "personally. his emotional conflict manifests in his explosive actions, revealing a man pushed to the brink by the machinations of imperial power.", "silanus's exterior is one of rage and resolution", "driven by a deep-seated resentment towards claudius. beneath the surface", "he grapples with feelings of betrayal and disillusionment", "believing he has been wronged both politically and personally. his emotional conflict manifests in his explosive actions", "revealing a man pushed to the brink by the machinations of imperial power."],
        ap.active_plans = ["Confront Claudius about his perceived hypocrisy and the corruption that taints his reign.", "Seek to expose the truth about Claudius's relationship with Messalina and the implications of their union.", "Defy the authority of Claudius, willing to face the consequences of his actions in pursuit of honor."],
        ap.beliefs = ["Firmly believes in the ideals of the Republic and the importance of integrity in leadership.", "Holds a conviction that Claudius represents the decay of moral authority in Rome, equating his rule to tyranny.", "Trusts that exposing the truth about Claudius will restore honor to his own name and the Senate."],
        ap.goals = ["Short-term: To confront Claudius directly about his alleged wrongdoings and the corruption surrounding him.", "Medium-term: To rally support from others in the Senate by exposing Claudius\u2019s weaknesses.", "Ultimate: To reclaim honor for himself and the principles of the Republic, potentially restoring its values against imperial tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Domitia stands beside her daughter, Messalina, in the imposing Imperial Assembly Hall, her posture reflecting deep unease. She confronts Messalina directly, her voice laced with a mixture of confusion and accusation as she grapples with the unfolding drama and the apparent betrayal by Silanus, her newly-wedded husband, visibly distressed and seeking answers from her daughter regarding the assassination attempt.',
        ap.emotional_state = 'Domitia is emotionally fractured, torn between maternal loyalty to Messalina and a burgeoning suspicion of her daughter\'s manipulative nature. Outwardly, she expresses confusion and a desire for truth, yet internally, a deep-seated fear and betrayal begin to take root. She is struggling to reconcile her understanding of her daughter with the monstrous possibilities suggested by the accusation and Messalina\'s evasiveness, creating a palpable tension between her surface words and inner turmoil.',
        ap.emotional_tags = ["domitia is emotionally fractured, torn between maternal loyalty to messalina", "a burgeoning suspicion of her daughter's manipulative nature. outwardly, she expresses confusion", "a desire for truth, yet internally, a deep-seated fear", "betrayal begin to take root. she is struggling to reconcile her understanding of her daughter with the monstrous possibilities suggested by the accusation", "messalina's evasiveness, creating a palpable tension between her surface words", "inner turmoil.", "domitia is emotionally fractured", "torn between maternal loyalty to messalina and a burgeoning suspicion of her daughter's manipulative nature. outwardly", "she expresses confusion and a desire for truth", "yet internally", "a deep-seated fear and betrayal begin to take root. she is struggling to reconcile her understanding of her daughter with the monstrous possibilities suggested by the accusation and messalina's evasiveness", "creating a palpable tension between her surface words and inner turmoil."],
        ap.active_plans = ["To understand the truth behind Silanus's alleged assassination attempt.", "To protect Silanus from unjust accusations, driven by her recent marriage and sense of duty.", "To confront Messalina directly and seek clarity on her potential involvement, despite her own fear of the answer."],
        ap.beliefs = ["Family loyalty is paramount, although currently conflicted between her daughter and new husband.", "Truth and justice should prevail, even in the treacherous Roman court, though her faith in this is wavering.", "Messalina is still her daughter and therefore, inherently deserving of some initial trust, despite growing doubts."],
        ap.goals = ["Short-term: To elicit a truthful response from Messalina about her knowledge of the events.", "Medium-term: To ensure Silanus receives a fair hearing and is not unjustly punished.", "Ultimate: To maintain some semblance of family integrity and navigate the dangerous political landscape without losing her moral compass completely."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands amidst the austere grandeur of the Imperial Assembly Hall, physically unharmed but radiating an air of profound exhaustion and bewilderment. He directs the scene with a weary authority, demanding repetitions and explanations from both Silanus and Messalina. His posture, though imperial, betrays a deep vulnerability as he seeks to comprehend the treachery directed at him, relying on others to illuminate the truth he struggles to grasp.',
        ap.emotional_state = 'Claudius is a maelstrom of conflicting emotions: outwardly, he projects imperial command, demanding answers and asserting his authority as Emperor. However, beneath the surface, he is deeply wounded and confused by the assassination attempt and the web of deceit unfolding before him. He feels betrayed and exposed, his naive trust in those around him shattered. There\'s a palpable tension between his need to project strength and his internal sense of vulnerability and weariness, struggling to reconcile his scholarly nature with the brutal realities of imperial power.',
        ap.emotional_tags = ["claudius is a maelstrom of conflicting emotions: outwardly, he projects imperial command, demanding answers", "asserting his authority as emperor. however, beneath the surface, he is deeply wounded", "confused by the assassination attempt", "the web of deceit unfolding before him. he feels betrayed", "exposed, his naive trust in those around him shattered. there's a palpable tension between his need to project strength", "his internal sense of vulnerability", "weariness, struggling to reconcile his scholarly nature with the brutal realities of imperial power.", "claudius is a maelstrom of conflicting emotions: outwardly", "he projects imperial command", "demanding answers and asserting his authority as emperor. however", "beneath the surface", "he is deeply wounded and confused by the assassination attempt and the web of deceit unfolding before him. he feels betrayed and exposed", "his naive trust in those around him shattered. there's a palpable tension between his need to project strength and his internal sense of vulnerability and weariness", "struggling to reconcile his scholarly nature with the brutal realities of imperial power."],
        ap.active_plans = ["To ascertain the true motives behind Silanus's assassination attempt, seeking clarity amidst the conflicting narratives.", "To assert his authority as Emperor in the face of open treachery, maintaining a semblance of control in the chaotic court.", "To evaluate Messalina's role in the unfolding drama, attempting to discern truth from her carefully constructed performance of innocence."],
        ap.beliefs = ["The Emperor must maintain order and punish treason to prevent further challenges to his rule.", "Justice, though often manipulated in Rome, is a necessary principle to uphold, at least outwardly.", "He is inherently vulnerable due to his perceived weaknesses and must rely on advisors and his wife, even if trust is fragile."],
        ap.goals = ["Short-term: To resolve the immediate crisis and sentence Silanus, demonstrating decisive imperial action.", "Medium-term: To reinforce his authority and deter future assassination attempts, securing his fragile reign.", "Ultimate: To establish a semblance of stability and order in Rome, despite the pervasive treachery and his own internal doubts about his fitness to rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Messalina stands in the Imperial Assembly Hall, a vision of radiant composure amidst the unfolding chaos. She positions herself strategically beside her distraught mother, Domitia, and faces Claudius with an expertly crafted expression of shock and concern. Her movements are fluid and theatrical as she deflects accusations and constructs a narrative of Silanus\'s \'mad love\', orchestrating the scene to maintain her innocence and solidify her control.',
        ap.emotional_state = 'Messalina exudes an outward performance of distress and wifely devotion, a masterful facade designed to manipulate Claudius and the court. Internally, she is ice-cold and calculating, expertly controlling her emotions to execute her plan. Beneath the surface, a flicker of something akin to possessive obsession with Silanus might exist, twisted with her ambition, but primarily, she is driven by ruthless self-preservation and the unwavering pursuit of power. There is a stark contrast between her fabricated fragility and her inner steel, a testament to her manipulative genius.',
        ap.emotional_tags = ["messalina exudes an outward performance of distress", "wifely devotion, a masterful facade designed to manipulate claudius", "the court. internally, she is ice-cold", "calculating, expertly controlling her emotions to execute her plan. beneath the surface, a flicker of something akin to possessive obsession with silanus might exist, twisted with her ambition, but primarily, she is driven by ruthless self-preservation", "the unwavering pursuit of power. there is a stark contrast between her fabricated fragility", "her inner steel, a testament to her manipulative genius.", "messalina exudes an outward performance of distress and wifely devotion", "a masterful facade designed to manipulate claudius and the court. internally", "she is ice-cold and calculating", "expertly controlling her emotions to execute her plan. beneath the surface", "a flicker of something akin to possessive obsession with silanus might exist", "twisted with her ambition", "but primarily", "she is driven by ruthless self-preservation and the unwavering pursuit of power. there is a stark contrast between her fabricated fragility and her inner steel", "a testament to her manipulative genius.", "messalina exudes an outward performance of distress and wifely devotion, a masterful facade designed to manipulate claudius and the court. internally, she is ice-cold and calculating, expertly controlling her emotions to execute her plan. beneath the surface, a flicker of something akin to possessive obsession with silanus might exist, twisted with her ambition,", "primarily, she is driven by ruthless self-preservation and the unwavering pursuit of power. there is a stark contrast between her fabricated fragility and her inner steel, a testament to her manipulative genius."],
        ap.active_plans = ["To completely discredit Silanus by portraying him as a lovesick madman, obscuring her own manipulative role.", "To coerce Domitia into supporting her fabricated narrative, leveraging maternal duty and fear of implication.", "To reinforce Claudius's trust in her by feigning vulnerability and dependence, ensuring he remains blind to her true machinations."],
        ap.beliefs = ["Power is the ultimate goal, and manipulation is a necessary tool to achieve it in the Roman court.", "She is superior in intellect and cunning to those around her, including Claudius and Silanus.", "Emotional displays, whether genuine or feigned, are potent weapons in political maneuvering and control."],
        ap.goals = ["Short-term: To successfully frame Silanus and escape any suspicion, solidifying her alibi.", "Medium-term: To eliminate Silanus as a threat and further consolidate her power within Claudius's court.", "Ultimate: To become the true power behind the throne, manipulating Claudius and controlling Rome to fulfill her insatiable ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Standing defiantly before Claudius, Silanus is flanked by soldiers, his posture radiating defiance as he openly admits to his assassination attempt. His voice is steady, cutting through the cold marble hall with a bold proclamation against the Emperor.',
        ap.emotional_state = 'Silanus exhibits a fierce blend of anger and conviction. Outwardly, he is resolute, challenging Claudius\'s authority. Internally, his desperation drives him, fueled by a sense of betrayal and a fierce need to reclaim honor for himself and the ideals of the Republic. The stakes of this confrontation weigh heavily on him, battling between a desire for vengeance and the tragic reality of his downfall.',
        ap.emotional_tags = ["silanus exhibits a fierce blend of anger", "conviction. outwardly, he is resolute, challenging claudius's authority. internally, his desperation drives him, fueled by a sense of betrayal", "a fierce need to reclaim honor for himself", "the ideals of the republic. the stakes of this confrontation weigh heavily on him, battling between a desire for vengeance", "the tragic reality of his downfall.", "silanus exhibits a fierce blend of anger and conviction. outwardly", "he is resolute", "challenging claudius's authority. internally", "his desperation drives him", "fueled by a sense of betrayal and a fierce need to reclaim honor for himself and the ideals of the republic. the stakes of this confrontation weigh heavily on him", "battling between a desire for vengeance and the tragic reality of his downfall."],
        ap.active_plans = ["To expose Messalina's manipulations and rally support for his cause.", "To incite Claudius into a confrontation that reveals the truth about the court\u2019s treachery.", "To position himself as a martyr for the Republic, even at the cost of his own life."],
        ap.beliefs = ["The Republic should be restored, and Emperors like Claudius are a blight upon Rome.", "Loyalty and honor must be defended, even through extreme actions.", "A true leader embodies the will of the people over the whims of a tyrant."],
        ap.goals = ["Short-term: To survive the immediate confrontation and expose Messalina's true nature.", "Medium-term: To destabilize Claudius's rule and inspire others to rise against tyranny.", "Ultimate: To see the Republic restored and eliminate the autocracy that has taken root."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits heavily upon his throne, visibly drained from the confrontation. His posture is one of weariness, burdened by the weight of the accusations and the chaotic scene unfolding before him. He tries to maintain authority, but the tremor in his voice betrays his unease as he navigates the treacherous waters of loyalty and betrayal.',
        ap.emotional_state = 'Claudius is caught in a storm of confusion and frustration. Outwardly, he attempts to project authority; however, internally, he grapples with feelings of betrayal, a growing awareness of his own vulnerability, and the suffocating pressure of the Imperial role he never wanted. His emotional state is a tumultuous blend of fear for his safety and a desperate, naive hope for trust in those around him.',
        ap.emotional_tags = ["claudius is caught in a storm of confusion", "frustration. outwardly, he attempts to project authority; however, internally, he grapples with feelings of betrayal, a growing awareness of his own vulnerability,", "the suffocating pressure of the imperial role he never wanted. his emotional state is a tumultuous blend of fear for his safety", "a desperate, naive hope for trust in those around him.", "claudius is caught in a storm of confusion and frustration. outwardly", "he attempts to project authority; however", "internally", "he grapples with feelings of betrayal", "a growing awareness of his own vulnerability", "and the suffocating pressure of the imperial role he never wanted. his emotional state is a tumultuous blend of fear for his safety and a desperate", "naive hope for trust in those around him.", "claudius is caught in a storm of confusion and frustration. outwardly, he attempts to project authority", "however, internally, he grapples with feelings of betrayal, a growing awareness of his own vulnerability, and the suffocating pressure of the imperial role he never wanted. his emotional state is a tumultuous blend of fear for his safety and a desperate, naive hope for trust in those around him."],
        ap.active_plans = ["To assert his authority over the Senate by demanding Silanus repeat his accusations.", "To navigate the treacherous dynamics between Messalina, Silanus, and Domitia.", "To stabilize his rule amidst the turmoil and prevent the Republic's ideals from undermining his power."],
        ap.beliefs = ["The Emperor must be a strong figure, even when facing betrayal.", "Trust is a fragile illusion in the political landscape of Rome.", "He must protect the imperial legacy at all costs, even if it means sacrificing personal relationships."],
        ap.goals = ["Short-term: To quell the immediate threat posed by Silanus and assert his authority.", "Medium-term: To reinforce his position as Emperor and navigate the treacherous political landscape.", "Ultimate: To bring stability to Rome and reconcile the conflicting ideals of the Republic and Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Messalina stands radiant yet calculating beside her mother, exuding a veneer of concern as she engages Claudius. Her gestures are exaggerated, feigning affection and alarm, while inwardly she operates on a cold, strategic plane, manipulating the situation to her advantage.',
        ap.emotional_state = 'On the surface, Messalina feigns distress and innocence, her voice laden with false sweetness. Internally, she is a tempest of ambition and cunning, keenly aware of the leverage she holds in this dangerous game. Each word is a calculated move, reflecting her ability to mask her true intentions while navigating the chaos around her. The stakes are personal, and she is determined to maintain her grip on power.',
        ap.emotional_tags = ["on the surface, messalina feigns distress", "innocence, her voice laden with false sweetness. internally, she is a tempest of ambition", "cunning, keenly aware of the leverage she holds in this dangerous game. each word is a calculated move, reflecting her ability to mask her true intentions while navigating the chaos around her. the stakes are personal,", "she is determined to maintain her grip on power.", "on the surface", "messalina feigns distress and innocence", "her voice laden with false sweetness. internally", "she is a tempest of ambition and cunning", "keenly aware of the leverage she holds in this dangerous game. each word is a calculated move", "reflecting her ability to mask her true intentions while navigating the chaos around her. the stakes are personal", "and she is determined to maintain her grip on power.", "on the surface, messalina feigns distress and innocence, her voice laden with false sweetness. internally, she is a tempest of ambition and cunning, keenly aware of the leverage she holds in this dangerous game. each word is a calculated move, reflecting her ability to mask her true intentions", "navigating the chaos around her. the stakes are personal, and she is determined to maintain her grip on power."],
        ap.active_plans = ["To manipulate Claudius\u2019s perception of Silanus and alleviate suspicion from herself.", "To leverage her mother's presence to bolster her own narrative and deflect blame.", "To ensure that Silanus's death serves her own ambitions without jeopardizing her position."],
        ap.beliefs = ["Her beauty and cunning are tools to wield power and influence over Claudius.", "Emotional manipulation is a valid strategy in the ruthless political landscape of Rome.", "True loyalty is measured by one\u2019s ability to adapt and manipulate circumstances to one\u2019s advantage."],
        ap.goals = ["Short-term: To protect her position by shifting blame from herself to Silanus.", "Medium-term: To ensure Claudius remains oblivious to her true ambitions and manipulations.", "Ultimate: To solidify her power alongside Claudius and manipulate the dynamics of the court to her favor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits heavily upon his throne in the austere assembly hall, his body language radiating exhaustion and the immense weight of his imperial responsibilities. He observes the unfolding drama with a weary gaze, listening intently to the conflicting testimonies of Silanus and Messalina, his hands clasped tightly as if seeking some anchor in the swirling chaos of accusations and lies.',
        ap.emotional_state = 'Emotionally fractured, Claudius is visibly torn between his desire to believe in Messalina\'s innocence and the damning weight of Silanus\'s accusations. Outwardly, he projects an image of imperial authority, demanding truth and justice. Yet, beneath this facade, a storm of confusion, betrayal, and profound sadness rages. He grapples with the agonizing possibility of deceit from his wife, a thought that deeply wounds his fragile trust and intensifies his inherent insecurities about his reign and personal relationships.',
        ap.emotional_tags = ["emotionally fractured, claudius is visibly torn between his desire to believe in messalina's innocence", "the damning weight of silanus's accusations. outwardly, he projects an image of imperial authority, demanding truth", "justice. yet, beneath this facade, a storm of confusion, betrayal,", "profound sadness rages. he grapples with the agonizing possibility of deceit from his wife, a thought that deeply wounds his fragile trust", "intensifies his inherent insecurities about his reign", "personal relationships.", "emotionally fractured", "claudius is visibly torn between his desire to believe in messalina's innocence and the damning weight of silanus's accusations. outwardly", "he projects an image of imperial authority", "demanding truth and justice. yet", "beneath this facade", "a storm of confusion", "betrayal", "and profound sadness rages. he grapples with the agonizing possibility of deceit from his wife", "a thought that deeply wounds his fragile trust and intensifies his inherent insecurities about his reign and personal relationships."],
        ap.active_plans = ["Determine the veracity of Silanus's accusations and Messalina's defense to discern the truth.", "Assert his imperial authority by presiding over the judgment and demonstrating decisive leadership.", "Seek to maintain a semblance of order and control within the chaotic situation, preventing further escalation or public scandal."],
        ap.beliefs = ["Justice, though often obscured, must ultimately prevail in the Roman state.", "Marriage, ideally, should be a bond of trust and fidelity, although his experience increasingly challenges this belief.", "As Emperor, he carries the ultimate responsibility for Rome's stability and the well-being of its people, necessitating difficult decisions."],
        ap.goals = ["Short-term: Issue a verdict in the Silanus affair that is perceived as just and decisive, resolving the immediate crisis.", "Medium-term: Re-establish a sense of order and security within his court, quelling any further challenges to his authority.", "Ultimate: Secure a stable and respected reign, despite the treacherous political landscape, even if it means sacrificing personal happiness and trust."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Silanus stands erect and defiant amidst the imposing Imperial Assembly Hall, soldiers flanking him but failing to diminish his spirited stance. He faces Claudius and Messalina directly, his gaze unwavering and piercing. He articulates his accusations with passionate clarity, his voice resonating with the conviction of a man who believes in the righteousness of his cause, even in the face of certain death.',
        ap.emotional_state = 'Consumed by righteous fury and a profound sense of betrayal, Silanus outwardly expresses scorn and contempt for Claudius and Messalina, his words laced with bitterness and accusation. Internally, he is resolved and almost liberated by his impending doom. His despair over the corruption of Rome and the loss of republican ideals fuels his defiance, yet beneath the anger, there is a tragic resignation, a weary acceptance of his fate as a martyr for a lost cause.',
        ap.emotional_tags = ["consumed by righteous fury", "a profound sense of betrayal, silanus outwardly expresses scorn", "contempt for claudius", "messalina, his words laced with bitterness", "accusation. internally, he is resolved", "almost liberated by his impending doom. his despair over the corruption of rome", "the loss of republican ideals fuels his defiance, yet beneath the anger, there is a tragic resignation, a weary acceptance of his fate as a martyr for a lost cause.", "consumed by righteous fury and a profound sense of betrayal", "silanus outwardly expresses scorn and contempt for claudius and messalina", "his words laced with bitterness and accusation. internally", "he is resolved and almost liberated by his impending doom. his despair over the corruption of rome and the loss of republican ideals fuels his defiance", "yet beneath the anger", "there is a tragic resignation", "a weary acceptance of his fate as a martyr for a lost cause."],
        ap.active_plans = ["Forcefully reiterate his accusations against Claudius and Messalina, ensuring the truth, as he sees it, is heard and understood.", "Undermine Claudius's legitimacy by exposing what he perceives as the Emperor's hypocrisy and moral corruption.", "Accept his death with dignity and defiance, using his final moments to make a powerful statement against imperial tyranny and in favor of republican ideals."],
        ap.beliefs = ["Claudius is a puppet Emperor, manipulated and morally bankrupt, embodying the decay of Roman virtue.", "Messalina is a dangerous and corrupting influence, a symbol of the decadence that plagues Rome.", "Republican values of honor, justice, and virtue are inherently superior to imperial autocracy, even if they are currently suppressed."],
        ap.goals = ["Short-term: Ensure his accusations are clearly and forcefully delivered, leaving no room for doubt about his motivations.", "Medium-term: Inspire dissent and plant seeds of doubt about Claudius's reign, potentially fueling future resistance.", "Ultimate: Become a martyr for the Republican cause, his death serving as a lasting indictment of imperial corruption and a rallying cry for future generations yearning for a return to republican ideals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Messalina stands at the forefront of the assembly, initially feigning shock and confusion, then swiftly transitioning into a performance of wounded innocence and wifely devotion. She moves with practiced grace, her body language carefully calibrated to project an image of fragility and sincerity. Her words are measured and emotive, each syllable crafted to manipulate Claudius and the court, reinforcing her fabricated narrative.',
        ap.emotional_state = 'Calculating and utterly self-serving, Messalina outwardly displays theatrical distress and injured innocence, her voice trembling with feigned emotion as she denies Silanus\'s accusations. Internally, she is cold, ruthless, and entirely focused on self-preservation and the consolidation of her power. Beneath the surface performance, there\'s a chilling confidence in her manipulative abilities and a complete lack of genuine remorse or empathy for Silanus\'s plight or Claudius\'s distress.',
        ap.emotional_tags = ["calculating", "utterly self-serving, messalina outwardly displays theatrical distress", "injured innocence, her voice trembling with feigned emotion as she denies silanus's accusations. internally, she is cold, ruthless,", "entirely focused on self-preservation", "the consolidation of her power. beneath the surface performance, there's a chilling confidence in her manipulative abilities", "a complete lack of genuine remorse or empathy for silanus's plight or claudius's distress.", "calculating and utterly self-serving", "messalina outwardly displays theatrical distress and injured innocence", "her voice trembling with feigned emotion as she denies silanus's accusations. internally", "she is cold", "ruthless", "and entirely focused on self-preservation and the consolidation of her power. beneath the surface performance", "there's a chilling confidence in her manipulative abilities and a complete lack of genuine remorse or empathy for silanus's plight or claudius's distress."],
        ap.active_plans = ["Completely discredit Silanus's accusations by portraying him as a lovesick madman, driven by delusional obsession.", "Reassure Claudius of her unwavering love and loyalty, reinforcing her position as his devoted and indispensable wife.", "Silence her mother, Domitia, through intimidation and manipulation, ensuring her complicity in the fabricated narrative to prevent exposure of the truth."],
        ap.beliefs = ["Power is the ultimate objective, and deception is a necessary and justifiable tool to achieve and maintain it.", "Claudius is easily manipulated due to his emotional vulnerabilities and intellectual detachment from the realities of courtly intrigue.", "She is inherently superior in cunning and strategic thinking to those around her, allowing her to control and manipulate events to her advantage."],
        ap.goals = ["Short-term: Ensure Silanus is condemned and eliminated as a threat, thus removing any immediate danger to her position and reputation.", "Medium-term: Solidify her grip on Claudius and the Roman court, reinforcing her power and influence over imperial decisions.", "Ultimate: Become the true power behind the throne, wielding significant and unchecked control over the Roman Empire, shaping its destiny according to her own ambition and desires."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Pallas stands rigidly beside Claudius, his posture formal and watchful, his presence projecting an aura of unwavering loyalty and pragmatic efficiency. He observes the unfolding drama with a detached, analytical gaze, his attention focused on the political implications and the maintenance of imperial stability. He speaks only when necessary, his words concise and impactful, carrying the weight of practical authority and cold political calculation.',
        ap.emotional_state = 'Emotionally detached and pragmatically focused, Pallas displays a calm and collected demeanor, devoid of any overt emotional expression. Internally, he is likely assessing the situation with cynical realism, prioritizing the stability of the empire over personal sentiments or abstract notions of justice. He views the events through a lens of political expediency, his loyalty to Claudius and the imperial structure paramount, eclipsing any personal feelings about the individuals involved.',
        ap.emotional_tags = ["emotionally detached", "pragmatically focused, pallas displays a calm", "collected demeanor, devoid of any overt emotional expression. internally, he is likely assessing the situation with cynical realism, prioritizing the stability of the empire over personal sentiments or abstract notions of justice. he views the events through a lens of political expediency, his loyalty to claudius", "the imperial structure paramount, eclipsing any personal feelings about the individuals involved.", "emotionally detached and pragmatically focused", "pallas displays a calm and collected demeanor", "devoid of any overt emotional expression. internally", "he is likely assessing the situation with cynical realism", "prioritizing the stability of the empire over personal sentiments or abstract notions of justice. he views the events through a lens of political expediency", "his loyalty to claudius and the imperial structure paramount", "eclipsing any personal feelings about the individuals involved."],
        ap.active_plans = ["Advise Claudius to make a politically expedient decision that reinforces imperial authority and deters future challenges.", "Ensure the swift and decisive resolution of the Silanus affair, preventing any prolonged instability or public unrest.", "Minimize any potential damage to Claudius's image and the overall perception of imperial strength and control within Rome."],
        ap.beliefs = ["Imperial authority must be unequivocally upheld to maintain order and prevent chaos in Rome.", "Political decisions should be based on pragmatic considerations of stability and control, rather than emotional impulses or abstract ideals.", "Strong and decisive action is necessary to deter threats to the Emperor and ensure the continued functioning of the Roman state."],
        ap.goals = ["Short-term: Secure a swift and decisive condemnation of Silanus, effectively ending the immediate crisis and reasserting imperial dominance.", "Medium-term: Strengthen Claudius's rule by reinforcing the perception of his strength and decisiveness, deterring future attempts at rebellion or assassination.", "Ultimate: Maintain long-term stability and order within the Roman Empire under Claudius's reign, ensuring the efficient and uninterrupted functioning of the imperial administration."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_marcus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cestias'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cestias_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_vinicius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_vinicius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius_chaerea'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius_chaerea'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_chaerea_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_herod'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_herod_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_6_1'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_midwife'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_midwife_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_midwife_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_slave_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_slave_1_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_slave_1_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
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
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_xenophon'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_xenophon_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_xenophon_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Event {uuid: 'event_11_7'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_6'}),
          (b:Event {uuid: 'event_11_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_11_8'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_7'}),
          (b:Event {uuid: 'event_11_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tortius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tortius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tortius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tortius_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_narcissus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_narcissus_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_7'}),
          (b:Event {uuid: 'event_11_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_7'}),
          (b:Event {uuid: 'event_11_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufrius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_11_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufrius_event_11_7'}),
          (b:Event {uuid: 'event_11_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_8'}),
          (b:Event {uuid: 'event_11_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_11_8'}),
          (b:Event {uuid: 'event_11_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_fool\'s_luck'})
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
MATCH (a:Agent {uuid: 'agent_domitia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_domitia_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_appius_junius_silanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_appius_junius_silanus_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_messalina_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pallas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pallas_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
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
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_3'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_4'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_5'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_6'}),
                      (e2:Event {uuid: 'event_11_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_3'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_4'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_5'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_6'}),
                      (e2:Event {uuid: 'event_11_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_7'}),
                      (e2:Event {uuid: 'event_11_8'})
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
