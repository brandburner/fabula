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
MERGE (a:Agent {uuid: 'agent-mark_corrigan'})
    ON CREATE SET
        a.name = 'Mark Corrigan',
        a.title = 'Regional Digital Transformation Strategy Implementation Manager',
        a.description = 'Mark Corrigan is a corporate employee at MetricShift Digital Solutions, known for his anxiety and desperation to advance his career. He is characterized by his careful attention to his professional appearance and performance while dealing with the absurdities of the modern corporate world. Despite his intellectual prowess, he often finds himself overshadowed by others in his workplace, like his flatmate Jeremy Usbourne. His nature is characterized by cynicism, a tendency towards traditional corporate principles, and a pragmatic approach. He continually struggles with insecurities and overthinking, while trying to maintain control and organization in his professional life.',
        a.traits = ["Intelligent", "Methodical", "Witty", "Meticulous", "Career-focused", "Traditional", "Pessimistic", "Sceptical", "Ambitious", "Loyal", "Cynical", "Pragmatic", "Ironic", "Overthinker", "Self-conscious", "Anxious", "Cautious", "Professional", "Responsible", "Organized", "Risk-averse", "Insecure", "Strategic", "Neurotic", "Detail-oriented"],
        a.sphere_of_influence = 'Corporate Management'
    ;
MERGE (a:Agent {uuid: 'agent-jeremy_usbourne'})
    ON CREATE SET
        a.name = 'Jeremy Usbourne',
        a.title = 'Sonic Visionary/Consciousness Optimizer',
        a.description = 'Jeremy Usbourne is an unconventional and creative person, focusing on the intersection of sound and mindfulness as a \'Sonic Visionary\'. Despite his chaotic and often unprofessional behavior, he is optimistic and driven by innovative ideas. Once a failed musician, Jeremy has reinvented himself in the corporate world, often leveraging his exuberant personality and charisma to make headway despite frequent failures. Known for his imaginative but often impractical ideas, he continues to embrace unusual concepts such as sonic optimization.',
        a.traits = ["Charismatic", "Chaotic", "Innovative", "Impulsive", "Unconventional", "Ambitious", "Impractical", "Optimistic", "Eccentric", "Creative", "Confident", "Charming", "Carefree"],
        a.sphere_of_influence = 'Sonic Optimization'
    ;
MERGE (a:Agent {uuid: 'agent-charlotte_walsh_henderson'})
    ON CREATE SET
        a.name = 'Charlotte Walsh-Henderson',
        a.title = 'Head of Digital Transformation',
        a.description = 'Charlotte Walsh-Henderson is the Head of Digital Transformation at MetricShift Digital Solutions. She is a seasoned professional with a history of burnout experiences in Silicon Valley, indicating resilience and commitment to innovation. Her career journey includes an MBA from Stanford, experiences in startups, and a transformative period in an ashram. Charlotte is driven by a passion for forward-thinking solutions and aims to incorporate mindfulness in her managerial approach.',
        a.traits = ["Experienced", "Innovative", "Resilient", "Professional", "Committed", "Enlightened", "Driven", "Mindful"],
        a.sphere_of_influence = 'Digital Transformation'
    ;
MERGE (a:Agent {uuid: 'agent-alan_johnson'})
    ON CREATE SET
        a.name = 'Alan Johnson',
        a.title = 'CEO',
        a.description = 'Alan Johnson is the CEO of Johnson Dynamic Solutions, showing openness and interest in innovative ideas that cater to the evolving demands of the digital corporate sector. He often eyes potential merger opportunities and initiatives that promise disruption and a futuristic vision.',
        a.traits = ["Visionary", "Innovative", "Open-Minded", "Shrewd", "Corporate-Savvy"],
        a.sphere_of_influence = 'Corporate Leadership'
    ;
MERGE (a:Agent {uuid: 'agent-super_hans'})
    ON CREATE SET
        a.name = 'Super Hans',
        a.title = 'None',
        a.description = 'Super Hans is a chaotic and unpredictable character, often involved in questionable ventures and schemes. Known for his hedonistic and spontaneous lifestyle, he has a habit of jumping into complex projects with minimal preparation and a belief in the transformative power of drugs and unconventional ideas. Frequently engaging in drug-fueled escapades and unusual business ideas, his partnership with Jeremy Usbourne highlights his reckless and boundary-pushing tendencies.',
        a.traits = ["Spontaneous", "Boundary-pushing", "Chaotic", "Innovative", "Unorthodox", "Adventurous", "Hedonistic", "Irreverent", "Eccentric", "Reckless", "Unpredictable"],
        a.sphere_of_influence = 'Crypto and Music'
    ;
MERGE (o:Object {uuid: 'object-ikea_markus_chair'})
    ON CREATE SET
        o.name = 'IKEA Markus Chair',
        o.description = 'A desk chair used by Mark Corrigan, purchased during his \'New Year, New Office\' phase.',
        o.purpose = 'To provide a comfortable seating arrangement for Mark during work from home.',
        o.significance = 'Symbolizes Mark’s ongoing efforts to present a professional appearance in a remote work setting, despite personal and professional insecurities.'
    ;
MERGE (o:Object {uuid: 'object-hp_laptop'})
    ON CREATE SET
        o.name = 'HP Laptop',
        o.description = 'A laptop on which Mark toggles between LinkedIn and his \'Career Crisis Management\' spreadsheet.',
        o.purpose = 'To manage Mark\'s career and professional networking through various applications.',
        o.significance = 'Represents Mark’s struggle with his career trajectory and the pressure of staying relevant in the digital age.'
    ;
MERGE (o:Object {uuid: 'object-career_crisis_management_spreadsheet'})
    ON CREATE SET
        o.name = 'Career Crisis Management Spreadsheet',
        o.description = 'A spreadsheet tracking Mark\'s professional metrics, showing a downward trend in perceived value.',
        o.purpose = 'To track and analyze Mark’s professional performance and career development.',
        o.significance = 'Highlights Mark’s anxiety and the precarious state of his career.'
    ;
MERGE (o:Object {uuid: 'object-metricshift_certificate'})
    ON CREATE SET
        o.name = 'MetricShift Digital \'Employee of the Month (August 2023)\' Certificate',
        o.description = 'An award certificate recognizing Mark as Employee of the Month for August 2023.',
        o.purpose = 'To acknowledge Mark\'s achievements within his organization.',
        o.significance = 'Represents past professional recognition and contrasts with Mark\'s current feelings of inadequacy.'
    ;
MERGE (o:Object {uuid: 'object-dartmouth_diploma'})
    ON CREATE SET
        o.name = 'Dartmouth Business Studies Diploma',
        o.description = 'Mark\'s diploma from the University of Dartmouth in Business Studies.',
        o.purpose = 'To credential Mark’s formal education and academic achievements.',
        o.significance = 'Symbolizes the educational foundation for Mark\'s career ambitions, juxtaposed with his current disillusionment.'
    ;
MERGE (o:Object {uuid: 'object-m_s_interview_suit'})
    ON CREATE SET
        o.name = 'M&S Interview Suit',
        o.description = 'Mark\'s old M&S suit, worn by Jeremy, previously used for job interviews and a disciplinary hearing.',
        o.purpose = 'To serve as formal attire for important career-related events.',
        o.significance = 'Represents Mark\'s uncertain career journey and Jeremy’s opportunistic borrowing amidst Mark\'s objections.'
    ;
MERGE (o:Object {uuid: 'object-cracked_mirror'})
    ON CREATE SET
        o.name = 'Cracked Mirror',
        o.description = 'A salvaged mirror from Jeremy\'s former yoga-rave startup, used to practice his pitch.',
        o.purpose = 'To provide a reflection space for Jeremy to rehearse his pitch.',
        o.significance = 'Symbolizes Jeremy\'s unconventional approach and the remnants of his past ventures.'
    ;
MERGE (o:Object {uuid: 'object-red_bull_cans'})
    ON CREATE SET
        o.name = 'Empty Red Bull Cans',
        o.description = 'Multiple empty cans of Red Bull, scattered around the living room.',
        o.purpose = 'Represent the energy drinks consumed by Jeremy while preparing for his pitch.',
        o.significance = 'Indicates Jeremy\'s high energy and reliance on stimulants for creativity and preparation.'
    ;
MERGE (o:Object {uuid: 'object-gary_vaynerchuk_quotes'})
    ON CREATE SET
        o.name = 'Printouts of Gary Vaynerchuk Quotes',
        o.description = 'Printed motivational quotes and excerpts from Gary Vaynerchuk, highlighted by Jeremy.',
        o.purpose = 'To serve as motivational material for Jeremy\'s pitch preparation.',
        o.significance = 'Highlights Jeremy\'s inspiration or misplaced admiration for entrepreneurial success icons.'
    ;
MERGE (o:Object {uuid: 'object-networking_protocols_index_cards'})
    ON CREATE SET
        o.name = 'Networking Emergency Protocols Index Cards',
        o.description = 'Color-coded index cards organized by Mark for navigating potential social disasters at networking events.',
        o.purpose = 'To serve as Mark\'s guiding tool for handling networking situations effectively.',
        o.significance = 'Embodies Mark\'s anxiety and meticulous preparation for navigating his professional environment.'
    ;
MERGE (o:Object {uuid: 'object-ideation_zone'})
    ON CREATE SET
        o.name = 'Ideation Zone',
        o.description = 'A creatively themed area on the 14th floor of MetricShift Digital Solutions HQ, transformed for the monthly Innovation Sundowner with fairy lights and whiteboards.',
        o.purpose = 'To serve as the venue for events designed to boost innovation and brainstorming, like the Innovation Sundowner.',
        o.significance = 'Symbolizes MetricShift’s emphasis on fostering creativity and innovation, playing a role in the setting where corporate ideas and initiatives are discussed.'
    ;
MERGE (o:Object {uuid: 'object-kombucha_stations'})
    ON CREATE SET
        o.name = 'Kombucha Stations',
        o.description = 'Refreshment stations featuring the fermented tea drink, arranged within the Ideation Zone during the Innovation Sundowner.',
        o.purpose = 'To provide beverage options for attendees, aligning with contemporary health trends in corporate environments.',
        o.significance = 'Represents the modern corporate trend of healthy lifestyle integration, enhancing the setting\'s atmosphere of innovative wellness.'
    ;
MERGE (o:Object {uuid: 'object-fruit_infused_water'})
    ON CREATE SET
        o.name = 'Fruit-Infused Water',
        o.description = 'A beverage option available within the Ideation Zone, featuring water flavored with various fruits.',
        o.purpose = 'To offer a refreshing and healthy drink choice for attendees at the Innovation Sundowner.',
        o.significance = 'Serves as a symbol of the organization\'s commitment to health-conscious amenities, blending relaxation with innovation.'
    ;
MERGE (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    ON CREATE SET
        o.name = 'LinkedIn Premium Name Badge',
        o.description = 'A name badge worn by Mark, denoting his LinkedIn Premium membership as a sign of professional networking acumen.',
        o.purpose = 'To facilitate professional introductions and networking at the event.',
        o.significance = 'Highlights Mark\'s efforts to enhance his professional image and status, reflective of the social dynamics in corporate culture.'
    ;
MERGE (o:Object {uuid: 'object-dj_equipment'})
    ON CREATE SET
        o.name = 'DJ Equipment',
        o.description = 'Sound equipment used for creating and playing a productivity soundscape, borrowed from Super Hans\' silent disco business.',
        o.purpose = 'To demonstrate a scientifically-engineered productivity soundscape at the MetricShift Executive Boardroom.',
        o.significance = 'Symbolizes Jeremy\'s unorthodox and potentially misguided attempt to influence corporate culture and gain employment.'
    ;
MERGE (o:Object {uuid: 'object-herman_miller_wallpaper'})
    ON CREATE SET
        o.name = 'Herman Miller Wallpaper',
        o.description = 'High-end wallpaper used in the MetricShift Executive Boardroom, known as \'The Disruption Chamber\'.',
        o.purpose = 'Acts as a backdrop for meetings, possibly intending to convey a sense of modernity and style.',
        o.significance = 'Represents the corporate environment that Mark feels increasingly detached from.'
    ;
MERGE (o:Object {uuid: 'object-printouts'})
    ON CREATE SET
        o.name = 'Blockchain and Meditation App Printouts',
        o.description = 'A collection of printed documents that detail blockchain and meditation application concepts, scattered around Super Hans on the kitchen table.',
        o.purpose = 'To serve as reference material for developing the \'SonicChain\' project, which merges blockchain technology with sound therapy.',
        o.significance = 'Represents Super Hans\' attempt to integrate innovative digital solutions into mindfulness practices, symbolizing his unconventional approach to technology and business.'
    ;
MERGE (o:Object {uuid: 'object-laptop'})
    ON CREATE SET
        o.name = 'Super Hans\' Laptop',
        o.description = 'A worn laptop displaying remnants of the hacked cryptocurrency project \'MindCoin\', belonging to Super Hans.',
        o.purpose = 'To develop and code new projects like \'SonicChain\' by utilizing existing cryptocurrency frameworks and platforms.',
        o.significance = 'Signifies Super Hans\' ambition and the chaotic energy he brings to tech ventures, highlighting themes of creativity and chaos in digital innovation.'
    ;
MERGE (o:Object {uuid: 'object-metricshift_lanyard'})
    ON CREATE SET
        o.name = 'MetricShift Lanyard',
        o.description = 'A lanyard displaying the MetricShift Digital Solutions logo, worn by Super Hans in the scene.',
        o.purpose = 'To signify affiliation with MetricShift Digital Solutions and possibly suggest a level of involvement or support from the organization.',
        o.significance = 'The lanyard symbolizes the ongoing theme of corporate identity and alignment, highlighting Super Hans\' unexpected and confusing connection to the corporate world.'
    ;
MERGE (o:Object {uuid: 'object-wine'})
    ON CREATE SET
        o.name = 'Warm White Wine',
        o.description = 'A glass of warm white wine that Mark is drinking while contemplating his career and Jeremy\'s unexpected success.',
        o.purpose = 'To provide Mark with a mild form of comfort or escape as he reflects on his feelings of inadequacy and envy.',
        o.significance = 'The warm white wine underscores Mark\'s state of dissatisfaction and serves as a symbol of his lukewarm engagement with his own life and career.'
    ;
MERGE (o:Object {uuid: 'object-phone'})
    ON CREATE SET
        o.name = 'Phone',
        o.description = 'A mobile phone that buzzes with a LinkedIn notification while Mark is in the pub.',
        o.purpose = 'To inform Mark of newly endorsed skills on Jeremy\'s LinkedIn profile.',
        o.significance = 'The phone represents the pervasive nature of digital connectivity and professional networking, highlighting the ironic success of Jeremy in the corporate realm.'
    ;
MERGE (l:Location {uuid: 'location-marks_bedroom_apollo_house'})
    ON CREATE SET
        l.name = 'Mark\'s Bedroom - Apollo House',
        l.description = 'A bedroom located in Apollo House, Croydon, serving as both a personal space and a site of corporate anxiety for Mark. The room features an IKEA Markus desk chair, a \'Career Crisis Management\' spreadsheet open on an HP laptop, and walls adorned with a MetricShift Digital \'Employee of the Month (August 2023)\' certificate and a Dartmouth Business Studies diploma.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-living_room_apollo_house'})
    ON CREATE SET
        l.name = 'Living Room - Apollo House',
        l.description = 'The living room of Mark and Jeremy\'s flat in Apollo House, depicted as a chaotic yet creative space littered with empty Red Bull cans and printouts of Gary Vaynerchuk quotes. The setting is indicative of a blend of desperation and aspiration, serving as the backdrop for Jeremy\'s ambitious pitch practice.',
        l.type = 'Apartment'
    ;
MERGE (l:Location {uuid: 'location-metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
    ON CREATE SET
        l.name = 'MetricShift Digital Solutions HQ - Canary Wharf Innovation Suite, 14th Floor',
        l.description = 'The \'Ideation Zone\' has been transformed for the monthly Innovation Sundowner with fairy lights outlining whiteboards covered in buzzwords. It features kombucha stations arranged under the supervision of Charlotte Walsh-Henderson, creating a modern and trendy corporate atmosphere.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-metricshift_the_disruption_chamber'})
    ON CREATE SET
        l.name = 'MetricShift Executive Boardroom - \'The Disruption Chamber\'',
        l.description = 'A rebranded executive boardroom at MetricShift, featuring modern design elements like Herman Miller wallpaper. It serves as the venue for important corporate presentations and meetings, emphasizing a \'disruptive\' business culture.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-kitchen_apollo_house'})
    ON CREATE SET
        l.name = 'Mark and Jeremy\'s Flat - Kitchen',
        l.description = 'The kitchen of Mark and Jeremy\'s flat in Apollo House, cluttered with printouts about blockchain and meditation apps. Super Hans is seated at the table with his laptop displaying the remnants of his hacked cryptocurrency project \'MindCoin\'.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-the_fox_goose_pub'})
    ON CREATE SET
        l.name = 'The Fox & Goose Pub',
        l.description = 'A local pub located on Croydon High Street, characterized by its typical pub atmosphere where patrons gather for drinks and conversation. In this scene, Mark and Jeremy sit at a corner table, highlighting this as a place for social interaction and reflection.',
        l.type = 'Pub'
    ;
MERGE (o:Organization {uuid: 'org-metricshift_digital'})
    ON CREATE SET
        o.name = 'MetricShift Digital',
        o.description = 'MetricShift Digital is a company focusing on digital transformation initiatives and workplace innovation. It hosts innovation events to identify disruptive technologies.',
        o.sphere_of_influence = 'Corporate digital solutions and workplace innovation.'
    ;
MERGE (o:Organization {uuid: 'org-johnson_dynamic_solutions'})
    ON CREATE SET
        o.name = 'Johnson Dynamic Solutions',
        o.description = 'Johnson Dynamic Solutions is a company exploring merger opportunities with MetricShift Digital Solutions and is interested in innovative digital solutions.',
        o.sphere_of_influence = 'Corporate mergers and strategic partnerships in digital solutions.'
    ;
MERGE (o:Organization {uuid: 'org-sonicchain'})
    ON CREATE SET
        o.name = 'SonicChain',
        o.description = 'SonicChain is an emerging project combining corporate sound therapy and mindfulness apps, integrated with blockchain technology.',
        o.sphere_of_influence = 'Corporate sound and mindfulness solutions, blockchain technology.'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    ON CREATE SET
        ep.title = 'Episode One - The Networking Event',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene-1'})
    ON CREATE SET
        s.title = 'Mark\'s Morning Anxiety and Jeremy\'s Pitch Preparation',
        s.description = 'In Mark\'s bedroom at Apollo House, Croydon, the scene opens at 6:47 AM with Mark in his IKEA Markus desk chair, balancing anxieties in his boxers and a TM Lewin shirt. He switches between LinkedIn and a \'Career Crisis Management\' spreadsheet on his HP laptop, contemplating the professional achievements of his colleague, Steve. Meanwhile, Jeremy bursts in, wearing Mark\'s cherished interview suit, accessorized with festival remnants and a \'Web3 Visionary\' badge. Jeremy enthusiastically proclaims his readiness for the MetricShift Innovation Sundowner and seeks Mark\'s approval for his practiced pitch.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_marks_bedroom_apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Mark Reflects on His Career',
        e.description = 'Mark Corrigan sits in his IKEA Markus chair, wearing M&S boxers and a shirt, toggling between LinkedIn and his \'Career Crisis Management\' spreadsheet on his HP laptop. He reflects on a LinkedIn post by Steve from accounts, feeling inadequate due to Steve\'s new Microsoft Excel certification, adding to his career worries as his \'Employee of the Month\' certificate and Dartmouth diploma hang on the wall.',
        e.sequence = 1,
        e.key_dialogue = ["MARK (V/O): God, Steve from accounts has done another 'humbled to announce' post. He's got a Microsoft Excel certification. The man who logged into his own LinkedIn through the company Twitter last month is now officially more qualified than me. The digital revolution is eating its children."]
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Jeremy Declares His Mastery of LinkedIn',
        e.description = 'From off-screen, Jeremy Usbourne excitedly announces to Mark that he has mastered the LinkedIn algorithm. However, Mark\'s inner monologue reveals dismay as he notices Jeremy is wearing his cherished interview suit. Jeremy enters, dressed in the suit and adorned with festival wristbands and a \'Web3 Visionary\' pin badge, and asks Mark for his opinion on his appearance for the MetricShift Innovation Sundowner. A confrontation ensues over Jeremy\'s choice to wear the suit.',
        e.sequence = 2,
        e.key_dialogue = ["JEREMY (O.S.): Mark! Mark! The corporate world won't know what hit it! I've mastered the LinkedIn algorithm!", "MARK (V/O): Oh Jesus, he's wearing my interview suit. The suit I wore to three job interviews and one disciplinary hearing. It's like watching a monkey wear the crown jewels.", "JEREMY: How do I look? Professional enough for the MetricShift Innovation Sundowner? I've been practicing my pitch all morning.", "MARK: That's my interview suit from the Johnson account pitch. It was in the box marked 'Career Emergency Kit - Do Not Touch Under Any Circumstances.'", "JEREMY: Yeah, well, desperate times, desperate measures. Super Hans says my sonic optimization concept could be the next mindfulness."]
    ;
MERGE (s:Scene {uuid: 'scene-2'})
    ON CREATE SET
        s.title = 'Jeremy\'s Pitch Rehearsal',
        s.description = 'In the living room of Apollo House, Jeremy practices his pitch for the MetricShift Innovation Sundowner, amidst empty Red Bull cans and printouts of Gary Vaynerchuk quotes. He confidently presents himself as a disruptor in the sonic arts space, referencing his project \'Sounds of the Serviced Office\' EP, while Mark watches anxiously. Mark internally reflects on the absurdity of Jeremy\'s plan and pleads with him to avoid outdated business jargon.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location-living_room_apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Jeremy Practices Pitch',
        e.description = 'Jeremy practices his pitch in front of a cracked mirror, surrounded by empty Red Bull cans and printouts of Gary Vaynerchuk quotes. He describes himself as a disruptor in the sonic arts space and mentions his \'Sounds of the Serviced Office\' EP.',
        e.sequence = 1,
        e.key_dialogue = ["I'm a disruptor in the sonic arts space, leveraging unique audio paradigms to create transformative experiences. Former projects include the critically acclaimed 'Sounds of the Serviced Office' EP."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Mark Reflects and Advises Jeremy',
        e.description = 'Mark observes Jeremy\'s pitch practice with a sense of disbelief and provides commentary via voiceover, comparing Jeremy\'s situation to Brutus watching Caesar. He warns Jeremy against using outdated business jargon like \'paradigm\'.',
        e.sequence = 2,
        e.key_dialogue = ["He recorded the office printer at his uncle's accounting firm while high on ketamine. And now he's going to present it to Charlotte Walsh-Henderson as a productivity solution.", "Jeremy, please don't say paradigm. Nobody's said paradigm since Northern Rock collapsed."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'Jeremy Asserts His Preparedness',
        e.description = 'Jeremy counters Mark\'s advice by asserting his preparation through having watched TED talks and following Gary Vaynerchuk, claiming he is already like a CEO.',
        e.sequence = 3,
        e.key_dialogue = ["Mark, I've done my research. I've watched three TED talks and followed Gary Vee on Instagram. I'm basically a CEO already."]
    ;
MERGE (s:Scene {uuid: 'scene-3'})
    ON CREATE SET
        s.title = 'Innovation Sundowner at MetricShift Innovation Suite',
        s.description = 'The \'Ideation Zone\' in the Canary Wharf Innovation Suite is lively during the monthly Innovation Sundowner event. Fairy lights illuminate whiteboards filled with buzzwords, and kombucha stations are being set up under the watchful eye of Charlotte Walsh-Henderson, the Head of Digital Transformation. Mark, nervous, stands by the fruit-infused water station, trying to present himself well. Jeremy discusses his sonic optimization concept with Charlotte, attempting to impress her with terms like \'alpha waves\' and \'beta frequencies\' while humorously skirting the line of propriety in his pitch.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location-metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Charlotte Oversees Sundowner Setup',
        e.description = 'Charlotte Walsh-Henderson, Head of Digital Transformation at MetricShift Digital Solutions, oversees the transformation of the \'Ideation Zone\' for the monthly Innovation Sundowner. She ensures the kombucha stations are arranged as part of the event\'s preparations.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'Mark Prepares for Event',
        e.description = 'Mark Corrigan lurks by the fruit-infused water station, adjusting his LinkedIn Premium name badge as he internally stresses about Jeremy interacting with Charlotte. His internal monologue reveals his anxiety about what Jeremy might say.',
        e.sequence = 2,
        e.key_dialogue = ["MARK (V/O): Oh god, he's approaching Charlotte. Don't mention the band, don't mention the ketamine sound installation at the Croydon Buddhist Centre..."]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'Jeremy Discusses Sonic Optimization with Charlotte',
        e.description = 'Jeremy Usbourne engages in conversation with Charlotte Walsh-Henderson about his work in the sonic optimization space. He explains their innovative approach, likening their work to a blend of mindfulness, blockchain, and the optimal amount of caffeine for heightened productivity.',
        e.sequence = 3,
        e.key_dialogue = ["CHARLOTTE: So, Jeremy, Mark tells me you're in the sonic optimization space? We've been looking for innovative solutions since the Great Algorithm Crisis of '23.", "JEREMY: Absolutely. We're harnessing alpha waves and beta frequencies to revolutionize workplace productivity. It's like mindfulness meets blockchain meets that feeling when you've just had exactly the right amount of drugs... I mean, coffee."]
    ;
MERGE (e:Event {uuid: 'event-3-4'})
    ON CREATE SET
        e.title = 'Mark Reflects on Jeremy\'s Responsibilities',
        e.description = 'Mark reflects privately about the responsibilities being given to Jeremy. He compares the situation humorously to historical events, expressing skepticism about Jeremy\'s suitability for these responsibilities.',
        e.sequence = 4,
        e.key_dialogue = ["MARK (V/O): The grown-ups are giving Jeremy real responsibilities. This must be what it felt like when Caligula made his horse a senator."]
    ;
MERGE (s:Scene {uuid: 'scene-4'})
    ON CREATE SET
        s.title = 'Jeremy\'s Chaotic Presentation in The Disruption Chamber',
        s.description = 'In the MetricShift Executive Boardroom, \'The Disruption Chamber,\' Jeremy sets up his DJ equipment, borrowed from Super Hans\' silent disco business, as Alan Johnson, CEO of Johnson Dynamic Solutions, watches with interest. Mark, feeling overshadowed, attempts to blend into the surroundings. Jeremy presents his \'scientifically-engineered productivity soundscape,\' a chaotic mix of electronic beats, office printer sounds, and what might be Buddhist chants. Johnson is impressed, calling it raw and disruptive, and requests a full rollout. Mark internally laments his precarious career standing, considering a simpler life away from the corporate world.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_the_disruption_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Jeremy Sets Up DJ Equipment',
        e.description = 'Jeremy sets up the DJ equipment in \'The Disruption Chamber\' borrowed from Super Hans\' silent disco business. Alan Johnson, the CEO of Johnson Dynamic Solutions, observes with interest as Jeremy prepares to demonstrate his productivity soundscape.',
        e.sequence = 1,
        e.key_dialogue = ["What you're about to experience is a scientifically-engineered productivity soundscape, developed through extensive research at the Croydon Buddhist Centre."]
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Jeremy Plays Chaotic Music, Impresses Alan Johnson',
        e.description = 'Jeremy starts playing a chaotic blend of electronic beats, office printer sounds, and what might be Buddhist chants or a malfunctioning air conditioning unit as part of his productivity soundscape. Alan Johnson, impressed by the raw and disruptive nature of the soundscape, instructs Charlotte to sign Jeremy up for the full rollout.',
        e.sequence = 2,
        e.key_dialogue = ["This is exactly what we need. Raw, disruptive, authentically digital. Charlotte, sign him up for the full rollout."]
    ;
MERGE (s:Scene {uuid: 'scene-5'})
    ON CREATE SET
        s.title = 'Blockchain Brainwave in the Kitchen',
        s.description = 'In the kitchen of Mark and Jeremy\'s flat at Apollo House, Jeremy excitedly makes tea while discussing a new venture with Super Hans. Super Hans, surrounded by blockchain and meditation app printouts, talks about combining Jeremy\'s corporate sound therapy with his mindfulness platform to create \'SonicChain.\' Jeremy suggests incorporating NFTs. Meanwhile, Mark enters, weary of the outlandish plan, as Super Hans pitches integrating blockchain into corporate meditation. Mark reflects on the absurdity, pondering Super Hans\' potential corporate success.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location-kitchen_apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Super Hans Proposes SonicChain',
        e.description = 'Super Hans, surrounded by blockchain and meditation app printouts, proposes combining Jeremy\'s corporate sound therapy with his hacked mindfulness platform to create \'SonicChain\', a new venture they believe corporate suits will love.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is it, Jez. This is the big one. We combine your corporate sound therapy thing with what's left of my mindfulness platform. Call it 'SonicChain.' The suits'll love it."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Jeremy Suggests Adding NFTs',
        e.description = 'Jeremy enthusiastically agrees with Super Hans\' idea and suggests incorporating NFTs into the platform, allowing people to buy rights to different frequency ranges.',
        e.sequence = 2,
        e.key_dialogue = ["JEREMY: Hans, you're a genius. We could add NFTs somehow. Like, people buy the right to different frequency ranges."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'Hans Discusses Past Programming Efforts',
        e.description = 'Super Hans explains that he has been programming since Tuesday after recovering from a ketamine binge. Although Russians have stolen his database, they haven\'t taken his vision.',
        e.sequence = 3,
        e.key_dialogue = ["SUPER HANS: Already on it, my friend. Been coding since Tuesday. Well, since Tuesday's ketamine wore off. The Russians might've nicked my database, but they can't steal the vision."]
    ;
MERGE (e:Event {uuid: 'event-5-4'})
    ON CREATE SET
        e.title = 'Mark Enters and Engages with Super Hans',
        e.description = 'Mark enters the kitchen, wearing his MetricShift lanyard, and comments on Super Hans\' presence. He sarcastically assumes Super Hans wants to pitch his app to MetricShift.',
        e.sequence = 4,
        e.key_dialogue = ["MARK: Oh good, Super Hans is here. I suppose you'll be wanting to pitch your crypto-mindfulness app to MetricShift as well?"]
    ;
MERGE (e:Event {uuid: 'event-5-5'})
    ON CREATE SET
        e.title = 'Super Hans Expands on Vision for SonicChain',
        e.description = 'Super Hans tells Mark to think bigger, emphasizing that blockchain is what\'s missing from corporate meditation, alongside proper drugs, which they plan to address in phase two.',
        e.sequence = 5,
        e.key_dialogue = ["SUPER HANS: Mark, Mark, Mark. Think bigger. What's the one thing missing from corporate meditation? Exactly - the blockchain. That, and proper drugs. But we'll sort that out in phase two."]
    ;
MERGE (e:Event {uuid: 'event-5-6'})
    ON CREATE SET
        e.title = 'Mark Reflects on Super Hans\' Plans',
        e.description = 'Mark internally reflects on Super Hans\' ambitions, cynically predicting that Hans could end up on a board of directors, alluding to the start of a financial crisis.',
        e.sequence = 6,
        e.key_dialogue = ["MARK (V/O): Super Hans is going to end up on the board of directors. This is how the financial crisis started."]
    ;
MERGE (s:Scene {uuid: 'scene-6'})
    ON CREATE SET
        s.title = 'Mark Contemplates Career Jealousy at The Fox & Goose Pub',
        s.description = 'In a corner of The Fox & Goose Pub on Croydon High Street, Mark is quietly despondent, nursing a warm white wine while Jeremy, elated from recent corporate success, celebrates with Super Hans. Hans is inexplicably wearing a MetricShift lanyard and enthusiastically discussing their future business ventures. Mark, feeling overshadowed and existentially conflicted, receives a LinkedIn notification showing that Jeremy has been endorsed for \'Digital Transformation\' and \'Change Management.\' Discouraged, Mark internally muses on Jeremy\'s unforeseen success, likening it to a paradox where misunderstanding the corporate world seems advantageous.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location-the_fox_goose_pub'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-6-1'})
    ON CREATE SET
        e.title = 'Super Hans Talks About His New Venture',
        e.description = 'At the Fox & Goose Pub, Super Hans, Jeremy, and Mark are seated. Super Hans, wearing a MetricShift lanyard, enthusiastically explains to Jeremy that his latest business idea could surpass his previous crypto-mindfulness app, despite being hacked by the Russians.',
        e.sequence = 1,
        e.key_dialogue = ["{speaker: SUPER HANS, line: This is gonna be massive, Jez. Could be bigger than my crypto-mindfulness app. Before it got hacked by the Russians.}", "{speaker: JEREMY, line: I'm thinking global, Hans. Every office in the world, listening to my scientifically optimized sound solutions. It's basically legal drugs.}"]
    ;
MERGE (e:Event {uuid: 'event-6-2'})
    ON CREATE SET
        e.title = 'Mark Reflects on Jeremy\'s Success',
        e.description = 'Mark internally reflects on Jeremy\'s apparent success, noting that Jeremy has become everything Mark wished to be due to misunderstanding corporate culture. Mark compares this to a cat\'s survival instinct, which doesn\'t align with human logic.',
        e.sequence = 2,
        e.key_dialogue = ["{speaker: MARK (V/O), line: Jeremy's become everything I ever wanted to be, by completely misunderstanding everything about the corporate world. Maybe that's the secret? Like how a cat can survive a fall from a higher building than a human because it doesn't understand physics.}"]
    ;
MERGE (e:Event {uuid: 'event-6-3'})
    ON CREATE SET
        e.title = 'Mark Receives LinkedIn Notification',
        e.description = 'Mark\'s phone buzzes with a LinkedIn notification, revealing that Steve from accounts has endorsed Jeremy for \'Digital Transformation\' and \'Change Management.\' Displeased with the news, Mark decides he needs another drink.',
        e.sequence = 3,
        e.key_dialogue = ["{speaker: MARK, line: I need another drink.}"]
    ;
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (o:Organization {uuid: 'org-metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org-metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (o:Organization {uuid: 'org-johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-ikea_markus_chair'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-hp_laptop'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-career_crisis_management_spreadsheet'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-metricshift_certificate'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-dartmouth_diploma'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-m_s_interview_suit'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-cracked_mirror'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-networking_protocols_index_cards'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-printouts'}),
          (a:Agent {uuid: 'agent-super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-laptop'}),
          (a:Agent {uuid: 'agent-super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (o:Organization {uuid: 'org-metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org-metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (o:Organization {uuid: 'org-johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ikea_markus_chair-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark sits in his IKEA Markus chair while reflecting on his career during the early morning.',
        oi.status_before = 'The IKEA Markus chair is in Mark\'s bedroom, used as his desk chair.',
        oi.status_after = 'The IKEA Markus chair remains in Mark\'s bedroom after his reflection upon his career.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ikea_markus_chair'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-hp_laptop-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark toggles between LinkedIn and his \'Career Crisis Management\' spreadsheet on his HP laptop, feeling inadequate comparing himself to a colleague\'s achievement.',
        oi.status_before = 'The HP laptop is in use by Mark for browsing LinkedIn and managing personal spreadsheets.',
        oi.status_after = 'The HP laptop remains in use as Mark continues to reflect on his career.'
    WITH oi
    MATCH (o:Object {uuid: 'object-hp_laptop'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-career_crisis_management_spreadsheet-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark views his \'Career Crisis Management\' spreadsheet on his HP laptop during his reflection.',
        oi.status_before = 'The spreadsheet is stored digitally on Mark\'s HP laptop.',
        oi.status_after = 'The spreadsheet remains unchanged as Mark continues to assess his career path.'
    WITH oi
    MATCH (o:Object {uuid: 'object-career_crisis_management_spreadsheet'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_certificate-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark\'s \'Employee of the Month\' certificate hangs on the wall as a reminder of his past achievements amidst his current career doubts.',
        oi.status_before = 'The certificate is displayed on the wall in Mark\'s bedroom.',
        oi.status_after = 'The certificate remains hanging on the wall during Mark\'s career reflection.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_certificate'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-dartmouth_diploma-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark\'s Dartmouth Business Studies diploma hangs on the wall, symbolizing his educational background as he deals with feelings of inadequacy.',
        oi.status_before = 'The diploma is displayed on the wall in Mark\'s bedroom.',
        oi.status_after = 'The diploma remains unchanged as Mark continues to reflect on his career.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dartmouth_diploma'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-m_s_interview_suit-event-1-1'})
    ON CREATE SET
        oi.description = 'Jeremy wears Mark\'s M&S interview suit, signifying a misuse of Mark\'s designated \'Career Emergency Kit\'.',
        oi.status_before = 'The suit is stored in a box labeled \'Career Emergency Kit - Do Not Touch Under Any Circumstances\'.',
        oi.status_after = 'The suit is worn by Jeremy, against Mark\'s intent of preservation for career emergencies.'
    WITH oi
    MATCH (o:Object {uuid: 'object-m_s_interview_suit'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-m_s_interview_suit-event-1-2'})
    ON CREATE SET
        oi.description = 'Jeremy Usbourne wears Mark\'s interview suit to make an impression at the MetricShift Innovation Sundowner, leading to tensions as it was supposed to be part of Mark\'s Career Emergency Kit.',
        oi.status_before = 'The M&S interview suit was stored securely in a box labeled \'Career Emergency Kit - Do Not Touch Under Any Circumstances.\'',
        oi.status_after = 'The M&S interview suit has been worn by Jeremy, adorned with festival wristbands and a \'Web3 Visionary\' pin badge, temporarily altering its purpose and personal significance.'
    WITH oi
    MATCH (o:Object {uuid: 'object-m_s_interview_suit'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ikea_markus_chair-event-1-2'})
    ON CREATE SET
        oi.description = 'Mark sits on his IKEA Markus chair while obsessively checking LinkedIn and updating his Career Crisis Management spreadsheet.',
        oi.status_before = 'The IKEA Markus chair is Mark\'s typical, unremarkable office chair in his bedroom.',
        oi.status_after = 'The IKEA Markus chair remains in use as Mark\'s spot for work-related contemplation and LinkedIn activity.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ikea_markus_chair'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-hp_laptop-event-1-2'})
    ON CREATE SET
        oi.description = 'Mark uses his HP laptop to toggle between LinkedIn and his Career Crisis Management spreadsheet, reflecting his job-related anxiety.',
        oi.status_before = 'The HP laptop is readily available on Mark\'s desk as his primary work device.',
        oi.status_after = 'The HP laptop continues to be actively used by Mark for managing his career documents and social media engagement.'
    WITH oi
    MATCH (o:Object {uuid: 'object-hp_laptop'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-career_crisis_management_spreadsheet-event-1-2'})
    ON CREATE SET
        oi.description = 'The Career Crisis Management spreadsheet is actively updated by Mark as he evaluates his job prospects and qualifications.',
        oi.status_before = 'The spreadsheet is a digital document on Mark\'s HP laptop, available for use.',
        oi.status_after = 'The spreadsheet continues to be a work in progress, representing Mark\'s ongoing career challenges.'
    WITH oi
    MATCH (o:Object {uuid: 'object-career_crisis_management_spreadsheet'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_certificate-event-1-2'})
    ON CREATE SET
        oi.description = 'The MetricShift Digital \'Employee of the Month (August 2023)\' certificate hangs askew next to Mark\'s Dartmouth diploma, subtly illustrating Mark\'s past recognition juxtaposed with his present insecurity.',
        oi.status_before = 'The certificate is displayed on the wall of Mark\'s bedroom.',
        oi.status_after = 'The certificate remains hanging, its significance reflected in the scene\'s mood and Mark\'s internal dialogue.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_certificate'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Sitting at his IKEA Markus desk chair in M&S boxers and a TM Lewin shirt, toggling between LinkedIn and his \'Career Crisis Management\' spreadsheet on his HP laptop.',
        ap.emotional_state = 'Anxious and inadequate.',
        ap.emotional_tags = ["Anxious", "inadequate."],
        ap.active_plans = ["Reflect on LinkedIn post by Steve", "Manage career anxieties"],
        ap.beliefs = ["Feeling inadequate in comparison to peers", "Corporate achievements are crucial for self-worth"],
        ap.goals = ["Overcome feelings of inadequacy", "Enhance career credentials"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Entering Mark\'s room wearing Mark\'s interview suit, boasting about mastering the LinkedIn algorithm.',
        ap.emotional_state = 'Boisterous and self-assured.',
        ap.emotional_tags = ["Boisterous", "self-assured."],
        ap.active_plans = ["Prepare for MetricShift Innovation Sundowner", "Develop and pitch sonic optimization concept"],
        ap.beliefs = ["Sonic optimization could revolutionize mindfulness", "Personal style can enhance professional opportunities"],
        ap.goals = ["Make an impact at the MetricShift Innovation Sundowner", "Establish himself as a 'Web3 Visionary'"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Sitting at his desk, observing Jeremy\'s behavior and attire with dismay.',
        ap.emotional_state = 'Frustrated and anxious.',
        ap.emotional_tags = ["Frustrated", "anxious."],
        ap.active_plans = ["Analyze LinkedIn profiles for career benchmarking", "Maintain control over his career-related possessions"],
        ap.beliefs = ["The corporate world is becoming increasingly competitive", "Jeremy's actions are disruptive to his organization"],
        ap.goals = ["Regain control over his interview suit", "Prevent further misuse of his career resources"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Excitedly entering the room, wearing Mark\'s interview suit.',
        ap.emotional_state = 'Enthusiastic and hopeful.',
        ap.emotional_tags = ["Enthusiastic", "hopeful."],
        ap.active_plans = ["Present himself professionally for the MetricShift Innovation Sundowner", "Deliver his sonic optimization pitch successfully"],
        ap.beliefs = ["Mastering the LinkedIn algorithm will enhance his professional image", "Wearing the suit will boost his confidence and presence"],
        ap.goals = ["Make a notable impression at the MetricShift Innovation Sundowner", "Gain recognition for his sonic optimization concept"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-cracked_mirror-event-2-1'})
    ON CREATE SET
        oi.description = 'The cracked mirror is used by Jeremy to practice his pitch, serving as a reflective surface to aid in his vocal preparations.',
        oi.status_before = 'The cracked mirror stands in the living room, unutilized for presentation purposes.',
        oi.status_after = 'The cracked mirror continues to exist as a fixture in the living room, unchanged in function but having facilitated Jeremy\'s rehearsal.'
    WITH oi
    MATCH (o:Object {uuid: 'object-cracked_mirror'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-red_bull_cans-event-2-1'})
    ON CREATE SET
        oi.description = 'The empty Red Bull cans are scattered around Jeremy, symbolizing his energy consumption leading up to the pitch practice.',
        oi.status_before = 'The Red Bull cans are empty and littered around the living room.',
        oi.status_after = 'The Red Bull cans remain empty and scattered, serving as evidence of Jeremy\'s preparation rituals.'
    WITH oi
    MATCH (o:Object {uuid: 'object-red_bull_cans'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-gary_vaynerchuk_quotes-event-2-1'})
    ON CREATE SET
        oi.description = 'The printouts of Gary Vaynerchuk quotes are present as motivational materials for Jeremy\'s pitch preparation.',
        oi.status_before = 'The printouts are static, displayed for inspiration.',
        oi.status_after = 'The printouts continue to symbolize Jeremy\'s business strategy inspiration in the room.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-networking_protocols_index_cards-event-2-1'})
    ON CREATE SET
        oi.description = 'Mark reorganizes his Networking Emergency Protocols index cards, reflecting his anxiety and desire for control amidst Jeremy\'s chaotic preparation.',
        oi.status_before = 'The index cards are disorganized, reflective of Mark\'s unsettled mindset.',
        oi.status_after = 'The index cards have been reorganized, indicating Mark\'s attempt to restore order in his environment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-networking_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-cracked_mirror-event-2-2'})
    ON CREATE SET
        oi.description = 'Jeremy uses the cracked mirror to practice his pitch, symbolizing his lack of clarity and focus.',
        oi.status_before = 'The cracked mirror was present in the living room, unused.',
        oi.status_after = 'The cracked mirror reflects Jeremy\'s image as he practices his pitch.'
    WITH oi
    MATCH (o:Object {uuid: 'object-cracked_mirror'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-red_bull_cans-event-2-2'})
    ON CREATE SET
        oi.description = 'Empty Red Bull cans are strewn around as Jeremy practices his pitch, representing his chaotic preparation and reliance on energy drinks.',
        oi.status_before = 'The Red Bull cans were empty and scattered around the living room.',
        oi.status_after = 'The Red Bull cans remain empty and scattered, providing the backdrop to Jeremy\'s pitch preparation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-red_bull_cans'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-gary_vaynerchuk_quotes-event-2-2'})
    ON CREATE SET
        oi.description = 'Printouts of Gary Vaynerchuk quotes surround Jeremy as he practices his pitch, suggesting his adoption of motivational business philosophies.',
        oi.status_before = 'The printouts were placed around the living room as inspiration.',
        oi.status_after = 'The printouts remain as a part of Jeremy\'s motivational setup during his pitch practice.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-networking_protocols_index_cards-event-2-2'})
    ON CREATE SET
        oi.description = 'Mark anxiously reorganizes the \'Networking Emergency Protocols\' index cards, showing his nervousness and desire for control over his networking efforts.',
        oi.status_before = 'The index cards were in an initial state of organization by Mark.',
        oi.status_after = 'The index cards are reorganized by Mark as a coping mechanism for his anxiety over Jeremy\'s pitch.'
    WITH oi
    MATCH (o:Object {uuid: 'object-networking_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-cracked_mirror-event-2-3'})
    ON CREATE SET
        oi.description = 'Jeremy practices his pitch in front of the cracked mirror, using it to rehearse and visually prepare himself for his presentation.',
        oi.status_before = 'The cracked mirror is present in the living room, available for use.',
        oi.status_after = 'The cracked mirror remains in the living room, unchanged in its purpose as a reflective surface.'
    WITH oi
    MATCH (o:Object {uuid: 'object-cracked_mirror'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-red_bull_cans-event-2-3'})
    ON CREATE SET
        oi.description = 'Empty Red Bull cans surround Jeremy as he prepares his pitch, symbolizing his past reliance on caffeine for performance.',
        oi.status_before = 'Empty Red Bull cans are scattered around the living room.',
        oi.status_after = 'Empty Red Bull cans remain scattered around the living room, highlighting Jeremy\'s previous energy boost preparations.'
    WITH oi
    MATCH (o:Object {uuid: 'object-red_bull_cans'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-gary_vaynerchuk_quotes-event-2-3'})
    ON CREATE SET
        oi.description = 'Jeremy surrounds himself with printouts of Gary Vaynerchuk quotes, drawing inspiration for self-improvement and to bolster his confidence as he prepares for his presentation.',
        oi.status_before = 'Printouts of Gary Vaynerchuk quotes are in the living room for motivational use.',
        oi.status_after = 'Printouts of Gary Vaynerchuk quotes remain in the living room, continuing to serve as a source of inspiration.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-networking_protocols_index_cards-event-2-3'})
    ON CREATE SET
        oi.description = 'Mark anxiously reorganizes his \'Networking Emergency Protocols\' index cards as he prepares for the upcoming business meeting.',
        oi.status_before = 'The index cards containing networking emergency protocols are disorganized.',
        oi.status_after = 'The index cards are reorganized, reflecting Mark\'s attempt to regain control over the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-networking_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Practicing pitch in front of the cracked mirror, surrounded by Red Bull cans and motivational quotes.',
        ap.emotional_state = 'Confident and determined.',
        ap.emotional_tags = ["Confident", "determined."],
        ap.active_plans = ["Deliver an impressive pitch about his EP", "Convince Charlotte Walsh-Henderson of his capabilities"],
        ap.beliefs = ["Considered a disruptor in the sonic arts space", "Prepared to engage with influential figures like Charlotte"],
        ap.goals = ["To establish himself as an innovative artist", "To secure an opportunity or approval from Charlotte"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Reorganizing his \'Networking Emergency Protocols\' index cards while observing Jeremy.',
        ap.emotional_state = 'Anxious and skeptical.',
        ap.emotional_tags = ["Anxious", "skeptical."],
        ap.active_plans = ["Prepare for potential networking scenarios", "Prevent Jeremy from making a poor impression"],
        ap.beliefs = ["Jeremy's approach might be misguided", "The pitch could be disastrous if unchecked"],
        ap.goals = ["Ensure professional and personal success", "Protect Jeremy from potential embarrassment"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Providing critical commentary on Jeremy\'s pitch practice.',
        ap.emotional_state = 'Anxious and doubtful.',
        ap.emotional_tags = ["Anxious", "doubtful."],
        ap.active_plans = ["Reorganize Networking Emergency Protocols", "Guide Jeremy away from flawed business jargon"],
        ap.beliefs = ["Outdated jargon like 'paradigm' should be avoided", "Jeremy's plan is unrealistic and potentially embarrassing"],
        ap.goals = ["Prevent Jeremy from making a fool of himself", "Ensure preparedness for professional situations"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Practicing his pitch in front of a cracked mirror.',
        ap.emotional_state = 'Confident and self-assured.',
        ap.emotional_tags = ["Confident", "self-assured."],
        ap.active_plans = ["Pitch disruptive ideas in the sonic arts space", "Leverage Gary Vee's strategies for success"],
        ap.beliefs = ["Creative disruption is key to success", "Following popular advice leads to becoming a CEO"],
        ap.goals = ["Impress Charlotte Walsh-Henderson with his pitch", "Achieve recognition and advancement"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Practicing his pitch in front of the mirror.',
        ap.emotional_state = 'Confident and excited.',
        ap.emotional_tags = ["Confident", "excited."],
        ap.active_plans = ["Present his sonic arts project as a productivity solution", "Maintain a CEO-like persona"],
        ap.beliefs = ["Following TED talks and Gary Vee makes him prepared", "He is a disruptor in the sonic arts space"],
        ap.goals = ["Successfully pitch to Charlotte Walsh-Henderson", "Convince others of his CEO potential"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Anxiously reorganizing index cards.',
        ap.emotional_state = 'Anxious and concerned.',
        ap.emotional_tags = ["Anxious", "concerned."],
        ap.active_plans = ["Try to advise Jeremy on improving his presentation"],
        ap.beliefs = ["Using outdated jargon like 'paradigm' is a mistake", "Jeremy's approach could lead to disaster"],
        ap.goals = ["Prevent Jeremy from embarrassing himself", "Ensure the pitch goes smoothly"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ideation_zone-event-3-1'})
    ON CREATE SET
        oi.description = 'The Ideation Zone is the focal point of the transformation for the Innovation Sundowner, exemplifying the creative and innovative atmosphere desired for the event.',
        oi.status_before = 'The \'Ideation Zone\' existed as a standard workplace environment prior to transformation.',
        oi.status_after = 'The \'Ideation Zone\' is visually marked by fairy lights and whiteboards, driving the ambiance of the Innovation Sundowner.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ideation_zone'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-kombucha_stations-event-3-1'})
    ON CREATE SET
        oi.description = 'Kombucha stations are arranged as a key component of the event preparations, under Charlotte\'s supervision, providing refreshments fitting the innovation-centric theme.',
        oi.status_before = 'Kombucha stations were not yet arranged within the Ideation Zone.',
        oi.status_after = 'Kombucha stations are strategically placed and ready for the event, contributing to the atmosphere and functionality of the space.'
    WITH oi
    MATCH (o:Object {uuid: 'object-kombucha_stations'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-fruit_infused_water-event-3-1'})
    ON CREATE SET
        oi.description = 'Mark lurks by the fruit-infused water, interacting indirectly as he straightens his badge, suggesting the water\'s availability as a refreshment option.',
        oi.status_before = 'Fruit-infused water was set as part of the event\'s available refreshments.',
        oi.status_after = 'The fruit-infused water remains available, symbolizing the event\'s commitment to modern and health-conscious refreshment options.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fruit_infused_water'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-linkedin_premium_name_badge-event-3-1'})
    ON CREATE SET
        oi.description = 'Mark straightens his LinkedIn Premium name badge as part of his attempt to present himself professionally during the event.',
        oi.status_before = 'The LinkedIn Premium name badge was slightly askew prior to Mark\'s adjustment.',
        oi.status_after = 'The name badge is adjusted, aiding in Mark\'s polished appearance for the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-fruit_infused_water-event-3-2'})
    ON CREATE SET
        oi.description = 'Mark Corrigan lurks by the fruit-infused water station, possibly using the station as a vantage point while observing interactions and adjusting to his social environment.',
        oi.status_before = 'The fruit-infused water is stationed for the event as a refreshment option.',
        oi.status_after = 'The fruit-infused water remains stationed, presumably unchanged, as the event progresses.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fruit_infused_water'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-linkedin_premium_name_badge-event-3-2'})
    ON CREATE SET
        oi.description = 'Mark Corrigan adjusts his LinkedIn Premium name badge, an action reflecting his preoccupation with making a favorable impression and fitting into the professional setting.',
        oi.status_before = 'The LinkedIn Premium name badge is worn by Mark Corrigan, possibly needing adjustment for visibility.',
        oi.status_after = 'The LinkedIn Premium name badge remains on Mark Corrigan, presumably now adjusted for better display.'
    WITH oi
    MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-kombucha_stations-event-3-2'})
    ON CREATE SET
        oi.description = 'Charlotte Walsh-Henderson oversees the arranging of the kombucha stations, highlighting her role in organizing the event setup.',
        oi.status_before = 'The kombucha stations need organizing and positioning for the event.',
        oi.status_after = 'The kombucha stations are presumably arranged as per the event\'s requirements, under Charlotte\'s supervision.'
    WITH oi
    MATCH (o:Object {uuid: 'object-kombucha_stations'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ideation_zone-event-3-2'})
    ON CREATE SET
        oi.description = 'The Ideation Zone is transformed for the monthly Innovation Sundowner, serving as the backdrop for the event activities.',
        oi.status_before = 'The Ideation Zone is presumably in its standard configuration, awaiting transformation.',
        oi.status_after = 'The Ideation Zone is now transformed, outlined by fairy lights, with a thematic setup for the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ideation_zone'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ideation_zone-event-3-3'})
    ON CREATE SET
        oi.description = 'The Ideation Zone is set up for the monthly Innovation Sundowner, providing a backdrop for discussions on digital transformation and sonic optimization.',
        oi.status_before = 'The Ideation Zone is not explicitly detailed prior to the setup for the Sundowner event.',
        oi.status_after = 'The Ideation Zone is transformed with fairy lights and whiteboards, setting a creative and innovative atmosphere.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ideation_zone'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-kombucha_stations-event-3-3'})
    ON CREATE SET
        oi.description = 'The kombucha stations are arranged under the supervision of Charlotte Walsh-Henderson to enhance the setting for the Innovation Sundowner.',
        oi.status_before = 'Kombucha stations are likely not yet arranged in the Ideation Zone.',
        oi.status_after = 'The kombucha stations are in place as part of the setup for the Innovation Sundowner.'
    WITH oi
    MATCH (o:Object {uuid: 'object-kombucha_stations'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-fruit_infused_water-event-3-3'})
    ON CREATE SET
        oi.description = 'The fruit-infused water serves as a refreshment option, with Mark adjusting his activities around it during the Sundowner.',
        oi.status_before = 'The fruit-infused water is set as a refreshment option.',
        oi.status_after = 'The fruit-infused water remains available as part of the event setup.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fruit_infused_water'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-linkedin_premium_name_badge-event-3-3'})
    ON CREATE SET
        oi.description = 'Mark straightens his LinkedIn Premium name badge, signifying his professional alignment and status in the digital solutions space during the event.',
        oi.status_before = 'The LinkedIn Premium name badge is being worn by Mark.',
        oi.status_after = 'The badge remains straightened and affixed to Mark\'s attire as a symbol of his professional identity.'
    WITH oi
    MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-ideation_zone-event-3-4'})
    ON CREATE SET
        oi.description = 'The Ideation Zone serves as the venue for the monthly Innovation Sundowner event, suggesting a place of important company activity that frames the unfolding interaction.',
        oi.status_before = 'The Ideation Zone is prepared and outlined with fairy lights, indicating an area designed for creative thinking and collaboration.',
        oi.status_after = 'The Ideation Zone continues to be the setting of the monthly Innovation Sundowner, facilitating ongoing company events.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ideation_zone'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-kombucha_stations-event-3-4'})
    ON CREATE SET
        oi.description = 'Kombucha stations are being arranged by Charlotte to enhance the ambiance of the Innovation Sundowner, contributing to the event\'s themed environment.',
        oi.status_before = 'The kombucha stations are being set up for the event, highlighting preparation activities.',
        oi.status_after = 'The kombucha stations are arranged and available for attendees to enjoy during the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-kombucha_stations'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-fruit_infused_water-event-3-4'})
    ON CREATE SET
        oi.description = 'Mark is standing by the station for fruit-infused water, using it as a momentary place of refuge while observing Jeremy\'s conversation.',
        oi.status_before = 'The fruit-infused water is set and ready for the event attendees.',
        oi.status_after = 'The fruit-infused water remains available as a beverage option during the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fruit_infused_water'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-linkedin_premium_name_badge-event-3-4'})
    ON CREATE SET
        oi.description = 'Mark straightens his LinkedIn Premium name badge, signaling his professional investment in making a good impression at the event.',
        oi.status_before = 'The LinkedIn Premium name badge is worn by Mark, indicating his status or affiliation.',
        oi.status_after = 'The LinkedIn Premium name badge remains a part of Mark\'s attire, indicative of his business identity at the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Overseeing the transformation of the \'Ideation Zone\' and ensuring the kombucha stations are correctly arranged.',
        ap.emotional_state = 'Professional and focused.',
        ap.emotional_tags = ["Professional", "focused."],
        ap.active_plans = ["Ensure the Ideation Zone is prepared for the Innovation Sundowner", "Engage with potential collaborators like Jeremy for innovative solutions"],
        ap.beliefs = ["Digital transformation requires innovative approaches and collaborations", "Maintaining order and aesthetic in event preparation is crucial"],
        ap.goals = ["Successfully host the Innovation Sundowner", "Facilitate networking and collaboration for digital transformation projects"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Lurking by the fruit-infused water while straightening his LinkedIn Premium name badge.',
        ap.emotional_state = 'Anxious and self-conscious.',
        ap.emotional_tags = ["Anxious", "self-conscious."],
        ap.active_plans = ["Appear professional and competent among peers", "Avoid embarrassing situations involving Jeremy"],
        ap.beliefs = ["Presentation and networking are crucial for career advancement", "Jeremy's interactions could be unpredictable and potentially embarrassing"],
        ap.goals = ["Maintain a composed and professional appearance", "Avoid any negative attention or mishaps during the event"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Engaging with Charlotte about sonic optimization solutions.',
        ap.emotional_state = 'Confident and forthcoming.',
        ap.emotional_tags = ["Confident", "forthcoming."],
        ap.active_plans = ["Promote his sonic optimization ideas as innovative solutions", "Align his ideas with the organization's needs post-Great Algorithm Crisis"],
        ap.beliefs = ["Sonic optimization and technology can revolutionize productivity", "Being inventive makes one a valuable asset to the company"],
        ap.goals = ["Secure interest in his sonic optimization concept", "Use the event as a platform to enhance his professional standing"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Lurking by the fruit-infused water, adjusting his LinkedIn Premium name badge.',
        ap.emotional_state = 'Anxious and worried.',
        ap.emotional_tags = ["Anxious", "worried."],
        ap.active_plans = ["Monitor Jeremy's interaction with Charlotte without being too obvious."],
        ap.beliefs = ["Jeremy might mention inappropriate topics to Charlotte.", "Feeling sidelined as Jeremy takes on more responsibilities."],
        ap.goals = ["Prevent any potential embarrassment due to Jeremy's comments.", "Maintain a professional image at the Innovation Sundowner."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Engaging in conversation with Charlotte about sonic optimization.',
        ap.emotional_state = 'Confident and enthusiastic.',
        ap.emotional_tags = ["Confident", "enthusiastic."],
        ap.active_plans = ["Impress Charlotte with innovative ideas about sonic optimization."],
        ap.beliefs = ["Combining alpha waves and beta frequencies can revolutionize productivity.", "Likening technology to the uplifting feeling after having the right amount of coffee will resonate."],
        ap.goals = ["Promote innovative solutions to the Great Algorithm Crisis of '23.", "Position himself as an integral part of MetricShift's innovation efforts."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Overseeing arrangements and engaging with Jeremy regarding company innovations.',
        ap.emotional_state = 'Professional and open-minded.',
        ap.emotional_tags = ["Professional", "open-minded."],
        ap.active_plans = ["Explore innovative solutions to the company's recent challenges."],
        ap.beliefs = ["Sonic optimization might offer advancements in productivity post-crisis.", "Collaborative discussions are essential for transformation strategies."],
        ap.goals = ["Identify viable innovation paths for MetricShift.", "Foster a culture of creativity and transformation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Explaining his role in the sonic optimization space to Charlotte Walsh-Henderson.',
        ap.emotional_state = 'Enthusiastic and slightly nervous.',
        ap.emotional_tags = ["Enthusiastic", "slightly nervous."],
        ap.active_plans = ["Convey the importance and innovation of sonic optimization", "Make a positive impression on Charlotte"],
        ap.beliefs = ["Sonic optimization can revolutionize workplace productivity", "Engagement with high-level members like Charlotte is crucial for advancement"],
        ap.goals = ["Secure interest and support from Charlotte for his projects", "Position himself as a valuable asset within the company"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Engaging in a conversation about innovative solutions with Jeremy.',
        ap.emotional_state = 'Curious and open-minded.',
        ap.emotional_tags = ["Curious", "open-minded."],
        ap.active_plans = ["Evaluate Jeremy's ideas for potential implementation", "Explore new solutions to counter the effects of the Great Algorithm Crisis of '23"],
        ap.beliefs = ["Innovation is key to overcoming current challenges", "Jeremy could offer valuable insights for digital transformation"],
        ap.goals = ["Find effective and novel solutions to improve company productivity", "Support innovative projects that align with the company's needs"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Observing Charlotte and Jeremy\'s conversation about Jeremy\'s role in sonic optimization.',
        ap.emotional_state = 'Skeptical and slightly anxious.',
        ap.emotional_tags = ["Skeptical", "slightly anxious."],
        ap.active_plans = ["Monitor Jeremy's interaction with Charlotte", "Maintain a low profile by the fruit-infused water"],
        ap.beliefs = ["Jeremy is not suitable for the responsibilities being given", "Comparisons to historical missteps (e.g. Caligula) underscore the absurdity"],
        ap.goals = ["Ensure personal reputation remains intact", "Avoid direct involvement in Jeremy's initiatives"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Discussing potential innovation in \'sonic optimization\' with Charlotte.',
        ap.emotional_state = 'Confident and a bit overenthusiastic.',
        ap.emotional_tags = ["Confident", "a bit overenthusiastic."],
        ap.active_plans = ["Impress Charlotte with ideas about sonic optimization", "Promote his unconventional methods"],
        ap.beliefs = ["Sonic optimization through alpha waves can improve productivity", "Blurring boundaries with mindfulness and innovative tech enhances value"],
        ap.goals = ["Secure opportunities within the digital transformation efforts", "Establish a leadership role in 'sonic optimization'"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Initiating a discussion with Jeremy about his role in sonic optimization.',
        ap.emotional_state = 'Inquisitive and professional.',
        ap.emotional_tags = ["Inquisitive", "professional."],
        ap.active_plans = ["Explore Jeremy's ideas for potential application", "Assess merit of sonic optimization for workplace productivity"],
        ap.beliefs = ["Innovation is essential following the Great Algorithm Crisis of '23", "Jeremy's contributions could offer unique solutions"],
        ap.goals = ["Identify innovative solutions for digital transformation", "Evaluate Jeremy's fit within the team's objectives"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-dj_equipment-event-4-1'})
    ON CREATE SET
        oi.description = 'Jeremy sets up the DJ equipment borrowed from Super Hans\' silent disco business to play a productivity soundscape.',
        oi.status_before = 'The DJ equipment was with Jeremy, borrowed from Super Hans\' silent disco business.',
        oi.status_after = 'The DJ equipment is set up and actively used in \'The Disruption Chamber\' to play a chaotic blend of sounds.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dj_equipment'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-herman_miller_wallpaper-event-4-1'})
    ON CREATE SET
        oi.description = 'Mark tries to blend into the Herman Miller wallpaper to avoid attention while Jeremy presents.',
        oi.status_before = 'The Herman Miller wallpaper was part of the decor in \'The Disruption Chamber\'.',
        oi.status_after = 'The Herman Miller wallpaper remains unchanged but used as a backdrop for Mark\'s attempt to be inconspicuous.'
    WITH oi
    MATCH (o:Object {uuid: 'object-herman_miller_wallpaper'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-dj_equipment-event-4-2'})
    ON CREATE SET
        oi.description = 'Jeremy uses the DJ equipment to play a new productivity soundscape, creating a chaotic blend of sounds that impresses Alan Johnson.',
        oi.status_before = 'The DJ equipment was borrowed from Super Hans\' silent disco business and set up ready for use.',
        oi.status_after = 'The DJ equipment is actively being used to produce a soundscape for the room, gaining acknowledgment from Alan Johnson.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dj_equipment'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Setting up DJ equipment and starting a productivity soundscape.',
        ap.emotional_state = 'Confident and enthusiastic.',
        ap.emotional_tags = ["Confident", "enthusiastic."],
        ap.active_plans = ["Demonstrate the productivity soundscape to impress Alan Johnson."],
        ap.beliefs = ["The soundscape will highlight his creative and disruptive innovation."],
        ap.goals = ["Secure a corporate contract through the soundscape demonstration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Observing Jeremy\'s demonstration with interest.',
        ap.emotional_state = 'Intrigued and impressed.',
        ap.emotional_tags = ["Intrigued", "impressed."],
        ap.active_plans = ["Evaluate Jeremy's soundscape for potential corporate application."],
        ap.beliefs = ["Innovative soundscapes can be a key differentiator for his company."],
        ap.goals = ["Incorporate disruptive soundscapes as part of the company's offerings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Trying to blend into the Herman Miller wallpaper.',
        ap.emotional_state = 'Embarrassed and anxious.',
        ap.emotional_tags = ["Embarrassed", "anxious."],
        ap.active_plans = ["Avoid drawing attention during Jeremy's demonstration."],
        ap.beliefs = ["Jeremy's success will highlight Mark's own professional shortcomings."],
        ap.goals = ["Find a secure job where he feels fulfilled."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Playing his productivity soundscape to the executive board.',
        ap.emotional_state = 'Confident and enthusiastic.',
        ap.emotional_tags = ["Confident", "enthusiastic."],
        ap.active_plans = ["Demonstrate the unique soundscape's effectiveness to the executives"],
        ap.beliefs = ["The soundscape is innovative and will appeal to corporate culture", "This performance could lead to a job opportunity"],
        ap.goals = ["Secure a position related to his soundscaping work", "Impress Alan Johnson with his unique skills"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Observing and evaluating Jeremy\'s soundscape performance.',
        ap.emotional_state = 'Impressed and intrigued.',
        ap.emotional_tags = ["Impressed", "intrigued."],
        ap.active_plans = ["Consider the potential application of the soundscape in corporate settings"],
        ap.beliefs = ["Innovative soundscapes can enhance productivity", "Jeremy's approach is aligned with modern, digital transformations"],
        ap.goals = ["Implement Jeremy's soundscape within the company", "Leverage unique ideas to maintain competitive edge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Tasked with noting down instructions for Jeremy\'s full rollout.',
        ap.emotional_state = 'Professional and compliant.',
        ap.emotional_tags = ["Professional", "compliant."],
        ap.active_plans = ["Arrange logistics for Jeremy's soundscape full rollout as instructed"],
        ap.beliefs = ["Following Johnson's lead is crucial for success", "This could be a significant corporate innovation"],
        ap.goals = ["Ensure successful implementation of Jeremy's soundscape project", "Support organizational goals through innovation"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-1'})
    ON CREATE SET
        oi.description = 'Super Hans is surrounded by blockchain and meditation app printouts as he proposes the creation of \'SonicChain\'. The printouts serve as a physical representation of the brainstorming and planning efforts for the new venture.',
        oi.status_before = 'The printouts are arranged on the kitchen table, representing information related to blockchain and meditation apps.',
        oi.status_after = 'The printouts remain on the table, having facilitated a key discussion about the potential merger of different platform concepts.'
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-1'})
    ON CREATE SET
        oi.description = 'Super Hans\' laptop displays remnants of his previous cryptocurrency project \'MindCoin\', providing continuity to his digital endeavors and connecting past work with the new \'SonicChain\' idea.',
        oi.status_before = 'Super Hans\' laptop is open on the table with the last segments of the hacked \'MindCoin\' project visible.',
        oi.status_after = 'The laptop continues to display information from the \'MindCoin\' project, untouched but integral to the narrative exploration of digital currency ideas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-1'})
    ON CREATE SET
        oi.description = 'Mark enters the room wearing his MetricShift lanyard, signifying his ongoing connection to MetricShift Digital and hinting at potential crossover between Super Hans\' project and Mark\'s professional sphere.',
        oi.status_before = 'The lanyard is worn by Mark as part of his work attire, representing his affiliation with MetricShift Digital.',
        oi.status_after = 'The lanyard remains on Mark, symbolizing his identity within the corporate world and a possible bridge to future endeavors discussed in the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-2'})
    ON CREATE SET
        oi.description = 'Super Hans\' laptop displays the remains of the hacked cryptocurrency project \'MindCoin,\' which serves as a reference for the idea being discussed between Jeremy and Super Hans.',
        oi.status_before = 'The laptop is displaying information about Super Hans\' failed cryptocurrency project.',
        oi.status_after = 'The laptop continues to display the \'MindCoin\' project information as the conversation evolves into combining it with new ideas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-2'})
    ON CREATE SET
        oi.description = 'The printouts surrounding Super Hans contain information about blockchain and meditation apps, providing background context and inspiration for the plan they are formulating for \'SonicChain.\'',
        oi.status_before = 'The printouts are scattered on the kitchen table, filled with data on blockchain and meditation apps.',
        oi.status_after = 'The printouts remain on the table as part of the conceptual process of creating \'SonicChain\' with NFTs.'
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-2'})
    ON CREATE SET
        oi.description = 'Mark enters the scene wearing his MetricShift lanyard, symbolizing his corporate affiliation and connection to the business aspects of the discussion.',
        oi.status_before = 'The lanyard is worn around Mark\'s neck as he enters the kitchen.',
        oi.status_after = 'The lanyard remains on Mark, highlighting his skepticism despite the entrepreneurial enthusiasm around him.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-3'})
    ON CREATE SET
        oi.description = 'Super Hans is surrounded by printouts about blockchain and meditation apps, which indicate his continued development and brainstorming for his \'SonicChain\' project.',
        oi.status_before = 'The printouts were prepared and placed on the kitchen table by Super Hans for idea consolidation.',
        oi.status_after = 'The printouts remain on the table as reference material for the ongoing discussion about incorporating blockchain technology into Hans and Jeremy\'s new venture.'
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-3'})
    ON CREATE SET
        oi.description = 'Super Hans\' laptop displays the remains of his hacked cryptocurrency project \'MindCoin\', evidencing both the setback of the Russian database theft and his resilient focus on the SonicChain endeavor.',
        oi.status_before = 'Displaying the remnants of the \'MindCoin\' project following a hack.',
        oi.status_after = 'The laptop continues to display the project remnants, unaffected by the meeting but crucial for Super Hans\' ongoing planning and coding efforts.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-3'})
    ON CREATE SET
        oi.description = 'Mark enters wearing his MetricShift lanyard, symbolizing his continued affiliation with the organization and framing his perspective on the proposed venture.',
        oi.status_before = 'Worn by Mark as an indication of his association with MetricShift.',
        oi.status_after = 'Still worn by Mark, symbolizing his professional identity and potential influence on Hans\' presentation to MetricShift.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-4'})
    ON CREATE SET
        oi.description = 'Super Hans is seated at the kitchen table, surrounded by printouts about blockchain and meditation apps, which he discusses as part of his SonicChain concept.',
        oi.status_before = 'The printouts are laid out on the kitchen table, presumably used by Super Hans for his app development.',
        oi.status_after = 'The printouts remain spread out on the table, part of the ongoing discussion about the SonicChain app.'
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-4'})
    ON CREATE SET
        oi.description = 'Super Hans\' laptop is open displaying information about his hacked cryptocurrency project \'MindCoin\', evidencing the technical aspect of his pitch to Jeremy.',
        oi.status_before = 'The laptop is set up on the kitchen table, showing contents related to the MindCoin project.',
        oi.status_after = 'The laptop\'s display remains unchanged, continuing to show detailed project information.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-4'})
    ON CREATE SET
        oi.description = 'Mark enters the scene wearing his MetricShift lanyard, which signifies his corporate affiliation and contextually hints at Super Hans\' intention to pitch his app.',
        oi.status_before = 'The lanyard is worn by Mark, representing his connection to MetricShift.',
        oi.status_after = 'The lanyard continues to be worn by Mark, symbolizing his ongoing association with MetricShift.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-5'})
    ON CREATE SET
        oi.description = 'The printouts about blockchain and meditation apps are present on the kitchen table, symbolizing Super Hans\' vision for \'SonicChain\' combining corporate sound therapy and mindfulness.',
        oi.status_before = 'The printouts are on the kitchen table, providing information about blockchain and meditation apps.',
        oi.status_after = 'The printouts remain on the kitchen table, supporting Super Hans\' explanation of his concept.'
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-5'})
    ON CREATE SET
        oi.description = 'Super Hans uses his laptop to display the remnants of his hacked cryptocurrency project \'MindCoin\', illustrating his ongoing efforts to develop the SonicChain platform.',
        oi.status_before = 'The laptop contains the code and remnants of the \'MindCoin\' project, reflecting Super Hans\' prior work and its exposure to hacking.',
        oi.status_after = 'The laptop continues to be used by Super Hans as a tool for developing his project, despite its compromised state.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-5'})
    ON CREATE SET
        oi.description = 'Mark is wearing his MetricShift lanyard, emphasizing his affiliation with MetricShift Digital Solutions as he encounters Super Hans\' pitch.',
        oi.status_before = 'The MetricShift lanyard is worn by Mark, signifying his role and identity within the organization.',
        oi.status_after = 'Mark continues to wear the MetricShift lanyard, underscoring his corporate connection throughout the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-laptop-event-5-6'})
    ON CREATE SET
        oi.description = 'Super Hans\' laptop is on the kitchen table, displaying remnants of his hacked cryptocurrency project \'MindCoin.\' This setup is integral to his ambitious plan involving blockchain and meditation apps.',
        oi.status_before = 'The laptop displays the remains of Super Hans\' hacked cryptocurrency project \'MindCoin.\'',
        oi.status_after = 'The laptop remains as a tool used by Super Hans for his SonicChain project, reflecting both past failures and future ambitions.'
    WITH oi
    MATCH (o:Object {uuid: 'object-laptop'})
    MATCH (e:Event {uuid: 'event-5-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-printouts-event-5-6'})
    ON CREATE SET
        oi.description = 'Printouts about blockchain and meditation apps surround Super Hans at the kitchen table, supporting his discussion and vision for the new venture \'SonicChain.\'',
        oi.status_before = 'The printouts are arranged on the kitchen table around Super Hans.',
        oi.status_after = 'The printouts continue to serve as informational resources, illustrating Super Hans\' conceptual groundwork for his upcoming project \'SonicChain.\''
    WITH oi
    MATCH (o:Object {uuid: 'object-printouts'})
    MATCH (e:Event {uuid: 'event-5-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-5-6'})
    ON CREATE SET
        oi.description = 'Mark enters the room wearing his MetricShift lanyard, symbolizing his corporate identity and referencing his underlying skepticism towards Super Hans\' ideas.',
        oi.status_before = 'Mark is wearing the MetricShift lanyard, part of his typical work attire.',
        oi.status_after = 'The MetricShift lanyard remains as part of Mark\'s attire, symbolizing his relationship with the corporate world and its conflicts with Hans\' unconventional ideas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Proposing SonicChain, discussing integration of corporate sound therapy with mindfulness app.',
        ap.emotional_state = 'Enthusiastic and optimistic.',
        ap.emotional_tags = ["Enthusiastic", "optimistic."],
        ap.active_plans = ["Develop and finalize SonicChain concept", "Integrate NFTs into the platform", "Work on coding post-Tuesday's ketamine effects"],
        ap.beliefs = ["SonicChain will revolutionize corporate meditation", "Blockchain integration is key to success"],
        ap.goals = ["Launch SonicChain as a new venture", "Attract interest from corporate investors"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Engaging with Super Hans on the development of SonicChain.',
        ap.emotional_state = 'Excited and impressed by Hans\'s idea.',
        ap.emotional_tags = ["Excited", "impressed by Hans's idea."],
        ap.active_plans = ["Collaborate with Super Hans on SonicChain", "Explore incorporating NFTs into the venture"],
        ap.beliefs = ["Combining sound therapy with blockchain is a breakthrough", "There's potential for high corporate demand"],
        ap.goals = ["Contribute to the success of SonicChain", "Capitalize on the corporate wellness market"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Observing Super Hans\'s enthusiasm for SonicChain.',
        ap.emotional_state = 'Skeptical and wary.',
        ap.emotional_tags = ["Skeptical", "wary."],
        ap.active_plans = ["Monitor Super Hans's developments", "Maintain caution towards crypto-related ventures"],
        ap.beliefs = ["Super Hans's idea may lead to unforeseen consequences", "Cryptocurrency ventures are high-risk"],
        ap.goals = ["Avoid being dragged into potentially volatile ventures", "Keep metrics and risks in sight"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Excitedly preparing tea while discussing platform ideas.',
        ap.emotional_state = 'Excited and optimistic.',
        ap.emotional_tags = ["Excited", "optimistic."],
        ap.active_plans = ["Incorporate NFTs into the SonicChain platform", "Explore innovative uses for frequency ranges in the meditation app"],
        ap.beliefs = ["Combining sound therapy with blockchain technology is a promising venture", "Super Hans has a visionary idea that could be successful"],
        ap.goals = ["Create a successful and novel platform", "Capitalize on the trend of NFTs and blockchain"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Proposing SonicChain and coding on his laptop.',
        ap.emotional_state = 'Confident and slightly manic.',
        ap.emotional_tags = ["Confident", "slightly manic."],
        ap.active_plans = ["Integrate the remnants of MindCoin into SonicChain", "Develop the platform despite previous setbacks"],
        ap.beliefs = ["The combination of corporate meditation and blockchain is innovative", "The vision for SonicChain remains intact despite data theft"],
        ap.goals = ["Launch SonicChain successfully", "Pitch the app to potential investors or companies like MetricShift"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Explaining his vision for SonicChain at the kitchen table.',
        ap.emotional_state = 'Excited and determined.',
        ap.emotional_tags = ["Excited", "determined."],
        ap.active_plans = ["Combine corporate sound therapy with his mindfulness platform.", "Integrate NFTs into the SonicChain project."],
        ap.beliefs = ["The Russians can't steal his vision.", "Combining blockchain with meditation appeals to the corporate market."],
        ap.goals = ["Launch the SonicChain project successfully.", "Secure support from Mark and leverage his corporate connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Excitedly making tea while discussing the potential of SonicChain.',
        ap.emotional_state = 'Enthusiastic and inspired.',
        ap.emotional_tags = ["Enthusiastic", "inspired."],
        ap.active_plans = ["Collaborate with Super Hans on SonicChain.", "Explore the integration of NFTs into the platform."],
        ap.beliefs = ["Super Hans' idea could be a big success.", "SonicChain has potential with corporate clients if marketed correctly."],
        ap.goals = ["Become a successful partner in the SonicChain project.", "Encourage innovation and collaboration with Super Hans."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Entering the kitchen, commenting on Super Hans\' presence and his app.',
        ap.emotional_state = 'Skeptical and wary.',
        ap.emotional_tags = ["Skeptical", "wary."],
        ap.active_plans = ["Assess the potential impact of Hans' project on MetricShift."],
        ap.beliefs = ["Super Hans could gain influence, reminiscent of past market crises."],
        ap.goals = ["Protect MetricShift from risky ventures.", "Evaluate the feasibility of introducing SonicChain to corporate structures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-4'})
    ON CREATE SET
        ap.current_status = 'Entering the kitchen, noticing Super Hans\' presence.',
        ap.emotional_state = 'Sarcastic and slightly exasperated.',
        ap.emotional_tags = ["Sarcastic", "slightly exasperated."],
        ap.active_plans = ["Confront Super Hans about pitching his app"],
        ap.beliefs = ["Super Hans' ideas are preposterous", "Corporate decision-making can sometimes be irrational"],
        ap.goals = ["Maintain professionalism", "Navigate workplace dynamics without major incidents"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-4'})
    ON CREATE SET
        ap.current_status = 'Sitting at the kitchen table, discussing app ideas with Jeremy.',
        ap.emotional_state = 'Confident and enthusiastic.',
        ap.emotional_tags = ["Confident", "enthusiastic."],
        ap.active_plans = ["Develop the 'SonicChain' app", "Incorporate blockchain into corporate mindfulness"],
        ap.beliefs = ["Blockchain can revolutionize corporate meditation", "His vision for 'SonicChain' will be a major success"],
        ap.goals = ["Successfully pitch the app idea", "Gain corporate backing for the app"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-4'})
    ON CREATE SET
        ap.current_status = 'Making tea while discussing the app with Super Hans.',
        ap.emotional_state = 'Excited and supportive.',
        ap.emotional_tags = ["Excited", "supportive."],
        ap.active_plans = ["Collaborate with Super Hans on the app", "Explore NFT integration in the 'SonicChain' app"],
        ap.beliefs = ["Hans' app idea has potential", "NFTs could enhance the app's appeal"],
        ap.goals = ["Help develop the 'SonicChain' platform", "Be involved in a successful innovative project"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-5'})
    ON CREATE SET
        ap.current_status = 'Explaining the integration of blockchain with corporate meditation to Mark.',
        ap.emotional_state = 'Confident and visionary.',
        ap.emotional_tags = ["Confident", "visionary."],
        ap.active_plans = ["Develop SonicChain by combining blockchain with sound therapy.", "Address proper drug use in phase two of the plan."],
        ap.beliefs = ["Blockchain is the missing component for successful corporate meditation.", "The vision for SonicChain is unique and cannot be stolen."],
        ap.goals = ["Launch SonicChain as a marketable product.", "Secure interest from organizations like MetricShift."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-5'})
    ON CREATE SET
        ap.current_status = 'Listening to Super Hans\' presentation of SonicChain.',
        ap.emotional_state = 'Skeptical and apprehensive.',
        ap.emotional_tags = ["Skeptical", "apprehensive."],
        ap.active_plans = [],
        ap.beliefs = ["Super Hans' ideas could lead to significant corporate changes.", "Blockchain-based meditation apps may not be sustainable long-term."],
        ap.goals = ["Evaluate the feasibility of SonicChain for MetricShift.", "Consider the implications of such innovation in corporate settings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-6'})
    ON CREATE SET
        ap.current_status = 'Reflecting cynically on Super Hans\' ambitions while standing in the kitchen.',
        ap.emotional_state = 'Skeptical and cynical.',
        ap.emotional_tags = ["Skeptical", "cynical."],
        ap.active_plans = ["Observe Super Hans and Jeremy's discussion", "Mentally critique Super Hans' schemes"],
        ap.beliefs = ["Super Hans could potentially succeed in his unorthodox ventures", "Such ventures could contribute to financial instability"],
        ap.goals = ["Maintain awareness of potential business opportunities", "Protect himself from Super Hans' risky propositions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-6'})
    ON CREATE SET
        ap.current_status = 'Enthusiastically discussing the potential of \'SonicChain\' with Jeremy.',
        ap.emotional_state = 'Confident and visionary.',
        ap.emotional_tags = ["Confident", "visionary."],
        ap.active_plans = ["Develop 'SonicChain' leveraging blockchain and mindfulness", "Incorporate NFTs into the platform"],
        ap.beliefs = ["Combining blockchain with mindfulness is a groundbreaking idea", "Corporate environments will embrace 'SonicChain'"],
        ap.goals = ["Launch 'SonicChain' successfully", "Potentially present the idea to MetricShift"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-6'})
    ON CREATE SET
        ap.current_status = 'Engaging with Super Hans\' business idea enthusiastically.',
        ap.emotional_state = 'Excited and supportive.',
        ap.emotional_tags = ["Excited", "supportive."],
        ap.active_plans = ["Contribute ideas to 'SonicChain'", "Consider ways to monetize the concept, including NFTs"],
        ap.beliefs = ["Hans' idea is innovative and potentially profitable", "NFT integration could add value to 'SonicChain'"],
        ap.goals = ["Help develop 'SonicChain' to fruition", "Benefit financially from the project"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-6-1'})
    ON CREATE SET
        oi.description = 'Super Hans is wearing the MetricShift lanyard, signifying his affiliation and perhaps official representation in the business discussion.',
        oi.status_before = 'The MetricShift lanyard was likely unworn prior to the scene, or in Super Hans\' possession.',
        oi.status_after = 'The MetricShift lanyard is being worn by Super Hans during his discussion of new business ideas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-6-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-wine-event-6-1'})
    ON CREATE SET
        oi.description = 'Mark is nursing a glass of warm white wine while observing Jeremy and Super Hans, highlighting a contrast with their enthusiastic conversation.',
        oi.status_before = 'The warm white wine was just in Mark\'s possession unnoticed.',
        oi.status_after = 'The warm white wine remains in Mark\'s possession as he decides he needs another drink.'
    WITH oi
    MATCH (o:Object {uuid: 'object-wine'})
    MATCH (e:Event {uuid: 'event-6-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-phone-event-6-1'})
    ON CREATE SET
        oi.description = 'Mark\'s phone buzzes with a LinkedIn notification, signifying the outside world’s continuous interaction and possibly Mark\'s professional insecurities.',
        oi.status_before = 'Mark\'s phone was idle until the LinkedIn notification.',
        oi.status_after = 'Mark\'s phone displays a LinkedIn notification indicating further social proof of Jeremy\'s success.'
    WITH oi
    MATCH (o:Object {uuid: 'object-phone'})
    MATCH (e:Event {uuid: 'event-6-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-wine-event-6-2'})
    ON CREATE SET
        oi.description = 'Mark nurses a glass of warm white wine while reflecting on Jeremy\'s success at the pub.',
        oi.status_before = 'The warm white wine is in a glass at the corner table in the pub.',
        oi.status_after = 'Mark continues to nurse the warm white wine as he reflects and comments that he needs another drink.'
    WITH oi
    MATCH (o:Object {uuid: 'object-wine'})
    MATCH (e:Event {uuid: 'event-6-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-6-2'})
    ON CREATE SET
        oi.description = 'Super Hans is inexplicably wearing a MetricShift lanyard while talking to Mark and Jeremy.',
        oi.status_before = 'The MetricShift lanyard is in Super Hans\' possession, worn around his neck.',
        oi.status_after = 'Super Hans continues wearing the MetricShift lanyard during the celebration.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-6-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-phone-event-6-2'})
    ON CREATE SET
        oi.description = 'Mark\'s phone buzzes with a LinkedIn notification, notifying Mark that Steve from accounts has endorsed Jeremy.',
        oi.status_before = 'Mark\'s phone is in his possession, likely in his pocket or on the table.',
        oi.status_after = 'The phone displays a LinkedIn notification about Jeremy being endorsed, and Mark presumably checks it.'
    WITH oi
    MATCH (o:Object {uuid: 'object-phone'})
    MATCH (e:Event {uuid: 'event-6-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-phone-event-6-3'})
    ON CREATE SET
        oi.description = 'Mark\'s phone receives a LinkedIn notification that informs him about Steve endorsing Jeremy for \'Digital Transformation\' and \'Change Management,\' prompting Mark\'s displeasure.',
        oi.status_before = 'Mark\'s phone is idle with no ongoing notifications or interactions.',
        oi.status_after = 'Mark\'s phone displays the LinkedIn notification, influencing Mark\'s mood and action.'
    WITH oi
    MATCH (o:Object {uuid: 'object-phone'})
    MATCH (e:Event {uuid: 'event-6-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-wine-event-6-3'})
    ON CREATE SET
        oi.description = 'Mark is drinking a warm white wine while reacting to the LinkedIn notification on his phone.',
        oi.status_before = 'The wine is a full glass being nursed by Mark.',
        oi.status_after = 'Mark contemplates getting another drink, indicating the current glass\'s contents have diminished.'
    WITH oi
    MATCH (o:Object {uuid: 'object-wine'})
    MATCH (e:Event {uuid: 'event-6-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-metricshift_lanyard-event-6-3'})
    ON CREATE SET
        oi.description = 'Super Hans is wearing a MetricShift lanyard during the discussion about potential ventures, signifying his association with Mark and Jeremy.',
        oi.status_before = 'The MetricShift lanyard is being worn by Super Hans, making it visibly present at the scene.',
        oi.status_after = 'The MetricShift lanyard remains worn by Super Hans, symbolizing his connection to the ongoing conversation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-6-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-1'})
    ON CREATE SET
        ap.current_status = 'Explaining his new business idea to Jeremy.',
        ap.emotional_state = 'Excited and enthusiastic.',
        ap.emotional_tags = ["Excited", "enthusiastic."],
        ap.active_plans = ["Promote new business idea", "Convince Jeremy of its potential success"],
        ap.beliefs = ["This new idea will be bigger than his previous ventures", "Innovative ideas can lead to massive success"],
        ap.goals = ["Launch and grow the new business idea beyond previous projects", "Establish a successful business venture post-crypto app"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-1'})
    ON CREATE SET
        ap.current_status = 'Celebrating with Super Hans and discussing business ideas.',
        ap.emotional_state = 'Optimistic and ambitious.',
        ap.emotional_tags = ["Optimistic", "ambitious."],
        ap.active_plans = ["Expand business reach globally", "Develop scientifically optimized sound solutions"],
        ap.beliefs = ["Global reach and office integration is key to success", "Optimized sound solutions can replicate the effects of drugs legally"],
        ap.goals = ["Implement sound solutions in offices worldwide", "Achieve recognition and success in the corporate world"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-1'})
    ON CREATE SET
        ap.current_status = 'Nursing a warm white wine and observing Jeremy\'s success.',
        ap.emotional_state = 'Jealous and contemplative.',
        ap.emotional_tags = ["Jealous", "contemplative."],
        ap.active_plans = ["Contemplate the meaning of success and corporate achievement", "Consider whether misunderstanding the corporate world could be beneficial"],
        ap.beliefs = ["Jeremy's success might come from misunderstanding corporate norms", "Adopting unconventional approaches might lead to unexpected success"],
        ap.goals = ["Find a path to success in the corporate world", "Understand how to leverage one's own misunderstandings or strengths"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-2'})
    ON CREATE SET
        ap.current_status = 'Internally reflecting on Jeremy\'s success and corporate misunderstanding.',
        ap.emotional_state = 'Resigned and wistful.',
        ap.emotional_tags = ["Resigned", "wistful."],
        ap.active_plans = ["Consider getting another drink"],
        ap.beliefs = ["Jeremy's misunderstanding of corporate culture may lead to success", "Thinking differently, like a cat not understanding physics, might be beneficial"],
        ap.goals = ["Achieve personal and professional success", "Coping with feelings of inadequacy related to Jeremy's perceived success"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-2'})
    ON CREATE SET
        ap.current_status = 'Celebrating potential global success of sound solutions with Super Hans.',
        ap.emotional_state = 'Optimistic and ambitious.',
        ap.emotional_tags = ["Optimistic", "ambitious."],
        ap.active_plans = ["Expand sound solutions to a global market"],
        ap.beliefs = ["His sound solutions could become a new global corporate trend", "Equivalent to legal drugs in terms of impact"],
        ap.goals = ["Achieve global recognition and business success", "Implement sound solutions in offices worldwide"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-2'})
    ON CREATE SET
        ap.current_status = 'Discussing business potential with Jeremy while wearing a MetricShift lanyard.',
        ap.emotional_state = 'Enthusiastic and supportive.',
        ap.emotional_tags = ["Enthusiastic", "supportive."],
        ap.active_plans = ["Promote and support Jeremy's sound solution ideas"],
        ap.beliefs = ["Jeremy's idea could surpass previous ventures"],
        ap.goals = ["Be part of a successful business venture", "Support Jeremy's growth and success"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-3'})
    ON CREATE SET
        ap.current_status = 'Checking his phone after receiving a LinkedIn notification.',
        ap.emotional_state = 'Displeased and frustrated.',
        ap.emotional_tags = ["Displeased", "frustrated."],
        ap.active_plans = ["Get another drink to cope with frustration"],
        ap.beliefs = ["Jeremy is succeeding by misunderstanding the corporate world", "There might be secret strategies that defy conventional corporate knowledge"],
        ap.goals = ["Find ways to cope with and possibly challenge Jeremy's unexpected success", "Re-evaluate personal strategies for success"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-3'})
    ON CREATE SET
        ap.current_status = 'Celebrating with Super Hans.',
        ap.emotional_state = 'Excited and enthusiastic.',
        ap.emotional_tags = ["Excited", "enthusiastic."],
        ap.active_plans = ["Promote scientifically optimized sound solutions globally"],
        ap.beliefs = ["Global reach of music can act as 'legal drugs'", "Innovative ideas can capture the corporate world's interest"],
        ap.goals = ["Expand business influence and personal recognition globally", "Capitalize on new digital transformation endorsements"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-3'})
    ON CREATE SET
        ap.current_status = 'Wearing a MetricShift lanyard and celebrating with Jeremy.',
        ap.emotional_state = 'Optimistic and supportive.',
        ap.emotional_tags = ["Optimistic", "supportive."],
        ap.active_plans = [],
        ap.beliefs = ["The current project could be bigger than previous ventures", "Jeremy's music solutions have massive potential"],
        ap.goals = ["Support collaborative projects with Jeremy", "Achieve success with new innovative ventures"]
    ;
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Location {uuid: 'location_marks_bedroom_apollo_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-1'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Location {uuid: 'location-living_room_apollo_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-2'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Location {uuid: 'location-metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-3'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
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
MATCH (a:Event {uuid: 'event-3-4'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Location {uuid: 'location_metricshift_the_disruption_chamber'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-4'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-alan_johnson-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-charlotte_walsh_henderson-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-5'}),
          (b:Location {uuid: 'location-kitchen_apollo_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-5'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
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
MATCH (a:Event {uuid: 'event-5-4'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-5'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-4'}),
          (b:Event {uuid: 'event-5-5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-6'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-5'}),
          (b:Event {uuid: 'event-5-6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-5'}),
          (b:Event {uuid: 'event-5-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-5'}),
          (b:Event {uuid: 'event-5-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-5-6'}),
          (b:Event {uuid: 'event-5-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-5-6'}),
          (b:Event {uuid: 'event-5-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-5-6'}),
          (b:Event {uuid: 'event-5-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-6'}),
          (b:Location {uuid: 'location-the_fox_goose_pub'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-6'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-5'}),
          (b:Scene {uuid: 'scene-6'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-6-1'}),
          (b:Scene {uuid: 'scene-6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-6-2'}),
          (b:Scene {uuid: 'scene-6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-6-1'}),
          (b:Event {uuid: 'event-6-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-6-3'}),
          (b:Scene {uuid: 'scene-6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-6-2'}),
          (b:Event {uuid: 'event-6-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-1'}),
          (b:Event {uuid: 'event-6-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-1'}),
          (b:Event {uuid: 'event-6-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-1'}),
          (b:Event {uuid: 'event-6-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-2'}),
          (b:Event {uuid: 'event-6-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-2'}),
          (b:Event {uuid: 'event-6-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-2'}),
          (b:Event {uuid: 'event-6-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-mark_corrigan-event-6-3'}),
          (b:Event {uuid: 'event-6-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jeremy_usbourne-event-6-3'}),
          (b:Event {uuid: 'event-6-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-super_hans-event-6-3'}),
          (b:Event {uuid: 'event-6-3'})
    MERGE (a)-[:IN_EVENT]->(b);
