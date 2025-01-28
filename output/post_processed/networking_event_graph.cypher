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
MERGE (a:Agent {uuid: 'agent-mark_corrigan'})
    ON CREATE SET
        a.name = 'Mark Corrigan',
        a.title = 'Regional Sales Manager',
        a.description = 'Mark Corrigan is the Regional Sales Manager at MetricShift Digital Solutions. He is characterized by his perpetual anxiety and ambition, feeling increasingly precarious in his role due to ongoing corporate restructures. Mark is methodical and often finds himself trapped in existential dilemmas about his career.',
        a.traits = ["Anxious", "Methodical", "Ambitious"],
        a.sphere_of_influence = 'Sales Management'
    ;
MERGE (a:Agent {uuid: 'agent-jeremy_usbourne'})
    ON CREATE SET
        a.name = 'Jeremy Usbourne',
        a.title = 'None',
        a.description = 'Jeremy Usbourne, often known as Jez, is a musician and creative who is often \'between projects\'. Known for his unconventional and often reckless behavior, Jeremy lives with Mark Corrigan and is attempting to break into the corporate world using questionable business pitches.',
        a.traits = ["Creative", "Reckless", "Unconventional"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent-charlotte_walshhenderson'})
    ON CREATE SET
        a.name = 'Charlotte Walsh-Henderson',
        a.title = 'None',
        a.description = 'Charlotte Walsh-Henderson is Mark Corrigan\'s new boss at MetricShift Digital Solutions. Originating from the Seattle office, she is known for her interest in modern corporate culture. Charlotte is captivated by innovative pitches and implements trendy corporate initiatives.',
        a.traits = ["Innovative", "Corporate Savvy", "Trendy"],
        a.sphere_of_influence = 'Corporate Leadership'
    ;
MERGE (a:Agent {uuid: 'agent-alan_johnson'})
    ON CREATE SET
        a.name = 'Alan Johnson',
        a.title = 'CEO',
        a.description = 'Alan Johnson is the CEO of Johnson Dynamic Solutions, known in industry circles as \'The Disruptor Whisperer\'. He has a track record of turning around startups and is interested in disruptive, innovative ideas.',
        a.traits = ["Disruptive", "Visionary", "Strategic"],
        a.sphere_of_influence = 'Business Strategy'
    ;
MERGE (a:Agent {uuid: 'agent-super_hans'})
    ON CREATE SET
        a.name = 'Super Hans',
        a.title = 'None',
        a.description = 'Super Hans is a former bandmate of Jeremy Usbourne, known for his eccentricity and interest in unconventional business ventures. He has previously been involved in ventures like a \'crypto-mindfulness app.\'',
        a.traits = ["Creative", "Eccentric", "Unorthodox"],
        a.sphere_of_influence = 'None'
    ;
MERGE (o:Object {uuid: 'object-hp_laptop'})
    ON CREATE SET
        o.name = 'HP Laptop',
        o.description = 'A personal laptop owned by Mark, used for work-related tasks and accessing LinkedIn.',
        o.purpose = 'Used by Mark to toggle between LinkedIn and his \'Career Crisis Management\' spreadsheet.',
        o.significance = 'Represents Mark\'s professional life and his struggles with keeping up with the digital world.'
    ;
MERGE (o:Object {uuid: 'object-ikea_markus_desk_chair'})
    ON CREATE SET
        o.name = 'IKEA Markus Desk Chair',
        o.description = 'An office desk chair, part of IKEA\'s product line, used by Mark in his home office setup.',
        o.purpose = 'Provides seating for Mark as he works at his desk.',
        o.significance = 'Contributes to Mark\'s home office environment, representing his personal and professional space.'
    ;
MERGE (o:Object {uuid: 'object-ms_boxers'})
    ON CREATE SET
        o.name = 'M&S Boxers',
        o.description = 'Underwear from Marks & Spencer, part of Mark\'s current attire as he works from home.',
        o.purpose = 'Clothing worn by Mark while working from home.',
        o.significance = 'Highlights Mark\'s state of informality and comfort at home, juxtaposed with the pressures of his professional life.'
    ;
MERGE (o:Object {uuid: 'object-tm_lewin_shirt'})
    ON CREATE SET
        o.name = 'TM Lewin Shirt',
        o.description = 'A shirt from TM Lewin, worn by Mark as part of his current casual-professional attire.',
        o.purpose = 'Part of Mark\'s clothing that bridges casual and professional style.',
        o.significance = 'Symbolizes Mark\'s attempt to maintain professional poise while feeling informal and stressed.'
    ;
MERGE (o:Object {uuid: 'object-career_crisis_management_spreadsheet'})
    ON CREATE SET
        o.name = 'Career Crisis Management Spreadsheet',
        o.description = 'A digital spreadsheet created by Mark to manage his career anxieties and professional plans.',
        o.purpose = 'Helps Mark organize his career strategies and track his professional goals.',
        o.significance = 'Represents Mark’s detailed and anxious approach to handling his career uncertainties.'
    ;
MERGE (o:Object {uuid: 'object-metricshift_employee_of_the_month_certificate'})
    ON CREATE SET
        o.name = 'MetricShift Employee of the Month Certificate',
        o.description = 'A framed certificate awarded to Mark for being Employee of the Month in August 2023 at MetricShift Digital.',
        o.purpose = 'Recognition of Mark\'s achievements and contributions to the company.',
        o.significance = 'Symbolizes Mark\'s achievements and the pressures associated with them, highlighting his anxiety about job security.'
    ;
MERGE (o:Object {uuid: 'object-dartmouth_business_studies_diploma'})
    ON CREATE SET
        o.name = 'Dartmouth Business Studies Diploma',
        o.description = 'An educational diploma from Dartmouth, certifying Mark\'s completion of business studies.',
        o.purpose = 'Represents Mark\'s formal education and his credentials in the business field.',
        o.significance = 'Adds to the backdrop of Mark\'s professional identity and the expectations he feels.'
    ;
MERGE (o:Object {uuid: 'object-ms_suit'})
    ON CREATE SET
        o.name = 'M&S Suit',
        o.description = 'A suit from Marks & Spencer, used by Mark for important professional events, now worn by Jeremy.',
        o.purpose = 'Originally used by Mark for interviews and formal events, currently worn by Jeremy for the MetricShift Innovation Sundowner.',
        o.significance = 'Symbolizes the appropriation of Mark’s professional aspirations by Jeremy, highlighting Jeremy\'s carefree, opportunistic nature.'
    ;
MERGE (o:Object {uuid: 'object-web3_visionary_pin_badge'})
    ON CREATE SET
        o.name = 'Web3 Visionary Pin Badge',
        o.description = 'A pin badge worn by Jeremy, indicating his self-claimed status as a visionary in the Web3 space.',
        o.purpose = 'Serves as an accessory to Jeremy\'s attire, adding flair and a sense of modernity and tech-savviness.',
        o.significance = 'Represents Jeremy\'s attempts to project a modern, innovative image in corporate settings, regardless of the actual expertise.'
    ;
MERGE (o:Object {uuid: 'object-cracked_mirror'})
    ON CREATE SET
        o.name = 'Cracked Mirror',
        o.description = 'A mirror in the living room with visible cracks, used by Jeremy to practice his pitch.',
        o.purpose = 'To offer a reflection for Jeremy as he practices his elevator pitch.',
        o.significance = 'Symbolizes both the fractured reality Jeremy operates in and his distorted self-perception as he prepares for the pitch.'
    ;
MERGE (o:Object {uuid: 'object-empty_red_bull_cans'})
    ON CREATE SET
        o.name = 'Empty Red Bull Cans',
        o.description = 'Numerous empty cans of Red Bull energy drink scattered around, indicative of Jeremy\'s lifestyle.',
        o.purpose = 'Evidence of Jeremy\'s consumption of energy drinks, possibly to maintain energy while preparing for his pitch.',
        o.significance = 'Illustrates Jeremy\'s lifestyle and potentially hints at his anxiety and need for artificial energy boosts.'
    ;
MERGE (o:Object {uuid: 'object-gary_vaynerchuk_quotes_printouts'})
    ON CREATE SET
        o.name = 'Gary Vaynerchuk Quotes Printouts',
        o.description = 'Printouts featuring motivational quotes from Gary Vaynerchuk, a social media influencer and motivational speaker.',
        o.purpose = 'Used by Jeremy as inspiration and guidance for developing his entrepreneurial persona.',
        o.significance = 'Represents Jeremy\'s superficial understanding of business concepts and his reliance on popular motivational sources.'
    ;
MERGE (o:Object {uuid: 'object-networking_emergency_protocols_index_cards'})
    ON CREATE SET
        o.name = 'Networking Emergency Protocols Index Cards',
        o.description = 'Index cards containing Mark\'s organized protocols for networking situations, indicating his meticulous preparation.',
        o.purpose = 'Mark uses these to prepare and organize his approach for networking opportunities to mitigate anxiety.',
        o.significance = 'Highlights Mark\'s methodical and cautious nature, contrasting with Jeremy\'s chaotic approach.'
    ;
MERGE (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    ON CREATE SET
        o.name = 'LinkedIn Premium Name Badge',
        o.description = 'A badge worn by Mark, indicating his use of LinkedIn\'s premium services.',
        o.purpose = 'To identify Mark during the networking event as a participant with a LinkedIn Premium account.',
        o.significance = 'Represents Mark\'s connection and aspirations within the corporate world, despite his underlying insecurities.'
    ;
MERGE (o:Object {uuid: 'object-kombucha_stations'})
    ON CREATE SET
        o.name = 'Kombucha Stations',
        o.description = 'Designated areas serving kombucha, used as part of the office\'s wellness initiative.',
        o.purpose = 'To provide health-conscious refreshments to attendees of the Innovation Sundowner.',
        o.significance = 'Represents the trendy and wellness-oriented corporate atmosphere that the company is trying to promote.'
    ;
MERGE (o:Object {uuid: 'object-fruit-infused_water_station'})
    ON CREATE SET
        o.name = 'Fruit-Infused Water Station',
        o.description = 'A station dispensing fruit-infused water, aligning with MetricShift\'s wellness initiatives.',
        o.purpose = 'To offer a healthy beverage option and enhance the networking experience for the event attendees.',
        o.significance = 'Represents corporate wellness culture and the company\'s efforts to provide healthier lifestyle options.'
    ;
MERGE (o:Object {uuid: 'object-fairy_lights'})
    ON CREATE SET
        o.name = 'Fairy Lights',
        o.description = 'Decorative lights outlining whiteboards, creating an ambient atmosphere.',
        o.purpose = 'To enhance the atmosphere of the \'Ideation Zone\' during the Innovation Sundowner event.',
        o.significance = 'Contributes to the ambiance of modernity and creativity expected in an innovation-focused environment.'
    ;
MERGE (o:Object {uuid: 'object-whiteboards'})
    ON CREATE SET
        o.name = 'Whiteboards',
        o.description = 'Boards stationed in the event space, covered with corporate buzzwords.',
        o.purpose = 'To facilitate brainstorming and display key themes and concepts relevant to the event.',
        o.significance = 'Reflects the idea-centric and jargon-rich environment of modern corporate culture.'
    ;
MERGE (o:Object {uuid: 'object-dj_equipment'})
    ON CREATE SET
        o.name = 'DJ Equipment',
        o.description = 'A set of DJ equipment borrowed by Jeremy from Super Hans\' failed silent disco venture, used for playing electronic music mixes.',
        o.purpose = 'To play Jeremy\'s \'scientifically-engineered productivity soundscape\' during his presentation.',
        o.significance = 'Jeremy uses it to pitch his \'sonic optimization platform\', which captures the interest of Alan Johnson, leading to a potential corporate opportunity.'
    ;
MERGE (o:Object {uuid: 'object-herman_miller_wallpaper'})
    ON CREATE SET
        o.name = 'Herman Miller Wallpaper',
        o.description = 'A wallpaper with a Herman Miller design pattern that Mark tries to blend into as a means of avoiding attention.',
        o.purpose = 'To provide decorative aesthetics in the executive boardroom and for Mark to metaphorically blend into when feeling stressed or anxious.',
        o.significance = 'Symbolizes Mark\'s feelings of insignificance and desire to avoid attention during a high-stakes meeting.'
    ;
MERGE (o:Object {uuid: 'object-metricshift_lanyard'})
    ON CREATE SET
        o.name = 'MetricShift Lanyard',
        o.description = 'A lanyard branded with the MetricShift logo, typically worn by employees as part of their identification and badge-holding gear.',
        o.purpose = 'Typically worn by employees for identification and access within the company premises.',
        o.significance = 'Highlights Super Hans\' unexpected involvement or association with MetricShift, adding to the absurdity of the situation given his outsider status.'
    ;
MERGE (o:Object {uuid: 'object-linkedin_notification'})
    ON CREATE SET
        o.name = 'LinkedIn Notification',
        o.description = 'A notification on Mark\'s phone showing an endorsement for Jeremy on LinkedIn.',
        o.purpose = 'To alert Mark about Jeremy\'s unexpected corporate endorsements, signifying his bizarre success.',
        o.significance = 'Reflects the modern emphasis on appearance over substance in professional endorsements and achievements.'
    ;
MERGE (o:Object {uuid: 'object-phone'})
    ON CREATE SET
        o.name = 'Mark\'s Phone',
        o.description = 'Mark\'s mobile phone, a device capable of calling, messaging, and receiving notifications from apps like LinkedIn.',
        o.purpose = 'Used for communication and receiving updates on professional networks.',
        o.significance = 'Serves as a narrative device to showcase Mark\'s engagement with the corporate world, despite his skeptical view of it.'
    ;
MERGE (l:Location {uuid: 'location-apollo_house-marks_bedroom'})
    ON CREATE SET
        l.name = 'Mark\'s Bedroom - Apollo House',
        l.description = 'A room in Apollo House where Mark Corrigan starts his morning, sitting anxiously at his desk in his bedroom. The room contains his workstation, complete with an IKEA Markus desk chair and HP laptop. Personal achievements like the MetricShift Digital \'Employee of the Month\' certificate and his Dartmouth Business Studies diploma are displayed, albeit in a slightly disorderly manner.',
        l.type = 'Bedroom'
    ;
MERGE (l:Location {uuid: 'location-apollo_house'})
    ON CREATE SET
        l.name = 'Apollo House',
        l.description = 'Apollo House is the residential building where Mark Corrigan lives. It is located in Croydon and contains Mark\'s personal space, featured primarily in this scene as his bedroom.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location-apollo_house-living_room'})
    ON CREATE SET
        l.name = 'Living Room - Apollo House',
        l.description = 'The living room of Apollo House where Jeremy practices his pitch in front of a cracked mirror, surrounded by empty Red Bull cans and printouts of Gary Vaynerchuk quotes. It\'s presumably a typical shared flat environment indicative of Jeremy and Mark\'s lifestyle.',
        l.type = 'Apartment'
    ;
MERGE (l:Location {uuid: 'location-canary_wharf-innovation_suite-14th_floor'})
    ON CREATE SET
        l.name = 'Canary Wharf Innovation Suite, 14th Floor',
        l.description = 'Located within MetricShift Digital Solutions HQ, the suite is used for corporate events like the monthly Innovation Sundowner. Decorated with fairy lights and filled with buzzword-covered whiteboards and kombucha stations, it is overseen by Charlotte Walsh-Henderson.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-metricshift_executive_boardroom-the_disruption_chamber'})
    ON CREATE SET
        l.name = 'MetricShift Executive Boardroom - \'The Disruption Chamber\'',
        l.description = 'The executive boardroom of MetricShift, recently rebranded as \'The Disruption Chamber\'. It is likely a modern, high-end office space used for important meetings and presentations, now witnessing Jeremy\'s unconventional demonstration.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location-fox_and_goose_pub'})
    ON CREATE SET
        l.name = 'The Fox & Goose Pub',
        l.description = 'A pub located on Croydon High Street where Mark and Jeremy are sitting at a corner table. It serves as a casual setting for their meeting and celebration with Super Hans.',
        l.type = 'Pub'
    ;
MERGE (l:Location {uuid: 'location-croydon_high_street'})
    ON CREATE SET
        l.name = 'Croydon High Street',
        l.description = 'The location where The Fox & Goose Pub is situated, indicating the pub\'s local environment in Croydon.',
        l.type = 'Street'
    ;
MERGE (l:Location {uuid: 'location-canary_wharf-innovation_suite-ideation_zone'})
    ON CREATE SET
        l.name = 'Canary Wharf Innovation Suite - Ideation Zone',
        l.description = 'The \'Ideation Zone\' on the 14th floor of MetricShift Digital Solutions HQ, transformed for the monthly Innovation Sundowner with fairy lights outlining whiteboards covered in buzzwords.',
        l.type = 'Event Space'
    ;
MERGE (o:Organization {uuid: 'org-metricshift_digital_solutions'})
    ON CREATE SET
        o.name = 'MetricShift Digital Solutions',
        o.description = 'MetricShift Digital Solutions is a rebranded company involved in digital transformation and technological integration services. Previously known as DataDyne Analytics, it is a workplace characterized by rapid organizational changes and modern corporate culture initiatives.',
        o.sphere_of_influence = 'Digital Transformation and Corporate Solutions'
    ;
MERGE (o:Organization {uuid: 'org-momentary_enlightenment'})
    ON CREATE SET
        o.name = 'Momentary Enlightenment',
        o.description = 'A musical band with Jeremy Usbourne as the frontman, known for their singular performance at the Croydon Buddhist Center.',
        o.sphere_of_influence = 'Music'
    ;
MERGE (o:Organization {uuid: 'org-the_hoxton_shamans'})
    ON CREATE SET
        o.name = 'The Hoxton Shamans',
        o.description = 'An underground DJ collective that Jeremy Usbourne collaborated with during his musical career.',
        o.sphere_of_influence = 'Music and Entertainment'
    ;
MERGE (o:Organization {uuid: 'org-silent_disco_solutions_ltd'})
    ON CREATE SET
        o.name = 'Silent Disco Solutions Ltd.',
        o.description = 'A failed venture by Super Hans related to silent disco events.',
        o.sphere_of_influence = 'Music Events'
    ;
MERGE (o:Organization {uuid: 'org-johnson_dynamic_solutions'})
    ON CREATE SET
        o.name = 'Johnson Dynamic Solutions',
        o.description = 'Johnson Dynamic Solutions is run by Alan Johnson, the CEO, who is renowned for being \'The Disruptor Whisperer\'. The organization is known for turning around startups and is involved in innovative and disruptive ventures.',
        o.sphere_of_influence = 'Business Strategy and Startup Innovation'
    ;
MERGE (o:Organization {uuid: 'org-the_visionary_vista'})
    ON CREATE SET
        o.name = 'The Visionary Vista',
        o.description = 'Recently named glass-walled conference room in MetricShift as part of the \'Spatial Empowerment Initiative\'.',
        o.sphere_of_influence = 'Corporate Space'
    ;
MERGE (o:Organization {uuid: 'org-quantum_horizons'})
    ON CREATE SET
        o.name = 'Quantum Horizons',
        o.description = 'A venture capital firm involved in funding disruptive startups.',
        o.sphere_of_influence = 'Finance, Startups'
    ;
MERGE (s:Scene {uuid: 'scene-001'})
    ON CREATE SET
        s.title = 'Anxiety in Apollo House: The Career Crisis Commences',
        s.description = 'In the early morning at Mark\'s bedroom in Apollo House, Croydon, Mark Corrigan sits at his IKEA Markus desk chair, toggling between LinkedIn and a \'Career Crisis Management\' spreadsheet on his HP laptop, dressed in M&S boxers and a TM Lewin shirt. The scene captures Mark’s growing anxiety over career advancements as he notices Steve from accounts has obtained a new Microsoft Excel certification. Jeremy Usbourne bursts in wearing Mark\'s interview suit, adorned with festival wristbands and a \'Web3 Visionary\' pin badge, declaring he\'s ready for the MetricShift Innovation Sundowner. He excitedly claims to have mastered the LinkedIn algorithm, while Mark reflects with skepticism and dread about Jeremy’s bold venture into the corporate world, using his \'Career Emergency Kit\'.',
        s.scene_number = 1
    WITH s
    MATCH (l:Location {uuid: 'location-apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Mark Contemplates the Corporate Rat Race',
        e.description = 'Mark sits at his desk early in the morning, toggling between LinkedIn and his career crisis spreadsheet on his laptop. He reflects on the absurdity of the digital revolution and the qualifications race as he notices a former colleague\'s new certification post.',
        e.sequence = 1,
        e.key_dialogue = ["God, Steve from accounts has done another 'humbled to announce' post. He's got a Microsoft Excel certification. The man who logged into his own LinkedIn through the company Twitter last month is now officially more qualified than me. The digital revolution is eating its children."]
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Jeremy Announces His Mastery of LinkedIn',
        e.description = 'Jeremy interrupts Mark\'s introspection by excitedly declaring that he has mastered the LinkedIn algorithm. He bursts into the room wearing Mark\'s suit, ready to pitch at the MetricShift Innovation Sundowner.',
        e.sequence = 2,
        e.key_dialogue = ["Mark! Mark! The corporate world won't know what hit it! I've mastered the LinkedIn algorithm!", "How do I look? Professional enough for the MetricShift Innovation Sundowner? I've been practicing my pitch all morning.", "That's my interview suit from the Johnson account pitch. It was in the box marked 'Career Emergency Kit - Do Not Touch Under Any Circumstances.'", "Yeah, well, desperate times, desperate measures. Super Hans says my sonic optimization concept could be the next mindfulness."]
    ;
MERGE (s:Scene {uuid: 'scene-002'})
    ON CREATE SET
        s.title = 'Jeremy\'s Pitch Rehearsal',
        s.description = 'In the living room of Apollo House, the morning sun highlights the cluttered surroundings filled with empty Red Bull cans and motivational printouts. Jeremy stands in front of a cracked mirror, practicing his pitch about being a \'disruptor in the sonic arts space.\' His monologue is filled with buzzwords and confidence built on following Gary Vaynerchuk\'s teachings. Mark, meanwhile, anxiously organizes his \'Networking Emergency Protocols\' index cards in preparation for the impending networking event, internally critiquing Jeremy\'s credibility and word choices.',
        s.scene_number = 2
    WITH s
    MATCH (l:Location {uuid: 'location-apollo_house-living_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Jeremy Practices His Pitch',
        e.description = 'Jeremy Usbourne practices his pitch for the networking event in the living room. He claims to be a \'disruptor in the sonic arts space\' while rehearsing in front of a cracked mirror. The room is cluttered with empty Red Bull cans and printouts of quotes from Gary Vaynerchuk.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: I'm a disruptor in the sonic arts space, leveraging unique audio paradigms to create transformative experiences. Former projects include the critically acclaimed 'Sounds of the Serviced Office' EP."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Mark Reacts to Jeremy\'s Practice',
        e.description = 'Mark Corrigan watches Jeremy practice and internally comments on the absurdity of Jeremy\'s pitch. Mark reminds Jeremy not to use outdated buzzwords like \'paradigm,\' recalling Jeremy\'s plan to present it as a productivity solution.',
        e.sequence = 2,
        e.key_dialogue = ["MARK (V/O): He recorded the office printer at his uncle's accounting firm while high on ketamine. And now he's going to present it to Charlotte Walsh-Henderson as a productivity solution. This must be how Brutus felt watching Caesar walk into the Senate.", "MARK: Jeremy, please don't say paradigm. Nobody's said paradigm since Northern Rock collapsed."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'Jeremy Justifies His Confidence',
        e.description = 'Jeremy confidently retorts to Mark\'s skepticism by claiming he has done his research. He references watching TED talks and following Gary Vaynerchuk on Instagram as his qualifications.',
        e.sequence = 3,
        e.key_dialogue = ["JEREMY: Mark, I've done my research. I've watched three TED talks and followed Gary Vee on Instagram. I'm basically a CEO already."]
    ;
MERGE (s:Scene {uuid: 'scene-003'})
    ON CREATE SET
        s.title = 'The Innovation Sundowner: Jeremy\'s Sonic Audacity',
        s.description = 'In the Canary Wharf Innovation Suite on the 14th floor, the \'Ideation Zone\' has been decorated for MetricShift\'s monthly Innovation Sundowner. The atmosphere is corporate yet festive, with fairy lights adorning whiteboards filled with buzzwords. Charlotte Walsh-Henderson, the new Head of Digital Transformation, manages the setup of kombucha stations and motivates the attendees. Mark Corrigan, anxious about his position, stands beside the fruit-infused water station, repeatedly adjusting his LinkedIn Premium name badge. Meanwhile, Jeremy Usbourne audaciously engages with Charlotte, pitching his fabricated concept of \'sonic optimization\' as a revolutionary workplace productivity solution. Despite its dubious claims, Jeremy\'s confidence seems to resonate with Charlotte, highlighting the absurd intersection of modern corporate culture and unfounded entrepreneurial flair.',
        s.scene_number = 3;
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Jeremy Engages with Charlotte on \'Sonic Optimization\'',
        e.description = 'Jeremy engages in a conversation with Charlotte Walsh-Henderson, presenting his pitch about sonic optimization in the workplace. Charlotte expresses interest in Jeremy\'s innovations, possibly opening the door for future opportunities.',
        e.sequence = 1,
        e.key_dialogue = ["CHARLOTTE: So, Jeremy, Mark tells me you're in the sonic optimization space? We've been looking for innovative solutions since the Great Algorithm Crisis of '23.", "JEREMY: Absolutely. We're harnessing alpha waves and beta frequencies to revolutionize workplace productivity. It's like mindfulness meets blockchain meets that feeling when you've just had exactly the right amount of drugs... I mean, coffee."]
    ;
MERGE (s:Scene {uuid: 'scene-004'})
    ON CREATE SET
        s.title = 'The Big Pitch',
        s.description = 'The scene is set in the Executive Boardroom of MetricShift, colloquially known as \'The Disruption Chamber,\' on a morning one week after the earlier networking event. Jeremy Usbourne, with his usual mix of improvisation and misplaced confidence, sets up DJ equipment borrowed from Super Hans. This setup, a relic from a failed silent disco venture, is aimed at creating what Jeremy pitches as a \'scientifically-engineered productivity soundscape.\' Alan Johnson, the potential merger partner and CEO of Johnson Dynamic Solutions, and Charlotte Walsh-Henderson, Mark’s new boss, are present. As Jeremy launches into his chaotic blend of sounds, Johnson commends the disruptive and raw nature of the presentation, leading to Jeremy being signed up for a full rollout despite the unconventional nature of the pitch. Mark, observing this unfold, internally contemplates an escape from his current trajectory into a simpler life at Pret A Manger.',
        s.scene_number = 4
    WITH s
    MATCH (l:Location {uuid: 'location-metricshift_executive_boardroom-the_disruption_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Jeremy Sets Up DJ Equipment for Executive Boardroom Presentation',
        e.description = 'Jeremy Usbourne sets up his DJ equipment, borrowed from Super Hans\' silent disco venture, in MetricShift\'s executive boardroom \'The Disruption Chamber\' for a presentation to the senior management team.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: What you're about to experience is a scientifically-engineered productivity soundscape, developed through extensive research at the Croydon Buddhist Centre."]
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Jeremy\'s Sonic Presentation Impresses Alan Johnson',
        e.description = 'Jeremy begins his presentation by playing a chaotic blend of electronic beats and other sounds, positioning it as a productivity soundscape. Alan Johnson is impressed and sees potential in Jeremy\'s concept for a corporate rollout.',
        e.sequence = 2,
        e.key_dialogue = ["MARK (V/O): He's going to play his 'Chemical Brothers meets whale sounds' playlist to the entire senior management team. I wonder if Pret is still hiring? I could work my way up to sandwich artisan, live a simple life of honest toil...", "JOHNSON: This is exactly what we need. Raw, disruptive, authentically digital. Charlotte, sign him up for the full rollout."]
    ;
MERGE (e:Event {uuid: 'event-4-3'})
    ON CREATE SET
        e.title = 'Mark\'s Inner Conflict and Resignation',
        e.description = 'Mark reflects internally on Jeremy\'s unexpected corporate success and contemplates his own professional situation, questioning his future within the company.',
        e.sequence = 3,
        e.key_dialogue = ["MARK (V/O): Jeremy's going to get a corporate job before me. I'm going to end up working in his sonic optimization department. Maybe the French Foreign Legion is still recruiting?"]
    ;
MERGE (s:Scene {uuid: 'scene-005'})
    ON CREATE SET
        s.title = 'Corporate Dreams Over Drinks',
        s.description = 'The scene unfolds at The Fox & Goose Pub on Croydon High Street during the evening. Mark Corrigan and Jeremy Usbourne sit together at a corner table. The atmosphere is casual, with Mark quietly nursing a warm white wine while Jeremy energetically engages with Super Hans. In a celebratory mood, Jeremy dreams of global success with his new sonic optimization venture, comparing it to legal drugs for offices, while Super Hans boasts about his own tech venture aspirations. Meanwhile, Mark receives a notification that Steve from accounts has endorsed Jeremy on LinkedIn for \'Digital Transformation\' and \'Change Management,\' leading to his bemusements about Jeremy\'s rising corporate fortunes. The emotional tone is a mix of triumph for Jeremy and disillusionment for Mark, who contemplates the irony of Jeremy\'s misunderstood success.',
        s.scene_number = 5
    WITH s
    MATCH (l:Location {uuid: 'location-the_fox_and_goose_pub'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Mark Broods over Jeremy\'s Success While at The Pub',
        e.description = 'Mark and Jeremy are sitting at a corner table in The Fox & Goose Pub. Mark is drinking warm white wine, observing Jeremy who is celebrating with Super Hans. The scene highlights Mark\'s internal conflict about Jeremy\'s unexpected corporate success. Super Hans, wearing a MetricShift lanyard, discusses the potential of Jeremy\'s sound solutions. Mark, while reflecting internally, receives a LinkedIn notification showing Jeremy\'s recent endorsements.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is gonna be massive, Jez. Could be bigger than my crypto-mindfulness app. Before it got hacked by the Russians.", "JEREMY: I'm thinking global, Hans. Every office in the world, listening to my scientifically optimized sound solutions. It's basically legal drugs.", "MARK (V/O): Jeremy's become everything I ever wanted to be, by completely misunderstanding everything about the corporate world. Maybe that's the secret? Like how a cat can survive a fall from a higher building than a human because it doesn't understand physics."]
    ;
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (o:Organization {uuid: 'MetricShift Digital Solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlotte_walshhenderson'}),
          (o:Organization {uuid: 'MetricShift Digital Solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (o:Organization {uuid: 'Johnson Dynamic Solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-hp_laptop'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-ikea_markus_desk_chair'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-ms_boxers'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-tm_lewin_shirt'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-career_crisis_management_spreadsheet'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-metricshift_employee_of_the_month_certificate'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-dartmouth_business_studies_diploma'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-ms_suit'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-web3_visionary_pin_badge'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-cracked_mirror'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-empty_red_bull_cans'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes_printouts'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-networking_emergency_protocols_index_cards'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-dj_equipment'}),
          (a:Agent {uuid: 'agent-jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-phone'}),
          (a:Agent {uuid: 'agent-mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (o:Organization {uuid: 'org-metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-charlotte_walshhenderson'}),
          (o:Organization {uuid: 'org-metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (o:Organization {uuid: 'org-johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-hp_laptop-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark uses his HP laptop to toggle between LinkedIn and his \'Career Crisis Management\' spreadsheet, reflecting on his precarious career status and the absurdity of certification races in the digital revolution.',
        oi.status_before = 'Functioning laptop on Mark\'s desk, used regularly for work and career management tasks.',
        oi.status_after = 'Remains on Mark\'s desk, still in use as Mark continued his online introspection.'
    WITH oi
    MATCH (o:Object {uuid: 'object-hp_laptop'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-career_crisis_management_spreadsheet-event-1-1'})
    ON CREATE SET
        oi.description = 'This spreadsheet is one of the digital tools Mark frequents during his career contemplation, symbolizing his anxieties and systematic approach to managing his professional life.',
        oi.status_before = 'A carefully managed digital excel file, updated with Mark\'s career progress and projections.',
        oi.status_after = 'Continues to be actively updated and scrutinized by Mark as he works through his career dilemmas.'
    WITH oi
    MATCH (o:Object {uuid: 'object-career_crisis_management_spreadsheet'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-metricshift_employee_of_the_month_certificate-event-1-1'})
    ON CREATE SET
        oi.description = 'The certificate hangs as a reminder of Mark\'s struggles between career milestones and the volatility of his position, adding to his reflections on job security.',
        oi.status_before = 'Displayed on the wall, symbolizing a bench-marker achievement in Mark\'s career.',
        oi.status_after = 'Remains on the wall as Mark continues to ponder his career uncertainties.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_employee_of_the_month_certificate'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dartmouth_business_studies_diploma-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark\'s diploma acts as a backdrop to his considerations, symbolizing his educational qualifications amidst a sea of new digital certifications.',
        oi.status_before = 'Hangs on the wall with an established sense of accomplishment.',
        oi.status_after = 'Remains unchanged, a constant reminder of Mark\'s foundational qualifications versus industry demands for digital savvy.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dartmouth_business_studies_diploma'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ikea_markus_desk_chair-event-1-1'})
    ON CREATE SET
        oi.description = 'The chair supports Mark physically and metaphorically as he navigates his early-morning routine, providing a stable seat during introspective work tasks.',
        oi.status_before = 'Stationed at Mark\'s desk, serving as his primary seating for work from home.',
        oi.status_after = 'Continues to be used by Mark, ensuring his comfort as he meanders through work anxieties.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ikea_markus_desk_chair'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ms_boxers-event-1-1'})
    ON CREATE SET
        oi.description = 'Mark is wearing these boxers as part of his casual home attire while he deals with the early morning work tasks and reflections.',
        oi.status_before = 'Comfortably worn by Mark, part of his informal home attire.',
        oi.status_after = 'Remains intact as part of Mark\'s casual morning wear.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ms_boxers'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tm_lewin_shirt-event-1-1'})
    ON CREATE SET
        oi.description = 'The shirt is part of Mark’s semi-professional home outfit, illustrating the new norm mixing work and home attire.',
        oi.status_before = 'Worn by Mark as part of his home attire deemed suitable for virtual meetings.',
        oi.status_after = 'Continues to be worn by Mark, unaffected by his career contemplations.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tm_lewin_shirt'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ms_suit-event-1-2'})
    ON CREATE SET
        oi.description = 'Jeremy wears Mark\'s interview suit, against Mark\'s specific instructions, in an effort to appear professional for the networking event and support his sudden ambition towards joining the corporate world.',
        oi.status_before = 'Stored in Mark\'s \'Career Emergency Kit\' box, meant for significant career events.',
        oi.status_after = 'Now worn by Jeremy, altered to fit his need for a professional appearance at the MetricShift event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ms_suit'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-web3_visionary_pin_badge-event-1-2'})
    ON CREATE SET
        oi.description = 'The pin badge is used by Jeremy as an unconventional accessory, adding a quirky element to the suit as he prepares to make his corporate pitch.',
        oi.status_before = 'An accessory item owned by Jeremy, likely acquired during one of his phases of eccentric style pursuits.',
        oi.status_after = 'Used by Jeremy to accessorize Mark\'s suit, adding an ironic sense of self-styled visionary flair.'
    WITH oi
    MATCH (o:Object {uuid: 'object-web3_visionary_pin_badge'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Reflecting on career prospects at his desk in his bedroom',
        ap.emotional_state = 'Anxious and frustrated about career stagnation',
        ap.emotional_tags = ["Anxious", "frustrated about career stagnation"],
        ap.active_plans = ["Evaluate career progression strategies", "Consider obtaining new certifications"],
        ap.beliefs = ["The digital revolution requires constant upskilling", "Job titles and certifications have become superficial markers of value"],
        ap.goals = ["Secure professional stability", "Ensure relevance in the rapidly evolving business landscape"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Surprised by Jeremy\'s sudden entrance and announcement',
        ap.emotional_state = 'Annoyed and incredulous at Jeremy\'s boldness',
        ap.emotional_tags = ["Annoyed", "incredulous at Jeremy's boldness"],
        ap.active_plans = ["Try to manage Jeremy's impulsive actions", "Prevent misuse of personal belongings"],
        ap.beliefs = ["Jeremy's approach to professionalism is absurd", "Taking one's career seriously is crucial for success"],
        ap.goals = ["Avoid personal embarrassment at public events", "Maintain some semblance of control over household dynamics"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Announcing his perceived mastery of LinkedIn while wearing Mark\'s suit',
        ap.emotional_state = 'Confident and enthusiastic about his unconventional initiatives',
        ap.emotional_tags = ["Confident", "enthusiastic about his unconventional initiatives"],
        ap.active_plans = ["Pitch 'sonic optimization' at the MetricShift event", "Utilize corporate jargon to impress"],
        ap.beliefs = ["Mastering the LinkedIn algorithm is key to corporate success", "Creative reinterpretations of business concepts can lead to unexpected success"],
        ap.goals = ["Create a niche for himself within the corporate sphere", "Gain business opportunities through innovative pitches"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-cracked_mirror-event-2-1'})
    ON CREATE SET
        oi.description = 'Jeremy practices his pitch while facing the cracked mirror, which serves as a symbol of his fractured self-image and the chaotic nature of his rehearsed \'disruptor in the sonic arts space\' persona.',
        oi.status_before = 'The mirror is presumably cracked and being used by Jeremy to view himself.',
        oi.status_after = 'The mirror remains cracked and continues to reflect Jeremy\'s practiced expressions and demeanor.'
    WITH oi
    MATCH (o:Object {uuid: 'object-cracked_mirror'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-empty_red_bull_cans-event-2-1'})
    ON CREATE SET
        oi.description = 'The empty Red Bull cans indicate the chaotic and caffeine-fueled environment in which Jeremy practices, hinting at his frenetic preparation style and need for energy boosts.',
        oi.status_before = 'Empty and scattered around, having been consumed previously.',
        oi.status_after = 'Still empty and present, contributing to the cluttered ambience of Jeremy\'s practice space.'
    WITH oi
    MATCH (o:Object {uuid: 'object-empty_red_bull_cans'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gary_vaynerchuk_quotes_printouts-event-2-1'})
    ON CREATE SET
        oi.description = 'Jeremy surrounds himself with printouts of quotes by Gary Vaynerchuk, reflecting his attempt to mimic successful business influencers as part of his pitch preparation.',
        oi.status_before = 'Available as motivational material, encouraging Jeremy\'s confidence in his pitch.',
        oi.status_after = 'Remain untouched but integral as inspirational content in Jeremy\'s workspace.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes_printouts'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-networking_emergency_protocols_index_cards-event-2-2'})
    ON CREATE SET
        oi.description = 'Mark reorganizes his \'Networking Emergency Protocols\' index cards anxiously, highlighting his methodical and cautious approach compared to Jeremy\'s chaotic style.',
        oi.status_before = 'Organized in a specific order to prepare for networking scenarios.',
        oi.status_after = 'Reorganized, potentially reflecting Mark\'s mounting anxiety and preparation concerns.'
    WITH oi
    MATCH (o:Object {uuid: 'object-networking_emergency_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-cracked_mirror-event-2-3'})
    ON CREATE SET
        oi.description = 'The cracked mirror remains as Jeremy confidently retorts to Mark\'s skepticism, emphasizing the contrast between Jeremy\'s self-assured facade and the flawed reality it reflects.',
        oi.status_before = 'Used by Jeremy earlier for practice.',
        oi.status_after = 'Still present, symbolizing the cracked self-image he continues to project.'
    WITH oi
    MATCH (o:Object {uuid: 'object-cracked_mirror'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gary_vaynerchuk_quotes_printouts-event-2-3'})
    ON CREATE SET
        oi.description = 'The printouts of Gary Vaynerchuk quotes are again referenced as Jeremy asserts his \'research\' credibility, underscoring his reliance on trendy business mantras.',
        oi.status_before = 'Referenced by Jeremy as part of his self-claimed qualifications.',
        oi.status_after = 'Untouched but continue to serve as a source of confidence for Jeremy in his claims.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gary_vaynerchuk_quotes_printouts'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Practicing his pitch in the living room',
        ap.emotional_state = 'Confident and optimistic',
        ap.emotional_tags = ["Confident", "optimistic"],
        ap.active_plans = ["Prepare an impressive pitch for the networking event"],
        ap.beliefs = ["Believes in his ability to disrupt the 'sonic arts' industry", "Convinced that his self-researched qualifications are sufficient"],
        ap.goals = ["To successfully pitch his ideas at the networking event", "To gain recognition as a 'disruptor' in the sonic arts space"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Observing Jeremy\'s practice and commenting internally',
        ap.emotional_state = 'Skeptical and anxious',
        ap.emotional_tags = ["Skeptical", "anxious"],
        ap.active_plans = ["Try to prevent Jeremy from embarrassing himself with outdated references"],
        ap.beliefs = ["Doubtful of Jeremy's ability to succeed", "Believes that Jeremy's pitch is absurdly ambitious"],
        ap.goals = ["To stop Jeremy from using outdated buzzwords", "To reduce his own anxiety about the potential fallout from Jeremy's actions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Interacting with Mark, defending his pitch approach',
        ap.emotional_state = 'Dismissive of Mark\'s concerns',
        ap.emotional_tags = ["Dismissive of Mark's concerns"],
        ap.active_plans = ["Convince Mark that his buzzword-driven approach is valid"],
        ap.beliefs = ["Believes that modern buzzwords can bolster the impact of his pitch"],
        ap.goals = ["To reinforce his confidence in his pitch strategy", "To maintain his enthusiasm for the upcoming event"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Justifying his confidence to Mark',
        ap.emotional_state = 'Self-assured and determined',
        ap.emotional_tags = ["Self-assured", "determined"],
        ap.active_plans = ["Use his limited knowledge from TED talks and social media to bolster his credibility"],
        ap.beliefs = ["Considers following Gary Vaynerchuk and watching TED talks as sufficient preparation"],
        ap.goals = ["To convince Mark of the seriousness of his intentions", "To internalize a CEO-like mindset"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Listening to Jeremy justify his approach',
        ap.emotional_state = 'Frustrated and doubtful',
        ap.emotional_tags = ["Frustrated", "doubtful"],
        ap.active_plans = ["Evaluate the potential impact of Jeremy's actions"],
        ap.beliefs = ["Believes Jeremy's approach is illogical", "Considers Jeremy's confidence as overestimated"],
        ap.goals = ["To protect his career from Jeremy's potentially embarrassing actions", "To maintain an objective understanding of the situation"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-kombucha_stations-event-3-1'})
    ON CREATE SET
        oi.description = 'The kombucha stations are set up as part of the transformed space in the \'Ideation Zone\' for the monthly Innovation Sundowner, symbolizing the modern corporate culture\'s embrace of wellness-oriented trends.',
        oi.status_before = 'Kombucha stations prepared for showcasing at the event.',
        oi.status_after = 'Kombucha stations present during Jeremy\'s interaction with Charlotte, reinforcing the event\'s thematic setup.'
    WITH oi
    MATCH (o:Object {uuid: 'object-kombucha_stations'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-fruit-infused_water_station-event-3-1'})
    ON CREATE SET
        oi.description = 'The fruit-infused water station represents the wellness initiatives at MetricShift, illustrating the company\'s attempt to maintain a healthy work environment. Mark positions himself near this station, a space where he blends into the corporate wellness efforts.',
        oi.status_before = 'Fruit-infused water station part of the corporate wellness decor.',
        oi.status_after = 'Vertical fixture in the Ideation Zone as Mark lingers nearby during Jeremy\'s pitch.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fruit-infused_water_station'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-fairy_lights-event-3-1'})
    ON CREATE SET
        oi.description = 'Fairy lights are used to decorate the Ideation Zone, creating an ambient atmosphere suited for the Innovation Sundowner. Their presence adds to the trendy, relaxed environment as Jeremy pitches his sonic optimization idea.',
        oi.status_before = 'Arranged as part of the event\'s ambient decoration.',
        oi.status_after = 'Functioning as decorative lighting to enhance the setting of the networking event.'
    WITH oi
    MATCH (o:Object {uuid: 'object-fairy_lights'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-whiteboards-event-3-1'})
    ON CREATE SET
        oi.description = 'Whiteboards serve as surfaces displaying corporate buzzwords, which symbolize innovative thinking and brainstorming within MetricShift. They parallel Jeremy\'s attempt to engage Charlotte with industry-relevant jargon during his presentation.',
        oi.status_before = 'Whiteboards set up with buzzword-inspired content.',
        oi.status_after = 'Act as a backdrop that reflects the thematic ideas being discussed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-whiteboards'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-linkedin_premium_name_badge-event-3-1'})
    ON CREATE SET
        oi.description = 'Mark\'s LinkedIn Premium name badge signifies his attempt to assert a professional identity at the Innovation Sundowner. While Mark considers its meaning, Jeremy engages in a pitch highlighting the disruptive themes the event represents.',
        oi.status_before = 'Name badge worn by Mark for professional credibility.',
        oi.status_after = 'Continues to serve as Mark\'s professional identifier during and after Jeremy\'s engagement with Charlotte.'
    WITH oi
    MATCH (o:Object {uuid: 'object-linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Mark is observing the interaction between Jeremy and Charlotte from a distance, positioned by the fruit-infused water station.',
        ap.emotional_state = 'Mark is anxious and apprehensive as he watches Jeremy engage with Charlotte.',
        ap.emotional_tags = ["Mark is anxious", "apprehensive as he watches Jeremy engage with Charlotte."],
        ap.active_plans = ["Remain in the background to witness Jeremy's approach.", "Refrain from interrupting the conversation despite his reservations."],
        ap.beliefs = ["He believes Jeremy's pitch is nonsensical and lacks substance.", "Mark holds the conviction that Jeremy should not gain serious professional responsibilities."],
        ap.goals = ["Short-term: Ensure Jeremy doesn't embarrass himself or Mark by association.", "Long-term: Maintain his own professional standing and avoid being overshadowed by Jeremy's antics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Jeremy is actively engaging with Charlotte, pitching his concept of \'sonic optimization\' for workplace productivity.',
        ap.emotional_state = 'Jeremy is confident and enthusiastic, exhibiting self-assuredness in his pitch.',
        ap.emotional_tags = ["Jeremy is confident", "enthusiastic, exhibiting self-assuredness in his pitch."],
        ap.active_plans = ["Convince Charlotte of the potential impact of his 'sonic optimization' concept.", "Present himself as a credible innovator in the field of workplace productivity."],
        ap.beliefs = ["He believes his charisma and ability to capture attention are key to making an impression.", "Jeremy assumes that sounding innovative and using buzzwords will likely land him opportunities."],
        ap.goals = ["Short-term: Secure interest from Charlotte and potentially other key figures in the company.", "Long-term: Leverage this interest to gain further opportunities and potentially establish his own consultancy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Charlotte is listening intently to Jeremy, showing interest in his pitch about utilizing sound frequencies to optimize productivity.',
        ap.emotional_state = 'Charlotte is intrigued and somewhat curious about the innovative approach Jeremy presents.',
        ap.emotional_tags = ["Charlotte is intrigued", "somewhat curious about the innovative approach Jeremy presents."],
        ap.active_plans = ["Explore potential innovative solutions to incorporate into the company's strategy.", "Engage with attendees to find possible innovative applications in workplace productivity."],
        ap.beliefs = ["She believes in fostering a culture of innovation and creative solutions post-Great Algorithm Crisis of '23.", "Charlotte assumes that fresh, unconventional ideas can drive meaningful change and progress."],
        ap.goals = ["Short-term: Assess the feasibility and potential impact of Jeremy's ideas for future company projects.", "Long-term: Implement innovative strategies that enhance the company's competitive edge and productivity outputs."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dj_equipment-event-4-1'})
    ON CREATE SET
        oi.description = 'Jeremy sets up the DJ equipment in the executive boardroom to prepare for a presentation to the senior management team. The equipment is central to his pitch and presentation of a \'productivity soundscape\'.',
        oi.status_before = 'Borrowed from Super Hans\' failed silent disco venture.',
        oi.status_after = 'Set up in MetricShift\'s executive boardroom and used for the duration of the presentation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dj_equipment'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-herman_miller_wallpaper-event-4-1'})
    ON CREATE SET
        oi.description = 'During Jeremy\'s presentation setup, Mark uses the Herman Miller wallpaper as a backdrop to blend into, trying to remain unobtrusive and unnoticed by the management.',
        oi.status_before = 'Installed as part of MetricShift\'s design for the executive boardroom.',
        oi.status_after = 'Continues to be a part of the boardroom\'s design while serving as a psychological refuge for Mark.'
    WITH oi
    MATCH (o:Object {uuid: 'object-herman_miller_wallpaper'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dj_equipment-event-4-2'})
    ON CREATE SET
        oi.description = 'Jeremy uses the DJ equipment to deliver his sonic presentation, which impresses Alan Johnson. The equipment plays a chaotic mix designed to appear as a \'productivity soundscape\'.',
        oi.status_before = 'Set up and ready in the executive boardroom.',
        oi.status_after = 'Used actively during the presentation, gaining attention and approval from Alan Johnson.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dj_equipment'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-herman_miller_wallpaper-event-4-3'})
    ON CREATE SET
        oi.description = 'Mark continues his inner conflict and resigns himself to blending into the Herman Miller wallpaper, symbolizing his desire to remain unnoticed as he grapples with the idea of Jeremy\'s unexpected corporate success.',
        oi.status_before = 'Part of the boardroom decor, offering Mark a place to mentally retreat.',
        oi.status_after = 'Remains unchanged as a psychological escape for Mark amid unfolding professional challenges.'
    WITH oi
    MATCH (o:Object {uuid: 'object-herman_miller_wallpaper'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Setting up DJ equipment for a presentation',
        ap.emotional_state = 'Confident and enthusiastic',
        ap.emotional_tags = ["Confident", "enthusiastic"],
        ap.active_plans = ["Create an intriguing soundscape for senior management", "Impress influential figures with improvised ideas"],
        ap.beliefs = ["Confidence and showmanship can open corporate opportunities"],
        ap.goals = ["Secure interest from executive management", "Gain a contract or recognition for his soundscapes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Observing from the sidelines, blending into the background',
        ap.emotional_state = 'Anxious and resigned',
        ap.emotional_tags = ["Anxious", "resigned"],
        ap.active_plans = ["Blend into the surroundings to avoid notice"],
        ap.beliefs = ["Corporate success is precarious and baffling (e.g., Jeremy's moment)"],
        ap.goals = ["Avoid drawing attention during the event", "Consider alternative career paths if needed"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Observing Jeremy\'s setup with interest',
        ap.emotional_state = 'Curious and intrigued',
        ap.emotional_tags = ["Curious", "intrigued"],
        ap.active_plans = ["Evaluate potential innovative solutions", "Explore collaboration with Jeremy"],
        ap.beliefs = ["Disruptive thinking can prove valuable in business"],
        ap.goals = ["Identify potential value in Jeremy's soundscape concept", "Facilitate impactful business partnerships and mergers"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Presenting his soundscape to the senior management team',
        ap.emotional_state = 'Confident and improvisational',
        ap.emotional_tags = ["Confident", "improvisational"],
        ap.active_plans = ["Portray soundscape concept as a groundbreaking corporate solution", "Secure a formal agreement to expand his sonic project"],
        ap.beliefs = ["His creative ideas can be transformed into profitable ventures"],
        ap.goals = ["Convince senior management of his concept's value", "Expand into corporate sectors with his soundscapes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Listening to Jeremy\'s presentation and responding',
        ap.emotional_state = 'Excited and approving',
        ap.emotional_tags = ["Excited", "approving"],
        ap.active_plans = ["Endorse Jeremy's concept for further development"],
        ap.beliefs = ["Jeremy's soundscape aligns with disruptive innovation needs"],
        ap.goals = ["Leverage Jeremy's work for corporate advancement", "Implement soundscapes across organizational platforms"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Engaged with and supportive of Jeremy\'s presentation',
        ap.emotional_state = 'Enthusiastic and supportive',
        ap.emotional_tags = ["Enthusiastic", "supportive"],
        ap.active_plans = ["Facilitate the integration of Jeremy's soundscape in the company"],
        ap.beliefs = ["Innovative approaches are crucial for organizational growth"],
        ap.goals = ["Support Jeremy's initiative within the company's strategy", "Achieve successful rollout of new ideas"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Reflecting upon Jeremy\'s presentation',
        ap.emotional_state = 'Despondent and self-reflective',
        ap.emotional_tags = ["Despondent", "self-reflective"],
        ap.active_plans = ["Consider personal career alternatives"],
        ap.beliefs = ["Others' success does not guarantee personal progression"],
        ap.goals = ["Evaluate personal status within the corporate structure", "Seek alternative career paths if corporate innovation outpaces him"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Contemplating career and future prospects',
        ap.emotional_state = 'Resigned and pondering',
        ap.emotional_tags = ["Resigned", "pondering"],
        ap.active_plans = ["Reassess his career trajectory and consider alternatives"],
        ap.beliefs = ["Corporate life often defies personal expectations of merit"],
        ap.goals = ["Seek job security in uncertain environments", "Build a future that aligns with his capabilities"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-metricshift_lanyard-event-5-1'})
    ON CREATE SET
        oi.description = 'The MetricShift lanyard is worn by Super Hans, symbolizing his involvement or connection with MetricShift, possibly through Jeremy\'s venture. It visually represents this unlikely intersection of Jeremy\'s unconventional approaches with established corporate world entities.',
        oi.status_before = 'A typical corporate lanyard inscribed with MetricShift branding.',
        oi.status_after = 'Worn on Super Hans, making it incongruously present in a casual pub setting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-phone-event-5-1'})
    ON CREATE SET
        oi.description = 'Mark\'s phone, serving as a conduit for his social anxieties, delivers a LinkedIn notification showing Jeremy\'s increasing corporate validation and success through online endorsements. It plays a role in exacerbating Mark\'s internal conflict and envy.',
        oi.status_before = 'A functional device presumably resting on the table or in Mark\'s pocket.',
        oi.status_after = 'Becomes a source of unpleasant surprise and emotional turmoil for Mark upon receiving the notification.'
    WITH oi
    MATCH (o:Object {uuid: 'object-phone'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Mark is sitting at a corner table in The Fox & Goose Pub, drinking warm white wine.',
        ap.emotional_state = 'Conflicted and contemplative about Jeremy\'s unexpected success.',
        ap.emotional_tags = ["Conflicted", "contemplative about Jeremy's unexpected success."],
        ap.active_plans = ["Mark plans to internally reconcile his feelings about Jeremy's success."],
        ap.beliefs = ["Mark believes Jeremy's success is due to a misunderstanding of corporate norms.", "He feels that the appearance of competence is more valued than actual competence in modern corporate culture."],
        ap.goals = ["Short-term: To cope with his internal conflict and resentment.", "Long-term: To find a path to similar success or redefine what success means to him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Jeremy is celebrating with Super Hans, discussing the global potential of his sound solutions.',
        ap.emotional_state = 'Confident and ambitious about his new venture.',
        ap.emotional_tags = ["Confident", "ambitious about his new venture."],
        ap.active_plans = ["Jeremy plans to expand his sound solutions globally."],
        ap.beliefs = ["Jeremy believes his sound solutions are revolutionary and equates them to 'legal drugs.'"],
        ap.goals = ["Short-term: To gain recognition and momentum for his sound solutions.", "Long-term: To have his solutions adopted in every office worldwide."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-super_hans-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Super Hans is sitting at the table with Jeremy, discussing Jeremy\'s sound solutions.',
        ap.emotional_state = 'Optimistic and supportive of Jeremy\'s business potential.',
        ap.emotional_tags = ["Optimistic", "supportive of Jeremy's business potential."],
        ap.active_plans = ["Super Hans plans to support Jeremy's business venture."],
        ap.beliefs = ["Super Hans believes in the massive potential of unconventional solutions in the market."],
        ap.goals = ["Short-term: To help increase the visibility of Jeremy's ideas.", "Long-term: To capitalize on the success of Jeremy\u2019s innovation."]
    ;
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Location {uuid: 'location-apollo_house'})

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
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Location {uuid: 'location-apollo_house-living_room'})

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
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walshhenderson'}),
          (b:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Location {uuid: 'location-metricshift_executive_boardroom-the_disruption_chamber'})

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
MATCH (a:Event {uuid: 'event-4-3'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (b:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-alan_johnson'}),
          (b:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-alan_johnson-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-charlotte_walshhenderson'}),
          (b:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-charlotte_walshhenderson-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Location {uuid: 'location-the_fox_and_goose_pub'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-mark_corrigan'}),
          (b:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mark_corrigan-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeremy_usbourne-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-super_hans'}),
          (b:AgentParticipation {uuid: 'participation-agent-super_hans-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-super_hans-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
