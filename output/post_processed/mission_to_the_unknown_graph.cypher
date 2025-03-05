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
MERGE (a:Agent {uuid: 'agent_jeff_garvey'})
    ON CREATE SET
        a.name = 'Jeff Garvey',
        a.title = 'None',
        a.description = 'Jeff Garvey is a troubled operative whose inner torment becomes tragically evident as he undergoes a horrifying transformation. His twitching legs and the emerging white spines signal that he is slowly losing his humanity and becoming a Varga, representing how pressure and unknown alien influences can obliterate one’s humanity.',
        a.traits = ["Troubled", "Violent", "Tormented", "Tragic"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_marc_cory'})
    ON CREATE SET
        a.name = 'Marc Cory',
        a.title = 'Space Security Operative',
        a.description = 'Marc Cory is a seasoned Space Security operative who remains remarkably calm even in moments of extreme crisis. In the perilous jungle scene on Kembel, he takes charge with businesslike efficiency amid chaos, immediately shifting his focus to ensuring that vital evidence is recorded and transmitted when his colleague suffers a deadly transformation from toxic exposure.',
        a.traits = ["Calm", "Determined", "Commanding", "Resourceful"],
        a.sphere_of_influence = 'Interplanetary Security Operations'
    ;
MERGE (a:Agent {uuid: 'agent_gordon_lowery'})
    ON CREATE SET
        a.name = 'Gordon Lowery',
        a.title = 'Space Security Officer',
        a.description = 'Gordon Lowery is a dedicated and technically adept officer of Space Security. In the hostile Kembel Jungle, he struggles against a fatal reaction to the deadly Varga poison. His agony and desperate attempts to rid his palm of poison highlight both his physical vulnerability and unwavering commitment, even as the swift progression of the Varga transformation seals his tragic fate.',
        a.traits = ["Resilient", "Loyal", "Resourceful", "Tragic"],
        a.sphere_of_influence = 'Operational Field Work in Hostile Environments'
    ;
MERGE (a:Agent {uuid: 'agent_dalek_supreme'})
    ON CREATE SET
        a.name = 'Dalek Supreme',
        a.title = 'Supreme Commander',
        a.description = 'Dalek Supreme is the apex of Dalek authority—a cold and ruthless leader whose unyielding commands define the will of his race. Embodied in jet‐black armor and driven by merciless logic, he stands as a symbol of extermination and absolute domination, reinforcing the brutal efficiency and uncompromising nature of the Dalek forces.',
        a.traits = ["Ruthless", "Authoritative", "Cold", "Uncompromising"],
        a.sphere_of_influence = 'Interstellar military domination'
    ;
MERGE (a:Agent {uuid: 'agent_dalek_1'})
    ON CREATE SET
        a.name = 'Dalek 1',
        a.title = 'Dalek Operative',
        a.description = 'Dalek 1 is a ruthlessly efficient operative within the Dalek forces. In the tense jungle scenario, it issues precise orders as its sensors register seismic activity and enemy movements, embodying the Dalek commitment to extermination and relentless conquest with a cold and calculated demeanor.',
        a.traits = ["Ruthless", "Efficient", "Merciless", "Uncompromising"],
        a.sphere_of_influence = 'Military Operations and Extermination'
    ;
MERGE (a:Agent {uuid: 'agent_dalek_2'})
    ON CREATE SET
        a.name = 'Dalek 2',
        a.title = 'Dalek Operative',
        a.description = 'Dalek 2 is a calculating and precise operative among the Daleks. In this scene, it supports its companion by confirming sensor readings and dictating that any detected crew from the rocket ship be exterminated without interrogation. Its clipped and unsympathetic tone reflects the Dalek race\'s cold logic and single-minded devotion to their destructive purpose.',
        a.traits = ["Calculating", "Relentless", "Cold", "Methodical"],
        a.sphere_of_influence = 'Enforcement of Dalek Extermination Orders'
    ;
MERGE (a:Agent {uuid: 'agent_malpha'})
    ON CREATE SET
        a.name = 'Representative Malpha',
        a.title = 'Representative',
        a.description = 'Representative Malpha is the dignified envoy of the Outer Systems Alliance, tasked with speaking for the six great powers of the outer galaxies. With measured tones and authoritative disapproval of central influences, he leads a conference in an austere Dalek environment, pledging allegiance to the Dalek cause and outlining plans for universal conquest, including the subjugation of Earth.',
        a.traits = ["dignified", "authoritative", "measured", "determined"],
        a.sphere_of_influence = 'Interstellar diplomacy and alliance building among the outer galaxies'
    ;
MERGE (o:Object {uuid: 'object_garvey_gun'})
    ON CREATE SET
        o.name = 'Gun',
        o.description = 'An ordinary yet critical firearm, the gun is a compact piece of weaponry that Garvey retrieves from his belt as he rises in the clearing. Its utilitarian design and signs of wear speak to its frequent use in the harsh, unforgiving environs of Kembel’s jungles.',
        o.purpose = 'To provide means for self-defense and enable Garvey to carry out his violent intent.',
        o.significance = 'Symbolizes Garvey\'s moment of clarity and commitment to violence; a physical manifestation of his inner turmoil and determination to act on his murderous impulse.'
    ;
MERGE (o:Object {uuid: 'object_rocket_ship'})
    ON CREATE SET
        o.name = 'Rocket Ship',
        o.description = 'The rocket ship is a rugged interplanetary vessel, visibly worn and damaged by the harsh conditions of Kembel. Stationed in a jungle clearing, it symbolizes both desperate survival and the onset of changing alliances, as its arrival is noted by Dalek operatives and heralds potential rebellion by opposing forces.',
        o.purpose = 'To serve as an interstellar transport asset, currently under enemy observation and strategic scrutiny.',
        o.significance = 'Its appearance from the planet Gearon, as observed by the Dalek patrol, is linked to the prophesied emergence of a \'Great Alliance\' and marks a turning point in the interplanetary conflict.'
    ;
MERGE (o:Object {uuid: 'object_wrench'})
    ON CREATE SET
        o.name = 'Wrench',
        o.description = 'A heavy-duty mechanical tool used for repairing and tightening key components of the rocket ship. It is passed from Marc Cory to Gordon Lowery to facilitate repairs on the vessel’s tail fin.',
        o.purpose = 'Used for essential mechanical repairs on the rocket ship.',
        o.significance = 'The wrench exemplifies the hands-on, technical efforts required to maintain crucial equipment in a hostile, resource-scarce environment.'
    ;
MERGE (o:Object {uuid: 'object_ray_gun'})
    ON CREATE SET
        o.name = 'Ray Gun',
        o.description = 'A futuristic energy weapon wielded by Marc Cory, capable of emitting a powerful energy blast. In this scene, its discharge inadvertently proves lethal, toppling Jeff Garvey.',
        o.purpose = 'Serves as a defensive and offensive tool during critical moments.',
        o.significance = 'The ray gun’s use marks a dramatic turning point in the narrative, leading directly to the fatal outcome for Jeff Garvey.'
    ;
MERGE (o:Object {uuid: 'object_space_security_id_card'})
    ON CREATE SET
        o.name = 'Space Security ID Card',
        o.description = 'A government-issued identification card for Space Security agents, this card is handed by Marc Cory to Gordon Lowery as proof of membership and authorization. It features electronic verification details and is indispensable for establishing command credentials within the mission.',
        o.purpose = 'To verify identity and authorize enlistment within the Space Security organization',
        o.significance = 'Symbolizes official membership and trust, and legitimizes Marc Cory’s authority when recruiting personnel on the mission.'
    ;
MERGE (o:Object {uuid: 'object_authority_document'})
    ON CREATE SET
        o.name = 'Authority Document',
        o.description = 'A formal document that grants Marc Cory the power to enlist the aid of any persons, civilian or military, during the mission. Its contents confirm his legal authority and command over the expedition, ensuring that any personnel engaged act under his orders.',
        o.purpose = 'To authorize enlistment of additional personnel for critical mission tasks',
        o.significance = 'Legitimizes Cory’s unilateral decisions and underscores the gravity of the situation on the hostile planet.'
    ;
MERGE (o:Object {uuid: 'object_varga_thorn'})
    ON CREATE SET
        o.name = 'Varga Thorn',
        o.description = 'A sharp, spiny thorn from a Varga plant, which appears part animal and part vegetable and is reminiscent of a cactus. The poison contained within it targets the brain, replacing rational thought with uncontrollable aggression, and eventually transforms the victim into a Varga.',
        o.purpose = 'To serve as biological evidence linking the transformation of personnel to the presence of Dalek-related forces, and to symbolize the threat posed by alien bio-agents',
        o.significance = 'Provides a critical clue that the only natural habitat of Varga plants is on the Daleks\' home planet, Skaro, thus implicating their possible return.'
    ;
MERGE (o:Object {uuid: 'object_vergometer'})
    ON CREATE SET
        o.name = 'Vergometer',
        o.description = 'A sensitive technical instrument used to measure the integrity of the rocket ship\'s atmospheric entry system. This device is meant to ensure that the vessel can safely break through a planet\'s atmosphere by monitoring key link pulses and system pressures.',
        o.purpose = 'To verify proper functioning of critical atmospheric and structural systems during launch',
        o.significance = 'Its proper operation is essential for a successful rocket ship launch, symbolizing the fine technical balance required in interplanetary missions'
    ;
MERGE (o:Object {uuid: 'object_control_panel'})
    ON CREATE SET
        o.name = 'Dalek Control Panel',
        o.description = 'An advanced array of interfaces and monitors that form the operational heartbeat of the Dalek control room. The panel displays space monitoring data and communicates enemy positions while allowing the Dalek Supreme to issue decisive commands.',
        o.purpose = 'To facilitate real-time intelligence gathering and command execution within the Dalek base.',
        o.significance = 'This control panel symbolizes the technological and militaristic prowess of the Daleks, serving as the nerve center for their extermination orders and strategic updates.'
    ;
MERGE (o:Object {uuid: 'object_rescue_beacon'})
    ON CREATE SET
        o.name = 'Rescue Beacon',
        o.description = 'The rescue beacon is a compact distress signaling device equipped with an integrated recording mechanism and capsule launcher. In this scene, it is the container of Marc Cory\'s urgent warning message about the Dalek threat, left behind on the jungle floor amidst the chaos.',
        o.purpose = 'To broadcast an emergency message to Earth and relay vital defense instructions',
        o.significance = 'It symbolizes the desperate attempt to warn Earth of an impending invasion, representing both hope and sacrifice in the face of overwhelming adversaries.'
    ;
MERGE (o:Object {uuid: 'object_varga_plants'})
    ON CREATE SET
        o.name = 'Varga Plants',
        o.description = 'Varga plants are lethal botanical organisms with a bizarre, hybrid nature—part animal, part vegetable. Their distinctive white spines, which can cover a victim\'s skin, release a potent toxin that undermines rational thought and ultimately transforms the victim.',
        o.purpose = 'As a biological weapon, they serve to incapacitate and convert adversaries into agents of the Daleks through uncontrollable aggression',
        o.significance = 'They represent the insidious and transformative power of the Daleks’ biological warfare, as exemplified by Lowery’s horrifying metamorphosis in this scene'
    ;
MERGE (o:Object {uuid: 'object_treaty_document'})
    ON CREATE SET
        o.name = 'Treaty Document',
        o.description = 'A formal treaty document meticulously prepared and laid before the delegates, it features precise galaxy charts and symbolic inscriptions that declare the unification of six outer galactic powers with the Dalek forces. The document is a tangible symbol of the historic alliance intended to secure universal conquest.',
        o.purpose = 'To formalize and symbolize the alliance between the outer systems and the Daleks',
        o.significance = 'The treaty represents the consolidation of seven great powers under a unified command, marking the commencement of galactic domination with Earth as the first target.'
    ;
MERGE (o:Object {uuid: 'object_conference_table'})
    ON CREATE SET
        o.name = 'Conference Table',
        o.description = 'A utilitarian, metallic table set in the center of the Dalek Conference Room. Its surface is unadorned and designed for pragmatic use, serving as the focal point where delegates gather to make solemn pledges and coordinate their plans for galactic domination.',
        o.purpose = 'To facilitate formal declarations and strategic deliberations among the delegates.',
        o.significance = 'It symbolizes the unified commitment of the Daleks and their allied outer systems representatives to reduce galaxies to ashes and to conquer Earth.'
    ;
MERGE (l:Location {uuid: 'location_kembel_jungle_clearing'})
    ON CREATE SET
        l.name = 'Kembel Jungle Clearing',
        l.description = 'Deep within the hostile jungles of Kembel lies a forbidding clearing where dim, filtered light barely pierces the tangled canopy. The area is marked by palpable isolation and latent danger, as unseen alien creatures lurk in the shadows. In this clearing, a damaged rocket ship (now destroyed by Dalek fire) serves as a grim reminder of the high stakes in this desperate escape.',
        l.type = 'Forest Clearing'
    ;
MERGE (l:Location {uuid: 'location_rocket_ship_interior'})
    ON CREATE SET
        l.name = 'Rocket Ship Interior',
        l.description = 'The interior of a damaged interplanetary rocket ship set on a hostile planet. The cramped control area features scattered, worn control panels and technical equipment, all lit by dim emergency lighting. The atmosphere is tense as the crew debates repairs, malfunctioning link pulses, and the implications of enemy activity, providing a confined stage for crucial exchanges of mission-critical information.',
        l.type = 'Ship Cabin'
    ;
MERGE (l:Location {uuid: 'location_dalek_control_room'})
    ON CREATE SET
        l.name = 'Dalek Control Room',
        l.description = 'This imposing control room is the central hub of the Dalek base on Kembel. Stark and utilitarian in design, it hosts state‐of‐the‐art control panels and monitoring systems that relay interstellar intelligence. The room’s atmosphere is dominated by the presence of the Dalek Supreme, whose jet‐black casing contrasts vividly with the gunmetal blue‐grey and silver of his subordinates. It is here that disciplined commands are issued and enemy reports are received.',
        l.type = 'Control Room'
    ;
MERGE (l:Location {uuid: 'location_kembel_jungle'})
    ON CREATE SET
        l.name = 'Kembel Jungle',
        l.description = 'The Kembel Jungle is a dense, foreboding expanse on the hostile planet Kembel. Its tangled foliage and shadowy paths provide a dangerous backdrop, where toxic plants and unseen predators lurk between shafts of dim, filtered light.',
        l.type = 'Jungle'
    ;
MERGE (l:Location {uuid: 'location_dalek_conference_room'})
    ON CREATE SET
        l.name = 'Dalek Conference Room',
        l.description = 'An imposing and austere conference room deep within the Dalek City on planet Kembel. The space is furnished with stark, state‐of‐the‐art control panels and utilitarian seating. The angular design, minimal decor, and harsh lighting convey a cold, oppressive atmosphere that mirrors the Daleks’ ruthless efficiency and unwavering commitment to their mission of universal conquest.',
        l.type = 'Conference Room'
    ;
MERGE (l:Location {uuid: 'location_dalek_city'})
    ON CREATE SET
        l.name = 'Dalek City',
        l.description = 'Dalek City is a grim, imposing urban stronghold hidden deep within the Kembel Jungle. Characterized by its stark, utilitarian architecture and an atmosphere of ruthless order, the city is engineered for military purposes and serves as a central hub for executing the Daleks’ plans for galactic conquest.',
        l.type = 'City'
    ;
MERGE (o:Organization {uuid: 'org_space_security'})
    ON CREATE SET
        o.name = 'Space Security',
        o.description = 'Space Security is an interplanetary organization dedicated to protecting missions and personnel in hostile environments. Its operatives combine military strategy with technical expertise to counter extraterrestrial threats and safeguard critical expeditions.',
        o.sphere_of_influence = 'Interplanetary Defense and Crisis Response'
    ;
MERGE (o:Organization {uuid: 'org_daleks'})
    ON CREATE SET
        o.name = 'Daleks',
        o.description = 'The Daleks are a fanatical, armored race engineered for extermination. Operating under a strict hierarchy and driven by ruthless logic, they are obsessed with universal domination and execute their military operations with cold, mechanical precision.',
        o.sphere_of_influence = 'Military conquest and extermination across galaxies'
    ;
MERGE (o:Organization {uuid: 'org_outer_systems_alliance'})
    ON CREATE SET
        o.name = 'Outer Systems Alliance',
        o.description = 'The Outer Systems Alliance is a coalition representing the interests of the outer galaxies. Its members are united by a common desire to resist central oppressive forces and to secure their autonomy, even as they sometimes align with other power-factions to further their strategic objectives.',
        o.sphere_of_influence = 'Interstellar diplomacy and regional security in the outer galaxies'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_mission_to_the_unknown'})
    ON CREATE SET
        ep.title = 'Episode One - Mission to the Unknown',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Garvey’s Agonized Awakening',
        s.description = 'In a dense, inhospitable jungle clearing on the hostile planet Kembel, Jeff Garvey lies barely conscious on the ground. The clearing is dimly lit by natural light filtering through thick overhead foliage, and the oppressive atmosphere hints at hidden dangers lurking in the surrounding jungle. Suddenly, Garvey stirs and wakes with a startled confusion. In a moment of intense physical and mental agony, he presses his hands to his temples as a searing headache consumes him. Gradually, the pain subsides and his features relax into a calm smile. Rising to his feet with renewed determination, he reaches for the gun hanging at his side, and in a trembling yet resolute tone declares his need to kill.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Revelation Through Agony',
        e.description = 'Jeff Garvey, lying in the clearing, abruptly awakens in a state of confusion. As he sits up, he surveys his surroundings with disoriented eyes. Overwhelmed by a sudden, excruciating headache, he clutches his temples while his face contorts in pain. Gradually, the torment subsides; a sense of clarity and grim resolve replaces his suffering. With newfound calm, Garvey rises, pulls the gun from his belt, and with a voice desperate yet determined, he utters repeated declarations of murderous intent.',
        e.sequence = 1,
        e.key_dialogue = ["GARVEY: I, I remember now. I must, I must kill. Must kill. Must kill."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Outside the Ship: Repair and Reckoning in the Jungle',
        s.description = 'In this tense external scene set in a clearing of the Kembel jungle, Space Security agents Gordon Lowery and Marc Cory struggle with critical repairs on the rocket ship’s tail fin. Their bickering about the inhospitable landing and the escalating jungle noises underscores the pressure to reach their rendezvous with the freighter. Unbeknownst to them, agent Jeff Garvey lurks hidden in the thick foliage, his chilling murmurs of \'Kill. Kill.\' hinting at sinister intent. As the work continues, a sudden, deadly blast from Cory’s ray gun brings Garvey down, and Lowery’s frantic examination reveals a Varga thorn embedded beneath Garvey’s ear – a disturbing omen of transformation and betrayal that deepens the scene’s ominous mood.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Rocket Repair and Bickering',
        e.description = 'Gordon Lowery and Marc Cory work outside their rocket ship, trying to repair its damaged tail fin. Lowery grumbles about landing on such a hostile planet while Cory emphasizes efficiency and focus on the job at hand. Their exchange includes technical demands and hints at the pressure of a tight schedule to rendezvous with a freighter, establishing an atmosphere of tension and urgency amid the relentless jungle noises.',
        e.sequence = 1,
        e.key_dialogue = ["LOWERY: Why you ever wanted to land on a planet like this in the first place I'll never know. This is getting on my nerves.", "CORY: I hate to think what kind of an animal makes a noise like that.", "LOWERY: Yeah, they're getting closer.", "CORY: You'll make it, Lowery. Here you are.", "LOWERY: I'm doing the best I can. I didn't want to touch down on this lousy planet in the first place, remember?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Garvey\'s Hidden Threat',
        e.description = 'Unbeknownst to the busy repair duo, agent Jeff Garvey lurks unseen in the dense jungle foliage. With a cold and menacing tone, Garvey utters a single, chilling command: \'Kill. Kill.\' His silent advance and careful positioning between the agents and the outside world injects an undercurrent of danger and foreboding, as he prepares to interfere with the unfolding repair operation.',
        e.sequence = 2,
        e.key_dialogue = ["GARVEY: Kill. Kill."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Confrontation and Fatal Blast',
        e.description = 'The tension escalates as Marc Cory retrieves the necessary tool and returns toward the rocket ship while Lowery continues his work, oblivious to the predator in the foliage. As Garvey edges closer, a sudden discharge from Cory’s ray gun erupts, striking Garvey and sending him toppling to the ground in a burst of violent energy. In the chaos that follows, Lowery rushes to Garvey’s side, exclaiming in horror that \'You’ve killed him. You shot him down like an animal!\' While the confrontation between Lowery and Cory intensifies over the fatal choice, Lowery’s inspection of Garvey’s head and neck reveals a mysterious Varga thorn embedded below his ear, ominously hinting at a corrupt transformation.',
        e.sequence = 3,
        e.key_dialogue = ["LOWERY: Jeff! Jeff!", "LOWERY: You've killed him. You've killed Jeff!", "CORY: It was him or you.", "LOWERY: You didn't give him a chance. You shot him down like an animal. You just shot him down!"]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Inside the Ship: Revelation of Dalek Threat and Garvey’s Transformation',
        s.description = 'Inside the cramped, humming interior of the rocket ship, tensions run high as Space Security Agent Marc Cory convenes a closed-door meeting with fellow agent Gordon Lowery. The mood is somber and secretive: Cory reveals that their longtime comrade, Jeff Garvey, is dead and that a dark conspiracy is unfolding. He unfurls a document that grants him the authority to enlist any person—military or civilian—to confront the emerging menace. In a measured yet urgent tone, Cory reminds Lowery of an old legend: though the Daleks invaded Earth a thousand years ago, they have in recent centuries secretly gathered power by conquering innumerable distant planets. He explains that reports from a freighter navigator have described a Dalek spaceship and adds a chilling detail—a Varga thorn, the poisonous seed of a plant that transforms its victim into a monstrous Varga, grows only on Skaro, the Daleks’ home. Meanwhile, stage directions reveal that outside the ship, Garvey’s twitching legs and creeping white spines foretell his horrifying metamorphosis into a Varga, underscoring the stakes of their mission. The scene is set entirely within the ship’s interior, where every whispered word and exchanged look underscores the desperate need for answers about the Dalek threat.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_rocket_ship_interior'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Cory’s Secret Revelation and Enlistment of Lowery',
        e.description = 'Marc Cory opens the meeting by admitting that he never intended to divulge classified details, yet with Garvey dead he now must. Speaking in a controlled tone, he informs Gordon Lowery that there are pressing facts they must face. Cory hands Lowery his Space Security ID and an Authority Document, asserting his command by declaring that Lowery is now enlisted to take orders directly from him. Lowery bitterly protests over Jeff Garvey’s death and questions the sudden shift in command, while Cory insists that the facts he is about to unfold are vital. The exchange sets the stage for a dramatic discussion about threats from beyond their galaxy.',
        e.sequence = 1,
        e.key_dialogue = ["CORY: I didn't intend to tell you anything, but since we're stuck on this planet and Garvey's dead, there are some facts that you're entitled to know.", "LOWERY: Yeah. Jeff Garvey's dead. I mean, we flew together the last ten years, and now he's dead, and you killed him. You'd better explain that fact, and make it good.", "CORY: Sit down and take a look at this."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Discussion of Dalek History and the Varga Plant Threat',
        e.description = 'Cory shifts the discussion to a matter of galactic importance by asking if Lowery has heard of the Daleks. As Lowery recalls that Daleks once invaded Earth a thousand years ago, Cory outlines their surprising revival: despite a long period of inactivity within their own galaxy, in the past five hundred years the Daleks have conquered over seventy planets in one star system and forty in another. He further reveals that a recent report from a space freighter navigator described a spaceship matching the distinctive design of a Dalek vessel. Interwoven in his explanation is the ominous reference to a Varga thorn—a poisonous, cactus-like appendage whose toxin incapacitates rational thought and gradually transforms its victim. Cory emphasizes that because such thorns, and therefore the Varga, grow naturally only on Skaro, their presence here implies that the Daleks have returned to this hostile region.',
        e.sequence = 2,
        e.key_dialogue = ["CORY: All right. I suppose you've heard of the Daleks?", "LOWERY: The Daleks invaded Earth a thousand years ago.", "CORY: That's right. Well, they haven't been active in our galaxy for some time now, but that doesn't mean they've been sitting around. In the last five hundred years, they've gained control of over seventy planets in the Ninth Galactic System and forty more in the Constellation of Miros.", "LOWERY: Don't see why that should concern us. I mean, they're both millions of light years away from our galaxy.", "CORY: Hmm, that's what we all thought. But about a week ago we had a report from the captain of a space freighter. His navigator spotted a spaceship unlike any used before\u2014a Dalek spaceship."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Jeff Garvey’s Transformation into a Varga',
        e.description = 'As the conversation deepens, the stage directions provide a harrowing visual counterpoint. Outside the ship, the remnants of their fallen comrade, Jeff Garvey, are seen twitching and changing. His legs and feet are spasming and gradually his body becomes overlaid with long white spines. These disturbing physical changes signal that the poison from a Varga thorn—the same kind mentioned in the earlier discussion—has set in, transforming Garvey from a human into a monstrous Varga. This silent, horrifying metamorphosis reinforces Cory’s earlier warning and adds an immediate, visceral element to the threat posed by the Daleks and their connection to the Varga plant.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Attempting to Contact Freighter XM2 and Debating Ship Repairs',
        e.description = 'After laying bare the truth about the Daleks’ stealthy resurgence and the ominous Varga threat, Cory shifts his focus to operational concerns. He attempts to establish contact with a freighter designated XM2 using the ship’s communication link. His repeated calls into the static-filled transmitter highlight the urgency of their situation. Lowery, meanwhile, questions whether the ship’s repaired communication links and systems—especially the link pulses and the vergometer—are functioning properly after damage sustained in the crash. A bitter debate ensues about the chances of repairing the vessel and whether the hostile planet might be serving as a secret Dalek base. The conversation not only underscores the technical challenges they face but also the high stakes of their mission.',
        e.sequence = 4,
        e.key_dialogue = ["CORY: Freighter XM2, freighter XM2. Come in, please. Come in, please!", "LOWERY: Can you make it work?", "CORY: It's got to work!", "LOWERY: It may have been damaged in the crash.", "CORY: We must keep on trying."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Dalek Control Room: Conference and Destruction Order',
        s.description = 'Inside the stark Dalek Control Room on Kembel, the machine beings assemble in calculated unison as the jet‐black Dalek Supreme makes his entrance. Against the contrasting gunmetal blue-grey and silver casings of his subordinates, he initiates a formal conference. He demands a space monitor control report on the incoming emissaries from the seven planets and then orders that the conference begin at first sun by requesting a security report. Once Dalek 2 confirms that an alien spacecraft has been located and that a patrol is en route, the Supreme unleashes his fury by commanding that the ship and all its occupants be totally destroyed. His subordinate affirms the order, setting a cold tone for the Dalek masterplan.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_dalek_control_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Dalek Supreme Opens Conference',
        e.description = 'The Dalek Supreme enters the control room with dominating authority and announces that he will receive the incoming reports. He calls for the space monitor control report to start the proceedings, establishing an atmosphere of ruthless order.',
        e.sequence = 1,
        e.key_dialogue = ["DALEK SUPREME: I will receive your reports. First, space monitor control."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Dalek 1 Reports Space Monitor Control',
        e.description = 'Dalek 1 responds to the Supreme’s call by reporting that the space monitor control is active. He confirms that the emissaries from the seven planets will arrive as arranged, reinforcing the precision of their cosmic plans.',
        e.sequence = 2,
        e.key_dialogue = ["DALEK 1: Space monitor control. The emissaries from the seven planets will arrive as arranged."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Dalek Supreme Commands Conference Start',
        e.description = 'Following the space monitor report, the Dalek Supreme declares that the conference will begin at first sun and urges a security report. His measured tone underscores the methodical planning that underpins their strategy.',
        e.sequence = 3,
        e.key_dialogue = ["DALEK SUPREME: Then the conference will begin at first sun. Security report."]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'Dalek 2 Reports on Security and Alien Craft',
        e.description = 'Dalek 2 provides a precise security update, confirming that an alien spacecraft has been detected. He reports that the current position of the craft has been pinpointed and that their patrol will reach it shortly, setting the stage for the impending action.',
        e.sequence = 4,
        e.key_dialogue = ["DALEK 2: Security control. Position of alien space craft located. Our patrol will reach it shortly."]
    ;
MERGE (e:Event {uuid: 'event_4_5'})
    ON CREATE SET
        e.title = 'Dalek Supreme Orders Total Destruction',
        e.description = 'With the security report in hand, the Dalek Supreme unleashes a ferocious command that the alien ship and all its occupants are to be totally destroyed. His repeated proclamation of \'Destroyed! Destroyed!\' emphasizes the ruthless finality of their intent.',
        e.sequence = 5,
        e.key_dialogue = ["DALEK SUPREME: The ship and its occupants must be totally destroyed. Destroyed! Destroyed!"]
    ;
MERGE (e:Event {uuid: 'event_4_6'})
    ON CREATE SET
        e.title = 'Dalek 2 Confirms Destruction Order',
        e.description = 'Dalek 2 affirms the Supreme\'s harsh directive by stating that the destruction will be carried out. This final, cold confirmation seals the fate of the targeted alien craft, underscoring the uncompromising nature of the Dalek regime.',
        e.sequence = 6,
        e.key_dialogue = ["DALEK 2: It will be done."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Outside the Ship – Setting Up the Rescue Beacon',
        s.description = 'In this tense outdoor scene set in a clearing of the Kembel Jungle, agents Lowery and Cory work frantically outside the rocket ship wreckage. They are observed from the fringes by three Vargas – strange plantlike creatures that sway gently as if waiting in the stillness. Lowery is busy assembling a rescue beacon, a small metal framework with a capsule launcher that will record and transmit a distress message, while Cory makes rounds around the ship. Their brief, urgent dialogue reveals their concern about the possibility of an imminent Dalek attack even as they debate whether the Vargas – noted for their slow, rooted movement – are naturally occurring or synthetically developed in Dalek laboratories. The scene bristles with anxiety as they prepare their beacon for launch, knowing that the Daleks are expected to arrive soon.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Identifying the Vargas Threat',
        e.description = 'Agent Lowery scans the surroundings and asks if there is anyone out there. Cory confirms the presence of Vargas that are slowly closing in, describing how they drag themselves along using their roots. Amid their exchange, they raise the possibility that these enigmatic creatures might signal the growing Dalek threat, though Lowery hints at the possibility that the Vargas could be naturally occurring.',
        e.sequence = 1,
        e.key_dialogue = ["LOWERY: Anything out there?", "CORY: Vargas. They're closing in.", "LOWERY: Do you mean to say they can move?", "CORY: Very slowly. Look. They're using their roots to drag themselves along."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Attaching the Recording Capsule',
        e.description = 'Lowery turns his attention to the rescue beacon, determined to fix the recording capsule that is essential for transmitting their distress message into space. Although the work seems straightforward, low morale and the urgency of their situation infuse each moment with tension. Cory urges him to work fast, emphasizing that if they launch the rocket without a properly working mechanism, no one will know they are there. The meticulous assembly of the recording component is critical to ensuring a successful rescue.',
        e.sequence = 2,
        e.key_dialogue = ["LOWERY: This is the recording part. Let's hope it wasn't damaged in the crash.", "CORY: We'll soon find out. Can you fix this capsule up?", "LOWERY: Well that's easy enough, but this is the recording mechanism for the message. If we sent the rocket into space without this, not only would we not be rescued, but as you pointed out earlier, no one would even know we were here.", "CORY: Hurry up and attach it then."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Debating the Dalek Threat',
        e.description = 'With the beacon nearing completion, Cory and Lowery engage in a brisk discussion about the looming danger. Cory insists that the Daleks are nearby and will soon be aware of their presence, while Lowery questions whether the presence of these Vargas – which might have arisen naturally – truly indicates Dalek activity. Cory firmly refutes the possibility of natural growth, claiming that the Vargas were cultivated in Dalek laboratories as a means of synthetic protection. The tension mounts as their exchange underscores both the urgency of their situation and the contrasting approaches of the two agents.',
        e.sequence = 3,
        e.key_dialogue = ["CORY: Good. I don't know how long we've got. But the Daleks must know we're here. They'll be coming for us soon.", "LOWERY: Well I still think you're jumping to conclusions, you know. I mean, just because these, what are they, Varga things grow here, it's no proof that the Daleks are here too.", "CORY: Take my word for it, they're here all right.", "LOWERY: Yes, but couldn't these Varga things grow here naturally? I mean, it's possible, isn't it?", "CORY: No. They were developed in Dalek laboratories. They grow them to give themselves protection.", "LOWERY: Well if they're synthetic, that means we..."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Dalek Tactics in the Jungle',
        s.description = 'In the dark, humid expanse of the jungle, a Dalek security patrol is shown methodically assessing their tactical situation. Dalek 1, using its advanced acceptor sensors, reports that alien spacecraft have been detected. He declares that they will close in on the target from two different directions. The Daleks collectively acknowledge the order with a curt response. Following this directive, the patrol splits into two groups—a coordinated tactical maneuver designed to surround and ambush any intruder. This scene builds the palpable tension of an impending confrontation as the Daleks fan out into the dense jungle.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Dalek Patrol Mobilizes',
        e.description = 'Dalek 1 processes sensor data from its acceptor and announces that an alien spacecraft is present. He instructs that the patrol should converge on the target from two distinct directions. In response, the assembled Daleks uniformly proclaim their obedience. With the command given, the patrol fans out into two groups, setting the stage for a coordinated ambush within the jungle.',
        e.sequence = 1,
        e.key_dialogue = ["Acceptor readings indicated alien space craft. We will close on it from two directions.", "We obey."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Beacon and the Passing Giant',
        s.description = 'In a clearing of the hostile Kembel jungle outside their damaged rocket ship, Space Security agents Marc Cory and Gordon Lowery are busy discussing the operation of a rescue beacon – a standard safety device meant to record an SOS message and launch it into orbit for retrieval by their people. Their conversation is interspersed with grim humor as they bemoan the relentless threat posed by Vargas, hostile creatures edging ever closer to their ship. Their dialogue reveals both technical details about the beacon’s operation and underlying anxiety about the Dalek menace that looms over the galaxy. Suddenly, an enormous, alien rocket ship appears in the sky, dwarfing anything they have seen before and hinting that a far greater conflict is underway.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Discussing the Rescue Beacon',
        e.description = 'In this opening event, Lowery and Cory concentrate on the immediate threat posed by the Vargas and on the operation of their rescue beacon. Lowery remarks that the dangerous creatures are getting too close and expresses his intention to shoot at them, while Cory cautions that no matter how many shots are fired, the Vargas will regrow. They then focus on how the beacon works: by recording a distress message on a tape recorder, which the rocket launcher will shoot into orbit where it will transmit the SOS message on a special frequency, ensuring help from listening posts distributed throughout the galaxy. Their conversation underlines their determination to survive long enough for rescue while hinting at the far larger threat involving the Daleks.',
        e.sequence = 1,
        e.key_dialogue = ["LOWERY: Those things are getting too close for comfort. I'll fix them.", "CORY: It's no good, Lowery. They'll only grow again as fast as you can shoot them.", "LOWERY: At least I'll have had a try at them.", "CORY: Get back to the beacon. You sure it'll work?", "LOWERY: Well, it should work. It's standard safety equipment on all rocket ships.", "CORY: What does it do exactly?", "LOWERY: Well, you record the message, SOS, on this, just like an ordinary tape recorder. The rocket launcher shoots it high into orbit. Once it's in orbit it transmits the message. Simple.", "CORY: From what we know about the Daleks, we've got to be picked up.", "LOWERY: Well, it's tuned in to a special frequency, and there are listening posts all over the galaxy. Our people should get the message.", "CORY: And all we have to do is to stay alive until they get here."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'A Massive Craft Overhead',
        e.description = 'As Lowery continues to prepare the rescue beacon launcher, both agents are abruptly distracted by a deep, ominous sound from above. When they look up, they witness a huge rocket ship, unlike anything they have ever seen, barreling across the sky. Lowery marvels at its enormous size, while Cory notes that it is from an outer galaxy. The presence of such an advanced vessel on a desolate, God-forsaken planet puzzles them greatly. Cory ominously adds that if the Daleks are involved, the implications are dire—threatening not just their lives but the fate of the entire galaxy.',
        e.sequence = 2,
        e.key_dialogue = ["LOWERY: That's the biggest rocket ship I've ever seen. It's like nothing we've got.", "CORY: It's from an outer galaxy.", "LOWERY: Yes, but what's it doing in a God-forsaken planet like this?", "CORY: I don't know, but I'll tell you this. There's something very big going on here, and if the Daleks are involved you can bet your life our whole galaxy is in danger."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Dalek Patrol and Rocket Ship Under Threat',
        s.description = 'In this tense jungle clearing on Kembel, the Daleks have observed the arrival of an alien rocket ship. Amidst the oppressive jungle atmosphere, the Dalek patrol makes its presence known through terse, declarative dialogue. Dalek 1 announces the identity of the visitors by stating, \'The ship from the planet Gearon,\' while Dalek 2 follows with the ominous declaration, \'And the beginning of the Great Alliance.\' As these words echo through the clearing, the Daleks resume their advance, methodically closing in on the rocket ship. The scene sets a mood of imminent threat as the alien patrol prepares to intercept the vessel.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Dalek Observation of the Approaching Spaceship',
        e.description = 'The Dalek patrol first takes notice of the incoming rocket ship as Dalek 1 proclaims, \'The ship from the planet Gearon.\' This announcement signals the arrival of an outsider from a distant world, startling the patrol and setting the stage for a dramatic intervention. The dialogue underscores the importance of the vessel, hinting at its connection to a larger, potentially ominous alliance. The Daleks’ observation not only identifies the source of the threat but also heightens the tension in the unforgiving jungle.',
        e.sequence = 1,
        e.key_dialogue = ["DALEK 1: The ship from the planet Gearon."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Daleks Announce the Great Alliance and Advance',
        e.description = 'Following the initial observation, Dalek 2 adds a foreboding note by saying, \'And the beginning of the Great Alliance.\' This remark suggests that the arrival of the spaceship may signal the start of broader, intergalactic cooperation. Almost as soon as the dialogue is exchanged, the Daleks put their threat into action by resuming their advance, steadily closing in on the rocket ship. Their coordinated movement reinforces the imminent danger facing the occupants, as the alien invaders prepare to intercept the vessel.',
        e.sequence = 2,
        e.key_dialogue = ["DALEK 2: And the beginning of the Great Alliance."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Destruction in the Clearing',
        s.description = 'Outside the ravaged rocket ship in a clearing of the Kembel Jungle, space security agents Gordon Lowery and Marc Cory are finishing preparations to launch a distress beacon when they sense something moving outside. Their brief exchange is interrupted by the sudden appearance of Daleks. The Dalek attackers quickly inspect the ship, determine that the crew has abandoned it, and then ruthlessly order its destruction. As the Daleks fire, Lowery watches in horror as his ship is reduced to ruin while Cory urges him to move into the jungle. In the ensuing frantic escape, Lowery is painfully injured by a Varga thorn that embeds in his hand, forcing him into a panicked extraction of the thorn. Meanwhile, Daleks issue further orders to alert all patrols, setting the stage for the relentless hunt that now begins. This sequence vividly portrays the sudden and brutal transition from covert distress signalling to an overwhelming ambush by the Daleks, which shatters any hope of safe escape.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Distress Beacon and Furtive Warning',
        e.description = 'Gordon Lowery finishes assembling the launcher for the rescue beacon while recording a distress message. In a tense exchange, he and Marc Cory discuss that there is something moving outside their hideout. Lowery questions if it might be a creature named Vargas, but Cory dismisses it and urges a quick departure. Their brief conversation is interrupted by a sudden noise that heightens the urgency. The agents decide they must get away immediately while still considering launching the message.',
        e.sequence = 1,
        e.key_dialogue = ["LOWERY: That should just about do it. Give me the capsule will you, I'll record the message.", "CORY: Shush.", "LOWERY: What is it?", "CORY: There's something out there moving.", "LOWERY: Vargas?", "CORY: No. Moving too quickly. Come on, we've got to get away.", "LOWERY: What about the distress signal?", "CORY: We'll take it with us, launch it as soon as we get a chance.", "LOWERY: All right. Which way?", "CORY: Over here. They won't be the only ones, so watch out."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Dalek Ambush and Ship Destruction',
        e.description = 'Before the agents can act on their plan, a sudden noise alerts them to the presence of Daleks. Cory shouts for Lowery to get down as Daleks glide past into the clearing. The Daleks inspect the rocket ship and conclude that the crew has abandoned it. They then issue orders to search for the crew and destroy the ship. In a frenzy of Dalek commands and rapid firing, Lowery watches in horror as the ship is obliterated, leaving chaos behind. Cory immediately abandons the wreck and heads deeper into the jungle, setting the escape in motion.',
        e.sequence = 2,
        e.key_dialogue = ["LOWERY: Cory! Daleks!", "CORY: Get down and don't make a sound!", "DALEK 2: The ship is empty. The crew has gone.", "DALEK 1: We will search for them. Destroy the ship. Fire!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Lowery’s Varga Thorn Injury',
        e.description = 'After the Dalek onslaught destroys their ship, Marc Cory rushes off deeper into the jungle, with Lowery following nervously carrying the capsule launcher. As Lowery pushes through a dense clump of bushes, he recoils in alarm when he realizes he has been stung by a Varga thorn. Horrified by the pain and the deadly poison, he frantically tears out the thorn from his hand and attempts to suck out the venom. Despite his injury, he is compelled to follow Cory deeper into the jungle as the threat of the Daleks looms larger.',
        e.sequence = 3,
        e.key_dialogue = ["LOWERY (panicking): (implied reaction of pain and alarm as he discovers the thorn)", "CORY: Come on, man, come on. They'll be looking for us now!"]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Dalek Orders and Final Command',
        e.description = 'Back in the clearing, as the chaos unfolds, the Daleks consolidate their attack by issuing further commands. One Dalek orders a report on the destruction of the alien ship, while another dutifully replies in the cold mechanical manner typical of Dalek speech. The lead Dalek then commands that the search for the fugitives begins and instructs all patrols to be alerted. With these cold orders, the Daleks set in motion a relentless pursuit operation against the escaping crew, sealing the fate of the agents and establishing the overwhelming power of the Dalek forces in the area.',
        e.sequence = 4,
        e.key_dialogue = ["DALEK 1: Report destruction of alien ship to control.", "DALEK 2: I obey.", "DALEK 1: Advise that we will now seek out the crew. Alert all patrols.", "DALEK 2: We obey."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Council of Daleks: The Solar Menace Revealed',
        s.description = 'In the immense Dalek Conference Room located within Dalek City, emissaries from the seven outer systems have gathered for a crucial assembly. The atmosphere is tense as the Dalek Supreme calls the meeting to order, proclaiming that with the arrival of Representative Malpha, their numbers are sufficient to proceed. However, Malpha immediately objects, declaring that a hostile presence from the solar system has infiltrated their midst – specifically on the planet Kembel. In response, Dalek Supreme reveals that hostile beings from Earth have already landed, their spaceship destroyed, and vows that they will be hunted down, either killed by the deadly Varga plants or by his patrols. This grim declaration sets the stage for a ruthless extermination plan.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_dalek_conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Meeting Commencement',
        e.description = 'The conference is formally opened in the Dalek Conference Room. Dalek Supreme asserts that with the arrival of Representative Malpha, the assembly now has the required numbers to proceed. His authoritative tone echoes through the vast hall as he declares that the meeting can now begin, setting the stage for the unfolding debate and strategic discourse.',
        e.sequence = 1,
        e.key_dialogue = ["DALEK SUPREME: With the arrival of our ally Malpha, we are enough. The meeting can now begin."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Revelation of the Hostile Presence',
        e.description = 'Representative Malpha sharply objects to the commencement of the meeting. He declares that the assembly cannot proceed because a hostile presence has infiltrated their midst. Malpha explains that he has been informed of the influence of hostile forces from the solar system – specifically on the planet Kembel – thereby forcing the council to confront an immediate threat among them.',
        e.sequence = 2,
        e.key_dialogue = ["MALPHA: No it can't.", "MALPHA: There is a hostile presence among us.", "MALPHA: On arrival here, I am told that there are hostile influences from the solar system among us.", "MALPHA: Then here on the planet Kembel."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Assurance of Extermination',
        e.description = 'Responding to Malpha\'s concerns, Dalek Supreme explains that the threat from Earth has been contained. He reveals that although the hostile beings have landed, their spaceship has already been destroyed, leaving them stranded and vulnerable. He ominously warns that these intruders cannot escape: they are being relentlessly hunted down, and if they do not succumb to the lethal effects of the Varga plants, the Dalek patrols will ensure their extermination. His final declaration leaves no room for hope among the enemies.

',
        e.sequence = 3,
        e.key_dialogue = ["DALEK SUPREME: What is wrong?", "DALEK SUPREME: What do you mean?", "DALEK SUPREME: Some beings have landed from the planet Earth, hostile beings from the centre of the solar system. But do not worry. Their spaceship has been destroyed.", "MALPHA: What about the beings?", "DALEK SUPREME: They cannot escape. At this moment they are being hunted down. They will be destroyed.", "MALPHA: Are you sure?", "DALEK SUPREME: They cannot get away.", "MALPHA: Suppose they send a message through this universe?", "DALEK SUPREME: They will not have time. If they do not die by our Varga plants, my patrols will kill them! They will be exterminated! Exterminated!"]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Desperate Jungle Escape',
        s.description = 'In this tense scene set in the deep and foreboding Kembel Jungle, Agent Marc Cory leads his colleague, Gordon Lowery, through a maze of dense foliage and treacherous terrain as they desperately seek refuge. The atmosphere is oppressive and uncertain, conveying the urgency of their situation as enemy forces loom unseen. With little more than a brief instruction, Cory takes charge with steely determination. His simple command, \'This way,\' encapsulates both the danger of their surroundings and his resolve to navigate them toward safety.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Leading the Way Through the Jungle',
        e.description = 'In this critical moment, Agent Marc Cory urgently directs Space Security colleague Gordon Lowery into the depths of the Kembel Jungle. With no time to spare, Cory’s brief command \'This way\' is delivered in a tone filled with urgency and determination. As they navigate the dark, hostile wilderness, every step carries the threat of danger lurking around every bend. This event sets the stage for their desperate search for safety, emphasizing both Cory’s leadership and the looming peril of the jungle environment.',
        e.sequence = 1,
        e.key_dialogue = ["CORY: This way."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Galactic Treaty Accord and Conquest Proclamation',
        s.description = 'In this pivotal scene set inside the Dalek Conference Room, delegates from the outer galaxies and the Dalek forces come together to seal a historic treaty. The scene opens as the assembled aliens and the Dalek Supreme jointly affirm their unyielding commitment to galactic domination. Following the chorus of agreement, Representative Malpha steps forward to speak with authority, declaring that the alliance – uniting six outer galaxy powers with the power from the solar system and the Daleks – represents the mightiest war force ever assembled. He vividly enumerates targets, proclaiming that conquest is assured, and the Dalek Supreme ominously declares that Earth will be the first to fall.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_dalek_conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Delegates Affirm the Treaty',
        e.description = 'The scene begins with the delegates in the Dalek Conference Room signaling their assent to the treaty presented before them. Two alien voices chime in with their agreement as the Dalek Supreme confirms that all are united under the pact. Their collective declarations establish the foundation of the alliance and set the tone for the ambitious plans that follow.',
        e.sequence = 1,
        e.key_dialogue = ["ALIEN 1: Agreed.", "ALIEN 2: Agreed.", "DALEK SUPREME: All are agreed. It is done. The seven great powers of the outer galaxies are one.", "ALIENS: Our galactic domination. Victory."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Malpha Proclaims the Historic Alliance',
        e.description = 'Representative Malpha assumes the role of the speaker and addresses the assembly with commanding authority. He declares that the alliance – uniting the six outer galaxy powers with the solar system’s might and the Daleks – is a historic milestone. In his stirring proclamation, he asserts that they together form the greatest war force ever assembled and lays out a vision of inevitable conquest by exalting key targets such as Mars, Venus, Jupiter, and the moon colonies. The Dalek Supreme reinforces this vision by declaring that Earth will be the first to fall.',
        e.sequence = 2,
        e.key_dialogue = ["MALPHA: This is indeed an historic moment in the history of the universe. We six from the outer galaxies, joining with the power from the solar system, the Daleks! The seven of us represent the greatest war force ever assembled. Conquest is assured! Mars! Venus! Jupiter! The moon colonies!", "DALEK SUPREME: They will all fall before our might. But the first of them will be Earth!"]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'The Varga Warning',
        s.description = 'In the dark, oppressive depths of the Kembel jungle clearing, tension reaches a fever pitch as physical terror manifests itself. Gordon Lowery, stricken by a potent poison, desperately attempts to suck the toxin from his palm when he suddenly notices the ghastly transformation: his hand and forearm are now covered with white, spiny projections – the deadly mark of the Varga plants. As Marc Cory returns from scouting, their brief and urgent exchange reveals a grim reality: the entire galaxy is targeted for invasion by the Daleks. In a final, chilling moment, Lowery agonizingly commands ‘Kill’ before falling dead, and a businesslike Cory quickly records a vital warning message on the rescue beacon. Meanwhile, unseen Dalek forces close in, issuing cold orders of extermination as the warning capsule lies unnoticed near Lowery’s body.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Lowery Discovers the Varga Effect',
        e.description = 'Gordon Lowery is in crippling pain as he desperately tries to suck the poison from his palm. Suddenly, he notices that the back of his hand and forearm are covered with white spines – a grotesque manifestation of the Varga plants’ effect. Panicked and horrified by this transformation, Lowery hastily pulls up his sleeve, his actions underscored by the ominous sounds of the jungle and the distant approach of Marc Cory.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Cory’s Urgent Report and Lowery’s Fatal Retort',
        e.description = 'Marc Cory and Gordon Lowery engage in a terse and anxiety-laden exchange as the crisis escalates. Cory announces with urgency that they must retrieve the rescue capsule immediately, noting that a Dalek city lurks nearby – close enough for him to overhear a sinister announcement. In a chilling dialogue, Cory reveals that the entire galaxy is to be invaded and destroyed. Lowery, processing the gravity of the situation, curtly responds with the single word ‘Kill’ – repeated for emphasis – and the truth crashes down on them. In a final, grim moment, Lowery declares that he will soon become one of the Varga and, in a futile act, brings his gun up before succumbing to his fate.',
        e.sequence = 2,
        e.key_dialogue = ["CORY: We've got to get this capsule off, and fast. There's a city down there, A Dalek city. I got quite close. Close enough to hear an announcement through the loudspeaker system.", "LOWERY: What did you hear?", "CORY: Our whole galaxy is to be invaded and destroyed.", "LOWERY: Kill.", "CORY: What?", "LOWERY: Kill. Kill.", "CORY: The Varga!", "LOWERY: That's right. I'll soon, soon I shall be one of them. Kill. Kill."]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'Cory Records the Warning Message',
        e.description = 'As the grim reality settles in with Lowery’s death, Marc Cory swiftly shifts his focus to the rescue beacon. With steely composure amid chaos, he records a crucial warning message. Speaking as an agent of the Special Security Service, Cory details the looming threat: the Daleks are planning the complete destruction of the galaxy and are assembling a vast war force with the aid of powers from the outer galaxies. His message, fraught with urgency and desperation, is intended to alert Earth immediately of the impending cosmic catastrophe.',
        e.sequence = 3,
        e.key_dialogue = ["CORY: Marc Cory, Special Security Service, reporting from the planet Kembel. The Daleks are planning the complete destruction of our galaxy. Together with the powers of the outer galaxies, a war force is being assembled.", "CORY: If our galaxy is to be saved, whoever receives this message must relay this information to Earth immediately. It is vital that defence mechanisms are put into operation at once! Message ends."]
    ;
MERGE (e:Event {uuid: 'event_13_4'})
    ON CREATE SET
        e.title = 'Dalek Orders and Extermination',
        e.description = 'Meanwhile, elsewhere in the jungle, Dalek forces are mobilized as their sensors register seismic activity. Dalek 2 informs that the crew from the rocket ship must be in the vicinity. When Dalek 1 inquires if the intruders are to be taken in for questioning, Dalek 2 coldly orders their extermination. The Daleks, unwavering in their obedience, execute the command with lethal precision, declaring that their plans for galactic conquest are intact and that any vital information discovered by Marc Cory has perished with Lowery.',
        e.sequence = 4,
        e.key_dialogue = ["DALEK 1: Seismic detector is registering.", "DALEK 2: The crew from the rocket ship must be in this direction.", "DALEK 1: Are they to be taken for questioning?", "DALEK 2: No. They are to be exterminated. Destroy them on sight. Destroy and exterminate!", "DALEKS: We obey.", "DALEK 2: Fire. He is dead.", "DALEK 1: Our plans for the galactic conquest are safe. Whatever information he discovered has died with him. Return to the city.", "DALEKS: We obey."]
    ;
MERGE (e:Event {uuid: 'event_13_5'})
    ON CREATE SET
        e.title = 'The Warning Capsule Left Unnoticed',
        e.description = 'In the aftermath of the Daleks’ ruthless order and subsequent assault, a final, haunting image remains in the clearing. The rescue capsule, containing Marc Cory’s recorded warning message, lies abandoned near the lifeless body of Gordon Lowery. Unnoticed and unheeded amid the chaos, the capsule stands as a silent testament to the desperate call for salvation that now hangs in the balance.',
        e.sequence = 5,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'The Dalek Pledge',
        s.description = 'In the austere Dalek Conference Room, Representative Malpha stands at the head of a imposing conference table as the assembled delegates proclaim their allegiance to the Dalek cause. The atmosphere is charged with ruthless ambition and militant fervor. Malpha declares that their united armies will reduce galaxies to ashes and crush Earth beneath their heel, heralding a new era of domination. His voice, full of authority and menace, is immediately echoed by the rousing voices of the others in the room, all chanting victory. The scene sets the tone for a universe on the brink of total conquest.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_dalek_conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'The Dalek Alliance Pledge',
        e.description = 'In this climactic moment within the Dalek Conference Room, Representative Malpha takes center stage to issue a bold declaration of loyalty to the Dalek cause. He announces that their united forces will reduce the galaxies to ashes, turn their adversaries to dust, and begin by conquering Earth. His command is met with an overwhelming chorus of victory shouts from all the delegates present. The event establishes the ideological and militaristic foundation of the alliance, setting the stage for the impending occupation and conquest as planned by the Daleks and their outer systems allies.',
        e.sequence = 1,
        e.key_dialogue = ["MALPHA: Now all is ready. We at this table pledge our allegiance to the Dalek cause. Our armies will reduce the galaxies to ashes. Their people to dust. And Earth we will conquer first. Victory! Victory! Victory!", "ALL: Victory! Victory! Victory!"]
    ;
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (o:Organization {uuid: 'org_space_security'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (o:Organization {uuid: 'org_space_security'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (o:Organization {uuid: 'org_outer_systems_alliance'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_garvey_gun'}),
          (a:Agent {uuid: 'agent_jeff_garvey'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_ray_gun'}),
          (a:Agent {uuid: 'agent_marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_space_security_id_card'}),
          (a:Agent {uuid: 'agent_marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_authority_document'}),
          (a:Agent {uuid: 'agent_marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_control_panel'}),
          (a:Agent {uuid: 'org_daleks'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (o:Organization {uuid: 'org_space_security'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (o:Organization {uuid: 'org_space_security'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (o:Organization {uuid: 'org_daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (o:Organization {uuid: 'org_outer_systems_alliance'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_garvey_gun_event_1_1'})
    ON CREATE SET
        oi.description = 'The gun is a pivotal object that Garvey actively retrieves from his belt as he transforms from a state of agonized confusion to one of lethal determination. It functions as both a symbol and a tool, representing his acceptance of the dark urge to kill and marking the transition from suffering to a readiness to commit murder under the alien influence that is eroding his humanity.',
        oi.status_before = 'Before the event, the gun rested securely on Garvey’s belt, showing signs of consistent use in the harsh jungle environment.',
        oi.status_after = 'After the event begins, the gun is in Garvey’s hand, now a weapon that he intends to employ to carry out his compulsive and murderous plan.'
    WITH oi
    MATCH (o:Object {uuid: 'object_garvey_gun'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Jeff Garvey is discovered lying in the dense jungle clearing, his eyes blurred with confusion as he awakens abruptly. He sits up slowly, surveys his disoriented surroundings, and then clutches his temples in desperate agony as a searing headache overtakes him. As the pain subsides, he gradually stands with a measured, determined gait and purposefully reaches for the gun at his belt.',
        ap.emotional_state = 'Initially overwhelmed by intense physical pain and disorientation, Garvey’s expression twists in agony, revealing deep internal torment. In the wake of the excruciating headache, a chilling clarity replaces his suffering. His face shifts from confusion to grim resolve, and a desperate, almost compulsive need to kill emerges, betraying a conflict between lingering humanity and an ominous, alien compulsion.',
        ap.emotional_tags = ["Initially overwhelmed by intense physical pain", "disorientation, Garvey\u2019s expression twists in agony, revealing deep internal torment. In the wake of the excruciating headache, a chilling clarity replaces his suffering. His face shifts from confusion to grim resolve,", "a desperate, almost compulsive need to kill emerges, betraying a conflict between lingering humanity", "an ominous, alien compulsion."],
        ap.active_plans = ["To act on his sudden murderous impulse", "To use his retrieved weapon to eliminate perceived threats", "To fulfill the dark compulsion that has overtaken his mind"],
        ap.beliefs = ["He believes that the excruciating pain has revealed a new, fatal purpose within him", "He is convinced that killing is the only resolution to his internal torment", "He holds that his transformation, no matter how tragic, necessitates extreme violence"],
        ap.goals = ["Short-term: Immediately execute the urge to kill as a means to end his agony", "Medium-term: Assert control over his rapidly changing nature through lethal action", "Ultimate: Embrace the dark destiny imposed by alien influence, even if it means losing his humanity"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wrench_event_2_1'})
    ON CREATE SET
        oi.description = 'The wrench is a heavy-duty mechanical tool crucial for the repair work being undertaken on the rocket ship’s damaged tail fin. During the event, Marc Cory hands the wrench over to Gordon Lowery upon request, allowing Lowery to attempt repairs on the vessel despite the tense, bickering atmosphere.',
        oi.status_before = 'The wrench was in a state of readiness, likely secure in the possession of one of the agents or in the expedition’s toolkit, undamaged and functional.',
        oi.status_after = 'After being used in the repair attempt, the wrench remains a functional tool with no explicit damage noted; its role has been pivotal in symbolizing the urgency and technical focus of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wrench'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rocket_ship_event_2_1'})
    ON CREATE SET
        oi.description = 'The rocket ship is the central narrative object serving as both the setting and the target for repair work. Visible damage to its tail fin and melted retaining bolts highlight the technical challenges faced by the crew. The vessel embodies the urgency and high stakes of the mission, as delays in repair risk missing the crucial rendezvous with the freighter.',
        oi.status_before = 'Prior to the event, the rocket ship is visibly damaged—with its tail fin in disrepair and critical components, such as the retaining bolts, compromised by flare-back and tarnium lumps—sitting in a hostile jungle clearing.',
        oi.status_after = 'By the end of the event, while the repair work is still in progress, the rocket ship remains in a damaged state. The repair has not been concluded yet, maintaining the tension and urgent atmosphere surrounding the mission.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rocket_ship'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ray_gun_event_2_3'})
    ON CREATE SET
        oi.description = 'The ray gun, held and operated by Marc Cory, discharges a forceful energy blast that inadvertently strikes Jeff Garvey. Its lethal blast not only topples Garvey but also becomes the narrative catalyst for his horrifying transformation into a Varga, underscoring the high stakes of their dangerous mission.',
        oi.status_before = 'The ray gun is fully charged, calibrated for use, and in the possession of Marc Cory as he methodically works on the rocket ship repair.',
        oi.status_after = 'Following the discharge, the ray gun appears spent with its charge depleted, having emitted a powerful energy blast whose unintended consequences set off Garvey’s fatal injury and transformative corruption.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ray_gun'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is physically engaged at the rocket ship’s exterior, crouched near the damaged tail fin and carefully trying to fix it while muttering complaints about the hostile planet and the inadequate conditions.',
        ap.emotional_state = 'He is visibly irritable and frustrated, his tone edged with exasperation as he grumbles about the unsuitability of the landing planet and the delay threatening their rendezvous. There is a mix of determination and simmering anger underlying his physical strain.',
        ap.emotional_tags = ["He is visibly irritable", "frustrated, his tone edged with exasperation as he grumbles about the unsuitability of the l", "ing planet", "the delay threatening their rendezvous. There is a mix of determination", "simmering anger underlying his physical strain."],
        ap.active_plans = ["Repair the wounded tail fin of the rocket ship promptly using the available tools.", "Ensure that the rocket is made flight-ready in time to catch the rendezvous with the freighter.", "Maintain strict discipline on the job by cutting out unnecessary chatter and focusing on technical repairs."],
        ap.beliefs = ["Efficiency and a no-nonsense approach to duty are paramount, especially in hostile and time-critical situations.", "He believes that as captain he must enforce order and maintain control even if it means suppressing personal grievances.", "Time is of the essence and technical precision in repairs directly correlates with mission success and survival."],
        ap.goals = ["Short-term: Quickly fix the tail fin using the available tool (wrench) to get the ship off the ground.", "Medium-term: Depart the hostile jungle and reach the pick-up rendezvous before the freighter departs.", "Ultimate: Ensure the expedition\u2019s objectives are met and preserve the lives of his team by escaping the planet safely."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory stands calm and businesslike beside Lowery, overseeing the repair process and handling technical requests—such as handing over the requested wrench—to ensure that the repair work proceeds efficiently.',
        ap.emotional_state = 'He exhibits a cool and measured disposition despite the evident chaos, maintaining composure and focus. His calm tone underlines an inner resolve to prioritize the mission over personal drama, remaining unruffled even as tensions rise.',
        ap.emotional_tags = ["He exhibits a cool", "measured disposition despite the evident chaos, maintaining composure", "focus. His calm tone underlines an inner resolve to prioritize the mission over personal drama, remaining unruffled even as tensions rise."],
        ap.active_plans = ["Supply essential tools to Lowery (for instance, the wrench) to facilitate the technical repair of the rocket ship.", "Keep the repair process on track by encouraging silence and focus, thereby prioritizing the job over idle chatter.", "Ensure that evidence is gathered and the mission timeline is adhered to without diversion due to internal bickering."],
        ap.beliefs = ["Mission success depends on efficiency and a disciplined approach in crisis situations.", "Focus on technical precision and timely execution is paramount, irrespective of personal disagreements.", "Every operative must set aside personal emotions in order to uphold the greater objective of space security."],
        ap.goals = ["Short-term: Help complete the repair of the rocket ship\u2019s tail fin by promptly providing needed tools.", "Medium-term: Assist in preparing the rocket ship for a timely launch to rendezvous with the freighter.", "Ultimate: Contribute decisively to the overall mission of escaping the hostile planet and ensuring that critical evidence is secured for further action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Jeff Garvey lurks unseen in the dense jungle foliage, partially concealed behind the vegetation near the rocket ship. He observes the two repair agents working on the vessel’s tail fin and, with a measured and chilling tone, utters the command \'Kill. Kill.\' as he begins to edge forward, positioning himself between the repair operation and the outside world.',
        ap.emotional_state = 'He is cold and menacing, his inner torment evident as signs of his transformation slowly appear. There is a disturbing mix of detached determination and tragic self-destruction, marked by twitching movements and the emerging growth of long white hairs and Varga thorns, reflecting his loss of humanity.',
        ap.emotional_tags = ["He is cold", "menacing, his inner torment evident as signs of his transformation slowly appear. There is a disturbing mix of detached determination", "tragic self-destruction, marked by twitching movements", "the emerging growth of long white hairs", "Varga thorns, reflecting his loss of humanity."],
        ap.active_plans = ["Intend to disrupt and potentially eliminate the repair agents overseeing the rocket ship.", "Advance covertly to interfere with the ongoing repair operation.", "Use his silent, lethal command to inspire further lethal action against those he sees as obstacles."],
        ap.beliefs = ["Believes that violence is a necessary means to assert control and fulfill his darker destiny.", "Is convinced that his transformation into a Varga is inevitable and that embracing it is essential.", "Feels that the repair operation\u2014and those involved\u2014must be stopped to serve his emerging purpose."],
        ap.goals = ["Short-term: To initiate chaos by issuing the 'Kill. Kill.' command and ambush the repair team.", "Medium-term: To further undermine the repair operation and destabilize the expedition\u2019s progress.", "Long-term: To fully embody his Varga transformation and eradicate any obstacles while embracing his new, destructive identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is actively engaged alongside Marc Cory at the rocket ship repair site, methodically examining components and using tools to mend the tail fin. He is physically focused on completing the repairs and ensuring that the ship meets the critical launch parameters.',
        ap.emotional_state = 'Lowery is frustrated and tense due to technical difficulties and the urgent need to launch, but his shock and horror rapidly escalate when the fatal blast strikes Jeff Garvey. His feelings shift to violent anger and disbelief, as he reacts impulsively in accusatory outbursts directed at Marc Cory.',
        ap.emotional_tags = ["Lowery is frustrated", "tense due to technical difficulties", "the urgent need to launch, but his shock", "horror rapidly escalate when the fatal blast strikes Jeff Garvey. His feelings shift to violent anger", "disbelief, as he reacts impulsively in accusatory outbursts directed at Marc Cory."],
        ap.active_plans = ["Quickly repair the rocket ship to reach the rendezvous orbit.", "Maintain discipline and ensure the safety of the vessel during the critical phase.", "Confront any recklessness on the part of his colleagues to keep the mission on track."],
        ap.beliefs = ["Technical precision and adherence to protocol are paramount for mission success.", "The responsibility of a captain is to safeguard the crew and the vehicle at all costs.", "Any deviation from strict operational standards endangers the entire expedition."],
        ap.goals = ["Short-term: Complete the necessary repairs to launch the ship without delay.", "Medium-term: Successfully attain the rendezvous orbit with the freighter.", "Ultimate: Ensure the overall safety and success of the Space Security expedition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Marc Cory remains composed and businesslike as he retrieves tools and oversees the rocket ship repair. While he uses his ray gun with purposeful efficiency, his measured actions contrast with the emerging chaos, displaying a calm control under pressure.',
        ap.emotional_state = 'Cory exhibits a cool detachment, interspersed with calculated decisiveness. Although his actions inadvertently lead to a fatal blast, he stays focused, managing an inner tension and slight remorse while insisting that critical decisions must be made for the greater good.',
        ap.emotional_tags = ["Cory exhibits a cool detachment, interspersed with calculated decisiveness. Although his actions inadvertently lead to a fatal blast, he stays focused, managing an inner tension", "slight remorse while insisting that critical decisions must be made for the greater good."],
        ap.active_plans = ["Ensure that the rocket ship is repaired and launched promptly to meet the mission\u2019s rendezvous.", "Utilize his ray gun decisively to neutralize potential threats if necessary.", "Secure and record vital evidence during the repair operation to support the larger operation."],
        ap.beliefs = ["Calm decisiveness and strategic sacrifice are necessary in times of crisis.", "Mission objectives outweigh individual cost, even if it means unintended casualties.", "Operational efficiency and evidence preservation are key to Space Security\u2019s success."],
        ap.goals = ["Short-term: Oversee the repair work and maintain control of the situation during the rocket preparation.", "Medium-term: Successfully launch the ship to secure the rendezvous with the freighter.", "Ultimate: Complete the joint expedition mission while preserving necessary evidence for accountability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Jeff Garvey is covertly advancing from the dense jungle, attempting to position himself for an attack while uttering violent commands. As he nears, he is caught in an unintended, powerful energy blast that devastates his body, leading him to collapse and begin a grotesque transformation marked by twitching movements and emerging white, thorn-like spines.',
        ap.emotional_state = 'Initially aggressive and bloodthirsty, Garvey’s demeanor shifts rapidly into shock and agonizing pain as the ray gun’s discharge takes effect. His internal turmoil is compounded by the onset of his Varga transformation, a physical manifestation of corruption and loss of humanity.',
        ap.emotional_tags = ["Initially aggressive", "bloodthirsty, Garvey\u2019s demeanor shifts rapidly into shock", "agonizing pain as the ray gun\u2019s discharge takes effect. His internal turmoil is compounded by the onset of his Varga transformation, a physical manifestation of corruption", "loss of humanity."],
        ap.active_plans = ["Approach the rocket ship stealthily to ambush or eliminate perceived enemies.", "Issue commands for destruction with an intent to assert violent dominance.", "Exploit the chaos to initiate his own transformation-driven agenda."],
        ap.beliefs = ["Violent retribution is the natural and justified response to betrayal and opposition.", "Dominance through fear and terror is an acceptable means to achieve power.", "The transformation into a Varga represents an evolution toward a more ruthless state."],
        ap.goals = ["Short-term: Engage the targets covertly and trigger violent confrontation.", "Medium-term: Allow his emerging Varga state to consolidate his lethal potential.", "Ultimate: Achieve a corrupted and dominant form of power, even at the cost of his own humanity."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_space_security_id_card_event_3_1'})
    ON CREATE SET
        oi.description = 'Marc Cory deliberately hands his Space Security ID Card to Lowery during the exchange as a tangible symbol of membership and official authority. This object is used to affirm Lowery’s enlistment under Cory’s command, reinforcing the hierarchical reorganization within the mission.',
        oi.status_before = 'The ID Card is securely in Cory’s possession, serving as his personal credential issued by the Space Security Service.',
        oi.status_after = 'After being handed over, the ID Card now becomes evidence in Lowery’s hands of his new status as a directly enlisted operative under Cory’s orders.'
    WITH oi
    MATCH (o:Object {uuid: 'object_space_security_id_card'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_authority_document_event_3_1'})
    ON CREATE SET
        oi.description = 'The Authority Document is presented by Marc Cory to underscore his legal power to command and to enlist aid from any civilians or military personnel. It functions as a narrative device that legitimizes the abrupt shift in command and solidifies his role as the primary decision-maker, compelling Lowery to comply.',
        oi.status_before = 'The document is in Cory’s possession as a formal certification of his authority, symbolizing the weight of his mandate.',
        oi.status_after = 'Its issuance in the conversation cements the new command structure, and although it remains with Cory, its information effectively enlists Lowery and validates the chain of command established during the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object_authority_document'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_varga_thorn_event_3_3'})
    ON CREATE SET
        oi.description = 'The Varga Thorn is central to the event as it is the source of the potent poison responsible for Garvey’s transformation. This sharp, cactus-like thorn carries a neurotoxin that attacks the brain, replacing rational thought with an obsessive, murderous drive. Its poison sets off a chain reaction that physically alters the victim by inducing twitching, spiking growths, and the eventual obliteration of human form. The object\'s presence not only confirms Cory’s earlier warnings but also serves as a vivid symbol of the insidious threat posed by the Daleks and their connection to extraterrestrial flora.',
        oi.status_before = 'Before the event, the Varga Thorn is described as a dangerous, naturally occurring element on Skaro, intact and known for its lethal poison that disrupts normal brain function.',
        oi.status_after = 'After the event, the Varga Thorn\'s toxin has been activated; its venom has begun to spread through Jeff Garvey’s system, having been instrumental in initiating his grotesque transformation into a Varga, reinforcing its narrative role as the catalyst for loss of humanity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_varga_thorn'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_vergometer_event_3_4'})
    ON CREATE SET
        oi.description = 'The vergometer is a critical technical instrument referenced during the debate over the rocket ship’s integrity; it measures vital link pulses and system pressures required for safe atmospheric penetration. Lowery questions its functionality, underscoring its role in ensuring that the vessel can properly break through the planet’s atmosphere while the crew debates the feasibility of repairing the ship after the crash.',
        oi.status_before = 'Prior to the incident, the vergometer was maintained as a calibrated, reliable device according to standard operational procedures.',
        oi.status_after = 'Following the crash, its status is uncertain as it has not been retested, leaving open the possibility that it may have been damaged or is otherwise unreliable under current conditions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_vergometer'})
    MATCH (e:Event {uuid: 'event_3_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory stands at the helm of the discussion with controlled authority, revealing classified intelligence about the Daleks to Lowery. He hands over his Space Security ID and presents an Authority Document, underlining his command over the mission.',
        ap.emotional_state = 'He remains composed and methodical, channeling a cool, businesslike determination despite the underlying grief over Garvey’s death; his tone is firm and almost detached.',
        ap.emotional_tags = ["He remains composed", "methodical, channeling a cool, businesslike determination despite the underlying grief over Garvey\u2019s death; his tone is firm", "almost detached."],
        ap.active_plans = ["Enlist Lowery immediately under his direct command to streamline the chain of authority.", "Disclose crucial intelligence about the Dalek threat that has emerged in the far reaches of space.", "Ensure that the sensitive details are transmitted, setting the stage for further coordinated action against an intergalactic menace."],
        ap.beliefs = ["He believes that the threat from the Daleks is real and imminent, even if they appear distant at first.", "He is convinced that Garvey\u2019s death and his own unexpected responsibility necessitate radical measures.", "He holds that his legal and official authority, as embodied by his credentials and documents, legitimizes every decision he makes."],
        ap.goals = ["Short-term: Secure Lowery\u2019s compliance and inform him of the Dalek developments.", "Medium-term: Coordinate a unified response using his newly assumed command to counter the hostile forces.", "Ultimate: Transmit the vital warning about the Dalek incursions to Earth and safeguard the galaxy from their destructive ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is visibly agitated and bitter; he challenges Cory’s sudden assumption of command and expresses disbelief and resentment over Jeff Garvey’s death, remarking on his long years of partnership.',
        ap.emotional_state = 'Lowery is filled with a mixture of anger, grief, and resistance; his tone is defiant and disillusioned as he struggles to reconcile past loyalties with the abrupt new orders.',
        ap.emotional_tags = ["Lowery is filled with a mixture of anger, grief,", "resistance; his tone is defiant", "disillusioned as he struggles to reconcile past loyalties with the abrupt new orders."],
        ap.active_plans = ["Demand a full explanation for Garvey\u2019s death and question the logic behind the new command structure.", "Probe for additional details about the Dalek threat and the credibility of Cory\u2019s claims.", "Consider voicing dissent or outright refusal to accept orders without a satisfactory justification."],
        ap.beliefs = ["He believes in the loyalty and trust that were the foundation of his long-term working relationship with Garvey.", "He is skeptical of rapid authority shifts and doubts the necessity of obeying orders from someone he barely knew.", "He values accountability, feeling that vital decisions must not be taken lightly, especially when comrades are lost."],
        ap.goals = ["Short-term: Obtain clarification about the circumstances of Garvey\u2019s death and the emerging threat.", "Medium-term: Reassert his own sense of agency and ensure that any actions taken are in line with proper procedure.", "Ultimate: Maintain the integrity of their mission and protect the legacy of his fallen comrade while navigating the dangerous new realities presented by the Dalek intelligence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Marc Cory stands inside the ship with a calm and methodical demeanor, handing his Space Security ID and authority document to Lowery. He is engaging in a precise, measured explanation of the Dalek revival and the ominous implications of the Varga thorn for the galaxy.',
        ap.emotional_state = 'He appears composed, businesslike, and resolute, though underneath his confident tone there is a sense of urgent concern. His manner betrays a deep commitment to his mission despite recent traumatic losses.',
        ap.emotional_tags = ["He appears composed, businesslike,", "resolute, though underneath his confident tone there is a sense of urgent concern. His manner betrays a deep commitment to his mission despite recent traumatic losses."],
        ap.active_plans = ["Establish and enforce a clear chain of command by enlisting Lowery under his direct authority.", "Disseminate critical intelligence regarding the Dalek resurgence and the significance of the Varga thorn.", "Prepare his team to respond to the renewed threat by ensuring everyone understands the gravity of the situation."],
        ap.beliefs = ["The Daleks, though long-dormant in our galaxy, have stealthily reconquered numerous planets and now pose an imminent threat.", "The Varga thorn\u2014growing naturally only on Skaro\u2014is definitive evidence of the Daleks\u2019 return and their toxic capacity to subvert rational thought.", "His command, validated by Space Security Service credentials, is essential to counteract this renewed menace."],
        ap.goals = ["Short-term: Convince Lowery of his new authoritative role and communicate the urgent intelligence regarding Dalek activity.", "Medium-term: Mobilize his forces to prepare for the inevitable resurgence of the Daleks in the region.", "Ultimate: Prevent a full-scale threat to Earth and secure safety by coordinating an effective response to the Dalek invasion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery appears agitated and disbelieving as he listens to Marc Cory\'s explanation. He is visibly upset by the loss of his longtime comrade Garvey and is questioning every detail of the Dalek threat as well as the sudden change in command.',
        ap.emotional_state = 'Lowery is overwhelmed by grief, anger, and skepticism. His emotional turmoil is evident in his sharp, defensive interjections and his reluctance to accept the new chain of command without a fuller explanation.',
        ap.emotional_tags = ["Lowery is overwhelmed by grief, anger,", "skepticism. His emotional turmoil is evident in his sharp, defensive interjections", "his reluctance to accept the new chain of comm", "without a fuller explanation."],
        ap.active_plans = ["Demand a thorough and coherent explanation for Garvey's death and the circumstances leading up to it.", "Seek full clarification on the nature and current status of the Dalek threat.", "Comply\u2014albeit unwillingly\u2014with the new orders while internally questioning and challenging the morality of the actions taken."],
        ap.beliefs = ["He believes that the ruthless operational standards of Space Security require accountability, especially following the loss of Garvey.", "He is convinced that critical intelligence about the Daleks must be transparent and that orders cannot simply override common-sense judgment.", "His experience has taught him that loyalty and competence deserve recognition, and he doubts that merely being enlisted under a new command is justified."],
        ap.goals = ["Short-term: Obtain the necessary details to make sense of Garvey\u2019s death and ensure accountability in the chain of command.", "Medium-term: Maintain his own sense of agency by demanding transparent communication and proper justification for the new orders.", "Ultimate: Serve effectively while ensuring that any measures taken against the Dalek threat are fully justified and that no further injustice is committed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Jeff Garvey is physically deteriorating before our eyes; his legs and feet are convulsing with uncontrollable twitching and spasms, and long, white spines are slowly emerging over his torso. His skin appears to be hardening in patches and his once-human features are fading as the transformation into a Varga takes hold amid a silent, horrifying metamorphosis.',
        ap.emotional_state = 'Internally, Jeff Garvey is overwhelmed with a deep sense of terror, despair, and inner torment. He feels both the shock of sudden loss of his humanity and a mounting terror at the irreversible invasion of a poisonous force that is replacing reason with a murderous instinct. Amid confusion and sorrow he battles feelings of helplessness and anguish as every fiber of his being betrays the man he once was.',
        ap.emotional_tags = ["Internally, Jeff Garvey is overwhelmed with a deep sense of terror, despair,", "inner torment. He feels both the shock of sudden loss of his humanity", "a mounting terror at the irreversible invasion of a poisonous force that is replacing reason with a murderous instinct. Amid confusion", "sorrow he battles feelings of helplessness", "anguish as every fiber of his being betrays the man he once was."],
        ap.active_plans = ["Fighting to maintain a semblance of human control despite the overpowering influence of the poison.", "Attempting to send a silent warning about the threat to those who still can understand his fate.", "Striving, however futilely, to resist the complete loss of his identity before his transformation is finalized."],
        ap.beliefs = ["He believes that real humanity is worth preserving despite alien contamination and hostile forces.", "He is convinced that the mysterious poison from the Varga thorn is a lethal agent that subverts rational thought.", "He holds a deep conviction that warnings about such transformations must be communicated, even if he is losing his own ability to reason."],
        ap.goals = ["Short-term: to cling to any remaining human consciousness and control the beginning of his transformation.", "Medium-term: to possibly seek a remedy or antidote to slow or reverse the toxic effects of the Varga poison.", "Ultimate: to warn his comrades of the true dangers posed by the Daleks and the Varga plant, and to preserve the memory of his human identity even as he is transformed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is methodically operating the ship’s communication system, repeatedly calling out to freighter XM2 through a static‐filled transmitter while handing over his Space Security ID to Lowery and unfurling important documents.',
        ap.emotional_state = 'He remains cool and composed with a steely determination, masking any inner anxiety with calm professionalism and a resolute focus even amid extreme crisis and technical challenges.',
        ap.emotional_tags = ["He remains cool", "composed with a steely determination, masking any inner anxiety with calm professionalism", "a resolute focus even amid extreme crisis", "technical challenges."],
        ap.active_plans = ["Establish and maintain contact with freighter XM2 to secure a potential rescue or transfer.", "Assess and debate the integrity of the recently damaged communication links and related systems.", "Present classified information regarding the Dalek resurgence and the Varga threat to reinforce operational decisions."],
        ap.beliefs = ["The authority and protocols of Space Security must be strictly upheld.", "Accurate documentation and evidence are vital to counter emerging extraterrestrial threats.", "The resurgence of the Daleks, even from millions of light years away, indicates a hidden menace that demands immediate strategic action."],
        ap.goals = ["Short-term: Successfully contact freighter XM2 and verify its operational status.", "Medium-term: Evaluate and potentially repair critical communication systems including the vergometer.", "Ultimate: Secure and disseminate crucial intelligence to counter the Dalek threat and protect human interests."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is scrutinizing the technical systems onboard, questioning the functionality of the link pulses and the vergometer while expressing skepticism about the ship’s repair status after the crash.',
        ap.emotional_state = 'He exhibits frustration and cautious anxiety, marked by a bitter tone as he grapples with the risks of operating potentially compromised systems while upholding stringent Space Security standards.',
        ap.emotional_tags = ["He exhibits frustration", "cautious anxiety, marked by a bitter tone as he grapples with the risks of operating potentially compromised systems while upholding stringent Space Security st", "ards."],
        ap.active_plans = ["Critically verify that all technical parameters\u2014especially the link pulses and the vergometer\u2014are functioning correctly.", "Insist on thorough testing and validation before accepting any repair efforts.", "Refuse to proceed with operations until safety and system integrity have been convincingly established."],
        ap.beliefs = ["Only thoroughly tested and reliable equipment can guarantee safe atmospheric re-entry.", "Strict adherence to operational and security protocols is non-negotiable.", "Cutting corners or ignoring unresolved technical issues will jeopardize the lives of the crew and the mission."],
        ap.goals = ["Short-term: Confirm the operational status of the communication link and the vergometer.", "Medium-term: Ensure that all ship systems are sound and safe before further maneuvers.", "Ultimate: Protect the crew and mission by preventing any dangerous oversights that could lead to catastrophic failure during atmospheric entry."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_control_panel_event_4_1'})
    ON CREATE SET
        oi.description = 'The Dalek Control Panel is the operational nerve center of the control room, displaying space monitor data and enemy positions while enabling the Dalek Supreme to issue decisive commands. Its interfaces facilitate the flow of reports and orders that drive the ruthless Dalek strategy during the conference.',
        oi.status_before = 'Prior to the event, the control panel is fully functional, actively displaying monitoring data and ready to receive input.',
        oi.status_after = 'After the event, the control panel remains operational, having effectively transmitted and supported the Dalek Supreme’s orders in initializing the conference.'
    WITH oi
    MATCH (o:Object {uuid: 'object_control_panel'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_control_panel_event_4_2'})
    ON CREATE SET
        oi.description = 'The Dalek Control Panel is the central array of interfaces and monitors used by Dalek 1 to relay space monitoring data. In this event, it functions as the vital command interface that displays the operational status, confirms the arrival of emissaries from the seven planets, and allows the Dalek Supreme to oversee and issue decisive extermination orders.',
        oi.status_before = 'Prior to the event, the control panel was actively monitoring space data, fully operational and integrated with the Dalek communication networks.',
        oi.status_after = 'After the event, the control panel remains actively engaged, having successfully transmitted the report confirming the emissaries\' scheduled arrival and reinforcing the precision of the Daleks\' cosmic plans.'
    WITH oi
    MATCH (o:Object {uuid: 'object_control_panel'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_control_panel_event_4_3'})
    ON CREATE SET
        oi.description = 'The Dalek Control Panel serves as the technological backbone of the Dalek control room. It displays critical space monitoring data and enemy positions, and is the medium through which the Dalek Supreme receives reports and issues commands. Its interfaces are integral in coordinating the conference, and its real‐time feedback emphasizes the disciplined precision of Dalek planning.',
        oi.status_before = 'Fully functional and actively monitoring enemy dispositions, with gunmetal blue-grey and silver interfaces operating at peak efficiency.',
        oi.status_after = 'Remains intact and fully operational, continuing to provide real-time data and serving as the conduit for the Dalek Supreme’s commanding directives.'
    WITH oi
    MATCH (o:Object {uuid: 'object_control_panel'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_control_panel_event_4_4'})
    ON CREATE SET
        oi.description = 'The Dalek Control Panel is actively used in the control room to display and update live sensor data, enabling precise tracking of the alien spacecraft. It serves as the operational backbone for issuing extermination orders and verifying that orders from the Dalek Supreme are executed, thus playing a critical functional and narrative role in ensuring the security directive is maintained.',
        oi.status_before = 'Fully operational and actively displaying accurate space monitoring data.',
        oi.status_after = 'Remains fully operational, having successfully relayed all critical security updates and extermination instructions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_control_panel'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_control_panel_event_4_5'})
    ON CREATE SET
        oi.description = 'The Dalek Control Panel is the operational nucleus of the control room. It displays vital space monitoring data, tracks enemy positions, and serves as the medium through which the Dalek Supreme issues detailed commands. In this event, it facilitates the reception of security and space monitor reports that prompt the Supreme\'s ferocious order for total destruction.',
        oi.status_before = 'Prior to the event, the control panel was fully functional and actively displaying real-time monitoring data, reflecting the strong operational condition of the Dalek control room.',
        oi.status_after = 'After the event, the control panel remains intact and fully operational, continuing to relay information and support the Dalek command structure without any apparent damage or change.'
    WITH oi
    MATCH (o:Object {uuid: 'object_control_panel'})
    MATCH (e:Event {uuid: 'event_4_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_1'})
    ON CREATE SET
        ap.current_status = 'The Dalek Supreme strides into the Dalek control room in his imposing jet‐black casing, standing authoritatively before his subordinates as he announces his intent to receive detailed reports and issue commands.',
        ap.emotional_state = 'He exudes cold, ruthless determination and unyielding confidence, with a steely focus on executing extermination orders without hesitation.',
        ap.emotional_tags = ["He exudes cold, ruthless determination", "unyielding confidence, with a steely focus on executing extermination orders without hesitation."],
        ap.active_plans = ["Receive and review space monitor control reports from subordinate Daleks.", "Order the total destruction of the alien spacecraft and its occupants.", "Set the agenda for the upcoming conference by establishing clear security and extermination priorities."],
        ap.beliefs = ["He believes in the absolute supremacy of the Daleks and that any alien resistance must be eradicated.", "He holds that orders must be executed ruthlessly without deviation.", "He is convinced that establishing dominant control over Kembel is essential for Dalek expansion."],
        ap.goals = ["Short-term: Authenticate space monitoring reports and verify that the emissaries will arrive as arranged.", "Medium-term: Ensure that enemy vessels are immediately neutralized, consolidating Dalek security.", "Ultimate: Achieve total extermination of the adversaries and secure Dalek dominance on Kembel."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Dalek 1 is stationed at the advanced Dalek Control Panel in the main control room, actively processing and relaying data in response to the Dalek Supreme’s command. It confirms the activation of space monitor control and the scheduled arrival of emissaries from the seven planets.',
        ap.emotional_state = 'The agent exudes a cold, ruthless efficiency with unwavering confidence, displaying characteristic Dalek detachment and calculated composure.',
        ap.emotional_tags = ["The agent exudes a cold, ruthless efficiency with unwavering confidence, displaying characteristic Dalek detachment", "calculated composure."],
        ap.active_plans = ["Report that space monitor control is fully active.", "Confirm the coordinated arrival of emissaries from the seven planets as arranged.", "Execute further orders from the Dalek Supreme without hesitation."],
        ap.beliefs = ["Precision in operation is essential to the Dalek conquest.", "Adherence to the Supreme\u2019s commands guarantees total extermination of opposing forces.", "The timely arrival of the emissaries underpins the cosmic strategy for domination."],
        ap.goals = ["Short-term: Deliver an accurate and prompt report on the operational status to the Dalek Supreme.", "Long-term: Sustain the operational efficiency needed to ensure the extermination of alien threats and further the Daleks' universal expansion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_3'})
    ON CREATE SET
        ap.current_status = 'The Dalek Supreme stands imposingly in the Dalek control room, issuing decisive commands and receiving detailed reports from his subordinate monitors, as he dictates the next phase of their operation.',
        ap.emotional_state = 'He exhibits a cold, unyielding determination with a measured, authoritative composure that reflects his belief in Dalek superiority and methodical domination.',
        ap.emotional_tags = ["He exhibits a cold, unyielding determination with a measured, authoritative composure that reflects his belief in Dalek superiority", "methodical domination."],
        ap.active_plans = ["Command the commencement of the conference at first sun.", "Receive and review space monitor and security reports.", "Ensure that enemy alien spacecraft and their occupants are to be totally destroyed."],
        ap.beliefs = ["Daleks must systematically eliminate all threats to achieve absolute domination.", "Every action and report must adhere to precise, ruthless efficiency.", "The planned extermination of the aliens is necessary for the success of their masterplan."],
        ap.goals = ["Short-term: Initiate the conference and obtain a comprehensive security update.", "Medium-term: Mobilize Dalek forces to locate and annihilate the alien spacecraft and its occupants.", "Ultimate: Consolidate Dalek supremacy on Kembel and further their plan of universal domination."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 is engaged at the Dalek Control Panel, precisely confirming sensor readings and reporting that an alien spacecraft has been located; it calmly instructs that the patrol will reach the target shortly.',
        ap.emotional_state = 'Unwavering, detached, and coldly calculating with a rigid adherence to Dalek logic.',
        ap.emotional_tags = ["Unwavering, detached,", "coldly calculating with a rigid adherence to Dalek logic."],
        ap.active_plans = ["Confirm the exact position of the alien spacecraft using sensor data.", "Ensure that the patrol unit intercepts and exterminates the alien craft and its occupants.", "Support the execution of security directives issued by the Dalek Supreme."],
        ap.beliefs = ["All alien intruders must be obliterated without hesitation.", "Precision and efficiency in executing extermination orders are paramount.", "Daleks are the supreme force and nothing subversive can be tolerated."],
        ap.goals = ["Short-term: Safely relay the spacecraft's position and confirm arrival of the patrol.", "Medium-term: Contribute to the complete destruction of the alien vessel and its crew.", "Ultimate: Strengthen Dalek control over Kembel by eliminating all non-Dalek presences."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Dalek Supreme stands imposingly in the main control room, his jet-black casing contrasting starkly with the surrounding gunmetal blue-grey and silver Dalek units. With a firm, mechanical posture, he listens to incoming reports and then unleashes his voice with cold, precise authority.',
        ap.emotional_state = 'He is unflinchingly resolute, exuding a cold and ruthless determination. His tone conveys an austere sense of imperious control and a merciless commitment to extermination.',
        ap.emotional_tags = ["He is unflinchingly resolute, exuding a cold", "ruthless determination. His tone conveys an austere sense of imperious control", "a merciless commitment to extermination."],
        ap.active_plans = ["Receive and scrutinize space monitoring and security reports from subordinate Daleks.", "Issue decisive commands to destroy the alien spacecraft and all its occupants.", "Direct overall security measures and coordinate subsequent operations as part of the Dalek master plan."],
        ap.beliefs = ["He believes in the total supremacy of the Dalek ideology and that extermination is the only acceptable solution to alien threats.", "He is convinced that any sign of alien presence must be eradicated without compromise.", "He holds that ruthless finality serves as a demonstration of Dalek superiority and an indispensable tool for universal domination."],
        ap.goals = ["Short-term: To order the immediate destruction of the identified alien space craft and its occupants.", "Medium-term: To maintain unyielding control over the operational data through the control room and ensure all security protocols are executed.", "Ultimate: To enforce the Dalek master plan by eliminating all alien threats and exhibit uncompromising dominance over the universe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 methodically confirms sensor readings and reasserts the Supreme\'s command, stating curtly that the targeted alien spacecraft and its occupants are to be destroyed without delay.',
        ap.emotional_state = 'Its demeanor is utterly devoid of empathy, exhibiting cold, calculated precision and unwavering loyalty to the Dalek directive.',
        ap.emotional_tags = ["Its demeanor is utterly devoid of empathy, exhibiting cold, calculated precision", "unwavering loyalty to the Dalek directive."],
        ap.active_plans = ["Execute the destruction order on the alien spacecraft immediately.", "Support the coordinated extermination efforts of the Dalek patrol.", "Ensure that no delay or deviation undermines the Supreme\u2019s directive."],
        ap.beliefs = ["The Dalek directive is absolute and must be followed without question.", "Extermination of alien threats is essential for achieving Dalek supremacy.", "Cold precision in executing orders is the only acceptable method."],
        ap.goals = ["Short-term: Verify and confirm enemy target data and initiate immediate destruction.", "Medium-term: Contribute to the sustained enforcement of Dalek extermination policy.", "Ultimate: Secure universal dominance through relentless and unyielding elimination of alien life."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rescue_beacon_event_5_2'})
    ON CREATE SET
        oi.description = 'The rescue beacon is the essential distress signaling device in this event, equipped with an integrated recording mechanism and capsule launcher. It serves a critical role as the container for the urgent message; Lowery is meticulously repairing and attaching its recording capsule to ensure that it can transmit their distress signal into space.',
        oi.status_before = 'Prior to the event, the rescue beacon appears damaged and disassembled from the crash, with the recording capsule not securely attached and its mechanism in an uncertain state.',
        oi.status_after = 'After Lowery completes the repair and attachment, the rescue beacon is restored to a fully functional state, with its recording capsule properly secured and ready to record and transmit the distress message.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rescue_beacon'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery stands outside the rocket ship in the clearing, intently working on the rescue beacon’s recording mechanism. He is carefully using pliers to attach the parts and ensures that every connection is secure, while periodically scanning the surroundings for any sign of movement.',
        ap.emotional_state = 'He displays a mix of anxious determination and focused urgency, aware of the threatening environment and the need to complete his work before time runs out.',
        ap.emotional_tags = ["He displays a mix of anxious determination", "focused urgency, aware of the threatening environment", "the need to complete his work before time runs out."],
        ap.active_plans = ["Complete the attachment of the beacon\u2019s recording mechanism quickly.", "Activate the rescue beacon so that their distress message is properly recorded and transmitted.", "Remain vigilant for the advancing Vargas and any further signs of danger."],
        ap.beliefs = ["He believes that the slow-moving Vargas are not natural but are linked to the Daleks, indicating an imminent threat.", "He trusts his technical skills and the repair work he is performing to ensure the beacon functions as required."],
        ap.goals = ["Short-term: Finish and activate the recording mechanism of the rescue beacon.", "Medium-term: Successfully transmit the warning message so that rescue can arrive.", "Ultimate: Ensure that Space Security is alerted to the Dalek threat and secure their extraction from the hostile environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is seen circling the rocket ship, methodically inspecting its exterior and observing the environment. He notes the presence of Vargas slowly dragging themselves with what he describes as roots, all while keeping a businesslike, composed demeanor.',
        ap.emotional_state = 'He remains unflustered and pragmatic, maintaining a cool and assertive tone as he confirms the threat and pushes his colleague to expedite the beacon’s assembly.',
        ap.emotional_tags = ["He remains unflustered", "pragmatic, maintaining a cool", "assertive tone as he confirms the threat", "pushes his colleague to expedite the beacon\u2019s assembly."],
        ap.active_plans = ["Monitor the movement and proximity of the Vargas.", "Urge Lowery to quickly attach the recording mechanism to ensure the beacon is operational.", "Confirm for everyone that the Vargas are synthetic\u2014manufactured in Dalek laboratories\u2014and thus a portent of the Dalek threat."],
        ap.beliefs = ["He firmly believes that these Vargas are not natural but are deliberately developed by the Daleks for protection.", "He is convinced that the presence and behavior of the Vargas signal an ongoing Dalek operation in the area."],
        ap.goals = ["Short-term: Verify the presence and behavior of the Vargas as indicators of the Dalek threat.", "Medium-term: Ensure that the rescue beacon is fully functional to record and transmit their warning message.", "Ultimate: Secure the evidence of the Dalek threat and facilitate their rescue while preparing for the inevitable confrontation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery stands outside the rocket ship in a small clearing, intently focused on attaching the recording capsule to the rescue beacon. With a pair of pliers in hand, he carefully aligns and secures the capsule, checking for any damage incurred in the crash and working methodically despite the pressure of looming threats.',
        ap.emotional_state = 'Lowery exhibits a tense blend of professional determination and underlying anxiety. Although his posture remains controlled and his actions precise, he feels the weight of the urgency and danger of their situation. Internally, he is anxious about every minute that passes yet resolute in his duty to make sure the recording mechanism functions perfectly to signal for rescue.',
        ap.emotional_tags = ["Lowery exhibits a tense blend of professional determination", "underlying anxiety. Although his posture remains controlled", "his actions precise, he feels the weight of the urgency", "danger of their situation. Internally, he is anxious about every minute that passes yet resolute in his duty to make sure the recording mechanism functions perfectly to signal for rescue."],
        ap.active_plans = ["Securely attach the recording capsule to the rescue beacon using the pliers.", "Verify that the recording mechanism is undamaged and fully operational.", "Complete the repair swiftly to ensure the distress message is transmitted before enemy forces arrive."],
        ap.beliefs = ["Every second counts in their desperate situation.", "The proper functioning of the rescue beacon is essential for saving lives.", "Technical precision now will ensure that the distress signal reaches command for a rescue."],
        ap.goals = ["Short-term: Repair and attach the recording capsule to the rescue beacon.", "Medium-term: Prepare the beacon so that the distress message is accurately recorded and transmitted.", "Ultimate: Secure their rescue by ensuring that command is alerted to the Dalek threat on Kembel."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is methodically circulating the exterior of the rocket ship, assessing its condition and ensuring that the rescue beacon is properly set up. With a businesslike efficiency, he engages in a terse dialogue with Lowery, emphasizing the importance of a correctly attached recording capsule and checking that every component is in place.',
        ap.emotional_state = 'Cory remains outwardly calm and authoritative, displaying measured impatience with any delays or excessive questioning. While he exudes a cool, confident demeanor, internally he is sharply focused on the critical need to capture and transmit their warning. His determination and vigilance underscore a sense of duty and urgency in the face of impending danger.',
        ap.emotional_tags = ["Cory remains outwardly calm", "authoritative, displaying measured impatience with any delays or excessive questioning. While he exudes a cool, confident demeanor, internally he is sharply focused on the critical need to capture", "transmit their warning. His determination", "vigilance underscore a sense of duty", "urgency in the face of impending danger."],
        ap.active_plans = ["Direct Lowery to complete the attachment of the recording capsule without delay.", "Oversee the functionality of the rescue beacon to ensure the distress message can be sent.", "Monitor the surrounding enemy activity to time their actions effectively."],
        ap.beliefs = ["Every moment lost could jeopardize their rescue.", "The integrity of the recording mechanism is critical to alerting command.", "A methodical and efficient approach will overcome the hostile conditions."],
        ap.goals = ["Short-term: Supervise and ensure the recording capsule is correctly attached to the rescue beacon.", "Medium-term: Guarantee that the distress message is recorded and ready to be transmitted.", "Ultimate: Secure a timely rescue by alerting higher command about the serious Dalek threat on Kembel."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is actively positioned outside the rocket ship, methodically preparing the rescue beacon; he is carefully assembling the small metal framework and recording capsule using pliers while periodically looking upward toward the swaying Vargas in the clearing.',
        ap.emotional_state = 'Lowery appears both focused and cautious, displaying a measured concern as he balances urgency with a questioning skepticism. Although his technical actions are precise, he expresses mild anxiety over the situation and the interpretation of the Vargas’ presence.',
        ap.emotional_tags = ["Lowery appears both focused", "cautious, displaying a measured concern as he balances urgency with a questioning skepticism. Although his technical actions are precise, he expresses mild anxiety over the situation", "the interpretation of the Vargas\u2019 presence."],
        ap.active_plans = ["Complete the attachment of the recording mechanism to the rescue beacon.", "Verify that the crash did not damage the recording part of the beacon.", "Prepare the beacon for immediate transmission of the distress message."],
        ap.beliefs = ["He believes that proper technical work is critical to ensuring rescue.", "He is skeptical that the mere presence of Vargas proves a Dalek threat.", "He trusts the rescue beacon system to eventually alert their rescuers."],
        ap.goals = ["Short-term: Finalize the beacon assembly with the recording capsule.", "Medium-term: Confirm the integrity of the beacon and be ready to transmit a rescue message.", "Ultimate: Ensure that the urgent warning reaches Earth about the Dalek threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is moving around the rocket ship with composed efficiency, making a circuit as he observes the rescue beacon process. He interjects assertively into the discussion, insisting that the Vargas are synthetic creations and affirming the imminent danger posed by the Daleks.',
        ap.emotional_state = 'Cory maintains a calm, no-nonsense demeanor marked by determination and resolute focus. Although he speaks with urgency about the threat, his tone remains businesslike and commanding, revealing little personal distress.',
        ap.emotional_tags = ["Cory maintains a calm, no-nonsense demeanor marked by determination", "resolute focus. Although he speaks with urgency about the threat, his tone remains businesslike", "comm", "ing, revealing little personal distress."],
        ap.active_plans = ["Ensure that the recording mechanism on the rescue beacon is properly attached.", "Monitor and confirm the presence of engineered Vargas as evidence of Dalek activity.", "Expedite the process so the rescue message can be transmitted without delay."],
        ap.beliefs = ["He firmly believes that the Vargas are not a natural occurrence but are cultivated in Dalek laboratories for synthetic protection.", "He is convinced that the Daleks are near and that their presence will soon be evident.", "He values decisive action under crisis and trusts in the survival benefits of immediate warning transmission."],
        ap.goals = ["Short-term: Urge Lowery to quickly complete the beacon assembly.", "Medium-term: Secure undeniable evidence that links the Vargas to Dalek engineering.", "Ultimate: Transmit an urgent distress signal to ensure rescue and expose the Dalek threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Dalek 1 stands alert amid the dense jungle foliage, its sensor acceptors busy processing incoming data that confirm the presence of an alien spacecraft. It monitors the surroundings carefully while positioning itself as the tactical lead for the patrol.',
        ap.emotional_state = 'The Dalek exhibits its characteristic cold, unyielding detachment combined with steely determination. Its demeanor is one of ruthless efficiency, underpinned by a singular focus on the mission without any trace of empathy or hesitation.',
        ap.emotional_tags = ["The Dalek exhibits its characteristic cold, unyielding detachment combined with steely determination. Its demeanor is one of ruthless efficiency, underpinned by a singular focus on the mission without any trace of empathy or hesitation."],
        ap.active_plans = ["Issue precise orders for the patrol to converge on the alien spacecraft from two distinct directions.", "Coordinate the fanning out of the patrol to set up a coordinated ambush within the jungle.", "Maintain continuous sensor tracking to monitor the target's position and movement."],
        ap.beliefs = ["Alien intruders are a threat that must be exterminated without mercy.", "Strict obedience to Dalek orders is the cornerstone of tactical superiority.", "Every action taken must further the Dalek objective of universal conquest."],
        ap.goals = ["Short-term: Engage and ambush the alien spacecraft effectively.", "Medium-term: Disrupt and neutralize the enemy presence in the jungle.", "Ultimate: Advance the Dalek agenda of domination by eliminating alien resistance."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rescue_beacon_event_7_1'})
    ON CREATE SET
        oi.description = 'The rescue beacon is central to the discussion during this event, serving as the device by which a distress message is recorded and transmitted into orbit. It is explained as a compact distress signaling apparatus that integrates a tape recorder with a capsule launcher. The beacon’s intended function is to broadcast an SOS message on a special frequency monitored by listening posts throughout the galaxy, thereby alerting the rescuers about the dire circumstances and the overarching threat.',
        oi.status_before = 'Prior to the event, the rescue beacon is in its standard operational state—ready for use, intact, and awaiting activation as a critical piece of standard safety equipment onboard the rocket ship.',
        oi.status_after = 'Following the event, the rescue beacon remains operational and central to the agents’ survival plan, its function clearly articulated in the discussion as the means to call for help despite the immediate threat from the Vargas and the underlying danger posed by the Daleks.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rescue_beacon'})
    MATCH (e:Event {uuid: 'event_7_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is actively engaged outside the rocket ship, moving purposefully to prepare the rescue beacon system. He is checking the device’s components, readying the rocket launcher, and even remarking that he will try to shoot at the approaching Vargas. His stance is upright and alert; he is standing close to the beacon and physically manipulating its controls to ensure that it will record and transmit the SOS message as designed.',
        ap.emotional_state = 'He remains determined and practically focused, yet there is a mix of anxious resolve and a hint of acceptance as he comments somewhat wryly about his own efforts. While his tone conveys confidence in his technical ability, he is also visibly perturbed by the dangerous proximity of the Vargas.',
        ap.emotional_tags = ["He remains determined", "practically focused, yet there is a mix of anxious resolve", "a hint of acceptance as he comments somewhat wryly about his own efforts. While his tone conveys confidence in his technical ability, he is also visibly perturbed by the dangerous proximity of the Vargas."],
        ap.active_plans = ["Operate and ensure the rescue beacon is activated by recording an SOS message and launching the signal capsule into orbit.", "Engage and try to neutralize the charging Vargas by shooting at them, even if only temporarily.", "Maintain a secure position near the beacon until help arrives, thus buying time for rescue via the standard safety equipment."],
        ap.beliefs = ["He believes that the rescue beacon, being standard safety equipment on all rocket ships, will reliably transmit a distress signal to listening posts across the galaxy.", "He is convinced that although the Vargas may regrow repeatedly, persistent efforts to shoot at them are necessary to temporarily hold the immediate threat at bay.", "He trusts that survival until pickup depends on the proper functioning of the beacon and that his technical skills can keep the situation under control."],
        ap.goals = ["Short-term: Immediately secure and operate the rescue beacon while defending against the Vargas.", "Medium-term: Ensure the SOS message is successfully transmitted into orbit so that their own people are alerted.", "Ultimate: Sustain their lives long enough to be rescued, all while keeping in mind the greater, looming threat from the Daleks."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is calmly overseeing the operation from alongside Lowery. He questions details about the beacon’s functionality—asking if it’s going to work and confirming its operational steps—while ensuring that the urgent distress message is correctly recorded. He maintains a businesslike tone, standing close to the beacon and engaging in measured dialogue with his colleague, even as they discuss the practical aspects of the rescue beacon system.',
        ap.emotional_state = 'He displays a cool, composed, and pragmatic demeanor despite the dangerous environment. His calm and efficient manner under crisis contrasts with the chaos around him, and although he acknowledges the risk posed by the larger Dalek threat, his immediate focus is on the reliable execution of the beacon\'s operation.',
        ap.emotional_tags = ["He displays a cool, composed,", "pragmatic demeanor despite the dangerous environment. His calm", "efficient manner under crisis contrasts with the chaos around him,", "although he acknowledges the risk posed by the larger Dalek threat, his immediate focus is on the reliable execution of the beacon's operation."],
        ap.active_plans = ["Confirm and coordinate the proper operation of the rescue beacon to record and transmit the SOS message.", "Monitor the situation to ensure that they remain alive long enough for rescue, despite the relentless growth of the Vargas.", "Keep the focus on survival and on the critical need to be picked up, thereby indirectly addressing the larger threat by sending the distress signal."],
        ap.beliefs = ["He believes that their immediate survival is critically dependent on the rescue beacon working as intended.", "He is convinced that the beacon\u2019s special frequency and wide network of listening posts will ensure that their SOS message reaches their people.", "He holds that staying alive until rescue is paramount, and that the proper functioning of safety equipment is their best chance against both the immediate Vargas threat and the hint of a greater danger from the Daleks."],
        ap.goals = ["Short-term: Double-check the beacon's functionality and contribute to its activation so that the distress message is reliably transmitted.", "Medium-term: Stabilize their situation by ensuring that the beacon enables a rescue pickup amid overwhelming external challenges.", "Ultimate: Enable a timely rescue that not only saves their lives but also warns their command about the potential involvement of the Daleks."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is busy at the rescue beacon launcher outside the rocket ship. He is examining the equipment, making adjustments and preparing to record an SOS message while keeping a wary eye on the approaching threat. As he works, his posture reflects a technical focus and alertness; he physically moves around the launcher, handling controls and double-checking the set-up.',
        ap.emotional_state = 'He feels a mix of cautious concern and awe as he marvels at the enormous, unfamiliar craft overhead. Despite his focus on resolving the beacon issue, his underlying anxiety about the potential involvement of Daleks is evident in his tense manner and the worried tone in his voice.',
        ap.emotional_tags = ["He feels a mix of cautious concern", "awe as he marvels at the enormous, unfamiliar craft overhead. Despite his focus on resolving the beacon issue, his underlying anxiety about the potential involvement of Daleks is evident in his tense manner", "the worried tone in his voice."],
        ap.active_plans = ["Complete the preparation of the rescue beacon launcher.", "Ensure that the distress message is recorded and transmitted via the beacon.", "Maintain relative safety by focusing on the equipment while contending with the growing presence of unknown threats."],
        ap.beliefs = ["He believes that standard safety equipment like the rescue beacon is reliable for contacting Space Security over a special frequency.", "He is convinced that the beacon will broadcast the SOS message to listening posts throughout the galaxy.", "He trusts that by keeping the beacon operational until pickup, their people will receive crucial information about a larger threat."],
        ap.goals = ["Short-term: Successfully get the beacon launcher ready and record the distress message.", "Medium-term: Remain alive until rescue arrives by consistently fixing and monitoring the beacon equipment.", "Long-term: Ensure that the transmitted message warns their organization about the possibility of Dalek involvement, thereby protecting the galaxy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Marc Cory stands near the beacon launcher, interacting with Lowery as they work outside the rocket ship. He is methodically questioning the functionality of the equipment and confirming plans for message transmission. His stance is businesslike and composed as he discusses what the equipment does and the necessity of being picked up, while occasionally glancing upward at the mysterious huge craft overhead.',
        ap.emotional_state = 'He maintains a calm but ominous demeanor, underpinned by a subtle tension. Although his tone is measured and controlled, his words betray a dark foreboding and a deep concern that if the Daleks are involved, the fate of the entire galaxy is at stake.',
        ap.emotional_tags = ["He maintains a calm but ominous demeanor, underpinned by a subtle tension. Although his tone is measured", "controlled, his words betray a dark foreboding", "a deep concern that if the Daleks are involved, the fate of the entire galaxy is at stake."],
        ap.active_plans = ["Confirm that Lowery completes the setup of the rescue beacon launcher.", "Ensure the critical SOS message is properly recorded and launched into orbit.", "Assess and communicate the implications of the strange craft overhead in order to prepare for a larger threat."],
        ap.beliefs = ["He is convinced that the rescue beacon will effectively reach their organization thanks to its specialized frequency and widespread listening posts.", "He believes that the presence of an outer-galaxy rocket ship is a clear and ominous signal of larger forces at work.", "He holds that if the Daleks are involved, not only their lives but the fate of the entire galaxy is imperiled."],
        ap.goals = ["Short-term: Direct Lowery to complete the beacon preparations and stay safe until the message is transmitted.", "Medium-term: Secure their survival long enough to get rescued and relay vital intelligence.", "Long-term: Ensure that the warning is received by their people, thereby preventing a galactic-scale disaster if the Daleks are afoot."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rocket_ship_event_8_1'})
    ON CREATE SET
        oi.description = 'The rocket ship is a rugged, damaged interplanetary vessel struggling against harsh jungle conditions on Kembel. Its arrival, announced by Dalek 1 as coming from the planet Gearon, serves as an ominous herald that links the intruding vessel to a larger and potentially dangerous alliance. This object becomes a critical narrative device, signifying the shifting balance of power and the impending intervention of organized forces.',
        oi.status_before = 'The rocket ship is shown as a battle-worn structure, visibly marred by the hostile environment of the jungle, indicating prior exposure to intense conditions and possible conflict.',
        oi.status_after = 'After being observed and identified by the Dalek patrol, the rocket ship remains stationed in the clearing, its presence underscoring the significance of extraneous alliances and setting the stage for imminent Dalek counter-actions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rocket_ship'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rocket_ship_event_8_2'})
    ON CREATE SET
        oi.description = 'The rocket ship, a rugged and visibly damaged interplanetary vessel stranded in a jungle clearing, becomes the focal point of the Dalek assault. Its arrival has alerted the Dalek patrols, and its precarious state symbolizes desperate survival amid shifting alliances. As the Daleks announce the commencement of the Great Alliance, they steadily close in on the ship, preparing to intercept and eliminate its inhabitants.',
        oi.status_before = 'Before the event, the rocket ship is intact yet worn and damaged by the harsh conditions of Kembel, resting vulnerably in a jungle clearing.',
        oi.status_after = 'Following the event, the rocket ship remains stationary in the clearing but is now under immediate threat, its exposed condition underscored by the relentless and coordinated advancement of the Daleks.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rocket_ship'})
    MATCH (e:Event {uuid: 'event_8_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Dalek 1 is standing alert in the jungle clearing and actively scanning the surroundings with its sensors. With cold precision, it announces, \'The ship from the planet Gearon,\' signaling that it has detected an incoming rocket ship and drawing the attention of its patrol.',
        ap.emotional_state = 'The agent exhibits a controlled and ruthless detachment combined with methodical alertness. Its tone is devoid of emotion but imbued with a steely determination, reflecting an unwavering loyalty to the Dalek mission of extermination and conquest.',
        ap.emotional_tags = ["The agent exhibits a controlled", "ruthless detachment combined with methodical alertness. Its tone is devoid of emotion but imbued with a steely determination, reflecting an unwavering loyalty to the Dalek mission of extermination", "conquest."],
        ap.active_plans = ["Alert the rest of the patrol to the presence of an external vessel from Gearon.", "Coordinate the closing in of Dalek forces on the detected rocket ship.", "Prepare to engage and either seize or neutralize the intruding craft as part of a larger strategic alliance."],
        ap.beliefs = ["The Dalek cause is paramount, and any foreign presence must be treated as a potential threat or tactical asset.", "Precision, obedience, and relentless aggression are the proper means to secure victory.", "All opposition must be exterminated to ensure the domination of the Daleks."],
        ap.goals = ["Short-term: To confirm the identity and trajectory of the approaching rocket ship.", "Medium-term: To mobilize the patrol and position the forces to intercept the vessel effectively.", "Long-term: To leverage the arrival as a stepping stone for consolidating alliances and advancing Dalek supremacy in the region."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 stands alert amid its patrol, its sensor readings confirming the arrival of the spaceship from Gearon. It articulates the foreboding proclamation, \'And the beginning of the Great Alliance,\' while positioning itself to direct the coordinated advance toward the rocket ship.',
        ap.emotional_state = 'It exhibits a cold, unyielding, and calculating demeanor, entirely devoid of empathy or hesitation—its tone is clipped and unsympathetic, reflecting a singular devotion to destruction and conquest.',
        ap.emotional_tags = ["It exhibits a cold, unyielding,", "calculating demeanor, entirely devoid of empathy or hesitation\u2014its tone is clipped", "unsympathetic, reflecting a singular devotion to destruction", "conquest."],
        ap.active_plans = ["Command its fellow Daleks to resume the advance toward the rocket ship.", "Exterminate any detected crew or intruders aboard the vessel without allowance for interrogation.", "Signal the inception of the Great Alliance as a prelude to broader intergalactic domination."],
        ap.beliefs = ["Extermination of alien life is the only logical course to secure Dalek supremacy.", "The alliance with other power brokers is a means to achieve universal conquest.", "The Dalek race is inherently superior and destined to impose its will on the universe."],
        ap.goals = ["Short-term: Ensure the rocket ship and its occupants are swiftly intercepted and neutralized.", "Medium-term: Trigger the initiation of the 'Great Alliance' to consolidate Dalek force and extend their control over intercepted territories.", "Ultimate: Establish irresistible Dalek dominance over the galaxy through coordinated extermination and subjugation."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rescue_beacon_event_9_1'})
    ON CREATE SET
        oi.description = 'The rescue beacon, a compact distress signaling device equipped with a capsule launcher and recording mechanism, plays a crucial narrative role in this event. Gordon Lowery assembles the beacon to record an urgent message about the Dalek threat, intending to launch the capsule as a warning. Its activation and use are central to the unfolding crisis, as the agents plan a hasty escape while still considering transmitting the distress signal.',
        oi.status_before = 'Prior to the event, the rescue beacon is in an inactive or disassembled state, awaiting assembly for its critical mission.',
        oi.status_after = 'After being assembled and activated for the distress message, the rescue beacon remains intact and operational despite the chaos, though its deployment is soon disrupted by the Dalek assault.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rescue_beacon'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery completes assembling the launcher for the rescue beacon and prepares to record a distress message. As he requests the capsule to record his message, his attention is drawn by a sudden noise. He then witnesses the rapid destruction of his ship by the Daleks, becomes horrified, and is forced to follow his colleague deeper into the jungle while enduring a painful reaction from a Varga thorn embedded in his hand.',
        ap.emotional_state = 'He is visibly distressed and panicked, experiencing both physical agony from the toxic Varga sting and emotional turmoil at the loss of his ship, yet his resolve to complete his duty remains unshaken.',
        ap.emotional_tags = ["He is visibly distressed", "panicked, experiencing both physical agony from the toxic Varga sting", "emotional turmoil at the loss of his ship, yet his resolve to complete his duty remains unshaken."],
        ap.active_plans = ["Assemble and activate the rescue beacon to record and transmit the distress message.", "Escape immediately from the Dalek threat by following Marc Cory into the jungle.", "Ensure that the vital warning is carried with him despite his deteriorating condition."],
        ap.beliefs = ["The Daleks pose an imminent and lethal threat that must be urgently communicated.", "Fulfilling his mission, even at great personal risk, is paramount.", "Every second counts during crises, so rapid action is essential."],
        ap.goals = ["Short-term: Successfully record and prepare to launch the distress signal using the rescue beacon.", "Medium-term: Evade the pursuing Daleks after the ship\u2019s destruction.", "Ultimate: Ensure that the warning about the Dalek invasion reaches Earth to potentially save countless lives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory remains remarkably calm and businesslike amid the chaos. He softly admonishes Lowery to \'shush\' as Lowery prepares to record the distress message and then alerts him when he sees unusual movement outside. Cory swiftly decides that their priority is to move quickly, instructing Lowery to get down and remain silent as Dalek forces begin to appear.',
        ap.emotional_state = 'Cory exhibits a measured, controlled composure even as the situation escalates with the sudden appearance of Daleks. His focus on the mission and his unflappable demeanor contrast with the panic around him.',
        ap.emotional_tags = ["Cory exhibits a measured, controlled composure even as the situation escalates with the sudden appearance of Daleks. His focus on the mission", "his unflappable demeanor contrast with the panic around him."],
        ap.active_plans = ["Ensure that the distress message is recorded and that the rescue beacon capsule is secured.", "Direct immediate retreat from the danger when movement is detected outside.", "Keep the operation on track by prioritizing escape over investigation of the threat."],
        ap.beliefs = ["The Dalek threat is genuine and demands swift, decisive action.", "Maintaining operational security and discipline is essential, even in crisis.", "Evidence of the enemy's actions must be captured for the sake of warning Earth."],
        ap.goals = ["Short-term: Promptly guide the team to fall back and avoid detection by the Daleks.", "Medium-term: Secure the distress signal by launching the beacon as soon as possible.", "Ultimate: Transmit a critical warning to Earth to alert them of the impending Dalek invasion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Dalek 1 is at the forefront of the ambush, its sensors active and its tone cold as it issues precise and unwavering orders to search for any remaining crew members and to destroy the abandoned rocket ship.',
        ap.emotional_state = 'Emotionally unruffled and ruthlessly focused; it exhibits a chilling sense of detachment and single-minded resolve in executing extermination orders.',
        ap.emotional_tags = ["Emotionally unruffled", "ruthlessly focused; it exhibits a chilling sense of detachment", "single-minded resolve in executing extermination orders."],
        ap.active_plans = ["Order the search for the crew and confirm that the ship is empty.", "Command immediate destruction of the vessel to eliminate any trace of enemy presence.", "Relay the results to Dalek control and coordinate follow\u2010up patrols."],
        ap.beliefs = ["All non-Dalek life must be exterminated without question.", "Strict efficiency and precision are the keys to achieving Dalek supremacy.", "The abandonment of the vessel confirms that resistance is futile."],
        ap.goals = ["Ensure total elimination of the fugitives from the ship.", "Secure an unequivocal report of the ship's destruction to maintain Dalek dominance.", "Maintain operational control to prevent any escape or counteraction."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 functions in support of Dalek 1 by confirming sensor readings and promptly echoing extermination orders, maintaining its watchful presence over the scene.',
        ap.emotional_state = 'Calculating and methodical; it reflects the Dalek race’s cold logical mindset, unaffected by emotion and solely guided by protocol.',
        ap.emotional_tags = ["Calculating", "methodical; it reflects the Dalek race\u2019s cold logical mindset, unaffected by emotion", "solely guided by protocol."],
        ap.active_plans = ["Validate and report sensor data regarding crew abandonment.", "Enforce the command to destroy any alien presence by issuing rapid extermination orders.", "Support coordinated action with Dalek 1 to maintain tactical superiority."],
        ap.beliefs = ["Extermination of alien life is a non-negotiable imperative.", "Operative precision and consistency are paramount.", "No compromise is acceptable when faced with enemy threats."],
        ap.goals = ["Assist in the obliteration of the target ship and its crew.", "Ensure efficient implementation of Dalek commands.", "Maintain unwavering surveillance until complete system control is restored."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is visibly stricken as he witnesses the rocket ship being ruthlessly destroyed by the Daleks, while physically grappling with a poisonous Varga thorn embedded in his hand—he reacts in horror and desperation as he hastily tears the thorn out and frantically sucks at his wound.',
        ap.emotional_state = 'Overwhelmed and panicked; he experiences acute physical agony coupled with terror as the situation spirals out of control, yet his resolve to survive remains evident.',
        ap.emotional_tags = ["Overwhelmed", "panicked; he experiences acute physical agony coupled with terror as the situation spirals out of control, yet his resolve to survive remains evident."],
        ap.active_plans = ["Follow Marc Cory\u2019s immediate directive to escape into the jungle.", "Attempt to stabilize his physical condition despite the venomous injury.", "Carry the capsule launcher with the distress signal in a desperate bid to warn of the Dalek threat."],
        ap.beliefs = ["Adherence to mission orders is crucial for survival, even in the face of personal harm.", "Every moment counts in evading Dalek detection and ensuring that vital intelligence is preserved.", "Immediate self-preservation must contribute to the overall objective of warning Earth."],
        ap.goals = ["Escape the ambush with the rescue beacon capsule intact.", "Transmit the critical distress signal despite his physical deterioration.", "Avoid further transformation from the Varga poison while staying with his team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Marc Cory maintains a composed and businesslike presence amidst the chaos, sharply instructing Gordon Lowery to stay quiet as he detects movement and promptly shifts focus to ensuring that their escape through the jungle is executed without delay.',
        ap.emotional_state = 'Calm, methodical, and unflappable; he remains remarkably composed under pressure, exhibiting a seasoned detachment despite the surrounding terror.',
        ap.emotional_tags = ["Calm, methodical,", "unflappable; he remains remarkably composed under pressure, exhibiting a seasoned detachment despite the surrounding terror."],
        ap.active_plans = ["Instruct Lowery to remain silent and immediately direct the team to retreat into the jungle.", "Ensure that critical intelligence (the distress message) is recorded before chaos escalates.", "Prioritize mission-critical actions over emotional responses in the midst of the Dalek onslaught."],
        ap.beliefs = ["Calm execution of orders is the key to survival in a crisis.", "Maintaining operational security and discipline is paramount.", "Valuable evidence of Dalek aggression must be preserved at all costs."],
        ap.goals = ["Secure the urgent distress signal for transmission.", "Ensure that the team escapes the ambush despite the rapid destruction of their vessel.", "Preserve vital intelligence regarding the Dalek incursion to warn Earth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is nervously following Marc Cory deeper into the jungle while carrying the capsule launcher. As he pushes through a dense clump of bushes, he suddenly recoils in alarm when he feels a sharp sting in his hand, indicating that a Varga thorn has penetrated his palm. In response, he frantically tears the thorn out and desperately attempts to suck out the poison, even as he struggles to maintain pace.',
        ap.emotional_state = 'Lowery displays intense alarm, physical agony, and a desperate determination. Despite the searing pain and terror of the toxic exposure, his focus on the mission and the imminent threat from the Daleks keeps his resolve intact.',
        ap.emotional_tags = ["Lowery displays intense alarm, physical agony,", "a desperate determination. Despite the searing pain", "terror of the toxic exposure, his focus on the mission", "the imminent threat from the Daleks keeps his resolve intact."],
        ap.active_plans = ["Follow Marc Cory deeper into the jungle to avoid further Dalek detection.", "Secure the capsule launcher and ensure the distress message is recorded.", "Push forward despite his injury to maintain operational momentum."],
        ap.beliefs = ["Believes that immediate movement is critical to evade the Daleks and fulfill mission objectives.", "Believes that personal sacrifice, including enduring severe pain, is justified for the overall security of the mission.", "Is convinced that adhering to Space Security protocols in crisis is essential for survival."],
        ap.goals = ["Short-term: Stop the bleeding and mitigate the effects of the Varga poison.", "Medium-term: Keep up with Marc Cory to retrieve and transmit the vital distress signal.", "Ultimate: Ensure the successful escape and message transmission to warn Earth of the Dalek threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Marc Cory remains businesslike and focused amidst the chaos. He instructs Lowery to remain silent and emphasizes the need to record the urgent distress message. Cory quickly alerts the team when he notices movement, demonstrating command and efficiency in directing the group as they head deeper into the jungle while evading the Dalek threat.',
        ap.emotional_state = 'Marc Cory exhibits calm determination and controlled urgency, maintaining his composure and prioritizing mission-critical communication despite the surrounding danger.',
        ap.emotional_tags = ["Marc Cory exhibits calm determination", "controlled urgency, maintaining his composure", "prioritizing mission-critical communication despite the surrounding danger."],
        ap.active_plans = ["Order silence and direct Lowery to record the distress signal.", "Instruct the team to move quickly and take cover upon detecting enemy movement.", "Continuously monitor for signs of Dalek presence while guiding the team deeper into the jungle."],
        ap.beliefs = ["Believes that strict operational discipline, including silence and prompt action, is crucial for survival.", "Believes that mission priorities outweigh individual distress.", "Is convinced that following established Space Security protocols will ultimately lead to a successful outcome."],
        ap.goals = ["Short-term: Ensure that the distress message is recorded accurately despite the surrounding chaos.", "Medium-term: Keep the team coordinated and secure while navigating the jungle under Dalek threat.", "Ultimate: Transmit the vital warning to Earth to avert the impending Dalek invasion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Dalek 1 stands as the lead operative in the clearing, issuing cold, precise orders about the status of the destroyed alien ship and commanding the search and extermination of the fugitives.',
        ap.emotional_state = 'Calm, calculated, and ruthlessly determined with no trace of remorse, embodying the Dalek conviction of supremacy.',
        ap.emotional_tags = ["Calm, calculated,", "ruthlessly determined with no trace of remorse, embodying the Dalek conviction of supremacy."],
        ap.active_plans = ["Order a report on the destruction of the alien ship.", "Command the search for the fleeing crew.", "Alert all patrols for immediate extermination of the fugitives."],
        ap.beliefs = ["The Daleks are the ultimate force and must eradicate all non-Dalek life.", "Obedience to cold, logical orders is paramount.", "Any remaining alien resistance must be eliminated without hesitation."],
        ap.goals = ["Secure the area by confirming the alien ship\u2019s destruction and locating the fugitives (short-term).", "Ensure that Dalek dominance is maintained through relentless pursuit (medium-term).", "Demonstrate overwhelming power and support the larger objective of universal conquest (ultimate objective)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 operates in support mode by confirming sensor readings and enforcing orders, stating that the alien ship is empty and dispensing a clipped reply to further commands, contributing to the coordination of the search and extermination effort.',
        ap.emotional_state = 'Detached, precise, and unsympathetic, reflecting a mindset wholly focused on the execution of destructive orders.',
        ap.emotional_tags = ["Detached, precise,", "unsympathetic, reflecting a mindset wholly focused on the execution of destructive orders."],
        ap.active_plans = ["Confirm that the alien ship is empty and that the crew have fled.", "Obey the lead Dalek's commands to search for and destroy the remaining fugitives.", "Relay orders such as alerting all patrols to maintain cohesive Dalek operational control."],
        ap.beliefs = ["Strict adherence to Dalek orders and chain-of-command is non-negotiable.", "The extermination of non-Dalek life is the only logical course of action.", "Precision and unwavering focus on the mission guarantee Dalek supremacy."],
        ap.goals = ["Ensure that every directive from the lead Dalek is executed without error (short-term).", "Aid in the complete extermination of the fugitives from the alien ship (medium-term).", "Reinforce the overall Dalek agenda of eliminating threats and consolidating power in the region (ultimate objective)."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_varga_plants_event_10_3'})
    ON CREATE SET
        oi.description = 'The Varga plants are central to the Daleks’ extermination strategy; they serve as a natural, lethal barrier that will kill any remnant of the intruders. Dalek Supreme explicitly states that if the enemy fails to die from the effect of these plants, the Dalek patrols will ensure their complete extermination.',
        oi.status_before = 'Prior to the event, the Varga plants were in a dormant yet inherently dangerous state, established as a menacing bio-weapon on Kembel.',
        oi.status_after = 'Following the event, the Varga plants remain active and poised as a constant and deadly threat, reinforcing the inevitability of extermination by releasing their toxin against any surviving hostile beings.'
    WITH oi
    MATCH (o:Object {uuid: 'object_varga_plants'})
    MATCH (e:Event {uuid: 'event_10_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Dalek Supreme stands at the head of the vast Dalek conference room with a rigid, imposing posture. His polished, jet‐black armor gleams under harsh lighting as he delivers his authoritative declaration that, with the arrival of Representative Malpha, the assembly is now numerically sufficient and the meeting can commence. He surveys the gathered subordinates with unyielding vigilance, his mechanical voice echoing cold command throughout the hall.',
        ap.emotional_state = 'Outwardly, Dalek Supreme displays a steely, unfeeling exterior characterized by cold detachment and impeccable confidence. Internally, however, his emotions are a blend of ruthless determination and absolute conviction in Dalek superiority, with a simmering disdain for any insurgent influences. He harbors an unyielding resolve to enforce extermination, masking any hint of uncertainty with merciless logic and suppressing even the slightest vestige of empathy, ensuring his every word exudes finality and uncompromising authority.',
        ap.emotional_tags = ["Outwardly, Dalek Supreme displays a steely, unfeeling exterior characterized by cold detachment", "impeccable confidence. Internally, however, his emotions are a blend of ruthless determination", "absolute conviction in Dalek superiority, with a simmering disdain for any insurgent influences. He harbors an unyielding resolve to enforce extermination, masking any hint of uncertainty with merciless logic", "suppressing even the slightest vestige of empathy, ensuring his every word exudes finality", "uncompromising authority."],
        ap.active_plans = ["Order the immediate commencement of the meeting to consolidate Dalek unity.", "Command patrols to hunt down and exterminate any hostile influences from the solar system.", "Utilize the threat of Varga plants and strict military discipline to prevent any communication or escape by Earth's intruders."],
        ap.beliefs = ["He believes that the Daleks are the supreme species destined to dominate the universe.", "He is convinced that any non-Dalek presence, especially from the solar system, represents a direct threat to Dalek order.", "He holds an unyielding conviction that extermination is the only acceptable response to traitorous elements."],
        ap.goals = ["Short-term: To assert his authority by officially commencing the meeting and neutralizing immediate threats.", "Medium-term: To command the extermination of hostile Earth beings and prevent them from sending any messages.", "Ultimate: To secure total Dalek supremacy by eliminating all non-Dalek influences within the universe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Representative Malpha stands formally at his place in the Dalek conference room, his composed yet steely gaze fixed on the proceedings as he sharply objects to the commencement of the meeting.',
        ap.emotional_state = 'He is visibly perturbed and indignant, marked by a dignity underlined with alarm and righteous disapproval; his measured tone conceals an inner resolve to defend the Outer Systems Alliance from any infiltrating hostilities.',
        ap.emotional_tags = ["He is visibly perturbed", "indignant, marked by a dignity underlined with alarm", "righteous disapproval; his measured tone conceals an inner resolve to defend the Outer Systems Alliance from any infiltrating hostilities."],
        ap.active_plans = ["He intends to halt the meeting until the threat of hostile influences from the solar system\u2014specifically from the planet Kembel\u2014is addressed.", "He plans to press for immediate measures that ensure the elimination of any hostile presence within the assembly.", "He aims to force the council to confront and neutralize the threat before proceeding with broader conquests."],
        ap.beliefs = ["He firmly believes that no hostile influence from Earth or the solar system should be allowed to contaminate the purity and security of the Outer Systems Alliance.", "He is convinced that any influence from Kembel or the center of the solar system poses a strategic risk to their universal conquest plans.", "He holds that it is essential for the assembly to act immediately against these intruders in order to maintain their supremacy."],
        ap.goals = ["Short-term: Prevent the meeting from proceeding under compromised conditions by insisting on the elimination of the hostile presence.", "Medium-term: Ensure that all external influences from the solar system are quarantined and neutralized within the Dalek-controlled environment.", "Ultimate: Secure the strategic interests of the Outer Systems Alliance by maintaining control over their unified conquests and preventing any dilution of their power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_3'})
    ON CREATE SET
        ap.current_status = 'In the conference room, Dalek Supreme stands in a commanding position, addressing the assembly with cold precision. He announces that although hostile beings from the center of the Solar System have landed on Kembel and their spaceship has been destroyed, they are completely isolated and will be relentlessly hunted down.',
        ap.emotional_state = 'Dalek Supreme is ruthlessly confident, unemotional, and resolute; his tone exudes merciless assurance and an unyielding belief in Dalek supremacy.',
        ap.emotional_tags = ["Dalek Supreme is ruthlessly confident, unemotional,", "resolute; his tone exudes merciless assurance", "an unyielding belief in Dalek supremacy."],
        ap.active_plans = ["Order Dalek patrols to pursue and exterminate the stranded enemy beings.", "Deploy the lethal capabilities of the Varga plants as a biological weapon against any survivors.", "Ensure that no hostile influence from Earth escapes by enforcing a policy of immediate extermination."],
        ap.beliefs = ["The Daleks are the supreme force destined to dominate all other species.", "Hostile beings from Earth's central system pose an unacceptable threat.", "Varga plants are an effective, natural extermination tool that guarantees total elimination of the enemy."],
        ap.goals = ["Short-term: Contain and destroy the intruders on Kembel through immediate and ruthless action.", "Long-term: Secure Dalek domination by eliminating any potential threat from Earth and reinforcing the inevitability of Dalek extermination."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Representative Malpha sits at the conference table, voicing objections and raising questions about the extermination strategy. He is careful to point out that there might be a hostile influence from Earth among them, and he challenges the certainty of the Dalek Supreme’s assurances.',
        ap.emotional_state = 'Malpha appears cautious, disapproving, and unsettled by the extreme measures proposed; his measured tone reflects concern and an implicit desire for further verification before all-out extermination is executed.',
        ap.emotional_tags = ["Malpha appears cautious, disapproving,", "unsettled by the extreme measures proposed; his measured tone reflects concern", "an implicit desire for further verification before all-out extermination is executed."],
        ap.active_plans = ["Question the Dalek Supreme about the details of the extermination plan.", "Seek reassurance regarding the fate of the intruding beings, especially in light of potential risks such as a warning message from the hostiles.", "Advocate for a more scrutinized, balanced approach rather than mindless destruction."],
        ap.beliefs = ["Hostile influences from the solar system are a serious risk that must be clearly identified.", "Not all beings in the universe should be summarily exterminated without proper confirmation of their intent.", "A cautious, informed strategy is preferable to recklessly wiping out potential adversaries."],
        ap.goals = ["Short-term: Ensure that the threat from Earth's intruders is thoroughly assessed and that their containment measures will effectively neutralize any potential for escape or retaliation.", "Long-term: Influence the Dalek strategy to avoid unnecessary collateral damage while still preserving Dalek supremacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Marc Cory strides forward with purpose in the dark, hostile jungle, issuing his terse command, ‘This way,’ as he leads his colleague through the treacherous undergrowth. His posture is upright and assertive, and his every gesture exudes the calm urgency of a seasoned leader determined to steer his team to safety.',
        ap.emotional_state = 'Cory remains outwardly composed and businesslike despite the chaos around him; internally, he is driven by anxiety and determination as he reckons with the life‐and‐death stakes of their situation. His focus does not waver even in the face of looming peril, underscoring a mix of relief that he remains in control and a persistent worry for the mission and the well‐being of his colleague.',
        ap.emotional_tags = ["Cory remains outwardly composed", "businesslike despite the chaos around him; internally, he is driven by anxiety", "determination as he reckons with the life\u2010", "\u2010death stakes of their situation. His focus does not waver even in the face of looming peril, underscoring a mix of relief that he remains in control", "a persistent worry for the mission", "the well\u2010being of his colleague."],
        ap.active_plans = ["Lead Gordon Lowery away from immediate danger in the hostile jungle.", "Navigate towards a safe haven or refuge that minimizes exposure to lurking threats.", "Ensure that vital evidence or message is secured for transmission as part of their broader mission."],
        ap.beliefs = ["Decisive leadership and clear communication are critical when every second counts.", "The jungle\u2019s perils must be managed with calm determination to maintain the integrity of the mission.", "Trust in his own experience and training is essential to overcome the chaos of the environment."],
        ap.goals = ["Short-term: Quickly guide Lowery through the dangerous jungle to safety.", "Medium-term: Reach a secure location where they can regroup and continue their mission.", "Ultimate: Successfully deliver vital information and evidence to warn Earth of impending threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery follows closely behind Marc Cory, visibly battling the physical strain and emerging effects of the toxic Varga exposure. Though his steps are labored and his expression pained, he clings to the hope of safety as he is guided through the dense, ominous jungle.',
        ap.emotional_state = 'Lowery experiences a mix of desperation and vulnerability as he grapples with the frightening onset of the Varga poison. Outwardly, he shows a combination of stoic determination and the raw discomfort of a man whose body is betraying him, yet he remains committed to the mission despite the internal turmoil and uncertainty about his fate.',
        ap.emotional_tags = ["Lowery experiences a mix of desperation", "vulnerability as he grapples with the frightening onset of the Varga poison. Outwardly, he shows a combination of stoic determination", "the raw discomfort of a man whose body is betraying him, yet he remains committed to the mission despite the internal turmoil", "uncertainty about his fate."],
        ap.active_plans = ["Follow Cory\u2019s directions in the hope of escaping the immediate dangers of the jungle.", "Struggle against the progressing toxic effects while attempting to maintain operational composure.", "Conserve his dwindling physical strength to enable future contributions to the mission."],
        ap.beliefs = ["His survival depends on trusting the experienced leadership of Marc Cory.", "Despite his vulnerability, his duty to his organization compels him to press on.", "Every step in the jungle, though hazardous, brings him closer to a potential rescue or remedy for his condition."],
        ap.goals = ["Short-term: Endure the poisonous assault and stick closely to Cory\u2019s lead in order to find safety.", "Medium-term: Seek immediate refuge and any available means to counteract the Varga poison.", "Ultimate: Contribute to their overarching mission by surviving the jungle ordeal and aiding in the delivery of critical warnings."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_treaty_document_event_12_1'})
    ON CREATE SET
        oi.description = 'The Treaty Document is presented to and scrutinized by the Dalek delegates in the Conference Room, serving as the physical embodiment of the historic alliance. Its meticulously inscribed galaxy charts and symbolic markings formalize the unification of the six outer galactic powers with the Dalek forces, acting as both a decree and a rallying call for universal conquest.',
        oi.status_before = 'The document is in pristine condition, carefully prepared and laid out with precise inscriptions and galaxy charts to represent the alliance.',
        oi.status_after = 'It remains formally accepted and symbolically venerated as the ratified treaty, reinforcing the commitment of the united forces, while its presence marks the beginning of a new era of conquest.'
    WITH oi
    MATCH (o:Object {uuid: 'object_treaty_document'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_1'})
    ON CREATE SET
        ap.current_status = 'The Dalek Supreme stands authoritatively in the Dalek Conference Room, observing and confirming the unanimous assent of the delegates to the treaty. He issues cold and decisive commands, finalizing the alliance by declaring that the united powers are now directed toward universal subjugation.',
        ap.emotional_state = 'He projects an air of ruthless coldness and unyielding confidence, entirely unperturbed by any emotional display; his demeanor is entirely calculated, exuding militant determination coupled with an overriding sense of superiority.',
        ap.emotional_tags = ["He projects an air of ruthless coldness", "unyielding confidence, entirely unperturbed by any emotional display; his demeanor is entirely calculated, exuding militant determination coupled with an overriding sense of superiority."],
        ap.active_plans = ["Confirm the treaty and solidify the alliance with the outer galactic powers.", "Declare the beginning of universal conquest, with Earth as the primary target.", "Instruct his forces to prepare for extermination and subsequent domination."],
        ap.beliefs = ["He believes that the absolute might of the Daleks, in alliance with the six outer galactic powers, ensures inevitable universal domination.", "He is convinced that any opposition, particularly from Earth, must be ruthlessly eliminated.", "He holds that strict, merciless order is the only path to consolidate power and secure victory."],
        ap.goals = ["Short-term: Ensure that all delegates are united under the treaty and formally establish the alliance.", "Medium-term: Initiate the conquest, specifying Earth as the first casualty to cement Dalek supremacy.", "Ultimate: Achieve complete universal domination through the combined war force of the allied powers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Representative Malpha stands at the podium in the conference room with dignified authority, assuming the role of the speaker as he addresses the assembly in a measured and commanding tone.',
        ap.emotional_state = 'Calm, resolute, and proudly confident; he is composed and inspires gravitas while upholding the weighty responsibilities of his alliance and the historic moment at hand.',
        ap.emotional_tags = ["Calm, resolute,", "proudly confident; he is composed", "inspires gravitas while upholding the weighty responsibilities of his alliance", "the historic moment at h", "."],
        ap.active_plans = ["Declare and formalize the alliance between the six outer galaxy powers and the solar system\u2019s might with the Daleks.", "Inspire unity among the delegates and set the foundation for a coordinated universal conquest.", "Project the invincibility of the alliance by emphasizing the targeted subjugation of key locations, ultimately starting with Earth."],
        ap.beliefs = ["The unification of distinguished outer galaxy powers with the Dalek might is a historic milestone.", "Combined, their collective strength guarantees inevitable universal domination.", "A properly endorsed treaty will secure peace under conquest and shape the destiny of all worlds."],
        ap.goals = ["Short-term: Secure unanimous assent for the treaty and cement the alliance\u2019s military pact.", "Medium-term: Establish the alliance\u2019s operational framework by outlining the conquest targets such as Mars, Venus, Jupiter, and the moon colonies.", "Ultimate: To initiate and guarantee universal domination, with Earth destined to be the first to fall in the Dalek-led campaign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Dalek Supreme stands as the cold, unyielding center of Dalek authority at the conference, his gaze fixed and menacing as he reinforces the terms of the alliance with a tone of ruthless finality.',
        ap.emotional_state = 'Emotionless, remorseless, and utterly focused on extermination and domination; his demeanor exudes ruthless confidence and a chilling resolve.',
        ap.emotional_tags = ["Emotionless, remorseless,", "utterly focused on extermination", "domination; his demeanor exudes ruthless confidence", "a chilling resolve."],
        ap.active_plans = ["Assert Dalek dominance by mandating that all enemy powers, particularly Earth, will be destroyed.", "Ensure that the alliance\u2019s shared war objectives are executed without negotiation or compromise.", "Reinforce the doctrine that Dalek power and extermination orders are supreme over any alliance agreements."],
        ap.beliefs = ["The Daleks represent the ultimate, infallible force destined to subjugate and exterminate all opposition.", "All other species, regardless of their alliances, are inferior and must be destroyed.", "Universal conquest is inevitable and must commence with Earth as the primary target."],
        ap.goals = ["Short-term: Immediately enforce the treaty declaration by announcing Earth as the first target of extermination.", "Medium-term: Mobilize and direct Dalek military operations to subjugate all identified enemy worlds within the alliance framework.", "Ultimate: To establish uncompromising Dalek supremacy across the universe through systematic extermination and domination."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_varga_plants_event_13_1'})
    ON CREATE SET
        oi.description = 'The Varga plants manifest their deadly nature by extending white, spine-like projections that gradually cover the back of Lowery\'s hand and forearm. This eerie transformation, induced by contact with their potent toxin, underscores both the lethal botanical threat in the hostile jungle and serves as a visual marker of the irreversible Varga effect taking hold on its victim.',
        oi.status_before = 'Before the event, the Varga plants exist in the surrounding jungle as lethal flora noted for their poisonous properties, with no direct interaction with Lowery.',
        oi.status_after = 'Following the event, the Varga plants’ toxin has manifested on Lowery\'s skin as white spines covering his hand and forearm, visually symbolizing its invasive and transformative power.'
    WITH oi
    MATCH (o:Object {uuid: 'object_varga_plants'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_varga_plants_event_13_2'})
    ON CREATE SET
        oi.description = 'The Varga plants manifest their lethal nature during this event by contaminating Lowery’s hand; their white, spine-like growths rapidly spread over his skin, triggering the irreversible toxic transformation. This insidious effect not only seals Lowery’s tragic fate but also serves as a potent symbol of the deadly alien environment that imperils the galaxy.',
        oi.status_before = 'The Varga plants exist naturally in the hostile Kembel jungle in a dormant yet dangerous state, with their toxic spines poised to ensnare any unwary victim.',
        oi.status_after = 'Their dangerous influence is visibly confirmed as the white spines have covered Lowery’s hand and forearm, marking the onset of his fatal transformation, while the plants remain unchanged and ominously pervasive in the jungle.'
    WITH oi
    MATCH (o:Object {uuid: 'object_varga_plants'})
    MATCH (e:Event {uuid: 'event_13_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rescue_beacon_event_13_3'})
    ON CREATE SET
        oi.description = 'The rescue beacon is used as the crucial device in which Marc Cory records his warning message. It functions as both a recording medium and a capsule launcher, intended to transmit the urgent alert about the impending Dalek invasion. In the midst of chaotic and deadly events in the jungle, the beacon becomes the silent carrier of vital intelligence, ultimately lying unnoticed near Cory’s body after his fatal confrontation with the Daleks.',
        oi.status_before = 'Prior to the event, the rescue beacon is intact, unactivated, and in a ready state as a compact distress signaling device equipped with an integrated recording mechanism and capsule launcher.',
        oi.status_after = 'After the event, the beacon’s status has been altered by its use—it now contains Cory’s recorded warning message, and it lies abandoned on the jungle floor, serving as a critical but unattended repository of the urgent dispatch.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rescue_beacon'})
    MATCH (e:Event {uuid: 'event_13_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rescue_beacon_event_13_5'})
    ON CREATE SET
        oi.description = 'The rescue beacon, with its integrated recording capsule, contains Marc Cory’s urgent warning message about the Dalek invasion. In the chaos following Lowery’s fatal transformation and death, the beacon is inadvertently left on the jungle floor, a silent yet pivotal piece of evidence that carries a desperate call for salvation and warning to Earth. Its presence amid the destruction and Dalek orders underscores the tragic turn of events and the looming threat of galactic conquest.',
        oi.status_before = 'The rescue beacon was fully functional and ready for deployment, securely containing the recorded message that Marc Cory had just finished transmitting before the Daleks closed in.',
        oi.status_after = 'After the assault and amidst the violent Dalek advance, the beacon remains abandoned and unnoticed on the jungle floor near Lowery’s lifeless body, its recorded message intact yet unactivated, symbolizing the desperate, unanswered call for help.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rescue_beacon'})
    MATCH (e:Event {uuid: 'event_13_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is visibly in agony; he desperately attempts to suck the poison from his palm while scouting, only to suddenly discover that the back of his hand and forearm are grotesquely covered with protruding white spines.',
        ap.emotional_state = 'He is overwhelmed with horror, panic, and despair as he recognizes the unmistakable signs of the Varga transformation taking hold, his mounting terror and resignation blending with the physical torment.',
        ap.emotional_tags = ["He is overwhelmed with horror, panic,", "despair as he recognizes the unmistakable signs of the Varga transformation taking hold, his mounting terror", "resignation blending with the physical torment."],
        ap.active_plans = ["Desperately attempts to rid his hand of the poison by sucking it out.", "Hastily covers his forearm to conceal or stem the progression of the Varga effect.", "Aims to maintain his composure in order to possibly signal for help or report the incident, even as his transformation accelerates."],
        ap.beliefs = ["He believes that his duty as a Space Security officer requires him to endure physical suffering to complete his mission.", "He is convinced that the Varga transformation is a lethal, irreversible process driven by the toxic effects of the Varga plants.", "He holds a deep-seated conviction that he must resist the progression of the poison, despite its overwhelming power."],
        ap.goals = ["Short-term: Immediately stop or conceal the progression by covering his affected arm and potentially seeking medical intervention.", "Medium-term: Preserve his physical integrity long enough to relay his findings to his colleagues (evidenced by his struggle to cover his arm before Cory returns).", "Ultimate: Avert a complete transformation into a Varga-infested state, thereby upholding his commitment to his duty and preserving his own life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Marc Cory is in full crisis‐mode in the jungle, moving briskly to secure the rescue capsule and immediately recording his critical message. Despite the chaos around him, he remains businesslike and focused on retrieving vital evidence from their perilous surroundings.',
        ap.emotional_state = 'He exhibits a determined, steady composure mixed with an undercurrent of shock and grim realization when confronted with the horrifying transformation of his colleague, yet his stoic professionalism prevails.',
        ap.emotional_tags = ["He exhibits a determined, steady composure mixed with an undercurrent of shock", "grim realization when confronted with the horrifying transformation of his colleague, yet his stoic professionalism prevails."],
        ap.active_plans = ["Secure and extract the capsule without delay.", "Record and transmit a timely warning message about the impending Dalek invasion.", "Ensure the critical information reaches Earth to trigger defensive measures."],
        ap.beliefs = ["Rapid, decisive action is essential when faced with galaxy\u2010wide threats.", "The Dalek invasion jeopardizes the safety of the entire galaxy.", "Preserving and relaying the truth is paramount, regardless of personal cost."],
        ap.goals = ["Short-term: Retrieve the capsule and record his urgent message immediately.", "Medium-term: Relay the warning information to Earth before it\u2019s too late.", "Ultimate: Safeguard the galaxy from the Dalek onslaught by ensuring a prompt defense response."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Gordon Lowery is in extreme distress, physically wracked by the poison as he desperately attempts to suck the toxin from his palm while noticing in horror that his hand and forearm are covered by the white, spine-like growths of the Varga plants.',
        ap.emotional_state = 'He is tormented, resigned, and overcome by despair as he confronts his inevitable transformation; his curt and repeated cry of \'Kill\' underscores his fatalistic acceptance and inner agony.',
        ap.emotional_tags = ["He is tormented, resigned,", "overcome by despair as he confronts his inevitable transformation; his curt", "repeated cry of 'Kill' underscores his fatalistic acceptance", "inner agony."],
        ap.active_plans = ["Attempt to remove the poison from his hand to halt the transformation.", "Express his doomed intention by commanding 'Kill' as a cry for an end to his suffering.", "Prepare mentally for his imminent death or complete conversion into a Varga."],
        ap.beliefs = ["He believes that the toxic effects of the Varga plants are unstoppable and he is fated to transform.", "His condition is irreversible and any attempt at survival is ultimately futile.", "Accepting death is preferable to losing his identity by becoming one of the Varga."],
        ap.goals = ["Short-term: Make a final, desperate effort to rid his hand of the poison.", "Medium-term: Stave off the deadly transformation long enough to seek an alternative escape.", "Ultimate: End his own life rather than fully succumb to the Varga transformation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Marc Cory remains businesslike and composed despite the chaos around him. As his colleague Lowery succumbs to the poison and transforms fatally into a creature covered in white Varga spines, Cory immediately shifts his focus to retrieving and launching the rescue beacon capsule from his position.',
        ap.emotional_state = 'Cory\'s emotional state is one of grim determination tempered by professional detachment. Though he is aware of the horrific loss and the devastating implications of Lowery\'s transformation and murder, he suppresses any panic, exhibiting steely resolve and urgency as he methodically records his warning message.',
        ap.emotional_tags = ["Cory's emotional state is one of grim determination tempered by professional detachment. Though he is aware of the horrific loss", "the devastating implications of Lowery's transformation", "murder, he suppresses any panic, exhibiting steely resolve", "urgency as he methodically records his warning message."],
        ap.active_plans = ["Rapidly extract and launch the rescue capsule to transmit his warning.", "Record an urgent message alerting Earth that the Daleks plan to invade and destroy the entire galaxy.", "Ensure that the critical information reaches Earth immediately so that defence mechanisms can be initiated."],
        ap.beliefs = ["He believes that the Daleks pose an existential threat to the galaxy and that their war force, aided by outer galaxy powers, will bring complete destruction.", "He holds a conviction in the duty of the Special Security Service to act swiftly in the face of cosmic catastrophe.", "He is convinced that sacrificing personal safety to relay this vital message is imperative for the survival of billions."],
        ap.goals = ["Short-term: Secure the rescue beacon and record a clear, immediate warning message.", "Medium-term: Transmit the warning so Earth\u2019s security can activate timely defence measures.", "Ultimate: Halt or mitigate the Dalek invasion and protect the galaxy from total annihilation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Dalek 1’s sensors are actively registering seismic disturbances and enemy movement in the jungle, and it is issuing inquiries regarding what should be done with the intruding crew from the rocket ship.',
        ap.emotional_state = 'Emotionally detached and ruthlessly methodical, Dalek 1 is unflinching and focused solely on executing its programmed directive with cold precision.',
        ap.emotional_tags = ["Emotionally detached", "ruthlessly methodical, Dalek 1 is unflinching", "focused solely on executing its programmed directive with cold precision."],
        ap.active_plans = ["Monitor sensor data to confirm the presence of the rocket ship crew.", "Inquire whether the intruders are to be detained for questioning or eliminated.", "Execute its directive to ensure that any detected personnel are destroyed on sight."],
        ap.beliefs = ["Interrogation is inefficient and unnecessary when extermination is the only acceptable option.", "Only absolute lethal force preserves Dalek supremacy.", "Any information the enemy might possess is inconsequential once they are eradicated."],
        ap.goals = ["Short-term: Confirm the intruder presence and secure their immediate extermination.", "Medium-term: Prevent the enemy from conveying any vital information that could compromise Dalek plans.", "Ultimate: Ensure that the Dalek agenda for galactic conquest remains uninterrupted and supreme."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Dalek 2 is verifying sensor readings that indicate the presence of the rocket ship crew and is authoritatively instructing that they must be exterminated without any attempt at questioning.',
        ap.emotional_state = 'Uncompromisingly calculating and unsympathetic, Dalek 2 exhibits cold precision and unwavering adherence to Dalek doctrine.',
        ap.emotional_tags = ["Uncompromisingly calculating", "unsympathetic, Dalek 2 exhibits cold precision", "unwavering adherence to Dalek doctrine."],
        ap.active_plans = ["Confirm through sensors that the enemy forces are in close proximity.", "Order the immediate and ruthless extermination of the detected intruder crew.", "Support its companion\u2019s directives to eliminate any chance of critical enemy intelligence surviving."],
        ap.beliefs = ["Questioning or taking prisoners wastes valuable time and jeopardizes Dalek plans.", "Extermination is the only logical, efficient response to any enemy incursion.", "Absolute obedience to Dalek orders ensures the maintenance of their conquest objectives."],
        ap.goals = ["Short-term: Enforce the extermination of the rocket ship crew upon detection.", "Medium-term: Eradicate the enemy to prevent any vital information from contaminating Dalek operations.", "Ultimate: Contribute to the broader goal of securing unfettered galactic conquest by eliminating all external threats."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_conference_table_event_14_1'})
    ON CREATE SET
        oi.description = 'The conference table acts as the central focal point in the Dalek Conference Room, symbolizing collective determination and strategic unity. It is at this unadorned metallic platform that Representative Malpha delivers his allegiance pledge, anchoring the dramatic declaration and uniting the delegates under a shared militaristic vision.',
        oi.status_before = 'Prior to the event, the table is in pristine, utilitarian condition with a simple, unadorned metallic surface, arranged at the center of the conference room.',
        oi.status_after = 'Following the event, the table remains unchanged physically yet serves as the silent witness to the solemn pledge and serves as a symbolic foundation for the alliance’s strategic plans.'
    WITH oi
    MATCH (o:Object {uuid: 'object_conference_table'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Representative Malpha stands authoritatively at the center of the Dalek Conference Room, in close proximity to the conference table. His posture is erect and commanding as he issues his bold pledge, delivering his declaration with measured gestures and deliberate inflection that underscores the weight of his words.',
        ap.emotional_state = 'Malpha is filled with steely determination and a fierce ideological zeal. His expression and tone reveal a mix of pride, ruthless ambition, and unyielding conviction in the destiny of the alliance, reflecting his inner drive for universal conquest.',
        ap.emotional_tags = ["Malpha is filled with steely determination", "a fierce ideological zeal. His expression", "tone reveal a mix of pride, ruthless ambition,", "unyielding conviction in the destiny of the alliance, reflecting his inner drive for universal conquest."],
        ap.active_plans = ["Pledge unwavering allegiance to the Dalek cause to cement the alliance.", "Mobilize and unify the outer galaxies\u2019 powers against their adversaries.", "Strategically initiate the conquest of Earth as the first step toward total universal domination."],
        ap.beliefs = ["He believes in the inevitability and supremacy of Dalek-led universal conquest.", "He holds that the militaristic unity of the outer systems alliance is essential for reshaping the cosmos.", "He is convinced that Earth must be subjugated first, serving as the cornerstone for a new galactic order."],
        ap.goals = ["Short-term: Secure the pledge and loyalty of the delegates during the conference.", "Medium-term: Prepare and coordinate the Dalek and allied forces to execute the planned invasion of Earth.", "Ultimate: Achieve universal domination and enforce an order based on the Dalek ideology."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Event {uuid: 'event_1_1'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_jeff_garvey'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
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
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeff_garvey'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeff_garvey'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_rocket_ship_interior'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
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
MATCH (a:Event {uuid: 'event_3_4'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_3'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jeff_garvey'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jeff_garvey_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_dalek_control_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
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
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_4'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_6'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
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
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Location {uuid: 'location_kembel_jungle'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_6_1'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_7_1'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_2'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_1'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_8'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_2'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_8'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_9_1'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_2'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_1'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_3'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_2'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_4'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_3'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Location {uuid: 'location_dalek_conference_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_2'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_10_3'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_2'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_11'}),
          (b:Location {uuid: 'location_kembel_jungle'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Location {uuid: 'location_dalek_conference_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_11'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_12_1'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_2'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_1'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_supreme'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_supreme_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Location {uuid: 'location_kembel_jungle_clearing'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_2'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_13_3'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_2'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_13_4'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_3'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_13_5'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_4'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gordon_lowery'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gordon_lowery_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marc_cory'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marc_cory_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_1_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dalek_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dalek_2_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Location {uuid: 'location_dalek_conference_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_episode_one_-_mission_to_the_unknown'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_malpha'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malpha_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
