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
MERGE (a:Agent {uuid: 'agent_josh_lyman'})
    ON CREATE SET
        a.name = 'Josh Lyman',
        a.title = 'Political Strategist',
        a.description = 'Josh Lyman is a seasoned political strategist whose sharp instincts and emotional depth define his approach to crisis management. In this scene, he stands by a rain-streaked window, absorbed in his troubled thoughts even as relief sweeps the room. His reflective nature and ability to articulate the moral ambiguities of political warfare underscore his internal conflict between success and ethical compromise.',
        a.traits = ["Reflective", "Strategic", "Passionate", "Morally conscientious"],
        a.sphere_of_influence = 'Political strategy and crisis response'
    ;
MERGE (a:Agent {uuid: 'agent_nancy_mcnally'})
    ON CREATE SET
        a.name = 'Nancy McNally',
        a.title = 'National Security Advisor',
        a.description = 'Nancy McNally is a commanding figure whose calm authority under pressure belies the deep concern she holds for national security. Tasked with overseeing delicate assessments and emergency situations, she stands as a pillar of rationality amidst chaos. Her firm yet measured approach in briefing her senior staff highlights a clear mind and a dedication to protecting American interests abroad, making her a vital asset in critical situations.',
        a.traits = ["Commanding", "Calm", "Pragmatic", "Observant"],
        a.sphere_of_influence = 'National Security and crisis management'
    ;
MERGE (a:Agent {uuid: 'agent_donna_moss'})
    ON CREATE SET
        a.name = 'Donna Moss',
        a.title = 'Senior Staff Member',
        a.description = 'Donna Moss is a reliable and empathetic staff member who understands both the technical and emotional aspects of high-pressure political environments. In this scene, she quietly approaches Josh, attuned to his turmoil and offering a gentle reminder of their collective resilience. Donna blends discretion with forthright support, making her a pillar of both professionalism and compassionate stability during uncertain times.',
        a.traits = ["Compassionate", "Observant", "Supportive", "Discreet"],
        a.sphere_of_influence = 'Staff coordination and emotional support within the administration'
    ;
MERGE (a:Agent {uuid: 'agent_kate_harper'})
    ON CREATE SET
        a.name = 'Kate Harper',
        a.title = 'Intelligence Officer',
        a.description = 'Kate Harper is a razor-sharp intelligence officer known for her analytical mind and decisive action during crises. In this scene, she bursts into the Oval Office with a critical update that shifts the atmosphere from tense uncertainty to sudden relief. Her calm authority and precise delivery of information make her an indispensable figure in high-stakes situations, as she bridges the gap between raw intelligence and executive decision-making.',
        a.traits = ["Analytical", "Decisive", "Assertive", "Detail-oriented"],
        a.sphere_of_influence = 'National security and crisis management'
    ;
MERGE (a:Agent {uuid: 'agent_president_bartlet'})
    ON CREATE SET
        a.name = 'Bartlet',
        a.title = 'President of the United States',
        a.description = 'Bartlet is the steadfast leader whose calm demeanor belies an intense inner resolve. In this scene, he monitors his staff from behind the Resolute desk, embodying both the weight of presidential responsibility and a simmering tension over the day\'s close calls. His measured authority and clear-eyed commitment to truth and accountability guide his actions, even as he prepares to address the nation about how narrowly the situation was contained.',
        a.traits = ["Authoritative", "Measured", "Principled", "Reflective"],
        a.sphere_of_influence = 'National leadership and executive decision-making'
    ;
MERGE (a:Agent {uuid: 'agent_leo_mcgarry'})
    ON CREATE SET
        a.name = 'Leo McGarry',
        a.title = 'Chief of Staff',
        a.description = 'Leo McGarry is a steadfast and experienced political operator whose strategic acumen and loyalty ensure the smooth functioning of the administration. Always vigilant, he observes subtle cues in tense moments and provides both counsel and quiet strength to those around him. His presence in the scene is marked not only by his perceptiveness regarding Bartlet’s unspoken signals but also by a deep commitment to maintaining stability in turbulent times.',
        a.traits = ["Loyal", "Strategic", "Observant", "Supportive"],
        a.sphere_of_influence = 'Political strategy and administration management'
    ;
MERGE (a:Agent {uuid: 'agent_general_alexander'})
    ON CREATE SET
        a.name = 'General Alexander',
        a.title = 'General',
        a.description = 'General Alexander is the embodiment of military precision and authority, representing the armed forces in a political milieu. His presence in the Situation Room underlines the gravity of the situation, as he serves as the voice of military insight during crises. With a career marked by decisive actions and rigorous discipline, General Alexander is committed to operational excellence and the safeguarding of national security. His demeanor is steely and measured, reflecting years of leadership in the field.',
        a.traits = ["Disciplined", "Commanding", "Decisive", "Observant"],
        a.sphere_of_influence = 'Military strategy and national defense'
    ;
MERGE (a:Agent {uuid: 'agent_bob_russell'})
    ON CREATE SET
        a.name = 'Bob Russell',
        a.title = 'Vice President',
        a.description = 'Vice President Bob Russell is typically seen as a cool and collected political operator, known for his calculated demeanor and ability to maintain composure under pressure. He has cultivated an image of affability and pragmatism, rarely allowing personal emotions to surface in his public or professional life. However, beneath this carefully constructed exterior lies a capacity for deep personal feeling, especially towards those he cares about. This scene reveals a crack in his political facade, exposing the raw vulnerability and emotional turmoil he experiences when personal connections are threatened, particularly concerning Amanda Dalton, whom he clearly regards with paternal affection and responsibility.',
        a.traits = ["Affable", "Calculated", "Emotionally invested (privately)", "Political operator"],
        a.sphere_of_influence = 'Political Strategy, Executive Branch'
    ;
MERGE (a:Agent {uuid: 'agent_margaret'})
    ON CREATE SET
        a.name = 'Margaret',
        a.title = 'Staffer',
        a.description = 'Margaret is a White House staffer working in the Vice President\'s office, characterized by her professional demeanor and awareness of protocol. She is respectful and dutiful, approaching the Vice President with the necessary formality, even when witnessing him in a private moment of emotional vulnerability. Her presence is a reminder of the official world that surrounds even the most personal of spaces in the West Wing. Though brief, her interaction is crucial as she is the catalyst that pulls Vice President Russell back from his personal reflections and into the urgent demands of the unfolding crisis, highlighting her role as a bridge between his private feelings and his public duties.',
        a.traits = ["Professional", "Respectful", "Duty-conscious", "Observant"],
        a.sphere_of_influence = 'White House Operations, Vice President\'s Office'
    ;
MERGE (a:Agent {uuid: 'agent_amanda_dalton'})
    ON CREATE SET
        a.name = 'Amanda Dalton',
        a.title = 'USAID Worker',
        a.description = 'Amanda Dalton is a dedicated and courageous USAID worker who embodies the spirit of American idealism and service. Driven by a desire to make a tangible difference in the world, she chose a career path that places her in harm\'s way in conflict zones. Inspired by President Bartlet\'s vision of American responsibility, she represents the human face of foreign aid, venturing into dangerous territories to help rebuild shattered societies. Though unseen in this scene, her presence is powerfully felt through Vice President Russell\'s emotional distress, underscoring the personal stakes and the human cost of international crises. Her determination and commitment to humanitarian work are central to understanding the emotional core of the unfolding events.',
        a.traits = ["Dedicated", "Courageous", "Idealistic", "Service-oriented"],
        a.sphere_of_influence = 'International Aid, Humanitarian Work'
    ;
MERGE (a:Agent {uuid: 'agent_viktor_petrov'})
    ON CREATE SET
        a.name = 'Viktor Petrov',
        a.title = 'Russian Ambassador',
        a.description = 'Viktor Petrov is the impeccable Russian Ambassador, a career diplomat whose every word and posture exudes authority and precision. Known for his perfect diplomatic posture and measured tones, he represents Moscow’s firm stance on international issues. His calm, methodical delivery under pressure reflects an experience honed by years in the diplomatic arena, and he is unflinching in defending his nation’s interests even when challenged by powerful figures such as President Bartlet.',
        a.traits = ["Diplomatic", "Composed", "Articulate", "Resolute"],
        a.sphere_of_influence = 'International diplomacy and Russian state affairs'
    ;
MERGE (a:Agent {uuid: 'agent_c_j_cregg'})
    ON CREATE SET
        a.name = 'C.J. Cregg',
        a.title = 'Press Secretary',
        a.description = 'C.J. Cregg is a seasoned press secretary known for her keen insight and ability to brace under the weight of breaking news. Calm and collected even when the atmosphere is fraught with tension, she is quick to act on breaking news alerts and adjusts her demeanor to shield herself from the potential onslaught of media scrutiny. Her professionalism and acumen make her an essential communicator in high-pressure political situations.',
        a.traits = ["Resilient", "Perceptive", "Communicative", "Calm"],
        a.sphere_of_influence = 'Media relations and communications'
    ;
MERGE (a:Agent {uuid: 'agent_sam_seaborn'})
    ON CREATE SET
        a.name = 'Sam Seaborn',
        a.title = 'Deputy Communications Director',
        a.description = 'Sam Seaborn is a gifted and idealistic speechwriter, known for his eloquent prose and deep commitment to public service. He is typically impeccably presented, maintaining a polished and professional image. Underneath his composed exterior, however, lies a passionate and deeply feeling individual, especially evident when grappling with the moral and ethical dimensions of political events. He is driven by a desire to articulate the administration\'s values with clarity and impact, often wrestling with the complexities of translating policy into resonant language that moves and inspires.',
        a.traits = ["Idealistic", "Eloquent", "Passionate", "Intellectual"],
        a.sphere_of_influence = 'Communications, Speechwriting'
    ;
MERGE (a:Agent {uuid: 'agent_toby_ziegler'})
    ON CREATE SET
        a.name = 'Toby Ziegler',
        a.title = 'Communications Director',
        a.description = 'Toby Ziegler is the White House Communications Director, a man of sharp intellect and unwavering moral compass. He is known for his cynical exterior and gruff demeanor, often acting as the administration\'s conscience, challenging decisions and pushing for ethical clarity. Beneath his sometimes abrasive surface, Toby possesses a deep-seated idealism and a profound concern for the human impact of political actions. He is intensely dedicated to crafting messages that are not only strategically effective but also morally sound, often finding himself at odds with political pragmatism in favor of principled communication.',
        a.traits = ["Cynical", "Principled", "Intellectual", "Moralistic"],
        a.sphere_of_influence = 'Communications, Political Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_charlie_young'})
    ON CREATE SET
        a.name = 'Charlie Young',
        a.title = 'Personal Aide',
        a.description = 'Charlie Young is a trusted aide known for his loyal service and ability to respond swiftly to presidential demands. Though his presence is brief in this scene, he is tasked with immediately contacting key figures on behalf of the President, demonstrating his efficiency and unwavering dedication. His role, while supportive, is central to ensuring that the chain of communication remains unbroken during moments of crisis.',
        a.traits = ["Efficient", "Loyal", "Discreet", "Responsive"],
        a.sphere_of_influence = 'Presidential support and communications'
    ;
MERGE (a:Agent {uuid: 'agent_president_kovach'})
    ON CREATE SET
        a.name = 'President Kovach',
        a.title = 'President',
        a.description = 'President Kovach is summoned in this critical juncture, representing another facet of national leadership. Though not seen directly, his presence is implied by the urgent command issued by Bartlet. Kovach\'s role carries the weight of leadership and accountability, as his involvement is crucial to addressing the nation in the wake of a narrowly averted crisis. His character is expected to embody decisiveness and clarity, key traits for navigating treacherous political waters.',
        a.traits = ["Decisive", "Authoritative", "Responsible", "Composed"],
        a.sphere_of_influence = 'National governance and crisis resolution'
    ;
MERGE (o:Object {uuid: 'object_lcd_screens'})
    ON CREATE SET
        o.name = 'LCD Screens',
        o.description = 'Large, high-definition LCD screens dominate one wall of the Situation Room, continuously displaying satellite imagery of conflict zones. Their sleek design and bright, crisp images offer unfiltered, real-time updates that guide strategic decision-making.',
        o.purpose = 'To provide live satellite imagery and vital real-time intelligence during crisis briefings.',
        o.significance = 'They symbolize modern technological prowess in warfare and strategic operations, bridging the gap between remote crisis zones and the nerve center of national power.'
    ;
MERGE (o:Object {uuid: 'object_framed_photograph'})
    ON CREATE SET
        o.name = 'Framed Photograph',
        o.description = 'A deeply personal framed photograph on Vice President Russell\'s desk, depicting a younger Bob Russell teaching a small, pigtailed Amanda Dalton to fish. It carries emotional weight and serves as a tangible link to happier, simpler times.',
        o.purpose = 'To evoke memory and emotional connection.',
        o.significance = 'Represents Russell\'s personal bond with Amanda Dalton and the contrast between forgotten joy and current crisis.'
    ;
MERGE (o:Object {uuid: 'object_desk_lamp'})
    ON CREATE SET
        o.name = 'Desk Lamp',
        o.description = 'A single desk lamp in the Vice President\'s dark office, casting a focused pool of light on key objects, especially the framed photograph. Its illumination delineates a small intimate space amid surrounding shadows.',
        o.purpose = 'To provide focused illumination and create an atmospheric, intimate setting.',
        o.significance = 'Symbolizes solitude, introspection, and vulnerability in the midst of political and personal turmoil.'
    ;
MERGE (o:Object {uuid: 'object_blackberry'})
    ON CREATE SET
        o.name = 'BlackBerry',
        o.description = 'A sleek, compact communication device that buzzes with crucial news alerts. Its efficient design and high-tech features make it a dependable tool during high-pressure moments.',
        o.purpose = 'To receive and alert breaking news updates.',
        o.significance = 'Symbolizes the convergence of technology and the immediacy of modern communication in high-pressure political environments.'
    ;
MERGE (o:Object {uuid: 'object_crumpled_paper'})
    ON CREATE SET
        o.name = 'Crumpled Paper',
        o.description = 'Scattered sheets of crumpled paper litter the desk area, embodying discarded drafts, failed ideas, and the intense creative struggle in speechwriting.',
        o.purpose = 'To represent discarded drafts of speeches.',
        o.significance = 'Embodies creative struggle, the iterative process of drafting, and the high stakes of crafting impactful communication.'
    ;
MERGE (o:Object {uuid: 'object_empty_coffee_cups'})
    ON CREATE SET
        o.name = 'Empty Coffee Cups',
        o.description = 'Several empty coffee cups scattered around the workspace, marking long hours and the relentless effort behind political communication.',
        o.purpose = 'To hold and consume coffee.',
        o.significance = 'Symbolizes long hours, sustained effort, and the behind-the-scenes labor inherent to the West Wing\'s environment.'
    ;
MERGE (o:Object {uuid: 'object_laptop_screen'})
    ON CREATE SET
        o.name = 'Laptop Screen',
        o.description = 'A brightly glowing laptop screen in a dimly lit office shows side-by-side documents, highlighting the precarious balance between hope and despair during a crisis. Its digital interface is central to crafting critical national narratives.',
        o.purpose = 'Displaying documents and facilitating speechwriting.',
        o.significance = 'Represents the duality of the situation and serves as the central tool for communication and strategy.'
    ;
MERGE (o:Object {uuid: 'object_resolute_desk'})
    ON CREATE SET
        o.name = 'Resolute Desk',
        o.description = 'An iconic piece of furniture in the Oval Office, the Resolute Desk, with its aged wood and intricate design, silently witnesses the unfolding drama. It stands as a testament to the weight of leadership and historical continuity.',
        o.purpose = 'To serve as the central executive workspace from which presidential authority is projected.',
        o.significance = 'Symbolizes continuity and the enduring presence of leadership in the face of crisis.'
    ;
MERGE (l:Location {uuid: 'location_white_house_situation_room'})
    ON CREATE SET
        l.name = 'White House Situation Room',
        l.description = 'The White House Situation Room is a secure, dimly lit chamber within the White House designed for crisis management and high-level briefings. Its subdued lighting casts dramatic shadows over a long table where senior officials converge, with multiple LCD screens displaying vital satellite imagery. Additional context underscores its role as a technologically advanced and bustling hub for urgent national security responses, pulling officials from personal spaces into the heart of complex crises.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_vice_presidents_office'})
    ON CREATE SET
        l.name = 'Vice President\'s Office',
        l.description = 'The Vice President\'s Office is depicted as a stately and traditionally furnished space imbued with an atmosphere of power and formality. In this pre-dawn scene, it is shrouded in darkness except for a solitary pool of light from a desk lamp, casting long shadows that emphasize both authority and vulnerability. Rich wood furnishings, leather-bound books, and heavy drapes contribute to its aura of established authority while also revealing a more personal, introspective side.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_colorado_lake_house'})
    ON CREATE SET
        l.name = 'Colorado lake house',
        l.description = 'The Colorado lake house exists only in a photograph and in Vice President Russell\'s memory, symbolizing personal warmth, familial connection, and simpler times. Surrounded by pine trees and overlooking a serene mountain lake, this rustic retreat stands in stark contrast to the tense environments of Washington D.C., evoking nostalgia and a cherished past marked by innocence and deep emotional bonds.',
        l.type = 'Residence'
    ;
MERGE (l:Location {uuid: 'location_mural_room'})
    ON CREATE SET
        l.name = 'Mural Room',
        l.description = 'The Mural Room serves as an impromptu command center layered with artistic and historical significance. Its walls, adorned with evocative murals, provide a rich backdrop that contrasts with the severe and urgent political discussions taking place. Ambient lighting accentuates the room’s dual nature of solemnity and creative inspiration, making it a silent witness to high-stakes dialogue.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    ON CREATE SET
        l.name = 'Steam Pipe Trunk Distribution Venue',
        l.description = 'The Steam Pipe Trunk Distribution Venue is a windowless office space tucked away within the West Wing of the White House. Its utilitarian design, complete with cramped, cluttered surfaces littered with crumpled papers and empty coffee cups, underscores its role as a no-frills functional area. The environment is characterized by the lack of natural light and a subterranean ambiance that contrasts sharply with more prestigious offices.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_oval_office'})
    ON CREATE SET
        l.name = 'Oval Office',
        l.description = 'The Oval Office is depicted as a grand yet intimate setting within the White House, embodying the weight of leadership. Large windows reveal rain streaming down, symbolizing both cleansing and reflection. The room\'s luxurious furnishings and historic decor provide a formal backdrop imbued with tension and the residue of strategic decisions and personal revelations.',
        l.type = 'Office'
    ;
MERGE (o:Organization {uuid: 'org_serbian_paramilitary'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Group',
        o.description = 'An informal yet dangerous organization operating largely outside the official channels of governance, noted for utilizing modern social media to claim responsibility for brutal and unpredictable operations. They position themselves as avengers with political demands—such as the release of detained commanders—relying on a blend of traditional military tactics and modern digital influence to further their agenda.',
        o.sphere_of_influence = 'Paramilitary operations and regional destabilization'
    ;
MERGE (o:Organization {uuid: 'org_usaid'})
    ON CREATE SET
        o.name = 'USAID',
        o.description = 'The United States Agency for International Development (USAID) administers civilian foreign aid and development assistance, supporting countries recovering from conflict, disaster, and poverty. The organization promotes global health, economic growth, and democratic values, embodying America\'s commitment to humanitarian efforts and proactively engaging in politically volatile regions.',
        o.sphere_of_influence = 'International Development, Foreign Aid, Humanitarian Assistance'
    ;
MERGE (o:Organization {uuid: 'org_cnn'})
    ON CREATE SET
        o.name = 'CNN',
        o.description = 'CNN is a leading global news network known for its up-to-the-minute reporting on domestic and international affairs. In this narrative, CNN plays a pivotal role in disseminating breaking news and shaping public perception, especially during high-stakes political events.',
        o.sphere_of_influence = 'Global news and media'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    ON CREATE SET
        ep.title = 'Episode One - Fault Lines',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Tensions in the Situation Room',
        s.description = 'In the pre-dawn hush of the White House Situation Room, dim lighting and long shadows cast a somber mood over a room filled with determination and quiet urgency. Multiple LCD screens display satellite images of the Kosovo-Serbia border, underlining the critical nature of the situation unfolding. The room is steeped in a mix of fatigue and steely resolve, with every face marked by the weight of impending decisions. National Security Advisor Nancy McNally has taken charge, her concern evident as she briefs the assembled staff on the mystery of four missing USAID workers. The atmosphere is charged with both anxiety and focus, reflecting the high stakes of operations that blur the lines between diplomacy and crisis management.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_white_house_situation_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Josh Lyman\'s Entrance',
        e.description = 'In the early pre-dawn hours, Josh Lyman enters the Situation Room. His tie is noticeably loosened, hinting at the tension already brewing within him. As he steps into the room, the ambient dim lighting and the glowing satellite images set a foreboding tone. His subtle gesture of rubbing the old scar on his chest, a relic of past crises, underscores his personal investment in the unfolding events. His quiet entry sets the stage for a morning that promises critical decisions and the weight of responsibility in the face of national security challenges.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Nancy McNally\'s Briefing',
        e.description = 'National Security Advisor Nancy McNally takes center stage at the head of the room’s long table, her commanding presence tinged with a deep concern. She delivers the grim news that four USAID workers, engaged in post-conflict reconstruction near the Kosovo-Serbia border, have gone dark for three hours. Her clear and authoritative tone is a call to attention, laying bare the crisis that now demands immediate action. The urgency in her voice, coupled with the visual cues of a digital display tracking the region, marks a pivotal moment in the narrative where personal duty intermingles with national security priorities.',
        e.sequence = 2,
        e.key_dialogue = ["Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Donna Reports Paramilitary Claim',
        e.description = 'Amid the charged atmosphere of urgent briefings, Donna Moss interjects with an update that heightens the stakes. She mentions that a Serbian paramilitary group is taking responsibility for the disappearance on social media and is making what appears to be an explicit demand: the release of three commanders detained at The Hague. Her report layers another dimension of political tension over the room, emphasizing not only the complexity of the situation but also the intertwining of international repercussions with domestic crisis management. Donna’s intervention is a turning point that shifts the understanding of the threat looming over the administration.',
        e.sequence = 3,
        e.key_dialogue = ["Serbian paramilitary group is claiming responsibility on social media. They're demanding the release of three commanders from The Hague."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Kate Harper\'s Intelligence Update',
        e.description = 'Kate Harper steps forward, delivering a critical piece of intelligence that further clarifies the layers of culpability. She informs the room that elements within the Serbian security services appear to be providing tactical support to the paramilitary group. This revelation not only deepens the conspiracy but also challenges the credibility of regional allies and enemies alike. Her precise articulation signals a turning of the narrative towards an intricate web of political breeding grounds and military undercurrents. The update builds on the established tension, forcing everyone present to question the integrity and reliability of existing intelligence.',
        e.sequence = 4,
        e.key_dialogue = ["Our intelligence suggests elements within Serbian security services provided tactical support to the paramilitary group."]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'President Bartlet\'s Arrival and Inquiry',
        e.description = 'As the accumulated tension reaches its peak, President Bartlet enters the room accompanied by Leo McGarry and General Alexander. His arrival transforms the atmosphere, demanding immediate respect and attention from every staff member. The solemnity in his expression replaces any hint of his usual wittiness, marking the gravity of the situation. Without delay, he inquires about the available options, directly seeking clarity amid chaos. His question, piercing through the layered updates and analyses, underscores the leadership\'s urgent need to regain control and chart the nation’s course. This moment captures the essence of executive resolve in the face of complex international conflict.',
        e.sequence = 5,
        e.key_dialogue = ["Where are we on options?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'A Private Vigil in the Vice President\'s Office',
        s.description = 'In the hushed, pre-dawn darkness of the Vice President\'s Office, only a single desk lamp pierces the gloom, casting long shadows across the room\'s stately furnishings. The atmosphere is thick with unspoken anxiety and personal anguish as Bob Russell sits alone, his gaze locked on a framed photograph. The photograph, illuminated by the lamp\'s soft glow, depicts a younger Russell with a small girl at a Colorado lake house, a poignant reminder of happier times and a stark contrast to the current crisis. The weight of the unfolding hostage situation presses heavily upon him, cracking the carefully constructed facade of the unflappable politician to reveal the raw emotion of a man deeply concerned for someone he loves. This intimate moment underscores the personal stakes of the international crisis, highlighting the human element often obscured by political machinations and national security protocols. The scene serves as a quiet prelude to the high-stakes drama unfolding elsewhere, grounding the global implications of the crisis in the deeply personal.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_vice_presidents_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Russell\'s Pained Revelation',
        e.description = 'Alone in the dimly lit office, Vice President Russell is consumed by worry, his eyes fixed on the photograph of a young Amanda Dalton. He speaks softly, almost to himself, revealing the personal connection between Amanda\'s dedication to USAID and President Bartlet\'s inspiring rhetoric. Russell\'s words underscore the unintended consequences of political idealism on personal lives, and the profound sense of responsibility he feels for Amanda\'s current peril. The dim light and solitary setting amplify the intimacy of his grief and fear, making it a moment of raw, unguarded vulnerability.',
        e.sequence = 1,
        e.key_dialogue = ["RUSSELL: She joined USAID because of him, you know."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Margaret\'s Duty Call',
        e.description = 'The quiet solitude of Russell\'s vigil is broken as Margaret appears in the doorway. She observes the Vice President\'s exposed vulnerability with evident discomfort, her presence a stark reminder of the official world intruding on his private grief. Margaret delivers a formal message, informing him that he is urgently needed in the Situation Room. Her words act as a summons back to duty, compelling Russell to confront the crisis in his official capacity and setting up the conflict between his personal emotions and public responsibilities.',
        e.sequence = 2,
        e.key_dialogue = ["MARGARET: Sir, they're waiting for you in the Situation Room."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Russell Regains Composure',
        e.description = 'Prompted by Margaret\'s interruption and his own internal resolve, Russell continues his thought, now articulating the inspiring ideals behind Bartlet\'s speeches and America\'s humanitarian efforts. As he speaks, he deliberately places the photograph back on his desk, a symbolic gesture of regaining control and compartmentalizing his personal feelings.  He visibly reconstructs his political persona, shedding the raw vulnerability and adopting the composed demeanor of the Vice President, ready to face the unfolding crisis and step into his public role despite the deep personal anxiety he carries.',
        e.sequence = 3,
        e.key_dialogue = ["RUSSELL: Because of a speech Bartlet gave. About America's obligation to help rebuild war-torn regions. To prevent the next conflict before it starts."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Diplomatic Tensions in the Mural Room',
        s.description = 'In the stately ambiance of the Mural Room, the atmosphere is taut with tension and diplomatic gravity. The room, filled with muted light and imposing artwork, serves as an impromptu stage for high-stakes international debate. Here, the Russian Ambassador, Viktor Petrov, stands with unwavering composure, articulating Moscow’s official line with meticulous precision. The room becomes a microcosm of global conflict as President Bartlet challenges Petrov’s narrative with incisive questioning. Subtle cues, such as Bartlet’s jaw clench and tightly clasped hands, signal a hidden storm of resolve behind his calm façade. Nearby, C.J. Cregg receives a disturbing news alert on her BlackBerry, portending the media tempest to come, further amplifying the urgency and high drama of the moment.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_mural_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Ambassador\'s Diplomatic Declaration',
        e.description = 'In the Mural Room, the Russian Ambassador, Viktor Petrov, takes center stage with the poise and precision of a seasoned diplomat. With his posture perfected for the moment, he delivers Moscow’s position, arguing that the kidnapping of American aid workers is an internal Serbian law enforcement issue. The language is measured yet firm, designed to convince while deflecting international intervention. This moment underscores the stark differences in geopolitical perspectives and sets the stage for a sharp debate. The symbolic weight of his words feeds into the broader theme of national sovereignty and the complexities of international diplomacy.',
        e.sequence = 1,
        e.key_dialogue = ["This is, as we see it, an internal Serbian law enforcement matter. Any NATO intervention would constitute a serious violation of sovereign territory."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'President Bartlet’s Sharp Rebuttal',
        e.description = 'Following the Ambassador’s calculated declaration, President Bartlet steps forward with a measured yet assertive retort that cuts to the heart of the matter. He challenges the logic behind dismissing the abduction of American aid workers as merely a domestic issue. His question is both a probe into the credibility of the opposing view and a subtle assertion of American resolve. This exchange not only highlights the internal conflict between diplomatic language and real-world consequences but also reveals layers of personal and political stakes. The tension in Bartlet’s delivery, marked by a clenched jaw and tightly clasped hands, signals a brewing storm of discontent beneath his calm exterior.',
        e.sequence = 2,
        e.key_dialogue = ["Mr. Ambassador, would you care to explain how the kidnapping of American aid workers constitutes an internal matter?"]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'C.J.\'s Stark News Alert',
        e.description = 'Amid the high-stakes diplomatic exchange, C.J. Cregg experiences a sudden moment of disruption as her BlackBerry buzzes with urgent news. In a brief, private moment behind the scenes, she closes her eyes, steeling herself against the rapidly approaching media storm. The alert confirms that CNN is broadcasting Amanda Dalton\'s identity, an explosive detail that carries vast implications for both the political narrative and the personal stakes intertwined with the unfolding crisis. This event punctuates the dialogue with a reminder of how personal tragedies and public scrutiny intertwine, adding an edge of immediacy and foreboding to the ongoing discussions.',
        e.sequence = 3,
        e.key_dialogue = ["Sir, CNN is running with Amanda Dalton's identity."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'The Weight of Words in the Steam Pipe Trunk',
        s.description = 'In the cramped, windowless office known as the Steam Pipe Trunk Distribution Venue, the air is thick with the residue of a long night\'s work. Crumpled papers litter the desk and floor, monuments to discarded ideas, while empty coffee cups stand as testaments to relentless effort.  The only light emanates from Sam Seaborn\'s laptop, its screen casting a pale glow on his face, illuminating the dual nature of his task: crafting speeches for both triumph and disaster. The atmosphere is intensely focused, bordering on frantic, reflecting the high stakes of the unfolding hostage crisis.  Toby Ziegler enters the room, his presence a mixture of concern and quiet support, observing Sam wrestling with the profound challenge of finding the right words to articulate the gravity of the situation and the nation\'s response. This scene underscores the intellectual and emotional labor behind the political drama, highlighting the crucial role of language in shaping national narratives during moments of crisis and moral reckoning.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Sam Grapples with the Language of Tragedy',
        e.description = 'Sam Seaborn sits hunched over his laptop in the disheveled office, a landscape of creative struggle surrounding him. He articulates the core challenge of his task: to transform the brutal reality of political violence into something akin to poetry for a presidential address. He is wrestling with the immense weight of expectation, searching for words that can capture the gravity of the hostage situation and resonate with the nation\'s emotions. The visual of the two distinct documents on his screen—victory and tragedy—emphasizes the precarious balance and the unknown outcome of the crisis, highlighting the difficult task of preparing for both extremes.',
        e.sequence = 1,
        e.key_dialogue = ["SAM: The thing about tragedy is that it demands poetry. But how do you make poetry out of political violence?"]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Toby Offers Counsel on Poetic Restraint',
        e.description = 'Toby Ziegler, standing in the doorway, observes Sam\'s intense struggle with a seasoned and empathetic eye. He responds to Sam\'s question by suggesting that true poetry in such dire circumstances lies not in elaborate prose, but in restraint and in reaffirming core values. Toby guides Sam back to the fundamental purpose of their work: to articulate the nation\'s commitment to humanitarian ideals, reminding him of the importance of conveying why they undertake risky endeavors to help others and rebuild broken places. His advice serves as a crucial course correction, steering Sam away from potential grandiosity and towards a more grounded, meaningful approach.',
        e.sequence = 2,
        e.key_dialogue = ["TOBY: Sometimes poetry is in the restraint. We need to remind people why we send aid workers into dangerous places. Why we try to rebuild what others have destroyed."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Shared Reflection on Moral Identity',
        e.description = 'Sam, visibly absorbing Toby\'s words, runs a hand through his already messy hair, a gesture that underscores his mental and emotional exhaustion.  He reveals the deeper source of his struggle, referencing a past crisis—the Rosslyn shooting—and the subsequent conversation about being \'the good guys\'. This connects the current crisis to a recurring theme within the West Wing: their commitment to moral principles in the face of political realities. Toby\'s simple, firm affirmation, \'We still are,\' serves as a powerful reassurance, grounding Sam in their shared ethical foundation and reinforcing their purpose amidst the chaos and pressure.',
        e.sequence = 3,
        e.key_dialogue = ["SAM: I keep thinking about what you said after Rosslyn. About how we're supposed to be the good guys.", "TOBY: We still are. That's why this is hard."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Oval Office Crisis Resolution',
        s.description = 'In the tense, rain-soaked pre-dawn ambiance of the Oval Office, senior staff gather amid remnants of a long, exhausting night. The room, illuminated by the diffused natural light seeping through rain-streaked windows, is crowded with weary but focused officials. The atmosphere is charged with a palpable mix of relief and lingering anxiety as Kate Harper bursts in with urgent news. The drama unfolds in a space marked by iconic decor, including the revered Resolute Desk behind which President Bartlet silently monitors the unfolding crisis. The scene not only captures the immediate relief of a hostage situation secured but also deep introspection from Josh Lyman about the ethics of national power. Every conversation and gesture is weighed down by the responsibility of leadership and the subtle fears that even success might be morally ambiguous.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_oval_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Kate Harper\'s Urgent Announcement',
        e.description = 'In the midst of a heavy strategy session filled with the palpable weight of a long, grueling night, Kate Harper makes a dramatic entrance into the Oval Office. She bursts in with news that the Serbian special police units have secured the compound, ensuring the safety of all hostages. This declaration floods the room with sudden relief, temporarily dissolving the tension that had been building up. Her announcement serves as a critical turning point in the crisis, providing a momentary reprieve and shifting the focus of the gathered senior staff from despair to cautious optimism.',
        e.sequence = 1,
        e.key_dialogue = ["KATE: Serbian special police units have secured the compound. All hostages are safe."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Josh Lyman\'s Introspective Reflection',
        e.description = 'As the euphoria of the safe hostage news begins to permeate the room, Josh Lyman stands apart by the window, his mind troubled by the ethical complexities of their success. In quiet, sombre dialogue with Donna Moss, Josh reflects on the harrowing moments when hope had nearly flickered out, pondering how narrowly a nation can dance with the temptation to forsake its principles for the sake of victory. His introspection reveals deep-seated fears about the moral costs inherent in political and military operations. This reflective conversation underlines the personal stakes for the characters involved, highlighting the inner conflict between achieving success and the potential for moral compromise.',
        e.sequence = 2,
        e.key_dialogue = ["JOSH: For about twenty minutes there, when we thought we'd lost them... I understood why nations go to war. Why they abandon principles for revenge.", "DONNA: But we didn't.", "JOSH: That's what scares me. Not that we might have failed, but that we might have succeeded in the wrong way."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'President Bartlet\'s Command for Accountability',
        e.description = 'In the wake of the high-stakes news and introspective dialogue, the focus shifts to President Bartlet, who watches his staff from behind the stately Resolute Desk. His measured yet determined tone underscores a critical demand for transparency and accountability. He instructs Charlie Young to contact President Kovach and mobilize bipartisan leadership, emphasizing that the American public must be informed about how perilously close the nation had come to the brink of disaster and who had driven the situation. This decisive moment encapsulates the themes of responsibility and leadership, reinforcing the moral and political gravity that permeates the Oval Office.',
        e.sequence = 3,
        e.key_dialogue = ["PRESIDENT BARTLET: Charlie, get me President Kovach. And then the leadership of both parties. The American people deserve to know how close we came to the brink today - and who pushed us there."]
    ;
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_framed_photograph'}),
          (a:Agent {uuid: 'agent_bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_desk_lamp'}),
          (a:Agent {uuid: 'agent_bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_crumpled_paper'}),
          (a:Agent {uuid: 'agent_sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_empty_coffee_cups'}),
          (a:Agent {uuid: 'agent_sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_laptop_screen'}),
          (a:Agent {uuid: 'agent_sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_2'})
    ON CREATE SET
        oi.description = 'The LCD screens continuously display real-time satellite imagery of the Kosovo-Serbia border, serving as a critical visual aid to underscore the urgency of the crisis Nancy details.',
        oi.status_before = 'Operating normally, the screens were already providing sharp, up-to-date images of the conflict zone.',
        oi.status_after = 'They continue to function as an unyielding source of visual information, their display now imbued with the stark reality of the emerging crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Josh Lyman enters the dimly lit Situation Room, already showing signs of the early morning tension with his loosened tie. He unconsciously rubs the scar on his chest, a physical manifestation of past traumas resurfacing under pressure, and then takes his seat at the table, ready to engage with the unfolding crisis.',
        ap.emotional_state = 'Josh is feeling the familiar weight of a developing crisis, indicated by his physical gesture of rubbing his scar – a habit formed after the Rosslyn shooting. He is likely anxious and focused, mentally preparing for the difficult decisions and high stakes discussions that are about to unfold.',
        ap.emotional_tags = ["Josh is feeling the familiar weight of a developing crisis, indicated by his physical gesture of rubbing his scar \u2013 a habit formed after the Rosslyn shooting. He is likely anxious", "focused, mentally preparing for the difficult decisions", "high stakes discussions that are about to unfold."],
        ap.active_plans = ["To quickly assess the situation regarding the missing USAID workers.", "To understand the Serbian paramilitary group's demands and the implications of their actions.", "To contribute his strategic expertise to formulate an effective response."],
        ap.beliefs = ["Preparedness is crucial in managing national security crises.", "Past experiences deeply inform present actions and reactions.", "Personal investment and emotional awareness are integral to effective crisis management."],
        ap.goals = ["To ensure the safe return of the USAID workers.", "To contribute to a swift and decisive resolution of the crisis.", "To navigate the situation with the wisdom gained from past experiences, avoiding past mistakes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Standing at the head of the long table, Nancy McNally commands the room with a focused presence as she delivers the grim briefing on the lost USAID workers.',
        ap.emotional_state = 'Deeply concerned yet resolute, her calm authority masks an underlying urgency and determination.',
        ap.emotional_tags = ["Deeply concerned yet resolute, her calm authority masks an underlying urgency", "determination."],
        ap.active_plans = ["Communicate the critical details of the crisis to ensure coordinated action", "Set the agenda for immediate strategic response to secure the situation"],
        ap.beliefs = ["Clear, direct communication is essential during national security emergencies", "Immediate, informed decision-making will safeguard American interests"],
        ap.goals = ["Ensure all senior staff understand the gravity of the situation", "Prompt the activation of appropriate crisis response measures"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Donna stands in the Situation Room, delivering a critical update to the assembled senior staff and President Bartlet. She reports that a Serbian paramilitary group has claimed responsibility for the disappearance of the USAID workers on social media and is demanding the release of three commanders from The Hague.',
        ap.emotional_state = 'Focused and serious, Donna understands the gravity of the information she is delivering. She is likely feeling the tension in the room and is aware that her update significantly raises the stakes of the situation.',
        ap.emotional_tags = ["Focused", "serious, Donna underst", "s the gravity of the information she is delivering. She is likely feeling the tension in the room", "is aware that her update significantly raises the stakes of the situation."],
        ap.active_plans = ["To clearly and concisely communicate the paramilitary group's claim and demands.", "To ensure the President and senior staff are fully informed of this new development so they can make informed decisions."],
        ap.beliefs = ["Accurate and timely information is crucial in crisis situations.", "The safety of the USAID workers is paramount.", "Understanding the motives and demands of the paramilitary group is essential for effective response."],
        ap.goals = ["To contribute to a comprehensive understanding of the unfolding crisis.", "To support the team in formulating an effective strategy to address the paramilitary threat and secure the release of the aid workers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Kate Harper steps forward confidently, her posture straight and her voice clear as she delivers the crucial intelligence update to the room.',
        ap.emotional_state = 'Calm and resolute, she exudes an air of precision and determination despite the mounting tension in the Situation Room.',
        ap.emotional_tags = ["Calm", "resolute, she exudes an air of precision", "determination despite the mounting tension in the Situation Room."],
        ap.active_plans = ["Communicate the layered intelligence regarding Serbian security services to refocus the strategic response.", "Clarify the implications of the new information to ensure that decision-makers understand the depth of the conspiracy."],
        ap.beliefs = ["Accurate and timely intelligence is essential for effective crisis management.", "Transparency in delivering critical updates builds trust and allows for more informed decision-making."],
        ap.goals = ["Ensure that the room understands the full scope of Serbian involvement.", "Shift the narrative toward addressing internal inconsistencies in regional security alliances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_1_5'})
    ON CREATE SET
        ap.current_status = 'President Bartlet enters the Situation Room with a commanding presence, immediately drawing the attention of everyone present. He stands tall, his posture conveying authority and focus as he steps into the room already filled with tension. His arrival stills the room into respectful silence, all eyes turning towards him expectantly.',
        ap.emotional_state = 'His expression is grim and devoid of his usual warmth or intellectual amusement.  The weight of the crisis is palpable on his face, indicating a deep seriousness and concern for the unfolding events. There\'s an undercurrent of controlled urgency in his demeanor.',
        ap.emotional_tags = ["His expression is grim", "devoid of his usual warmth or intellectual amusement.  The weight of the crisis is palpable on his face, indicating a deep seriousness", "concern for the unfolding events. There's an undercurrent of controlled urgency in his demeanor."],
        ap.active_plans = ["To quickly assess the situation and understand the available options for resolving the hostage crisis.", "To take decisive command of the situation, guiding his staff toward a resolution.", "To project presidential authority and instill confidence in his team during this critical moment."],
        ap.beliefs = ["As President, he bears the ultimate responsibility for the safety of American citizens and the nation's response to international crises.", "Effective leadership requires immediate and informed action, especially in high-stakes situations.", "Maintaining control and clarity is paramount to navigating complex and dangerous scenarios."],
        ap.goals = ["To gain a clear understanding of the current status and the options being considered.", "To ensure a coordinated and effective response to the hostage situation.", "To reassure his staff and project an image of presidential resolve."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Leo McGarry enters the Situation Room alongside President Bartlet, his presence a steady anchor in the escalating crisis. He positions himself near the President, acting as a close advisor and confidant. His posture is alert and attentive, ready to support the President in any capacity needed.',
        ap.emotional_state = 'Leo\'s demeanor is serious and focused, reflecting the gravity of the situation. He carries a calm intensity, his expression conveying both concern and seasoned resolve. He is emotionally attuned to the President\'s state of mind, prepared to offer counsel and support.',
        ap.emotional_tags = ["Leo's demeanor is serious", "focused, reflecting the gravity of the situation. He carries a calm intensity, his expression conveying both concern", "seasoned resolve. He is emotionally attuned to the President's state of mind, prepared to offer counsel", "support."],
        ap.active_plans = ["To provide strategic counsel to President Bartlet as the situation unfolds.", "To observe the dynamics of the room and ensure the staff is effectively supporting the President.", "To act as a sounding board and trusted advisor, offering his experience and insights to guide decision-making."],
        ap.beliefs = ["Loyalty and unwavering support for the President are crucial, especially in times of crisis.", "Experienced counsel and strategic thinking are essential for navigating complex international challenges.", "Maintaining a calm and steady presence helps to stabilize tense situations and facilitate effective leadership."],
        ap.goals = ["To assist President Bartlet in making informed decisions by providing strategic advice.", "To ensure the President is well-supported and has access to all necessary information.", "To contribute to a calm and effective atmosphere within the Situation Room, enabling clear thinking and decisive action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_5'})
    ON CREATE SET
        ap.current_status = 'General Alexander accompanies President Bartlet into the Situation Room, embodying military authority within the civilian command structure. He stands formally and respectfully, his presence underscoring the serious nature of the crisis and the potential for military involvement. He is ready to offer military expertise and respond to the President\'s directives.',
        ap.emotional_state = 'General Alexander maintains a composed and professional demeanor, reflecting his military training and experience in high-pressure situations. He is focused and attentive, his expression conveying a readiness to act and a clear understanding of the gravity of the situation.',
        ap.emotional_tags = ["General Alex", "er maintains a composed", "professional demeanor, reflecting his military training", "experience in high-pressure situations. He is focused", "attentive, his expression conveying a readiness to act", "a clear underst", "ing of the gravity of the situation."],
        ap.active_plans = ["To offer military assessments and strategic options to President Bartlet.", "To be prepared to execute any military orders or directives issued by the President.", "To ensure the President is fully informed about the military dimensions of the crisis and the resources available."],
        ap.beliefs = ["Military readiness and strategic expertise are vital components of national security and crisis response.", "The military must be prepared to support civilian leadership in resolving international conflicts and protecting national interests.", "Discipline, precision, and clear communication are essential for effective military action."],
        ap.goals = ["To provide President Bartlet with the best possible military advice and options.", "To ensure the military is prepared to respond effectively to the crisis as directed.", "To contribute to a coordinated and decisive national response to the hostage situation."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_event_2_1'})
    ON CREATE SET
        oi.description = 'The framed photograph serves as a heart-wrenching symbol of happier, simpler times and a tangible reminder of the personal connection between Bob Russell and Amanda Dalton. It triggers his introspection and emotional vulnerability.',
        oi.status_before = 'The photograph rested as a cherished yet constant reminder of a cherished personal past, undisturbed and evoking sentimentality.',
        oi.status_after = 'After handling and replacing it with care, it remains intact but now carries additional emotional weight from the moment of raw revelation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_lamp_event_2_1'})
    ON CREATE SET
        oi.description = 'The desk lamp casts a solitary pool of light that not only illuminates the photograph but also creates an intimate atmosphere in the otherwise dark office, reinforcing the isolation and personal nature of the moment.',
        oi.status_before = 'Before the event, the lamp provided a steady, focused beam of light, maintaining a controlled ambiance in the Vice President\'s office.',
        oi.status_after = 'Following the event, the lamp continues to emit the same steady light, now underscoring the lingering mood of vulnerability and reflection.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_lamp'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_event_2_3'})
    ON CREATE SET
        oi.description = 'The framed photograph serves as a powerful symbol of Bob Russell\'s past tenderness, representing a simpler, more personal time. Its deliberate repositioning on the desk signifies his conscious effort to compartmentalize personal emotion and reclaim his public demeanor.',
        oi.status_before = 'Displayed openly on the desk, evoking personal memories and raw emotional vulnerability.',
        oi.status_after = 'Meticulously placed back on the desk, reinforcing a composed and controlled public image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_lamp_event_2_3'})
    ON CREATE SET
        oi.description = 'The desk lamp casts a focused pool of light in the dark office, accentuating the intimate ambiance of the scene. It highlights the framed photograph and by extension underscores the internal and external dualities of public and private selves in crisis.',
        oi.status_before = 'Emitting a soft, singular light that defined the small space of introspection in the dark office.',
        oi.status_after = 'Continuing to illuminate the space, symbolically underpinning the restoration of order and the Vice President’s renewed focus on duty.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_lamp'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Bob Russell is seated alone in his darkened Vice President\'s office, his posture a blend of stoic composure and internal anguish as he gazes intently at the framed photograph on his desk.',
        ap.emotional_state = 'He feels a deep, pained vulnerability mixed with a resurgence of raw emotion, the mask of his political persona momentarily slipping to reveal regret and anxiety.',
        ap.emotional_tags = ["He feels a deep, pained vulnerability mixed with a resurgence of raw emotion, the mask of his political persona momentarily slipping to reveal regret", "anxiety."],
        ap.active_plans = ["Reconstructing his composed public demeanor before moving to the Situation Room.", "Mentally preparing to address the implications of Bartlet's speech and its impact on the aid mission."],
        ap.beliefs = ["He believes in the transformative power of political rhetoric for the greater good, even though it carries personal costs.", "He holds a paternal conviction over Amanda Dalton's welfare, linking her dedication to the ideals inspired by leadership."],
        ap.goals = ["Short-term: To regain his political composure and ready himself for impending crisis discussions.", "Long-term: To ensure that the ideals he supports do not inadvertently endanger those he cares about."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Amanda Dalton is not physically present; her presence is powerfully felt through the emotional weight of the photograph and Russell’s reflective dialogue.',
        ap.emotional_state = 'She is implicitly associated with determination and the burden of sacrifice, as remembered by Russell; her dedication invokes both admiration and concern.',
        ap.emotional_tags = ["She is implicitly associated with determination", "the burden of sacrifice, as remembered by Russell; her dedication invokes both admiration", "concern."],
        ap.active_plans = ["Continuing her commitment at USAID, driven by an idealistic mission to rebuild conflict-torn regions."],
        ap.beliefs = ["She firmly believes in the duty to serve and ameliorate human suffering, inspired by leadership and personal conviction."],
        ap.goals = ["To accomplish her humanitarian mission effectively and safely, despite personal risks."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_1'})
    ON CREATE SET
        ap.current_status = 'President Bartlet is indirectly present through the echo of his recent speech, the ideological backdrop against which Russell\'s private moment unfolds.',
        ap.emotional_state = 'His calm, authoritative demeanor is contrasted with the implications of his words, which stir a mix of inspiration and unintended personal consequence in Russell.',
        ap.emotional_tags = ["His calm, authoritative demeanor is contrasted with the implications of his words, which stir a mix of inspiration", "unintended personal consequence in Russell."],
        ap.active_plans = ["To articulate a vision of American responsibility while managing the fallout of political decisions on a personal level."],
        ap.beliefs = ["He holds a conviction that bold political rhetoric can rally the nation, even as it risks collateral emotional impact on individuals linked to the causes he espouses."],
        ap.goals = ["Short-term: To maintain leadership and guide the national conversation during a crisis.", "Long-term: To uphold the ideals of American intervention and support while mitigating the personal costs of these policies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Margaret stands in the doorway of the Vice President\'s dimly lit office, observing Bob Russell in a moment of private reflection. She maintains a respectful distance, her posture suggesting professional formality amidst an emotionally charged atmosphere.',
        ap.emotional_state = 'Visibly uncomfortable and slightly awkward, Margaret senses she is intruding on a deeply personal moment for the Vice President. She is nevertheless resolute in her duty, balancing empathy with professional necessity.',
        ap.emotional_tags = ["Visibly uncomfortable", "slightly awkward, Margaret senses she is intruding on a deeply personal moment for the Vice President. She is nevertheless resolute in her duty, balancing empathy with professional necessity."],
        ap.active_plans = ["To inform Vice President Russell of the urgent meeting in the Situation Room.", "To respectfully interrupt his private moment while conveying the importance of his immediate presence."],
        ap.beliefs = ["Protocol dictates informing the Vice President of urgent matters, regardless of personal circumstances.", "The situation is serious and requires the Vice President's immediate attention and expertise."],
        ap.goals = ["To deliver the message efficiently and respectfully.", "To prompt the Vice President to transition from his personal grief to his official duties."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Vice President Russell is seated in his darkened office, illuminated only by a desk lamp, his gaze fixed on a framed photograph. He is audibly reflecting on Amanda Dalton\'s motivations and President Bartlet\'s influence, his voice tinged with raw emotion and vulnerability. As Margaret enters, he begins to compose himself, physically and emotionally.',
        ap.emotional_state = 'Initially consumed by private grief and worry for Amanda Dalton, Russell\'s carefully constructed political composure has crumbled, revealing deep personal emotion. He is reflective, somber, and grappling with the personal impact of the crisis. As Margaret arrives, he begins to regain control, consciously reconstructing his public persona.',
        ap.emotional_tags = ["Initially consumed by private grief", "worry for Am", "a Dalton, Russell's carefully constructed political composure has crumbled, revealing deep personal emotion. He is reflective, somber,", "grappling with the personal impact of the crisis. As Margaret arrives, he begins to regain control, consciously reconstructing his public persona."],
        ap.active_plans = ["To process his personal emotions and anxieties regarding Amanda Dalton's situation.", "To transition from private grief back to his public role and responsibilities as Vice President upon being summoned to the Situation Room.", "To mentally prepare for the urgent meeting and the decisions he will need to make."],
        ap.beliefs = ["He believes in the ideals of American aid and intervention that inspired Amanda Dalton.", "He holds a deep personal affection and responsibility for Amanda, viewing her almost as a daughter.", "He understands the gravity of his role and the necessity to compartmentalize personal feelings in service of his duty."],
        ap.goals = ["To privately acknowledge and process his emotional turmoil.", "To regain his composure and assume his official responsibilities.", "To contribute effectively to the crisis resolution in the Situation Room."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Bob Russell is seated in the dimly lit Vice President\'s Office, momentarily lost in the poignant memory evoked by the framed photograph. Prompted by Margaret\'s interruption, he deliberately removes the raw emotional trace by carefully placing the photograph back on his desk, transitioning from vulnerability to composure.',
        ap.emotional_state = 'Initially overwhelmed by personal grief and paternal concern, his raw vulnerability gives way to a steely determination as he reasserts his public persona.',
        ap.emotional_tags = ["Initially overwhelmed by personal grief", "paternal concern, his raw vulnerability gives way to a steely determination as he reasserts his public persona."],
        ap.active_plans = ["Articulate the inspiring ideals behind Bartlet's speeches about America's humanitarian efforts.", "Regain control over his internal turmoil and step into his official role in the Situation Room."],
        ap.beliefs = ["The responsibility of leadership demands compartmentalizing personal emotions for the greater good.", "America's duty to help rebuild war-torn regions is both a moral and political imperative."],
        ap.goals = ["Reconstruct his political image by setting aside personal anxieties.", "Prepare to address the unfolding crisis with the necessary resolve."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_3'})
    ON CREATE SET
        ap.current_status = 'President Bartlet\'s presence is felt through the ripple effects of his earlier speech. While not physically in the Vice President\'s Office, his words and leadership ethos resonate strongly, framing Russell\'s internal struggle and subsequent regain of composure.',
        ap.emotional_state = 'Resolute and steady, carrying the weight of national duty despite underlying tension.',
        ap.emotional_tags = ["Resolute", "steady, carrying the weight of national duty despite underlying tension."],
        ap.active_plans = ["Project a calm and commanding presence to underpin national leadership."],
        ap.beliefs = ["Truth and accountability must guide every presidential decision.", "The nation can be protected only through decisive and principled leadership."],
        ap.goals = ["Inspire the staff and the American public through clear, balanced rhetoric amid crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Amanda Dalton is not physically present in the office but permeates Russell’s thoughts as a symbol of the idealistic heroism and personal sacrifice inherent in USAID work.',
        ap.emotional_state = 'Embodied through memory with feelings of determination and quiet courage, reinforcing the emotional stakes of the moment.',
        ap.emotional_tags = ["Embodied through memory with feelings of determination", "quiet courage, reinforcing the emotional stakes of the moment."],
        ap.active_plans = ["Persevere in her humanitarian mission despite personal risk."],
        ap.beliefs = ["That a commitment to service and international aid can bring about genuine change."],
        ap.goals = ["Continue her critical work with USAID, reflecting the ideals championed by Bartlet."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Margaret stands in the doorway of the Vice President\'s Office, her posture evidencing a mix of concern and professionalism as she interrupts the intimate moment to remind Russell of his immediate official obligations.',
        ap.emotional_state = 'Uneasy and empathetic, yet firmly anchored in her commitment to protocol.',
        ap.emotional_tags = ["Uneasy", "empathetic, yet firmly anchored in her commitment to protocol."],
        ap.active_plans = ["Prompt Russell to leave the personal space and attend to the urgent demands waiting in the Situation Room."],
        ap.beliefs = ["Private moments must yield to the overarching duty of public service in times of crisis."],
        ap.goals = ["Ensure that the Vice President transitions smoothly and promptly from personal reflection to active crisis management."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blackberry_event_3_3'})
    ON CREATE SET
        oi.description = 'C.J.\'s BlackBerry buzzes with an urgent news alert, disrupting the tense diplomatic scene in the Mural Room. It functions as the harbinger of unwelcome news, delivering the stark message that CNN has revealed Amanda Dalton\'s identity to the public. The device becomes the instrument through which external media pressure intrudes upon the private, high-stakes negotiations.',
        oi.status_before = 'The BlackBerry is in standby mode, likely in C.J.\'s pocket or nearby, silently awaiting incoming notifications. It is a passive object in the scene, present but not yet actively influencing the unfolding events.',
        oi.status_after = 'After buzzing and displaying the news alert, the BlackBerry has fulfilled its function as a communication device, delivering critical, albeit unwelcome, information. It remains physically unchanged, but its narrative significance has increased dramatically as the catalyst for C.J.\'s reaction and the impending media storm. It now represents the looming external pressures and the rapidly escalating stakes of the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blackberry'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Viktor Petrov stands in the Mural Room, embodying diplomatic poise. He addresses President Bartlet and other members of the White House staff, articulating Moscow\'s official stance on the hostage situation with measured, precise language. His posture is impeccable, every gesture calibrated for maximum impact.',
        ap.emotional_state = 'Viktor Petrov is outwardly calm and controlled, projecting an air of unflappable confidence. Beneath the surface, he is likely strategic and calculating, focused on delivering his message effectively and maintaining Russia\'s geopolitical position without revealing any personal emotion or vulnerability.',
        ap.emotional_tags = ["Viktor Petrov is outwardly calm", "controlled, projecting an air of unflappable confidence. Beneath the surface, he is likely strategic", "calculating, focused on delivering his message effectively", "maintaining Russia's geopolitical position without revealing any personal emotion or vulnerability."],
        ap.active_plans = ["To firmly establish Russia's position that the hostage situation is a Serbian internal affair.", "To discourage any NATO intervention by framing it as a violation of Serbian sovereignty.", "To project an image of Russian resolve and diplomatic strength."],
        ap.beliefs = ["National sovereignty is paramount and should not be violated by external intervention.", "International matters should be resolved through diplomacy and respect for national borders.", "Russia has a right and a duty to assert its geopolitical interests and perspectives on the global stage."],
        ap.goals = ["To prevent any NATO military action or intervention in Serbia.", "To reinforce Russia's influence in the region by supporting Serbia's position.", "To demonstrate Russia's diplomatic strength and strategic thinking to the US and other nations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_3_2'})
    ON CREATE SET
        ap.current_status = 'President Bartlet steps forward with measured yet assertive movement, his posture rigid and purposeful as he delivers his sharp rebuttal. His eyes are fixed intently on Ambassador Petrov, his stance conveying both control and an underlying intensity.',
        ap.emotional_state = 'Inside, a brewing storm of discontent simmers beneath his calm exterior. There is a clear tension marked by a clenched jaw and tightly clasped hands, symbolizing both his frustration and determination.',
        ap.emotional_tags = ["Inside, a brewing storm of discontent simmers beneath his calm exterior. There is a clear tension marked by a clenched jaw", "tightly clasped h", "s, symbolizing both his frustration", "determination."],
        ap.active_plans = ["Challenge the logic dismissing the kidnapping of American aid workers as an internal Serbian issue.", "Assert American resolve and expose the flaws in the opposing diplomatic stance."],
        ap.beliefs = ["Unwavering commitment to truth and accountability in the face of diplomatic evasiveness.", "The fundamental duty to protect American citizens and uphold international responsibility."],
        ap.goals = ["Clarify the gravity of the situation to both domestic and international audiences.", "Maintain national integrity by challenging any attempt to downplay a matter of national security."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_c_j_cregg_event_3_3'})
    ON CREATE SET
        ap.current_status = 'C.J. stands near the doorway of the Mural Room, observing the tense exchange between President Bartlet and Ambassador Petrov. She is attentive to the diplomatic proceedings when her BlackBerry suddenly buzzes, diverting her attention. She glances at the device, reads the urgent news alert flashing on the screen, and then briefly closes her eyes, composing herself.',
        ap.emotional_state = 'C.J. is initially focused and professional, monitoring the diplomatic situation. The sudden news alert injects a dose of anxiety and apprehension as she realizes the implications of the information. Closing her eyes suggests she is steeling herself, bracing for the inevitable media storm and the increased pressure it will bring.',
        ap.emotional_tags = ["C.J. is initially focused", "professional, monitoring the diplomatic situation. The sudden news alert injects a dose of anxiety", "apprehension as she realizes the implications of the information. Closing her eyes suggests she is steeling herself, bracing for the inevitable media storm", "the increased pressure it will bring."],
        ap.active_plans = ["Assess the immediate impact of the news leak on the ongoing crisis.", "Prepare to manage the anticipated media frenzy and public reaction to Amanda Dalton's identity being revealed.", "Inform President Bartlet and Leo McGarry about the CNN report and its potential consequences."],
        ap.beliefs = ["Controlling the narrative is crucial in political crises, especially regarding sensitive information.", "The media's role can significantly escalate or de-escalate a crisis.", "Maintaining composure and professionalism is essential, even when facing disruptive news."],
        ap.goals = ["Minimize the negative impact of the news leak on the hostage situation and diplomatic efforts.", "Protect the President's image and manage public perception of the crisis.", "Prepare a strategic communications response to address the media storm and control the narrative."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crumpled_paper_event_4_1'})
    ON CREATE SET
        oi.description = 'The crumpled papers scattered across the desk symbolize discarded ideas and fleeting attempts at capturing a powerful narrative, reflecting the intense creative struggle Sam experiences.',
        oi.status_before = 'Before the event, the papers were the remnants of earlier drafts, already marking traces of frustration and iterative craftsmanship.',
        oi.status_after = 'After the event, they stand as a visual record of the ongoing battle to merge creativity with political urgency, further disordered by new scribbles and rushed attempts at clarity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crumpled_paper'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_empty_coffee_cups_event_4_1'})
    ON CREATE SET
        oi.description = 'The empty coffee cups serve as a tangible marker of the long hours and relentless mental labor involved in crafting a speech that embodies both hope and tragedy.',
        oi.status_before = 'Initially, the cups had already signified spent energy and multiple refills during earlier bursts of creative output.',
        oi.status_after = 'Following this event, their presence intensifies the scene, underscoring the cost of deep contemplation and the exhaustion that accompanies intense creative pursuits.'
    WITH oi
    MATCH (o:Object {uuid: 'object_empty_coffee_cups'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_laptop_screen_event_4_1'})
    ON CREATE SET
        oi.description = 'The laptop screen, displaying two distinct documents side-by-side, visually represents the dual paths of victory and tragedy that Sam is struggling to reconcile into a single powerful narrative.',
        oi.status_before = 'Before this moment, the laptop was a tool of routine administrative tasks and orderly work, its screen bright and purposeful in a well-organized work setting.',
        oi.status_after = 'After the event, the laptop becomes a vessel of chaotic inspiration, its illuminated documents a testament to the critical and creative crossroads at which Sam finds himself.'
    WITH oi
    MATCH (o:Object {uuid: 'object_laptop_screen'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Sam Seaborn sits hunched over his glowing laptop, his posture a blend of exhaustion and determination as he navigates the chaotic landscape of words and ideas scattered around him.',
        ap.emotional_state = 'A mix of deep introspection and anxiety, with an underlying urgency as he grapples with the severe weight of the tragedy he needs to articulate.',
        ap.emotional_tags = ["A mix of deep introspection", "anxiety, with an underlying urgency as he grapples with the severe weight of the tragedy he needs to articulate."],
        ap.active_plans = ["Refine and reconcile two divergent narratives \u2014 one of victory and one of tragedy \u2014 into a cohesive presidential address.", "Capture the raw, poetic essence of political violence to emotionally resonate with the nation."],
        ap.beliefs = ["Words possess the power to shape public perception and provide comfort in crisis.", "Articulating truth, even in the harshest circumstances, is essential for accountability and healing."],
        ap.goals = ["Complete a speech that convincingly bridges the dualities of hope and despair.", "Ensure the narrative accurately reflects the gravity of the situation while maintaining a commitment to being 'the good guys.'"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Standing calmly in the doorway of the windowless office, Toby observes Sam\'s struggle with a seasoned and knowing gaze. He listens intently as Sam grapples with the weight of his task before offering measured, thoughtful counsel.',
        ap.emotional_state = 'Empathetic and concerned, Toby carries a sense of quiet resolve. He is grounded and offers stability, his demeanor reflecting a deep understanding of the gravity of the situation and the emotional toll it takes on those around him.',
        ap.emotional_tags = ["Empathetic", "concerned, Toby carries a sense of quiet resolve. He is grounded", "offers stability, his demeanor reflecting a deep underst", "ing of the gravity of the situation", "the emotional toll it takes on those around him."],
        ap.active_plans = ["To guide Sam towards a more grounded and effective approach to speechwriting.", "To remind Sam of the core values that underpin their work and the administration's mission.", "To offer reassurance and perspective, helping Sam navigate the emotional and intellectual challenges of the moment."],
        ap.beliefs = ["True poetry in times of tragedy lies in restraint and understated strength, not in elaborate prose.", "It is crucial to reaffirm the fundamental humanitarian principles that guide their actions, especially in moments of crisis.", "Their role is to articulate the nation's commitment to being 'the good guys', even when faced with difficult circumstances."],
        ap.goals = ["To help Sam craft speeches that are both powerful and ethically sound, reflecting the gravity of the situation without succumbing to grandiosity.", "To ensure the speeches resonate with the core values of the administration and the American people.", "To provide Sam with the necessary perspective to overcome his creative block and deliver impactful communication."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Sam is hunched over his laptop in the dimly lit office, surrounded by discarded drafts and empty coffee cups, a physical manifestation of his intense creative struggle. He runs his hands through his already disheveled hair, his usual polished appearance completely abandoned as he wrestles with the immense task of writing speeches for both victory and tragedy.',
        ap.emotional_state = 'Intensely focused and stressed, Sam is deeply immersed in the creative process, grappling with the profound emotional weight of the hostage situation. He is wrestling with feelings of inadequacy, questioning how to transform the stark reality of political violence into something poetic and meaningful.',
        ap.emotional_tags = ["Intensely focused", "stressed, Sam is deeply immersed in the creative process, grappling with the profound emotional weight of the hostage situation. He is wrestling with feelings of inadequacy, questioning how to transform the stark reality of political violence into something poetic", "meaningful."],
        ap.active_plans = ["To complete two distinct presidential addresses, one for a successful resolution and one for a tragic outcome.", "To find the appropriate tone and language to convey the gravity of the situation in either scenario.", "To articulate the complex emotions and moral implications of the crisis through his writing, seeking to capture the essence of the moment for the President and the nation."],
        ap.beliefs = ["Tragedy, by its nature, demands a poetic response that transcends mere political rhetoric.", "He believes in the power of language to shape understanding and to offer solace in times of crisis.", "There's an inherent conflict between the brutality of political violence and the need for poetic expression to make sense of it."],
        ap.goals = ["To produce speeches that are not only politically effective but also emotionally resonant and ethically sound.", "To find a way to articulate the administration's values and the nation's response in a way that is both truthful and inspiring.", "To overcome his creative and emotional block and deliver speeches that meet the immense challenge of the moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Seated amid a chaotic array of crumpled paper and empty coffee cups, Sam is deeply absorbed in his work at the glowing laptop screen, visibly disheveled and lost in thought.',
        ap.emotional_state = 'Emotionally drained and introspective, with an undercurrent of anxiety and vulnerability fueled by painful memories of past crises, notably the Rosslyn shooting.',
        ap.emotional_tags = ["Emotionally drained", "introspective, with an undercurrent of anxiety", "vulnerability fueled by painful memories of past crises, notably the Rosslyn shooting."],
        ap.active_plans = ["Crafting two contrasting presidential addresses that capture both hope and tragedy.", "Reconciling past failures with a renewed commitment to moral principles."],
        ap.beliefs = ["Political messaging must remain rooted in honesty and ethical responsibility.", "Being 'the good guys' is both a duty and a constant moral challenge."],
        ap.goals = ["To articulate a narrative that upholds moral values amidst political violence.", "To transform his inner turmoil into a compelling, authentic speech."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway of the cramped, windowless office, Toby watches over Sam with a steady, observant gaze.',
        ap.emotional_state = 'Calm yet deeply concerned; his measured demeanor conceals an internal commitment to ensuring ethical clarity in a high-stakes environment.',
        ap.emotional_tags = ["Calm yet deeply concerned; his measured demeanor conceals an internal commitment to ensuring ethical clarity in a high-stakes environment."],
        ap.active_plans = ["Providing moral support and a grounding perspective to Sam during the crisis.", "Guiding the narrative to emphasize restraint and ethical responsibility."],
        ap.beliefs = ["Moral integrity is essential, even when confronting political violence.", "The true strength of leadership lies in balancing strategic necessity with uncompromised principles."],
        ap.goals = ["To reassure and refocus Sam on their shared commitment to justice and truth.", "To ensure that their public communication reflects a steadfast adherence to ethical values."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_resolute_desk_event_5_3'})
    ON CREATE SET
        oi.description = 'The Resolute Desk serves as President Bartlet\'s command post during this decisive moment. He stands behind it as he delivers his instructions to Charlie, using it as a symbolic anchor of presidential authority and resolve. It silently witnesses the transition from relief to determined action, embodying the weight of leadership in the Oval Office.',
        oi.status_before = 'Positioned centrally in the Oval Office, the Resolute Desk has been present throughout the tense strategy session, bearing witness to the staff\'s anxiety and the fluctuating fortunes of the hostage situation.',
        oi.status_after = 'The Resolute Desk remains unchanged physically, but now it stands as a silent testament to a pivotal moment of command and accountability. It has become further imbued with the gravity of presidential decision-making during a crisis, symbolizing the shift from immediate relief to the enduring responsibility of leadership.'
    WITH oi
    MATCH (o:Object {uuid: 'object_resolute_desk'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Kate Harper bursts into the Oval Office, interrupting a tense strategy session. She delivers the crucial information that Serbian special police units have successfully secured the compound and that all hostages are safe. Her sudden entrance and urgent announcement immediately capture the attention of everyone in the room, cutting through the heavy atmosphere of the crisis.',
        ap.emotional_state = 'Focused and professional, Kate is the bearer of good news, though her demeanor remains grounded and serious given the gravity of the situation they\'ve just navigated. There\'s an underlying sense of relief in her delivery, but her primary focus is on conveying the facts clearly and efficiently.',
        ap.emotional_tags = ["Focused", "professional, Kate is the bearer of good news, though her demeanor remains grounded", "serious given the gravity of the situation they've just navigated. There's an underlying sense of relief in her delivery, but her primary focus is on conveying the facts clearly", "efficiently."],
        ap.active_plans = ["To inform the President and senior staff of the successful resolution of the hostage situation.", "To provide a concise and accurate update on the operation's outcome."],
        ap.beliefs = ["In times of crisis, clear and direct communication is paramount.", "Successful intelligence operations are vital for national security.", "Delivering critical information swiftly can alleviate tension and enable effective decision-making."],
        ap.goals = ["To ensure the President is immediately aware of the positive outcome.", "To shift the room's focus from crisis management to next steps following the successful resolution.", "To contribute to the overall success of the operation by providing timely and accurate intelligence updates."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Josh stands by the rain-streaked window, isolated amid the relief in the Oval Office. His posture is tense and withdrawn as he ponders the moral ambiguities of their success.',
        ap.emotional_state = 'Deeply troubled and introspective, Josh is gripped by a persistent fear of compromising ethical principles even in victory.',
        ap.emotional_tags = ["Deeply troubled", "introspective, Josh is gripped by a persistent fear of compromising ethical principles even in victory."],
        ap.active_plans = ["Analyze the cost of political success and consider ways to sustain moral integrity in decision-making."],
        ap.beliefs = ["Success in political operations should never come at the expense of ethical principles.", "The moral costs of leadership must be weighed carefully against the benefits of any achievement."],
        ap.goals = ["Resolve the inner conflict about the correctness of their actions.", "Ensure that future decisions do not lead to the sacrifice of core ethical values."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Donna approaches Josh quietly, positioning herself as a steady support amidst the heightened emotional tension in the room.',
        ap.emotional_state = 'Calm, empathetic, and subtly reassuring, she senses Josh\'s turmoil and works to provide him with comfort.',
        ap.emotional_tags = ["Calm, empathetic,", "subtly reassuring, she senses Josh's turmoil", "works to provide him with comfort."],
        ap.active_plans = ["Offer quiet support to Josh and help maintain a sense of collective resilience among the team."],
        ap.beliefs = ["Emotional support and thoughtful presence are vital in navigating ethical and political crises.", "Team unity is essential for overcoming both external pressures and internal dilemmas."],
        ap.goals = ["Help Josh regain balance while ensuring that the team stays focused on principled decision-making.", "Contribute to a supportive environment that reinforces moral and ethical standards."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_5_3'})
    ON CREATE SET
        ap.current_status = 'President Bartlet stands behind the Resolute Desk in the Oval Office, observing his staff as they process the news of the hostages\' safety. He is composed but firm, his gaze steady as he issues clear directives to Charlie Young, indicating his shift from immediate crisis management to the broader implications of the event.',
        ap.emotional_state = 'His relief at the successful resolution is palpable, yet tempered by a deep sense of gravity. He is serious and resolute, recognizing the precariousness of the situation and the necessity for accountability. There\'s an undercurrent of controlled anger at those who pushed the nation to the brink.',
        ap.emotional_tags = ["His relief at the successful resolution is palpable, yet tempered by a deep sense of gravity. He is serious", "resolute, recognizing the precariousness of the situation", "the necessity for accountability. There's an undercurrent of controlled anger at those who pushed the nation to the brink."],
        ap.active_plans = ["To inform the American public about the hostage crisis and the nation's proximity to escalation.", "To hold those responsible for the crisis accountable.", "To communicate with President Kovach and bipartisan leaders to ensure a unified front in addressing the situation."],
        ap.beliefs = ["The American people have a right to know the truth, especially concerning matters of national security and international crises.", "Leadership demands transparency and accountability, both domestically and on the global stage.", "Bipartisan unity is crucial in times of national crisis to demonstrate strength and resolve."],
        ap.goals = ["To ensure the American public understands the gravity of the averted crisis and the factors that led to it.", "To initiate a process of accountability, both domestically and internationally, for the parties responsible for the escalation.", "To reinforce his commitment to responsible leadership and principled action, even under immense pressure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Charlie Young stands in the Oval Office, attentive and ready to respond immediately to President Bartlet\'s instructions. He is the direct recipient of the President\'s command, poised to execute it without hesitation.',
        ap.emotional_state = 'Focused and dutiful, Charlie reflects the serious atmosphere of the room. He is responsive to the President\'s need for swift action and conveys a sense of quiet efficiency.',
        ap.emotional_tags = ["Focused", "dutiful, Charlie reflects the serious atmosphere of the room. He is responsive to the President's need for swift action", "conveys a sense of quiet efficiency."],
        ap.active_plans = ["To immediately contact President Kovach as instructed by President Bartlet.", "To then reach out to the bipartisan leadership as per the President's directive.", "To ensure these contacts are made swiftly and efficiently, facilitating the President's plan for transparency and accountability."],
        ap.beliefs = ["President Bartlet's commands are of paramount importance and must be executed with speed and precision.", "Maintaining seamless communication channels is vital for effective governance, especially in times of crisis.", "Loyalty and efficiency are key to his role as a presidential aide."],
        ap.goals = ["To promptly establish communication with President Kovach and bipartisan leaders.", "To facilitate the President's initiative to inform the American public and pursue accountability.", "To ensure the President's directives are carried out flawlessly, contributing to a smooth transition from crisis resolution to strategic communication."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_president_kovach_event_5_3'})
    ON CREATE SET
        ap.current_status = 'President Kovach is not physically present but exists as the intended recipient of Charlie Young\'s call, and by extension, President Bartlet\'s directive. He is about to be drawn into the unfolding narrative, representing the broader scope of national leadership beyond the immediate White House staff.',
        ap.emotional_state = '(Implicit) Unaware of the immediate situation but will likely transition to a state of concern and attentiveness upon receiving Charlie\'s call. He is expected to be responsive and prepared to engage with President Bartlet on matters of national importance.',
        ap.emotional_tags = ["(Implicit) Unaware of the immediate situation but will likely transition to a state of concern", "attentiveness upon receiving Charlie's call. He is expected to be responsive", "prepared to engage with President Bartlet on matters of national importance."],
        ap.active_plans = ["To receive and understand the information conveyed by Charlie Young on behalf of President Bartlet.", "To engage in conversation with President Bartlet regarding the hostage crisis and its implications.", "To collaborate with President Bartlet and bipartisan leaders on a unified approach to public communication and accountability."],
        ap.beliefs = ["Inter-governmental communication and cooperation are essential for effective national governance.", "Presidential directives, especially from a fellow leader, warrant immediate attention and consideration.", "Collective leadership is necessary to address significant national and international events."],
        ap.goals = ["To become fully informed about the details of the hostage crisis and the near-escalation.", "To coordinate with President Bartlet on messaging and strategy moving forward.", "To contribute to a unified and responsible national response to the crisis, emphasizing transparency and accountability."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_white_house_situation_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one_-_fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_general_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_vice_presidents_office'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one_-_fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_amanda_dalton_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_mural_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one_-_fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_viktor_petrov'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_c_j_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_c_j_cregg_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_c_j_cregg_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one_-_fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_oval_office'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one_-_fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_bartlet_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlie_young'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_president_kovach'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_president_kovach_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_president_kovach_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
