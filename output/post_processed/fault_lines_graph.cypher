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
MERGE (a:Agent {uuid: 'agent_nancy_mcnally'})
    ON CREATE SET
        a.name = 'Nancy McNally',
        a.title = 'National Security Advisor',
        a.description = 'Nancy McNally is the National Security Advisor in the West Wing, known for her commanding presence and calm yet decisive handling of crisis situations. She is responsible for briefing the senior staff on critical intelligence matters.',
        a.traits = ["Authoritative", "Experienced", "Calm under pressure", "Commanding"],
        a.sphere_of_influence = 'National Security and Crisis Management'
    ;
MERGE (a:Agent {uuid: 'agent_josh_lyman'})
    ON CREATE SET
        a.name = 'Josh Lyman',
        a.title = 'Deputy Chief of Staff',
        a.description = 'Josh Lyman is a dedicated political operative with a personal history marked by past crises, notably the Rosslyn incident. His approach is both thoughtful and emotionally charged, reflective of his deep commitment to his work in the high-stakes environment of the White House. He is also known for his emotional insight and decisive action in high-stakes situations.',
        a.traits = ["Resilient", "Impulsive under stress", "Intuitive", "Strategic", "Reflective", "Driven", "Dedicated"],
        a.sphere_of_influence = 'Political Operations and White House Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_donna_moss'})
    ON CREATE SET
        a.name = 'Donna Moss',
        a.title = 'Assistant',
        a.description = 'Donna Moss is a perceptive and resourceful assistant known for her keen observations and practical insights. She often provides crucial, timely information that helps her colleagues navigate complex political and security issues, and is especially valued as a supportive aide to Josh Lyman.',
        a.traits = ["Supportive", "Resourceful", "Empathetic", "Pragmatic", "Loyal", "Observant"],
        a.sphere_of_influence = 'White House Operations'
    ;
MERGE (a:Agent {uuid: 'agent_kate_harper'})
    ON CREATE SET
        a.name = 'Kate Harper',
        a.title = 'Deputy National Security Advisor',
        a.description = 'Kate Harper serves as an intelligence analyst, offering essential insights and assessments based on emerging data. Her analytical mindset and calm demeanor allow her to interpret complex intelligence scenarios effectively and she plays a crucial role in crisis management with prompt actions and clear communication.',
        a.traits = ["Alert", "Resourceful", "Analytical", "Assertive", "Insightful", "Calm", "Observant"],
        a.sphere_of_influence = 'Intelligence and National Security'
    ;
MERGE (a:Agent {uuid: 'agent_josiah_bartlet'})
    ON CREATE SET
        a.name = 'Josiah Bartlet',
        a.title = 'President of the United States',
        a.description = 'Josiah Bartlet is a seasoned and thoughtful leader whose intellect and resolve guide the nation through crises. His calm yet decisive leadership, intellectual depth, commanding presence, and ability to lead the nation through uncertainty are hallmarks of his presidency. His subtle tells during moments of crisis reveal the intensity behind his composed exterior.',
        a.traits = ["Intelligent", "Compassionate", "Intellectual", "Calm", "Steadfast", "Measured", "Principled", "Empathetic", "Astute", "Decisive", "Diplomatic", "Resolute", "Steady"],
        a.sphere_of_influence = 'National Leadership and Policy'
    ;
MERGE (a:Agent {uuid: 'agent_leo_mcgarry'})
    ON CREATE SET
        a.name = 'Leo McGarry',
        a.title = 'Chief of Staff',
        a.description = 'Leo McGarry is a trusted senior advisor and the Chief of Staff, known for his loyal and strategic approach to managing the inner workings of the White House. His experience and steady guidance are critical during national crises, and his strategic vigilance helps guide the administration through turbulent times.',
        a.traits = ["Experienced", "Dependable", "Strategic", "Loyal", "Observant"],
        a.sphere_of_influence = 'White House Administration'
    ;
MERGE (a:Agent {uuid: 'agent_alexander'})
    ON CREATE SET
        a.name = 'Alexander',
        a.title = 'General',
        a.description = 'Alexander is a high-ranking military leader accompanying the President, representing the armed forces\' perspective during times of crisis. His authoritative presence and disciplined nature underscore his role in advising on military strategy.',
        a.traits = ["Authoritative", "Disciplined", "Experienced", "Strategic"],
        a.sphere_of_influence = 'Military Strategy and National Defense'
    ;
MERGE (a:Agent {uuid: 'agent_bob_russell'})
    ON CREATE SET
        a.name = 'Bob Russell',
        a.title = 'Vice President',
        a.description = 'Bob Russell is the Vice President, depicted in a moment of private vulnerability as he reflects on his personal history. A cherished photograph of him teaching a young Amanda Dalton to fish hints at the deep personal ties behind his political persona.',
        a.traits = ["Vulnerable", "Calculating", "Reflective", "Reserved"],
        a.sphere_of_influence = 'National Politics'
    ;
MERGE (a:Agent {uuid: 'agent_margaret'})
    ON CREATE SET
        a.name = 'Margaret',
        a.title = 'Aide',
        a.description = 'Margaret is an aide in the Vice President\'s Office. Her presence at critical moments, marked by noticeable discomfort as she witnesses private exchanges, underlines her role as a supportive but observant staff member tasked with relaying messages and managing office flow.',
        a.traits = ["Observant", "Reserved", "Supportive"],
        a.sphere_of_influence = 'Vice President\'s Office'
    ;
MERGE (a:Agent {uuid: 'agent_amanda_dalton'})
    ON CREATE SET
        a.name = 'Amanda Dalton',
        a.title = 'USAID Veteran',
        a.description = 'Amanda Dalton is a USAID veteran and the goddaughter of Vice President Bob Russell. Initially seen through a cherished childhood photograph, her later role as an aid worker underscores her deep personal commitment to national service and international aid and development.',
        a.traits = ["Resilient", "Dedicated", "Experienced"],
        a.sphere_of_influence = 'International Aid and Development'
    ;
MERGE (a:Agent {uuid: 'agent_viktor_petrov'})
    ON CREATE SET
        a.name = 'Viktor Petrov',
        a.title = 'Russian Ambassador',
        a.description = 'Viktor Petrov is a seasoned diplomat representing Russia. Poised and measured, he delivers Moscow\'s position with authority and subtle firmness, embodying the careful balancing act required in international diplomacy.',
        a.traits = ["Diplomatic", "Measured", "Authoritative"],
        a.sphere_of_influence = 'Diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent_cj_cregg'})
    ON CREATE SET
        a.name = 'C.J. Cregg',
        a.title = 'Press Secretary',
        a.description = 'C.J. Cregg is the White House Press Secretary known for her resilience and astute handling of high-pressure communication challenges. She remains composed under breaking news and imminent crises.',
        a.traits = ["Resilient", "Quick-witted", "Observant"],
        a.sphere_of_influence = 'Communications'
    ;
MERGE (a:Agent {uuid: 'agent_sam_seaborn'})
    ON CREATE SET
        a.name = 'Sam Seaborn',
        a.title = 'Speechwriter',
        a.description = 'Sam Seaborn is a dedicated and creative speechwriter in the West Wing, known for his ability to craft poetic language from political turmoil. His work reflects his commitment to conveying the administration\'s values under intense pressure.',
        a.traits = ["articulate", "dedicated", "poetic", "intense"],
        a.sphere_of_influence = 'Political Communications'
    ;
MERGE (a:Agent {uuid: 'agent_toby_ziegler'})
    ON CREATE SET
        a.name = 'Toby Ziegler',
        a.title = 'Communications Director',
        a.description = 'Toby Ziegler is a focused and strategic communications director in the West Wing. Known for his intensity and thoughtful approach, he expertly balances the art of political messaging with the heavy responsibilities of crisis management.',
        a.traits = ["intense", "thoughtful", "strategic", "principled"],
        a.sphere_of_influence = 'Political Communications'
    ;
MERGE (a:Agent {uuid: 'agent_charlie_young'})
    ON CREATE SET
        a.name = 'Charlie Young',
        a.title = 'Personal Assistant',
        a.description = 'Charlie Young is a diligent and reliable personal assistant to President Bartlet, admired for his efficiency, loyalty, and quiet competence in managing White House operations.',
        a.traits = ["Efficient", "Loyal", "Attentive"],
        a.sphere_of_influence = 'White House Operations'
    ;
MERGE (a:Agent {uuid: 'agent_president_kovach'})
    ON CREATE SET
        a.name = 'Kovach',
        a.title = 'President',
        a.description = 'Kovach is a political leader whose arrival signals a significant level of influence and authority in national affairs. His presence reflects the high stakes of presidential decision-making and embodies an authoritative, determined, and influential leadership style.',
        a.traits = ["Authoritative", "Determined", "Influential"],
        a.sphere_of_influence = 'National Leadership'
    ;
MERGE (o:Object {uuid: 'object_lcd_screens'})
    ON CREATE SET
        o.name = 'LCD Screens',
        o.description = 'Multiple LCD screens mounted in the Situation Room that display satellite imagery of the Kosovo-Serbia border region under pre-dawn dim lighting.',
        o.purpose = 'To provide real-time visual intelligence during the briefing, aiding staff in understanding the evolving situation.',
        o.significance = 'They serve as a critical tool for visualizing the geopolitical crisis, emphasizing the urgency of the situation.'
    ;
MERGE (o:Object {uuid: 'object_framed_photograph_fishing'})
    ON CREATE SET
        o.name = 'Framed Photograph',
        o.description = 'A framed photograph showing Bob Russell teaching a young Amanda Dalton to fish at his Colorado lake house. The image evokes memories of a more innocent time and carries significant personal symbolism.',
        o.purpose = 'Serves as a memento of Bob Russell\'s personal past and his connection to Amanda, reflecting on his softer self beneath the political veneer.',
        o.significance = 'Symbolizes the vulnerability behind Bob\'s carefully constructed political persona and highlights the emotional stakes tied to his private memories.'
    ;
MERGE (o:Object {uuid: 'object_desk_lamp'})
    ON CREATE SET
        o.name = 'Desk Lamp',
        o.description = 'A solitary desk lamp casting a warm pool of light in the dark Vice President\'s Office, setting a subdued, intimate atmosphere.',
        o.purpose = 'To illuminate the immediate area and contribute to the scene\'s mood of reflective solitude.',
        o.significance = 'The lamp underscores the isolation and quiet introspection of the moment, contrasting the dark surroundings with a focused light that draws attention to personal details.'
    ;
MERGE (o:Object {uuid: 'object_blackberry_phone'})
    ON CREATE SET
        o.name = 'Blackberry Phone',
        o.description = 'A mobile communication device used by C.J. Cregg. The phone buzzes with urgent news alerts, drawing attention to the unfolding crisis.',
        o.purpose = 'To deliver breaking news updates, such as the revelation of Amanda Dalton\'s identity on CNN, that directly impact the decisions and emotions of the characters.',
        o.significance = 'The device represents the immediacy of information in modern political crises and underlines the tension as the narrative shifts between personal dilemmas and high-level diplomatic confrontations.'
    ;
MERGE (o:Object {uuid: 'object_sam_laptop'})
    ON CREATE SET
        o.name = 'Sam\'s Laptop',
        o.description = 'A glowing laptop displaying two distinct presidential address drafts—one for victory, one for tragedy—hinting at the duality of hope and sorrow in a crisis.',
        o.purpose = 'Used by Sam Seaborn to compose and refine important political speeches amidst a high-pressure environment.',
        o.significance = 'Represents the intense creative process and the burden of articulating complex national narratives under stress.'
    ;
MERGE (o:Object {uuid: 'object_desk_clutter'})
    ON CREATE SET
        o.name = 'Desk Clutter',
        o.description = 'A disorganized collection of crumpled papers and empty coffee cups that surrounds Sam\'s workstation.',
        o.purpose = 'Serves as a visual manifestation of the chaos, exhaustion, and relentless pace of work in the face of political turmoil.',
        o.significance = 'Symbolizes both the physical toll of prolonged stress and the remnants of a long, fraught creative process during a crisis.'
    ;
MERGE (o:Object {uuid: 'object_resolute_desk'})
    ON CREATE SET
        o.name = 'Resolute Desk',
        o.description = 'An iconic, richly crafted wooden desk traditionally used in the Oval Office. Its historical design and imposing presence emphasize executive authority.',
        o.purpose = 'Serves as the central piece of furniture behind which President Bartlet observes and directs the unfolding crisis, and as a symbolic representation of presidential power.',
        o.significance = 'Represents the continuity, responsibility, and gravity of the office during moments of high tension, reinforcing the weight of leadership in times of crisis.'
    ;
MERGE (l:Location {uuid: 'location_white_house_situation_room'})
    ON CREATE SET
        l.name = 'White House Situation Room',
        l.description = 'A pre-dawn command center located within the White House. Dim lighting, LCD screens displaying satellite imagery, and an atmosphere of urgency set the stage for crisis management.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_kosovo_serbia_border_region'})
    ON CREATE SET
        l.name = 'Kosovo-Serbia Border Region',
        l.description = 'A geopolitically tense border area between Kosovo and Serbia, shown via satellite imagery and referenced as the site of post-conflict reconstruction assessments.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_the_hague'})
    ON CREATE SET
        l.name = 'The Hague',
        l.description = 'An internationally renowned city known for legal institutions. It is referenced as a location whose key figures are to be released by the Serbian paramilitary group.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_office_of_the_vice_president'})
    ON CREATE SET
        l.name = 'Office of the Vice President',
        l.description = 'A stately office characterized by subdued lighting with a single desk lamp providing the only illumination. The space exudes an air of solitude and introspection, marked by personal mementos such as a framed photograph of Bob Russell teaching a young Amanda Dalton to fish at his Colorado lake house. The mood shifts as the Vice President grapples with personal emotion and political duty.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_mural_room'})
    ON CREATE SET
        l.name = 'Mural Room',
        l.description = 'A room in the West Wing used as an impromptu command center where high-stakes diplomatic dialogues take place. The space is noted for its strategic seating and positioning near doorways, allowing observers like C.J. and Leo to note every subtle cue in leaders\' behavior.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    ON CREATE SET
        l.name = 'Steam Pipe Trunk Distribution Venue',
        l.description = 'A windowless office space filled with the clutter of crumpled paper and empty coffee cups. This tense, utilitarian environment serves as a creative workspace where urgent, contrasting documents on political tragedy and victory are drafted, capturing the hectic and charged atmosphere of crisis management.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_oval_office'})
    ON CREATE SET
        l.name = 'Oval Office',
        l.description = 'A high-security executive workspace in the White House. The room is iconic for its distinctive shape, elegant decor, and symbolic significance, hosting high-stakes meetings and strategy sessions. In this scene, rain streams down its windows, setting a somber tone as senior staff engage in tense discussions.',
        l.type = 'Office'
    ;
MERGE (o:Organization {uuid: 'org_usaid'})
    ON CREATE SET
        o.name = 'USAID',
        o.description = 'United States Agency for International Development; responsible for administering civilian foreign aid and development assistance.',
        o.sphere_of_influence = 'Global, with a focus on humanitarian aid and development.'
    ;
MERGE (o:Organization {uuid: 'org_serbian_paramilitary_group'})
    ON CREATE SET
        o.name = 'Serbian Paramilitary Group',
        o.description = 'A non-state armed organization with nationalist ties, reportedly active in the Kosovo-Serbia border region and demanding the release of commanders from The Hague.',
        o.sphere_of_influence = 'Serbia and the Balkan region'
    ;
MERGE (o:Organization {uuid: 'org_nato'})
    ON CREATE SET
        o.name = 'NATO',
        o.description = 'North Atlantic Treaty Organization; a military alliance designed to guarantee the security and defense of its member states through political and military means.',
        o.sphere_of_influence = 'North Atlantic region and international security matters.'
    ;
MERGE (o:Organization {uuid: 'org_cnn'})
    ON CREATE SET
        o.name = 'CNN',
        o.description = 'Cable News Network; an international news organization that broadcasts breaking news and in-depth coverage of global events.',
        o.sphere_of_influence = 'Global news dissemination.'
    ;
MERGE (o:Organization {uuid: 'org_serbian_special_police_units'})
    ON CREATE SET
        o.name = 'Serbian Special Police Units',
        o.description = 'A government law enforcement body in Serbia tasked with securing critical compounds and handling high-risk operations during internal security crises.',
        o.sphere_of_influence = 'Serbia'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_fault_lines'})
    ON CREATE SET
        ep.title = 'Episode One - Fault Lines',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Crisis in the Situation Room',
        s.description = 'In the early pre-dawn hours in the White House Situation Room, the atmosphere is heavy with tension. Dim lighting casts deep shadows across the faces of exhausted officials. Satellite imagery displays the troubled Kosovo-Serbia border region, setting a backdrop of international crisis. Josh Lyman enters, his nervous habit of rubbing an old scar hinting at past traumas, while National Security Advisor Nancy McNally commands the discussion with a grave announcement about four USAID workers gone dark during post-conflict assessments. The dialogue intensifies as Donna mentions a viral claim from a Serbian paramilitary group demanding the release of commanders from The Hague, and Kate Harper provides intelligence on alleged Serbian security support for the militants. The scene reaches a turning point with the entrance of President Bartlet, accompanied by Leo McGarry and General Alexander, whose presence shifts the room\'s energy into a focused and grim strategy session.',
        s.scene_number = 1
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Josh Lyman Enters the Situation Room',
        e.description = 'In the pre-dawn light, Josh Lyman enters the White House Situation Room. His tie is loosened and his demeanor reflects the early tension as he walks into the room, immediately hinting at the crisis ahead. He then takes his seat and unconsciously rubs the old scar on his chest—a reminder of past harrowing experiences at Rosslyn.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Nancy McNally Delivers the Crisis Briefing',
        e.description = 'Standing at the head of the table with her characteristic commanding presence tempered by concern, National Security Advisor Nancy McNally briefs the senior staff. She reports that contact with four USAID workers, engaged in post-conflict reconstruction assessments near the Kosovo-Serbia border, was lost three hours prior. The satellite imagery displayed on multiple LCD screens underscores the urgency of the situation.',
        e.sequence = 2,
        e.key_dialogue = ["Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Donna Moss Reports Social Media Claims',
        e.description = 'Following Nancy\'s briefing, Donna Moss provides an update from social media, revealing that the Serbian paramilitary group is claiming responsibility for the incident. She further relays that the group is demanding the release of three commanders from The Hague, adding another layer of complexity to the crisis.',
        e.sequence = 3,
        e.key_dialogue = ["Serbian paramilitary group is claiming responsibility on social media. They're demanding the release of three commanders from The Hague."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Kate Harper Provides Additional Intelligence',
        e.description = 'Kate Harper chimes in with critical intelligence details, suggesting that elements within Serbian security services may have provided tactical support to the paramilitary group. Her analysis injects further depth into the evolving narrative as the situation appears to involve not only insurgent forces but also state-linked operatives.',
        e.sequence = 4,
        e.key_dialogue = ["Our intelligence suggests elements within Serbian security services provided tactical support to the paramilitary group."]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'President Bartlet and Delegates Enter the Room',
        e.description = 'In a sudden shift marked by heightened formality, President Bartlet enters the Situation Room accompanied by Leo McGarry and General Alexander. The room immediately stands at attention. With a grim expression that replaces his usual intellectual playfulness, Bartlet inquires about the current options, signaling the escalation of the crisis.',
        e.sequence = 5,
        e.key_dialogue = ["Where are we on options?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Vulnerable Reflection in the Vice President\'s Office',
        s.description = 'The scene unfolds in the dimly lit Office of the Vice President, where Bob Russell sits alone under a solitary desk lamp, gazing at a cherished photograph of a younger, softer moment with Amanda Dalton. His carefully maintained political mask shows cracks as raw emotion seeps through. Margaret appears in the doorway, her discomfort evident as she reminds him that the waiting officials in the Situation Room call him back to duty. With this prompt, Bob carefully reconstructs his composed persona and prepares to return to the demands of his political role.',
        s.scene_number = 2
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Russell Reflects on Personal Memory',
        e.description = 'In the dark, intimate setting of the Vice President\'s Office, Bob Russell sits alone under the solitary glow of a desk lamp. He is absorbed in a framed photograph of himself teaching a young Amanda Dalton to fish at his Colorado lake house—a tender reminder of his past and personal ties. In this reflective moment, he remarks, \'She joined USAID because of him, you know,\' revealing the influence of personal history on his current political outlook.',
        e.sequence = 1,
        e.key_dialogue = ["She joined USAID because of him, you know."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Margaret\'s Courteous Reminder',
        e.description = 'As the personal reverie unfolds, Margaret appears in the doorway, visibly uneasy as she witnesses the intimate moment. She reminds Bob Russell that his presence is required elsewhere, informing him that the staff are waiting in the Situation Room.',
        e.sequence = 2,
        e.key_dialogue = ["Sir, they're waiting for you in the Situation Room."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Russell Explains the Political Implications',
        e.description = 'Prompted by Margaret\'s reminder, Bob Russell explains that the summons is a result of a presidential speech by Bartlet. He underscores the importance of America\'s duty to help rebuild war-torn regions and prevent future conflicts, thereby highlighting the inseparable link between personal conviction and political responsibility.',
        e.sequence = 3,
        e.key_dialogue = ["Because of a speech Bartlet gave. About America's obligation to help rebuild war-torn regions. To prevent the next conflict before it starts."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Russell Reconstructs His Persona',
        e.description = 'Concluding the emotionally charged moment, Bob Russell carefully replaces the photograph on his desk. This deliberate act symbolizes his effort to reconstruct his political persona and regain composure as he prepares to resume his official duties.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Diplomatic Tensions in the Mural Room',
        s.description = 'In the Mural Room, tension fills the air as the Russian Ambassador, Viktor Petrov, articulates Moscow\'s stance, arguing that any NATO intervention would breach Serbian sovereignty. President Bartlet challenges this position, questioning the nature of the kidnapping of American aid workers. Meanwhile, C.J. and Leo, quietly observing from the doorway, note the subtle physical cues from Bartlet, such as his clenched jaw and tightly clasped hands. A buzzing BlackBerry alerts C.J. to CNN breaking the news of Amanda Dalton\'s identity, forewarning of an impending media storm.',
        s.scene_number = 3
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Ambassador Petrov Delivers Moscow\'s Position',
        e.description = 'In the Mural Room, Russian Ambassador Viktor Petrov stands with perfect diplomatic posture and delivers Moscow\'s position, framing the crisis as an internal Serbian law enforcement matter. He warns that any NATO intervention would be a serious violation of sovereign territory.',
        e.sequence = 1,
        e.key_dialogue = ["AMBASSADOR PETROV: This is, as we see it, an internal Serbian law enforcement matter. Any NATO intervention would constitute a serious violation of sovereign territory."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'President Bartlet Challenges the Ambassador',
        e.description = 'President Bartlet responds forcefully to Ambassador Petrov\'s remarks, questioning the classification of the kidnapping of American aid workers as an internal matter, and thereby underlining the severity of the crisis.',
        e.sequence = 2,
        e.key_dialogue = ["PRESIDENT BARTLET: Mr. Ambassador, would you care to explain how the kidnapping of American aid workers constitutes an internal matter?"]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'C.J. Receives Breaking News Alert',
        e.description = 'As the tension builds, C.J. Cregg\'s Blackberry buzzes with urgent news alerts. The message reveals that CNN is running with Amanda Dalton\'s identity, signaling an impending media storm and adding pressure to the evolving crisis management efforts in the room.',
        e.sequence = 3,
        e.key_dialogue = ["C.J.: Sir, CNN is running with Amanda Dalton's identity."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Debating Tragedy and Restraint',
        s.description = 'In the windowless Steam Pipe Trunk Distribution Venue, Sam Seaborn is immersed in a tense creative process, surrounded by crumpled papers and empty coffee cups as his laptop displays two contrasting documents — one for victory, one for tragedy. In a quiet yet charged atmosphere, Toby Ziegler observes from the doorway, concerned about his deputy\'s struggle. Their conversation delves into the difficulty of crafting poetry out of political violence and reconciling the challenge of upholding their moral purpose amidst the harsh realities of their work.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_steam_pipe_trunk_distribution_venue'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Sam Focuses on His Dual Drafts',
        e.description = 'In the windowless Steam Pipe Trunk Distribution Venue, Sam Seaborn sits amid crumpled papers and empty coffee cups, his attention fixed on his glowing laptop screen that displays two distinct presidential address drafts—one for victory and one for tragedy. Toby Ziegler stands in the doorway, watching with quiet concern as the intensity of the moment settles in.',
        e.sequence = 1,
        e.key_dialogue = ["The thing about tragedy is that it demands poetry. But how do you make poetry out of political violence?"]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Toby Emphasizes the Value of Restraint',
        e.description = 'Responding to Sam\'s provocative question, Toby Ziegler reflects on the nature of political messaging. He underscores that sometimes the true poetry lies in restraint, and he emphasizes the need to continually remind the public of why aid workers are sent into dangerous places to rebuild what has been destroyed.',
        e.sequence = 2,
        e.key_dialogue = ["Sometimes poetry is in the restraint. We need to remind people why we send aid workers into dangerous places. Why we try to rebuild what others have destroyed."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Sam Recalls Post-Rosslyn Counsel',
        e.description = 'Visibly affected by the conversation, Sam Seaborn lets his guard down as he reflects on advice given to him after the Rosslyn incident. His personal recollection reveals the lasting impact of that moment and the enduring expectation that they should always aim to be the \'good guys,\' despite the heavy burdens of their roles.',
        e.sequence = 3,
        e.key_dialogue = ["I keep thinking about what you said after Rosslyn. About how we're supposed to be the good guys."]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'Toby Reaffirms Their Commitment',
        e.description = 'In the closing moments of the scene, Toby Ziegler reaffirms his belief in their integrity, acknowledging the difficulty of consistently upholding ethical standards in times of crisis. His concise declaration serves as a grounding reassurance amid the emotional turbulence stirred by past events.',
        e.sequence = 4,
        e.key_dialogue = ["We still are. That's why this is hard."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Crisis Unfolds in the Oval Office',
        s.description = 'In the Oval Office, rain streams down the windows as Kate Harper bursts in to announce that Serbian special police units have secured the compound and all hostages are safe. The relief among the senior staff contrasts with Josh\'s troubled reflection on the night’s events and the moral complexities of their actions. As Donna approaches him for comfort, President Bartlet, still under strain, commands Charlie to contact President Kovach and bipartisan leaders, emphasizing the need for transparency about the crisis and its near-catastrophic implications.',
        s.scene_number = 5
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Kate Harper\'s Crucial Announcement',
        e.description = 'Kate Harper bursts into the Oval Office during a tense strategy session, interrupting the mood with breaking news. She declares that Serbian special police units have secured the compound and that all hostages are safe, shifting the room\'s atmosphere toward relief.',
        e.sequence = 1,
        e.key_dialogue = ["Serbian special police units have secured the compound. All hostages are safe."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Josh Lyman\'s Reflective Recollection',
        e.description = 'Despite the relief in the room following the announcement, Josh Lyman remains by the window, visibly troubled. Donna Moss approaches him quietly, and a reflective exchange ensues where Josh admits his inner conflict—acknowledging that while they might have averted disaster, there is fear over succeeding by compromising their values.',
        e.sequence = 2,
        e.key_dialogue = ["For about twenty minutes there, when we thought we'd lost them... I understood why nations go to war. Why they abandon principles for revenge.", "But we didn't.", "That's what scares me. Not that we might have failed, but that we might have succeeded in the wrong way."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'President Bartlet Orders Transparency',
        e.description = 'From behind the iconic Resolute Desk, President Bartlet observes the lingering tension among his staff. He issues a firm command to Charlie Young to retrieve President Kovach and assemble the leadership from both parties, insisting that the American people be informed just how dangerously close the nation came to the brink.',
        e.sequence = 3,
        e.key_dialogue = ["Charlie, get me President Kovach. And then the leadership of both parties. The American people deserve to know how close we came to the brink today - and who pushed us there."]
    ;
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_framed_photograph_fishing'}),
          (a:Agent {uuid: 'agent_bob_russell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_blackberry_phone'}),
          (a:Agent {uuid: 'agent_cj_cregg'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sam_laptop'}),
          (a:Agent {uuid: 'agent_sam_seaborn'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_amanda_dalton'}),
          (o:Organization {uuid: 'org_usaid'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_1'})
    ON CREATE SET
        oi.description = 'The LCD screens in the pre-dawn White House Situation Room display live satellite imagery of the Kosovo-Serbia border region, setting the visual context for the briefing on lost USAID workers and emerging crisis details.',
        oi.status_before = 'The screens were illuminated softly in the dim pre-dawn light, displaying static or previous imagery.',
        oi.status_after = 'The LCD screens continue to actively display updated satellite imagery, serving as a live intelligence feed for the unfolding situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_2'})
    ON CREATE SET
        oi.description = 'The LCD screens in the Situation Room display live satellite imagery of the Kosovo-Serbia border, visually underscoring Nancy McNally\'s briefing about the lost contact with the USAID workers and the crisis at hand.',
        oi.status_before = 'The LCD screens were functioning normally, routinely displaying satellite imagery as part of the Situation Room\'s monitoring setup.',
        oi.status_after = 'The LCD screens continue to display the satellite imagery, maintaining their operational role as a critical information display throughout the briefing.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_3'})
    ON CREATE SET
        oi.description = 'In the Situation Room, the LCD screens display satellite imagery of the Kosovo-Serbia border, visually reinforcing the crisis context during Nancy McNally\'s briefing and Donna Moss\' social media update.',
        oi.status_before = 'The screens were part of the standard setup in the room, likely displaying routine or standby imagery before the briefing.',
        oi.status_after = 'The screens continue displaying the real-time satellite imagery, emphasizing the evolving severity of the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_4'})
    ON CREATE SET
        oi.description = 'In the pre-dawn Situation Room, the LCD screens display real-time satellite imagery of the Kosovo-Serbia border region. This imagery underpins the critical intelligence provided by Kate Harper regarding the involvement of Serbian security services in aiding the paramilitary group.',
        oi.status_before = 'The LCD screens were routinely operational, displaying standard satellite imagery for monitoring purposes.',
        oi.status_after = 'The LCD screens continue to display the satellite imagery, now serving as a key visual element that corroborates the evolving intelligence narrative.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_lcd_screens_event_1_5'})
    ON CREATE SET
        oi.description = 'The LCD screens display the satellite imagery of the Kosovo-Serbia border region, setting a stark visual backdrop for the Situation Room as President Bartlet, Leo McGarry, and General Alexander enter and the crisis escalates.',
        oi.status_before = 'The LCD screens were already active, displaying continuous satellite imagery under the dim pre-dawn lighting of the Situation Room.',
        oi.status_after = 'The LCD screens continue to display the crucial imagery, intensifying the atmosphere of urgency and informing the discussions that follow.'
    WITH oi
    MATCH (o:Object {uuid: 'object_lcd_screens'})
    MATCH (e:Event {uuid: 'event_1_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Stands at the head of the table, delivering a briefing about four USAID workers who went dark near the Kosovo-Serbia border.',
        ap.emotional_state = 'Commanding yet clearly concerned, with an undercurrent of urgency.',
        ap.emotional_tags = ["Comm", "ing yet clearly concerned, with an undercurrent of urgency."],
        ap.active_plans = ["Relay critical intelligence to the team", "Coordinate a rapid crisis response"],
        ap.beliefs = ["Clear, direct communication is essential in crisis management", "Accurate intelligence will lead to effective action"],
        ap.goals = ["Re-establish contact with the aid workers", "Ensure the situation is contained and addressed promptly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Enters the Situation Room with a loosened tie, takes his seat, and unconsciously rubs the scar on his chest.',
        ap.emotional_state = 'Tense and reflective, visibly burdened by past harrowing experiences at Rosslyn.',
        ap.emotional_tags = ["Tense", "reflective, visibly burdened by past harrowing experiences at Rosslyn."],
        ap.active_plans = ["Absorb and assess the unfolding crisis", "Prepare to contribute strategic insights"],
        ap.beliefs = ["Past traumas inform present caution and thoroughness", "Every detail matters in crisis resolution"],
        ap.goals = ["Gain a clear understanding of the situation", "Support the team in making informed decisions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Provides crucial updates, noting that the Serbian paramilitary group is claiming responsibility on social media and demanding the release of three commanders from The Hague.',
        ap.emotional_state = 'Alert and factual, with an underlying sense of urgency.',
        ap.emotional_tags = ["Alert", "factual, with an underlying sense of urgency."],
        ap.active_plans = ["Deliver real-time operational updates", "Ensure that all emerging intelligence is communicated accurately"],
        ap.beliefs = ["Timely and precise information is vital in managing the crisis", "Transparency in communication can guide effective responses"],
        ap.goals = ["Maintain an accurate flow of information", "Support operational clarity during the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Shares intelligence that elements within Serbian security services have provided tactical support to the paramilitary group.',
        ap.emotional_state = 'Calm and analytical, focused on deciphering intelligence data.',
        ap.emotional_tags = ["Calm", "analytical, focused on deciphering intelligence data."],
        ap.active_plans = ["Analyze incoming intelligence details", "Provide strategic recommendations based on evidence"],
        ap.beliefs = ["Thorough intelligence analysis is key to understanding enemy actions", "Strategic insights are crucial for decisive action"],
        ap.goals = ["Influence the decision-making process with clear analysis", "Ensure recommendations are evidence-based"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Enters the room alongside Leo McGarry and General Alexander; assesses the situation with a grim expression and inquires about operational options.',
        ap.emotional_state = 'Grim and determined, devoid of his usual playfulness; reflects the gravity of the moment.',
        ap.emotional_tags = ["Grim", "determined, devoid of his usual playfulness; reflects the gravity of the moment."],
        ap.active_plans = ["Evaluate available options for crisis resolution", "Steer the discussion towards decisive action"],
        ap.beliefs = ["Strong, informed leadership is critical in moments of national crisis", "Decisiveness can prevent further escalation"],
        ap.goals = ["Direct the team to formulate a robust response plan", "Safeguard national security and public trust"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Accompanies President Bartlet into the Situation Room, observing the proceedings with attentive resolve.',
        ap.emotional_state = 'Focused, vigilant, and quietly supportive, ready to back the President\'s decisions.',
        ap.emotional_tags = ["Focused, vigilant,", "quietly supportive, ready to back the President's decisions."],
        ap.active_plans = ["Monitor the evolving situation closely", "Facilitate orderly communication among staff"],
        ap.beliefs = ["Team cohesion and calm leadership strengthen crisis response", "Steady support in the background is key to operational success"],
        ap.goals = ["Ensure internal processes support the President's directives", "Keep the team coordinated in real-time"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Enters alongside President Bartlet and his team, his presence emphasizing the military perspective in the ongoing crisis.',
        ap.emotional_state = 'Commanding and alert, exuding readiness and discipline.',
        ap.emotional_tags = ["Comm", "ing", "alert, exuding readiness", "discipline."],
        ap.active_plans = ["Provide military insight into the crisis response", "Assess tactical implications of the unfolding events"],
        ap.beliefs = ["Military readiness and precision are vital for national security", "Tactical evaluation must underpin every strategic decision"],
        ap.goals = ["Advise on appropriate security responses", "Contribute to efforts aimed at de-escalating the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Briefing senior staff on the loss of contact with USAID workers and highlighting the urgency of the situation.',
        ap.emotional_state = 'Commanding yet clearly concerned',
        ap.emotional_tags = ["Comm", "ing yet clearly concerned"],
        ap.active_plans = ["Initiate search and rescue operations", "Gather additional satellite and on-ground intelligence"],
        ap.beliefs = ["Decisive action is essential in crisis management", "Transparency and clear communication support effective resolutions"],
        ap.goals = ["Restore contact with the aid workers", "Ensure the safety and effectiveness of post-conflict assessments"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room and taking his seat while unconsciously rubbing his old scar.',
        ap.emotional_state = 'Tense and reflective, haunted by past crises',
        ap.emotional_tags = ["Tense", "reflective, haunted by past crises"],
        ap.active_plans = ["Monitor and assess incoming information", "Support strategic discussions with measured input"],
        ap.beliefs = ["Past experiences demand careful, deliberate action", "Crisis moments reveal important lessons that shape future decisions"],
        ap.goals = ["Contribute to a thoughtful resolution of the unfolding crisis", "Ensure that historical warnings are integrated into current strategies"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Reporting that a Serbian paramilitary group is claiming responsibility on social media and demanding the release of three commanders.',
        ap.emotional_state = 'Alert, focused, and precise',
        ap.emotional_tags = ["Alert, focused,", "precise"],
        ap.active_plans = ["Relay critical intelligence to the team", "Facilitate effective communication among crisis responders"],
        ap.beliefs = ["Accurate intelligence is key to managing the crisis", "Sharing timely information helps unite the team\u2019s efforts"],
        ap.goals = ["Ensure that all available intelligence informs the crisis strategy", "Support decisive actions based on clear, verified data"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Presenting detailed intelligence analysis regarding elements within Serbian security services supporting paramilitary actions.',
        ap.emotional_state = 'Calm, analytical, and methodical',
        ap.emotional_tags = ["Calm, analytical,", "methodical"],
        ap.active_plans = ["Evaluate additional intelligence sources", "Clarify tactical implications of the support provided to the paramilitary group"],
        ap.beliefs = ["Data-driven analysis is critical for effective decision-making", "Understanding the enemy\u2019s structure is essential to formulating a sound response"],
        ap.goals = ["Provide clarity on the involved actors and their connections", "Set the stage for strategic recommendations based on robust intelligence"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Entering the room with a grim expression and seeking an update on strategic options.',
        ap.emotional_state = 'Grim, resolute, and deeply focused',
        ap.emotional_tags = ["Grim, resolute,", "deeply focused"],
        ap.active_plans = ["Assess available options", "Steer the conversation towards developing a clear, actionable strategy"],
        ap.beliefs = ["Strong, decisive leadership is crucial during crisis moments", "Every decision must balance national security with broader geopolitical implications"],
        ap.goals = ["Ensure that the situation is managed with efficiency and authority", "Maintain the nation's safety while addressing emerging threats"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Present in the Situation Room to support the President and ensure orderly crisis management.',
        ap.emotional_state = 'Steady, vigilant, and supportive',
        ap.emotional_tags = ["Steady, vigilant,", "supportive"],
        ap.active_plans = ["Coordinate staff efforts behind the scenes", "Support the President's strategic directives"],
        ap.beliefs = ["Effective coordination is the backbone of crisis management", "Team unity amplifies the strength of leadership"],
        ap.goals = ["Ensure a smooth execution of crisis response measures", "Maintain safety and clarity within the White House command structure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Accompanying the President and reviewing military perspectives regarding the evolving situation.',
        ap.emotional_state = 'Authoritative, focused, and practical',
        ap.emotional_tags = ["Authoritative, focused,", "practical"],
        ap.active_plans = ["Evaluate and advise on military options", "Ensure that defense strategies are synchronized with executive decisions"],
        ap.beliefs = ["Military readiness is a critical component of national security", "Solid defense strategies bolster overall crisis management"],
        ap.goals = ["Offer clear military guidance during this critical junction", "Support the development of a coordinated executive response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Conducting a high-stakes briefing about the loss of USAID workers and identifying potential external threats.',
        ap.emotional_state = 'Serious and concerned, with a controlled urgency.',
        ap.emotional_tags = ["Serious", "concerned, with a controlled urgency."],
        ap.active_plans = ["Coordinate with intelligence for further updates", "Establish communication channels for crisis management"],
        ap.beliefs = ["Accurate information is key to managing the crisis effectively", "Swift action can prevent further escalation"],
        ap.goals = ["Ensure clear understanding of the evolving situation", "Guide the leadership in making informed decisions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room, taking his seat and reflecting on past trauma as he observes the unfolding crisis.',
        ap.emotional_state = 'Tense and introspective, with a hint of personal apprehension.',
        ap.emotional_tags = ["Tense", "introspective, with a hint of personal apprehension."],
        ap.active_plans = ["Absorb and assess all incoming information", "Prepare to contribute strategic insights based on past experiences"],
        ap.beliefs = ["Crisis situations echo past challenges and demand both emotional and strategic responses"],
        ap.goals = ["Understand the full scope of the crisis", "Support the leadership with insightful feedback"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Providing a live update from social media about the Serbian paramilitary group\'s claim and its demand for the release of three commanders.',
        ap.emotional_state = 'Alert and determined, focused on relaying critical real-time intelligence.',
        ap.emotional_tags = ["Alert", "determined, focused on relaying critical real-time intelligence."],
        ap.active_plans = ["Monitor social media for further developments", "Cross-reference incoming data with existing intelligence"],
        ap.beliefs = ["Real-time updates are crucial to piecing together the broader picture of the unfolding crisis"],
        ap.goals = ["Enhance situational awareness among the team", "Ensure that decision-makers have access to all pertinent information"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Providing intelligence on possible support links between Serbian security services and the paramilitary group.',
        ap.emotional_state = 'Analytical and focused, maintaining a calm professionalism.',
        ap.emotional_tags = ["Analytical", "focused, maintaining a calm professionalism."],
        ap.active_plans = ["Analyze intelligence data for confirmation of external support", "Validate emerging theories with available evidence"],
        ap.beliefs = ["Precise intelligence is essential for uncovering hidden alliances in the crisis"],
        ap.goals = ["Support strategic decision-making with thorough analytical insights", "Clarify the nature and extent of external involvement"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room with his senior staff and demanding a briefing on available options.',
        ap.emotional_state = 'Grim and resolute, with a sense of sober determination.',
        ap.emotional_tags = ["Grim", "resolute, with a sense of sober determination."],
        ap.active_plans = ["Solicit comprehensive position reports from his advisors", "Evaluate all strategic options swiftly"],
        ap.beliefs = ["Decisive leadership in crisis is essential to maintain national security", "Every decision carries weight and must be backed by clear intelligence"],
        ap.goals = ["Establish clear strategic directions", "Prevent the crisis from escalating further"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Accompanying President Bartlet and closely monitoring the situation, providing support and strategic guidance.',
        ap.emotional_state = 'Serious and attentive, with a hint of underlying urgency.',
        ap.emotional_tags = ["Serious", "attentive, with a hint of underlying urgency."],
        ap.active_plans = ["Coordinate among staff to ensure efficient information flow", "Support the President with timely situational updates"],
        ap.beliefs = ["A disciplined and coordinated response is key to crisis management"],
        ap.goals = ["Assist in streamlining the decision-making process", "Ensure that every facet of the crisis is being addressed promptly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room as the military representative, standing ready to advise on security and tactical responses.',
        ap.emotional_state = 'Professional and focused, exuding disciplined resolve.',
        ap.emotional_tags = ["Professional", "focused, exuding disciplined resolve."],
        ap.active_plans = ["Assess military implications of the crisis", "Prepare strategic recommendations for possible security operations"],
        ap.beliefs = ["Military preparedness is critical to safeguard national interests in times of crisis"],
        ap.goals = ["Provide clear and actionable military insights", "Support the overall strategic response with tactical advice"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Leading the briefing in the Situation Room, delivering the critical update about the USAID workers going dark near the Kosovo-Serbia border.',
        ap.emotional_state = 'Commanding yet clearly concerned about the unfolding crisis.',
        ap.emotional_tags = ["Comm", "ing yet clearly concerned about the unfolding crisis."],
        ap.active_plans = ["Coordinate crisis response", "Gather and verify emerging intelligence", "Establish communication channels to locate USAID workers"],
        ap.beliefs = ["Accurate intelligence is crucial to make decisive interventions", "A prompt and coordinated response will stabilize the situation"],
        ap.goals = ["Restore contact with the USAID team", "Ensure overall situation control and staff safety"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room and taking a seat, subtly expressing his inner tension as he rubs his old chest scar.',
        ap.emotional_state = 'Reflective and edged with personal anxiety due to past crises.',
        ap.emotional_tags = ["Reflective", "edged with personal anxiety due to past crises."],
        ap.active_plans = ["Monitor the unfolding situation closely", "Coordinate with senior staff on response efforts"],
        ap.beliefs = ["Past experiences can guide current crisis management", "Every detail matters when lives and national interests are at stake"],
        ap.goals = ["Ensure an effective and timely crisis resolution", "Support decisive leadership with informed perspective"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Promptly providing an update on social media claims that a Serbian paramilitary group is responsible and demanding the release of three commanders.',
        ap.emotional_state = 'Alert and measured, ensuring critical information is relayed accurately.',
        ap.emotional_tags = ["Alert", "measured, ensuring critical information is relayed accurately."],
        ap.active_plans = ["Relay real-time updates", "Corroborate intelligence from multiple sources"],
        ap.beliefs = ["Timely communication of intelligence is vital to avoid misinformation", "The situation\u2019s complexity requires thorough vetting of every claim"],
        ap.goals = ["Enhance situational awareness among the team", "Assist in forming a comprehensive response strategy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Delivering a critical piece of intelligence that links Serbian security services to providing tactical support to the paramilitary group.',
        ap.emotional_state = 'Focused and analytical, with an undercurrent of urgency in her tone.',
        ap.emotional_tags = ["Focused", "analytical, with an undercurrent of urgency in her tone."],
        ap.active_plans = ["Provide refined intelligence analysis", "Validate the emerging connection between state operatives and insurgent tactics"],
        ap.beliefs = ["Understanding hidden links in adversary support systems is key to effective intervention", "Deep intelligence insights can reshape crisis response strategies"],
        ap.goals = ["Ensure that the intelligence informs both tactical and strategic decisions", "Contribute to the broader understanding of the crisis dynamics"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Entering the Situation Room with his senior advisors and immediately inquiring about available strategic options.',
        ap.emotional_state = 'Grim and solemn, with an absence of his usual intellectual levity, reflecting deep focus on the crisis.',
        ap.emotional_tags = ["Grim", "solemn, with an absence of his usual intellectual levity, reflecting deep focus on the crisis."],
        ap.active_plans = ["Assess available options for national security response", "Direct the team to consolidate all intelligence for decision-making"],
        ap.beliefs = ["Decisive leadership is essential even under extreme pressure", "Every decision made now affects the nation's future"],
        ap.goals = ["Formulate a clear and effective response strategy", "Ensure accountability and transparency in the decision-making process"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Accompanying President Bartlet into the Situation Room, maintaining a poised and supportive presence.',
        ap.emotional_state = 'Steady and resolute, though carrying the weight of the unfolding crisis.',
        ap.emotional_tags = ["Steady", "resolute, though carrying the weight of the unfolding crisis."],
        ap.active_plans = ["Advise the President on operational and strategic matters", "Ensure smooth coordination among the senior staff"],
        ap.beliefs = ["A unified command is critical to navigating crises", "Strategic clarity under pressure prevents chaos"],
        ap.goals = ["Support effective decision-making by the President", "Facilitate a coordinated response to the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Entering alongside the President and Leo as a military advisor, ready to offer insights on tactical responses.',
        ap.emotional_state = 'Disciplined and alert, prepared to contribute military expertise to the crisis discussion.',
        ap.emotional_tags = ["Disciplined", "alert, prepared to contribute military expertise to the crisis discussion."],
        ap.active_plans = ["Evaluate possible military options", "Align tactical plans with the broader strategic objectives of the administration"],
        ap.beliefs = ["A prompt and decisive military assessment can prevent further escalation", "Integration of intelligence and military strategy is essential for national security"],
        ap.goals = ["Advise on calibrated use of force if necessary", "Support a stable, secure resolution with minimized collateral consequences"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Enters the Situation Room with a grim expression and immediately inquires, \'Where are we on options?\'',
        ap.emotional_state = 'Grim and resolute, with his usual playfulness replaced by the somber weight of the crisis.',
        ap.emotional_tags = ["Grim", "resolute, with his usual playfulness replaced by the somber weight of the crisis."],
        ap.active_plans = ["Assess available options and direct immediate crisis response"],
        ap.beliefs = ["Crisis situations require decisive action over intellectual banter", "Maintaining control and clarity is crucial in moments of urgency"],
        ap.goals = ["Ensure the crisis is managed effectively", "Have clear strategic options to address the unfolding situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Accompanies President Bartlet into the Situation Room, standing at attention and ready to support.',
        ap.emotional_state = 'Steely, dutiful, and quietly resolute under pressure.',
        ap.emotional_tags = ["Steely, dutiful,", "quietly resolute under pressure."],
        ap.active_plans = ["Provide strategic counsel and back up the President\u2019s directives"],
        ap.beliefs = ["Loyalty and precise, strategic response are essential during crises"],
        ap.goals = ["Ensure that the administration's strategy is sound and effectively implemented", "Support the President in making rapid, informed decisions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Enters with President Bartlet and Leo McGarry, standing at attention as a visible symbol of military readiness.',
        ap.emotional_state = 'Alert, disciplined, and prepared for decisive action.',
        ap.emotional_tags = ["Alert, disciplined,", "prepared for decisive action."],
        ap.active_plans = ["Advise on and prepare military options in response to the escalating situation"],
        ap.beliefs = ["Military preparedness is critical in a crisis", "A swift, coordinated response minimizes risks"],
        ap.goals = ["Provide expert military guidance to inform strategic decisions", "Ensure readiness for any necessary implementation of force"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_lamp_event_2_1'})
    ON CREATE SET
        oi.description = 'The desk lamp casts a solitary, warm glow over the Vice President\'s Office, setting the intimate and reflective atmosphere in which Bob Russell contemplates his past and present responsibilities.',
        oi.status_before = 'The desk lamp was lit, providing a focused pool of light in an otherwise dark room.',
        oi.status_after = 'The desk lamp continues to emit its steady glow, maintaining the quiet ambiance of the office as the scene progresses.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_lamp'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_fishing_event_2_1'})
    ON CREATE SET
        oi.description = 'The framed photograph, depicting Bob Russell teaching a young Amanda Dalton to fish, serves as a poignant reminder of his personal history. It is examined with sentimental attention before being carefully returned to its place, symbolizing his struggle to balance personal emotion with his political persona.',
        oi.status_before = 'The photograph was placed on the desk, prominently displayed as a cherished memento from Bob Russell\'s past.',
        oi.status_after = 'After being closely examined and momentarily disrupting his composed exterior, the photograph is quietly returned to its place on the desk, reinforcing Bob Russell’s efforts to regain control of his public image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph_fishing'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_fishing_event_2_2'})
    ON CREATE SET
        oi.description = 'In the Vice President\'s Office, Bob Russell gazes at his framed photograph—a personal memento of a younger, more innocent time—reflecting his inner vulnerability. Later, he carefully replaces the photograph on his desk, signaling the effort to reconstruct his public persona.',
        oi.status_before = 'The framed photograph is prominently displayed on the desk, evoking personal memories.',
        oi.status_after = 'The photograph is carefully repositioned on the desk as Bob restores his composed external demeanor.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph_fishing'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_lamp_event_2_2'})
    ON CREATE SET
        oi.description = 'The solitary desk lamp illuminates the dim Vice President\'s Office, casting a warm, intimate glow that accentuates Bob Russell\'s moment of personal introspection and the emotional gravity of the scene.',
        oi.status_before = 'The desk lamp is already lit, providing a focused pool of light that defines the quiet, solitary ambiance of the office.',
        oi.status_after = 'The desk lamp continues to cast its warm light, maintaining the intimate atmosphere as the scene shifts from private vulnerability to the impending demands of duty.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_lamp'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_lamp_event_2_3'})
    ON CREATE SET
        oi.description = 'The desk lamp casts the only light in the dark Vice President\'s Office, setting an intimate tone as Bob Russell reflects on his personal memories and political responsibilities highlighted by Bartlet\'s speech.',
        oi.status_before = 'The desk lamp was already illuminating the room with a solitary, warm glow.',
        oi.status_after = 'The desk lamp continues to shine steadily, reinforcing the scene\'s atmosphere of introspection and reserved emotional exposure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_lamp'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_fishing_event_2_3'})
    ON CREATE SET
        oi.description = 'The framed photograph, showing Bob Russell teaching a young Amanda Dalton to fish, serves as a poignant reminder of his personal convictions and vulnerabilities. In the event, it triggers a moment of raw emotion before he meticulously returns it to his desk, symbolizing his effort to reconstruct his public persona.',
        oi.status_before = 'The photograph was displayed prominently on his desk, evoking cherished memories and a connection to a simpler, more personal past.',
        oi.status_after = 'After reflecting on its meaning, Bob carefully replaces the photograph, signaling a deliberate reassembly of his political mask in response to the presidential speech.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph_fishing'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_framed_photograph_fishing_event_2_4'})
    ON CREATE SET
        oi.description = 'Bob Russell carefully replaces the framed photograph on his desk, using this act to symbolically reconstruct his political persona and regain his composure.',
        oi.status_before = 'The framed photograph had been removed from its proper place on the desk as Bob Russell was immersed in a moment of vulnerable reflection.',
        oi.status_after = 'The framed photograph is reinstated on the desk, now serving as a stabilizing symbol of Bob Russell’s renewed commitment to his official duties.'
    WITH oi
    MATCH (o:Object {uuid: 'object_framed_photograph_fishing'})
    MATCH (e:Event {uuid: 'event_2_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Sitting alone under the solitary glow of a desk lamp, absorbed in a framed photograph that evokes cherished memories and personal ties.',
        ap.emotional_state = 'Vulnerable and reflective, with a hint of internal conflict as his personal sentiment clashes with political duty.',
        ap.emotional_tags = ["Vulnerable", "reflective, with a hint of internal conflict as his personal sentiment clashes with political duty."],
        ap.active_plans = ["Reconstruct his political persona before returning to official responsibilities", "Address the implications of Bartlet's speech on national obligations"],
        ap.beliefs = ["Personal history significantly influences political and public decisions", "Emotional connections can both strengthen and complicate leadership"],
        ap.goals = ["Balance his private tenderness with the demands of his political role", "Project strength and decisiveness upon re-entering the Situation Room"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway, observing the intimate moment with clear discomfort, yet acting to remind him of his duties.',
        ap.emotional_state = 'Uneasy and tentative, driven by a sense of duty.',
        ap.emotional_tags = ["Uneasy", "tentative, driven by a sense of duty."],
        ap.active_plans = ["Prompt Bob Russell to transition back to his professional responsibilities", "Ensure that protocol is maintained by notifying him of the waiting staff"],
        ap.beliefs = ["Duty and timeliness are essential in the operation of the White House", "Professional boundaries must be maintained even during personal moments"],
        ap.goals = ["Facilitate a smooth return to crisis management procedures", "Support the Vice President in balancing personal reflection with his official role"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Staring at a cherished photograph and reflecting on personal memories while slowly transitioning back into his public role.',
        ap.emotional_state = 'Vulnerable and introspective, yet consciously striving to regain his composure and political mask.',
        ap.emotional_tags = ["Vulnerable", "introspective, yet consciously striving to regain his composure", "political mask."],
        ap.active_plans = ["Reconstruct his public persona by shifting focus from personal reverie to official duties in the Situation Room."],
        ap.beliefs = ["Believes that balancing personal emotion with duty is essential to effective leadership.", "Holds that Bartlet\u2019s speech reinforces the nation's obligation to prevent conflict and rebuild."],
        ap.goals = ["Attend the Situation Room briefing to address pressing national issues.", "Maintain the confidence of his staff by transitioning from personal reflection to decisive action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway, visibly uneasy as she witnesses Bob’s private moment and promptly reminds him of his responsibilities.',
        ap.emotional_state = 'Uneasy and conflicted, balancing empathy with duty.',
        ap.emotional_tags = ["Uneasy", "conflicted, balancing empathy with duty."],
        ap.active_plans = ["Prompt Bob Russell to leave his personal reverie and join the Situation Room meeting."],
        ap.beliefs = ["Believes in the importance of adhering to protocol and timely response during crises.", "Thinks that maintaining order is essential even in moments of personal vulnerability."],
        ap.goals = ["Ensure that Bob Russell attends to his responsibilities in the Situation Room.", "Help restore the flow of official business by redirecting his focus from personal matters."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Seated alone in the dark Vice President\'s Office, Bob Russell reflects deeply on his past and the personal meaning behind USAID\'s work, verbalizing the implications of Bartlet\'s speech.',
        ap.emotional_state = 'Vulnerable and reflective, yet gradually regaining composure as he reconstructs his political persona.',
        ap.emotional_tags = ["Vulnerable", "reflective, yet gradually regaining composure as he reconstructs his political persona."],
        ap.active_plans = ["Transition from personal introspection to fulfilling his duties in the Situation Room", "Reassert his leadership and political mask for the task ahead"],
        ap.beliefs = ["America has an obligation to rebuild war-torn regions", "Personal conviction is inseparable from political responsibility"],
        ap.goals = ["Address the immediate demands of the Situation Room", "Maintain integrity while balancing personal emotion with public duty"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway, Margaret observes the vulnerable moment of Bob Russell and promptly reminds him of his next duty—attending to the Situation Room.',
        ap.emotional_state = 'Uncomfortable yet resolute, mixing empathy for his private moment with a strong sense of duty.',
        ap.emotional_tags = ["Uncomfortable yet resolute, mixing empathy for his private moment with a strong sense of duty."],
        ap.active_plans = ["Ensure that Bob Russell transitions to his formal responsibilities in the Situation Room"],
        ap.beliefs = ["Timeliness and adherence to duty are paramount in crisis situations", "Personal moments should not derail the operational flow of governance"],
        ap.goals = ["Facilitate a smooth transition to crisis management", "Maintain the necessary accountability for leaders during critical moments"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Places the framed photograph carefully back on his desk, consciously reconstructing his political persona.',
        ap.emotional_state = 'Exhibiting raw emotion that is gradually replaced by a determined resolve to resume his official duties.',
        ap.emotional_tags = ["Exhibiting raw emotion that is gradually replaced by a determined resolve to resume his official duties."],
        ap.active_plans = ["Regain composure for the upcoming Situation Room briefing", "Reassert his leadership role and political image"],
        ap.beliefs = ["A deliberate and symbolic act can restore his public image", "Maintaining a controlled persona is essential for effective leadership"],
        ap.goals = ["Transition from personal vulnerability to professional decisiveness", "Prepare mentally and emotionally for the responsibilities ahead"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Stands in the doorway, expressing discomfort while delivering urgent information.',
        ap.emotional_state = 'Uneasy and concerned about interrupting a private, emotional moment.',
        ap.emotional_tags = ["Uneasy", "concerned about interrupting a private, emotional moment."],
        ap.active_plans = ["Prompt Bob Russell about his scheduled engagement in the Situation Room", "Ensure that the official duties are not delayed by personal moments"],
        ap.beliefs = ["Timeliness and duty must override personal sentiment in critical moments", "Even sensitive personal reflections must yield to the demands of office"],
        ap.goals = ["Facilitate the smooth transition from personal reflection to official responsibility", "Keep the chain of command informed and on schedule"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blackberry_phone_event_3_1'})
    ON CREATE SET
        oi.description = 'During the tense exchange in the Mural Room, C.J.\'s BlackBerry Phone buzzes with urgent news alerts, signaling the breaking news about Amanda Dalton\'s identity and prefiguring the impending media storm.',
        oi.status_before = 'The BlackBerry Phone was in its inactive state, awaiting incoming communications.',
        oi.status_after = 'The phone buzzed with critical news alerts, highlighting the escalation of the crisis and impacting C.J.\'s composure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blackberry_phone'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blackberry_phone_event_3_2'})
    ON CREATE SET
        oi.description = 'C.J.\'s Blackberry Phone buzzes with urgent news alerts from CNN about Amanda Dalton\'s identity, heightening the tension in the room as the crisis unfolds.',
        oi.status_before = 'The Blackberry Phone was in a standby state, unobtrusively resting in C.J.\'s possession.',
        oi.status_after = 'The Blackberry Phone is actively displaying urgent news alerts, signaling the immediate impact of the media storm on the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blackberry_phone'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blackberry_phone_event_3_3'})
    ON CREATE SET
        oi.description = 'C.J. Cregg’s Blackberry Phone buzzes with urgent news alerts that reveal CNN is running with Amanda Dalton\'s identity, highlighting the onset of a media storm and escalating crisis pressure.',
        oi.status_before = 'The Blackberry phone was in standby mode, awaiting notifications.',
        oi.status_after = 'The phone has vibrated to deliver urgent alerts, alerting C.J. to the unfolding media scenario.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blackberry_phone'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Stands with perfect diplomatic posture, delivering Moscow\'s position that frames the crisis as an internal Serbian law enforcement matter while warning against NATO intervention.',
        ap.emotional_state = 'Calm, measured, and authoritative.',
        ap.emotional_tags = ["Calm, measured,", "authoritative."],
        ap.active_plans = ["Clearly communicate Russia's stance and dissuade Western intervention."],
        ap.beliefs = ["Believes the crisis is an internal Serbian matter and that NATO interference would violate sovereign rights."],
        ap.goals = ["Maintain and project Russia's diplomatic position to mitigate external involvement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Engages the ambassador by questioning the framing of the crisis, highlighting the kidnapping of American aid workers.',
        ap.emotional_state = 'Intensely scrutinizing with subtle signs of mounting anger, evident in his clenched jaw and tightly clasped hands.',
        ap.emotional_tags = ["Intensely scrutinizing with subtle signs of mounting anger, evident in his clenched jaw", "tightly clasped h", "s."],
        ap.active_plans = ["Challenge the ambassador's narrative to defend American interests."],
        ap.beliefs = ["Believes that the kidnapping of American aid workers cannot be dismissed as merely an internal matter."],
        ap.goals = ["Clarify the nature of the incident and ensure accountability for actions that jeopardize American interests."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Observes the exchange and reacts as her Blackberry buzzes with urgent news alerts about Amanda Dalton\'s identity being revealed on CNN.',
        ap.emotional_state = 'Tense and focused, bracing for the ensuing media storm.',
        ap.emotional_tags = ["Tense", "focused, bracing for the ensuing media storm."],
        ap.active_plans = ["Prepare to relay accurate and timely information to manage public perception."],
        ap.beliefs = ["Believes in the critical importance of transparency and swift communication during crises."],
        ap.goals = ["Disseminate the breaking news effectively to shape the public narrative."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Quietly observes the unfolding scene near the doorway, taking in President Bartlet\'s nonverbal cues.',
        ap.emotional_state = 'Calm and vigilant, maintaining a sharp focus on the details of the interaction.',
        ap.emotional_tags = ["Calm", "vigilant, maintaining a sharp focus on the details of the interaction."],
        ap.active_plans = ["Assess the situation from the sidelines to support leadership decisions."],
        ap.beliefs = ["Believes that subtle nonverbal cues can reveal the true intensity of the crisis."],
        ap.goals = ["Keep situational awareness to provide informed strategic support as events develop."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Forcefully challenging Ambassador Petrov\'s characterization by questioning how the kidnapping of American aid workers can be considered an internal matter.',
        ap.emotional_state = 'Determined and visibly agitated, with a firm resolve underscored by subtle physical cues like a clenching jaw and tightly clasped hands.',
        ap.emotional_tags = ["Determined", "visibly agitated, with a firm resolve underscored by subtle physical cues like a clenching jaw", "tightly clasped h", "s."],
        ap.active_plans = ["Assert U.S. authority and clarify the gravity of the crisis.", "Counter the minimization of American victims in the face of diplomatic rhetoric."],
        ap.beliefs = ["National security and the protection of American citizens must override diplomatic niceties.", "The kidnapping represents a severe crisis that cannot be dismissed as a mere internal matter."],
        ap.goals = ["Reassert executive control over the unfolding crisis.", "Ensure that the public and international community understand the seriousness of the situation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Delivering Moscow\'s position with perfect diplomatic posture, claiming the matter is solely an internal Serbian law enforcement issue and warning against NATO intervention.',
        ap.emotional_state = 'Calm and composed, imbued with a measured defiance to maintain his country\'s stance.',
        ap.emotional_tags = ["Calm", "composed, imbued with a measured defiance to maintain his country's stance."],
        ap.active_plans = ["Maintain a firm diplomatic line that downplays Western involvement.", "Prevent any escalation that might lead to international intervention."],
        ap.beliefs = ["Sovereignty and internal affairs must not be undermined by external forces.", "Intervention from organizations like NATO would represent an unwarranted intrusion."],
        ap.goals = ["Solidify Russia's position on the international stage.", "Discredit any argument that would elevate the crisis beyond its claimed internal scope."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Observing the heated exchange while her Blackberry buzzes with urgent news alerts regarding Amanda Dalton\'s identity.',
        ap.emotional_state = 'Apprehensive and alert, steeling herself for the imminent media storm.',
        ap.emotional_tags = ["Apprehensive", "alert, steeling herself for the imminent media storm."],
        ap.active_plans = ["Monitor the situation closely and prepare for rapid press communications.", "Ensure that the administration\u2019s message remains coherent amidst breaking news."],
        ap.beliefs = ["Accurate and timely information is crucial during a crisis.", "Every detail, including unforeseen news updates, can shape public perception."],
        ap.goals = ["Support the administration's narrative through effective communication.", "Mitigate any damaging fallout from the leak about Amanda Dalton\u2019s identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Observing the interaction between President Bartlet and Ambassador Petrov from near the doorway, noting key non-verbal cues.',
        ap.emotional_state = 'Calm yet strategically focused, with a readiness to act on subtle shifts in leadership demeanor.',
        ap.emotional_tags = ["Calm yet strategically focused, with a readiness to act on subtle shifts in leadership demeanor."],
        ap.active_plans = ["Assess the President\u2019s non-verbal cues for deeper insights into his resolve.", "Prepare to advise on the necessary follow-up steps as tensions escalate."],
        ap.beliefs = ["Subtle body language can reveal the authentic state of leadership in a crisis.", "Meticulous internal coordination is essential to manage external diplomatic pressures."],
        ap.goals = ["Advise the President effectively based on nuanced observations.", "Ensure a coordinated executive response that supports the unfolding strategy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Delivers Moscow\'s diplomatic position with measured authority.',
        ap.emotional_state = 'Calm, confident, and deliberately poised.',
        ap.emotional_tags = ["Calm, confident,", "deliberately poised."],
        ap.active_plans = ["Assert that the incident is an internal Serbian matter", "Undermine any justification for NATO intervention"],
        ap.beliefs = ["Believes the issue is strictly a domestic law enforcement matter", "Considers any external intervention as a serious overreach"],
        ap.goals = ["Maintain diplomatic leverage for Russia", "Ensure his nation\u2019s narrative remains unchallenged"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Challenges the ambassador\'s explanation with pointed questioning.',
        ap.emotional_state = 'Tense and frustrated, yet maintaining a composed exterior.',
        ap.emotional_tags = ["Tense", "frustrated, yet maintaining a composed exterior."],
        ap.active_plans = ["Extract a clearer explanation regarding the aid workers\u2019 kidnapping", "Assert the American perspective on the crisis"],
        ap.beliefs = ["Believes that the act of kidnapping American aid workers cannot be dismissed as merely an internal issue", "Values transparency and decisive action in crisis management"],
        ap.goals = ["Protect national interests", "Clarify the gravity of the situation to ensure appropriate response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Receives urgent news alerts on her Blackberry and prepares to relay critical media updates.',
        ap.emotional_state = 'Apprehensive yet resolute under pressure.',
        ap.emotional_tags = ["Apprehensive yet resolute under pressure."],
        ap.active_plans = ["Monitor and communicate unfolding media reports", "Manage the emerging media storm effectively"],
        ap.beliefs = ["Thinks that timely and accurate information is essential in managing crises", "Believes that controlling the media narrative is crucial to maintaining stability"],
        ap.goals = ["Inform leadership immediately about the CNN report on Amanda Dalton", "Mitigate potential fallout from the media storm"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Observes the unfolding exchange from the doorway, attentively noting leadership cues.',
        ap.emotional_state = 'Calm, vigilant, and slightly anxious about the escalating tension.',
        ap.emotional_tags = ["Calm, vigilant,", "slightly anxious about the escalating tension."],
        ap.active_plans = ["Monitor President Bartlet's reactions closely", "Assess the situation for any required intervention or support"],
        ap.beliefs = ["Believes that subtle behavioral cues can indicate brewing problems", "Values preparedness and proactive assessment during crises"],
        ap.goals = ["Support the leadership in managing the crisis effectively", "Anticipate further developments to respond in a timely manner"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sam_laptop_event_4_1'})
    ON CREATE SET
        oi.description = 'Sam\'s glowing laptop serves as the centerpiece of the scene, displaying two distinct presidential address drafts—one for victory and one for tragedy—which underscores the internal conflict between hope and the harsh realities of political violence. Its active use by Sam highlights his deep focus amid crisis.',
        oi.status_before = 'The laptop was on, ready for use, with a standard operating display but no significant drafts prepared before the crisis escalated.',
        oi.status_after = 'The laptop continues to operate, now displaying the two contrasting drafts that capture the dual narrative of triumph and tragedy, symbolizing Sam’s internal struggle.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sam_laptop'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_clutter_event_4_1'})
    ON CREATE SET
        oi.description = 'The desk clutter, consisting of crumpled papers and empty coffee cups, visually represents the chaos and disarray of Sam\'s working environment in the Steam Pipe Trunk Distribution Venue. It reinforces the scene’s atmosphere of stressed urgency and personal disarray in the midst of high-stakes decision making.',
        oi.status_before = 'The cluster of papers and coffee cups symbolized an already disorganized workspace, reflecting the immediate pressures of ongoing work.',
        oi.status_after = 'The clutter remains as a constant visual cue of the hectic environment, possibly even more emblematic of Sam\'s internal turmoil as the scene intensifies.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_clutter'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sam_laptop_event_4_2'})
    ON CREATE SET
        oi.description = 'Sam Seaborn\'s laptop is central to the scene, with its glowing screen displaying two distinct drafts — one for victory, one for tragedy. It serves as the medium through which political messaging and the conflicting emotions of crisis are articulated.',
        oi.status_before = 'The laptop was already active, holding two separate document drafts on its screen, symbolizing divergent narratives of hope and sorrow.',
        oi.status_after = 'The laptop continues to display both documents, maintaining its role as a silent witness to the unfolding debate on political messaging and restraint.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sam_laptop'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_clutter_event_4_2'})
    ON CREATE SET
        oi.description = 'The disorganized desk clutter—comprising crumpled papers and empty coffee cups—surrounds Sam\'s workstation, emphasizing the chaos and emotional intensity of the moment in the creative workspace.',
        oi.status_before = 'The clutter was already present, reflecting a state of disarray and the high-pressure environment in which urgent documents are being prepared.',
        oi.status_after = 'The clutter remains largely unchanged, silently underscoring the ongoing tension and the raw, unpolished energy of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_clutter'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sam_laptop_event_4_3'})
    ON CREATE SET
        oi.description = 'Sam Seaborn\'s glowing laptop displays two distinct presidential address drafts—one for victory and one for tragedy—symbolizing his internal conflict and emotional vulnerability after the Rosslyn incident. The laptop is a critical prop that underscores the narrative of divided purpose in the moment.',
        oi.status_before = 'The laptop was powered on, clearly displaying the two draft documents which embodied the dual aspects of hope and sorrow.',
        oi.status_after = 'The laptop remains active, continuing to illuminate the contrasting drafts while silently mirroring Sam\'s reflective state.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sam_laptop'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_clutter_event_4_3'})
    ON CREATE SET
        oi.description = 'The desk clutter, a mix of crumpled papers and empty coffee cups, frames the disorganized environment of the Steam Pipe Trunk Distribution Venue, reinforcing the chaos and fatigue stemming from the emotional weight of the past Rosslyn incident.',
        oi.status_before = 'The scattered papers and coffee cups indicated a typical high-stress, cluttered workspace in the midst of intense creative and political activity.',
        oi.status_after = 'The clutter remains in place, now carrying additional narrative significance as a silent witness to Sam\'s introspection and the burdens he carries as part of his role.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_clutter'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sam_laptop_event_4_4'})
    ON CREATE SET
        oi.description = 'Sam\'s Laptop serves as the central narrative device in the scene—it glows with two distinct presidential address drafts (one for victory and one for tragedy) that visually underscore the complex duality of political messaging during crisis management. Its display of contrasting texts reflects the underlying tension and ethical struggle discussed by Sam and Toby.',
        oi.status_before = 'Prior to the event, the laptop was active and displaying draft documents, symbolizing the ongoing work of articulating the administration\'s conflicting responses to the crisis.',
        oi.status_after = 'After the exchange, the laptop continues to display the drafts, maintaining its role as a silent observer to the emotional and intellectual tension between the characters.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sam_laptop'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_desk_clutter_event_4_4'})
    ON CREATE SET
        oi.description = 'The Desk Clutter—comprising crumpled papers and empty coffee cups—visually embodies the chaotic work environment and emotional disarray prevalent in the scene. It reinforces the narrative of a disordered workspace during a high-pressure moment in crisis management.',
        oi.status_before = 'Before the event, the clutter had accumulated as a result of prolonged stress and frantic activity in the windowless office, symbolizing the wear and tear of continuous crisis operations.',
        oi.status_after = 'After the event, the clutter remains unchanged on Sam\'s workstation, further emphasizing the persistent disarray that mirrors the inner turmoil and ethical challenges faced by the characters.'
    WITH oi
    MATCH (o:Object {uuid: 'object_desk_clutter'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Focused on drafting two distinct presidential addresses on his glowing laptop screen amidst a clutter of crumpled papers and coffee cups.',
        ap.emotional_state = 'Intense, contemplative and visibly stressed, with his usual polish abandoned.',
        ap.emotional_tags = ["Intense, contemplative", "visibly stressed, with his usual polish ab", "oned."],
        ap.active_plans = ["Finalize and refine both victory and tragedy drafts for the presidential address.", "Incorporate poetic elements into the narrative of political violence."],
        ap.beliefs = ["Tragedy inherently demands a poetic touch to transform pain into meaningful discourse.", "The approach taken after Rosslyn remains relevant to their identity as the 'good guys.'"],
        ap.goals = ["Produce impactful and nuanced messaging that captures the severity of the crisis.", "Balance the contrasting themes of victory and tragedy to appeal to public sentiment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway, observing Sam with quiet concern, offering subtle emotional support.',
        ap.emotional_state = 'Reserved and contemplative, marked by genuine concern for his deputy.',
        ap.emotional_tags = ["Reserved", "contemplative, marked by genuine concern for his deputy."],
        ap.active_plans = ["Provide guidance and reassurance to Sam during this critical drafting process.", "Ensure that the messaging aligns with their values and the mission despite the hard choices involved."],
        ap.beliefs = ["Maintaining moral integrity by reminding people of the true reasons behind aid interventions is essential.", "Their identity as the 'good guys' is integral to their approach in crisis management."],
        ap.goals = ["Support the creation of clear, balanced communications that resonate with both the public and stakeholders.", "Reaffirm their commitment to the long-term values of justice and responsible intervention."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Stands in the doorway observing Sam working amid crumpled papers and empty coffee cups, reflecting on the necessity of poetic restraint in political messaging.',
        ap.emotional_state = 'Concerned and reflective.',
        ap.emotional_tags = ["Concerned", "reflective."],
        ap.active_plans = ["Emphasize the importance of restraint in messaging", "Reinforce the rationale behind sending aid workers into dangerous places"],
        ap.beliefs = ["Effective political communication requires balancing emotional restraint with clear purpose", "Maintaining credibility through measured expression is essential in times of crisis"],
        ap.goals = ["Guide the narrative to stress the value of deliberate communication", "Influence public perception by highlighting the strategic deployment of aid workers"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Sits at his cluttered workstation, furiously drafting dual versions of a presidential address on his glowing laptop.',
        ap.emotional_state = 'Intense and conflicted, marked by creative strain.',
        ap.emotional_tags = ["Intense", "conflicted, marked by creative strain."],
        ap.active_plans = ["Develop speeches that encapsulate both tragedy and victory", "Weave poetic elements into his narrative on political violence"],
        ap.beliefs = ["Tragedy demands a nuanced blend of stark reality and poetic nuance", "Artful messaging can capture the profound sacrifices of aid workers"],
        ap.goals = ["Produce an impactful address that resonates with the public", "Articulate the complexity of political violence through carefully crafted words"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Deep in introspection, reflecting on the lasting impact of the Rosslyn incident while working on his dual draft speeches of victory and tragedy.',
        ap.emotional_state = 'Vulnerable and contemplative, showing an emotional openness rarely on display.',
        ap.emotional_tags = ["Vulnerable", "contemplative, showing an emotional openness rarely on display."],
        ap.active_plans = ["Finalize the two contrasting presidential address drafts", "Channel personal regret into a poetic meditation on political violence"],
        ap.beliefs = ["The memory of past crises, like Rosslyn, should guide ethical decision-making", "Even in tragedy, there is a responsibility to maintain the narrative of being the 'good guys'"],
        ap.goals = ["Integrate poetic elements into his draft to effectively communicate the moral weight of political violence", "Ensure that the speech reflects a commitment to always doing what is right"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway observing Sam with quiet concern and offering measured guidance.',
        ap.emotional_state = 'Calm yet deeply concerned, focused on supporting his deputy through a moment of vulnerability.',
        ap.emotional_tags = ["Calm yet deeply concerned, focused on supporting his deputy through a moment of vulnerability."],
        ap.active_plans = ["Provide strategic reassurance to help Sam regain focus", "Encourage restraint and consistent moral clarity amid the emotional intensity"],
        ap.beliefs = ["True strength is shown through restraint and moral responsibility", "Maintaining ethical communication is crucial, even under personal duress"],
        ap.goals = ["Ensure that Sam transforms his emotional turmoil into constructive political messaging", "Uphold the commitment to being the 'good guys' while navigating the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Standing in the doorway at the Steam Pipe Trunk Distribution Venue, observing Sam Seaborn while verbally reaffirming his belief in the integrity of their team.',
        ap.emotional_state = 'Contemplative and resolute, with an undercurrent of tension from the ongoing crisis.',
        ap.emotional_tags = ["Contemplative", "resolute, with an undercurrent of tension from the ongoing crisis."],
        ap.active_plans = ["Ensure the team's ethical standards are maintained amidst crisis pressures", "Support and guide the team through challenging times"],
        ap.beliefs = ["Integrity and moral rectitude are essential, even in crises", "Remaining the good guys is crucial despite the pressures of political violence"],
        ap.goals = ["Reaffirm the team's commitment to ethical action", "Bolster team morale and strategic resolve in the face of adversity"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_resolute_desk_event_5_1'})
    ON CREATE SET
        oi.description = 'The Resolute Desk anchors the scene in the Oval Office, behind which President Bartlet observes the announcements and the shifting mood, symbolizing the enduring weight of executive authority during moments of crisis.',
        oi.status_before = 'Before the event, the Resolute Desk stood as a historic emblem of power, set in the tense environment of a strategy session.',
        oi.status_after = 'After the announcement, the desk remains a silent witness to the evolving crisis management, its presence reinforcing the seriousness and continuity of executive leadership.'
    WITH oi
    MATCH (o:Object {uuid: 'object_resolute_desk'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_resolute_desk_event_5_2'})
    ON CREATE SET
        oi.description = 'In the Oval Office during the crisis, President Bartlet is seen behind the Resolute desk, using its symbolic authority as he issues orders and reflects on the day\'s events. The desk stands as a silent witness to the high-stakes decisions and emotional exchanges unfolding in the room.',
        oi.status_before = 'The Resolute desk sat as a pristine, iconic artifact of executive power, embodying the history and gravity of the office.',
        oi.status_after = 'While physically unchanged, the Resolute desk’s role as a symbol of command deepens, marked by the tension and weight of the crisis as observed by President Bartlet.'
    WITH oi
    MATCH (o:Object {uuid: 'object_resolute_desk'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_resolute_desk_event_5_3'})
    ON CREATE SET
        oi.description = 'In the Oval Office scene, President Bartlet stands behind the iconic Resolute Desk as he observes his staff and issues decisive commands to retrieve President Kovach and assemble the leadership. The desk serves as the symbolic focal point of executive authority in the midst of crisis.',
        oi.status_before = 'The Resolute Desk was kept in its established, undisturbed state, emblematic of the executive power and historical continuity.',
        oi.status_after = 'The desk remains unchanged physically, continuing to stand as the silent witness to the unfolding high-stakes decision-making.'
    WITH oi
    MATCH (o:Object {uuid: 'object_resolute_desk'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Bursting into the Oval Office to announce that Serbian special police units have secured the compound and that all hostages are safe.',
        ap.emotional_state = 'Assertive and determined, instilling relief in the room.',
        ap.emotional_tags = ["Assertive", "determined, instilling relief in the room."],
        ap.active_plans = ["Deliver breaking news to shift the tense atmosphere", "Ensure that critical information about hostage safety is promptly communicated"],
        ap.beliefs = ["Timely communication is crucial in crisis management", "Clear, decisive action can help de-escalate tension"],
        ap.goals = ["Reassure the staff about the secured compound", "Support the overall strategy by updating key decision-makers"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Standing by the window, visibly troubled despite the relief in the room.',
        ap.emotional_state = 'Reflective and uneasy, burdened by the implications of the crisis.',
        ap.emotional_tags = ["Reflective", "uneasy, burdened by the implications of the crisis."],
        ap.active_plans = ["Process the news and its moral implications"],
        ap.beliefs = ["Even successful operations can compromise core principles", "The cost of success should never be measured only in tactical gains"],
        ap.goals = ["Understand whether the operation's success might have led to unintended violations of core ideals", "Ensure future actions remain principled even under pressure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Approaching Josh quietly to provide emotional support.',
        ap.emotional_state = 'Empathetic and reassuring, offering a calming presence amid turmoil.',
        ap.emotional_tags = ["Empathetic", "reassuring, offering a calming presence amid turmoil."],
        ap.active_plans = ["Support Josh during his emotional turmoil", "Help maintain staff morale during the crisis"],
        ap.beliefs = ["Solidarity and support among colleagues are essential in times of crisis", "A supportive approach can help mitigate personal doubts and fears"],
        ap.goals = ["Ensure the well-being of her colleague Josh", "Contribute to a steadier, more unified team response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Observing the room from behind the Resolute Desk, issuing authoritative orders to further involve leadership.',
        ap.emotional_state = 'Composed on the surface yet internally tense and determined.',
        ap.emotional_tags = ["Composed on the surface yet internally tense", "determined."],
        ap.active_plans = ["Contact President Kovach and secure bipartisan leadership", "Communicate the gravity of the situation to the public"],
        ap.beliefs = ["Transparency is vital, even during national crises", "The American people deserve to know the true closeness to the brink and who was responsible"],
        ap.goals = ["Ensure accountability by bringing in key decision-makers", "Establish a clear chain of command in response to the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Receiving President Bartlet\'s imperative to contact President Kovach.',
        ap.emotional_state = 'Focused and dutiful, ready to execute the instruction.',
        ap.emotional_tags = ["Focused", "dutiful, ready to execute the instruction."],
        ap.active_plans = ["Quickly relay the message to President Kovach", "Coordinate further communication between leadership members"],
        ap.beliefs = ["Prompt and efficient communication is key to crisis resolution", "Every team member\u2019s role is critical in ensuring a unified response"],
        ap.goals = ["Fulfill the command without delay", "Maintain the smooth flow of critical information during the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Bursting into the Oval Office and announcing that the compound has been secured and all hostages are safe.',
        ap.emotional_state = 'Assertive and focused, yet conscious of the underlying tension in the room.',
        ap.emotional_tags = ["Assertive", "focused, yet conscious of the underlying tension in the room."],
        ap.active_plans = ["Confirm the rescue operation\u2019s success", "Maintain a clear chain of command amid the crisis"],
        ap.beliefs = ["Timely intelligence and decisive action are crucial to crisis management", "Clear communication can stabilize a turbulent situation"],
        ap.goals = ["Ensure the safety of all hostages", "Reinforce operational control in the Oval Office"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Standing by the window, deeply reflecting on the moral implications of their success.',
        ap.emotional_state = 'Troubled and conflicted, experiencing inner turmoil about compromising core values.',
        ap.emotional_tags = ["Troubled", "conflicted, experiencing inner turmoil about compromising core values."],
        ap.active_plans = ["Assess the ethical cost of their actions", "Monitor how the resolution impacts their underlying principles"],
        ap.beliefs = ["Achieving success at the expense of integrity can undermine long-term ideals", "Moral compromise is a dangerous precedent even in crisis resolution"],
        ap.goals = ["Seek clarity on the right course of action", "Prevent the erosion of core principles during crisis management"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Approaching Josh quietly to offer reassurance and support during his reflection.',
        ap.emotional_state = 'Compassionate and steady, determined to provide emotional balance amid the turmoil.',
        ap.emotional_tags = ["Compassionate", "steady, determined to provide emotional balance amid the turmoil."],
        ap.active_plans = ["Support Josh and help him process his inner conflict", "Affirm that their actions, though difficult, retained integrity"],
        ap.beliefs = ["Even in high-pressure situations, adherence to core values is essential", "Emotional support is key to maintaining resilience in a crisis"],
        ap.goals = ["Help Josh reconcile his feelings about the situation", "Reinforce the collective commitment to ethical leadership"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Observing the room from behind the Resolute desk and issuing critical orders for further leadership coordination.',
        ap.emotional_state = 'Measured yet internally tense, determined to steer the situation towards accountability.',
        ap.emotional_tags = ["Measured yet internally tense, determined to steer the situation towards accountability."],
        ap.active_plans = ["Direct immediate communication with key political figures", "Prepare the nation for the gravity of the crisis and the steps taken to resolve it"],
        ap.beliefs = ["Transparency and accountability must prevail, even amid inner turmoil", "Leadership requires decisive action in the face of moral and operational challenges"],
        ap.goals = ["Ensure the American public is informed about the near crisis", "Identify and hold accountable those whose actions contributed to the brinkmanship"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Bursting into the Oval Office to interrupt the tense strategy session with the crucial news that the compound is secure and all hostages are safe.',
        ap.emotional_state = 'Urgent yet relieved, providing a spark of hope amid the surrounding tension.',
        ap.emotional_tags = ["Urgent yet relieved, providing a spark of hope amid the surrounding tension."],
        ap.active_plans = ["Deliver critical intelligence to the room", "Assist in de-escalating the crisis with accurate updates"],
        ap.beliefs = ["Timely and transparent information is key to maintaining control during a crisis"],
        ap.goals = ["Inform the staff immediately to stabilize the situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Standing by the window, deeply reflective about the moral costs and implications of their near-failure.',
        ap.emotional_state = 'Troubled and introspective, wrestling with the possibility of moral compromise despite a successful rescue.',
        ap.emotional_tags = ["Troubled", "introspective, wrestling with the possibility of moral compromise despite a successful rescue."],
        ap.active_plans = ["Evaluate the deeper meaning behind the crisis response", "Weigh the ethical dimensions of their actions"],
        ap.beliefs = ["Success should not come at the expense of core principles", "Moral clarity is essential even in times of crisis"],
        ap.goals = ["Ensure the actions taken are aligned with ethical standards", "Prevent a scenario where victory undermines fundamental values"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Approaching Josh quietly to offer personal support amid his evident distress.',
        ap.emotional_state = 'Empathetic and steady, exuding calm reassurance in a moment of doubt.',
        ap.emotional_tags = ["Empathetic", "steady, exuding calm reassurance in a moment of doubt."],
        ap.active_plans = ["Provide emotional solace and supportive counsel to Josh", "Help maintain team morale during the crisis"],
        ap.beliefs = ["Solidarity and mutual support strengthen resilience during challenging times"],
        ap.goals = ["Bolster team cohesion and ensure individual morale is sustained"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Observing his staff from behind the Resolute Desk and issuing a firm, measured command to mobilize additional leadership.',
        ap.emotional_state = 'Determined and resolute, though visibly strained by the weight of the crisis.',
        ap.emotional_tags = ["Determined", "resolute, though visibly strained by the weight of the crisis."],
        ap.active_plans = ["Instruct Charlie Young to retrieve President Kovach", "Assemble bipartisan leadership to inform the public"],
        ap.beliefs = ["The American people deserve to know the gravity of our nation's near-disaster", "Transparency and accountability are fundamental during periods of national crisis"],
        ap.goals = ["Ensure that every relevant leader is mobilized to address the crisis", "Communicate clearly how close the nation came to the brink"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Listening intently to President Bartlet’s command and preparing to act without hesitation.',
        ap.emotional_state = 'Focused and reliably composed, reflecting his loyalty and efficiency.',
        ap.emotional_tags = ["Focused", "reliably composed, reflecting his loyalty", "efficiency."],
        ap.active_plans = ["Quickly retrieve President Kovach as instructed"],
        ap.beliefs = ["Obedience and efficient execution of orders are paramount in critical moments"],
        ap.goals = ["Fulfill the President\u2019s command swiftly to support crisis resolution"]
    ;
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
MATCH (a:Agent {uuid: 'agent_nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_nancy_mcnally'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_nancy_mcnally_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alexander'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alexander_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
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
MATCH (a:Event {uuid: 'event_2_4'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_3'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bob_russell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bob_russell_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_margaret'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_margaret_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
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
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cj_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_viktor_petrov'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cj_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_viktor_petrov'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_viktor_petrov_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cj_cregg'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cj_cregg_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_leo_mcgarry'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_leo_mcgarry_event_3_3'}),
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
MATCH (a:Event {uuid: 'event_4_4'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_3'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sam_seaborn'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sam_seaborn_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_toby_ziegler'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_toby_ziegler_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
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
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlie_young'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kate_harper'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kate_harper_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josh_lyman'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josh_lyman_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_donna_moss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_donna_moss_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_josiah_bartlet'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_josiah_bartlet_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlie_young'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlie_young_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
