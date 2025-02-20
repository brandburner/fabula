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
MERGE (a:Agent {uuid: 'agent_mark_corrigan'})
    ON CREATE SET
        a.name = 'Mark Corrigan',
        a.title = 'Regional Digital Transformation Strategy Implementation Manager',
        a.description = 'Mark Corrigan is a beleaguered corporate employee at MetricShift Digital, defined by his pervasive self-doubt and anxiety. He navigates the competitive corporate maze with a mix of sarcasm, meticulous attention to detail, and cynicism. Constantly preoccupied with his career and the fear of being outshone, Mark’s internal monologues reveal a calculated, self-deprecating approach to office politics and modern corporate culture.',
        a.traits = ["Insecure", "Cautious", "Sarcastic", "Anxious", "Detail-oriented", "Self-conscious", "Self-deprecating", "meticulous", "observant", "Career-focused", "cynical", "calculating"],
        a.sphere_of_influence = 'Corporate Culture'
    ;
MERGE (a:Agent {uuid: 'agent_jeremy_usbourne'})
    ON CREATE SET
        a.name = 'Jeremy Usbourne',
        a.title = 'Sonic Visionary',
        a.description = 'Jeremy Usbourne is an eccentric and overenthusiastic disruptor known for his outlandish ideas and experimental approach in both the corporate and sonic arts arenas. Bold and enterprising, he champions unconventional strategies, blending creative innovation with chaotic, unorthodox presentations to redefine professional success.',
        a.traits = ["Ambitious", "Egocentric", "Experimental", "chaotic", "disruptive", "creative", "Overconfident", "Enthusiastic", "innovative", "Enterprising", "Eccentric", "visionary", "charismatic", "Resourceful"],
        a.sphere_of_influence = 'Digital Innovation'
    ;
MERGE (a:Agent {uuid: 'agent_steve_benson'})
    ON CREATE SET
        a.name = 'Steve Benson',
        a.title = 'Digital Transformation Specialist',
        a.description = 'Steve Benson is a low-profile corporate climber at MetricShift Digital who made an unexpected leap from the accounts department to become a digital transformation specialist. Steady, practical, and observant, he has emerged as a minor yet notable influencer within the organization.',
        a.traits = ["Tech-savvy", "Ambitious", "observant", "steady", "Unconventional", "practical", "Opportunistic"],
        a.sphere_of_influence = 'Digital Transformation'
    ;
MERGE (a:Agent {uuid: 'agent_super_hans'})
    ON CREATE SET
        a.name = 'Super Hans',
        a.title = 'Entrepreneur',
        a.description = 'Super Hans is a free-spirited and unpredictable entrepreneur with roots in counterculture. Known for his ventures that blend music, blockchain technology, and unconventional digital innovation, he challenges established norms with a blend of chaotic creativity and rebellious nonconformity.',
        a.traits = ["Innovative", "eccentric", "Impulsive", "nonconformist", "rebellious", "Chaotic", "unpredictable", "reckless", "Unconventional"],
        a.sphere_of_influence = 'Counterculture Entrepreneurship'
    ;
MERGE (a:Agent {uuid: 'agent_charlotte_walsh_henderson'})
    ON CREATE SET
        a.name = 'Charlotte Walsh-Henderson',
        a.title = 'Head of Digital Transformation',
        a.description = 'Charlotte Walsh-Henderson is the Head of Digital Transformation at MetricShift Digital and a veteran of multiple Silicon Valley burnouts. With a keen analytical mind and authoritative presence, she orchestrates innovative and detail-oriented corporate rebranding initiatives, ensuring that even the smallest details reflect cutting-edge digital innovation.',
        a.traits = ["innovative", "analytical", "authoritative", "detail-oriented", "pragmatic", "experienced"],
        a.sphere_of_influence = 'Corporate Digital Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_alan_johnson'})
    ON CREATE SET
        a.name = 'Alan Johnson',
        a.title = 'CEO of Johnson Dynamic Solutions',
        a.description = 'Alan Johnson is the pragmatic and discerning CEO of Johnson Dynamic Solutions. Known for his calm and strategic approach, he evaluates disruptive corporate propositions and seeks opportunities to merge innovative ideas with sound business practices.',
        a.traits = ["observant", "pragmatic", "strategic", "calm"],
        a.sphere_of_influence = 'Corporate Leadership and Merger Strategy'
    ;
MERGE (o:Object {uuid: 'object_ikea_markus_desk_chair'})
    ON CREATE SET
        o.name = 'IKEA Markus Desk Chair',
        o.description = 'A minimalist office chair known for its creaking sound, serving as Mark Corrigan\'s seating in his Apollo House bedroom during early morning work sessions.',
        o.purpose = 'To provide seating support while Mark navigates his digital work tasks and anxious routine.',
        o.significance = 'Symbolizes the pressure of working from home and the underlying corporate anxiety that defines Mark\'s everyday life.'
    ;
MERGE (o:Object {uuid: 'object_hp_laptop'})
    ON CREATE SET
        o.name = 'HP Laptop',
        o.description = 'A functional HP laptop with a glowing screen displaying LinkedIn profiles and Mark\'s \'Career Crisis Management\' spreadsheet.',
        o.purpose = 'To facilitate digital work tasks and access online platforms amidst his professional turmoil.',
        o.significance = 'Embodies the modern digital workplace and the constant pressure of keeping up with corporate metrics.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_employee_certificate'})
    ON CREATE SET
        o.name = 'Employee of the Month Certificate (August 2023)',
        o.description = 'A MetricShift Digital certificate awarded in August 2023 that now hangs askew, gathering dust beside other credentials.',
        o.purpose = 'To commemorate professional achievement within the corporate setting.',
        o.significance = 'Highlights the fleeting nature of corporate accolades and contributes to the thematic portrayal of professional disillusionment.'
    ;
MERGE (o:Object {uuid: 'object_dartmouth_diploma'})
    ON CREATE SET
        o.name = 'Dartmouth Business Studies Diploma',
        o.description = 'A framed diploma from the University of Dartmouth representing Mark Corrigan\'s academic background in business studies.',
        o.purpose = 'To serve as a reminder of his educational achievements and qualifications.',
        o.significance = 'Provides a stark contrast between Mark\'s educational credentials and his current professional frustrations.'
    ;
MERGE (o:Object {uuid: 'object_interview_suit'})
    ON CREATE SET
        o.name = 'Interview Suit',
        o.description = 'A once prized M&S interview suit, originally worn by Mark in high-stakes job interviews and later commandeered by Jeremy.',
        o.purpose = 'To project professionalism and suitability during important career interactions.',
        o.significance = 'Represents the tension between personal identity and the corporate image, and its subsequent misappropriation underscores the chaos of corporate life.'
    ;
MERGE (o:Object {uuid: 'object_career_emergency_kit_box'})
    ON CREATE SET
        o.name = 'Career Emergency Kit Box',
        o.description = 'A storage box marked \'Career Emergency Kit - Do Not Touch Under Any Circumstances\' that housed essential professional accoutrements including the interview suit.',
        o.purpose = 'To securely store crucial job interview materials and act as a contingency in professional crises.',
        o.significance = 'Emphasizes the preparedness and urgency embedded in Mark\'s approach to navigating a treacherous corporate environment.'
    ;
MERGE (o:Object {uuid: 'object_cracked_mirror'})
    ON CREATE SET
        o.name = 'Cracked Mirror',
        o.description = 'A damaged mirror with visible, irregular cracks that reflects Jeremy\'s rehearsed image in the living room.',
        o.purpose = 'Serves as a backdrop for Jeremy\'s pitch practice, highlighting the disordered environment of his creative process.',
        o.significance = 'Symbolizes the fragmented state of both the physical and professional self, reinforcing themes of disillusionment.'
    ;
MERGE (o:Object {uuid: 'object_empty_red_bull_cans'})
    ON CREATE SET
        o.name = 'Empty Red Bull Cans',
        o.description = 'Several discarded Red Bull cans strewn about the room, evidence of consumed energy during a hectic morning.',
        o.purpose = 'Emphasize the frenetic, caffeine-fueled atmosphere that underpins Jeremy\'s unconventional approach to innovation.',
        o.significance = 'Reflects the overstimulated modern work culture and the physical remnants of rushed energy and exhaustion.'
    ;
MERGE (o:Object {uuid: 'object_gary_vaynerchuk_printouts'})
    ON CREATE SET
        o.name = 'Printouts of Gary Vaynerchuk Quotes',
        o.description = 'Sheets of paper containing assorted motivational quotes from entrepreneur Gary Vaynerchuk, some visibly annotated.',
        o.purpose = 'Act as both a source of inspiration and as props that lend credibility to Jeremy\'s self-professed business acumen.',
        o.significance = 'Highlight the pervasive influence of contemporary entrepreneurial rhetoric and the reliance on externally validated success mantras.'
    ;
MERGE (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    ON CREATE SET
        o.name = 'Networking Emergency Protocols Index Cards',
        o.description = 'A collection of color-coded index cards meticulously detailing procedures and strategic responses for high-pressure social encounters.',
        o.purpose = 'Used by Mark to manage his anxieties and plan for any networking disasters in a corporate environment.',
        o.significance = 'Embody Mark\'s deep-seated corporate apprehensions and his constant battle to preserve a professional image amidst chaos.'
    ;
MERGE (o:Object {uuid: 'object_fairy_lights'})
    ON CREATE SET
        o.name = 'Fairy Lights',
        o.description = 'Delicate decorative string lights outlining whiteboards covered in corporate buzzwords, adding a festive ambiance to the Ideation Zone.',
        o.purpose = 'To enhance the innovative and creative atmosphere for the monthly Innovation Sundowner.',
        o.significance = 'Emphasizes the company\'s attempt to blend creative aesthetics with its modern corporate image.'
    ;
MERGE (o:Object {uuid: 'object_whiteboards'})
    ON CREATE SET
        o.name = 'Whiteboards',
        o.description = 'Large whiteboards filled with trendy buzzwords, serving as a dynamic backdrop in the transformed Ideation Zone.',
        o.purpose = 'To facilitate brainstorming and visually represent corporate innovation during the event.',
        o.significance = 'Symbolizes the buzzword-driven culture and the perpetual search for innovation at MetricShift Digital Solutions.'
    ;
MERGE (o:Object {uuid: 'object_kombucha_station'})
    ON CREATE SET
        o.name = 'Kombucha Station',
        o.description = 'A designated refreshment area serving kombucha, neatly arranged as part of the Ideation Zone setup.',
        o.purpose = 'To provide a health-conscious beverage option for event attendees.',
        o.significance = 'Highlights the modern corporate focus on wellness and the trendy aesthetics adopted by the company.'
    ;
MERGE (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    ON CREATE SET
        o.name = 'LinkedIn Premium Name Badge',
        o.description = 'A sleek name badge emblazoned with the LinkedIn Premium logo, which Mark is carefully adjusting.',
        o.purpose = 'To project a professional identity and assert corporate status during the event.',
        o.significance = 'Reflects Mark\'s internal struggle with his professional image and the pressure to succeed in a competitive corporate environment.'
    ;
MERGE (o:Object {uuid: 'object_fruit_infused_water'})
    ON CREATE SET
        o.name = 'Fruit-infused Water',
        o.description = 'A container of water enriched with fresh fruit slices, served as a modern, healthy refreshment at the event.',
        o.purpose = 'To offer an innovative and refreshing beverage option that aligns with the corporate wellness trend.',
        o.significance = 'Underscores the contemporary emphasis on health and well-being within the corporate setting.'
    ;
MERGE (o:Object {uuid: 'object_dj_equipment'})
    ON CREATE SET
        o.name = 'DJ Equipment',
        o.description = 'A portable set of DJ gear including decks, a mixer, and speakers, borrowed from Super Hans\' silent disco business. The equipment shows signs of extensive use, adding to its authentic, experimental vibe.',
        o.purpose = 'To deliver a scientifically-engineered productivity soundscape by playing a chaotic blend of electronic beats, office printer sounds, and ambient elements.',
        o.significance = 'It is central to Jeremy\'s disruptive presentation in the boardroom, symbolizing the merger of counterculture creativity with corporate digital transformation initiatives.'
    ;
MERGE (o:Object {uuid: 'object_hacked_mindcoin_laptop'})
    ON CREATE SET
        o.name = 'Hacked MindCoin Laptop',
        o.description = 'A battered laptop displaying the remnants of Super Hans\'s hacked cryptocurrency project \'MindCoin.\' It shows signs of heavy use and technical compromise.',
        o.purpose = 'To act as the central device for Super Hans\'s experiments merging blockchain technology with mindfulness platforms.',
        o.significance = 'Symbolizes the chaotic intersection of technology and alternative entrepreneurial ventures, highlighting the risks and disorganization behind his crypto-mindfulness app pitch.'
    ;
MERGE (o:Object {uuid: 'object_blockchain_meditation_printouts'})
    ON CREATE SET
        o.name = 'Blockchain and Meditation Printouts',
        o.description = 'A scattered collection of printouts featuring blockchain concepts and meditation app layouts, strewn across the kitchen table.',
        o.purpose = 'To illustrate Super Hans\'s attempt to merge corporate tech with mindfulness, serving as visual aids for his innovative pitch.',
        o.significance = 'They reinforce the theme of disjointed technological innovation and eccentric entrepreneurial dreams in the narrative.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_lanyard'})
    ON CREATE SET
        o.name = 'MetricShift Lanyard',
        o.description = 'A corporate identification lanyard emblazoned with the MetricShift Digital Solutions logo, repurposed and worn incongruously by Super Hans.',
        o.purpose = 'To display corporate affiliation and grant access to restricted company areas.',
        o.significance = 'Symbolizes the pervasive influence of corporate culture and serves as a visual reminder of Mark Corrigan\'s professional identity, now ironically misappropriated.'
    ;
MERGE (o:Object {uuid: 'object_warm_white_wine'})
    ON CREATE SET
        o.name = 'Warm White Wine',
        o.description = 'A glass of white wine that has lost its chilled allure, hinting at neglect and resignation.',
        o.purpose = 'Consumed by Mark to cope with his mounting corporate disillusionment.',
        o.significance = 'Reflects Mark\'s inner turmoil and the decaying state of his professional aspirations.'
    ;
MERGE (l:Location {uuid: 'location_mark_bedroom_apollo_house'})
    ON CREATE SET
        l.name = 'Mark\'s Bedroom, Apollo House, Croydon',
        l.description = 'Mark Corrigan\'s personal bedroom in Apollo House, situated in Croydon. The room is marked by a persistent sense of corporate anxiety, as evidenced by the IKEA Markus desk chair, his \'Employee of the Month\' certificate, and an array of personal items reflecting his inner turmoil over professional setbacks.',
        l.type = 'Bedroom'
    ;
MERGE (l:Location {uuid: 'location_apollo_house_living_room'})
    ON CREATE SET
        l.name = 'Living Room - Apollo House',
        l.description = 'A cluttered living room in Apollo House, marked by a cracked mirror, scattered empty Red Bull cans, and printouts of Gary Vaynerchuk quotes. This space serves as the backdrop for impromptu pitches and corporate maneuvers, capturing a chaotic blend of creativity and professional crisis.',
        l.type = 'Apartment Room'
    ;
MERGE (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf'})
    ON CREATE SET
        l.name = 'MetricShift Digital Solutions HQ - Canary Wharf',
        l.description = 'The corporate headquarters of MetricShift Digital Solutions in Canary Wharf, featuring modern open-plan office spaces and high-tech amenities designed to foster innovation and digital transformation.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_ideation_zone'})
    ON CREATE SET
        l.name = 'Ideation Zone',
        l.description = 'A transformed meeting space on the 14th floor of the Innovation Suite at MetricShift Digital Solutions HQ. Decorated with fairy lights, whiteboards filled with buzzwords, and custom stations offering kombucha and fruit-infused water, it is designed for monthly Innovation Sundowner events.',
        l.type = 'Meeting Room'
    ;
MERGE (l:Location {uuid: 'location_metricshift_executive_boardroom'})
    ON CREATE SET
        l.name = 'MetricShift Executive Boardroom - The Disruption Chamber',
        l.description = 'A rebranded boardroom within MetricShift\'s corporate headquarters, set up for high-stakes presentations and strategic meetings. Known as \'The Disruption Chamber\' after a costly consulting rebrand, it features dynamic events where unconventional ideas are showcased.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_mark_and_jeremys_flat_kitchen'})
    ON CREATE SET
        l.name = 'Mark and Jeremy\'s Flat - Kitchen',
        l.description = 'The kitchen in Mark and Jeremy\'s flat, featuring standard household appliances and a table where Super Hans experiments with his blockchain and cryptocurrency schemes. This space blends everyday domesticity with quirks of avant-garde digital projects.',
        l.type = 'Apartment'
    ;
MERGE (l:Location {uuid: 'location_the_fox_and_goose_pub_croydon_high_street'})
    ON CREATE SET
        l.name = 'The Fox & Goose Pub - Croydon High Street',
        l.description = 'A traditional pub on Croydon High Street that serves as a relaxed social venue. In the scene, it provides a setting where characters discuss corporate dilemmas and celebrate small victories amidst a comforting everyday ambience.',
        l.type = 'Pub'
    ;
MERGE (o:Organization {uuid: 'org_metricshift_digital'})
    ON CREATE SET
        o.name = 'MetricShift Digital',
        o.description = 'A corporate digital solutions firm known for driving innovation and digital transformation. Its brand is evident in its signature lanyards, symbolizing a network of professionals pushing the envelope in productivity and tech-driven work strategies.',
        o.sphere_of_influence = 'Global corporate and digital transformation sectors.'
    ;
MERGE (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    ON CREATE SET
        o.name = 'Johnson Dynamic Solutions',
        o.description = 'A business and technology solutions firm led by CEO Alan Johnson, serving as a potential merger partner to MetricShift Digital.',
        o.sphere_of_influence = 'Corporate technology and strategic business innovation sectors.'
    ;
MERGE (o:Organization {uuid: 'org_croydon_buddhist_centre'})
    ON CREATE SET
        o.name = 'Croydon Buddhist Centre',
        o.description = 'An institution dedicated to Buddhist practices and research, noted for its unconventional contribution to developing innovative productivity soundscapes.',
        o.sphere_of_influence = 'The local Croydon community and associated research networks.'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    ON CREATE SET
        ep.title = 'Episode One - The Networking Event',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Dawn of Corporate Desperation',
        s.description = 'At 6:47 AM in Mark\'s bedroom at Apollo House, Croydon, Mark is visibly stressed as he toggles between LinkedIn and his \'Career Crisis Management\' spreadsheet while lamenting Steve from accounts’ latest achievement. The scene is sharply punctuated by Jeremy’s dramatic entrance—wearing Mark’s cherished interview suit, complete with festival wristbands and a \'Web3 Visionary\' badge—as he excitedly proclaims his newly mastered LinkedIn algorithm and sonic optimization concept. This intimate setting blends personal anxiety with absurd corporate satire, highlighting the clashes between professional insecurity and reckless innovation.',
        s.scene_number = 1
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Mark\'s Morning Anxiety and Corporate Self-Doubt',
        e.description = 'At 6:47 AM in his bedroom, Mark Corrigan sits in his creaking IKEA Markus desk chair dressed in M&S boxers and a TM Lewin shirt. He toggles anxiously between LinkedIn and his \'Career Crisis Management\' spreadsheet on his HP laptop, while his MetricShift Digital \'Employee of the Month (August 2023)\' certificate and Dartmouth Business Studies diploma hang askew in the background. In an internal monologue, Mark laments Steve from accounts’ recent \'humbled to announce\' post and his unexpected success, heightening his personal sense of inadequacy in the digital corporate race.',
        e.sequence = 1,
        e.key_dialogue = ["God, Steve from accounts has done another 'humbled to announce' post. He's got a Microsoft Excel certification. The man who logged into his own LinkedIn through the company Twitter last month is now officially more qualified than me. The digital revolution is eating its children."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Jeremy\'s Entrance and the Interview Suit Controversy',
        e.description = 'Jeremy Usbourne bursts into Mark\'s bedroom, exuberantly proclaiming his mastery of the LinkedIn algorithm. Wearing Mark\'s old interview suit (once used for high-stakes job interviews and a disciplinary hearing), Jeremy seeks validation for his pitch for the MetricShift Innovation Sundowner. Mark, both alarmed and bemused, points out the personal significance of the suit, which was stored in the \'Career Emergency Kit - Do Not Touch Under Any Circumstances\' box, reflecting the clash between Jeremy’s disruptive enthusiasm and Mark’s cautious corporate pride.',
        e.sequence = 2,
        e.key_dialogue = ["Mark! Mark! The corporate world won't know what hit it! I've mastered the LinkedIn algorithm!", "Oh Jesus, he's wearing my interview suit. The suit I wore to three job interviews and one disciplinary hearing. It's like watching a monkey wear the crown jewels.", "How do I look? Professional enough for the MetricShift Innovation Sundowner? I've been practicing my pitch all morning.", "That's my interview suit from the Johnson account pitch. It was in the box marked 'Career Emergency Kit - Do Not Touch Under Any Circumstances.'", "Yeah, well, desperate times, desperate measures. Super Hans says my sonic optimization concept could be the next mindfulness."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Pitch Practice in the Living Room',
        s.description = 'In the cozy yet disheveled living room of Apollo House, Jeremy is in the midst of rehearsing his eccentric pitch, practicing in front of a cracked mirror with empty Red Bull cans and printouts of Gary Vaynerchuk quotes scattered about. Meanwhile, Mark anxiously rearranges his ‘Networking Emergency Protocols’ index cards, his internal monologue revealing both humor and apprehension about Jeremy\'s unorthodox method and his looming presentation to Charlotte Walsh-Henderson.',
        s.scene_number = 2
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Jeremy Practices His Disruptive Pitch',
        e.description = 'In the cluttered living room of Apollo House, Jeremy Usbourne stands before a cracked mirror surrounded by empty Red Bull cans and printouts of Gary Vaynerchuk quotes. He confidently delivers a self-assured pitch about his role as a disruptor in the sonic arts space, highlighting his past project, the \'Sounds of the Serviced Office\' EP, and emphasizing his unique audio paradigms.',
        e.sequence = 1,
        e.key_dialogue = ["I'm a disruptor in the sonic arts space, leveraging unique audio paradigms to create transformative experiences. Former projects include the critically acclaimed 'Sounds of the Serviced Office' EP."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Mark\'s Anxious Rebuttal and Caution',
        e.description = 'While Jeremy’s pitch concludes, Mark Corrigan, busy reorganizing his \'Networking Emergency Protocols\' index cards, internally reflects on Jeremy\'s previous exploits and the absurdity of his claims. His internal commentary exposes his skepticism about the quality of Jeremy\'s work, lamenting that Jeremy\'s past project was merely a printer recording under the influence. Mark then verbally cautions Jeremy against using overdone buzzwords like \'paradigm\', prompting Jeremy to defend his credentials.',
        e.sequence = 2,
        e.key_dialogue = ["He recorded the office printer at his uncle's accounting firm while high on ketamine. And now he's going to present it to Charlotte Walsh-Henderson as a productivity solution. This must be how Brutus felt watching Caesar walk into the Senate.", "Jeremy, please don't say paradigm. Nobody's said paradigm since Northern Rock collapsed.", "Mark, I've done my research. I've watched three TED talks and followed Gary Vee on Instagram. I'm basically a CEO already."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Innovation Sundowner in the Ideation Zone',
        s.description = 'Set on the 14th floor of MetricShift Digital Solutions HQ at Canary Wharf, the transformed Innovation Suite (Ideation Zone) is decked out with fairy lights and whiteboards covered in buzzwords for the monthly Innovation Sundowner. Charlotte Walsh-Henderson, the Head of Digital Transformation, is busy arranging kombucha stations while keeping a close eye on the event setup. Meanwhile, Mark stands by the fruit-infused water station, nervously adjusting his LinkedIn Premium badge and internally fretting about Jeremy\'s conversation with Charlotte. In a conversation full of bravado and absurdity, Charlotte questions Jeremy about his venture into sonic optimization, while Jeremy pitches his idea of merging mindfulness, blockchain, and the perfect coffee charge to enhance workplace productivity. Mark’s internal monologue underscores his anxiety and disbelief at the unfolding corporate dynamics.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Mark\'s Anxious Observation',
        e.description = 'In the transformed Ideation Zone, Mark Corrigan stands by the fruit-infused water, meticulously adjusting his LinkedIn Premium name badge. In a moment of internal panic, he observes Jeremy\'s approach toward Charlotte and reflects on the precarious nature of their interactions, fearful that certain topics—like the band or the ketamine sound installation—might come up.',
        e.sequence = 1,
        e.key_dialogue = ["Oh god, he's approaching Charlotte. Don't mention the band, don't mention the ketamine sound installation at the Croydon Buddhist Centre..."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Charlotte Initiates the Conversation',
        e.description = 'As the vibrant setting of the Ideation Zone buzzes with corporate innovation, Charlotte Walsh-Henderson approaches Jeremy with a professional inquiry. Quoting what she heard from Mark, she asks him about his role in the sonic optimization space, emphasizing the company’s need for innovation in the wake of the Great Algorithm Crisis of \'23.',
        e.sequence = 2,
        e.key_dialogue = ["So, Jeremy, Mark tells me you're in the sonic optimization space? We've been looking for innovative solutions since the Great Algorithm Crisis of '23."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Jeremy\'s Disruptive Pitch and Mark\'s Irony',
        e.description = 'Jeremy Usbourne responds with an overenthusiastic pitch about leveraging alpha and beta frequencies to revolutionize workplace productivity—mixing mindfulness, blockchain, and a touch of absurdity. Almost immediately, Mark’s inner voice offers a sardonic reflection on the sudden shift in responsibility, likening the moment to Caligula appointing his horse as a senator, which underscores his deep-seated anxiety about the evolving corporate dynamics.',
        e.sequence = 3,
        e.key_dialogue = ["Absolutely. We're harnessing alpha waves and beta frequencies to revolutionize workplace productivity. It's like mindfulness meets blockchain meets that feeling when you've just had exactly the right amount of drugs... I mean, coffee.", "The grown-ups are giving Jeremy real responsibilities. This must be what it felt like when Caligula made his horse a senator."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Corporate Disruption in the Disruption Chamber',
        s.description = 'In MetricShift Digital Solutions\' executive boardroom, rebranded as \'The Disruption Chamber\', Jeremy sets up his DJ equipment borrowed from Super Hans\' silent disco business. He announces his plan to deliver a \'scientifically-engineered productivity soundscape\' mixing electronic beats, office printer noises, and ambiguous sounds reminiscent of Buddhist chants or malfunctioning air conditioning. Alan Johnson, CEO of Johnson Dynamic Solutions and a potential merger partner for MetricShift, watches with keen interest and promptly instructs Charlotte to sign Jeremy up for a full rollout. In the background, Mark silently observes, his inner monologue filled with anxiety and resigned humor about his fading prospects in the corporate hierarchy.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_executive_boardroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'DJ Setup, Pitch, and Initial Internal Reaction',
        e.description = 'In MetricShift\'s \'Disruption Chamber\', Jeremy Usbourne begins by setting up his DJ equipment (borrowed from Super Hans\' silent disco business) to prepare for his innovative presentation. As he arranges the gear, he launches into a bold proclamation about his scientifically-engineered productivity soundscape, developed with inspiration from the Croydon Buddhist Centre. Simultaneously, Mark Corrigan internally criticizes the spectacle, imagining the absurdity of the upcoming performance and pondering his own diminishing prospects in the corporate hierarchy, all while Alan Johnson observes the proceedings with quiet interest.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: What you're about to experience is a scientifically-engineered productivity soundscape, developed through extensive research at the Croydon Buddhist Centre.", "MARK (V/O): He's going to play his 'Chemical Brothers meets whale sounds' playlist to the entire senior management team. I wonder if Pret is still hiring? I could work my way up to sandwich artisan, live a simple life of honest toil..."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Chaotic Soundscape Activation',
        e.description = 'Following his impassioned pitch, Jeremy initiates his presentation by starting the music. The room is filled with a chaotic blend of electronic beats interwoven with the unexpected sounds of an office printer, and hints of indistinct ambient chants that could be either Buddhist in origin or the result of a malfunctioning air conditioning unit. The sudden sonic explosion underscores the experimental nature of his \'productivity soundscape\'.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Alan Johnson\'s Endorsement and Final Internal Reflection',
        e.description = 'As the unconventional soundscape fills the boardroom, Alan Johnson exclaims his approval, characterizing the presentation as raw, disruptive, and authentically digital. He wastes no time, instructing Charlotte Walsh-Henderson to sign Jeremy up for a full rollout of his concept. Concurrently, Mark Corrigan internally laments his professional fate, bitterly reflecting that Jeremy is likely to secure a corporate breakthrough while he remains sidelined.',
        e.sequence = 3,
        e.key_dialogue = ["JOHNSON: This is exactly what we need. Raw, disruptive, authentically digital. Charlotte, sign him up for the full rollout.", "MARK (V/O): Jeremy's going to get a corporate job before me. I'm going to end up working in his sonic optimization department. Maybe the French Foreign Legion is still recruiting?"]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'SonicChain Pitch in the Kitchen',
        s.description = 'In the cramped yet animated kitchen of Mark and Jeremy\'s flat, Jeremy is busy making tea while Super Hans, surrounded by printouts of blockchain and meditation apps, works on what’s left of his hacked cryptocurrency project \'MindCoin\'. The conversation buzzes with excitement as Super Hans outlines merging corporate sound therapy with his mindfulness platform into a blockchain-based app called \'SonicChain\', and Jeremy adds the idea of incorporating NFTs. Mark enters the scene, still wearing his MetricShift lanyard, and comments skeptically on the ambitious pitch, remarking that this could lead to unforeseen consequences like a financial crisis.',
        s.scene_number = 5
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Innovative Pitch for SonicChain',
        e.description = 'In the kitchen of Mark and Jeremy\'s flat, Jeremy is busy making tea while Super Hans sits at the table surrounded by blockchain and meditation app printouts, with his hacked MindCoin laptop visible. Super Hans enthusiastically outlines his idea to combine Jeremy\'s corporate sound therapy with his own mindfulness platform into a new venture called \'SonicChain\'. Jeremy quickly chimes in with an idea of integrating NFTs for unique frequency rights, to which Super Hans replies that he’s already been working on it since his ketamine-fueled coding session, dismissing concerns over database theft.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is it, Jez. This is the big one. We combine your corporate sound therapy thing with what's left of my mindfulness platform. Call it 'SonicChain.' The suits'll love it.", "JEREMY: Hans, you're a genius. We could add NFTs somehow. Like, people buy the right to different frequency ranges.", "SUPER HANS: Already on it, my friend. Been coding since Tuesday. Well, since Tuesday's ketamine wore off. The Russians might've nicked my database, but they can't steal the vision."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Mark\'s Entry and Skeptical Observation',
        e.description = 'Mark enters the kitchen, still wearing his MetricShift lanyard, and interjects with a remark about the impending pitch of the crypto-mindfulness app to MetricShift. Super Hans responds with a grander vision, emphasizing the need for blockchain and even proper drugs as essential components. Mark internally reflects, foreseeing that Super Hans might soon find himself on the board of directors, marking the genesis of an impending financial crisis.',
        e.sequence = 2,
        e.key_dialogue = ["MARK: Oh good, Super Hans is here. I suppose you'll be wanting to pitch your crypto-mindfulness app to MetricShift as well?", "SUPER HANS: Mark, Mark, Mark. Think bigger. What's the one thing missing from corporate meditation? Exactly - the blockchain. That, and proper drugs. But we'll sort that out in phase two.", "MARK (V/O): Super Hans is going to end up on the board of directors. This is how the financial crisis started."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Corporate Revelations at The Fox & Goose',
        s.description = 'At The Fox & Goose Pub on Croydon High Street, the scene unfolds at a secluded corner table where Mark nurses a warm white wine in quiet despair, while Jeremy, energized and ambitious, celebrates with Super Hans—who is oddly sporting a MetricShift lanyard. Their lively banter about global corporate transformation and innovative sound solutions is punctuated by Mark’s reflective, self-deprecating internal commentary. The moment is further highlighted by a LinkedIn notification endorsing Jeremy for \'Digital Transformation\' and \'Change Management\', prompting Mark to admit, \'I need another drink.\'',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_the_fox_and_goose_pub_croydon_high_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Corner Table Reunion at the Pub',
        e.description = 'Mark Corrigan, Jeremy Usbourne, and Super Hans gather at a corner table in The Fox & Goose Pub. Mark is seen nursing a glass of warm white wine while Jeremy looks on as Super Hans, wearing a MetricShift Lanyard, exudes a celebratory and ambitious energy.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Super Hans Announces His Big Idea',
        e.description = 'Super Hans breaks the ambient chatter by declaring that his idea might surpass even his previous crypto-mindfulness app – notably, the one that got hacked by the Russians. His confident proclamation sets the tone for the evening\'s high-spirited discussion.',
        e.sequence = 2,
        e.key_dialogue = ["SUPER HANS: This is gonna be massive, Jez. Could be bigger than my crypto-mindfulness app. Before it got hacked by the Russians."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Jeremy Envisions Global Impact',
        e.description = 'In response to Super Hans, Jeremy outlines his bold vision of a world where every office is tuned into his scientifically optimized sound solutions—a concept he wryly compares to the effects of legal drugs, further fueling the night\'s ambitious energy.',
        e.sequence = 3,
        e.key_dialogue = ["JEREMY: I'm thinking global, Hans. Every office in the world, listening to my scientifically optimized sound solutions. It's basically legal drugs."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'Mark\'s Internal Monologue on Corporate Irony',
        e.description = 'Amid the boisterous declarations of innovation, Mark\'s inner voice reflects a poignant irony. He muses that Jeremy has become everything he\'s once aspired to be—by completely missing the point of the corporate world—drawing a humorous parallel to a cat\'s inexplicable ability to survive falls.',
        e.sequence = 4,
        e.key_dialogue = ["MARK (V/O): Jeremy's become everything I ever wanted to be, by completely misunderstanding everything about the corporate world. Maybe that's the secret? Like how a cat can survive a fall from a higher building than a human because it doesn't understand physics."]
    ;
MERGE (e:Event {uuid: 'event_6_5'})
    ON CREATE SET
        e.title = 'LinkedIn Endorsement Sparks Further Dismay',
        e.description = 'The evening takes an unexpected turn when Mark\'s phone buzzes with a LinkedIn notification showing that Steve from accounts has endorsed Jeremy for \'Digital Transformation\' and \'Change Management.\' This digital nod to Jeremy\'s rising credentials only underscores Mark\'s growing dismay, prompting him to declare his need for another drink.',
        e.sequence = 5,
        e.key_dialogue = ["MARK: I need another drink."]
    ;
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_benson'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_ikea_markus_desk_chair'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_hp_laptop'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_metricshift_employee_certificate'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dartmouth_diploma'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_interview_suit'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_career_emergency_kit_box'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dj_equipment'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_hacked_mindcoin_laptop'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_blockchain_meditation_printouts'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_metricshift_lanyard'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_benson'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ikea_markus_desk_chair_event_1_1'})
    ON CREATE SET
        oi.description = 'Mark Corrigan sits in his creaking IKEA Markus desk chair as he anxiously toggles between work applications, its constant creak reinforcing his mounting corporate anxiety.',
        oi.status_before = 'The chair was a regularly used piece of furniture in Mark\'s bedroom, showing signs of wear from daily use.',
        oi.status_after = 'It continues to serve its role, its creak echoing his uneasy state and underscoring the tension of the morning.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ikea_markus_desk_chair'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hp_laptop_event_1_1'})
    ON CREATE SET
        oi.description = 'Mark toggles between LinkedIn and his \'Career Crisis Management\' spreadsheet on his HP laptop, emphasizing his struggle with work-related self-doubt amid digital overload.',
        oi.status_before = 'The HP laptop was functioning normally with its screen glowing and displaying essential work applications.',
        oi.status_after = 'It remains active and central to Mark\'s anxious digital routine, continuing to display his critical corporate data.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hp_laptop'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_employee_certificate_event_1_1'})
    ON CREATE SET
        oi.description = 'The MetricShift Digital \'Employee of the Month (August 2023)\' certificate hangs askew in the background, a visual reminder of corporate accolades that only amplify Mark\'s feelings of inadequacy.',
        oi.status_before = 'The certificate was initially displayed with a sense of pride, symbolizing a notable achievement.',
        oi.status_after = 'It now hangs askew, visually mirroring Mark\'s disheartened and anxious state.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_employee_certificate'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dartmouth_diploma_event_1_1'})
    ON CREATE SET
        oi.description = 'Mark\'s Dartmouth Business Studies diploma is visible in the room, its misaligned state serving as an ironic counterpoint to his current professional struggles despite his academic credentials.',
        oi.status_before = 'The diploma was once a proud testament to Mark\'s academic achievements.',
        oi.status_after = 'It hangs askew, reflecting the disarray and erosion of Mark\'s self-confidence in his corporate role.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dartmouth_diploma'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_interview_suit_event_1_1'})
    ON CREATE SET
        oi.description = 'Jeremy Usbourne bursts in wearing Mark\'s old interview suit—once reserved for high-stakes job interviews and disciplinary hearings—which underscores the subversion of Mark\'s personal professional identity.',
        oi.status_before = 'The suit was neatly kept as part of Mark\'s professional wardrobe, stored for significant career moments.',
        oi.status_after = 'It is now being worn by Jeremy, symbolizing the intrusion into and dilution of Mark\'s professional persona.'
    WITH oi
    MATCH (o:Object {uuid: 'object_interview_suit'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_career_emergency_kit_box_event_1_1'})
    ON CREATE SET
        oi.description = 'Referenced in conversation, the \'Career Emergency Kit\' box—marked \'Do Not Touch Under Any Circumstances\'—holds the interview suit that Jeremy has appropriated, highlighting the loss of Mark\'s personal professional safeguards.',
        oi.status_before = 'The box securely housed essential professional accoutrements, including the interview suit, as a symbol of Mark\'s preparedness for crisis.',
        oi.status_after = 'It remains in place, now missing the key item which underscores Mark\'s compromised professional control.'
    WITH oi
    MATCH (o:Object {uuid: 'object_career_emergency_kit_box'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_interview_suit_event_1_2'})
    ON CREATE SET
        oi.description = 'Jeremy bursts into Mark\'s bedroom wearing Mark\'s old interview suit, an article of clothing that holds considerable personal and professional significance for Mark. The suit, once donned during high-stakes job interviews and a disciplinary hearing, now becomes a symbol of the clash between Jeremy\'s disruptive enthusiasm and Mark\'s cautious corporate pride.',
        oi.status_before = 'The interview suit was safely stored in the \'Career Emergency Kit - Do Not Touch Under Any Circumstances\' box, reserved exclusively for critical professional occasions.',
        oi.status_after = 'The suit has been removed from its secure storage and is being worn by Jeremy, thereby losing its original context and sentimental value for Mark.'
    WITH oi
    MATCH (o:Object {uuid: 'object_interview_suit'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_career_emergency_kit_box_event_1_2'})
    ON CREATE SET
        oi.description = 'Mark references the \'Career Emergency Kit - Do Not Touch Under Any Circumstances\' box as the secure repository from which the interview suit was taken. The box symbolizes Mark\'s guard over his professional assets and the sanctity of his personal memorabilia.',
        oi.status_before = 'The box was intact and untouched, serving as a repository for items of high professional and personal value.',
        oi.status_after = 'The box is left compromised by the removal of the interview suit, reflecting a breach of its intended purpose and furthering Mark\'s sense of loss and disarray.'
    WITH oi
    MATCH (o:Object {uuid: 'object_career_emergency_kit_box'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Sitting in his bedroom at 6:47 AM in his creaking IKEA Markus desk chair, toggling anxiously between LinkedIn and his \'Career Crisis Management\' spreadsheet while observing his askew credentials in the background.',
        ap.emotional_state = 'Anxious, self-doubting, and increasingly frustrated by his perceived professional inadequacies.',
        ap.emotional_tags = ["Anxious, self-doubting,", "increasingly frustrated by his perceived professional inadequacies."],
        ap.active_plans = ["Monitor and compare professional metrics, especially in light of Steve from accounts\u2019 recent achievement.", "Maintain a close watch on corporate trends to recalibrate his career strategy."],
        ap.beliefs = ["Believes that professional worth is determined by external validation and certifications.", "Feels that the digital corporate race is increasingly tilted against him."],
        ap.goals = ["Regain control over his professional image.", "Ensure he remains relevant and valued within MetricShift Digital."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Bursting into Mark\'s bedroom wearing Mark\'s interview suit, loudly proclaiming his mastery of the LinkedIn algorithm and his readiness for the MetricShift Innovation Sundowner.',
        ap.emotional_state = 'Overconfident, exuberant, and determined to showcase his disruptive ideas.',
        ap.emotional_tags = ["Overconfident, exuberant,", "determined to showcase his disruptive ideas."],
        ap.active_plans = ["Demonstrate his prepared pitch for the corporate innovation event.", "Leverage his novel sonic optimization concept to make a noticeable impact."],
        ap.beliefs = ["Believes that unconventional and disruptive approaches can upend traditional corporate structures.", "Is convinced that mastering digital trends and algorithms is the key to success."],
        ap.goals = ["Impress MetricShift colleagues and secure credibility in the innovation space.", "Seize the opportunity to redefine professional success through his innovative ideas."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Sitting at his desk on his creaking IKEA Markus chair, alternating between LinkedIn and his \'Career Crisis Management\' spreadsheet while watching the unfolding disruption.',
        ap.emotional_state = 'Anxious and resentful, with a deep concern for his professional image.',
        ap.emotional_tags = ["Anxious", "resentful, with a deep concern for his professional image."],
        ap.active_plans = ["Protect his personal and professional belongings", "Mitigate the impact of the unexpected disruption on his career narrative"],
        ap.beliefs = ["Professional artifacts, like his interview suit, hold significant personal and career value", "Maintaining corporate decorum is essential to his identity"],
        ap.goals = ["Restore order and preserve his meticulously maintained corporate image", "Ensure that the intrusion doesn't undermine his credibility at MetricShift Digital"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Bursting into Mark\'s bedroom with exuberance, showcasing his enthusiasm for mastering the LinkedIn algorithm while flaunting Mark\'s old interview suit.',
        ap.emotional_state = 'Exuberant, overconfident, and defiant of conventional corporate standards',
        ap.emotional_tags = ["Exuberant, overconfident,", "defiant of conventional corporate st", "ards"],
        ap.active_plans = ["Pitch his disruptive idea for the MetricShift Innovation Sundowner", "Seek validation and recognition for his bold, unconventional approach"],
        ap.beliefs = ["Mastery of digital platforms can revolutionize corporate success", "Disruptive innovation, even if unorthodox, is the key to transforming the corporate world"],
        ap.goals = ["Establish himself as a visionary disruptor within the corporate milieu", "Secure acceptance and further opportunities to promote his sonic optimization concept"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cracked_mirror_event_2_1'})
    ON CREATE SET
        oi.description = 'Jeremy practices his pitch in front of the cracked mirror, which symbolically captures both his confident performance and the underlying fragmentation of his surroundings.',
        oi.status_before = 'The mirror is already damaged, with visible cracks reflecting its long-term wear and tear in the living room.',
        oi.status_after = 'The mirror remains cracked, now bearing witness to Jeremy\'s energetic and self-assured display.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cracked_mirror'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_empty_red_bull_cans_event_2_1'})
    ON CREATE SET
        oi.description = 'The empty Red Bull cans scattered around provide a visual cue to the high-energy, caffeine-fueled atmosphere that underscores the chaos and intensity of the pitch session.',
        oi.status_before = 'The cans were previously discarded around the living room as remnants of earlier energy boosts.',
        oi.status_after = 'They remain strewn about, underscoring the ongoing frenetic, slightly disorganized ambiance of the room.'
    WITH oi
    MATCH (o:Object {uuid: 'object_empty_red_bull_cans'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gary_vaynerchuk_printouts_event_2_1'})
    ON CREATE SET
        oi.description = 'Printouts of Gary Vaynerchuk quotes serve as a backdrop, reinforcing the modern entrepreneurial ethos that Jeremy references in his disruptive pitch.',
        oi.status_before = 'The printouts were already present among other clutter in the living room, visibly annotated as motivational material.',
        oi.status_after = 'They remain in place, continuing to symbolize contemporary corporate inspiration amidst the unfolding drama.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gary_vaynerchuk_printouts'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_networking_emergency_protocols_index_cards_event_2_1'})
    ON CREATE SET
        oi.description = 'Mark is seen anxiously reorganizing his \'Networking Emergency Protocols\' index cards, reflecting his meticulous and stressed approach to managing his professional interactions.',
        oi.status_before = 'The index cards were in a state of disarray, mirroring Mark\'s underlying anxiety about impending social encounters.',
        oi.status_after = 'They appear tidied up to some degree, though still indicative of Mark\'s frantic attempts to prepare for the networking challenges ahead.'
    WITH oi
    MATCH (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cracked_mirror_event_2_2'})
    ON CREATE SET
        oi.description = 'Jeremy practices his pitch in front of the cracked mirror, which not only reflects his image but subtly echoes the fragmented nature of his grandiose claims.',
        oi.status_before = 'The cracked mirror was already damaged and hung on the wall of the living room.',
        oi.status_after = 'The mirror remains cracked and in the same state, symbolically mirroring the disarray of the moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cracked_mirror'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_empty_red_bull_cans_event_2_2'})
    ON CREATE SET
        oi.description = 'Empty Red Bull cans are scattered around, setting a tone of restless energy and hinting at the caffeine-fueled chaos that has preceded the pitch.',
        oi.status_before = 'The cans were already strewn about the living room from earlier consumption.',
        oi.status_after = 'They remain scattered, reinforcing the scene’s atmosphere of hectic disorganization.'
    WITH oi
    MATCH (o:Object {uuid: 'object_empty_red_bull_cans'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gary_vaynerchuk_printouts_event_2_2'})
    ON CREATE SET
        oi.description = 'Printouts of Gary Vaynerchuk quotes are present on the surfaces, emphasizing the pervasive influence of corporate buzzwords and motivational clichés in the characters\' lives.',
        oi.status_before = 'They were already printed and displayed as part of the room’s decor.',
        oi.status_after = 'They remain untouched, silently commenting on the superficial corporate hype around the pitch.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gary_vaynerchuk_printouts'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_networking_emergency_protocols_index_cards_event_2_2'})
    ON CREATE SET
        oi.description = 'Mark methodically reorganizes his \'Networking Emergency Protocols\' index cards, an act that underscores his anxiety and desire to maintain order amidst the unfolding absurdity.',
        oi.status_before = 'The index cards were in a state of disarray, reflecting Mark\'s internal tension.',
        oi.status_after = 'They are reassembled and organized, though they still carry the weight of his anxiety about impending corporate crises.'
    WITH oi
    MATCH (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Standing confidently before the cracked mirror, delivering a disruptive pitch on his sonic arts innovations.',
        ap.emotional_state = 'Confident, self-assured, and slightly over-enthusiastic.',
        ap.emotional_tags = ["Confident, self-assured,", "slightly over-enthusiastic."],
        ap.active_plans = ["Establish himself as a transformative leader in the sonic arts and corporate innovation.", "Convince influential stakeholders of the value of his unique audio paradigms."],
        ap.beliefs = ["His unconventional ideas are revolutionary and will redefine corporate productivity.", "Personal research and a mix of modern media endorsements validate his CEO persona."],
        ap.goals = ["Secure buy-in from key figures like Charlotte Walsh-Henderson for his innovative projects.", "Enhance his reputation as a disruptor in the corporate world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Anxiously reorganizing his \'Networking Emergency Protocols\' index cards while observing Jeremy\'s pitch.',
        ap.emotional_state = 'Nervous, cynical, and apprehensive about the unfolding events.',
        ap.emotional_tags = ["Nervous, cynical,", "apprehensive about the unfolding events."],
        ap.active_plans = ["Mitigate the impact of Jeremy's disruptive ideas on his own professional standing.", "Maintain his meticulous approach to traditional corporate protocols."],
        ap.beliefs = ["Unconventional innovation may undermine established professional norms.", "Jeremy\u2019s bold claims and modern jargon are a threat to the stability of the corporate environment."],
        ap.goals = ["Protect his career and reputation amid corporate upheaval.", "Ensure that the traditional corporate values remain respected and unchallenged."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Reorganizing his \'Networking Emergency Protocols\' index cards and internally critiquing Jeremy\'s past exploits during the pitch.',
        ap.emotional_state = 'Skeptical, anxious, and dismissive regarding the quality of Jeremy\'s ideas.',
        ap.emotional_tags = ["Skeptical, anxious,", "dismissive regarding the quality of Jeremy's ideas."],
        ap.active_plans = ["Maintain professional composure", "Mitigate the risk of embracing flawed innovation", "Preserve his own credibility in a turbulent corporate environment"],
        ap.beliefs = ["Jeremy's previous project was a mere gimmick, not a substantive innovation", "Overused buzzwords like 'paradigm' undermine real expertise"],
        ap.goals = ["Avoid being overshadowed by Jeremy's flamboyant approach", "Ensure that corporate discussions remain grounded and credible"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Practicing his pitch in front of a cracked mirror with empty Red Bull cans and motivational printouts around him.',
        ap.emotional_state = 'Overenthusiastic, defiant, and self-assured in his disruptive approach.',
        ap.emotional_tags = ["Overenthusiastic, defiant,", "self-assured in his disruptive approach."],
        ap.active_plans = ["Deliver an innovative and transformative pitch", "Leverage unconventional research to assert his future as a CEO"],
        ap.beliefs = ["His mix of research and disruptive ideas sets him apart as a visionary", "Embracing buzzwords signals a modern approach to corporate innovation"],
        ap.goals = ["Convince peers like Charlotte Walsh-Henderson of his innovative potential", "Establish himself as a leading disruptor in the sonic arts space"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_premium_name_badge_event_3_1'})
    ON CREATE SET
        oi.description = 'Mark Corrigan meticulously adjusts his LinkedIn Premium name badge while standing in the Ideation Zone. This action underscores his desperate need to project professionalism amid his internal anxiety and the unfolding interactions with Jeremy and Charlotte.',
        oi.status_before = 'The badge was being worn in its standard presentation, symbolizing Mark\'s corporate identity.',
        oi.status_after = 'After his adjustment, the badge appears slightly reoriented, mirroring Mark\'s attempt to regain control of his deteriorating professional image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fruit_infused_water_event_3_1'})
    ON CREATE SET
        oi.description = 'The fruit-infused water serves as a static but significant prop in the Ideation Zone, around which Mark Corrigan positions himself. It accentuates the modern, health-conscious setting of the corporate event.',
        oi.status_before = 'The water was already prepared and prominently placed as part of the refreshment setup in the transformed Ideation Zone.',
        oi.status_after = 'It remains in place, undisturbed, continuing to contribute to the scene\'s backdrop while highlighting Mark\'s isolation and internal tension.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fruit_infused_water'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fairy_lights_event_3_2'})
    ON CREATE SET
        oi.description = 'The fairy lights frame the transformed Ideation Zone by outlining the whiteboards covered in buzzwords, setting a vibrant and innovative ambiance for the monthly Innovation Sundowner.',
        oi.status_before = 'The fairy lights were already installed as decorative elements meant to add warmth and a festive look to the space.',
        oi.status_after = 'The fairy lights continue to glow, emphasizing the creative atmosphere of the event and reinforcing the futuristic and playful décor.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fairy_lights'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_whiteboards_event_3_2'})
    ON CREATE SET
        oi.description = 'The whiteboards, filled with trendy corporate buzzwords, serve as a dynamic backdrop in the Ideation Zone, complementing the laid-out fairy lights and reinforcing the theme of innovation.',
        oi.status_before = 'The whiteboards were set up with an array of buzzwords and ideas, awaiting further inspiration.',
        oi.status_after = 'The whiteboards remain as a focal point of creativity, inviting further contributions and discussions on disruptive ideas throughout the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object_whiteboards'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_kombucha_station_event_3_2'})
    ON CREATE SET
        oi.description = 'Charlotte Walsh-Henderson is seen arranging the kombucha station, ensuring that refreshment elements align with the innovative aesthetic of the Ideation Zone.',
        oi.status_before = 'The kombucha station was pre-arranged as a designated refreshment area within the transformed meeting space.',
        oi.status_after = 'After Charlotte\'s adjustment, the kombucha station is perfectly aligned with the event\'s themes, ready to serve kombucha to the attendees.'
    WITH oi
    MATCH (o:Object {uuid: 'object_kombucha_station'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fruit_infused_water_event_3_2'})
    ON CREATE SET
        oi.description = 'The fruit-infused water, positioned in the Ideation Zone, catches Mark Corrigan\'s attention as he watches the proceedings, symbolizing his lingering presence and internal anxieties amid the innovation.',
        oi.status_before = 'The container of fruit-infused water was set up as part of the event\'s modern refreshment offerings.',
        oi.status_after = 'The fruit-infused water remains in place, subtly underlining the mix of corporate wellness with a hint of ironic detachment from Mark\'s perspective.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fruit_infused_water'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_premium_name_badge_event_3_2'})
    ON CREATE SET
        oi.description = 'Mark Corrigan is visibly preoccupied with his professional image as he straightens his LinkedIn Premium name badge, highlighting his inner turmoil and self-doubt in the face of escalating corporate dynamics.',
        oi.status_before = 'The LinkedIn Premium name badge was initially worn as part of Mark\'s corporate attire, symbolizing his attempts to project professionalism.',
        oi.status_after = 'After being adjusted by Mark during the event, the badge appears even more prominently, serving as a constant reminder of his striving for acceptance in a rapidly evolving professional landscape.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fairy_lights_event_3_3'})
    ON CREATE SET
        oi.description = 'The fairy lights outline the whiteboards and imbue the Ideation Zone with a festive yet innovative ambiance, enhancing the visual backdrop for the Innovation Sundowner.',
        oi.status_before = 'The fairy lights were already installed as part of the room\'s decorative setup.',
        oi.status_after = 'They continue to glow throughout the event, reinforcing the energetic and creative atmosphere.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fairy_lights'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_whiteboards_event_3_3'})
    ON CREATE SET
        oi.description = 'The whiteboards, covered with trendy corporate buzzwords, serve as a dynamic visual element that underscores the firm\'s commitment to innovation.',
        oi.status_before = 'The whiteboards were pre-filled with an array of buzzwords and ideas as part of the event\'s setup.',
        oi.status_after = 'They remain a central, unaltered feature in the background as discussions and innovative pitches unfold.'
    WITH oi
    MATCH (o:Object {uuid: 'object_whiteboards'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_kombucha_station_event_3_3'})
    ON CREATE SET
        oi.description = 'Charlotte arranges the kombucha station, which acts as a focal refreshment area, emphasizing the event’s blend of wellness and corporate innovation.',
        oi.status_before = 'The kombucha station was already set up as part of the Ideation Zone\'s refreshment amenities.',
        oi.status_after = 'It remains fully operational, serving attendees and symbolizing the integration of modern health trends with corporate culture.'
    WITH oi
    MATCH (o:Object {uuid: 'object_kombucha_station'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fruit_infused_water_event_3_3'})
    ON CREATE SET
        oi.description = 'The fruit-infused water mirrors the modern, healthy refreshment trend and is strategically placed near Mark, who observes the dynamic proceedings while reflecting on his professional anxieties.',
        oi.status_before = 'The fruit-infused water was positioned as part of the refreshment setup within the Ideation Zone.',
        oi.status_after = 'It continues to be served throughout the event, reinforcing the juxtaposition between innovation and Mark’s personal dilemma.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fruit_infused_water'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_premium_name_badge_event_3_3'})
    ON CREATE SET
        oi.description = 'Mark is seen adjusting his LinkedIn Premium name badge, a subtle yet significant action that underscores his effort to maintain a professional facade amid the escalating corporate disruptions.',
        oi.status_before = 'The name badge was already being worn as a staple piece of Mark\'s professional attire.',
        oi.status_after = 'It remains prominently displayed, symbolizing Mark\'s ongoing struggle to preserve his corporate image in a rapidly changing environment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Standing by the fruit-infused water while meticulously adjusting his LinkedIn Premium name badge, internally panicking about potential embarrassing topics.',
        ap.emotional_state = 'Anxious and apprehensive, with an undercurrent of dread about his reputation.',
        ap.emotional_tags = ["Anxious", "apprehensive, with an undercurrent of dread about his reputation."],
        ap.active_plans = ["Monitor the interaction between Jeremy and Charlotte closely", "Avoid any mention of his past associations like the band or the ketamine sound installation", "Keep a low profile to minimize potential career risks"],
        ap.beliefs = ["He believes that even a slight misstep in conversation could undermine his professional standing.", "He is convinced that discretion and vigilant control of the narrative are essential to corporate survival."],
        ap.goals = ["To remain inconspicuous during interactions", "To prevent any discussion that might expose his vulnerabilities or past missteps"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Engaging Charlotte with an energetic pitch on sonic optimization, citing the fusion of alpha waves, beta frequencies, and unconventional inspirations.',
        ap.emotional_state = 'Confident, exuberant, and a touch irreverent in his approach to innovation.',
        ap.emotional_tags = ["Confident, exuberant,", "a touch irreverent in his approach to innovation."],
        ap.active_plans = ["Demonstrate the disruptive potential of his sonic optimization approach", "Convince Charlotte and others of the transformative power of his ideas"],
        ap.beliefs = ["He firmly believes that blending mindfulness with cutting-edge technology will revolutionize workplace productivity.", "He assumes that his unconventional methods are exactly what the corporate world needs."],
        ap.goals = ["To secure acknowledgment and responsibility within the innovation agenda", "To establish himself as a credible disruptor in the corporate landscape"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Overseeing the Ideation Zone setup while engaging directly with Jeremy to explore his innovative proposal in sonic optimization.',
        ap.emotional_state = 'Calm, professionally curious, and analytically focused on extracting viable innovation.',
        ap.emotional_tags = ["Calm, professionally curious,", "analytically focused on extracting viable innovation."],
        ap.active_plans = ["Critically evaluate Jeremy's disruptive ideas to see if they align with the strategic needs of the company", "Maintain the event\u2019s structured innovative agenda while fostering creative input"],
        ap.beliefs = ["She believes that disruptive innovation is essential for revitalizing corporate strategy in challenging times.", "She values ideas that blend creativity with functional digital transformation."],
        ap.goals = ["To identify and potentially integrate viable new strategies for digital transformation", "To ensure that the event results in actionable insights that benefit the company"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Approaches Jeremy with a professional inquiry about his role in sonic optimization.',
        ap.emotional_state = 'Calm, focused, and professionally curious.',
        ap.emotional_tags = ["Calm, focused,", "professionally curious."],
        ap.active_plans = ["Identify innovative solutions to drive digital transformation post the Great Algorithm Crisis."],
        ap.beliefs = ["Innovation is essential for overcoming recent challenges.", "Fresh, unorthodox ideas can propel the company forward."],
        ap.goals = ["Extract actionable insights from Jeremy's approach.", "Implement strategies that integrate creativity with corporate needs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Confidently explains his disruptive approach to sonic optimization using a blend of mindfulness, technology, and unconventional methods.',
        ap.emotional_state = 'Overconfident, enthusiastic, and slightly chaotic.',
        ap.emotional_tags = ["Overconfident, enthusiastic,", "slightly chaotic."],
        ap.active_plans = ["Showcase his innovative use of alpha and beta frequencies.", "Leverage his unconventional methods to secure real responsibilities."],
        ap.beliefs = ["Merging analog and digital modalities can revolutionize workplace productivity.", "Taking risks with unorthodox approaches will yield breakthrough results."],
        ap.goals = ["Convince Charlotte and other executives of his disruptive ideas.", "Elevate his status within the organization by proving the viability of his methods."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Lurks at the fruit-infused water station, internally observing and critiquing the proceedings.',
        ap.emotional_state = 'Anxious, wary, and resentful.',
        ap.emotional_tags = ["Anxious, wary,", "resentful."],
        ap.active_plans = ["Monitor the power dynamics as Jeremy gains recognition.", "Assess potential impacts on his own career trajectory."],
        ap.beliefs = ["The escalating attention toward Jeremy could jeopardize his own professional standing.", "Corporate decisions often favor bold, unconventional moves over cautious conventionality."],
        ap.goals = ["Maintain his relevance and protect his longstanding position.", "Find a way to navigate the evolving corporate dynamics without being sidelined."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Lurking by the fruit-infused water station and adjusting his LinkedIn Premium name badge.',
        ap.emotional_state = 'Anxious and sardonic, with a critical inner monologue about corporate absurdities.',
        ap.emotional_tags = ["Anxious", "sardonic, with a critical inner monologue about corporate absurdities."],
        ap.active_plans = ["Remain inconspicuous amidst the escalating innovation talk", "Avoid being drawn into unwanted responsibilities"],
        ap.beliefs = ["The evolving corporate dynamics are as absurd as Caligula appointing his horse as a senator"],
        ap.goals = ["Maintain his current role without attracting additional responsibilities", "Navigate the shifting power dynamics while keeping his identity intact"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Delivering an overenthusiastic pitch on harnessing alpha and beta frequencies to revolutionize workplace productivity.',
        ap.emotional_state = 'Confident, exuberant, and slightly chaotic in his disruptive approach.',
        ap.emotional_tags = ["Confident, exuberant,", "slightly chaotic in his disruptive approach."],
        ap.active_plans = ["Convince the corporate leadership to back his innovative ideas", "Leverage his unconventional methods to gain increased responsibility"],
        ap.beliefs = ["Innovation stems from mixing mindfulness, blockchain, and unconventional methods", "Disruptive ideas can transform corporate productivity"],
        ap.goals = ["Secure validation and support for his sonic optimization project", "Elevate his status as a pioneering disruptor within the company"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Overseeing the Ideation Zone setup and engaging with Jeremy on his sonic optimization proposals.',
        ap.emotional_state = 'Calm, discerning, and cautiously curious about the new ideas.',
        ap.emotional_tags = ["Calm, discerning,", "cautiously curious about the new ideas."],
        ap.active_plans = ["Evaluate the practical potential of innovative proposals", "Integrate creative strategies while maintaining corporate discipline"],
        ap.beliefs = ["Innovation is vital but must be anchored in practical impact", "Balancing creativity with structured execution leads to true transformation"],
        ap.goals = ["Identify breakthrough solutions aligned with MetricShift Digital's strategies", "Establish a controlled environment for implementing innovative ideas"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_1'})
    ON CREATE SET
        oi.description = 'Jeremy uses the DJ equipment, borrowed from Super Hans\' silent disco business, to set up his scientifically-engineered productivity soundscape in the Disruption Chamber. The equipment is central to his innovative presentation, blending electronic beats with unexpected sound effects.',
        oi.status_before = 'The DJ equipment was stored and unused, having been previously acquired from Super Hans’ silent disco business, appearing worn but functional.',
        oi.status_after = 'The DJ equipment is actively set up and in operation, emitting a chaotic blend of electronic beats and ambient sounds as part of Jeremy\'s performance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_2'})
    ON CREATE SET
        oi.description = 'Jeremy sets up and activates the DJ Equipment, borrowed from Super Hans\' silent disco business, to launch his productivity soundscape by mixing electronic beats, office printer sounds, and ambient chants.',
        oi.status_before = 'The DJ Equipment was stored unused, reflecting signs of extensive past use from Super Hans\' silent disco ventures.',
        oi.status_after = 'The DJ Equipment is actively operating, projecting a chaotic, disruptive audio landscape during the presentation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_3'})
    ON CREATE SET
        oi.description = 'Jeremy sets up the DJ equipment in the boardroom to launch his \'scientifically-engineered productivity soundscape\' presentation. Borrowed from Super Hans\'s silent disco business, the equipment plays a central role in the event, providing a chaotic blend of electronic beats, office printer sounds, and ambient background noise that underscores the disruptive, authentically digital nature of the presentation.',
        oi.status_before = 'The DJ equipment was previously stored or in use by Super Hans for his silent disco ventures, awaiting deployment.',
        oi.status_after = 'The DJ equipment is actively in use during the presentation, emitting the experimental soundscape and emphasizing the unconventional innovation being showcased.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Setting up his DJ equipment and launching his productivity soundscape presentation.',
        ap.emotional_state = 'Enthusiastic, bold, and determined.',
        ap.emotional_tags = ["Enthusiastic, bold,", "determined."],
        ap.active_plans = ["Demonstrate the innovative potential of his soundscape", "Captivate the boardroom and secure support for his ideas"],
        ap.beliefs = ["His scientifically-engineered soundscape can revolutionize corporate productivity", "Unconventional methods can drive transformative change in the corporate environment"],
        ap.goals = ["Achieve a full rollout of his innovation", "Transform his disruptive idea into a recognized corporate solution"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Observing the presentation while internally critiquing and ruminating on his own career prospects.',
        ap.emotional_state = 'Anxious, cynical, and self-deprecating.',
        ap.emotional_tags = ["Anxious, cynical,", "self-deprecating."],
        ap.active_plans = ["Blend into the background without drawing attention", "Mentally prepare defenses against the disruptive changes unfolding"],
        ap.beliefs = ["Jeremy's disruptive creativity is likely to succeed and outshine him", "His own prospects are diminishing as the corporate landscape shifts"],
        ap.goals = ["Maintain his current role despite the disruptive changes", "Avoid being forced into an unwanted, lower-profile position"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Observing the presentation with quiet, analytical interest.',
        ap.emotional_state = 'Calm, discerning, and strategically observant.',
        ap.emotional_tags = ["Calm, discerning,", "strategically observant."],
        ap.active_plans = ["Evaluate the disruptive presentation for potential integration into his company", "Determine whether Jeremy's innovative approach aligns with strategic goals"],
        ap.beliefs = ["Disruptive ideas can be harnessed to gain a competitive edge", "Innovation, when merged with sound business practices, can drive corporate success"],
        ap.goals = ["Assess strategic fit for a potential merger and partnership", "Support initiatives that could enhance productivity and digital transformation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Setting up DJ equipment and launching the chaotic productivity soundscape.',
        ap.emotional_state = 'Exuberant, confident, and defiantly innovative.',
        ap.emotional_tags = ["Exuberant, confident,", "defiantly innovative."],
        ap.active_plans = ["Demonstrate the disruptive potential of his soundscape", "Establish his reputation as a corporate innovator"],
        ap.beliefs = ["Unconventional methods can revolutionize workplace productivity", "His blend of electronic beats, office printer sounds, and ambient chants is a breakthrough"],
        ap.goals = ["Secure corporate acceptance and a full rollout for his soundscape", "Prove that his innovative approach can transform traditional work environments"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Attempting to blend into the background, while internally critiquing the presentation.',
        ap.emotional_state = 'Anxious, cynical, and resigned about his own career prospects.',
        ap.emotional_tags = ["Anxious, cynical,", "resigned about his own career prospects."],
        ap.active_plans = ["Stay unnoticed and avoid drawing attention to himself", "Mentally prepare for the impending changes in the corporate hierarchy"],
        ap.beliefs = ["Jeremy's innovative approach is bound to succeed, regardless of his own deteriorating career trajectory", "He fears becoming obsolete in the midst of disruptive corporate innovations"],
        ap.goals = ["Avoid being overshadowed by disruptive talent", "Maintain his current role or find a way to escape the impending professional downfall"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Observing the presentation with keen interest and readiness to act.',
        ap.emotional_state = 'Intrigued and strategically optimistic.',
        ap.emotional_tags = ["Intrigued", "strategically optimistic."],
        ap.active_plans = ["Evaluate the viability of incorporating disruptive digital innovations", "Prompt immediate action by instructing Charlotte to sign Jeremy up for the full rollout"],
        ap.beliefs = ["Raw, disruptive, and authentically digital innovations are key to advancing corporate strategy", "Jeremy's unconventional ideas may provide the competitive edge his company needs"],
        ap.goals = ["Implement innovative strategies that merge technology with business growth", "Potentially secure a beneficial merger by aligning with transformative ideas"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Setting up his DJ equipment and launching a chaotic, productivity soundscape.',
        ap.emotional_state = 'Eager and confident, embracing his role as a disruptive innovator.',
        ap.emotional_tags = ["Eager", "confident, embracing his role as a disruptive innovator."],
        ap.active_plans = ["Deliver a groundbreaking presentation", "Showcase his scientifically-engineered soundscape"],
        ap.beliefs = ["His unconventional approach will revolutionize corporate productivity", "Disruption is essential for digital transformation"],
        ap.goals = ["Secure a full rollout of his concept", "Establish himself as a key innovator within the corporate landscape"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Observing the presentation with keen interest and verbally endorsing the soundscape.',
        ap.emotional_state = 'Pragmatic and enthusiastic about integrating disruptive ideas.',
        ap.emotional_tags = ["Pragmatic", "enthusiastic about integrating disruptive ideas."],
        ap.active_plans = ["Instruct Charlotte to sign Jeremy up for the full rollout", "Evaluate the merger potential with innovative developments"],
        ap.beliefs = ["Raw and disruptive concepts are the future of digital transformation", "Innovative solutions can offer a competitive edge"],
        ap.goals = ["Implement Jeremy's concept fully", "Position Johnson Dynamic Solutions advantageously in transformative ventures"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Internally lamenting his professional fate while trying to blend into the background.',
        ap.emotional_state = 'Anxious, bitter, and resigned',
        ap.emotional_tags = ["Anxious, bitter,", "resigned"],
        ap.active_plans = ["Conceal his discomfort while observing the unfolding innovation", "Mentally brace for further professional sidelining"],
        ap.beliefs = ["Innovative breakthroughs will leave him perpetually behind", "No matter his efforts, disruptive colleagues will always outshine him"],
        ap.goals = ["Reclaim some measure of professional relevance", "Contemplate alternative paths, even if it means an extreme career change"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Receiving Alan\'s instruction as she prepares to sign Jeremy up for the rollout.',
        ap.emotional_state = 'Focused and dutiful, with a measured openness to innovation.',
        ap.emotional_tags = ["Focused", "dutiful, with a measured openness to innovation."],
        ap.active_plans = ["Follow through on the directive to sign up Jeremy", "Assist in integrating the disruptive concept into the corporate framework"],
        ap.beliefs = ["Jeremy's innovative approach can drive meaningful change", "Adhering to leadership directives will advance corporate transformation"],
        ap.goals = ["Ensure a smooth and successful rollout of the new concept", "Align operational execution with broader innovation strategies"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blockchain_meditation_printouts_event_5_1'})
    ON CREATE SET
        oi.description = 'Super Hans is surrounded by a collection of blockchain and meditation app printouts as he explains his idea for merging corporate sound therapy with his mindfulness platform, using the printouts to reinforce his pitch for \'SonicChain\'.',
        oi.status_before = 'The printouts were neatly scattered on the kitchen table as materials outlining blockchain concepts and meditation app interfaces.',
        oi.status_after = 'The printouts remain on the table, serving as a visual backdrop to Super Hans\'s ongoing pitch, largely unchanged in appearance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blockchain_meditation_printouts'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hacked_mindcoin_laptop_event_5_1'})
    ON CREATE SET
        oi.description = 'Super Hans\'s hacked MindCoin laptop sits prominently on the table, displaying remnants of his compromised cryptocurrency project, which underscores the unconventional and risky nature of his tech ventures.',
        oi.status_before = 'The laptop was already in a battered and compromised state, clearly having experienced a hacking incident with its cryptocurrency project.',
        oi.status_after = 'The laptop continues to display the hacked remnants of the MindCoin project, reinforcing its role as a symbol of Super Hans\'s offbeat entrepreneurial methods.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hacked_mindcoin_laptop'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_5_1'})
    ON CREATE SET
        oi.description = 'Mark enters the scene wearing his MetricShift lanyard, which visually represents his enduring affiliation with corporate culture even as unconventional ideas are pitched in the kitchen.',
        oi.status_before = 'The lanyard was being worn by Mark as a marker of his identity within MetricShift Digital.',
        oi.status_after = 'The lanyard remains on Mark as he observes the unfolding conversation, symbolizing his ongoing internal conflict between corporate allegiance and the allure of disruptive innovation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_5_2'})
    ON CREATE SET
        oi.description = 'Mark enters the kitchen still wearing his MetricShift lanyard, which underscores his entrenched corporate identity and anxiety as he contemplates the forthcoming pitch and the chaotic innovations around him.',
        oi.status_before = 'The lanyard was previously worn by Mark as a symbol of his corporate affiliation and responsibility.',
        oi.status_after = 'It continues to be worn by Mark, serving as a persistent reminder of his corporate ties and internal apprehensions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hacked_mindcoin_laptop_event_5_2'})
    ON CREATE SET
        oi.description = 'Super Hans utilizes the hacked MindCoin laptop to showcase the corrupted remnants of his cryptocurrency project, reinforcing his grand vision of merging blockchain with mindfulness.',
        oi.status_before = 'The laptop had already been compromised and showed signs of heavy use from previous hacking attempts.',
        oi.status_after = 'It continues to display the defunct MindCoin project, evidencing Super Hans\' unconventional and troubled digital endeavors.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hacked_mindcoin_laptop'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blockchain_meditation_printouts_event_5_2'})
    ON CREATE SET
        oi.description = 'The scattered blockchain and meditation printouts on the kitchen table provide a visual foundation for Super Hans\' pitch, symbolizing his merging of digital innovation with mindfulness.',
        oi.status_before = 'The printouts were already strewn about the table, reflecting Super Hans\' chaotic yet passionate approach to his projects.',
        oi.status_after = 'They remain in place, persistently underscoring the thematic blend of technology and mindfulness that weaves through the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blockchain_meditation_printouts'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Excitedly making tea while brainstorming and pitching the idea of integrating NFTs with corporate sound therapy.',
        ap.emotional_state = 'Enthusiastic and energized by innovative possibilities.',
        ap.emotional_tags = ["Enthusiastic", "energized by innovative possibilities."],
        ap.active_plans = ["Propose integrating unique frequency rights through NFTs", "Collaborate on merging corporate sound therapy with mindfulness techniques"],
        ap.beliefs = ["Innovative combinations can redefine traditional corporate practices", "Digital transformation is driven by creative technological integrations"],
        ap.goals = ["Establish a breakthrough concept that differentiates his approach in corporate innovation", "Contribute significantly to a disruptive new venture"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Sitting at the kitchen table surrounded by blockchain and meditation app printouts, actively outlining his vision for \'SonicChain\'.',
        ap.emotional_state = 'Confident and energetic, with a hint of reckless creativity fueled by his recent coding endeavors.',
        ap.emotional_tags = ["Confident", "energetic, with a hint of reckless creativity fueled by his recent coding endeavors."],
        ap.active_plans = ["Develop 'SonicChain' by combining his mindfulness platform with corporate sound therapy", "Integrate blockchain elements to enhance the venture's uniqueness"],
        ap.beliefs = ["Blockchain is the missing ingredient in effective corporate meditation", "Even challenges like database theft cannot derail a revolutionary idea"],
        ap.goals = ["Launch a disruptive new venture that reinvents corporate mindfulness", "Demonstrate the potential of unconventional tech in traditional corporate settings"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Entering the kitchen while still wearing his MetricShift lanyard, voicing skepticism about the pitch.',
        ap.emotional_state = 'Anxious and apprehensive, concerned about the potential chaos from unconventional ideas.',
        ap.emotional_tags = ["Anxious", "apprehensive, concerned about the potential chaos from unconventional ideas."],
        ap.active_plans = ["Evaluate the viability of the new crypto-mindfulness pitch", "Safeguard his professional standing while questioning the disruptive strategy"],
        ap.beliefs = ["Unconventional tech ventures may lead to unforeseen corporate risks", "Maintaining traditional corporate practices is necessary to prevent financial crisis"],
        ap.goals = ["Mitigate potential disruptions to MetricShift's established systems", "Ensure that any new venture does not jeopardize his own career stability"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Enters the kitchen wearing his MetricShift lanyard and interjects with a remark about the impending pitch of the crypto-mindfulness app.',
        ap.emotional_state = 'Anxious and cynical, internally resigned to the chaotic corporate dynamics unfolding.',
        ap.emotional_tags = ["Anxious", "cynical, internally resigned to the chaotic corporate dynamics unfolding."],
        ap.active_plans = ["Assess the trajectory of Super Hans' pitch and its implications for his own career.", "Monitor the unfolding conversation for potential impact on his professional standing."],
        ap.beliefs = ["Super Hans will eventually leverage this pitch to secure a board position.", "This initiative marks the genesis of a financial crisis affecting corporate structures."],
        ap.goals = ["Protect his own career interests amidst emerging corporate disruptions.", "Mitigate the consequences of unorthodox corporate pitches that could destabilize the established order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Excitedly preparing tea while actively engaging in the discussion about integrating NFTs with the crypto-mindfulness concept.',
        ap.emotional_state = 'Enthusiastic and energetic, riding a surge of creative inspiration.',
        ap.emotional_tags = ["Enthusiastic", "energetic, riding a surge of creative inspiration."],
        ap.active_plans = ["Propose incorporating NFT technology to complement the SonicChain concept.", "Support Super Hans' vision with his own ideas on corporate sound therapy."],
        ap.beliefs = ["Innovative disruptions can redefine corporate productivity.", "Combining unconventional tech and creative soundscapes will revolutionize workplace experiences."],
        ap.goals = ["Establish his role as a forward-thinking disruptor within the corporate framework.", "Contribute to a groundbreaking project that challenges traditional corporate practices."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Sits at the kitchen table surrounded by blockchain and meditation printouts, discussing the integration of his hacked cryptocurrency project into a larger vision.',
        ap.emotional_state = 'Confident and visionary with a touch of erratic enthusiasm.',
        ap.emotional_tags = ["Confident", "visionary with a touch of erratic enthusiasm."],
        ap.active_plans = ["Combine Jeremy's corporate sound therapy concept with his own mindfulness platform to create 'SonicChain'.", "Leverage blockchain technology and unconventional elements (like proper drugs) to enhance corporate meditation."],
        ap.beliefs = ["Blockchain is the missing ingredient in corporate meditation.", "Innovative disruption, even with seemingly absurd methods, can upend traditional corporate hierarchies."],
        ap.goals = ["Pitch the revolutionary SonicChain concept to MetricShift.", "Position himself for a future role on the board of directors, influencing corporate transformation."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_1'})
    ON CREATE SET
        oi.description = 'Mark nurses a glass of warm white wine at the table, underscoring his resignation and the mounting weight of corporate existential dread in a moment of quiet despair.',
        oi.status_before = 'The wine was served at an optimal temperature, appearing inviting yet already hinting at neglect, reflective of its owner’s subdued state.',
        oi.status_after = 'Throughout the scene, the wine is gradually consumed, symbolizing Mark\'s deepening sense of resignation and isolation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_1'})
    ON CREATE SET
        oi.description = 'Super Hans is seen wearing the MetricShift Lanyard, an ironic emblem of his temporary corporate affiliation and his ambitious, if misguided, entry into the world of disruptive business ventures.',
        oi.status_before = 'Originally belonging to Mark Corrigan, the lanyard is a standard corporate identification item symbolizing the culture of MetricShift Digital.',
        oi.status_after = 'During the scene, the lanyard remains on Super Hans, reinforcing his contrarian yet earnest attempt to adopt a corporate identity in his unconventional entrepreneurial pursuits.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_2'})
    ON CREATE SET
        oi.description = 'Super Hans is seen wearing the MetricShift Lanyard while boasting about his next big idea, signaling his appropriation of corporate identity and lending a satirical edge to the discussion.',
        oi.status_before = 'The lanyard was originally a corporate accessory owned by Mark Corrigan, symbolizing his affiliation with MetricShift Digital.',
        oi.status_after = 'It is now being worn by Super Hans, transforming its connotation into a badge of disruptive eccentricity during the pub conversation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_2'})
    ON CREATE SET
        oi.description = 'Mark nurses a glass of warm white wine at the corner table, visually embodying his resignation and mounting corporate anxiety as the evening unfolds.',
        oi.status_before = 'The wine had already lost its chilled allure, hinting at neglect and a wearied state prior to the scene.',
        oi.status_after = 'It remains steadily in Mark\'s hand, highlighting his inner turmoil and foreshadowing his need for additional indulgence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_3'})
    ON CREATE SET
        oi.description = 'Mark nurses his warm white wine at the pub as he contemplates his corporate frustrations, using the drink as a quiet emblem of his resignation and existential malaise.',
        oi.status_before = 'The warm white wine is served fresh in a glass at the Fox & Goose Pub, awaiting consumption.',
        oi.status_after = 'The wine is partially consumed, reflecting Mark\'s ongoing internal struggle and gradual surrender to his corporate despair.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_3'})
    ON CREATE SET
        oi.description = 'Super Hans is seen nonchalantly wearing the MetricShift Lanyard, transforming a corporate accessory into an ironic badge of countercultural innovation as he celebrates and discusses his crypto-mindfulness ideas.',
        oi.status_before = 'The lanyard was originally owned by Mark Corrigan, symbolizing his formal affiliation with corporate identity.',
        oi.status_after = 'Now donned by Super Hans, the lanyard symbolizes a subversion of its intended corporate purpose, serving as an emblem of rebellious misappropriation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_4'})
    ON CREATE SET
        oi.description = 'Mark is seen nursing a glass of warm white wine at The Fox & Goose Pub, symbolizing his resigned state and bitter reflection on his corporate misadventures.',
        oi.status_before = 'The wine had already lost its ideal chilled quality, casually reflecting neglect.',
        oi.status_after = 'The glass remains half-full and unattended as Mark drifts into introspection, emblematic of his disillusionment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_4'})
    ON CREATE SET
        oi.description = 'Super Hans is spotted wearing the MetricShift lanyard, an ironic twist that underscores the unexpected appropriation of corporate symbols amidst his celebration of disruptive ideas.',
        oi.status_before = 'Originally owned by Mark Corrigan, the lanyard symbolized his corporate identity and professional aspirations.',
        oi.status_after = 'The lanyard is repurposed by Super Hans, highlighting the shifting dynamics and the subversive takeover of corporate motifs.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_5'})
    ON CREATE SET
        oi.description = 'Mark Corrigan nurses a glass of warm white wine as he reacts to the disheartening LinkedIn notification, embodying his growing sense of corporate disillusionment and need for another escape.',
        oi.status_before = 'The warm white wine was served at the table, representing a modest, unassuming refreshment awaiting consumption.',
        oi.status_after = 'The wine is partially consumed, symbolizing Mark\'s descent into resignation and his attempt to cope with his professional frustrations.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_5'})
    ON CREATE SET
        oi.description = 'Super Hans is seen wearing the MetricShift Lanyard during the event, using it as an impromptu emblem of corporate identity and his own unorthodox approach to success, which contrasts sharply with Mark\'s anxieties.',
        oi.status_before = 'The lanyard originally belonged to Mark Corrigan as a corporate identifier, symbolizing professional belonging within MetricShift Digital.',
        oi.status_after = 'Now appropriated by Super Hans, the lanyard becomes a comic emblem of corporate parody, reflecting his unconventional method of claiming relevance in the corporate arena.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Sitting at a corner table, nursing a glass of warm white wine while observing the unfolding celebration.',
        ap.emotional_state = 'Melancholic, anxious, and wryly resigned to his corporate misfortune.',
        ap.emotional_tags = ["Melancholic, anxious,", "wryly resigned to his corporate misfortune."],
        ap.active_plans = ["Contemplate his next drink", "Withdraw from the celebratory atmosphere while internally critiquing corporate absurdity"],
        ap.beliefs = ["His inability to match his colleagues' disruptive energy marks his professional inadequacy.", "The corporate world inherently misunderstands true innovation."],
        ap.goals = ["Cope with his existential corporate dread in the short term", "Avoid further exposure to situations that amplify his insecurities"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Celebrating exuberantly at the table, boasting about his scientifically optimized sound solutions and global ambitions.',
        ap.emotional_state = 'Exhilarated, overconfident, and intoxicated by his own disruptive ideas.',
        ap.emotional_tags = ["Exhilarated, overconfident,", "intoxicated by his own disruptive ideas."],
        ap.active_plans = ["Promote his vision of global office sound optimization", "Leverage his recent endorsements and growing influence in digital transformation"],
        ap.beliefs = ["His innovative sound solutions are revolutionary and will transform the corporate landscape.", "Disrupting traditional corporate norms is the key to success."],
        ap.goals = ["Achieve global recognition for his unique sonic innovations", "Capitalize on new opportunities spurred by his forward-thinking ideas"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Exuding celebratory and ambitious energy while discussing his crypto-mindfulness app and its potential massive impact.',
        ap.emotional_state = 'Eager, confident, and ready to capitalize on past experiences despite earlier setbacks.',
        ap.emotional_tags = ["Eager, confident,", "ready to capitalize on past experiences despite earlier setbacks."],
        ap.active_plans = ["Reframe his previous crypto-mindfulness app failure as a stepping stone to greater innovations", "Fuse unconventional ideas with emerging tech to create a new wave of digital solutions"],
        ap.beliefs = ["His unconventional approach can outshine traditional corporate methods.", "Innovative ideas, even those that failed before, can be reborn stronger."],
        ap.goals = ["Expand his digital innovation portfolio", "Establish credibility and attract interest for his future tech ventures"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Sitting at a corner table at The Fox & Goose Pub, quietly nursing a warm white wine as he internally critiques his place in the corporate world.',
        ap.emotional_state = 'Resigned, anxious, and self-deprecatingly observant.',
        ap.emotional_tags = ["Resigned, anxious,", "self-deprecatingly observant."],
        ap.active_plans = ["Stay inconspicuous while managing his inner turmoil", "Avoid drawing attention to his professional insecurities"],
        ap.beliefs = ["Success in the corporate world is elusive and almost absurd", "Others' unconventional approaches might inadvertently outshine his own careful maneuvers"],
        ap.goals = ["Temporarily escape the pressures of corporate expectations", "Maintain a low profile while internally evaluating his career missteps"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Engaged in a celebratory discussion with Super Hans, outlining his vision for global corporate transformation through his innovative sound solutions.',
        ap.emotional_state = 'Exuberant, overconfident, and highly optimistic.',
        ap.emotional_tags = ["Exuberant, overconfident,", "highly optimistic."],
        ap.active_plans = ["Pitch his 'scientifically optimized sound solutions' as a revolutionary idea", "Leverage the momentum of the conversation to position his ideas for global reach"],
        ap.beliefs = ["His approach is groundbreaking and will redefine corporate productivity", "Bold, unorthodox ideas are the key to transforming outdated corporate practices"],
        ap.goals = ["Establish his reputation as the visionary behind innovative corporate change", "Expand his influence beyond the local discussion to a global audience"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Confidently declaring at the table that his new idea could surpass his previous crypto-mindfulness app, while wearing a MetricShift lanyard as an ironic nod to corporate culture.',
        ap.emotional_state = 'Cocky, buoyant, and self-assured.',
        ap.emotional_tags = ["Cocky, buoyant,", "self-assured."],
        ap.active_plans = ["Promote his new idea as a major breakthrough", "Capitalize on the previous setback of his crypto-mindfulness app to build a stronger narrative"],
        ap.beliefs = ["His innovative concept is destined to be 'massive' and outdo past failures", "A bold approach, even after setbacks, can redefine success in unconventional ways"],
        ap.goals = ["Re-establish his credibility and vision within the group", "Demonstrate that his next venture can surpass even his most ambitious previous projects"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Sits at a corner table, nursing a warm white wine and watching the unfolding corporate absurdity.',
        ap.emotional_state = 'Resigned and anxious, harboring inner bitterness and self-doubt about his professional trajectory.',
        ap.emotional_tags = ["Resigned", "anxious, harboring inner bitterness", "self-doubt about his professional trajectory."],
        ap.active_plans = ["Avoid further embarrassing corporate encounters", "Reassess his role in the corporate maze"],
        ap.beliefs = ["Jeremy\u2019s unorthodox success might subtly mirror the escape from traditional constraints", "The corporate world is as absurd as it is unpredictable"],
        ap.goals = ["Find a way to regain control over his career identity", "Deal with his internal crisis by distancing himself from the corporate circus"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Celebrating with Super Hans and boldly outlining his vision of a global revolution in office ambiance.',
        ap.emotional_state = 'Elated and wildly confident, riding high on the energy of his disruptive ideas.',
        ap.emotional_tags = ["Elated", "wildly confident, riding high on the energy of his disruptive ideas."],
        ap.active_plans = ["Promote and expand his scientifically optimized sound solutions to a global scale", "Leverage corporate endorsements and buzz to gain credibility"],
        ap.beliefs = ["His sound solutions are innovative enough to transform everyday office environments", "The corporate world is ready for radical change through unconventional methods"],
        ap.goals = ["Achieve recognition as a groundbreaking disruptor", "Establish his idea as the new standard in corporate productivity enhancements"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Casually sporting a MetricShift lanyard and comparing the potential of his new ideas to his previous crypto-mindfulness ventures.',
        ap.emotional_state = 'Excited and conspiratorial, confident in the resurgence of his innovative projects.',
        ap.emotional_tags = ["Excited", "conspiratorial, confident in the resurgence of his innovative projects."],
        ap.active_plans = ["Position his crypto-mindfulness concepts as a foundation for even bigger innovations", "Collaborate with Jeremy to merge sound optimization with blockchain technology"],
        ap.beliefs = ["His previous projects, despite setbacks, validate his instinct for groundbreaking ideas", "Innovation is the key to outpacing conventional corporate limits"],
        ap.goals = ["Outshine his past ventures and redefine digital mindfulness", "Establish a disruptive paradigm that bridges technology with unconventional creativity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Seated at a corner table, quietly nursing a warm white wine while lost in introspection.',
        ap.emotional_state = 'Pensive, anxious, and tinged with ironic resignation.',
        ap.emotional_tags = ["Pensive, anxious,", "tinged with ironic resignation."],
        ap.active_plans = ["Contemplate his career and the absurdity of corporate ambitions", "Avoid further social discomfort by retreating into self-reflection"],
        ap.beliefs = ["The corporate world is inherently absurd and misunderstood", "Jeremy\u2019s success represents a misinterpretation of what he once aspired to be"],
        ap.goals = ["Find temporary solace in drink while processing his existential doubts", "Figure out a way to navigate his own professional crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Enthusiastically celebrating his disruptive ideas and outlining grand plans.',
        ap.emotional_state = 'Exuberant and overconfident, reveling in the thrill of innovation.',
        ap.emotional_tags = ["Exuberant", "overconfident, reveling in the thrill of innovation."],
        ap.active_plans = ["Promote his scientifically optimized sound solutions", "Envision a global rollout that disrupts conventional office environments"],
        ap.beliefs = ["Unorthodox, almost illegal-sounding ideas can revolutionize corporate culture", "Innovation means breaking away from outdated norms, even if it challenges convention"],
        ap.goals = ["Gain widespread corporate endorsement and recognition for his ideas", "Establish himself as a key influencer in redefining workplace productivity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Boisterously discussing his crypto-mindfulness app while sporting a MetricShift lanyard.',
        ap.emotional_state = 'Optimistic and energetic, undeterred by recent setbacks like the hacking incident.',
        ap.emotional_tags = ["Optimistic", "energetic, undeterred by recent setbacks like the hacking incident."],
        ap.active_plans = ["Reframe the narrative around his crypto-mindfulness app to emphasize its enormous potential", "Combine his ideas with emerging trends to appeal to corporate innovators"],
        ap.beliefs = ["Bold, disruptive concepts will eventually win over even the most conservative corporate setups", "Innovation persists even in the face of minor technical failures"],
        ap.goals = ["Redeem and relaunch his app to secure acceptance and impact in the market", "Forge a successful partnership with like-minded disruptors to scale his ideas"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Sitting at a corner table at The Fox & Goose Pub, nursing a warm white wine after his phone buzzed with a disheartening LinkedIn notification.',
        ap.emotional_state = 'Anxious, dismayed, and envious as he internally compares himself to Jeremy\'s rising profile.',
        ap.emotional_tags = ["Anxious, dismayed,", "envious as he internally compares himself to Jeremy's rising profile."],
        ap.active_plans = ["Order another drink to cope with his growing dismay", "Reassess his place in the corporate world while silently observing the unfolding events"],
        ap.beliefs = ["Believes his career is stagnating", "Feels that professional success is eluding him as others advance"],
        ap.goals = ["Seek immediate relief from his professional anxiety", "Find a way to re-establish his diminishing corporate relevance"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Celebrating his recent endorsement and discussing his global ambitions with Super Hans at the pub.',
        ap.emotional_state = 'Exuberant, confident, and visionary',
        ap.emotional_tags = ["Exuberant, confident,", "visionary"],
        ap.active_plans = ["Expand his disruptive sound optimization concept on a global scale"],
        ap.beliefs = ["Believes his innovative sound solutions will revolutionize corporate productivity", "Feels validated by the new endorsements and recognition"],
        ap.goals = ["Gain widespread recognition as a transformative corporate disruptor", "Transform offices worldwide with his scientifically optimized sound solutions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Enthusiastically discussing the potential of his crypto-mindfulness app and its merger with Jeremy\'s ideas while sporting a MetricShift lanyard.',
        ap.emotional_state = 'Energetic, optimistic, and slightly chaotic',
        ap.emotional_tags = ["Energetic, optimistic,", "slightly chaotic"],
        ap.active_plans = ["Merge his crypto-mindfulness platform with Jeremy's disruptive sound solutions"],
        ap.beliefs = ["Believes his offbeat, innovative ideas are revolutionary for the corporate landscape", "Feels that combining his and Jeremy's visions will create massive market interest"],
        ap.goals = ["Make his crypto-mindfulness concept a mainstream success", "Collaborate on developing a disruptive synergy in corporate innovation"]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_metricshift_executive_boardroom'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Location {uuid: 'location_the_fox_and_goose_pub_croydon_high_street'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_networking_event'})
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
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
