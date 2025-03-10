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
        source_file: '/home/user/fabula/output/pre_processed/fault_lines_graph.json',
        creation_timestamp: '2025-03-10T11:12:22.065752',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_josh_lyman'})
    ON CREATE SET
        a.name = 'Josh Lyman',
        a.title = 'None',
        a.description = 'Josh Lyman is a determined and resourceful staff member whose experiences in past crises have left a visible imprint. He balances personal apprehension with a deep sense of duty, making him both relatable and formidable in the face of national emergencies. His quick thinking, emotional depth, and unwavering commitment add a palpable intensity to every high-stakes moment.',
        a.traits = ["Determined", "Resilient", "Perceptive", "Anxious"],
        a.sphere_of_influence = 'Political Strategy/Crisis Management'
    ;
MERGE (a:Agent {uuid: 'agent_nancy_mcnally'})
    ON CREATE SET
        a.name = 'Nancy McNally',
        a.title = 'National Security Advisor',
        a.description = 'Nancy McNally is a commanding presence in national security, known for her imperturbable dedication and firm decision-making during crises. In the Situation Room, her authoritative voice cuts through the tension as she reports on critical intelligence regarding USAID workers and emerging threats. Her concern is palpable as she balances detailed analysis with the urgency of unfolding events, demonstrating an unwavering commitment to her role in protecting national interests.',
        a.traits = ["authoritative", "decisive", "concerned", "commanding"],
        a.sphere_of_influence = 'National Security'
    ;
MERGE (a:Agent {uuid: 'agent_donna_moss'})
    ON CREATE SET
        a.name = 'Donna Moss',
        a.title = 'None',
        a.description = 'Donna Moss is a perceptive and empathetic aide who provides quiet strength and support amidst the pressures of the White House. With a keen understanding of the intricate dynamics of national politics, she is adept at reading the subtle cues of her colleagues and offers comfort and guidance when tension mounts. Her observations and timely interventions reveal a blend of professionalism and heartfelt care.',
        a.traits = ["Empathetic", "Observant", "Supportive", "Discerning"],
        a.sphere_of_influence = 'Administrative Support/White House Operations'
    ;
MERGE (a:Agent {uuid: 'agent_kate_harper'})
    ON CREATE SET
        a.name = 'Kate Harper',
        a.title = 'None',
        a.description = 'Kate Harper is a vigilant intelligence officer whose analytical acumen is pivotal during crisis situations. Known for her cool, focused demeanor, she deciphers complex international signals with precision and contributes critical insights to high-stakes decision making. Her calm under pressure and unwavering commitment to uncovering the truth make her an indispensable asset in moments of uncertainty.',
        a.traits = ["Vigilant", "Analytical", "Focused", "Determined"],
        a.sphere_of_influence = 'National Security/Intelligence'
    ;
MERGE (a:Agent {uuid: 'agent_bartlet'})
    ON CREATE SET
        a.name = 'Bartlet',
        a.title = 'President',
        a.description = 'Bartlet is a commanding presence marked by a calm exterior and a deeply thoughtful approach to leadership. Carrying the weight of national destiny on his shoulders, he exhibits a restrained yet intense determination when making decisions during crises. His measured gestures and subtle physical cues reveal an inner turbulence, yet his resolve never wavers, positioning him as a steady force in the tumultuous realm of executive leadership.',
        a.traits = ["Commanding", "Resolute", "Thoughtful", "Under Pressure"],
        a.sphere_of_influence = 'Executive Leadership'
    ;
MERGE (a:Agent {uuid: 'agent_leo_mcgarry'})
    ON CREATE SET
        a.name = 'Leo McGarry',
        a.title = 'Chief of Staff',
        a.description = 'Leo McGarry epitomizes steady leadership and pragmatic management in moments of crisis. His calm and insightful presence offers a stabilizing force behind the scenes. In the current scene, his silent communication with C.J. signals a deep, unspoken understanding of the political dynamics at play, making him a key pillar in the administration’s overall strategy.',
        a.traits = ["Steady", "Pragmatic", "Insightful", "Loyal"],
        a.sphere_of_influence = 'Political Administration and Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_general_alexander'})
    ON CREATE SET
        a.name = 'General Alexander',
        a.title = 'General',
        a.description = 'General Alexander is a high-ranking military leader whose gravitas and strategic insight make him a vital voice during the crisis. His presence in the Situation Room underscores the intersection of military expertise and national policy. With a disciplined and measured approach, he provides incisive military perspectives that complement the broader political strategy. His experience and no-nonsense demeanor ensure that the discussion of options is both realistic and grounded in sound operational practice.',
        a.traits = ["strategic", "commanding", "disciplined", "experienced"],
        a.sphere_of_influence = 'Military Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_bob_russell'})
    ON CREATE SET
        a.name = 'Bob Russell',
        a.title = 'Vice President',
        a.description = 'Bob Russell carries the heavy mantle of the nation\'s second-in-command. In private moments his carefully constructed political armor slips, revealing a man burdened by regret and genuine emotion. His internal conflict is palpable as he contemplates personal memories—symbolized by the cherished photograph of his past. Behind his controlled exterior lies a soul shaped by tender recollections of a simpler time and the weight of public duty.',
        a.traits = ["calculated", "nostalgic", "emotionally conflicted", "dedicated"],
        a.sphere_of_influence = 'political governance and strategy'
    ;
MERGE (a:Agent {uuid: 'agent_margaret'})
    ON CREATE SET
        a.name = 'Margaret',
        a.title = 'None',
        a.description = 'Margaret appears as a quietly observant presence in the scene, standing in the doorway of the Vice President\'s Office. Her discomfort at witnessing Bob Russell\'s vulnerable moment speaks to her awareness of protocol and the unspoken tensions that pervade political life. She is attentive, respectful of boundaries, yet clearly affected by the raw display of personal emotion that disrupts the rigid formality of the environment.',
        a.traits = ["observant", "cautious", "sensitive", "dutiful"],
        a.sphere_of_influence = 'administrative support within high-level government settings'
    ;
MERGE (a:Agent {uuid: 'agent_amanda_dalton'})
    ON CREATE SET
        a.name = 'Amanda Dalton',
        a.title = 'USAID Aid Worker',
        a.description = 'Amanda Dalton is remembered both as a symbol of youthful determination and as a dedicated professional in the realm of international aid. Her early experiences, captured in a cherished photograph with Bob Russell, hint at a life committed to service and resilience. Now an experienced USAID veteran, she embodies the intersection of personal legacy and the larger duty of rebuilding and aiding communities in conflict zones.',
        a.traits = ["resilient", "determined", "compassionate", "committed"],
        a.sphere_of_influence = 'international aid and post-conflict recovery'
    ;
MERGE (a:Agent {uuid: 'agent_viktor_petrov'})
    ON CREATE SET
        a.name = 'Viktor Petrov',
        a.title = 'Ambassador',
        a.description = 'Viktor Petrov is a consummate diplomat representing Moscow, exuding stern authority and measured composure. In this scene, his perfectly poised stance and precise articulation of policy underscore years of international experience and a deep understanding of delicate negotiations on the global stage.',
        a.traits = ["Diplomatic", "Poised", "Assertive", "Meticulous"],
        a.sphere_of_influence = 'Diplomacy and international relations'
    ;
MERGE (a:Agent {uuid: 'agent_cj_cregg'})
    ON CREATE SET
        a.name = 'C.J. Cregg',
        a.title = 'Press Secretary',
        a.description = 'C.J. Cregg is a sharp and observant communications expert known for her resilience and calm under pressure. In this scene, her reaction to a breaking news alert on her BlackBerry reveals her acute awareness of the unfolding media storm. Her dedication to accurate communication and her composed demeanor serve as a critical counterbalance amidst the high-stakes diplomatic dialogue.',
        a.traits = ["Observant", "Resilient", "Astute", "Composed"],
        a.sphere_of_influence = 'Communications and Media Relations'
    ;
MERGE (a:Agent {uuid: 'agent_sam_seaborn'})
    ON CREATE SET
        a.name = 'Sam Seaborn',
        a.title = 'None',
        a.description = 'Sam Seaborn is a dedicated and creative staff member who channels his inner turmoil into his work. Often caught between the demands of poetic expression and the harsh realities of political violence, he is visibly affected by the pressures of his responsibilities. His normally impeccable appearance gives way to dishevelment in moments of intense introspection, revealing a man who carries both idealism and a deep sense of moral conflict.',
        a.traits = ["idealistic", "emotionally vulnerable", "creative", "intensely passionate"],
        a.sphere_of_influence = 'political communications'
    ;
MERGE (a:Agent {uuid: 'agent_toby_ziegler'})
    ON CREATE SET
        a.name = 'Toby Ziegler',
        a.title = 'None',
        a.description = 'Toby Ziegler is a thoughtful and measured deputy whose calm demeanor balances the emotional intensity permeating the work environment. Known for his capacity to offer restraint and reflective insight, Toby provides guidance to his colleagues during harrowing moments. His presence in the doorway of the workspace underscores a protective and mentoring role, as he watches over Sam with concern while encouraging a measured approach to the burdens of political violence.',
        a.traits = ["measured", "empathetic", "grounded", "observant"],
        a.sphere_of_influence = 'political strategy and communications'
    ;
MERGE (a:Agent {uuid: 'agent_president_kovach'})
    ON CREATE SET
        a.name = 'President Kovach',
        a.title = 'President',
        a.description = 'President Kovach is a seasoned leader known for his steady hand and unwavering commitment to national security and effective governance. Despite a limited appearance in the current scene, his reputation precedes him as a person who embodies both resolve and pragmatism in the face of crisis. His composed demeanor and strategic intellect highlight a profound understanding of international politics, underlined by a deep sense of duty and adherence to tradition.',
        a.traits = ["Authoritative", "Calm", "Strategic", "Inspiring"],
        a.sphere_of_influence = 'National Governance/Executive Leadership'
    ;
MERGE (a:Agent {uuid: 'agent_charlie_young'})
    ON CREATE SET
        a.name = 'Charlie Young',
        a.title = 'Personal Assistant',
        a.description = 'Charlie Young is a dedicated and efficient aide who plays a crucial role in ensuring the smooth functioning of the White House. Known for his resourcefulness and unwavering loyalty, he manages critical tasks with remarkable discretion even under intense pressure. His keen attention to detail and calm demeanor help to execute high-priority directives with precision, underscoring his indispensable value to the executive office.',
        a.traits = ["Resourceful", "Reliable", "Attentive", "Meticulous"],
        a.sphere_of_influence = 'White House Operations/Executive Support'
    ;
MERGE (o:Object {uuid: 'object_lcd_screens'})
    ON CREATE SET
        o.name = 'LCD Screens',
        o.description = 'The LCD screens in the Situation Room are sleek, state-of-the-art devices that display live satellite imagery of the Kosovo-Serbia border region. Their digital glow cuts through the dim pre-dawn light, offering critical visual intelligence that underpins the briefing and informs strategic decisions during the crisis.',
        o.purpose = 'To display live satellite imagery and real-time intelligence',
        o.significance = 'They serve as a core tool for monitoring vital geopolitical developments and underpin decision-making in national security matters.'
    ;
MERGE (o:Object {uuid: 'object_framed_photograph'})
    ON CREATE SET
        o.name = 'Framed Photograph',
        o.description = 'A meticulously preserved framed photograph showing Bob Russell in a tender moment teaching a young Amanda Dalton how to fish at his Colorado lake house. The image, steeped in nostalgia, captures a period of innocence and connection far removed from the austere pressures of political leadership.',
        o.purpose = 'To evoke personal memories and symbolize the fragile intersection between private sentiment and the demands of public office.',
        o.significance = 'The photograph serves as a visual reminder of Bob Russell\'s past and the emotional cost of political responsibility, hinting at the sacrifices inherent in leadership.'
    ;
MERGE (o:Object {uuid: 'object_blackberry'})
    ON CREATE SET
        o.name = 'BlackBerry',
        o.description = 'The BlackBerry is a sleek, early smartphone known for its physical keyboard and secure communication capabilities. It buzzes with incoming alerts, serving as a vital conduit for real-time news and updates.',
        o.purpose = 'To receive and display instant news alerts and communications.',
        o.significance = 'It symbolizes the relentless flow of information and the critical role of media in influencing political events.'
    ;
MERGE (o:Object {uuid: 'object_laptop_with_dual_documents'})
    ON CREATE SET
        o.name = 'Laptop with Dual Documents',
        o.description = 'This laptop, surrounded by the physical detritus of a long and taxing work session, serves as a focal point in the scene. Its screen glows with two distinct documents—one heralding victory and the other steeped in tragedy—symbolizing the dualities of political messaging and the burden of leadership. The device is a silent witness to the inner conflict of its user, reflecting both creative determination and the somber weight of responsibility.',
        o.purpose = 'To showcase the conflicting narratives of triumph and sorrow that define the current political crisis.',
        o.significance = 'The laptop underscores the theme of duality, capturing the essence of a political environment where poetic ambition wrestles with harsh reality. It is a visual manifestation of the struggle to find meaning in tragedy.'
    ;
MERGE (o:Object {uuid: 'object_resolute_desk'})
    ON CREATE SET
        o.name = 'Resolute Desk',
        o.description = 'The Resolute Desk stands as a potent symbol of presidential authority and history, its finely crafted design merging tradition with the demands of modern statecraft. Often serving as the centerpiece in the Oval Office, it witnesses critical decisions and strategic meetings amid palpable tension.',
        o.purpose = 'To serve as the central executive work desk and symbolic artifact of leadership.',
        o.significance = 'Represents the continuity of presidential power and the gravity of national decision-making.'
    ;
MERGE (l:Location {uuid: 'location_white_house_situation_room'})
    ON CREATE SET
        l.name = 'White House Situation Room',
        l.description = 'The White House Situation Room is a high-security command center set in the pre-dawn hours. Bathed in dim lighting that casts long shadows and accentuates tired faces, the room is outfitted with numerous LCD screens displaying live satellite imagery. Its deliberate design and atmosphere of urgent introspection make it the nerve center for the administration’s crisis management and high-level strategic discussions.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_kosovo_serbia_border_region'})
    ON CREATE SET
        l.name = 'Kosovo-Serbia Border Region',
        l.description = 'The Kosovo-Serbia Border Region is a geopolitically volatile area marked by post-conflict reconstruction efforts and ongoing tensions. The region’s stark, rugged terrain comes to life on LCD screens, revealing rapid changes and challenges faced by aid workers balancing between rebuilding efforts and political unrest.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_the_hague'})
    ON CREATE SET
        l.name = 'The Hague',
        l.description = 'The Hague is an internationally renowned city celebrated for its integral role in global diplomacy and justice. In this context, it is referenced as the locale tied to the demands of a militant faction, embodying both legal accountability and the high stakes of international intervention in conflict resolution.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_vice_presidents_office'})
    ON CREATE SET
        l.name = 'Vice President\'s Office',
        l.description = 'The Vice President\'s Office is a stately, dimly lit sanctuary set apart from the high-energy corridors of power. Dominated by a solitary desk lamp that casts long shadows across polished wood surfaces, the room exudes gravitas and reflective introspection with sparse furnishings and carefully arranged personal mementos, emphasizing the weight of public duty alongside private vulnerability.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_mural_room'})
    ON CREATE SET
        l.name = 'Mural Room',
        l.description = 'The Mural Room is a spacious chamber adorned with large, expressive murals that capture significant historical and political moments. Bathed in subtle lighting and featuring elegant architectural details, this room exudes gravitas and decorum, making it an ideal setting for high-level diplomatic discussions and strategic sessions.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    ON CREATE SET
        l.name = 'Steam Pipe Trunk Distribution Venue',
        l.description = 'The Steam Pipe Trunk Distribution Venue is a windowless office space with a palpable sense of urgency and isolation. The stark, sealed environment, highlighted by sparse lighting that accentuates scattered crumpled paper and empty coffee cups, mirrors the long hours of work and reflective crisis moments occurring within its walls.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_oval_office'})
    ON CREATE SET
        l.name = 'Oval Office',
        l.description = 'The Oval Office is a stately and well-appointed room serving as the epicenter of executive decision-making. Home to the iconic Resolute Desk amidst elegant furnishings and expansive windows that capture the steady descent of rain, its warm lighting and somber weather together create an atmosphere of reflective gravity suitable for high-stakes discussions.',
        l.type = 'Office'
    ;
MERGE (o:Organization {uuid: 'org_usaid'})
    ON CREATE SET
        o.name = 'USAID',
        o.description = 'USAID, the United States Agency for International Development, is dedicated to delivering international aid and fostering post-conflict stabilization. It plays a critical role in rebuilding war-torn regions by providing essential services and support, with a strong commitment to global humanitarian efforts and sustainable development.',
        o.sphere_of_influence = 'international aid and reconstruction'
    ;
MERGE (o:Organization {uuid: 'org_serbian_paramilitary_group'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Group',
        o.description = 'An armed and loosely organized militant faction that leverages conflict and chaos to enforce its radical agenda, often demanding concessions or the release of detained figures to expand its influence in the region.',
        o.sphere_of_influence = 'Regional Insurgency in the Balkans'
    ;
MERGE (o:Organization {uuid: 'org_serbian_security_services'})
    ON CREATE SET
        o.name = 'Serbian Security Services',
        o.description = 'A formal state security organization tasked with national protection. Amid the current crisis, it is alleged to have provided covert tactical support to paramilitary elements, blurring the lines between official security measures and underground operations.',
        o.sphere_of_influence = 'National Security Operations'
    ;
MERGE (o:Organization {uuid: 'org_nato'})
    ON CREATE SET
        o.name = 'NATO',
        o.description = 'NATO, the North Atlantic Treaty Organization, is a powerful military alliance committed to collective defense and crisis management, setting the standards for military intervention and establishing a framework for multinational security efforts.',
        o.sphere_of_influence = 'International Military and Security'
    ;
MERGE (o:Organization {uuid: 'org_cnn'})
    ON CREATE SET
        o.name = 'CNN',
        o.description = 'CNN is a leading global news organization renowned for its rapid coverage of breaking events. Its involvement in the narrative underscores the significant impact of media on shaping political narratives and public perception.',
        o.sphere_of_influence = 'News and Media'
    ;
MERGE (o:Organization {uuid: 'org_serbian_special_police_units'})
    ON CREATE SET
        o.name = 'Serbian Special Police Units',
        o.description = 'The Serbian Special Police Units are a tactical law enforcement entity responsible for securing critical sites and managing high-risk operations. Their exceptional coordination and rapid response capabilities highlight their pivotal role in maintaining regional security in volatile environments.',
        o.sphere_of_influence = 'Law Enforcement/Regional Security'
    ;
MERGE (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
    ON CREATE SET
        ep.title = 'Episode One - Fault Lines',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Pre-Dawn Crisis in the Situation Room',
        s.description = 'In the cold, early light of pre-dawn, the White House Situation Room becomes a theater of urgent crisis management. The corridors, still echoing from the footsteps of a strained Josh Lyman, lead us into a room bathed in the soft glow of dim lighting and illuminated by multiple LCD screens that broadcast satellite imagery of the troubled Kosovo-Serbia border region. The air is heavy with apprehension as National Security Advisor Nancy McNally, her voice steady despite the tension, briefs the assembled staff on the mysterious loss of contact with USAID workers. Amid murmurs of paramilitary claims and strategic assessments, the room’s fragile calm shatters with the arrival of President Bartlet and his closest advisors. Every whispered dialogue and pained glance speaks to the weight of decisions yet to be made, as the administration grapples with the precarious balance between duty and moral reckoning.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_white_house_situation_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Josh Lyman Arrives in the Situation Room',
        e.description = 'In the dim pre-dawn light of the Situation Room, Josh Lyman enters with a palpable sense of urgency. His tie is loosened, symbolizing the weariness and tension that has become his unwelcome companion during crises. As he walks through the echoing corridors, every step echoes the heavy responsibility of his role. Upon taking his seat, he unconsciously rubs an old scar on his chest—a subtle, yet profound reminder of past traumas. This moment powerfully sets the emotional tone, hinting at both internal conflict and the impending challenge that lies ahead.',
        e.sequence_within_scene = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Nancy McNally Delivers the Urgent Briefing',
        e.description = 'At the head of the table, National Security Advisor Nancy McNally seizes command of the moment. With unwavering authority, she informs the weary senior staff that four USAID workers have gone dark near the Kosovo-Serbia border while conducting post-conflict assessments. The gravity of her announcement is underscored by the multidimensional backdrop of satellite imagery blinking on LCD screens, highlighting the volatile region. This event effectively galvanizes the room, transforming routine morning briefings into a high-stakes operation, and leaving no doubt that the crisis at hand demands swift and measured action.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Intelligence and Claims: A Dual Update',
        e.description = 'As the weight of Nancy’s briefing sinks in, additional voices in the room sharpen the picture of the unfolding crisis. Donna Moss steps forward to reveal that Serbian paramilitary groups are actively claiming responsibility on social media for the missing workers, while hinting at demands for the release of key detainees. Simultaneously, Kate Harper provides a crucial intelligence update, suggesting that elements within Serbian security services have covertly supported the paramilitary actions. This exchange of information not only deepens the narrative tension but also underscores the complexity of political and military maneuvers underpinning the crisis, creating a layered web of intrigue and urgency.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Serbian paramilitary group is claiming responsibility on social media. They're demanding the release of three commanders from The Hague.", "Our intelligence suggests elements within Serbian security services provided tactical support to the paramilitary group."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'President Bartlet Takes Command',
        e.description = 'In a decisive and solemn moment, the atmosphere thickens as President Bartlet enters the Situation Room accompanied by Leo McGarry and General Alexander. Their arrival shifts the dynamics instantly, as every face registers respect and alertness. The President’s grim expression and measured tone quash any remnants of routine as he demands a status update on strategic options. This intervention signals a critical turning point; the authority of the Commander-in-Chief reasserts control amid uncertainty and escalating peril. His succinct command underlines the urgency of the situation, setting the stage for high-level decision-making that will define the day’s events.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Where are we on options?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Veil of Persona',
        s.description = 'In the hushed and dimly lit Vice President\'s Office, a single desk lamp casts a fragile glow over Bob Russell, revealing a rare glimpse of vulnerability behind his carefully maintained political mask. Surrounded by shadowy contours of a stately office, Bob is drawn into a private reverie as he gazes at a cherished framed photograph of himself teaching a young Amanda Dalton to fish. This memento of a more sincere past contrasts sharply with the burden of public duty thrust upon him by recent political events. His whispered remark hints at a personal legacy intertwined with national service. The scene serves as a quiet yet pivotal moment, emphasizing the personal cost of leadership and the relentless tug between private sentiment and public responsibility.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_vice_presidents_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Intimate Reflection',
        e.description = 'In the soft shadows of his office, Bob Russell loses himself in a moment of introspection. Bathed in the solitary glow of a desk lamp, he studies the framed photograph that captures a tender memory from his past—a time when he taught a young Amanda Dalton to fish, symbolizing familial and inspirational bonds. As the silence of the early morning deepens, Bob’s hushed utterance reveals how personal ties influence his political judgments, inviting the audience to witness the fragile human side behind a hardened public façade.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["RUSSELL: She joined USAID because of him, you know."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Interruption and Reaffirmation',
        e.description = 'The quiet intimacy of reflection is abruptly interrupted as Margaret enters the office, her presence a reminder of the relentless demands of duty. Standing in the doorway with an evident air of urgency, she signals that the private moment must yield to the imperatives of statecraft. Bob shifts from a state of vulnerable introspection to the measured authority required of him when he explains that a speech by President Bartlet has summoned him to the Situation Room. As he carefully returns the photograph to its place, his actions symbolize the deliberate reassembly of his public persona, marking the transition from inward sentiment to external responsibility.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MARGARET: Sir, they're waiting for you in the Situation Room.", "RUSSELL: Because of a speech Bartlet gave. About America's obligation to help rebuild war-torn regions. To prevent the next conflict before it starts."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Diplomacy Under Pressure',
        s.description = 'In the stately Mural Room of the West Wing, the atmosphere is charged with a tense mix of authority and apprehension. The room’s high ceilings and austere decor frame a scene where every word carries weight. Dim ambient light and subtle art on the walls contribute to an air of meticulously controlled order, even as the crisis unfolds. Here, the Russian Ambassador, Viktor Petrov, stands with impeccable manners, delivering Moscow\'s measured yet defiant position. As President Bartlet interjects with piercing skepticism, the tension intensifies. Meanwhile, the urgent buzz of C.J.\'s BlackBerry presages the impending media storm, symbolizing the collision of political maneuvering with rapidly evolving external pressures. This moment underscores the delicate balance between national security, diplomatic posture, and the human cost of political decisions.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_mural_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Ambassador’s Assertive Declaration',
        e.description = 'Viktor Petrov, the Russian Ambassador, takes center stage with poised authority. Standing in the Mural Room, he delivers a carefully worded statement that minimizes NATO’s involvement by framing the crisis as an internal Serbian law enforcement matter. His diplomatic posture and refined articulation underline Moscow’s stance, setting a provocative tone. This declaration is charged with tension, as it not only defines Moscow’s position but also challenges the foundations of international intervention, making it a pivotal moment in the unfolding crisis.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["This is, as we see it, an internal Serbian law enforcement matter. Any NATO intervention would constitute a serious violation of sovereign territory."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'President Bartlet’s Confrontational Inquiry',
        e.description = 'In the wake of the Ambassador’s poised declaration, President Bartlet steps forward with a forceful query that slices through the diplomatic veneer. His challenge questions how the kidnapping of American aid workers can be dismissed as a domestic issue. This moment is critical as it forces a confrontation between diplomatic rhetoric and the moral and national imperatives of leadership. Bartlet’s inquiry not only heightens the tension in the room but also signals a rejection of simplistic narratives in the face of complex, life-and-death decisions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Mr. Ambassador, would you care to explain how the kidnapping of American aid workers constitutes an internal matter?"]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'C.J.’s Alert Amid Rising Tension',
        e.description = 'As the heated exchange continues, the reality of the evolving crisis intrudes into the room through technology. C.J. Cregg experiences a brief yet significant moment of hesitation as her BlackBerry buzzes, signaling the circulation of breaking news. The message is immediately understood to be consequential when she informs the room that CNN is reporting Amanda Dalton’s identity. This interruption adds an urgent media dimension to the crisis, shifting the focus from theoretical debate to a stark, personal stake in the unfolding events.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Sir, CNN is running with Amanda Dalton's identity."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Drafts of Tragedy and Restraint',
        s.description = 'In the cramped, windowless confines of the Steam Pipe Trunk Distribution Venue, the early morning gloom is pierced only by the eerie glow of a laptop screen displaying two conflicting drafts—one celebrating victory, the other lamenting tragedy. Crumpled papers and empty coffee cups scatter the space, evidence of long hours spent wrestling with the burdens of political speech and poetic truth. The atmosphere is charged with introspection and urgency as Sam Seaborn, visibly disheveled and lost in thought, grapples with the weight of recent events. Toby Ziegler stands in the doorway, a silent witness to the internal battle unfolding—a struggle to reconcile the harsh realities of political violence with the aspiration to remain principled \'good guys\'. This scene acts as a microcosm of the larger narrative, highlighting the tension between poetic expression and the brutal demands of geopolitics.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Defining Tragedy in the Midst of Crisis',
        e.description = 'In this event, Sam Seaborn breaks the silence with a reflective musing on the inherent demands of tragedy, questioning how one can transform the harshness of political violence into poetic language. His words set the stage for a deeper exploration of the role of art in moments of despair. Toby Ziegler responds with a calming reminder that restraint can itself be a form of poetry, underscoring the need to remain principled. This exchange highlights the duo\'s struggle to capture a balance between emotional expression and the hard realities of their world, drawing the audience into the moral dilemmas faced on the front lines of political discourse.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["SAM: The thing about tragedy is that it demands poetry. But how do you make poetry out of political violence?", "TOBY: Sometimes poetry is in the restraint. We need to remind people why we send aid workers into dangerous places. Why we try to rebuild what others have destroyed."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Confronting the Cost of Goodness',
        e.description = 'The conversation deepens as Sam reflects on a past moment of crisis following the Rosslyn incident, confessing that the memory still haunts him as a reminder of their duty. His admission illuminates the personal toll of maintaining moral integrity in a world rife with compromise. Toby’s measured response reaffirms their collective identity as those who strive to be \'the good guys\', though not without significant hardship. This event encapsulates the emotional vulnerability beneath their professional facades, emphasizing the enduring conflict between idealism and the pragmatic demands of leadership.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SAM: I keep thinking about what you said after Rosslyn. About how we're supposed to be the good guys.", "TOBY: We still are. That's why this is hard."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Crisis Unfolds in the Oval Office',
        s.description = 'In the heart of the Oval Office, rain streaks down the windows as tension mingles with relief. The room, filled with senior staff still reeling from the relentless pace of the night, becomes a crucible for raw emotion and political resolve. Kate Harper’s abrupt entrance brings urgent news about the safe retrieval of hostages, momentarily dispelling the collective anxiety. Yet, as relief floods the room, Josh Lyman remains by a rain-spattered window, troubled by the cost of their success. Behind his steady exterior, doubts and reflections on the nature of power and sacrifice come to light. President Bartlet, standing resolutely behind the Resolute Desk, signals the next command to expose the chain of decisions that led to this near-crisis. This scene encapsulates a turning point where personal introspection collides with the stark demands of political leadership, setting the stage for accountability in the aftermath of a narrowly averted disaster.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_oval_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'News of Hostage Safety',
        e.description = 'Kate Harper bursts into the Oval Office, cutting through the heavy atmosphere with a crisp announcement that the Serbian special police units have secured the compound, and that all hostages are safe. Her delivery interrupts the tension in the room, triggering a momentary relief among the senior staff. This sudden communication reorients everyone\'s focus on the crisis at hand, marking a pivotal moment that shifts the narrative from impending doom to cautious optimism. The message underscores the fragile balance between security and vulnerability in the midst of high political stakes.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["KATE: Serbian special police units have secured the compound. All hostages are safe."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Introspective Reflections by the Window',
        e.description = 'Amid the easing of palpable tension throughout the room, Josh Lyman stands apart by the window, his gaze fixed on the relentless rain. In a vulnerable monologue, he confesses that for those agonizing twenty minutes when they feared a total loss, he understood the grim rationale behind nations resorting to war, sacrificing principles for revenge. Donna Moss, moving quietly to his side, offers a counterpoint that while the outcome was dire, it was not a complete failure. This exchange deepens the emotional complexity of the scene, revealing the personal toll of decision-making under crisis, and setting the stage for a broader exploration of ethical ambiguity in political strategy.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["JOSH: For about twenty minutes there, when we thought we'd lost them... I understood why nations go to war. Why they abandon principles for revenge.", "DONNA: But we didn't.", "JOSH: That's what scares me. Not that we might have failed, but that we might have succeeded in the wrong way."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Presidential Command for Accountability',
        e.description = 'As the atmosphere begins to shift from personal reckoning to urgent strategy, President Bartlet steps forward with a decisive air. Standing behind the iconic Resolute Desk, his demeanor betrays a steely resolve despite the lingering tension. In a commanding tone, he instructs Charlie Young to contact President Kovach and summon bipartisan leadership, emphasizing the need for transparency with the American people. This directive underscores a critical turning point in the narrative as it transitions from internal doubt to external accountability, highlighting the cost of crisis management and the fine line between success and compromising core principles.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["PRESIDENT BARTLET: Charlie, get me President Kovach. And then the leadership of both parties. The American people deserve to know how close we came to the brink today - and who pushed us there."]
    ;
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_framed_photograph'}),
          (a:Agent {uuid: 'agent_bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_blackberry'}),
          (a:Agent {uuid: 'agent_cj_cregg'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_laptop_with_dual_documents'}),
          (a:Agent {uuid: 'agent_sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_2'})
    ON CREATE SET
        oi.description = 'The LCD screens serve as the pivotal visual conduit in the Situation Room, broadcasting live satellite imagery of the Kosovo-Serbia border region. Their steady digital pulse offers real-time intelligence that intensifies the briefing, making abstract data tangible and pivotal for assessing the rapidly evolving crisis. By providing constant updates, they act as both a literal and metaphorical focal point for the discussion, influencing decision-making and underscoring the urgency of every directive.',
        oi.status_before = 'Before the briefing, the LCD screens were pre-set with crucial satellite feeds that offered a baseline for monitoring the tense geopolitical situation, operating reliably and silently in the subdued pre-dawn light.',
        oi.status_after = 'After the event, the screens continue to display dynamic, updated imagery; they have transitioned from passive information sources to active, central elements that mirror the heightened stakes and inform the ongoing strategic deliberations in the Situation Room.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Josh Lyman strides into the Situation Room in the pre-dawn gloom, his tie loosened and his shoulders slightly slumped under the weight of past crises. He quickly takes his seat, each step echoing his urgency, and his hand unconsciously brushes over an old scar on his chest—a silent testament to the lasting impact of his traumas.',
        ap.emotional_state = 'Outwardly, Josh presents a determined focus mingled with weariness, a calm resolve amid the tension that fills the room. Beneath his composed exterior, he is wrestling with unresolved pain and vivid memories of previous crises; his internal conflict between caution and preparedness marks a deep-seated vulnerability. His measured actions betray an inner anxiety and the burden of responsibility, a quiet storm of apprehension and resolve that drives each deliberate movement.',
        ap.emotional_tags = ["outwardly, josh presents a determined focus mingled with weariness, a calm resolve amid the tension that fills the room. beneath his composed exterior, he is wrestling with unresolved pain", "vivid memories of previous crises; his internal conflict between caution", "preparedness marks a deep-seated vulnerability. his measured actions betray an inner anxiety", "the burden of responsibility, a quiet storm of apprehension", "resolve that drives each deliberate movement.", "outwardly", "josh presents a determined focus mingled with weariness", "a calm resolve amid the tension that fills the room. beneath his composed exterior", "he is wrestling with unresolved pain and vivid memories of previous crises; his internal conflict between caution and preparedness marks a deep-seated vulnerability. his measured actions betray an inner anxiety and the burden of responsibility", "a quiet storm of apprehension and resolve that drives each deliberate movement.", "outwardly, josh presents a determined focus mingled with weariness, a calm resolve amid the tension that fills the room. beneath his composed exterior, he is wrestling with unresolved pain and vivid memories of previous crises", "his internal conflict between caution and preparedness marks a deep-seated vulnerability. his measured actions betray an inner anxiety and the burden of responsibility, a quiet storm of apprehension and resolve that drives each deliberate movement."],
        ap.active_plans = ["Quickly assess the unfolding crisis through available intelligence and observable cues.", "Coordinate seamlessly with senior staff to align immediate responses with long-term strategies.", "Internalize past traumatic experiences to fuel a sharp focus on preventing further losses."],
        ap.beliefs = ["A steadfast commitment to duty under even the most extreme pressures.", "The conviction that personal experiences, however painful, bolster a more empathetic and effective response.", "The belief that transparency and decisive action are essential to uphold national security and trust."],
        ap.goals = ["Short-term: Stabilize his immediate environment in the Situation Room by reestablishing order and focus.", "Medium-term: Ensure clear communication channels among the senior staff to manage the deteriorating situation effectively.", "Ultimate: Protect the integrity of national security while reconciling his past traumas to foster a resilient, responsive leadership culture."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Nancy stands at the head of the table in the Situation Room, her posture firm and commanding despite the early hour. She raises her voice with precision, her hands gesturing confidently toward the satellite imagery displayed on the screens, making sure every member of the senior staff is fully engaged.',
        ap.emotional_state = 'Nancy projects a cool, authoritative calm on the surface, her tone controlled and deliberate. Yet beneath that unwavering exterior, there is a palpable undercurrent of worry and determination; her mind races with the implications of the missing USAID workers, and each measured word carries the weight of deep internal anxiety and unspoken commitment to averting further disaster.',
        ap.emotional_tags = ["nancy projects a cool, authoritative calm on the surface, her tone controlled", "deliberate. yet beneath that unwavering exterior, there is a palpable undercurrent of worry", "determination; her mind races with the implications of the missing usaid workers,", "each measured word carries the weight of deep internal anxiety", "unspoken commitment to averting further disaster.", "nancy projects a cool", "authoritative calm on the surface", "her tone controlled and deliberate. yet beneath that unwavering exterior", "there is a palpable undercurrent of worry and determination; her mind races with the implications of the missing usaid workers", "and each measured word carries the weight of deep internal anxiety and unspoken commitment to averting further disaster.", "nancy projects a cool, authoritative calm on the surface, her tone controlled and deliberate. yet beneath that unwavering exterior, there is a palpable undercurrent of worry and determination", "her mind races with the implications of the missing usaid workers, and each measured word carries the weight of deep internal anxiety and unspoken commitment to averting further disaster."],
        ap.active_plans = ["Clarify the details of the disrupted USAID mission immediately.", "Coordinate with intelligence and military teams to verify satellite data and ground reports.", "Steer the briefing towards concrete tactical decisions while managing the room's heightened tensions."],
        ap.beliefs = ["Reliable intelligence is the cornerstone of national security.", "Decisive leadership during crises prevents escalation.", "Transparency and accountability are essential in communication with both staff and the public."],
        ap.goals = ["Short-term: Secure immediate and accurate situational awareness to stabilize the crisis.", "Medium-term: Orchestrate a coordinated response among key departments to counter emerging threats.", "Ultimate: Uphold national security and safeguard lives by ensuring every decision is informed and measured."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Donna Moss stands near the briefing table with purposeful strides in the dim light of the Situation Room. Her body language is measured yet assertive, as she steps forward to deliver critical intelligence. Her eyes scan the room with a practiced vigilance while her gestures punctuate the urgency of her report.',
        ap.emotional_state = 'Donna presents a calm exterior, marked by a professional composure even as the weight of the crisis tugs at her inner resolve. Beneath this controlled demeanor lies a blend of concern and determination, as she battles the tension of imminent political fallout while internally committing to the clarity and accuracy of her message.',
        ap.emotional_tags = ["donna presents a calm exterior, marked by a professional composure even as the weight of the crisis tugs at her inner resolve. beneath this controlled demeanor lies a blend of concern", "determination, as she battles the tension of imminent political fallout while internally committing to the clarity", "accuracy of her message.", "donna presents a calm exterior", "marked by a professional composure even as the weight of the crisis tugs at her inner resolve. beneath this controlled demeanor lies a blend of concern and determination", "as she battles the tension of imminent political fallout while internally committing to the clarity and accuracy of her message.", "donna presents a calm exterior, marked by a professional composure even as the weight of the crisis tugs at her inner resolve. beneath this controlled demeanor lies a blend of concern and determination, as she battles the tension of imminent political fallout", "internally committing to the clarity and accuracy of her message."],
        ap.active_plans = ["Confirm and validate the social media claims regarding the Serbian paramilitary group.", "Coordinate with intelligence units to gather additional corroborating evidence.", "Ensure that the chain of command is promptly informed to strategize an immediate response."],
        ap.beliefs = ["Truth and transparency in intelligence are paramount in crisis management.", "Immediate and accurate communication can prevent further escalation.", "Every piece of verified information is a stepping stone to effective decision-making."],
        ap.goals = ["Short-term: Relay timely and verified intelligence to the team.", "Medium-term: Facilitate coordinated strategic decisions to address the crisis.", "Ultimate: Uphold national security while maintaining public trust in government actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Kate Harper stands at the edge of the Situation Room’s intelligence hub, her posture rigid with focus. Dressed in refined professional attire, she speaks succinctly and firmly as she provides her analytic update. Her constant monitoring of data streams and satellite imagery underscores her role as the voice of precision and clarity in a room thick with tension.',
        ap.emotional_state = 'Kate maintains an outward calm and steely composure, every gesture measured and deliberate. Internally, however, she wrestles with the significance of her findings, feeling a quiet apprehension about the deeper connections suggested by the intelligence. Despite this, her determination to uncover the truth and support decisive action remains unwavering.',
        ap.emotional_tags = ["kate maintains an outward calm", "steely composure, every gesture measured", "deliberate. internally, however, she wrestles with the significance of her findings, feeling a quiet apprehension about the deeper connections suggested by the intelligence. despite this, her determination to uncover the truth", "support decisive action remains unwavering.", "kate maintains an outward calm and steely composure", "every gesture measured and deliberate. internally", "however", "she wrestles with the significance of her findings", "feeling a quiet apprehension about the deeper connections suggested by the intelligence. despite this", "her determination to uncover the truth and support decisive action remains unwavering."],
        ap.active_plans = ["Analyze and verify the technical data linking Serbian security support to the paramilitary operations.", "Integrate fresh intelligence into the ongoing briefing for real-time decision-making.", "Maintain a clear and measured communication channel to ensure accuracy in information dissemination."],
        ap.beliefs = ["Objective, evidence-based intelligence is crucial for sound decision-making.", "Clarity and precision in reporting are essential in painting an accurate picture of complex situations.", "Every analytical insight contributes significantly to national security."],
        ap.goals = ["Short-term: Deliver a precise, data-driven update on the intelligence status.", "Medium-term: Enable executive leadership to strategize effectively based on verified intelligence.", "Ultimate: Ensure national security is maintained through the diligent and accurate interpretation of critical data."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_1_4'})
    ON CREATE SET
        ap.current_status = 'President Bartlet strides into the Situation Room with deliberate steps, his back straight and his face set in a grim, resolute expression. His measured pace and firm gaze sweep the room as he asserts his authority, signaling that every second counts in this high-stakes crisis.',
        ap.emotional_state = 'Bartlet’s external calm masks the internal storm of responsibility and unease that churns within him. His tense posture and controlled tone betray a deep concern for the unfolding events, while a quiet determination fuels his need to restore order, even as personal doubts and the burden of past failures subtly gnaw at him beneath the surface.',
        ap.emotional_tags = ["bartlet\u2019s external calm masks the internal storm of responsibility", "unease that churns within him. his tense posture", "controlled tone betray a deep concern for the unfolding events, while a quiet determination fuels his need to restore order, even as personal doubts", "the burden of past failures subtly gnaw at him beneath the surface.", "bartlet\u2019s external calm masks the internal storm of responsibility and unease that churns within him. his tense posture and controlled tone betray a deep concern for the unfolding events", "while a quiet determination fuels his need to restore order", "even as personal doubts and the burden of past failures subtly gnaw at him beneath the surface.", "bartlet\u2019s external calm masks the internal storm of responsibility and unease that churns within him. his tense posture and controlled tone betray a deep concern for the unfolding events,", "a quiet determination fuels his need to restore order, even as personal doubts and the burden of past failures subtly gnaw at him beneath the surface."],
        ap.active_plans = ["Demand an immediate, comprehensive update on strategic options.", "Reassert executive control over the crisis management process.", "Set in motion a coordinated response among senior advisors and military leaders."],
        ap.beliefs = ["Decisive leadership is essential in moments of national peril.", "Every executive decision must be grounded in both ethical duty and strategic necessity.", "Maintaining public trust requires unwavering commitment even under intense pressure."],
        ap.goals = ["Short-term: Secure immediate situational awareness and response options.", "Medium-term: Strengthen command cohesion and operational efficiency in the Situation Room.", "Ultimate: Safeguard national security while upholding the integrity of the nation\u2019s values."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Leo McGarry stands quietly yet resolutely by Bartlet’s side, his posture calm and attentive as he monitors the rapid flow of information. He exudes quiet authority, his eyes scanning every nuance in the room, and his subtle gestures affirm his role as the steady backbone of the administration.',
        ap.emotional_state = 'Leo embodies a layered stoicism; despite his outward calm, there is an undercurrent of focused anxiety and pragmatic worry about the broader political fallout. Beneath his composed exterior, he wrestles with the pressure of managing a crisis while balancing loyalty to the President with the need for practical, immediate solutions to preserve stability.',
        ap.emotional_tags = ["leo embodies a layered stoicism; despite his outward calm, there is an undercurrent of focused anxiety", "pragmatic worry about the broader political fallout. beneath his composed exterior, he wrestles with the pressure of managing a crisis while balancing loyalty to the president with the need for practical, immediate solutions to preserve stability.", "leo embodies a layered stoicism; despite his outward calm", "there is an undercurrent of focused anxiety and pragmatic worry about the broader political fallout. beneath his composed exterior", "he wrestles with the pressure of managing a crisis while balancing loyalty to the president with the need for practical", "immediate solutions to preserve stability.", "leo embodies a layered stoicism", "despite his outward calm, there is an undercurrent of focused anxiety and pragmatic worry about the broader political fallout. beneath his composed exterior, he wrestles with the pressure of managing a crisis while balancing loyalty to the president with the need for practical, immediate solutions to preserve stability.", "leo embodies a layered stoicism; despite his outward calm, there is an undercurrent of focused anxiety and pragmatic worry about the broader political fallout. beneath his composed exterior, he wrestles with the pressure of managing a crisis", "balancing loyalty to the president with the need for practical, immediate solutions to preserve stability."],
        ap.active_plans = ["Monitor and relay critical updates between the Situation Room and the broader team.", "Advise President Bartlet with pragmatic political and administrative insights.", "Coordinate rapid response measures to ensure the safety and integrity of the crisis management effort."],
        ap.beliefs = ["The strength of leadership is proven in crisis through clear, decisive action.", "Pragmatism must guide governmental responses in unpredictable times.", "The stability of the nation relies on both seasoned experience and unyielding loyalty."],
        ap.goals = ["Short-term: Ensure that all critical information is accurately and promptly communicated.", "Medium-term: Solidify the internal command structure for a unified response.", "Ultimate: Maintain the integrity and credibility of the administration under pressure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_4'})
    ON CREATE SET
        ap.current_status = 'General Alexander occupies a strategic position in the corner of the Situation Room, his military bearing unmistakable as he scrutinizes the incoming satellite imagery and briefing charts. His arms remain folded and his stance purposeful, every movement calculated and imbued with the discipline of a seasoned military strategist.',
        ap.emotional_state = 'The General’s demeanor radiates disciplined focus, yet beneath his stoic exterior lies a controlled urgency and latent anxiety about the high-stakes implications of the crisis. His measured silence hints at intense contemplation and restrained frustration, as he internally contends with the potential ramifications of both action and inaction.',
        ap.emotional_tags = ["the general\u2019s demeanor radiates disciplined focus, yet beneath his stoic exterior lies a controlled urgency", "latent anxiety about the high-stakes implications of the crisis. his measured silence hints at intense contemplation", "restrained frustration, as he internally contends with the potential ramifications of both action", "inaction.", "the general\u2019s demeanor radiates disciplined focus", "yet beneath his stoic exterior lies a controlled urgency and latent anxiety about the high-stakes implications of the crisis. his measured silence hints at intense contemplation and restrained frustration", "as he internally contends with the potential ramifications of both action and inaction."],
        ap.active_plans = ["Provide a precise military assessment of the operational landscape.", "Outline viable contingency plans to counter emerging threats.", "Advise on tactical responses to neutralize any further escalation."],
        ap.beliefs = ["A realistic military evaluation is indispensable for informed decision-making.", "Structured, disciplined action is the bedrock of national security.", "Timely tactical responses prevent broader escalation of conflict."],
        ap.goals = ["Short-term: Deliver an immediate, detailed report on military options.", "Medium-term: Synchronize military strategy with overarching political objectives.", "Ultimate: Ensure that national security is preserved through calculated and effective force management."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_event_2_1'})
    ON CREATE SET
        oi.description = 'The framed photograph serves as a poignant artifact in this intimate scene, symbolizing Bob Russell’s past and the deep emotional connections that influence his decisions. It is not merely a decorative piece but a narrative device that bridges his personal history with the gravity of his current responsibilities, evoking a simpler time of mentorship and innocence. Its careful handling underscores the delicate interplay between vulnerability and the necessity to maintain a steely composure in the political arena.',
        oi.status_before = 'Before the event, the photograph was prominently displayed on Bob Russell’s desk, preserved as a cherished memento that evoked warm and intimate recollections of a bygone era.',
        oi.status_after = 'After the event, the photograph remains on the desk, its emotional charge subdued as Bob Russell methodically reassembles his political façade, leaving its once unguarded intimacy now carefully compartmentalized.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_event_2_2'})
    ON CREATE SET
        oi.description = 'The framed photograph plays a central narrative role as both a relic of personal history and a visual cue of vulnerability in Bob Russell\'s life. During the event, it is the tangible reminder of a time when life was simpler and filled with genuine connections, serving as the catalyst for Bob’s brief personal reflection. Its careful handling and placement on the desk underscore the symbolic transition from raw emotion to calculated authority, marking his deliberate effort to reconstruct his public persona amidst the inevitable call of duty.',
        oi.status_before = 'Prior to the event, the photograph was securely displayed on Bob’s desk, evoking memories of a gentler, more sincere past and held as a personal treasure linked to his private identity.',
        oi.status_after = 'After the event, the photograph retains its place on the desk, now imbued with a renewed significance as it embodies the reconciliation of personal sentiment with the unyielding demands of political responsibility.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Bob Russell sits alone in the darkened Vice President\'s Office, bathed in the soft glow of a solitary desk lamp. His posture is both reverent and pensive as he cradles a framed photograph in his hands before gently returning it to his desk, his movements deliberate and imbued with personal meaning.',
        ap.emotional_state = 'Outwardly, Bob exudes the calm reserve expected of his position, yet his eyes betray a torrent of internal conflict. Beneath the composed exterior lies a deep well of vulnerability and sorrow—remnants of cherished memories intertwined with the heavy burdens of duty. His mind oscillates between the warmth of nostalgic recollection and the urgency of political necessity, revealing a man caught between emotion and obligation.',
        ap.emotional_tags = ["outwardly, bob exudes the calm reserve expected of his position, yet his eyes betray a torrent of internal conflict. beneath the composed exterior lies a deep well of vulnerability", "sorrow\u2014remnants of cherished memories intertwined with the heavy burdens of duty. his mind oscillates between the warmth of nostalgic recollection", "the urgency of political necessity, revealing a man caught between emotion", "obligation.", "outwardly", "bob exudes the calm reserve expected of his position", "yet his eyes betray a torrent of internal conflict. beneath the composed exterior lies a deep well of vulnerability and sorrow\u2014remnants of cherished memories intertwined with the heavy burdens of duty. his mind oscillates between the warmth of nostalgic recollection and the urgency of political necessity", "revealing a man caught between emotion and obligation."],
        ap.active_plans = ["Momentarily reconnect with his personal past to ground his wavering emotions.", "Reconstruct his political persona to face imminent responsibilities in the Situation Room.", "Incorporate the tenderness of his memories to subtly influence his forthcoming public stance."],
        ap.beliefs = ["He believes that personal history and genuine emotion are indispensable to authentic leadership.", "He holds that emotional truths, no matter how private, should inform the public responsibilities he bears.", "He is convinced that the bonds of past experiences can fortify his political decisions in moments of crisis."],
        ap.goals = ["Short-term: Regain composure and clarity before rejoining the staff in the Situation Room.", "Medium-term: Leverage his reflective moment to refine his political messaging and strategy.", "Ultimate: Achieve a harmony between his personal vulnerabilities and the imperatives of his public duty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Bob Russell sits alone at his desk under the glow of a single lamp, intently studying a cherished framed photograph. His movements are measured as he lifts the photograph, examining it with a tender gaze before carefully returning it to its rightful place, his posture shifting from reflective vulnerability to the poised stance of authority as he prepares to leave his intimate reverie behind.',
        ap.emotional_state = 'Externally, Bob projects the calm and resolute demeanor expected of his office, yet underneath there is a raw, conflicted surge of emotion. His eyes betray a deep longing and sorrow as he recalls past moments of innocence, while the weight of duty and the imminent demands of statecraft force him to conceal his inner tenderness. There is a palpable tension between the vulnerability stirred by the memory and the need to reassemble his carefully crafted public persona.',
        ap.emotional_tags = ["externally, bob projects the calm", "resolute demeanor expected of his office, yet underneath there is a raw, conflicted surge of emotion. his eyes betray a deep longing", "sorrow as he recalls past moments of innocence, while the weight of duty", "the imminent demands of statecraft force him to conceal his inner tenderness. there is a palpable tension between the vulnerability stirred by the memory", "the need to reassemble his carefully crafted public persona.", "externally", "bob projects the calm and resolute demeanor expected of his office", "yet underneath there is a raw", "conflicted surge of emotion. his eyes betray a deep longing and sorrow as he recalls past moments of innocence", "while the weight of duty and the imminent demands of statecraft force him to conceal his inner tenderness. there is a palpable tension between the vulnerability stirred by the memory and the need to reassemble his carefully crafted public persona.", "externally, bob projects the calm and resolute demeanor expected of his office, yet underneath there is a raw, conflicted surge of emotion. his eyes betray a deep longing and sorrow as he recalls past moments of innocence,", "the weight of duty and the imminent demands of statecraft force him to conceal his inner tenderness. there is a palpable tension between the vulnerability stirred by the memory and the need to reassemble his carefully crafted public persona."],
        ap.active_plans = ["Prepare to join the Situation Room promptly and address the emerging crisis.", "Reassert his political composure by reconstructing his public image after a moment of personal introspection.", "Balance his emotional attachments with the critical responsibilities of state leadership."],
        ap.beliefs = ["Personal history and cherished memories are essential to understanding one\u2019s duty.", "The demands of public service require the suppression of personal vulnerabilities.", "Leadership demands an unwavering commitment to duty, regardless of personal cost."],
        ap.goals = ["Short-term: Transition smoothly from personal reflection to active duty in the Situation Room.", "Medium-term: Solidify his composed political image to reassure colleagues and the public.", "Ultimate: Uphold the responsibilities of the vice presidency by ensuring informed and decisive action in national affairs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Margaret stands in the doorway of the Vice President\'s Office with a slight hesitance, her body language revealing an inner conflict between professional duty and compassion. Her posture is firm yet gentle as she enters the intimate space, her eyes reflecting urgency and the weight of her message as she reminds Bob that state business awaits beyond the private moment.',
        ap.emotional_state = 'Margaret experiences a complex mix of empathy and obligation. Outwardly, she remains composed and respectful, yet internally she feels discomfort and apprehension at interrupting Bob’s precious moment of vulnerability. Her heart is heavy with the knowledge that personal feelings must always yield to the imperatives of duty, leaving her with an unspoken sadness and anxiety over the collision of private reflection and public obligation.',
        ap.emotional_tags = ["margaret experiences a complex mix of empathy", "obligation. outwardly, she remains composed", "respectful, yet internally she feels discomfort", "apprehension at interrupting bob\u2019s precious moment of vulnerability. her heart is heavy with the knowledge that personal feelings must always yield to the imperatives of duty, leaving her with an unspoken sadness", "anxiety over the collision of private reflection", "public obligation.", "margaret experiences a complex mix of empathy and obligation. outwardly", "she remains composed and respectful", "yet internally she feels discomfort and apprehension at interrupting bob\u2019s precious moment of vulnerability. her heart is heavy with the knowledge that personal feelings must always yield to the imperatives of duty", "leaving her with an unspoken sadness and anxiety over the collision of private reflection and public obligation."],
        ap.active_plans = ["Promptly inform Bob Russell of the urgent need to attend the Situation Room.", "Maintain the strict protocol required in political environments despite personal reservations.", "Ensure the smooth transition from a moment of private reflection to the broader demands of statecraft."],
        ap.beliefs = ["Duty to the state must always override personal sentiments.", "Protocol and order are fundamental to the stability of political operations.", "Respect for individual vulnerability is important, but it should not interfere with the demands of leadership."],
        ap.goals = ["Short-term: Successfully deliver the pressing message to Bob without causing further distraction.", "Medium-term: Help maintain the balance between the emotional well-being of staff and the operational requirements of state governance.", "Ultimate: Contribute to preserving the integrity and effectiveness of political leadership during moments of crisis."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blackberry_event_3_3'})
    ON CREATE SET
        oi.description = 'The BlackBerry serves as a pivotal communication conduit in this climactic moment, buzzing to announce breaking news that dramatically shifts the crisis narrative. It channels real-time information directly to C.J. Cregg, effectively bridging the gap between the unfolding diplomatic dialogue and the rapidly evolving media narrative. This device thus becomes a critical tool in the translation of raw data into actionable intelligence within the room.',
        oi.status_before = 'Before the event, the BlackBerry lay in a quiet standby mode, its secure interface ready but unalerted, maintaining its usual background role for routine communications.',
        oi.status_after = 'After the event, the BlackBerry is active and dynamic, having signaled the urgent breaking news. Its functional state elevates from background utility to a central narrative catalyst, underscoring its importance as the trigger for shifting the room\'s focus toward a personal and politically charged revelation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blackberry'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Viktor Petrov stands tall in the Mural Room with impeccable diplomatic posture. His measured movements, deliberate hand gestures, and unwavering gaze convey both authority and calm decisiveness. Every subtle tilt of his head and slight shift of weight underscores his carefully honed presence in this pivotal moment.',
        ap.emotional_state = 'Petrov projects cool determination and a refined confidence as he articulates Moscow\'s position. While his expression remains composed and controlled on the surface, internally he is strategically calculating every word, masking any trace of internal tension or hesitation to maintain his image as the consummate diplomat. There is a silent resolve in his eyes, counterbalanced by an acute awareness of the international implications of his declaration.',
        ap.emotional_tags = ["petrov projects cool determination", "a refined confidence as he articulates moscow's position. while his expression remains composed", "controlled on the surface, internally he is strategically calculating every word, masking any trace of internal tension or hesitation to maintain his image as the consummate diplomat. there is a silent resolve in his eyes, counterbalanced by an acute awareness of the international implications of his declaration.", "petrov projects cool determination and a refined confidence as he articulates moscow's position. while his expression remains composed and controlled on the surface", "internally he is strategically calculating every word", "masking any trace of internal tension or hesitation to maintain his image as the consummate diplomat. there is a silent resolve in his eyes", "counterbalanced by an acute awareness of the international implications of his declaration."],
        ap.active_plans = ["Assert Moscow\u2019s narrative by minimizing NATO\u2019s potential involvement.", "Control the diplomatic tone to preemptively disarm Western critiques.", "Reinforce Russia\u2019s geopolitical positioning through precise and measured articulation."],
        ap.beliefs = ["Diplomacy is the highest form of power.", "Sovereignty must be defended against external interference.", "Precision in communication is essential for sustaining international credibility."],
        ap.goals = ["Short-term: Command the room by delivering an authoritative, unyielding statement.", "Medium-term: Influence international opinion to view the crisis as an internal matter.", "Ultimate: Secure strategic advantage for Moscow in the broader geopolitical landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_3_2'})
    ON CREATE SET
        ap.current_status = 'President Bartlet steps deliberately forward in the Mural Room with measured authority, his posture rigid and commanding. His gaze is intense as he leans slightly forward to challenge the Ambassador’s claim. Every movement is calculated; his stance is firm and unwavering, his hands tightly clasped behind his back—a subtle but potent gesture of both restraint and resolve. His facial expressions betray the weight of his responsibilities as he voices a forceful inquiry that cuts through the diplomatic formalities.',
        ap.emotional_state = 'Bartlet’s emotional state is a complex blend of controlled indignation and deeply held concern. Outwardly, his expression is calm but unmistakably steeled by anger, visible in the slight clench of his jaw and focused eyes. Internally, he wrestles with a surge of frustration fueled by the moral and national implications of the crisis, and his inner turmoil is masked by the veneer of presidential composure. This tension between the visible calm and concealed anxiety underlines his relentless commitment to defending American values.',
        ap.emotional_tags = ["bartlet\u2019s emotional state is a complex blend of controlled indignation", "deeply held concern. outwardly, his expression is calm but unmistakably steeled by anger, visible in the slight clench of his jaw", "focused eyes. internally, he wrestles with a surge of frustration fueled by the moral", "national implications of the crisis,", "his inner turmoil is masked by the veneer of presidential composure. this tension between the visible calm", "concealed anxiety underlines his relentless commitment to defending american values.", "bartlet\u2019s emotional state is a complex blend of controlled indignation and deeply held concern. outwardly", "his expression is calm but unmistakably steeled by anger", "visible in the slight clench of his jaw and focused eyes. internally", "he wrestles with a surge of frustration fueled by the moral and national implications of the crisis", "and his inner turmoil is masked by the veneer of presidential composure. this tension between the visible calm and concealed anxiety underlines his relentless commitment to defending american values.", "bartlet\u2019s emotional state is a complex blend of controlled indignation and deeply held concern. outwardly, his expression is calm", "unmistakably steeled by anger, visible in the slight clench of his jaw and focused eyes. internally, he wrestles with a surge of frustration fueled by the moral and national implications of the crisis, and his inner turmoil is masked by the veneer of presidential composure. this tension between the visible calm and concealed anxiety underlines his relentless commitment to defending american values."],
        ap.active_plans = ["Challenge and dismantle the Ambassador\u2019s oversimplified narrative on the kidnapping.", "Assert the moral and national imperatives that demand a robust response.", "Set the stage for a broader strategic communication that reinforces Presidential accountability."],
        ap.beliefs = ["The security and dignity of American citizens are non-negotiable.", "Diplomatic rhetoric must not obscure the stark moral responsibilities of leadership.", "Transparency and accountability are essential in addressing national crises."],
        ap.goals = ["Short-term: Force a clear explanation from the Ambassador to expose any misrepresentation of facts.", "Medium-term: Reinforce the administration\u2019s commitment to protecting American interests.", "Ultimate: Preserve the integrity of national leadership and restore confidence in the government\u2019s handling of international crises."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'})
    ON CREATE SET
        ap.current_status = 'C.J. Cregg stands slightly aside near the doorway in the Mural Room, her posture both alert and measured. As the heated exchange unfolds, she briefly closes her eyes when her BlackBerry buzzes, her gesture a subtle signal of both hesitation and readiness. Her movements are precise, deliberately pausing to absorb the alert before stepping into her role as the bearer of breaking news.',
        ap.emotional_state = 'Outwardly, C.J. maintains her trademark calm and composed demeanor, her face a mask of professional neutrality even as her eyes betray a flicker of concern. Internally, however, she is acutely aware of the rising stakes, feeling a surge of anxiety and tension at the potential fallout. There is a subtle conflict between her disciplined exterior and the urgency she experiences, as the burden of delivering consequential information weighs on her mind.',
        ap.emotional_tags = ["outwardly, c.j. maintains her trademark calm", "composed demeanor, her face a mask of professional neutrality even as her eyes betray a flicker of concern. internally, however, she is acutely aware of the rising stakes, feeling a surge of anxiety", "tension at the potential fallout. there is a subtle conflict between her disciplined exterior", "the urgency she experiences, as the burden of delivering consequential information weighs on her mind.", "outwardly", "c.j. maintains her trademark calm and composed demeanor", "her face a mask of professional neutrality even as her eyes betray a flicker of concern. internally", "however", "she is acutely aware of the rising stakes", "feeling a surge of anxiety and tension at the potential fallout. there is a subtle conflict between her disciplined exterior and the urgency she experiences", "as the burden of delivering consequential information weighs on her mind."],
        ap.active_plans = ["Ensure the accuracy of the news being relayed amidst the unfolding crisis.", "Manage the information flow to prepare for the impending media scrutiny.", "Support the leadership by maintaining unwavering composure and clarity in communication."],
        ap.beliefs = ["Clear and accurate communication is essential during crises.", "Maintaining professional composure under pressure upholds the integrity of the administration.", "Every detail matters, and being informed is critical to effective response."],
        ap.goals = ["Short-term: Immediately alert the room about the critical detail concerning Amanda Dalton.", "Medium-term: Coordinate with colleagues to manage the media storm effectively.", "Ultimate: Uphold the integrity of the administration\u2019s communication and safeguard public trust."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_laptop_with_dual_documents_event_4_1'})
    ON CREATE SET
        oi.description = 'The laptop serves as a silent yet potent character in this scene, its glowing screen displaying two documents that starkly encapsulate contrasting messages of victory and tragedy. It acts as the focal point of Sam\'s creative crisis, symbolizing the dual nature of political narratives. The device is integral to the unfolding drama, providing the medium through which the exchange of ideas between poetic passion and measured restraint takes shape, and reinforcing the gravity of the moment.',
        oi.status_before = 'Before the event, the laptop was a reliable tool in Sam Seaborn’s arsenal, quietly supporting his work with clearly legible documents and functioning as a steady repository of his creative outputs.',
        oi.status_after = 'After the event, the laptop remains a silent witness to the emotional and intellectual battle being waged, its illuminated screen a testament to the ongoing struggle between artistic expression and the cold demands of political messaging, leaving its significance deepened by the transformative dialogue.'
    WITH oi
    MATCH (o:Object {uuid: 'object_laptop_with_dual_documents'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Sam Seaborn sits at his cluttered workstation in the windowless office, surrounded by crumpled papers and empty coffee cups. His posture is slumped but intent, as he hunches over the illuminated laptop screen displaying two distinct documents. His hands occasionally pause over the keyboard, and he runs them through his disheveled hair in a gesture that betrays both frustration and creative fervor.',
        ap.emotional_state = 'Outwardly, Sam appears reflective and pensive, his furrowed brow and hesitant tone communicating the weight of his inner conflict. Beneath that, however, burns a turbulent mix of idealism and despair, as he grapples with the challenge of crafting poetic language out of raw political violence. His quiet determination is intermingled with a profound vulnerability; he is torn between the urge to express deep emotion and the need to uphold his professional responsibilities.',
        ap.emotional_tags = ["outwardly, sam appears reflective", "pensive, his furrowed brow", "hesitant tone communicating the weight of his inner conflict. beneath that, however, burns a turbulent mix of idealism", "despair, as he grapples with the challenge of crafting poetic language out of raw political violence. his quiet determination is intermingled with a profound vulnerability; he is torn between the urge to express deep emotion", "the need to uphold his professional responsibilities.", "outwardly", "sam appears reflective and pensive", "his furrowed brow and hesitant tone communicating the weight of his inner conflict. beneath that", "however", "burns a turbulent mix of idealism and despair", "as he grapples with the challenge of crafting poetic language out of raw political violence. his quiet determination is intermingled with a profound vulnerability; he is torn between the urge to express deep emotion and the need to uphold his professional responsibilities.", "outwardly, sam appears reflective and pensive, his furrowed brow and hesitant tone communicating the weight of his inner conflict. beneath that, however, burns a turbulent mix of idealism and despair, as he grapples with the challenge of crafting poetic language out of raw political violence. his quiet determination is intermingled with a profound vulnerability", "he is torn between the urge to express deep emotion and the need to uphold his professional responsibilities."],
        ap.active_plans = ["Complete the dual drafts that encapsulate both victory and tragedy.", "Channel his inner turmoil into creating a narrative that resonates with the public.", "Reconcile his creative impulses with the political realities he must portray."],
        ap.beliefs = ["Art can and should transform the harsh realities of political violence into meaningful expression.", "The truth of political conflict must be conveyed with both passion and precision.", "Integrity in communication is essential even when facing moral ambiguity."],
        ap.goals = ["Short-term: Finalize the presidential address drafts that capture the duality of the crisis.", "Medium-term: Find a balanced voice that marries poetic expression with political responsibility.", "Ultimate: Establish himself as a force for moral clarity, even in the face of overwhelming political turbulence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Toby Ziegler stands in the doorway of the cramped, windowless office, his gaze fixed on Sam Seaborn as he works with intense focus. His posture is upright and reserved, the subtle set of his shoulders suggesting both concern and calm oversight. His presence is both grounding and protective, a quiet counterpoint to the turbulence unfolding within Sam.',
        ap.emotional_state = 'Exuding a composed exterior, Toby’s calm demeanor belies an inner landscape of worry and resolute determination. He projects a confident, measured calmness, yet internally he wrestles with the complexities of balancing creative ambition against the backdrop of political reality. His concern for Sam is laced with an unspoken commitment to uphold ethical boundaries, reflecting both empathy and the heavy burden of senior responsibility.',
        ap.emotional_tags = ["exuding a composed exterior, toby\u2019s calm demeanor belies an inner landscape of worry", "resolute determination. he projects a confident, measured calmness, yet internally he wrestles with the complexities of balancing creative ambition against the backdrop of political reality. his concern for sam is laced with an unspoken commitment to uphold ethical boundaries, reflecting both empathy", "the heavy burden of senior responsibility.", "exuding a composed exterior", "toby\u2019s calm demeanor belies an inner landscape of worry and resolute determination. he projects a confident", "measured calmness", "yet internally he wrestles with the complexities of balancing creative ambition against the backdrop of political reality. his concern for sam is laced with an unspoken commitment to uphold ethical boundaries", "reflecting both empathy and the heavy burden of senior responsibility."],
        ap.active_plans = ["Monitor Sam\u2019s progress and offer subtle guidance when needed.", "Advise on maintaining a balance between creative expression and political restraint.", "Ensure that the narrative being crafted aligns with their core messaging and ethical standards."],
        ap.beliefs = ["Restraint is a powerful form of expression in times of crisis.", "Political messaging must be infused with ethical responsibility.", "The duty to inform the public honestly requires a controlled and measured approach."],
        ap.goals = ["Short-term: Provide immediate support to Sam to help him harness his creative energy.", "Medium-term: Cultivate a narrative that both inspires and reassures the public.", "Ultimate: Uphold the integrity of their political discourse by ensuring that principles guide every decision."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Sam Seaborn sits deeply engrossed at his workstation in the dim, windowless office, surrounded by crumpled papers and empty coffee cups. He runs his hands through his disheveled hair and speaks with a raw intensity that underscores his internal struggle.',
        ap.emotional_state = 'Outwardly, Sam expresses a weary, almost resigned determination as he discusses the nature of tragedy with a hint of poetic frustration. Beneath his composed exterior, however, lies a storm of inner turmoil, haunted by memories of Rosslyn and the crushing weight of political violence. His inner conflict is palpable as he balances idealistic aspirations with the harsh realities of his responsibilities.',
        ap.emotional_tags = ["outwardly, sam expresses a weary, almost resigned determination as he discusses the nature of tragedy with a hint of poetic frustration. beneath his composed exterior, however, lies a storm of inner turmoil, haunted by memories of rosslyn", "the crushing weight of political violence. his inner conflict is palpable as he balances idealistic aspirations with the harsh realities of his responsibilities.", "outwardly", "sam expresses a weary", "almost resigned determination as he discusses the nature of tragedy with a hint of poetic frustration. beneath his composed exterior", "however", "lies a storm of inner turmoil", "haunted by memories of rosslyn and the crushing weight of political violence. his inner conflict is palpable as he balances idealistic aspirations with the harsh realities of his responsibilities."],
        ap.active_plans = ["Finalize both the victory and tragedy drafts for the presidential addresses.", "Convey the nuanced duality of political messaging to reconcile hope with harsh realism.", "Transform his personal emotional entanglements into a coherent narrative that validates their moral stance."],
        ap.beliefs = ["Art and poetry are essential in rendering the complexities of political violence and tragedy.", "Maintaining a moral high ground is vital even amid profound crisis.", "The creative process can serve as both a refuge and a tool for political truth."],
        ap.goals = ["Short-term: Complete the draft speeches to capture both sides of the story.", "Medium-term: Ensure the narrative effectively communicates the balance between idealism and pragmatism.", "Ultimate: Uphold the institution\u2019s identity as the 'good guys' while reconciling the unavoidable costs of moral leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Toby Ziegler stands in the doorway, his presence both observant and supportive as he watches over Sam. His posture is measured and grounded, exuding a quiet determination and care, as he serves as the steady counterbalance to the emotional intensity unfolding within the workspace.',
        ap.emotional_state = 'Toby exudes a calm, almost stoic exterior, yet his concerned gaze reveals a deeper empathy and internal conflict. He is subtly troubled by the emotional burden his colleague carries, feeling the weight of past crises and the challenge of reconciling idealism with political reality. His restrained demeanor belies the profound responsibility he carries as both a mentor and a guardian of their shared moral compass.',
        ap.emotional_tags = ["toby exudes a calm, almost stoic exterior, yet his concerned gaze reveals a deeper empathy", "internal conflict. he is subtly troubled by the emotional burden his colleague carries, feeling the weight of past crises", "the challenge of reconciling idealism with political reality. his restrained demeanor belies the profound responsibility he carries as both a mentor", "a guardian of their shared moral compass.", "toby exudes a calm", "almost stoic exterior", "yet his concerned gaze reveals a deeper empathy and internal conflict. he is subtly troubled by the emotional burden his colleague carries", "feeling the weight of past crises and the challenge of reconciling idealism with political reality. his restrained demeanor belies the profound responsibility he carries as both a mentor and a guardian of their shared moral compass."],
        ap.active_plans = ["Provide immediate emotional support and guidance to Sam amidst his inner turmoil.", "Advise on maintaining the necessary restraint in the tone and content of their communications.", "Bridge the gap between idealistic aspirations and the pragmatic demands of political messaging."],
        ap.beliefs = ["Restraint in expression is crucial in political leadership.", "Moral integrity must be preserved even when faced with harsh realities.", "True leadership involves quietly bearing the burden of difficult truths while guiding others through crisis."],
        ap.goals = ["Short-term: Offer constructive counsel to help Sam navigate his emotional and professional challenges.", "Medium-term: Ensure the final messages align with both the poetic ideals and the practical necessities of their work.", "Ultimate: Sustain the collective identity and moral purpose of their team amid ever-present political and personal challenges."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_resolute_desk_event_5_3'})
    ON CREATE SET
        oi.description = 'The Resolute Desk serves as the symbolic epicenter of authority in the Oval Office during this pivotal moment. It not only frames President Bartlet’s commanding stance but also underscores the weight of his decision-making. As Bartlet stands behind it, the desk becomes a silent witness to a transformative command for accountability, reflecting both the historical gravitas and contemporary challenges of leadership.',
        oi.status_before = 'Before the event, the desk exuded its long-established presence as a respected emblem of presidential power, meticulously maintained and constant in its authority.',
        oi.status_after = 'Following the event, the desk remains unchanged physically yet gains an enriched narrative resonance as it silently endures and testifies to a turning point in the unfolding political drama.'
    WITH oi
    MATCH (o:Object {uuid: 'object_resolute_desk'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Kate Harper bursts into the Oval Office with a brisk and assured gait, her step purposeful and unwavering. She navigates through a room thick with tension, her posture erect and her eyes scanning the assembly. Every movement is deliberate—a signal of both authority and urgency—as she cuts through the clutter of a high-stakes strategy session.',
        ap.emotional_state = 'On the surface, Kate’s expression is steely and calm, exuding the confidence of someone who has seen crises before. However, a closer look reveals a simmering urgency beneath that calm exterior; her focused eyes betray a measured anxiety about the fragile balance of security and vulnerability. Internally, she is driven by a deep commitment to truth and clarity, even as she navigates the pressure of delivering life-altering news in an atmosphere rife with emotional conflict.',
        ap.emotional_tags = ["on the surface, kate\u2019s expression is steely", "calm, exuding the confidence of someone who has seen crises before. however, a closer look reveals a simmering urgency beneath that calm exterior; her focused eyes betray a measured anxiety about the fragile balance of security", "vulnerability. internally, she is driven by a deep commitment to truth", "clarity, even as she navigates the pressure of delivering life-altering news in an atmosphere rife with emotional conflict.", "on the surface", "kate\u2019s expression is steely and calm", "exuding the confidence of someone who has seen crises before. however", "a closer look reveals a simmering urgency beneath that calm exterior; her focused eyes betray a measured anxiety about the fragile balance of security and vulnerability. internally", "she is driven by a deep commitment to truth and clarity", "even as she navigates the pressure of delivering life-altering news in an atmosphere rife with emotional conflict.", "on the surface, kate\u2019s expression is steely and calm, exuding the confidence of someone who has seen crises before. however, a closer look reveals a simmering urgency beneath that calm exterior", "her focused eyes betray a measured anxiety about the fragile balance of security and vulnerability. internally, she is driven by a deep commitment to truth and clarity, even as she navigates the pressure of delivering life-altering news in an atmosphere rife with emotional conflict."],
        ap.active_plans = ["Deliver the critical update about the secure hostages to immediately alleviate the crisis atmosphere.", "Redirect the focus of the Oval Office leadership to the effective resolution of the conflict.", "Ensure that the intelligence she provides becomes the catalyst for decisive and balanced next steps in the ongoing strategy."],
        ap.beliefs = ["Accuracy in reporting is paramount during crises.", "Direct, unambiguous communication is essential for effective leadership.", "Every crisis is managed best when truth guides action over panic."],
        ap.goals = ["Short-term: Calm the immediate tension in the room by confirming the hostages' safety.", "Medium-term: Reestablish trust in the crisis management process among the senior staff.", "Ultimate: Contribute to a broader resolution that upholds national security and integrity under immense pressure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Josh Lyman stands by the expansive Oval Office window, his gaze fixed on the relentless, streaming rain outside. His posture is tense yet controlled, as he leans slightly forward in quiet introspection. His hands are loosely positioned at his sides, betraying subtle gestures of internal agitation and reflective concern.',
        ap.emotional_state = 'Outwardly, Josh wears a troubled expression marked by apprehension as his eyes follow the falling rain, yet his face also conveys a deep internal conflict. Beneath his composed exterior lies an intense anxiety triggered by past crises and a guarded sorrow for nearly crossing ethical boundaries. This guarded duality combines lingering fear of moral compromise with a steady determination to learn from the experience, highlighting his internal struggle between duty and the personal cost of leadership.',
        ap.emotional_tags = ["outwardly, josh wears a troubled expression marked by apprehension as his eyes follow the falling rain, yet his face also conveys a deep internal conflict. beneath his composed exterior lies an intense anxiety triggered by past crises", "a guarded sorrow for nearly crossing ethical boundaries. this guarded duality combines lingering fear of moral compromise with a steady determination to learn from the experience, highlighting his internal struggle between duty", "the personal cost of leadership.", "outwardly", "josh wears a troubled expression marked by apprehension as his eyes follow the falling rain", "yet his face also conveys a deep internal conflict. beneath his composed exterior lies an intense anxiety triggered by past crises and a guarded sorrow for nearly crossing ethical boundaries. this guarded duality combines lingering fear of moral compromise with a steady determination to learn from the experience", "highlighting his internal struggle between duty and the personal cost of leadership."],
        ap.active_plans = ["Reassess the decision-making process to ensure future strategies remain ethically sound.", "Reflect critically on past near-misses to adjust ongoing policies amid national crisis.", "Strengthen his internal resolve to prevent success from inadvertently compromising core values."],
        ap.beliefs = ["The ethical means are as important as the ends in national decision-making.", "Leadership requires both courage and restraint, even during crises.", "Personal responsibility and integrity are non-negotiable in public service."],
        ap.goals = ["Short-term: Ground his emotions and focus on the immediate implications of the crisis.", "Medium-term: Influence policy adjustments that reinforce ethical governance.", "Ultimate: Ensure that national strategies never sacrifice moral principles for expediency."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Donna Moss moves quietly into the space beside Josh, her presence calm and deliberate amidst the charged atmosphere. Her steps are measured, and she glances at Josh with a blend of concern and professional composure. Standing close enough to offer support without imposing, her posture and gentle gestures reflect a readiness to provide both practical assistance and an empathetic ear.',
        ap.emotional_state = 'Donna externally projects a serene and supportive demeanor, displaying calm assurance despite the ongoing crisis. Internally, she wrestles with deep concern for Josh’s well-being and the heavy burden of the decision-making process unfolding around them. Her empathetic nature is intermingled with a steadfast commitment to maintaining clarity and balance, as she silently challenges the encroaching tension with quiet determination and personal resolve.',
        ap.emotional_tags = ["donna externally projects a serene", "supportive demeanor, displaying calm assurance despite the ongoing crisis. internally, she wrestles with deep concern for josh\u2019s well-being", "the heavy burden of the decision-making process unfolding around them. her empathetic nature is intermingled with a steadfast commitment to maintaining clarity", "balance, as she silently challenges the encroaching tension with quiet determination", "personal resolve.", "donna externally projects a serene and supportive demeanor", "displaying calm assurance despite the ongoing crisis. internally", "she wrestles with deep concern for josh\u2019s well-being and the heavy burden of the decision-making process unfolding around them. her empathetic nature is intermingled with a steadfast commitment to maintaining clarity and balance", "as she silently challenges the encroaching tension with quiet determination and personal resolve."],
        ap.active_plans = ["Offer genuine, non-intrusive support to help Josh navigate his inner turmoil.", "Serve as a stable, rational counterbalance to the intense emotions in the room.", "Provide timely reassurance and perspective during the critical aftermath of the crisis."],
        ap.beliefs = ["Compassion and empathy are essential even in high-pressure political situations.", "Maintaining moral clarity is crucial, regardless of the crisis at hand.", "A steady presence can help mitigate panic and guide collective decision-making."],
        ap.goals = ["Short-term: Comfort Josh and help alleviate his immediate anxiety.", "Medium-term: Stabilize the emotional climate of the senior staff during the crisis.", "Ultimate: Foster an environment where principled and empathetic leadership prevails."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Bartlet stands firmly behind the iconic Resolute Desk, his posture betraying both authority and underlying strain. His measured stance and deliberate gestures serve as a visual command for order as he surveys the room with steely eyes and a resolute set of his jaw.',
        ap.emotional_state = 'Outwardly, Bartlet masks his deep-seated tension with a calm, authoritative tone, yet beneath the surface he wrestles with inner turmoil and a cautious determination. His expression reveals a controlled fury and somber responsibility, as he balances personal doubts with the urgent need for decisive action.',
        ap.emotional_tags = ["outwardly, bartlet masks his deep-seated tension with a calm, authoritative tone, yet beneath the surface he wrestles with inner turmoil", "a cautious determination. his expression reveals a controlled fury", "somber responsibility, as he balances personal doubts with the urgent need for decisive action.", "outwardly", "bartlet masks his deep-seated tension with a calm", "authoritative tone", "yet beneath the surface he wrestles with inner turmoil and a cautious determination. his expression reveals a controlled fury and somber responsibility", "as he balances personal doubts with the urgent need for decisive action."],
        ap.active_plans = ["Instruct immediate communication with President Kovach to gather necessary updates.", "Summon bipartisan leadership to address the unfolding crisis in a transparent manner.", "Set the stage for public accountability by preparing to address the American people."],
        ap.beliefs = ["Maintaining transparency with the public is essential for democratic accountability.", "Decisive leadership in times of crisis is necessary to uphold national values.", "Moral responsibility and ethical integrity are the cornerstones of effective governance."],
        ap.goals = ["Short-term: Ensure crucial leaders are immediately contacted to manage the crisis.", "Medium-term: Stabilize the administration's response through bipartisanship and clear communication.", "Ultimate: Uphold the nation's trust and preserve the integrity of the presidency while never compromising core principles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Charlie stands at attentive readiness near the Resolute Desk, his posture alert and efficient. His calm demeanor complements his subtle movements as he listens intently to the President’s command, prepared to execute his orders with impeccable precision.',
        ap.emotional_state = 'Charlie displays a composed exterior peppered with an undercurrent of focused determination and loyalty. Though his face remains impassive, there is a flicker of tension as he internalizes the gravity of the directive, aware that every second counts in meeting the administration\'s high-stakes expectations.',
        ap.emotional_tags = ["charlie displays a composed exterior peppered with an undercurrent of focused determination", "loyalty. though his face remains impassive, there is a flicker of tension as he internalizes the gravity of the directive, aware that every second counts in meeting the administration's high-stakes expectations.", "charlie displays a composed exterior peppered with an undercurrent of focused determination and loyalty. though his face remains impassive", "there is a flicker of tension as he internalizes the gravity of the directive", "aware that every second counts in meeting the administration's high-stakes expectations."],
        ap.active_plans = ["Immediately contact President Kovach to relay the directive.", "Coordinate seamlessly with other staff to mobilize bipartisan leadership.", "Ensure that communication channels remain clear and effective throughout the crisis."],
        ap.beliefs = ["Discipline and commitment to duty are paramount in the highest echelons of leadership.", "Every member of the team plays a vital role in crisis management.", "Absolute loyalty to the President and integrity in executing orders are non-negotiable."],
        ap.goals = ["Short-term: Execute the direct order by swiftly contacting President Kovach.", "Medium-term: Facilitate smooth coordination among the leadership to address the crisis effectively.", "Ultimate: Maintain a reputation of unwavering professionalism and contribute decisively to the national effort."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
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
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_general_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_general_alexander_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cj_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one___fault_lines'})
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
MATCH (a:Agent {uuid: 'agent_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bartlet_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlie_young'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
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
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_3'})
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
