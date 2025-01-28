DROP INDEX scene_uuid IF EXISTS;
DROP INDEX event_uuid IF EXISTS;
DROP INDEX agent_uuid IF EXISTS;
DROP INDEX object_uuid IF EXISTS;
DROP INDEX agent_participation_uuid IF EXISTS;
DROP INDEX object_involvement_uuid IF EXISTS;
DROP INDEX organization_uuid IF EXISTS;
DROP INDEX location_uuid IF EXISTS;
DROP CONSTRAINT agent_uuid_unique IF EXISTS;
DROP CONSTRAINT event_uuid_unique IF EXISTS;
DROP CONSTRAINT scene_uuid_unique IF EXISTS;
DROP CONSTRAINT object_uuid_unique IF EXISTS;
DROP CONSTRAINT location_uuid_unique IF EXISTS;
DROP CONSTRAINT organization_uuid_unique IF EXISTS;
DROP CONSTRAINT agent_participation_uuid_unique IF EXISTS;
DROP CONSTRAINT object_involvement_uuid_unique IF EXISTS;
CREATE CONSTRAINT agent_uuid_unique IF NOT EXISTS FOR (a:Agent) REQUIRE a.uuid IS UNIQUE;
CREATE CONSTRAINT event_uuid_unique IF NOT EXISTS FOR (e:Event) REQUIRE e.uuid IS UNIQUE;
CREATE CONSTRAINT scene_uuid_unique IF NOT EXISTS FOR (s:Scene) REQUIRE s.uuid IS UNIQUE;
CREATE CONSTRAINT object_uuid_unique IF NOT EXISTS FOR (o:Object) REQUIRE o.uuid IS UNIQUE;
CREATE CONSTRAINT location_uuid_unique IF NOT EXISTS FOR (l:Location) REQUIRE l.uuid IS UNIQUE;
CREATE CONSTRAINT organization_uuid_unique IF NOT EXISTS FOR (org:Organization) REQUIRE org.uuid IS UNIQUE;
CREATE CONSTRAINT agent_participation_uuid_unique IF NOT EXISTS FOR (ap:AgentParticipation) REQUIRE ap.uuid IS UNIQUE;
CREATE CONSTRAINT object_involvement_uuid_unique IF NOT EXISTS FOR (oi:ObjectInvolvement) REQUIRE oi.uuid IS UNIQUE;
CREATE INDEX scene_uuid IF NOT EXISTS FOR (s:Scene) ON (s.uuid);
CREATE INDEX event_uuid IF NOT EXISTS FOR (e:Event) ON (e.uuid);
CREATE INDEX agent_uuid IF NOT EXISTS FOR (a:Agent) ON (a.uuid);
CREATE INDEX object_uuid IF NOT EXISTS FOR (o:Object) ON (o.uuid);
CREATE INDEX agent_participation_uuid IF NOT EXISTS FOR (ap:AgentParticipation) ON (ap.uuid);
CREATE INDEX object_involvement_uuid IF NOT EXISTS FOR (oi:ObjectInvolvement) ON (oi.uuid);
CREATE INDEX organization_uuid IF NOT EXISTS FOR (org:Organization) ON (org.uuid);
CREATE INDEX location_uuid IF NOT EXISTS FOR (l:Location) ON (l.uuid);
MATCH (n) DETACH DELETE n;
MERGE (a:Agent {uuid: 'agent-josh_lyman'})
    ON CREATE SET
        a.name = 'Josh Lyman',
        a.title = 'Deputy Chief of Staff',
        a.description = 'Josh Lyman is the Deputy Chief of Staff at the White House, known for his fervent dedication to his work and the political process. Since the Rosslyn attack, he has been dealing with the psychological aftermath, which manifests in physical habits like rubbing a scar on his chest during tense situations.',
        a.traits = ["Reflective", "Driven", "Political", "Dedicated"],
        a.sphere_of_influence = 'Political Strategy'
    ;
MERGE (a:Agent {uuid: 'agent-nancy_mcnally'})
    ON CREATE SET
        a.name = 'Nancy McNally',
        a.title = 'National Security Advisor',
        a.description = 'Nancy McNally is the National Security Advisor with a commanding presence. She is responsible for advising the President on national security matters, often seen addressing the senior staff during critical situations.',
        a.traits = ["Commanding", "Knowledgeable", "Concerned"],
        a.sphere_of_influence = 'National Security'
    ;
MERGE (a:Agent {uuid: 'agent-donna_moss'})
    ON CREATE SET
        a.name = 'Donna Moss',
        a.title = 'Assistant to Deputy Chief of Staff',
        a.description = 'Donna Moss is Josh Lyman\'s assistant, characterized by her perceptive and supportive nature. She plays a key role in understanding Josh\'s needs and is skilled at navigating the complexities of the political environment.',
        a.traits = ["Supportive", "Perceptive", "Skilled"],
        a.sphere_of_influence = 'Executive Support'
    ;
MERGE (a:Agent {uuid: 'agent-kate_harper'})
    ON CREATE SET
        a.name = 'Kate Harper',
        a.title = 'Deputy National Security Advisor',
        a.description = 'Kate Harper serves as the Deputy National Security Advisor, involved in gathering intelligence and providing insights from various global security dynamics. She often works closely with Nancy McNally and other senior staff.',
        a.traits = ["Intelligent", "Insightful", "Resourceful"],
        a.sphere_of_influence = 'Intelligence Analysis'
    ;
MERGE (a:Agent {uuid: 'agent-josiah_jed_bartlet'})
    ON CREATE SET
        a.name = 'Josiah \'Jed\' Bartlet',
        a.title = 'President of the United States',
        a.description = 'Josiah \'Jed\' Bartlet is the President of the United States, known for his intellectual prowess and diplomatic leadership. He is deeply engaged in handling national crises and is respected by his senior staff.',
        a.traits = ["Diplomatic", "Leader", "Intellectual"],
        a.sphere_of_influence = 'Executive Leadership'
    ;
MERGE (a:Agent {uuid: 'agent-leo_mcgarry'})
    ON CREATE SET
        a.name = 'Leo McGarry',
        a.title = 'White House Chief of Staff',
        a.description = 'Leo McGarry is the White House Chief of Staff, a key advisor and supporter of President Bartlet, known for his strategic thinking and loyalty.',
        a.traits = ["Strategic", "Loyal", "Leader"],
        a.sphere_of_influence = 'Executive Strategy'
    ;
MERGE (a:Agent {uuid: 'agent-alexander'})
    ON CREATE SET
        a.name = 'General Alexander',
        a.title = 'None',
        a.description = 'General Alexander is a military leader involved with the national security operations discussed in the briefing room, closely working with the President and the National Security team.',
        a.traits = ["Military", "Authoritative"],
        a.sphere_of_influence = 'Military Operations'
    ;
MERGE (a:Agent {uuid: 'agent-bob_russell'})
    ON CREATE SET
        a.name = 'Bob Russell',
        a.title = 'Vice President of the United States',
        a.description = 'Bob Russell is the Vice President of the United States. He is characterized by his affable and calculating political persona, which he carefully maintains. However, he displays genuine emotion when contemplating personal connections, such as his goddaughter Amanda Dalton, whose life was in danger. He has shaped his political career by adhering to a balanced persona, ensuring that it does not give room for emotions to affect his judgments.',
        a.traits = ["Affable", "Emotional", "Politically Savvy", "Calculating"],
        a.sphere_of_influence = 'Executive Leadership'
    ;
MERGE (a:Agent {uuid: 'agent-margaret'})
    ON CREATE SET
        a.name = 'Margaret',
        a.title = 'None',
        a.description = 'Margaret is an assistant within the White House staff environment, likely involved in administrative or support functions. Her presence in situations requiring decorum and privacy indicates a trusted position, and she often manages the interstitial moments of significant events.',
        a.traits = ["Professional", "Discreet", "Efficient"],
        a.sphere_of_influence = 'Executive Support'
    ;
MERGE (a:Agent {uuid: 'agent-viktor_petrov'})
    ON CREATE SET
        a.name = 'Viktor Petrov',
        a.title = 'Russian Ambassador',
        a.description = 'Viktor Petrov is the Russian Ambassador, known for his diplomatic posture and firm stance in representing Moscow\'s position. He is involved in the international dialogue surrounding the crisis involving American aid workers.',
        a.traits = ["Diplomatic", "Posturing", "Firm"],
        a.sphere_of_influence = 'Diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent-cj_cregg'})
    ON CREATE SET
        a.name = 'C.J. Cregg',
        a.title = 'White House Press Secretary',
        a.description = 'C.J. Cregg is the White House Press Secretary, responsible for communicating the administration\'s perspective to the media and public. She is known for her sharp wit, communication skills, and ability to handle media storms.',
        a.traits = ["Witty", "PR Skilled", "Articulate"],
        a.sphere_of_influence = 'Public Relations'
    ;
MERGE (a:Agent {uuid: 'agent-sam_seaborn'})
    ON CREATE SET
        a.name = 'Sam Seaborn',
        a.title = 'Deputy White House Communications Director',
        a.description = 'Sam Seaborn is the Deputy White House Communications Director, known for his eloquent speechwriting and dedication to the administration\'s ideals. He often grapples with articulating the moral complexities of political events, showing a deep commitment to portraying the White House as \'the good guys\'.',
        a.traits = ["Reflective", "Eloquent", "Idealistic", "Dedicated"],
        a.sphere_of_influence = 'Communications'
    ;
MERGE (a:Agent {uuid: 'agent-toby_ziegler'})
    ON CREATE SET
        a.name = 'Toby Ziegler',
        a.title = 'White House Communications Director',
        a.description = 'Toby Ziegler is the White House Communications Director, known for his wisdom and ability to craft compelling messages. He acts as a mentor to Sam Seaborn, guiding him through the challenges of communicating during a national crisis.',
        a.traits = ["Mentor", "Wise", "Articulate", "Thoughtful"],
        a.sphere_of_influence = 'Communications'
    ;
MERGE (a:Agent {uuid: 'agent-charlie_young'})
    ON CREATE SET
        a.name = 'Charlie Young',
        a.title = 'Personal Aide to the President',
        a.description = 'Charlie Young serves as the Personal Aide to President Bartlet, known for his loyalty and efficiency in handling presidential duties and communication.',
        a.traits = ["Reliable", "Loyal", "Efficient"],
        a.sphere_of_influence = 'Executive Support'
    ;
MERGE (a:Agent {uuid: 'agent-amanda_dalton'})
    ON CREATE SET
        a.name = 'Amanda Dalton',
        a.title = 'None',
        a.description = 'Amanda Dalton is the goddaughter of Vice President Bob Russell and an aid worker who was kidnapped near the Kosovo-Serbia border. Her connection to the Vice President and her situation have drawn significant political attention.',
        a.traits = ["Experienced", "Determined", "Connected"],
        a.sphere_of_influence = 'International Aid'
    ;
MERGE (o:Object {uuid: 'object-lcd_screens'})
    ON CREATE SET
        o.name = 'LCD Screens',
        o.description = 'Large, high-definition screens positioned around the Situation Room used to display real-time data and information relevant to national security issues.',
        o.purpose = 'To visualize satellite imagery and other critical information for senior staff briefings.',
        o.significance = 'Provides visual context and geographic intelligence for the ongoing crisis at the Kosovo-Serbia border.'
    ;
MERGE (o:Object {uuid: 'object-framed_photograph'})
    ON CREATE SET
        o.name = 'Framed Photograph',
        o.description = 'A framed photograph depicting a younger Bob Russell teaching Amanda Dalton to fish at his Colorado lake house.',
        o.purpose = 'To serve as a personal reminder of the bond and history between Bob Russell and Amanda Dalton.',
        o.significance = 'The photograph symbolizes Russell\'s deep personal connection to Amanda and highlights the emotional impact of the crisis on him, revealing his vulnerability.'
    ;
MERGE (o:Object {uuid: 'object-desk_lamp'})
    ON CREATE SET
        o.name = 'Desk Lamp',
        o.description = 'A single desk lamp illuminating the Office of the Vice President in the otherwise dark room.',
        o.purpose = 'To provide lighting for Bob Russell as he sits in contemplation.',
        o.significance = 'The solitary desk lamp underscores the isolation and introspective moment of Bob Russell as he reflects on personal and political matters.'
    ;
MERGE (o:Object {uuid: 'object-blackberry'})
    ON CREATE SET
        o.name = 'BlackBerry',
        o.description = 'A mobile communication device used for sending and receiving messages, commonly used for business communications.',
        o.purpose = 'To provide C.J. with news alerts and messages relevant to her role as White House Press Secretary.',
        o.significance = 'It represents the constant flow of information and the pressure on White House staff to respond quickly to media developments.'
    ;
MERGE (o:Object {uuid: 'object-crumpled_paper'})
    ON CREATE SET
        o.name = 'Crumpled Paper',
        o.description = 'Sheets of paper that have been discarded or crumpled, indicating intense drafting and editing work.',
        o.purpose = 'To serve as drafts or notes for Sam Seaborn\'s writing of the presidential speeches.',
        o.significance = 'Symbolizes the chaotic and intense effort involved in articulating responses to both potential outcomes of the crisis.'
    ;
MERGE (o:Object {uuid: 'object-empty_coffee_cups'})
    ON CREATE SET
        o.name = 'Empty Coffee Cups',
        o.description = 'Coffee cups surrounding Sam, indicating his need for caffeine during intense work sessions.',
        o.purpose = 'To provide caffeine and maintain alertness as Sam works on critical speeches.',
        o.significance = 'Reflects the high-stress and exhaustive nature of working in the White House during a crisis.'
    ;
MERGE (o:Object {uuid: 'object-laptop'})
    ON CREATE SET
        o.name = 'Laptop',
        o.description = 'The laptop is being used by Sam Seaborn to draft two alternative presidential speeches: one for victory, one for tragedy.',
        o.purpose = 'To create and modify documents, specifically the speeches for both potential outcomes of the hostage situation.',
        o.significance = 'Crucial tool for crafting presidential communications that shape public perception and policy.'
    ;
MERGE (o:Object {uuid: 'object-resolute_desk'})
    ON CREATE SET
        o.name = 'Resolute Desk',
        o.description = 'A large, wooden desk located in the Oval Office, historically used by U.S. Presidents for official duties.',
        o.purpose = 'To serve as the President\'s workspace for conducting day-to-day affairs and important meetings.',
        o.significance = 'Symbolizes the power and responsibilities of the Presidency, providing a backdrop for critical decision-making.'
    ;
MERGE (o:Object {uuid: 'object-windows'})
    ON CREATE SET
        o.name = 'Windows',
        o.description = 'Windows in the Oval Office that allow outside elements, like rain, to be visible from the inside.',
        o.purpose = 'To provide natural light and a view, creating an atmosphere of openness and connection with the outside world.',
        o.significance = 'Serves as a symbolic connection between the internal presidential space and the broader landscape of governance, highlighted during moments of reflection.'
    ;
MERGE (l:Location {uuid: 'location-white_house-situation_room'})
    ON CREATE SET
        l.name = 'White House Situation Room',
        l.description = 'A secure meeting room within the White House used for crisis management and national security discussions. Characteristically dim lighting casts shadows, and multiple LCD screens display critical information, enhancing its atmosphere of urgency and focus.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-kosovo_serbia_border'})
    ON CREATE SET
        l.name = 'Kosovo-Serbia Border',
        l.description = 'The border region between Kosovo and Serbia, an area subject to tensions and conflict. In the context of this scene, it\'s the site near which USAID workers were conducting post-conflict reconstruction assessments.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location-the_hague'})
    ON CREATE SET
        l.name = 'The Hague',
        l.description = 'The city in the Netherlands known for being the location of the International Court of Justice and numerous other international legal and diplomatic bodies. Mentioned as the location where three commanders, whom a Serbian paramilitary group wants released, are presumably held.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location-vice_presidents_office'})
    ON CREATE SET
        l.name = 'Vice President\'s Office',
        l.description = 'The stately office of the Vice President is dark except for a single desk lamp. It is a private space, presumably decorated with personal items such as a framed photograph, which reflects Bob Russell\'s personal connections and emotions.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-situation_room'})
    ON CREATE SET
        l.name = 'Situation Room',
        l.description = 'A high-security meeting room within the White House where key national security decisions are made. It\'s currently being used for urgent briefings related to American hostages and foreign conflicts.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-west_wing-mural_room'})
    ON CREATE SET
        l.name = 'Mural Room',
        l.description = 'The Mural Room is a room in the White House frequently used as a meeting space or impromptu command center during urgent situations. It is where diplomatic discussions, such as those with international ambassadors, take place.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})
    ON CREATE SET
        l.name = 'Steam Pipe Trunk Distribution Venue',
        l.description = 'A windowless office space nicknamed by the staff. It\'s cluttered with crumpled papers and empty coffee cups, creating an environment where Sam Seaborn works intensely on drafting presidential speeches.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-oval_office'})
    ON CREATE SET
        l.name = 'Oval Office',
        l.description = 'The Oval Office is the formal working space of the President of the United States, located in the West Wing of the White House. It is a symbol of the presidency and is used for meetings with heads of state, as well as the President\'s senior staff members. The office is known for its distinct shape, the Resolute desk, and large windows that overlook the White House gardens.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-colorado_lake_house'})
    ON CREATE SET
        l.name = 'Colorado Lake House',
        l.description = 'Bob Russell\'s lake house in Colorado, mentioned in relation to a photograph showing a younger Russell teaching Amanda Dalton to fish. It serves as a personal touchstone in the narrative, emphasizing his connection to Amanda.',
        l.type = 'Building'
    ;
MERGE (o:Organization {uuid: 'org-usaid'})
    ON CREATE SET
        o.name = 'USAID',
        o.description = 'An independent agency of the United States federal government that is primarily responsible for administering civilian foreign aid and development assistance, aimed at improving global stability and development.',
        o.sphere_of_influence = 'Humanitarian and Development Aid'
    ;
MERGE (o:Organization {uuid: 'org-serbian_paramilitary_group'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Group',
        o.description = 'A group that claimed responsibility for the abduction of USAID workers and demands the release of three commanders from The Hague.',
        o.sphere_of_influence = 'Conflict/Humanitarian Affairs'
    ;
MERGE (o:Organization {uuid: 'org-serbian_security_services'})
    ON CREATE SET
        o.name = 'Serbian Security Services',
        o.description = 'Elements within this organization provided tactical support to the Serbian paramilitary group.',
        o.sphere_of_influence = 'Serbia'
    ;
MERGE (o:Organization {uuid: 'org-white_house'})
    ON CREATE SET
        o.name = 'White House',
        o.description = 'The White House is the official residence and workplace of the President of the United States. It houses the executive office of the President and is the central hub for federal executive operations, strategy, and crisis management.',
        o.sphere_of_influence = 'Executive Leadership and Strategy'
    ;
MERGE (o:Organization {uuid: 'org-russian_embassy'})
    ON CREATE SET
        o.name = 'Russian Embassy',
        o.description = 'Diplomatic mission of Russia representing Moscow\'s interests and positions in international matters, taking part in negotiations related to Serbian law enforcement.',
        o.sphere_of_influence = 'International Diplomacy'
    ;
MERGE (o:Organization {uuid: 'org-us_military'})
    ON CREATE SET
        o.name = 'U.S. Military',
        o.description = 'The United States Military, which works in conjunction with national security teams to maintain and ensure national and international security.',
        o.sphere_of_influence = 'Military Operations'
    ;
MERGE (o:Organization {uuid: 'org-aid_workers'})
    ON CREATE SET
        o.name = 'Aid Workers',
        o.description = 'A group of USAID workers conducting post-conflict assessments near the Kosovo-Serbia border, including Amanda Dalton.',
        o.sphere_of_influence = 'Humanitarian Aid'
    ;
MERGE (o:Organization {uuid: 'org-serbian_paramilitary_forces'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Forces',
        o.description = 'Hostile forces in Serbia that have claimed responsibility for the kidnapping of USAID workers.',
        o.sphere_of_influence = 'Militant Operations'
    ;
MERGE (s:Scene {uuid: 'scene-001'})
    ON CREATE SET
        s.title = 'Crisis Unfolds in the Situation Room',
        s.description = 'It is pre-dawn in the White House Situation Room, where the dim lighting conveys the seriousness of the unfolding crisis. Multiple LCD screens display satellite imagery of the Kosovo-Serbia border region. Josh Lyman enters the tense atmosphere, his tie already loosened despite the early hour. National Security Advisor Nancy McNally, at the head of the table, shares distressing news: contact has been lost with four USAID workers, missing for three hours near the Kosovo-Serbia border. As Josh takes his seat, President Bartlet enters with Leo McGarry and General Alexander, his demeanor somber and focused. The room stands to attention, then sits as Bartlet asks about the options available. Donna and Kate Harper provide updates that raise the stakes, revealing Serbian paramilitary involvement and tactical support from Serbian security services.',
        s.scene_number = 1
    WITH s
    MATCH (l:Location {uuid: 'location-white_house-situation_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Josh Lyman Enters Situation Room',
        e.description = 'Josh Lyman enters the Situation Room, noticeably tired and with his tie loosened. He takes his seat at the table, displaying a habitual gesture of rubbing his old scar, indicative of past trauma under stressful circumstances. The setting is tense given the urgent situation regarding missing USAID workers.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Nancy McNally Announces the Crisis',
        e.description = 'National Security Advisor Nancy McNally informs the present staff about the disappearance of four USAID workers three hours ago. They were conducting post-conflict reconstruction assessments near the Kosovo-Serbia border when contact was lost. Her concern is visible, highlighting the seriousness of the situation.',
        e.sequence = 2,
        e.key_dialogue = ["NANCY MCNALLY: Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'Donna Reports the Paramilitary Claim',
        e.description = 'Donna provides a critical update, stating that a Serbian paramilitary group is claiming responsibility for abducting the USAID workers. They have made demands for the release of three commanders held at The Hague. This development adds a political dimension to the unfolding crisis.',
        e.sequence = 3,
        e.key_dialogue = ["DONNA: Serbian paramilitary group is claiming responsibility on social media. They're demanding the release of three commanders from The Hague."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'Kate Harper Provides Intelligence Insights',
        e.description = 'Kate Harper shares intelligence suggesting that elements within Serbian security services may have supported the paramilitary group. This insight complicates the diplomatic and operational response to the hostage crisis.',
        e.sequence = 4,
        e.key_dialogue = ["KATE HARPER: Our intelligence suggests elements within Serbian security services provided tactical support to the paramilitary group."]
    ;
MERGE (e:Event {uuid: 'event-1-5'})
    ON CREATE SET
        e.title = 'President Bartlet and Senior Staff Enter',
        e.description = 'President Bartlet, accompanied by Leo McGarry and General Alexander, enters the Situation Room. The attendees stand until Bartlet takes his place, setting a serious tone. Bartlet\'s demeanor is notably grim, showing the weight of the crisis at hand.',
        e.sequence = 5,
        e.key_dialogue = ["PRESIDENT BARTLET: Where are we on options?"]
    ;
MERGE (s:Scene {uuid: 'scene-002'})
    ON CREATE SET
        s.title = 'Reflection and Revelation in the Vice President\'s Office',
        s.description = 'Set in the dimly lit Office of the Vice President, where only a single desk lamp provides light, Bob Russell sits alone, reflecting on a photograph of himself and young Amanda Dalton fishing in Colorado. The scene reveals Russell\'s emotional vulnerability, as his political facade slips momentarily. He speaks to himself about Amanda\'s motivations for joining USAID, inspired by President Bartlet’s speech. This moment of introspection is interrupted by Margaret, who informs him that he is needed in the Situation Room. With visible effort, Russell reassembles his public persona as he prepares to leave the office.',
        s.scene_number = 2
    WITH s
    MATCH (l:Location {uuid: 'location-vice_presidents_office'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Bob Russell Reflects on His Connection to Amanda Dalton',
        e.description = 'Bob Russell sits alone in his darkened office, reflecting on a photograph of himself with Amanda Dalton. The photograph captures a personal memory of him teaching her to fish at his Colorado lake house. He expresses a rare moment of vulnerability as he talks about how Amanda joined USAID because of a speech by President Bartlet on America\'s duty to help prevent conflicts.',
        e.sequence = 1,
        e.key_dialogue = ["RUSSELL: She joined USAID because of him, you know.", "RUSSELL: Because of a speech Bartlet gave. About America's obligation to help rebuild war-torn regions. To prevent the next conflict before it starts."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Margaret Informs Russell About the Situation Room Meeting',
        e.description = 'Margaret stands uncomfortably in the doorway of Russell\'s office, witnessing his emotional moment before reminding him that he is expected in the Situation Room.',
        e.sequence = 2,
        e.key_dialogue = ["MARGARET: Sir, they're waiting for you in the Situation Room."]
    ;
MERGE (s:Scene {uuid: 'scene-003'})
    ON CREATE SET
        s.title = 'Diplomatic Tensions in the Mural Room',
        s.description = 'In the Mural Room, the atmosphere is tense as President Bartlet engages with Russian Ambassador Viktor Petrov. The Ambassador maintains a disciplined diplomatic stance while asserting that the incident involving American aid workers is an internal Serbian law enforcement matter, warning that NATO intervention would violate sovereignty. C.J. Cregg and Leo McGarry observe from the doorway, recognizing Bartlet\'s mounting frustration as he challenges the Ambassador\'s position. The tension is compounded when C.J.\'s BlackBerry buzzes with a news alert, signaling CNN\'s coverage of Amanda Dalton\'s identity becoming public, adding to the impending media challenges.',
        s.scene_number = 3
    WITH s
    MATCH (l:Location {uuid: 'location-west_wing-mural_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Russian Ambassador Delivers Moscow\'s Position',
        e.description = 'Russian Ambassador Viktor Petrov asserts that the kidnapping of American aid workers is an internal Serbian matter and warns that NATO intervention would violate sovereignty. C.J. Cregg and Leo McGarry observe President Bartlet\'s growing anger.',
        e.sequence = 1,
        e.key_dialogue = ["AMBASSADOR PETROV: This is, as we see it, an internal Serbian law enforcement matter. Any NATO intervention would constitute a serious violation of sovereign territory."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'President Bartlet Challenges the Internal Matter Claim',
        e.description = 'President Bartlet questions Ambassador Petrov\'s claim by highlighting the kidnapping of American aid workers. C.J. Cregg receives a disturbing news alert on her BlackBerry.',
        e.sequence = 2,
        e.key_dialogue = ["PRESIDENT BARTLET: Mr. Ambassador, would you care to explain how the kidnapping of American aid workers constitutes an internal matter?"]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'C.J. Cregg Informs Bartlet of CNN Running Amanda Dalton\'s Identity',
        e.description = 'C.J. Cregg informs President Bartlet that CNN is broadcasting news about Amanda Dalton\'s identity, alerting him to an impending media storm.',
        e.sequence = 3,
        e.key_dialogue = ["C.J.: Sir, CNN is running with Amanda Dalton's identity."]
    ;
MERGE (s:Scene {uuid: 'scene-004'})
    ON CREATE SET
        s.title = 'Crafting Restraint in Tragedy',
        s.description = 'In the windowless office space known as the Steam Pipe Trunk Distribution Venue, Sam Seaborn is immersed in his task, surrounded by crumpled paper and empty coffee cups. His laptop screen displays two documents, one prepared for a victory scenario and the other for a tragic outcome. Toby Ziegler, watching from the doorway, offers guidance on expressing the gravity of political violence through nuanced language. Sam grapples with the moral complexities and reflects on their role as \'the good guys\' amidst challenging circumstances. The scene captures the intensity of the moment, as they aim to convey both hope and restraint in their speeches.',
        s.scene_number = 4
    WITH s
    MATCH (l:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Sam and Toby Discuss the Duality of Tragedy and Victory',
        e.description = 'In the windowless Steam Pipe Trunk Distribution Venue, Sam Seaborn struggles with the gravity of writing two presidential speeches – one for a potential victory and one for a tragedy. Surrounded by the remnants of intense work – crumpled papers and empty coffee cups – he reflects on how to find poetry in political violence. Toby Ziegler, observing Sam\'s struggle, offers advice on the importance of restraint and the reminder of why aid workers take risks.',
        e.sequence = 1,
        e.key_dialogue = ["SAM: The thing about tragedy is that it demands poetry. But how do you make poetry out of political violence?", "TOBY: Sometimes poetry is in the restraint. We need to remind people why we send aid workers into dangerous places. Why we try to rebuild what others have destroyed."]
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Sam Reflects on the Good Guys Dilemma Post-Rosslyn',
        e.description = 'Sam Seaborn, with hair disheveled from stress, continues to dwell on a past conversation with Toby after the Rosslyn shooting, contemplating the moral implications of their actions and the identity of being the \'good guys\' in the face of political violence.',
        e.sequence = 2,
        e.key_dialogue = ["SAM: I keep thinking about what you said after Rosslyn. About how we're supposed to be the good guys.", "TOBY: We still are. That's why this is hard."]
    ;
MERGE (s:Scene {uuid: 'scene-005'})
    ON CREATE SET
        s.title = 'Safe Revelation in the Oval Office',
        s.description = 'In the dimly lit Oval Office, rain is streaming against the windows, reflecting the somber mood of the senior staff gathered for a tense strategy session. The atmosphere shifts dramatically when Kate Harper delivers crucial news: the Serbian special police have secured the compound, and all hostages are safe, ending the crisis. Relief quickly spreads through the room, but Josh Lyman remains at the window, deeply contemplative, as he articulates his fears about the moral choices nations make in times of crisis. President Bartlet, observing the emotions of his staff, instructs Charlie Young to arrange calls with President Kovach and key party leaders, emphasizing the need to inform the American public about the near-disaster. The sense of relief is palpable, yet the scene underscores the precarious balance of power and justice the White House staff navigates.',
        s.scene_number = 5
    WITH s
    MATCH (l:Location {uuid: 'location-oval_office'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Kate Harper Announces Hostages Safe',
        e.description = 'Kate Harper enters the Oval Office amidst a tense strategy session, bringing news that Serbian special police units have secured the compound and all hostages are safe. Relief spreads through the room, but Josh Lyman remains troubled.',
        e.sequence = 1,
        e.key_dialogue = ["KATE: Serbian special police units have secured the compound. All hostages are safe."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Josh Lyman Contemplates the Crisis',
        e.description = 'Despite the relief in the room, Josh Lyman stands by the window, reflecting on the near-disaster. He shares his introspection with Donna Moss, expressing his fear that in crises, nations might succeed in the wrong ways.',
        e.sequence = 2,
        e.key_dialogue = ["JOSH: For about twenty minutes there, when we thought we'd lost them... I understood why nations go to war. Why they abandon principles for revenge.", "DONNA: But we didn't.", "JOSH: That's what scares me. Not that we might have failed, but that we might have succeeded in the wrong way."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'President Bartlet Prepares to Address Leadership',
        e.description = 'President Bartlet, from behind the Resolute desk, instructs Charlie Young to arrange calls with President Kovach and the leadership of both political parties. He emphasizes the need for the American people to understand how close the situation was to a full-blown crisis.',
        e.sequence = 3,
        e.key_dialogue = ["PRESIDENT BARTLET: Charlie, get me President Kovach. And then the leadership of both parties. The American people deserve to know how close we came to the brink today - and who pushed us there."]
    ;
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alexander'}),
          (o:Organization {uuid: 'org-us_military'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-bob_russell'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-margaret'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (o:Organization {uuid: 'org-aid_workers'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-cj_cregg'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlie_young'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-amanda_dalton'}),
          (o:Organization {uuid: 'org-usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-framed_photograph'}),
          (a:Agent {uuid: 'agent-bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-desk_lamp'}),
          (a:Agent {uuid: 'agent-bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-blackberry'}),
          (a:Agent {uuid: 'agent-cj_cregg'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-crumpled_paper'}),
          (a:Agent {uuid: 'agent-sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-empty_coffee_cups'}),
          (a:Agent {uuid: 'agent-sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-laptop'}),
          (a:Agent {uuid: 'agent-sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-bob_russell'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-margaret'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-cj_cregg'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alexander'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlie_young'}),
          (o:Organization {uuid: 'org-white_house'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alexander'}),
          (o:Organization {uuid: 'org-us_military'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (o:Organization {uuid: 'org-aid_workers'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lcd_screens-event-1-1'})
    ON CREATE SET
        oi.description = 'The LCD screens in the Situation Room are being utilized to display satellite imagery of the Kosovo-Serbia border region, highlighting the geographical context of the developing crisis to those in the room.',
        oi.status_before = 'Inactive LCD screens, possibly turned off or showing standard operational displays.',
        oi.status_after = 'Active, displaying critical satellite imagery relevant to the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-windows-event-1-1'})
    ON CREATE SET
        oi.description = 'The windows in the Situation Room contribute to the mood, allowing the dim early morning light to filter in, casting a somber tone appropriate to the gravity of the unfolding crisis.',
        oi.status_before = 'Windows likely closed, room dimly lit by early morning light.',
        oi.status_after = 'Maintaining the same light conditions, contributing to the overall atmosphere of urgency.'
    WITH oi
    MATCH (o:Object {uuid: 'object-windows'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lcd_screens-event-1-2'})
    ON CREATE SET
        oi.description = 'The LCD screens continue to provide visual information crucial for understanding the disappearance of the USAID workers, as described by Nancy McNally.',
        oi.status_before = 'Active, displaying satellite data pertinent to the location of the missing workers.',
        oi.status_after = 'Continuing to display satellite and possibly updated intelligence imagery to aid communication.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lcd_screens'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-1-1'})
    ON CREATE SET
        ap.current_status = 'attending an urgent briefing',
        ap.emotional_state = 'anxious; reminiscent of past trauma',
        ap.emotional_tags = ["anxious; reminiscent of past trauma"],
        ap.active_plans = ["receive and process situational updates", "contribute to strategic discussions if necessary"],
        ap.beliefs = ["importance of clear communication in a crisis", "duty to respond effectively"],
        ap.goals = ["understand the situation fully", "support the administration's resolution strategies"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-nancy_mcnally-event-1-2'})
    ON CREATE SET
        ap.current_status = 'briefing the team on the crisis',
        ap.emotional_state = 'concerned but composed',
        ap.emotional_tags = ["concerned but composed"],
        ap.active_plans = ["present available intelligence", "coordinate response efforts"],
        ap.beliefs = ["necessity of prompt action in international crises", "importance of informed decision-making"],
        ap.goals = ["inform senior staff", "guide the initial response strategy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-donna_moss-event-1-3'})
    ON CREATE SET
        ap.current_status = 'providing a critical update',
        ap.emotional_state = 'serious and attentive',
        ap.emotional_tags = ["serious", "attentive"],
        ap.active_plans = ["relate social media intel to the team"],
        ap.beliefs = ["value of timely information", "responsibility to keep officials informed"],
        ap.goals = ["ensure senior staff understands the paramilitary demands", "assist in shaping diplomatic response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-kate_harper-event-1-4'})
    ON CREATE SET
        ap.current_status = 'sharing intelligence insights',
        ap.emotional_state = 'focused and analytical',
        ap.emotional_tags = ["focused", "analytical"],
        ap.active_plans = ["interpret intelligence data", "report insights that affect decision-making"],
        ap.beliefs = ["importance of reliable intelligence", "diplomatic sensitivity despite military tensions"],
        ap.goals = ["aid in diplomatic strategy formulation", "clarify international alliances and hostilities"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-1-5'})
    ON CREATE SET
        ap.current_status = 'leading the Situation Room meeting',
        ap.emotional_state = 'grim and decisive',
        ap.emotional_tags = ["grim", "decisive"],
        ap.active_plans = ["gather detailed options", "maintain command presence and authority"],
        ap.beliefs = ["presidential duty to protect American lives", "moral leadership in global affairs"],
        ap.goals = ["determine a viable response strategy", "manage international relations carefully"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-1-5'})
    ON CREATE SET
        ap.current_status = 'supporting President Bartlet',
        ap.emotional_state = 'supportively assertive',
        ap.emotional_tags = ["supportively assertive"],
        ap.active_plans = ["advise on strategic matters", "assist in managing team coordination"],
        ap.beliefs = ["strong executive leadership is key", "importance of coherent team strategy"],
        ap.goals = ["facilitate consensus on courses of action", "ensure efficient situation response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-alexander-event-1-5'})
    ON CREATE SET
        ap.current_status = 'providing military perspective',
        ap.emotional_state = 'serious and ready',
        ap.emotional_tags = ["serious", "ready"],
        ap.active_plans = ["assess and advise on military options if necessary"],
        ap.beliefs = ["preparedness in case of escalation", "coordination of military and diplomatic efforts"],
        ap.goals = ["ensure national security considerations are well-integrated", "prepare for potential military responses"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-framed_photograph-event-2-1'})
    ON CREATE SET
        oi.description = 'The framed photograph provides a focal point for Bob Russell\'s nostalgia and emotional reflection. It represents his personal connection to Amanda Dalton and his rare moment of vulnerability.',
        oi.status_before = 'Displayed on Bob Russell\'s desk, serving as a constant presence in his office.',
        oi.status_after = 'Remains on Bob Russell\'s desk, its significance highlighted by the emotional moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-framed_photograph'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-desk_lamp-event-2-2'})
    ON CREATE SET
        oi.description = 'The desk lamp illuminates the solitary figure of Bob Russell in the dark office, symbolizing the singular focus of his reflection until Margaret interrupts.',
        oi.status_before = 'Lighting the dark office, providing the only source of light.',
        oi.status_after = 'Continues to provide light as Bob Russell prepares to leave for the Situation Room.'
    WITH oi
    MATCH (o:Object {uuid: 'object-desk_lamp'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-1'})
    ON CREATE SET
        ap.current_status = 'reflective',
        ap.emotional_state = 'vulnerable',
        ap.emotional_tags = ["vulnerable"],
        ap.active_plans = ["reconstruct political persona"],
        ap.beliefs = ["influence of Bartlet's speeches", "value of USAID's mission"],
        ap.goals = ["cope with personal concern for Amanda Dalton", "maintain composure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-2'})
    ON CREATE SET
        ap.current_status = 'preparing to face duties',
        ap.emotional_state = 'emotionally subdued',
        ap.emotional_tags = ["emotionally subdued"],
        ap.active_plans = ["attend Situation Room meeting"],
        ap.beliefs = ["importance of duty despite personal emotions"],
        ap.goals = ["fulfill vice presidential responsibilities", "mask vulnerability"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-margaret-event-2-2'})
    ON CREATE SET
        ap.current_status = 'informative',
        ap.emotional_state = 'uncomfortable',
        ap.emotional_tags = ["uncomfortable"],
        ap.active_plans = ["deliver message to Bob Russell"],
        ap.beliefs = ["respect for privacy", "importance of timely communication"],
        ap.goals = ["ensure Bob Russell's attendance at the meeting"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-blackberry-event-3-2'})
    ON CREATE SET
        oi.description = 'C.J. Cregg receives a disturbing news alert on her BlackBerry about Amanda Dalton\'s identity being broadcasted on CNN.',
        oi.status_before = 'The BlackBerry was in standby mode, not being actively used.',
        oi.status_after = 'The BlackBerry displayed a news alert, signaling incoming updates about sensitive information.'
    WITH oi
    MATCH (o:Object {uuid: 'object-blackberry'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-blackberry-event-3-3'})
    ON CREATE SET
        oi.description = 'C.J. Cregg uses her BlackBerry to inform President Bartlet about the media airing Amanda Dalton\'s identity, escalating the urgency of the situation.',
        oi.status_before = 'The BlackBerry just displayed the news alert about Amanda Dalton prior to being communicated.',
        oi.status_after = 'The BlackBerry returned to a passive state post-information sharing; ready for further updates if needed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-blackberry'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Diplomatic representative',
        ap.emotional_state = 'Confident and resolute',
        ap.emotional_tags = ["Confident", "resolute"],
        ap.active_plans = ["Deliver Moscow's official stance", "Deter NATO intervention"],
        ap.beliefs = ["National sovereignty must be respected", "Serbian authorities can handle the situation internally"],
        ap.goals = ["Prevent NATO from intervening in Serbian territory", "Avoid international escalation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Observer',
        ap.emotional_state = 'Apprehensive',
        ap.emotional_tags = ["Apprehensive"],
        ap.active_plans = ["Monitor President Bartlet's reaction", "Remain informed on media developments"],
        ap.beliefs = ["The media may exacerbate the situation", "Bartlet's responses need measured control"],
        ap.goals = ["Prepare for potential media inquiries", "Support Bartlet's diplomatic efforts"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Observer',
        ap.emotional_state = 'Alert and cautious',
        ap.emotional_tags = ["Alert", "cautious"],
        ap.active_plans = ["Coordinate White House response", "Advisory role for Bartlet"],
        ap.beliefs = ["Diplomatic finesse is crucial", "Understanding Bartlet's cues is essential"],
        ap.goals = ["Support the President in diplomatic negotiations", "Ensure Bartlet's temperance and control"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Principal negotiator',
        ap.emotional_state = 'Growing frustration',
        ap.emotional_tags = ["Growing frustration"],
        ap.active_plans = ["Challenge Petrov's assertions", "Promote American interests"],
        ap.beliefs = ["Action must be taken to protect American lives", "Petrov's stance is unacceptable"],
        ap.goals = ["Safeguard American citizens", "Counter Moscow's diplomatic narrative"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Interrogator',
        ap.emotional_state = 'Determined and assertive',
        ap.emotional_tags = ["Determined", "assertive"],
        ap.active_plans = ["Demand clarity from Petrov", "Highlight the gravity of the situation"],
        ap.beliefs = ["Moral and ethical obligations are paramount", "International accountability is crucial"],
        ap.goals = ["Elicit a response from Petrov", "Shift the narrative to focus on American hostages"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Defendant of position',
        ap.emotional_state = 'Stern and unyielding',
        ap.emotional_tags = ["Stern", "unyielding"],
        ap.active_plans = ["Maintain position about internal matters", "Resist acknowledging international repercussions"],
        ap.beliefs = ["External interference is inappropriate", "Serbia's jurisdiction should be respected"],
        ap.goals = ["Continue to dissuade international intervention", "Preserve Russian-Serbian diplomacy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Press secretary on alert',
        ap.emotional_state = 'Concerned',
        ap.emotional_tags = ["Concerned"],
        ap.active_plans = ["Stay updated via BlackBerry", "Prepare communications strategy"],
        ap.beliefs = ["Timing of information release is critical", "Media can sway public opinion"],
        ap.goals = ["Shield Bartlet from unanticipated queries", "Manage potential media fallout"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Informant',
        ap.emotional_state = 'Urgent and anxious',
        ap.emotional_tags = ["Urgent", "anxious"],
        ap.active_plans = ["Inform Bartlet of media developments", "Prepare for the media storm"],
        ap.beliefs = ["Media strategy must adjust rapidly", "Public perception impacts international leverage"],
        ap.goals = ["Ensure Bartlet remains informed", "Mitigate media impact on diplomatic efforts"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Prepared informant',
        ap.emotional_state = 'Sober and contemplative',
        ap.emotional_tags = ["Sober", "contemplative"],
        ap.active_plans = ["Assess implications of media exposure", "Adapt diplomatic strategy accordingly"],
        ap.beliefs = ["Transparency with the public is necessary", "Media revelations can influence diplomacy"],
        ap.goals = ["Address public and international concerns", "Navigate resulting diplomatic challenges"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crumpled_paper-event-4-1'})
    ON CREATE SET
        oi.description = 'The crumpled paper symbolizes the intense mental and creative effort Sam Seaborn is undergoing as he drafts the presidential speeches. It reflects the discarded attempts and the struggle to articulate the right message in the face of potential tragedy or victory.',
        oi.status_before = 'Scattered around Sam\'s workspace, indicative of ongoing brainstorming and revisions.',
        oi.status_after = 'Remains crumpled, continuing to signify the challenging creative process underway.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crumpled_paper'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-empty_coffee_cups-event-4-1'})
    ON CREATE SET
        oi.description = 'The empty coffee cups around Sam represent the long hours and the exhaustion tied to the urgency of preparing two distinct speeches. They highlight the physical toll on Sam and Toby as they navigate the demands of their tasks.',
        oi.status_before = 'Accumulated over time, reflecting sustained periods of work and focus.',
        oi.status_after = 'Still present, illustrating continued mental fatigue and the impact of the all-nighter.'
    WITH oi
    MATCH (o:Object {uuid: 'object-empty_coffee_cups'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-laptop-event-4-1'})
    ON CREATE SET
        oi.description = 'Sam\'s laptop is the primary tool facilitating his work on the presidential addresses. It displays two open documents, one for a favorable outcome and another for a somber one, underscoring the dual nature of the crisis and the preparation required for either result.',
        oi.status_before = 'Powered on and displaying two active documents, embodying the dual outcomes Sam must prepare for.',
        oi.status_after = 'Continues to be used actively as Sam refines the speeches, pivotal in crafting the narrative for the anticipated events.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crumpled_paper-event-4-2'})
    ON CREATE SET
        oi.description = 'The crumpled paper remains as a testament to Sam\'s ongoing contemplation of moral questions raised by Toby post-Rosslyn. It signifies the unresolved struggle and the pressure of capturing the \'good guys\' narrative amidst political challenges.',
        oi.status_before = 'Still gathered around Sam, indicating the iterative struggle with drafting.',
        oi.status_after = 'Unchanged, illustrating persistent efforts and unresolved drafts as Sam grapples with ethical dilemmas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crumpled_paper'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-empty_coffee_cups-event-4-2'})
    ON CREATE SET
        oi.description = 'The empty coffee cups remain around Sam as he reflects on the conversation with Toby about moral integrity and their roles. These cups demonstrate the ongoing intensity and the physical manifestation of prolonged work and reflection.',
        oi.status_before = 'Surrounding Sam, showing signs of fatigue and the endurance needed for deep contemplation.',
        oi.status_after = 'Persist unchanged, indicating no relief from the taxing workload and continual engagement in deep thought.'
    WITH oi
    MATCH (o:Object {uuid: 'object-empty_coffee_cups'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-laptop-event-4-2'})
    ON CREATE SET
        oi.description = 'The laptop serves as a constant workspace tool for Sam, central to his role in creating both speeches and reflecting Toby\'s moral perspective. It symbolizes his ongoing duty as well as his struggle with maintaining the \'good guys\' identity.',
        oi.status_before = 'Active with documents open, constant in its use for drafting ongoing speeches.',
        oi.status_after = 'Remains operational, showcasing continuous utilization as Sam persists in his narrative exploration and resolution.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-1'})
    ON CREATE SET
        ap.current_status = 'struggling with speechwriting',
        ap.emotional_state = 'anxious and contemplative',
        ap.emotional_tags = ["anxious", "contemplative"],
        ap.active_plans = ["develop two speeches for President", "find poetic expressions for political violence"],
        ap.beliefs = ["poetry can express complex emotions", "ethical responsibility in communication"],
        ap.goals = ["complete speeches for victory and tragedy scenarios", "ensure speeches convey deeper truths about aid work"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-1'})
    ON CREATE SET
        ap.current_status = 'advising colleague',
        ap.emotional_state = 'concerned and reflective',
        ap.emotional_tags = ["concerned", "reflective"],
        ap.active_plans = ["provide guidance to Sam", "advocate for restrained and meaningful communication"],
        ap.beliefs = ["restraint can be powerful in poetry", "importance of communicating justifications for aid work"],
        ap.goals = ["ensure presidential speeches are ethically grounded", "support Sam in delivering effective speeches"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-2'})
    ON CREATE SET
        ap.current_status = 'reflecting on past events',
        ap.emotional_state = 'philosophical and introspective',
        ap.emotional_tags = ["philosophical", "introspective"],
        ap.active_plans = ["reconcile need for moral clarity with political reality"],
        ap.beliefs = ["importance of being 'the good guys'", "political actions should align with ethical values"],
        ap.goals = ["maintain moral integrity in political decision-making", "navigate complexities of political violence"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-2'})
    ON CREATE SET
        ap.current_status = 'providing emotional support',
        ap.emotional_state = 'reassuring and empathic',
        ap.emotional_tags = ["reassuring", "empathic"],
        ap.active_plans = ["affirm Sam's moral concerns", "remind Sam of the administration's values"],
        ap.beliefs = ["striving to be the 'good guys' is a continuous effort", "moral challenges are inherent in political contexts"],
        ap.goals = ["comfort Sam with shared beliefs", "strengthen commitment to ethical governance"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-windows-event-5-1'})
    ON CREATE SET
        oi.description = 'The windows of the Oval Office provide a view of the rainy outside, setting the somber and tense mood as Kate Harper brings crucial news that the hostages are safe. Josh remains by the window, indicating his reflective and troubled state despite the good news.',
        oi.status_before = 'The windows were rain-streaked and transparent, maintaining the outside view.',
        oi.status_after = 'The windows continue to be rain-streaked, unchanged physically, but they have served a narrative function by reflecting Josh\'s internal state.'
    WITH oi
    MATCH (o:Object {uuid: 'object-windows'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-windows-event-5-2'})
    ON CREATE SET
        oi.description = 'Josh Lyman stands by the window, reflecting on the crisis and contemplating the moral implications of the actions taken. The windows symbolize his introspection, framing his thoughts as he speaks with Donna Moss.',
        oi.status_before = 'The windows are rain-streaked and provide an external view, reflecting the serious atmosphere of the room.',
        oi.status_after = 'The windows remain physically unchanged, continuing to serve as a silent companion to Josh\'s contemplative moments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-windows'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-resolute_desk-event-5-3'})
    ON CREATE SET
        oi.description = 'The Resolute desk serves as the commanding centerpiece of President Bartlet\'s office as he prepares to address the leadership, emphasizing the gravity of the near-crisis with a call for transparency and accountability.',
        oi.status_before = 'The Resolute desk stands prominently in the Oval Office, as a symbol of presidential power and authority.',
        oi.status_after = 'The Resolute desk remains unchanged in its iconic position, underscoring the President\'s role in handling the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-resolute_desk'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-kate_harper-event-5-1'})
    ON CREATE SET
        ap.current_status = 'messenger',
        ap.emotional_state = 'relieved',
        ap.emotional_tags = ["relieved"],
        ap.active_plans = ["communicate status of hostages"],
        ap.beliefs = ["importance of timely strategic information"],
        ap.goals = ["inform President and staff about the safety of hostages"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-1'})
    ON CREATE SET
        ap.current_status = 'senior staff member',
        ap.emotional_state = 'troubled',
        ap.emotional_tags = ["troubled"],
        ap.active_plans = ["process the implications of the near-disaster"],
        ap.beliefs = ["concern over national response to crises"],
        ap.goals = ["ensure correct moral and strategic response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-2'})
    ON CREATE SET
        ap.current_status = 'reflective staff member',
        ap.emotional_state = 'reflective',
        ap.emotional_tags = ["reflective"],
        ap.active_plans = ["share introspections with Donna"],
        ap.beliefs = ["fear of misplaced success in crisis management"],
        ap.goals = ["come to terms with personal beliefs on revenge and principle"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-donna_moss-event-5-2'})
    ON CREATE SET
        ap.current_status = 'supportive colleague',
        ap.emotional_state = 'reassuring',
        ap.emotional_tags = ["reassuring"],
        ap.active_plans = ["provide emotional support to Josh"],
        ap.beliefs = ["we did not abandon our principles"],
        ap.goals = ["reassure Josh and affirm moral standing"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-5-3'})
    ON CREATE SET
        ap.current_status = 'president',
        ap.emotional_state = 'determined',
        ap.emotional_tags = ["determined"],
        ap.active_plans = ["schedule calls with international and political leaders"],
        ap.beliefs = ["public deserves transparency on the crisis"],
        ap.goals = ["inform leadership about crisis management and resolution"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-charlie_young-event-5-3'})
    ON CREATE SET
        ap.current_status = 'personal aide',
        ap.emotional_state = 'focused',
        ap.emotional_tags = ["focused"],
        ap.active_plans = ["facilitate President's call with leaders"],
        ap.beliefs = ["following presidential orders is crucial"],
        ap.goals = ["ensure smooth communication between President and other leaders"]
    ;
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Location {uuid: 'location-white_house-situation_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-5'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Event {uuid: 'event-1-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'participation-agent-nancy_mcnally-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-nancy_mcnally-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'participation-agent-donna_moss-event-1-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-donna_moss-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'participation-agent-kate_harper-event-1-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-kate_harper-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (b:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-1-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-1-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-alexander'}),
          (b:AgentParticipation {uuid: 'participation-agent-alexander-event-1-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-alexander-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Location {uuid: 'location-vice_presidents_office'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-bob_russell'}),
          (b:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-bob_russell'}),
          (b:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-bob_russell-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-margaret'}),
          (b:AgentParticipation {uuid: 'participation-agent-margaret-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-margaret-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Location {uuid: 'location-west_wing-mural_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (b:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-cj_cregg'}),
          (b:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-leo_mcgarry-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (b:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (b:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-viktor_petrov'}),
          (b:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-viktor_petrov-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-cj_cregg'}),
          (b:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-cj_cregg'}),
          (b:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-cj_cregg-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (b:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Location {uuid: 'location-steam_pipe_trunk_distribution_venue'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (b:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (b:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sam_seaborn'}),
          (b:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sam_seaborn-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-toby_ziegler'}),
          (b:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-toby_ziegler-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Location {uuid: 'location-oval_office'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-kate_harper'}),
          (b:AgentParticipation {uuid: 'participation-agent-kate_harper-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-kate_harper-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josh_lyman'}),
          (b:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josh_lyman-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-donna_moss'}),
          (b:AgentParticipation {uuid: 'participation-agent-donna_moss-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-donna_moss-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-josiah_jed_bartlet'}),
          (b:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-josiah_jed_bartlet-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlie_young'}),
          (b:AgentParticipation {uuid: 'participation-agent-charlie_young-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-charlie_young-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
