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
        a.description = 'Mark Corrigan is a perpetually anxious middle-manager whose inner turmoil and ironic observations of corporate life expose his deep-seated self-scrutiny and dread of obsolescence. He struggles to maintain personal dignity in the chaotic, fast-paced digital workplace, embodying both tragedy and dark humor in a corporate environment full of digital innovation challenges.',
        a.traits = ["anxious", "self-critical", "ironic", "cautious"],
        a.sphere_of_influence = 'Corporate environment and digital workplace anxiety'
    ;
MERGE (a:Agent {uuid: 'agent_jeremy_usbourne'})
    ON CREATE SET
        a.name = 'Jeremy Usbourne',
        a.title = 'None',
        a.description = 'Jeremy Usbourne bursts forth with flamboyant energy and audacious ambition. His visionary ideas on a global network of scientifically optimized sound solutions blur the lines between innovation and reckless bravado, positioning him as a disruptor capable of unsettling the established corporate norms.',
        a.traits = ["enthusiastic", "reckless", "innovative", "charismatic"],
        a.sphere_of_influence = 'Corporate innovation and creative disruption'
    ;
MERGE (a:Agent {uuid: 'agent_steve_from_accounts'})
    ON CREATE SET
        a.name = 'Steve from Accounts',
        a.title = 'None',
        a.description = 'Steve from Accounts is celebrated for his unconventional approach within the corporate maze. Known primarily through a LinkedIn endorsement, his quirky resourcefulness and unexpected digital achievements highlight his ability to navigate routine processes with unorthodox problem-solving tactics.',
        a.traits = ["quirky", "resourceful", "unconventional", "ambitious"],
        a.sphere_of_influence = 'Corporate digital processes and unorthodox problem-solving'
    ;
MERGE (a:Agent {uuid: 'agent_super_hans'})
    ON CREATE SET
        a.name = 'Super Hans',
        a.title = 'None',
        a.description = 'Super Hans is a freewheeling maverick known for his unpredictable and countercultural approach. With offbeat humor and a disdain for convention, he introduces chaotic yet visionary ideas, as seen when he unexpectedly dons a MetricShift lanyard. His wild creativity underscores his role as a cult figure within disruptive technology and countercultural innovation.',
        a.traits = ["unpredictable", "rebellious", "visionary", "quirky"],
        a.sphere_of_influence = 'Disruptive technology and countercultural innovation'
    ;
MERGE (a:Agent {uuid: 'agent_charlotte_walsh_henderson'})
    ON CREATE SET
        a.name = 'Charlotte Walsh-Henderson',
        a.title = 'None',
        a.description = 'Charlotte Walsh-Henderson is a seasoned executive with extensive expertise in digital transformation and corporate innovation. Her authoritative and pragmatic approach is evident when she decisively signs up disruptive figures for major corporate initiatives, positioning her as a stabilizing force amid the tumult of digital change.',
        a.traits = ["authoritative", "pragmatic", "perceptive", "steadfast"],
        a.sphere_of_influence = 'Digital transformation and corporate innovation'
    ;
MERGE (a:Agent {uuid: 'agent_alan_johnson'})
    ON CREATE SET
        a.name = 'Alan Johnson',
        a.title = 'CEO',
        a.description = 'Alan Johnson is the composed and analytical CEO of Johnson Dynamic Solutions. With a strategic focus on merger negotiations and corporate strategy, he keeps a keen eye on transformative potential in the boardroom while maintaining a calm and observant demeanor amid disruptive industry innovations.',
        a.traits = ["composed", "analytical", "observant", "strategic"],
        a.sphere_of_influence = 'Corporate strategy and merger negotiations'
    ;
MERGE (o:Object {uuid: 'object_ikea_markus_desk_chair'})
    ON CREATE SET
        o.name = 'IKEA Markus Desk Chair',
        o.description = 'A well-used, creaking desk chair from IKEA that supports Mark during his early mornings of anxious digital engagement. The chair’s worn fabric and constant creaks underline the everyday struggles of balancing professionalism with personal chaos.',
        o.purpose = 'To provide seating during Mark\'s work-from-home routines and digital engagements.',
        o.significance = 'Symbolizes the enduring, mundane challenges of maintaining a professional facade amid personal insecurities.'
    ;
MERGE (o:Object {uuid: 'object_hp_laptop'})
    ON CREATE SET
        o.name = 'HP Laptop',
        o.description = 'A functional HP laptop that serves as the window to the digital world with its glowing screen displaying Mark\'s constant battle with career metrics, LinkedIn refreshes, and spreadsheets.',
        o.purpose = 'To facilitate Mark\'s daily work tasks and digital communications.',
        o.significance = 'Represents the omnipresent digital pressures that exacerbate personal and professional anxieties.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_employee_certificate'})
    ON CREATE SET
        o.name = 'Employee of the Month Certificate',
        o.description = 'A MetricShift Digital \'Employee of the Month (August 2023)\' certificate that hangs askew on the wall, surrounded by other memorabilia. It is a testament to a momentary burst of achievement amidst ongoing personal and professional challenges.',
        o.purpose = 'To serve as a visual marker of corporate recognition and fleeting success.',
        o.significance = 'Highlights the tension between celebrated achievements and the underlying fear of inadequacy.'
    ;
MERGE (o:Object {uuid: 'object_dartmouth_business_diploma'})
    ON CREATE SET
        o.name = 'Dartmouth Business Studies Diploma',
        o.description = 'An academic diploma from Dartmouth Business Studies, now gathering dust as a relic of past ambitions. It hangs near the certificate, evoking memories of hopeful beginnings that sharply contrast with current professional struggles.',
        o.purpose = 'To symbolize Mark\'s formal education and earlier aspirations in the business world.',
        o.significance = 'Serves as a poignant reminder of the disparity between academic achievements and current career realities.'
    ;
MERGE (o:Object {uuid: 'object_interview_suit'})
    ON CREATE SET
        o.name = 'Interview Suit',
        o.description = 'A well-worn suit originally belonging to Mark, later repurposed by Jeremy in a burst of reckless corporate bravado. This suit has witnessed critical career moments including interviews and high-stake pitches, underscoring the absurdity and desperation of professional reinvention.',
        o.purpose = 'To project an image of professionalism and readiness during pivotal corporate encounters.',
        o.significance = 'Embodies the ironic tension between maintaining a refined corporate image and the chaotic reality of career ambitions.'
    ;
MERGE (o:Object {uuid: 'object_cracked_mirror'})
    ON CREATE SET
        o.name = 'Cracked Mirror',
        o.description = 'A blemished, broken mirror with visible fractures that distort its reflection. It serves as the backdrop for Jeremy\'s pitch rehearsals and symbolizes the fragmented nature of ambition and the stark imperfections within the corporate narrative.',
        o.purpose = 'To provide a reflective surface for self-rehearsal and introspection during high-stakes pitching moments.',
        o.significance = 'Underscores themes of fractured identity and the clash between bold aspirations and personal vulnerability.'
    ;
MERGE (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    ON CREATE SET
        o.name = 'Networking Emergency Protocols Index Cards',
        o.description = 'A stack of meticulously arranged, color-coded index cards that document various networking strategies and potential social mishaps. They manifest Mark\'s intense anxiety and his desperate need to control every aspect of his professional interactions.',
        o.purpose = 'To assist Mark in systematically managing networking challenges and preventing social disasters during corporate events.',
        o.significance = 'Symbolizes Mark\'s obsessive approach to crisis management and his constant battle with the overwhelming pressures of modern corporate life.'
    ;
MERGE (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    ON CREATE SET
        o.name = 'LinkedIn Premium Name Badge',
        o.description = 'A meticulously designed professional name badge that symbolizes corporate identity and authenticity. It is a key accessory at MetricShift Digital, representing both the promise of professionalism and the underlying anxiety of maintaining one\'s reputation.',
        o.purpose = 'To visibly affirm professional status and brand identity within the corporate environment.',
        o.significance = 'Serves as a tangible symbol of Mark Corrigan\'s desperate attempts to project success amidst his inner turmoil.'
    ;
MERGE (o:Object {uuid: 'object_dj_equipment'})
    ON CREATE SET
        o.name = 'DJ Equipment',
        o.description = 'A sophisticated array of sound mixing consoles, amplifiers, and digital controllers set up by Jeremy to deliver a disruptive productivity soundscape. Borrowed from Super Hans\' silent disco business, the equipment merges creative chaos with corporate theatrics.',
        o.purpose = 'To produce and project a chaotic, scientifically-engineered productivity soundscape during presentations.',
        o.significance = 'Symbolizes the merging of creative chaos with corporate innovation, challenging traditional business paradigms.'
    ;
MERGE (o:Object {uuid: 'object_metricshift_lanyard'})
    ON CREATE SET
        o.name = 'MetricShift Lanyard',
        o.description = 'A corporate lanyard boldly emblazoned with the MetricShift Digital logo. Originally belonging to Mark Corrigan, its unexpected appearance on Super Hans adds layers of irony and commentary on corporate affiliation versus personal chaos.',
        o.purpose = 'To signify corporate affiliation and secure access to professional environments.',
        o.significance = 'Symbolizes the weight of professional expectations and the absurdity of corporate branding within personal expression.'
    ;
MERGE (o:Object {uuid: 'object_super_hans_laptop_mindcoin'})
    ON CREATE SET
        o.name = 'Super Hans\' Laptop with MindCoin',
        o.description = 'A well-worn laptop used by Super Hans, with a screen displaying the fragmented remains of the hacked cryptocurrency project \'MindCoin.\' Its marks of digital residue reflect chaotic innovation and a countercultural approach to technology.',
        o.purpose = 'To serve as the digital canvas for demonstrating his hacked cryptocurrency project.',
        o.significance = 'Reflects the blend of innovative technology with creative rebellion, mirroring its owner\'s unorthodox methods.'
    ;
MERGE (o:Object {uuid: 'object_blockchain_meditation_printouts'})
    ON CREATE SET
        o.name = 'Printouts about Blockchain and Meditation Apps',
        o.description = 'A scattered collection of paper printouts detailing ideas about integrating blockchain technology with meditation apps. The documents are hastily annotated, reflecting an eccentric and unconventional approach to innovation.',
        o.purpose = 'To illustrate the merging of innovative digital ideas with mindfulness practices.',
        o.significance = 'Highlights the surreal intersection of technology and personal enlightenment, emphasizing modern corporate innovation\'s eccentricities.'
    ;
MERGE (o:Object {uuid: 'object_warm_white_wine'})
    ON CREATE SET
        o.name = 'Warm White Wine',
        o.description = 'A glass of warm white wine that Mark Corrigan nurses slowly at a corner table. Its imperfect temperature mirrors his internal state, serving as a quiet testament to the stress and resignation underlying his corporate existence.',
        o.purpose = 'To provide a momentary escape and mitigate the growing tension of corporate dread.',
        o.significance = 'Represents Mark\'s personal resignation and the ironic comfort found in indulgence during stressful moments.'
    ;
MERGE (l:Location {uuid: 'location_marks_bedroom_apollo_house_croydon'})
    ON CREATE SET
        l.name = 'Mark\'s Bedroom - Apollo House, Croydon',
        l.description = 'Mark\'s Bedroom in Apollo House, Croydon, is a cramped and anxiety-infused personal space that doubles as a shrine to corporate ambition. The room is cluttered with work artifacts including a creaking IKEA Markus desk chair, a glowing HP laptop, and a gallery of certificates and diplomas, reflecting a desperate bid for professionalism paired with palpable isolation as personal dreams clash with relentless corporate pressures.',
        l.type = 'Bedroom'
    ;
MERGE (l:Location {uuid: 'location_living_room_apollo_house'})
    ON CREATE SET
        l.name = 'Living Room - Apollo House',
        l.description = 'The living room in Apollo House is a cluttered, anxiety-ridden space that doubles as a stage for desperate corporate reinvention. Cracked mirrors reflect fragmented self-images, while empty Red Bull cans and printouts of Gary Vaynerchuk quotes underscore a chaotic attempt to merge creative energy with corporate desperation. This room embodies the tension between professional ambition and personal disarray.',
        l.type = 'Living Room'
    ;
MERGE (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite_14th_floor'})
    ON CREATE SET
        l.name = 'MetricShift Digital Solutions HQ - Canary Wharf Innovation Suite, 14th Floor',
        l.description = 'Located at the bustling heart of Canary Wharf, this expansive suite on the 14th floor serves as a modern canvas for innovation. Known as the \'Ideation Zone\', the space is transformed each month for the Innovation Sundowner, with fairy lights outlining whiteboards plastered with buzzwords. The meticulous arrangement of kombucha and fruit-infused water stations fuses sleek corporate design with a creative, energetic spirit.',
        l.type = 'Office'
    ;
MERGE (l:Location {uuid: 'location_metricshift_executive_boardroom_the_disruption_chamber'})
    ON CREATE SET
        l.name = 'MetricShift Executive Boardroom - The Disruption Chamber',
        l.description = 'The boardroom, rechristened as \'The Disruption Chamber\', is a striking space where corporate tradition clashes with innovative flair. Modern and sleek, the room is outfitted with state-of-the-art audiovisual equipment and disruptive design elements including bold artwork and nods to corporate rebranding, such as subtle references to the Herman Miller aesthetic. This venue exudes authority mixed with a rebellious energy, serving as the dynamic launchpad for transformative yet chaotic corporate presentations.',
        l.type = 'Boardroom'
    ;
MERGE (l:Location {uuid: 'location_mark_and_jeremys_flat_kitchen'})
    ON CREATE SET
        l.name = 'Mark and Jeremy\'s Flat - Kitchen',
        l.description = 'The kitchen in Mark and Jeremy\'s flat is a unique hybrid of domestic comfort and chaotic innovation. Amid daily routines such as making tea, the space is cluttered with entrepreneurial elements—printouts on blockchain and meditation apps scatter the table, with ambient sounds heightening the surreal mix of casual living and disruptive ideas. The setting captures the collision between personal life and the unpredictable world of digital innovation.',
        l.type = 'Apartment Kitchen'
    ;
MERGE (l:Location {uuid: 'location_fox_and_goose_pub_croydon_high_street'})
    ON CREATE SET
        l.name = 'The Fox & Goose Pub - Croydon High Street',
        l.description = 'The Fox & Goose Pub on Croydon High Street is a warmly lit, bustling establishment exuding cozy charm blended with subtle urban grit. Rich wooden interiors, ambient lighting, and a heady mix of chatter and background music create an inviting atmosphere, providing a momentary escape for corporate characters amid an environment of both comfort and underlying tension.',
        l.type = 'Pub'
    ;
MERGE (o:Organization {uuid: 'org_metricshift_digital'})
    ON CREATE SET
        o.name = 'MetricShift Digital',
        o.description = 'MetricShift Digital is a corporate powerhouse that drives innovative digital solutions, blending the pressures of modern business with cutting-edge technologies. Its influence permeates the professional landscape by constantly reinventing corporate practices through disruptive ideas and unifying individuals who are both challenged and inspired by its ethos.',
        o.sphere_of_influence = 'Digital innovation and corporate transformation'
    ;
MERGE (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    ON CREATE SET
        o.name = 'Johnson Dynamic Solutions',
        o.description = 'Johnson Dynamic Solutions is a forward-thinking corporate entity led by Alan Johnson, focusing on dynamic business strategies and innovative technological integrations. Positioned as a potential merger partner to larger digital firms, the organization emphasizes strategic growth and transformative corporate practices, leveraging disruptive innovations to secure a competitive edge in an ever-evolving market landscape.',
        o.sphere_of_influence = 'Corporate technology solutions and strategic mergers'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_networking_event'})
    ON CREATE SET
        ep.title = 'Episode One - The Networking Event',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Corporate Anxiety at Dawn',
        s.description = 'At 6:47 AM in Mark Corrigan\'s modest bedroom at Apollo House, Croydon, the oppressive weight of corporate dread is palpable. Mark, clad in a TM Lewin shirt and M&S boxers, sits in his creaky IKEA Markus desk chair, his anxious eyes flitting between a glowing HP laptop and a meticulously maintained \'Career Crisis Management\' spreadsheet. His MetricShift Digital \'Employee of the Month (August 2023)\' certificate and a dusty Dartmouth Business Studies diploma hang askew, symbols of a career caught in a perpetual cycle of near misses. This scene not only lays bare Mark’s inner turmoil but also sets the stage for disruptive interference when an uninvited presence shatters the fragile order of his morning routine.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_marks_bedroom_apollo_house_croydon'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Mark\'s Melancholic Realization',
        e.description = 'In the quiet predawn hush, Mark’s inner voice overflows with corporate anxiety. Seated before his HP laptop, he scrolls through LinkedIn notifications and his \'Career Crisis Management\' spreadsheet, each digital alert deepening his self-doubt. The sight of Steve from Accounts’ latest achievement—a new post marking yet another corporate milestone—sparks a painful introspection. Amid the sterile surroundings and the creak of his IKEA Markus chair, every misplaced certificate and weathered diploma intensifies the realization of his stagnant professional life. This moment encapsulates his internal struggle against the relentless pressure of corporate expectations.',
        e.sequence = 1,
        e.key_dialogue = ["MARK (V/O): God, Steve from accounts has done another 'humbled to announce' post. He's got a Microsoft Excel certification. The digital revolution is eating its children."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Jeremy\'s Disruptive Entrance',
        e.description = 'The fragile equilibrium of Mark’s morning is abruptly shattered by an energetic intrusion. Jeremy Usbourne bursts into the room, dramatically clad in Mark’s old interview suit—an artifact of career emergencies—and accessorized absurdly with festival wristbands and a \'Web3 Visionary\' pin badge. His entrance is a collision of unbridled optimism and chaotic innovation, counterpointing Mark’s mounting despair. Jeremy’s boisterous declaration and overdone charisma not only challenge the stifling corporate order but also force Mark to confront the looming reality of his irrelevance. This clash of personas heightens the tension, setting in motion a spiral of disruptive events.',
        e.sequence = 2,
        e.key_dialogue = ["JEREMY (O.S.): Mark! Mark! The corporate world won't know what hit it! I've mastered the LinkedIn algorithm!", "JEREMY: How do I look? Professional enough for the MetricShift Innovation Sundowner?", "MARK: That's my interview suit from the Johnson account pitch. It was in the box marked 'Career Emergency Kit - Do Not Touch Under Any Circumstances.'"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'A Pitch Amid Corporate Chaos',
        s.description = 'In this vividly charged living room at Apollo House, the atmosphere is a blend of corporate anxiety and unbridled creative ambition. The space is cluttered with empty Red Bull cans, hastily strewn printouts of motivational quotes, and the harsh presence of a cracked mirror that reflects the absurdity of its occupants. Ambient lighting accentuates the worn, lived-in feel of the room, while the muted background sounds heighten the tension. Here, Jeremy’s desperate attempt to reinvent himself as a visionary collides with Mark’s cynical, anxious efforts to keep his career afloat. The scene encapsulates the collision of misguided entrepreneurial fervor and paralyzing corporate self-doubt, setting the stage for dramatic character interplay and underlying themes of obsolescence versus reinvention.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_living_room_apollo_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Jeremy\'s Pitch Unleashed',
        e.description = 'In the midst of the disordered living room, Jeremy stands before a cracked mirror, adopting an air of determined disruption. He passionately launches into his pitch, declaring himself a disruptor in the sonic arts space. His monologue is an amalgam of tech buzzwords and grandiose assertions that blur the line between genuine ambition and delusional self-promotion. Jeremy’s performance is both comedic and tragic—a desperate bid to validate his relevance in a corporate world that has eagerly transformed a misfit into a supposed visionary.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: I'm a disruptor in the sonic arts space, leveraging unique audio paradigms to create transformative experiences. Former projects include the critically acclaimed 'Sounds of the Serviced Office' EP."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Mark\'s Reproach and Corporate Dread',
        e.description = 'As Jeremy’s self-assured pitch reverberates off the cracked mirror, Mark’s anxiety reaches a boiling point. Shuffling through his meticulously organized Networking Emergency Protocols index cards, he internally and then audibly critiques the absurdity unfolding before him. His internal monologue draws a parallel between Jeremy’s farcical claims and the bygone era of corporate jargon. Mark’s cautionary interjection—urging Jeremy to avoid overused platitudes—reveals his deep-seated fear of professional ruin. The ensuing dialogue encapsulates a clash of perspectives; one voice clinging desperately to outdated corporate hierarchies, the other striving, however misguidedly, toward reinvention.',
        e.sequence = 2,
        e.key_dialogue = ["MARK (V/O): He recorded the office printer at his uncle's accounting firm while high on ketamine. And now he's going to present it to Charlotte Walsh-Henderson as a productivity solution. This must be how Brutus felt watching Caesar walk into the Senate.", "MARK: Jeremy, please don't say paradigm. Nobody's said paradigm since Northern Rock collapsed.", "JEREMY: Mark, I've done my research. I've watched three TED talks and followed Gary Vee on Instagram. I'm basically a CEO already."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Corporate Innovation Confrontation',
        s.description = 'The scene unfolds on the 14th floor of MetricShift Digital Solutions HQ, in the freshly transformed Ideation Zone at Canary Wharf. Fairy lights trace the edges of buzzword-filled whiteboards, while kombucha stations are meticulously arranged under the supervision of Charlotte Walsh-Henderson. Amidst this modernized office space, the tension is palpable as Mark Corrigan hovers by the fruit-infused water station, acutely aware of every detail—from the precise placement of his LinkedIn Premium name badge to the impending collision of conventional career angst with unorthodox innovation. This scene exposes the deep fissures within corporate identity, illustrating both the vibrancy of disruptive ideas and the anxiety of those who feel left behind. With a mix of humor and dread, the scene sets the stage for transformative, if chaotic, momentums in the characters’ trajectories.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite_14th_floor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Anxiety at the Water Station',
        e.description = 'Mark Corrigan is overwhelmed by a paralyzing sense of dread as he lurks near the fruit-infused water station, obsessively straightening his LinkedIn Premium name badge. In a private internal monologue, he compares his predicament to historical absurdities and foresees his own professional downfall. The internal commentary not only reveals his acute insecurity but also underscores the high stakes of this gathering, where unconventional ideas threaten the established order of corporate convention. His reflections are laced with dark humor and the bitter taste of impending career disaster.',
        e.sequence = 1,
        e.key_dialogue = ["MARK (V/O): Oh god, he's approaching Charlotte. Don't mention the band, don't mention the ketamine sound installation at the Croydon Buddhist Centre...", "MARK (V/O): The grown-ups are giving Jeremy real responsibilities. This must be what it felt like when Caligula made his horse a senator."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Pitch of Unorthodox Innovation',
        e.description = 'Charlotte initiates a formal yet curious dialogue with Jeremy as she probes the essence of his unconventional approach to boosting productivity. Amid the ambient hum of the transformed Ideation Zone, Jeremy confidently outlines his revolutionary idea—merging sonic frequencies with a dash of corporate moxie—to transform workplace meditation. His pitch, delivered with a mix of audacity and hesitancy, challenges the rigid norms of corporate culture while captivating the room with visions of a digitally transformed future. The exchange is the narrative pivot where innovative audacity begins to overshadow traditional corporate inertia, signaling a potential shift in the power dynamics of the office.',
        e.sequence = 2,
        e.key_dialogue = ["CHARLOTTE: So, Jeremy, Mark tells me you're in the sonic optimization space? We've been looking for innovative solutions since the Great Algorithm Crisis of '23.", "JEREMY: Absolutely. We're harnessing alpha waves and beta frequencies to revolutionize workplace productivity. It's like mindfulness meets blockchain meets that feeling when you've just had exactly the right amount of drugs... I mean, coffee."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Disruption Chamber Unleashed',
        s.description = 'Inside the MetricShift Executive Boardroom, known as The Disruption Chamber, the corporate order is challenged by a bold surge of creative chaos. The sleek, modern boardroom on the 14th floor of MetricShift Digital Solutions HQ exudes a polished yet tense energy, accented by cutting-edge technology and minimalist design. Here, an audacious display of disruptive innovation unfolds as Jeremy Usbourne transforms the room into a makeshift digital concert hall, setting up DJ equipment amidst high-stakes corporate maneuverings. The atmosphere is charged with anticipatory anxiety, ambition, and the undercurrent of rebellion. This scene not only foregrounds the clash between tradition and innovation but also reveals shifting power dynamics and the unpredictable evolution of modern corporate culture.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_metricshift_executive_boardroom_the_disruption_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'The Pitch Revelation',
        e.description = 'In the cool, high-tech environment of the Disruption Chamber, Jeremy Usbourne steps forward with an air of audacious innovation as he introduces his radical idea. He proclaims that the audience is about to experience a \'scientifically-engineered productivity soundscape,\' setting the stage for an unorthodox corporate performance. As he readies the borrowed DJ equipment, his declaration confounds and excites the gathered decision-makers. Meanwhile, Mark Corrigan, ever the anxious observer, internally navigates a mix of dread and bemusement over the impending disruption, foreseeing how this audacious pitch could upend his carefully managed career.',
        e.sequence = 1,
        e.key_dialogue = ["JEREMY: What you're about to experience is a scientifically-engineered productivity soundscape, developed through extensive research at the Croydon Buddhist Centre.", "MARK (V/O): He's going to play his 'Chemical Brothers meets whale sounds' playlist to the entire senior management team. I wonder if Pret is still hiring? I could work my way up to sandwich artisan, live a simple life of honest toil..."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Chaotic Performance and Corporate Endorsement',
        e.description = 'As the tension heightens, Jeremy activates the DJ equipment, unleashing a wild blend of electronic beats, office printer drones, and enigmatic chants that reverberate through the boardroom. The cacophony symbolically shatters the staid atmosphere of corporate order, triggering a moment of disruptive clarity. CEO Alan Johnson, watching intently, seizes this unexpected performance as exactly the innovative push the company needs. He instructs Charlotte Walsh-Henderson to fast-track the initiative, validating Jeremy\'s offbeat creativity. Amid the unfolding chaos, Mark Corrigan\'s inner monologue reveals his growing terror at the prospect of being overshadowed by this flamboyant new force.',
        e.sequence = 2,
        e.key_dialogue = ["JOHNSON: This is exactly what we need. Raw, disruptive, authentically digital. Charlotte, sign him up for the full rollout.", "MARK (V/O): Jeremy's going to get a corporate job before me. I'm going to end up working in his sonic optimization department. Maybe the French Foreign Legion is still recruiting?"]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'SonicChain Sparks in a Cluttered Kitchen',
        s.description = 'In the modest confines of Mark and Jeremy\'s flat kitchen, an unusual blend of innovation and absurdity fills the air. The space is cluttered with a mix of domestic disarray and entrepreneurial chaos—a battered laptop displaying the remnants of a hacked cryptocurrency project sits amid scattered printouts of blockchain theories and meditation app notes. The ambient sound of tea being prepared melds with excited banter as Super Hans and Jeremy conspire a wild new venture, while Mark’s impending arrival promises an inevitable collision between lofty dreams and corporate reality. The atmosphere crackles with both creative fervor and a sense of impending financial doom, setting the stage for radical ideas that might just upend the traditional corporate order.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_mark_and_jeremys_flat_kitchen'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'SonicChain Vision Unveiled',
        e.description = 'In the warmly lit kitchen, amidst a chaotic assortment of printed ideas on blockchain and meditation apps, Super Hans lays the groundwork for an audacious new venture. As Jeremy busies himself making tea, the conversation flows into a surprising blend of irreverence and genuine creative energy. Super Hans passionately outlines the concept of merging corporate sound therapy with his own mindfulness platform, dubbing the idea \'SonicChain.\' Jeremy, caught up in the moment, suggests amplifying its disruptive appeal by integrating NFTs—a proposal that injects a modern twist into the entrepreneurial discourse. This event sets the tone for a collision between radical creativity and established corporate norms.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is it, Jez. This is the big one. We combine your corporate sound therapy thing with what's left of my mindfulness platform. Call it 'SonicChain.' The suits'll love it.", "JEREMY: Hans, you're a genius. We could add NFTs somehow. Like, people buy the right to different frequency ranges."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Mark\'s Dismayed Entrance',
        e.description = 'The creative buzz is abruptly interrupted by the entrance of Mark Corrigan, whose presence adds an undercurrent of corporate anxiety to the unfolding scene. Clad in his MetricShift lanyard—a symbol of his entrapment in a bureaucratic world—Mark\'s arrival forces the innovators to confront the real implications of their radical ideas. His remark is laced with sarcasm and dread, hinting at an internal warning of professional catastrophe. As Super Hans dismissively encourages an even bolder vision, Mark’s inner voice reflects on the potential downfall that such unchecked ambition might bring, imbuing the event with tension and foreboding.',
        e.sequence = 2,
        e.key_dialogue = ["MARK: Oh good, Super Hans is here. I suppose you'll be wanting to pitch your crypto-mindfulness app to MetricShift as well?", "SUPER HANS: Mark, Mark, Mark. Think bigger. What's the one thing missing from corporate meditation? Exactly - the blockchain. That, and proper drugs. But we'll sort that out in phase two.", "MARK (V/O): Super Hans is going to end up on the board of directors. This is how the financial crisis started."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Corporate Banter at The Fox & Goose',
        s.description = 'In the dimly lit, timeworn enclave of The Fox & Goose Pub on Croydon High Street, the scene crackles with an undercurrent of corporate absurdity and personal despair. Mark Corrigan sits isolated in a corner, nursing a warm white wine that mirrors his quiet melancholy and the weight of countless professional missteps. Nearby, Jeremy Usbourne, brimming with misguided confidence, celebrates with Super Hans—a duo weaving grandiose dreams out of digital transformation and crypto-mindfulness. Their playful banter and over-the-top declarations collide with Mark\'s internal narrative of lost purpose and existential dread, creating a microcosm of modern corporate irony. The setting, with its muted chatter, clinking glasses, and subtle neon hints, reinforces the scene’s dual theme of ambition and disillusionment, marking a critical moment of introspection and character conflict.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_fox_and_goose_pub_croydon_high_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Celebratory Corporate Aspirations',
        e.description = 'At a corner table in the bustling pub, Jeremy Usbourne and Super Hans exchange exuberant banter about revolutionizing the corporate world. Their conversation, laced with absurd yet earnest ambition, centers on the promise of a globally impactful, scientifically optimized sound solution—a concept as far-fetched as it is infectious. Super Hans lauds his past ventures, mentioning how his crypto-mindfulness app, despite its hiccups, could surpass conventional innovation, while Jeremy envisions every office in the world transformed by his soundscape. This event sets the stage by highlighting the duo\'s reckless confidence and the clashing energies within the trio.',
        e.sequence = 1,
        e.key_dialogue = ["SUPER HANS: This is gonna be massive, Jez. Could be bigger than my crypto-mindfulness app. Before it got hacked by the Russians.", "JEREMY: I'm thinking global, Hans. Every office in the world, listening to my scientifically optimized sound solutions. It's basically legal drugs."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Mark\'s Quiet Despair',
        e.description = 'As the lively exchange of bold ideas continues at the table, a subtle yet significant moment unfolds for Mark Corrigan. His phone buzzes with a LinkedIn notification showing that Steve from Accounts has endorsed Jeremy for \'Digital Transformation\' and \'Change Management.\' This digital pat on the back, rather than uplifting, deepens Mark\'s sense of professional inadequacy and existential dread. Alone with his warm white wine, Mark\'s internal monologue reveals a bitter irony—one where Jeremy\'s meteoric rise in the corporate nonsense he never mastered throws Mark\'s own stagnation into starker relief. His resigned exclamation, \'I need another drink,\' punctuates the moment as a quiet admission of defeat.',
        e.sequence = 2,
        e.key_dialogue = ["MARK: I need another drink."]
    ;
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_from_accounts'}),
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
MATCH (o:Object {uuid: 'object_dartmouth_business_diploma'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_interview_suit'}),
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
MATCH (o:Object {uuid: 'object_metricshift_lanyard'}),
          (a:Agent {uuid: 'agent_mark_corrigan'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_super_hans_laptop_mindcoin'}),
          (a:Agent {uuid: 'agent_super_hans'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_steve_from_accounts'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (o:Organization {uuid: 'org_metricshift_digital'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (o:Organization {uuid: 'org_johnson_dynamic_solutions'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hp_laptop_event_1_1'})
    ON CREATE SET
        oi.description = 'The HP laptop is the central tool through which Mark confronts his professional anxieties; its glowing screen displays LinkedIn and the dreaded Career Crisis Management spreadsheet, making it an instrument of both connection and self-scrutiny. In this moment, the device serves as a relentless reminder of his digital performance, compelling him to compare his progress with that of others and heightening his sense of inadequacy as he refreshes for the umpteenth time.',
        oi.status_before = 'Prior to the event, the laptop functioned as Mark’s reliable workstation and portal to the digital corporate world, regularly used to manage his professional communications and performance metrics.',
        oi.status_after = 'Following the event, the laptop remains unchanged in its function but becomes imbued with emotional weight, symbolizing the unyielding pressure of metrics and the profound personal anxiety he endures.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hp_laptop'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_employee_certificate_event_1_1'})
    ON CREATE SET
        oi.description = 'The MetricShift Digital Employee of the Month certificate hangs askew in Mark’s bedroom, a misplaced emblem of past success that now starkly contrasts against the backdrop of his current self-doubt. It looms in the periphery as an ironic reminder of fleeting corporate validation. Its disordered display underscores the disarray in his professional life and magnifies the tension he feels every time he glances at it.',
        oi.status_before = 'Before the event, the certificate was a proud yet fragile token of a momentary achievement, displayed incongruously alongside other memorabilia from a more hopeful past.',
        oi.status_after = 'After the event, the certificate’s askew presence deepens in symbolic significance, mirroring Mark’s internal disorganization and the disconnect between his past accolades and present struggles.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_employee_certificate'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dartmouth_business_diploma_event_1_1'})
    ON CREATE SET
        oi.description = 'The Dartmouth Business Studies diploma, gathering dust near the certificate, represents an echo of once-bold aspirations that now seem unattainable. Its faded presence and neglected state amplify Mark’s sense of stagnation, serving as a quiet testament to his unfulfilled academic and professional ambitions. The diploma’s static form contrasts sharply with the dynamic turmoil Mark experiences as he navigates the digital markers of his career decline.',
        oi.status_before = 'Prior to the event, the diploma hung in the background as a revered, albeit outmoded, symbol of Mark’s initial optimism and academic promise.',
        oi.status_after = 'Following the event, the diploma remains physically unchanged, yet its symbolic weight increases as it underscores the passage of time and the widening gap between past dreams and present realities.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dartmouth_business_diploma'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_interview_suit_event_1_2'})
    ON CREATE SET
        oi.description = 'The interview suit, a relic of Mark’s past professional crises, is forcefully repurposed by Jeremy in a show of disruptive audacity. It serves as a tangible symbol of career emergencies and becomes a prop that amplifies the chaotic clash between traditional corporate decorum and unorthodox innovation. Its role in the scene reinforces the theme of incongruity as Jeremy dons it to both provoke and unsettle the established order.',
        oi.status_before = 'Prior to the event, the suit rested undisturbed in a box marked \'Career Emergency Kit - Do Not Touch Under Any Circumstances,\' symbolizing a last-resort measure reserved for serious professional crises.',
        oi.status_after = 'Following Jeremy’s disruptive entrance, the suit’s status is transformed into an emblem of irreverent rebellion. It now bears the marks of chaotic innovation, having been visibly worn and recontextualized as a statement piece that challenges the rigidity of conventional corporate identity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_interview_suit'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan is anchored in the predawn calm of his bedroom, seated rigidly in his creaking IKEA Markus chair. Dressed in a TM Lewin shirt paired with M&S boxers, he leans intently over his HP laptop. His posture is tense as he repeatedly scrolls through LinkedIn notifications and scrutinizes his Career Crisis Management spreadsheet, every gesture steeped in anxious calculation and subtle despair.',
        ap.emotional_state = 'On the surface, Mark’s face is set in a mask of corporate determination, but his eyes betray a swirling turmoil of self-doubt and resignation. Internally, he battles a deep-seated fear of obsolescence and failure, his thoughts punctuated by painful introspection. The quiet hum of the early morning magnifies his internal conflict, where each digital alert signals both a reminder of professional inadequacy and the unyielding pressure of corporate expectations. His outward composure is a fragile veneer masking an undercurrent of crippling anxiety and an urgent need for validation.',
        ap.emotional_tags = ["On the surface, Mark\u2019s face is set in a mask of corporate determination, but his eyes betray a swirling turmoil of self-doubt", "resignation. Internally, he battles a deep-seated fear of obsolescence", "failure, his thoughts punctuated by painful introspection. The quiet hum of the early morning magnifies his internal conflict, where each digital alert signals both a reminder of professional inadequacy", "the unyielding pressure of corporate expectations. His outward composure is a fragile veneer masking an undercurrent of crippling anxiety", "an urgent need for validation."],
        ap.active_plans = ["Continuously monitor and analyze his digital performance metrics to gauge any sign of professional resurgence.", "Strategically compare his career progress against peers like Steve from accounts to benchmark his own inadequacies.", "Prepare mentally to either salvage or reinvent his professional image by reviewing his past achievements and failures."],
        ap.beliefs = ["Corporate recognition, even if fleeting, is the key measure of personal worth.", "Credentials and accolades, no matter how outdated, serve as tangible proof of past potential.", "The digital metrics and notifications on his HP laptop are a truthful barometer of his professional value."],
        ap.goals = ["Short-Term: Immediately verify his standing by refreshing LinkedIn and scrutinizing his performance data.", "Medium-Term: Reassess and recalibrate his career strategy through the critical lens of his 'Career Crisis Management' spreadsheet.", "Ultimate: Restore his self-esteem and regain a sense of purpose amidst the unforgiving landscape of corporate hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy bursts into Mark’s bedroom with a sudden, flamboyant entrance. Clad in Mark’s well-worn interview suit, he strides boldly into the room, gesticulating wildly and exclaiming his disruptive catchphrase. His posture is expansive and energetic, his movements quick and deliberate, showcasing an irreverent confidence.',
        ap.emotional_state = 'Jeremy exudes an overt exuberance and audacity that masks a deeper layer of insecurity about his professional standing. Outwardly he appears ecstatic and overconfident, yet beneath the surface lies an undercurrent of desperation to validate his creative ideas and assert his disruptive vision. His emotional display is a blend of bravado and a hidden urgency to prove his worth against all corporate norms.',
        ap.emotional_tags = ["Jeremy exudes an overt exuberance", "audacity that masks a deeper layer of insecurity about his professional st", "ing. Outwardly he appears ecstatic", "overconfident, yet beneath the surface lies an undercurrent of desperation to validate his creative ideas", "assert his disruptive vision. His emotional display is a blend of bravado", "a hidden urgency to prove his worth against all corporate norms."],
        ap.active_plans = ["Seize attention by leveraging his unconventional approach to pitch a revolutionary idea at the MetricShift Innovation Sundowner.", "Capitalize on the dramatic symbolism of the interview suit to underline his disruptive persona.", "Challenge and upend the stagnant corporate order by infusing creativity and audacious innovation into the norm."],
        ap.beliefs = ["Innovation, no matter how chaotic, is the key to overcoming corporate stagnation.", "Daring actions and disruptive methods are essential to carve out a unique professional identity.", "Traditional corporate boundaries must be challenged to make way for transformative ideas."],
        ap.goals = ["Short-term: Immediately establish his presence and credibility at the upcoming corporate event.", "Medium-term: Build a reputation as a bold disruptor who can reframe the conventional business narrative.", "Ultimate: Redefine corporate innovation through his sonic optimization and creative disruption, securing his place in the new corporate order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Mark remains seated at his IKEA Markus desk chair, visibly tense and anxious. He hunches over his HP laptop, toggling between LinkedIn and his ‘Career Crisis Management’ spreadsheet. His posture is rigid with mounting apprehension as he watches Jeremy’s chaotic entrance unravel his carefully maintained routine.',
        ap.emotional_state = 'Mark is overwhelmed by a mix of dread and self-reproach as his already fragile sense of professional achievement is threatened. On the surface, his anxiety is palpable through his fidgeting and nervous glances, yet internally he battles a profound despair about his din of irrelevance. His internal conflict revolves around the fear of being outshined and the irritation at his own inability to control the situation.',
        ap.emotional_tags = ["Mark is overwhelmed by a mix of dread", "self-reproach as his already fragile sense of professional achievement is threatened. On the surface, his anxiety is palpable through his fidgeting", "nervous glances, yet internally he battles a profound despair about his din of irrelevance. His internal conflict revolves around the fear of being outshined", "the irritation at his own inability to control the situation."],
        ap.active_plans = ["Attempt to restore a sense of order amid the sudden disruption.", "Mitigate the impact of Jeremy\u2019s erratic display on his own precarious professional image.", "Conceal his mounting anxiety while strategically assessing how to salvage his career prospects."],
        ap.beliefs = ["Maintaining professional decorum is essential to survive corporate life.", "Every career emergency must be managed with precision and caution.", "Personal worth is measured by adherence to traditional professional standards."],
        ap.goals = ["Short-term: Contain the immediate disruption caused by Jeremy\u2019s entrance.", "Medium-term: Reassert his own relevance and credibility within the corporate hierarchy.", "Ultimate: Achieve a stable and respectable status in the corporate world despite his inner turmoil."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cracked_mirror_event_2_1'})
    ON CREATE SET
        oi.description = 'The cracked mirror serves as both a physical and symbolic element in the event. Positioned prominently behind Jeremy, it reflects his distorted image as he practices his pitch, emphasizing the fragmentation inherent in his ambitions and the disjointed nature of his mental state. The mirror amplifies the surreal atmosphere of the living room, reinforcing the contrast between his idealized vision and the chaotic reality surrounding him.',
        oi.status_before = 'Before the event, the mirror was already blemished and fractured, its surface marked by visible cracks that distorted reflections, serving as a constant reminder of imperfection.',
        oi.status_after = 'After the event, the mirror retains its broken condition, its fragmented reflection now symbolically aligned with Jeremy’s volatile self-presentation and the disordered intensity of his disruptive pitch.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cracked_mirror'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_networking_emergency_protocols_index_cards_event_2_2'})
    ON CREATE SET
        oi.description = 'The Networking Emergency Protocols Index Cards serve as a physical manifestation of Mark’s desperate attempt to impose order on the chaotic scenario. They are not merely paper; they symbolize his meticulously planned networking strategies and embody his painstaking preparation to mitigate professional disasters. As Jeremy blusters on with his disruptive pitch, these cards become a silent testament to Mark’s inner struggle, highlighting the stark contrast between structured corporate logic and unbridled creative chaos.',
        oi.status_before = 'Before the event, the index cards were perfectly organized, color-coded with precision, and securely maintained as the backbone of Mark\'s controlled approach to professional networking.',
        oi.status_after = 'Following the tensions and reorganization under stress, the cards acquire a disheveled appearance, mirroring Mark’s internal distress and the unraveling order of his corporate persona. Their pristine status is compromised, reflecting the disturbance in his carefully planned structure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_networking_emergency_protocols_index_cards'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy stands boldly in the chaotic living room, facing a cracked mirror with an assertive stance. His posture is upright and animated, with deliberate gestures and emphatic hand movements as he rehearses his pitch. He shifts his weight confidently, gesturing toward the disarray around him to underscore his determined delivery.',
        ap.emotional_state = 'Outwardly, Jeremy exudes flamboyance and exuberance, a confident blend of bravado and theatrical excitement as he projects his ideas. Beneath this show of boldness, however, there is an undercurrent of desperation and vulnerability—a restless ambition fueled by the fear of irrelevance and an internal struggle to validate his vision against the odds. His emotions vacillate between eager optimism and a silent, poignant insecurity that questions the weight of his claims.',
        ap.emotional_tags = ["Outwardly, Jeremy exudes flamboyance", "exuberance, a confident blend of bravado", "theatrical excitement as he projects his ideas. Beneath this show of boldness, however, there is an undercurrent of desperation", "vulnerability\u2014a restless ambition fueled by the fear of irrelevance", "an internal struggle to validate his vision against the odds. His emotions vacillate between eager optimism", "a silent, poignant insecurity that questions the weight of his claims."],
        ap.active_plans = ["Establish his credibility as a disruptor in the corporate and sonic arts arenas.", "Captivate his audience with a memorable, buzzword-laden pitch.", "Transform the chaotic living room setting into a stage for his revolutionary ideas."],
        ap.beliefs = ["Innovation and disruption are the keys to overturning outdated corporate norms.", "Personal transformation through creative expression can redefine success.", "Bold self-presentation is essential for carving out a niche in a competitive environment."],
        ap.goals = ["Short-term: Impress key decision-makers with his energetic pitch.", "Medium-term: Secure a foothold as a recognized visionary within the corporate sphere.", "Ultimate: Revolutionize traditional corporate practices by merging creative expression with business strategy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Mark stands in the living room, his posture rigid with anxiety as he nervously shuffles through his meticulously arranged Networking Emergency Protocols index cards. His hands tremble slightly as he clutches the cards, and his eyes dart around the room, fixating on every detail of Jeremy\'s performance.',
        ap.emotional_state = 'Outwardly, Mark appears tense and visibly perturbed, his expression strained from worry and impending professional doom. Beneath the surface, he is gripped by a relentless fear of losing control and becoming obsolete, struggling with inner turmoil and a deep-seated dread that his carefully constructed corporate identity is crumbling. His mind is racing with memories of past failures and the looming specter of corporate collapse, engendering a powerful internal conflict between self-preservation and the desire to adhere to outdated professional norms.',
        ap.emotional_tags = ["Outwardly, Mark appears tense", "visibly perturbed, his expression strained from worry", "impending professional doom. Beneath the surface, he is gripped by a relentless fear of losing control", "becoming obsolete, struggling with inner turmoil", "a deep-seated dread that his carefully constructed corporate identity is crumbling. His mind is racing with memories of past failures", "the looming specter of corporate collapse, engendering a powerful internal conflict between self-preservation", "the desire to adhere to outdated professional norms."],
        ap.active_plans = ["Interrupt Jeremy\u2019s pitch to reassert a traditional corporate order.", "Reorganize and solidify his Networking Emergency Protocols to regain a sense of control.", "Undermine the disruptive narrative with a demonstration of measured, authoritative professionalism."],
        ap.beliefs = ["A strict corporate hierarchy and structured communication are essential for success.", "Adhering to established protocols is key to maintaining professional dignity.", "Professional decorum and clear strategy outweigh trendy, buzzword-laden innovation."],
        ap.goals = ["Short-term: Stop Jeremy from further diluting meaningful corporate discourse.", "Medium-term: Restore and maintain his authoritative presence in the company.", "Ultimate: Salvage his reputation and secure his place within the fading legacy of traditional corporate structures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy stands boldly before the cracked mirror, projecting an air of flamboyant confidence as he practices his pitch with exaggerated gestures. Surrounded by empty Red Bull cans and scattered printouts of motivational quotes, he appears fully absorbed in his performance, using every mirrored reflection to underscore his disruptive presence.',
        ap.emotional_state = 'Externally, Jeremy exudes self-assuredness and a roguish charm, his tone filled with the bravado of a man determined to innovate at any cost. Internally, however, there is a complex mix of overconfidence tempered by a flicker of insecurity, as his audacious claims mask an underlying need for validation in a corporate world that is traditionally unwelcoming to radical change. His unyielding passion for his vision is both a shield and a signal of his internal struggle to break free from the restraints of outdated paradigms.',
        ap.emotional_tags = ["Externally, Jeremy exudes self-assuredness", "a roguish charm, his tone filled with the bravado of a man determined to innovate at any cost. Internally, however, there is a complex mix of overconfidence tempered by a flicker of insecurity, as his audacious claims mask an underlying need for validation in a corporate world that is traditionally unwelcoming to radical change. His unyielding passion for his vision is both a shield", "a signal of his internal struggle to break free from the restraints of outdated paradigms."],
        ap.active_plans = ["Deliver a pitch that challenges and redefines corporate norms.", "Leverage his unorthodox approach to capture the attention of key decision-makers.", "Fuse unconventional ideas with modern digital narratives to position himself as a visionary disruptor."],
        ap.beliefs = ["Innovation is born from challenging the status quo.", "Bold, unconventional ideas are essential for transformative change.", "Visibility, audacity, and risk-taking are more valuable than traditional methods in the modern corporate landscape."],
        ap.goals = ["Short-term: Impress his audience with a dynamic and unpredictable presentation.", "Medium-term: Establish himself as a leading figure capable of reshaping corporate strategies.", "Ultimate: Revolutionize the existing corporate structure by embedding disruptive, futuristic concepts into everyday practice."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_linkedin_premium_name_badge_event_3_1'})
    ON CREATE SET
        oi.description = 'The LinkedIn Premium name badge is used as a focal point for Mark’s anxieties and is a symbol of the corporate persona he desperately clings to. Throughout the scene, it serves as both a reminder and a measure of his professional identity. His repeated adjustments of the badge underscore his internal conflict and serve as a subtle act of reaffirmation in an environment overrun by formidable and innovative forces.',
        oi.status_before = 'Prior to the event, the badge was worn as a proud emblem of professionalism, meticulously designed, and a tangible representation of Mark’s aspirations and identity within MetricShift Digital Solutions.',
        oi.status_after = 'After the event, while the badge remains physically intact, its pristine appearance is undermined by its constant re-adjustment, symbolizing a deterioration of Mark’s inner stability and an erosion of his once steady corporate self-image.'
    WITH oi
    MATCH (o:Object {uuid: 'object_linkedin_premium_name_badge'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan stands uneasily by the fruit-infused water station, his body tense and his gaze fixed on his meticulously engineered LinkedIn Premium name badge. He shifts his weight from one foot to the other, repeatedly straightening the badge with furtive, jittery movements that betray his desperate need to appear composed.',
        ap.emotional_state = 'Externally, Mark’s expression is a mask of compelled professionalism, yet beneath the surface he is convulsed by an overwhelming dread and inner panic. His internal monologue screams with dark humor and bitter irony, reflecting a profound insecurity and the fear of imminent professional collapse as every minor gesture seems to confirm his inadequacy in a hostile corporate arena.',
        ap.emotional_tags = ["Externally, Mark\u2019s expression is a mask of compelled professionalism, yet beneath the surface he is convulsed by an overwhelming dread", "inner panic. His internal monologue screams with dark humor", "bitter irony, reflecting a profound insecurity", "the fear of imminent professional collapse as every minor gesture seems to confirm his inadequacy in a hostile corporate arena."],
        ap.active_plans = ["Maintain an unruffled, professional facade by obsessively controlling his appearance.", "Avoid drawing attention to his inner turmoil by keeping a low profile near the water station.", "Strategically position himself within the corporate networking environment to mitigate the risk of confrontation."],
        ap.beliefs = ["A polished, professional image is the cornerstone of success in a merciless corporate world.", "Every minor detail, including a name badge, carries immense symbolic weight in validating one\u2019s worth.", "Corporate dynamics are unforgiving, and personal shortcomings must be masked at all costs to survive."],
        ap.goals = ["Short-term: Appear unflustered and in control by meticulously adjusting his badge to maintain a semblance of order.", "Medium-term: Secure his position in the room and manage the unpredictable social interactions that could expose his vulnerabilities.", "Ultimate: Sustain his professional reputation and stave off the feared career downfall, ensuring he remains an indispensable part of the corporate machine."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Charlotte stands confidently amidst the transformed Innovation Suite, her posture upright as she moves decisively around the kombucha stations and buzzword-adorned whiteboards. Her measured gestures and attentive gaze convey both authority and a genuine curiosity as she engages Jeremy in a probing dialogue.',
        ap.emotional_state = 'Charlotte exhibits a calm and composed exterior, radiating the confidence typical of a seasoned executive. Beneath this professional veneer, however, she experiences a subtle internal conflict as she balances the allure of unconventional innovation with her commitment to corporate stability. She feels cautiously optimistic yet aware of the risks that disruptive ideas might entail, all while her desire for pragmatic efficiency quietly guides her.',
        ap.emotional_tags = ["Charlotte exhibits a calm", "composed exterior, radiating the confidence typical of a seasoned executive. Beneath this professional veneer, however, she experiences a subtle internal conflict as she balances the allure of unconventional innovation with her commitment to corporate stability. She feels cautiously optimistic yet aware of the risks that disruptive ideas might entail, all while her desire for pragmatic efficiency quietly guides her."],
        ap.active_plans = ["Assess the viability of Jeremy's disruptive sonic optimization proposal", "Ensure that innovative ideas align with the company\u2019s strategic transformation goals", "Manage potential risks by integrating unconventional solutions within an established framework"],
        ap.beliefs = ["Innovation must be pragmatic and based on measurable outcomes", "A disciplined approach to change fosters long-term corporate success", "Balanced risk-taking is necessary to disrupt outdated norms without chaos"],
        ap.goals = ["Short-term: Evaluate Jeremy\u2019s pitch during the session and determine its immediate relevance", "Medium-term: Integrate innovative ideas into current processes without destabilizing existing protocols", "Ultimate: Lead MetricShift Digital into a forward-thinking future while retaining core corporate values"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy takes center stage in the Ideation Zone, standing with infectious energy as he passionately presents his pitch. His animated gestures and intermittent pauses reveal both a bold determination and a slight hesitancy, reflecting his struggle to balance flamboyant ambition with the formal expectations of the corporate setting.',
        ap.emotional_state = 'Jeremy’s outward exuberance clearly manifests in his dynamic delivery and confident tone, yet his eyes betray a hidden vulnerability and self-doubt. While he projects the image of an innovative disruptor challenging the status quo, internally he is wrestling with the fear of rejection by a conservative corporate culture. This mix of high-octane enthusiasm and underlying insecurity fuels both his creativity and his urgency to prove himself.',
        ap.emotional_tags = ["Jeremy\u2019s outward exuberance clearly manifests in his dynamic delivery", "confident tone, yet his eyes betray a hidden vulnerability", "self-doubt. While he projects the image of an innovative disruptor challenging the status quo, internally he is wrestling with the fear of rejection by a conservative corporate culture. This mix of high-octane enthusiasm", "underlying insecurity fuels both his creativity", "his urgency to prove himself."],
        ap.active_plans = ["Convince the corporate decision-makers of the transformative potential of his idea", "Establish himself as a credible disruptor in the sonic optimization domain", "Leverage unconventional methods to secure a foothold in the digital transformation narrative"],
        ap.beliefs = ["Bold, unorthodox ideas are essential for true innovation", "Challenging established norms can lead to breakthrough advancements", "Technological creativity and audacious vision are key drivers for evolving workplace productivity"],
        ap.goals = ["Short-term: Deliver a compelling pitch that captures the room\u2019s attention", "Medium-term: Form alliances with influential executives to advance his ideas", "Ultimate: Redefine workplace productivity by merging sonic technology with corporate strategy"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_1'})
    ON CREATE SET
        oi.description = 'The DJ equipment serves as the pivotal tool that transforms the boardroom into a stage for audacious corporate disruption. It is activated by Jeremy to deliver a chaotic blend of electronic beats and unconventional sounds, effectively merging creative expression with technological innovation. Its operational interface not only amplifies the sensory intensity of the presentation but also embodies the clash between established norms and emergent digital narratives.',
        oi.status_before = 'Before the event, the DJ equipment was in a well-organized, ready state, securely installed and maintained in storage as part of Super Hans\' silent disco business, exuding an aura of latent potential.',
        oi.status_after = 'After Jeremy activates it, the equipment is visibly in use, radiating a chaotic energy with illuminated panels and active sound output, marking its transition from a dormant technological asset into a dynamic instrument of transformative corporate performance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dj_equipment_event_4_2'})
    ON CREATE SET
        oi.description = 'The DJ equipment is the central instrument of the disruptive performance, serving as the conduit through which Jeremy unleashes his chaotic blend of electronic beats, office printer drones, and enigmatic chants. It stands at the nexus of creative innovation and corporate defiance, transforming the boardroom into a stage for audacious experimentation. Its activation signals a clear break from traditional order, compelling the audience to re-evaluate their notions of productivity and digital transformation.',
        oi.status_before = 'Before the event, the DJ equipment was set up in a controlled, orderly environment, neatly assembled and awaiting activation, with its components impeccably arranged as a borrowed asset from Super Hans\' silent disco business.',
        oi.status_after = 'After the event commences, the equipment radiates a sense of controlled chaos; it is humming with disruptive energy, its sounds cascading unpredictably through the boardroom, symbolizing the fusion of creative freedom and corporate innovation amid the unfolding pandemonium.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dj_equipment'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy Usbourne stands boldly at the heart of the disruption chamber, energetically setting up the borrowed DJ equipment with flamboyant gestures and an unwavering focus. His body language is assertive as he confidently adjusts knobs and cables, preparing his soundscape with precise yet disorderly movements that underline his audacious innovation.',
        ap.emotional_state = 'On the surface, Jeremy radiates exuberance and an almost uncontainable thrill, punctuated by quick, animated smiles and vigorous movements. Beneath that, however, there is an undercurrent of calculated determination and a hint of desperation to prove his disruptive vision, mixing bravado with a subtle anxiety to cement his revolutionary status.',
        ap.emotional_tags = ["On the surface, Jeremy radiates exuberance", "an almost uncontainable thrill, punctuated by quick, animated smiles", "vigorous movements. Beneath that, however, there is an undercurrent of calculated determination", "a hint of desperation to prove his disruptive vision, mixing bravado with a subtle anxiety to cement his revolutionary status."],
        ap.active_plans = ["Secure the full corporate endorsement for his disruptive soundscape project.", "Demonstrate the viability of an unconventional digital innovation to redefine productivity.", "Position himself as the visionary leader capable of transforming the corporate environment."],
        ap.beliefs = ["Innovation has no boundaries and can revolutionize traditional work practices.", "Disruption is essential to shake up stale corporate environments.", "Creative chaos can be strategically harnessed to drive transformative business success."],
        ap.goals = ["Short-term: Impress the decision-makers with his soundscape presentation.", "Medium-term: Establish himself as an indispensable innovator within the organization.", "Ultimate: Catalyze a lasting transformation in corporate culture through audacious creativity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan is positioned on the periphery of the boardroom, its sleek, corporate decor barely concealing his anxiety. He tries to blend into the Herman Miller wallpaper, his tense posture and furtive glances betraying his internal distress as he watches Jeremy’s audacious setup with growing apprehension.',
        ap.emotional_state = 'Outwardly, Mark exudes a veneer of detached bemusement, his forced neutrality marked by a slight smirk as he observes the unfolding spectacle. Internally, however, a tumult of dread and self-doubt churns vigorously; his critical thoughts are interlaced with a deep-seated fear of obsolescence and a relentless internal debate about his impending fate in the face of disruptive innovation.',
        ap.emotional_tags = ["Outwardly, Mark exudes a veneer of detached bemusement, his forced neutrality marked by a slight smirk as he observes the unfolding spectacle. Internally, however, a tumult of dread", "self-doubt churns vigorously; his critical thoughts are interlaced with a deep-seated fear of obsolescence", "a relentless internal debate about his impending fate in the face of disruptive innovation."],
        ap.active_plans = ["Avoid drawing attention while meticulously monitoring the pitch\u2019s impact on his career.", "Analyze Jeremy\u2019s presentation for weaknesses to protect his own position.", "Plan a contingency strategy to navigate the anticipated corporate upheaval."],
        ap.beliefs = ["Traditional corporate structures are inherently resistant to sudden change.", "Self-worth in a corporate environment is measured by relevancy and adaptability.", "Disruption can quickly upend even the most carefully constructed career trajectories."],
        ap.goals = ["Short-term: Remain invisible while absorbing the shock of the novel presentation.", "Medium-term: Strategize for a safer, less volatile role as the corporate landscape shifts.", "Ultimate: Secure a stable position that guarantees his continued relevance and protects his professional dignity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Alan Johnson stands with measured composure in the boardroom, his posture relaxed yet vigilant as he observes every nuance of the disruptive performance. He remains seated confidently, his eyes fixed on the unfolding chaos with a strategist’s precision.',
        ap.emotional_state = 'Externally, Alan exudes calm assurance and quiet curiosity, his eyes betraying a keen analytical interest while his subtle nods signal internal satisfaction. Beneath that veneer, he experiences a calculated excitement mixed with a professional determination to spot the innovation in action, even as he weighs potential risk factors and opportunities, ever mindful of the strategic implications of every movement.',
        ap.emotional_tags = ["Externally, Alan exudes calm assurance", "quiet curiosity, his eyes betraying a keen analytical interest while his subtle nods signal internal satisfaction. Beneath that veneer, he experiences a calculated excitement mixed with a professional determination to spot the innovation in action, even as he weighs potential risk factors", "opportunities, ever mindful of the strategic implications of every movement."],
        ap.active_plans = ["Assess the disruptive performance for merger potential.", "Explore strategic partnerships leveraging innovative disruption.", "Guide the corporate team toward integrating creative digital solutions."],
        ap.beliefs = ["Innovation is essential for long-term corporate success.", "Calculated disruption can be a catalyst for growth.", "Corporate transformation must be driven by strategic risk-taking."],
        ap.goals = ["Short-term: Capitalize on the disruptive performance to secure immediate innovation wins.", "Medium-term: Position his firm as a key merger partner by harnessing emerging digital trends.", "Ultimate: Transform the corporate landscape by embedding strategic innovation at its core."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Charlotte is actively engaged, standing authoritatively near the front of the boardroom. She reviews the dynamic presentation with a sharp eye, reviewing details on her tablet while poised to authorize the disruptive initiative with a decisive gesture.',
        ap.emotional_state = 'Charlotte projects a calm, authoritative exterior that blends quiet confidence with pragmatic resolve. Internally, she feels a blend of excitement and measured skepticism, fully aware that this innovative push could either revolutionize the company or spiral into uncertainty. Her mind races with calculated considerations, tempered by the certainty that decisive action is required, even if the risks are significant.',
        ap.emotional_tags = ["Charlotte projects a calm, authoritative exterior that blends quiet confidence with pragmatic resolve. Internally, she feels a blend of excitement", "measured skepticism, fully aware that this innovative push could either revolutionize the company or spiral into uncertainty. Her mind races with calculated considerations, tempered by the certainty that decisive action is required, even if the risks are significant."],
        ap.active_plans = ["Immediately sign off on the disruptive initiative.", "Coordinate with senior management to integrate the new technology.", "Monitor the transition to ensure brand integrity during the transformation."],
        ap.beliefs = ["Digital transformation is the future of corporate success.", "Pragmatism and decisiveness are essential in times of change.", "Innovation must be rapidly adopted to maintain competitive advantage."],
        ap.goals = ["Short-term: Authorize the full rollout of the disruptive performance.", "Medium-term: Establish robust protocols to integrate innovative solutions into daily operations.", "Ultimate: Secure a leading position in the digital transformation landscape of the industry."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan is visibly trying to blend into the decor of the boardroom, standing slightly apart near a wall panel adorned with corporate wallpaper. His tense body language and furtive glances underscore his discomfort as he observes the unfolding performance with a mixture of dread and resigned fascination.',
        ap.emotional_state = 'On the surface, Mark exhibits a façade of detached anxiety, his internal monologue revealing deep-seated insecurity and panic. He is overwhelmed by feelings of inadequacy, watching with a sense of impending obsolescence as his role is increasingly challenged by the disruptive energy around him. His inner thoughts betray a desperate longing to reclaim relevance while grappling with the humiliation of being outshone, creating a complex interplay between anxiety, envy, and existential dread.',
        ap.emotional_tags = ["On the surface, Mark exhibits a fa\u00e7ade of detached anxiety, his internal monologue revealing deep-seated insecurity", "panic. He is overwhelmed by feelings of inadequacy, watching with a sense of impending obsolescence as his role is increasingly challenged by the disruptive energy around him. His inner thoughts betray a desperate longing to reclaim relevance while grappling with the humiliation of being outshone, creating a complex interplay between anxiety, envy,", "existential dread."],
        ap.active_plans = ["Attempt to remain inconspicuous during the disruptive presentation.", "Internally strategize potential career moves in response to the upheaval.", "Analyze every detail to safeguard his current position within the company."],
        ap.beliefs = ["Corporate hierarchies are unforgiving and change is inevitable.", "Traditional methods are being overtaken by disruptive innovation.", "Personal relevance in a modern corporate setting is increasingly transient."],
        ap.goals = ["Short-term: Avoid drawing further attention to himself during the event.", "Medium-term: Stabilize his position while adapting to corporate shifts.", "Ultimate: Secure a sustainable role in the rapidly evolving digital workplace or find an alternative career path."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Jeremy Usbourne takes center stage in the boardroom, energetically setting up the DJ equipment with flamboyant gestures. His physical presence is dynamic and unrestrained as he moves around the room orchestrating a performance that challenges traditional corporate order.',
        ap.emotional_state = 'Jeremy is charged with exuberant enthusiasm, his face alight with the thrill of rebellion and creative expression. Beneath this confident exterior lies a complex mix of ambition and a hint of desperation to be recognized as a visionary. He is simultaneously intoxicated by the allure of innovation and driven by the need to prove that his radical ideas can overturn established norms, even as he battles the inner tension of needing validation from a rigid corporate structure.',
        ap.emotional_tags = ["Jeremy is charged with exuberant enthusiasm, his face alight with the thrill of rebellion", "creative expression. Beneath this confident exterior lies a complex mix of ambition", "a hint of desperation to be recognized as a visionary. He is simultaneously intoxicated by the allure of innovation", "driven by the need to prove that his radical ideas can overturn established norms, even as he battles the inner tension of needing validation from a rigid corporate structure."],
        ap.active_plans = ["Deploy his disruptive soundscape to captivate the boardroom.", "Demonstrate the creative synergy between chaos and digital innovation.", "Position himself as the catalyst for radical transformation within the company."],
        ap.beliefs = ["Disruption is essential to break free from corporate stagnation.", "Creativity and audacity are the true drivers of progress.", "Traditional corporate methods are obsolete in the face of digital revolution."],
        ap.goals = ["Short-term: Successfully activate and control the DJ equipment to create a compelling performance.", "Medium-term: Achieve corporate endorsement that validates his innovative approach.", "Ultimate: Redefine corporate culture by establishing himself as the leading force behind transformative digital sound solutions."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_super_hans_laptop_mindcoin_event_5_1'})
    ON CREATE SET
        oi.description = 'The well-worn laptop is a central artifact in the scene, its screen displaying the fragmented remains of the hacked MindCoin project. It serves as a tangible link to Super Hans\'s erratic yet visionary approach to technology, representing both past failures and the potential foundation for his disruptive new venture.',
        oi.status_before = 'Prior to the event, the laptop was a timeworn device bearing the digital scars of previous experiments, a symbol of Super Hans\'s countercultural technological exploits.',
        oi.status_after = 'Following the event, the laptop remains a potent emblem of digital residue, now repurposed as the strategic launchpad for the audacious \'SonicChain\' proposition.'
    WITH oi
    MATCH (o:Object {uuid: 'object_super_hans_laptop_mindcoin'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_blockchain_meditation_printouts_event_5_1'})
    ON CREATE SET
        oi.description = 'The scattered printouts detailing blockchain and meditation apps are strewn across the kitchen table, visually grounding the conceptual discussions. They function as both inspirational material and a concrete representation of the unconventional ideas under debate, bridging abstract theory with tangible innovation.',
        oi.status_before = 'Before the event, the printouts existed as disorganized collections of visionary scribbles and technical notes, casually left atop the table.',
        oi.status_after = 'After the discussion, the printouts take on a new significance, embodying a blueprint for radical change and serving as a record of the emergent strategy that blurs the line between corporate structure and avant-garde creativity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_blockchain_meditation_printouts'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_metricshift_lanyard_event_5_2'})
    ON CREATE SET
        oi.description = 'The MetricShift lanyard plays a pivotal, symbolic role in the scene. It is physically present on Mark, representing his connection to corporate order, yet its unexpected appearance on Super Hans introduces a rich irony. This object becomes a visual marker of the collision between structured corporate life and freewheeling innovation, intensifying the dramatic tension as the characters navigate conflicting ideologies.',
        oi.status_before = 'Before the event, the lanyard was securely in Mark Corrigan’s possession, serving as a tangible symbol of his corporate identity and allegiance to MetricShift Digital.',
        oi.status_after = 'After the event, the lanyard\'s status is transformed by its transfer to Super Hans, thereby blurring the lines between corporate conformity and disruptive creativity, and symbolizing the merging of opposing worlds in a moment of ironic, foreboding change.'
    WITH oi
    MATCH (o:Object {uuid: 'object_metricshift_lanyard'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Super Hans is seated at the kitchen table amidst a clutter of printouts and his battered laptop. His posture is relaxed yet animated, leaning forward as he emphatically outlines his radical concept while gesturing with both enthusiasm and casual defiance.',
        ap.emotional_state = 'Super Hans radiates unbridled excitement and a tinge of manic defiance. His eyes sparkle with visionary mischief, while his body language suggests a deep-seated restlessness balanced by an audacious hope. Beneath his exuberance lies the tension of past disappointments, fueling his desire to reinvent failure into a breakthrough innovation.',
        ap.emotional_tags = ["Super Hans radiates unbridled excitement", "a tinge of manic defiance. His eyes sparkle with visionary mischief, while his body language suggests a deep-seated restlessness balanced by an audacious hope. Beneath his exuberance lies the tension of past disappointments, fueling his desire to reinvent failure into a breakthrough innovation."],
        ap.active_plans = ["Pitch the disruptive 'SonicChain' concept that fuses corporate sound therapy with his own blockchain-based mindfulness platform.", "Reinvigorate his hacked MindCoin project into a viable venture that challenges conventional digital finance.", "Leverage the momentum of this meeting to secure new, unconventional partnerships in the tech and wellness sectors."],
        ap.beliefs = ["He believes that chaos and unconventional creativity are the keys to shattering corporate monotony.", "He is convinced that blending technology with mindfulness can pave the way for disruptive innovation.", "He holds that true success comes from challenging established norms with radical ideas."],
        ap.goals = ["Short-term: Deliver a compelling pitch to immediately capture interest.", "Medium-term: Transform the remnants of past digital failures into a successful, marketable project.", "Ultimate: Redefine corporate culture by establishing a new paradigm that integrates technology with holistic wellness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy is busily preparing tea in the kitchen, his movements brisk and purposeful amid the creative chaos. Every measured gesture as he handles the kettle and cups speaks to his eagerness to contribute, his eyes glinting with both mischief and determination as he supports the unfolding conversation.',
        ap.emotional_state = 'Jeremy displays a layered mix of flamboyant enthusiasm and cautious ambition. While his outward smile and lively demeanor broadcast confidence and creative flair, internally he battles uncertainty about his place in this disruptive vision. His heart is buoyed by dreams of innovation, yet his mind grapples with the pressures of attempting legitimacy in a realm defined by audacity and risk.',
        ap.emotional_tags = ["Jeremy displays a layered mix of flamboyant enthusiasm", "cautious ambition. While his outward smile", "lively demeanor broadcast confidence", "creative flair, internally he battles uncertainty about his place in this disruptive vision. His heart is buoyed by dreams of innovation, yet his mind grapples with the pressures of attempting legitimacy in a realm defined by audacity", "risk."],
        ap.active_plans = ["Introduce the modern twist of NFT integration to enhance the disruptive appeal of the venture.", "Support Super Hans\u2019 visionary pitch by reinforcing the creative narrative with his own energetic contributions.", "Utilize the momentum of the gathering to position himself as a key innovator in the emerging disruptive scene."],
        ap.beliefs = ["He believes that merging technology with artistic expression is the catalyst for true innovation.", "He is convinced that challenging established corporate norms is essential for progress in the digital age.", "He holds that bold and unorthodox ideas, when paired with practical execution, can revolutionize traditional business models."],
        ap.goals = ["Short-term: Create a positive and dynamic atmosphere by ensuring his contributions enhance the ongoing discussion.", "Medium-term: Strengthen his reputation as a forward-thinking disruptor within the tech and corporate cultures.", "Ultimate: Transform radical ideas into mainstream successes that redefine the landscape of corporate innovation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Mark Corrigan enters the kitchen with measured, reluctant steps. Clutching his MetricShift lanyard as if it were a lifeline, he stands at the threshold with tense shoulders and a wary gaze that betrays his inner dread. His posture is rigid and defensive as he disrupts the freewheeling banter with a sharp, sarcastic remark.',
        ap.emotional_state = 'Outwardly, Mark wears a veneer of sardonic detachment, his voice laced with irony as he comments on the absurdity unfolding around him. Beneath that, however, pulses a deep-seated anxiety and apprehension about his dwindling relevance and the chaotic creativity that threatens his carefully maintained corporate order. His internal emotions mix dread, self-deprecation, and a relentless fear of professional collapse, revealing a man caught between duty and desperate self-preservation.',
        ap.emotional_tags = ["Outwardly, Mark wears a veneer of sardonic detachment, his voice laced with irony as he comments on the absurdity unfolding around him. Beneath that, however, pulses a deep-seated anxiety", "apprehension about his dwindling relevance", "the chaotic creativity that threatens his carefully maintained corporate order. His internal emotions mix dread, self-deprecation,", "a relentless fear of professional collapse, revealing a man caught between duty", "desperate self-preservation."],
        ap.active_plans = ["Immediately reassert control over the situation to minimize further disruption.", "Attempt to steer the conversation back toward professional decorum and mitigate chaos.", "Strategically position himself to maintain his corporate legitimacy despite the radical innovations around him."],
        ap.beliefs = ["A structured corporate environment is essential for personal and professional survival.", "Unchecked radical ideas, while appealing, ultimately lead to personal and systemic downfall.", "Maintaining decorum and order is non-negotiable in an environment of digital transformation."],
        ap.goals = ["Short-term: Calm the situation and prevent further derailment of his professional space.", "Medium-term: Reassert his identity as the reliable middle-manager amid disruptive innovation.", "Ultimate: Secure his long-term position in the corporate hierarchy and avoid obsolescence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Super Hans is sprawled at the kitchen table, surrounded by chaotic printouts and his battered laptop displaying the remains of his hacked cryptocurrency project, \'MindCoin.\' Donning the unlikely MetricShift lanyard with an air of playful defiance, he exudes a relaxed, unorthodox confidence as he fires off visionary ideas about integrating blockchain with mindfulness.',
        ap.emotional_state = 'Super Hans radiates a buoyant, irreverent excitement as he pitches his disruptive ideas, his voice casual yet charged with creative energy. Underneath this carefree exterior lies a simmering intensity and a desire to break free from conventional limits. He remains internally amused and defiant, dismissing corporate strictures as he envisions a radical new order where innovation fuses with anarchic flair.',
        ap.emotional_tags = ["Super Hans radiates a buoyant, irreverent excitement as he pitches his disruptive ideas, his voice casual yet charged with creative energy. Underneath this carefree exterior lies a simmering intensity", "a desire to break free from conventional limits. He remains internally amused", "defiant, dismissing corporate strictures as he envisions a radical new order where innovation fuses with anarchic flair."],
        ap.active_plans = ["Capitalize on the unexpected platform provided by the gathering to cement his unconventional pitch.", "Integrate disparate elements of corporate culture with countercultural innovation to create a breakthrough project.", "Leverage the moment to position his crypto-mindfulness platform as a revolutionary solution despite established norms."],
        ap.beliefs = ["Unorthodox methods and chaotic creativity are the true catalysts for innovation.", "Traditional corporate norms suppress genuine progress and should be subverted.", "Artistic disruption, even when cloaked in corporate symbols, can redefine industry standards."],
        ap.goals = ["Short-term: Convince the present audience of the viability of his innovative, disruptive pitch.", "Medium-term: Establish a foothold in the tech landscape through the successful integration of blockchain with mindfulness.", "Ultimate: Transform the existing corporate order by championing radical, countercultural approaches to business."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_warm_white_wine_event_6_2'})
    ON CREATE SET
        oi.description = 'The warm white wine in Mark’s grasp is far more than a mere beverage; it embodies the quiet despair and resignation that define his current state. Far from being a tool of celebration, the wine accentuates the chilly irony of his internal turmoil. Its tepid temperature mirrors the sluggish pace of his sinking aspirations, serving as a tangible symbol of how even the expected refreshment becomes a testament to defeat in a world that values dynamic innovation over introspection.',
        oi.status_before = 'Before the event, the wine was freshly poured and, despite its intended coolness, had already taken on a warm, slightly subpar quality that hinted at imperfect circumstances.',
        oi.status_after = 'After the event, the wine remains half-consumed, its persistent warmth now an echo of Mark’s unresolved desolation, reinforcing the notion that even comfort is illusory in the face of overwhelming professional disillusionment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_warm_white_wine'})
    MATCH (e:Event {uuid: 'event_6_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Jeremy leans forward at the corner table with exuberant energy, his arms animatedly punctuating his grand vision. His posture is open and persuasive, and he punctuates his statements with enthusiastic gestures that radiate confidence and reckless ambition.',
        ap.emotional_state = 'On the surface, Jeremy exudes unbridled excitement and a contagious sense of triumph as he celebrates his innovative ideas. However, beneath his flamboyant cheer lies a turbulent mix of bravado and anxious ambition—a deep-seated need to validate his identity through groundbreaking success, even if his aspirations are tinged with reckless overconfidence and a fear of being outshone.',
        ap.emotional_tags = ["On the surface, Jeremy exudes unbridled excitement", "a contagious sense of triumph as he celebrates his innovative ideas. However, beneath his flamboyant cheer lies a turbulent mix of bravado", "anxious ambition\u2014a deep-seated need to validate his identity through groundbreaking success, even if his aspirations are tinged with reckless overconfidence", "a fear of being outshone."],
        ap.active_plans = ["To articulate and celebrate his concept of a globally impactful, scientifically optimized sound solution.", "To leverage the infectious energy of the moment to secure potential corporate interest and validation.", "To build his personal brand by aligning disruptive creativity with grand corporate visions."],
        ap.beliefs = ["Innovation, no matter how unconventional, is the key to transforming the corporate landscape.", "Digital disruption is not only inevitable but essential for breaking free of outdated norms.", "Sound and technology can merge to create unparalleled productivity and cultural change."],
        ap.goals = ["Short-term: To captivate and energize his peers at the pub with his wild ideas.", "Medium-term: To solidify his reputation as a visionary disruptor capable of shaking up corporate conventions.", "Ultimate: To revolutionize offices worldwide with his scientifically engineered sound solutions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Super Hans is casually animated at the table, sporting an incongruous MetricShift lanyard that underscores his ironic detachment from corporate norms. His body language is relaxed yet charged, shuffling between moments of intense focus as he recalls past ventures and bursts into visionary claims with a devil-may-care demeanor.',
        ap.emotional_state = 'Super Hans appears outwardly relaxed and amused, his offbeat humor blending with a palpable surge of creative energy. Internally, there is a conflicted cocktail of defiant nonchalance and a burning desire to reclaim relevance through radical innovation. Beneath his carefree exterior, his mind churns with calculated mischief and a longing to prove that subversion can triumph in the corporate arena.',
        ap.emotional_tags = ["Super Hans appears outwardly relaxed", "amused, his offbeat humor blending with a palpable surge of creative energy. Internally, there is a conflicted cocktail of defiant nonchalance", "a burning desire to reclaim relevance through radical innovation. Beneath his carefree exterior, his mind churns with calculated mischief", "a longing to prove that subversion can triumph in the corporate arena."],
        ap.active_plans = ["To pitch an integrated vision that fuses his crypto-mindfulness app with Jeremy\u2019s sonic concepts.", "To repurpose past entrepreneurial misfires into rallying points for future, disruptive projects.", "To symbolically undermine established corporate order by showcasing the power of irreverent creativity."],
        ap.beliefs = ["Conventional corporate norms are ripe for disruption through unorthodox innovation.", "Chaos and spontaneity are as valuable as formal strategies in creating transformative change.", "A fusion of technology and mindfulness can yield breakthroughs in personal and corporate realms."],
        ap.goals = ["Short-term: To contribute his unique perspective to the ongoing celebratory banter and secure immediate buy-in from like-minded allies.", "Medium-term: To refine and merge his radical ideas with emerging trends, gaining traction in countercultural circles.", "Ultimate: To establish himself as a cult figure in disruptive innovation who challenges and redefines corporate methodologies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Mark sits at a dimly lit corner table in The Fox & Goose Pub, hunched over his table with a restless posture. His hand clutches his warm white wine as he intermittently glances at his buzzing phone, each notification deepening his withdrawn demeanor.',
        ap.emotional_state = 'Outwardly, Mark wears the mask of quiet resignation, his face set in a blend of apprehension and envy as he watches Jeremy’s celebration. Beneath that composed exterior, he is tormented by a profound sense of professional inadequacy and despair, his inner world churning with anxiety and a bitter awareness of his stalled career. Every LinkedIn buzz magnifies the dissonance between his internal self and the corporate ideal he desperately fails to meet.',
        ap.emotional_tags = ["Outwardly, Mark wears the mask of quiet resignation, his face set in a blend of apprehension", "envy as he watches Jeremy\u2019s celebration. Beneath that composed exterior, he is tormented by a profound sense of professional inadequacy", "despair, his inner world churning with anxiety", "a bitter awareness of his stalled career. Every LinkedIn buzz magnifies the dissonance between his internal self", "the corporate ideal he desperately fails to meet."],
        ap.active_plans = ["Reassess his career trajectory and devise a plan to regain lost professional momentum.", "Seek temporary solace through further indulgence in drink to numb his creeping despair.", "Withdraw from overt corporate validation to focus on internal self-analysis and rebuilding his confidence."],
        ap.beliefs = ["Success in the corporate world is more illusion than substance.", "Digital metrics and endorsements provide a hollow measure of one\u2019s true worth.", "True validation must come from an honest alignment of personal values rather than superficial praise."],
        ap.goals = ["Short-term: Alleviate the sting of rejection by ordering another drink to dull his immediate emotional pain.", "Medium-term: Strategically reflect on his position within the corporate maze to formulate a more authentic career plan.", "Ultimate: Reclaim a genuine sense of self-worth that transcends the vacuous accolades of digital endorsement."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_marks_bedroom_apollo_house_croydon'})
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
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_metricshift_digital_solutions_hq_canary_wharf_innovation_suite_14th_floor'})
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
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_metricshift_executive_boardroom_the_disruption_chamber'})
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_alan_johnson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_alan_johnson_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_charlotte_walsh_henderson'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_charlotte_walsh_henderson_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_mark_and_jeremys_flat_kitchen'})
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
MATCH (a:Agent {uuid: 'agent_jeremy_usbourne'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeremy_usbourne_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_super_hans'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_super_hans_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_mark_corrigan'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_mark_corrigan_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
