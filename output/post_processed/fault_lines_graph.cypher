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
MERGE (a:Agent {uuid: 'agent-josh_lyman'})
    ON CREATE SET
        a.name = 'Josh Lyman',
        a.title = 'Deputy Chief of Staff',
        a.description = 'Josh Lyman is the Deputy Chief of Staff at the White House, known for his strategic political acumen and sharp wit. He is deeply committed to the administration\'s policies, having a history marked by resilience after surviving an assassination attempt in Rosslyn. Josh often navigates the complex landscape of Washington politics with a focus on acting in the country\'s best interests, while grappling with the moral and strategic implications of political decisions.',
        a.traits = ["Passionate", "Reflective", "Dedicated", "Resilient", "Intense", "Witty", "Tenacious", "Political Acumen", "Loyal", "Strategic"],
        a.sphere_of_influence = 'Political Strategy'
    ;
MERGE (a:Agent {uuid: 'agent-nancy_mcnally'})
    ON CREATE SET
        a.name = 'Nancy McNally',
        a.title = 'National Security Advisor',
        a.description = 'Nancy McNally serves as the National Security Advisor, providing counsel on security-related matters and overseeing responses to international and domestic crises. She is recognized for her authoritative presence and expertise in handling complex security situations.',
        a.traits = ["Authoritative", "Knowledgeable", "Calm under pressure"],
        a.sphere_of_influence = 'National Security'
    ;
MERGE (a:Agent {uuid: 'agent-donna_moss'})
    ON CREATE SET
        a.name = 'Donna Moss',
        a.title = 'Senior Assistant',
        a.description = 'Donna Moss is a Senior Assistant to Deputy Chief of Staff Josh Lyman, known for her keen insights and understanding of White House operations. Her role often places her at the center of important political discussions and decisions. Donna maintains a strong working relationship with Josh, offering insights and support during critical moments. She demonstrates a high level of competence and dedication, balancing the demands of her role with a nuanced understanding of the political environment.',
        a.traits = ["Highly Competent", "Supportive", "Astute", "Responsible", "Loyal", "Insightful"],
        a.sphere_of_influence = 'Political Operations'
    ;
MERGE (a:Agent {uuid: 'agent-kate_harper'})
    ON CREATE SET
        a.name = 'Kate Harper',
        a.title = 'Deputy National Security Advisor',
        a.description = 'Kate Harper serves as the Deputy National Security Advisor, working closely with Nancy McNally. Her experience and intelligence make her a valuable asset in analyzing intelligence data and forming strategic responses to threats. She has a reputation for being efficient and direct, delivering critical information promptly and effectively, which aids in decision-making during crises.',
        a.traits = ["Proactive", "Efficient", "Direct", "Alert", "Reliable", "Resourceful", "Intelligent", "Analytical"],
        a.sphere_of_influence = 'Intelligence Analysis'
    ;
MERGE (a:Agent {uuid: 'agent-josiah_bartlet'})
    ON CREATE SET
        a.name = 'Josiah Bartlet',
        a.title = 'President of the United States',
        a.description = 'Josiah Bartlet is the President of the United States, characterized by his intellect, wit, and dedication to public service. He balances political goals with ethical considerations, showing intelligence and a sense of moral duty. Bartlet is known for his deep understanding of world issues and his commitment to public service, striving to balance diplomacy with decisive action, even when tensions run high. He demonstrates leadership and occasionally displays impatience with bureaucratic processes.',
        a.traits = ["Principled", "Decisive", "Intellectual", "Moral", "Diplomatic", "Leader", "Determined", "Witty", "Charismatic", "Intelligent", "Occasionally Impatient"],
        a.sphere_of_influence = 'Political Leadership'
    ;
MERGE (a:Agent {uuid: 'agent-leo_mcgarry'})
    ON CREATE SET
        a.name = 'Leo McGarry',
        a.title = 'White House Chief of Staff',
        a.description = 'Leo McGarry is the White House Chief of Staff, known for his wise counsel, strategic mind, and strong leadership. He plays a crucial role in shaping and implementing the administration\'s policies and in guiding President Bartlet. McGarry serves as a trusted advisor to the President and often mediates high-stakes situations with a calm demeanor, understanding the nuances of political negotiation.',
        a.traits = ["Experienced", "Diplomatic", "Wise", "Leadership", "Strategic", "Calm"],
        a.sphere_of_influence = 'Executive Management'
    ;
MERGE (a:Agent {uuid: 'agent-bob_russell'})
    ON CREATE SET
        a.name = 'Bob Russell',
        a.title = 'Vice President of the United States',
        a.description = 'Bob Russell is the Vice President of the United States, known for his carefully crafted political persona. He appears affable and calculating, without allowing emotions to generally influence his judgment. However, he demonstrates personal vulnerability and emotional connection to Amanda Dalton, his goddaughter, revealing a more personal side usually kept hidden.',
        a.traits = ["Affable", "Calculating", "Emotionally Reserved", "Loyal", "Politically Savvy"],
        a.sphere_of_influence = 'Politics'
    ;
MERGE (a:Agent {uuid: 'agent-amanda_dalton'})
    ON CREATE SET
        a.name = 'Amanda Dalton',
        a.title = 'None',
        a.description = 'Amanda Dalton is a USAID worker known for her dedication to rebuilding war-torn regions. She is the goddaughter of Vice President Bob Russell and has a significant emotional connection to him. Inspired by one of President Bartlet\'s speeches about America\'s role in preventing conflicts, she joined USAID to make a difference.',
        a.traits = ["Determined", "Dedicated", "Compassionate"],
        a.sphere_of_influence = 'International Aid'
    ;
MERGE (a:Agent {uuid: 'agent-margaret'})
    ON CREATE SET
        a.name = 'Margaret',
        a.title = 'Assistant',
        a.description = 'Margaret is an assistant who works closely with key political figures. She is shown to be professional and respectful but may feel uncomfortable in emotionally charged situations. Her presence in the Vice President\'s office during a moment of vulnerability highlights her role in maintaining the political decorum.',
        a.traits = ["Professional", "Respectful", "Discreet"],
        a.sphere_of_influence = 'Political Administration'
    ;
MERGE (a:Agent {uuid: 'agent-viktor_petrov'})
    ON CREATE SET
        a.name = 'Viktor Petrov',
        a.title = 'Ambassador',
        a.description = 'Viktor Petrov is a Russian Ambassador, characterized by his diplomatic demeanor and strong posturing while representing Moscow\'s positions on international matters. He maintains a perfect diplomatic posture and communicates with a sense of firm authority.',
        a.traits = ["Diplomatic", "Authoritative", "Composed", "Strategic"],
        a.sphere_of_influence = 'Diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent-c_j_cregg'})
    ON CREATE SET
        a.name = 'C.J. Cregg',
        a.title = 'White House Press Secretary',
        a.description = 'C.J. Cregg is the White House Press Secretary, tasked with managing media relations and navigating the complexities of public communication. She is adept at anticipating media reactions and remains alert to the implications of new developments.',
        a.traits = ["Composed", "Media-Savvy", "Strategic", "Perceptive"],
        a.sphere_of_influence = 'Media Relations'
    ;
MERGE (a:Agent {uuid: 'agent-sam_seaborn'})
    ON CREATE SET
        a.name = 'Sam Seaborn',
        a.title = 'Deputy Communications Director',
        a.description = 'Sam Seaborn is the Deputy Communications Director at the White House, renowned for his eloquent speechwriting and dedication to public service. He is characterized by his idealism and commitment to ethical governance, often driving him to produce speeches that inspire and unify. Sam is a close confidant and advisor to his colleagues, especially during times of crisis.',
        a.traits = ["Idealistic", "Eloquent", "Dedicated", "Empathetic", "Passionate", "Intelligent"],
        a.sphere_of_influence = 'Communications and Speechwriting'
    ;
MERGE (a:Agent {uuid: 'agent-toby_ziegler'})
    ON CREATE SET
        a.name = 'Toby Ziegler',
        a.title = 'Communications Director',
        a.description = 'Toby Ziegler is the Communications Director at the White House, known for his sharp intellect and moral integrity. As a seasoned political strategist and speechwriter, Toby is recognized for his pragmatic approach to the complex challenges of governance while ensuring that the administration maintains its ethical compass.',
        a.traits = ["Pragmatic", "Intelligent", "Integrity", "Morally Grounded", "Strategic", "Empathetic"],
        a.sphere_of_influence = 'Communications and Political Strategy'
    ;
MERGE (o:Object {uuid: 'object-lcd_screens'})
    ON CREATE SET
        o.name = 'LCD Screens',
        o.description = 'Multiple LCD screens positioned around the Situation Room, displaying satellite imagery of the Kosovo-Serbia border region.',
        o.purpose = 'To visualize satellite imagery for briefings.',
        o.significance = 'Provides visual context for the Kosovo-Serbia situation, highlighting the urgency and gravity of the crisis.'
    ;
MERGE (o:Object {uuid: 'object-scar_on_chest'})
    ON CREATE SET
        o.name = 'Scar on Chest',
        o.description = 'An old scar on Josh Lyman\'s chest, unconsciously rubbed by him during tense moments as a reminder of the past incident at Rosslyn.',
        o.purpose = 'A physical reminder of past trauma triggered during moments of stress.',
        o.significance = 'Symbolizes the lasting impact of past violence on Josh, serving as a psychological and narrative element of tension.'
    ;
MERGE (o:Object {uuid: 'object-framed_photograph'})
    ON CREATE SET
        o.name = 'Framed Photograph',
        o.description = 'A framed photograph of a younger Bob Russell teaching a young Amanda Dalton to fish at his lake house in Colorado.',
        o.purpose = 'To serve as a personal memento and reminder of Russell\'s bond with Amanda Dalton.',
        o.significance = 'Symbolizes the emotional stakes for Bob Russell in the USAID worker crisis, revealing his personal connection and the weight of his emotions beneath his political persona.'
    ;
MERGE (o:Object {uuid: 'object-desk_lamp'})
    ON CREATE SET
        o.name = 'Desk Lamp',
        o.description = 'A single desk lamp providing light in the otherwise darkened office of the Vice President.',
        o.purpose = 'To illuminate Bob Russell\'s immediate workspace.',
        o.significance = 'Highlights the solitude and introspection of Bob Russell during this emotional moment, contrasting the darkness of the room with the focus on his personal reflection.'
    ;
MERGE (o:Object {uuid: 'object-blackberry'})
    ON CREATE SET
        o.name = 'BlackBerry',
        o.description = 'A handheld device used by C.J. Cregg to receive news alerts during high-stakes situations.',
        o.purpose = 'To keep C.J. informed of breaking news and developments that could impact the President\'s administration.',
        o.significance = 'Symbolizes the fast-paced nature of media and communication, highlighting how quickly information can influence political actions and decisions.'
    ;
MERGE (o:Object {uuid: 'object-crumpled_paper'})
    ON CREATE SET
        o.name = 'Crumpled Paper',
        o.description = 'Sheets of paper scattered around Sam Seaborn, each crumpled from being discarded during the writing process.',
        o.purpose = 'To capture the failed drafts and ideas that didn\'t make it into the final speeches.',
        o.significance = 'Symbolizes the intense pressure and iterative nature of crafting a message for the President, reflecting the mental state and struggle of Sam Seaborn in addressing a delicate situation.'
    ;
MERGE (o:Object {uuid: 'object-empty_coffee_cups'})
    ON CREATE SET
        o.name = 'Empty Coffee Cups',
        o.description = 'Several empty coffee cups around Sam, evidence of long hours and sustained focus.',
        o.purpose = 'To provide caffeine and maintain alertness during the demanding task of drafting important speeches.',
        o.significance = 'Highlights the exhaustive mental effort and determination required in political crisis management.'
    ;
MERGE (o:Object {uuid: 'object-laptop'})
    ON CREATE SET
        o.name = 'Laptop',
        o.description = 'A laptop used by Sam Seaborn to draft two distinct speeches – one for a victorious outcome, another for tragedy.',
        o.purpose = 'To draft presidential speeches for both possible outcomes of the crisis involving USAID workers.',
        o.significance = 'Represents the dual nature of the political situation, requiring preparation for both triumph and disaster, capturing the ongoing tension within the administration.'
    ;
MERGE (o:Object {uuid: 'object-resolute_desk'})
    ON CREATE SET
        o.name = 'Resolute Desk',
        o.description = 'The iconic desk in the Oval Office behind which President Bartlet sits during the strategy session.',
        o.purpose = 'To serve as the President\'s workspace and a place from which he commands authority.',
        o.significance = 'Symbolizes presidential authority and the weight of the decisions being made by President Bartlet during the crisis.'
    ;
MERGE (o:Object {uuid: 'object-rain'})
    ON CREATE SET
        o.name = 'Rain',
        o.description = 'Rain streams down the windows of the Oval Office during the scene.',
        o.purpose = 'Acts as atmospheric backdrop, reinforcing the tension and somber mood of the ongoing crisis.',
        o.significance = 'Emphasizes the emotional weight and the contemplative nature of the moment as the staff processes the crisis\'s resolution.'
    ;
MERGE (l:Location {uuid: 'location-situation_room'})
    ON CREATE SET
        l.name = 'Situation Room',
        l.description = 'A dimly lit, high-security conference room within the White House, used for crisis management meetings. It is equipped with multiple LCD screens displaying critical intelligence data, such as satellite imagery of the Kosovo-Serbia border region. The room is characterized by its tense, urgent atmosphere and is typically occupied by senior government officials during times of national or international crisis.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-vice_presidents_office'})
    ON CREATE SET
        l.name = 'Vice President\'s Office',
        l.description = 'The stately office of the Vice President, featuring a dark ambiance except for a single desk lamp. It is a private space where Bob Russell contemplates a personal photograph, revealing raw emotion behind his political mask.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-mural_room'})
    ON CREATE SET
        l.name = 'Mural Room',
        l.description = 'An elegant room within the White House, used for meetings and diplomacy. The room features decorative murals and serves as a setting for crucial discussions, such as the one between President Bartlet and the Russian Ambassador. In scenes of diplomacy, the room becomes an arena for international dialogue, particularly during tense situations involving American aid workers.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})
    ON CREATE SET
        l.name = 'Steam Pipe Trunk Distribution Venue',
        l.description = 'A windowless office space filled with staff members amidst an atmosphere of tension and urgency. It contains remnants of intense work, such as crumpled papers and empty coffee cups, reflecting the pressure of ongoing crises. The space serves as a backdrop for significant discussions and emotional exchanges related to current events.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-oval_office'})
    ON CREATE SET
        l.name = 'Oval Office',
        l.description = 'The central office of the President of the United States, known for its distinct oval shape and historical significance. Streams of rainwater are visible on the windows. The space is currently occupied by senior staff engaged in a high-stakes strategy session, dealing with the aftermath of a recent crisis. The tense atmosphere reflects the profound decision-making that occurs here.',
        l.type = 'Office'
    ;
MERGE (o:Organization {uuid: 'org-serbian_paramilitary_group'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Group',
        o.description = 'A paramilitary organization claiming responsibility for attacks, including the attack on USAID workers.',
        o.sphere_of_influence = 'Serbia and areas affected by its armed groups.'
    ;
MERGE (o:Organization {uuid: 'org-usaid'})
    ON CREATE SET
        o.name = 'USAID',
        o.description = 'Responsible for administering civilian foreign aid and development assistance globally.',
        o.sphere_of_influence = 'Global humanitarian aid and development projects.'
    ;
MERGE (o:Organization {uuid: 'org-national_security_council'})
    ON CREATE SET
        o.name = 'National Security Council',
        o.description = 'Advises the President on national security and foreign policy matters.',
        o.sphere_of_influence = 'United States government and its foreign relations.'
    ;
MERGE (o:Organization {uuid: 'org-serbian_special_police_units'})
    ON CREATE SET
        o.name = 'Serbian Special Police Units',
        o.description = 'Responsible for high-stakes operations within Serbia, including securing compounds and resolving hostage situations.',
        o.sphere_of_influence = 'Serbia'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    ON CREATE SET
        ep.title = 'Episode One - Fault Lines',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene-1'})
    ON CREATE SET
        s.title = 'Pre-Dawn Crisis in the Situation Room',
        s.description = 'In the pre-dawn hours, the Situation Room is cast in its characteristic dim lighting as tense faces gather around LCD screens showing Kosovo-Serbia border imagery. Josh Lyman, already disheveled, joins National Security Advisor Nancy McNally as she relays the urgent situation: Four missing USAID workers at the Kosovo-Serbia border with a claim of responsibility from a Serbian paramilitary group. The paramilitary demands the release of commanders from The Hague. Intelligence points to Serbian security service involvement. President Bartlet enters with Leo McGarry and General Alexander, demanding available options with a grim demeanor, underscoring the gravity of the crisis.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location-situation_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Josh Lyman Enters Situation Room',
        e.description = 'Josh Lyman enters the Situation Room at the White House, appearing fatigued, with his tie already loosened. The room is dimly lit, and various LCD screens display satellite imagery of the Kosovo-Serbia border region.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Nancy McNally Briefs on Missing USAID Workers',
        e.description = 'National Security Advisor Nancy McNally briefs the attendees, stating that four USAID workers went missing three hours ago near the Kosovo-Serbia border while conducting post-conflict reconstruction assessments.',
        e.sequence = 2,
        e.key_dialogue = ["NANCY MCNALLY: Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'Donna Reports Serbian Paramilitary Claims',
        e.description = 'Donna Moss reports that a Serbian paramilitary group is claiming responsibility for the disappearance on social media and is demanding the release of three commanders held at The Hague.',
        e.sequence = 3,
        e.key_dialogue = ["DONNA: Serbian paramilitary group is claiming responsibility on social media. They're demanding the release of three commanders from The Hague."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'Kate Harper Reveals Intel on Serbian Support',
        e.description = 'Kate Harper states that intelligence suggests some elements within Serbian security services provided tactical support to the paramilitary group.',
        e.sequence = 4,
        e.key_dialogue = ["KATE HARPER: Our intelligence suggests elements within Serbian security services provided tactical support to the paramilitary group."]
    ;
MERGE (e:Event {uuid: 'event-1-5'})
    ON CREATE SET
        e.title = 'President Bartlet Enters and Asks for Options',
        e.description = 'President Josiah Bartlet enters the Situation Room, accompanied by Leo McGarry and General Alexander. The gravity of the situation is evident in Bartlet\'s demeanor as he asks for available options.',
        e.sequence = 5,
        e.key_dialogue = ["PRESIDENT BARTLET: Where are we on options?"]
    ;
MERGE (s:Scene {uuid: 'scene-2'})
    ON CREATE SET
        s.title = 'Russell Reflects Alone in the Vice President\'s Office',
        s.description = 'In the dimly lit Vice President\'s Office, Bob Russell sits alone, gazing at a photograph that reveals a personal connection to Amanda Dalton, a USAID worker in danger. His emotional vulnerability is exposed, juxtaposing his usual political facade. Margaret enters, informing him that he is needed in the Situation Room. Russell, reflecting on the influence of President Bartlet\'s speech on Amanda\'s career choice, composedly returns the photograph to his desk and reconstructs his political persona before departing.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_vice_presidents_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Bob Russell Reflects on Amanda Dalton\'s Inspiration',
        e.description = 'In the dimly lit Vice President\'s Office, Bob Russell is alone, reflecting on a framed photograph of a personal moment with Amanda Dalton. He reveals that Amanda joined USAID influenced by a speech from President Bartlet. This speech emphasized America\'s role in rebuilding war-torn regions. Margaret interrupts, reminding Russell of a meeting in the Situation Room.',
        e.sequence = 1,
        e.key_dialogue = ["RUSSELL: She joined USAID because of him, you know.", "MARGARET: Sir, they're waiting for you in the Situation Room.", "RUSSELL: Because of a speech Bartlet gave. About America's obligation to help rebuild war-torn regions. To prevent the next conflict before it starts."]
    ;
MERGE (s:Scene {uuid: 'scene-3'})
    ON CREATE SET
        s.title = 'Tense Diplomatic Exchange in the Mural Room',
        s.description = 'In the Mural Room, Russian Ambassador Viktor Petrov maintains a formal posture as he delivers Moscow\'s stance, asserting that the situation in Serbia is an internal matter, opposing NATO intervention. President Bartlet challenges this view, questioning the classification of the kidnapping of American aid workers as an internal issue. C.J. Cregg and Leo McGarry quietly observe from the doorway, noting Bartlet\'s visible signs of increasing tension. C.J.\'s BlackBerry alerts her to a breaking news story revealing Amanda Dalton\'s identity, signaling an impending media challenge.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location-mural_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Ambassador Petrov Delivers Moscow\'s Position',
        e.description = 'Ambassador Viktor Petrov stands in the Mural Room with perfect diplomatic posture as he communicates Moscow\'s stance on NATO\'s involvement, asserting that the situation in Serbia is an internal law enforcement matter.',
        e.sequence = 1,
        e.key_dialogue = ["This is, as we see it, an internal Serbian law enforcement matter. Any NATO intervention would constitute a serious violation of sovereign territory."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'President Bartlet Challenges the Ambassador',
        e.description = 'President Bartlet responds to Ambassador Petrov\'s statement, questioning how the kidnapping of American aid workers can be considered an internal Serbian matter.',
        e.sequence = 2,
        e.key_dialogue = ["Mr. Ambassador, would you care to explain how the kidnapping of American aid workers constitutes an internal matter?"]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'C.J. Receives Breaking News Alert',
        e.description = 'C.J.\'s BlackBerry buzzes with news alerts, and she informs President Bartlet that CNN is running with the story of Amanda Dalton\'s identity, indicating a looming media storm.',
        e.sequence = 3,
        e.key_dialogue = ["Sir, CNN is running with Amanda Dalton's identity."]
    ;
MERGE (s:Scene {uuid: 'scene-4'})
    ON CREATE SET
        s.title = 'Debating the Role of Poetry in Political Speeches',
        s.description = 'In the Steam Pipe Trunk Distribution Venue, Sam Seaborn is enveloped in the chaotic remnants of drafts and coffee cups, diligently working on two distinct speeches—one for a potential victory, the other for a tragedy. His colleague, Toby Ziegler, observes with a watchful concern as Sam grapples with the challenge of injecting poetry into the harsh realities of political violence. Sam\'s disheveled state reflects the pressure of the task, as he recalls Toby\'s earlier reflections on their moral compass—being the good guys. The exchange underscores the tension between their ideals and the harsh truths they must navigate.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Sam Seaborn Reflects on Tragedy and Political Violence',
        e.description = 'Sam Seaborn is seated in the Steam Pipe Trunk Distribution Venue, surrounded by crumpled paper and empty coffee cups, indicating a long, intense session of work. He\'s struggling with crafting speeches that capture the dual outcomes of victory and tragedy. Sam expresses his thoughts on the challenge of turning political violence into poetry. Toby Ziegler interjects with a perspective on restraint in such writings, emphasizing the importance of their work in sending aid workers to dangerous areas and rebuilding efforts.',
        e.sequence = 1,
        e.key_dialogue = ["SAM: The thing about tragedy is that it demands poetry. But how do you make poetry out of political violence?", "TOBY: Sometimes poetry is in the restraint. We need to remind people why we send aid workers into dangerous places. Why we try to rebuild what others have destroyed."]
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Sam Seaborn Recalls Toby\'s Words Post-Rosslyn',
        e.description = 'As the conversation progresses, Sam reflects on Toby\'s past words after the Rosslyn shooting incident, pondering their role as \'the good guys\' and the moral complexity of their decisions. Toby reassures him that they remain on the side of good, acknowledging the inherent difficulty of navigating such roles in the face of tragedy.',
        e.sequence = 2,
        e.key_dialogue = ["SAM: I keep thinking about what you said after Rosslyn. About how we're supposed to be the good guys.", "TOBY: We still are. That's why this is hard."]
    ;
MERGE (s:Scene {uuid: 'scene-5'})
    ON CREATE SET
        s.title = 'Relief and Reflection in the Oval Office',
        s.description = 'As rain streams down the windows, Kate Harper announces the safe rescue of hostages to the tense senior staff gathered in the Oval Office. Relief fills the room, but Josh Lyman remains troubled by the ethical implications of their potential actions. President Bartlet decides to address the high-stakes situation with political leaders, highlighting the fine line between justice and vengeance.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location-oval_office'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Kate Harper Reports the Hostage Situation Resolved',
        e.description = 'Kate Harper bursts into the Oval Office during a tense strategy session to announce that Serbian special police units have secured the compound and all hostages are safe. The relief is palpable among the senior staff present in the room.',
        e.sequence = 1,
        e.key_dialogue = ["KATE: Serbian special police units have secured the compound. All hostages are safe."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Josh Lyman Reflects on the Threat of Losing Hostages',
        e.description = 'Reflecting by a window, Josh Lyman shares his thoughts with Donna Moss about nearly losing the hostages. He understands the motivations for war and revenge when nations believe they\'ve lost everything. However, what scares him is achieving success in the wrong way rather than failure.',
        e.sequence = 2,
        e.key_dialogue = ["JOSH: For about twenty minutes there, when we thought we'd lost them... I understood why nations go to war. Why they abandon principles for revenge.", "DONNA: But we didn't.", "JOSH: That's what scares me. Not that we might have failed, but that we might have succeeded in the wrong way."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'President Bartlet Prepares to Address the Crisis',
        e.description = 'President Bartlet, still tense, instructs Charlie to contact President Kovach and the leadership of both parties. He emphasizes the importance of informing the American people about the severity of the recent crisis and identifying the parties responsible for bringing the nation close to a significant conflict.',
        e.sequence = 3,
        e.key_dialogue = ["PRESIDENT BARTLET: Charlie, get me President Kovach. And then the leadership of both parties. The American people deserve to know how close we came to the brink today - and who pushed us there."]
    ;
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (o:Organization {uuid: 'org-national_security_council'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (o:Organization {uuid: 'org-national_security_council'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-amanda_dalton'}),
          (o:Organization {uuid: 'org-usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-scar_on_chest'}),
          (a:Agent {uuid: 'agent-josh_lyman'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-framed_photograph'}),
          (a:Agent {uuid: 'agent-bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-blackberry'}),
          (a:Agent {uuid: 'agent-c_j_cregg'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-laptop'}),
          (a:Agent {uuid: 'agent-sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-amanda_dalton'}),
          (o:Organization {uuid: 'org-usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (o:Organization {uuid: 'org-national_security_council'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (o:Organization {uuid: 'org-national_security_council'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lcd_screens-event-1-1'})
    ON CREATE SET
        oi.description = 'The LCD screens display satellite imagery of the Kosovo-Serbia border region, providing visual context and geographical information vital to the briefing and analysis.',
        oi.status_before = 'The LCD screens were likely off or displaying different content prior to being utilized in this briefing.',
        oi.status_after = 'The LCD screens continue to display satellite imagery as a reference throughout the meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-scar_on_chest-event-1-1'})
    ON CREATE SET
        oi.description = 'Josh Lyman unconsciously rubs the old scar on his chest, a habitual response when situations become tense, adding a personal tension dynamic to the scene.',
        oi.status_before = 'The scar on Josh Lyman\'s chest was an old wound, inactive but a psychological marker of past trauma.',
        oi.status_after = 'The scar remains untouched and unchanged physically, but its presence underscores Josh\'s internal tension during the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-scar_on_chest'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lcd_screens-event-1-2'})
    ON CREATE SET
        oi.description = 'The LCD screens display satellite imagery of the Kosovo-Serbia border region, providing visual context for Nancy McNally\'s briefing about the missing USAID workers.',
        oi.status_before = 'The LCD screens are turned on, ready to display relevant imagery.',
        oi.status_after = 'The LCD screens continue to display satellite imagery as the discussion progresses.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-scar_on_chest-event-1-2'})
    ON CREATE SET
        oi.description = 'Josh Lyman unconsciously rubs the scar on his chest, which serves as a physical manifestation of his tension and anxiety during the briefing.',
        oi.status_before = 'The scar is present on Josh\'s chest, serving as a reminder of past trauma.',
        oi.status_after = 'The scar remains on Josh\'s chest, having acted as a tactile trigger for Josh\'s anxiety.'
    WITH oi
    MATCH (o:Object {uuid: 'object-scar_on_chest'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lcd_screens-event-1-3'})
    ON CREATE SET
        oi.description = 'The LCD screens in the Situation Room are displaying satellite imagery of the Kosovo-Serbia border region, providing visual aid for ongoing discussions about the disappearance of USAID workers.',
        oi.status_before = 'The LCD screens were likely powered on, ready to display relevant information as events unfolded.',
        oi.status_after = 'The LCD screens continue to display the satellite imagery during the briefing, highlighting the geographic context of the incident.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-scar_on_chest-event-1-3'})
    ON CREATE SET
        oi.description = 'Josh Lyman unconsciously rubs his old scar on his chest, a subconscious reaction to the tense situation described by Nancy McNally.',
        oi.status_before = 'Josh\'s scar was present and has become a habitual focal point during tense moments.',
        oi.status_after = 'The scar remains unchanged, as it continues to serve as a physical reminder of past trauma and tense scenarios.'
    WITH oi
    MATCH (o:Object {uuid: 'object-scar_on_chest'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lcd_screens-event-1-4'})
    ON CREATE SET
        oi.description = 'The LCD screens display satellite imagery of the Kosovo-Serbia border region, providing visual intelligence that supports the discussion about potential Serbian security service involvement.',
        oi.status_before = 'The LCD screens were likely displaying general information or inactive before the event began.',
        oi.status_after = 'The LCD screens are actively displaying satellite imagery relevant to the situation at the Kosovo-Serbia border.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-scar_on_chest-event-1-4'})
    ON CREATE SET
        oi.description = 'Josh Lyman unconsciously rubs the scar on his chest, reflecting his tension and anxiety during the serious discussion about the USAID workers who went dark.',
        oi.status_before = 'The scar on Josh\'s chest is a constant physical reminder, unchanged but psychologically impactful.',
        oi.status_after = 'The scar remains unchanged physically but symbolizes Josh\'s heightened emotional state during the tense Situation Room meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-scar_on_chest'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lcd_screens-event-1-5'})
    ON CREATE SET
        oi.description = 'The LCD screens display satellite imagery of the Kosovo-Serbia border region, providing visual context for the urgent discussion about the missing USAID workers.',
        oi.status_before = 'The LCD screens are operational and set to display relevant satellite data.',
        oi.status_after = 'The LCD screens continue to display satellite imagery, remaining a crucial source of visual information.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-scar_on_chest-event-1-5'})
    ON CREATE SET
        oi.description = 'Josh Lyman unconsciously rubs the scar on his chest, a reflexive gesture reflecting his anxiety about the precarious situation.',
        oi.status_before = 'The scar on Josh\'s chest is a permanent mark from a past incident, typically unnoticed.',
        oi.status_after = 'The scar remains unchanged but serves as a subtle emotional cue during high-stress moments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-scar_on_chest'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Entered the Situation Room, taking his seat and rubbing the scar on his chest.',
        ap.emotional_state = 'Fatigued and tense.',
        ap.emotional_tags = ["Fatigued", "tense."],
        ap.active_plans = ["Engage in situation assessment", "Monitor the unfolding situation regarding the USAID workers"],
        ap.beliefs = ["The situation is tense and requires careful handling", "His past experiences, represented by the scar, inform his perception of the gravity"],
        ap.goals = ["Collaborate with the team to determine a response strategy", "Contribute to securing the safe return of USAID workers"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Standing at the head of the table, updating on the loss of contact with USAID workers.',
        ap.emotional_state = 'Concerned but focused.',
        ap.emotional_tags = ["Concerned but focused."],
        ap.active_plans = ["Continue situation monitoring", "Coordinate with intelligence and security services"],
        ap.beliefs = ["Calm and decisive communication is crucial", "Immediate steps are necessary to address the crisis"],
        ap.goals = ["Provide the President with current information and options", "Facilitate a synchronized national response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Reporting on the Serbian paramilitary group’s social media claims.',
        ap.emotional_state = 'Alert and concerned.',
        ap.emotional_tags = ["Alert", "concerned."],
        ap.active_plans = ["Gather intelligence from social media channels", "Relay relevant information to the team"],
        ap.beliefs = ["Social media can provide vital clues", "Keeping the team informed is critical"],
        ap.goals = ["Aid in assessing the credibility and intent behind the paramilitary group\u2019s claims", "Support efforts in crafting a strategic response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Providing intel on Serbian security services\' possible involvement.',
        ap.emotional_state = 'Serious and analytical.',
        ap.emotional_tags = ["Serious", "analytical."],
        ap.active_plans = ["Analyze intelligence on involvement", "Advise on potential security service repercussions"],
        ap.beliefs = ["Understanding the various players is critical for an effective response", "Intel must be constantly reassessed for actionable insights"],
        ap.goals = ["Advise the President and team on strategic options", "Mitigate risks of further regional destabilization"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room with Leo McGarry and General Alexander, seeking updates and options.',
        ap.emotional_state = 'Grim and focused.',
        ap.emotional_tags = ["Grim", "focused."],
        ap.active_plans = ["Assess current options for the safety of USAID workers", "Lead the discussion on crisis management"],
        ap.beliefs = ["Presidential leadership is crucial in times of crisis", "A multi-faceted approach may be necessary"],
        ap.goals = ["Ensure timely and safe resolution of the hostage situation", "Exercise diplomatic and strategic options to stabilize the situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Accompanying President Bartlet, preparing to advise on options.',
        ap.emotional_state = 'Resolute and composed.',
        ap.emotional_tags = ["Resolute", "composed."],
        ap.active_plans = ["Support President Bartlet in strategic decision making", "Coordinate efforts across different departments"],
        ap.beliefs = ["Situational awareness is essential for effective counseling", "A coordinated approach will lead to the best outcome"],
        ap.goals = ["Help formulate a strong, decisive response", "Provide leadership and guidance to the team"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Briefing the attendees about the missing USAID workers.',
        ap.emotional_state = 'Concerned and authoritative.',
        ap.emotional_tags = ["Concerned", "authoritative."],
        ap.active_plans = ["Provide detailed briefing on the status of the missing workers."],
        ap.beliefs = ["Providing accurate intelligence is crucial for formulating a response."],
        ap.goals = ["Ensure all relevant parties understand the seriousness of the situation.", "Facilitate immediate and effective decision-making."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Listening to the briefing and reacting to the tense situation.',
        ap.emotional_state = 'Tense and reflective.',
        ap.emotional_tags = ["Tense", "reflective."],
        ap.active_plans = ["Stay informed about the situation as it develops."],
        ap.beliefs = ["Situations like these require careful handling and strategic communication."],
        ap.goals = ["Understand the implications of the briefing for potential further action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Informing the group about the Serbian paramilitary group\'s claim.',
        ap.emotional_state = 'Alert and proactive.',
        ap.emotional_tags = ["Alert", "proactive."],
        ap.active_plans = ["Monitor social media for additional statements or demands."],
        ap.beliefs = ["Monitoring external communications is key to understanding adversary motives."],
        ap.goals = ["Ensure that pertinent information is shared with decision-makers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Providing intelligence about the Serbian security services\' involvement.',
        ap.emotional_state = 'Focused and analytical.',
        ap.emotional_tags = ["Focused", "analytical."],
        ap.active_plans = ["Verify intelligence related to paramilitary group operations."],
        ap.beliefs = ["Intelligence analysis is crucial for understanding the paramilitary's support structure."],
        ap.goals = ["Enhance the group's awareness of potential security service involvement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Entering the room and seeking options for action.',
        ap.emotional_state = 'Serious and tasked-focused.',
        ap.emotional_tags = ["Serious", "tasked-focused."],
        ap.active_plans = ["Evaluate available options to address the situation."],
        ap.beliefs = ["Decisive action is necessary to manage the crisis."],
        ap.goals = ["Determine the most effective course of action regarding the missing workers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Accompanying President Bartlet and analyzing the situation.',
        ap.emotional_state = 'Concerned and strategic.',
        ap.emotional_tags = ["Concerned", "strategic."],
        ap.active_plans = ["Assist President Bartlet in evaluating response options."],
        ap.beliefs = ["Strong leadership and strategic planning are imperative in crisis situations."],
        ap.goals = ["Support the President in making informed decisions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Listening to the report about the USAID workers and the paramilitary group\'s demands.',
        ap.emotional_state = 'Tense and concerned, indicated by his habit of rubbing his chest scar.',
        ap.emotional_tags = ["Tense", "concerned, indicated by his habit of rubbing his chest scar."],
        ap.active_plans = ["Assess the situation and determine possible responses."],
        ap.beliefs = ["The paramilitary group's demands point to a complicated geopolitical tension."],
        ap.goals = ["Understand the situation fully to contribute to resolving the crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Briefing others on the disappearance of the USAID workers.',
        ap.emotional_state = 'Concerned and focused, maintaining her commanding presence.',
        ap.emotional_tags = ["Concerned", "focused, maintaining her comm", "ing presence."],
        ap.active_plans = ["Gather and present crucial intelligence to facilitate decision-making."],
        ap.beliefs = ["Decisive action is necessary in response to the paramilitary group\u2019s claims."],
        ap.goals = ["Maintain national security and ensure the safety of the missing USAID workers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Reporting on the paramilitary group\'s social media claims.',
        ap.emotional_state = 'Calm but aware of the seriousness of the situation.',
        ap.emotional_tags = ["Calm but aware of the seriousness of the situation."],
        ap.active_plans = ["Communicate available information efficiently."],
        ap.beliefs = ["Prompt information sharing is critical in crisis response."],
        ap.goals = ["Ensure that leaders have the latest updates to formulate a plan."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Providing intelligence on Serbian security services\' involvement.',
        ap.emotional_state = 'Serious and focused on delivering intelligence.',
        ap.emotional_tags = ["Serious", "focused on delivering intelligence."],
        ap.active_plans = ["Assess the reliability of intelligence regarding Serbian involvement."],
        ap.beliefs = ["The situation is complex and reliant on accurate intelligence."],
        ap.goals = ["Clarify the extent of tactical support provided to the paramilitary group."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Leading the briefing on the situation with the kidnapped USAID workers.',
        ap.emotional_state = 'Concerned and focused.',
        ap.emotional_tags = ["Concerned", "focused."],
        ap.active_plans = ["Assess intelligence reports regarding Serbian security involvement", "Coordinate with national security team for possible responses"],
        ap.beliefs = ["The safety of American citizens is paramount", "The influence of hostile elements in destabilizing regions must be controlled"],
        ap.goals = ["Recover the USAID workers safely", "Develop a strategy to counteract any further paramilitary threats"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Providing intelligence update linking Serbian security services to the paramilitary group.',
        ap.emotional_state = 'Informative and composed.',
        ap.emotional_tags = ["Informative", "composed."],
        ap.active_plans = ["Verify the credibility of intelligence linking Serbian security services to the paramilitary group", "Advise on intelligence-led response options"],
        ap.beliefs = ["Intel is crucial for informed decision making", "Interagency cooperation is critical for addressing complex international threats"],
        ap.goals = ["Ensure decision-makers have actionable intelligence", "Prevent escalation by understanding the adversary's support networks"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room and taking his seat.',
        ap.emotional_state = 'Tense but focused, indicated by rubbing his scar.',
        ap.emotional_tags = ["Tense but focused, indicated by rubbing his scar."],
        ap.active_plans = [],
        ap.beliefs = ["Significance of USAID workers' loss necessitates urgent focus testifying to high-stakes nature."],
        ap.goals = ["Understand the situation.", "Contribute to strategic response planning."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Standing at the head of the table, explaining the situation.',
        ap.emotional_state = 'Concerned and authoritative.',
        ap.emotional_tags = ["Concerned", "authoritative."],
        ap.active_plans = ["Provide detailed situation update.", "Facilitate discussion of potential actions."],
        ap.beliefs = ["USAID workers' safety is top priority.", "Need for coordination with President and advisors."],
        ap.goals = ["Develop actionable response strategies.", "Guide national security conversation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Contributing strategic intelligence on the situation.',
        ap.emotional_state = 'Calm but alert, signified by reporting intelligence findings.',
        ap.emotional_tags = ["Calm but alert, signified by reporting intelligence findings."],
        ap.active_plans = ["Analyze intelligence data regarding paramilitary support."],
        ap.beliefs = ["Existence of complicity within Serbian security services elevates risk."],
        ap.goals = ["Enhance situational awareness.", "Aid in crafting a targeted response."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room with Leo McGarry and General Alexander, asking for options.',
        ap.emotional_state = 'Grim and serious, devoid of typical intellectual playfulness.',
        ap.emotional_tags = ["Grim", "serious, devoid of typical intellectual playfulness."],
        ap.active_plans = ["Phrase initial inquiry to gauge status and options.", "Potentially authorize decisive action."],
        ap.beliefs = ["Immediate presidential intervention is critical.", "Complexity requires coordinated government response."],
        ap.goals = ["Assess all available options.", "Ensure safety and resolution for USAID workers."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-framed_photograph-event-2-1'})
    ON CREATE SET
        oi.description = 'Bob Russell reflects on the framed photograph of himself with Amanda Dalton as he reveals her motivation for joining USAID. This moment of vulnerability provides insight into his personal connection to the speech made by President Bartlet.',
        oi.status_before = 'The photograph was on Bob Russell\'s desk, likely serving as a personal reminder of his past and connection to Amanda Dalton.',
        oi.status_after = 'The photograph is placed carefully back on the desk by Bob Russell as he attempts to reconstruct his political persona.'
    WITH oi
    MATCH (o:Object {uuid: 'object-framed_photograph'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-desk_lamp-event-2-1'})
    ON CREATE SET
        oi.description = 'The desk lamp provides the only illumination in the Vice President\'s Office, creating a dim atmosphere that underscores Bob Russell\'s private reflection.',
        oi.status_before = 'The desk lamp was turned on, casting light on the framed photograph and Bob Russell.',
        oi.status_after = 'The desk lamp remains on, continuing to illuminate the room as Bob Russell is informed of the meeting in the Situation Room.'
    WITH oi
    MATCH (o:Object {uuid: 'object-desk_lamp'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-bob_russell-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Reflecting on a personal photograph and its significance.',
        ap.emotional_state = 'Vulnerable and introspective, shifting back to a political demeanor.',
        ap.emotional_tags = ["Vulnerable", "introspective, shifting back to a political demeanor."],
        ap.active_plans = ["Attend the meeting in the Situation Room"],
        ap.beliefs = ["America has an obligation to help rebuild war-torn regions"],
        ap.goals = ["Maintain his political persona", "Reflect on Amanda Dalton's career choice"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-margaret-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Informing Bob Russell about the meeting in the Situation Room.',
        ap.emotional_state = 'Uncomfortable witnessing Bob Russell\'s private moment.',
        ap.emotional_tags = ["Uncomfortable witnessing Bob Russell's private moment."],
        ap.active_plans = ["Ensure Bob Russell attends the meeting"],
        ap.beliefs = ["Professional duties require notifying Bob Russell of his obligations"],
        ap.goals = ["Prompt Bob Russell to attend the meeting"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-blackberry-event-3-1'})
    ON CREATE SET
        oi.description = 'C.J.\'s BlackBerry buzzes with news alerts regarding Amanda Dalton, affecting her emotional state and preparation for a media response.',
        oi.status_before = 'C.J.\'s BlackBerry is inactive and held by her.',
        oi.status_after = 'The BlackBerry is active, displaying news alerts, leading to C.J. closing her eyes to prepare for the news impact.'
    WITH oi
    MATCH (o:Object {uuid: 'object-blackberry'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-blackberry-event-3-2'})
    ON CREATE SET
        oi.description = 'C.J.\'s BlackBerry buzzes with news alerts, indicating that CNN is running with Amanda Dalton\'s identity, which adds immediate pressure to the situation and informs her reaction.',
        oi.status_before = 'The BlackBerry is in C.J.\'s possession, inactive, serving as her communication device.',
        oi.status_after = 'The BlackBerry buzzes with news alerts, indicating incoming information critical to the unfolding situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-blackberry'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-blackberry-event-3-3'})
    ON CREATE SET
        oi.description = 'C.J.\'s BlackBerry alerts her with news that CNN is running with Amanda Dalton\'s identity, indicating an impending media situation she needs to address.',
        oi.status_before = 'The BlackBerry is in C.J.\'s possession, idle and unalerted.',
        oi.status_after = 'The BlackBerry has alerted C.J. to a developing news story, prompting her response to the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-blackberry'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Standing with diplomatic posture, delivering Moscow\'s position.',
        ap.emotional_state = 'Calm, diplomatic.',
        ap.emotional_tags = ["Calm, diplomatic."],
        ap.active_plans = ["Communicate Moscow's stance that NATO intervention is a violation of sovereignty."],
        ap.beliefs = ["Serbia's situation is an internal law enforcement matter.", "NATO's involvement is unwarranted and unauthorized."],
        ap.goals = ["Dissuade NATO from intervening in Serbia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Questioning Ambassador Petrov about the kidnapping of American aid workers.',
        ap.emotional_state = 'Tense, challenging.',
        ap.emotional_tags = ["Tense, challenging."],
        ap.active_plans = ["Challenge the assertion that the situation is solely internal.", "Seek clarification on the kidnapping of American personnel."],
        ap.beliefs = ["The kidnapping involves international implications.", "The safety of American citizens is a priority."],
        ap.goals = ["Ensure safety of American aid workers.", "Address potential international legal violations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Observing the discussion, receiving news alerts on BlackBerry.',
        ap.emotional_state = 'Anxious, worried.',
        ap.emotional_tags = ["Anxious, worried."],
        ap.active_plans = ["Monitor media reports and prepare for potential media response."],
        ap.beliefs = ["Media coverage will impact public perception.", "It is crucial to manage the narrative actively."],
        ap.goals = ["Prepare a strategy to respond to the media storm.", "Protect the administration's position and credibility."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Observing the interaction, noting Bartlet\'s reactions.',
        ap.emotional_state = 'Vigilant, analytical.',
        ap.emotional_tags = ["Vigilant, analytical."],
        ap.active_plans = ["Assess potential diplomatic fallout.", "Support President Bartlet in countering Petrov's argument."],
        ap.beliefs = ["Leadership's response must be measured and strategic.", "Ensuring international stability is of utmost importance."],
        ap.goals = ["Aid Bartlet in diplomatic negotiations.", "Navigate diplomatic tensions effectively."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Delivering Moscow\'s position on the situation.',
        ap.emotional_state = 'Calm and composed, maintaining diplomatic posture.',
        ap.emotional_tags = ["Calm", "composed, maintaining diplomatic posture."],
        ap.active_plans = ["Affirm Moscow's stance regarding the issue as an internal matter."],
        ap.beliefs = ["NATO intervention would violate Serbian sovereignty."],
        ap.goals = ["Prevent international intervention in Serbian affairs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Questioning Ambassador Petrov on the presented stance.',
        ap.emotional_state = 'Assertive, subtly displaying frustration.',
        ap.emotional_tags = ["Assertive, subtly displaying frustration."],
        ap.active_plans = ["Challenge the notion that the kidnapping is an internal matter."],
        ap.beliefs = ["The safety of American citizens abroad is a priority."],
        ap.goals = ["Seek accountability for the kidnapping of American aid workers.", "Ensure responsible actions are taken to secure their release."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Receiving a news alert about media coverage.',
        ap.emotional_state = 'Anxious and preparing for media fallout.',
        ap.emotional_tags = ["Anxious", "preparing for media fallout."],
        ap.active_plans = ["Prepare for potential media response and increase in public scrutiny."],
        ap.beliefs = ["The media exposure will complicate diplomatic efforts."],
        ap.goals = ["Manage and mitigate the media narrative regarding Amanda Dalton."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Observing President Bartlet and the Ambassador\'s interaction.',
        ap.emotional_state = 'Focused and assessing the diplomatic situation.',
        ap.emotional_tags = ["Focused", "assessing the diplomatic situation."],
        ap.active_plans = ["Support President Bartlet's position during the discussion."],
        ap.beliefs = ["Diplomatic negotiation is crucial in managing the crisis."],
        ap.goals = ["Enhance the U.S. diplomatic position regarding the kidnapping."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Notifying President Bartlet about the CNN report concerning Amanda Dalton.',
        ap.emotional_state = 'Alert and concerned, preparing for media repercussions.',
        ap.emotional_tags = ["Alert", "concerned, preparing for media repercussions."],
        ap.active_plans = ["Inform President Bartlet about media developments", "Prepare to manage potential press inquiries"],
        ap.beliefs = ["Transparency with Bartlet is vital for effective crisis management", "Media's focus on Dalton's identity can escalate the situation"],
        ap.goals = ["Ensure the administration is aware of media implications", "Develop a response strategy for potential media fallout"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Receiving C.J.\'s update about the media\'s knowledge of Amanda Dalton\'s identity.',
        ap.emotional_state = 'Concerned and tense, aware of escalating diplomatic sensitivities.',
        ap.emotional_tags = ["Concerned", "tense, aware of escalating diplomatic sensitivities."],
        ap.active_plans = ["Engage in diplomatic dialogue with Ambassador Petrov", "Consider the implications of media exposure on diplomatic strategy"],
        ap.beliefs = ["Managing diplomatic relations is crucial amidst media scrutiny", "Need to balance public knowledge with diplomatic negotiations"],
        ap.goals = ["Maintain diplomatic control over the situation", "Navigate potential international backlash due to media exposure"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crumpled_paper-event-4-1'})
    ON CREATE SET
        oi.description = 'Crumpled paper surrounds Sam Seaborn, symbolizing the ongoing struggle and frustration he faces while attempting to articulate the dual outcomes of victory and tragedy in his speeches.',
        oi.status_before = 'The crumpled paper was scattered around Sam Seaborn, representing previous unsuccessful attempts at crafting speeches.',
        oi.status_after = 'The crumpled paper remains in the same scattered condition, reflecting Sam\'s continued attempts to perfect his writing.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crumpled_paper'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-empty_coffee_cups-event-4-1'})
    ON CREATE SET
        oi.description = 'Empty coffee cups depict the passing of time and the intensity of Sam\'s work session, indicating long hours spent in focus and determination.',
        oi.status_before = 'The empty coffee cups were present on the desk, indicating prolonged periods of work.',
        oi.status_after = 'The empty coffee cups remain on the desk as a testament to the effort and time invested in the speech-writing process.'
    WITH oi
    MATCH (o:Object {uuid: 'object-empty_coffee_cups'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-4-1'})
    ON CREATE SET
        oi.description = 'Sam Seaborn\'s laptop hosts two distinct documents that he is concurrently working on, highlighting the challenges of addressing both victory and tragedy in his speeches.',
        oi.status_before = 'The laptop was actively being used by Sam Seaborn to draft and revise his speeches.',
        oi.status_after = 'The laptop continues to display the work-in-progress documents, capturing Sam\'s ongoing efforts in crafting meaningful communications.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crumpled_paper-event-4-2'})
    ON CREATE SET
        oi.description = 'The crumpled paper surrounds Sam Seaborn\'s workspace, symbolizing his struggle with expressing the complexity of political violence and tragedy in words.',
        oi.status_before = 'The crumpled paper was scattered around Sam\'s workspace, representing discarded attempts at capturing the right words.',
        oi.status_after = 'The crumpled paper remains as a testament to Sam\'s continued attempts to articulate his thoughts, still unresolved.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crumpled_paper'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-empty_coffee_cups-event-4-2'})
    ON CREATE SET
        oi.description = 'The empty coffee cups indicate Sam Seaborn\'s prolonged efforts and his exhaustion as he tries to write two different documents to address an uncertain future.',
        oi.status_before = 'The coffee cups are empty, suggesting they\'ve been consumed in the process of a long work session.',
        oi.status_after = 'The empty coffee cups remain, symbolizing Sam\'s fatigue and continued effort.'
    WITH oi
    MATCH (o:Object {uuid: 'object-empty_coffee_cups'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-4-2'})
    ON CREATE SET
        oi.description = 'The laptop displays two documents, representing the divergent paths and emotional weight of triumph or tragedy that Sam is preparing for.',
        oi.status_before = 'The laptop is active, displaying two open documents.',
        oi.status_after = 'The laptop remains on with the documents open, reflecting Sam\'s engagement with the unpredictable events ahead.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Sitting at his desk, surrounded by crumpled paper and empty coffee cups, struggling to craft speeches.',
        ap.emotional_state = 'Frustrated and contemplative.',
        ap.emotional_tags = ["Frustrated", "contemplative."],
        ap.active_plans = ["Draft speeches that convey the dual themes of victory and tragedy", "Capture the essence of political events in a poetic manner"],
        ap.beliefs = ["Tragedy in political contexts demands a poetic approach", "Their work as speechwriters is crucial in framing political narratives"],
        ap.goals = ["Effectively communicate the necessity of sending aid workers into dangerous areas", "Balance the portrayal of victory and tragedy in political contexts"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway, observing and engaging with Sam.',
        ap.emotional_state = 'Reassuring and reflective.',
        ap.emotional_tags = ["Reassuring", "reflective."],
        ap.active_plans = ["Provide guidance and perspective to Sam", "Emphasize the importance of restraint in their speechwriting"],
        ap.beliefs = ["Restraint can embody poetry in political contexts", "Reinforcing the message of 'being the good guys' is vital"],
        ap.goals = ["Highlight the importance of their message in sending aid workers", "Support and mentor Sam through the speechwriting process"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Reflecting on Toby\'s past words and pondering the moral complexities in a politically charged environment.',
        ap.emotional_state = 'Struggling with disillusionment and seeking clarity.',
        ap.emotional_tags = ["Struggling with disillusionment", "seeking clarity."],
        ap.active_plans = ["Write a speech addressing both victory and tragedy."],
        ap.beliefs = ["Tragedy should be met with profound reflection.", "Their work is significant and morally directed towards aiding others."],
        ap.goals = ["Craft a speech that balances the gravity of tragedy with hope.", "Continue to affirm their position as the moral 'good guys'."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Providing reassurance and advice to Sam while reflecting on their roles.',
        ap.emotional_state = 'Empathic yet resolute.',
        ap.emotional_tags = ["Empathic yet resolute."],
        ap.active_plans = ["Encourage Sam to find poetry in restraint and moral clarity."],
        ap.beliefs = ["Despite challenges, they are working for a noble cause.", "It is essential to convey their ideals clearly to the public."],
        ap.goals = ["Support Sam in writing a meaningful speech.", "Reaffirm their commitment to moral leadership."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-rain-event-5-1'})
    ON CREATE SET
        oi.description = 'The rain streams down the windows of the Oval Office, setting a somber tone for the tense strategy session.',
        oi.status_before = 'The rain was falling outside, contributing to the somber atmosphere.',
        oi.status_after = 'The rain continues to fall, maintaining the somber mood as relief fills the room.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rain'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-resolute_desk-event-5-1'})
    ON CREATE SET
        oi.description = 'President Bartlet watches his staff from behind the Resolute Desk, which serves as a symbol of his authority during the tense strategy session.',
        oi.status_before = 'The Resolute Desk was in the Oval Office, representing presidential authority.',
        oi.status_after = 'The Resolute Desk remains in the Oval Office, continuing to symbolize leadership and decision-making.'
    WITH oi
    MATCH (o:Object {uuid: 'object-resolute_desk'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-rain-event-5-2'})
    ON CREATE SET
        oi.description = 'The rain streams down the windows of the Oval Office, setting a somber and tense tone for the scene as Josh reflects on the aftermath of the hostage situation.',
        oi.status_before = 'The rain was already falling, contributing to the tense atmosphere.',
        oi.status_after = 'The rain continues to fall, maintaining the somber mood following the revelation of the hostages\' safety.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rain'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-resolute_desk-event-5-2'})
    ON CREATE SET
        oi.description = 'President Bartlet stands behind the Resolute desk, directing the next steps in the strategy discussions following the news that hostages have been secured.',
        oi.status_before = 'The desk was in place as part of the Oval Office\'s furnishings.',
        oi.status_after = 'The Resolute desk remains in use as President Bartlet issues orders, symbolizing the authority and leadership in the aftermath of the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-resolute_desk'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-resolute_desk-event-5-3'})
    ON CREATE SET
        oi.description = 'President Bartlet remains seated behind the Resolute Desk, indicating his leadership and authority during the crisis. The desk serves as a physical representation of his role in communicating the gravity of the situation to the American people.',
        oi.status_before = 'The Resolute Desk is in the Oval Office, serving as President Bartlet\'s official workspace.',
        oi.status_after = 'The Resolute Desk continues to be in the Oval Office, symbolizing the seat of power and decision-making.'
    WITH oi
    MATCH (o:Object {uuid: 'object-resolute_desk'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-rain-event-5-3'})
    ON CREATE SET
        oi.description = 'The rain streams down the windows of the Oval Office, mirroring the tense atmosphere and reflecting the somber mood of the scene. It serves as a backdrop to the strategic meeting and the reflections of Josh Lyman.',
        oi.status_before = 'Rain is falling outside the Oval Office, creating a somber and tense atmosphere.',
        oi.status_after = 'Rain continues to fall outside, contributing to the mood and thematic tone of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rain'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Announcing the securing of the compound and safety of the hostages.',
        ap.emotional_state = 'Relieved and urgent.',
        ap.emotional_tags = ["Relieved", "urgent."],
        ap.active_plans = ["Report developments to senior staff"],
        ap.beliefs = ["Communicating critical information promptly is essential"],
        ap.goals = ["Ensure senior staff are updated on the situation", "Facilitate further strategic planning"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Reflecting on the events by the window, engaged in conversation with Donna.',
        ap.emotional_state = 'Troubled and introspective.',
        ap.emotional_tags = ["Troubled", "introspective."],
        ap.active_plans = ["Contemplate the implications of recent events"],
        ap.beliefs = ["Actions taken during crises can compromise principles"],
        ap.goals = ["Process the emotional and strategic complexities of the night's events", "Maintain ethical standards in governance"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Approaching Josh to provide reassurance.',
        ap.emotional_state = 'Reassuring and calm.',
        ap.emotional_tags = ["Reassuring", "calm."],
        ap.active_plans = ["Offer support to Josh"],
        ap.beliefs = ["Providing support and perspective is crucial during tense times"],
        ap.goals = ["Help Josh cope with the situation's aftermath", "Maintain a supportive work environment"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Observing the staff and preparing to address the American people.',
        ap.emotional_state = 'Relieved but still tense.',
        ap.emotional_tags = ["Relieved but still tense."],
        ap.active_plans = ["Contact President Kovach", "Engage with party leadership"],
        ap.beliefs = ["The American people need transparency about close calls in governance"],
        ap.goals = ["Communicate the gravity of the situation", "Strengthen diplomatic relationships"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Reflecting by the window, sharing thoughts with Donna about the situation.',
        ap.emotional_state = 'Troubled and introspective.',
        ap.emotional_tags = ["Troubled", "introspective."],
        ap.active_plans = ["Process the emotional impact of the near-loss", "Discuss the implications with Donna"],
        ap.beliefs = ["Nations abandon principles for revenge when they believe they've lost everything", "Success achieved in the wrong way is more frightening than failure"],
        ap.goals = ["Ensure future actions are grounded in principles", "Understand the motivations and implications of their decisions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Approaching Josh, engaging in discussion about the hostage situation.',
        ap.emotional_state = 'Reassuring but concerned.',
        ap.emotional_tags = ["Reassuring but concerned."],
        ap.active_plans = ["Engage with Josh's concerns", "Provide reassurance by highlighting the positive outcome"],
        ap.beliefs = ["The hostages' safe return is a relief", "Success, even if close to failure, is still success"],
        ap.goals = ["Support Josh emotionally", "Contribute to a balanced perspective on the situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Informing the staff about the successful completion of the operation by Serbian special police units.',
        ap.emotional_state = 'Relieved but still alert.',
        ap.emotional_tags = ["Relieved but still alert."],
        ap.active_plans = ["Monitor the situation for any further developments"],
        ap.beliefs = ["Ensuring the safety of hostages is the top priority", "Timely information is crucial in crisis management"],
        ap.goals = ["Keep senior staff and the President updated on security matters"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Reflecting by the window and contemplating the implications of the crisis.',
        ap.emotional_state = 'Troubled and contemplative.',
        ap.emotional_tags = ["Troubled", "contemplative."],
        ap.active_plans = ["Consider the political and ethical implications of recent decisions"],
        ap.beliefs = ["Success by compromising principles could be dangerous", "The methods by which goals are achieved matter as much as the outcomes"],
        ap.goals = ["Ensure future actions uphold the nation's principles", "Acknowledge and learn from near-crisis experiences"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Consoling Josh and prompting him to reflect on the crisis\'s avoidance.',
        ap.emotional_state = 'Reassuring but concerned for Josh.',
        ap.emotional_tags = ["Reassuring but concerned for Josh."],
        ap.active_plans = ["Support Josh emotionally", "Encourage collective reflection on the crisis"],
        ap.beliefs = ["It is important to focus on the positive outcome", "Reflecting on the implications helps in understanding broader contexts"],
        ap.goals = ["Promote a reflective and balanced perspective", "Aid in maintaining morale post-crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Instructing Charlie to contact world leaders and party leadership.',
        ap.emotional_state = 'Tense and resolute.',
        ap.emotional_tags = ["Tense", "resolute."],
        ap.active_plans = ["Communicate with President Kovach and political leadership", "Inform the nation about the crisis and responsible parties"],
        ap.beliefs = ["Transparency with the American public is crucial", "Leadership requires confronting uncomfortable truths"],
        ap.goals = ["Explain the severity of the crisis to the public", "Hold accountable those responsible for the near-conflict"]
    ;
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Location {uuid: 'location-situation_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-1'}),
          (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-5'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-nancy_mcnally-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Location {uuid: 'location_vice_presidents_office'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-2'}),
          (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-bob_russell-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-bob_russell-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-margaret-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-margaret-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Location {uuid: 'location-mural_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-3'}),
          (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-c_j_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-viktor_petrov-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-c_j_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-leo_mcgarry-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-c_j_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-c_j_cregg-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-4'}),
          (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sam_seaborn-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-toby_ziegler-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-5'}),
          (b:Location {uuid: 'location-oval_office'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-5'}),
          (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-kate_harper-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josh_lyman-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-donna_moss-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-josiah_bartlet-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
