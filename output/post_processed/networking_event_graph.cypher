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
        a.title = 'None',
        a.description = 'Mark Corrigan is the perpetual underdog, drowning his sorrows in warm white wine as he witnesses Jeremy\'s undeserved corporate triumph. He embodies corporate frustration, being intellectually sharp yet socially inept and trapped in a cycle of self-defeating anxiety. His internal monologue is laced with sardonic wit as he reflects on the absurdity that surrounds him.',
        a.traits = ["Cynical", "Self-aware", "Anxious", "Intellectually sharp"],
        a.sphere_of_influence = 'Regional Digital Transformation Strategy Implementation (nominal)'
    ;
MERGE (a:Agent {uuid: 'agent_jeremy_usbourne'})
    ON CREATE SET
        a.name = 'Jeremy Usbourne',
        a.title = 'None',
        a.description = 'Jeremy Usbourne radiates an oblivious confidence as he celebrates his corporate breakthrough. Believing in his own genius, he embodies the inept individual who stumbles into success, propelled by delusion and a flair for buzzwords. His ambition is boundless but his understanding of corporate dynamics is profoundly misguided.',
        a.traits = ["Delusional", "Confident", "Opportunistic", "Buzzword-fluent"],
        a.sphere_of_influence = 'Sonic Visionary (self-proclaimed)'
    ;
MERGE (a:Agent {uuid: 'agent_charlotte_walsh_henderson'})
    ON CREATE SET
        a.name = 'Charlotte Walsh-Henderson',
        a.title = 'Head of Digital Transformation',
        a.description = 'Charlotte Walsh-Henderson, Head of Digital Transformation at MetricShift, personifies the corporate appetite for \'disruption\'. Present in the boardroom, she keenly observes the unfolding chaos, ready to act decisively once approval is given. Her approach reflects a willingness to embrace unconventional ideas even when they border on the absurd.',
        a.traits = ["Decisive", "Pragmatic", "Open to 'disruption'", "Influential (within MetricShift)"],
        a.sphere_of_influence = 'Digital Transformation, Corporate Innovation'
    ;
MERGE (a:Agent {uuid: 'agent_alan_johnson'})
    ON CREATE SET
        a.name = 'Alan Johnson',
        a.title = 'CEO',
        a.description = 'Alan Johnson, the CEO of Johnson Dynamic Solutions, is a seasoned corporate leader observing the unfolding events with measured detachment. His decisive reactions to unconventional ideas reveal both his shrewd understanding of disruptive trends and an openness to mergers and acquisitions that could reshape the corporate landscape.',
        a.traits = ["Observant", "Interested", "Decisive", "Influential (as CEO)"],
        a.sphere_of_influence = 'Corporate Leadership, Mergers & Acquisitions'
    ;
MERGE (a:Agent {uuid: 'agent_super_hans'})
    ON CREATE SET
        a.name = 'Super Hans',
        a.title = 'None',
        a.description = 'Super Hans is the chaotic opportunist who eagerly jumps on board with Jeremy\'s schemes. With reckless energy and misplaced confidence, he fuels the absurdity of the situation, even sporting a MetricShift lanyard despite lacking any formal corporate affiliation. His unpredictable nature hints at further ill-conceived ventures.',
        a.traits = ["Chaotic", "Opportunistic", "Enthusiastic", "Unpredictable"],
        a.sphere_of_influence = 'Hacked Cryptocurrency, Dubious Business Ventures'
    ;
MERGE (a:Agent {uuid: 'agent_steve_from_accounts'})
    ON CREATE SET
        a.name = 'Steve from accounts',
        a.title = 'None',
        a.description = 'Steve from accounts is an unseen yet impactful presence who epitomizes the arbitrary nature of corporate advancement. Once known for his basic tech illiteracy, he now inexplicably endorses unconventional ideas, highlighting the shallow dynamics of corporate competence and validation.',
        a.traits = ["Unremarkable", "Corporate Climber", "Endorsing", "Formerly Incompetent"],
        a.sphere_of_influence = 'Accounts, LinkedIn Endorsements'
    ;
MERGE (o:Object {uuid: 'object_ikea_markus_chair'})
    ON CREATE SET
        o.name = 'IKEA Markus Desk Chair',
        o.description = 'The IKEA Markus desk chair is a sturdy yet worn-out seating piece that has borne the weight of many hours of anxious corporate stratagems. With creaks on every movement and an industrial style that matches Mark\'s minimalist taste, it symbolizes the mundane tools of modern work life, despite its inadvertent role as a silent witness to corporate self-doubt.',
        o.purpose = 'To provide a functional seating arrangement for Mark as he navigates his digital work environment from his bedroom.',
        o.significance = 'Represents the everyday physicality of corporate operations within a personal space, highlighting the tension between professional ambition and the comfort of home.'
    ;
MERGE (o:Object {uuid: 'object_hp_laptop'})
    ON CREATE SET
        o.name = 'HP Laptop',
        o.description = 'The HP laptop is a utilitarian piece of technology that glows with the cold light of digital connectivity, a portal to the world of LinkedIn updates and corporate metrics. It has been the focal point for Mark’s frantic toggling between work and self-evaluation, displaying everything from spreadsheets to the latest posts from colleagues.',
        o.purpose = 'To serve as the primary device for managing digital interactions and work-related tasks.',
        o.significance = 'Embodies the intersection of personal anxiety and corporate digital life, symbolizing the often overwhelming influence of technology on professional identities.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_employee_certificate'})
    ON CREATE SET
        o.name = 'MetricShift Digital Employee of the Month Certificate',
        o.description = 'This certificate, proudly yet askew displayed in Mark\'s bedroom, marks a fleeting achievement in the labyrinth of corporate accolades. Printed with the official insignia of MetricShift Digital Solutions and bearing the august title of \'Employee of the Month (August 2023)\', it contrasts sharply with Mark\'s internal sense of inadequacy.',
        o.purpose = 'To recognize individual corporate achievement and value within the organization.',
        o.significance = 'Serves as a constant reminder of the high stakes and transient rewards in the corporate world, intensifying Mark\'s self-comparison and rivalry with colleagues like Steve from accounts.'
    ;
MERGE (o:Object {uuid: 'object_dartmouth_business_studies_diploma'})
    ON CREATE SET
        o.name = 'Dartmouth Business Studies Diploma',
        o.description = 'The Dartmouth Business Studies diploma hangs on the wall alongside the certificate, a relic of past academic success that now gathers dust. Its faded elegance and formal presentation contrast with the current chaos of Mark’s corporate life, symbolizing a bygone era of unblemished ambition before modern professional pressures took hold.',
        o.purpose = 'To serve as a testament to academic and early professional achievement.',
        o.significance = 'Represents the gap between past aspirations and current professional disillusionment, deepening the narrative of internal conflict in the corporate climb.'
    ;
MERGE (o:Object {uuid: 'object_interview_suit'})
    ON CREATE SET
        o.name = 'Interview Suit (Career Emergency Kit)',
        o.description = 'The interview suit is a cherished yet overused piece of attire, marked by its numerous appearances at critical career junctures—including job interviews and even a disciplinary hearing. Now commandeered by Jeremy, it carries with it an air of desperation and urgency. Its fabric shows signs of wear from repeated use, and its presence is heavily laden with both professional aspiration and personal history.',
        o.purpose = 'To provide a ready-made solution during career crises and serve as a symbol of professional seriousness in moments of need.',
        o.significance = 'Embodies the tension between personal history and professional exigency, acting as a tangible marker of pivotal career moments. Its unauthorized use by Jeremy further underlines the clash between different approaches to corporate survival.'
    ;
MERGE (o:Object {uuid: 'object_cracked_mirror'})
    ON CREATE SET
        o.name = 'Cracked Mirror',
        o.description = 'The cracked mirror in the living room is a salvaged item, likely acquired by Jeremy through his \'entrepreneurial appropriation\' methods. Its cracked surface suggests imperfection and perhaps a distorted view of reality, mirroring Jeremy\'s somewhat delusional self-image and exaggerated perception of his own talents. Used by Jeremy to practice his pitch, it becomes a prop in his performance of corporate ambition, reflecting his attempts to project an image of confidence and professionalism despite underlying flaws.',
        o.purpose = 'Reflection, Pitch Practice',
        o.significance = 'Symbol of Jeremy\'s fractured self-perception and salvaged nature of his ventures'
    ;
MERGE (o:Object {uuid: 'object_red_bull_cans'})
    ON CREATE SET
        o.name = 'Red Bull Cans',
        o.description = 'Empty Red Bull cans are scattered around the living room, particularly in Jeremy\'s vicinity. They are indicative of a high-energy, possibly manic state, suggesting that Jeremy is fueled by artificial stimulants as he prepares for his pitch. The cans symbolize a frantic and unsustainable level of energy and focus, perhaps reflecting the superficial and short-lived nature of Jeremy\'s bursts of enthusiasm and creative endeavors. Their presence also contributes to the cluttered and somewhat chaotic atmosphere of the living room.',
        o.purpose = 'Implied Energy Consumption',
        o.significance = 'Symbol of Jeremy\'s frantic energy and unsustainable bursts of activity'
    ;
MERGE (o:Object {uuid: 'object_gary_vaynerchuk_quotes'})
    ON CREATE SET
        o.name = 'Gary Vaynerchuk Quotes',
        o.description = 'Printouts of Gary Vaynerchuk quotes, highlighted and prominently displayed in the living room, represent Jeremy\'s superficial and somewhat misguided attempts at corporate inspiration. The highlighted passages indicate a selective and perhaps shallow engagement with business principles, focusing on buzzwords and easily digestible soundbites rather than deep strategic thinking.',
        o.purpose = 'Superficial Corporate Inspiration',
        o.significance = 'Symbol of Jeremy\'s reliance on corporate jargon and superficial motivation'
    ;
MERGE (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    ON CREATE SET
        o.name = 'Networking Emergency Protocols Index Cards',
        o.description = 'Mark\'s \'Networking Emergency Protocols\' index cards are color-coded and meticulously organized, representing his structured and anxious approach to social and professional interactions. These cards are a tangible manifestation of Mark\'s deep-seated fear of social disasters and his obsessive need to control and prepare for every possible negative outcome. The detailed organization suggests a clinical level of anxiety, highlighting his tendency to overthink even the most mundane social situations.',
        o.purpose = 'Anxiety Management, Social Disaster Preparation',
        o.significance = 'Symbol of Mark\'s social anxiety and need for control'
    ;
MERGE (o:Object {uuid: 'object_sounds_of_the_serviced_office_ep'})
    ON CREATE SET
        o.name = 'Sounds of the Serviced Office EP',
        o.description = '\'Sounds of the Serviced Office\' EP is Jeremy\'s self-proclaimed \'critically acclaimed\' artistic project, consisting of recordings of an office printer from his uncle\'s accounting firm. The EP exemplifies Jeremy\'s unconventional approach to \'sonic arts\' and his tendency to inflate mundane experiences into grand artistic statements. Recorded while he was high on ketamine, it underscores the haphazard and unserious nature of his creative process.',
        o.purpose = 'Jeremy\'s Creative Work, Pitch Material',
        o.significance = 'Example of Jeremy\'s unconventional and exaggerated artistic claims'
    ;
MERGE (o:Object {uuid: 'object_ted_talks'})
    ON CREATE SET
        o.name = 'TED Talks',
        o.description = 'TED Talks are referenced by Jeremy as a source of his \'research\' for his corporate pitch. These online videos, featuring engaging presentations on a variety of topics, represent his superficial approach to acquiring knowledge and understanding of the corporate world.',
        o.purpose = 'Superficial Research',
        o.significance = 'Symbol of Jeremy\'s superficial research methods and shortcut mentality'
    ;
MERGE (o:Object {uuid: 'object_instagram'})
    ON CREATE SET
        o.name = 'Instagram',
        o.description = 'Instagram, the social media platform, is mentioned as the place where Jeremy follows Gary Vaynerchuk. This reference positions Instagram as a source of his corporate inspiration and highlights the visual and often superficial nature of his engagement with business and motivational content.',
        o.purpose = 'Source of Gary Vaynerchuk Content',
        o.significance = 'Symbol of Jeremy\'s reliance on visual and superficial sources of inspiration'
    ;
MERGE (o:Object {uuid: 'object_office_printer'})
    ON CREATE SET
        o.name = 'Office Printer',
        o.description = 'The office printer, specifically from Jeremy\'s uncle\'s accounting firm, is the mundane object that serves as the source material for Jeremy\'s \'Sounds of the Serviced Office\' EP. This everyday office equipment, typically associated with routine tasks and administrative functions, is transformed by Jeremy into \'sonic art\'. It represents the ordinary and monotonous reality of office life, recontextualized as artistic expression.',
        o.purpose = 'Source of Sound Recordings',
        o.significance = 'Mundane object transformed into \'sonic art\' by Jeremy'
    ;
MERGE (o:Object {uuid: 'object_whiteboards_buzzwords'})
    ON CREATE SET
        o.name = 'Whiteboards Covered in Buzzwords',
        o.description = 'These expansive whiteboards are filled with an assortment of corporate buzzwords that encapsulate the fervor and superficiality of modern innovation. Their pristine surfaces, illuminated by fairy lights, highlight the juxtaposition of high aspirations with everyday corporate jargon.',
        o.purpose = 'Used for brainstorming and showcasing innovative ideas during corporate events.',
        o.significance = 'They represent the ephemeral nature of corporate trends and the sometimes superficial attempt at sponsored creativity within modern office culture.'
    ;
MERGE (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    ON CREATE SET
        o.name = 'LinkedIn Premium Name Badge',
        o.description = 'This name badge exudes a sense of forced professionalism, emblazoned with the premium LinkedIn logo and designed to bolster corporate appearances. Despite its shiny finish and promise of legitimacy, it betrays an undercurrent of desperation as its wearer clutches onto the slipping prospects of career ascension.',
        o.purpose = 'To visually establish professional identity and credibility within the corporate environment.',
        o.significance = 'Underscores the pressure to project an image of success and the often superficial measures taken to align oneself with corporate prestige.'
    ;
MERGE (o:Object {uuid: 'object_kombucha_stations'})
    ON CREATE SET
        o.name = 'Kombucha Stations',
        o.description = 'Situated strategically around the innovation suite and arranged with precision by Charlotte, these kombucha stations offer a curated selection of fermented tea beverages. Designed with modern, minimalist aesthetics, they blend current health trends with corporate culture.',
        o.purpose = 'To serve as refreshment hubs that encourage wellness and informal networking during corporate events.',
        o.significance = 'They highlight the organization\'s embrace of current health trends while symbolizing the blending of serious work with the casual, performative elements of modern corporate culture.'
    ;
MERGE (o:Object {uuid: 'object_fairy_lights'})
    ON CREATE SET
        o.name = 'Fairy Lights',
        o.description = 'Delicately strung around the perimeter of the Ideation Zone, these fairy lights add a whimsical yet sophisticated glow to the innovation suite. Their gentle luminescence softens the stark lines of corporate strategy, infusing the space with charm and creative warmth.',
        o.purpose = 'To enhance the atmosphere of the innovation suite, creating a visually appealing and relaxed environment.',
        o.significance = 'They symbolize the fusion of creative inspiration with the rigid structure of corporate innovation, blurring the boundaries between professionalism and playful experimentation.'
    ;
MERGE (o:Object {uuid: 'object_dj_equipment'})
    ON CREATE SET
        o.name = 'DJ Equipment',
        o.description = 'The DJ equipment, borrowed from Super Hans\' silent disco business \'Quiet Riot\', is incongruously placed in the executive boardroom. Its presence underscores the clash between corporate formality and Jeremy\'s chaotic brand of innovation, and hints at a makeshift, road-worn apparatus used to unleash his \'productivity soundscape\'.',
        o.purpose = 'To play Jeremy\'s \'productivity soundscape\'',
        o.significance = 'Represents Jeremy\'s unconventional and chaotic approach to corporate innovation'
    ;
MERGE (o:Object {uuid: 'object_herman_miller_wallpaper'})
    ON CREATE SET
        o.name = 'Herman Miller Wallpaper',
        o.description = 'The Herman Miller wallpaper in the \'Disruption Chamber\' is intended to convey corporate sophistication and expensive taste, typical of modern office design. It becomes an ironic backdrop as Mark attempts to \'blend into\' it, symbolizing his desire to disappear from the unfolding absurdity.',
        o.purpose = 'Decorative, part of boardroom aesthetic',
        o.significance = 'Symbol of corporate rebranding and superficiality, and Mark\'s desire to disappear.'
    ;
MERGE (o:Object {uuid: 'object_productivity_soundscape'})
    ON CREATE SET
        o.name = 'Productivity Soundscape',
        o.description = 'Jeremy\'s \'productivity soundscape\' is a chaotic and nonsensical mix of electronic beats, office printer sounds, and vaguely spiritual or industrial noises. Marketed as \'scientifically-engineered\' after extensive research, it embodies the corporate world\'s susceptibility to buzzwords and pseudo-scientific jargon despite its incoherent composition.',
        o.purpose = 'To improve workplace productivity (supposedly)',
        o.significance = 'Represents Jeremy\'s delusional \'innovation\' and the corporate buzzword culture.'
    ;
MERGE (o:Object {uuid: 'object_chemical_brothers_meets_whale_sounds_playlist'})
    ON CREATE SET
        o.name = '\'Chemical Brothers meets whale sounds\' playlist',
        o.description = 'Mark\'s internal description of Jeremy\'s \'productivity soundscape\' as a \'Chemical Brothers meets whale sounds playlist\' captures the perceived ridiculousness and jarring nature of Jeremy\'s sonic experiment. It underscores the disconnect between grandiose artistic claims and the harsh auditory reality.',
        o.purpose = 'Mark\'s cynical interpretation of Jeremy\'s music',
        o.significance = 'Represents Mark\'s cynicism and the perceived absurdity of Jeremy\'s musical creation'
    ;
MERGE (o:Object {uuid: 'object_chaotic_sound_blend'})
    ON CREATE SET
        o.name = 'Chaotic Sound Blend',
        o.description = 'The \'chaotic blend of electronic beats, office printer sounds, and what might be Buddhist chants or a malfunctioning air conditioning unit\' defines the auditory experience of Jeremy\'s \'productivity soundscape\'. It emphasizes the incoherent, jarring nature of the music, sharply contrasting with his grandiose claims.',
        o.purpose = 'To create a \'disruptive\' and \'authentically digital\' sound',
        o.significance = 'Illustrates the chaotic and nonsensical nature of Jeremy\'s pitch'
    ;
MERGE (o:Object {uuid: 'object_pret_sandwich_artisan_career'})
    ON CREATE SET
        o.name = 'Pret Sandwich Artisan Career',
        o.description = 'The idea of working at Pret and becoming a \'sandwich artisan\' is a fleeting fantasy in Mark\'s internal monologue, symbolizing a desperate desire to escape the pressures of corporate life for a simpler, more tangible form of labor.',
        o.purpose = 'Hypothetical career option for Mark',
        o.significance = 'Represents Mark\'s despair and desire for escape from corporate life'
    ;
MERGE (o:Object {uuid: 'object_french_foreign_legion_recruitment'})
    ON CREATE SET
        o.name = 'French Foreign Legion Recruitment',
        o.description = 'The thought of joining the French Foreign Legion is another hyperbolic escape fantasy in Mark\'s internal monologue, signifying his extreme professional despair and desire to abandon his corporate aspirations in favor of a life of physical hardship and anonymity.',
        o.purpose = 'Hypothetical career option for Mark',
        o.significance = 'Represents Mark\'s extreme desire for escape and hopelessness'
    ;
MERGE (o:Object {uuid: 'object_whale_sounds'})
    ON CREATE SET
        o.name = 'Whale Sounds',
        o.description = 'The mention of \'whale sounds\' as a component of Jeremy\'s \'productivity soundscape\' highlights their role in contributing to the overall absurdity and New Age pretentiousness of his musical experiment. Associated with relaxation, their inclusion alongside electronic beats underscores the chaotic and ill-conceived nature of the creation.',
        o.purpose = 'Part of Jeremy\'s soundscape (perceived by Mark)',
        o.significance = 'Contributes to the perceived absurdity of Jeremy\'s music'
    ;
MERGE (o:Object {uuid: 'object_mindcoin_laptop'})
    ON CREATE SET
        o.name = 'Hacked MindCoin Laptop',
        o.description = 'This battered laptop sits on the cluttered kitchen table, its screen aglow with remnants of the hacked MindCoin cryptocurrency project. Surrounded by scattered printouts detailing blockchain theories and meditation app concepts, it bears the marks of ceaseless, experimental coding sessions that fuse disparate digital realms.',
        o.purpose = 'To display the hacked cryptocurrency project \'MindCoin\' and serve as the creative hub for Super Hans\' innovative coding sessions.',
        o.significance = 'Symbolizes the merging of technological misadventure and entrepreneurial aspiration in the corporate underbelly, highlighting disruptive and unpredictable digital ambitions.'
    ;
MERGE (o:Object {uuid: 'object_tea_set'})
    ON CREATE SET
        o.name = 'Tea Set',
        o.description = 'A modest tea set comprising a well-worn teapot and matching, slightly chipped cups. It stands on display, providing a tangible sense of homeliness and calm amidst the surrounding technological and corporate chaos.',
        o.purpose = 'To provide a practical means for tea preparation, symbolizing a moment of calm and domestic respite.',
        o.significance = 'Offers a grounding counterpoint to high-stakes digital experimentation and disruptive corporate schemes.'
    ;
MERGE (o:Object {uuid: 'object_warm_white_wine'})
    ON CREATE SET
        o.name = 'Warm White Wine',
        o.description = 'A sad, lukewarm beverage that reflects a state of dejection and resignation. It visually encapsulates Mark\'s feelings of neglect and low spirits, marked by its untemperate condition compared to celebratory drinks.',
        o.purpose = 'To be drunk by Mark in a state of despair.',
        o.significance = 'Serves as a symbol of Mark\'s dejection and low spirits, reinforcing his sense of being overlooked and undervalued.'
    ;
MERGE (o:Object {uuid: 'object_drinks'})
    ON CREATE SET
        o.name = 'Drinks',
        o.description = 'An unspecified assortment of celebratory beverages consumed by Jeremy and Super Hans. The drinks, while not detailed in type, mark a tone of festivity and shared triumph within the narrative.',
        o.purpose = 'To fuel Jeremy and Super Hans\' celebration.',
        o.significance = 'Represent celebration and shared success, emphasizing the contrast between their buoyant mood and Mark\'s despondence.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_lanyard'})
    ON CREATE SET
        o.name = 'MetricShift Lanyard',
        o.description = 'An inexplicable and ironic accessory that hangs around Super Hans\' neck, its presence unaccounted for and serving as a visual gag. It underscores the absurdity of corporate infiltration in unexpected spaces.',
        o.purpose = 'Unclear, primarily serving a decorative and ironic function.',
        o.significance = 'Acts as an ironic symbol of corporate reach and absurdity, hinting at the random intersections between low-life culture and high-end corporate branding.'
    ;
MERGE (o:Object {uuid: 'object_phone'})
    ON CREATE SET
        o.name = 'Phone',
        o.description = 'Mark\'s phone, which buzzes with notifications and serves as the conduit for unwelcome corporate news. Its presence amplifies the tension by highlighting the inescapable intrusion of the corporate world.',
        o.purpose = 'To receive LinkedIn notifications and deliver critical news.',
        o.significance = 'Acts as a symbol of corporate intrusion and anxiety, delivering professional updates that disrupt personal moments.'
    ;
MERGE (o:Object {uuid: 'object_linkedin_notification'})
    ON CREATE SET
        o.name = 'LinkedIn Notification',
        o.description = 'A digital alert on Mark\'s phone detailing Steve from accounts\' endorsement of Jeremy for \'Digital Transformation\' and \'Change Management.\' This notification is a concise trigger for Mark\'s ensuing despair.',
        o.purpose = 'To inform Mark of Steve\'s LinkedIn endorsement of Jeremy.',
        o.significance = 'Serves as a catalyst for Mark\'s despair, highlighting the absurdity and impact of corporate validation.'
    ;
MERGE (l:Location {uuid: 'location_mark_bedroom_apollo_house_croydon'})
    ON CREATE SET
        l.name = 'Mark\'s Bedroom - Apollo House, Croydon',
        l.description = 'Mark\'s Bedroom is a personal sanctuary that doubles as a corporate war room. Despite its cramped dimensions, the space is emotionally charged with personal and professional dichotomies: certificates and a heavily used HP laptop sit alongside quirky personal attire like M&S boxers paired with a TM Lewin shirt. Bathed in early morning light, the bedroom within Apollo House in Croydon reflects Mark\'s struggle to balance professional ambition with personal authenticity.',
        l.type = 'Apartment/Bedroom'
    ;
MERGE (l:Location {uuid: 'location_living_room_apollo_house'})
    ON CREATE SET
        l.name = 'Living Room - Apollo House',
        l.description = 'The living room in Apollo House is a cluttered, chaotic space reflecting the disorganised lives of Mark and Jeremy. Scattered empty Red Bull cans and printouts of Gary Vaynerchuk quotes evoke a frenetic, energy-fueled atmosphere, while a cracked mirror subtly symbolizes Jeremy\'s fractured self-perception. This room, serving as Jeremy\'s makeshift stage for practicing his corporate pitch, underscores the contrast between grand ambitions and mundane reality.',
        l.type = 'Apartment/Living Room'
    ;
MERGE (l:Location {uuid: 'location_uncle_accounting_firm_office'})
    ON CREATE SET
        l.name = 'Uncle\'s Accounting Firm Office',
        l.description = 'The office of Jeremy\'s uncle\'s accounting firm is an unremarkable, typical office environment filled with standard office equipment sounds. It is noted as the location where Jeremy recorded the sounds of an office printer while under the influence of ketamine, highlighting the stark contrast between the ordinary corporate setting and Jeremy\'s unconventional pursuits.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
    ON CREATE SET
        l.name = 'MetricShift Digital Solutions HQ - Canary Wharf Innovation Suite',
        l.description = 'The Canary Wharf Innovation Suite is an open-plan office space on the 14th floor of the MetricShift Digital Solutions headquarters. Dubbed the \'Ideation Zone\', it features futuristic design elements such as fairy lights outlining expansive whiteboards filled with corporate buzzwords, kombucha stations, and fruit-infused water dispensers. The space encapsulates a blend of creative collaboration and traditional corporate structure.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_metricshift_executive_boardroom_disruption_chamber'})
    ON CREATE SET
        l.name = 'MetricShift Executive Boardroom - \'The Disruption Chamber\'',
        l.description = 'Rebranded as \'The Disruption Chamber\', this boardroom is designed to convey modern, forward-thinking corporate culture. Despite its buzzword-laden title, it remains recognizably a boardroom for high-stakes meetings and presentations. In the scene, it transforms into a stage for Jeremy\'s unusual performance, where the juxtaposition of DJ equipment with traditional corporate furniture creates an atmosphere of theatrical corporate absurdity.',
        l.type = 'Boardroom/Office'
    ;
MERGE (l:Location {uuid: 'location_mark_and_jeremy_flat_kitchen'})
    ON CREATE SET
        l.name = 'Mark and Jeremy\'s Flat - Kitchen',
        l.description = 'The kitchen in Mark and Jeremy\'s flat is a modest yet charged space that marries everyday domesticity with the residue of ambitious schemes. Its well-worn walls, adorned with scattered notes and printouts, evoke a lived-in home where disruptive ideas and entrepreneurial fervor subtly intersect with mundane life.',
        l.type = 'Apartment/Kitchen'
    ;
MERGE (l:Location {uuid: 'location_fox_and_goose_pub_croydon_high_street'})
    ON CREATE SET
        l.name = 'The Fox & Goose Pub - Croydon High Street',
        l.description = 'The Fox & Goose Pub on Croydon High Street is a typical local pub offering a blend of traditional warmth and understated ambience. In the scene, it hosts a corner table where Mark, Jeremy, and Super Hans converge, underscoring a setting where muted despair meets celebratory revelry, and the mundane local life contrasts with Jeremy\'s grand, outlandish aspirations.',
        l.type = 'Pub'
    ;
MERGE (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    ON CREATE SET
        o.name = 'MetricShift Digital Solutions',
        o.description = 'MetricShift Digital Solutions, though not explicitly mentioned by name in dialogue, is indirectly represented by Super Hans\' inexplicable MetricShift lanyard. This suggests the company\'s brand is permeating even the fringes of Croydon\'s social scene, symbolizing a looming corporate presence in Mark\'s consciousness and reflecting the absurdity of its chaotic innovation.',
        o.sphere_of_influence = 'Digital Transformation, Corporate Buzzwords, Questionable Innovation'
    ;
MERGE (o:Organization {uuid: 'org_northern_rock'})
    ON CREATE SET
        o.name = 'Northern Rock',
        o.description = 'Northern Rock was a British bank that collapsed during the financial crisis of 2008. Referenced by Mark as a symbol of outdated and failed paradigms, it serves as a cultural shorthand for obsolescence and the dangers of clinging to outdated models, especially in the context of corporate trends and economic downturn.',
        o.sphere_of_influence = 'UK Finance (historical)'
    ;
MERGE (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    ON CREATE SET
        o.name = 'Johnson Dynamic Solutions',
        o.description = 'Johnson Dynamic Solutions is highlighted by the presence of its CEO, Alan Johnson, in the context of a potential merger with MetricShift. The company’s focus on dynamic and adaptable business solutions aligns with the contemporary corporate approach to innovation and disruption, portraying a superficially synergistic potential in the business landscape.',
        o.sphere_of_influence = 'Corporate Solutions, Mergers & Acquisitions (implied)'
    ;
MERGE (o:Organization {uuid: 'org_linkedin'})
    ON CREATE SET
        o.name = 'LinkedIn',
        o.description = 'LinkedIn is the ubiquitous professional networking platform that carries the weight of digital corporate presence. In this scene, it highlights the performative nature of online professional validation, tracking careers and serving as an impersonal messenger of corporate anxieties through digital endorsements and interactions.',
        o.sphere_of_influence = 'Professional Networking, Online Endorsements, Career Tracking'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    ON CREATE SET
        ep.title = 'Episode One - The Networking Event',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'A Morning of Corporate Anxiety',
        s.description = 'In the early morning hours of 6:47 AM, Mark Corrigan’s bedroom at Apollo House in Croydon becomes an arena of internal corporate panic and reluctant self-reflection. The space is cluttered with personal and professional memorabilia—a worn IKEA Markus desk chair, a haphazard display of the MetricShift Digital \'Employee of the Month (August 2023)\' certificate, and a Dartmouth Business Studies diploma that hangs askew. Mark, dressed in a TM Lewin shirt and M&S boxers, is visibly anxious as he toggles between his LinkedIn feed and a bleak \'Career Crisis Management\' spreadsheet on his HP laptop. The atmosphere is heavy with competitive dread and a sense of impending professional inadequacy. This scene sets the stage for the comedic yet poignant exploration of Mark’s struggle with his corporate identity and self-worth, themes that resonate deeply within the broader narrative of workplace anxiety and personal ambition.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_mark_bedroom_apollo_house_croydon'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'The Digital Dilemma',
        e.description = 'In this opening event, we witness Mark in a moment of private despair as he battles his inner demons at his HP laptop. Seated in his familiar IKEA Markus desk chair, Mark’s anxiety spills over through his internal monologue as he scolds the corporate world for its ruthless nature. He fixates on the latest post from Steve in accounts, whose unexpected professional advancement sends shockwaves through Mark’s fragile ego. The scene is heavily symbolic of the eternal conflict between self-worth and professional validation, and it underscores the relentless pressure of modern corporate life. Mark’s frustration is palpable as he grapples with the stark reality of an evolving digital landscape where reputations are made and unmade in moments.',
        e.sequence = 1,
        e.key_dialogue = ["God, Steve from accounts has done another 'humbled to announce' post. He's got a Microsoft Excel certification. The man who logged into his own LinkedIn through the company Twitter last month is now officially more qualified than me. The digital revolution is eating its children."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Jeremy\'s Entrance and the Disruptive Pitch',
        e.description = 'In a burst of uncontained energy, Jeremy Usbourne crashes into Mark’s sanctuary, heralding his latest scheme to upend the corporate world. Dressed in Mark’s cherished interview suit—a piece with a storied past from job interviews and disciplinary hearings—Jeremy’s impromptu arrival is painted with flamboyant self-assurance and disruptive creativity. He gleefully announces his newfound mastery of the LinkedIn algorithm and his conviction that his sonic optimization concept, endorsed by even Super Hans, could revolutionize corporate mindfulness. This candid and chaotic intrusion not only amplifies the absurdity of their world but also lays bare the contrasting approaches of cautious conformity and reckless innovation. The clash of ideals and the raw emotion in their dialogue signal a turning point in the narrative, highlighting the tension between established corporate norms and disruptive creative aspirations.',
        e.sequence = 2,
        e.key_dialogue = ["Mark! Mark! The corporate world won't know what hit it! I've mastered the LinkedIn algorithm!", "How do I look? Professional enough for the MetricShift Innovation Sundowner? I've been practicing my pitch all morning.", "That's my interview suit from the Johnson account pitch. It was in the box marked 'Career Emergency Kit - Do Not Touch Under Any Circumstances.'", "Yeah, well, desperate times, desperate measures. Super Hans says my sonic optimization concept could be the next mindfulness."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Jeremy\'s Delusional Pitch Practice',
        s.description = 'The living room of Mark and Jeremy\'s flat is a chaotic testament to Jeremy\'s ambition and Mark\'s anxiety. Empty Red Bull cans litter the surfaces, alongside printouts of motivational Gary Vaynerchuk quotes, creating a bizarre shrine to entrepreneurial hustle.  Sunlight struggles to penetrate the grimy Croydon windows, casting a weak light on the scene. In the center stands Jeremy, awkwardly adorned in Mark\'s ill-fitting interview suit, rehearsing his corporate pitch in front of a cracked mirror, a symbol of his fractured self-image and distorted reality. The atmosphere is thick with Jeremy\'s misplaced confidence and Mark\'s simmering dread, a comedic tension building as Jeremy\'s grand delusions clash with Mark\'s grounded cynicism. This scene is narratively significant as it sets the stage for Jeremy\'s disastrous yet inexplicably successful pitch to MetricShift, highlighting the show\'s satirical take on corporate culture and the absurdity of the \'digital revolution\'.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_living_room_apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Jeremy Rehearses his \'Sonic Arts\' Pitch',
        e.description = 'Jeremy, striking a pose of corporate gravitas in Mark\'s borrowed suit, begins practicing his pitch. He gestures expansively towards the cracked mirror as if addressing a boardroom, confidently proclaiming himself a \'disruptor\' in the \'sonic arts space\'. He strings together buzzwords like \'leveraging\' and \'paradigms\', showcasing his superficial understanding of corporate jargon. He name-drops his \'critically acclaimed\' \'Sounds of the Serviced Office\' EP with utter sincerity, completely oblivious to its ridiculous premise. This rehearsed performance underscores Jeremy\'s inflated ego and his desperate attempt to appear professionally credible, setting the comedic tone for the scene.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: I'm a disruptor in the sonic arts space, leveraging unique audio paradigms to create transformative experiences. Former projects include the critically acclaimed 'Sounds of the Serviced Office' EP."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Mark\'s Internal Monologue of Horror',
        e.description = 'As Jeremy delivers his nonsensical pitch, Mark\'s internal monologue kicks in, revealing his horrified reaction. In a voiceover, Mark exposes the ludicrous truth behind Jeremy\'s \'critically acclaimed\' EP – it was just recordings of his uncle\'s office printer, captured during a ketamine-induced haze. Mark\'s cynical internal commentary highlights the stark contrast between Jeremy\'s delusional self-promotion and the embarrassing reality of his \'artistic\' endeavors.  He anticipates the impending disaster of Jeremy presenting this to Charlotte Walsh-Henderson, drawing a dramatic comparison to Brutus betraying Caesar, amplifying Mark\'s sense of foreboding and comedic despair.',
        e.sequence = 2,
        e.key_dialogue = ["MARK (V/O): He recorded the office printer at his uncle's accounting firm while high on ketamine. And now he's going to present it to Charlotte Walsh-Henderson as a productivity solution. This must be how Brutus felt watching Caesar walk into the Senate."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Mark Corrects Jeremy\'s Corporate Jargon',
        e.description = 'Mark, unable to remain silent any longer, breaks into Jeremy\'s rehearsal with a pedantic correction.  He interrupts Jeremy\'s flow to mock his use of the word \'paradigm\', declaring it outdated and cliché since the financial crisis. Mark\'s interjection reveals his social awkwardness and his tendency to focus on trivialities while completely missing the larger absurdity of Jeremy\'s entire enterprise.  His attempt to inject some \'reality\' into Jeremy\'s delusion falls flat, highlighting the futility of reason against Jeremy\'s self-belief.',
        e.sequence = 3,
        e.key_dialogue = ["MARK: Jeremy, please don't say paradigm. Nobody's said paradigm since Northern Rock collapsed."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Jeremy Proclaims CEO Status Through TED Talks',
        e.description = 'Undeterred by Mark\'s criticism, Jeremy dismisses his concerns and doubles down on his self-proclaimed expertise. He boasts about his \'research\', citing TED talks and Instagram influencer Gary Vee as his sources of business acumen. Jeremy confidently asserts that these superficial engagements have already qualified him as a CEO.  This bold and unfounded claim further emphasizes Jeremy\'s delusional worldview and his belief that simply consuming online motivational content equates to genuine competence and leadership ability. It solidifies the comedic absurdity of his character and his aspirations.',
        e.sequence = 4,
        e.key_dialogue = ["JEREMY: Mark, I've done my research. I've watched three TED talks and followed Gary Vee on Instagram. I'm basically a CEO already."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Corporate Ideation: Sonic Optimization Pitch',
        s.description = 'In the transformed Ideation Zone on the 14th floor of MetricShift Digital Solutions HQ at Canary Wharf, innovation collides with corporate anxiety amidst a dazzling display of fairy lights and whiteboards bedecked with buzzwords. The ambient setting, bathed in a cool glow from the decorative lights and softened by the juxtaposition of modern tech with traditional corporate decorum, is charged with nervous energy and unspoken rivalry. Charlotte Walsh-Henderson, a battle-hardened veteran of digital transformation, confidently orchestrates the placement of kombucha stations. Nearby, Mark Corrigan lurks by a fruit-infused water station, anxiously straightening his prized LinkedIn Premium Name Badge while internally ruminating about the unfolding events. The scene encapsulates a moment of high stakes innovation meeting unexpected talent, as the promise of radical ideas and the potency of sound wave theory collide with Mark’s deep-seated insecurities about his own career trajectory. This meeting is not only a literal pitch but also a metaphor for the turbulence of modern corporate dynamics, where disruption and tradition fight for supremacy.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Tensions Lurk in the Ideation Zone',
        e.description = 'The scene opens with Mark Corrigan, a figure mired in internal conflict, quietly hovering by the fruit-infused water station. His actions, including the meticulous straightening of his LinkedIn Premium Name Badge, speak volumes of his anxiety and self-doubt as he witnesses the bold and erratic energy of the innovation space. The atmosphere is heavy with anticipation as corporate buzz and the glow of fairy lights underscore his silent dread. His internal monologue reveals his disdain and apprehension over Jeremy\'s imminent interaction with Charlotte, setting the stage for a collision of competing visions within the boardroom of digital transformation.',
        e.sequence = 1,
        e.key_dialogue = ["MARK (V/O): Oh god, he's approaching Charlotte. Don't mention the band, don't mention the ketamine sound installation at the Croydon Buddhist Centre...", "MARK (V/O): The grown-ups are giving Jeremy real responsibilities. This must be what it felt like when Caligula made his horse a senator."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Pitch and Corporate Validation',
        e.description = 'In the heart of the Ideation Zone, the tension takes a dynamic turn as the conversation shifts to innovation and disruptive potential. Charlotte Walsh-Henderson, ever the pragmatic corporate visionary, engages directly with Jeremy Usbourne, probing into his claims about \'sonic optimization\' in the workplace. Jeremy, unfiltered and enthusiastic, confidently outlines his revolutionary idea that blends mindfulness, blockchain technology, and the energetic pulse of sound frequencies. His pitch is punctuated by quirky bravado and hints of unorthodox inspiration. This exchange not only serves as a pivotal narrative moment turning the tide of the evening but also crystallizes the clash of traditional corporate order against avant-garde experimentation. As their dialogue builds the narrative momentum, Mark’s internal disquiet deepens, symbolizing the personal stakes tied to professional obsolescence.',
        e.sequence = 2,
        e.key_dialogue = ["CHARLOTTE: So, Jeremy, Mark tells me you're in the sonic optimization space? We've been looking for innovative solutions since the Great Algorithm Crisis of '23.", "JEREMY: Absolutely. We're harnessing alpha waves and beta frequencies to revolutionize workplace productivity. It's like mindfulness meets blockchain meets that feeling when you've just had exactly the right amount of drugs... I mean, coffee."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Sonic Sabotage or Corporate Symphony? Jeremy\'s Pitch to Johnson',
        s.description = 'Within the sterile, newly christened \'Disruption Chamber\' – MetricShift\'s executive boardroom – Jeremy sets up his dubious DJ equipment, a relic from Super Hans\' silent disco ventures. Alan Johnson, the CEO of Johnson Dynamic Solutions, a key figure in a potential MetricShift merger, observes with genuine, if misplaced, interest. Mark, a picture of corporate anxiety, attempts to meld into the expensive Herman Miller wallpaper, a desperate act of camouflage against the impending social and professional catastrophe he foresees. The air crackles with a mixture of corporate expectation and Jeremy\'s chaotic, unbridled energy. The scene unfolds during business hours, a high-stakes presentation in a room designed to exude cutting-edge innovation, setting the stage for a pivotal moment where Jeremy\'s ludicrous idea unexpectedly gains traction, amplifying Mark\'s career anxieties and satirizing corporate buzzword culture and the fear of professional obsolescence.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_executive_boardroom_disruption_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Jeremy Prepares to Unleash Sonic Chaos',
        e.description = 'Jeremy, radiating unfounded confidence, begins setting up his antiquated DJ equipment in the \'Disruption Chamber\'. Alan Johnson, CEO of Johnson Dynamic Solutions, watches with curious eyes, seemingly intrigued by the unfolding spectacle. Meanwhile, Mark, consumed by dread, tries to become one with the Herman Miller wallpaper, his physical actions mirroring his desire to disappear and avoid the looming social disaster. The scene\'s tension mounts as Jeremy\'s preparations hint at the imminent auditory assault, establishing the central conflict: Jeremy\'s absurd pitch colliding with the serious, corporate environment.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Croydon Buddhist Centre\'s Dubious Research Claim',
        e.description = 'Jeremy launches into his sales pitch, introducing his \'productivity soundscape\' as a \'scientifically-engineered\' marvel, boldly claiming it was \'developed through extensive research at the Croydon Buddhist Centre\'. This outlandish claim immediately undercuts any semblance of professionalism, highlighting Jeremy\'s delusional self-belief. In voiceover, Mark\'s inner monologue reveals his escalating panic and his fantastical escape plan: abandoning his corporate life for the simple existence of a Pret sandwich artisan. This moment underscores the stark comedic contrast between Jeremy\'s fabricated expertise and Mark\'s painfully realistic anxieties about his career trajectory.',
        e.sequence = 2,
        e.key_dialogue = ["JEREMY: What you're about to experience is a scientifically-engineered productivity soundscape, developed through extensive research at the Croydon Buddhist Centre.", "MARK (V/O): He's going to play his 'Chemical Brothers meets whale sounds' playlist to the entire senior management team. I wonder if Pret is still hiring? I could work my way up to sandwich artisan, live a simple life of honest toil..."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Corporate Endorsement of Sonic Mayhem',
        e.description = 'Jeremy unleashes his \'productivity soundscape\', a chaotic and jarring blend of electronic music reminiscent of the Chemical Brothers, interspersed with jarring office printer sounds and indistinct chanting that could be Buddhist or simply a malfunctioning air conditioner. This auditory assault confirms Mark\'s worst fears. In a shocking twist of corporate absurdity, Alan Johnson reacts with unexpected enthusiasm, declaring the chaotic soundscape \'exactly what we need\' – \'raw, disruptive, authentically digital\'. He then instructs Charlotte to initiate a \'full rollout\', effectively endorsing Jeremy\'s nonsensical project and propelling him towards corporate success. Mark, in horrified voiceover, contemplates even more extreme escape routes, such as joining the French Foreign Legion, as he witnesses Jeremy\'s improbable corporate triumph.',
        e.sequence = 3,
        e.key_dialogue = ["JOHNSON: This is exactly what we need. Raw, disruptive, authentically digital. Charlotte, sign him up for the full rollout.", "MARK (V/O): Jeremy's going to get a corporate job before me. I'm going to end up working in his sonic optimization department. Maybe the French Foreign Legion is still recruiting?"]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Crypto-Mindfulness in the Kitchen',
        s.description = 'In the cluttered yet intimate setting of Mark and Jeremy\'s flat kitchen, the air is charged with a mix of innovation and absurd corporate ambition. The room is alive with the muted hum of everyday appliances juxtaposed against the frenetic energy of entrepreneurial dreams. Jeremy busies himself by making tea with an excitement that belies the routine of his surroundings, while Super Hans sits at the kitchen table surrounded by strewn printouts about blockchain and meditation apps. His laptop stubbornly displays the remnants of his hacked cryptocurrency project, \'MindCoin.\' The scene exudes a curious blend of humor and desperation, where grand ideas about merging corporate sound therapy with cutting-edge blockchain technology are hatched. This setting, marked by worn countertops and scattered tech paraphernalia, represents a microcosm of modern startup culture battling both fiscal and existential crises. The tension between creative chaos and pragmatic restraint colors every moment, as old ambitions run headlong into new risks.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_mark_and_jeremy_flat_kitchen'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'The Pitching of SonicChain',
        e.description = 'The scene opens with Jeremy energetically preparing tea in the cramped kitchen while Super Hans is deeply absorbed in his digital mess of a laptop, which shows the decay of his cryptocurrency project, \'MindCoin.\' Amidst scattered blockchain printouts and notes on meditation apps, Super Hans unveils his big plan to merge his failed mindfulness platform with Jeremy’s idea of corporate sound therapy into a new venture called \'SonicChain.\' This moment establishes the ambitious, albeit delusional, dreams that underpin their joint entrepreneurial endeavor. The dialogue reveals both the naïveté and a desperate hope to shake the foundations of the corporate world with innovative technology and unconventional practices.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is it, Jez. This is the big one. We combine your corporate sound therapy thing with what's left of my mindfulness platform. Call it 'SonicChain.' The suits'll love it.", "JEREMY: Hans, you're a genius. We could add NFTs somehow. Like, people buy the right to different frequency ranges."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Mark\'s Entrance and Corporate Concern',
        e.description = 'Just as the enthusiastic partnership between Jeremy and Super Hans starts to crystallize, Mark enters the scene. Still wearing his MetricShift lanyard, Mark immediately brings the weight of corporate responsibility and anxiety into the relaxed chaos of the kitchen. His arrival casts a shadow on the free-wheeling brainstorming session as he hints at the dangers of entangling their rogue ideas with corporate interests. Mark’s inquiry is laced with both skepticism and resignation, as he implies that Super Hans’ wild schemes may soon be pitched to MetricShift, a move that could upend his precariously balanced career. This event serves as a turning point, grounding the exuberance of his flatmates with the pressures of the outside corporate world.',
        e.sequence = 2,
        e.key_dialogue = ["MARK: Oh good, Super Hans is here. I suppose you'll be wanting to pitch your crypto-mindfulness app to MetricShift as well?"]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'The Vision Beyond the Crisis',
        e.description = 'In response to Mark’s concern, Super Hans dismisses the mundane constraints of corporate opportunity with a visionary yet absurd reply that amplifies the surreal ambitions of the duo. He boldly asserts that a missing element in corporate meditation is the blockchain, humorously coupled with the need for proper drugs—a statement that encapsulates the chaotic melding of counterculture ideals with corporate jargon. Mark’s internal monologue during this exchange reveals his mounting anxiety and foreboding about the implications of their reckless ideas, as he envisions Super Hans’s ludicrous ascent to corporate power. This event layers levity over despair, highlighting the often absurd divide between corporate expectations and the unpredictable nature of creative rebellion.',
        e.sequence = 3,
        e.key_dialogue = ["SUPER HANS: Mark, Mark, Mark. Think bigger. What's the one thing missing from corporate meditation? Exactly - the blockchain. That, and proper drugs. But we'll sort that out in phase two.", "MARK (V/O): Super Hans is going to end up on the board of directors. This is how the financial crisis started."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Triumphant Delusions and Bitter Wine at the Fox & Goose',
        s.description = 'In the dimly lit, familiar surroundings of The Fox & Goose pub, a stark contrast in moods unfolds. Jeremy, buoyed by his improbable corporate success, is in high spirits, celebrating with Super Hans. Super Hans, sporting a MetricShift lanyard as a bizarre trophy, is equally enthusiastic about Jeremy\'s prospects, already envisioning vast, perhaps delusional, expansions of his sound-based \'solutions\'. Mark, meanwhile, sits in dejected silence, nursing a glass of warm white wine at a corner table. The pub\'s usual low hum of conversation and clinking glasses provides a backdrop to Mark\'s internal turmoil, as he witnesses Jeremy\'s accidental triumph and the further indignity of corporate validation from someone like Steve from accounts. The evening air is thick with the scent of stale beer and fried food, mirroring the stale taste of Mark\'s career prospects.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_fox_and_goose_pub_croydon_high_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Super Hans Predicts Global Sonic Domination',
        e.description = 'Super Hans, radiating misplaced confidence and inexplicably wearing a MetricShift lanyard, leans in conspiratorially towards Jeremy. He declares Jeremy\'s corporate sound therapy venture to be potentially even bigger than his previous, ill-fated crypto-mindfulness app, which he casually mentions was \'hacked by the Russians\'. This sets the tone for their conversation, immediately highlighting the grandiose and slightly unhinged nature of their ambitions, rooted in Jeremy\'s recent, accidental corporate \'success\'. Super Hans\'s lanyard further underscores the absurdity of the situation, a physical manifestation of their unlikely infiltration of the corporate world.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is gonna be massive, Jez. Could be bigger than my crypto-mindfulness app. Before it got hacked by the Russians."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Jeremy Envisions Worldwide Corporate Soundscapes',
        e.description = 'Jeremy, fueled by Super Hans\'s enthusiasm and his own burgeoning sense of corporate validation, enthusiastically embraces the idea of global expansion. He envisions his \'scientifically optimized sound solutions\' being adopted by offices worldwide, positioning them as a desirable, almost addictive, workplace enhancement. His comparison to \'legal drugs\' reveals his fundamental misunderstanding of corporate needs and the true nature of his appeal to MetricShift, while also highlighting his characteristic overblown self-belief and entrepreneurial delusion.',
        e.sequence = 2,
        e.key_dialogue = ["JEREMY: I'm thinking global, Hans. Every office in the world, listening to my scientifically optimized sound solutions. It's basically legal drugs."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Mark\'s Voiceover: The Absurdity of Jeremy\'s Ascent',
        e.description = 'Mark\'s internal monologue breaks through the celebratory atmosphere, revealing his profound bewilderment and simmering resentment. In a voiceover, he reflects on Jeremy\'s unlikely rise, attributing it not to competence but to a fundamental misunderstanding of the corporate world. He uses a darkly humorous analogy of a cat surviving a fall due to its lack of understanding of physics, highlighting the irrational and almost accidental nature of Jeremy\'s success, and the frustrating logic of the corporate world that seems to reward incompetence and delusion.',
        e.sequence = 3,
        e.key_dialogue = ["MARK (V/O): Jeremy's become everything I ever wanted to be, by completely misunderstanding everything about the corporate world. Maybe that's the secret? Like how a cat can survive a fall from a higher building than a human because it doesn't understand physics."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'LinkedIn Notification: The Ultimate Corporate Endorsement',
        e.description = 'Mark\'s simmering despair is punctuated by a jarring digital intrusion. His phone buzzes with a LinkedIn notification, delivering the final, humiliating blow: Steve from accounts, the epitome of corporate mediocrity, has endorsed Jeremy for \'Digital Transformation\' and \'Change Management\'. This notification serves as a stark symbol of Mark\'s utter failure in the corporate arena and the perverse nature of success, as someone he considers utterly unqualified is publicly validated for the very skills Mark desperately seeks to master. The phone buzz is a small, sharp sound that cuts through the pub\'s background noise, amplifying Mark\'s internal sense of defeat.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_6_5'})
    ON CREATE SET
        e.title = 'Mark\'s Resigned Call for Another Drink',
        e.description = 'Completely deflated and overwhelmed by the absurdity of the situation and the final sting of Steve\'s LinkedIn endorsement, Mark utters a simple, resigned statement. \'I need another drink\' is not a celebratory toast but a defeated acknowledgement of his situation. It\'s a quiet plea for oblivion in the face of his professional humiliation, a desire to numb the pain of witnessing Jeremy\'s undeserved success and his own continued failure. The warm white wine, already a symbol of his pathetic attempts at sophistication, becomes a desperate solace.',
        e.sequence = 5,
        e.key_dialogue = ["MARK: I need another drink."]
    ;
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_from_accounts'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_ikea_markus_chair'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_hp_laptop'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_metricshift_employee_certificate'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dartmouth_business_studies_diploma'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_interview_suit'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_cracked_mirror'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_red_bull_cans'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_gary_vaynerchuk_quotes'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sounds_of_the_serviced_office_ep'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_kombucha_stations'}),
          (a:Agent {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dj_equipment'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_herman_miller_wallpaper'}),
          (a:Agent {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_productivity_soundscape'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_chemical_brothers_meets_whale_sounds_playlist'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne (interpreted by Mark)'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_chaotic_sound_blend'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_pret_sandwich_artisan_career'}),
          (a:Agent {uuid: 'agent_mark_corrigan (imagined)'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_french_foreign_legion_recruitment'}),
          (a:Agent {uuid: 'agent_mark_corrigan (imagined)'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_whale_sounds'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne (using pre-existing sounds)'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_mindcoin_laptop'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_warm_white_wine'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_drinks'}),
          (a:Agent {uuid: 'agent_jeremy_usbourne'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_metricshift_lanyard'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_phone'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_linkedin_notification'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_from_accounts'}),
          (o:Organization {uuid: 'org_metricshift_digital_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hp_laptop_event_1_1'})
    ON CREATE SET
        oi.description = 'The HP laptop serves as Mark\'s connection to the digital world, displaying currents of LinkedIn updates and corporate metrics that intensify his anxieties.',
        oi.status_before = 'Glowing steadily with the cold light of digital connectivity, open to multiple tabs displaying professional data.',
        oi.status_after = 'Continues to function as a silent witness to Mark\'s internal conflict, its screen reflecting the harsh realities of his corporate life.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hp_laptop'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_employee_certificate_event_1_1'})
    ON CREATE SET
        oi.description = 'This certificate, displaying \'Employee of the Month (August 2023)\', hangs askew, symbolizing an accolade that starkly contrasts with Mark\'s own feelings of inadequacy.',
        oi.status_before = 'Displayed as a proud emblem of a fleeting corporate achievement.',
        oi.status_after = 'Appears askew and somewhat neglected, mirroring Mark\'s inner turmoil about his professional recognition.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_employee_certificate'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dartmouth_business_studies_diploma_event_1_1'})
    ON CREATE SET
        oi.description = 'The Dartmouth Business Studies diploma looms in the background, a relic of former academic success now overshadowed by contemporary professional pressures.',
        oi.status_before = 'Hung with faded elegance as a symbol of past achievements.',
        oi.status_after = 'Collecting dust, it silently underscores the erosion of Mark\'s former sense of accomplishment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dartmouth_business_studies_diploma'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ikea_markus_chair_event_1_1'})
    ON CREATE SET
        oi.description = 'The IKEA Markus desk chair supports Mark physically as well as symbolically, bearing the weight of his daily anxieties and long hours of corporate strategizing.',
        oi.status_before = 'A sturdy, well-used chair showing signs of wear from countless hours of work.',
        oi.status_after = 'Creaking under the strain of Mark\'s emotional and physical tension, it remains a steadfast but silent observer of his internal struggle.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ikea_markus_chair'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_interview_suit_event_1_2'})
    ON CREATE SET
        oi.description = 'The interview suit is dramatically donned by Jeremy, who sees it as his professional armor for the MetricShift Innovation Sundowner. He wears it to project an image of corporate readiness, completely missing the irony and inappropriateness of its use. For Mark, the suit\'s appearance on Jeremy is a sacrilege, a symbol of Jeremy\'s cluelessness and a violation of Mark\'s carefully constructed professional anxieties.',
        oi.status_before = 'Stored in a box labeled \'Career Emergency Kit - Do Not Touch Under Any Circumstances\' in Mark\'s room. It was considered a last resort for critical career moments, a symbol of professional desperation and past career anxieties.',
        oi.status_after = 'Removed from its protective storage and worn by Jeremy, now imbued with Jeremy\'s chaotic and misguided energy. It\'s likely to be stretched, possibly stained, and carrying a faint aroma of weed, losing its symbolic value of \'career emergency\' and becoming an emblem of Jeremy\'s absurd corporate aspirations.'
    WITH oi
    MATCH (o:Object {uuid: 'object_interview_suit'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Mark is seated at his HP laptop on his worn IKEA Markus desk chair, dressed in M&S boxers and a TM Lewin shirt, visibly absorbed in toggling between LinkedIn and his Career Crisis Management spreadsheet.',
        ap.emotional_state = 'Overwhelmed with anxiety and self-doubt, his internal monologue reveals a deep sense of frustration and despair fueled by corporate achievements that seem to undermine his self-worth.',
        ap.emotional_tags = ["Overwhelmed with anxiety", "self-doubt, his internal monologue reveals a deep sense of frustration", "despair fueled by corporate achievements that seem to undermine his self-worth."],
        ap.active_plans = ["Monitor corporate updates on LinkedIn to gauge his standing relative to peers", "Reassess his career progress through the metrics displayed on his spreadsheet"],
        ap.beliefs = ["Corporate validation is transient and often misleading", "Professional success is a constant battle against internal insecurities"],
        ap.goals = ["Achieve a level of professional recognition that confirms his value", "Overcome the paralyzing effects of his own self-doubt in the corporate arena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy bursts into Mark\'s bedroom, striking a confident pose in Mark\'s interview suit, wristbands still on from past festivals, and a \'Web3 Visionary\' pin gleaming. He\'s rehearsing his pitch, radiating self-assuredness and obliviousness to the professional norms he\'s flouting.',
        ap.emotional_state = 'Excited and supremely confident, bordering on delusional. He believes he\'s on the cusp of corporate success and is thrilled by the prospect of disrupting the \'corporate world\'.',
        ap.emotional_tags = ["Excited", "supremely confident, bordering on delusional. He believes he's on the cusp of corporate success", "is thrilled by the prospect of disrupting the 'corporate world'."],
        ap.active_plans = ["To attend the MetricShift Innovation Sundowner.", "To deliver his 'sonic optimization' pitch.", "To impress corporate attendees with his disruptive ideas."],
        ap.beliefs = ["He believes his 'sonic optimization concept' is revolutionary and will be a corporate sensation.", "He thinks he has mastered the 'LinkedIn algorithm' and understands how to navigate the corporate world.", "He trusts Super Hans' endorsement of his ideas as validation of their potential."],
        ap.goals = ["To achieve corporate recognition and success.", "To secure funding or a partnership for his 'sonic optimization' venture.", "To prove his ideas are valuable and innovative within a corporate setting."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Mark is seated at his desk, clad in a professional shirt but still in his underwear, attempting to work while battling waves of anxiety. He observes Jeremy\'s dramatic entrance with a mixture of horror and weary resignation, toggling between LinkedIn and his \'Career Crisis Management\' spreadsheet, a portrait of corporate dread.',
        ap.emotional_state = 'Anxious, cynical, and deeply exasperated. He is horrified by Jeremy\'s intrusion and the sight of his precious interview suit being defiled. He feels professionally threatened and increasingly inadequate.',
        ap.emotional_tags = ["Anxious, cynical,", "deeply exasperated. He is horrified by Jeremy's intrusion", "the sight of his precious interview suit being defiled. He feels professionally threatened", "increasingly inadequate."],
        ap.active_plans = ["To manage his escalating career crisis.", "To avoid being associated with Jeremy's chaotic antics at the Innovation Sundowner.", "To maintain a semblance of professional composure despite the surrounding absurdity."],
        ap.beliefs = ["He believes Jeremy is utterly incompetent and delusional, destined for failure.", "He sees Jeremy's corporate ambitions as a farcical misunderstanding of the professional world.", "He believes his own career is spiraling downwards, and Jeremy's antics will only worsen his situation."],
        ap.goals = ["To salvage his career and avoid further professional embarrassment.", "To distance himself from Jeremy's disruptive schemes.", "To somehow regain a sense of control and competence in his professional life."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cracked_mirror_event_2_1'})
    ON CREATE SET
        oi.description = 'The cracked mirror serves as Jeremy\'s makeshift boardroom audience, reflecting his staged persona as he practices his pitch. It amplifies his image of self-assuredness even as its imperfections mirror the underlying flaws in his performance.',
        oi.status_before = 'The mirror was already in a damaged state, its cracks hinting at a distorted view of reality.',
        oi.status_after = 'It remains unchanged physically, but its cracked surface symbolically reinforces the dissonance between Jeremy\'s ambitions and his actual capabilities.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cracked_mirror'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sounds_of_the_serviced_office_ep_event_2_1'})
    ON CREATE SET
        oi.description = 'This EP is central to Jeremy\'s pitch, as he proudly references his \'critically acclaimed\' project. It is used to bolster his claims of innovation in the sonic arts despite its laughably mundane origin.',
        oi.status_before = 'Previously, the EP was viewed as an offbeat and experimental project, not taken seriously by his peers.',
        oi.status_after = 'After being mentioned in the pitch, it is recontextualized as a symbol of creative defiance, though its inherent absurdity remains.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sounds_of_the_serviced_office_ep'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_red_bull_cans_event_2_1'})
    ON CREATE SET
        oi.description = 'The empty Red Bull cans scattered around the living room underscore the frenetic energy fueling Jeremy\'s rehearsal. They act as a physical reminder of his reliance on stimulants to maintain his over-the-top performance.',
        oi.status_before = 'The cans were already present, suggesting previous bouts of high energy and caffeine-induced bursts.',
        oi.status_after = 'They remain as a static backdrop, reinforcing the chaotic and unsustainable nature of Jeremy\'s preparation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_red_bull_cans'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gary_vaynerchuk_quotes_event_2_1'})
    ON CREATE SET
        oi.description = 'Printouts of Gary Vaynerchuk quotes are strategically placed around the room, serving as Jeremy\'s crutches for corporate inspiration. They manifest his attempt to adopt a veneer of business savvy by echoing popular buzz phrases.',
        oi.status_before = 'These printouts were already highlighted and prominently displayed, indicating Jeremy\'s selective engagement with corporate narratives.',
        oi.status_after = 'Their presence continues unchanged, yet they now underscore the superficiality of Jeremy\'s self-eradication as he recycles ready-made soundbites to boost his image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gary_vaynerchuk_quotes'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_office_printer_event_2_2'})
    ON CREATE SET
        oi.description = 'The office printer is not physically present but exists as a crucial element in Mark\'s internal monologue. It is revealed as the mundane source of the sounds for Jeremy\'s \'critically acclaimed\' EP. Mark\'s recollection of the printer highlights the stark contrast between Jeremy\'s grandiose claims and the utterly ordinary reality of his \'artistic\' process. The printer is invoked as a symbol of the ridiculousness and lack of substance behind Jeremy\'s pitch.',
        oi.status_before = 'A standard, functional office printer at Jeremy\'s uncle\'s accounting firm, performing routine printing tasks, unaware of its future role in Jeremy\'s \'sonic art\'.',
        oi.status_after = 'The office printer remains unchanged in its physical state, still performing its mundane office duties. However, in the narrative, it has been recontextualized as the embarrassing and absurd origin of Jeremy\'s \'critically acclaimed\' EP, further underscoring the comedic gap between Jeremy\'s self-perception and reality.'
    WITH oi
    MATCH (o:Object {uuid: 'object_office_printer'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sounds_of_the_serviced_office_ep_event_2_2'})
    ON CREATE SET
        oi.description = 'The \'Sounds of the Serviced Office\' EP is the central object of Jeremy\'s pitch and Mark\'s horror. Jeremy actively promotes it as \'critically acclaimed\' while Mark\'s internal monologue exposes its true, ludicrous origin - recordings of an office printer made while Jeremy was high on ketamine. The EP embodies Jeremy\'s delusion and self-promotion, and serves as the catalyst for Mark\'s escalating anxiety and cynical commentary. It\'s the core subject of the impending presentation disaster that Mark foresees.',
        oi.status_before = 'Presented by Jeremy as a legitimate and \'critically acclaimed\' artistic project, ready to be leveraged for corporate applications. In reality, it\'s a collection of mundane printer sounds recorded under the influence of ketamine, representing a haphazard and unserious creative endeavor.',
        oi.status_after = 'The EP\'s status remains unchanged in Jeremy\'s delusional mind, still \'critically acclaimed\' and full of corporate potential. However, in the narrative and for Mark, its true nature as a ridiculous and embarrassing project is further solidified by Mark\'s internal monologue, amplifying the comedic irony and Mark\'s despair.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sounds_of_the_serviced_office_ep'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ted_talks_event_2_4'})
    ON CREATE SET
        oi.description = 'TED Talks are invoked by Jeremy as proof of his rigorous \'research\' and deep understanding of business principles. He cites them as a primary source of his CEO-level knowledge, showcasing his superficial approach to learning and his reliance on easily digestible, motivational content.',
        oi.status_before = 'TED Talks exist as a vast online library of informative and motivational presentations, generally respected for their engaging and accessible format.',
        oi.status_after = 'In this event, TED Talks are ironically elevated to symbols of Jeremy\'s delusional self-importance and shallow understanding of corporate strategy. They become a comedic representation of his misguided belief that passive consumption of online content equates to genuine expertise.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ted_talks'})
    MATCH (e:Event {uuid: 'event_2_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_instagram_event_2_4'})
    ON CREATE SET
        oi.description = 'Instagram is referenced as the platform where Jeremy follows Gary Vaynerchuk, highlighting the visually-driven and often superficial nature of his business inspiration. It represents a source of readily available, motivational content that Jeremy misinterprets as profound business insight, contributing to his inflated sense of expertise.',
        oi.status_before = 'Instagram is a popular social media platform used for sharing photos and videos, widely used for marketing and influencer culture.',
        oi.status_after = 'Instagram, through its association with Gary Vaynerchuk, becomes a perceived authority on business wisdom in Jeremy\'s mind. It is instrumental in fueling his delusional CEO proclamation, representing the superficiality and questionable validity of his business acumen.'
    WITH oi
    MATCH (o:Object {uuid: 'object_instagram'})
    MATCH (e:Event {uuid: 'event_2_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gary_vaynerchuk_quotes_event_2_4'})
    ON CREATE SET
        oi.description = 'Printouts of Gary Vaynerchuk quotes are present in the living room as Jeremy practices his pitch. They serve as a visual backdrop to his performance, embodying his shallow, cliché-driven approach to business and acting as props in his misguided attempt to project a CEO image. They represent the extent to which Jeremy relies on superficial motivational soundbites.',
        oi.status_before = 'The Gary Vaynerchuk quotes were printouts, highlighted and displayed in the living room. They functioned as Jeremy\'s self-proclaimed motivational decor, intended to inspire and legitimize his corporate ambitions.',
        oi.status_after = 'The Gary Vaynerchuk quotes are implicitly invoked by Jeremy as the foundation of his CEO-like pronouncements. They become a visual and textual representation of the hollowness of his business philosophy, reinforcing the comedic absurdity of his reliance on motivational clichés and soundbites.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gary_vaynerchuk_quotes'})
    MATCH (e:Event {uuid: 'event_2_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy stands confidently in Mark\'s borrowed suit, striking exaggerated poses in front of the cracked mirror as he practices his pitch. His body language is theatrical and self-assured as he gestures expansively towards his reflection.',
        ap.emotional_state = 'Exuding inflated self-confidence and a hint of manic determination, Jeremy is riding a wave of corporate bravado despite his superficial grasp of the jargon.',
        ap.emotional_tags = ["Exuding inflated self-confidence", "a hint of manic determination, Jeremy is riding a wave of corporate bravado despite his superficial grasp of the jargon."],
        ap.active_plans = ["Master his pitch to appear as a disruptive innovator in the sonic arts space.", "Demonstrate to potential investors and corporate figures that he is already a CEO in spirit."],
        ap.beliefs = ["He believes that a blend of buzzwords and overconfidence can compensate for his lack of genuine expertise.", "He is convinced that his unconventional background and self-curated image will soon earn him professional recognition."],
        ap.goals = ["Short-term: Perfect his pitch and project enough corporate gravitas to secure acceptance from key decision makers.", "Long-term: Establish himself as a credible disruptor in the corporate and creative industries."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Mark stands in his living room, physically present but mentally spiraling. He\'s ostensibly reorganizing his \'Networking Emergency Protocols\' index cards, a nervous tic that barely masks his inner turmoil. His attention is fixated on Jeremy\'s ludicrous pitch, his internal monologue painting a vivid picture of his escalating horror.',
        ap.emotional_state = 'Mark is consumed by horror and cynical despair. He\'s acutely aware of the impending disaster of Jeremy\'s pitch and the potential career ramifications for himself. His internal monologue is laced with dark humor and a sense of utter disbelief at Jeremy\'s audacity and delusion.',
        ap.emotional_tags = ["Mark is consumed by horror", "cynical despair. He's acutely aware of the impending disaster of Jeremy's pitch", "the potential career ramifications for himself. His internal monologue is laced with dark humor", "a sense of utter disbelief at Jeremy's audacity", "delusion."],
        ap.active_plans = ["Silently critique Jeremy's pitch in his head.", "Mentally prepare for the inevitable social and professional fallout.", "Attempt to subtly influence Jeremy to drop the most ridiculous elements of his pitch (like 'paradigm').", "Strategize damage control for when Jeremy inevitably presents this to Charlotte Walsh-Henderson."],
        ap.beliefs = ["Jeremy's pitch is utter nonsense and based on delusion.", "Charlotte Walsh-Henderson, despite her corporate buzzword enthusiasm, will likely see through Jeremy's charade.", "Jeremy's success is undeserved and threatens to undermine Mark's own already precarious position.", "The corporate world is susceptible to empty buzzwords and superficial presentations.", "He is doomed to witness and be affected by Jeremy's catastrophic presentation."],
        ap.goals = ["To survive Jeremy's pitch practice without a complete mental breakdown.", "To minimize the damage to his own career and reputation when Jeremy presents this idea.", "To somehow prevent Jeremy from making a complete fool of himself (and by extension, Mark).", "To maintain a semblance of sanity amidst the escalating absurdity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy is in full performance mode, pacing around the living room as he delivers his pitch with unwavering confidence. He gestures emphatically, adjusting Mark\'s tie, completely oblivious to the actual content and quality of his words. He\'s projecting an image of a visionary CEO, lost in his own self-importance.',
        ap.emotional_state = 'Jeremy is brimming with self-confidence and excitement. He genuinely believes in his pitch and the transformative power of his \'sonic arts\'. He\'s energized by the prospect of corporate success and completely unaware of the absurdity of his claims, operating in a state of blissful delusion.',
        ap.emotional_tags = ["Jeremy is brimming with self-confidence", "excitement. He genuinely believes in his pitch", "the transformative power of his 'sonic arts'. He's energized by the prospect of corporate success", "completely unaware of the absurdity of his claims, operating in a state of blissful delusion."],
        ap.active_plans = ["Practice and refine his pitch for maximum impact.", "Impress Mark with his corporate acumen and 'disruptive' ideas.", "Prepare for his presentation to Charlotte Walsh-Henderson, envisioning a triumphant success.", "Master corporate buzzwords and TED Talk mannerisms to enhance his presentation.", "Ignore any potential criticism or skepticism, including Mark's subtle attempts at correction."],
        ap.beliefs = ["His 'Sounds of the Serviced Office' EP is genuinely 'critically acclaimed' and a testament to his artistic genius.", "Corporate buzzwords and TED Talk rhetoric are the keys to success in the business world.", "He is a 'disruptor' and 'sonic visionary' poised to revolutionize workplace productivity.", "Mark is impressed and possibly even envious of his corporate brilliance.", "Charlotte Walsh-Henderson will be captivated by his innovative ideas and unique approach."],
        ap.goals = ["To perfect his pitch and deliver it flawlessly.", "To secure a lucrative corporate opportunity with MetricShift.", "To gain recognition and validation for his 'sonic arts' and 'entrepreneurial' vision.", "To prove his worth to Mark (in his own misguided way).", "To become a successful 'Sonic Visionary/Consciousness Optimizer' in the corporate world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Charlotte is not physically present, but her looming presence is felt intensely through Mark\'s internal monologue. She exists as a figure of authority and judgment, the gatekeeper to corporate success or failure. Mark anticipates her future reaction to Jeremy\'s pitch, projecting his fears and anxieties onto her imagined presence.',
        ap.emotional_state = '(Inferred through Mark\'s anxiety) Charlotte is perceived as a potentially discerning but also somewhat unpredictable corporate figure. Mark is anxious about how she will react, suggesting he sees her as both powerful and potentially susceptible to corporate buzzwords, creating a volatile mix of hope and fear.',
        ap.emotional_tags = ["(Inferred through Mark's anxiety) Charlotte is perceived as a potentially discerning but also somewhat unpredictable corporate figure. Mark is anxious about how she will react, suggesting he sees her as both powerful", "potentially susceptible to corporate buzzwords, creating a volatile mix of hope", "fear."],
        ap.active_plans = ["(Future event, inferred by Mark) To evaluate pitches and ideas at the Innovation Sundowner.", "(Future event, inferred by Mark) To identify 'disruptive' solutions for MetricShift's challenges.", "(Future event, inferred by Mark) To make decisions about which innovations to pursue and invest in.", "(Future event, inferred by Mark) To potentially be impressed or completely dismissive of Jeremy's pitch."],
        ap.beliefs = ["(Inferred through Mark's perception) Charlotte is actively seeking 'innovative solutions' and 'disruptive' ideas.", "(Inferred through Mark's perception) She may be susceptible to impressive-sounding buzzwords and confident presentations, even if the underlying substance is questionable.", "(Inferred through Mark's perception) She holds significant power over career trajectories within MetricShift.", "(Inferred through Mark's fear) She could either be impressed by Jeremy's pitch or completely reject it, with potentially significant consequences for Mark."],
        ap.goals = ["(Future event, inferred by Mark) To drive digital transformation and innovation at MetricShift.", "(Future event, inferred by Mark) To find solutions to corporate challenges, possibly including workplace productivity.", "(Future event, inferred by Mark) To identify and promote individuals with 'disruptive' and 'innovative' ideas.", "(Future event, inferred by Mark) To maintain her position as Head of Digital Transformation and demonstrate her effectiveness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Mark is in the living room, meticulously reorganizing his \'Networking Emergency Protocols\' index cards while observing Jeremy\'s rehearsal with a mix of exasperation and pedantic scrutiny.',
        ap.emotional_state = 'Anxious, self-conscious, and tinged with sardonic frustration.',
        ap.emotional_tags = ["Anxious, self-conscious,", "tinged with sardonic frustration."],
        ap.active_plans = ["Interrupt Jeremy to correct his use of outdated corporate jargon.", "Inject a dose of reality into the farcical nature of Jeremy's presentation."],
        ap.beliefs = ["Using clich\u00e9d buzzwords like 'paradigm' represents a shallow grasp of corporate communication.", "Precision in language is essential, even if it pales in the face of greater absurdities."],
        ap.goals = ["To expose the triviality and irony of Jeremy's self-aggrandizing enterprise.", "To reassert some semblance of rationality and professionalism in an otherwise chaotic environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Jeremy is energetically practicing his pitch in front of a cracked mirror, surrounded by empty Red Bull cans and Gary Vaynerchuk printouts, lost in his self-assured corporate narrative.',
        ap.emotional_state = 'Overconfident, oblivious to criticism, and buoyed by his own delusion of impending corporate success.',
        ap.emotional_tags = ["Overconfident, oblivious to criticism,", "buoyed by his own delusion of impending corporate success."],
        ap.active_plans = ["Continue his rehearsed pitch with a blend of buzzwords and attempted expertise.", "Leverage his supposed research and charismatic self-promotion to claim a CEO-like status."],
        ap.beliefs = ["His brief encounters with TED Talks and Instagram insights are enough to qualify him as a corporate visionary.", "Corporate jargon and flashy buzzwords are the keys to mastering and redefining business success."],
        ap.goals = ["To convince his peers (and especially Charlotte) of his innovative approach.", "To solidify his self-image as an expert disruptor in the sonic arts space despite the underlying absurdity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Jeremy stands confidently in the living room, rehearsing his pitch with theatrical flair. He gestures broadly, projecting an image of corporate authority as he proclaims his CEO-worthiness, fuelled by what he believes is extensive \'research\'. He\'s oblivious to the absurdity of his claims and Mark\'s horrified reaction.',
        ap.emotional_state = 'Jeremy is radiating supreme self-confidence and delusion. He\'s riding high on a wave of unfounded optimism, genuinely believing in his own genius and the transformative power of his \'sonic arts\'. He feels validated and empowered by his superficial engagement with online business gurus.',
        ap.emotional_tags = ["Jeremy is radiating supreme self-confidence", "delusion. He's riding high on a wave of unfounded optimism, genuinely believing in his own genius", "the transformative power of his 'sonic arts'. He feels validated", "empowered by his superficial engagement with online business gurus."],
        ap.active_plans = ["To solidify his self-proclaimed CEO status in his own mind and in Mark's.", "To rehearse and refine his pitch for the MetricShift Innovation Sundowner, believing it will be a resounding success.", "To impress Charlotte Walsh-Henderson with his 'disruptive' ideas."],
        ap.beliefs = ["That watching TED Talks and following Gary Vaynerchuk on Instagram constitutes legitimate business research and expertise.", "That buzzwords and motivational soundbites are the keys to corporate success.", "That he is a visionary and a natural leader, destined for CEO status."],
        ap.goals = ["To convince himself and others of his CEO potential.", "To secure a significant role at MetricShift based on his 'sonic arts' pitch.", "To achieve corporate success and recognition, even if based on flimsy foundations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Mark watches Jeremy\'s performance with mounting horror, physically recoiling from the sheer absurdity of it all. He busies himself reorganizing his \'Networking Emergency Protocols\' index cards, a nervous tic that underscores his deep-seated anxiety and his futile attempts to control the unfolding disaster.',
        ap.emotional_state = 'Mark is consumed by exasperation and a sense of impending doom. He is intellectually appalled by Jeremy\'s delusion and foresees catastrophic consequences for both Jeremy and, by association, himself. He feels trapped and powerless to intervene effectively.',
        ap.emotional_tags = ["Mark is consumed by exasperation", "a sense of impending doom. He is intellectually appalled by Jeremy's delusion", "foresees catastrophic consequences for both Jeremy", ", by association, himself. He feels trapped", "powerless to intervene effectively."],
        ap.active_plans = ["To subtly undermine Jeremy's confidence, hoping to prevent him from making a complete fool of himself.", "To mentally prepare for the inevitable professional fallout from Jeremy's presentation.", "To cling to some semblance of control amidst the chaos by meticulously organizing his index cards, a symbolic act of managing the unmanageable."],
        ap.beliefs = ["That Jeremy's approach is utterly ridiculous and based on a profound misunderstanding of the corporate world.", "That genuine competence and strategic thinking are essential for success, not superficial buzzwords and online inspiration.", "That Jeremy's actions will inevitably lead to disaster, and he, Mark, will likely be caught in the crossfire."],
        ap.goals = ["To minimize the damage Jeremy's presentation might inflict on his own career.", "To maintain a semblance of professional dignity despite the surrounding absurdity.", "To survive this latest episode of Jeremy's self-destructive ambition and somehow navigate the corporate landscape."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_premium_name_badge_event_3_1'})
    ON CREATE SET
        oi.description = 'The LinkedIn Premium Name Badge is being meticulously adjusted by Mark as he tries to embody the professionalism expected in this high-stakes environment, serving as a symbol of his attempted corporate resurgence.',
        oi.status_before = 'Clean and firmly attached, with a shiny finish that promises elevated professional identity.',
        oi.status_after = 'Slightly misaligned from constant fidgeting, mirroring the subtle cracks in Mark\'s self-assurance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_fairy_lights_event_3_1'})
    ON CREATE SET
        oi.description = 'The fairy lights cast a whimsical and sophisticated glow over the Ideation Zone, setting a backdrop that contrasts sharply with the underlying tension and corporate anxiety.',
        oi.status_before = 'Neatly strung and emitting a soft, even illumination, they provided a charming counterbalance to the formal setting.',
        oi.status_after = 'Remaining steadfast, their gentle luminescence continues to highlight the space, emphasizing the permeating mood of anticipation and underlying dread.'
    WITH oi
    MATCH (o:Object {uuid: 'object_fairy_lights'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_whiteboards_buzzwords_event_3_2'})
    ON CREATE SET
        oi.description = 'The whiteboards, covered in corporate buzzwords and illuminated by fairy lights, serve as a backdrop to the pitch. They visually represent the superficiality and jargon-heavy environment of corporate innovation that Jeremy attempts to navigate with his own buzzword-laden pitch. They are passively present, setting the stage for the interaction and highlighting the corporate context.',
        oi.status_before = 'Pristine whiteboards adorned with a curated selection of corporate buzzwords, ready to inspire and showcase \'innovative thinking\'.',
        oi.status_after = 'Remain unchanged, still covered in buzzwords and illuminated, continuing to represent the corporate \'Ideation Zone\' aesthetic after the pitch interaction.'
    WITH oi
    MATCH (o:Object {uuid: 'object_whiteboards_buzzwords'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_kombucha_stations_event_3_2'})
    ON CREATE SET
        oi.description = 'The kombucha stations, meticulously arranged by Charlotte, are present in the Ideation Zone as part of the Innovation Sundowner setup. They represent the corporate wellness trend and the attempt to blend health-consciousness with a professional environment. While not directly interacted with during the pitch itself, they contribute to the overall atmosphere of a modern, \'innovative\' workplace, indirectly influencing the context of the conversation.',
        oi.status_before = 'Strategically positioned and fully stocked with various kombucha flavors, ready to offer a \'healthy\' beverage option to event attendees.',
        oi.status_after = 'Remain in place, still offering kombucha as a symbol of corporate wellness and continuing to contribute to the atmosphere of the Innovation Sundowner after the pitch interaction concludes.'
    WITH oi
    MATCH (o:Object {uuid: 'object_kombucha_stations'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan is hovering by the fruit-infused water station, meticulously straightening his LinkedIn Premium Name Badge as he watches the unfolding interactions in the Ideation Zone.',
        ap.emotional_state = 'He is overwhelmed by anxiety and self-doubt, his internal monologue filled with dread and sardonic observations about the corporate theatrics surrounding him.',
        ap.emotional_tags = ["He is overwhelmed by anxiety", "self-doubt, his internal monologue filled with dread", "sardonic observations about the corporate theatrics surrounding him."],
        ap.active_plans = ["Maintain a facade of professionalism despite inner turmoil", "Avoid confrontation while gauging the disruptive energy of the space"],
        ap.beliefs = ["Corporate success hinges on appearances and precision, a standard he feels uncomfortably unable to meet", "Jeremy\u2019s erratic boldness is a threat to the established order he clings to"],
        ap.goals = ["Short-term: To remain inconspicuous and safe from professional embarrassment", "Long-term: To reclaim his fading sense of competence and secure his corporate identity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Charlotte Walsh-Henderson stands overseeing the arrangement of kombucha stations, her posture indicating focused control even amidst the casual networking event. When Jeremy approaches, she turns her attention to him, engaging directly and professionally, her body language open but assessing.',
        ap.emotional_state = 'Pragmatically curious and keenly observant, Charlotte is in her element, evaluating potential innovations with a mixture of corporate skepticism and genuine interest. She is alert to opportunities for \'disruption\' and maintains a composed, business-oriented demeanor.',
        ap.emotional_tags = ["Pragmatically curious", "keenly observant, Charlotte is in her element, evaluating potential innovations with a mixture of corporate skepticism", "genuine interest. She is alert to opportunities for 'disruption'", "maintains a composed, business-oriented demeanor."],
        ap.active_plans = ["Assess Jeremy's 'sonic optimization' pitch for its viability and 'disruptive' potential within MetricShift.", "Evaluate Jeremy as a potential innovator and determine if his ideas align with MetricShift's strategic goals.", "Maintain control over the Innovation Sundowner event and ensure it fosters a productive atmosphere for networking and idea generation."],
        ap.beliefs = ["Corporate innovation is essential for MetricShift's continued success and relevance.", "Genuine 'disruption' can come from unexpected sources and unconventional ideas.", "Mindfulness and wellness initiatives can enhance workplace productivity and employee satisfaction.", "Data-driven solutions and technological advancements are key to overcoming corporate challenges like the 'Great Algorithm Crisis'."],
        ap.goals = ["Identify and implement innovative solutions to improve MetricShift's performance and market position.", "Discover a breakthrough idea that can address the challenges exposed by the 'Great Algorithm Crisis'.", "Foster a culture of innovation and experimentation within MetricShift.", "Maintain her reputation as a forward-thinking and effective Head of Digital Transformation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy confidently approaches Charlotte, launching into his pitch with unrestrained enthusiasm. He gestures expansively, attempting to convey the revolutionary nature of his sonic optimization concept, completely oblivious to any corporate norms or subtle social cues. He is physically present and verbally dominant in the interaction, brimming with self-assuredness.',
        ap.emotional_state = 'Excited, euphoric, and brimming with misplaced confidence, Jeremy believes he is on the verge of a major breakthrough. He is energized by the corporate setting and the opportunity to pitch his outlandish idea, feeling validated and empowered.',
        ap.emotional_tags = ["Excited, euphoric,", "brimming with misplaced confidence, Jeremy believes he is on the verge of a major breakthrough. He is energized by the corporate setting", "the opportunity to pitch his outl", "ish idea, feeling validated", "empowered."],
        ap.active_plans = ["Deliver his 'sonic optimization' pitch to Charlotte Walsh-Henderson to secure corporate validation and potential investment.", "Impress Charlotte with his innovative thinking and convince her of the transformative potential of his sound-based productivity solutions.", "Use buzzwords and trendy concepts like 'mindfulness' and 'blockchain' to appeal to corporate sensibilities, even if he barely understands them."],
        ap.beliefs = ["His 'sonic optimization' concept is genuinely revolutionary and will transform workplace productivity.", "Buzzwords and trendy jargon are essential for gaining corporate attention and approval.", "He is a visionary genius whose unconventional ideas are destined for corporate success.", "A loose connection to 'mindfulness' and 'blockchain' will give his otherwise nonsensical idea corporate credibility."],
        ap.goals = ["Secure a partnership or investment from MetricShift for his 'sonic optimization' project.", "Achieve corporate success and finally prove his 'genius' to the world (and especially Mark).", "Gain recognition and validation for his creative endeavors, even if it means compromising their original artistic integrity.", "Transition from a struggling 'Sonic Visionary' to a respected corporate innovator."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Mark lurks near the fruit-infused water station, physically present but attempting to be inconspicuous. He straightens his LinkedIn Premium name badge nervously, a subtle gesture revealing his deep-seated anxiety. He is primarily an observer in this interaction, his actions limited to internal reactions and minor adjustments to his appearance.',
        ap.emotional_state = 'Apprehensive, dread-filled, and internally cringing, Mark is experiencing a surge of social anxiety and professional despair. He anticipates disaster as he watches Jeremy approach Charlotte, fearing the inevitable embarrassment and negative repercussions on his own already precarious career. He is filled with cynical resignation.',
        ap.emotional_tags = ["Apprehensive, dread-filled,", "internally cringing, Mark is experiencing a surge of social anxiety", "professional despair. He anticipates disaster as he watches Jeremy approach Charlotte, fearing the inevitable embarrassment", "negative repercussions on his own already precarious career. He is filled with cynical resignation."],
        ap.active_plans = ["Avoid being directly associated with Jeremy's potentially disastrous pitch and minimize any negative impact on his own professional standing.", "Observe the interaction between Jeremy and Charlotte with a mix of morbid curiosity and horrified anticipation.", "Mentally prepare for the worst-case scenario, which he envisions as Jeremy completely derailing his own already floundering career prospects at MetricShift."],
        ap.beliefs = ["Jeremy's ideas are inherently ridiculous and destined to fail spectacularly in a corporate setting.", "Corporate environments are inherently absurd and reward superficiality and incompetence.", "His own career is perpetually on the brink of collapse, and Jeremy's actions will likely be the final straw.", "He is destined to be overshadowed and undermined by less competent but more confident individuals like Jeremy."],
        ap.goals = ["Survive this networking event without further damaging his already fragile career.", "Distance himself from Jeremy's antics and maintain a semblance of professional respectability.", "Internally document and sarcastically narrate the unfolding corporate absurdity to maintain his sanity.", "Secretly hope that Jeremy's pitch fails spectacularly, even though he knows this might also reflect poorly on him for bringing Jeremy to the event."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_1'})
    ON CREATE SET
        oi.description = 'The DJ equipment, borrowed from Super Hans\' silent disco business, is being assembled and activated by Jeremy to unleash his disruptive soundscape, serving as the literal instrument of his chaotic innovation.',
        oi.status_before = 'Prior to this event, the DJ equipment was in a condition suitable for silent disco performances, functional yet modest.',
        oi.status_after = 'Once activated, it becomes the catalyst for an audibly chaotic environment, blurring the lines between experimental art and corporate disruption.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_herman_miller_wallpaper_event_4_1'})
    ON CREATE SET
        oi.description = 'The Herman Miller wallpaper sets the formal, high-end backdrop of the \'Disruption Chamber\' against which Mark\'s desperate attempt to become inconspicuous unfolds, symbolizing the clash between corporate aesthetics and personal insecurity.',
        oi.status_before = 'Before the event, the wallpaper stood as a pristine emblem of corporate sophistication and deliberate design.',
        oi.status_after = 'After the event, it serves as an ironic canvas, its polished surface now marked by Mark’s futile act of blending in amid the sensory and ideological chaos.'
    WITH oi
    MATCH (o:Object {uuid: 'object_herman_miller_wallpaper'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_productivity_soundscape_event_4_2'})
    ON CREATE SET
        oi.description = 'Jeremy presents the \'productivity soundscape\' as the centerpiece of his pitch, claiming it\'s a scientifically-engineered tool for enhancing workplace productivity, ironically developed during his time at the Croydon Buddhist Centre. It is played aloud in the boardroom, filling the space with its chaotic and dissonant sounds as a demonstration of its supposed efficacy.',
        oi.status_before = 'A chaotic and untested mix of electronic music, office noises, and vaguely spiritual sounds, existing as a digital audio file ready to be played.',
        oi.status_after = 'Listened to and surprisingly endorsed by Alan Johnson as \'raw, disruptive, authentically digital\', unexpectedly elevating its status from a bizarre experiment to a potentially valuable corporate asset in the eyes of MetricShift\'s leadership.'
    WITH oi
    MATCH (o:Object {uuid: 'object_productivity_soundscape'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_chemical_brothers_meets_whale_sounds_playlist_event_4_2'})
    ON CREATE SET
        oi.description = 'This playlist exists solely as a sarcastic descriptor in Mark\'s internal monologue. It\'s how Mark mentally categorizes and ridicules Jeremy\'s \'productivity soundscape\', highlighting its perceived incongruity and lack of coherence. It serves as a comedic comparison, emphasizing the jarring and nonsensical nature of Jeremy\'s sonic offering from Mark\'s perspective.',
        oi.status_before = 'Non-existent as a real object; it is purely a figurative comparison within Mark\'s thoughts, representing his cynical interpretation of the soundscape.',
        oi.status_after = 'Remains a purely internal, metaphorical description in Mark\'s mind, further solidifying his negative and dismissive view of Jeremy\'s \'productivity soundscape\' and the corporate world\'s gullibility.'
    WITH oi
    MATCH (o:Object {uuid: 'object_chemical_brothers_meets_whale_sounds_playlist'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_pret_sandwich_artisan_career_event_4_2'})
    ON CREATE SET
        oi.description = 'The \'Pret sandwich artisan career\' emerges as a fleeting fantasy in Mark\'s internal monologue, a desperate daydream of escaping the corporate rat race. It represents a stark contrast to his current anxiety-ridden existence, symbolizing a simpler, more tangible, and honest form of work. It\'s a mental refuge, a hypothetical alternative triggered by his despair at Jeremy\'s apparent success.',
        oi.status_before = 'A nascent, undeveloped idea in Mark\'s mind, a vague yearning for a less stressful and more straightforward life, triggered by the unfolding corporate absurdity.',
        oi.status_after = 'Remains a wistful fantasy, an unfulfilled and likely unrealistic escape plan, highlighting the depth of Mark\'s corporate disillusionment and his longing for a different kind of existence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_pret_sandwich_artisan_career'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_chaotic_sound_blend_event_4_3'})
    ON CREATE SET
        oi.description = 'The chaotic sound blend is activated by Jeremy as the centerpiece of his \'productivity soundscape\', delivering an auditory assault that mingles electronic beats, office printer noises, and vague chanting.',
        oi.status_before = 'Dormant and unutilized, representing Jeremy\'s experimental promise yet unrealized.',
        oi.status_after = 'Alive and disruptive, filling the boardroom with a jarring mix that shocks and captivates the corporate audience.'
    WITH oi
    MATCH (o:Object {uuid: 'object_chaotic_sound_blend'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_french_foreign_legion_recruitment_event_4_3'})
    ON CREATE SET
        oi.description = 'This object embodies Mark\'s internal fantasy escape, his hyperbolic notion of abandoning his corporate woes by enlisting in the French Foreign Legion.',
        oi.status_before = 'A distant, half-formed idea representing a desperate desire for total exile from the corporate scene.',
        oi.status_after = 'Reinforced and amplified by his internal monologue, symbolizing a heightened state of existential and professional defeat.'
    WITH oi
    MATCH (o:Object {uuid: 'object_french_foreign_legion_recruitment'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy is meticulously setting up his antiquated DJ equipment, positioning cables and knobs with the determined air of a man about to launch his disruptive soundscape into the corporate arena.',
        ap.emotional_state = 'He exudes unshakeable confidence mixed with a hint of oblivious exuberance, convinced of the genius of his own innovation.',
        ap.emotional_tags = ["He exudes unshakeable confidence mixed with a hint of oblivious exuberance, convinced of the genius of his own innovation."],
        ap.active_plans = ["Initiate the sonic assault by powering on his DJ equipment and demonstrating his unconventional pitch to the senior management.", "Transform corporate rigidity into a playground for his experimental soundscape."],
        ap.beliefs = ["He believes that his unorthodox blend of electronic beats and ambient chaos is the key to unlocking productivity in the corporate environment."],
        ap.goals = ["Short-term: Successfully launch his 'productivity soundscape' to captivate the audience.", "Long-term: Establish himself as a disruptive force capable of reshaping corporate strategies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Alan Johnson surveys the unfolding setup with measured detachment, his eyes fixed on Jeremy’s actions as he prepares his equipment.',
        ap.emotional_state = 'He is intrigued and cautiously optimistic, exhibiting a calm curiosity about the potential of this disruptive approach.',
        ap.emotional_tags = ["He is intrigued", "cautiously optimistic, exhibiting a calm curiosity about the potential of this disruptive approach."],
        ap.active_plans = ["Evaluate the effectiveness and potential of Jeremy\u2019s chaotic innovation for broader corporate applications.", "Consider the strategic benefits of a possible merger or partnership based on this disruptive energy."],
        ap.beliefs = ["He believes that raw and authentic digital innovation, even if unconventional, could offer a competitive edge in today's market."],
        ap.goals = ["Short-term: Assess the viability of integrating this unorthodox approach into MetricShift\u2019s strategy.", "Long-term: Leverage successful disruptive initiatives to reshape his organization\u2019s market stance and facilitate potential mergers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Mark is visibly anxious, deliberately positioning himself against the wall in an effort to merge with the patterned Herman Miller wallpaper.',
        ap.emotional_state = 'He is overwhelmed with dread and despair, his internal monologue rife with dark humor and resignation about his fate.',
        ap.emotional_tags = ["He is overwhelmed with dread", "despair, his internal monologue rife with dark humor", "resignation about his fate."],
        ap.active_plans = ["Blend into the background to avoid attention while internally critiquing the unfolding absurdity.", "Contemplate alternative career options as he witnesses Jeremy\u2019s misguided ascent."],
        ap.beliefs = ["He firmly believes that he is doomed to be overshadowed by the chaotic exuberance of his colleagues, particularly Jeremy.", "He is convinced that corporate rituals are absurd yet inescapable."],
        ap.goals = ["Short-term: Evade the social disaster unfolding in the boardroom.", "Long-term: Find an escape route from the corporate maze, perhaps through an unconventional career shift."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy stands confidently before Alan Johnson and the MetricShift team, gesturing theatrically as he introduces his \'scientifically-engineered productivity soundscape\'. He\'s positioned behind his DJ equipment, ready to unleash his sonic creation upon the unsuspecting executives, basking in the spotlight of what he believes is his imminent corporate triumph.',
        ap.emotional_state = 'Buoyant and self-assured, Jeremy is completely convinced of his genius and the transformative power of his soundscape. He\'s oblivious to the absurdity of his claims and the chaotic nature of his music, radiating a delusional confidence that borders on manic.',
        ap.emotional_tags = ["Buoyant", "self-assured, Jeremy is completely convinced of his genius", "the transformative power of his soundscape. He's oblivious to the absurdity of his claims", "the chaotic nature of his music, radiating a delusional confidence that borders on manic."],
        ap.active_plans = ["To impress Alan Johnson and Charlotte Walsh-Henderson with his 'productivity soundscape'.", "To secure a lucrative corporate contract with MetricShift.", "To establish himself as a leading 'sonic visionary' in the corporate world."],
        ap.beliefs = ["He genuinely believes his soundscape is scientifically valid and effective, despite its origins in personal experimentation and misinterpretations of Buddhist chants.", "He believes buzzwords and confident presentation are more important than actual substance in the corporate world.", "He believes he is a uniquely gifted 'disruptor' and 'sonic visionary'."],
        ap.goals = ["To get hired by MetricShift.", "To gain recognition and validation for his 'sonic art'.", "To achieve financial success and escape his previous failures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Mark shrinks into the background, attempting to become one with the Herman Miller wallpaper, a silent observer of Jeremy\'s unfolding presentation. He watches in mounting horror as Jeremy makes his ludicrous claims, his internal monologue a torrent of cynical commentary and desperate escape fantasies.',
        ap.emotional_state = 'Anxious and despairing, Mark is filled with a sense of impending doom as he witnesses Jeremy\'s apparent success. He\'s cynical and exasperated, feeling increasingly trapped in his corporate existence and overshadowed by Jeremy\'s undeserved rise.',
        ap.emotional_tags = ["Anxious", "despairing, Mark is filled with a sense of impending doom as he witnesses Jeremy's apparent success. He's cynical", "exasperated, feeling increasingly trapped in his corporate existence", "overshadowed by Jeremy's undeserved rise."],
        ap.active_plans = ["To mentally distance himself from Jeremy's presentation and avoid any association with it.", "To contemplate alternative career paths as a means of escape from corporate life.", "To strategize his next move if Jeremy somehow succeeds."],
        ap.beliefs = ["He believes Jeremy's presentation is utterly ridiculous and based on nonsensical pseudo-science.", "He believes the corporate world is absurd and easily swayed by empty buzzwords and confident charlatans.", "He believes his own rational and competent approach to work is undervalued and that he is destined for perpetual mediocrity."],
        ap.goals = ["To escape his current corporate misery and find a less stressful and more meaningful existence.", "To maintain his current job at MetricShift, but ideally in a role far removed from Jeremy's influence.", "To find a way to regain some sense of control and dignity in his career."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Observing the unfolding performance from a poised vantage, Alan watches Jeremy set up his DJ equipment with an inscrutable smile.',
        ap.emotional_state = 'Calm confidence with a hint of opportunistic excitement as he sees unconventional ideas aligning with his merger strategies.',
        ap.emotional_tags = ["Calm confidence with a hint of opportunistic excitement as he sees unconventional ideas aligning with his merger strategies."],
        ap.active_plans = ["Evaluate the potential of integrating disruptive digital innovations into his corporate portfolio.", "Leverage the success of the soundscape for possible merger opportunities."],
        ap.beliefs = ["Innovation can stem from chaos and disrupt established norms.", "Unconventional ideas might be the key to a profitable corporate future."],
        ap.goals = ["Position his company favorably in the digital revolution.", "Approve and roll out disruptive ideas that promise competitive advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Standing at the side of the boardroom, Charlotte attentively registers every note of the cacophonous soundscape as she readies herself to act on Alan\'s directive.',
        ap.emotional_state = 'Decisively intrigued and committed, a mix of professionalism and excitement underpinning her readiness.',
        ap.emotional_tags = ["Decisively intrigued", "committed, a mix of professionalism", "excitement underpinning her readiness."],
        ap.active_plans = ["Implement the full rollout of Jeremy's project immediately.", "Coordinate with internal departments to integrate the disruptive soundscape into the corporate agenda."],
        ap.beliefs = ["The future of digital transformation depends on bold, innovative ideas.", "Ambition and unconventionality are essential drivers for change within corporate structures."],
        ap.goals = ["Successfully transition the experimental concept into an approved corporate strategy.", "Enhance MetricShift's reputation as a hub for digital innovation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'})
    ON CREATE SET
        ap.current_status = 'At the center of the performance, Jeremy energetically launches his DJ equipment, unleashing his chaotic productivity soundscape onto the boardroom.',
        ap.emotional_state = 'Overwhelming self-assurance mixed with a buoyant disregard for conventional expectations.',
        ap.emotional_tags = ["Overwhelming self-assurance mixed with a buoyant disregard for conventional expectations."],
        ap.active_plans = ["Demonstrate the radical potential of his 'sonic optimization' to secure corporate validation.", "Capitalise on the momentum of his unconventional pitch to further his career."],
        ap.beliefs = ["Innovative disruption is the path to success in the digital age.", "Authenticity in creative chaos will win over even the most traditional corporate minds."],
        ap.goals = ["Achieve corporate endorsement for his experimental project.", "Position himself as a key innovator within the company and the broader industry."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'})
    ON CREATE SET
        ap.current_status = 'In the backdrop, Mark attempts to blend into the office environment, figuratively merging with the Herman Miller wallpaper as he watches the chaos unfold.',
        ap.emotional_state = 'Anxious despair mixed with sardonic resignation, undercut by his internal monologue of bitter irony.',
        ap.emotional_tags = ["Anxious despair mixed with sardonic resignation, undercut by his internal monologue of bitter irony."],
        ap.active_plans = ["Mentally brace himself for his impending professional obsolescence.", "Contemplate escape routes, including the hyperbolic fantasy of joining the French Foreign Legion."],
        ap.beliefs = ["Corporate life is an unforgiving treadmill of absurdity.", "Success in the modern workplace is more a matter of luck than merit."],
        ap.goals = ["Avoid being dragged into the disruptive changes that promise to upend his already precarious position.", "Find a means to extricate himself from the humiliating corporate dynamics he despises."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_mindcoin_laptop_event_5_1'})
    ON CREATE SET
        oi.description = 'The battered laptop sits center stage amidst the kitchen clutter, its screen displaying the ghostly remnants of Super Hans\' hacked \'MindCoin\' cryptocurrency project. It acts as a visual anchor for Super Hans\' pitch, a tangible, albeit tarnished, symbol of his digital \'expertise\' and past ventures. Super Hans uses it to demonstrate his blockchain knowledge and to project an image of digital wizardry, despite its display being a monument to past failure.',
        oi.status_before = 'The laptop is already displaying the remnants of the hacked \'MindCoin\' project, surrounded by printouts about blockchain and meditation apps. It is a chaotic mess, visually representing the failure of \'MindCoin\' and Super Hans\' haphazard approach to digital entrepreneurship. It is a static object, reflecting past coding sessions and digital mishaps.',
        oi.status_after = 'The laptop remains unchanged in its physical state and display, still showing the remnants of \'MindCoin\'. However, its narrative function has shifted slightly; it now serves as the launchpad and visual prop for the \'SonicChain\' pitch. It transitions from being a symbol of past failure to a (delusional) foundation for future success, a testament to Super Hans\' unwavering, if misguided, optimism.'
    WITH oi
    MATCH (o:Object {uuid: 'object_mindcoin_laptop'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Super Hans is perched at the kitchen table, amidst a chaotic sprawl of printouts detailing blockchain technology and meditation apps. He is intensely focused on his battered laptop, which flickers with the digital ghosts of his failed \'MindCoin\' venture. He\'s animatedly pitching his grand scheme, \'SonicChain,\' to Jeremy, radiating manic energy and a misplaced corporate zeal, underscored by his incongruous MetricShift lanyard and Silicon Valley hoodie.',
        ap.emotional_state = 'Manic and intensely enthusiastic, Super Hans is gripped by a fervent belief in his vision. He exudes a chaotic confidence, fueled by a potent cocktail of delusion and residual energy from past, possibly drug-fueled, coding sessions. There\'s a glint of desperate opportunism in his eyes, convinced this is his \'big break\'.',
        ap.emotional_tags = ["Manic", "intensely enthusiastic, Super Hans is gripped by a fervent belief in his vision. He exudes a chaotic confidence, fueled by a potent cocktail of delusion", "residual energy from past, possibly drug-fueled, coding sessions. There's a glint of desperate opportunism in his eyes, convinced this is his 'big break'."],
        ap.active_plans = ["To convince Jeremy that 'SonicChain' is a revolutionary idea.", "To merge his failed mindfulness platform with Jeremy's corporate sound therapy concept.", "To integrate blockchain technology into corporate meditation.", "To incorporate NFTs into the 'SonicChain' business model.", "To ultimately pitch 'SonicChain' to MetricShift and other corporate entities."],
        ap.beliefs = ["Blockchain is the missing piece in corporate meditation, the key to unlocking its true potential.", "He is a visionary, capable of creating groundbreaking digital solutions despite past failures.", "His coding skills, even if occasionally fueled by ketamine, are cutting-edge and highly valuable.", "The 'suits' in the corporate world will be easily impressed by buzzwords and disruptive ideas."],
        ap.goals = ["To successfully launch 'SonicChain' as a profitable venture.", "To achieve recognition and success in the corporate world, possibly at MetricShift.", "To financially benefit from his digital innovations.", "To move onto 'phase two' of his plan, which vaguely involves 'proper drugs', suggesting a further descent into chaos and hedonism."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy is bustling around the cramped kitchen, energetically making tea. He listens intently to Super Hans\' pitch, nodding enthusiastically and punctuating the presentation with excited interjections. He\'s clearly caught up in Super Hans\' infectious, albeit delusional, enthusiasm, his movements mirroring the frenetic energy of the kitchen and Super Hans himself.',
        ap.emotional_state = 'Excited and highly receptive, Jeremy is swept up in Super Hans\' grand vision. He radiates an oblivious confidence, basking in the reflected glory of Super Hans\' perceived genius. There\'s a naive eagerness to embrace any idea that promises further corporate success, his enthusiasm bordering on gullibility.',
        ap.emotional_tags = ["Excited", "highly receptive, Jeremy is swept up in Super Hans' gr", "vision. He radiates an oblivious confidence, basking in the reflected glory of Super Hans' perceived genius. There's a naive eagerness to embrace any idea that promises further corporate success, his enthusiasm bordering on gullibility."],
        ap.active_plans = ["To fully absorb and understand Super Hans' 'SonicChain' concept.", "To agree to partner with Super Hans in this new venture.", "To contribute his 'corporate sound therapy' idea to the 'SonicChain' platform.", "To brainstorm further enhancements to 'SonicChain', such as incorporating NFTs."],
        ap.beliefs = ["Super Hans is a genius, capable of groundbreaking innovation.", "'SonicChain' is a brilliant and viable business idea with significant corporate appeal.", "Combining sound therapy with blockchain and NFTs is a cutting-edge, highly desirable concept.", "They are on the cusp of achieving major success and recognition in the corporate world."],
        ap.goals = ["To co-create and launch 'SonicChain' with Super Hans.", "To further his corporate success and establish himself as a 'disruptor'.", "To leverage his sound therapy concept within a potentially lucrative digital platform.", "To achieve financial gain and validation through 'SonicChain'."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Mark enters the kitchen, still wearing his MetricShift lanyard, his presence cutting through the exuberant brainstorming with an air of authoritarian corporate concern.',
        ap.emotional_state = 'anxiously burdened and skeptical, his expression marked by resignation and worry about the implications for his already vulnerable career.',
        ap.emotional_tags = ["anxiously burdened", "skeptical, his expression marked by resignation", "worry about the implications for his already vulnerable career."],
        ap.active_plans = ["to prevent the reckless integration of corporate ideas with undocumented experimentation from derailing his professional standing", "to reassert control over the chaotic environment before his career takes a further hit"],
        ap.beliefs = ["that corporate discipline and careful adherence to responsibility must override uncontrolled entrepreneurial spirit", "that mixing unsanctioned innovation with his company could have serious repercussions for his career"],
        ap.goals = ["to safeguard his corporate reputation by quelling the wild ambitions emerging in his flat", "to subtly remind his flatmates of the weighty reality of corporate consequences"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Super Hans is seated at the kitchen table, deeply immersed in the excitement of his hacking and coding endeavors, his attention split between the remnants of his MindCoin project and the unfolding conversation.',
        ap.emotional_state = 'exuberant and defiantly optimistic, his chaotic energy undeterred by the arrival of corporate caution',
        ap.emotional_tags = ["exuberant", "defiantly optimistic, his chaotic energy undeterred by the arrival of corporate caution"],
        ap.active_plans = ["to merge his hacked cryptocurrency work with Jeremy\u2019s innovative idea into a unified project called 'SonicChain'", "to pitch his radical crypto-mindfulness app, reinforcing his status as an unorthodox innovator"],
        ap.beliefs = ["that unbridled innovation, no matter how unorthodox, is the key to transforming traditional paradigms", "that the chaotic, experimental spirit will ultimately triumph over conventional corporate norms"],
        ap.goals = ["to successfully demonstrate the viability of SonicChain as a breakthrough product", "to expand his unconventional influence, regardless of the risks or corporate backlash"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Sitting at the kitchen table amidst a chaotic spread of printouts detailing blockchain and meditation apps, Super Hans is intensely focused on explaining his grand vision to Jeremy. He gestures emphatically, radiating manic energy and sporting a MetricShift lanyard and a Silicon Valley hoodie, emblems of corporate aspiration incongruously worn.',
        ap.emotional_state = 'Manically enthusiastic and supremely confident, bordering on delusional. He is convinced of the brilliance of his \'SonicChain\' idea and its imminent success, utterly dismissive of practicalities or past failures.',
        ap.emotional_tags = ["Manically enthusiastic", "supremely confident, bordering on delusional. He is convinced of the brilliance of his 'SonicChain' idea", "its imminent success, utterly dismissive of practicalities or past failures."],
        ap.active_plans = ["To solidify Jeremy's partnership in 'SonicChain'", "To pitch 'SonicChain' to MetricShift executives, envisioning immediate corporate adoption", "To expand 'SonicChain' into 'phase two,' incorporating 'proper drugs' as a core element"],
        ap.beliefs = ["Blockchain is the revolutionary missing component in corporate meditation.", "His vision, however drug-influenced, is inherently groundbreaking and will resonate with corporate 'suits'.", "Past failures, like MindCoin's hacking, are minor setbacks easily overcome by sheer visionary force."],
        ap.goals = ["To launch 'SonicChain' as a massively successful corporate wellness product.", "To achieve recognition and wealth through this venture, leveraging corporate structures for his chaotic ideas.", "To incorporate his counter-culture sensibilities and drug use into a profitable business model."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Entering the kitchen still wearing his MetricShift lanyard, Mark observes Super Hans and Jeremy with a weary and cynical demeanor. He interjects with a sarcastic remark, highlighting his skepticism and disapproval of their outlandish scheme, maintaining a physical distance from their excited exchange.',
        ap.emotional_state = 'Anxious, deeply cynical, and filled with foreboding. He is overwhelmed by the sheer absurdity of Super Hans\'s vision and anticipates disastrous consequences for everyone involved, including himself. He feels a growing sense of corporate dread and personal helplessness.',
        ap.emotional_tags = ["Anxious, deeply cynical,", "filled with foreboding. He is overwhelmed by the sheer absurdity of Super Hans's vision", "anticipates disastrous consequences for everyone involved, including himself. He feels a growing sense of corporate dread", "personal helplessness."],
        ap.active_plans = ["To passively observe the unfolding chaos, bracing for the inevitable fallout.", "To express his skepticism through sarcastic remarks, a futile attempt to inject reality into their delusions.", "Internally, to mentally prepare for the corporate humiliation he foresees, and to consider damage control for his own career."],
        ap.beliefs = ["Super Hans's idea is ludicrous and destined for failure, yet inexplicably likely to gain traction.", "Corporate environments are easily swayed by superficial buzzwords and empty promises.", "He is perpetually doomed to witness and suffer the consequences of others' incompetence and recklessness, despite his own superior judgment."],
        ap.goals = ["Short-term goal: To express his disapproval and maintain a detached, sarcastic stance.", "Long-term goal: To survive the impending corporate catastrophe with his job and dignity (though he doubts this is achievable).", "To avoid direct entanglement in Super Hans and Jeremy's scheme, even as he anticipates being dragged down by their inevitable failure."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_6_1'})
    ON CREATE SET
        oi.description = 'The MetricShift lanyard is prominently worn by Super Hans, serving as an ironic emblem of corporate affiliation despite his outsider status, and emphasizing the surreal ambition of the conversation.',
        oi.status_before = 'Casually hanging around Super Hans\' neck, symbolizing a misplaced connection to the corporate world.',
        oi.status_after = 'It continues to serve as a visible, humorous reminder of the absurdity within their ambitious, corporate-disruptive dialogue.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_phone_event_6_4'})
    ON CREATE SET
        oi.description = 'Mark\'s phone acts as the messenger of corporate defeat. It vibrates in his hand, intruding upon his already fragile state with the unwelcome LinkedIn notification. The phone is the physical interface through which the digital world delivers its crushing blow, amplifying Mark\'s sense of inescapable corporate intrusion even in the supposed sanctuary of the pub.',
        oi.status_before = 'Silent and passive, likely resting in Mark\'s hand or pocket, connected to the network and awaiting notifications.',
        oi.status_after = 'Active and buzzing, displaying the LinkedIn notification on its screen, having successfully delivered its message of corporate validation for Jeremy and failure for Mark. It remains in Mark\'s hand, a constant reminder of the digital intrusion.'
    WITH oi
    MATCH (o:Object {uuid: 'object_phone'})
    MATCH (e:Event {uuid: 'event_6_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_notification_event_6_4'})
    ON CREATE SET
        oi.description = 'The LinkedIn notification is the digital dagger that twists in Mark\'s corporate wounds. It materializes on his phone screen, a concise and brutal summary of his professional inadequacy as perceived by the archetypal corporate drone, Steve from accounts. The notification is the embodiment of corporate validation bestowed upon the undeserving, highlighting the perverse nature of success in Mark\'s eyes and deepening his despair.',
        oi.status_before = 'Non-existent in Mark\'s immediate awareness, pending in the digital realm, waiting to be triggered by Steve\'s endorsement and pushed to Mark\'s device.',
        oi.status_after = 'Delivered and displayed on Mark\'s phone, actively being read and processed by Mark, inflicting maximum emotional damage and serving as the catalyst for his deepening despair and desire for another drink.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_notification'})
    MATCH (e:Event {uuid: 'event_6_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_drinks_event_6_5'})
    ON CREATE SET
        oi.description = 'The assorted celebratory beverages serve as a sharp contrast to Mark’s solitary drink; they underscore the festivity and success enjoyed by Jeremy and Super Hans, further intensifying Mark\'s sense of isolation and failure.',
        oi.status_before = 'Drinks were part of the celebratory milieu, imbued with the energy of corporate triumph and shared revelry.',
        oi.status_after = 'Their state remains celebratory and untouched by Mark, symbolizing the divide between his dejection and the group\'s exuberance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_drinks'})
    MATCH (e:Event {uuid: 'event_6_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_5'})
    ON CREATE SET
        oi.description = 'The warm white wine, clutched by Mark, acts as a physical manifestation of his inner despair and resigned acceptance of his professional humiliation.',
        oi.status_before = 'It was already lukewarm and imbued with a sense of forlorn, half-hearted sophistication.',
        oi.status_after = 'It continues to symbolize his defeat, now carrying even more weight as he uses it as a desperate solace to numb his discomfort.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Super Hans leans in conspiratorially toward Jeremy, exuding chaotic confidence while sporting the inexplicable MetricShift lanyard.',
        ap.emotional_state = 'Radiates misplaced excitement and wild optimism, unperturbed by conventional corporate norms.',
        ap.emotional_tags = ["Radiates misplaced excitement", "wild optimism, unperturbed by conventional corporate norms."],
        ap.active_plans = ["Publicly declare Jeremy\u2019s sound therapy venture as a revolutionary global phenomenon.", "Position himself as a key player in a new era of corporate disruption."],
        ap.beliefs = ["Believes that unorthodox, disruptive ideas are the future of corporate success.", "Is convinced that his past venture, despite its failure, proves his visionary capability."],
        ap.goals = ["To outshine his previous crypto-mindfulness app by predicting and catalyzing global sonic domination.", "To cement his status as a pioneer in blending counterculture with corporate initiatives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy listens intently while celebrating his accidental corporate breakthrough, exuding a mix of focus and oblivious glee.',
        ap.emotional_state = 'Appears both self-assured and enthusiastically deluded about the potential of his sound solutions.',
        ap.emotional_tags = ["Appears both self-assured", "enthusiastically deluded about the potential of his sound solutions."],
        ap.active_plans = ["Promote his scientifically optimized sound solutions as a game-changing corporate tool."],
        ap.beliefs = ["Believes that his innovative approach to sound therapy will disrupt traditional corporate settings.", "Is convinced that his newfound corporate success is a validation of his radical ideas."],
        ap.goals = ["To achieve global recognition and market penetration with his sound optimization strategy.", "To transform what he perceives as a breakthrough into long-term corporate success."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy is in full celebratory mode at The Fox & Goose pub, animatedly discussing his corporate soundscapes with Super Hans. He gestures expansively as he lays out his vision for global domination from their corner table, fueled by the initial success of his pitch.',
        ap.emotional_state = 'Jeremy is euphoric and brimming with self-confidence, riding high on the perceived validation from MetricShift and the enthusiastic support of Super Hans. He feels vindicated and believes he\'s on the cusp of a major breakthrough, oblivious to the absurd reality of his situation.',
        ap.emotional_tags = ["Jeremy is euphoric", "brimming with self-confidence, riding high on the perceived validation from MetricShift", "the enthusiastic support of Super Hans. He feels vindicated", "believes he's on the cusp of a major breakthrough, oblivious to the absurd reality of his situation."],
        ap.active_plans = ["Articulating and refining his vision for 'scientifically optimized sound solutions' to Super Hans, aiming for global corporate implementation.", "Strategizing next steps for expanding beyond MetricShift, envisioning a worldwide reach for his soundscapes."],
        ap.beliefs = ["His 'scientifically optimized sound solutions' are genuinely innovative and universally desirable for corporations.", "He has discovered a crucial element for workplace productivity, comparable to 'legal drugs' in its effectiveness and appeal.", "Global corporate adoption is not just possible but inevitable, given the inherent brilliance of his soundscapes."],
        ap.goals = ["To see his sound solutions implemented in every office globally.", "To establish himself as a leading figure in corporate wellness and productivity through sound.", "To achieve worldwide recognition and financial success through his 'scientifically optimized soundscapes'."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Mark is seated at the corner table, his warm white wine untouched and his gaze fixed into the distance as his inner thoughts cut through the festive clamor around him.',
        ap.emotional_state = 'Overwhelmed by simmering resentment and profound bewilderment, his internal voice drips with dark humor as he juxtaposes Jeremy\'s accidental corporate ascent against his own growing disillusionment.',
        ap.emotional_tags = ["Overwhelmed by simmering resentment", "profound bewilderment, his internal voice drips with dark humor as he juxtaposes Jeremy's accidental corporate ascent against his own growing disillusionment."],
        ap.active_plans = ["Internally dissect and lament the absurdity of corporate success, while remaining a passive observer at the pub."],
        ap.beliefs = ["Success in the corporate world is less about competence and more about sheer, irrational luck or delusion.", "Jeremy's ascent is emblematic of a world that rewards misunderstanding over genuine skill."],
        ap.goals = ["Mentally process and articulate the bitter irony of his situation.", "Survive the evening while stewing in his existential crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Mark sits hunched over a corner table in the pub, the warm white wine in his glass untouched for a moment. His hand, previously wrapped around the stem of the glass, now grips his buzzing phone, his eyes fixed on the screen displaying the LinkedIn notification. He is physically present but mentally retreating further into his spiraling thoughts.',
        ap.emotional_state = 'Mark is drowning in despair and humiliation. The notification is the final nail in the coffin of his corporate aspirations, confirming his deepest fears of being overlooked and outpaced by the undeserving. His internal monologue is a mix of sardonic resignation and bitter self-pity.',
        ap.emotional_tags = ["Mark is drowning in despair", "humiliation. The notification is the final nail in the coffin of his corporate aspirations, confirming his deepest fears of being overlooked", "outpaced by the undeserving. His internal monologue is a mix of sardonic resignation", "bitter self-pity."],
        ap.active_plans = ["Contemplating ordering another drink to numb the sting of the notification.", "Internally dissecting the absurdity of the corporate world and his place within it."],
        ap.beliefs = ["Believes in a meritocratic corporate system, despite all evidence to the contrary.", "Holds a deep-seated conviction that he is more competent and deserving than Jeremy and Steve from accounts.", "Increasingly believes the corporate world is nonsensical and driven by factors other than actual skill or talent."],
        ap.goals = ["Short-term goal: To alleviate his immediate emotional pain through alcohol.", "Long-term goal (unspoken): To find a way to navigate or escape the corporate world that seems to be constantly rejecting him, although this goal feels increasingly distant and unattainable."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_steve_from_accounts_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Steve from accounts is digitally present, his action manifested as a LinkedIn endorsement delivered to Mark\'s phone. He remains physically absent from the pub, existing only as a name and a corporate persona within the digital notification.',
        ap.emotional_state = 'Likely oblivious and professionally neutral, or perhaps mildly positive towards Jeremy. Steve probably feels a sense of corporate camaraderie or simply sees endorsing Jeremy as a routine professional networking gesture. There is no indication he is aware of or intends any malice towards Mark.',
        ap.emotional_tags = ["Likely oblivious", "professionally neutral, or perhaps mildly positive towards Jeremy. Steve probably feels a sense of corporate camaraderie or simply sees endorsing Jeremy as a routine professional networking gesture. There is no indication he is aware of or intends any malice towards Mark."],
        ap.active_plans = ["To publicly endorse Jeremy for 'Digital Transformation' and 'Change Management' on LinkedIn.", "Potentially to enhance his own professional visibility and network within MetricShift."],
        ap.beliefs = ["Believes in the value of LinkedIn endorsements as a form of professional currency.", "Accepts or superficially understands the corporate buzzwords 'Digital Transformation' and 'Change Management' as meaningful skills.", "May believe that endorsing Jeremy aligns with company culture or perceived corporate trends."],
        ap.goals = ["To complete the LinkedIn endorsement action.", "Potentially to foster a positive professional relationship with Jeremy and be seen as supportive within the company."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'})
    ON CREATE SET
        ap.current_status = 'Mark sits at the corner table, isolated and disheartened, nursing his lukewarm warm white wine while watching the festivities around him.',
        ap.emotional_state = 'Defeated and overwhelmed, his internal sorrow and professional humiliation are palpable as he submits to his resignation with each sip.',
        ap.emotional_tags = ["Defeated", "overwhelmed, his internal sorrow", "professional humiliation are palpable as he submits to his resignation with each sip."],
        ap.active_plans = ["Attempting to momentarily escape his professional inadequacies through another drink."],
        ap.beliefs = ["He believes that the corporate world is absurd and that his own failures are inevitable in the face of others' misplaced successes."],
        ap.goals = ["Short-term: to numb his pain and momentarily disconnect from his feelings of inadequacy.", "Long-term: to find a way out of his perpetual cycle of self-defeating corporate misery."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_mark_bedroom_apollo_house_croydon'})
    MERGE (a)-[:LOCATED_IN]->(b);
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
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_living_room_apollo_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite'})
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
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_metricshift_executive_boardroom_disruption_chamber'})
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
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_mark_and_jeremy_flat_kitchen'})
    MERGE (a)-[:LOCATED_IN]->(b);
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
MATCH (a:Event {uuid: 'event_5_3'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_2'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Location {uuid: 'location_fox_and_goose_pub_croydon_high_street'})
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
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_steve_from_accounts'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_steve_from_accounts_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_steve_from_accounts_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_5'}),
          (b:Event {uuid: 'event_6_5'})
    MERGE (a)-[:IN_EVENT]->(b);
