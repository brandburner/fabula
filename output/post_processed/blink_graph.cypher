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
MERGE (a:Agent {uuid: 'agent_sally_sparrow'})
    ON CREATE SET
        a.name = 'Sally Sparrow',
        a.title = 'None',
        a.description = 'Sally Sparrow is an inquisitive and courageous investigator whose unyielding curiosity drives her to confront even the strangest of circumstances. In this scene outside the DVD store, her determination shines through as she urgently calls out for the Doctor and confidently hands over a crucial file of documents. Her actions reflect an emotional intensity and persistence in uncovering long-buried mysteries.',
        a.traits = ["Inquisitive", "Courageous", "Determined", "Impulsive"],
        a.sphere_of_influence = 'Investigation of supernatural phenomena'
    ;
MERGE (a:Agent {uuid: 'agent_the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'Time Traveler',
        a.description = 'The Doctor is an enigmatic, eccentric traveler through time whose cryptic and often contradictory remarks add layers of mystery to every encounter. In this scene, his rushed demeanor and offhand references to his disordered life underscore the complexity of his existence. With a mix of nonchalance and urgency, he dispenses advice and apologizes for his own unpredictability, further deepening the intrigue around his character.',
        a.traits = ["Enigmatic", "Eccentric", "Cryptic", "Time-traveler"],
        a.sphere_of_influence = 'Time Travel'
    ;
MERGE (a:Agent {uuid: 'agent_kathy_nightingale'})
    ON CREATE SET
        a.name = 'Kathy Nightingale',
        a.title = 'None',
        a.description = 'Kathy Nightingale is a determined and assertive character whose direct communication style leaves little room for pretense. With a strong personality marked by candor and emotional depth, she leaves behind a legacy that resonates through her recorded words and personal messages. Even in death, her voice is clear, urging those she cares about to remember love and personal truth despite the passage of time.',
        a.traits = ["Assertive", "Reflective", "Emotional", "Uncompromising"],
        a.sphere_of_influence = 'Family and personal legacy'
    ;
MERGE (a:Agent {uuid: 'agent_larry_nightingale'})
    ON CREATE SET
        a.name = 'Larry Nightingale',
        a.title = 'None',
        a.description = 'Larry Nightingale is a pragmatic and cautious individual whose measured responses provide a counterpoint to the emotionally charged actions of those around him. His brief reappearance with the milk signals a return to everyday normalcy despite the chaos in the scene. Larry\'s steady practical nature and reserve underscore his desire to maintain order amidst a backdrop of extraordinary events.',
        a.traits = ["Pragmatic", "Cautious", "Rational", "Reserved"],
        a.sphere_of_influence = 'Domestic stability and pragmatic support'
    ;
MERGE (a:Agent {uuid: 'agent_malcolm'})
    ON CREATE SET
        a.name = 'Malcolm',
        a.title = 'None',
        a.description = 'Malcolm is an enigmatic figure whose measured movements provide a counterpoint to the urgency around him. In this scene, he appears briefly as he collects the scattered photographs and letter from the banister rail, demonstrating a calm efficiency. His quiet presence and actions hint at deeper familial connections and serve as a grounding counterbalance to Sally’s frantic behavior.',
        a.traits = ["Calm", "Efficient", "Reserved", "Observant"],
        a.sphere_of_influence = 'Family and secretive histories'
    ;
MERGE (a:Agent {uuid: 'agent_ben'})
    ON CREATE SET
        a.name = 'Ben',
        a.title = 'None',
        a.description = 'Ben is remembered quietly as part of a shared past, his presence echoed on a gravestone that stands as a testament to bygone times. Though he does not speak in this scene, his memory and the marks of his life contribute to the depth of the personal history being mourned. His understated nature contrasts with the more forceful voices of those still present, symbolizing a gentle, enduring legacy.',
        a.traits = ["Understated", "Resilient", "Quiet", "Enduring"],
        a.sphere_of_influence = 'Family heritage'
    ;
MERGE (a:Agent {uuid: 'agent_banto'})
    ON CREATE SET
        a.name = 'Banto',
        a.title = 'None',
        a.description = 'Banto is a practical and unflappable presence whose brief but pointed remarks add a touch of dry humor to the unfolding mystery. He delivers his lines with a straightforward bluntness that contrasts sharply with the surreal twists around him. His demeanor suggests a man accustomed to the quirks of everyday life even amidst bizarre situations within the narrative.',
        a.traits = ["Practical", "Blunt", "Observant", "Humorous"],
        a.sphere_of_influence = 'Retail operations and film culture'
    ;
MERGE (a:Agent {uuid: 'agent_martha_jones'})
    ON CREATE SET
        a.name = 'Martha Jones',
        a.title = 'None',
        a.description = 'Martha Jones is a compassionate and practical companion whose calm presence provides stability even in the whirlwind of chaotic time-travel events. In the present scene, she appears exasperated by the Doctor\'s disordered timeline and urgently reminds him of a crucial deadline. Her no-nonsense attitude and quiet determination help balance the surreal and unpredictable nature of their adventures.',
        a.traits = ["Compassionate", "Practical", "Supportive", "Level-headed"],
        a.sphere_of_influence = 'Companionship and support in time-travel endeavors'
    ;
MERGE (a:Agent {uuid: 'agent_desk_sergeant'})
    ON CREATE SET
        a.name = 'Desk Sergeant',
        a.title = 'Desk Sergeant',
        a.description = 'The Desk Sergeant is a pragmatic and by-the-book police official managing the front desk. Tasked with routine duties, he exhibits a measured and procedural demeanor. His brief interaction with Sally reveals an air of authority as he instructs her to wait, highlighting his role in maintaining order even as the extraordinary subtly intrudes on the everyday.',
        a.traits = ["authoritative", "pragmatic", "vigilant", "methodical"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_di_billy_shipton'})
    ON CREATE SET
        a.name = 'Billy Shipton',
        a.title = 'Detective Inspector',
        a.description = 'Billy Shipton is a reflective and sentimental detective inspector whose weary humor and nostalgic reminiscences underscore his battle with age and mortality. In the quiet solitude of a geriatric ward, his cryptic references to time, the fabric of the universe, and the mysterious message from The Doctor create a poignant aura around his character. His bittersweet dialogue reveals a man clinging to hope even as the weight of the past tugs at him.',
        a.traits = ["Reflective", "Witty", "Sentimental", "Resilient"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_marcie'})
    ON CREATE SET
        a.name = 'Marcie',
        a.title = 'None',
        a.description = 'Marcie is a supporting figure serving as an intermediary in the police station. Though her role is brief, she is instrumental in relaying DI Billy Shipton\'s message that he will be late. Her presence, while understated, provides essential continuity in communication within the station.',
        a.traits = ["efficient", "supportive", "quiet", "reliable"],
        a.sphere_of_influence = 'None'
    ;
MERGE (o:Object {uuid: 'object_camera'})
    ON CREATE SET
        o.name = 'Camera',
        o.description = 'A portable photographic device carried by Sally Sparrow, used to document the mysterious and eerie interior of Wester Drumlin House. It captures images of plastic-covered chandeliers, abandoned furniture, and unsettling details that contribute to the scene\'s surreal atmosphere.',
        o.purpose = 'To capture photographic evidence of the unusual interior and paranormal hints within the house.',
        o.significance = 'Serves as a tool for investigation, reflecting Sally\'s desire to record and unravel the mysteries that envelop the house.'
    ;
MERGE (o:Object {uuid: 'object_statue_weeping_angel'})
    ON CREATE SET
        o.name = 'Statue of the Weeping Angel',
        o.description = 'A set of three stone statues arranged on the landing, each uniquely concealing its eyes. One of the statues notably holds a Yale key on a chain. Their silent, watchful presence in the entrance hall creates an atmosphere of ominous dread and supernatural vigilance as they seemingly follow Sally’s every move.',
        o.purpose = 'To serve as a foreboding symbol of the supernatural threat and mystery surrounding the narrative.',
        o.significance = 'The statues act as both observers and enforcers, their shifting expressions and concealed eyes heightening tension and reinforcing the eerie themes of the story.'
    ;
MERGE (o:Object {uuid: 'object_thrown_pot'})
    ON CREATE SET
        o.name = 'Thrown Pot',
        o.description = 'A heavy pot that is forcefully thrown, breaking a window and shattering on the floor. The impact of the pot is sudden and creates a jarring disturbance in the tense atmosphere of the scene.',
        o.purpose = 'To serve as a catalyst for action, triggering a moment of alarm and demonstrating that the environment is both unpredictable and dangerous.',
        o.significance = 'Emphasizes the volatile and unsettling nature of the setting, acting as a tangible manifestation of the unexplained threats present in the narrative.'
    ;
MERGE (o:Object {uuid: 'object_monitor_screens'})
    ON CREATE SET
        o.name = 'Monitor Screens',
        o.description = 'A series of electronic screens mounted along the wall, continuously displaying images and urgent messages. Their steady glow serves as a technological conduit through which cryptic warnings are delivered, contributing an eerie, unyielding presence in the front room.',
        o.purpose = 'To display urgent, often cryptic messages that heighten narrative tension and provide critical visual clues about impending threats.',
        o.significance = 'The screens serve as a focal point of communication and suspense, reinforcing the surreal blend of technology and mystery that permeates the narrative.'
    ;
MERGE (o:Object {uuid: 'object_mobile_phone'})
    ON CREATE SET
        o.name = 'Mobile Phone',
        o.description = 'A sleek, modern mobile phone that functions as a crucial communication device within the narrative. In this scene, its unexpected ring interrupts the silence of the underground car park, serving as a trigger for Sally’s inquiry and linking her to Billy.',
        o.purpose = 'To facilitate urgent communication and advance the narrative by connecting characters over unforeseen events.',
        o.significance = 'The ringing mobile phone symbolizes the intrusion of external events into an isolated space, highlighting moments of connection and suspense in the unfolding mystery.'
    ;
MERGE (o:Object {uuid: 'object_coffee'})
    ON CREATE SET
        o.name = 'Coffee',
        o.description = 'A freshly brewed cup of coffee, steaming with warmth and carrying a comforting aroma. It is prepared in the kitchen as a gesture of care and a small attempt to restore calm in the midst of a tense, late-night exchange.',
        o.purpose = 'To provide comfort and a moment of normalcy during a stressful interaction.',
        o.significance = 'Symbolizes care and domestic reassurance, highlighting Sally\'s effort to soothe nerves amid unsettling circumstances.'
    ;
MERGE (o:Object {uuid: 'object_dressing_gown'})
    ON CREATE SET
        o.name = 'Dressing Gown',
        o.description = 'A soft and comfortable dressing gown that serves as a familiar article of home attire. In the scene, it is quickly grabbed by Kathy as she abandons her bedroom in haste, highlighting both the urgency and disarray of the moment.',
        o.purpose = 'To provide warmth, modesty, and comfort as an article of clothing in a domestic setting.',
        o.significance = 'The dressing gown symbolizes the abrupt intrusion of chaos into everyday life, reinforcing the tension as personal space is suddenly disrupted.'
    ;
MERGE (o:Object {uuid: 'object_writing_on_the_wall'})
    ON CREATE SET
        o.name = 'Writing on the Wall',
        o.description = 'A series of mysterious inscriptions etched into the wall, including a baffling appearance of Sally’s name. The cryptic words evoke a sense of foreboding and wonder, challenging the characters to question reality and the nature of their surroundings.',
        o.purpose = 'To serve as a mysterious clue that disrupts everyday expectations.',
        o.significance = 'Symbolizes the intrusion of the inexplicable into the familiar, prompting deeper questions about identity and destiny within the narrative.'
    ;
MERGE (o:Object {uuid: 'object_doorbell'})
    ON CREATE SET
        o.name = 'Doorbell',
        o.description = 'A modest doorbell installed at the entrance of the drawing room, its clear chime suddenly signaling an unexpected arrival. Its simple design contrasts with its narrative role as the harbinger of unanticipated events, breaking the calm of the domestic setting.',
        o.purpose = 'To alert the inhabitants of someone at the door.',
        o.significance = 'Acts as a catalyst that introduces an element of mystery by interrupting normalcy and hinting at unforeseen intrusions.'
    ;
MERGE (o:Object {uuid: 'object_ancient_letter'})
    ON CREATE SET
        o.name = 'Ancient Letter with Photographs',
        o.description = 'This weathered, yellowed letter accompanied by faded photographs serves as a physical record of Kathy\'s rich and complex life. Its inscriptions and images evoke nostalgia and personal history, capturing moments of love, loss, and remembrance.',
        o.purpose = 'To convey a deeply personal message that reveals Kathy\'s life, love, and the shared memories that continue to influence the characters.',
        o.significance = 'The letter is a narrative linchpin that anchors the characters to their emotional histories, prompting reflection and continuity within the story.'
    ;
MERGE (o:Object {uuid: 'object_driving_licence'})
    ON CREATE SET
        o.name = 'Driving Licence',
        o.description = 'A personal identification document typically used to verify one\'s identity. It contains a small, dated photograph and several official details, serving as a reliable form of identification.',
        o.purpose = 'To serve as a potential means of identity verification.',
        o.significance = 'The driving licence underscores themes of personal identification and authenticity, contrasting with the mysterious nature of the letter and the circumstances at the front door.'
    ;
MERGE (o:Object {uuid: 'object_little_photographs'})
    ON CREATE SET
        o.name = 'Little Photographs',
        o.description = 'A collection of small, worn photographs that Malcolm refers to with evident embarrassment. Their faded details and fragile condition suggest they carry secrets from a long-ago time, encapsulating the elusive nature of memory.',
        o.purpose = 'To serve as tangible evidence of past events and as a key to unlocking hidden information from a bygone era.',
        o.significance = 'They underscore the themes of fragility and mystery, representing the arduous process of piecing together history from fragmented clues.'
    ;
MERGE (o:Object {uuid: 'object_apple'})
    ON CREATE SET
        o.name = 'Apple',
        o.description = 'A fresh, crisp apple, being eaten by the young man on the stone wall. Its presence underscores the blend of mundane reality and surreal debate over identity and place.',
        o.purpose = 'To be consumed for nourishment, symbolizing routine in an otherwise perplexing moment.',
        o.significance = 'Highlights the contrast between everyday normalcy and the surrounding surreal and puzzling events.'
    ;
MERGE (o:Object {uuid: 'object_newspaper'})
    ON CREATE SET
        o.name = 'The Hull Times Newspaper',
        o.description = 'A printed newspaper edition of The Hull Times, dated 5th December 1920. It carries historical detail and serves as a tangible marker of time, providing concrete evidence of the era under discussion.',
        o.purpose = 'To serve as a physical record verifying the date and location, catalyzing dialogue regarding temporal displacement and geographic authenticity.',
        o.significance = 'Acts as material evidence that highlights the clash between memory and documented history, reinforcing themes of time and place.'
    ;
MERGE (o:Object {uuid: 'object_envelope_old_photographs'})
    ON CREATE SET
        o.name = 'Envelope with Old Photographs',
        o.description = 'A weathered envelope that, when opened, reveals a collection of faded, vintage photographs of a woman. The images evoke nostalgia and hint at deep familial ties, capturing fragments of a bygone era in delicate detail.',
        o.purpose = 'To reveal important familial connections and trigger a realization about the shared history between the characters.',
        o.significance = 'Acts as a narrative catalyst that bridges past and present, deepening the mystery surrounding the characters\' shared lineage.'
    ;
MERGE (o:Object {uuid: 'object_yale_key'})
    ON CREATE SET
        o.name = 'Yale Key',
        o.description = 'A small, antique Yale key with a worn metal finish and historic design, exuding an air of mystery. Its tactile presence serves as an important clue amidst the unfolding bizarre events.',
        o.purpose = 'To interface with a Yale lock that stubbornly resists modern solutions, symbolizing a barrier to uncovering concealed secrets.',
        o.significance = 'The key is a tangible marker connecting the hidden past with the enigmatic present, and it is directly retrieved by Sally.'
    ;
MERGE (o:Object {uuid: 'object_flowers'})
    ON CREATE SET
        o.name = 'Flowers',
        o.description = 'A vibrant arrangement of fresh flowers, meticulously chosen for their beauty and symbolism, lying gently on a weathered gravestone. Their colors offer a burst of life and remembrance amid the muted tones of the stone.',
        o.purpose = 'To honor the memory of Ben and Kathy by symbolizing love, remembrance, and the hope for renewal.',
        o.significance = 'The flowers act as a tender tribute, bridging the gap between loss and the enduring spirit of life, and serve as a physical manifestation of remembrance.'
    ;
MERGE (o:Object {uuid: 'object_cemetery_statue'})
    ON CREATE SET
        o.name = 'Cemetery Statue',
        o.description = 'A time-worn stone statue, possibly representing an angelic figure or a guardian of the departed. Its features are softened by age and weathered by time, exuding an unsettling presence as it silently observes passersby.',
        o.purpose = 'To serve as a silent witness to the lives and memories interred within the cemetery, adding an aura of mystique and continuity.',
        o.significance = 'The statue symbolizes the enduring watchfulness of fate and memory, acting as a bridge between the living and the dead.'
    ;
MERGE (o:Object {uuid: 'object_dvds_store_television'})
    ON CREATE SET
        o.name = 'Television',
        o.description = 'The television in Banto\'s DVD Store is securely fastened to the wall, playing a fast-paced shootout scene. Its vivid display of action draws attention and creates a dynamic, cinematic atmosphere that mirrors the store\'s dedication to film culture.',
        o.purpose = 'To display a film scene that entertains and engages customers while reinforcing the store\'s cinematic theme.',
        o.significance = 'Acts as both a functional entertainment device and a symbolic object that emphasizes the store\'s focus on film and popular culture.'
    ;
MERGE (o:Object {uuid: 'object_dvd_playback_screen'})
    ON CREATE SET
        o.name = 'DVD Playback Screen',
        o.description = 'A digital display mounted on the wall of the back room that projects cryptic messages from The Doctor and fleeting images of Martha. It intermittently pauses to allow characters like Larry to freeze playback and scrutinize the hidden clues being broadcast.',
        o.purpose = 'To serve as a medium for delivering mysterious audiovisual messages and clues that drive the narrative forward.',
        o.significance = 'Acts as a tangible conduit between distant communications and the immediate dialogue among the characters, linking disparate parts of the unfolding mystery.'
    ;
MERGE (o:Object {uuid: 'object_seventeen_dvd_list'})
    ON CREATE SET
        o.name = 'Seventeen DVD List',
        o.description = 'A concise paper slip that details exactly seventeen DVDs, each bearing a secret appearance by The Doctor. It serves as a tangible record and a mysterious clue, encapsulating one of the narrative’s key enigmas.',
        o.purpose = 'To provide a documented clue that reveals the critical number of DVDs integral to the unfolding mystery.',
        o.significance = 'It symbolizes the precise and enigmatic nature of the clues scattered throughout the narrative, tying personal possession to a broader cosmic mystery.'
    ;
MERGE (o:Object {uuid: 'object_dvd_film'})
    ON CREATE SET
        o.name = 'DVD Film',
        o.description = 'A film playing on the wall in Banto\'s DVD Store that reinforces the store\'s thematic connection to film culture. It provides a cinematic backdrop, adding a layer of surreal interplay between reality and the projected narrative.',
        o.purpose = 'To serve as a visual narrative element that enhances the atmospheric quality of the DVD store.',
        o.significance = 'Acts as a symbol of the merging of ordinary commercial life with the mysterious, hinting at a broader, enigmatic context in the story.'
    ;
MERGE (o:Object {uuid: 'object_church_statues'})
    ON CREATE SET
        o.name = 'Church Statues',
        o.description = 'Two statues positioned on the facade of the church, visible from the police station window. Their sudden disappearance when observed adds an eerie, supernatural quality that questions the nature of reality.',
        o.purpose = 'To serve as a narrative symbol of the bizarre and uncanny, hinting at a deeper supernatural presence linked to the legendary Weeping Angels.',
        o.significance = 'Their vanishing heightens the unsettling atmosphere and reinforces the theme of unexpected, inexplicable phenomena disrupting everyday order.'
    ;
MERGE (o:Object {uuid: 'object_police_box'})
    ON CREATE SET
        o.name = '1960s Style Police Box',
        o.description = 'A distinct, retro police box modeled in the 1960s style that occupies a corner of the underground car park. It features an outdated design with slightly small windows and a dummy phone, embodying quirky mystery.',
        o.purpose = 'To serve as a symbolic artifact and conversation piece, reflecting a playful yet enigmatic element within the narrative.',
        o.significance = 'Stands as a tangible reminder of surreal humor interlaced with mystery, prompting questions about authenticity and the passage of time.'
    ;
MERGE (o:Object {uuid: 'object_angel_statues'})
    ON CREATE SET
        o.name = 'Guardian Angels',
        o.description = 'A set of three stone statues, these Weeping Angel figures are frozen in a menacing repose with cold, unyielding faces and outstretched forms. Their presence exudes a supernatural threat as they guard the Tardis.',
        o.purpose = 'To serve as sentinels guarding the Tardis and intensifying the tension with their ominous presence.',
        o.significance = 'They embody the creeping terror of the unknown and are pivotal in building the surreal, supernatural atmosphere of the narrative.'
    ;
MERGE (o:Object {uuid: 'object_tardis'})
    ON CREATE SET
        o.name = 'Tardis',
        o.description = 'An iconic blue time machine with a weathered exterior that belies immense power within. In this sequence, the Tardis visibly rocks and activates its time rotor before dematerialising in a burst of energy. Its aged, yet timeless design and the palpable hum of temporal energy serve as a beacon of hope and escape.',
        o.purpose = 'To transport its occupants through time and space while providing refuge against supernatural threats.',
        o.significance = 'The Tardis is central to the narrative, embodying the possibility of escape and the unpredictable nature of time, while its dramatic departure intensifies the tension of the scene.'
    ;
MERGE (o:Object {uuid: 'object_timey_wimey_detector'})
    ON CREATE SET
        o.name = 'Timey-Wimey Detector',
        o.description = 'A quirky and compact gadget designed by The Doctor, the Timey-Wimey Detector features blinking lights, an unusual auditory \'ding\', and a blend of futuristic components with a touch of whimsy that reflects the Doctor’s eccentric approach to technology and time travel.',
        o.purpose = 'To detect temporal anomalies and the presence of unusual \'stuff\' in the space-time continuum, while also serving as a humorous plot device.',
        o.significance = 'The detector symbolizes the Doctor’s unique grasp of time, serving as a tangible reminder of the surreal, unpredictable nature of time travel and encapsulating the blend of humor and danger in the unfolding events.'
    ;
MERGE (o:Object {uuid: 'object_wedding_photograph'})
    ON CREATE SET
        o.name = 'Wedding Photograph',
        o.description = 'A faded wedding photograph that captures a moment of past joy and tender memory. Though worn by time, the image radiates warmth and nostalgia, serving as a poignant reminder of love, loss, and cherished moments of a bygone era.',
        o.purpose = 'To evoke memory and serve as an emotional touchstone within the scene.',
        o.significance = 'It symbolizes the permanence of personal history and the enduring nature of lost love, anchoring the characters emotionally in their shared past.'
    ;
MERGE (o:Object {uuid: 'object_telephone'})
    ON CREATE SET
        o.name = 'Telephone',
        o.description = 'A classic telephone set with a simple yet functional design, likely mounted on a wall or placed on a desk. Its timeless construction, whether featuring a rotary dial or modern push-buttons, facilitates direct communication.',
        o.purpose = 'To receive and make calls, enabling characters to communicate and trigger brief yet significant dialogue exchanges.',
        o.significance = 'The telephone serves as the pivotal medium that connects Larry’s response with Sally’s off-camera remark, symbolizing the abrupt intrusion of the mysterious into an otherwise quiet setting.'
    ;
MERGE (o:Object {uuid: 'object_sally_dvd_collection'})
    ON CREATE SET
        o.name = 'Sally\'s DVD Collection',
        o.description = 'A carefully curated collection of seventeen DVDs, each bearing a hidden Easter Egg. This collection is not merely media, but a repository of secret clues intricately linked to the mysterious messages whispered by The Doctor.',
        o.purpose = 'To serve as a tangible manifestation of a hidden message intended solely for Sally, connecting her personal belongings with the overarching mystery.',
        o.significance = 'The collection symbolizes a personalized enigma within the narrative, blending ordinary ownership with extraordinary clues that highlight Sally’s unique role in the unfolding events.'
    ;
MERGE (o:Object {uuid: 'object_portable_dvd_player'})
    ON CREATE SET
        o.name = 'Portable DVD Player',
        o.description = 'A compact, battery-operated DVD player designed for on-the-go viewing. Its lightweight build and integrated display make it ideal for watching DVDs outside traditional settings.',
        o.purpose = 'To display DVDs containing The Doctor\'s recorded messages and clues, serving as a medium for cryptic communication.',
        o.significance = 'It plays a crucial role in connecting the characters to The Doctor’s time-travel messages and mysterious instructions, advancing the narrative.'
    ;
MERGE (o:Object {uuid: 'object_transcript_message'})
    ON CREATE SET
        o.name = 'Transcript Message',
        o.description = 'A hastily written paper transcript capturing every word from The Doctor’s dialogue as recorded by Larry. Marked by frantic note-taking and detailed observations, it bridges the spoken word with a permanent record of cryptic messages.',
        o.purpose = 'To document and preserve The Doctor\'s cryptic messages and statements, enabling the characters to analyze and disseminate critical information.',
        o.significance = 'This transcript underlines the theme of time as a malleable, recorded entity, serving as a crucial record intended to unlock future mysteries.'
    ;
MERGE (o:Object {uuid: 'object_dvd_case'})
    ON CREATE SET
        o.name = 'DVD Case',
        o.description = 'A small DVD case that emits a soft, eerie glow, hinting at its otherworldly significance. Carefully stowed in Larry\'s pocket, it holds an authorised control disc essential for the Tardis\' security protocol.',
        o.purpose = 'To serve as the authorised control disc for triggering the Tardis departure protocol.',
        o.significance = 'The DVD case is vital in enabling the Tardis to dematerialise and escape the advancing threat of the Weeping Angels, symbolising a lifeline amidst chaos.'
    ;
MERGE (o:Object {uuid: 'object_conversation_folder'})
    ON CREATE SET
        o.name = 'Conversation Folder',
        o.description = 'A well-worn folder containing a detailed transcript of conversations, personal photographs, an old letter, and a picture of an Angel. In this scene, Sally hands it to the Doctor as vital evidence tying past events to emerging mysteries.',
        o.purpose = 'To serve as tangible evidence and a repository for critical clues that connect past events with future consequences.',
        o.significance = 'It represents Sally\'s relentless pursuit of truth and the continuity between mysterious past occurrences and upcoming revelations.'
    ;
MERGE (o:Object {uuid: 'object_long_bow'})
    ON CREATE SET
        o.name = 'Long Bow',
        o.description = 'A well-crafted long bow with a polished wooden finish and intricate carvings, held by The Doctor. Its unexpected presence underscores the incongruity of traditional weaponry within a time-travel narrative.',
        o.purpose = 'To accentuate the Doctor\'s eclectic, time-displaced persona and visually underline the surreal nature of his character.',
        o.significance = 'It serves as a symbolic prop highlighting the clash between old-world traditions and the complexities of time travel.'
    ;
MERGE (o:Object {uuid: 'object_quiver_of_arrows'})
    ON CREATE SET
        o.name = 'Quiver of Arrows',
        o.description = 'A leather quiver containing several finely crafted arrows, carried by Martha Jones. It reflects her readiness and subtle combativeness amidst the chaos of time travel.',
        o.purpose = 'To visually reinforce Martha\'s practical and prepared nature in the face of unfolding events.',
        o.significance = 'It adds a layer of unexpected martial symbolism to the scene, underscoring the blend of danger and normalcy.'
    ;
MERGE (o:Object {uuid: 'object_milk'})
    ON CREATE SET
        o.name = 'Milk',
        o.description = 'A carton of milk brought by Larry, symbolizing the intrusion of everyday life into a surreal and chaotic moment. Its presence is a quiet reminder of domesticity amidst the extraordinary.',
        o.purpose = 'To provide a tangible link to everyday life and symbolize practicality in a moment of temporal disarray.',
        o.significance = 'It highlights the contrast between mundane normalcy and the bizarre, time-warped events unfolding around the characters.'
    ;
MERGE (l:Location {uuid: 'location_wester_drumlin_house'})
    ON CREATE SET
        l.name = 'Wester Drumlin House',
        l.description = 'Wester Drumlin House stands as a brooding relic steeped in mystery. Its formidable wrought iron gates, weathered by time and adorned with cautionary notices, promise both danger and adventure. The overgrown vegetation and creeping vines softly embrace its decaying façade, evoking secret histories and hidden stories waiting to be uncovered by intrepid investigators.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_kathys_flat_hallway'})
    ON CREATE SET
        l.name = 'Kathy\'s Flat Hallway',
        l.description = 'The hallway of Kathy\'s flat exudes a subtle tension with its dim lighting and modern touches, contrasted by the ambient glow of multiple monitor screens displaying The Doctor and Martha. The space, charged with anticipation and mystery, amplifies the isolation and urgency inherent in late-night communications.',
        l.type = 'Apartment'
    ;
MERGE (l:Location {uuid: 'location_kathys_flat_bedroom'})
    ON CREATE SET
        l.name = 'Kathy\'s Flat Bedroom',
        l.description = 'The bedroom in Kathy’s flat is a modest, intimate space characterized by soft ambient lighting and minimal decor. With a centrally placed bed and few personal touches, it offers an atmosphere of quiet routine and solitude, yet becomes a stage for unexpected communication that interrupts the everyday privacy.',
        l.type = 'Apartment'
    ;
MERGE (l:Location {uuid: 'location_kitchen'})
    ON CREATE SET
        l.name = 'Kitchen',
        l.description = 'The kitchen is a modest, warmly lit space that exudes a sense of intimate homeliness. With worn countertops, softly humming appliances, and scattered utensils, it paints a picture of everyday routine and quiet comfort, even as chaos unfolds around it.',
        l.type = 'Kitchen'
    ;
MERGE (l:Location {uuid: 'location_entrance_hall'})
    ON CREATE SET
        l.name = 'Entrance Hall',
        l.description = 'The Entrance Hall is a modest, nostalgic foyer serving as the threshold between the intimate privacy of a home and the unpredictable world beyond. Bathed in soft lighting and minimal decor, it carries an understated charm infused with quiet melancholy. In this scene, it sets the stage for an interpersonal exchange that preludes further conflicts.',
        l.type = 'Building Entrance'
    ;
MERGE (l:Location {uuid: 'location_drawing_room'})
    ON CREATE SET
        l.name = 'Drawing Room',
        l.description = 'The drawing room is a stately and softly lit space with classic furnishings that evoke refined elegance and a sense of domestic familiarity. Its subtly adorned walls, featuring mysterious inscriptions, add an uncanny atmosphere where ordinary comforts mingle with surreal undertones.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_conservatory'})
    ON CREATE SET
        l.name = 'Conservatory',
        l.description = 'Bathed in natural light through expansive glass walls, the conservatory opens onto a lush, serene garden. Vibrant greenery and delicate floral accents lend beauty to the space while an undercurrent of unease—highlighted by an ancient statue—sets the stage for unsettling discoveries amid quiet elegance.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_front_door'})
    ON CREATE SET
        l.name = 'Front Door',
        l.description = 'The front door marks the threshold between a familiar interior and the mysterious unknown beyond. With a weathered façade marked by the signs of age and use, it is bathed in soft, ambient lighting and exudes quiet dignity, providing an understated stage for unexpected encounters and whispered exchanges.',
        l.type = 'Building Entrance'
    ;
MERGE (l:Location {uuid: 'location_field_near_grazing_cows'})
    ON CREATE SET
        l.name = 'Field near Grazing Cows',
        l.description = 'This open, expansive field is carpeted with lush green grass and speckled with wildflowers, evoking tranquil rural beauty. Bathed in natural daylight, a gentle breeze stirs the serene pastoral charm, with grazing cows and rolling expanses hinting at untold secrets and unexpected urgencies.',
        l.type = 'Outdoor'
    ;
MERGE (l:Location {uuid: 'location_cafe'})
    ON CREATE SET
        l.name = 'Cafe',
        l.description = 'The cafe is a cozy, inviting space warmly lit with modern touches and comfortable seating that immediately creates a sense of refuge. The soft murmur of background chatter and the aroma of freshly brewed coffee imbue it with everyday charm, even as it becomes a quiet stage for revelations steeped in history and heartfelt memories.',
        l.type = 'Cafe'
    ;
MERGE (l:Location {uuid: 'location_cemetery'})
    ON CREATE SET
        l.name = 'Cemetery',
        l.description = 'The cemetery is a somber, expansive resting place marked by rows of weathered gravestones and crypts that tell tales of love and loss. Its subdued light and the hushed echoes of the past evoke a deep sense of remembrance, balancing peaceful introspection with an eerie, time-worn melancholy.',
        l.type = 'Cemetery'
    ;
MERGE (l:Location {uuid: 'location_bantos_dvd_store'})
    ON CREATE SET
        l.name = 'Banto\'s DVD Store',
        l.description = 'Banto\'s DVD Store, retitled as Sparrow and Nightingale, Antiquarian Books and Rare DVDs, is an intimate retail space that melds cinematic nostalgia with mystery. Its modest exterior belies a quirky charm inside, where rare DVDs and antiquarian books hint at hidden narratives. The building stands as a silent witness to surreal encounters bridging everyday life and the extraordinary.',
        l.type = 'Retail'
    ;
MERGE (l:Location {uuid: 'location_back_room'})
    ON CREATE SET
        l.name = 'Back Room',
        l.description = 'The back room is a secluded, nondescript space tucked away at the rear of a larger establishment. Dimly lit and sparsely furnished, its muted walls and lingering shadows create an atmosphere of quiet mystery and subdued anticipation, ideal for discreet exchanges and secretive interactions.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_police_station'})
    ON CREATE SET
        l.name = 'Police Station',
        l.description = 'A modest, utilitarian space characterized by a functional front desk and sparse, institutional decor. The police station exudes an atmosphere of routine order and controlled activity, providing a stark backdrop to the sudden intrusion of inexplicable events beyond its walls.',
        l.type = 'Police Station'
    ;
MERGE (l:Location {uuid: 'location_church_opposite'})
    ON CREATE SET
        l.name = 'Church',
        l.description = 'Opposite the police station stands a quaint stone church with traditional architecture that exudes longstanding reverence. Its calm and stable facade becomes the setting for surreal occurrences, as fleeting appearances of statues mirror the uncanny events unfolding in the narrative.',
        l.type = 'Church'
    ;
MERGE (l:Location {uuid: 'location_underground_car_park'})
    ON CREATE SET
        l.name = 'Underground Car Park',
        l.description = 'The underground car park is a dimly lit, cavernous space defined by exposed concrete walls and flickering fluorescent lights. Its chilly, echoing atmosphere—accentuated by scattered parked vehicles and pervasive dampness—amplifies the sense of urban desolation and mystery as characters navigate its shadowy corridors.',
        l.type = 'Underground Parking'
    ;
MERGE (l:Location {uuid: 'location_street'})
    ON CREATE SET
        l.name = 'Street',
        l.description = 'An open urban street set against a softly lit night provides a transitional space between the regimented order of nearby authority and the unfolding chaos of mystery. Illuminated intermittently by street lights and framed by modest buildings and parked cars, the street hints at concealed secrets and unexpected revelations.',
        l.type = 'Street'
    ;
MERGE (l:Location {uuid: 'location_car_park'})
    ON CREATE SET
        l.name = 'Car Park',
        l.description = 'A practical outdoor parking area featuring modest, weathered vehicles under an open sky. In this scene, the car park transforms into a disorienting space where familiar elements vanish, heightening the sense of surreal loss.',
        l.type = 'Parking Lot'
    ;
MERGE (l:Location {uuid: 'location_alleyway'})
    ON CREATE SET
        l.name = 'Alleyway',
        l.description = 'The alleyway is a narrow urban passage set between aging brick buildings. Dim, flickering street lights cast shifting shadows over damp, uneven pavement, creating a space that is both claustrophobic and foreboding. Graffiti, moisture, and the distant hum of the city converge to amplify its eerie ambiance.',
        l.type = 'Outdoor'
    ;
MERGE (l:Location {uuid: 'location_geriatric_ward'})
    ON CREATE SET
        l.name = 'Geriatric Ward',
        l.description = 'The geriatric ward is a quiet hospital space marked by a solitary occupied bed near a window that allows soft natural light. Its sparse and austere decor echoes melancholy and vulnerability, reflecting the slow passage of time and the fragility of life while setting a mood of introspection and tender farewell.',
        l.type = 'Hospital Ward'
    ;
MERGE (l:Location {uuid: 'location_cellar'})
    ON CREATE SET
        l.name = 'Cellar',
        l.description = 'The cellar is a damp, subterranean chamber located beneath a building. Dim and flickering light from a singular bulb creates erratic shadows on rough concrete walls, with eerie sounds echoing throughout. The presence of the Tardis and its guardian Angels intensifies the palpable urgency and dread within this claustrophobic space.',
        l.type = 'Cellar'
    ;
MERGE (l:Location {uuid: 'location_tardis_interior'})
    ON CREATE SET
        l.name = 'Tardis Interior',
        l.description = 'The Tardis interior is an enigmatic, dynamic space brimming with pulsating energy and mysterious, shifting lights. Featuring a myriad of control panels, a prominently displayed time rotor, and a central console, it encapsulates the essence of time travel. In this scene, its dramatic rocking and vibrations set an atmosphere of imminent escape and palpable danger.',
        l.type = 'Time Machine Interior'
    ;
MERGE (o:Organization {uuid: 'org_london_county_council'})
    ON CREATE SET
        o.name = 'London County Council',
        o.description = 'The London County Council is a governmental authority responsible for regional planning, safety regulations, and managing public infrastructure.',
        o.sphere_of_influence = 'Regional governance'
    ;
MERGE (ep:Episode {uuid: 'episode-blink'})
    ON CREATE SET
        ep.title = 'Blink',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Beware the Weeping Angel',
        s.description = 'On a dark, rain-soaked night, the decaying Wester Drumlin House looms in silence as mystery and menace blend with beauty. Sally Sparrow, a daring young photographer with glimmering eyes and an irreverent smile, scales forbidding wrought iron gates marked with warnings and marches up the gravel drive towards the crumbling mansion. Inside, the house reveals its faded charm with plastic-covered chandeliers and timeworn furniture. While capturing haunting images with her camera, Sally’s attention is diverted by a strip of peeling wallpaper that reveals a cold warning, urging her to duck. Her timely reaction avoids an oncoming thrown pot, and her torchlight exposes a solitary, sorrowful statue of a weeping angel outside—an ominous harbinger of the secret message signed \'Love from the Doctor (1969)\'.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_wester_drumlin_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Arriving at the Abandoned House',
        e.description = 'Sally Sparrow confidently scales the imposing wrought iron gates of Wester Drumlin House on a cold, wet night. Marching up the gravel driveway with the thrill of discovery evident in her expression, she approaches the once-grand residence now left to decay. With her trusty camera in hand, she documents broken chandeliers and abandoned furniture that speak of the house’s faded elegance. This opening act not only establishes her adventurous nature but also sets the stage for the eerie revelations hidden within the crumbling walls.',
        e.sequence = 1,
        e.key_dialogue = ["Sexy!"]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'The Warning Unfolds',
        e.description = 'Inside the desolate interior of the house, Sally’s curiosity is piqued by a loose strip of peeling wallpaper. As she pulls it away, the fragmented letter \'B\' gives way to a chilling message: \'Beware the Weeping Angel\' followed by an urgent imperative to duck. In a heartbeat of realization, just as a thrown pot crashes through a window, Sally instinctively ducks, narrowly avoiding injury. This moment of peril intertwines mystery with immediate danger, underscoring the otherworldly warning that has just been unveiled.',
        e.sequence = 2,
        e.key_dialogue = ["Oh, and duck! Really, duck! Sally Sparrow duck, now."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Encounter with the Weeping Angel',
        e.description = 'After narrowly averting the danger, Sally’s torch casts light on a sight that freezes time itself—a solitary statue in the overgrown garden. The weeping angel, with its outstretched hands concealing a sorrowful face, stands as a mute sentinel to the bizarre events unfolding inside the house. As she investigates further by peeling away more of the timeworn wallpaper, a final message is revealed: a cryptic sign-off reading \'Love from the Doctor (1969)\'. This encounter deepens the mystery, blending past and future, and hints at the peril and remarkable journey that lies ahead.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Hallway Warning',
        s.description = 'The scene unfolds in the dim corridor of Kathy\'s Flat, where a sense of impending dread permeates the area. Numerous monitor screens stretch along the wall at the far end, flickering with the stern image of the Doctor – and one even shows him alongside Martha. Amid this eerie digital chorus, Sally Sparrow stands quietly and calls out, \"Kathy?\" Her single, tentative inquiry contrasts with the intense broadcast looming on the screens. The environment is charged with an ominous tension, as the Doctor’s urgent message underscores the fatal stakes of the moment. Every word is a dire admonition not to blink, as if a single lapse might trigger an encounter with an unseen, deadly force.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_kathys_flat_hallway'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Sally’s Question in the Hallway',
        e.description = 'In the quiet gloom of the hallway, Sally Sparrow’s solitary voice breaks the silence when she calls out, \'Kathy?\'. This brief utterance reflects both uncertainty and an emotional plea for connection in a moment thick with tension. Amidst the array of flickering monitor screens, her inquiry hints at a deeper personal concern as well as the confusion of facing an uncanny circumstance. Her words set the stage for the unfolding crisis, anchoring her personal stakes within the larger narrative of impending terror.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Kathy?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'The Doctor\'s Dire Warning',
        e.description = 'The tension escalates as the monitor screens come alive with the Doctor’s stern visage. In a chorus of urgent warnings, he delivers an admonition that is both cryptic and chilling. He informs Sally that a threat is fast approaching—a danger so swift that even a blink could be fatal. The message is layered with urgency as he insists, \'Don\'t blink. Don\'t even blink. Blink and you\'re dead.\' Reinforced by the presence of another screen featuring Martha, the broadcast leaves no doubt about the severity of the situation, embedding the scene with a relentless sense of impending doom.',
        e.sequence = 2,
        e.key_dialogue = ["DOCTOR [on screen]: Yet. They're coming. They're coming for you, but listen, your life could depend on this. Don't blink. Don't even blink. Blink and you're dead. They are fast, faster than you can believe. Don't turn your back, don't look away, and don't blink. Good luck."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'A Midnight Call',
        s.description = 'Inside Kathy\'s Flat Bedroom, the space is intimate and dimly lit, evoking a sense of quiet isolation as night settles in. The atmosphere is punctuated by the gentle hum of a mobile phone resting on the bedside table, which suddenly rings with an unexpected urgency. In this moment, the everyday intermingles with the underlying tension of a narrative steeped in mystery and impending danger. Kathy, still half-awake, answers the call with a hesitant greeting that hints at both sleepiness and concern. This brief scene adds a personal dimension to the broader story, reminding us that even in calm moments, the extraordinary is never far away.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_kathys_flat_bedroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'The Phone Rings',
        e.description = 'In the quiet stillness of Kathy\'s bedroom, the mobile phone on the bedside table begins to ring. The sound shatters the silence, drawing Kathy’s attention away from her sleep. With a mixture of grogginess and curiosity, she reaches for the phone and answers with a soft, uncertain greeting. This small moment is laden with subtext, giving a glimpse of the isolation and vulnerability she feels, even as the grander, mysterious elements of the unfolding narrative continue to hover in the background.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: Hello?"]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Midnight Coffee Confrontation',
        s.description = 'In the quiet intimacy of a modest kitchen, the late hour sets an atmosphere of subdued tension and domestic realism. Sally Sparrow, still rattled by events past, busies herself with preparing a hot cup of coffee as she attempts to initiate a conversation that might dispel the lingering unease. The soft hum of the refrigerator and the gentle clink of utensils accompany her anxious energy. Meanwhile, Kathy Nightingale’s off-screen voice — groggy and bemused — reminds us of the dissonance between personal crises and everyday mundanity. This scene, set in the kitchen at one in the morning, introduces a brief yet telling exchange that hints at deeper complexities in their relationship and lays the groundwork for further narrative development.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_kitchen'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Late-Night Coffee Exchange',
        e.description = 'In the warmly lit kitchen, Sally Sparrow, visibly anxious and deep in thought, decides to prepare a cup of coffee for her friend as a pretext for a much-needed conversation. Her actions—a mixture of domestic routine and quietly desperate urgency—are aimed at bridging the gap created by earlier unsettling events. As she calls out her intentions, Kathy Nightingale responds from off-screen, her tone a blend of irritation and resignation at the impracticality of a midnight visit. The terse exchange reveals Sally’s inner turmoil and Kathy’s reluctance, setting a poignant, real-world counterpoint to the unfolding larger narrative.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Bit freaked. Need to talk. Making you a coffee.", "KATHY: Sally Sparrow, it's one in the morning. Do you think I'm coming round at one in the morning?", "SALLY: No."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Screens and Sibling Surprises',
        s.description = 'In this fragmented moment inside Kathy’s flat bedroom, the narrative mood is set by a curious off-screen commentary that hints at events beyond the room’s confines. Sally Sparrow, though off-camera and claiming to be in the kitchen, questions the mysterious monitors flashing in the front room, creating a dissonance between space and voice. The uneasy ambiance is deepened when Kathy Nightingale, filled with alarm and exasperation, interjects to remind Sally of her connection with her brother, Larry. This scene, imbued with hints of personal entanglements and underlying tension, uses the intercut dialogue and unexpected spatial references to foreshadow further narrative revelations and the unsettling interplay between technology and interpersonal bonds.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_kathys_flat_bedroom'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Sally Questions the Monitors',
        e.description = 'Off-screen yet resonant, Sally Sparrow comments about her physical location in the kitchen while drawing attention to a series of mysterious monitor screens in the front room. Her words spark curiosity and set the stage for an unsettling investigation into what these screens reveal. The scene establishes a sense of disjointed space where domestic familiarity collides with technological mystery, hinting at deeper narrative currents that will soon be intertwined with familial ties.',
        e.sequence = 1,
        e.key_dialogue = ["I'm in the kitchen. What's that on all those screens in your front room?"]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Kathy’s Concern and Familial Reminder',
        e.description = 'Immediately following Sally\'s observation, Kathy Nightingale reacts with a mix of alarm and exasperation. Her outburst not only expresses her distress over the strange occurrences but also pivots the scene towards personal relations, reminding Sally of her connection to Kathy’s brother, Larry. This event deepens the interpersonal dynamics as Kathy throws a pointed question at Sally, setting up expectations of blending domestic life with the bizarre elements unfolding through the screens.',
        e.sequence = 2,
        e.key_dialogue = ["Oh, God. Oh, God. Sally, you've met my brother Larry, haven't you?"]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'A Strange Kitchen Encounter',
        s.description = 'In the kitchen, everyday life collides with absurdity as family dynamics erupt amid an unexpected intrusion. The scene opens with Sally’s curt dismissal, immediately countered by Kathy’s off-screen warning that trouble is imminent. Without warning, the door swings open to reveal a man baring nearly all his clothes, his appearance punctuating the bizarre domestic moment. Larry, caught off guard, comments wryly about the absence of pants. In response, Kathy abandons her phone and grabs her dressing gown, dashing off to intervene. The scene encapsulates a moment of interrupted normalcy where familial exasperation and concern mix with unexpected humor and chaos.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_kitchen'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Unexpected Entrance',
        e.description = 'Sally opens the exchange with a simple \'No\' as an off-screen voice from Kathy hints at imminent disruption with \'You\'re about to.\' Suddenly, the kitchen door swings open to reveal a man who is scantily clad, his state of undress underlined by the absurdity of his appearance. Larry, witnessing the scene, delivers a bemused remark about hoping for pants. This jarring entrance sets off the chain of reactions that disrupts the quiet domestic moment, unsettling the familiar atmosphere with a touch of unexpected humor.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: No.", "KATHY [OC]: You're about to.", "LARRY: Okay. Not sure, but really, really hoping. Pants?"]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Kathy\'s Intervention',
        e.description = 'The tension heightens as Kathy reacts with urgency. She swiftly ends her phone call and, in a flurry of determination, grabs her dressing gown to confront the absurd situation head-on. Her off-screen command—\'Put them on! Put them on! I hate you! What\'re you thinking?\'—reveals both exasperation and a practical impulse to restore order. Amid this, Larry drifts away, underscoring the disarray that has overtaken the moment. Kathy’s intervention accentuates the familial chaos and sets the stage for subsequent concern and inquiry.',
        e.sequence = 2,
        e.key_dialogue = ["KATHY [OC]: Put them on! Put them on! I hate you! What're you thinking?"]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Aftermath and Reproach',
        e.description = 'As the initial shock subsides, the atmosphere shifts to a moment of reflective concern. Kathy mends the disrupted calm by apologizing for Larry’s behavior, referring to him as her \'useless brother,\' and then turns her attention to Sally with an earnest inquiry about what went wrong. This final beat of the scene captures the underlying familial tension, as the disjointed events are met with both reproach and genuine worry. The moment encapsulates the strain between humor and genuine concern, leaving the audience with a poignant glimpse into the characters\' complex relationships.',
        e.sequence = 3,
        e.key_dialogue = ["KATHY: Sorry. My useless brother. Sally? What's wrong? What's happened?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Investigative Dawn at Wester Drumlin',
        s.description = 'In this daylight sequence, the mystery deepens as Sally Sparrow and Kathy Nightingale approach the imposing gates of Wester Drumlin House. The scene is set outdoors where the atmosphere is charged with anticipation. The old, weathered estate looms in the background, its worn façade hinting at secrets buried deep within its walls. As the two friends, full of youthful bravado and investigative spirit, scale the gates, the environment – with its rugged textures and sparse, natural light – underscores both the danger and the allure of the unknown. Their witty banter hints at an impending adventure that blends mystery and light-hearted repartee with a nostalgic nod to British television wit.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_wester_drumlin_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Girls Assemble for Investigation',
        e.description = 'As the morning sun casts long shadows over the aged Wester Drumlin House, Sally Sparrow and Kathy Nightingale make their entrance by climbing the formidable gates. Their dialogue is laced with playful wit, setting a tone that is both adventurous and endearingly self-aware. Kathy eagerly declares the beginning of their detective mission, coining their joint venture with the nostalgic phrase \'Sparrow and Nightingale,\' while Sally quips in a typically understated, ‘Bit ITV.’ This moment marks the spark of their investigation, as the two friends unite their differing perspectives to unravel the secrets hidden within the derelict estate, excited for the mystery that awaits.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: Okay, let's investigate! You and me, girl investigators. Love it. Hey! Sparrow and Nightingale. That so works.", "SALLY: Bit ITV."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Haunting Entrance',
        s.description = 'In the sparse, atmospheric entrance hall of the building, muted light and subtle aged details evoke a sense of nostalgic melancholy. The worn surfaces, faded wallpaper, and delicate ambient lighting underscore the passage of time and the quiet loneliness that clings to the place. It is here that the characters briefly reveal their inner lives: Kathy, with a hint of concern and curiosity, questions the purpose behind Sally’s presence, while Sally admits that her love for the old is laced with sadness. This scene sets a reflective tone and intimates deeper emotional currents and untold stories behind cherished relics of the past.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_entrance_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Kathy’s Inquiry',
        e.description = 'In the stillness of the entrance hall, Kathy’s gentle yet probing question disrupts the quiet atmosphere. With a tone that balances concern and understated curiosity, she asks Sally about the reason for her arrival. This moment is charged with emotional subtext as it hints at the underlying dynamics between the characters and raises questions about their pasts and motivations. Kathy’s brief inquiry leaves an impression of apprehension and serves as a catalyst for revealing Sally’s deeper connection to the world of old objects and memories.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: What did you come here for anyway?"]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Sally’s Confession',
        e.description = 'Responding to Kathy’s inquiry, Sally confesses that her attraction to the old is rooted in both beauty and sadness. Her words reveal a wistful attachment to relics that evoke memories of a bygone era, suggesting that her emotional life is intertwined with the aesthetic and melancholic qualities of history itself. This confession, delivered in soft, reflective tones, deepens the character’s persona and hints at hidden burdens and personal losses. It establishes a thematic thread of nostalgia and bittersweet remembrance that will continue to shape the narrative as the story unfolds.',
        e.sequence = 2,
        e.key_dialogue = ["SALLY: I love old things. They make me feel sad."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Reflections on Melancholy',
        s.description = 'In this intimate drawing room, bathed in the soft glow of muted antique lamps, the air is thick with introspection as old melancholic echoes blend with subtle mystery. Kathy and Sally engage in a brief, yet piercing dialogue about sadness, where Kathy wonders aloud, \'What\'s good about sad?\' and Sally cryptically answers, \'It\'s happy for deep people.\' In the background, the enigmatic writing on the wall silently witnesses their exchange, its faded inscription hinting at greater secrets. After the exchange, Sally’s eyes fix on the writing before she gathers her resolve and steps out into the conservatory, drawn to the garden\'s secretive whispers. This moment bridges quiet thought with the lure of further discovery.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Debating the Nature of Sadness',
        e.description = 'In the drawing room, the emotional tension surfaces in a pointed conversation between Kathy and Sally. Kathy, with a blend of curiosity and wistfulness, asks, \'What\'s good about sad?\' This question sets the tone for a reflective dialogue, and Sally, with her subtle wit, answers, \'It\'s happy for deep people.\' Their exchange not only highlights their personal philosophies but also sets a meditative mood, underscoring a deeper emotional landscape. This philosophical query hints at the characters’ inner lives and foreshadows the mysteries that beckon beyond the familiar room.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: What's good about sad?", "SALLY: It's happy for deep people."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Pursuing the Enigma',
        e.description = 'Following the reflective conversation, Sally’s attention is irresistibly drawn to the writing on the wall. The silent message, etched with cryptic significance, calls her to seek out its hidden meaning. With a determined gaze, she studies the inscription before deciding to leave the safety of the drawing room. Her exit into the conservatory is not just a physical movement but an emotional and narrative pivot; it marks her transition from quiet contemplation to active investigation. This decision propels the unfolding mystery and hints at deeper discoveries awaiting in the garden beyond.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'The Closer Presence',
        s.description = 'In the shadowy conservatory of Wester Drumlin House, the worn elegance of decay is intermingled with a subtle, unsettling energy. Amid peeling wallpaper and soft pools of dim light, Sally Sparrow and Kathy Nightingale engage in a brief but charged exchange about an enigmatic statue – the Weeping Angel. The atmosphere is thick with foreboding as Sally’s acute observation reveals that the statue, once seemingly static, has shifted its position. Her words hint at a sinister movement, underscoring the mysterious nature of the Angel and its ominous proximity to the house. The scene quietly establishes a tension that will propel further revelations about the supernatural force at work.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_conservatory'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Revelation of the Shifting Angel',
        e.description = 'Within the silent confines of the conservatory, Sally Sparrow fixes her gaze on the enigmatic stone figure. She boldly identifies the statue as the Weeping Angel, prompting a wry remark from Kathy Nightingale about its unintentional charm in her garden. As their brief conversation unfolds, Sally reveals that the angel appears to have moved since the previous day – now ominously closer to the house. This subtle but pivotal observation infuses the scene with a sense of dread and uncertainty, hinting at the unpredictable influence of an ancient and mysterious force.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: The Weeping Angel.", "KATHY: Not bad in my garden.", "SALLY: It's moved.", "KATHY: It's what?", "SALLY: Since yesterday. I'm sure of it. It's closer. It's got closer to the house."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Mystery at the Drawing Room',
        s.description = 'In this intriguing drawing room scene, tensions and unanswered questions fill the air. Sally Sparrow is confronted with an inexplicable inscription—her own name written in a place she never expected—sparking a deep sense of disquiet and mystery. The setting is intimate yet charged with uncertainty, as the quiet domestic atmosphere is punctuated by a sudden interruption. The drawing room is a space of understated elegance, with soft lighting and familiar surroundings that now seem to hide secrets. The incident points to a disruption in the normal order, setting the stage for unexpected dangers or revelations. The inscription and sudden ringing of the doorbell create a dual narrative of personal mystery and external threat, perfectly balancing vulnerability with suspense.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'The Unsettling Inscription',
        e.description = 'In the quiet intimacy of the drawing room, Sally Sparrow is shaken by the sight of her own name inscribed unexpectedly. The mystery of this inscription triggers her astonishment and confusion, as she questions the origin and meaning behind the words written on the wall. This moment is fundamental to the scene’s tension, hinting at a breach in the ordinary while exposing a deeper enigma. The discovery not only unsettles her but also sets the narrative in motion by introducing a personal element of uncertainty that demands explanation.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: How can my name be written here? How is that possible?"]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'The Doorbell Dilemma',
        e.description = 'Immediately following the unsettling discovery, the tension heightens as the doorbell suddenly rings. The sound acts as a catalyst, drawing both Sally and Kathy into a brief yet charged exchange. Kathy questions the unexpected visitor, surmising it might be a burglar, while Sally’s incredulity underscores the surreal nature of the night. Their dialogue reflects a mix of humor and anxiety, as they navigate the peculiar situation with cautious banter. This event solidifies the scene’s dramatic pulse by juxtaposing an internal mystery with the threat from the outside, blending domestic concern with hints of impending danger.',
        e.sequence = 2,
        e.key_dialogue = ["KATHY: Who'd come here? What are you doing? It could be a burglar.", "SALLY: A burglar who rings the doorbell?", "KATHY: Okay. I'll stay here in case of", "SALLY: In case of?", "KATHY: Incidents?", "SALLY: Okay."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Mysterious Arrival at the Front Door',
        s.description = 'At the front door of a weathered building, tension and uncertainty hang in the cool evening air. The scene unfolds as Malcolm arrives with an ancient letter in hand, speaking in measured tones about an appointment that seems preordained. Sally Sparrow, ever alert and a bit apprehensive, questions his knowledge of her whereabouts, revealing her guarded nature. The exchanged dialogue, laden with clues about the cryptic past, hints at a deeper mystery tied to forgotten photographs and documents. Meanwhile, offstage, Kathy is alerted by a strange noise and begins to investigate, adding a subtle layer of suspense. The scene serves as the narrative’s pivot, setting the tone for revelations to come and emphasizing themes of fate and discovery.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_front_door'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'A Cryptic Entrance and Inquiry',
        e.description = 'Malcolm steps up to the front door with a purposeful air, announcing his presence with a carefully worded greeting that signals more than a casual visit. Immediately, he declares he is looking for Sally Sparrow, prompting a surprised yet cautious response from Sally. Their brief yet loaded exchange sets an eerie, mythic tone: Sally is left wondering at Malcolm’s uncanny awareness of her location, as hints of destiny and secret messages emerge. This initial event establishes both the connection between the characters and the enigmatic force driving their meeting.',
        e.sequence = 1,
        e.key_dialogue = ["MALCOLM: I'm looking for Sally Sparrow.", "SALLY: How did you know I'd be here?"]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'The Enigmatic Letter and Unsettling Clues',
        e.description = 'In the second dramatic beat, Malcolm explains his mandate to deliver a mysterious, ancient letter – a document imbued with hidden implications and historical weight. Sally’s reaction indicates both intrigue and residual skepticism as she notes the aged appearance of the letter. Malcolm then inquires if she possesses an item with a photograph on it, such as a driving licence, suggesting that the document may be linked to identity verification or deeper secrets from the past. Meanwhile, a stage direction hints that Kathy, though not directly involved in the dialogue, is drawn by a noise and begins her investigation, thereby enhancing the overall tension and foreshadowing future conflict.',
        e.sequence = 2,
        e.key_dialogue = ["MALCOLM: I was told to bring this letter on this date at this exact time to Sally Sparrow.", "SALLY: Looks old.", "MALCOLM: It is old. I'm sorry, do you have anything with a photograph on it, like a driving licence?"]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Unsettling Secrets in the Conservatory',
        s.description = 'In the dim light of the conservatory, the aged grandeur of Wester Drumlin House looms in every fading detail. Overgrown vines curl along cracked stone and weathered plaster, as melancholic lamplight reveals long-forgotten relics. An ancient statue of a Weeping Angel stands unexpectedly close to the house, its presence both foreboding and curious. The air is thick with mystery and subdued tension. Sally Sparrow voices her disbelief in a hushed tone, questioning how her arrival could have possibly been anticipated. Meanwhile, Malcolm offers a perplexed response, admitting his own inability to fully understand the situation. In a subtle but striking moment, Kathy turns away and the statue’s hands lower from its eyes, adding an eerie, almost sentient quality to the scene that hints at hidden forces at work.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_conservatory'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Confronting the Unseen Clues',
        e.description = 'Sally Sparrow’s whispered inquiry fills the air as she questions the uncanny foresight that led someone to know of her impending arrival. Her voice trembles with the mix of curiosity and trepidation that the night has stirred within her. Malcolm steps in with a tone of reluctant confession, remarking on the overwhelming complexity of the moment—a complexity that neither of them fully comprehends. As they exchange these lines, the atmosphere is punctuated by the ominous presence of the statue. The Weeping Angel, positioned unexpectedly close to the house, underscores the moment with a subtle shift: its hands lower from its eyes while Kathy, in quiet resignation, turns her back. This event plants the seeds of a broader mystery and deepens the emotional tension that drives the narrative forward.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY [OC]: How did he know I was coming here? I didn't tell anyone. How could anyone have known?", "MALCOLM [OC]: It's all a bit complicated. I'm not sure I understand it myself."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'Front Door Mysteries Unfold',
        s.description = 'At the threshold of an old building, the mood is set by a hesitant yet compelling exchange between Malcolm and Sally. The scene takes place primarily at the front door, even as hints of a deeper mystery are evoked by a statue quietly stationed inside the conservatory. The atmosphere is laced with uncertainty and a dash of humor as Malcolm apologizes for his nervousness while scrutinizing delicate, little photographs. This brief encounter serves as both an introduction to a long-hidden story and a subtle invitation into secrets that have endured over the years. The dialogue suggests that past events and mysterious correspondences are about to surface, establishing a tone of both intrigue and foreboding.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_front_door'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Malcolm’s Self-Conscious Disclosure',
        e.description = 'At the front door, Malcolm initiates the interaction with a self-deprecating remark about the small photographs in his possession. He admits his unease and embarrassment in ensuring everything is in order, his words blending worry with a subtle humor. Sally’s brief interjection of \'Apparently\' hints at her awareness and understated support, while also opening the door for further inquiry. This early moment sets a tone of informal intimacy and shared mystery between the two, while also hinting at the underlying significance of the artifacts they hold.',
        e.sequence = 1,
        e.key_dialogue = ["MALCOLM: I'm sorry, I feel really stupid, but I was told to make absolutely sure. It's so hard to tell with these little photographs, isn't it?", "SALLY: Apparently."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Revealing a Mysterious Sender',
        e.description = 'Continuing their conversation at the threshold, Malcolm bravely ventures further into an explanation, remarking on the strange feelings that have haunted him all these years. Sally, with a mix of curiosity and urgency, presses him to reveal the identity behind the mysterious photographs—demanding a name that might unlock the secrets of the past. Their exchange evokes a sense of forgotten history and imminent revelation, underscoring the emotional weight and enigmatic allure of the legacy that Malcolm carries. Meanwhile, the presence of a weeping angel statue quietly positioned in the conservatory adds a layer of haunting symbolism to the moment.',
        e.sequence = 2,
        e.key_dialogue = ["MALCOLM: Well, here goes, I suppose. Funny feeling, after all these years.", "SALLY: Who's it from?", "MALCOLM: Well, that's a long story, actually.", "SALLY: Give me a name."]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'Revelation in the Drawing Room',
        s.description = 'In the quiet intimacy of a vintage drawing room, shadows and soft ambient lighting merge with the weight of history. Antique furniture and subtle décor evoke lingering memories and secrets. The stage is set for a critical reveal as Malcolm, the composed messenger, breaks the silence with an enigmatic disclosure. His measured words, referring to Katherine Wainwright, hint at long-hidden connections and past promises. Behind Kathy, an eerie statue of the Weeping Angel looms ominously, its stone hand reaching forward as if to underscore the danger and mystery that shade every corner of this room. The scene plays a crucial role in deepening the narrative’s tension and connecting the past with present revelations.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Malcolm Reveals the Hidden Identity',
        e.description = 'In this pivotal moment within the drawing room, Malcolm steps forward as the bearer of a cryptic message. He calmly announces the name \'Katherine Wainwright,\' and then adds that she specifically instructed him to mention a detail prior to her marriage. His revelation carries a sense of urgency and foreboding, weaving past secrets into the present narrative. Concurrently, a silent but unsettling stage direction frames the scene—a stone Weeping Angel, its hand reaching behind Kathy, symbolizing the lurking menace and unresolved mysteries that continue to haunt the characters.',
        e.sequence = 1,
        e.key_dialogue = ["MALCOLM [OC]: Katherine Wainwright.", "MALCOLM [OC]: But she specified I should tell you that prior to marriage"]
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'Front Door Revelation',
        s.description = 'At the front door of a mysterious building, the air is tense yet laced with dark humor. Malcolm steps forward to clarify a perplexing detail about identity. He calmly states that the person in question was known as Kathy Nightingale, but insists on her true identity: Katherine Costello Nightingale. A sudden bang punctuates the moment, drawing an immediate reaction from Sally, whose startled inquiry ‘Kathy?’ is met with Malcolm’s measured confirmation. As the conversation unfolds, Sally questions the absurdity of the revelation with disbelief and a hint of mirth, deepening the mystery and highlighting the interplay between identity and fate.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_front_door'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Revelation of Kathy\'s True Identity',
        e.description = 'At the front door, Malcolm initiates a crucial exchange by revealing that the individual everyone refers to as Kathy Nightingale is, in fact, known by her full name, Katherine Costello Nightingale. The dramatic punctuation of a loud \'Bang!\' sets the stage for an intense moment as Sally, caught off guard, utters a single word—\'Kathy?\'—reflecting her shock and confusion. As Malcolm confirms with calm authority and Sally counters with incredulous humor by asking if it’s a joke, the dialogue conveys an undercurrent of mystery and tension, leaving the audience to ponder the true nature of the identity in question and its implications for what comes next.',
        e.sequence = 1,
        e.key_dialogue = ["MALCOLM: She was called Kathy Nightingale.", "SALLY: Kathy?", "MALCOLM: Kathy, yes. Katherine Costello Nightingale.", "SALLY: Is this a joke?", "MALCOLM: A joke?", "SALLY: Kathy, is this you? Very funny."]
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'Echoes from the Past',
        s.description = 'In this enigmatic scene set in the drawing room, the past and present collide with eerie subtlety. The mood is one of quiet tension and mystery as Sally’s urgent call for Kathy reverberates through the room. Outside, the haunting presence of the Weeping Angel statue—with its hands covering its eyes—reinforces the weight of unseen warnings from another time. As the camera briefly shifts to a nearby field with grazing cows, Kathy rises, her emergence hinting at a long-awaited reappearance. Amidst this surreal atmosphere, Malcolm steps forward with an undeniable urgency, urging the delivery of a long-promised message that promises to bind the fates of those present.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Sally’s Desperate Call',
        e.description = 'Inside the drawing room, Sally Sparrow’s voice trembles with urgency as she repeatedly calls out for Kathy. The atmosphere is thick with anticipation. Outside, the familiar Weeping Angel statue appears once again with its mysterious, covered eyes—a silent yet potent symbol of warning. As Sally’s plea echoes in the quiet space, the stage direction indicates that Kathy is already stirring, rising in a nearby field among grazing cows. This moment sets the tone by uniting the spectral with the human, blending surreal elements with raw emotional need.',
        e.sequence = 1,
        e.key_dialogue = ["Kathy?", "Kathy? Kathy!"]
    ;
MERGE (e:Event {uuid: 'event_17_2'})
    ON CREATE SET
        e.title = 'Malcolm’s Urgent Message',
        e.description = 'In the wake of Sally’s fervent calls, Malcolm intervenes with an air of resigned urgency. His tone is unmistakably urgent as he insists that an important promise must be fulfilled. There is an unspoken weight behind his brief statement, suggesting that the item or message he refers to holds the key to unraveling long-held mysteries. Although Kathy has just emerged, Malcolm’s presence and his terse command create a dramatic pivot in the scene that underscores the deep, intertwined fates of those involved.',
        e.sequence = 2,
        e.key_dialogue = ["Please, you need to take this. I promised."]
    ;
MERGE (s:Scene {uuid: 'scene_18'})
    ON CREATE SET
        s.title = 'Confusion in the Field',
        s.description = 'In a rustic field near grazing cows, a young man in a cloth cap sits on a dry stone wall enjoying an apple and reading a copy of The Hull Times. The atmosphere is calm yet edged with a hint of disorientation as Kathy suddenly enters the scene, distraught and confused. She insists that she was in London, not in this quiet countryside. Her repeated protestations clash with Ben’s persistent insistence that they are in Hull. The dialogue crackles with tension as the two debate the reality of their location—a moment that encapsulates the mysterious interplay of memory and perception within the larger narrative.',
        s.scene_number = 18
    
    WITH s
    MATCH (l:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_18_1'})
    ON CREATE SET
        e.title = 'Heated Location Dispute',
        e.description = 'In the open field, the scene shifts to a tense, yet slightly absurd exchange between Kathy and Ben regarding their whereabouts. Kathy, disoriented and adamant, questions her location by insisting she was in the thick of London. Ben calmly and repeatedly insists that they are, in fact, in Hull. The dialogue escalates with Kathy pleading for Ben to stop asserting that she is in Hull, while Ben maintains that the evidence is clear. This confrontation serves as a pivotal moment of character expression, revealing Kathy’s inner conflict and Ben’s matter-of-fact demeanor amidst an environment that feels both rural and out-of-time.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: Excuse me? Where am I? I was in London. I was in the middle of London.", "BEN: You're in Hull.", "KATHY: No, I'm not.", "BEN: This is Hull.", "KATHY: No, it isn't.", "BEN: You're in Hull.", "KATHY: I'm not in Hull. Stop saying Hull."]
    ;
MERGE (s:Scene {uuid: 'scene_19'})
    ON CREATE SET
        s.title = 'Entrance Confrontation',
        s.description = 'In the cool, shadowed recesses of the entrance hall, the air is heavy with mystery and quiet intensity. The scene unfolds at this singular moment as Sally Sparrow confronts Malcolm with a mixture of curiosity and apprehension. The austere setting, with echoes of footsteps and muted lighting, frames a brief but charged exchange. Sally questions Malcolm’s presence and purpose, while Malcolm reveals that his presence is driven by a solemn promise made to his grandmother, Katherine Costello Nightingale. This conversation sets the stage for deeper revelations as the narrative hints at unresolved past commitments and the weight of inherited secrets.',
        s.scene_number = 19
    
    WITH s
    MATCH (l:Location {uuid: 'location_entrance_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_19_1'})
    ON CREATE SET
        e.title = 'Promise Unveiled',
        e.description = 'In the hushed atmosphere of the entrance hall, Sally’s inquisitive nature leads her directly to Malcolm, triggering an exchange laden with mystery. With a direct inquiry, she asks who he is and what brings him to this isolated place. Malcolm responds with measured resolve, stating that he made a promise, which piques Sally’s curiosity even further. When pressed about the nature of this promise, Malcolm reveals that it is one made to his grandmother, Katherine Costello Nightingale. This revelation not only hints at hidden family ties and obligations but also sets a foreboding tone that underscores the scene’s thematic elements of duty and legacy.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Who are you? Why are you here?", "MALCOLM: I made a promise.", "SALLY: Who to?", "MALCOLM: My grandmother. Katherine Costello Nightingale."]
    ;
MERGE (s:Scene {uuid: 'scene_20'})
    ON CREATE SET
        s.title = 'A Glimpse of Bygone Times in the Field',
        s.description = 'In a serene, open field near grazing cows, under a vast sky, the mundane collides with the mysterious. The setting is lush and slightly windswept, with the muted rustling of grass and distant lowing of cows creating a natural, pastoral soundtrack. Amid this idyllic backdrop, the scene takes an unexpected turn when Ben reveals an old newspaper – The Hull Times – with a striking date of 5th December 1920. The revelation instantly intrigues Kathy as she questions the seeming anachronism, hinting at a subtle disturbance in the flow of time. This brief encounter not only establishes temporal dissonance but also deepens the mystery surrounding their journey, bridging the gap between the present and a long-forgotten past.',
        s.scene_number = 20
    
    WITH s
    MATCH (l:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_20_1'})
    ON CREATE SET
        e.title = 'Newspaper Revelation in the Field',
        e.description = 'In the quiet ambiance of the field, Ben holds up an aged copy of The Hull Times, drawing Kathy’s attention to an intriguing piece of printed news. As he explains that the newspaper is unique to Hull and not something one would find in London, the paper’s date – 5th December 1920 – is revealed. Kathy’s startled response, questioning \"1920?\", underscores the temporal dissonance at work. This moment not only raises questions about the nature of time and place but also hints at unresolved mysteries that continue to link past events with the present, setting the stage for further revelations.',
        e.sequence = 1,
        e.key_dialogue = ["BEN: Don't have that in London. There's no call for it. It's all Hull.", "KATHY: 1920?"]
    ;
MERGE (s:Scene {uuid: 'scene_21'})
    ON CREATE SET
        s.title = 'Revealing Family Ties',
        s.description = 'In the quiet hum of an Entrance Hall, the weight of the past is palpably felt. Sally Sparrow stands before a timeworn envelope filled with old photographs that hint at buried family secrets. The atmosphere is charged with anticipation as Sally delicately opens the envelope, each photograph a window to a forgotten era. The scene unfolds in the sparse light of the Entrance Hall, emphasizing the nostalgic decay and mystery of the family lineage. Amid subtle auditory cues and minimalist set design, the dialogue solidifies the connection as Sally and Malcolm discuss the striking resemblance between a woman in the photographs and a family member, advancing the narrative of intergenerational identity and loss.',
        s.scene_number = 21
    
    WITH s
    MATCH (l:Location {uuid: 'location_entrance_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_21_1'})
    ON CREATE SET
        e.title = 'The Envelope Revelation',
        e.description = 'Sally Sparrow initiates a moment of discovery by opening an aged envelope containing old photographs. As the photos are revealed, the conversation unfolds between Sally and Malcolm about a mysterious familial resemblance. Sally’s query about the photographs sparks the dialogue that confirms the woman depicted is Malcolm’s grandmother, a figure known as Kathy. The dialogue carries an emotional mix of surprise and sadness, setting the tone for deeper explorations of family heritage and lost connections. This event subtly shifts the narrative focus towards understanding the legacy hidden in these tangible remnants of the past.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Your grandmother?", "MALCOLM: Yes. She died twenty years ago.", "SALLY: So they're related?", "MALCOLM: I'm sorry?", "SALLY: My Kathy, your grandmother. They're practically identical."]
    ;
MERGE (s:Scene {uuid: 'scene_22'})
    ON CREATE SET
        s.title = 'Field',
        s.description = 'In this evocative outdoor scene set on a sprawling field near grazing cows, the natural beauty of a rustic landscape contrasts with an undercurrent of urgency. The gentle sway of tall grasses and the low murmur of distant cattle amplify the sense of isolation, as expansive skies and open space frame the moment. Here, Kathy dashes down a grassy hill in a burst of determined movement, her actions imbued with emotional tension and hinting at an imminent change in her journey. Ben, filled with concern and resolve, follows closely behind, calling out, \'Where are you going?\' This brief yet charged moment sets the stage for deeper relational dynamics and future narrative turns, highlighting themes of escape, pursuit, and the inevitable collision of personal desires with responsibility.',
        s.scene_number = 22
    
    WITH s
    MATCH (l:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_22_1'})
    ON CREATE SET
        e.title = 'Ben\'s Pursuit of Kathy',
        e.description = 'In the heart of the open field, Kathy launches into a rapid sprint down the hill, her actions speaking of urgency and determination. As she disappears into the vast, sunlit landscape, Ben’s worry propels him into action. He calls out in a mix of alarm and care, \'Where are you going?\' His voice cuts through the quiet rustle of wind and the distant lowing of cows, emphasizing the emotional tension of the moment. This event succinctly captures the stark contrast between Kathy’s need for escape and Ben’s commitment to follow, setting a tone of anticipation that hints at deeper underlying conflicts and changes in their journey.',
        e.sequence = 1,
        e.key_dialogue = ["Where are you going?"]
    ;
MERGE (s:Scene {uuid: 'scene_23'})
    ON CREATE SET
        s.title = 'Whispers on the Landing',
        s.description = 'In the eerie stillness of the Entrance Hall, the weight of the past and a chilling mystery collide. Sally Sparrow sits alone, reading a fragile, time-worn letter accompanied by old photographs, with the poignant, ghostly voice of Kathy Nightingale echoing in her mind. Overwhelmed by a sense of dread and disbelief—exclaiming that what she has just learned is utterly sick—Sally throws the documents down and flees upstairs. On the landing, three haunting statues stand sentinel, each concealing its eyes in peculiar ways. One statue clutches a Yale key on a chain. As Sally crouches to inspect it, the statue behind her suddenly reveals its eyes before hastily concealing them again. In a split second, she snatches the key and, hearing the front door slam shut, darts back downstairs. Outside, Malcolm is seen approaching as Sally gathers the scattered photographs and letter pieces left on the banister rail, while the statues silently observe her every move from the windows.',
        s.scene_number = 23
    
    WITH s
    MATCH (l:Location {uuid: 'location_entrance_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_23_1'})
    ON CREATE SET
        e.title = 'The Haunting Letter',
        e.description = 'Sally Sparrow sits in the dim light of the Entrance Hall and reads a mysterious letter accompanied by a set of faded photographs. The letter, penned in an urgent tone by Kathy Nightingale, reveals a deep connection and a cryptic message about lost time and bitter secrets. As Kathy’s voice resonates in her mind, the ominous words leave Sally shaken—she murmurs in disbelief that the contents are sick beyond measure. Overcome by a mix of horror and urgency, Sally abruptly throws down the documents and makes the decision to flee the room.',
        e.sequence = 1,
        e.key_dialogue = ["My dearest Sally Sparrow. If my grandson has done as he promises he will, then as you read these words it has been mere minutes since we last spoke. For you. For me, it has been over sixty years.", "This is sick. This is totally sick."]
    ;
MERGE (e:Event {uuid: 'event_23_2'})
    ON CREATE SET
        e.title = 'The Desperate Staircase Dash',
        e.description = 'In a state of panic after reading the unnerving letter, Sally dashes up the winding staircase. Her voice trembles as she repeatedly calls out for Kathy, desperate for answers, and driven by an instinct to escape the unsettling aura of the room. The urgency in her footsteps and her fragmented dialogue signal an escalation as the mystery deepens and the pressure mounts.',
        e.sequence = 2,
        e.key_dialogue = ["Kathy? Kathy! Kathy?"]
    ;
MERGE (e:Event {uuid: 'event_23_3'})
    ON CREATE SET
        e.title = 'Encounter with the Weeping Statues',
        e.description = 'At the landing of the staircase, the tension reaches a palpable peak as three eerie statues, ominously arranged, occupy the space. Each statue hides its eyes in its own uncanny manner. One statue, in particular, holds a Yale key on a chain. As Sally cautiously crouches to examine the key, the statue behind her briefly unveils its eyes before swiftly concealing them again. In that fleeting, heart-stopping moment, Sally seizes the Yale key. The supernatural atmosphere is amplified by the sudden sound of the front door closing, compelling her to abruptly reverse her direction.',
        e.sequence = 3,
        e.key_dialogue = ["No, wait! Hang on!"]
    ;
MERGE (e:Event {uuid: 'event_23_4'})
    ON CREATE SET
        e.title = 'Malcolm’s Arrival and the Silent Witnesses',
        e.description = 'The dramatic tension intensifies as Sally, key in hand, hears the sound of the front door slam shut. In a final burst of urgency, she races back downstairs, narrowly eluding the grasp of the statue that held the key. As she reaches the ground floor, Malcolm is seen descending the driveway. Without pausing, Sally quickly collects the scattered photographs and the letter that lie forgotten on the banister rail. Outside, the ever-watchful statues continue to silently observe her departure from the Entrance Hall, their presence a chilling reminder of the mysteries that lie in wait.',
        e.sequence = 4,
        e.key_dialogue = ["No, wait! Hang on!"]
    ;
MERGE (s:Scene {uuid: 'scene_24'})
    ON CREATE SET
        s.title = 'Cafe Contemplation',
        s.description = 'In the subdued glow of a modest cafe, Sally Sparrow sits quietly at a small table, immersed in the soft rustle of paper as she reads an old, poignant letter. The setting is intimate yet reflective, with muted ambient sounds of cups clinking and quiet murmurs in the background. The atmosphere carries both a sense of nostalgia and tender melancholy as Sally connects with a memory of her dear friend Kathy, whose off-screen voice conveys decades of lived experience and bittersweet reflections. This scene bridges the present with a past filled with love, loss, and enduring legacy, setting the stage for deeper revelations about friendship and time.',
        s.scene_number = 24
    
    WITH s
    MATCH (l:Location {uuid: 'location_cafe'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_24_1'})
    ON CREATE SET
        e.title = 'Revelation of the Past',
        e.description = 'In the quiet ambience of the cafe, Sally pores over an ancient letter filled with photographs and handwritten memories. As her eyes trace every word, the voice of Kathy, heard off-screen, begins to narrate her life story. Kathy reflects on a life well-lived, sharing details of her cherished love for a man named Ben whom she met in 1920. This heartfelt monologue transforms the act of reading into a powerful moment of introspection and emotional connection, as Sally absorbs the gravity of a history steeped in love, loss, and the inexorable passage of time.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY [OC]: I suppose, unless I live to a really exceptional old age, I will be long gone as you read this. Don't feel sorry for me. I have led a good and full life. I've loved a good man and been well loved in return. You would have liked Ben. He was the very first person I met in 1920."]
    ;
MERGE (s:Scene {uuid: 'scene_25'})
    ON CREATE SET
        s.title = 'A Brief Exchange in the Grazing Field',
        s.description = 'In a quiet, open field near grazing cows, Kathy Nightingale and Ben engage in a brief but telling exchange. The natural daylight and expansive scenery provide a stark backdrop to their conversation. The setting is simple and unadorned, emphasizing the intimacy and subtle tension of the moment. Kathy’s tone carries a mix of bemusement and inquiry as she questions Ben’s presence and intentions. Ben’s responses are equally casual, reinforcing a dynamic where the unspoken history and the curiosity of their interaction linger in the open air. This scene serves as a moment of light narrative pause amidst the ongoing twists of the story.',
        s.scene_number = 25
    
    WITH s
    MATCH (l:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_25_1'})
    ON CREATE SET
        e.title = 'A Question and Answer in the Field',
        e.description = 'Kathy initiates the conversation by asking Ben if he is following her, setting the tone for a subtle confrontation. Ben’s reply, a simple acknowledgment, establishes their rapport. Kathy further probes by asking if he intends to stop following her, indicating both curiosity and a light-hearted challenge. Ben’s relaxed response, expressing that he does not plan to, reinforces the casual yet intriguing nature of their relationship. The dialogue, though minimal, hints at a deeper relational dynamic and leaves the audience reflecting on the importance of following and being followed in the unfolding narrative.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: Are you following me?", "BEN: Yeah.", "KATHY: Are you going to stop following me?", "BEN: No, I don't think so."]
    ;
MERGE (s:Scene {uuid: 'scene_26'})
    ON CREATE SET
        s.title = 'Grave Reflections',
        s.description = 'In a quiet, timeworn cemetery under a muted sky, Sally Sparrow pays homage at the final resting place of Ben and Kathy. The aged tombstones, marked by the passage of time, whisper memories of bygone eras and promise of new beginnings. Here, the silence is broken only by the soft rustle of leaves and Sally’s measured footsteps, as she contemplates the laconic yet powerful inscription. Kathy’s words echo from beyond, hinting at shifting epochs and bittersweet truths about love, loss, and legacy. Amid this reflective solitude, a silent cemetery statue watches over her farewell, symbolizing stoic endurance and the inexorable march of time.',
        s.scene_number = 26
    
    WITH s
    MATCH (l:Location {uuid: 'location_cemetery'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_26_1'})
    ON CREATE SET
        e.title = 'Echoes of a Timeworn Vow',
        e.description = 'Sally stands before the weathered grave, absorbing the cryptic message etched in stone—a melding of past and present that challenges the boundaries of time. Kathy\'s voice, immortalized in the inscription, muses on the oddity of life\'s transitions; one breath in 2007 and the next in 1920, a juxtaposition that both haunts and inspires. As Sally reads the words aloud to herself, the dialogue sparks a blend of wistfulness and irony. The playful accusation regarding age underscores the mixture of humor and heartbreak in these memories, drawing Sally into a personal confrontation with a legacy that transcends years.',
        e.sequence = 1,
        e.key_dialogue = ["KATHY: To take one breath in 2007 and the next in 1920 is a strange way to start a new life, but a new life is exactly what I've always wanted.", "SALLY: 1902? You told him you were eighteen? You lying cow.", "KATHY: My mum and dad are gone by your time, so really there's only Lawrence to tell. He works at the DVD store on Queen Street. I don't know what you're going to say to him, but I know you'll think of something. Just tell him I love him."]
    ;
MERGE (e:Event {uuid: 'event_26_2'})
    ON CREATE SET
        e.title = 'Silent Witness and Farewell',
        e.description = 'After the heavy words of the past have settled, Sally gently lays down a fresh bouquet at the grave. In this quiet act of remembrance, she gathers the courage to bid farewell to a memory that is both tender and unsolvable. As she turns to leave, the ever-present cemetery statue looms in the background—a silent, stoic guardian watching over the departed and the living alike. Its unyielding gaze encapsulates the enduring inevitability of time and the bittersweet nature of loss, as Sally departs the scene with mixed resolve and lingering melancholy.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_27'})
    ON CREATE SET
        s.title = 'Inquiry at Banto\'s DVD Store',
        s.description = 'Inside Banto\'s DVD Store, a niche retail outlet offering new, second-hand, and rare DVDs, the atmosphere is understated yet charged with subtle tension. A television mounted on the wall displays a shootout scene from a film, adding to the edgy vibe of the location. At the counter, a bearded man named Banto is absorbed in the movie. In this scene, Sally Sparrow enters with a determined air, seeking information about Lawrence Nightingale. Her inquiry sets the stage for impending revelations, underscoring the interplay between mystery and urgency that propels the narrative forward.',
        s.scene_number = 27
    
    WITH s
    MATCH (l:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_27_1'})
    ON CREATE SET
        e.title = 'Sally Inquires About Lawrence',
        e.description = 'Sally Sparrow walks up to the counter in Banto\'s DVD Store with clear purpose. After glancing at the television where an action sequence is playing, she addresses Banto directly to ask for Lawrence Nightingale. Banto, seemingly unruffled by her approach and the film running in the background, directs her to check through the back of the store. This brief exchange not only provides a clue for Sally’s next move but also subtly hints at the labyrinthine connections and surprises that lie ahead in the narrative.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Excuse me, I'm looking for Lawrence Nightingale.", "BANTO: Through the back."]
    ;
MERGE (s:Scene {uuid: 'scene_28'})
    ON CREATE SET
        s.title = 'Revelations in the Back Room',
        s.description = 'In a cramped, dimly lit back room with flickering fluorescent lighting and the faint hum of old electronics, the atmosphere is charged with mystery and half-forgotten secrets. A dusty DVD playback screen displays the image of the Doctor, intercut with brief appearances by Martha, setting an enigmatic tone. Sally Sparrow initiates the conversation with a tentative greeting, only to be joined by Larry Nightingale as he enters from the far end of the room. Their exchange—filled with casual banter, unexpected revelations about a cryptic message from Sally’s missing sister, and an explanation of a hidden DVD Easter egg spanning seventeen titles—melds low-key humor with urgent intrigue. This scene, a microcosm of layered temporal puzzles and intertextual nods, deepens the narrative’s thematic preoccupations with time, fate, and uncanny coincidences.',
        s.scene_number = 28
    
    WITH s
    MATCH (l:Location {uuid: 'location_back_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_28_1'})
    ON CREATE SET
        e.title = 'Initial Contact and Cryptic Screen Dialogue',
        e.description = 'Sally Sparrow stands in the back room as the screen comes alive with the Doctor’s image. The scene opens with a simple greeting as Sally says \'Hello?\' The screen briefly shows Martha before the Doctor delivers a sparse, enigmatic line mentioning \'Thirty eight.\' The interplay between the digital message and the ambient setting sets a surreal tone, hinting at larger mysteries and the peculiar mechanics of time. The sparse set design and dim lighting amplify the looming sense of uncertainty, creating a quiet moment of anticipation before further revelations unfold.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Hello?", "DOCTOR [on screen]: Martha.", "MARTHA [on screen]: Sorry.", "DOCTOR: Quite possibly. Afraid so.", "DOCTOR: Thirty eight."]
    ;
MERGE (e:Event {uuid: 'event_28_2'})
    ON CREATE SET
        e.title = 'Larry\'s Entrance and the Sister\'s Message',
        e.description = 'As the initial digital dialogue fades, Larry Nightingale steps into the scene, interrupting the playback. He pauses the DVD screen and initiates a familiar, slightly awkward reunion with Sally, hinting that they have met before. The conversation quickly shifts to a mysterious, personal message from Sally’s sister—a message that reveals her sister’s parting words are a simple declaration of love. The interplay of casual small talk with the weight of personal revelation deepens the emotional complexity and sets the stage for unraveling deeper mysteries.',
        e.sequence = 2,
        e.key_dialogue = ["LARRY: Oh. Hello. Can I help you?", "SALLY: Hi.", "LARRY: Hang on. We've met, haven't we?", "SALLY: It'll come to you.", "LARRY: Oh, my God.", "SALLY: Message from your sister.", "LARRY: Oh! Okay. What? What is it? What's the message?", "SALLY: She's had to go away for a bit.", "LARRY: Where?", "SALLY: Just a work thing. Nothing to worry about.", "LARRY: And what?", "SALLY: She loves you."]
    ;
MERGE (e:Event {uuid: 'event_28_3'})
    ON CREATE SET
        e.title = 'The Hidden Easter Egg Explanation',
        e.description = 'Following the personal revelation, the dialogue pivots towards an esoteric discussion of hidden messages and quirky DVD extras. Larry explains that the mysterious figure on the screen—seen during the previous dialogue—occasionally appears as an unexpected bonus, much like an Easter egg on DVDs. He elaborates that this figure is present on a total of seventeen unrelated DVDs, always emerging as a concealed extra, the origin of which is shrouded in mystery. This technical and humorous breakdown not only provides comic relief but also deepens the thematic interplay of fate and randomness in the narrative.',
        e.sequence = 3,
        e.key_dialogue = ["SALLY: Who is this guy?", "LARRY: Sorry, the pause thing keeps slipping. Stupid thing.", "SALLY: Last night at Kathy's, you had him on all those screens. That same guy. Talking about, I don't know, blinking or something.", "LARRY: Yeah, the bit about the blinking's great. I was just checking to see if they were all the same.", "SALLY: What were the same? What is this? Who is he?", "LARRY: An Easter egg.", "SALLY: Excuse me?", "LARRY: Like a DVD extra, yeah? You know how on DVDs they put extras on, documentaries and stuff? Well, sometimes they put on hidden ones, and they call them Easter eggs. You have to go looking for them. Follow a bunch of clues on the menu screen.", "DOCTOR [on screen]: Complicated.", "LARRY: Sorry. It's interesting, actually. He is on seventeen different DVDs. There are seventeen totally unrelated DVDs, all with him on. Always hidden away, always a secret."]
    ;
MERGE (e:Event {uuid: 'event_28_4'})
    ON CREATE SET
        e.title = 'Temporal Banter and the List Revelation',
        e.description = 'As the conversation digresses into quirky musings on time—illustrated by the Doctor\'s offhand comments about its non-linear, wibbly-wobbley nature—tensions and humorous exasperation mount. Sally expresses her mounting frustration after a long day of inexplicable events, and in a moment of resigned acceptance, Larry reveals a tangible clue: the list of seventeen DVDs. This list, a physical object that encapsulates the cryptic clues discussed, promises to be a key element in unraveling the greater mystery. The brief banter underlines the characters\' weariness while also reaffirming their commitment to decipher the puzzle before them.',
        e.sequence = 4,
        e.key_dialogue = ["SALLY: Started well, that sentence.", "DOCTOR [on screen]: It got away from me, yeah.", "SALLY: Okay, that's weird. Like you can hear me.", "DOCTOR: Well, I can hear you.", "SALLY: Okay, that's enough. I've had enough now. I've had a long day and I've had bloody enough! Sorry. Bad day.", "LARRY: Got you the list.", "SALLY: What?", "LARRY: The seventeen DVDs. I thought you might be interested.", "SALLY: Yeah, great. Thanks."]
    ;
MERGE (s:Scene {uuid: 'scene_29'})
    ON CREATE SET
        s.title = 'Banto’s Provoking Proclamation',
        s.description = 'Inside Banto\'s DVD Store, the atmosphere is charged with an undercurrent of exasperation and dark humor. The cramped retail space displays rows of eclectic DVDs and secondhand treasures, lending the scene a quirky yet foreboding air. Amid the dusty shelves and flickering screens, Banto, the disillusioned store agent, delivers a biting remark that cuts through the mundane. His words, questioning why no one takes matters to the police, serve as a stark reminder of the chaos that underlies the everyday. The moment is brief yet pivotal, hinting at larger mysteries beyond the store’s walls.',
        s.scene_number = 29
    
    WITH s
    MATCH (l:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_29_1'})
    ON CREATE SET
        e.title = 'Banto’s Sharp Reproach',
        e.description = 'In the middle of the cramped DVD store, Banto directs his bitter frustration towards an unseen character. His voice rings out clearly as he admonishes, questioning why someone hasn\'t taken the obvious step of going to the police. This event highlights the tension of the moment, intertwining both humor and irritation as he delivers his unexpectedly blunt message. The dialogue underscores the peculiar blend of mundane retail routine and the surreal undercurrents running through the narrative, setting the stage for an unfolding mystery.',
        e.sequence = 1,
        e.key_dialogue = ["Go to the police, you stupid woman.", "Why does nobody ever just go to the police?"]
    ;
MERGE (s:Scene {uuid: 'scene_30'})
    ON CREATE SET
        s.title = 'Vanishing Statues and Sudden Arrivals',
        s.description = 'Inside a gloomy police station, Sally Sparrow explains her unsettling discovery about Wester Drumlin House. The scene opens with Sally insisting she isn’t mad even as she recounts the dilapidated state of the house and its eerie presence on the outskirts of an estate. Seated at a sterile, dimly lit front desk, Sally voices her bewilderment to a cautious Desk Sergeant. After a brief exchange where the Sergeant asks her to start over, Sally steps away and catches sight of two mysterious statues at a nearby church. In a blink of an eye, the statues vanish, intensifying her anxiety and the mystery. Soon after, DI Billy Shipton makes a sudden appearance, his hurried manner adding further tension as he excuses himself and mumbles a message to an unseen Marcie. This sequence firmly establishes the eerie atmosphere and the ongoing investigation into the strange events at Wester Drumlin House.',
        s.scene_number = 30
    
    WITH s
    MATCH (l:Location {uuid: 'location_police_station'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_30_1'})
    ON CREATE SET
        e.title = 'Sally’s Eerie Description and the Disappearing Statues',
        e.description = 'At the police station front desk, Sally Sparrow, in an anxious yet determined tone, explains the mystery of Wester Drumlin House. She describes the ancient, empty structure on the outskirts of the estate, emphasizing its decay and desolation. During her conversation with the Desk Sergeant, she recounts a strange occurrence: after the Sergeant leaves her to wait, Sally glances out the window to see two statues positioned on the church opposite. In a bewildering turn of events, as she blinks, they vanish from sight, leaving her to remark wryly about the absurdity of the situation. This moment deepens the mystery and sets an ominous tone for what is to follow.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Look, I know how mad I'm sounding.", "DESK SERGEANT: Shall we try it from the beginning this time?", "SALLY: Okay. There's this house. A big old house, been empty for years, falling apart. Wester Drumlin, out by the estate. You've probably seen it.", "DESK SERGEANT: Wester Drumlin?", "SALLY: Yes.", "DESK SERGEANT: Could you just wait here for a minute?", "SALLY (after noticing the statues vanish): Okay, cracking up now."]
    ;
MERGE (e:Event {uuid: 'event_30_2'})
    ON CREATE SET
        e.title = 'DI Billy Shipton’s Abrupt Entrance',
        e.description = 'Following the eerie observation by Sally, the atmosphere in the police station shifts as DI Billy Shipton makes his unanticipated entrance. With a brisk and apologetic tone, Billy introduces himself, emphasizing his connection to Wester Drumlin, which adds a layer of personal responsibility to the unfolding mystery. He quickly interjects a message intended for someone named Marcie, hinting at further urgency and chaos beyond the station\'s walls. Sally responds with a curt greeting, and the brief exchange encapsulates the hurried nature of the investigation and the undercurrent of tension permeating this disjointed sequence of events.',
        e.sequence = 2,
        e.key_dialogue = ["BILLY: Hi. DI Billy Shipton. Wester Drumlin, that's mine. Can't talk to you now, got a thing I can't be late for, so if you could just\u2026", "SALLY: Hello.", "BILLY: Eh, Marcie, can you tell them I'm going to be late for that thing?"]
    ;
MERGE (s:Scene {uuid: 'scene_31'})
    ON CREATE SET
        s.title = 'Whispers in the Underground Car Park',
        s.description = 'In this tense yet wryly humorous scene, we find ourselves in an underground car park filled with relics of the past. Dim lighting, the hum of distant ventilation, and rows of abandoned vehicles that still harbor personal belongings set an eerie, nostalgic tone. Amid this unsettling backdrop, a quirky 1960\'s style police box stands out in the corner—a mysterious relic that sparks curious conversation. Here, Sally Sparrow and DI Billy Shipton engage in playful, rapid-fire banter about the bizarre disappearances of vehicle owners and the oddities of this environment, hinting at larger supernatural forces at work. The exchange is light yet laced with foreboding implications as subtle stage directions reveal four angel statues silently guarding a hidden TARDIS, one of which blinks unexpectedly, suggesting that not everything is as it seems.',
        s.scene_number = 31
    
    WITH s
    MATCH (l:Location {uuid: 'location_underground_car_park'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_31_1'})
    ON CREATE SET
        e.title = 'Playful Banter Amid Disappearances',
        e.description = 'In the first event of the scene, Sally and DI Billy Shipton discuss the curious case of vehicles parked outside Wester Drumlin House that still contain personal items—even engines left running—suggesting that their owners never left. Their dialogue mixes incredulity with wry humor as they note these inexplicable vanishings. Their conversation shifts quickly to the peculiar presence of a 1960\'s style police box resting in the corner. Billy explains the odd characteristics of the police box—the dummy phone, incorrectly sized windows, and a mismatched Yale lock—in a way that teases at a deeper mystery. In the midst of this discussion, Billy surprises Sally with an unexpected invitation for a drink, sparking a series of rapid, playful exchanges that reveal both flirtation and exasperation.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: All of them?", "BILLY: Over the last two years, yeah. They all still have personal items in them and a couple still had the motor running.", "SALLY: So over the last two years, the owners of all these vehicles have driven up, parked outside and just disappeared.", "SALLY: What's that?", "BILLY: Ah! The pride of the Wester Drumlins collection. We found that there, too. Somebody's idea of a joke, I suppose.", "SALLY: But what is it? What's a police box?", "BILLY: Well, it's a special kind of phone box for policemen. They used to have them all over. But this isn't a real one... [explains] ... But that's not the big question. See, you're missing the big question.", "SALLY: Okay, what's the big question?", "BILLY: Will you have a drink with me?", "SALLY: I'm sorry?", "BILLY: Drink? You? Me? Now?", "SALLY: Aren't you on duty, Detective Inspector Shipton?", "BILLY: Nope. Knocked off before I left. Told them I had a family crisis.", "BILLY: Because life is short and you are hot. Drink?", "SALLY: No.", "BILLY: Ever?", "SALLY: Maybe.", "BILLY: Phone number?", "SALLY: Moving kind of fast, DI Shipton.", "BILLY: Billy. I'm off duty.", "SALLY: Aren't you just.", "BILLY: Is that your phone number?", "SALLY: Just my phone number. Not a promise. Not a guarantee. Not an IOU. Just a phone number.", "BILLY: And that's Sally?", "SALLY: Sally Shipton. Sparrow! Sally Sparrow. I'm going now. Don't look at me.", "BILLY: I'll phone you.", "SALLY: Don't look at me.", "BILLY: Phone you tomorrow.", "SALLY: Don't look at me.", "BILLY: Might even phone you tonight.", "SALLY: Don't look at me!", "BILLY: Definitely going to phone you, gorgeous girl!", "SALLY: You definitely better!"]
    ;
MERGE (e:Event {uuid: 'event_31_2'})
    ON CREATE SET
        e.title = 'Departure and the Silent Vigil of the Angels',
        e.description = 'In the second event, as the banter subsides, Sally abruptly departs the scene, leaving behind the charged atmosphere of the underground car park. Her exit is underscored by a subtle yet eerie visual: four angel statues positioned around the TARDIS. One of these statues stands out with its hand raised towards the lock, as if guarding it. In a moment that blurs the line between inanimate and sentient, the statue unexpectedly blinks—a silent reminder of the uncanny forces at play. This event shifts the tone from playful flirtation to a quiet, somber acknowledgement of supernatural oversight, hinting at the deeper mysteries still unfolding.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_32'})
    ON CREATE SET
        s.title = 'Key Moment on the Street',
        s.description = 'On a rain-soaked evening along a dimly lit urban street, Sally Sparrow emerges from the police station with a determined air. She steps onto the street, the low hum of the city underscored by an unsettling quiet. In a deliberate pause, she reaches into her coat pocket and produces a small, well-worn Yale key—a tangible symbol of the mysterious forces at work. The key glints with significance, foreshadowing the enigma that lies ahead. Soon after, urgency propels her back to the car park where she is met with a shocking void: the Tardis, Billy, and the ominous guardian angel statues have inexplicably vanished, leaving her with a deepening sense of foreboding.',
        s.scene_number = 32
    
    WITH s
    MATCH (l:Location {uuid: 'location_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_32_1'})
    ON CREATE SET
        e.title = 'Key Discovery',
        e.description = 'Sally Sparrow, leaving the police station behind, crosses the street with measured resolve. In a quiet moment amid the urban drizzle, she pauses and reaches into her coat pocket to retrieve a modest Yale key. This act, though seemingly mundane, is imbued with significance—it hints at a hidden mechanism and a deeper mystery tied to the unfolding events. The key’s subtle gleam against the dark surroundings marks a turning point, as it symbolizes potential access to secrets that are now integral to her perilous journey.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_32_2'})
    ON CREATE SET
        e.title = 'The Vanishing',
        e.description = 'Immediately after extracting the Yale key, Sally’s urgency intensifies as she dashes back to the car park. Upon arriving, she is confronted by an inexplicable absence: the familiar blue Tardis, the reassuring presence of Billy, and the foreboding guardian angel statues are nowhere to be seen. This mysterious disappearance deepens the enigma, leaving Sally in stunned confusion and apprehension about the next steps. The dialogue from off-camera underscores the peculiarity of the moment, as it hints that the key, despite its ordinary appearance, fits no conventional lock.',
        e.sequence = 2,
        e.key_dialogue = ["BILLY [OC]: Ordinary Yale lock, but nothing fits."]
    ;
MERGE (s:Scene {uuid: 'scene_33'})
    ON CREATE SET
        s.title = 'Timey-Wimey Revelations in the Alleyway',
        s.description = 'In a dimly lit, rain-slicked alleyway, the dramatic tension is palpable as a disoriented Billy Shipton slides down a wall and is met by the enigmatic Doctor and his stalwart companion Martha Jones. The scene’s atmosphere is charged with surreal energy and temporal dislocation, as the Doctor casually reveals that Billy has landed in 1969—a time when the moon landing looms large in the cultural imagination. The interplay of terse dialogue and cryptic explanations heightens the sense of impending peril. Amid snatches of levity and dire warnings, the conversation hints at the deadly nature of the Weeping Angels and the bizarre mechanics of time travel. This moment sets the stage for a crucial mission: carrying a message to Sally Sparrow, a task that underscores the narrative’s blend of humor, tension, and cosmic stakes.',
        s.scene_number = 33
    
    WITH s
    MATCH (l:Location {uuid: 'location_alleyway'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_33_1'})
    ON CREATE SET
        e.title = 'Disoriented Encounter in the Alley',
        e.description = 'Billy Shipton, reeling from his sudden arrival, slides down the wall of a dark alleyway, his senses overwhelmed by the unexpected shift in time. The Doctor greets him with calm assurance, immediately establishing the surreal nature of his predicament. Amid brief banter about the moon landing—which the Doctor cryptically connects to the current moment—and Martha’s enthusiastic interjection about their past travels, the scene captures an atmosphere of bewilderment intermingled with wry humor. This event introduces the temporal anomaly and sets Billy’s confused state as he begins to grasp the impossible reality he’s found himself in.',
        e.sequence = 1,
        e.key_dialogue = ["DOCTOR: Welcome.", "BILLY: Where am I?", "DOCTOR: 1969. Not bad, as it goes. You've got the moon landing to look forward to.", "MARTHA: Oh, the moon landing's brilliant. We went four times, back when we had transport.", "DOCTOR: Working on it."]
    ;
MERGE (e:Event {uuid: 'event_33_2'})
    ON CREATE SET
        e.title = 'Exposition of Temporal Anomaly and Mission Assignment',
        e.description = 'As Billy’s disorientation deepens, the Doctor launches into a detailed exposition about the bizarre phenomenon that brought him here—a mysterious \'touch of an angel\' that disrupts time. With a mix of urgency and quirky humor, the Doctor cautions Billy not to try and stand up, explaining the perils of time travel without a protective capsule. He elaborates on the deadly efficiency of the Weeping Angels, creatures that steal their victim\'s potential energy. Martha briefly instructs Billy to simply nod when the Doctor pauses for breath. In a final, weighty remark, the Doctor apologetically entrusts Billy with a critical message for Sally Sparrow, emphasizing that the mission is fraught with peril and will likely be a long, challenging journey.',
        e.sequence = 2,
        e.key_dialogue = ["BILLY: How did I get here?", "DOCTOR: The same way we did. The touch of an angel. Same one, probably, since you ended up in the same year. No, no. No, no, no, don't get up. Time travel without a capsule. Nasty. Catch your breath. Don't go swimming for half an hour.", "BILLY: I don't. I can't.", "DOCTOR: Fascinating race, the Weeping Angels. The only psychopaths in the universe to kill you nicely. No mess, no fuss, they just zap you into the past and let you live to death. The rest of your life used up and blown away in the blink of an eye. You die in the past, and in the present they consume the energy of all the days you might have had. All your stolen moments. They're creatures of the abstract. They live off potential energy.", "BILLY: What in God's name are you talking about?", "MARTHA: Trust me. Just nod when he stops for breath.", "DOCTOR: Tracked you down with this. This is my timey-wimey detector. It goes ding when there's stuff. Also, it can boil an egg at thirty paces, whether you want it to or not, actually, so I've learned to stay away from hens. It's not pretty when they blow.", "BILLY: I don't understand. Where am I?", "MARTHA: 1969, like he says.", "DOCTOR: Normally, I'd offer you a lift home, but somebody nicked my motor. So I need you to take a message to Sally Sparrow. And I'm sorry, Billy. I am very, very sorry. It's going to take you a while."]
    ;
MERGE (s:Scene {uuid: 'scene_34'})
    ON CREATE SET
        s.title = 'Echoes in the Underground Car Park',
        s.description = 'In the dim, echoing expanse of an underground car park, the atmosphere is tense and sparse. The concrete walls and scattered parked vehicles create a haunting backdrop, accentuating the isolation of the moment. As Sally Sparrow navigates the deserted space, her mobile phone suddenly rings, slicing through the silence. The brief sound of the ring amplifies her anxiety as she answers the call, her voice carrying a mix of urgency and concern. The scene functions as a critical pivot that heightens the suspense, linking Sally’s internal quest for answers with the unfolding external dangers. Every shadow and sound in this cold, underground locale reinforces the eerie anticipation of what comes next.',
        s.scene_number = 34
    
    WITH s
    MATCH (l:Location {uuid: 'location_underground_car_park'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_34_1'})
    ON CREATE SET
        e.title = 'Sally Receives a Mysterious Call',
        e.description = 'Deep within the underground car park, Sally Sparrow’s mobile phone abruptly rings. The isolated setting magnifies the sound as she stops in her tracks, her heart pounding with a mix of worry and intrigue. She answers the call, addressing it with a strained, urgent tone as she asks, \'Hello? Billy, where are you? Where?\' This moment, though brief, is loaded with narrative tension, indicating that something is amiss with Billy’s whereabouts. The call underscores the persistence of the mystery surrounding her situation and catalyzes her next actions within the unfolding drama.',
        e.sequence = 1,
        e.key_dialogue = ["Hello? Billy, where are you? Where?"]
    ;
MERGE (s:Scene {uuid: 'scene_35'})
    ON CREATE SET
        s.title = 'Rain and Revelations in the Geriatric Ward',
        s.description = 'In this poignant scene set in a quiet hospital ward, the atmosphere is heavy with the weight of memories and fate. Only one bed is occupied by an aging Billy Shipton near a misted-up window, his fragile presence illuminated by soft, fading daylight filtering through the glass. As rain patters gently outside, Sally Sparrow enters with a mix of concern and nostalgic resolve. The sparse, intimate setting magnifies every whispered word and lingering look. Amid the murmurs of the rain, Billy recounts how life and destiny have intertwined their paths—from a chance encounter in the rain to an enigmatic message from The Doctor delivered through a legendary list of seventeen DVDs. Emotional tension builds as revelations of shared names, lost times, and a promise made only for one final meeting echo quietly throughout the ward, before the inevitable departure when the rain finally stops.',
        s.scene_number = 35
    
    WITH s
    MATCH (l:Location {uuid: 'location_geriatric_ward'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_35_1'})
    ON CREATE SET
        e.title = 'A Rainy Reunion',
        e.description = 'Sally enters the quiet geriatric ward and calls out to Billy. The scene opens with a tender yet somber exchange as the elderly man stirs in bed by the window. Billy, with a reflective tone, remarks on how it was raining when they first met, while Sally observes that the same rain continues to fall. This initial moment of recognition sets the tone for a meeting filled with nostalgia and unspoken promises, highlighting the power of memory and the relentless passage of time.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Billy?", "BILLY: It was raining when we met.", "SALLY: It's the same rain."]
    ;
MERGE (e:Event {uuid: 'event_35_2'})
    ON CREATE SET
        e.title = 'Photograph and Prophetic Revelation',
        e.description = 'As the conversation deepens, Sally’s attention is drawn to a poignant wedding photograph lying nearby, evoking bittersweet memories of a shared past. Billy notes that the woman in the picture bore the same name—Sally—further cementing an almost fated connection between them. He then shifts the tone by recalling a mysterious message sent by a man from 1969, known as The Doctor. This message, conveyed through a list of seventeen DVDs, hints at secret promises and singular reunions that have haunted Billy through years of waiting. The moment is both nostalgic and eerie, as destiny intermingles with the surreal.',
        e.sequence = 2,
        e.key_dialogue = ["SALLY: She looks nice.", "BILLY: Her name was Sally, too.", "BILLY: There's a man in 1969. He sent me with a message for you.", "BILLY: Just this. Look at the list.", "SALLY: What does that mean? Is that it? Look at the list?"]
    ;
MERGE (e:Event {uuid: 'event_35_3'})
    ON CREATE SET
        e.title = 'Final Commitment Before the Rain Stops',
        e.description = 'In the final emotional beat of the scene, Billy reveals the weight of his long, solitary vigil. He confesses that he has long awaited this singular meeting—a promise made for the night of his death and sustained by the hope given by an infamous message from The Doctor. Despite his frailty and the poignant reminder of his worn-out hands, Billy finds solace in the prospect of one final reunion. In response, Sally makes a heartfelt pledge to remain with him, even as the inevitable passing of time looms. His parting words, framed by the slowly ceasing rain, echo as both a benediction and a farewell.',
        e.sequence = 3,
        e.key_dialogue = ["SALLY: I'll stay. I'm going to stay with you, okay?", "BILLY: Thank you, Sally Sparrow. I have till the rain stops."]
    ;
MERGE (s:Scene {uuid: 'scene_36'})
    ON CREATE SET
        s.title = 'Back Room Confrontation',
        s.description = 'In a quiet, somewhat shadowed back room, the tension is distilled into a brief, cryptic phone call that hints at deeper undercurrents. The sparse setting, defined by its utilitarian character and the low hum of uncertainty, serves as the stage for an exchange that is both terse and loaded with mystery. Larry answers the ringing telephone, his measured response \'Banto\'s\' immediately interrupted by Sally’s off-screen interjection, \'They\'re mine.\' The confusion in Larry’s quick follow-up \'What?\' encapsulates an unspoken conflict or secret agreement, setting the stage for future revelations in the narrative.',
        s.scene_number = 36
    
    WITH s
    MATCH (l:Location {uuid: 'location_back_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_36_1'})
    ON CREATE SET
        e.title = 'Unexpected Claim Over the Line',
        e.description = 'In this compact but charged moment, Larry picks up the telephone in the back room and declares \'Banto\'s\' as he responds to the incoming call. Almost immediately, Sally’s off-screen voice interjects with a surprising claim, \'They\'re mine\', introducing a layer of tension and ambiguity about ownership and responsibility. Larry\'s bewildered reply, \'What?\', encapsulates the sudden confusion and mystery that underpin this seemingly ordinary phone call, leaving both characters and the audience questioning the significance of this interaction.',
        e.sequence = 1,
        e.key_dialogue = ["LARRY: Banto's.", "SALLY [OC]: They're mine.", "LARRY: What?"]
    ;
MERGE (s:Scene {uuid: 'scene_37'})
    ON CREATE SET
        s.title = 'Easter Egg Revelation on the Street',
        s.description = 'On a modest city street under the muted glow of urban lights, Sally Sparrow pauses in a moment of stark self-realization. The atmosphere is casual yet charged with a secret energy as she voices a truth that links her personal identity to a deeper mystery. In this brief scene, Sally articulates that the list of seventeen DVDs – a collection she uniquely owns – carries an Easter Egg designed solely for her. This revelation not only cements her intrinsic connection to the unfolding enigma but also subtly redefines her role in the broader narrative, where personal legacy intertwines with mysterious hidden messages.',
        s.scene_number = 37
    
    WITH s
    MATCH (l:Location {uuid: 'location_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_37_1'})
    ON CREATE SET
        e.title = 'Sally\'s Revelation of the DVD Connection',
        e.description = 'In this pivotal moment, Sally Sparrow reveals the core secret behind the list of seventeen DVDs. Clearly, she declares that every DVD in the collection bears a hidden connection to her, affirming that the Easter Egg was intended only for her. This event not only underscores her unique role in the mystery but also links her directly to the narrative’s underlying intrigue. Her words cement a turning point that raises the stakes, emphasizing her destiny as intricately tied to a secret only she can claim.',
        e.sequence = 1,
        e.key_dialogue = ["The DVDs on the list. The seventeen DVDs. What they've got in common is me. They're all the DVDs I own. The Easter Egg was intended for me."]
    ;
MERGE (s:Scene {uuid: 'scene_38'})
    ON CREATE SET
        s.title = 'Seventeen DVD Revelation',
        s.description = 'In the muted, dim light of a sparsely furnished back room, the atmosphere is thick with quiet tension and mystery. Here, in a small space behind the bustle of the main establishment, Larry Nightingale confronts an enigmatic detail that has haunted him since the earlier events. The focus centers on a peculiar list: exactly seventeen DVDs, each hinting at hidden messages and secret links to a larger, inexplicable narrative. This small yet potent moment underscores themes of destiny and foreboding, as the significance of the number seventeen becomes a key to unlocking deeper secrets.',
        s.scene_number = 38
    
    WITH s
    MATCH (l:Location {uuid: 'location_back_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_38_1'})
    ON CREATE SET
        e.title = 'DVD List Discovery',
        e.description = 'In the quiet solitude of the back room, Larry Nightingale scrutinizes a mysterious list of DVDs. As he runs his eyes over the contained information, he is struck by the realization that the collection amounts to exactly seventeen DVDs. His exclamation, laden with a mixture of disbelief and intrigue, draws attention to the hidden significance embedded in the seemingly mundane details. This moment serves as a pivotal narrative beat, suggesting that the DVDs—and the secret \'Easter egg\' they harbor—are deeply interwoven with the unfolding mystery.',
        e.sequence = 1,
        e.key_dialogue = ["LARRY: You've only got seventeen DVDs?"]
    ;
MERGE (s:Scene {uuid: 'scene_39'})
    ON CREATE SET
        s.title = 'Street Encounter: A Meeting Set in Motion',
        s.description = 'On a bustling city street, dusk or early evening light casts long shadows as Sally Sparrow and Larry Nightingale engage in a brief, charged exchange that hints at much more beneath the surface. The air is cool and expectant, the street itself a silent witness to their conversation. Sally’s seemingly simple inquiry about a portable DVD player is steeped in symbolism, serving as a subtle cue to the unfolding mystery and the broader narrative of temporal interplay. The dialogue, casual yet laced with urgency, signals that this meeting on the street is key to catalyzing future revelations.',
        s.scene_number = 39
    
    WITH s
    MATCH (l:Location {uuid: 'location_street'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_39_1'})
    ON CREATE SET
        e.title = 'Invitation and the DVD Query',
        e.description = 'Sally Sparrow initiates the conversation by asking Larry Nightingale if he has a portable DVD player—a seemingly trivial question loaded with narrative weight. Larry replies affirmatively, asking for the reason behind her inquiry. In response, Sally expresses her desire to meet him, a statement that is both casual and portentous. This brief exchange sets the stage for further developments and hints at a deeper significance woven through everyday dialogue, linking character relationships with the unfolding mystery.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Do you have a portable DVD player?", "LARRY: Of course. Why?", "SALLY: I want you to meet me."]
    ;
MERGE (s:Scene {uuid: 'scene_40'})
    ON CREATE SET
        s.title = 'Back Room Revelation',
        s.description = 'In the quiet, shadowed back room of Sparrow & Nightingale’s establishment, the mood is laden with quiet mystery and hesitant revelations. The space is sparsely lit, with old shelves and boxes hinting at secrets of the past. Here, the focus narrows to a brief but charged exchange that layers the scene with eerie significance. Larry’s single, anxious query—\'Where?\'—echoes in the stillness, provoking the out-of-character response from Sally that situates them at Wester Drumlins, hinting at the deeper enigma that has followed them from an ancient, haunted house. The atmosphere is one of subdued tension and subtle foreboding as the characters reaffirm a connection to the eerie events unfolding around them.',
        s.scene_number = 40
    
    WITH s
    MATCH (l:Location {uuid: 'location_back_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_40_1'})
    ON CREATE SET
        e.title = 'Mysterious Query in the Back Room',
        e.description = 'In this succinct but loaded moment, the quiet of the back room is broken by Larry’s urgent question. His simple inquiry \'Where?\' cuts through the stillness, conveying his confusion and hinting at the enigmatic location that has been central to their recent experiences. Immediately, Sally responds out-of-character with the name \'Wester Drumlins\', anchoring the conversation to the larger mystery and evoking memories of ominous discoveries. The dialogue, sparse as it is, underscores the tension and layers the scene with a sense of imminent revelation as both characters navigate the uncertainty of their surroundings.',
        e.sequence = 1,
        e.key_dialogue = ["LARRY: Where?", "SALLY [OC]: Wester Drumlins."]
    ;
MERGE (s:Scene {uuid: 'scene_41'})
    ON CREATE SET
        s.title = 'Entrance Hall Encounter',
        s.description = 'In this brief yet resonant scene set in the entrance hall of the house, the mundane meets the absurd as Sally opens the door and reluctantly allows Larry inside. The space is imbued with a subtle weariness—a faded elegance mixed with everyday practicality—that serves as the backdrop to an unexpectedly humorous exchange. As Larry quips, \"You live in Scooby Doo\'s house,\" his remark lightens the tension, contrasting sharply with Sally\'s exasperated response, \"For God\'s sake, I don\'t live here.\" This interaction not only reflects the characters\' established rapport, but also adds a slice of intimacy and levity to the unfolding narrative, hinting at the quirky undercurrents that enrich their relationship. The scene’s ambient lighting and simple decor emphasize a transient space that links the extraordinary events of their world with the ordinary moments of daily life.',
        s.scene_number = 41
    
    WITH s
    MATCH (l:Location {uuid: 'location_entrance_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_41_1'})
    ON CREATE SET
        e.title = 'Larry’s Entrance and Playful Quip',
        e.description = 'Larry enters the house through the entrance hall, his arrival marked by a spontaneous burst of humor that cuts through the tension of the moment. As Sally opens the door, the modest, lived-in surroundings of the entrance hall underscore the normalcy of the scene. Larry, in a lighthearted manner, remarks on the house’s quirky appearance by comparing it to the cartoonish setting of Scooby Doo’s adventures. In response, Sally, irked yet amused, retorts with exasperation. This brief exchange not only highlights their contrasting personalities but also establishes a familiar, bantering rapport between them, setting the tone for future interactions as the narrative unfolds.',
        e.sequence = 1,
        e.key_dialogue = ["LARRY: You live in Scooby Doo's house.", "SALLY: For God's sake, I don't live here."]
    ;
MERGE (s:Scene {uuid: 'scene_42'})
    ON CREATE SET
        s.title = 'Time, Transcripts, and Terrors',
        s.description = 'In the shadowed drawing room, the atmosphere is charged with both technological hum and palpable dread. Larry carefully loads his portable DVD player as the screen comes alive with the iconic image of the Doctor—a time‐travelling message from 1969. Sally and Larry exchange incredulous remarks that blur the lines between recorded history and their present predicament. Their discussion pivots from playful banter about picture quality to a mind‐bending debate on time, fate, and a transcript that seems to predict every word spoken. Soon, the conversation takes a dark turn when the Doctor explains the chilling nature of the quantum-locked Weeping Angels—statues that become dangerous the moment they are unobserved. As the threat looms and the exit is unexpectedly sealed, Sally and Larry are forced into a desperate maneuver to escape a trap set by time itself.',
        s.scene_number = 42
    
    WITH s
    MATCH (l:Location {uuid: 'location_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_42_1'})
    ON CREATE SET
        e.title = 'Initiating the Time Message',
        e.description = 'Larry cues up the DVD in the portable player, remarking on the superior sound and picture quality, while Sally casually identifies the figure on the screen as the Doctor. The exchange is light yet laced with mystery as the dialogue introduces the Doctor’s presence and his off-kilter manner of greeting. The room, despite its familiar drawing room setting, morphs into a nexus between past and future, setting the stage for the unfolding narrative of time travel and hidden messages.',
        e.sequence = 1,
        e.key_dialogue = ["LARRY: Okay, this is the one with the clearest sound. Slightly better picture quality on this one, but I don't know.", "SALLY: The Doctor.", "LARRY: Who's the Doctor?", "SALLY: He's the Doctor.", "DOCTOR [on screen]: Yup. That's me."]
    ;
MERGE (e:Event {uuid: 'event_42_2'})
    ON CREATE SET
        e.title = 'Timey-Wimey Transcript Debate',
        e.description = 'The conversation deepens as the Doctor reveals his status as a time traveller stuck in 1969. Larry, ever the note-taker, explains his method of \'writing in your bits\'—a reference to an ongoing transcript that captures every word of this peculiar exchange. The discussion quickly spirals into a debate on how the transcript seems to finish itself, demonstrating the unnerving precognition of the Doctor’s message. This event is pivotal in illustrating the non-linear, unpredictable nature of time as understood in this bizarre universe.',
        e.sequence = 2,
        e.key_dialogue = ["DOCTOR [on screen]: I'm a time traveller. Or I was. I'm stuck in 1969.", "MARTHA [on screen]: We're stuck. All of space and time, he promised me. Now I've got a job in a shop \u2013 I've got to support him!", "LARRY: I'm getting this down! I'm writing in your bits.", "SALLY: How? How is this possible? Tell me.", "DOCTOR [on screen]: Well, not 'hear you' exactly, but I know everything you're going to say."]
    ;
MERGE (e:Event {uuid: 'event_42_3'})
    ON CREATE SET
        e.title = 'The Quantum-Locked Angels Revealed',
        e.description = 'The mood shifts as the Doctor launches into an exposition on the nature of the Weeping Angels—creatures that are harmless when observed, yet deadly the moment they are unguarded. He describes them as quantum-locked entities that freeze into stone when seen. Sally\'s urgency mounts as the implications of this phenomenon become clear, and she issues a stark warning to keep their eyes fixed on the looming statues. The explanation, delivered with a blend of scientific curiosity and mounting terror, underscores the dangerous stakes of their situation and sets up the impending confrontation.',
        e.sequence = 3,
        e.key_dialogue = ["DOCTOR [on screen]: They are quantum-locked. They don't exist when they're being observed. The moment they are seen by any other living creature, they freeze into rock. And you can't kill a stone.", "SALLY: Don't take your eyes off that!", "DOCTOR [on screen]: And I'm very, very sorry. It's up to you now."]
    ;
MERGE (e:Event {uuid: 'event_42_4'})
    ON CREATE SET
        e.title = 'Imminent Threat and the Locked Exit',
        e.description = 'Tension explodes as reality intercedes with terror: the door is locked, sealing Sally and Larry inside the drawing room with the threat of the Angels. Sally declares that she possesses the key—an object coveted by these spectral guardians—and that it will determine their fate. Amid frantic instructions and mounting fear, Larry expresses his dread of what awaits if they move. The desperate call to keep their focus becomes a final stand against an inescapable trap. This event captures the moment the conversation shifts from abstract time theories to an immediate life-or-death decision.',
        e.sequence = 4,
        e.key_dialogue = ["SALLY: Okay, we're going to the door. The front door.", "SALLY: They've locked it. They've locked us in!", "SALLY: I've got something they want. I took it last time I was here. I led them to the blue box. Now they've got that.", "LARRY: Give them the key!", "LARRY: Coming! I can't stay here!"]
    ;
MERGE (s:Scene {uuid: 'scene_43'})
    ON CREATE SET
        s.title = 'The Cellar Escape: Tardis and Angels',
        s.description = 'In the dim and claustrophobic cellar, the atmosphere is charged with both desperation and hope. The ancient blue Tardis stands as the last beacon of escape amidst the looming threat of the guardian angels—silent, frozen statues that seem to come alive the moment sight is diverted. Flickering light from a failing bulb casts eerie shadows over the cold, bare stone walls, amplifying the tension. In this charged moment, Sally Sparrow\'s determined voice echoes the Doctor’s earlier instructions, while Larry Nightingale races against time to aid her frantic, trembling attempt to operate the Tardis before the menacing angels can close in.',
        s.scene_number = 43
    
    WITH s
    MATCH (l:Location {uuid: 'location_cellar'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_43_1'})
    ON CREATE SET
        e.title = 'Initiating Escape Protocol',
        e.description = 'In the dim cellar light, the Tardis stands as a beacon of hope, flanked by three ominous guardian angels frozen in time. Sally Sparrow, with focused determination, addresses the silent statues, reminding them of the Doctor\'s promise that as long as they are watched, they cannot move. Her calm but urgent declaration underscores the belief that maintaining their gaze on these eerie guardians is key to their escape. Every second in the subdued cellared gloom is precious as she attempts to secure a passage to safety.',
        e.sequence = 1,
        e.key_dialogue = ["Okay, boys, I know how this works. You can't move so long as I can see you. Whole world in the box, the Doctor says. Hope he's not lying, because I don't see how else we're getting out."]
    ;
MERGE (e:Event {uuid: 'event_43_2'})
    ON CREATE SET
        e.title = 'Directional Alert Amid Flickering Lights',
        e.description = 'As the tension escalates, Larry Nightingale dashes past Sally, setting a frantic pace across the cellar floor. An unexpected shift in the environment is noted when an additional angel from upstairs looms ominously behind them. In the intermittent glow of a flickering light bulb, Sally makes a pointed remark about a mysterious light cue, prompting Larry’s inquisitive response. This exchange not only heightens the sense of urgency but also underscores how even subtle environmental cues can be critical in a life-or-death situation.',
        e.sequence = 2,
        e.key_dialogue = ["Oh, and there's your one.", "Why's it pointing at the light?"]
    ;
MERGE (e:Event {uuid: 'event_43_3'})
    ON CREATE SET
        e.title = 'Desperate Unlock Attempt in Eternal Dread',
        e.description = 'In a surge of adrenaline as the cellared gloom deepens, panic infiltrates every moment. The lights are failing, and the guardian angels seem to edge imperceptibly closer. Sally frantically searches for the elusive lock on the Tardis, her voice trembling with urgency as she battles both time and terror. Larry’s desperate pleas add to the chaos as they work against the ever-present threat of the statues coming to life. Every whispered command, every hurried movement in that flickering darkness illustrates their desperate bid for escape before the angels can seize them.',
        e.sequence = 3,
        e.key_dialogue = ["Oh, my God, it's turning out the lights.", "Quickly!", "I can't find the lock!", "Sally, hurry up! Get it open! They're getting closer. Sally, come on!", "It won't turn!", "Sally!"]
    ;
MERGE (s:Scene {uuid: 'scene_44'})
    ON CREATE SET
        s.title = 'TARDIS: The Moment of Departure',
        s.description = 'Inside the TARDIS, tension and urgency collide as a hologram version of The Doctor appears on an upper catwalk to initiate security protocol 712. The time capsule, brought to life by a mysterious, glowing DVD, demands that the disc be inserted to complete its activation. Amid the controlled chaos, Larry Nightingale produces the DVD case while Sally Sparrow watches in disbelief. Outside, the malevolent Weeping Angels launch their assault on the blue box. As the TARDIS begins to dematerialize, the protagonists witness a moment of eerie triumph when the Angels become entranced by one another, hinting at The Doctor’s cunning plan.',
        s.scene_number = 44
    
    WITH s
    MATCH (l:Location {uuid: 'location_tardis_interior'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_44_1'})
    ON CREATE SET
        e.title = 'Security Protocol Initiated',
        e.description = 'The scene opens on the TARDIS interior as an image materializes on an upper catwalk. A hologram of The Doctor appears, declaring that security protocol 712 has been activated. He announces that the time capsule has detected an authorised control disc and instructs all to insert the disc and prepare for departure. Simultaneously, Larry Nightingale retrieves a glowing DVD case from his pocket, while Sally Sparrow notes that the device appears similar to a DVD player with a dedicated slot. This moment establishes the mechanism that will trigger the imminent dematerialization of the TARDIS.',
        e.sequence = 1,
        e.key_dialogue = ["THE DOCTOR (hologram): This is security protocol seven one two. This time capsule has detected the presence of an authorised control disc, valid one journey.", "THE DOCTOR (hologram): Please insert the disc and prepare for departure.", "SALLY: Looks like a DVD player. There's a slot."]
    ;
MERGE (e:Event {uuid: 'event_44_2'})
    ON CREATE SET
        e.title = 'Angels Assault the TARDIS',
        e.description = 'As the instructions echo through the TARDIS, chaos erupts outside. The malevolent Weeping Angels, ever lurking and ominous, begin their calculated attack on the TARDIS. Their stone forms, with outstretched arms and threatening gapes, underscore the danger as they try to infiltrate the time machine. Amid the platform’s growing instability, Larry exclaims his alarm at the approaching threat while Sally urges him to act quickly. The impending assault heightens the urgency of the moment as the protagonists realize that every second counts in preventing further catastrophe.',
        e.sequence = 2,
        e.key_dialogue = ["LARRY: They're trying to get in!", "SALLY: Well, hurry up then!"]
    ;
MERGE (e:Event {uuid: 'event_44_3'})
    ON CREATE SET
        e.title = 'Activation and Dematerialization',
        e.description = 'Under mounting pressure, Larry swiftly inserts the glowing DVD into the designated slot on the TARDIS console. Instantly, the TARDIS begins to rock violently and its time rotor springs to life. The energy emanating from within intensifies as the vehicle starts its dematerialization sequence. Overwhelmed by the moment, Sally cries out in alarm that the TARDIS is leaving them behind, pleading for The Doctor to intervene. The visuals are explosive and disorienting as the structure fades, while the presence of the Weeping Angels looms ominously around the exterior.',
        e.sequence = 3,
        e.key_dialogue = ["LARRY: What's happening?", "SALLY: Oh, my God, it's leaving us behind. Doctor, no! You can't!"]
    ;
MERGE (e:Event {uuid: 'event_44_4'})
    ON CREATE SET
        e.title = 'Angels Stunned by the Trick',
        e.description = 'In the calm that follows the drastic departure of the TARDIS, Sally and Larry take a moment to scan the environment. Their eyes fall upon the Weeping Angels, now immobilized and caught in a frozen tableau. The cunning of The Doctor becomes apparent as the Angels, meant to be lethal, are rendered incapable of movement by simply turning their gaze upon one another. Larry, with a mix of relief and amazement, notes that The Doctor has successfully tricked them into stasis, ensuring their safety—at least for now. The scene closes on this bittersweet talisman of survival.',
        e.sequence = 4,
        e.key_dialogue = ["LARRY: I don't think we need to. He tricked them, The Doctor tricked them. They're looking at each other. They're never going to move again."]
    ;
MERGE (s:Scene {uuid: 'scene_45'})
    ON CREATE SET
        s.title = 'Aftermath of the Past: Confronting the Doctor',
        s.description = 'Inside Banto’s DVD Store, one year after the unsettling events at Wester Drumlins, the mundane world of retail is suddenly laced with the echoes of a mysterious past. Sally Sparrow clutches a well-worn folder containing a transcribed conversation, photographs, and a letter that bear testimony to cryptic messages from the Doctor and the sinister Weeping Angels. In the cramped shop, her long-time companion, Larry Nightingale, tries to persuade her to let go of the memories that haunt her, arguing that some mysteries are best buried. Their terse exchange is abruptly interrupted when a taxi pulls up outside and Martha Jones along with the enigmatic Doctor emerge onto the street, prompting Sally to dash out the door. The scene juxtaposes the ordinary routine of running a shop with the extraordinary legacy of time-travel and alien menace, capturing the tension between personal commitment and the allure of unresolved cosmic enigmas.',
        s.scene_number = 45
    
    WITH s
    MATCH (l:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_45_1'})
    ON CREATE SET
        e.title = 'Contested Memories in the Shop',
        e.description = 'Within the familiar yet cluttered confines of Banto\'s DVD Store, Larry Nightingale and Sally Sparrow engage in a pointed conversation about the artifacts of their past. Sally holds a treasured folder that contains a transcript, photographs, and a letter implicating an uncanny involvement of the Doctor, stirring memories of events that continue to haunt her. Larry, concerned by the emotional gravity of the past, insists that the mystery is best left unsolved, urging her to put it behind her. Their dialogue reveals a deep conflict between clinging to unresolved enigmas and the need to focus on the present, underscoring the personal cost of an obsessive quest for truth.',
        e.sequence = 1,
        e.key_dialogue = ["Larry: Sally, can't you let it go?", "Sally: Of course I can't let it go.", "Larry: This is over.", "Sally: How did the Doctor know where to write those words on the wall? How could he get a copy of the transcript? Where did he get all that information from?", "Larry: Look, some things you never find out. And that's okay.", "Sally: No, it isn't.", "Larry: Ever think this might be getting in the way of other things?", "Sally: We just run a shop together. That's all it is, just a shop.", "Larry: Anyway, milk. Back in a mo."]
    ;
MERGE (e:Event {uuid: 'event_45_2'})
    ON CREATE SET
        e.title = 'A Mysterious Encounter Outside',
        e.description = 'Following Larry\'s departure to fetch some milk, Sally is stirred by an unexpected interruption. As a taxi pulls up outside the store, she notices Martha Jones and the unmistakable figure of the Doctor stepping onto the street. The sudden emergence of these figures, steeped in mystery and the weight of past events, forces Sally to confront lingering questions about her role in a much larger cosmic puzzle. Overwhelmed by a blend of curiosity, urgency, and an inescapable pull to resolve the enigma of her past, she dashes out of the shop, setting in motion the next phase of her intertwined destiny.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_46'})
    ON CREATE SET
        s.title = 'A Moment of Urgent Reunion Outside the DVD Store',
        s.description = 'On a rainy day outside the newly renamed Sparrow & Nightingale, Antiquarian Books and Rare DVDs, tension and wonder intermingle as Sally Sparrow unexpectedly confronts an all-too-familiar face. The atmosphere crackles with urgency as Sally shouts for the Doctor, whose hurried arrival is punctuated by Martha’s brisk interjections and the Doctor’s own quirky apologies about time’s unpredictable order. The scene is set on a modest city street bathed in ambient light and punctuated by the presence of looming public statuary. The dialogue touches on time travel, forgotten promises, and a mysterious file containing crucial information for a future crisis, blending urgency with emotional intimacy and bittersweet farewell. The encounter underscores how personal connections are interwoven with the inexorable pull of destiny.',
        s.scene_number = 46
    
    WITH s
    MATCH (l:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_46_1'})
    ON CREATE SET
        e.title = 'The Urgent Reunion',
        e.description = 'In the bustling exterior of the DVD store, Sally Sparrow shouts out in urgency, calling for the Doctor with a heartfelt \'Doctor! Doctor! Doctor!\' Her cry disrupts the routine, drawing in the enigmatic time traveller and his companion Martha. The Doctor, exuding his characteristic charm and slight disarray, apologizes for his rushed arrival, while Martha, armed with a quiver of arrows, signals the urgency of their mission. This moment of raw emotion and surprise sets the stage for the unfolding revelation of past connections and impending dangers, highlighting the collision of personal history with cosmic duty.',
        e.sequence = 1,
        e.key_dialogue = ["SALLY: Doctor! Doctor! Doctor!", "DOCTOR: Hello. Sorry, bit of a rush. There's a sort of thing happening. Fairly important we stop it."]
    ;
MERGE (e:Event {uuid: 'event_46_2'})
    ON CREATE SET
        e.title = 'Revelation and Confession',
        e.description = 'As the tension builds, Sally’s confusion and urgency give way to an emotional confession. In a moment charged with memory and responsibility, she confronts the Doctor with subtle disbelief about their intertwined past. The dialogue reveals that Sally herself was the source of vital information, hinting at a mysterious connection that spans time. The Doctor’s bemused inquiry and Sally’s passionate admission, \'It was me. Oh, for God\'s sake, it was me all along. You got it all from me,\' serve to deepen the mystery of how their lives are entangled in the fabric of time as well as the future crisis awaiting them.',
        e.sequence = 2,
        e.key_dialogue = ["SALLY: My God, it's you. It really is you. Oh, you don't remember me, do you?", "SALLY: It was me. Oh, for God's sake, it was me all along. You got it all from me."]
    ;
MERGE (e:Event {uuid: 'event_46_3'})
    ON CREATE SET
        e.title = 'Passing the Prophecy',
        e.description = 'The emotional climax of the encounter unfolds as Sally delivers a crucial prophecy. With a sense of resigned urgency, she instructs the Doctor on a terrifying future event: that one day he will be stranded in 1969. Carefully, she hands him her conversation folder—a file containing all the evidence and revelations gathered over time. Martha’s impatient call and the Doctor’s whimsical remark about \'four things and a lizard\' add a touch of surreal humor, even as the stakes remain high. This passing of the baton solidifies their shared destiny and sets the narrative course for the Doctor’s upcoming trials.',
        e.sequence = 3,
        e.key_dialogue = ["SALLY: Okay, listen. One day you're going to get stuck in 1969. Make sure you've got this with you. You're going to need it.", "DOCTOR: Got to dash... Well, four things. Well, four things and a lizard."]
    ;
MERGE (e:Event {uuid: 'event_46_4'})
    ON CREATE SET
        e.title = 'Parting and New Beginnings',
        e.description = 'In the final moments of the scene, the tension subtly yields to a bittersweet farewell. After a brief identification exchange where the Doctor confirms Sally’s name, Larry Nightingale reappears holding a carton of milk, symbolizing the return to normalcy amidst the chaos. Sally, reconnecting with her everyday life, says a tender goodbye to the Doctor as she and Larry step back into the DVD store. The moment is charged with both sorrow and hope, as the montage of ominous public statuary and the Doctor\'s final onscreen warning, \'Don\'t blink,\' underscore the perpetual interplay of mystery and time that binds their fates.',
        e.sequence = 4,
        e.key_dialogue = ["DOCTOR: What was your name?", "SALLY: Sally Sparrow.", "DOCTOR: Good to meet you, Sally Sparrow.", "SALLY: Goodbye, Doctor."]
    ;
MATCH (o:Object {uuid: 'object_camera'}),
          (a:Agent {uuid: 'agent_sally_sparrow'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dressing_gown'}),
          (a:Agent {uuid: 'agent_kathy_nightingale'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_ancient_letter'}),
          (a:Agent {uuid: 'agent_malcolm'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_seventeen_dvd_list'}),
          (a:Agent {uuid: 'agent_larry_nightingale'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_timey_wimey_detector'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sally_dvd_collection'}),
          (a:Agent {uuid: 'agent_sally_sparrow'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_transcript_message'}),
          (a:Agent {uuid: 'agent_larry_nightingale'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dvd_case'}),
          (a:Agent {uuid: 'agent_larry_nightingale'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_conversation_folder'}),
          (a:Agent {uuid: 'agent_sally_sparrow'})
    MERGE (a)-[:OWNS]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_camera_event_1_1'})
    ON CREATE SET
        oi.description = 'The camera serves as a crucial tool in this event, allowing Sally to meticulously document the haunting details of Wester Drumlin House. It captures images of broken, plastic-covered chandeliers, abandoned pieces of furniture, and the intricate decay of the environment, thereby preserving evidence of the eerie atmosphere and hidden clues that hint at deeper mysteries.',
        oi.status_before = 'Prior to the event, the camera is in Sally’s possession, fully functional and ready for action, symbolizing her preparedness and determination to record every significant detail.',
        oi.status_after = 'Following the event, the camera continues to be a vital witness to the unfolding mystery, containing extensive photographic evidence that corroborates Sally’s discoveries and serves as an indispensable record of the house’s decayed grandeur and mysterious inscriptions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_camera'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_thrown_pot_event_1_2'})
    ON CREATE SET
        oi.description = 'The thrown pot is the catalyst for the tension in this moment; it violently crashes through a window and shatters, serving as the physical trigger that forces Sally to duck. Its unexpected flight disrupts the precarious calm of the interior, intertwining physical danger with the supernatural warning that has been unveiled, and encapsulating the immediate peril in the scene.',
        oi.status_before = 'Prior to the event, the pot was a heavy, stationary object, likely set aside among other remnants of the decrepit interior.',
        oi.status_after = 'After the event, the pot is broken and scattered on the floor, its shattered fragments underscoring the sudden and violent interruption of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_thrown_pot'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_1_3'})
    ON CREATE SET
        oi.description = 'The statue of the Weeping Angel serves as a silent, imposing focal point in the eerie overgrown garden. Lit by the beam of Sally’s torch, its outstretched hands covering a sorrowful face project an almost sentient presence that freezes the very passage of time. The object acts not only as a harbinger of danger but also as a symbolic sentinel that deepens the cryptic narrative. Its immobile, stony gaze reinforces the supernatural phenomenon at work, compelling Sally to confront and decipher the alarming message left behind.',
        oi.status_before = 'Prior to the event, the statue stood undisturbed in the garden, a weathered yet dignified monument whose presence was known but taken for granted as part of the old house’s ambiance.',
        oi.status_after = 'After the encounter, the statue remains unmoving and shrouded in mystery but its narrative significance is heightened, its silent vigil echoing the dire warnings and enigmatic message now etched into the unfolding story.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow scales the imposing wrought iron gates with determined agility, climbing over the barrier on a cold, wet night. She marches up the gravel driveway with a confident gait, her eyes alert to every detail of the decaying house, and her posture radiates the thrill of discovery as she prepares to document every eerie contour.',
        ap.emotional_state = 'Sally exudes a mix of exhilaration and focused determination. Outwardly, her face is set in a confident, almost mischievous grin that belies an inner surge of adrenaline and cautious curiosity. Beneath her calm exterior, she battles a subtle tension and anticipation, aware that each step into the crumbling house is fraught with mysterious danger yet irresistibly compelling. Her internal state reveals an unwavering resolve to uncover hidden truths, even as her instincts whisper warnings of the unknown.',
        ap.emotional_tags = ["Sally exudes a mix of exhilaration", "focused determination. Outwardly, her face is set in a confident, almost mischievous grin that belies an inner surge of adrenaline", "cautious curiosity. Beneath her calm exterior, she battles a subtle tension", "anticipation, aware that each step into the crumbling house is fraught with mysterious danger yet irresistibly compelling. Her internal state reveals an unwavering resolve to uncover hidden truths, even as her instincts whisper warnings of the unknown."],
        ap.active_plans = ["Capture detailed photographic evidence of the decaying interior and mysterious artifacts.", "Investigate the hidden messages revealed under the peeling wallpaper.", "Document the atmospheric anomalies of the abandoned house to unravel its secret history."],
        ap.beliefs = ["Curiosity is the key to uncovering hidden truths.", "Every decaying relic holds a story waiting to be told.", "Facing danger head-on is necessary to reveal the mysteries of the past."],
        ap.goals = ["Short-term: Secure clear, compelling photographs of the eerie setting and mysterious clues.", "Medium-term: Piece together the historical and supernatural significance of the inscriptions and artifacts found within the house.", "Ultimate: Unravel the deeper mystery linked to the ominous message and its connection to a larger, enigmatic narrative."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Inside the dim, desolate interior of the house, Sally Sparrow is moving purposefully towards a section of peeling wallpaper. With her camera and flashlight in hand, she hesitates only a moment to pull away a loose strip, her body tense and agile as she reveals a fragmented letter. Her eyes dart toward the approaching danger, and in one fluid, reactive motion, she ducks sharply as a thrown pot shatters the window behind her.',
        ap.emotional_state = 'Sally’s outward expression is one of determined focus and alert urgency, her face set in a mix of curiosity and caution. Beneath this calm exterior, she experiences a swirl of anxiety and apprehension as adrenaline surges through her, fueled by her deep-seated need to uncover the mystery while simultaneously fighting fear of imminent danger.',
        ap.emotional_tags = ["Sally\u2019s outward expression is one of determined focus", "alert urgency, her face set in a mix of curiosity", "caution. Beneath this calm exterior, she experiences a swirl of anxiety", "apprehension as adrenaline surges through her, fueled by her deep-seated need to uncover the mystery while simultaneously fighting fear of imminent danger."],
        ap.active_plans = ["Investigate the full meaning behind the chilling message on the wall.", "Maintain situational awareness and avoid harm from unexpected dangers.", "Secure evidence that substantiates the supernatural warning."],
        ap.beliefs = ["Curiosity is essential to unraveling the hidden truths of extraordinary events.", "Quick, decisive action is necessary when confronted with unexplained dangers.", "Every mystery holds a deeper significance that must be uncovered through relentless inquiry."],
        ap.goals = ["Short-term: React instantly to avoid immediate danger by ducking before the pot impacts.", "Medium-term: Gather detailed evidence and clues about the eerie message and its origins.", "Ultimate: Uncover the mystery behind the Weeping Angel and understand the role of the Doctor in these events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands tense in the overgrown garden near the boarded window, her torch in hand illuminating every detail as she carefully investigates the peeling wallpaper that revealed the mysterious message and the eerie presence of the statue.',
        ap.emotional_state = 'Externally, Sally appears alert and resolute, with narrowed eyes and a firm set to her jaw as she processes the surreal discovery. Beneath this calm exterior, her heart races with unease and unsettling curiosity, torn between the instinct to retreat and a deep-seated need to uncover the strange connections hinted at by the message ‘Love from the Doctor (1969)’. Her internal conflict is marked by a blend of fear, excitement, determination, and a shadow of uncertainty about the peril that lies ahead.',
        ap.emotional_tags = ["Externally, Sally appears alert", "resolute, with narrowed eyes", "a firm set to her jaw as she processes the surreal discovery. Beneath this calm exterior, her heart races with unease", "unsettling curiosity, torn between the instinct to retreat", "a deep-seated need to uncover the strange connections hinted at by the message \u2018Love from the Doctor (1969)\u2019. Her internal conflict is marked by a blend of fear, excitement, determination,", "a shadow of uncertainty about the peril that lies ahead."],
        ap.active_plans = ["Investigate the precise placement and significance of the statue to understand its role in the unfolding mystery.", "Decipher the cryptic message revealed on the peeling wallpaper to establish a connection with the Doctor and the danger he foretold.", "Carefully document and preserve every detail of the encounter, ensuring that no clue is lost as she prepares for what may lie ahead."],
        ap.beliefs = ["Phenomena that defy common sense are key to unraveling deeper mysteries.", "Every message, however cryptic, is a deliberate warning meant to guide her.", "Confronting danger head-on is essential for uncovering hidden truths about her world."],
        ap.goals = ["Short-term: Secure her immediate safety while gathering crucial visual and physical evidence of the strange occurrences.", "Medium-term: Decode and connect the unveiled messages and symbols to the broader narrative involving the Doctor.", "Ultimate: Unravel the mystery behind the Weeping Angel and the time-warped signals, ensuring she can use the information to navigate the perilous journey ahead."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_monitor_screens_event_2_1'})
    ON CREATE SET
        oi.description = 'The monitor screens in the hallway continuously display images and urgent messages from the Doctor, creating an ambient echo of impending danger. They serve as both a visual anchor and a technological conduit that underlines the narrative tension, reinforcing the uncertainty Sally feels as she calls out for Kathy.',
        oi.status_before = 'Before the event, the monitor screens are steadily glowing and cycling through cryptic, static images and eerie warnings, maintaining a dispassionate yet ominous presence on the wall.',
        oi.status_after = 'After the event, the monitor screens continue their relentless broadcast of urgent messages and images, unchanged in operation but deepening the sense of foreboding, mirroring the unresolved crisis that Sally senses in the hallway.'
    WITH oi
    MATCH (o:Object {uuid: 'object_monitor_screens'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_monitor_screens_event_2_2'})
    ON CREATE SET
        oi.description = 'The monitor screens serve as a critical medium for broadcasting The Doctor\'s dire warning. Their steady, eerie glow projects his urgent message throughout the room, creating an atmosphere of suspense and dread. They continuously display his stern image and resonate with the cryptic, rapid-fire admonitions that heighten the sense of impending peril.',
        oi.status_before = 'Before the event, the monitor screens were mounted along the wall, quietly active with a steady, ambient light and periodic images.',
        oi.status_after = 'After the delivery of The Doctor’s warning, the screens remain active, now displaying his urgent and unsettling visage nonstop, reinforcing the dire message and serving as a constant reminder of the fatal threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object_monitor_screens'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands alone in the quiet, dimly lit hallway, her figure partially obscured by shadows and the intermittent glow of monitor screens. She pauses mid-step and calls out \'Kathy?\' in a clear but trembling voice, her body tense and alert as she searches the gloom for signs of a familiar presence.',
        ap.emotional_state = 'Outwardly, Sally’s expression reveals a mixture of determination and anxious vulnerability, as her voice cracks slightly with both uncertainty and a desperate need for connection. Deep within, she battles an inner conflict between professional curiosity and personal fear, feeling isolated yet compelled to reach out despite the foreboding atmosphere created by the eerie monitors.',
        ap.emotional_tags = ["Outwardly, Sally\u2019s expression reveals a mixture of determination", "anxious vulnerability, as her voice cracks slightly with both uncertainty", "a desperate need for connection. Deep within, she battles an inner conflict between professional curiosity", "personal fear, feeling isolated yet compelled to reach out despite the foreboding atmosphere created by the eerie monitors."],
        ap.active_plans = ["Confirm Kathy's whereabouts and secure a connection with someone she trusts.", "Gauge the nature of the cryptic crisis unfolding around her.", "Maintain vigilance while trying to piece together the emotional and narrative significance of the moment."],
        ap.beliefs = ["She believes that every mystery holds a personal truth waiting to be uncovered.", "She holds that emotional connection is essential even amid terror.", "She trusts her instincts and perseverance in confronting the unknown."],
        ap.goals = ["Short-term: To immediately determine if Kathy is nearby and if she can be reassured in this tense moment.", "Medium-term: To understand the layered warnings broadcast through the monitor screens and integrate them into her investigation.", "Ultimate: To reclaim a sense of safety and connection in a world filled with unexplained, menacing events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears on the glowing monitor screens with a stern and commanding demeanor. His image is crisp and urgent as he projects his dire warnings, his eyes seemingly fixed on an unseen threat. His posture and tone exude a mix of authority and haste as he delivers his message.',
        ap.emotional_state = 'On the surface, The Doctor presents a calm and measured façade, yet there is an undeniable undercurrent of anxiety and urgency. His voice carries a weight of responsibility and hidden concern, as he battles internal conflict between his unpredictable nature and the overwhelming need to protect. Every word is laced with determined gravity and a hint of sorrow for the precarious situation unfolding.',
        ap.emotional_tags = ["On the surface, The Doctor presents a calm", "measured fa\u00e7ade, yet there is an undeniable undercurrent of anxiety", "urgency. His voice carries a weight of responsibility", "hidden concern, as he battles internal conflict between his unpredictable nature", "the overwhelming need to protect. Every word is laced with determined gravity", "a hint of sorrow for the precarious situation unfolding."],
        ap.active_plans = ["Alert Sally to the imminent danger through urgent and cryptic warnings", "Instruct her to maintain unwavering vigilance by not blinking", "Underscore the severity of the threat to ensure immediate caution"],
        ap.beliefs = ["Vigilance and attention to detail are essential for survival against enigmatic threats", "Every moment counts and even a brief lapse can prove fatal", "Time and warning can be harnessed to avert catastrophic events"],
        ap.goals = ["Short-term: Ensure Sally comprehends the life-threatening urgency of the situation", "Medium-term: Guide her actions to avert the dangerous consequences of inattention", "Ultimate: Prevent the deadly outcome by empowering her with precise warnings and instructions"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_mobile_phone_event_3_1'})
    ON CREATE SET
        oi.description = 'The mobile phone plays a crucial role in the event by abruptly breaking the silence of Kathy’s bedroom and compelling her attention. Its unexpected ring acts as a narrative trigger that disrupts the quiet, forcing Kathy to transition from sleep to wakefulness. The phone serves as a link to the outside world, symbolizing communication and the underlying loneliness in her current state, while its sound carries subtext that resonates with her inner vulnerability.',
        oi.status_before = 'Prior to the event, the mobile phone rested quietly on the bedside table in a dormant yet ready state, likely set aside without any active notifications, contributing to the calm of the room.',
        oi.status_after = 'Following the ring and Kathy’s immediate response, the mobile phone remains operational and central to the unfolding communication, its active ring having transformed it into an interactive focal point that underscores the moment’s narrative significance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_mobile_phone'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Kathy is in her bedroom, sitting upright on the edge of her bed with a half-awakened posture. She reaches over with a hesitant but deliberate movement towards the bedside table as the mobile phone’s persistent ring slices through the quiet. Every physical gesture, from the slight frown to her cautious hand extension, conveys a heightened alertness despite her lingering grogginess.',
        ap.emotional_state = 'On the surface, Kathy displays a mild surprise combined with tentative curiosity as she answers the phone; her voice soft and uncertain. Beneath that lies a quiet anxiety and a profound sense of isolation, as the sudden ring forces her to momentarily confront feelings of vulnerability and disruption. There is an internal tension between a desire for connection and the cautious wariness of being drawn into an unexpected communication, reflecting her underlying emotional conflicts.',
        ap.emotional_tags = ["On the surface, Kathy displays a mild surprise combined with tentative curiosity as she answers the phone; her voice soft", "uncertain. Beneath that lies a quiet anxiety", "a profound sense of isolation, as the sudden ring forces her to momentarily confront feelings of vulnerability", "disruption. There is an internal tension between a desire for connection", "the cautious wariness of being drawn into an unexpected communication, reflecting her underlying emotional conflicts."],
        ap.active_plans = ["Answer the phone promptly to determine the nature of the call.", "Assess the urgency or any hidden meaning behind the unexpected interruption.", "Gather internal composure to maintain control of her waking state while processing potential implications."],
        ap.beliefs = ["Communication is essential even in moments of vulnerability.", "Unexpected interruptions may carry hidden significance in a complex world.", "Personal truth and direct responses are vital even when one feels isolated."],
        ap.goals = ["Short-term: Quickly understand the reason for the phone call without being overwhelmed by her grogginess.", "Medium-term: Establish a connection that may provide clarity or comfort in her isolated state.", "Ultimate: Reclaim a sense of personal stability and agency despite the unsettling interruptions in her private space."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_coffee_event_4_1'})
    ON CREATE SET
        oi.description = 'The coffee is central to this intimate late-night exchange, serving as both a comfort object and a subtle invitation for dialogue. Sally brews and prepares the cup as a practical gesture that symbolically bridges her internal crisis and her need for human connection, while also adding a warm, sensory detail to the tense atmosphere.',
        oi.status_before = 'Prior to the event, the coffee is unprepared and waiting as raw ingredients in the kitchen, representing the routine potential for a moment of solace.',
        oi.status_after = 'Following the event, the coffee is freshly brewed and steaming in a cup, symbolizing Sally’s attempt to create a moment of calm and serve as a tangible manifestation of care and reassurance amid emotional turbulence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_coffee'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_4_1'})
    ON CREATE SET
        ap.current_status = 'In the warmly lit kitchen, Sally Sparrow stands at the counter with a measured, deliberate air as she brews a fresh pot of coffee. She methodically prepares the coffee using careful, practiced gestures—stirring and pouring with precision—while glancing over her shoulder as if expecting a response. Her physical presence exudes a mix of domestic routine and urgent readiness to transition to conversation.',
        ap.emotional_state = 'Sally’s face betrays visible anxiety combined with a deep inner turmoil, as her eyes dart with concern and a furrowed brow hints at unspoken distress. Although she masks her vulnerability behind pragmatic actions, the tension in her slight frown and restless movements reveals a quiet desperation to find solace and clarity in the midst of unsettling events.',
        ap.emotional_tags = ["Sally\u2019s face betrays visible anxiety combined with a deep inner turmoil, as her eyes dart with concern", "a furrowed brow hints at unspoken distress. Although she masks her vulnerability behind pragmatic actions, the tension in her slight frown", "restless movements reveals a quiet desperation to find solace", "clarity in the midst of unsettling events."],
        ap.active_plans = ["Initiate a conversation with Kathy by using the act of making coffee as a gentle ice-breaker.", "Reassure herself through the familiar routine of preparing a comforting drink.", "Bridge the emotional gap created by earlier disturbances and seek emotional support from her friend."],
        ap.beliefs = ["Shared moments of warmth and routine can help soothe inner fears.", "Taking deliberate actions in small domestic tasks can serve as a grounding force during times of crisis.", "Open communication, even at odd hours, is essential to confront and process unsettling emotions."],
        ap.goals = ["Short-term: To calm her nerves and set the stage for a meaningful conversation.", "Medium-term: To reconnect with Kathy and gain reassurance about the previous events.", "Ultimate: To restore a sense of normalcy and personal stability amid the unfolding larger narrative."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Although Kathy Nightingale does not physically appear in the kitchen, her presence is strongly felt through her off-screen response during the phone call. Her voice carries an assertive and unmistakably irate tone as she questions the practicality of a midnight visit, conveying both exasperation and pragmatism. The terse verbal interjection positions her as a grounded counterbalance to Sally’s emotional state.',
        ap.emotional_state = 'Kathy’s emotional expression is layered with irritation and reluctant resignation. On the surface, she communicates a blunt dismissal of late-night antics, yet beneath the brusque tone lies a hint of concern and a recognition of the gravity behind Sally’s need to talk. This internal conflict reveals her struggle to balance her desire for normalcy with an undercurrent of caring that tugs at her despite the inconvenience.',
        ap.emotional_tags = ["Kathy\u2019s emotional expression is layered with irritation", "reluctant resignation. On the surface, she communicates a blunt dismissal of late-night antics, yet beneath the brusque tone lies a hint of concern", "a recognition of the gravity behind Sally\u2019s need to talk. This internal conflict reveals her struggle to balance her desire for normalcy with an undercurrent of caring that tugs at her despite the inconvenience."],
        ap.active_plans = ["Clarify her unavailability by expressing reluctance to join a late-night visit.", "Maintain a protective distance while still remaining responsive to Sally\u2019s call.", "Impose practical boundaries to preserve her own sense of order during the late hour."],
        ap.beliefs = ["Late-night interruptions disrupt essential rest and personal routines.", "Direct and candid communication is necessary in managing both personal and external disturbances.", "Emotional well-being comes from maintaining a disciplined and structured approach to unexpected situations."],
        ap.goals = ["Short-term: To quickly communicate her reservations about the late-night meeting.", "Medium-term: To ensure that the practical aspects of her day remain undisturbed despite Sally\u2019s distress.", "Ultimate: To safeguard her personal boundaries while still staying connected to those she cares about."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_monitor_screens_event_5_1'})
    ON CREATE SET
        oi.description = 'The monitor screens cast an eerie glow in the front room, displaying a sequence of enigmatic images and urgent messages that capture Sally’s attention. Their presence serves as a technological beacon of mystery, merging the mundane with the supernatural and inviting interrogation into their hidden meanings.',
        oi.status_before = 'Prior to the event, the screens were steadily displaying routine or cryptic data on a dark wall, contributing an almost background-level ambiance of unease.',
        oi.status_after = 'Following Sally’s inquiry, the images and messages on the screens appear more charged and unsettling, as if reacting to her probing curiosity and hinting at deeper narrative currents yet to be unraveled.'
    WITH oi
    MATCH (o:Object {uuid: 'object_monitor_screens'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_5_1'})
    ON CREATE SET
        ap.current_status = 'In the kitchen, Sally Sparrow stands alert yet relaxed, leaning slightly forward as she glances toward the mysterious monitor screens in the front room. Her body language is poised with a hint of urgency, as she balances domestic familiarity with a keen eye for the unfolding enigma outside the immediate space.',
        ap.emotional_state = 'Sally exhibits a layered mix of outward calm and internal tension; she is curious and determined while also feeling a subtle undercurrent of apprehension. Beneath her inquisitive gaze lies a storm of cautious excitement and personal resolve, driven by the need to uncover hidden truths without succumbing to fear.',
        ap.emotional_tags = ["Sally exhibits a layered mix of outward calm", "internal tension; she is curious", "determined while also feeling a subtle undercurrent of apprehension. Beneath her inquisitive gaze lies a storm of cautious excitement", "personal resolve, driven by the need to uncover hidden truths without succumbing to fear."],
        ap.active_plans = ["Investigate the cryptic messages displayed on the monitor screens.", "Establish a connection with the unfolding mystery and possibly contact the Doctor for further clarity.", "Bridge the normalcy of her kitchen environment with the unsettling mysteries emanating from the front room."],
        ap.beliefs = ["Sally believes that every strange occurrence hides a deeper truth that must be uncovered.", "She is convinced that curiosity combined with cautious persistence is key to understanding mysteries.", "Sally holds that confronting the unknown, even if unsettling, is necessary to protect those she cares about."],
        ap.goals = ["Short-term: Determine exactly what the monitor screens are displaying and how it relates to the current mystery.", "Medium-term: Piece together clues from the monitors to guide her next investigative moves.", "Ultimate: Unravel the mystery behind the cryptic information to safeguard her future and that of her loved ones."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the bedroom, her posture tense and alert as she peers in a mix of concern and urgency toward Sally. Her gestures are sharp, and her eyes dart between the unsettling screens and Sally as she issues her pointed reminder.',
        ap.emotional_state = 'Kathy’s face reveals a layered mix of alarm and exasperation. Outwardly, her voice trembles with distress as she exclaims in disbelief, yet underneath, she struggles with a deep-seated responsibility to draw Sally’s attention to familial bonds amid the inexplicable disturbances, all while battling an internal conflict between fear and a fierce protective instinct.',
        ap.emotional_tags = ["Kathy\u2019s face reveals a layered mix of alarm", "exasperation. Outwardly, her voice trembles with distress as she exclaims in disbelief, yet underneath, she struggles with a deep-seated responsibility to draw Sally\u2019s attention to familial bonds amid the inexplicable disturbances, all while battling an internal conflict between fear", "a fierce protective instinct."],
        ap.active_plans = ["Ensure Sally recalls her connection to Larry to anchor her in a familiar reality.", "React to the bizarre occurrences on the screens by drawing attention to personal ties.", "Prompt a discussion that blends the surreal with domestic concerns to stabilize the situation."],
        ap.beliefs = ["Family connections are the cornerstone in times of upheaval.", "Personal relationships provide essential grounding against the unknown.", "It is vital to address both the emotional and factual realities, even when the situation becomes surreal."],
        ap.goals = ["Short-term: Remind Sally of her familial link to Larry to counter the disorienting chaos.", "Medium-term: Foster a sense of stability amidst the bizarre happenings by re-establishing familiar bonds.", "Ultimate: Preserve the integrity and warmth of family connections, ensuring that personal relationships remain a priority during and after the unsettling events."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dressing_gown_event_6_2'})
    ON CREATE SET
        oi.description = 'The dressing gown, a familiar and comforting article, is rapidly grabbed by Kathy in the midst of the crisis. Its acquisition underscores the urgency of her intervention, symbolizing both her readiness to address the disarray and her reliance on personal, home-spun items to assert control in a moment of absurdity and disorder.',
        oi.status_before = 'Before the event, the dressing gown was neatly arranged in the bedroom as part of Kathy’s regular home attire, embodying a state of calm domestic order.',
        oi.status_after = 'After the event, the dressing gown is in active use by Kathy, now disheveled from the rush. It marks the transition from a peaceful state to one of frantic action, highlighting the immediate need to reassert personal control amid chaos.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dressing_gown'})
    MATCH (e:Event {uuid: 'event_6_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the kitchen with an assertive posture, her voice firm as she utters a single \'No.\' Her body is tense, yet alert, with quick glances around the room as she processes the off-screen interruption. Every movement conveys an investigative readiness and a touch of incredulity at the absurd disruption unfolding at her doorstep.',
        ap.emotional_state = 'Sally exhibits a layered emotional response; externally she remains cool and dismissive with a simple, defiant \'No,\' but internally there is a swirl of confusion, irritation, and cautious anticipation. She feels the weight of unexpected chaos invading her safe space, while behind the calm exterior lies anxiety about the unexpected intrusion and the surreal nature of the encounter. Her emotions are conflicted, mingling bemusement with a desire to regain control over the bizarre situation.',
        ap.emotional_tags = ["Sally exhibits a layered emotional response; externally she remains cool", "dismissive with a simple, defiant 'No,' but internally there is a swirl of confusion, irritation,", "cautious anticipation. She feels the weight of unexpected chaos invading her safe space, while behind the calm exterior lies anxiety about the unexpected intrusion", "the surreal nature of the encounter. Her emotions are conflicted, mingling bemusement with a desire to regain control over the bizarre situation."],
        ap.active_plans = ["Assess the sudden intrusion and determine if it poses any real threat.", "Maintain her composure while gathering information about the absurd appearance of the naked man.", "Restore the disrupted domestic order by clarifying the situation and possibly addressing the off-screen cues from Kathy."],
        ap.beliefs = ["She believes that clarity and rational investigation can overcome even the most absurd intrusions.", "She is convinced that maintaining control over her environment is essential for safety.", "She holds that unexpected events, no matter how bizarre, must be confronted head-on with defiance and resourcefulness."],
        ap.goals = ["Short-term: Immediately gauge the nature of the disruption and decide whether to engage or retreat.", "Medium-term: Work to re-establish a sense of normalcy in the kitchen despite the jarring interruption.", "Ultimate: Resolve the underlying mystery behind the unexpected entrance while preserving her investigative integrity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Larry is present in the kitchen scene with a measured, almost nonchalant stance. He observes the unfolding chaos with a wry expression and delivers his humorous remark about hoping for pants, displaying a blend of cautious detachment and pragmatic curiosity. His body language is relaxed yet alert, as he drifts slightly apart from the central action while keeping a watchful eye on the unfolding disruptions.',
        ap.emotional_state = 'Larry’s emotional response is a mix of bemused detachment and underlying anxiety. Outwardly, his light-hearted comment about pants masks a deeper concern for the stability of the situation, as he internally wrestles with confusion and discomfort over the surreal appearance of the unclothed intruder. He experiences a tension between using humor as a coping mechanism and a genuine worry about the unpredictable nature of events, causing him to keep his emotions in check while remaining ever vigilant.',
        ap.emotional_tags = ["Larry\u2019s emotional response is a mix of bemused detachment", "underlying anxiety. Outwardly, his light-hearted comment about pants masks a deeper concern for the stability of the situation, as he internally wrestles with confusion", "discomfort over the surreal appearance of the unclothed intruder. He experiences a tension between using humor as a coping mechanism", "a genuine worry about the unpredictable nature of events, causing him to keep his emotions in check while remaining ever vigilant."],
        ap.active_plans = ["Mitigate the awkwardness of the situation by interjecting humor to diffuse tension.", "Stay observant to identify any potential escalation in the disruption.", "Gradually extricate himself from the chaotic scenario if it worsens, while ensuring his own safety and minimal interference."],
        ap.beliefs = ["He believes that humor is an effective tool in countering absurd and unsettling circumstances.", "He is convinced that maintaining a cautious and pragmatic approach will eventually restore order.", "He holds that personal safety and measured responses are paramount in unexpected and chaotic events."],
        ap.goals = ["Short-term: Calm the immediate tension with a lighthearted remark to counterbalance the shock.", "Medium-term: Assess the situation and decide on the best practical course of action to limit further disruption.", "Ultimate: Ensure that everyday normalcy is restored and that any underlying issues causing the disruption are eventually resolved."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Kathy stands amid the unfolding chaos in the kitchen, having abruptly ended her phone call. With a brisk, determined stride, she steps out of the bedroom, having just snatched up her dressing gown. Her posture is assertive, and she commands the room with urgent gestures, signaling her intent to restore order in an absurd situation.',
        ap.emotional_state = 'Kathy is visibly exasperated and frustrated as she shouts, \'Put them on! Put them on! I hate you! What\'re you thinking?\' Her face reflects a mix of stern authority and anxious concern. Beneath her forceful exterior, however, lies a deep-seated caring instinct and a desire to protect her family from further disarray, revealing an inner conflict between irritation and compassionate resolve.',
        ap.emotional_tags = ["Kathy is visibly exasperated", "frustrated as she shouts, 'Put them on! Put them on! I hate you! What're you thinking?' Her face reflects a mix of stern authority", "anxious concern. Beneath her forceful exterior, however, lies a deep-seated caring instinct", "a desire to protect her family from further disarray, revealing an inner conflict between irritation", "compassionate resolve."],
        ap.active_plans = ["Prompt her family to immediately comply with her command and put on clothing.", "Confront the chaotic behavior head-on to re-establish domestic order.", "Maintain control of the situation by using decisive, authoritative actions."],
        ap.beliefs = ["She believes that swift, decisive action in chaos prevents further disaster.", "Kathy values conformity and accountability within the family.", "She is convinced that even in absurd circumstances, order must be re-established immediately."],
        ap.goals = ["Short-term: Ensure that everyone follows her command and dresses properly.", "Medium-term: Stabilize the unfolding household chaos.", "Ultimate: Restore a sense of normalcy and order within the family environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the kitchen area with an air of resolute concern, having just exited the bedroom in haste. Her posture is upright yet softened by regret as she speaks with measured reproach towards Larry and then focuses her attention on Sally.',
        ap.emotional_state = 'Outwardly, Kathy shows a clear blend of firmness and tenderness; her tone is apologetic as she calls Larry \'my useless brother\' and shifts to inquire earnestly about Sally’s distress. Beneath that, she feels deep frustration with the chaos caused by familial missteps and genuine worry for Sally’s well‐being, struggling with conflicting impulses of admonition and care.',
        ap.emotional_tags = ["Outwardly, Kathy shows a clear blend of firmness", "tenderness; her tone is apologetic as she calls Larry 'my useless brother'", "shifts to inquire earnestly about Sally\u2019s distress. Beneath that, she feels deep frustration with the chaos caused by familial missteps", "genuine worry for Sally\u2019s well\u2010being, struggling with conflicting impulses of admonition", "care."],
        ap.active_plans = ["Calm the immediate tension by apologizing for Larry\u2019s irresponsibility.", "Directly engage with Sally to understand what went wrong.", "Restore order and encourage open dialogue in the aftermath of the shocking events."],
        ap.beliefs = ["Family accountability and direct communication are essential.", "Regret over misbehavior should be acknowledged to mend rifts.", "Maintaining a caring and supportive environment is necessary even amidst surreal turmoil."],
        ap.goals = ["Short-term: Immediately soothe Sally\u2019s distress and clarify the events.", "Medium-term: Correct Larry\u2019s behavior to prevent further upsetting incidents.", "Ultimate: Mend the underlying familial tension and restore a sense of normalcy in their lives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Sally remains in the kitchen, visibly affected by the earlier upheaval. Her body language is reserved and slightly withdrawn as she listens to Kathy’s concerned inquiry, her expression a mixture of shock and lingering confusion.',
        ap.emotional_state = 'Sally’s external calm belies a turbulent inner state; she is still reeling from the bizarre events and her voice, though brief, hints at deep-seated shock and unresolved distress. Internally she battles between a desire to articulate her feelings and the overwhelming need to process the inexplicable circumstances, leaving her emotionally raw and searching for solace.',
        ap.emotional_tags = ["Sally\u2019s external calm belies a turbulent inner state; she is still reeling from the bizarre events", "her voice, though brief, hints at deep-seated shock", "unresolved distress. Internally she battles between a desire to articulate her feelings", "the overwhelming need to process the inexplicable circumstances, leaving her emotionally raw", "searching for solace."],
        ap.active_plans = ["Attempt to explain or articulate the events that have unsettled her.", "Process the emotional impact of the shock in order to regain composure.", "Evaluate the surreal incident with cautious determination to find answers."],
        ap.beliefs = ["No matter how strange the circumstances, the truth must be confronted.", "Understanding the bizarre events is crucial to restoring her inner stability.", "Her role as an investigator of the extraordinary requires facing discomfort head-on."],
        ap.goals = ["Short-term: Communicate what happened to gain clarity and reassurance.", "Medium-term: Recover from the immediate shock and begin piecing together the events.", "Ultimate: Resolve the mystery underpinning these events to regain control over her life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow strides confidently as she climbs the aged, formidable gates of Wester Drumlin House under the morning sun. Her posture is upright and alert, her hands steady on the gate\'s rusty bars, and her eyes scanning the horizon for clues to the mystery ahead.',
        ap.emotional_state = 'Sally wears a playful yet determined smile that belies a mix of excitement and a subtle apprehension about the unknown. While her outward demeanor is light and witty, her heart pounds with anticipation and a deep internal resolve to uncover the hidden truths of the derelict estate.',
        ap.emotional_tags = ["Sally wears a playful yet determined smile that belies a mix of excitement", "a subtle apprehension about the unknown. While her outward demeanor is light", "witty, her heart pounds with anticipation", "a deep internal resolve to uncover the hidden truths of the derelict estate."],
        ap.active_plans = ["Initiate a thorough investigation of the estate and its secrets.", "Collaborate closely with Kathy to pool observations and deduce clues.", "Maintain vigilance against unexpected surprises while gathering evidence on site."],
        ap.beliefs = ["Every mystery contains hidden truths waiting to be unveiled.", "Curiosity and courage are indispensable in the pursuit of knowledge.", "The past holds essential clues that will illuminate the future."],
        ap.goals = ["Short-term: Successfully scale the gates and enter Wester Drumlin House.", "Medium-term: Collect and piece together clues to gradually unravel the estate's secrets.", "Ultimate: Achieve a comprehensive understanding of the mystery to bring hidden truths to light."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Kathy Nightingale energetically climbs the weathered gates alongside Sally, her movements brisk and animated. Gesturing with lively expressions, she leads the way with a confident stride that underscores her determination and readiness to tackle the mystery head-on.',
        ap.emotional_state = 'Kathy exhibits buoyant enthusiasm mixed with a razor-sharp wit. Her assertive banter and playful declarations mask a deep-seated resolve and commitment to the investigation, reflecting both her passion for uncovering the truth and a subtle awareness of the risks that lie ahead.',
        ap.emotional_tags = ["Kathy exhibits buoyant enthusiasm mixed with a razor-sharp wit. Her assertive banter", "playful declarations mask a deep-seated resolve", "commitment to the investigation, reflecting both her passion for uncovering the truth", "a subtle awareness of the risks that lie ahead."],
        ap.active_plans = ["Co-lead the investigation by actively exploring the grounds of the estate.", "Rally and synergize with Sally\u2019s insights to track down lurking clues.", "Overcome any physical or investigative barriers with bold, decisive action."],
        ap.beliefs = ["Truth is best revealed through collaborative inquiry and determined investigation.", "Personal bonds and shared adventures are vital in overcoming challenges.", "Life\u2019s mysteries should be approached with a balanced mix of humor and seriousness."],
        ap.goals = ["Short-term: Secure access by successfully scaling the gates and starting the investigation.", "Medium-term: Work in tandem with Sally to uncover and decode the estate\u2019s hidden messages.", "Ultimate: Crack the mystery of Wester Drumlin House, validating their detective skills and unearthing the secrets within."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_8_1'})
    ON CREATE SET
        ap.current_status = 'In the quiet entrance hall, Kathy stands firmly with a measured, composed posture. Her eyes are intent and alert as she faces Sally, gesturing subtly with a raised eyebrow and gentle tilt of her head, embodying both poise and unspoken inquiry in her stance.',
        ap.emotional_state = 'Kathy appears outwardly calm and matter-of-fact, yet beneath that serene exterior lies a layered mix of concern, apprehension, and a hint of sadness. Internally, she is wrestling with uncertainty and a desire for clarity; her focused gaze and steady tone mask an undercurrent of emotional conflict and the longing to understand deeper truths about Sally’s connection to the past.',
        ap.emotional_tags = ["Kathy appears outwardly calm", "matter-of-fact, yet beneath that serene exterior lies a layered mix of concern, apprehension,", "a hint of sadness. Internally, she is wrestling with uncertainty", "a desire for clarity; her focused gaze", "steady tone mask an undercurrent of emotional conflict", "the longing to underst", "deeper truths about Sally\u2019s connection to the past."],
        ap.active_plans = ["To gently probe Sally about her underlying motivation for being there.", "To establish a conversation that might reveal hidden aspects of Sally\u2019s relationship with memories and old objects.", "To use her inquiry as a catalyst for deeper emotional exchange and reconnection."],
        ap.beliefs = ["She believes that honest, direct questioning can unveil hidden truths about personal history.", "She is convinced that the past holds essential insights into the present and that old memories are vital for understanding oneself.", "She holds that emotional clarity can be achieved through sincere conversation and mutual exchange."],
        ap.goals = ["Short-term: To learn the true reason behind Sally\u2019s arrival by asking a probing question.", "Medium-term: To bridge the emotional gap between the characters by encouraging deeper reflection on shared histories.", "Ultimate: To foster an environment where unresolved past issues can be addressed, contributing to lasting personal growth and a renewed sense of connection."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the entrance hall with a measured, gentle poise. Her eyes are soft and reflective as she speaks in a low, intimate tone to Kathy. Her body language is open yet reserved as she reveals her tender confession about her attraction to old things, absorbing the quiet ambience of the space.',
        ap.emotional_state = 'Sally exudes a poignant blend of wistfulness and vulnerability. Outwardly, her voice and demeanor betray a calm acceptance, yet internally she battles a deep melancholy and longing. This confession exposes a sincere interplay between beauty and sorrow, as hidden memories and unspoken losses stir within her, revealing layers of internal conflict and gentle resolve.',
        ap.emotional_tags = ["Sally exudes a poignant blend of wistfulness", "vulnerability. Outwardly, her voice", "demeanor betray a calm acceptance, yet internally she battles a deep melancholy", "longing. This confession exposes a sincere interplay between beauty", "sorrow, as hidden memories", "unspoken losses stir within her, revealing layers of internal conflict", "gentle resolve."],
        ap.active_plans = ["Embrace and articulate her inner emotions to deepen her connection with those around her.", "Use her confession as a catalyst for further introspection into the personal significance of relics and memories.", "Harness the bittersweet truth of her past to fuel her ongoing investigative pursuits in uncovering deeper mysteries."],
        ap.beliefs = ["She believes that the beauty of old things is inseparably linked with the sadness of remembering what has passed.", "She holds that relics are more than objects\u2014they are vessels of emotion and history, bearing the weight of personal loss and collective memory.", "She is convinced that acknowledging and understanding her deep-seated melancholy is essential for her growth as both an individual and an investigator."],
        ap.goals = ["Short-term: Open up to Kathy to share her inner world and validate her feelings of sorrow.", "Medium-term: Explore and document the emotional resonance of historical relics to better understand her personal past.", "Ultimate: Achieve personal healing by reconciling with her hidden losses and transforming her bittersweet memories into a source of strength."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_writing_on_the_wall_event_9_2'})
    ON CREATE SET
        oi.description = 'The writing on the wall serves as a silent yet provocative beacon that captures Sally’s attention and propels her into active investigation. Its cryptic message, layered with foreboding and wonder, not only challenges conventional understanding but also acts as the catalyst for Sally’s narrative shift from contemplation to exploration.',
        oi.status_before = 'Before the event, the inscription is a static, weathered mark on the wall—enigmatic and undisturbed, its meaning open to interpretation.',
        oi.status_after = 'After the event, while the physical nature of the inscription remains unchanged, its narrative significance is heightened as it becomes the driving force behind Sally’s investigation and emotional transformation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_writing_on_the_wall'})
    MATCH (e:Event {uuid: 'event_9_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the drawing room with a measured, attentive posture. She leans forward slightly as she poses her reflective query about sadness, her hands occasionally gesturing to emphasize her thoughtful inquiry, clearly engaged in a serious conversation.',
        ap.emotional_state = 'Kathy’s emotional state is layered with wistfulness and quiet determination. Outwardly, her voice carries genuine curiosity and a tinge of melancholy as she questions the value of sadness. Beneath the surface, she wrestles with unresolved grief and a deep-seated longing for clarity, feeling both vulnerable and resilient as she contemplates the bittersweet nature of emotional experience.',
        ap.emotional_tags = ["Kathy\u2019s emotional state is layered with wistfulness", "quiet determination. Outwardly, her voice carries genuine curiosity", "a tinge of melancholy as she questions the value of sadness. Beneath the surface, she wrestles with unresolved grief", "a deep-seated longing for clarity, feeling both vulnerable", "resilient as she contemplates the bittersweet nature of emotional experience."],
        ap.active_plans = ["To explore the deeper meaning of sadness through dialogue.", "To process and understand her own inner conflicts via reflective conversation.", "To seek emotional comfort and validation in sharing her personal philosophy."],
        ap.beliefs = ["Melancholy holds valuable insights into personal growth.", "Honesty in emotion, even sadness, is essential for authenticity.", "Reflective questioning leads to a more profound understanding of life."],
        ap.goals = ["Short-term: Clarify her understanding of sadness in the moment.", "Medium-term: Use this insight to guide her emotional responses in future interactions.", "Ultimate: Find personal resolution and achieve a lasting sense of inner authenticity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Sally is actively engaged in the conversation within the drawing room. She stands with confident poise, her gaze lively and sparkling as she delivers her witty retort. Her body language exudes energy and ease, making it clear she is both present and profoundly thoughtful during the exchange.',
        ap.emotional_state = 'Sally radiates a blend of clever detachment and deep introspection. Externally, her calm confidence and subtle smile mask an underlying complexity—she balances humor with a reflective sadness born from past experiences. Internally, her emotions are layered, mixing curiosity, guarded vulnerability, and resilient optimism as she contemplates the philosophical query about the nature of sadness.',
        ap.emotional_tags = ["Sally radiates a blend of clever detachment", "deep introspection. Externally, her calm confidence", "subtle smile mask an underlying complexity\u2014she balances humor with a reflective sadness born from past experiences. Internally, her emotions are layered, mixing curiosity, guarded vulnerability,", "resilient optimism as she contemplates the philosophical query about the nature of sadness."],
        ap.active_plans = ["To articulate her personal philosophy using subtle wit.", "To process the emotional nuances of the conversation and extract meaning.", "To transition her focus toward further introspection by moving to the conservatory and examining the garden and mysterious wall writings."],
        ap.beliefs = ["Deep individuals find hidden joy within melancholy.", "Humor is a doorway to uncovering life's deeper truths.", "Every personal experience contributes to a richer understanding of existence."],
        ap.goals = ["Short-term: Successfully articulate her view in the conversation.", "Medium-term: Seek further reflection and clarity by engaging with the surrounding environment.", "Ultimate: Integrate her newfound insights into her ongoing quest to unravel the deeper mysteries of her life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands in the drawing room with her body leaning slightly forward as she intently studies the mysterious inscription on the wall. Her eyes shimmer with curiosity and resolve, and her measured steps carry her purposefully toward the conservatory as she leaves the safe confines of the room.',
        ap.emotional_state = 'Sally’s face reflects a deep blend of contemplative introspection and determined excitement. Although outwardly calm, there is an undercurrent of anxious anticipation and internal curiosity stirring within her. She feels an irresistible pull to unravel the enigma, driven by a mix of wonder, resolve, and the subtle fear of what lies beyond the known.',
        ap.emotional_tags = ["Sally\u2019s face reflects a deep blend of contemplative introspection", "determined excitement. Although outwardly calm, there is an undercurrent of anxious anticipation", "internal curiosity stirring within her. She feels an irresistible pull to unravel the enigma, driven by a mix of wonder, resolve,", "the subtle fear of what lies beyond the known."],
        ap.active_plans = ["Decipher the cryptic inscription on the wall.", "Investigate the garden for additional clues and hidden meanings.", "Transition from passive contemplation to active exploration of the mystery."],
        ap.beliefs = ["Every cryptic message holds a deeper truth.", "Unraveling mysteries requires courage and relentless curiosity.", "Hidden clues are the keys to understanding the larger narrative."],
        ap.goals = ["Short-term: Understand the immediate significance of the inscription.", "Medium-term: Explore the conservatory and garden to gather further evidence.", "Ultimate: Uncover the full meaning behind the message and propel the unfolding mystery forward."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_10_1'})
    ON CREATE SET
        oi.description = 'The statue of the Weeping Angel plays a central role in creating a sense of dread and supernatural uncertainty within the conservatory. It is not merely a decorative object but a portent that has subtly shifted its position, indicating that its influence is changing the spatial relationship with the house. Its presence sparks both a scientific curiosity and an instinctive warning among the agents, underlining its narrative function as the harbinger of a deeper, enigmatic threat.',
        oi.status_before = 'Prior to the event, the statue was fixed in its usual position as an unmoving, silent guardian arranged on the landing, its stone expression and concealed eyes lending an air of eerie permanence.',
        oi.status_after = 'Following the event, the statue is observed to have moved closer to the house, a seemingly inexplicable shift that heightens the ominous mood and fuels the apprehensions of the agents about a supernatural force manipulating its form.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands in the dim light of the conservatory with a focused and deliberate stance. She is visibly observing the stone figure with a steady gaze, her body slightly leaning forward as she scrutinizes every inch of the Weeping Angel. Her fingers are tense and her eyes are unblinking, conveying that every detail matters in this moment of revelation.',
        ap.emotional_state = 'Outwardly, Sally displays a mix of cautious determination and a hint of apprehensive curiosity as she identifies the statue. Beneath her calm exterior, a turbulent surge of anxiety and foreboding churns within her, as she grapples with the uncanny movement of the angel. There is an inner conflict between rational investigation and the raw fear of an ancient, unknowable force.',
        ap.emotional_tags = ["Outwardly, Sally displays a mix of cautious determination", "a hint of apprehensive curiosity as she identifies the statue. Beneath her calm exterior, a turbulent surge of anxiety", "foreboding churns within her, as she grapples with the uncanny movement of the angel. There is an inner conflict between rational investigation", "the raw fear of an ancient, unknowable force."],
        ap.active_plans = ["Confirm the unusual movement of the statue and assess its threat.", "Alert Kathy and coordinate a response to the supernatural anomaly.", "Investigate further to understand the implications of the angel\u2019s closer proximity."],
        ap.beliefs = ["She believes that the supernatural defies normal physical laws.", "She is convinced that every small detail might be a deliberate sign from an otherworldly force.", "She trusts her instincts and that her investigative spirit will uncover the hidden truth behind the phenomenon."],
        ap.goals = ["Short-term: Verify the statue\u2019s shift and alert Kathy immediately.", "Medium-term: Decipher the significance of the movement and determine what actions are needed to counter potential dangers.", "Ultimate: Unravel the mystery of the Weeping Angels and protect those around her from this unpredictable threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Kathy Nightingale stands casually at the edge of the conservatory doorway, her posture relaxed yet attentive. She listens to Sally’s observation while maintaining a composed demeanor, hands loosely clasped or resting at her side as she surveys the scene with a measured, observant glance. Her body language reflects a mix of skepticism and cautious interest.',
        ap.emotional_state = 'Kathy projects a wry humor with her remark about the angel’s unintentional charm, masking an undercurrent of concern and residual uncertainty. Behind her composed exterior, she experiences a conflicting mix of bemusement and apprehension, as the realization that the statue has shifted unsettles her calm. There is a quiet internal alarm that hints at the gravity of the unknown forces at work.',
        ap.emotional_tags = ["Kathy projects a wry humor with her remark about the angel\u2019s unintentional charm, masking an undercurrent of concern", "residual uncertainty. Behind her composed exterior, she experiences a conflicting mix of bemusement", "apprehension, as the realization that the statue has shifted unsettles her calm. There is a quiet internal alarm that hints at the gravity of the unknown forces at work."],
        ap.active_plans = ["Gauge the situation by comparing current observations with earlier perceptions.", "Support Sally in understanding the shift and its potential implications.", "Determine whether the movement of the angel requires further immediate action."],
        ap.beliefs = ["She believes that appearances can be deceiving and that even the absurd can signal something dire.", "She is convinced that this strange phenomenon might affect their safety if left unchecked.", "She trusts the importance of direct observation over hearsay in discerning supernatural events."],
        ap.goals = ["Short-term: Confirm Sally\u2019s claim by closely examining the angel\u2019s position.", "Medium-term: Reconcile the odd normality of the statue with the unusual evidence of movement.", "Ultimate: Ensure that any impending threat linked to the supernatural presence is managed effectively."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_writing_on_the_wall_event_11_1'})
    ON CREATE SET
        oi.description = 'The writing on the wall is central to the narrative tension in this event. Serving as a cryptic messenger, it not only details eerie commands but also shockingly inscribes Sally Sparrow\'s name. This unexpected personalization disrupts the quiet intimacy of the drawing room, compounding the mystery and hinting at forces that blur the line between identity and fate.',
        oi.status_before = 'Before this event, the wall bore only vague, mysterious inscriptions that evoked a sense of foreboding without any personal references.',
        oi.status_after = 'After the event, the inscription has taken on a profoundly disturbing aspect by including Sally’s name, thereby transforming from an ambiguous warning into a deeply personal and unsettling marker.'
    WITH oi
    MATCH (o:Object {uuid: 'object_writing_on_the_wall'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_doorbell_event_11_2'})
    ON CREATE SET
        oi.description = 'The doorbell plays a critical narrative role by emitting a clear and sudden chime that disrupts the already tense atmosphere in the drawing room. Its unexpected ringing acts as an external catalyst, drawing the attention of both Kathy and Sally and hinting at the intrusion of an unknown presence.',
        oi.status_before = 'Before the event, the doorbell was a silent, modest fixture that blended unobtrusively into the drawing room setting, unnoticed until its activation.',
        oi.status_after = 'After the event, the doorbell remains in situ, its chime now charged with narrative significance, symbolizing an intrusion and leaving a lingering sense of impending danger that continues to resonate with the agents.'
    WITH oi
    MATCH (o:Object {uuid: 'object_doorbell'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow is standing in the intimate drawing room, very near the wall that bears the startling inscription. Her posture is tense and alert, with a slight forward lean as she examines the unexpected appearance of her own name. Her eyes are wide with focus and her hands are slightly clenched, reflecting the shock of the discovery.',
        ap.emotional_state = 'Sally is visibly shaken yet determined; her face betrays a mix of astonishment, confusion, and an undercurrent of apprehension. Outwardly, she appears perplexed and unsettled by this bizarre anomaly, while her inner emotional landscape is marked by a burning need to understand the personal significance of the inscription. There is a tension between her fear of the unknown and a brave resolve to confront it head-on.',
        ap.emotional_tags = ["Sally is visibly shaken yet determined; her face betrays a mix of astonishment, confusion,", "an undercurrent of apprehension. Outwardly, she appears perplexed", "unsettled by this bizarre anomaly, while her inner emotional l", "scape is marked by a burning need to underst", "the personal significance of the inscription. There is a tension between her fear of the unknown", "a brave resolve to confront it head-on."],
        ap.active_plans = ["Investigate the origin and hidden meaning of the inscription on the wall.", "Collect any clues or evidence in the room that could explain why her name appears there.", "Challenge her assumptions about her environment by questioning the reliability of what she sees."],
        ap.beliefs = ["She believes that mysterious signs are deliberate messages meant to reveal hidden truths.", "She believes that no anomaly is coincidental and that every strange occurrence has significance.", "She believes that courage and inquiry are essential to overcoming uncertainty and fear."],
        ap.goals = ["Short-term: Understand the immediate shock by carefully examining the inscription.", "Medium-term: Decode the personalized message to gain insights into its origin and significance.", "Ultimate: Unravel the deeper mystery that connects her identity to the uncanny events unfolding around her."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Kathy stands near the drawing room door, her body rigid and alert as the doorbell rings unexpectedly. She shifts her weight cautiously, her eyes darting toward the entryway while maintaining a defensive stance, ready to react to any disturbance.',
        ap.emotional_state = 'Kathy experiences a layered mix of anxiety and guarded determination. Outwardly, she displays a cool, no-nonsense demeanor and a hint of incredulity at the disruption, yet internally she feels a pressing worry and a defensive calm as she prepares to confront any potential intruder.',
        ap.emotional_tags = ["Kathy experiences a layered mix of anxiety", "guarded determination. Outwardly, she displays a cool, no-nonsense demeanor", "a hint of incredulity at the disruption, yet internally she feels a pressing worry", "a defensive calm as she prepares to confront any potential intruder."],
        ap.active_plans = ["Assess the source and purpose of the unexpected doorbell ring.", "Maintain a defensive posture within her safe space while staying alert.", "Prepare to confront or warn off any potential burglar or threat at the door."],
        ap.beliefs = ["She believes that unexpected disturbances require immediate and cautious attention.", "Kathy holds that maintaining personal safety is paramount in any uncertain situation.", "She is convinced that clear, direct communication can mitigate unexpected dangers."],
        ap.goals = ["Short-term: Quickly determine the nature of the visitor at the door.", "Medium-term: Secure the drawing room and protect herself from any intrusion.", "Ultimate: Preserve the sanctity of her space and ensure the safety of everyone inside."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Sally is actively investigating the mysterious inscription of her name in the room while intermittently glancing toward the door. She paces with purposeful, measured steps and gestures animatedly as she reacts to the ringing doorbell, her investigative curiosity in full display.',
        ap.emotional_state = 'Sally exhibits a dynamic blend of disbelief, intrigue, and underlying tension. Outwardly, she masks her apprehension with wry humor and a determined tone, yet internally she is conflicted by confusion and a burning need to decipher the inexplicable elements thrown into her night.',
        ap.emotional_tags = ["Sally exhibits a dynamic blend of disbelief, intrigue,", "underlying tension. Outwardly, she masks her apprehension with wry humor", "a determined tone, yet internally she is conflicted by confusion", "a burning need to decipher the inexplicable elements thrown into her night."],
        ap.active_plans = ["Uncover the significance of the strange, written message and its connection to her identity.", "Answer the doorbell to investigate the unexpected visitor.", "Collaborate with Kathy to piece together the surreal clues of the night."],
        ap.beliefs = ["Sally believes that every mystery has a rational explanation waiting to be uncovered.", "She trusts her instincts to guide her through even the strangest of circumstances.", "Sally holds that direct engagement with unexplained events is the key to finding truth."],
        ap.goals = ["Short-term: Clarify how her name appears written in the room and what it signifies.", "Medium-term: Determine the identity and purpose of the person triggering the doorbell.", "Ultimate: Unveil the underlying mystery while ensuring her own safety and that of those around her."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ancient_letter_event_12_2'})
    ON CREATE SET
        oi.description = 'The ancient letter, accompanied by faded photographs, plays a pivotal role in this scene as Malcolm presents it to Sally. Its weathered, yellowed pages evoke a deep historical resonance and serve as a tangible link to a bygone era. The document is central to verifying identity and unearthing hidden familial secrets, acting as both proof and catalyst for further inquiry.',
        oi.status_before = 'The letter is securely held by Malcolm, preserved in its original, weathered condition and emblematic of a rich, personal history.',
        oi.status_after = 'Following the interaction, the letter remains with Sally, its mysterious aura now intensifying as it sets the stage for further investigation into its cryptic contents.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ancient_letter'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_driving_licence_event_12_2'})
    ON CREATE SET
        oi.description = 'Referenced by Malcolm as he inquires if Sally possesses an item with a photograph, the driving licence symbolizes an ordinary form of personal identification that might serve a deeper function. It is proposed as a tool for identity verification that could connect Sally to the letter’s hidden implications, bridging her personal history with the unfolding mystery.',
        oi.status_before = 'Initially, the licence exists as a mundane, unpresented document within Sally’s personal belongings, representing standard identity confirmation.',
        oi.status_after = 'After the inquiry, the driving licence is cast in a new light as a potential piece of crucial evidence, its mundane nature now charged with investigative significance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_driving_licence'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm steps confidently up to the front door with a measured, deliberate pace. He presents a calm and enigmatic demeanor while announcing, \'I\'m looking for Sally Sparrow,\' and subtly hints at his entrusted mission by mentioning the ancient letter. His posture is upright and focused as he holds the letter with care.',
        ap.emotional_state = 'Outwardly, Malcolm remains composed and professional, his tone steady and his expression guarded yet earnest; internally, however, he feels a weight of responsibility and conviction that his task is not just an errand but a destined intervention. There is an undercurrent of solemn duty that belies his quiet exterior and a certain anticipation of the unfolding mystery.',
        ap.emotional_tags = ["Outwardly, Malcolm remains composed", "professional, his tone steady", "his expression guarded yet earnest; internally, however, he feels a weight of responsibility", "conviction that his task is not just an err", "but a destined intervention. There is an undercurrent of solemn duty that belies his quiet exterior", "a certain anticipation of the unfolding mystery."],
        ap.active_plans = ["Deliver the ancient letter at the appointed time.", "Establish a connection with Sally through an understated yet purposeful inquiry.", "Verify the authenticity of the message and align himself with the deeper, possibly fated, unfolding events."],
        ap.beliefs = ["He believes in the inevitability of destiny and that every message has a predetermined role.", "He is convinced that the information entrusted to him must be delivered exactly as foretold.", "He trusts that subtle gestures and precise timing are the keys to unraveling the larger mystery."],
        ap.goals = ["Short-term: Successfully hand over the letter to Sally to confirm his mission.", "Medium-term: Gain Sally\u2019s trust and clarify the significance of the cryptic message.", "Ultimate: Contribute to the resolution of the mysterious events and align the unfolding destiny with the secret directive he carries."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands at the door with a mix of alertness and surprise as Malcolm’s announcement catches her off guard. Her body language reflects a cautious curiosity, as she tilts her head and peers at him with raised eyebrows while maintaining a protective stance at her doorway.',
        ap.emotional_state = 'Sally’s face registers a complex blend of astonishment, guarded skepticism, and a spark of intrigue. Though her voice comes out with a tone of careful questioning, internally she is balancing between disbelief about Malcolm’s uncanny timing and the eagerness to decipher the ominous hints in his words. She experiences a turbulent surge of emotions, oscillating between wariness and the excitement of a deeper mystery unfolding before her.',
        ap.emotional_tags = ["Sally\u2019s face registers a complex blend of astonishment, guarded skepticism,", "a spark of intrigue. Though her voice comes out with a tone of careful questioning, internally she is balancing between disbelief about Malcolm\u2019s uncanny timing", "the eagerness to decipher the ominous hints in his words. She experiences a turbulent surge of emotions, oscillating between wariness", "the excitement of a deeper mystery unfolding before her."],
        ap.active_plans = ["Clarify Malcolm's unexpected knowledge of her whereabouts with pointed questions.", "Determine the significance of the old letter and its connection to her destiny.", "Assess whether this meeting can reveal further clues to the mysterious forces at work."],
        ap.beliefs = ["She believes that hidden messages and cryptic encounters are integral to revealing long-buried truths.", "She maintains that her investigative instincts will guide her through the uncertainty of the situation.", "She trusts that every unusual occurrence, however brief, is a clue leading to a larger, preordained narrative."],
        ap.goals = ["Short-term: Understand Malcolm\u2019s true purpose and the origin of his message.", "Medium-term: Uncover the embedded secrets within the ancient letter and its historical ties.", "Ultimate: Piece together the cryptic puzzle that binds her fate to the inexplicable events, ensuring she remains one step ahead of the unfolding mystery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands composed at the door as he methodically explains his mission to deliver the mysterious, weathered letter. His measured gestures and deliberate speech convey an air of quiet urgency and responsibility, as he holds the letter with subtle reverence.',
        ap.emotional_state = 'Malcolm appears outwardly calm and focused, yet beneath his composed exterior lies a guarded concern and a deep reverence for the document. His inner tension hints at a conflict between duty and personal history, revealing unspoken obligations and a cautious respect for the past.',
        ap.emotional_tags = ["Malcolm appears outwardly calm", "focused, yet beneath his composed exterior lies a guarded concern", "a deep reverence for the document. His inner tension hints at a conflict between duty", "personal history, revealing unspoken obligations", "a cautious respect for the past."],
        ap.active_plans = ["Deliver the ancient letter according to his mandate", "Verify Sally\u2019s identity using a photograph-bearing item for security", "Conceal any personal emotional ties while upholding his familial duty"],
        ap.beliefs = ["Believes in the vital importance of preserving historical truth", "Is convinced that duty to family legacy must override personal feelings", "Holds that hidden secrets from the past can unlock crucial insights into current mysteries"],
        ap.goals = ["Short-term: Ensure the accurate delivery of the letter", "Medium-term: Secure identity verification to authenticate the document", "Ultimate: Unravel the deeper family mysteries linked to Kathy\u2019s legacy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands alert and inquisitive, leaning slightly forward as she scrutinizes the letter’s ancient, yellowed surface. Her posture and attentive gaze reveal her determination to uncover the story behind its faded inscriptions, while she remains cautious of its implications.',
        ap.emotional_state = 'Sally is visibly intrigued yet laced with skepticism; her expression shifts between wonder and guarded disbelief as she processes the weight of the mysterious letter. Internally, she is driven by a burning curiosity to resolve the puzzle while remaining wary of potential hidden dangers, creating a simmering mix of excitement and concern.',
        ap.emotional_tags = ["Sally is visibly intrigued yet laced with skepticism; her expression shifts between wonder", "guarded disbelief as she processes the weight of the mysterious letter. Internally, she is driven by a burning curiosity to resolve the puzzle while remaining wary of potential hidden dangers, creating a simmering mix of excitement", "concern."],
        ap.active_plans = ["Investigate the origins and secret implications of the letter", "Assess her own identity using the driving licence as a reference point", "Decipher the historical clues embedded within the document"],
        ap.beliefs = ["Believes that every detail, however small, is a clue to a larger mystery", "Thinks that ancient records hold the key to understanding deep family histories", "Trusts her intuition and investigative instincts despite the surreal circumstances"],
        ap.goals = ["Short-term: Verify the authenticity of the mysterious letter", "Medium-term: Piece together the embedded clues to uncover linked secrets", "Ultimate: Unravel the profound mystery behind Kathy\u2019s past and her enduring legacy"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_13_1'})
    ON CREATE SET
        oi.description = 'The statue of the Weeping Angel, set unexpectedly close to the house, plays an ominous silent role in this event. As Sally and Malcolm exchange their cryptic dialogue, the statue subtly alters its usual stance by lowering its hands from its eyes, signaling an eerie acknowledgement of the unfolding mystery and intensifying the atmospheric dread.',
        oi.status_before = 'Before this event, the statue maintained its typical pose with hands covering its eyes, silent and immovable—a fixed emblem of supernatural vigilance that enhanced the mysterious aura of the setting.',
        oi.status_after = 'After the event, the statue’s hands have been lowered from its eyes, marking a rare deviation in its behavior that hints at a deeper, unseen awareness; this change reinforces the tension and suggests that the supernatural forces at work are shifting into a more active phase.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_13_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands within the conservatory, her eyes fixed on the darkened corners as she softly questions the uncanny foreknowledge of her arrival. Her body is tense, hands slightly trembling, and her posture hints at both cautious curiosity and readiness to act.',
        ap.emotional_state = 'On the surface, Sally’s voice is hushed and laced with wonder, yet underneath she battles a storm of apprehension, unresolved frustration, and determination. She feels both the pull of the mysterious clues and the weight of potential danger, causing a dissonance between her brave exterior and the internal tremors of fear and uncertainty.',
        ap.emotional_tags = ["On the surface, Sally\u2019s voice is hushed", "laced with wonder, yet underneath she battles a storm of apprehension, unresolved frustration,", "determination. She feels both the pull of the mysterious clues", "the weight of potential danger, causing a dissonance between her brave exterior", "the internal tremors of fear", "uncertainty."],
        ap.active_plans = ["Investigate the source of the mysterious foreknowledge behind her arrival.", "Examine the subtle clues in the environment for hidden meanings.", "Maintain vigilance against any further supernatural or unexplained occurrences."],
        ap.beliefs = ["She believes that every inexplicable event carries a purpose and can be unraveled with enough persistence.", "She is convinced that the clues are intentionally left for her to discover.", "She holds that truth is worth pursuing, even when it places her in danger."],
        ap.goals = ["Short-term: Comprehend the immediate anomaly of someone knowing her arrival.", "Medium-term: Link the uncanny signs to the broader mystery surrounding the Weeping Angels.", "Ultimate: Uncover the underlying secret that binds her fate to these otherworldly events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands close by with a measured demeanor, interjecting with a tone of reluctant confession as he explains the overwhelming complexity of the moment. His calm posture contrasts with the escalating tension, yet his eyes reveal a wary acknowledgment of the mysteries unfolding around him.',
        ap.emotional_state = 'Malcolm appears composed and reserved externally, yet inside he experiences a quiet anxiety and deep concern over the inscrutable nature of the events. Although his words are cautiously measured, he is troubled by the implications of what they are uncovering, feeling both responsibility and a sense of helpless inevitability.',
        ap.emotional_tags = ["Malcolm appears composed", "reserved externally, yet inside he experiences a quiet anxiety", "deep concern over the inscrutable nature of the events. Although his words are cautiously measured, he is troubled by the implications of what they are uncovering, feeling both responsibility", "a sense of helpless inevitability."],
        ap.active_plans = ["Provide a grounding perspective to help interpret the uncanny signs.", "Assist Sally in piecing together the layered clues.", "Carefully observe the situation to detect any emerging threats."],
        ap.beliefs = ["He believes that even in the midst of bizarre phenomena, rationality and measured observation are vital.", "He is convinced that the past holds keys to understanding the present mystery.", "He values cautious analysis over impulsivity when confronting inexplicable events."],
        ap.goals = ["Short-term: Calm the immediate tension and shed light on the perplexing situation.", "Medium-term: Decode the cryptic clue that has emerged through their discussion.", "Ultimate: Steer their investigation toward a safe and reasoned unraveling of the mystery."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_little_photographs_event_14_1'})
    ON CREATE SET
        oi.description = 'The little photographs serve as a tangible trigger for Malcolm’s self-conscious disclosure. Their faded images and worn condition evoke memories and secrets from long ago, positioning them as a symbolic bridge between the past and present. In this intimate moment at the front door, they not only cause Malcolm embarrassment but also invite Sally to inquire further about the hidden stories they carry, setting the scene for a deeper exploration of familial lore.',
        oi.status_before = 'Before the event, the little photographs are in a fragile, aged condition, their images blurred by time yet heavy with unspoken history.',
        oi.status_after = 'After the event, although their physical state remains unchanged, the photographs gain narrative significance as catalysts for further explanation and investigation into the mysteries that surround them.'
    WITH oi
    MATCH (o:Object {uuid: 'object_little_photographs'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_14_2'})
    ON CREATE SET
        oi.description = 'During the exchange at the threshold, the statue of the Weeping Angel situated in the conservatory serves as a silent, ominous witness. Its presence amplifies the sense of mystery and foreboding, mirroring the weighty legacy being discussed. The statue not only reinforces the supernatural undertones of the narrative but also symbolically represents the haunting remnants of the past that continue to influence the present.',
        oi.status_before = 'Before the event, the statue is immovably positioned in the conservatory, its stone features and concealed eyes exuding a timeless, eerie vigilance.',
        oi.status_after = 'After the event, the statue retains its silent, watchful presence, continuing to loom over the space as an ever-present emblem of mystery and the inescapable pull of history.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_14_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands at the front door with a hesitant, self-conscious posture, clutching the faded little photographs. He surveys the scene from a reserved corner in the entryway, his tone and measured gestures revealing both embarrassment and an unspoken weight of history as he prepares to unveil his story.',
        ap.emotional_state = 'Malcolm’s face reflects a blend of unease and subdued humor, his eyes betraying an inner turmoil as he struggles with the discomfort of presenting memories from the past. Although he masks his nervousness with a self-deprecating remark, there is a trace of determination and quiet vulnerability beneath the surface—a conflict between the desire to protect secrets and the need to share them.',
        ap.emotional_tags = ["Malcolm\u2019s face reflects a blend of unease", "subdued humor, his eyes betraying an inner turmoil as he struggles with the discomfort of presenting memories from the past. Although he masks his nervousness with a self-deprecating remark, there is a trace of determination", "quiet vulnerability beneath the surface\u2014a conflict between the desire to protect secrets", "the need to share them."],
        ap.active_plans = ["Clarify the origin and significance of the little photographs.", "Manage his embarrassment while gradually revealing the backstory.", "Establish a connection with Sally by explaining the familial or historical context behind the artifacts."],
        ap.beliefs = ["He believes that preserving the details of the past is essential, however awkward it may feel.", "He is convinced that honesty about one\u2019s history, though painful, is necessary for understanding.", "He trusts that even embarrassing relics hold profound significance and should be respected."],
        ap.goals = ["Short-term: To overcome his self-consciousness and provide Sally with a credible explanation.", "Medium-term: To reconnect with the deeper meaning and memories encapsulated by the photographs.", "Ultimate: To safeguard the legacy and truth of his personal and familial history, ensuring that it is neither dismissed nor forgotten."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands near the front door with a poised yet inquisitive demeanor. Her body language is confident as she interjects with a succinct \'Apparently\' when Malcolm speaks, her attentive eyes fixed on him, signaling both support and an eagerness to learn more about the photographs and the history they represent.',
        ap.emotional_state = 'Sally’s emotional state is a complex mix of curiosity and calm determination. On the surface, she exhibits a light, supportive humor while her gaze reveals an intense interest in uncovering the truth. Beneath her composed exterior lies a restless inquisitiveness and a yearning to connect disparate clues, as she balances empathy with a drive to solve the mystery at hand.',
        ap.emotional_tags = ["Sally\u2019s emotional state is a complex mix of curiosity", "calm determination. On the surface, she exhibits a light, supportive humor while her gaze reveals an intense interest in uncovering the truth. Beneath her composed exterior lies a restless inquisitiveness", "a yearning to connect disparate clues, as she balances empathy with a drive to solve the mystery at h", "."],
        ap.active_plans = ["Prompt Malcolm to continue his explanation by asking direct questions.", "Gauge the emotional undercurrents in Malcolm\u2019s narrative to better understand the artifact\u2019s significance.", "Rapidly piece together clues from Malcolm\u2019s remarks to further the investigation."],
        ap.beliefs = ["She believes that every small artifact holds a key to deeper mysteries.", "She trusts that clear communication and direct questioning will eventually dispel confusion.", "She values honesty and transparency in uncovering hidden parts of the past."],
        ap.goals = ["Short-term: To extract the critical details from Malcolm regarding the origin of the photographs.", "Medium-term: To build an informed narrative that connects personal history with the unfolding mystery.", "Ultimate: To use the insights garnered to unravel larger secrets and contribute to the broader investigation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands at the threshold with a controlled poise, holding a scattered group of photographs and a weathered letter that hint at a long-kept legacy. His measured gestures and deliberate tone underscore his role as the keeper of forgotten secrets, while his positioning near the entrance signals his readiness to reveal a part of his past.',
        ap.emotional_state = 'Outwardly, Malcolm displays a calm and reflective demeanor, yet there is a deep, nostalgic sadness beneath the surface. He is visibly haunted by the weight of years and memories, and his eyes betray an inner conflict between the desire to share his burden and the fear of fully unearthing his family’s mysterious legacy.',
        ap.emotional_tags = ["Outwardly, Malcolm displays a calm", "reflective demeanor, yet there is a deep, nostalgic sadness beneath the surface. He is visibly haunted by the weight of years", "memories,", "his eyes betray an inner conflict between the desire to share his burden", "the fear of fully unearthing his family\u2019s mysterious legacy."],
        ap.active_plans = ["Reveal the identity behind the mysterious photographs.", "Explain the strange, lingering feelings that have troubled him over the years.", "Establish a connection between the past and the present for Sally."],
        ap.beliefs = ["He believes that confronting one's history is essential to understanding the present.", "He trusts that every mysterious object or note has a deeper significance.", "He holds that truth, however painful, should eventually be brought to light."],
        ap.goals = ["Short-term: Provide Sally with the name of the mysterious sender.", "Medium-term: Clarify the connection between the photographs and his own past.", "Ultimate: Unburden the legacy he has carried for years and encourage resolution of long-held secrets."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands at the front door with an air of urgency, her eyes fixed intently on Malcolm as she presses him for answers. Every gesture, from her clenched fists to her steady gaze, conveys her determination to uncover the truth. Positioned near the threshold, she embodies both curiosity and impatience amid the charged atmosphere.',
        ap.emotional_state = 'Sally’s expression is a complex tapestry of inquisitiveness and anxious anticipation. Outwardly, she is impatient and forceful, demanding clarity, while internally she is wrestling with a mixture of hope and trepidation. The urgency in her tone masks a deeper fear of the secrets that may be revealed, and her determination is fueled by a conflicting drive to both confront and understand the mystery before her.',
        ap.emotional_tags = ["Sally\u2019s expression is a complex tapestry of inquisitiveness", "anxious anticipation. Outwardly, she is impatient", "forceful, dem", "ing clarity, while internally she is wrestling with a mixture of hope", "trepidation. The urgency in her tone masks a deeper fear of the secrets that may be revealed,", "her determination is fueled by a conflicting drive to both confront", "underst", "the mystery before her."],
        ap.active_plans = ["Force Malcolm to disclose the mysterious sender\u2019s identity.", "Quickly piece together the connection between the photographs and the legacy they represent.", "Secure crucial information that might unlock further historical secrets."],
        ap.beliefs = ["She believes that every artifact and memory holds clues to a larger truth.", "She is convinced that uncovering hidden identities is key to understanding her own experiences.", "She trusts that relentless questioning will eventually dissolve the shroud of mystery."],
        ap.goals = ["Short-term: Extract the name of the sender from Malcolm.", "Medium-term: Connect the legacy represented by the photographs to the broader mystery she is investigating.", "Ultimate: Unravel the long-buried secrets of the past, thereby securing her role in exposing the truth."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_15_1'})
    ON CREATE SET
        oi.description = 'In the drawing room, the Statue of the Weeping Angel plays a silent yet potent role. Positioned ominously behind Kathy, its outstretched hand appears to reach toward her, reinforcing the narrative of hidden menace and the intrusion of the past into the present. Its presence is a symbolic reminder of the ever-watchful threat looming over the characters.',
        oi.status_before = 'The statue stands placidly in its designated space on the landing, its features carved in stone with a static yet eerie vigilance, undisturbed in its usual position.',
        oi.status_after = 'Following the event, the statue remains unmoved and foreboding, its reaching hand accentuating the lingering dread and unresolved mysteries, thereby deepening its narrative significance as an ever-present omen.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_15_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm steps forward in the drawing room with deliberate, measured movements. He holds himself with calm authority as he reveals the hidden identity by annunciating ‘Katherine Wainwright’ while his eyes remain fixed and intent on delivering the cryptic message.',
        ap.emotional_state = 'Malcolm exudes a quiet urgency; outwardly composed yet inwardly alert to the gravity of the secret he carries. Beneath his calm lies a tension tied to duty and the burden of family secrets, leaving him both somber and resolute.',
        ap.emotional_tags = ["Malcolm exudes a quiet urgency; outwardly composed yet inwardly alert to the gravity of the secret he carries. Beneath his calm lies a tension tied to duty", "the burden of family secrets, leaving him both somber", "resolute."],
        ap.active_plans = ["Deliver the secret message with precise clarity.", "Ensure that the revelation of \u2018Katherine Wainwright\u2019 is understood by those present.", "Maintain his composure to balance the foreboding aura of the moment."],
        ap.beliefs = ["Believes in the sanctity of family legacy and hidden truths.", "Is convinced that honoring past instructions is essential for present decisions.", "Maintains that clarity and calm in communication can avert future miseries."],
        ap.goals = ["Short-term: Clearly reveal the critical identity and detail before any confusion arises.", "Medium-term: Reinforce the importance of the message for those affected by the past.", "Ultimate: Preserve and protect the family legacy and preempt the looming threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the drawing room with a composed yet pensive posture. Though she does not speak, her eyes reflect a mixture of quiet strength and internal turmoil as the revelation unfolds, with the eerie presence of the statue looming behind her.',
        ap.emotional_state = 'Kathy presents a layered emotional state; externally, she is calm and assertive, yet internally she battles a deep-seated sense of foreboding and unresolved grief. Her silence speaks of hidden conflicts and an awareness of personal legacy that haunts her even in this critical moment.',
        ap.emotional_tags = ["Kathy presents a layered emotional state; externally, she is calm", "assertive, yet internally she battles a deep-seated sense of foreboding", "unresolved grief. Her silence speaks of hidden conflicts", "an awareness of personal legacy that haunts her even in this critical moment."],
        ap.active_plans = ["Listen intently to Malcolm\u2019s cryptic revelation.", "Process the secret message while remaining vigilant of the unseen threats.", "Prepare herself to integrate this revelation into her ongoing commitment to family memory."],
        ap.beliefs = ["Believes in the imperative of truth and the preservation of personal legacy.", "Is convinced that past secrets hold necessary lessons for the future.", "Maintains that paying heed to hidden messages is essential for protecting loved ones."],
        ap.goals = ["Short-term: Absorb and understand Malcolm\u2019s revelation in the disclosure of hidden familial details.", "Medium-term: Safeguard the memories and messages conveyed by Katherine Wainwright.", "Ultimate: Ensure that the legacy and lessons of the past continue to guide and protect those she cares about."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands at the front door with measured composure, initiating the revelation by stating, \'She was called Kathy Nightingale,\' and then clarifying with precision that her full name is Katherine Costello Nightingale. His posture remains steady, his voice calm despite the sudden \'Bang!\' punctuating the moment.',
        ap.emotional_state = 'Malcolm exudes an air of controlled authority and quiet resolve. Beneath the calm exterior, there is a deliberate determination to set the record straight. Although his expression is detached, he carries a quiet intensity and focus, hinting at deep-seated convictions regarding family identity and the necessity of truth in moments of crisis.',
        ap.emotional_tags = ["Malcolm exudes an air of controlled authority", "quiet resolve. Beneath the calm exterior, there is a deliberate determination to set the record straight. Although his expression is detached, he carries a quiet intensity", "focus, hinting at deep-seated convictions regarding family identity", "the necessity of truth in moments of crisis."],
        ap.active_plans = ["Reveal the true identity of Kathy to dispel confusion.", "Establish a factual account of past events for clarity.", "Maintain control over the unfolding confrontation at the door."],
        ap.beliefs = ["Truth must be stated plainly, even when it challenges expectations.", "Familial legacies and identities deserve clear acknowledgment.", "Calm and measured communication can defuse potentially volatile situations."],
        ap.goals = ["Short-term: Clearly communicate Kathy\u2019s full name and resolve immediate confusion.", "Medium-term: Reinforce the importance of honesty in unravelling the family mystery.", "Long-term: Secure understanding and closure regarding the hidden aspects of Kathy\u2019s identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Sally is caught off guard at the front door, her body momentarily frozen as she utters a single, questioning word, \'Kathy?\' Her posture reflects a sudden jolt of shock, and her eyes widen in disbelief while her facial expression betrays both confusion and a trace of humor as she hints at the absurdity of the situation.',
        ap.emotional_state = 'Sally experiences a turbulent mix of shock, bewilderment, and incredulous amusement. While externally she responds with a quip questioning whether the revelation is a joke, internally her mind races to reconcile this unexpected disclosure with her understanding of the past. Her emotions are layered with uncertainty, apprehension, and a resilient determination to unearth what this identity shift might imply.',
        ap.emotional_tags = ["Sally experiences a turbulent mix of shock, bewilderment,", "incredulous amusement. While externally she responds with a quip questioning whether the revelation is a joke, internally her mind races to reconcile this unexpected disclosure with her underst", "ing of the past. Her emotions are layered with uncertainty, apprehension,", "a resilient determination to unearth what this identity shift might imply."],
        ap.active_plans = ["Question Malcolm\u2019s revelation to verify the truth.", "Gauge the underlying implications of the identity disclosure.", "Prepare to confront or understand the broader mystery linked to Kathy\u2019s true name."],
        ap.beliefs = ["No detail is too strange to warrant investigation.", "Human identity and truth are often hidden beneath layers of ambiguity.", "Humor and skepticism are essential tools in coping with unexpected revelations."],
        ap.goals = ["Short-term: Seek immediate clarification by challenging Malcolm\u2019s statement.", "Medium-term: Piece together the significance of Kathy\u2019s full name in the unfolding mystery.", "Ultimate: Uncover deeper truths that may influence her future decisions and understanding of past events."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_17_1'})
    ON CREATE SET
        oi.description = 'The Statue of the Weeping Angel makes a silent yet powerful appearance outside the drawing room, its eyes covered in its iconic, mysterious manner. It functions as both a foreboding emblem and an omen, its mute presence amplifying the tension of Sally’s desperate calls. The statue serves as a visual counterpoint to the unfolding human drama, bridging the realm of the supernatural with raw, emotional urgency.',
        oi.status_before = 'Prior to the event, the statue stood quietly outside with its eyes concealed, a familiar and enigmatic presence that continuously signaled warning and mystery.',
        oi.status_after = 'After the event unfolds, the statue remains unchanged in form and demeanor—its covered eyes still, offering a constant, silent vigilance that deepens the atmosphere of ominous anticipation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_17_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Inside the drawing room, Sally Sparrow stands with a tense, determined posture. Her voice trembles as she repeatedly calls for Kathy, every fiber of her being alert and ready to respond to whatever comes next. She appears physically restless yet grounded, her hands possibly clenched in frustration or urgency.',
        ap.emotional_state = 'Sally\'s emotional state is layered with palpable urgency and anxiety. Outwardly, her trembling voice and repeated calls for Kathy reveal deep worry and fear, while internally she harnesses a steely resolve to confront the mystery. Her mind is a battleground between panic and the conviction that every supernatural sign—including the silent, watchful presence outside—is meaningful and must be heeded.',
        ap.emotional_tags = ["Sally's emotional state is layered with palpable urgency", "anxiety. Outwardly, her trembling voice", "repeated calls for Kathy reveal deep worry", "fear, while internally she harnesses a steely resolve to confront the mystery. Her mind is a battleground between panic", "the conviction that every supernatural sign\u2014including the silent, watchful presence outside\u2014is meaningful", "must be heeded."],
        ap.active_plans = ["Locate Kathy immediately and ensure her safety.", "Interpret and respond to the ominous message symbolized by the Weeping Angel.", "Use her investigative instincts to connect the supernatural warning with the unfolding mystery."],
        ap.beliefs = ["Every supernatural sign is a deliberate warning that holds crucial meaning.", "Kathy\u2019s wellbeing is directly linked to the resolution of the mystery.", "Her role as an investigator is key to uncovering the truth behind these ominous events."],
        ap.goals = ["Short-term: Reach and alert Kathy to the danger as quickly as possible.", "Medium-term: Decipher the symbolic significance of the Weeping Angel to guide her investigation.", "Ultimate: Uncover the hidden truths behind the mysterious phenomena and protect those caught in the supernatural turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands at the threshold of the drawing room with a measured, deliberate gait. He has just emerged from gathering scattered photographs and a letter from the banister rail. His posture is upright and composed, emphasizing his quiet efficiency, as he steps forward into the light with a look that mixes resignation and urgency.',
        ap.emotional_state = 'Malcolm displays a thick layer of controlled urgency; on the surface, his tone is firm and insistent. Deep within, there is a trace of sorrow and burden, as if his actions are weighed down by long-held promises and the gravity of unresolved family ties. His calm exterior conceals an inner conflict where duty and personal loss intertwine, fueling his need to press the message forward.',
        ap.emotional_tags = ["Malcolm displays a thick layer of controlled urgency; on the surface, his tone is firm", "insistent. Deep within, there is a trace of sorrow", "burden, as if his actions are weighed down by long-held promises", "the gravity of unresolved family ties. His calm exterior conceals an inner conflict where duty", "personal loss intertwine, fueling his need to press the message forward."],
        ap.active_plans = ["Ensure that the promise he made is honored by delivering the important letter and photographs.", "Prompt Sally to recognize the significance of the message before the situation escalates.", "Create a pivot in the narrative by linking the past with the present, setting the stage for further revelations."],
        ap.beliefs = ["Promises, once made, must be kept regardless of personal cost.", "The past holds vital clues to understanding the intertwined fates of those involved.", "Family ties and legacy have a power that transcends time and must be honored."],
        ap.goals = ["Short-term: Impress upon Sally the urgency of accepting the message immediately.", "Medium-term: Bridge the gap between unresolved family history and the present mystery.", "Ultimate: Ensure that the hidden truths contained within the letter and photographs unravel the long-held mysteries for the benefit of all involved."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_apple_event_18_1'})
    ON CREATE SET
        oi.description = 'The apple is being eaten by Ben as he sits on the stone wall. Its crisp freshness serves as a mundane yet vivid prop that underscores the ordinary nature of the surroundings, contrasting sharply with the heated, surreal debate over location. Its simple presence adds texture to the scene by embedding an everyday physical detail into the overall narrative.',
        oi.status_before = 'The apple is fresh, whole, and unused as it rests in the possession of the young man on the wall.',
        oi.status_after = 'By the end of the event, the apple is partly consumed, its crisp texture diminished but still emblematic of a normal, grounded reality in an otherwise disoriented debate.'
    WITH oi
    MATCH (o:Object {uuid: 'object_apple'})
    MATCH (e:Event {uuid: 'event_18_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_newspaper_event_18_1'})
    ON CREATE SET
        oi.description = 'The Hull Times newspaper plays a crucial narrative role by serving as concrete evidence of the location. Held by the young man on the wall, its printed date and local details provide a factual anchor to Ben\'s repeated assertions that they are in Hull. The newspaper acts almost as a silent witness to the dispute, reinforcing the contrast between subjective recollection and objective reality.',
        oi.status_before = 'Prior to the event, the newspaper is an intact physical copy of The Hull Times, displaying the date 5th December 1920 and other local markers.',
        oi.status_after = 'After the event, the newspaper remains unchanged physically, continuing to symbolize the factual reality of Hull and bolstering Ben’s argument in the heated location debate.'
    WITH oi
    MATCH (o:Object {uuid: 'object_newspaper'})
    MATCH (e:Event {uuid: 'event_18_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the open field with a visibly agitated stance, her eyes darting as she gestures emphatically. She speaks rapidly, her hand raised in insistence that she was in London, her voice trembling with disbelief and frustration.',
        ap.emotional_state = 'Outwardly, Kathy’s tone is forceful and insistent, as she repeatedly denies being in Hull. Beneath the surface, she is conflicted and disoriented, struggling to reconcile fading memories of a bustling London with the reality presented by her surroundings. There is a palpable internal tension between her longing for familiar urban chaos and the stark rural evidence unfolding around her.',
        ap.emotional_tags = ["Outwardly, Kathy\u2019s tone is forceful", "insistent, as she repeatedly denies being in Hull. Beneath the surface, she is conflicted", "disoriented, struggling to reconcile fading memories of a bustling London with the reality presented by her surroundings. There is a palpable internal tension between her longing for familiar urban chaos", "the stark rural evidence unfolding around her."],
        ap.active_plans = ["Assert her recollection of being in London.", "Refuse to accept Ben\u2019s repeated insistence that they are in Hull.", "Seek clarity on her true whereabouts amidst the confusion."],
        ap.beliefs = ["Her personal memories and perceptions of identity carry undeniable truth.", "She believes that her lived experience - that of a vibrant London - cannot be overridden by objective statements.", "Her conviction that reality is personal and subjective drives her resistance to Ben\u2019s claims."],
        ap.goals = ["Short-term: Immediately demand that Ben cease his contradictory assertions.", "Medium-term: Re-establish a coherent sense of self and location by reconciling her disoriented state with factual evidence.", "Ultimate: Solidify her own narrative of identity and memory, asserting control over her personal truth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Ben sits calmly on the dry stone wall, maintaining a composed posture as he slowly chews on his apple. He holds the newspaper with a steady hand, and his gaze remains unwavering as he repeats in a serene, matter-of-fact tone that they are in Hull.',
        ap.emotional_state = 'Ben exudes a quiet confidence and detachment, with little outward emotion aside from a firm, almost placid insistence on the facts. Internally, he remains anchored in objective reasoning and a respect for tangible evidence, undisturbed by the emotional turmoil of Kathy’s outbursts. There is a subtle undercurrent of patience mixed with slight exasperation as he attempts to clarify the discrepancy without escalating the tension further.',
        ap.emotional_tags = ["Ben exudes a quiet confidence", "detachment, with little outward emotion aside from a firm, almost placid insistence on the facts. Internally, he remains anchored in objective reasoning", "a respect for tangible evidence, undisturbed by the emotional turmoil of Kathy\u2019s outbursts. There is a subtle undercurrent of patience mixed with slight exasperation as he attempts to clarify the discrepancy without escalating the tension further."],
        ap.active_plans = ["Reiterate and affirm the objective truth that their location is Hull.", "Utilize observable evidence, such as the newspaper, to support his assertion.", "Calmly de-escalate the situation by sticking to factual evidence rather than engaging in emotional debate."],
        ap.beliefs = ["He holds the conviction that objective facts, as evidenced by tangible items like the newspaper, define reality.", "He believes that clarity and consistency in ordinary details are paramount to establishing truth.", "He is convinced that rational discourse, free of emotional distortion, is the best path to resolving confusion."],
        ap.goals = ["Short-term: Ensure that Kathy accepts the evident reality of their location.", "Medium-term: Maintain a composed atmosphere by grounding the discussion in observable facts.", "Ultimate: Reinforce the idea that truth is based on evidence and the immutable nature of the present moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the hushed entrance hall, her eyes narrowing as she fixes her gaze upon Malcolm. With a poised yet intense demeanor, she steps forward and questions him sharply, her posture exuding investigative determination.',
        ap.emotional_state = 'Outwardly, Sally displays a blend of inquisitiveness and assertiveness as she seeks clarity about Malcolm\'s presence. Beneath her confident exterior, there is a simmering tension and a spark of urgency born from her relentless need for truth, mingled with cautious anticipation about unfolding mysteries.',
        ap.emotional_tags = ["Outwardly, Sally displays a blend of inquisitiveness", "assertiveness as she seeks clarity about Malcolm's presence. Beneath her confident exterior, there is a simmering tension", "a spark of urgency born from her relentless need for truth, mingled with cautious anticipation about unfolding mysteries."],
        ap.active_plans = ["To extract the underlying meaning behind Malcolm\u2019s cryptic declaration.", "To probe further into the familial legacy hinted at by his promise.", "To piece together clues that might unlock the secret behind his connection to Katherine Costello Nightingale."],
        ap.beliefs = ["Truth is essential, even if it is hidden behind layers of mystery.", "Every cryptic revelation holds the key to a larger, interwoven legacy.", "Her role as an investigator is to challenge ambiguity and confront hidden truths."],
        ap.goals = ["Short-term: Determine who Malcolm is and why his promise matters in the present moment.", "Medium-term: Uncover the implications of the promise and its connection to past events.", "Ultimate: Reveal the deeper legacy and familial obligations that may redefine her understanding of the mystery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands in the entrance hall with a composed and measured presence. He responds to Sally\'s probing inquiry with calm resolve, his posture reflecting quiet determination as he reveals details of a promise made long ago to his grandmother.',
        ap.emotional_state = 'Malcolm exudes a calm and enigmatic aura, his controlled tone masking the weight of his familial duty. Internally, he is burdened by the obligation of a promise yet remains steadfast and measured, revealing reserved emotion and a sense of solemn responsibility beneath his quiet exterior.',
        ap.emotional_tags = ["Malcolm exudes a calm", "enigmatic aura, his controlled tone masking the weight of his familial duty. Internally, he is burdened by the obligation of a promise yet remains steadfast", "measured, revealing reserved emotion", "a sense of solemn responsibility beneath his quiet exterior."],
        ap.active_plans = ["To clearly communicate the significance of the promise he made.", "To uphold the legacy of his grandmother by providing crucial context to Sally.", "To navigate the conversation in a controlled manner, ensuring that the revelation deepens rather than disrupts the unfolding mystery."],
        ap.beliefs = ["Family promises and legacies are sacred and must be honored, regardless of the cost.", "The past holds the answers to the present, and keeping a promise can provide clarity in murky circumstances.", "Measured words and calm resolve are essential when dealing with deep-rooted obligations."],
        ap.goals = ["Short-term: Share the truth regarding his promise and its connection to Katherine Costello Nightingale.", "Medium-term: Maintain the integrity of his familial duty while contributing to the unfolding mystery.", "Ultimate: Ensure that the legacy bestowed upon him is respected and that its significance is ultimately understood by those involved."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_newspaper_event_20_1'})
    ON CREATE SET
        oi.description = 'The Hull Times newspaper serves as the critical piece of tangible evidence that anchors the revelation in the field. Ben uses the aged, printed copy to highlight the historical marker of 5th December 1920, framing it as a rare local artifact that contrasts sharply with expectations. Its display sparks Kathy’s startled reaction and underscores the episode’s thematic exploration of time and place, effectively linking past events with the present narrative mystery.',
        oi.status_before = 'The newspaper is in a preserved yet evidently aged condition, its printed words and date clearly legible, representing a true historical record from 1920.',
        oi.status_after = 'Following the event, the newspaper retains its historical integrity as a fixed marker in time, its presence deepened by its role in igniting questions about temporal dissonance and unresolvable mysteries.'
    WITH oi
    MATCH (o:Object {uuid: 'object_newspaper'})
    MATCH (e:Event {uuid: 'event_20_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Ben stands quietly in the open field under a soft, natural light. With careful precision he holds up the aged newspaper, his posture relaxed yet purposeful as he uses the object to underline evidence of a long-forgotten era.',
        ap.emotional_state = 'Ben exhibits a calm and deliberate demeanor, tempered with a respectful reverence for the past. Outwardly collected, he hides a deep-seated pride in preserving history, while internally he feels a fusion of nostalgia and sober responsibility to present undeniable evidence of times that have slipped away.',
        ap.emotional_tags = ["Ben exhibits a calm", "deliberate demeanor, tempered with a respectful reverence for the past. Outwardly collected, he hides a deep-seated pride in preserving history, while internally he feels a fusion of nostalgia", "sober responsibility to present undeniable evidence of times that have slipped away."],
        ap.active_plans = ["Present the newspaper as tangible evidence of local historical legacy.", "Communicate the distinctiveness of the era to provoke thought in Kathy.", "Subtly emphasize the difference between London and Hull through his measured explanation."],
        ap.beliefs = ["He believes that historical artifacts speak for themselves and validate lost times.", "He is convinced that truth and authenticity in historical record must be shared.", "He maintains that local identity is rooted in its unique past, distinct from more cosmopolitan narratives."],
        ap.goals = ["Short-term: To clearly reveal the dated evidence to Kathy and prompt her inquiry.", "Medium-term: To encourage reflection on the nature of time and place through the artifact.", "Ultimate: To help bridge past and present by ensuring that historical truths remain acknowledged and valued."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in the field with a strong, assertive presence, her gaze sharply fixed on the newspaper as it is presented to her. Her stance radiates both skepticism and curiosity while her body language betrays a quick internal calculation of the temporal mystery unfolding before her.',
        ap.emotional_state = 'Kathy is visibly startled and intrigued by the printed date, her face reflecting a mixture of disbelief and cautious expectation. Although her voice comes out in a terse question, internally she is wrestling with a swirl of confusion, anticipation, and determination to make sense of an apparent temporal anomaly that challenges her understanding of reality.',
        ap.emotional_tags = ["Kathy is visibly startled", "intrigued by the printed date, her face reflecting a mixture of disbelief", "cautious expectation. Although her voice comes out in a terse question, internally she is wrestling with a swirl of confusion, anticipation,", "determination to make sense of an apparent temporal anomaly that challenges her underst", "ing of reality."],
        ap.active_plans = ["Clarify the significance of the newspaper's date for her own understanding of time.", "Push for further explanation from Ben and test the reliability of this historical evidence.", "Resolve the cognitive dissonance triggered by the revelation to shape her next actions."],
        ap.beliefs = ["She believes in direct evidence as a foundation for truth, especially regarding personal history.", "Kathy is convinced that time is not linear and that anomalies can reveal deeper layers of reality.", "She holds that questioning every detail is essential to decode the mysteries connecting her past and present."],
        ap.goals = ["Short-term: To immediately question and seek clarification about the date '1920' as a surprising discrepancy.", "Medium-term: To reconcile the shock of the revelation with her internal logic and determination to understand its implications.", "Ultimate: To uncover the hidden connections between historical events and her own legacy, thereby gaining control over her narrative."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_envelope_old_photographs_event_21_1'})
    ON CREATE SET
        oi.description = 'The weathered envelope, containing a collection of faded, vintage photographs, serves as the catalyst for the revelation. Once opened by Sally, it not only exposes fragments of an old family saga but also becomes a tangible link between past and present, prompting both characters to confront the legacy encapsulated within the images.',
        oi.status_before = 'Before the event, the envelope was sealed and preserved, its worn exterior hinting at many years of neglect, safeguarding the delicate, historical photographs within.',
        oi.status_after = 'After the event, the envelope is opened and its contents are exposed, setting in motion an emotional and narrative inquiry into family heritage, as the photographs spark the conversation and direct the characters\' attention to long-forgotten memories.'
    WITH oi
    MATCH (o:Object {uuid: 'object_envelope_old_photographs'})
    MATCH (e:Event {uuid: 'event_21_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands before the envelope, gently tearing it open to reveal faded photographs. Her attentive hands and steady posture contrast with the bubbling curiosity in her eyes as she examines the pictures, initiating the revelation with a tentative query about familial ties.',
        ap.emotional_state = 'On the surface, Sally projects a measured mix of surprise and inquisitiveness as she questions the connection, yet beneath her calm exterior lies a profound internal stir—a combination of longing for lost heritage, wistfulness over the passage of time, and an undercurrent of determination to unearth hidden truths about her past.',
        ap.emotional_tags = ["On the surface, Sally projects a measured mix of surprise", "inquisitiveness as she questions the connection, yet beneath her calm exterior lies a profound internal stir\u2014a combination of longing for lost heritage, wistfulness over the passage of time,", "an undercurrent of determination to unearth hidden truths about her past."],
        ap.active_plans = ["Confirm the identity of the woman in the photographs.", "Establish the familial connection indicated by the visual evidence.", "Use the discovery as a stepping stone to piece together deeper, long-buried heritage mysteries."],
        ap.beliefs = ["The past holds essential clues to personal identity.", "Every fragment of evidence is vital to understanding one\u2019s true origins.", "Emotional revelations can serve as the gateway to uncovering larger mysteries."],
        ap.goals = ["Short-term: Clarify the immediate relationship shown by the photographs.", "Medium-term: Connect the visual evidence to the broader narrative of family history.", "Ultimate: Resolve personal questions about legacy and heritage that drive her relentless pursuit of the truth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Malcolm stands composed beside Sally as she unveils the envelope’s contents. With calm, measured gestures and a slightly furrowed brow indicating subtle concern, he processes the revelation and answers her inquiries with deliberate, reflective statements, his posture conveying quiet solemnity.',
        ap.emotional_state = 'Malcolm’s exterior remains placid, yet his voice betrays a tinge of sorrow and resignation as he confirms the loss of his grandmother. Internally, there is an unspoken conflict between maintaining emotional reserve and the burden of personal history, underscored by a desire to gently guide Sally through the weight of the revelation.',
        ap.emotional_tags = ["Malcolm\u2019s exterior remains placid, yet his voice betrays a tinge of sorrow", "resignation as he confirms the loss of his gr", "mother. Internally, there is an unspoken conflict between maintaining emotional reserve", "the burden of personal history, underscored by a desire to gently guide Sally through the weight of the revelation."],
        ap.active_plans = ["Provide accurate information regarding the photographs and familial links.", "Clarify the identity and significance of his grandmother to aid Sally\u2019s discovery.", "Maintain a composed demeanor to help ground the emotionally charged moment."],
        ap.beliefs = ["Truth about one\u2019s heritage must be acknowledged even if it stings.", "Honesty in revealing personal history is essential for healing.", "Family connections, however painful, are the cornerstone of one\u2019s identity."],
        ap.goals = ["Short-term: Verify for Sally that the photographs depict his late grandmother, Kathy.", "Medium-term: Assist in bridging the gap between past memories and current understanding.", "Ultimate: Come to terms with and preserve the legacy of his familial heritage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_22_1'})
    ON CREATE SET
        ap.current_status = 'Ben stands in the open field, his posture tense and alert as he watches Kathy launch herself down the hill. His face is set with concern, and his eyes scan the distance while he raises his voice in alarm.',
        ap.emotional_state = 'Ben’s emotional state is a turbulent mix of alarm, worry, and deep care. Outwardly, his voice carries a tremor of urgency and disbelief as he calls \'Where are you going?\', yet internally he battles a conflicted sadness and a determined resolve to catch up with her despite the emotional pain of witnessing her escape.',
        ap.emotional_tags = ["Ben\u2019s emotional state is a turbulent mix of alarm, worry,", "deep care. Outwardly, his voice carries a tremor of urgency", "disbelief as he calls 'Where are you going?', yet internally he battles a conflicted sadness", "a determined resolve to catch up with her despite the emotional pain of witnessing her escape."],
        ap.active_plans = ["Pursue Kathy down the hill to ensure her safety.", "Call out to her repeatedly in hopes of halting her departure.", "Assess the situation quickly to decide the next steps for intervention."],
        ap.beliefs = ["He believes in protecting those he cares about at any cost.", "He holds that following through on one\u2019s emotional commitment is paramount.", "He is convinced that understanding her actions will bring resolution to the moment."],
        ap.goals = ["Short-term: Immediately catch up with Kathy before she vanishes into the landscape.", "Medium-term: Ensure that Kathy is not putting herself in harm\u2019s way.", "Ultimate: Reconcile the underlying conflict between care and the need to let her go."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_22_1'})
    ON CREATE SET
        ap.current_status = 'Kathy sprints rapidly down the hill, her form silhouetted against the vast, sunlit field. With long, determined strides and an unwavering gaze forward, she cuts through the soft grass, her body language radiating urgency.',
        ap.emotional_state = 'Kathy’s emotional state is marked by an intense mixture of determination, anxiety, and a desperate need for escape. Outwardly, her rapid pace and resolute expression reveal a burning urgency, while internally she struggles with the weight of unresolved conflicts and a lingering fear of confrontation, leaving her both resolute and troubled.',
        ap.emotional_tags = ["Kathy\u2019s emotional state is marked by an intense mixture of determination, anxiety,", "a desperate need for escape. Outwardly, her rapid pace", "resolute expression reveal a burning urgency, while internally she struggles with the weight of unresolved conflicts", "a lingering fear of confrontation, leaving her both resolute", "troubled."],
        ap.active_plans = ["Escape from the present situation without looking back.", "Put physical distance between herself and whatever is pursuing her.", "Find a safe haven in the open, sunlit landscape to regroup."],
        ap.beliefs = ["She believes that immediate action is necessary when inner conflicts surface.", "She holds that running away is sometimes the only viable solution in moments of emotional turmoil.", "She is convinced that independence and self-preservation trump lingering doubts."],
        ap.goals = ["Short-term: Get as far away as possible from the source of her distress.", "Medium-term: Reach a point where she can safely pause and reassess her circumstances.", "Ultimate: Attain emotional freedom from the factors that compel her to flee."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ancient_letter_event_23_1'})
    ON CREATE SET
        oi.description = 'The Ancient Letter with Photographs is the central narrative device in this event. It is read by Sally in the dim light of the entrance hall and carries Kathy Nightingale’s urgent message filled with cryptic hints about lost time and bitter secrets. Its aged, weathered surface and faded images evoke a haunting past as it transfers Kathy’s legacy directly to Sally. The letter not only documents a cherished history but also acts as the catalyst that propels Sally into frantic action, triggering her desperate need to escape and uncover deeper mysteries.',
        oi.status_before = 'Prior to the event, the letter is kept safely and respectfully among other memorabilia in the entrance hall, its yellowed pages and faded photographs intact as a record of Kathy’s life.',
        oi.status_after = 'After the event, the letter shows signs of disturbance—it has been forcefully thrown down by Sally, then partially scattered and hastily retrieved, reflecting the chaotic impact of the message and the urgency of the circumstances surrounding its contents.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ancient_letter'})
    MATCH (e:Event {uuid: 'event_23_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_yale_key_event_23_3'})
    ON CREATE SET
        oi.description = 'The Yale key plays a pivotal role as it dangles from a chain held by one of the statues. It catches Sally’s attention as she crouches to examine the eerie figure. In the heat of the moment, during a brief unveiling of the statue’s eyes, Sally seizes the key, making it a crucial artifact in her investigation.',
        oi.status_before = 'Attached to the statue on a chain and part of the silent, watchful display of the landing.',
        oi.status_after = 'Now in Sally’s possession, the key transitions from a mysterious ornament to an active piece of evidence in the unfolding mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_yale_key'})
    MATCH (e:Event {uuid: 'event_23_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_23_3'})
    ON CREATE SET
        oi.description = 'The weeping angel statue is central to the eerie ambiance on the landing. This particular statue, along with its companions, creates an oppressive atmosphere by concealing and then momentarily revealing its eyes. Its behavior sets the supernatural tone of the scene, and by holding the Yale key on a chain, it indirectly facilitates Sally’s discovery.',
        oi.status_before = 'Positioned on the landing as part of a group of three, the statue stands motionless with its eyes hidden and the key suspended from its grasp.',
        oi.status_after = 'It remains in place, its silent vigilance unbroken, while the key has been removed and now changes the dynamic of its interaction with Sally, leaving the ominous presence intact in the background.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_23_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ancient_letter_event_23_4'})
    ON CREATE SET
        oi.description = 'The ancient letter with photographs plays a pivotal narrative role as the tangible link to Kathy’s storied past. Scattered along the banister rail amidst the chaos, it embodies personal history and secret messages from a bygone era. Its yellowed paper and faded images evoke both nostalgia and foreboding, acting as evidence that compels both Sally and Malcolm to collect and safeguard it against the mysterious forces at play.',
        oi.status_before = 'The letter and photographs lay disorganized and partly forgotten on the banister rail, exposed to the disarray of the entrance hall.',
        oi.status_after = 'After Sally’s frantic dash and Malcolm’s calm intervention, the letter is gathered and secured, its fate now intertwined with their quest to decipher the deeper mysteries surrounding them.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ancient_letter'})
    MATCH (e:Event {uuid: 'event_23_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statue_weeping_angel_event_23_4'})
    ON CREATE SET
        oi.description = 'The set of weeping angel statues serves as ominous silent witnesses to the unfolding drama. One statue, in particular, initially clutches a Yale key on a chain and momentarily reveals its hidden eyes as Sally crouches. Its almost sentient presence is felt as it reaches out in a menacing, frozen gesture, symbolizing the supernatural threat that lingers in the background and underscores the urgency of Sally’s actions.',
        oi.status_before = 'The statues are arranged on the landing with their eyes mostly concealed, one holding the Yale key, quietly observing the environment.',
        oi.status_after = 'Following the tense encounter, the statues remain as eerie, unmoving sentinels. They continue to silently observe from the windows, their presence a chilling reminder that the forces they represent are ever-watchful and integral to the unfolding mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statue_weeping_angel'})
    MATCH (e:Event {uuid: 'event_23_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow is seated in the dimly lit entrance hall, intently reading a faded, handwritten letter accompanied by worn photographs. Her posture shifts from relaxed concentration to sudden tension as she abruptly throws the documents aside and dashes up the staircase.',
        ap.emotional_state = 'Sally’s emotions are a turbulent mix of horror, disbelief, and urgent determination. Outwardly, her voice quivers as she murmurs that the contents are sick beyond measure, while internally she battles shock and a rising sense of danger from the cryptic message. Her rapid, panicked movements betray a deep-seated fear as well as an unwavering resolve to escape the ominous space.',
        ap.emotional_tags = ["Sally\u2019s emotions are a turbulent mix of horror, disbelief,", "urgent determination. Outwardly, her voice quivers as she murmurs that the contents are sick beyond measure, while internally she battles shock", "a rising sense of danger from the cryptic message. Her rapid, panicked movements betray a deep-seated fear as well as an unwavering resolve to escape the ominous space."],
        ap.active_plans = ["Flee the entrance hall immediately to avoid the looming threat suggested by the letter.", "Gather the scattered photographs and letter from the banister rail quickly and retreat outside.", "Evade the silent, watchful presence of the statues that seem to guard the upper level."],
        ap.beliefs = ["She believes that every detail in the letter holds a vital clue to a deeper mystery.", "She is convinced that the urgency in Kathy\u2019s words demands immediate action.", "She trusts her own instincts and intuition even in the face of inexplicable, supernatural occurrences."],
        ap.goals = ["Short-term: Escape the immediate danger of the haunted entrance hall and distancing herself from the statues.", "Medium-term: Secure the scattered documents and photographs to piece together Kathy Nightingale\u2019s cryptic message.", "Ultimate: Uncover the bitter secrets and lost time hinted at in the letter to resolve the haunting legacy left behind by Kathy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_23_1'})
    ON CREATE SET
        ap.current_status = 'Kathy Nightingale appears in this event as an ever-present, guiding voice through her urgent and heartfelt letter. Though not physically present, her legacy and personality permeate the space as Sally reads her meticulously penned words that bridge time and memory.',
        ap.emotional_state = 'Kathy’s emotional imprint radiates a determined and caring intensity. The tone of her letter is at once affectionate and resolute, conveying both the warmth of a cherished bond and the gravity of a mystery steeped in loss and time mislaid. Beneath the straightforward message lies a quiet sorrow and a fierce passion to be remembered and to protect those she loves.',
        ap.emotional_tags = ["Kathy\u2019s emotional imprint radiates a determined", "caring intensity. The tone of her letter is at once affectionate", "resolute, conveying both the warmth of a cherished bond", "the gravity of a mystery steeped in loss", "time mislaid. Beneath the straightforward message lies a quiet sorrow", "a fierce passion to be remembered", "to protect those she loves."],
        ap.active_plans = ["Impart a final, urgent message to Sally through the letter.", "Ensure that the intimate details of her past and the secrets of lost time are preserved for Sally\u2019s discovery.", "Guide Sally indirectly by embedding personal and cryptic clues within the photographs and texts."],
        ap.beliefs = ["She believes that her legacy must live on through Sally, a namesake and confidante.", "She holds that the truth about the past, no matter how bitter, is essential to confront the present.", "She is convinced that personal history and emotional truth are powerful tools against the inexorable pull of lost time."],
        ap.goals = ["Short-term: Communicate her urgent message and deep personal connection to Sally through her written words.", "Medium-term: Ensure that the memories captured in the photographs and words serve as a guide for future revelations.", "Ultimate: Establish a lasting bond that empowers Sally to face and resolve the cryptic dangers hinted at by her own neglected past."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_2'})
    ON CREATE SET
        ap.current_status = 'Sally dashes up the winding staircase with frantic urgency, her footsteps echoing in the dim light. Her body is tense and her eyes scan the shadowed corners as she repeatedly calls out for Kathy, driven to escape the oppressive atmosphere. Every movement, from her quick glances over her shoulder to her sudden pivot at the sound of a closing door, is filled with a desperate need to flee danger.',
        ap.emotional_state = 'Sally is overtaken by a turbulent mix of fear, anxiety, and determination. Outwardly, her quivering voice and rapid pace betray her panic, while internally she wrestles with rising dread and a burning urge for answers. Despite the terror, there is an undercurrent of resolve as she clings to the hope of finding safety and insight into the mystery unfolding around her.',
        ap.emotional_tags = ["Sally is overtaken by a turbulent mix of fear, anxiety,", "determination. Outwardly, her quivering voice", "rapid pace betray her panic, while internally she wrestles with rising dread", "a burning urge for answers. Despite the terror, there is an undercurrent of resolve as she clings to the hope of finding safety", "insight into the mystery unfolding around her."],
        ap.active_plans = ["Escape immediately from the ominous environment and the threatening presence suggested by the statues.", "Locate and reunite with Kathy to gain guidance and clarity in this unsettling situation.", "Secure any potential clues\u2014symbolized by the key\u2014to further unlock the mysteries that the eerie letter has hinted at."],
        ap.beliefs = ["She believes that the unnerving message and the accompanying evidence are crucial to understanding the mystery at hand.", "She is convinced that acting immediately is essential to avoid a looming, undefined danger.", "She trusts her intuition and investigative spirit, convinced that her perseverance will ultimately reveal the truth."],
        ap.goals = ["Short-term: Evacuate the perilous room by dashing up the staircase to safety.", "Medium-term: Reconnect with Kathy to piece together the cryptic clues and unravel the mystery.", "Ultimate: Discover the underlying truth behind the strange events, ensuring that she overcomes the immediate threat while paving the way for a lasting resolution."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_3'})
    ON CREATE SET
        ap.current_status = 'Sally is positioned at the landing of the staircase in the entrance hall, crouching cautiously beside the row of eerie statues. She peers intently at the one holding the Yale key, her body tense and ready as she reaches out to seize the key before it can be reclaimed by the statue.',
        ap.emotional_state = 'On the surface, Sally manifests a mix of apprehension and resolve, her eyes darting from the mysterious statues to the key and then to the closing front door. Beneath this, she battles a surge of heart-stopping fear mingled with the thrill of discovery, driven by an intense desire to decode the supernatural message. Her pulse pounds as she balances her growing dread with steely determination to secure the evidence and escape the oppressive atmosphere.',
        ap.emotional_tags = ["On the surface, Sally manifests a mix of apprehension", "resolve, her eyes darting from the mysterious statues to the key", "then to the closing front door. Beneath this, she battles a surge of heart-stopping fear mingled with the thrill of discovery, driven by an intense desire to decode the supernatural message. Her pulse pounds as she balances her growing dread with steely determination to secure the evidence", "escape the oppressive atmosphere."],
        ap.active_plans = ["Secure the Yale key as a vital piece of evidence.", "Evade the potentially malevolent movements of the statues.", "Quickly exit the landing to reassess her next move in uncovering the mystery."],
        ap.beliefs = ["Believes that every enigmatic clue is a stepping stone toward understanding the supernatural events.", "Is convinced that her intuition is key to unraveling the mystery behind the statues.", "Holds that bravery in the face of unknown threats is essential for uncovering the truth."],
        ap.goals = ["Short-term: Retrieve the Yale key and avoid being caught by the statues.", "Medium-term: Piece together the significance of the key and the cryptic messages in the environment.", "Ultimate: Uncover the deeper mystery linking the supernatural occurrences and her own destiny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_4'})
    ON CREATE SET
        ap.current_status = 'Sally is dashing down the staircase, key gripped tightly in her hand, her eyes wide with urgency as she narrowly evades the extended, ghostly grasp of the statue. She pauses only briefly at the sound of the front door slamming shut, then pivots and races to collect the scattered photographs and letter from the banister rail.',
        ap.emotional_state = 'Sally’s face is etched with a mix of panic and determined resolve. Outwardly, her rapid movements and frantic glances reveal sheer anxiety, while internally she wrestles with a burning curiosity and deep-seated need to preserve the memories and mysteries handed down to her. There is an underlying tension between her instinct to flee danger and a compulsion to safeguard the evidence of a past that holds the key to unravelling the present enigma.',
        ap.emotional_tags = ["Sally\u2019s face is etched with a mix of panic", "determined resolve. Outwardly, her rapid movements", "frantic glances reveal sheer anxiety, while internally she wrestles with a burning curiosity", "deep-seated need to preserve the memories", "mysteries h", "ed down to her. There is an underlying tension between her instinct to flee danger", "a compulsion to safeguard the evidence of a past that holds the key to unravelling the present enigma."],
        ap.active_plans = ["Escape the immediate threat posed by the supernatural presence.", "Secure and preserve the ancient letter and photographs for further investigation.", "Use the key and collected evidence to uncover the hidden mystery linked to the weeping angels."],
        ap.beliefs = ["She believes that every piece of evidence, no matter how old, holds the truth to her past.", "She is convinced that the key and the letter are integral to unveiling deeper secrets.", "She trusts that courage and persistence are necessary to confront even the strangest of dangers."],
        ap.goals = ["Short-term: Safely retreat downstairs and gather all scattered evidence.", "Medium-term: Decipher the clues contained within the letter, photographs, and key.", "Ultimate: Unravel the mystery behind the weeping angels and their connection to her family\u2019s legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_23_4'})
    ON CREATE SET
        ap.current_status = 'Malcolm appears at the driveway, descending calmly and purposefully. With measured steps, he collects the scattered photographs and the ancient letter off the banister rail, displaying a composed efficiency that stands in stark contrast to Sally’s frantic energy.',
        ap.emotional_state = 'Malcolm’s demeanor is understated yet attentive. While his face remains calm and collected, there is a hint of quiet concern and resolve in his eyes. He exudes a sense of responsibility and organizational clarity, balancing personal feelings with the duty to preserve important remnants of the past. His measured approach reflects an inner commitment to order in the midst of chaos.',
        ap.emotional_tags = ["Malcolm\u2019s demeanor is understated yet attentive. While his face remains calm", "collected, there is a hint of quiet concern", "resolve in his eyes. He exudes a sense of responsibility", "organizational clarity, balancing personal feelings with the duty to preserve important remnants of the past. His measured approach reflects an inner commitment to order in the midst of chaos."],
        ap.active_plans = ["Secure and collect the scattered memorabilia without drawing undue attention.", "Ensure the evidence is properly preserved for future analysis.", "Support Sally by acting as a stabilizing presence during the unfolding crisis."],
        ap.beliefs = ["He believes that preserving historical documents is key to understanding personal and familial mysteries.", "He holds a conviction that calm and methodical action can mitigate even supernatural crisis.", "He trusts that evidence and truth are interlinked and must be safeguarded for the sake of clarity."],
        ap.goals = ["Short-term: Collect the photographs and letter quickly to prevent further loss.", "Medium-term: Help piece together the mystery hidden within these personal artifacts.", "Ultimate: Contribute to uncovering and resolving the deeper secrets intertwined with their family legacy."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ancient_letter_event_24_1'})
    ON CREATE SET
        oi.description = 'The ancient letter, accompanied by faded photographs, serves as the vital conduit for Kathy’s memory and life story. As Sally reads its weathered pages, the letter transforms into an artifact that bridges the gap between past and present, revealing deep emotional histories and personal legacies through its handwritten words and images.',
        oi.status_before = 'Before the event, the letter is a treasured, timeworn relic with yellowed pages and faded ink, carefully preserved as a record of Kathy’s experiences.',
        oi.status_after = 'After the event, while the physical condition of the letter remains unchanged, it accrues a renewed emotional significance; it becomes a symbol of enduring memory and connection, deeply influencing Sally’s inner life and understanding of her own past.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ancient_letter'})
    MATCH (e:Event {uuid: 'event_24_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_24_1'})
    ON CREATE SET
        ap.current_status = 'Sally is seated at a modest table in the quiet ambience of the cafe, holding the ancient letter delicately in her hands. Her posture is attentive and absorbed; she leans slightly forward as she runs her finger over the faded ink and photographs, completely immersed in the act of reading.',
        ap.emotional_state = 'Outwardly calm and reflective, Sally’s eyes betray an inner torrent of emotions as she absorbs Kathy’s heartfelt words. Beneath her composed exterior lies a mix of nostalgic yearning, solemn sorrow over the passage of time, and a quiet hope that these recollections will guide her own future. Her internal state is marked by both the weight of loss and the resilience of cherished memories.',
        ap.emotional_tags = ["Outwardly calm", "reflective, Sally\u2019s eyes betray an inner torrent of emotions as she absorbs Kathy\u2019s heartfelt words. Beneath her composed exterior lies a mix of nostalgic yearning, solemn sorrow over the passage of time,", "a quiet hope that these recollections will guide her own future. Her internal state is marked by both the weight of loss", "the resilience of cherished memories."],
        ap.active_plans = ["To uncover deeper emotional truths hidden within Kathy\u2019s narrated memories.", "To connect her present self with the cherished past conveyed by the letter.", "To process and document the impact of these relics on her own journey."],
        ap.beliefs = ["The past is a crucial teacher that informs our present identity.", "Memories, even in faded ink, hold enduring emotional power.", "Honesty in emotion and reflection is essential for personal growth."],
        ap.goals = ["Short-term: To fully understand the layers of Kathy\u2019s reminiscence while reading.", "Medium-term: To reconcile her current feelings with the legacy and lessons revealed in the letter.", "Ultimate: To honor and preserve the emotional truths of the past as a guide for her future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_24_1'})
    ON CREATE SET
        ap.current_status = 'Kathy appears in this event as a warm, off-screen voice that fills the cafe with her reflective narration. Although she is not physically present, her legacy is powerfully felt through the heartfelt account etched on the letter, making her presence both ethereal and enduring.',
        ap.emotional_state = 'Her voice exudes a gentle and reflective warmth, imbued with pride at a life well-lived and a tinge of bittersweet melancholy. There is an undercurrent of steadfast resolve and tender affection in her words, conveying both the joy of past love and the sorrow of inevitable loss.',
        ap.emotional_tags = ["Her voice exudes a gentle", "reflective warmth, imbued with pride at a life well-lived", "a tinge of bittersweet melancholy. There is an undercurrent of steadfast resolve", "tender affection in her words, conveying both the joy of past love", "the sorrow of inevitable loss."],
        ap.active_plans = ["To impart her life lessons through the intimate details of her memories.", "To comfort and guide Sally in understanding the value of a life filled with love.", "To leave behind a legacy of personal truth that transcends physical absence."],
        ap.beliefs = ["Love and cherished relationships are the cornerstones of a fulfilled life.", "The integrity of personal history must be preserved and honored.", "Emotional honesty is the pathway to enduring connection across time."],
        ap.goals = ["Short-term: To provide Sally with a poignant insight into her own past through the narration.", "Medium-term: To reinforce the importance of remembering and valuing personal history.", "Ultimate: To ensure that her legacy, marked by love and authenticity, lives on as an eternal guide for those she cares about."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_25_1'})
    ON CREATE SET
        ap.current_status = 'Kathy stands in an open field with confident bearing. She faces Ben directly, her posture upright and assured, while subtle gestures with her hand punctuate her inquiries. Her head tilts slightly as she initiates the conversation, reflecting a blend of curiosity and a playful challenge in a softly lit, natural setting.',
        ap.emotional_state = 'Kathy appears both alert and assertive; her tone is inquisitive but layered with a lighthearted provocation. Beneath the surface of her straightforward questioning, there is a mix of determination and restrained vulnerability, as she actively probes to understand Ben’s intent. Her inner drive to confirm authenticity in the relationship shimmers behind her composed exterior.',
        ap.emotional_tags = ["Kathy appears both alert", "assertive; her tone is inquisitive but layered with a lighthearted provocation. Beneath the surface of her straightforward questioning, there is a mix of determination", "restrained vulnerability, as she actively probes to underst", "Ben\u2019s intent. Her inner drive to confirm authenticity in the relationship shimmers behind her composed exterior."],
        ap.active_plans = ["Gauge Ben\u2019s intentions through direct inquiry.", "Affirm her own independence while testing his response.", "Establish a subtle rapport through measured, probing dialogue."],
        ap.beliefs = ["Honesty and direct communication are essential in forging genuine connections.", "Personal autonomy is key and one must be aware of who follows or leads in life.", "Challenges, even playful ones, can reveal deeper truths about mutual respect."],
        ap.goals = ["Short-term: Confirm whether Ben is truly following her and understand his motive.", "Medium-term: Assess the dynamics of their relationship through simple yet pointed questions.", "Ultimate: Ensure that she remains in control of her journey and that any follower proves to be reliable."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_25_1'})
    ON CREATE SET
        ap.current_status = 'Ben stands in the field with a measured calmness, his posture relaxed yet attentive. He listens to Kathy’s questions with a steady gaze, his body language unhurried as he offers terse, affirmative responses. His quiet presence contrasts sharply with the more animated Kathy, highlighting his understated manner.',
        ap.emotional_state = 'Ben appears remarkably calm and composed; his brief responses convey a degree of gentle humor and a reserved confidence. Internally, he remains unruffled by the confrontation, suggesting acceptance and assurance about his role in the interaction. His subtle amusement and quiet integrity indicate an internal balance between engagement and detachment.',
        ap.emotional_tags = ["Ben appears remarkably calm", "composed; his brief responses convey a degree of gentle humor", "a reserved confidence. Internally, he remains unruffled by the confrontation, suggesting acceptance", "assurance about his role in the interaction. His subtle amusement", "quiet integrity indicate an internal balance between engagement", "detachment."],
        ap.active_plans = ["Respond succinctly to Kathy\u2019s probing questions without overcommitting.", "Maintain a relaxed and steady presence in the conversation.", "Subtly affirm his reliability while preserving his inherent reticence."],
        ap.beliefs = ["Simplicity and understatement can be powerful tools in communication.", "Trust is built through calm and measured responses, rather than overt declarations.", "The natural flow of conversation reveals true intentions over time."],
        ap.goals = ["Short-term: Clearly affirm his presence in a non-confrontational manner.", "Medium-term: Sustain a gentle rapport that balances inquiry with ease.", "Ultimate: Ensure that his quiet integrity and reliability are recognized without being forced."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_flowers_event_26_1'})
    ON CREATE SET
        oi.description = 'The vibrant arrangement of fresh flowers is tenderly placed on the weathered gravestone, acting as a living tribute amidst the decay of stone. Their bright colors and delicate scents provide a stark contrast to the muted inscription, symbolizing both remembrance and the fleeting beauty of life.',
        oi.status_before = 'Before the event, the flowers were freshly arranged and awaiting their placement at the grave, representing a premeditated act of remembrance that had yet to be actualized.',
        oi.status_after = 'After the event, the flowers remain on the gravestone, serving as a poignant emblem of love and loss, slightly weathered by the elements yet still exuding vibrant life and the promise of renewal.'
    WITH oi
    MATCH (o:Object {uuid: 'object_flowers'})
    MATCH (e:Event {uuid: 'event_26_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_cemetery_statue_event_26_2'})
    ON CREATE SET
        oi.description = 'The Cemetery Statue serves as a silent, enduring witness to the poignant farewell. It stands in the background, its time-worn features and unyielding gaze embodying the inevitability of time. The statue reinforces the scene\'s themes of memory, loss, and the permanence of the past, observing Sally’s final tender act without change.',
        oi.status_before = 'Before the event, the statue is a stoic, weathered stone figure seated in the cemetery, its features softened by years of exposure and silent observation.',
        oi.status_after = 'After the event, the statue remains unchanged, continuing in its role as an eternal, silent guardian, much like the timeless witness to the passages of life and memory.'
    WITH oi
    MATCH (o:Object {uuid: 'object_cemetery_statue'})
    MATCH (e:Event {uuid: 'event_26_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_flowers_event_26_2'})
    ON CREATE SET
        oi.description = 'The bouquet of flowers is carefully selected and vibrantly arranged, serving as a poignant token of remembrance. Sally places the flowers on the grave with gentle, reverent movements, using them as a symbol of life and transient beauty amidst the somber tones of loss. The flowers bridge the flicker of past warmth with the cool austerity of the stone, emphasizing the bittersweet nature of farewell.',
        oi.status_before = 'Before the event, the flowers are fresh, vivid, and full of life, embodying natural beauty and hope in a burst of color.',
        oi.status_after = 'After the event, the flowers lie tenderly on the gravestone, their beauty now interwoven with loss and remembrance, serving as a temporary yet enduring tribute to the departed.'
    WITH oi
    MATCH (o:Object {uuid: 'object_flowers'})
    MATCH (e:Event {uuid: 'event_26_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands at the edge of the cemetery, next to the crumbling gravestone, her eyes fixed on the faded inscription. She shifts her weight from one foot to the other, fingers curled around the folded paper in her hand as she reads the cryptic message aloud, her posture both reflective and restless.',
        ap.emotional_state = 'Sally’s face is a complex tapestry of wistfulness and defiant humor, her features soft with sorrow yet set with determination. Beneath the mild mockery in her quip about age, there is a palpable undercurrent of loss, a painful nostalgia for a past that refuses to be forgotten, and a yearning for closure that warps and deepens every memory.',
        ap.emotional_tags = ["Sally\u2019s face is a complex tapestry of wistfulness", "defiant humor, her features soft with sorrow yet set with determination. Beneath the mild mockery in her quip about age, there is a palpable undercurrent of loss, a painful nostalgia for a past that refuses to be forgotten,", "a yearning for closure that warps", "deepens every memory."],
        ap.active_plans = ["To absorb and internalize Kathy\u2019s final message and understand its implications.", "To reconcile the paradox of time evident in the inscription and her own life experiences.", "To use this moment as a catalyst for mending and redefining her ongoing relationship with the legacy left behind."],
        ap.beliefs = ["That truth and memory can coexist even within the most perplexing intersections of time.", "That humor and heartbreak are inseparable parts of life\u2019s narrative.", "That every message from the past holds a key to understanding personal destiny."],
        ap.goals = ["Short-term: To reflect deeply on Kathy\u2019s words and seek immediate emotional clarity.", "Medium-term: To incorporate the legacy of her lost loved ones into her present identity.", "Ultimate: To find peace with the interplay of past and present, ensuring that the truth of her history empowers her future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_26_1'})
    ON CREATE SET
        ap.current_status = 'Kathy is present in this event by way of her immortalized inscription, her words etched in stone on the weathered grave. Though physically absent, her legacy is projected through the powerful, hand-carved message that greets visitors at the cemetery.',
        ap.emotional_state = 'Kathy’s recorded voice resonates with a blend of thoughtful melancholy and enduring hope. Her tone in the inscription carries a calm acceptance of time’s inexorable passage, juxtaposed with a bittersweet longing for a life enlarged by love and memory. There is an undeniable strength, a silent insistence on the beauty of transitions despite the pain they bring.',
        ap.emotional_tags = ["Kathy\u2019s recorded voice resonates with a blend of thoughtful melancholy", "enduring hope. Her tone in the inscription carries a calm acceptance of time\u2019s inexorable passage, juxtaposed with a bittersweet longing for a life enlarged by love", "memory. There is an undeniable strength, a silent insistence on the beauty of transitions despite the pain they bring."],
        ap.active_plans = ["To guide those left behind with her carefully chosen words.", "To ensure that her love and final wishes continue to influence the living.", "To create a lasting testament that bridges the gaps between disparate moments in time."],
        ap.beliefs = ["That life\u2019s transitions, however jarring, are essential for renewal.", "That love remains a constant beacon even as moments and years slip away.", "That memories can transform loss into a source of enduring inspiration."],
        ap.goals = ["Short-term: To instill hope and prompt reflection in the hearts of her loved ones.", "Medium-term: To remind those she left behind of the importance of carrying on her legacy.", "Ultimate: To transcend the boundaries of time with the assurance that her love will continue to guide future generations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_26_1'})
    ON CREATE SET
        ap.current_status = 'Ben is represented quietly by his gravestone, a silent testament to the gentle life he once led. His resting place, marked by carefully inscribed dates and details, stands as a respectful memorial amidst the timeless stones of the cemetery.',
        ap.emotional_state = 'Even though Ben does not actively participate with spoken words, his presence evokes a subdued sorrow and tender remembrance. The stillness of his memorial speaks to the understated yet profound impact he had on those around him, offering a silent comfort and a lingering sense of peaceful acceptance amidst the complexities of loss.',
        ap.emotional_tags = ["Even though Ben does not actively participate with spoken words, his presence evokes a subdued sorrow", "tender remembrance. The stillness of his memorial speaks to the understated yet profound impact he had on those around him, offering a silent comfort", "a lingering sense of peaceful acceptance amidst the complexities of loss."],
        ap.active_plans = ["To eternally signify the cherished memories of a life well-lived.", "To serve as a quiet reminder of the importance of family and legacy.", "To inspire those visiting the grave to reflect on their own histories and connections."],
        ap.beliefs = ["That a life lived in quiet dignity leaves an indelible mark.", "That remembrance is as powerful as spoken words in binding people together.", "That the gentle nature of true legacy persists even in silence."],
        ap.goals = ["Short-term: To offer solace to the grieving and encourage reflective moments.", "Medium-term: To strengthen the emotional bonds among those who remember him.", "Ultimate: To ensure that his memory endures as an everlasting part of the collective family narrative."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands at the gravestone in the quiet cemetery, gently lowering a fresh bouquet of flowers onto the weathered memorial. Her movements are deliberate and graceful; she pauses to adjust her posture, ensuring that every gesture honors the solemnity of the occasion.',
        ap.emotional_state = 'Outwardly, Sally appears tender and reflective as she mourns the past with quiet dignity. Her eyes are soft yet heavy with lingering melancholy—a mix of bittersweet nostalgia and resolve. Internally, she battles the sorrow of loss while mustering the courage to let go, feeling both the ache of memory and the faint hope of renewal.',
        ap.emotional_tags = ["Outwardly, Sally appears tender", "reflective as she mourns the past with quiet dignity. Her eyes are soft yet heavy with lingering melancholy\u2014a mix of bittersweet nostalgia", "resolve. Internally, she battles the sorrow of loss while mustering the courage to let go, feeling both the ache of memory", "the faint hope of renewal."],
        ap.active_plans = ["To pay proper tribute by laying the bouquet as a symbolic farewell.", "To confront and accept the weight of memory as part of her journey.", "To mentally prepare herself to move forward with the lessons of loss in her heart."],
        ap.beliefs = ["Honoring the past is essential to healing and growth.", "Each moment of remembrance connects the living with those who have departed.", "Acceptance of loss is a necessary step towards forging a future that embraces both joy and sorrow."],
        ap.goals = ["Short-term: To find solace in the peaceful act of remembrance at the grave.", "Medium-term: To reconcile past pain by cherishing memories and allowing herself to heal.", "Ultimate: To integrate the lessons of loss into a meaningful life, honoring both memory and the inevitability of time."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvds_store_television_event_27_1'})
    ON CREATE SET
        oi.description = 'The television, securely fastened to the wall, is actively displaying a fast-paced shootout sequence that enhances the dramatic atmosphere of the DVD store. It not only sets a dynamic visual backdrop for the scene but also contrasts with the measured inquiry of Sally, subtly emphasizing the collision between cinematic spectacle and real-life investigation.',
        oi.status_before = 'Prior to the event, the television operates normally, broadcasting an engaging and action-packed film sequence that reflects the store’s dedication to film culture.',
        oi.status_after = 'After the brief interaction, the television remains unchanged—continuing its vivid display of action—serving as a constant, unobtrusive narrative element that underscores the surreal yet routine environment of the store.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvds_store_television'})
    MATCH (e:Event {uuid: 'event_27_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_27_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow strides purposefully to the counter in Banto\'s DVD store, her gaze flitting briefly to the television behind her. She asks directly for Lawrence Nightingale, her tone and posture exuding both determination and curiosity as she stands ready to uncover the next clue in the labyrinthine mystery.',
        ap.emotional_state = 'Sally displays a blend of outward confidence and inner intensity. Her bright eyes and steady voice mask a subtle undercurrent of apprehension, as she remains alert to unexplained twists. There is a tension between her fearless investigative nature and the uncertainty that each new clue may reveal deeper secrets.',
        ap.emotional_tags = ["Sally displays a blend of outward confidence", "inner intensity. Her bright eyes", "steady voice mask a subtle undercurrent of apprehension, as she remains alert to unexplained twists. There is a tension between her fearless investigative nature", "the uncertainty that each new clue may reveal deeper secrets."],
        ap.active_plans = ["Secure clear directions to Lawrence Nightingale.", "Gather further information to advance her investigation.", "Pursue every clue that links the mysterious narrative threads together."],
        ap.beliefs = ["The truth can be uncovered through relentless inquiry.", "Every detail, however small, holds significance in solving the mystery.", "Courage and persistence are essential to face the unknown."],
        ap.goals = ["Short-term: Obtain the necessary information about Lawrence\u2019s whereabouts.", "Medium-term: Connect this clue with the broader narrative mysteries.", "Ultimate: Unravel the hidden web of labyrinthine connections that underpin the unfolding events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_27_1'})
    ON CREATE SET
        ap.current_status = 'Banto stands behind the counter at the DVD store, calmly monitoring the fast-paced shootout playing on the wall-mounted television. With a measured tone and unruffled demeanor, he briefly acknowledges Sally Sparrow and directs her to look through the back of the store.',
        ap.emotional_state = 'Banto remains a model of dry, unruffled composure throughout the encounter. His facial expression and relaxed body language express pragmatic detachment and a touch of understated amusement. Even amid surreal circumstances, his inner calm and practical mindset shine through, suggesting a habitual ease with life’s odd twists.',
        ap.emotional_tags = ["Banto remains a model of dry, unruffled composure throughout the encounter. His facial expression", "relaxed body language express pragmatic detachment", "a touch of understated amusement. Even amid surreal circumstances, his inner calm", "practical mindset shine through, suggesting a habitual ease with life\u2019s odd twists."],
        ap.active_plans = ["Provide succinct directions to aid Sally\u2019s inquiry.", "Maintain the orderly atmosphere of the store.", "Oversee the environment with a quiet confidence, ensuring nothing disrupts the store's routine."],
        ap.beliefs = ["Practicality is the best response to unusual situations.", "A straightforward approach cuts through confusion.", "Even bizarre events can be managed with calm and clarity."],
        ap.goals = ["Short-term: Direct Sally efficiently without undue distraction.", "Medium-term: Preserve the store\u2019s orderly and unflappable environment.", "Ultimate: Ensure that the mundane operation of the DVD store remains intact despite the surrounding mysteries."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_playback_screen_event_28_1'})
    ON CREATE SET
        oi.description = 'The DVD playback screen serves as the central conduit for communication in this event. It projects The Doctor’s cryptic image and disjointed messages, including the enigmatic reference to \'Thirty eight\' and fleeting appearances of Martha. The screen pauses intermittently as Larry manipulates the playback, accentuating the layered mystery. Its display transforms the back room into a nexus of time-warped dialogue and shadowy hints, effectively linking the spoken messages with the unfolding narrative.',
        oi.status_before = 'Before the event, the screen was inactive and in standby mode, quietly mounted on the wall, waiting to be activated.',
        oi.status_after = 'After the event, the screen remains active, still displaying the paused cryptic messages, continuing to serve as the mysterious focal point that connects the digital realm with the broader enigma of the Doctor’s warnings.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_playback_screen'})
    MATCH (e:Event {uuid: 'event_28_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_playback_screen_event_28_3'})
    ON CREATE SET
        oi.description = 'The DVD playback screen serves as the central conduit for the Doctor’s cryptic messages and the hidden dialogue. It intermittently pauses and resumes, allowing Larry to freeze the image to scrutinize the concealed clues while facilitating a live conversation between the characters. Its recurring role in displaying the Easter egg explanation highlights its narrative significance as both a source of technical information and comic relief.',
        oi.status_before = 'Before the event, the screen was actively displaying the Doctor’s ongoing message, projecting intermittent insights and spontaneous remarks in a steady loop.',
        oi.status_after = 'After the event, the screen remains as an unaltered yet crucial repository of the cryptic messages, its display frozen mid-instruction as a key piece of evidence in the unfolding mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_playback_screen'})
    MATCH (e:Event {uuid: 'event_28_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_seventeen_dvd_list_event_28_4'})
    ON CREATE SET
        oi.description = 'The Seventeen DVD List is unveiled as a crucial tangible clue in the midst of temporal banter. Larry produces it to underline the cryptic discussion about the Doctor’s mysterious appearances on various DVDs, thereby anchoring the surreal conversation in a concrete piece of evidence. Its revelation serves as both a focal point for further investigation and a narrative pivot that promises a deeper insight into the intertwined mysteries.',
        oi.status_before = 'Prior to the event, the DVD list was carefully kept by Larry as a concise record of the seventeen DVDs featuring the Doctor’s hidden appearances; it was a secure piece of evidence stored away and unassuming in its appearance.',
        oi.status_after = 'Following its revelation, the DVD list transforms into a symbol of the mystery’s tangible core, with its significance clearly amplified by the conversation. It now functions as a critical clue that both Sally and Larry must decipher to advance their understanding of the temporal puzzle.'
    WITH oi
    MATCH (o:Object {uuid: 'object_seventeen_dvd_list'})
    MATCH (e:Event {uuid: 'event_28_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_playback_screen_event_28_4'})
    ON CREATE SET
        oi.description = 'The DVD Playback Screen serves as the medium through which the Doctor’s disjointed and enigmatic messages are communicated. It intermittently displays cryptic footage, pausing for moments that allow Larry to freeze the broadcast and closely examine the hidden clues embedded within the dialogue. Its role is pivotal as it sparks the conversation about time, the nature of the Easter egg, and the underlying mystery that propels the narrative forward.',
        oi.status_before = 'Before the event, the screen was actively playing the Doctor’s enigmatic message without interruption, contributing to the unsettling atmosphere with its cryptic and looping footage.',
        oi.status_after = 'After the dynamic interaction in the scene, the screen remains as a silent yet potent presence. It continues to hold the cryptic messages, now serving as a reference point for the revelations and an emblem of the overarching riddle that Sally and Larry are set to unravel.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_playback_screen'})
    MATCH (e:Event {uuid: 'event_28_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the dim back room, eyes fixed on the DVD playback screen as it intermittently comes alive with cryptic images. She greets the screen with a clear, inquisitive \'Hello?\' while her body remains alert and ready for any sudden developments, her posture tense yet determined.',
        ap.emotional_state = 'Outwardly, Sally appears calm yet focused, her face lit by the flickering screen as she listens to the Doctor’s enigmatic statements. Internally, she is a mix of intrigue and mounting apprehension, with a quiet urgency driving her to decode every word. There is an underlying conflict between her habitual curiosity and the weight of the mystery unfolding before her, as she grapples with hidden hints that threaten to upend her understanding of time.',
        ap.emotional_tags = ["Outwardly, Sally appears calm yet focused, her face lit by the flickering screen as she listens to the Doctor\u2019s enigmatic statements. Internally, she is a mix of intrigue", "mounting apprehension, with a quiet urgency driving her to decode every word. There is an underlying conflict between her habitual curiosity", "the weight of the mystery unfolding before her, as she grapples with hidden hints that threaten to upend her underst", "ing of time."],
        ap.active_plans = ["Decipher the Doctor's cryptic message and his mention of 'Thirty eight'.", "Evaluate the transmission for any further clues that connect to her past and the hidden messages left by her sister.", "Maintain vigilant observation of the DVD screen and be ready to act upon any new information."],
        ap.beliefs = ["She believes that every cryptic clue is a critical piece of a larger mystery.", "She is convinced that the truth about time and hidden messages lies within the seemingly random details.", "She trusts her intuition to guide her through even the most perplexing situations."],
        ap.goals = ["Short-term: Understand and record the precise details of the Doctor\u2019s message.", "Medium-term: Use the information to unravel the further clues about her mysterious past and the dangers hinted at.", "Ultimate: Piece together the scrambled messages to prevent potential time-related hazards and secure the truth behind the enigmatic warnings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor is visible solely through the digital projection on the DVD playback screen, his image framed in soft, flickering light. He appears relaxed yet hurried, sporting an expression that combines bemusement with urgency. His offhand delivery of phrases like \'Thirty eight\' underscores a posture of nonchalance intertwined with hidden depths.',
        ap.emotional_state = 'On the surface, The Doctor comes across as detached and eccentric, offering cryptic remarks with a wry smile and a tone that borders on playful. Beneath this veneer, however, there is a palpable tension driven by the turmoil of time; he is troubled by the chaotic nature of his existence and the impending consequences of failing to communicate his message. This duality of light-hearted banter and deep-seated concern infuses his every word with a profound, time-worn wisdom mixed with personal regret.',
        ap.emotional_tags = ["On the surface, The Doctor comes across as detached", "eccentric, offering cryptic remarks with a wry smile", "a tone that borders on playful. Beneath this veneer, however, there is a palpable tension driven by the turmoil of time; he is troubled by the chaotic nature of his existence", "the impending consequences of failing to communicate his message. This duality of light-hearted banter", "deep-seated concern infuses his every word with a profound, time-worn wisdom mixed with personal regret."],
        ap.active_plans = ["Disseminate crucial yet enigmatic information through the digital medium to guide the recipients.", "Ensure that the hidden clues are embedded within his fragmented dialogue to be deciphered later.", "Convey urgency about the unfolding timeline and instigate necessary action without overtly revealing too much."],
        ap.beliefs = ["He believes that time is inherently non-linear and that every message, however cryptic, plays a role in a larger tapestry.", "He holds that cryptic communication is sometimes the only safe way to impart delicate information.", "He is convinced that the smallest detail can have massive ramifications in preserving the timeline."],
        ap.goals = ["Short-term: Transmit his crucial message clearly via the DVD playback screen despite technical interruptions.", "Medium-term: Alert his companions and the audience to the impending temporal danger in a way that spurs them to act.", "Ultimate: Secure the timeline by ensuring that his instructions and hidden clues are received and understood, even if indirectly through fragmented digital messages."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_28_1'})
    ON CREATE SET
        ap.current_status = 'Martha appears fleetingly on the screen as part of the projected sequence, her image quickly intercut with The Doctor’s. Though her presence is brief, it is marked by a composed demeanor and a subtle hint of exasperation as she vanishes shortly after her initial greeting, leaving the back room once more dominated by the cryptic dialogue.',
        ap.emotional_state = 'Martha carries an air of calm practicality in her brief appearance, her facial expression and tone suggesting steady resolve amidst chaos. Internally, she grapples with frustration at the Doctor’s convoluted timeline and the inherent disarray of their situation, yet she remains anchored by a sense of duty and care. Her demeanor radiates both a quiet determination and a hint of urgency, showing that while she may be sidelined momentarily, her role is critical to restoring balance.',
        ap.emotional_tags = ["Martha carries an air of calm practicality in her brief appearance, her facial expression", "tone suggesting steady resolve amidst chaos. Internally, she grapples with frustration at the Doctor\u2019s convoluted timeline", "the inherent disarray of their situation, yet she remains anchored by a sense of duty", "care. Her demeanor radiates both a quiet determination", "a hint of urgency, showing that while she may be sidelined momentarily, her role is critical to restoring balance."],
        ap.active_plans = ["Provide stabilizing presence and subtle encouragement to counterbalance The Doctor\u2019s erratic delivery.", "Assist in maintaining the focus and clarity of the ongoing communication through her brief on-screen contribution.", "Prepare to re-engage with the situation at a more decisive moment, ensuring that critical information is relayed effectively."],
        ap.beliefs = ["She believes that clear, direct communication is essential during chaotic, time-sensitive events.", "She upholds that every minute detail in The Doctor\u2019s messages holds relevance for the safety of their timeline.", "She trusts that a calm, measured approach is the key to navigating the unpredictable nature of time travel."],
        ap.goals = ["Short-term: Ensure that her brief input on screen reinforces the urgency and clarity of the message.", "Medium-term: Monitor the unfolding situation and be ready to step in to offer more concrete support if necessary.", "Ultimate: Aid in preserving the integrity of the timeline by balancing The Doctor\u2019s eccentricity with her own steady pragmatism."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the back room with alert posture, engaged with the paused DVD screen as she converses with Larry. She listens intently to the playback while interjecting her astonishment and personal recollections, her body language a mix of readiness and subtle tension as she processes the cryptic message.',
        ap.emotional_state = 'Outwardly, Sally appears calm and inquisitive, though a current of emotional vulnerability underlies her tone. She is conflicted between her investigative determination and a deep, personal stirring triggered by the sister’s simple declaration of love, revealing both resolve and wounded sentiment beneath her composed exterior.',
        ap.emotional_tags = ["Outwardly, Sally appears calm", "inquisitive, though a current of emotional vulnerability underlies her tone. She is conflicted between her investigative determination", "a deep, personal stirring triggered by the sister\u2019s simple declaration of love, revealing both resolve", "wounded sentiment beneath her composed exterior."],
        ap.active_plans = ["Decipher the personal message embedded in the conversation.", "Assess the significance of the sister\u2019s parting words.", "Clarify past interactions with Larry to reconnect and understand their shared history."],
        ap.beliefs = ["Every cryptic message holds a key to deeper truths.", "Family bonds, even when conveyed in subtle ways, are essential.", "Unraveling mysteries requires persistence and emotional honesty."],
        ap.goals = ["Short-term: Understand the immediate implications of her sister\u2019s message.", "Medium-term: Reconcile her investigative drive with her personal feelings.", "Ultimate: Resolve the mystery surrounding the message and forge a more genuine connection with Larry."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_2'})
    ON CREATE SET
        ap.current_status = 'Larry enters the back room with measured steps and a slightly awkward yet familiar greeting. He pauses the DVD playback to scrutinize the images and conversation, crossing his hands in front of his groin as if to steady himself. His physical demeanor is cautious and practical, reflecting his need to verify his recollection of Sally and the unfolding personal message.',
        ap.emotional_state = 'Larry is visibly flustered and anxious, tempered by a calm, pragmatic approach. He experiences internal conflict between his desire for normalcy and the unexpected emotional weight of the personal message. His reserve is punctuated by moments of genuine warmth and concern as he processes Sally’s revelation concerning her sister\'s message and his own connection to it.',
        ap.emotional_tags = ["Larry is visibly flustered", "anxious, tempered by a calm, pragmatic approach. He experiences internal conflict between his desire for normalcy", "the unexpected emotional weight of the personal message. His reserve is punctuated by moments of genuine warmth", "concern as he processes Sally\u2019s revelation concerning her sister's message", "his own connection to it."],
        ap.active_plans = ["Confirm his recognition of Sally and the significance of the reunion.", "Investigate and document the mysterious declaration conveyed on the DVD playback.", "Maintain a balanced approach between his practical nature and the personal nuances of the message."],
        ap.beliefs = ["Clear, measured communication is essential in the face of extraordinary events.", "Personal history and familial bonds ground him even amidst chaos.", "Every small clue, such as the message on the DVD, serves a greater narrative purpose."],
        ap.goals = ["Short-term: Understand the exact meaning and context of the sister\u2019s message.", "Medium-term: Validate the role of the hidden DVD list within the unfolding mystery.", "Ultimate: Ensure stability and clarity in his personal relationships as he navigates the broader enigmas."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_3'})
    ON CREATE SET
        ap.current_status = 'Sally is standing in the back room near the DVD playback screen, addressing the room with a poised yet inquisitive tone. She greets the room with a clear \'Hello?\' and follows the dialogue closely, interjecting with questions and clarifications about the hidden DVD extra message.',
        ap.emotional_state = 'Sally feels a curious mix of determination and cautious bewilderment. Her face reveals a spark of excitement tempered by confusion as she listens to Larry’s explanations and the Doctor’s cryptic pauses. Beneath her calm exterior lies a relentless drive to uncover answers to the bizarre clues, mingled with a hint of urgency sparked by the weight of the secret message she’s been entrusted with.',
        ap.emotional_tags = ["Sally feels a curious mix of determination", "cautious bewilderment. Her face reveals a spark of excitement tempered by confusion as she listens to Larry\u2019s explanations", "the Doctor\u2019s cryptic pauses. Beneath her calm exterior lies a relentless drive to uncover answers to the bizarre clues, mingled with a hint of urgency sparked by the weight of the secret message she\u2019s been entrusted with."],
        ap.active_plans = ["Clarify the cryptic DVD message and hidden Easter egg explanation.", "Gather and cross-reference details from the mysterious transcript.", "Prepare to use the newfound information to further her investigation into the unfolding events."],
        ap.beliefs = ["Every strange clue holds a deeper meaning that is vital to understanding their situation.", "The interweaving of fate and randomness is fundamental to the puzzle she must solve.", "Her investigative intuition is crucial and must not be disregarded, no matter how bizarre the circumstances."],
        ap.goals = ["Short-term: Decipher the peculiar dialogue regarding the DVD extras.", "Medium-term: Assemble all available clues to form a consistent narrative about the hidden messages.", "Ultimate: Uncover the larger mystery behind the messages and ensure that this knowledge guides her future actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_3'})
    ON CREATE SET
        ap.current_status = 'Larry is actively engaged in the conversation, frequently pausing the DVD playback screen to scrutinize the hidden messages. He stands with a practical posture, crossing his hands in front of his groin as if trying to steady himself, and interjects with both caution and excitement as he explains the enigmatic Easter egg concept.',
        ap.emotional_state = 'Larry demonstrates a blend of pragmatic curiosity and subtle apprehension. His measured tone hides inner tension as he balances the surreal nature of the revelations with a need to maintain order. While his face reflects genuine amazement at the hidden details, his calm demeanor also betrays an underlying anxiety about the implications of these cryptic messages for their reality.',
        ap.emotional_tags = ["Larry demonstrates a blend of pragmatic curiosity", "subtle apprehension. His measured tone hides inner tension as he balances the surreal nature of the revelations with a need to maintain order. While his face reflects genuine amazement at the hidden details, his calm demeanor also betrays an underlying anxiety about the implications of these cryptic messages for their reality."],
        ap.active_plans = ["Methodically verify the details of the hidden message by pausing and replaying the DVD content.", "Ensure that every fragment of the Doctor\u2019s dialogue is carefully noted as he explains the Easter egg concept.", "Keep track of the list of seventeen DVDs, understanding that they may hold a key to further developments."],
        ap.beliefs = ["Every measurable piece of information contributes to a larger, discernible pattern.", "Maintaining a practical and cautious approach is essential when dealing with inexplicable phenomena.", "Hidden messages, even when wrapped in humor, are a deliberate part of the unfolding mystery."],
        ap.goals = ["Short-term: Document and confirm the exact content of the DVD extras and hidden clues.", "Medium-term: Leverage his practical knowledge to connect the cryptic details to the broader situation.", "Ultimate: Provide a solid foundation for understanding the mysterious forces at play and protect those involved."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_3'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears on the DVD playback screen, delivering rapid, enigmatic remarks that blend humor with cryptic instruction. Although he is not physically present, his projection exudes a casual urgency as he offers explanations about the nature of time, the hidden Easter egg, and the strange interconnections between seemingly unrelated DVD extras.',
        ap.emotional_state = 'The Doctor’s projected demeanor is at once detached and urgently playful. He offers his observations with a nonchalant tone that belies deeper concern. Beneath his seeming flippancy, there is an undercurrent of frustration at time’s unpredictable nature and a sincere desire to impart essential knowledge, even if his delivery remains purposely oblique.',
        ap.emotional_tags = ["The Doctor\u2019s projected demeanor is at once detached", "urgently playful. He offers his observations with a nonchalant tone that belies deeper concern. Beneath his seeming flippancy, there is an undercurrent of frustration at time\u2019s unpredictable nature", "a sincere desire to impart essential knowledge, even if his delivery remains purposely oblique."],
        ap.active_plans = ["Communicate vital clues regarding the hidden DVD messages with a mix of casual wit and urgency.", "Ensure that the intended recipients capture every detail necessary to decode the cryptic content.", "Maintain a connection through the playback screen despite his physical absence, using timey-wimey hints to guide future actions."],
        ap.beliefs = ["Time is a non-linear fabric that defies straightforward cause and effect.", "Every hidden clue, no matter how minute, is part of a grand cosmic puzzle.", "Spontaneity and randomness are essential elements that forge the destiny of all involved."],
        ap.goals = ["Short-term: Provide immediate, albeit cryptic, instructions through the DVD screen.", "Medium-term: Seed the investigative process with crucial, obscured hints that will later be pieced together.", "Ultimate: Ensure that his message instigates a chain of events necessary to preserve the complex balance of time."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_4'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the back room, visibly weary from a long day of inexplicable events. She engages in rapid-fire banter with Larry while intermittently glancing at the paused DVD playback screen, her posture a mix of determined frustration and resigned curiosity.',
        ap.emotional_state = 'Outwardly, Sally masks her exhaustion with pointed remarks and mild exasperation, her tone occasionally laced with irony. However, beneath the surface she battles a deep-seated urgency to understand the cryptic messages, conflicted between her relentless inquisitiveness and a desire to simply be done with the bizarre ordeal.',
        ap.emotional_tags = ["Outwardly, Sally masks her exhaustion with pointed remarks", "mild exasperation, her tone occasionally laced with irony. However, beneath the surface she battles a deep-seated urgency to underst", "the cryptic messages, conflicted between her relentless inquisitiveness", "a desire to simply be done with the bizarre ordeal."],
        ap.active_plans = ["Decipher the cryptic clues embedded in the DVD messages.", "Determine the significance of the 'seventeen DVD list' and its connection to the mystery.", "Communicate and confirm the message regarding her sister\u2019s note with Larry, ensuring no clue is overlooked."],
        ap.beliefs = ["She believes that each obscure clue has a deeper meaning that will eventually illuminate the truth.", "She holds that persistence in investigating even the inexplicable is vital for unearthing hidden realities.", "She is convinced that the mysterious messages, as outlandish as they seem, are integral to understanding the temporal chaos at hand."],
        ap.goals = ["Short-term: Process and react to the immediate revelations\u2014namely, the DVD list\u2014as a tangible hint in the mystery.", "Medium-term: Piece together the disjointed clues from the playback screen and conversation to form a coherent understanding of the situation.", "Ultimate: Unravel the enigmatic puzzle tying her family\u2019s message and the Doctor\u2019s cryptic insights into the broader temporal conflict."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_4'})
    ON CREATE SET
        ap.current_status = 'Larry appears in the back room, calmly pausing the DVD playback to scrutinize the cryptic message. With measured gestures, he reveals the coveted list of seventeen DVDs, his body language a blend of cautious intrigue and pragmatic urgency.',
        ap.emotional_state = 'Larry\'s facial expressions oscillate between mild astonishment and pragmatic exasperation. Although he maintains a composed exterior, internally he is wrestling with the surreal nature of the events and the enormity of the clues, while keeping his focus on the practical steps needed to resolve the mystery.',
        ap.emotional_tags = ["Larry's facial expressions oscillate between mild astonishment", "pragmatic exasperation. Although he maintains a composed exterior, internally he is wrestling with the surreal nature of the events", "the enormity of the clues, while keeping his focus on the practical steps needed to resolve the mystery."],
        ap.active_plans = ["Reveal and explain the significance of the DVD list to Sally.", "Pause and dissect the DVD playback to extract hidden clues.", "Maintain a practical approach to managing the situation despite the surreal circumstances."],
        ap.beliefs = ["He believes that tangible evidence, like the DVD list, is key to grounding the abstract and chaotic clues.", "He holds that a methodical, step-by-step examination of each clue will eventually expose the truth.", "He is convinced that even the most outlandish messages have a logical underlying structure that can be deciphered."],
        ap.goals = ["Short-term: Communicate the existence and details of the DVD list as a central clue.", "Medium-term: Collaborate with Sally to reconcile the cryptic messages with the physical evidence of the list.", "Ultimate: Solve the ongoing temporal puzzle by bridging the gap between the Doctor\u2019s abstract rhetoric and the concrete evidence they now possess."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_4'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears on the DVD playback screen with his signature eccentricity, delivering rapid and cryptic comments on time and the nature of existence. His message, delivered in a disjointed yet purposeful manner, punctuates the scene while his image intermittently pauses to allow Larry and Sally to interact with the clues.',
        ap.emotional_state = 'The Doctor exudes a blend of detached nonchalance and urgent responsibility. His tone is casual as he dispenses convoluted insights about time, yet there is an underlying tension and a hint of regret in his words that reflects the weight of his temporal burden.',
        ap.emotional_tags = ["The Doctor exudes a blend of detached nonchalance", "urgent responsibility. His tone is casual as he dispenses convoluted insights about time, yet there is an underlying tension", "a hint of regret in his words that reflects the weight of his temporal burden."],
        ap.active_plans = ["Communicate the abstract, non-linear nature of time to provide context for the unfolding mystery.", "Deliver critical information and warnings regarding the temporal mechanics and the imminent dangers.", "Subtly guide Sally and Larry by embedding cryptic instructions in his offhand remarks."],
        ap.beliefs = ["He firmly believes that time is far more fluid and unpredictable than commonly accepted.", "He holds that every seemingly trivial detail is part of a grand, interconnected puzzle.", "He is convinced that sharing even fragmented clues can catalyze critical actions in the present to affect distant futures."],
        ap.goals = ["Short-term: Impart urgent, albeit cryptic, information regarding the temporal circumstances and the significance of the DVD list.", "Medium-term: Ensure that Sally and Larry remain engaged and focused on the clues, even as the conversation meanders through abstract musings.", "Ultimate: Bridge the gap between his own chaotic temporal existence and the practical steps needed by his companions to resolve the impending crisis."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_film_event_29_1'})
    ON CREATE SET
        oi.description = 'The DVD film is playing on the wall in Banto’s store, serving as an ever-present cinematic backdrop that subtly mirrors the surreal and suspenseful atmosphere of the narrative. Its images mix with the ambient tension of the store, and in this moment, Banto’s reproach is emphasized as he indirectly addresses the film, blurring the lines between the projected narrative and the real-time unfolding of events.',
        oi.status_before = 'Before the event, the film is continuously playing in the background, contributing to the store’s identity and enriching its atmospheric connection to film culture.',
        oi.status_after = 'After the event, the film continues its playback, unchanged in function, yet its presence now resonates with additional irony and underlines the tension elicited by Banto’s sharp admonishment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_film'})
    MATCH (e:Event {uuid: 'event_29_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_29_1'})
    ON CREATE SET
        ap.current_status = 'Banto stands in the cramped confines of the DVD store, his posture firm and unyielding as he directs his sharp, reproachful words toward an unseen character. His tone is clear and unambiguous, and his eyes, though calm, betray a mix of exasperation and disbelief while he addresses the film playing in the background.',
        ap.emotional_state = 'Outwardly, Banto appears controlled and matter-of-fact, his voice dripping with bitter frustration as he admonishes the inaction around him. Beneath that veneer, his internal state is a simmering irritation mixed with a sense of futility, as he struggles to reconcile the absurdity of the moment with his long-held belief in common-sense solutions. There is a palpable tension between his desire to restore normalcy and the surreal, almost mocking circumstance that unfolds in his DVD store.',
        ap.emotional_tags = ["Outwardly, Banto appears controlled", "matter-of-fact, his voice dripping with bitter frustration as he admonishes the inaction around him. Beneath that veneer, his internal state is a simmering irritation mixed with a sense of futility, as he struggles to reconcile the absurdity of the moment with his long-held belief in common-sense solutions. There is a palpable tension between his desire to restore normalcy", "the surreal, almost mocking circumstance that unfolds in his DVD store."],
        ap.active_plans = ["Prompt the unseen character to take decisive action by going to the police.", "Establish order in the chaotic and surreal environment of the store.", "Assert his authority and practicality in the face of irrational behavior."],
        ap.beliefs = ["He believes that conventional measures, like contacting the police, should be the immediate response to strange occurrences.", "He holds a conviction in the power of common sense and order amidst madness.", "He is convinced that mundane solutions can often defuse even surreal situations."],
        ap.goals = ["Short-term: Get the unseen character to take concrete action by going to the police immediately.", "Medium-term: Reestablish a sense of normalcy and order within the DVD store.", "Ultimate: Reinforce his commitment to practicality and, indirectly, help unravel the mystery behind the bizarre happenings."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_church_statues_event_30_1'})
    ON CREATE SET
        oi.description = 'The church statues, visible from the police station window, serve as a spectral indicator of the unfolding mystery. They appear prominently and then vanish in the blink of an eye while Sally observes, introducing an element of supernatural ambiguity that deepens the narrative tension and challenges the boundaries of reality.',
        oi.status_before = 'Before the event, the statues are firmly positioned on the church facade, displaying a constant, unyielding presence as part of the building’s traditional architecture.',
        oi.status_after = 'After the event, the statues mysteriously vanish from view when observed, leaving an unsettling emptiness that reinforces the eerie, otherworldly nature of the incident.'
    WITH oi
    MATCH (o:Object {uuid: 'object_church_statues'})
    MATCH (e:Event {uuid: 'event_30_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands at the police station front desk, animatedly recounting the mystery of Wester Drumlin House. With restless body language and persistent glances toward the window, she details the eerie disappearance of the church statues while gesturing to emphasize her observations.',
        ap.emotional_state = 'Sally projects a blend of anxiety and steely determination. Outwardly, her voice is urgent and laced with disbelief, while internally she wrestles with mounting fear, perplexity, and a touch of wry humor at the absurd supernatural occurrence. Beneath her calm narration lies an unwavering resolve to uncover the truth.',
        ap.emotional_tags = ["Sally projects a blend of anxiety", "steely determination. Outwardly, her voice is urgent", "laced with disbelief, while internally she wrestles with mounting fear, perplexity,", "a touch of wry humor at the absurd supernatural occurrence. Beneath her calm narration lies an unwavering resolve to uncover the truth."],
        ap.active_plans = ["Explain the mysterious decay and supernatural happenings of Wester Drumlin House to the authorities.", "Document and validate her unsettling observation of the vanishing statues.", "Prompt further inquiry into the phenomenon while remaining vigilant for additional anomalies."],
        ap.beliefs = ["She believes that every strange occurrence is a clue to a deeper mystery.", "She is convinced that the supernatural events are real and not mere hallucinations.", "She values intuition and personal observation as essential tools for uncovering hidden truths."],
        ap.goals = ["Short-term: Ensure her account is taken seriously and initiate an investigation into the disappearing statues.", "Medium-term: Gather more evidence to validate the surreal experiences she has encountered.", "Ultimate: Unravel the secrets behind the supernatural events at Wester Drumlin House and expose the underlying truth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_desk_sergeant_event_30_1'})
    ON CREATE SET
        ap.current_status = 'The Desk Sergeant is stationed behind the front desk, performing his routine duties with a calm and measured demeanor. He listens to Sally’s detailed account before instructing her to wait, maintaining a professional posture and methodically addressing the situation.',
        ap.emotional_state = 'The Desk Sergeant exhibits a reserved and pragmatic disposition. Although he remains outwardly composed and authoritative, there is an undercurrent of mild skepticism and subdued curiosity about the inexplicable phenomena Sally describes. His internal focus is on following protocol while reconciling the unusual nature of the report with the everyday realities of his duty.',
        ap.emotional_tags = ["The Desk Sergeant exhibits a reserved", "pragmatic disposition. Although he remains outwardly composed", "authoritative, there is an undercurrent of mild skepticism", "subdued curiosity about the inexplicable phenomena Sally describes. His internal focus is on following protocol while reconciling the unusual nature of the report with the everyday realities of his duty."],
        ap.active_plans = ["Instruct Sally to wait while he processes her report in accordance with standard procedures.", "Document the details of the incident for further verification.", "Monitor the situation for any developments that might require immediate police attention."],
        ap.beliefs = ["He believes in strict adherence to established police protocols.", "He trusts empirical evidence and routine verification over unsubstantiated claims.", "He values maintaining public order and safety, even when faced with inexplicable events."],
        ap.goals = ["Short-term: Efficiently process Sally\u2019s report and ensure she remains safe while waiting.", "Medium-term: Verify the details of the incident to determine if further investigation is warranted.", "Ultimate: Maintain order and protect the public by appropriately addressing any extraordinary events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_30_2'})
    ON CREATE SET
        ap.current_status = 'DI Billy Shipton strides into the police station with brisk, measured steps, immediately commanding attention as he introduces himself with an apologetic yet urgent tone. His posture is upright and controlled, his gestures quick, as he establishes his connection to Wester Drumlin and relays a fleeting message intended for Marcie.',
        ap.emotional_state = 'Billy’s outward calm masks a deep internal turbulence; he feels a blend of responsibility, anxiety, and wistfulness as he confronts the unfolding chaos. Beneath his professional detachment lies a subtle undercurrent of sorrow and urgency, driven by his personal connection to Wester Drumlin and the mysterious events that threaten to upend what little order remains.',
        ap.emotional_tags = ["Billy\u2019s outward calm masks a deep internal turbulence; he feels a blend of responsibility, anxiety,", "wistfulness as he confronts the unfolding chaos. Beneath his professional detachment lies a subtle undercurrent of sorrow", "urgency, driven by his personal connection to Wester Drumlin", "the mysterious events that threaten to upend what little order remains."],
        ap.active_plans = ["Deliver the message for Marcie with precision.", "Quickly attend to the urgent matter linked to Wester Drumlin.", "Maintain control and gather essential information while minimizing distractions."],
        ap.beliefs = ["Duty and responsibility to his territory are paramount.", "Every message and detail contributes to solving the broader mystery.", "Professionalism must remain even under high-pressure, inexplicable circumstances."],
        ap.goals = ["Short-term: Ensure the urgent message is communicated correctly and attend to immediate tasks.", "Medium-term: Secure the situation at Wester Drumlin and verify related evidence.", "Ultimate: Resolve the unfolding mystery to restore order and protect his community."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow, having just witnessed an eerie anomaly outside through the station window, stands alert and poised in the police station. Her body language is tense and determined as she turns to acknowledge DI Billy Shipton’s abrupt entrance, her posture exuding both skepticism and an unyielding investigative urgency.',
        ap.emotional_state = 'Sally’s face reveals a mix of exasperation and anxious determination; while she maintains a curt and composed greeting, internally she is rattled by the inexplicable disappearance of the church statues and the sudden shift in the atmosphere. The tension between her calm exterior and the swirling confusion and urgency within fuels her relentless commitment to unravel the mystery.',
        ap.emotional_tags = ["Sally\u2019s face reveals a mix of exasperation", "anxious determination; while she maintains a curt", "composed greeting, internally she is rattled by the inexplicable disappearance of the church statues", "the sudden shift in the atmosphere. The tension between her calm exterior", "the swirling confusion", "urgency within fuels her relentless commitment to unravel the mystery."],
        ap.active_plans = ["Absorb and process DI Billy Shipton\u2019s rapid introduction and message.", "Integrate the new information about Wester Drumlin into her ongoing investigation.", "Remain hyper-vigilant and ready to document any further paranormal or unexplained events."],
        ap.beliefs = ["Every anomaly, however strange, is a clue to be followed without hesitation.", "The truth behind these supernatural occurrences must be uncovered at all costs.", "Her own investigative intuition is reliable, even in the face of inexplicable phenomena."],
        ap.goals = ["Short-term: Grasp the immediate significance of Billy\u2019s message and presence.", "Medium-term: Connect the missing elements (like the disappearing statues) with the broader mystery of Wester Drumlin.", "Ultimate: Uncover the hidden truth behind the supernatural events to protect others and satisfy her relentless curiosity."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_police_box_event_31_1'})
    ON CREATE SET
        oi.description = 'The 1960s Style Police Box is presented as a quirky, retro artifact in the corner of the underground car park. Its outdated design—with a dummy phone, undersized windows, and a mismatched Yale lock—serves as a focal point for the agents’ discussion. It symbolizes an inexplicable enigma that ties into the mysterious disappearances, and its presence amplifies the playful yet mysterious tone of the conversation.',
        oi.status_before = 'Located inconspicuously in the corner, the police box stands as a relic of a bygone era with its retro design and non-functional features intact.',
        oi.status_after = 'Its physical state remains unchanged, but the narrative gravity it holds is increased as its peculiar characteristics spark curiosity and serve as a springboard for the agents’ ongoing investigation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_police_box'})
    MATCH (e:Event {uuid: 'event_31_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_angel_statues_event_31_2'})
    ON CREATE SET
        oi.description = 'The Guardian Angels, a set of foreboding stone figures, dominate the scene by positioning themselves around the TARDIS. One statue is uniquely highlighted as it raises its hand toward the TARDIS lock, symbolically guarding it. In an unexpected moment that blurs the line between the inanimate and sentient, the statue blinks, serving as an eerie visual punctuation that underscores the supernatural oversight governing the unfolding events.',
        oi.status_before = 'Prior to the event, the angel statues stood immobile and stoic, represented only as cold, unyielding stone figures that served as silent guardians of the area.',
        oi.status_after = 'After the event, the statues remain in their designated positions, yet the unexpected blink of one statue injects an unsettling sense of life and sentience into them, hinting at the uncanny powers at play and shifting their narrative role from mere props to active, mysterious spectators.'
    WITH oi
    MATCH (o:Object {uuid: 'object_angel_statues'})
    MATCH (e:Event {uuid: 'event_31_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands in the underground car park, arms gesturing animatedly as she quizzes Billy about the parked vehicles and the mysterious police box. Her posture alternates between inquisitive leaning and brisk, decisive steps as she jots notes in her notebook.',
        ap.emotional_state = 'Sally displays a blend of wry amusement and mounting curiosity. Outwardly, she is playful and even a bit exasperated by Billy’s rapid-fire banter, yet underneath she feels an urgent need to unravel the bizarre mystery. She is both flustered by his unexpected invitation and emboldened by her determination to piece together the strange vanishings, carrying a sense of adventure tempered by a hint of self-protectiveness.',
        ap.emotional_tags = ["Sally displays a blend of wry amusement", "mounting curiosity. Outwardly, she is playful", "even a bit exasperated by Billy\u2019s rapid-fire banter, yet underneath she feels an urgent need to unravel the bizarre mystery. She is both flustered by his unexpected invitation", "emboldened by her determination to piece together the strange vanishings, carrying a sense of adventure tempered by a hint of self-protectiveness."],
        ap.active_plans = ["Clarify the mystery behind the unexplained disappearances of vehicle owners.", "Investigate the odd characteristics of the retro police box as a potential clue.", "Engage with DI Billy Shipton to glean more details while keeping the conversation light and teasing."],
        ap.beliefs = ["Curiosity is the key to uncovering hidden truths, even in the most absurd scenarios.", "Every peculiar detail\u2014no matter how quirky\u2014can lead to a significant breakthrough.", "Maintaining a playful attitude in the face of the unexplained helps keep fear at bay."],
        ap.goals = ["Short-term: Understand the anomaly of vehicles left with personal items and still running.", "Medium-term: Decipher the narrative importance of the police box and its mismatched features.", "Ultimate: Piece together the mystery behind Wester Drumlins House and its strange disappearances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_1'})
    ON CREATE SET
        ap.current_status = 'DI Billy Shipton stands relaxed yet animated, pacing slowly near the set of parked cars and the prominently placed police box. He displays a sentimental charm while explaining the oddities of the scene, punctuating his remarks with playful winks and humorous asides.',
        ap.emotional_state = 'Billy exhibits a mix of nostalgic amusement and reflective sentiment. His tone is light as he offers a surprisingly personal invitation amid a technical explanation, revealing an inner tenderness and longing for connection. Despite his off-duty status, there’s a spark of mischief and vulnerability in his attitude, as he toggles between professional detachment and flirtatious charm.',
        ap.emotional_tags = ["Billy exhibits a mix of nostalgic amusement", "reflective sentiment. His tone is light as he offers a surprisingly personal invitation amid a technical explanation, revealing an inner tenderness", "longing for connection. Despite his off-duty status, there\u2019s a spark of mischief", "vulnerability in his attitude, as he toggles between professional detachment", "flirtatious charm."],
        ap.active_plans = ["Provide a detailed, humorous account of the mysterious disappearances and the peculiar police box.", "Attempt to initiate a personal connection with Sally through unexpected flirtatious banter.", "Subtly steer the conversation towards deeper underlying enigmas while keeping the mood light."],
        ap.beliefs = ["Life\u2019s oddities are worth savoring, even when they carry a tinge of sorrow.", "Humor can be a shelter against the unpredictable nature of existence.", "There is truth hidden in every bizarre detail, and every oddity is an invitation to question the status quo."],
        ap.goals = ["Short-term: Impress and engage Sally through witty repartee and share his insights about the mystery.", "Medium-term: Encourage collaborative investigation by blending professional observations with personal charm.", "Ultimate: Deepen the connection with Sally while uncovering clues that may lead to a broader understanding of the disappearances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow is seen making a sudden, determined exit from the underground car park. Her posture is tense yet resolute as she briskly departs, head held high in a mix of urgency and quiet defiance, leaving the eerie ambiance behind her.',
        ap.emotional_state = 'On the surface, Sally exhibits a cool, almost detached determination as she abandons the playful banter, yet internally she battles a swirl of apprehension and somber realization. The abrupt departure underscores a gnawing recognition that the supernatural forces at work are far more menacing than simple flirtation, and her heart beats with both adrenaline and a deep-seated anxiety about the unknown.',
        ap.emotional_tags = ["On the surface, Sally exhibits a cool, almost detached determination as she ab", "ons the playful banter, yet internally she battles a swirl of apprehension", "somber realization. The abrupt departure underscores a gnawing recognition that the supernatural forces at work are far more menacing than simple flirtation,", "her heart beats with both adrenaline", "a deep-seated anxiety about the unknown."],
        ap.active_plans = ["Quickly remove herself from the charged atmosphere to avoid imminent danger.", "Re-evaluate the clues and mysterious signs to prepare for further investigation.", "Ensure that the critical documents and evidence she carries reach a trusted ally for examination."],
        ap.beliefs = ["She believes that every strange sign and supernatural clue is a vital part of uncovering a deeper mystery.", "She holds that remaining vigilant is essential when confronted by forces beyond ordinary understanding.", "She is convinced that personal courage and quick thinking can outwit even the most uncanny phenomena."],
        ap.goals = ["Short-term: To escape the immediate danger posed by the unsettling presence of the statues.", "Medium-term: To decipher the significance of the angelic figures and the subtle blinking that challenges natural law.", "Ultimate: To uncover the hidden truth behind the supernatural events and secure her safety against an impending threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_2'})
    ON CREATE SET
        ap.current_status = 'DI Billy Shipton remains in the underground car park after the banter subsides, standing near the TARDIS and observing the silent vigil of the angel statues. His posture is both reflective and cautious as he glances between the statues and his phone, poised as if contemplating his next move.',
        ap.emotional_state = 'Billy displays a conflicted mix of weary humor and quiet distress. Outwardly, he maintains a sardonic tone about life’s absurdities, yet internally he is perturbed by the uncanny occurrence of a blinking statue. This unexpected movement stirs a tension that overrides his casual banter, leaving him with a hint of anxious anticipation and a reflective sadness about the relentless march of time and fate.',
        ap.emotional_tags = ["Billy displays a conflicted mix of weary humor", "quiet distress. Outwardly, he maintains a sardonic tone about life\u2019s absurdities, yet internally he is perturbed by the uncanny occurrence of a blinking statue. This unexpected movement stirs a tension that overrides his casual banter, leaving him with a hint of anxious anticipation", "a reflective sadness about the relentless march of time", "fate."],
        ap.active_plans = ["To document and process the bizarre phenomena unfolding around the TARDIS.", "To contact Sally and possibly reestablish communication once the initial shock subsides.", "To analyze the situation further and ensure that the supernatural interference is not underestimated."],
        ap.beliefs = ["He believes that even the most outlandish events must have an underlying logic that can be deciphered.", "He is convinced that fate and mystery are intertwined in the fabric of time.", "He holds that humor and reflection are vital tools in coping with and understanding the extraordinary."],
        ap.goals = ["Short-term: To remain alert and gather as much information as possible from the strange happenings.", "Medium-term: To safeguard any evidence that could help corroborate the supernatural events.", "Ultimate: To reconcile the surreal elements of the encounter with the impending reality, while ensuring his and Sally\u2019s survival."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_yale_key_event_32_1'})
    ON CREATE SET
        oi.description = 'The Yale key plays a pivotal narrative role as a physical token imbued with mystery and significance. In this moment, Sally’s act of retrieving the key from her coat pocket during her determined crossing of the street transforms a seemingly mundane object into a symbolic gateway. Its antique design and subtle gleam in the urban drizzle hint at hidden mechanisms and secret access points that are crucial to the unfolding events, marking it as a turning point in her perilous journey.',
        oi.status_before = 'Prior to the event, the key rested quietly and securely in Sally’s coat pocket, its worn metal finish and intricate design silently indicative of its storied past.',
        oi.status_after = 'Following its retrieval, the Yale key emerges as a tangible clue, its subtle gleam catching the sparse light of the urban night. It now symbolizes a critical access point, poised to unlock deeper mysteries within the narrative.'
    WITH oi
    MATCH (o:Object {uuid: 'object_yale_key'})
    MATCH (e:Event {uuid: 'event_32_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_32_2'})
    ON CREATE SET
        oi.description = 'The Tardis, usually a constant and reassuring presence in the car park, serves as a beacon of hope and the critical escape vehicle in the narrative. In this event, its sudden disappearance shocks Sally and deepens the mystery. The absence of the Tardis is central to the enigma, as it signifies that something far more disconcerting is at work beyond familiar expectations.',
        oi.status_before = 'Before the event, the Tardis was present at the car park, visibly a stable and iconic blue time machine with its characteristic aged yet powerful exterior.',
        oi.status_after = 'After the event, the Tardis has inexplicably vanished without a trace, leaving an empty space that contributes to the growing tension and unresolved mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_32_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_angel_statues_event_32_2'})
    ON CREATE SET
        oi.description = 'The guardian angel statues, which typically project a threatening and foreboding presence by guarding the Tardis, play a key narrative role by heightening the supernatural ambience. In this event, their inexplicable disappearance, along with the Tardis and Billy, compounds the mystery and leaves Sally confronting a void where ominous protection once lay.',
        oi.status_before = 'Prior to the event, the statues were in place, their imposing, frozen forms silently asserting their supernatural watch over the Tardis and the surrounding area.',
        oi.status_after = 'Following the event, the statues have also vanished, contributing to the eerie emptiness and reinforcing the sense of an underlying disturbance in the natural order.'
    WITH oi
    MATCH (o:Object {uuid: 'object_angel_statues'})
    MATCH (e:Event {uuid: 'event_32_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow strides purposefully from the police station into the wet urban night. Pausing amid the soft drizzle, she methodically reaches into her coat pocket and retrieves the modest Yale key, her body language firm and measured as she stands on the street with determined poise.',
        ap.emotional_state = 'On the surface, Sally appears resolute and calm, her expression set with an unyielding focus. Beneath that composed façade, however, she battles a churn of anxiety, curiosity, and anticipation as she contemplates the key’s mysterious significance. There is an inner conflict between cautious hope and the weight of the unfolding enigma that fuels her determination to uncover deeper truths.',
        ap.emotional_tags = ["On the surface, Sally appears resolute", "calm, her expression set with an unyielding focus. Beneath that composed fa\u00e7ade, however, she battles a churn of anxiety, curiosity,", "anticipation as she contemplates the key\u2019s mysterious significance. There is an inner conflict between cautious hope", "the weight of the unfolding enigma that fuels her determination to uncover deeper truths."],
        ap.active_plans = ["Secure and examine the Yale key for its hidden mechanism.", "Utilize the key to potentially unlock a passage to further clues.", "Gather additional evidence that will help her eventually contact the Doctor."],
        ap.beliefs = ["Every small clue is vital in uncovering larger mysteries.", "Courage and determination are essential in facing the unknown.", "Hidden objects often hold the key to deeper, transformative revelations."],
        ap.goals = ["Short-term: Safely retrieve and safeguard the Yale key.", "Medium-term: Decipher the key\u2019s function and its connection to the overarching mystery.", "Ultimate: Use the key as a stepping stone to access critical information and eventually reconnect with the Doctor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow is on the street, having just crossed over from the police station. With determined urgency, she stops, extracts the Yale key from her coat pocket, and dashes back to the car park. Upon arrival, she is struck by the sudden emptiness where the familiar blue Tardis, the comforting presence of Billy, and the imposing guardian angel statues should be.',
        ap.emotional_state = 'Sally is overwhelmed by a blend of stunned confusion and mounting apprehension. On the surface, her eyes are wide with disbelief and anxiety, yet beneath that external shock lies a stubborn resolve to understand this bizarre vanishing. Internally, she is racing with doubts, fear, and a relentless curiosity about the inexplicable disappearance, even as she battles mounting frustration at the void before her.',
        ap.emotional_tags = ["Sally is overwhelmed by a blend of stunned confusion", "mounting apprehension. On the surface, her eyes are wide with disbelief", "anxiety, yet beneath that external shock lies a stubborn resolve to underst", "this bizarre vanishing. Internally, she is racing with doubts, fear,", "a relentless curiosity about the inexplicable disappearance, even as she battles mounting frustration at the void before her."],
        ap.active_plans = ["Determine the whereabouts of the missing Tardis and Billy.", "Investigate the significance of the Yale key and why it does not fit any conventional lock.", "Decipher the mystery behind the vanishing guardian angel statues and what they portend."],
        ap.beliefs = ["Every seemingly ordinary artifact holds a deeper, often hidden purpose.", "No disappearance in this strange universe is without meaning or consequence.", "The interconnected nature of events means that even abrupt vanishings are part of a larger, mysterious plan."],
        ap.goals = ["Short-term: Immediately search the car park and nearby area for any clues regarding the sudden absence.", "Medium-term: Uncover the connection between the Yale key, the vanishing Tardis, and the guardian angels to piece together the unfolding mystery.", "Ultimate: Resolve the enigma to regain control over the increasingly unpredictable events and safeguard against impending dangers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_32_2'})
    ON CREATE SET
        ap.current_status = 'DI Billy Shipton is present only as an off-camera voice in this event. His remark – noting that the Yale key looks ordinary yet fits no known lock – hints at his earlier physical presence in the car park. However, as Sally returns, his reassuring presence is conspicuously absent, creating an eerie sense of loss and dislocation.',
        ap.emotional_state = 'Billy’s emotional tone, as conveyed off-camera, is marked by a mix of resigned bemusement and subtle tension. While his measured statement about the key suggests calm rationality, there is an underlying undercurrent of anxiety and foreboding, as if he was aware that something unusual was unfolding even before he disappeared from sight.',
        ap.emotional_tags = ["Billy\u2019s emotional tone, as conveyed off-camera, is marked by a mix of resigned bemusement", "subtle tension. While his measured statement about the key suggests calm rationality, there is an underlying undercurrent of anxiety", "foreboding, as if he was aware that something unusual was unfolding even before he disappeared from sight."],
        ap.active_plans = ["Alert others through his off-camera commentary about the unusual nature of the key.", "Maintain his role as a subtle messenger of the anomalies despite his physical absence.", "Attempt to reconcile the inexplicable discrepancies between normal expectations and the bizarre event."],
        ap.beliefs = ["Unordinary occurrences in this strange series of events are never random.", "Every cryptic detail, like the misfit key, is a clue to a larger cosmic puzzle.", "There is an underlying logic behind anomalies that defies conventional explanation."],
        ap.goals = ["Short-term: Communicate the peculiarity of the moment through his measured observation about the key.", "Medium-term: Ensure that even in his absence, his message about the oddities is heard and taken seriously.", "Ultimate: Contribute to unraveling the enigma of the vanishing phenomena and guide Sally indirectly towards the truth."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_timey_wimey_detector_event_33_2'})
    ON CREATE SET
        oi.description = 'The Timey-Wimey Detector is activated during the Doctor\'s explanation as it emits a characteristic \'ding\' when detecting fluctuations in time. It functions as a visual and auditory cue within the scene, underscoring the surreal nature of the temporal anomaly and reinforcing the Doctor\'s narrative about the dangers posed by the Weeping Angels.',
        oi.status_before = 'Before the event, the detector is in its normal operational state, with blinking lights and a whimsical design that reflects the Doctor’s eccentric technical style.',
        oi.status_after = 'After the event, the detector remains unchanged and active, continuing to blink and emit sounds that symbolize the ongoing presence of time irregularities, thus reinforcing its role as a narrative device.'
    WITH oi
    MATCH (o:Object {uuid: 'object_timey_wimey_detector'})
    MATCH (e:Event {uuid: 'event_33_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_1'})
    ON CREATE SET
        ap.current_status = 'Billy Shipton is disoriented and physically precarious as he slides down the rough, shadowed wall of the dark alley, arms flailing and head thrown back in shock while his legs scramble for purchase amidst the sudden tug of time’s distortion.',
        ap.emotional_state = 'Billy is besieged by a deep blend of panic and bewilderment; his outward confusion masks an internal turmoil filled with mounting anxiety about the inexplicable time shift. Although his voice rings with incredulity and fear, underneath he harbors a nostalgic longing and a desperate wish for clarity amidst the chaos.',
        ap.emotional_tags = ["Billy is besieged by a deep blend of panic", "bewilderment; his outward confusion masks an internal turmoil filled with mounting anxiety about the inexplicable time shift. Although his voice rings with incredulity", "fear, underneath he harbors a nostalgic longing", "a desperate wish for clarity amidst the chaos."],
        ap.active_plans = ["Attempt to regain physical stability and secure a safe position in the alley.", "Listen intently to The Doctor's explanations to better understand the temporal anomaly.", "Formulate a plan to eventually reorient himself in time and prevent further danger."],
        ap.beliefs = ["Time follows its own unpredictable, non-linear rules that must be respected.", "The Doctor\u2019s cryptic insights, though baffling, hold vital truths about his predicament.", "The past and the present are irrevocably intertwined, influencing his current state."],
        ap.goals = ["Short-term: Stop the free fall and recover his balance immediately.", "Medium-term: Decode the Doctor\u2019s instructions to safely navigate this temporal disruption.", "Ultimate: Secure a path back to a stable, familiar time and resolve the mystery of the time anomaly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands in the dim light of the alley with composed urgency, calmly greeting Billy as he appears disoriented. He gestures with deliberate hand movements to emphasize his cryptic explanations while maintaining eye contact and a brisk pace.',
        ap.emotional_state = 'The Doctor projects a mixture of cool composure and underlying urgency; his voice is tinged with both apologetic regret and a firm resolve. Beneath his nonchalant exterior lies a mind acutely aware of the fracturing nature of time, a silent worry for his own chaotic schedule, and a deep commitment to correcting temporal errors before they escalate.',
        ap.emotional_tags = ["The Doctor projects a mixture of cool composure", "underlying urgency; his voice is tinged with both apologetic regret", "a firm resolve. Beneath his nonchalant exterior lies a mind acutely aware of the fracturing nature of time, a silent worry for his own chaotic schedule,", "a deep commitment to correcting temporal errors before they escalate."],
        ap.active_plans = ["Provide clear, albeit enigmatic, instructions to Billy to help him adjust to this sudden time shift.", "Ensure that the message to Sally Sparrow is relayed before the situation worsens.", "Monitor the ongoing temporal disturbances to preempt any paradoxes or further anomalies."],
        ap.beliefs = ["Time is a malleable, chaotic force that can be navigated with enough understanding and urgency.", "Every temporal mishap, no matter how bizarre, carries the seeds of a resolution that must be found.", "His own experiences and scattered memories, though disordered, are key to stabilizing the situation."],
        ap.goals = ["Short-term: Stabilize the immediate crisis by instructing Billy and calming the confusion.", "Medium-term: Relay and secure a critical message to Sally Sparrow so that essential time corrections can be made.", "Ultimate: Restore temporal integrity by ensuring necessary interventions are executed to prevent catastrophic time paradoxes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_1'})
    ON CREATE SET
        ap.current_status = 'Martha Jones stands firmly at the edge of the chaotic alley, her posture relaxed yet alert as she interjects with practical commentary. She maintains a measured presence, her gaze fixed on both The Doctor and the disoriented Billy, contributing with succinct remarks that underline her grounded nature.',
        ap.emotional_state = 'Martha is composed and pragmatic, yet beneath her calm exterior lies a subtle tension born of concern for the unfolding chaos. She balances quiet exasperation with a steady determination, expressing both sympathy for Billy’s distress and a firm belief in the necessity of sticking to the Doctor’s timeline, even as she wrestles with the surreal nature of their predicament.',
        ap.emotional_tags = ["Martha is composed", "pragmatic, yet beneath her calm exterior lies a subtle tension born of concern for the unfolding chaos. She balances quiet exasperation with a steady determination, expressing both sympathy for Billy\u2019s distress", "a firm belief in the necessity of sticking to the Doctor\u2019s timeline, even as she wrestles with the surreal nature of their predicament."],
        ap.active_plans = ["Remind The Doctor of the crucial time constraints and deadlines inherent in their journey.", "Offer logistical support and reassurance to Billy as he grapples with his unexpected arrival.", "Keep the conversation on track to ensure that essential instructions are not lost amid the surreal banter."],
        ap.beliefs = ["Practicality and clarity are essential when confronting the unpredictable nature of time travel.", "Trust in the Doctor\u2019s experience, despite his eccentricities, is vital to navigating these anomalies.", "Every moment in this disjointed timeline has a purpose that must be steadfastly respected."],
        ap.goals = ["Short-term: Stabilize Billy by ensuring he listens to the Doctor\u2019s directions and remains calm.", "Medium-term: Keep the team focused on their immediate temporal tasks despite the overwhelming surrealism of the moment.", "Ultimate: Help restore order to the timeline and ensure that every member of the group plays their role in averting a larger crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands at the center of the unfolding exposition, animatedly explaining the temporal anomaly with a blend of urgency and signature offhand humor, while gesturing toward his gadget and issuing crucial instructions. His posture is brisk, and his eyes dart with calculated eccentricity.',
        ap.emotional_state = 'He displays a rushed yet quirky demeanor that masks a deep concern for the precarious balance of time. Behind his humorous delivery, there is an underlying anxiety and determination to secure the future, blending his nonchalant bravado with the weight of impending danger.',
        ap.emotional_tags = ["He displays a rushed yet quirky demeanor that masks a deep concern for the precarious balance of time. Behind his humorous delivery, there is an underlying anxiety", "determination to secure the future, blending his nonchalant bravado with the weight of impending danger."],
        ap.active_plans = ["Explain the bizarre time disruption and the effect of the 'touch of an angel' using his idiosyncratic jargon.", "Assign DI Billy Shipton the mission to deliver a critical message to Sally Sparrow.", "Utilize the Timey-Wimey Detector to monitor temporal disturbances and warn against the lethal nature of the Weeping Angels."],
        ap.beliefs = ["Time is not linear but a complex, interconnected web where every moment matters.", "The inherent unpredictability of time travel must be met with preparedness and wit.", "Communicating precisely across time is essential to prevent catastrophic consequences."],
        ap.goals = ["Short-term: Ensure Billy understands his role and the immediacy of the threat.", "Medium-term: Transmit the urgent message to Sally Sparrow to secure future events.", "Ultimate: Prevent the Weeping Angels from exploiting stolen potentials and destabilizing time."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_2'})
    ON CREATE SET
        ap.current_status = 'Martha stands close by, maintaining a composed and steady presence as she interjects practical advice amid the Doctor’s rapid-fire exposition. Her body language is calm as she encourages Billy to simply nod during the Doctor’s pauses.',
        ap.emotional_state = 'She exudes a mix of exasperation and empathetic pragmatism, internally frustrated by the chaotic time chatter yet resolute in keeping the situation grounded. Her calm exterior hides a sharp focus on ensuring everyone comprehends the gravity of the moment.',
        ap.emotional_tags = ["She exudes a mix of exasperation", "empathetic pragmatism, internally frustrated by the chaotic time chatter yet resolute in keeping the situation grounded. Her calm exterior hides a sharp focus on ensuring everyone comprehends the gravity of the moment."],
        ap.active_plans = ["Calm and orient Billy by providing clear, implicit instructions.", "Bridge the gap between the Doctor\u2019s eccentricity and the practical needs of the mission.", "Ensure that the critical message for Sally Sparrow is understood and not lost in the chaos."],
        ap.beliefs = ["Stability and clear communication are essential to managing the chaos of time travel.", "Practical measures can temper even the most unpredictable anomalies.", "Every element of the mission, no matter how bizarre, must contribute to the larger goal."],
        ap.goals = ["Short-term: Help Billy overcome his disorientation and follow the necessary cues.", "Medium-term: Maintain clarity amid the Doctor\u2019s convoluted explanations.", "Ultimate: Support the successful relay of the vital message to Sally Sparrow, thereby ensuring temporal stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_2'})
    ON CREATE SET
        ap.current_status = 'DI Billy Shipton is physically disoriented, sliding down a wall and grappling with the shock of temporal displacement. His posture is tense as he listens intently while struggling to regain composure in an unfamiliar environment.',
        ap.emotional_state = 'Billy exhibits a deep sense of confusion and apprehension, intermingled with nostalgic resignation. His internal state is fraught with fear and uncertainty, yet he remains determined to understand his role in this baffling situation.',
        ap.emotional_tags = ["Billy exhibits a deep sense of confusion", "apprehension, intermingled with nostalgic resignation. His internal state is fraught with fear", "uncertainty, yet he remains determined to underst", "his role in this baffling situation."],
        ap.active_plans = ["Attempt to regain physical stability while processing the Doctor's cryptic explanation.", "Listen carefully and comply with the instructions regarding the message for Sally Sparrow.", "Make sense of the surreal temporal anomaly despite his disoriented state."],
        ap.beliefs = ["The fabric of time is a mysterious and delicate construct that cannot be tampered with lightly.", "Even in bewildering situations, following clear orders is necessary for survival.", "Understanding the temporal disruption is key to preserving both past and future."],
        ap.goals = ["Short-term: Stabilize himself physically and mentally while absorbing the Doctor\u2019s instructions.", "Medium-term: Internalize the crucial information to ensure he can deliver the message accurately.", "Ultimate: Uncover the truth behind the time anomaly to help restore order to the disrupted timeline."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_mobile_phone_event_34_1'})
    ON CREATE SET
        oi.description = 'The mobile phone unexpectedly rings in the deserted underground car park, its clear and insistent tone breaking the isolation and serving as the narrative trigger. Its sudden activation not only disrupts the silence but also compels Sally to engage, linking her to Billy and propelling her into immediate action as she addresses the call with urgency.',
        oi.status_before = 'The phone was idle, likely resting quietly in Sally’s possession until the abrupt interruption occurred.',
        oi.status_after = 'Following the event, the phone remains active as a communication device, having served its role in catalyzing Sally’s inquiry into Billy’s whereabouts.'
    WITH oi
    MATCH (o:Object {uuid: 'object_mobile_phone'})
    MATCH (e:Event {uuid: 'event_34_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_34_1'})
    ON CREATE SET
        ap.current_status = 'In the shadowed confines of the underground car park, Sally Sparrow stands still as her mobile phone abruptly rings. Her posture is tense yet alert, and she instinctively brings the phone to her ear while scanning her surroundings, every muscle primed for the next move.',
        ap.emotional_state = 'Sally’s face reveals a blend of anxiety and determination. Outwardly she masks her worry with a strained urgency, but internally, her heart pounds with trepidation and an undercurrent of desperate hope. The sudden call intensifies her inner conflict, balancing a desire to question the unknown with a duty to follow through on the clues that bind her to the mystery.',
        ap.emotional_tags = ["Sally\u2019s face reveals a blend of anxiety", "determination. Outwardly she masks her worry with a strained urgency, but internally, her heart pounds with trepidation", "an undercurrent of desperate hope. The sudden call intensifies her inner conflict, balancing a desire to question the unknown with a duty to follow through on the clues that bind her to the mystery."],
        ap.active_plans = ["Determine Billy's exact location by engaging immediately with the mysterious call.", "Collect any additional information or clues provided during the conversation.", "Prepare to act swiftly based on the information received to address the emerging threat."],
        ap.beliefs = ["Every clue, no matter how subtle, is essential in unraveling the mystery.", "Communication is key to connecting fragmented parts of the unfolding narrative.", "Courage is necessary to confront unusual dangers and face unexpected events head-on."],
        ap.goals = ["Short-term: Quickly ascertain Billy\u2019s whereabouts to ensure his safety.", "Medium-term: Leverage the information from the call to progress in the investigation.", "Ultimate: Uncover and neutralize the underlying threat that perpetuates the series of mysterious events."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wedding_photograph_event_35_2'})
    ON CREATE SET
        oi.description = 'The wedding photograph is a pivotal prop in this intimate exchange, evoking memories of love and past joy. It serves as a silent testament to a shared name and destiny, drawing Sally’s attention and deepening the connection between her present experience and bygone times. The image bridges personal history with the surreal narrative unfolding in the ward.',
        oi.status_before = 'The photograph is old, faded, and worn, yet still radiates warmth and nostalgic beauty as a cherished relic from a happier time.',
        oi.status_after = 'Following the event, the photograph remains unchanged physically but takes on a greater symbolic weight, reinforcing the mysterious bond and prophetic undertones of the moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wedding_photograph'})
    MATCH (e:Event {uuid: 'event_35_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_seventeen_dvd_list_event_35_2'})
    ON CREATE SET
        oi.description = 'The seventeen DVD list is referenced during the conversation as a cryptic reminder of a promise and a secret conveyed by The Doctor. It acts as a tangible clue that encapsulates the enigma of the message, anchoring the narrative’s supernatural element into the reality of the characters’ lives.',
        oi.status_before = 'Before the conversation, the list exists as a concise, unassuming paper slip—its significance hidden and known only to those aware of its mysterious origins.',
        oi.status_after = 'After the event, the list’s importance is magnified, symbolizing the key to understanding the fateful connections and secret promises that have governed Billy\'s life and now beckon Sally toward a deeper mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_seventeen_dvd_list'})
    MATCH (e:Event {uuid: 'event_35_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_1'})
    ON CREATE SET
        ap.current_status = 'Sally steps quietly into the geriatric ward and stands by the lone occupied bed next to the window. She calls out to Billy in a gentle, yet determined tone, her posture a mix of tenderness and urgent inquiry as she surveys the room and the subdued light of a rainy day.',
        ap.emotional_state = 'Sally’s face reveals a deep mixture of nostalgia and sorrow as she listens to Billy’s murmur about the rain when they first met. Beneath her calm exterior, she is tenderly haunted by memories of shared moments and the mysterious messages that have defined her past. Her internal resolve battles with a sense of longing for clarity and comfort, as each pause in the dialogue reinforces the emotional weight of unspoken promises and lingering curiosity.',
        ap.emotional_tags = ["Sally\u2019s face reveals a deep mixture of nostalgia", "sorrow as she listens to Billy\u2019s murmur about the rain when they first met. Beneath her calm exterior, she is tenderly haunted by memories of shared moments", "the mysterious messages that have defined her past. Her internal resolve battles with a sense of longing for clarity", "comfort, as each pause in the dialogue reinforces the emotional weight of unspoken promises", "lingering curiosity."],
        ap.active_plans = ["Comfort and reassure Billy in his vulnerable state.", "Extract and understand the cryptic message from The Doctor.", "Preserve and document their shared memories as a key to unlocking the mystery of the DVD list."],
        ap.beliefs = ["She believes that every shared memory holds the key to understanding their intertwined destinies.", "She holds that fate is inscribed in the smallest details of the past, urging her to seek truth even in sorrow.", "She is convinced that the lingering promises of the past are essential for shaping a better future."],
        ap.goals = ["Short-term: To offer emotional support and reassurance to Billy during this quiet, reflective moment.", "Medium-term: To piece together the significance of The Doctor\u2019s message and the list of seventeen DVDs.", "Ultimate: To secure a lasting understanding of her past and ensure that the weight of memory does not hinder her future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_1'})
    ON CREATE SET
        ap.current_status = 'Billy occupies the only active bed by the window in the geriatric ward. In a slow, reflective manner he stirs awake as Sally greets him. His voice is soft yet laden with reminiscence as he comments that it was raining when they first met, his body language relaxed despite the frailty of old age.',
        ap.emotional_state = 'Billy’s tone carries bittersweet nostalgia and a tinge of wry humor about the inexorable passage of time and his own aging. Beneath his gentle quips lies a deep-seated yearning for the meaning behind the mysterious message from The Doctor. He is caught between the comfort of cherished memories and the pain of knowing that every moment brings him closer to the end, yet he holds onto hope as his words reflect both vulnerability and quiet determination.',
        ap.emotional_tags = ["Billy\u2019s tone carries bittersweet nostalgia", "a tinge of wry humor about the inexorable passage of time", "his own aging. Beneath his gentle quips lies a deep-seated yearning for the meaning behind the mysterious message from The Doctor. He is caught between the comfort of cherished memories", "the pain of knowing that every moment brings him closer to the end, yet he holds onto hope as his words reflect both vulnerability", "quiet determination."],
        ap.active_plans = ["To recount the sentimental details of their first encounter and the recurring symbolism of the rain.", "To slowly reveal the enigmatic backstory involving The Doctor and the list of seventeen DVDs.", "To use this final reunion as a means of providing closure and ensuring that the memories he holds dear continue to have significance."],
        ap.beliefs = ["He believes that fate has intricately woven their past and present, making every detail matter.", "He is convinced that the enigmatic message from The Doctor is a promise that gives his life meaning despite its inevitable decline.", "He holds that sharing his memories is a way of preserving not just his own legacy, but also the hope that their connection can transcend time."],
        ap.goals = ["Short-term: To share the precious recollection of when the rain first marked their meeting and to gently affirm their connection.", "Medium-term: To ensure that Sally understands the significance of the DVD list and The Doctor\u2019s message, even if every detail remains elusive.", "Ultimate: To secure a final moment of understanding and emotional closeness with Sally, providing him with the comfort needed before he departs from this life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_2'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands beside the occupied bed in the geriatric ward, her eyes fixed on a faded wedding photograph as she listens intently to Billy’s reminiscences. Her posture is attentive yet tinged with quiet resolve as she processes each bittersweet detail.',
        ap.emotional_state = 'Outwardly, Sally appears composed and caring, yet underneath she is overcome with a wave of nostalgic melancholy and a sense of fated connection. The photograph evokes a deep internal conflict between cherished memories and the surreal implications of Billy’s recounting, leaving her both determined and slightly haunted by the uncanny parallels drawn in the conversation.',
        ap.emotional_tags = ["Outwardly, Sally appears composed", "caring, yet underneath she is overcome with a wave of nostalgic melancholy", "a sense of fated connection. The photograph evokes a deep internal conflict between cherished memories", "the surreal implications of Billy\u2019s recounting, leaving her both determined", "slightly haunted by the uncanny parallels drawn in the conversation."],
        ap.active_plans = ["Absorb and piece together the meaning behind the prophetic DVD list message.", "Remain present and supportive for Billy during his reflective moment.", "Resolve the mystery of her own connection to the past by understanding the significance of the photograph."],
        ap.beliefs = ["Fate interweaves lives in mysterious ways.", "Objects from a bygone era hold clues to deeper truths.", "The enigmatic message from The Doctor is a sign that her path is destined to cross extraordinary events."],
        ap.goals = ["Short-term: Decipher the hints offered by the wedding photograph and the message about the DVD list.", "Medium-term: Maintain the bond with Billy as a source of reassurance and insight.", "Ultimate: Uncover the hidden connections with The Doctor and secure a meaningful resolution to the intertwining of past and future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_2'})
    ON CREATE SET
        ap.current_status = 'Billy Shipton sits in his modest bed by the window in the geriatric ward, awakened by Sally’s gentle inquiry. His movement is slow yet deliberate as he recalls the details of the past—his gaze fixed on fragments of memory while a wedding photograph rests nearby.',
        ap.emotional_state = 'Billy exudes a complex mix of wistful nostalgia and bittersweet humor, softened by the weight of age. His reflective tone masks an underlying hope and resignation, revealing a man torn between the pain of loss and the surprising comfort found in destiny and the cryptic promises of a long-ago message.',
        ap.emotional_tags = ["Billy exudes a complex mix of wistful nostalgia", "bittersweet humor, softened by the weight of age. His reflective tone masks an underlying hope", "resignation, revealing a man torn between the pain of loss", "the surprising comfort found in destiny", "the cryptic promises of a long-ago message."],
        ap.active_plans = ["Recount the prophetic message sent from 1969 as clearly as possible to help Sally understand.", "Preserve the significance of his memories as a guiding light in his final meeting.", "Convey both the mystery and the comfort of a fated reunion as he clings to the promise of The Doctor."],
        ap.beliefs = ["Time and memory have a strange, almost mystical fabric that connects people.", "Every detail of the past, even an old photograph or a list of DVDs, holds profound significance.", "The message from The Doctor\u2014delivered through the unconventional medium of a DVD list\u2014is an immutable part of destiny."],
        ap.goals = ["Short-term: Ensure that Sally receives and understands the crucial elements of the message.", "Medium-term: Leave behind a legacy of hope and mysterious promises that have sustained him.", "Ultimate: Validate his lifelong belief in destiny by reinforcing the one-time, fated reunion with Sally, even as his time draws to a close."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_3'})
    ON CREATE SET
        ap.current_status = 'Sally stands by the window of the geriatric ward with quiet determination. Her posture is straight yet gentle, reflective of both concern and firm resolve. Her movements are slow and measured as she peers at the empty bedside and the faded wedding photograph that stirs memories within her.',
        ap.emotional_state = 'On the surface, Sally exudes a calm assurance mixed with a quiet sorrow as she converses with the fragile Billy. Beneath that calm exterior is a deep empathetic pain and an unwavering commitment to honor the past. Her heart feels the burden of loss and time, yet she is resolute in her promise to remain by his side despite the inevitability of his departure.',
        ap.emotional_tags = ["On the surface, Sally exudes a calm assurance mixed with a quiet sorrow as she converses with the fragile Billy. Beneath that calm exterior is a deep empathetic pain", "an unwavering commitment to honor the past. Her heart feels the burden of loss", "time, yet she is resolute in her promise to remain by his side despite the inevitability of his departure."],
        ap.active_plans = ["Comfort Billy during his final hours by staying with him.", "Absorb every detail of his recollections to understand the significance of his message.", "Honor the promise that binds her to the legacy of The Doctor by keeping his clues alive."],
        ap.beliefs = ["Every moment shared is precious, regardless of the inevitable pain of loss.", "The mysteries of time and fate, as revealed by The Doctor, offer meaning even in farewell.", "Commitment to those she loves is paramount, transcending the boundaries of mortality."],
        ap.goals = ["Short-term: To offer immediate comfort and solidarity to Billy in his vulnerable state.", "Medium-term: To internalize the emotional weight of his message and the memories it revives.", "Ultimate: To ensure that his memory, and the enigmatic hints from The Doctor, continue to guide her future actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_3'})
    ON CREATE SET
        ap.current_status = 'Billy lies in the solitary bed by the window, his frail body softened by the gentle natural light filtering in. His posture is weak yet dignified, and he speaks with a tired, reflective tone. With a weathered gaze, he watches the slow passage of the rain, each drop echoing the weight of time on his aging frame.',
        ap.emotional_state = 'Billy’s emotions are layered with wistful nostalgia and a bittersweet tranquility. Outwardly, his voice carries a gentle humor mixed with melancholy as he recalls past promises and the fated message from The Doctor. Internally, he battles a quiet despair over the looming finality of his life while clinging to hope, finding solace in the thought of one last meeting that has sustained him through years of solitude.',
        ap.emotional_tags = ["Billy\u2019s emotions are layered with wistful nostalgia", "a bittersweet tranquility. Outwardly, his voice carries a gentle humor mixed with melancholy as he recalls past promises", "the fated message from The Doctor. Internally, he battles a quiet despair over the looming finality of his life while clinging to hope, finding solace in the thought of one last meeting that has sustained him through years of solitude."],
        ap.active_plans = ["To share his final message from The Doctor with Sally as a means to validate a lifetime of anticipation.", "To use his reminiscence and gentle humor to ease the emotional reality of his terminal state.", "To secure a final, meaningful connection with Sally by recounting the significance of the list and his past."],
        ap.beliefs = ["Fate interweaves destinies in mysterious ways, as evidenced by The Doctor\u2019s message.", "The passage of time, however cruel, is marked by moments of connection that give life meaning.", "His personal history and memories are sacred, even when they testify to both joy and sorrow."],
        ap.goals = ["Short-term: To communicate his final message clearly to Sally and affirm their bond.", "Medium-term: To leave behind a legacy of hope that his vigil has not been in vain.", "Ultimate: To conclude his solitary watch with the assurance that his encounter with Sally fulfills an age-old promise, one that will echo beyond his own passing."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_telephone_event_36_1'})
    ON CREATE SET
        oi.description = 'The classic telephone serves as the medium through which the charged communication unfolds in the back room. It is used by Larry to answer the incoming call, forming the central focus for the verbal exchange. The telephone’s ring and its subsequent use are pivotal in establishing the eerie, ambiguous tone of this interaction, as it carries both Larry’s measured response and Sally’s unexpected off-screen interjection.',
        oi.status_before = 'Before this event, the telephone is in a normal standby state, likely mounted or stationed in the back room as a standard communication device, undisturbed and ready for use.',
        oi.status_after = 'After the event, the telephone remains active near Larry, having served as the conduit for the mysterious phone call. Its role as a silent witness underscores the lingering ambiguity of the unexpected claim, with no physical change observed despite the charged dialogue.'
    WITH oi
    MATCH (o:Object {uuid: 'object_telephone'})
    MATCH (e:Event {uuid: 'event_36_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_36_1'})
    ON CREATE SET
        ap.current_status = 'Larry stands in the back room and picks up the telephone with his customary pragmatic air. He answers succinctly, stating \'Banto\'s\', his tone measured despite the unexpected twist, as he remains physically positioned in the light of the back room with a slight frown of disbelief.',
        ap.emotional_state = 'Larry is visibly bewildered by the sudden and off-screen interjection; there’s a mix of cautious confusion and practical concern in his expression as he processes the unexpected claim. His calm exterior conceals an undercurrent of anxiety about the implications of the voice on the other end and what it might mean for his current responsibilities.',
        ap.emotional_tags = ["Larry is visibly bewildered by the sudden", "off-screen interjection; there\u2019s a mix of cautious confusion", "practical concern in his expression as he processes the unexpected claim. His calm exterior conceals an undercurrent of anxiety about the implications of the voice on the other end", "what it might mean for his current responsibilities."],
        ap.active_plans = ["Confirm the identity and intent of the unexpected caller.", "Maintain control of the situation by sticking to his clear, measured response.", "Assess any discrepancies between his own understanding of the call and the interjection to decide on next steps."],
        ap.beliefs = ["Order and clarity must prevail even in unexpected situations.", "Pragmatic action is the best response to ambiguity.", "Verbal interactions, even on a telephone, warrant careful attention and verification."],
        ap.goals = ["Short-term: Clarify the nature of the incoming call and the source of the off-screen voice.", "Medium-term: Stabilize the communication moment and ensure he remains in control of the unfolding situation.", "Ultimate: Understand the deeper significance of this unexpected message and maintain his authority in managing events as they develop."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_36_1'})
    ON CREATE SET
        ap.current_status = 'Sally’s voice comes in off-screen with assertive urgency, declaring \'They\'re mine\' as a surprising counterpoint to Larry’s initial response. Though not physically visible, her vocal presence is charged with determination and a clear claim over a subject of significance, suggesting her active engagement in the situation.',
        ap.emotional_state = 'Sally exhibits a layered mixture of courage and defiant curiosity in this moment. Outwardly, her tone is confident and commanding, yet there are undercurrents of tension and a hint of playful irreverence. Her inner drive to assert control and claim ownership is evident, even as she navigates the strange ambiguity of the conversation.',
        ap.emotional_tags = ["Sally exhibits a layered mixture of courage", "defiant curiosity in this moment. Outwardly, her tone is confident", "comm", "ing, yet there are undercurrents of tension", "a hint of playful irreverence. Her inner drive to assert control", "claim ownership is evident, even as she navigates the strange ambiguity of the conversation."],
        ap.active_plans = ["Assert her claim with authority and disrupt any ambiguities regarding ownership.", "Communicate her perspective clearly despite being off-screen.", "Force a reorientation of the narrative by injecting her active, investigative presence into the situation."],
        ap.beliefs = ["Her personal responsibility and ownership over what matters to her cannot be questioned.", "Directness and assertiveness are essential when facing absurd or unexplained events.", "Every communication, even a brief telephone call, can be a decisive moment in shaping outcomes."],
        ap.goals = ["Short-term: Immediately claim responsibility in the conversation with her statement 'They're mine'.", "Medium-term: Establish clarity of ownership and ensure the intended message is received by all involved.", "Ultimate: Secure control over the narrative surrounding the mysterious event and reinforce her role as a determined investigator."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sally_dvd_collection_event_37_1'})
    ON CREATE SET
        oi.description = 'Sally\'s DVD Collection plays a critical narrative role by serving as the tangible evidence of the hidden connection that ties every DVD to her own identity. Each of the seventeen DVDs contains a covert Easter Egg that underscores her unique destiny, transforming the collection into an essential repository of clues that anchors the mystery to her personal journey.',
        oi.status_before = 'Prior to this moment, the DVD collection was a meticulously curated archive of seventeen DVDs, each bearing discreet, hidden clues that hinted at a deeper, personalized connection, quietly awaiting revelation.',
        oi.status_after = 'Following the revelation, the DVD collection is redefined as an emblem of destiny, its secret significance exposed as integral to Sally\'s role, thus elevating its status from mere media items to critical narrative keys in the unfolding mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sally_dvd_collection'})
    MATCH (e:Event {uuid: 'event_37_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_37_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands at the threshold of the DVD store with an air of quiet determination. Her eyes burn with resolve as she declares her connection to the secret within her curated collection, her posture firm and unyielding as she proclaims that every DVD is a part of her destiny.',
        ap.emotional_state = 'On the surface, Sally exudes confidence and assertiveness as she reveals the hidden truth about the DVDs, yet deep within she grapples with a blend of overwhelming excitement and a heavy sense of responsibility. Her inner turmoil reflects both pride in her uniqueness and apprehension about the implications of the secret meant solely for her.',
        ap.emotional_tags = ["On the surface, Sally exudes confidence", "assertiveness as she reveals the hidden truth about the DVDs, yet deep within she grapples with a blend of overwhelming excitement", "a heavy sense of responsibility. Her inner turmoil reflects both pride in her uniqueness", "apprehension about the implications of the secret meant solely for her."],
        ap.active_plans = ["Assert her personal link to the mysterious DVD collection.", "Broadcast the revelation that the hidden Easter Egg is designed exclusively for her.", "Use the collection as a stepping stone to unlock further mysteries in her investigation."],
        ap.beliefs = ["She believes that fate has intricately woven her life with the trail of clues left by the Doctor.", "She is convinced that the DVDs are not arbitrary, but intentionally curated with hidden messages meant specifically for her.", "She trusts that this personal connection is the key to solving a greater cosmic mystery."],
        ap.goals = ["Short-term: To boldly announce her discovery and stake her claim in the narrative.", "Medium-term: To delve deeper into the significance of the DVDs and reveal further secrets.", "Ultimate: To understand her destined role in the grand unfolding mystery and harness this knowledge to change her fate."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_seventeen_dvd_list_event_38_1'})
    ON CREATE SET
        oi.description = 'The Seventeen DVD List plays a pivotal narrative role in this moment, serving as a tangible record of a coded clue. As Larry scrutinizes the slip, the list unveils its secret count—exactly seventeen DVDs—which hints at a hidden \'Easter egg\' containing The Doctor’s unexpected appearances. The object acts both as a marker of precise detail and a trigger for Larry’s realization, pushing him further into the unfolding mystery.',
        oi.status_before = 'Before this event, the list is a neatly composed, concise paper slip in Larry\'s possession, stored securely as a record of an enigmatic clue.',
        oi.status_after = 'Following Larry\'s examination, the list retains its form but its significance is heightened, serving as an unmistakable signpost that the number seventeen is critical to the mystery and demanding further investigation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_seventeen_dvd_list'})
    MATCH (e:Event {uuid: 'event_38_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_38_1'})
    ON CREATE SET
        ap.current_status = 'In the back room, Larry Nightingale stands amid the subdued light and quiet hum of the space, carefully holding and inspecting a paper slip while his eyes scan every detail of the mysterious DVD list, his posture firm yet slightly tense as he focuses on the numbers before him.',
        ap.emotional_state = 'Larry experiences a layered mix of cautious disbelief and mounting intrigue. On the surface, he is pragmatic and controlled, his face registering a moment of unexpected amazement as he discovers that there are exactly seventeen DVDs. Beneath this calm demeanor, however, he harbors a quiet urgency and anxiety about the underlying significance of this precise number, hinting at the possibility that an extraordinary secret is hidden within seemingly mundane details.',
        ap.emotional_tags = ["Larry experiences a layered mix of cautious disbelief", "mounting intrigue. On the surface, he is pragmatic", "controlled, his face registering a moment of unexpected amazement as he discovers that there are exactly seventeen DVDs. Beneath this calm demeanor, however, he harbors a quiet urgency", "anxiety about the underlying significance of this precise number, hinting at the possibility that an extraordinary secret is hidden within seemingly mundane details."],
        ap.active_plans = ["Verify the exact count and ensure the list\u2019s accuracy.", "Analyze the significance of the numbered DVDs in relation to the unfolding mystery.", "Preserve and document the list as a potential key piece of evidence."],
        ap.beliefs = ["Every detail, no matter how small, has a deeper meaning in a mystery like this.", "Practical evidence must be carefully preserved and analyzed.", "The hidden clues, though wrapped in ordinary objects, are integral to uncovering the truth."],
        ap.goals = ["Short-term: Confirm that the list indeed contains exactly seventeen DVDs and understand its immediate role.", "Medium-term: Investigate how the DVD list connects with the larger narrative and the secret 'Easter egg' referenced in it.", "Ultimate: Decipher the mystery surrounding the DVDs and their ties to the overarching clues, helping to unravel the enigma linked to The Doctor."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_portable_dvd_player_event_39_1'})
    ON CREATE SET
        oi.description = 'The portable DVD player is referenced as a functional item integral to the dialogue. Its mention is loaded with narrative significance; it represents a tangible link between mundane technology and a deeper, unfolding mystery. Through Sally\'s inquiry, it becomes a symbol that triggers the decision to meet, bridging everyday life with extraordinary events that are at the heart of their story.',
        oi.status_before = 'The DVD player is in its standard, operational condition—readily available and emblematic of a typical portable device used for personal viewing.',
        oi.status_after = 'Following the exchange, the DVD player remains unchanged in function and appearance, yet it now carries an added narrative weight as a catalyst that signifies Sally\'s purposeful invitation and foreshadows further revelations.'
    WITH oi
    MATCH (o:Object {uuid: 'object_portable_dvd_player'})
    MATCH (e:Event {uuid: 'event_39_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_39_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands decisively on the street outside the DVD store, directly addressing Larry with her inquiry. Her posture is alert and confident, her gaze focused as she raises a seemingly casual but loaded question about a portable DVD player.',
        ap.emotional_state = 'Sally\'s face carries a blend of inquisitiveness and underlying urgency. Outwardly, she exudes a calm determination and a hint of playfulness, yet internally she is driven by a fervent need to connect and advance her investigation into the mysteries entwined with her personal fate. There is a conflict between the ordinary tone of her question and the profound implications it carries for her unfolding journey.',
        ap.emotional_tags = ["Sally's face carries a blend of inquisitiveness", "underlying urgency. Outwardly, she exudes a calm determination", "a hint of playfulness, yet internally she is driven by a fervent need to connect", "advance her investigation into the mysteries entwined with her personal fate. There is a conflict between the ordinary tone of her question", "the profound implications it carries for her unfolding journey."],
        ap.active_plans = ["Confirm the availability of the DVD player as a conduit for further communication.", "Initiate a personal meeting with Larry that could deepen their interpersonal bond and reveal clues.", "Leverage everyday dialogue to transition into unveiling larger mysteries."],
        ap.beliefs = ["Ordinary objects can carry extraordinary significance.", "Every interaction, no matter how casual, may be a stepping stone to unveiling hidden truths.", "Personal connections are vital to navigating the complexities of her unfolding destiny."],
        ap.goals = ["Short-term: Secure a positive response from Larry regarding the portable DVD player and set up a meeting.", "Medium-term: Establish trust and collaboration with Larry to further investigate the mysterious clues.", "Ultimate: Uncover the deeper narrative interconnections that link her destiny with the unfolding mysteries and the enigmatic Doctor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_39_1'})
    ON CREATE SET
        ap.current_status = 'Larry stands in a relaxed yet attentive manner as he responds to Sally’s query. His posture is calm and measured, reflecting his pragmatic nature, and he listens carefully as Sally transitions from a mundane question to a significant invitation.',
        ap.emotional_state = 'Larry’s expression is one of cautious curiosity. Outwardly, he remains composed and practical, but internally he experiences a subtle tension; a blend of surprise at the unexpected turn in conversation and an underlying readiness to engage with the evolving circumstances. He harbors a quiet uncertainty tempered by his commitment to maintaining order.',
        ap.emotional_tags = ["Larry\u2019s expression is one of cautious curiosity. Outwardly, he remains composed", "practical, but internally he experiences a subtle tension; a blend of surprise at the unexpected turn in conversation", "an underlying readiness to engage with the evolving circumstances. He harbors a quiet uncertainty tempered by his commitment to maintaining order."],
        ap.active_plans = ["Clarify the purpose behind Sally's seemingly simple inquiry.", "Evaluate the implications of meeting based on the casual yet loaded invitation.", "Prepare to contribute practically to the unfolding situation despite underlying personal reservations."],
        ap.beliefs = ["Rational inquiry and clarity are essential in any unusual situation.", "Every question should be met with a practical response to ensure stability.", "Maintaining order and clear communication is key even in situations laced with mystery."],
        ap.goals = ["Short-term: Understand Sally's intent behind the query and the invitation to meet.", "Medium-term: Balance his practical approach with the necessity to engage in a potentially pivotal encounter.", "Ultimate: Navigate the unfolding mystery while preserving the normalcy of his everyday responsibilities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_40_1'})
    ON CREATE SET
        ap.current_status = 'Larry stands in the quiet back room, his eyes alert and voice edged with uncertainty as he blurts out a simple yet loaded inquiry, \'Where?\' His physical stance is measured yet uneasy, suggesting that even amidst recent chaos he clings to a need for clarity in this moment.',
        ap.emotional_state = 'Internally, Larry is experiencing a swirl of confusion and anxiety mixed with pragmatic determination. Externally, his terse questioning masks subtle apprehension, as he struggles with the disjointed nature of the unfolding events while trying to ground himself in the simplicity of a factual answer. There is an undercurrent of urgency stemming from his cautious nature, indicating that he is both alert to potential dangers and frustrated by the lingering mysteries.',
        ap.emotional_tags = ["Internally, Larry is experiencing a swirl of confusion", "anxiety mixed with pragmatic determination. Externally, his terse questioning masks subtle apprehension, as he struggles with the disjointed nature of the unfolding events while trying to ground himself in the simplicity of a factual answer. There is an undercurrent of urgency stemming from his cautious nature, indicating that he is both alert to potential dangers", "frustrated by the lingering mysteries."],
        ap.active_plans = ["Clarify the ambiguous location to anchor the current situation.", "Maintain a clear, pragmatic approach despite the bizarre circumstances.", "Ensure that the small detail he has picked up leads to further actionable information."],
        ap.beliefs = ["Facts and clear information are crucial to mitigating chaos.", "Order must prevail even amidst uncertainty.", "Understanding one\u2019s surroundings is key to staying safe."],
        ap.goals = ["Short-term: Determine the precise location to better assess the situation.", "Medium-term: Use the confirmed location to plan a safe exit or next step.", "Ultimate: Restore order by unraveling the mystery behind the chaotic events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_40_1'})
    ON CREATE SET
        ap.current_status = 'Sally, with an air of controlled urgency and reminiscent defiance, responds out-of-character to Larry’s question by stating \'Wester Drumlins.\' Standing firmly in the back room, her posture exudes a blend of determination and weariness as she anchors the conversation with this enigmatic name. Her clear articulation cuts through the stillness, highlighting her role as both investigator and storyteller.',
        ap.emotional_state = 'Despite the tension of the unfolding mystery, Sally exhibits a resolute calm and an undercurrent of steely resolve. Outwardly, she carries a mix of inquisitiveness and an almost defiant need to reclaim control over the situation, even as a trace of vulnerability underlies her confident response. Internally, she battles with the weight of unspoken memories and the burden of knowing more than what is immediately revealed, further fueling her determined yet conflicted state.',
        ap.emotional_tags = ["Despite the tension of the unfolding mystery, Sally exhibits a resolute calm", "an undercurrent of steely resolve. Outwardly, she carries a mix of inquisitiveness", "an almost defiant need to reclaim control over the situation, even as a trace of vulnerability underlies her confident response. Internally, she battles with the weight of unspoken memories", "the burden of knowing more than what is immediately revealed, further fueling her determined yet conflicted state."],
        ap.active_plans = ["Anchor the conversation by providing a key piece of information.", "Reinforce the connection between the current inquiry and the greater mystery.", "Propel the investigation forward by ensuring that the name 'Wester Drumlins' is recognized as significant."],
        ap.beliefs = ["Every detail, no matter how small, is a vital clue to unravelling the mystery.", "Courage and curiosity are essential weapons against the unknown.", "The past and present are inextricably linked, and acknowledging the truth is the first step toward resolution."],
        ap.goals = ["Short-term: Clearly communicate the critical location to guide the next steps.", "Medium-term: Build a coherent narrative that ties the enigmatic location to the broader mystery.", "Ultimate: Uncover and resolve the deeper secrets behind the mysterious happenings around Wester Drumlins."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_41_1'})
    ON CREATE SET
        ap.current_status = 'Larry strides into the entrance hall with a relaxed yet alert posture. He steps into the modest, lived-in space and immediately cracks a playful quip, comparing the house to Scooby Doo’s quirky backdrop. His body language exudes casual confidence as he surveys the surroundings.',
        ap.emotional_state = 'Larry displays a lighthearted demeanor, masking an undercurrent of cautious observation. His spontaneous humor reveals a desire to normalize the bizarre situation, yet his eyes betray a lingering wariness. He feels amused by the absurdity of his own comment while remaining subtly mindful of the strange circumstances surrounding him.',
        ap.emotional_tags = ["Larry displays a lighthearted demeanor, masking an undercurrent of cautious observation. His spontaneous humor reveals a desire to normalize the bizarre situation, yet his eyes betray a lingering wariness. He feels amused by the absurdity of his own comment while remaining subtly mindful of the strange circumstances surrounding him."],
        ap.active_plans = ["Diffuse tension through humor", "Establish a supportive rapport with Sally", "Gauge the unfolding situation with a pragmatic approach"],
        ap.beliefs = ["Humor is a valuable tool to cope with uncertainty", "Maintaining a relaxed composure is essential amid chaos", "Ordinary behavior can anchor extraordinary events"],
        ap.goals = ["Short-term: Lighten the mood with a quip to ease immediate tension", "Medium-term: Build a cooperative dynamic with Sally for future challenges", "Ultimate: Use levity and prudence to maintain control during unfolding events"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_41_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands at the entrance hall with arms slightly crossed and an expression of exasperation mixed with intrigue. As she opens the door for Larry, she remains alert, her posture upright and focused, clearly prepared to respond to any unexpected behavior.',
        ap.emotional_state = 'Sally’s face reflects a blend of irritation and reluctant amusement. Although her retort is sharp and laced with exasperation, she is internally calculating the implications of the jovial remark. Beneath the surface of her annoyance lies a determined investigator who must balance her natural curiosity with the need to keep a firm grip on the situation.',
        ap.emotional_tags = ["Sally\u2019s face reflects a blend of irritation", "reluctant amusement. Although her retort is sharp", "laced with exasperation, she is internally calculating the implications of the jovial remark. Beneath the surface of her annoyance lies a determined investigator who must balance her natural curiosity with the need to keep a firm grip on the situation."],
        ap.active_plans = ["Assess the situation critically and methodically", "Counterbalance frivolity with sensible actions", "Establish clear boundaries for acceptable banter during a tense moment"],
        ap.beliefs = ["Seriousness and caution are indispensable in addressing mysteries", "Emotional control under pressure is key to navigating danger", "Professional responsibility must prevail over casual levity"],
        ap.goals = ["Short-term: Respond decisively to Larry\u2019s playful remark to reestablish order", "Medium-term: Ensure the environment inside remains safe and controlled", "Ultimate: Uncover and resolve the underlying mysteries that disrupt normalcy"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_portable_dvd_player_event_42_1'})
    ON CREATE SET
        oi.description = 'The Portable DVD Player functions as the critical conduit for this event, serving as the medium through which the enigmatic DVD conversation is broadcast. It is actively used by Larry to display and compare DVD copies while facilitating the transmission of the Doctor’s cryptic messages, thereby bridging the gap between mundane technology and the outlandish elements of time travel and hidden messages.',
        oi.status_before = 'Prior to the event, the DVD player is in pristine working condition, a compact and reliable device carried along as part of everyday technology in a quirky setting.',
        oi.status_after = 'After the event, the device retains its functionality while being imbued with new narrative significance, acting as a symbol of the fragile interface between ordinary life and the extraordinary disturbances unfolding in time.'
    WITH oi
    MATCH (o:Object {uuid: 'object_portable_dvd_player'})
    MATCH (e:Event {uuid: 'event_42_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transcript_message_event_42_2'})
    ON CREATE SET
        oi.description = 'The Transcript Message plays a pivotal narrative role by serving as the tangible record of the Doctor’s peculiar dialogue. It bridges spoken word and permanent documentation, capturing every cryptic utterance. The frantic note-taking by Larry transforms it into an essential artifact that underlines the mysterious, self-completing nature of time in this episode.',
        oi.status_before = 'Prior to the event, the Transcript Message exists as an incomplete or barely initiated notebook, waiting to be filled with critical observations amid the unfolding chaos.',
        oi.status_after = 'Following the event, the Transcript Message is densely scribbled with frantic notes and cryptic fragments of the Doctor’s speech, solidifying its status as an indispensable record of the extraordinary, non-linear conversation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transcript_message'})
    MATCH (e:Event {uuid: 'event_42_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_angel_statues_event_42_3'})
    ON CREATE SET
        oi.description = 'The Guardian Angels serve as a constant, looming presence that underpins the scene\'s tension. Their fixed, stone expressions and outstretched, threatening postures encapsulate the deadly paradox: while they appear inert and harmless when observed, they are lethal when unguarded. Their placement reinforces the Doctor’s explanation and heightens the urgency of maintaining unbroken visual contact.',
        oi.status_before = 'The stone statues are positioned in a guarding formation, unmoving and intimidating, their ancient and weathered features hinting at a sinister purpose that has long haunted the space.',
        oi.status_after = 'Following the exposition, the statues remain frozen in their ominous state, yet their presence becomes even more menacing as their looming threat is fully internalized by Sally and the Doctor’s message, symbolizing the ever-present danger if vigilance lapses.'
    WITH oi
    MATCH (o:Object {uuid: 'object_angel_statues'})
    MATCH (e:Event {uuid: 'event_42_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_1'})
    ON CREATE SET
        ap.current_status = 'Larry sits on the worn carpet of the drawing room, methodically cueing up the DVD in his portable player while carefully comparing the sound quality and picture clarity. His posture is relaxed yet attentive as he jots notes onto a transcript, occasionally glancing at the screen with a mix of pragmatic scrutiny and subdued wonder.',
        ap.emotional_state = 'Larry displays a cautious yet curious demeanour, his face marked by both skepticism and intrigue. Beneath a calm exterior lies a tinge of anxiety and disbelief as he wrestles with the implications of the cryptic DVD conversation. His measured tone and deliberate actions reveal an internal conflict between his natural pragmatism and the escalating mystery that challenges his well-ordered world.',
        ap.emotional_tags = ["Larry displays a cautious yet curious demeanour, his face marked by both skepticism", "intrigue. Beneath a calm exterior lies a tinge of anxiety", "disbelief as he wrestles with the implications of the cryptic DVD conversation. His measured tone", "deliberate actions reveal an internal conflict between his natural pragmatism", "the escalating mystery that challenges his well-ordered world."],
        ap.active_plans = ["Verify the superior audiovisual quality of the DVD copy for clearer evidence.", "Document every detail of the Doctor\u2019s cryptic transcript for later analysis on online forums.", "Piece together the hidden messages and clues to connect the current events with the broader time-travel narrative."],
        ap.beliefs = ["He believes that even the smallest piece of evidence can unveil extraordinary truths.", "He is convinced that logical examination and documentation are essential to deciphering mysteries.", "He trusts that maintaining order and clarity is crucial in the chaotic interplay between past and future."],
        ap.goals = ["Short-term: Secure an accurate transcript of the Doctor\u2019s message.", "Medium-term: Archive and share the newfound evidence to galvanize a broader investigation.", "Ultimate: Unravel the time-travel enigma and maintain control over the unfolding events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands near the edge of the drawing room with a focused gaze, casually acknowledging the presence of the Doctor on the DVD screen. Her body language, marked by slight tension and deliberate movements, communicates both determination and a readiness to engage with the mystery as she interacts with Larry and the transmitted messages.',
        ap.emotional_state = 'Sally exhibits a blend of fearless inquisitiveness and underlying apprehension. On the surface, she remains cool and witty, yet an internal surge of urgency and emotional strain is evident in her furrowed brow and tight-lipped concentration. She is torn between her unyielding drive to uncover hidden truths and a deep-seated fear of the ramifications that time’s manipulation may bring.',
        ap.emotional_tags = ["Sally exhibits a blend of fearless inquisitiveness", "underlying apprehension. On the surface, she remains cool", "witty, yet an internal surge of urgency", "emotional strain is evident in her furrowed brow", "tight-lipped concentration. She is torn between her unyielding drive to uncover hidden truths", "a deep-seated fear of the ramifications that time\u2019s manipulation may bring."],
        ap.active_plans = ["Identify and verify the Doctor\u2019s messages and their significance within the unfolding time-travel narrative.", "Secure and preserve critical documents and photographic evidence that support her investigation.", "Coordinate with Larry to strategize the next steps, ensuring that any potential dangers are mitigated through constant vigilance."],
        ap.beliefs = ["She believes that the pursuit of truth must continue, regardless of the cost or risk involved.", "She trusts her intuition and investigative instincts in the face of the bizarre and the unknown.", "She is convinced that every piece of evidence, no matter how cryptic, plays a critical role in understanding the larger temporal mystery."],
        ap.goals = ["Short-term: Decipher the DVD transcript and fully grasp the cryptic communication from the Doctor.", "Medium-term: Assemble a comprehensive file of all evidence to maintain control over the mysterious occurrences.", "Ultimate: Confront and ultimately unravel the deeper secrets of time travel while keeping herself and her companions safe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears on the portable DVD screen with a dynamic presence that belies his time-worn nature. His image flashes as part of a pre-recorded message, delivered with quick, offhand remarks about time travel while acknowledging the viewers. His digital visage is both disjointed and commanding, serving as a portal to his chaotic world.',
        ap.emotional_state = 'The Doctor’s on-screen presence is marked by a blend of nonchalant urgency and subtle melancholy. His tone carries a cryptic amusement and a resigned acceptance of his current temporal predicament, yet hints at an underlying sorrow for a life filled with contradictions. This detached delivery conceals a spectrum of emotions ranging from frustration over his own disordered timeline to a rare compassionate concern for those he addresses.',
        ap.emotional_tags = ["The Doctor\u2019s on-screen presence is marked by a blend of nonchalant urgency", "subtle melancholy. His tone carries a cryptic amusement", "a resigned acceptance of his current temporal predicament, yet hints at an underlying sorrow for a life filled with contradictions. This detached delivery conceals a spectrum of emotions ranging from frustration over his own disordered timeline to a rare compassionate concern for those he addresses."],
        ap.active_plans = ["Transmit crucial, time-sensitive instructions to safeguard the continuity of time.", "Direct his companions on securing the blue box and controlling the incoming threat.", "Coordinate via the transcript to ensure communication is maintained despite temporal disruptions."],
        ap.beliefs = ["He is convinced that time is nonlinear and that a complex web of events can be manipulated with the right knowledge.", "He believes that clear communication, even through cryptic means, is essential to safeguard his future and those connected to him.", "He holds that sacrificing clarity and order can be justified if it prevents greater chaos in the fabric of time."],
        ap.goals = ["Short-term: Deliver a precise, albeit puzzling, message to guide his companions immediately.", "Medium-term: Orchestrate the retrieval of his time machine \u2013 the blue box \u2013 to restore his proper temporal position.", "Ultimate: Ensure the integrity of the timeline by preventing catastrophic alterations while sustaining his elusive existence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_2'})
    ON CREATE SET
        ap.current_status = 'Larry is physically seated on the floor, scribbling frenetically in his notebook as he meticulously captures every word of the Doctor’s dialogue. His eyes dart over the hastily written transcript while he occasionally glances upward to track any changes on the screen, exuding a calm yet intense focus amid the chaotic energy.',
        ap.emotional_state = 'Larry’s emotions are a complex mix of anxiety and determined resolve. Outwardly, he shows caution and a measured steadiness, even as internal tension and curiosity wrestle within him over the unfathomable nature of the time anomalies unfolding around him.',
        ap.emotional_tags = ["Larry\u2019s emotions are a complex mix of anxiety", "determined resolve. Outwardly, he shows caution", "a measured steadiness, even as internal tension", "curiosity wrestle within him over the unfathomable nature of the time anomalies unfolding around him."],
        ap.active_plans = ["Document every word from the Doctor\u2019s cryptic message", "Cross-check the live dialogue with his running transcript", "Decipher the hidden clues embedded within the non-linear conversation"],
        ap.beliefs = ["Time is non-linear and defies conventional progression", "Every word spoken by the Doctor carries hidden, cosmic significance", "Accurate documentation is essential to understand and counter the temporal chaos"],
        ap.goals = ["Short-term: Capture an unbroken, precise transcript of the dialogue", "Medium-term: Decode the underlying messages within the transcript", "Ultimate: Uncover the truth behind the time anomalies and secure a method to stabilize the situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands alert and purposeful, engaging directly with the unfolding conversation as she scrutinizes the transcript and the Doctor’s pre-recorded messages. Her posture is determined while she interjects keen questions and exchanges knowing glances with Larry, reinforcing her proactive role in deciphering perplexing time clues.',
        ap.emotional_state = 'Sally experiences a mix of apprehension and resolute curiosity. Outwardly, she masks her underlying anxiety with a steady confidence, driven by her passion for unraveling mysteries and a fierce determination to confront absurd temporal phenomena head-on.',
        ap.emotional_tags = ["Sally experiences a mix of apprehension", "resolute curiosity. Outwardly, she masks her underlying anxiety with a steady confidence, driven by her passion for unraveling mysteries", "a fierce determination to confront absurd temporal phenomena head-on."],
        ap.active_plans = ["Clarify the enigmatic messages delivered by the Doctor", "Ensure that the transcript accurately captures every critical moment", "Probe deeper into the implications of the time-warp and hidden communication"],
        ap.beliefs = ["Curiosity and investigation are key to dismantling the unknown", "Time can twist and bend in unpredictable ways", "Remaining attentive and questioning is crucial for survival against temporal threats"],
        ap.goals = ["Short-term: Establish clear communication despite the chaotic dialogue", "Medium-term: Decode the transcript to reveal embedded temporal clues", "Ultimate: Prevent catastrophic outcomes by understanding the Doctor\u2019s time-warped directives"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears on screen with a disordered smile and an air of urgency, delivering his message in a rapid, almost whimsical manner. His image flickers as he casually divulges his predicaments about being stuck in 1969, all the while maintaining an enigmatic detachment that deepens the mystery of his time-traveling existence.',
        ap.emotional_state = 'The Doctor exudes a blend of detached urgency and playful mischief. He remains outwardly calm and nonchalant despite the bizarre and chaotic scenario, yet subtle hints of inner stress reveal his concern over the critical nature of his message and his own temporal disarray.',
        ap.emotional_tags = ["The Doctor exudes a blend of detached urgency", "playful mischief. He remains outwardly calm", "nonchalant despite the bizarre", "chaotic scenario, yet subtle hints of inner stress reveal his concern over the critical nature of his message", "his own temporal disarray."],
        ap.active_plans = ["Transmit essential details regarding the time anomalies through his fragmented dialogue", "Exploit the transcript as a medium to bypass the limitations of non-linear time", "Guide Sally and Larry to safeguard the blue box and counter emerging threats"],
        ap.beliefs = ["Time is a fluid, malleable construct that defies linear logic", "Effective communication across time requires embracing paradoxes", "His role as a time traveller necessitates accepting inherent chaos and unpredictability"],
        ap.goals = ["Short-term: Ensure the integrity and continuity of his recorded message", "Medium-term: Relieve his temporal entrapment in 1969 through strategic instruction", "Ultimate: Preserve the fabric of time by steering all parties away from catastrophic disruptions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_42_2'})
    ON CREATE SET
        ap.current_status = 'Martha appears on the screen with a composed yet exasperated expression, interjecting firmly when the conversation drifts too deeply into chaotic time chatter. Her presence is brief but forceful; she exudes calm pragmatism as she reminds everyone of essential deadlines with a steady, urgent tone.',
        ap.emotional_state = 'Martha\'s emotional state is steady and focused despite the swirling temporal chaos. Beneath her calm exterior lies a trace of anxiety and frustration over the disordered timeline, yet she consistently channels her concern into decisive, practical action.',
        ap.emotional_tags = ["Martha's emotional state is steady", "focused despite the swirling temporal chaos. Beneath her calm exterior lies a trace of anxiety", "frustration over the disordered timeline, yet she consistently channels her concern into decisive, practical action."],
        ap.active_plans = ["Interrupt the spiraling dialogue to bring critical focus back to the situation", "Remind the group of pressing deadlines and maintain order within the chaos", "Support Sally and Larry by emphasizing the importance of staying grounded amid temporal unpredictability"],
        ap.beliefs = ["Practicality and discipline are essential in managing unpredictable scenarios", "Time-sensitive actions must override abstract philosophical debates", "A steady, no-nonsense approach is vital when confronting temporal anomalies"],
        ap.goals = ["Short-term: Ensure the conversation remains tethered to immediate, actionable issues", "Medium-term: Assist in re-establishing order within the non-linear timeline", "Ultimate: Prevent further chaos that could endanger the safety of everyone involved"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_3'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands tense yet alert in the drawing room, her eyes fixed unwaveringly on the looming stone statues. She clutches onto the weight of the Doctor\'s exposition while her body remains poised for action, every muscle coiled in vigilance as she issues stark warnings.',
        ap.emotional_state = 'Outwardly, Sally displays a hardened determination and urgency, her voice edged with fear and defiance as she commands those around her to keep their eyes on the angels. Internally, she battles a torrent of apprehension and resolute focus, knowing that a single blink could mean disaster, and her mind is wrestling with the tremendous implications of the Doctor’s warnings.',
        ap.emotional_tags = ["Outwardly, Sally displays a hardened determination", "urgency, her voice edged with fear", "defiance as she comm", "s those around her to keep their eyes on the angels. Internally, she battles a torrent of apprehension", "resolute focus, knowing that a single blink could mean disaster,", "her mind is wrestling with the tremendous implications of the Doctor\u2019s warnings."],
        ap.active_plans = ["Maintain unbroken visual contact with the statues to prevent their deadly advance.", "Decode and internalize the Doctor\u2019s cryptic instructions regarding the quantum-locked entities.", "Prepare to take swift action to protect herself and her companions based on the critical information provided."],
        ap.beliefs = ["The Weeping Angels are only dangerous when unobserved, and careful vigilance is their only weakness.", "The Doctor\u2019s fragmented wisdom, though cryptic, holds the key to their survival.", "Every moment counts in preventing a catastrophe triggered by a momentary lapse in attention."],
        ap.goals = ["Short-term: Keep her eyes fixed on the Weeping Angels without blinking.", "Medium-term: Absorb the Doctor's instructions and ensure that his message is executed to maintain safety.", "Ultimate: Secure a future where they can neutralize the threat and restore order to their time-disrupted surroundings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_3'})
    ON CREATE SET
        ap.current_status = 'Appearing on screen in his offhand yet compelling manner, the Doctor delivers a rapid-fire, disjointed exposition about the quantum-locked nature of the Weeping Angels. His image flickers with urgency as he explains the paradox of the statues and their deadly curse, all while remaining in his characteristically eccentric style.',
        ap.emotional_state = 'The Doctor projects a calm yet pressing urgency, his voice betraying an undercurrent of concern as he explains intricate time phenomena. Beneath his casual tone lies a deep-seated anxiety about the impending peril, coupled with an unwavering commitment to impart critical information no matter how cryptic or disordered his delivery appears.',
        ap.emotional_tags = ["The Doctor projects a calm yet pressing urgency, his voice betraying an undercurrent of concern as he explains intricate time phenomena. Beneath his casual tone lies a deep-seated anxiety about the impending peril, coupled with an unwavering commitment to impart critical information no matter how cryptic or disordered his delivery appears."],
        ap.active_plans = ["Communicate the dangerous properties of the Weeping Angels to ensure they remain observed at all times.", "Provide essential survival instructions despite the convoluted nature of his message.", "Maintain a connection with Sally and his companions through his time-displaced communication to secure their immediate safety."],
        ap.beliefs = ["Time is non-linear and unpredictable, much like the wibbly-wobbly nature of reality.", "The Weeping Angels' quantum-locked state is both their strength and their curse, dictating that observation is the key to survival.", "Every minute of communication can be the difference between catastrophe and salvation in the face of intertemporal threats."],
        ap.goals = ["Short-term: Ensure that his message is heard and adhered to before the Angels can launch their attack.", "Medium-term: Sustain communication with Sally and her companions to set in motion a plan to retrieve the blue box.", "Ultimate: Secure the continuity of time and protect his future by managing the energy within the TARDIS against the Angels\u2019 threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_4'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands in the drawing room beside the locked exit, key clenched tightly in her hand. She moves with firm determination, scanning the room and directing Larry with urgent instructions, every gesture evidencing a resolve forged by imminent peril.',
        ap.emotional_state = 'On the surface, Sally exhibits a steely determination and commanding presence, pushing aside her fear with concentrated focus. Internally, however, she is battling anxiety and dread as the threat of the Angels looms large, her mind racing through possibilities of escape while clinging to the hope that the key she possesses is the linchpin to their survival.',
        ap.emotional_tags = ["On the surface, Sally exhibits a steely determination", "comm", "ing presence, pushing aside her fear with concentrated focus. Internally, however, she is battling anxiety", "dread as the threat of the Angels looms large, her mind racing through possibilities of escape while clinging to the hope that the key she possesses is the linchpin to their survival."],
        ap.active_plans = ["Use the key she holds to secure passage and potentially unlock a safe exit.", "Instruct Larry to maintain constant visual contact with the looming threat to prevent the Angels from advancing.", "Rely on the guidance received from past messages and her own investigative intuition to steer them through the immediate crisis."],
        ap.beliefs = ["She firmly believes that unwavering focus is the only defense against the Angels\u2019 deadly mechanism.", "She is convinced that the key is not only a physical tool but also the symbol of hope and control in a perilous situation.", "She maintains that trust in the Doctor\u2019s warnings and her own instincts is essential for survival."],
        ap.goals = ["Short-term: Secure a way to escape the room by actively exploring alternative exits while keeping an eye on the threat.", "Medium-term: Stabilize the situation by ensuring the Angels do not get close, using the key as leverage in their escape strategy.", "Ultimate: Overcome the immediate danger and eventually transmit critical information to the Doctor to alter the course of events."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_4'})
    ON CREATE SET
        ap.current_status = 'Larry Nightingale remains seated near the center of the locked drawing room, visibly tense and wary. His body language is one of guarded anxiety as he clutches onto his notes and features pleading expressions, while he repeatedly implores Sally and urges caution as he stays fixed on the threatening presence.',
        ap.emotional_state = 'Larry displays palpable dread and apprehension; his inner voice is fraught with uncertainty and fear of the unknown. Although he attempts to stay resolute and practical, his mind is overwhelmed by the immediate horror of being trapped with an impending supernatural threat, leaving him conflicted between panic and the need to document every detail.',
        ap.emotional_tags = ["Larry displays palpable dread", "apprehension; his inner voice is fraught with uncertainty", "fear of the unknown. Although he attempts to stay resolute", "practical, his mind is overwhelmed by the immediate horror of being trapped with an impending supernatural threat, leaving him conflicted between panic", "the need to document every detail."],
        ap.active_plans = ["Maintain unwavering gaze on the approaching threat to avoid triggering their deadly mechanism.", "Document every word and moment by persevering with his frantic note-taking, ensuring the transcript captures the unfolding crisis.", "Follow Sally's lead cautiously, prepared to retreat or act as the situation escalates."],
        ap.beliefs = ["He believes that staying focused and not blinking is critical to neutralize the Angels\u2019 power.", "He is convinced that careful, measured documentation of the event might provide clues for a future escape or understanding.", "He holds a pragmatic belief that any action taken must be calculated to prevent further escalation of the supernatural threat."],
        ap.goals = ["Short-term: Keep a steady watch over the menacing figure and communicate his fear effectively to Sally to ensure they respond appropriately.", "Medium-term: Attempt to relay critical information via his transcript so that every detail may later contribute to their understanding of the situation.", "Ultimate: Survive the immediate danger by balancing his acute fear with the need for precise observation, hoping that coordinated action will eventually lead to a safe exit."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_43_1'})
    ON CREATE SET
        oi.description = 'The Tardis serves as the central beacon of hope in the cellar. Its iconic blue facade, though weathered, is the key to temporal escape. In this event, Sally relies on its presence, attempting to unlock and activate it while the surrounding atmosphere buzzes with imminent threat. The Tardis stands as both a literal and metaphorical portal to safety, directly influencing the urgency of Sally’s actions.',
        oi.status_before = 'The Tardis is stationary, clearly visible and locked in place within the cellar, emanating a subdued yet persistent glow.',
        oi.status_after = 'After Sally\'s frantic attempts, the Tardis remains the vital escape apparatus, now energized and on the brink of activation, ready to dematerialize and provide a means of escape.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_43_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_angel_statues_event_43_1'})
    ON CREATE SET
        oi.description = 'The set of three guardian angel statues, rendered immobile by their quantum-locked state, are essential to the escape strategy. Their eerie, frozen expressions and ominous stance underscore the supernatural threat they embody. Sally’s unwavering gaze and verbal commands serve to keep these statues in stasis, ensuring they do not disrupt the escape. Their presence is both menacing and paradoxically protective, as they inadvertently safeguard the Tardis by remaining inert.',
        oi.status_before = 'Before the event, the guardian angel statues are in their fixed positions, ominously set and unyielding, with stone faces that convey sorrow and threat.',
        oi.status_after = 'Following the interaction, the statues remain frozen under Sally\'s intense observation, continuing to act as unintentional sentinels that block any potential movement, thereby indirectly assisting in the execution of the escape protocol.'
    WITH oi
    MATCH (o:Object {uuid: 'object_angel_statues'})
    MATCH (e:Event {uuid: 'event_43_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_angel_statues_event_43_2'})
    ON CREATE SET
        oi.description = 'The Guardian Angels serve as the menacing backdrop of the event, their stony forms silently marking the boundaries of threat. Two of the statues are positioned around the Tardis, while a third, coming from upstairs, looms ominously behind Sally and Larry. Their presence heightens the tension, acting as both a physical barrier and a supernatural reminder of the imminent danger that compels every split-second decision in the flickering glow of the light.',
        oi.status_before = 'Prior to the event, the Angels were fixed in their frozen, imposing stances, set in a precise guard-like formation around the Tardis, exuding an unnerving aura of eternal vigilance.',
        oi.status_after = 'Following the exchange, one statue appears to have shifted its focus by pointing toward the flickering light, underscoring the shift in the environmental cues and amplifying the narrative urgency of the imminent threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object_angel_statues'})
    MATCH (e:Event {uuid: 'event_43_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_43_3'})
    ON CREATE SET
        oi.description = 'The Tardis is the central object of hope in this harrowing escape. It represents the sole means of salvation, and Sally’s desperate attempts to unlock it are the linchpin of the narrative. The ancient, iconic blue time machine stands as both a beacon and a challenge, its lock embodying the key to their survival as the guardian angels close in with relentless menace.',
        oi.status_before = 'Before the event, the Tardis stands static in the cellar with its timeless, weathered exterior and a lock that remains securely in place, illuminated by a faint, steady glow in the gloomy surroundings.',
        oi.status_after = 'After the desperate unlock attempt, the Tardis remains unyielding; its lock is still elusive as the tension mounts, leaving it in a critical state of suspended potential, awaiting the moment when it can finally be activated for escape.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_43_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_1'})
    ON CREATE SET
        ap.current_status = 'In the dim, flickering light of the cellar, Sally Sparrow stands with a determined, upright posture as she scans the silent guardians flanking the Tardis. Her fingers move anxiously, rifling through her pocket for the key while her eyes stay fixed on the stationary statues. Every gesture is measured yet urgent as she addresses the inert figures with a commanding tone, eliciting a blend of cautious hope and swift urgency.',
        ap.emotional_state = 'Sally\'s emotional state is a complex mix of focus and apprehension. Outwardly, she projects calm authority and resolute determination as she recites the Doctor\'s promise to the unyielding stone angels. Beneath this composed exterior, however, a surge of anxiety and fear pulses through her, compounded by the pressure of limited time and the overwhelming reality of their perilous situation. The tension between her inner turmoil and her need to remain in control drives every precise action she takes.',
        ap.emotional_tags = ["Sally's emotional state is a complex mix of focus", "apprehension. Outwardly, she projects calm authority", "resolute determination as she recites the Doctor's promise to the unyielding stone angels. Beneath this composed exterior, however, a surge of anxiety", "fear pulses through her, compounded by the pressure of limited time", "the overwhelming reality of their perilous situation. The tension between her inner turmoil", "her need to remain in control drives every precise action she takes."],
        ap.active_plans = ["Search for and operate the Tardis lock to initiate escape.", "Maintain uninterrupted visual contact with the guardian angels to keep them immobilized.", "Secure a safe path through the cellar by coordinating her actions with the fluctuating light and the approaching threat."],
        ap.beliefs = ["The guardian angels will remain frozen as long as they are observed.", "The Doctor's instructions are absolute and provide the only reliable route to survival.", "Her resourcefulness and decisiveness are crucial in overcoming the temporal danger they face."],
        ap.goals = ["Short-term: Quickly locate and engage the Tardis lock mechanism to open a passage to safety.", "Medium-term: Ensure the entire escape sequence proceeds without interruption by controlling the environment.", "Ultimate: Preserve the timeline by following the Doctor's directives, thereby securing a safe exit from imminent danger."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands at the center of the flickering cellar, her eyes fixed on the Tardis while she issues a clear instruction. Her body is tense, key clutched firmly in hand, and she gestures sharply toward the light cue with urgency as the atmosphere around her is charged with chaotic movement.',
        ap.emotional_state = 'Outwardly, Sally exudes determination and alertness; her voice is firm as she calls out directions despite the disorienting glare of the intermittent light. Internally, however, fear and frustration mingle as every flicker and shift in the darkness magnifies the danger posed by the looming stone angels. Her heartbeat races while she combs through every possible strategy to secure their escape.',
        ap.emotional_tags = ["Outwardly, Sally exudes determination", "alertness; her voice is firm as she calls out directions despite the disorienting glare of the intermittent light. Internally, however, fear", "frustration mingle as every flicker", "shift in the darkness magnifies the danger posed by the looming stone angels. Her heartbeat races while she combs through every possible strategy to secure their escape."],
        ap.active_plans = ["Locate and engage the Tardis lock without losing sight of the angels", "Use the environmental light cues to time her actions precisely", "Coordinate with Larry to maintain continuous visual contact with the threat"],
        ap.beliefs = ["Every subtle environmental cue is critical in neutralizing the danger", "Staying completely focused and not blinking can counteract the threat of the angels", "Her resourcefulness and adherence to the Doctor's instructions will secure their escape"],
        ap.goals = ["Short-term: Find the Tardis lock and activate it to start the escape sequence", "Medium-term: Sustain a clear line of sight on the approaching angels to avoid their fatal movement", "Ultimate: Secure a safe exit from the cellar and evade the lethal threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_2'})
    ON CREATE SET
        ap.current_status = 'Larry dashes across the dim cellar floor with caution, his movements deliberate yet filled with urgency. He pauses briefly to question the mysterious flickering light indicator and glances anxiously over his shoulder at the newly looming angel from upstairs, ensuring he remains in a position that maximizes his safety.',
        ap.emotional_state = 'Externally, Larry maintains a controlled, pragmatic composure as he responds to Sally’s alerts, though internally his calm is undercut by rapidly rising panic and anxiety. His measured tone conceals a deep-seated fear of the threat closing in, and every second intensifies his inner turmoil as he struggles to balance caution with the urgency of their predicament.',
        ap.emotional_tags = ["Externally, Larry maintains a controlled, pragmatic composure as he responds to Sally\u2019s alerts, though internally his calm is undercut by rapidly rising panic", "anxiety. His measured tone conceals a deep-seated fear of the threat closing in,", "every second intensifies his inner turmoil as he struggles to balance caution with the urgency of their predicament."],
        ap.active_plans = ["Hasten to assist in opening the Tardis door", "Monitor the flickering light as a directional cue to adjust his position", "Coordinate with Sally by keeping non-verbal contact to ensure neither loses sight of the threat"],
        ap.beliefs = ["Precise timing and continuous observation are key to survival", "Remaining rational and measured under pressure is essential even in life-and-death situations", "Following Sally's lead and the Doctor\u2019s instructions is the best strategy to outsmart the angels"],
        ap.goals = ["Short-term: Reach and activate the Tardis door before the angels get too close", "Medium-term: Maintain a secure visual on the approaching threat while ensuring a clear escape path", "Ultimate: Escape the cellar safely and avoid any lapse that might cost them their lives"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_3'})
    ON CREATE SET
        ap.current_status = 'Sally is crouched beside the Tardis in the deep cellar, frantically scouring every inch of its weathered surface for the elusive lock. Her body is tense, her hands trembling as she reaches desperately in the failing light, each gesture conveying both urgency and fierce determination.',
        ap.emotional_state = 'Sally displays a turbulent mix of raw panic and resolute determination. Outwardly, she is visibly anxious with eyes darting and a quavering voice that betrays her deep fear. Internally, however, beneath the mask of terror lies an unwavering belief in the Doctor’s promise of salvation, fueling her desperate hope and steely resolve despite the suffocating dread of the looming guardian angels.',
        ap.emotional_tags = ["Sally displays a turbulent mix of raw panic", "resolute determination. Outwardly, she is visibly anxious with eyes darting", "a quavering voice that betrays her deep fear. Internally, however, beneath the mask of terror lies an unwavering belief in the Doctor\u2019s promise of salvation, fueling her desperate hope", "steely resolve despite the suffocating dread of the looming guardian angels."],
        ap.active_plans = ["Locate the Tardis lock with speed amid the failing light", "Unlock the Tardis to initiate a rapid escape", "Maintain constant visual contact with the angels to prevent them from advancing"],
        ap.beliefs = ["The Doctor\u2019s instructions are infallible and must be followed without hesitation", "Time travel through the Tardis is the key to overcoming the threat", "Every second lost increases the risk of being overtaken by the guardian angels"],
        ap.goals = ["Short-term: Open the Tardis lock immediately", "Medium-term: Secure a safe exit before the angels close in", "Ultimate: Escape the cellar and survive the encounter with the Weeping Angels"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_3'})
    ON CREATE SET
        ap.current_status = 'Larry is sprinting behind Sally with a mix of urgency and calculated caution. He frequently glances back in terror at the advancing angels while shouting desperate pleas for Sally to hurry. His posture is tense, and he stands ready to intervene, his every movement reflecting strained pragmatism.',
        ap.emotional_state = 'Larry’s face is etched with stark terror tempered by a persistent practicality. Although his voice trembles with urgency and his mind reels from the panic of the moment, he channels his fear into clear, measured directives. Internally, he battles deep apprehension while clinging to a belief in rational action, even in the midst of overwhelming, existential dread.',
        ap.emotional_tags = ["Larry\u2019s face is etched with stark terror tempered by a persistent practicality. Although his voice trembles with urgency", "his mind reels from the panic of the moment, he channels his fear into clear, measured directives. Internally, he battles deep apprehension while clinging to a belief in rational action, even in the midst of overwhelming, existential dread."],
        ap.active_plans = ["Support Sally\u2019s frantic search for the lock", "Maintain vigilant observation of the approaching guardian angels", "Secure a clear escape route once the Tardis is unlocked"],
        ap.beliefs = ["Maintaining unwavering visual contact with the threat is critical", "A coordinated, methodical response can overcome even this terror", "Practicality and clear-headedness will ultimately prevail despite the chaos"],
        ap.goals = ["Short-term: Urge Sally to act quickly and decisively", "Medium-term: Ensure their immediate area remains as secure as possible", "Ultimate: Escape the cellar safely by using the Tardis to flee the advancing danger"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_case_event_44_1'})
    ON CREATE SET
        oi.description = 'The DVD case, emitting a soft and eerie glow, is retrieved by Larry Nightingale and becomes the pivotal instrument in triggering the security protocol. When inserted into the dedicated slot resembling a DVD player within the Tardis, it activates the mechanism that initiates the machine’s dematerialisation, marking a critical turning point in the narrative.',
        oi.status_before = 'Prior to the event, the DVD case is securely stowed in Larry’s pocket, its subtle glow hinting at its otherworldly significance and the authorised control disc concealed within.',
        oi.status_after = 'After being inserted, the DVD case fulfills its function by activating the control disc mechanism; its glow now signifies that it has triggered the Tardis’ dematerialisation protocol, playing a key role in initiating the rapid temporal departure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_case'})
    MATCH (e:Event {uuid: 'event_44_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_44_1'})
    ON CREATE SET
        oi.description = 'The Tardis, an iconic blue time machine with a weathered exterior, serves as the central focus of the event. Its internal structure begins to rock and vibrate as the inserted DVD case activates its security protocol, leading to a visible start-up of the time rotor and an imminent dematerialisation that underscores the urgency of the narrative moment.',
        oi.status_before = 'Before the event, the Tardis stands intact in its familiar, timeless form, a symbol of hope and escape with its seasoned blue exterior and latent temporal energy.',
        oi.status_after = 'Following the activation via the DVD case, the Tardis dematerialises in a burst of energy, effectively vanishing from sight and leaving behind only the chaotic remnants of its abrupt departure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_44_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_44_2'})
    ON CREATE SET
        oi.description = 'The TARDIS is central to the unfolding crisis, acting as the escape vessel under siege by the Weeping Angels. As Larry inserts the glowing DVD into its slot, the machine responds by rocking violently and activating its time rotor. Amid the relentless assault and the eerie presence of the Angels, the TARDIS dematerialises in a burst of temporal energy, marking a pivotal moment that both enables the protagonists’ survival and temporarily disrupts the Angels’ coordinated attack.',
        oi.status_before = 'Before the event, the TARDIS is stationary and inert, its weathered exterior concealing a latent power, waiting for activation.',
        oi.status_after = 'Following the activation sequence, the TARDIS dematerialises, transitioning into transit mode. Its sudden disappearance leaves behind a charged void and forces the Angels into a locked state as they are forced to look at each other, temporarily neutralizing the threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_44_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dvd_case_event_44_3'})
    ON CREATE SET
        oi.description = 'The DVD case is crucial in this high-stakes moment as it emits a soft, eerie glow signifying its special contents – an authorised control disc. Larry retrieves it from his pocket and, with decisive action, opens it to reveal the glowing disc. Its insertion into the TARDIS console sets off the activation sequence, symbolizing the tangible connection between mundane technology and extraordinary temporal power.',
        oi.status_before = 'Before the event, the DVD case is securely stowed in Larry\'s pocket, inactive and quietly mysterious.',
        oi.status_after = 'After its insertion and activation, the DVD case’s energy is visibly transmitted to the TARDIS, having fulfilled its role as a trigger for the dematerialization sequence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dvd_case'})
    MATCH (e:Event {uuid: 'event_44_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_44_3'})
    ON CREATE SET
        oi.description = 'The TARDIS is at the epicenter of the event, its weathered blue exterior trembling as the energy within surges. Prompted by the glowing disc from the DVD case, the TARDIS begins a violent activation process marked by a rapidly spinning time rotor and a powerful dematerialization sequence. The machine’s motion is both a promise of escape and an omen of the impending danger posed by the Weeping Angels circling outside.',
        oi.status_before = 'Initially, the TARDIS is stationary, albeit vulnerable to external threats. Its ambient power is latent, waiting for a signal to activate the time travel sequence.',
        oi.status_after = 'Following the DVD insertion, the TARDIS rocks violently and enters a full dematerialization state, manifesting brilliant energy as it temporarily departs from the physical space, leaving behind a scene marked by both hope and the looming menace of the Angels.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_44_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_44_4'})
    ON CREATE SET
        oi.description = 'The TARDIS serves as the critical narrative and functional nexus in this event. It rumbles and rocks, with its time rotor surging into life as Larry inserts the glowing DVD, signifying its activation. In a dramatic burst, it dematerialises, marking both an escape and a pivotal mechanism that triggers the Doctor’s trick; the sudden disappearance leaves the Weeping Angels stunned and locked in mutual gaze, symbolizing a bittersweet form of secured safety.',
        oi.status_before = 'Before the event, the TARDIS is firmly present and operational, emitting a steady hum of temporal energy with its iconic blue exterior and weathered but resilient appearance.',
        oi.status_after = 'Following the event, the TARDIS has dematerialised instantly, leaving behind only the echo of its power and the void where it once stood, while its disappearance plays a crucial role in immobilising the threatening Angels.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_44_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_44_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor’s hologram materializes on the upper catwalk with an air of urgency and enigma. He appears distracted yet controlled, delivering cryptic instructions to insert the control disc and prepare for departure as the Tardis roils with energy.',
        ap.emotional_state = 'He exudes a measured urgency tempered with subtle regret and resignation. Despite his typically nonchalant tone, there is an undercurrent of concern and responsibility, as he apologizes for his unsteady life while ensuring that protocol is followed in an imminent crisis.',
        ap.emotional_tags = ["He exudes a measured urgency tempered with subtle regret", "resignation. Despite his typically nonchalant tone, there is an undercurrent of concern", "responsibility, as he apologizes for his unsteady life while ensuring that protocol is followed in an imminent crisis."],
        ap.active_plans = ["Instruct the insertion of the authorised control disc", "Initiate security protocol 712 and trigger the Tardis dematerialisation", "Coordinate a safe departure from the imminent threat"],
        ap.beliefs = ["Maintaining protocol integrity is essential for safe temporal travel", "Authorized devices are the key to controlling time energy", "Even chaotic instructions are critical to secure survival"],
        ap.goals = ["Short-term: Trigger the Tardis\u2019 dematerialisation by activating the disc", "Medium-term: Secure the group's escape from the impending danger", "Ultimate: Ensure ongoing, safe time travel despite looming peril"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_1'})
    ON CREATE SET
        ap.current_status = 'Larry Nightingale stands focused and composed, retrieving a glowing DVD case from his pocket and inserting it into a clearly designated slot in the Tardis. His deliberate and steady motions contrast sharply with the roiling energy of the time machine.',
        ap.emotional_state = 'Despite the chaos unfolding around him, Larry maintains a cautious calm. He experiences an undercurrent of anxiety as the Tardis begins its dematerialisation, yet his pragmatic determination steadies him, driving him to follow the instructions with precision.',
        ap.emotional_tags = ["Despite the chaos unfolding around him, Larry maintains a cautious calm. He experiences an undercurrent of anxiety as the Tardis begins its dematerialisation, yet his pragmatic determination steadies him, driving him to follow the instructions with precision."],
        ap.active_plans = ["Retrieve and activate the glowing DVD case", "Insert the authorised control disc into the Tardis slot", "Monitor the Tardis\u2019 activation and secure a safe dematerialisation"],
        ap.beliefs = ["Precision and pragmatism are vital in crisis situations", "Strict adherence to protocol ensures overall safety", "The Doctor's cryptic instructions, while unsettling, are trustworthy"],
        ap.goals = ["Short-term: Successfully activate the DVD case to trigger the protocol", "Medium-term: Ensure the proper initiation of the Tardis\u2019 dematerialisation sequence", "Ultimate: Secure an escape from the threat posed by the Angels and the chaos around them"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands alert near the Tardis interface, eyes wide as she observes the DVD being inserted and the time machine beginning its convulsive activation. Her body tenses, and she calls out urgently as she surveys the chaotic unfolding of events.',
        ap.emotional_state = 'Sally experiences a turbulent mix of fear and determined curiosity. Although her heart races with panic at the sight of the dematerialising Tardis and the aggressive Angels, she is resolute in her desire not to be left behind and remains vocal in urging immediate action.',
        ap.emotional_tags = ["Sally experiences a turbulent mix of fear", "determined curiosity. Although her heart races with panic at the sight of the dematerialising Tardis", "the aggressive Angels, she is resolute in her desire not to be left behind", "remains vocal in urging immediate action."],
        ap.active_plans = ["Keep a vigilant watch over the Tardis and its activation process", "Call out instructions and encourage rapid action during the crisis", "Ensure that the disc activation leads to a secure departure"],
        ap.beliefs = ["Curiosity and persistence are crucial even in the face of danger", "The Doctor\u2019s guidance holds the key to navigating the crisis", "Staying alert and proactive is essential for survival"],
        ap.goals = ["Short-term: Facilitate the proper insertion of the DVD to trigger the protocol", "Medium-term: Maintain focus and composure during the unstable dematerialisation", "Ultimate: Prevent being stranded by ensuring the Tardis departs safely"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_2'})
    ON CREATE SET
        ap.current_status = 'Larry stands tense before the TARDIS console, methodically retrieving the glowing DVD case from his pocket. His posture is alert, leaning into the console as he inserts the disc into the slot while glancing warily at the advancing Weeping Angels.',
        ap.emotional_state = 'Larry is gripped by a mix of anxiety and determination. Outwardly, his voice trembles slightly as he exclaims about the Angels’ encroachment, yet internally he clings to calm pragmatism. Despite his fear, he remains focused on executing the Doctor\'s instructions, driven by a need to restore order amidst chaos.',
        ap.emotional_tags = ["Larry is gripped by a mix of anxiety", "determination. Outwardly, his voice trembles slightly as he exclaims about the Angels\u2019 encroachment, yet internally he clings to calm pragmatism. Despite his fear, he remains focused on executing the Doctor's instructions, driven by a need to restore order amidst chaos."],
        ap.active_plans = ["Insert the DVD without delay to trigger the TARDIS\u2019s activation.", "Monitor the approaching Weeping Angels and assess their movements.", "Ensure the dematerialisation sequence initiates to secure a rapid escape."],
        ap.beliefs = ["The Doctor\u2019s guidance remains infallible even under pressure.", "The TARDIS is their only viable means of escape and safety.", "Forcing the Angels into a locked eye-contact state will neutralize their threat."],
        ap.goals = ["Short-term: Activate the TARDIS immediately to initiate escape.", "Medium-term: Stabilize the situation by curbing the Angels\u2019 advance.", "Ultimate: Evacuate the area and secure safety from the monstrous assault."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_2'})
    ON CREATE SET
        ap.current_status = 'Sally is in constant motion near the TARDIS, her eyes darting between the glowing DVD slot and the menacing figures of the Weeping Angels. She shouts urgently for the Doctor while urging Larry to act quickly, her body tense and ready to react at a moment’s notice.',
        ap.emotional_state = 'Sally’s face is etched with fear and determination. While she projects urgency and resolve aloud, internally she battles overwhelming terror and a desperate will to survive. Her emotional state is a layered turmoil of astonishment, anxiety, and an unyielding trust in the Doctor’s method, pushing her to take risks despite the imminent danger.',
        ap.emotional_tags = ["Sally\u2019s face is etched with fear", "determination. While she projects urgency", "resolve aloud, internally she battles overwhelming terror", "a desperate will to survive. Her emotional state is a layered turmoil of astonishment, anxiety,", "an unyielding trust in the Doctor\u2019s method, pushing her to take risks despite the imminent danger."],
        ap.active_plans = ["Push Larry to insert the DVD and activate the TARDIS as quickly as possible.", "Maintain visual contact with the Angels to ensure they remain frozen.", "Coordinate her actions with any residual guidance from the Doctor to secure their escape."],
        ap.beliefs = ["The Doctor\u2019s instructions are key, even if they seem counterintuitive under chaos.", "The TARDIS represents their singular hope for survival in this crisis.", "Immediate, focused action is essential to counteract the Angels\u2019 deadly advance."],
        ap.goals = ["Short-term: Ensure the DVD is inserted and the TARDIS\u2019s activation is not delayed.", "Medium-term: Keep both herself and Larry safe from the attacking Angels.", "Ultimate: Facilitate a successful escape from the overwhelming threat while preserving the fragile order amid chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_3'})
    ON CREATE SET
        ap.current_status = 'Larry stands at the TARDIS console, moving quickly to retrieve and open the glowing DVD case from his pocket. His steady hands work with precision as he inserts the DVD into the designated slot while the TARDIS violently rocks and its time rotor springs to life.',
        ap.emotional_state = 'Larry is cautiously anxious yet determined in the midst of chaos. Though his exterior remains measured and pragmatic, deep down he feels a pressing fear of failure and a desperate need to restore order. The rising tempo of the situation stokes both urgency and a flicker of hope as he trusts the plan without succumbing to panic.',
        ap.emotional_tags = ["Larry is cautiously anxious yet determined in the midst of chaos. Though his exterior remains measured", "pragmatic, deep down he feels a pressing fear of failure", "a desperate need to restore order. The rising tempo of the situation stokes both urgency", "a flicker of hope as he trusts the plan without succumbing to panic."],
        ap.active_plans = ["Insert the DVD swiftly to trigger the TARDIS security protocol.", "Ensure the activation sequence stabilizes the TARDIS despite the mounting external threat.", "Monitor the situation and prepare for rapid adjustments if the Angels breach their perimeter."],
        ap.beliefs = ["Believes in the Doctor's methodology and the TARDIS as the pathway to safety.", "Holds that order and methodical action can overcome even the most extraordinary dangers.", "Is convinced that every action is a crucial step in regaining control over chaotic events."],
        ap.goals = ["Short-term: Activate the TARDIS by correctly inserting the DVD and halting further damage.", "Medium-term: Secure the immediate environment by managing the TARDIS\u2019s activation amid external threats.", "Ultimate: Ensure a safe escape from the encroaching danger posed by the Weeping Angels and preserve the chance for further intervention."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_3'})
    ON CREATE SET
        ap.current_status = 'Sally stands by the TARDIS as it begins its violent dematerialization sequence, her eyes wide with shock. She frantically calls out for the Doctor while trying to keep her focus on the surrounding Weeping Angels, her body tense and poised to react at the slightest hint of danger.',
        ap.emotional_state = 'Sally is overtaken by a mix of horror and urgent determination. Outwardly she is expressive in her alarm and frantic appeal for help, yet internally she battles a surge of panicked urgency while clinging to her investigative resolve. Her emotions are a whirlwind of vulnerability meeting brave persistence as she confronts the imminent loss of their escape vehicle.',
        ap.emotional_tags = ["Sally is overtaken by a mix of horror", "urgent determination. Outwardly she is expressive in her alarm", "frantic appeal for help, yet internally she battles a surge of panicked urgency while clinging to her investigative resolve. Her emotions are a whirlwind of vulnerability meeting brave persistence as she confronts the imminent loss of their escape vehicle."],
        ap.active_plans = ["Plead with the Doctor to intervene as the TARDIS begins to dematerialize.", "Keep a vigilant watch on the approaching Angels to prevent them from gaining ground.", "Coordinate with Larry in the hope of collectively stabilizing the situation or finding an alternative escape."],
        ap.beliefs = ["Believes that the Doctor\u2019s guidance and the TARDIS hold the key to overcoming the crisis.", "Feels that every detail, no matter how small, is crucial in managing the unpredictable nature of time travel and its hazards.", "Is convinced that attentiveness and unyielding focus are essential to prevent the Angels from making a final move."],
        ap.goals = ["Short-term: To stop the TARDIS from leaving them behind by calling the Doctor\u2019s attention amid the chaos.", "Medium-term: To maintain eye contact with the Angels as a safeguard against their movement, as per the Doctor\u2019s warning.", "Ultimate: To secure a safe exit from the time-space conflict and preserve the opportunity to further unravel the mystery surrounding their ongoing predicament."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_4'})
    ON CREATE SET
        ap.current_status = 'Larry stands tense yet resolute as he watches the aftermath of the TARDIS dematerialisation. His eyes widen in a mix of disbelief and relief as he registers that the Weeping Angels, once deadly, are now frozen in a standoff with one another. His posture remains cautious but his attention is fixed on the rock-solid tableau created by the Doctor\'s ingenious trick.',
        ap.emotional_state = 'Larry experiences a surge of relief tempered by lingering fear and pragmatic amazement. Although his face betrays astonishment at the Angels’ immobilisation, a deep-seated wariness and resolve underpin his calm exterior. Internally, he is processing the delicate balance between newfound safety and the persistent threat of the unknown, all while reconciling his everyday practicality with the surreal events unfolding around him.',
        ap.emotional_tags = ["Larry experiences a surge of relief tempered by lingering fear", "pragmatic amazement. Although his face betrays astonishment at the Angels\u2019 immobilisation, a deep-seated wariness", "resolve underpin his calm exterior. Internally, he is processing the delicate balance between newfound safety", "the persistent threat of the unknown, all while reconciling his everyday practicality with the surreal events unfolding around him."],
        ap.active_plans = ["Monitor the immobilised Angels to ensure they remain in stasis.", "Assess the immediate environment for any further threats or escapes.", "Stay ready to act with caution if any unexpected movement occurs from the Angels or other dangers."],
        ap.beliefs = ["He believes that methodical observation and caution are key to surviving chaotic, time-twisted situations.", "Larry is convinced that the Doctor\u2019s unorthodox strategies, though baffling, are driven by a deep understanding of danger.", "He holds that practical action over emotional reaction is necessary when faced with supernatural threats."],
        ap.goals = ["Short-term: Ensure their immediate safety by keeping his focus on the frozen Angels.", "Medium-term: Maintain a secure perimeter and be prepared for any shift in the enemy\u2019s stasis.", "Ultimate: Survive the increasingly perilous circumstances by relying on both his own pragmatism and the Doctor\u2019s trickery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_4'})
    ON CREATE SET
        ap.current_status = 'Sally stands on high alert near the spot where the TARDIS once was, her eyes darting across the scene as she registers the dramatic departure of the blue box. Her body is tense and alert, hands clenched and voice rising in an urgent command as she calls out for the Doctor. Every gesture conveys desperation and a fierce determination, even as she quickly adapts to the sudden emptiness left behind by the dematerialised TARDIS.',
        ap.emotional_state = 'Sally’s feelings oscillate between raw urgency and deep concern. On the surface, she appears determined and fiercely protective, her voice ringing out with authority. Beneath that resilient exterior, anxiety and a sense of loss mingle with frustration over the cruel twist of fate. Despite her courage, she is inwardly shaken by the reality of being left behind and driven by a desperate need to understand the unfolding mystery.',
        ap.emotional_tags = ["Sally\u2019s feelings oscillate between raw urgency", "deep concern. On the surface, she appears determined", "fiercely protective, her voice ringing out with authority. Beneath that resilient exterior, anxiety", "a sense of loss mingle with frustration over the cruel twist of fate. Despite her courage, she is inwardly shaken by the reality of being left behind", "driven by a desperate need to underst", "the unfolding mystery."],
        ap.active_plans = ["Quickly scan and document the immobilised Angels to preserve the evidence of the Doctor\u2019s clever trick.", "Coordinate with Larry to regroup and assess their next move in this dangerous situation.", "Attempt to contact or invoke the Doctor\u2019s presence to clarify the next steps for their survival."],
        ap.beliefs = ["She believes that uncovering every detail is critical, as no clue is too small in these baffling times.", "Sally holds a steadfast trust in the Doctor\u2019s ability to outsmart even the most lethal foes.", "She is convinced that courage and curiosity are essential to turning even the direst circumstances to their advantage."],
        ap.goals = ["Short-term: Secure the area and ensure immediate safety by keeping a vigilant watch on the freezing Angels.", "Medium-term: Gather and safeguard any available clues that might explain the mysterious stasis of the Angels.", "Ultimate: Unravel the enigma behind the Doctor\u2019s strategy and use that knowledge to ultimately outwit the constant threat of the Weeping Angels."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_conversation_folder_event_45_1'})
    ON CREATE SET
        oi.description = 'The Conversation Folder is central to the emotional conflict in the DVD store. It contains a transcript of conversations, personal photographs, an old letter, and a picture of an Angel covering its eyes. In this moment, the folder serves as a tangible repository of past mysteries, symbolizing Sally’s obsessive need to preserve and understand her haunting memories, while simultaneously igniting Larry\'s insistence on letting go of the unresolved enigmas.',
        oi.status_before = 'Prior to the event, the folder is a well-worn, treasured item securely in Sally’s possession, containing vital evidence of past encounters and emotional relics from previous events.',
        oi.status_after = 'Following the confrontation, the folder remains in Sally’s possession as a potent symbol of her unresolved past, its presence intensifying her internal conflict about whether to continue obsessing over old mysteries or to move on.'
    WITH oi
    MATCH (o:Object {uuid: 'object_conversation_folder'})
    MATCH (e:Event {uuid: 'event_45_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_45_1'})
    ON CREATE SET
        ap.current_status = 'Larry stands behind the counter at the DVD store, his posture relaxed yet attentive, as he casually handles a bag of milk and briefly inspects the folder held by Sally. He speaks in measured tones, trying to inject a sense of normalcy into the unfolding conversation despite the weight of memories around him.',
        ap.emotional_state = 'On the surface, Larry appears pragmatic and even slightly exasperated by Sally’s insistence on delving into the past. Internally, he is conflicted between the desire to urge her to let go of unresolved enigmas and a lingering concern that these memories might jeopardize their present stability. His measured calm masks an underlying fear that emotionally charged relics could disrupt the simple routine he values.',
        ap.emotional_tags = ["On the surface, Larry appears pragmatic", "even slightly exasperated by Sally\u2019s insistence on delving into the past. Internally, he is conflicted between the desire to urge her to let go of unresolved enigmas", "a lingering concern that these memories might jeopardize their present stability. His measured calm masks an underlying fear that emotionally charged relics could disrupt the simple routine he values."],
        ap.active_plans = ["Encourage Sally to focus on the present and not obsess over past mysteries.", "Reinforce the normalcy of daily life by returning to routine tasks like fetching milk.", "Maintain the stability of their shared business despite emotional disruptions."],
        ap.beliefs = ["Some mysteries are better left unsolved to preserve peace.", "Everyday normalcy is key to maintaining order in their lives.", "Clinging too tightly to the past can interfere with moving forward."],
        ap.goals = ["Short-term: Quickly finish his errand (getting milk) to resume work.", "Medium-term: Keep the shop running smoothly without dwelling on unsettling memories.", "Ultimate: Establish a life centered on practicality and routine, leaving mysterious past events behind."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_45_1'})
    ON CREATE SET
        ap.current_status = 'Sally stands inside the DVD store, the treasured folder clutched tightly in her hands as she engages in a heated dialogue with Larry. Her body is tense yet determined, pacing slightly while her eyes dart between the folder and Larry’s face, reflecting her internal struggle with unresolved memories.',
        ap.emotional_state = 'Sally’s demeanor is charged with a mix of obsessive curiosity and deep emotional turmoil. Outwardly, she is assertive and insistent about not letting go of the evidence contained within the folder, yet beneath that, her anxiety and yearning for closure are evident. Her steadfast insistence on preserving every detail of the past contrasts with an inner vulnerability and a desperate need to understand how these uncanny events continue to shape her present.',
        ap.emotional_tags = ["Sally\u2019s demeanor is charged with a mix of obsessive curiosity", "deep emotional turmoil. Outwardly, she is assertive", "insistent about not letting go of the evidence contained within the folder, yet beneath that, her anxiety", "yearning for closure are evident. Her steadfast insistence on preserving every detail of the past contrasts with an inner vulnerability", "a desperate need to underst", "how these uncanny events continue to shape her present."],
        ap.active_plans = ["Insist on retaining and examining the folder as key evidence to her past encounters with the Doctor.", "Question the origin of the transcript and other artifacts to uncover hidden truths.", "Refuse to let go of the memories, using the folder as a tangible reminder of events that demand explanation."],
        ap.beliefs = ["Every detail of her past is crucial to understanding her connection with the extraordinary events.", "The artifacts hold the key to resolving unanswered questions about the Doctor\u2019s influence in her life.", "Ignoring these memories would mean erasing an essential part of her identity."],
        ap.goals = ["Short-term: Keep the folder close and insist on discussing its contents with Larry.", "Medium-term: Unravel the mystery behind the Doctor\u2019s actions and the uncanny artifacts it contains.", "Ultimate: Find clarity and resolution regarding her strange past and its profound impact on her life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_45_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor steps off the taxi with a hurried, unkempt air; his eyes dart with calculated urgency as he moves briskly down the street. His posture and scattered gestures reveal a mind preoccupied with cosmic dilemmas and the necessity to deliver his cryptic message, even amid the rush.',
        ap.emotional_state = 'Despite his nonchalant delivery, The Doctor carries a mix of internal anxiety and regret; his face reflects a conflicted blend of detached eccentricity and pressing concern. Beneath his calm exterior lurks an awareness of impending chaos and a desperate need to mend fractured timelines, all while masking uncertainty with urgent smiles and apologetic gestures.',
        ap.emotional_tags = ["Despite his nonchalant delivery, The Doctor carries a mix of internal anxiety", "regret; his face reflects a conflicted blend of detached eccentricity", "pressing concern. Beneath his calm exterior lurks an awareness of impending chaos", "a desperate need to mend fractured timelines, all while masking uncertainty with urgent smiles", "apologetic gestures."],
        ap.active_plans = ["Deliver his enigmatic warnings and advice before being forced to dash off.", "Manage his conflicting obligations and chaotic time-travel duties.", "Ensure that his message connects with Sally and underscores the importance of her role."],
        ap.beliefs = ["He believes that time is a complex, non-linear tapestry that must be respected despite its unpredictable nature.", "He is convinced that every cryptic message and seemingly random occurrence contributes to the larger cosmic balance.", "He holds that even in disarray, his interventions are essential to prevent catastrophic temporal disruptions."],
        ap.goals = ["Short-term: Convey his urgent message and warnings to Sally before departing.", "Medium-term: Soothe the concerns of those affected by the cosmic disturbances while keeping the timeline intact.", "Ultimate: Restore balance to time, ensuring that the inevitable paradoxes do not spiral into universal chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_45_2'})
    ON CREATE SET
        ap.current_status = 'Martha Jones stands close by the Doctor, her posture resolute and alert as she quietly monitors his disordered movements. With arms slightly crossed and a practical, watchful gaze, she exudes quiet authority, ready to step in as needed while keeping an eye on the unfolding events outside.',
        ap.emotional_state = 'Martha displays a calm determination mixed with mild exasperation; her face shows a measured concern for the rushing chaos around her. There is an undercurrent of anxiety about the tight deadlines she reminds the Doctor of, yet she channels her inner strength to maintain focus and stability in the midst of time-travel mayhem.',
        ap.emotional_tags = ["Martha displays a calm determination mixed with mild exasperation; her face shows a measured concern for the rushing chaos around her. There is an undercurrent of anxiety about the tight deadlines she reminds the Doctor of, yet she channels her inner strength to maintain focus", "stability in the midst of time-travel mayhem."],
        ap.active_plans = ["Keep the Doctor grounded and on task despite his scattered urgency.", "Remind him of the critical time constraints to avoid further chaos.", "Assist in managing the conversation and ensuring that Sally receives the necessary clarity without derailing the mission."],
        ap.beliefs = ["She believes that orderly action and timely intervention are crucial during cosmic crises.", "She holds that clarity and focus are essential to navigate the unpredictable nature of time travel.", "She is convinced that despite the Doctor\u2019s eccentricities, a disciplined approach will ultimately safeguard the timeline."],
        ap.goals = ["Short-term: Steer the immediate encounter towards resolving pressing questions and threats.", "Medium-term: Ensure that the Doctor remains mindful of the critical deadlines and maintains focus on the mission.", "Ultimate: Help secure a stable timeline by balancing chaotic elements with pragmatic problem-solving."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_conversation_folder_event_46_2'})
    ON CREATE SET
        oi.description = 'The conversation folder serves as the linchpin of the revelation. Sally hands over this well-worn file—containing transcripts, photographs, letters, and a picture of an Angel—to the Doctor. It symbolizes the tangible proof of their intertwined histories and the critical role of documented memory in altering the future.',
        oi.status_before = 'The folder is securely in Sally’s possession, meticulously organized and filled with decades of evidence.',
        oi.status_after = 'Once handed over, the folder becomes a shared artifact, embodying a transfer of responsibility and serving as a crucial piece of the Doctor’s plan to mend the timeline.'
    WITH oi
    MATCH (o:Object {uuid: 'object_conversation_folder'})
    MATCH (e:Event {uuid: 'event_46_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_long_bow_event_46_2'})
    ON CREATE SET
        oi.description = 'The long bow in the Doctor’s grasp underscores the juxtaposition of his traditional, almost timeless preparedness with his unconventional existence as a time traveler. It hints at an archaic yet resourceful aspect of his character, enhancing the surreal nature of the encounter.',
        oi.status_before = 'The long bow is already in the Doctor’s possession as part of his eclectic ensemble of gear.',
        oi.status_after = 'It remains with him, symbolizing his steadfast readiness and serving as a subtle reminder of the blend between historical artifact and futuristic necessity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_long_bow'})
    MATCH (e:Event {uuid: 'event_46_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quiver_of_arrows_event_46_2'})
    ON CREATE SET
        oi.description = 'Carried by Martha, the quiver of arrows adds an element of latent threat and preparedness, even in a moment charged with emotional confession. Its presence underscores that even amidst revelations and confessions, the readiness for conflict remains an undercurrent in the unfolding events.',
        oi.status_before = 'The quiver is securely fastened on Martha, evoking both elegance and a sense of imminent combativeness.',
        oi.status_after = 'It continues to accompany Martha, reinforcing the tension in the atmosphere and symbolizing the perpetual readiness for confrontation, even if not directly engaged in the moment of confession.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quiver_of_arrows'})
    MATCH (e:Event {uuid: 'event_46_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_milk_event_46_2'})
    ON CREATE SET
        oi.description = 'The carton of milk, brought into the scene as Larry returns with it, provides a jarring contrast to the high stakes of time travel and emotional revelation. It acts as a quiet emblem of normalcy amid chaos, grounding the extraordinary happenings in an everyday reality.',
        oi.status_before = 'The milk exists as an ordinary object, unremarkable in its purpose, waiting to be utilized in a mundane context.',
        oi.status_after = 'It remains visibly present in the scene, its mundane normality highlighted against the backdrop of cosmic upheaval, thereby accentuating the surreal collision of everyday life with time-bending events.'
    WITH oi
    MATCH (o:Object {uuid: 'object_milk'})
    MATCH (e:Event {uuid: 'event_46_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_conversation_folder_event_46_3'})
    ON CREATE SET
        oi.description = 'The Conversation Folder is the linchpin of the climax, serving as the physical repository of all past revelations and crucial evidence. In this event, Sally hands the folder to the Doctor as a tangible reminder of their shared destiny, encapsulating the weight of their experiences and the impending future that he must confront. Its contents, a blend of photographs, letters, and transcripts, underscore the mysterious continuity linking the past to the future.',
        oi.status_before = 'Prior to the event, the folder is a well-worn but meticulously maintained file that Sally has amassed over time, containing vital documents that hint at both past mysteries and future imperatives.',
        oi.status_after = 'After the exchange, the folder transitions into an active narrative element in the Doctor’s journey, symbolizing the passing of prophetic knowledge and a burden of evidence that now belongs to him as he steps toward an unpredictable destiny.'
    WITH oi
    MATCH (o:Object {uuid: 'object_conversation_folder'})
    MATCH (e:Event {uuid: 'event_46_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_milk_event_46_4'})
    ON CREATE SET
        oi.description = 'The carton of milk, carried by Larry, serves as a subtle emblem of domestic ordinariness amidst the extraordinary circumstances. It marks the resurgence of daily life and routine, providing a counterbalance to the surreal, time-warped events taking place outside the DVD store. Its presence reinforces the theme of continuity and the persistence of normalcy even in moments of intense upheaval.',
        oi.status_before = 'Before the event, the milk is a simple, unassuming carton maintained as an everyday commodity, untouched by the bizarre mysteries unfolding around it.',
        oi.status_after = 'After the event, the milk remains unchanged in form and function, yet it carries symbolic weight, representing the enduring nature of everyday life and serving as a quiet reminder of the normal world that persists amid chaos.'
    WITH oi
    MATCH (o:Object {uuid: 'object_milk'})
    MATCH (e:Event {uuid: 'event_46_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_1'})
    ON CREATE SET
        ap.current_status = 'Sally Sparrow stands at the bustling exterior of the DVD store, her posture tense yet determined as she shouts \'Doctor! Doctor! Doctor!\' Her eyes never waver as she clutches a vital file of documents, ready to hand it over to the Doctor.',
        ap.emotional_state = 'Sally\'s face is etched with urgency and raw emotion; on the surface, she appears both anxious and resolved, while internally she wrestles with stirring hope and a deep-seated conviction that her long-hidden evidence holds the key to unraveling a cosmic mystery. Her voice trembles with personal responsibility and a trace of bittersweet nostalgia amid the chaos.',
        ap.emotional_tags = ["Sally's face is etched with urgency", "raw emotion; on the surface, she appears both anxious", "resolved, while internally she wrestles with stirring hope", "a deep-seated conviction that her long-hidden evidence holds the key to unraveling a cosmic mystery. Her voice trembles with personal responsibility", "a trace of bittersweet nostalgia amid the chaos."],
        ap.active_plans = ["Deliver the crucial file of documents to the Doctor to ensure the message is received.", "Re-establish the lost connection with the Doctor to piece together past and future events.", "Secure immediate assistance to counter the impending danger hinted at in her revelations."],
        ap.beliefs = ["She believes that uncovering and sharing the truth is essential, even when intertwined with personal history.", "She trusts that every fragment of evidence, no matter how small, is pivotal to understanding the greater cosmic design.", "She is convinced that fate has woven her path with the Doctor\u2019s, making her contributions indispensable."],
        ap.goals = ["Short-term: Successfully hand over the conversation folder to the Doctor during this urgent reunion.", "Medium-term: Garner the Doctor\u2019s help to address and counteract the looming threat.", "Ultimate: Uncover the complete truth behind the mysterious time anomalies and secure a future free from cosmic peril."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears in a hurried yet characteristically charming manner, exuding a hint of disarray as he apologizes for his rushed arrival. Clutching his well-worn long bow, he stands amid the chaos with an air of nonchalance that belies the urgent circumstances unfolding around him.',
        ap.emotional_state = 'The Doctor’s outward demeanor is a mix of calm urgency and apologetic distraction, as he juggles his own complex timeline with the immediate demands of the situation. Beneath his relaxed veneer lies a deep concern for the cosmic stakes at hand and an internal acknowledgment of the unpredictable nature of time, leaving him both frustrated and resigned to the chaotic order of his life.',
        ap.emotional_tags = ["The Doctor\u2019s outward demeanor is a mix of calm urgency", "apologetic distraction, as he juggles his own complex timeline with the immediate dem", "s of the situation. Beneath his relaxed veneer lies a deep concern for the cosmic stakes at h", "", "an internal acknowledgment of the unpredictable nature of time, leaving him both frustrated", "resigned to the chaotic order of his life."],
        ap.active_plans = ["Quickly decipher and relay the critical message meant to secure his future in 1969.", "Provide timely reassurance and guidance to Sally while managing the imminent threat.", "Maintain control over his disordered timeline by balancing his personal quirks with the demands of the unfolding crisis."],
        ap.beliefs = ["He believes that time is a non-linear, wibbly-wobbley force that transcends conventional cause and effect.", "He is convinced that every interaction, however chaotic, is fated to play a pivotal role in the cosmic plan.", "He holds that fate and personal history are inseparably interlinked, influencing both his actions and the broader universe."],
        ap.goals = ["Short-term: Absorb Sally\u2019s crucial information and deliver his cryptic message before the situation escalates further.", "Medium-term: Navigate the imminent crisis by aligning his disordered timeline with the necessary cosmic corrections.", "Ultimate: Secure his own future and that of his companions while preserving the delicate balance of time and cosmic order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_1'})
    ON CREATE SET
        ap.current_status = 'Martha Jones stands close by, her posture firm and ready, with a leather quiver of arrows slung over her shoulder. She casts sharp, practical glances at the Doctor, her stance reflecting a mix of exasperation and unwavering focus amidst the disarray.',
        ap.emotional_state = 'Martha exhibits a layered calmness overlaid with barely concealed frustration; externally, she is pragmatic and authoritative, urging the Doctor to adhere to the critical deadlines. Beneath this exterior, however, she experiences anxiety about the mission’s stakes and a deep-seated worry for the overall integrity of their timeline, making her both resolute and concerned.',
        ap.emotional_tags = ["Martha exhibits a layered calmness overlaid with barely concealed frustration; externally, she is pragmatic", "authoritative, urging the Doctor to adhere to the critical deadlines. Beneath this exterior, however, she experiences anxiety about the mission\u2019s stakes", "a deep-seated worry for the overall integrity of their timeline, making her both resolute", "concerned."],
        ap.active_plans = ["Prompt and ensure the Doctor\u2019s adherence to the ticking deadline, emphasizing urgency over delay.", "Support the unfolding mission by staying grounded and managing immediate crises as they appear.", "Monitor the situation closely to intervene if the cosmic threat escalates beyond control."],
        ap.beliefs = ["She believes that discipline and time management are essential to averting disaster in their unpredictable journey.", "She is convinced that every moment counts, and that adherence to timelines is crucial to maintaining cosmic order.", "She holds a firm conviction that personal accountability and practical action are necessary to balance the Doctor\u2019s chaotic nature."],
        ap.goals = ["Short-term: Ensure that the Doctor does not get sidetracked by trivialities and remains focused on the critical mission.", "Medium-term: Help steer the unfolding events toward a controlled resolution of the impending crisis.", "Ultimate: Safeguard the timeline by reinforcing discipline amid chaos, thereby allowing their collective mission to succeed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_2'})
    ON CREATE SET
        ap.current_status = 'Sally stands outside the DVD store, her body tense yet resolute. With a determined gait and trembling hands, she urgently calls for the Doctor while clutching a well-worn file of documents, her posture marked by a mixture of defiance and vulnerability.',
        ap.emotional_state = 'On the surface, Sally’s voice rings with urgency and determination as she confronts the Doctor. Beneath that lies a whirlwind of conflicted emotions—regret, disbelief, and a profound burden of responsibility for the events set in motion. Her confession hints at deep internal turmoil and the painful realization of her role in a larger, mysterious timeline.',
        ap.emotional_tags = ["On the surface, Sally\u2019s voice rings with urgency", "determination as she confronts the Doctor. Beneath that lies a whirlwind of conflicted emotions\u2014regret, disbelief,", "a profound burden of responsibility for the events set in motion. Her confession hints at deep internal turmoil", "the painful realization of her role in a larger, mysterious timeline."],
        ap.active_plans = ["To transfer the vital conversation folder to the Doctor as indisputable evidence.", "To confess her pivotal role in shaping the sequence of events.", "To ensure that the critical information she holds is acknowledged and incorporated into the Doctor\u2019s plans."],
        ap.beliefs = ["That truth, no matter how burdened, must be revealed to alter the course of destiny.", "That personal responsibility plays an integral part in the unfolding of time.", "That every seemingly isolated moment is intricately bound to a larger cosmic fabric."],
        ap.goals = ["Short-term: Deliver the file to the Doctor and unburden herself with the confession.", "Medium-term: Understand and reconcile her intertwined past with the Doctor\u2019s future.", "Ultimate: Influence the timeline positively by ensuring the crucial information is used to avert the impending crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears in a hurried yet calm manner, his gaze flickering between incredulity and detached amusement. He stands with his well-crafted long bow in hand, his physical stance relaxed despite the evident rapid pace of his speech and the chaotic energy of the moment.',
        ap.emotional_state = 'Outwardly, he maintains a cool, cryptic demeanor marked by a hint of bemusement. Internally, his expression betrays a mix of perplexity and urgency as he processes Sally’s startling revelation. There is a subtle tension beneath his lighthearted banter—a readiness to act despite the chaos of a disordered timeline.',
        ap.emotional_tags = ["Outwardly, he maintains a cool, cryptic demeanor marked by a hint of bemusement. Internally, his expression betrays a mix of perplexity", "urgency as he processes Sally\u2019s startling revelation. There is a subtle tension beneath his lighthearted banter\u2014a readiness to act despite the chaos of a disordered timeline."],
        ap.active_plans = ["To absorb Sally\u2019s confession and adjust his plans accordingly.", "To cryptically advise her about future events, especially his eventual 1969 entrapment.", "To quickly move forward with his time-travel mission while incorporating the new information."],
        ap.beliefs = ["That time is a non-linear, malleable fabric where every revelation reshapes destiny.", "That personal histories, however tangled, are essential to forging the future.", "That even the most bizarre events are part of a larger, inexplicable cosmic order."],
        ap.goals = ["Short-term: Integrate Sally\u2019s vital information into his immediate plans.", "Medium-term: Navigate the complexities of the timeline to avert looming crises.", "Ultimate: Correct the course of history by ensuring that the necessary actions, including retaining important artifacts, are taken."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_3'})
    ON CREATE SET
        ap.current_status = 'Sally stands poised outside the DVD store with urgent determination, her posture resolute as she calls out for the Doctor. With her file clutched firmly in her hand, she presents herself as both tender and fierce in the moment of passing on crucial information.',
        ap.emotional_state = 'She exudes a resigned urgency woven with personal conviction; beneath her determined exterior lies a bittersweet mix of apprehension and hope. Her eyes reveal the weight of long-buried secrets as she channels both caring intensity and a steely resolve to set destiny on its course.',
        ap.emotional_tags = ["She exudes a resigned urgency woven with personal conviction; beneath her determined exterior lies a bittersweet mix of apprehension", "hope. Her eyes reveal the weight of long-buried secrets as she channels both caring intensity", "a steely resolve to set destiny on its course."],
        ap.active_plans = ["To deliver the vital prophecy regarding the Doctor\u2019s future predicament in 1969.", "To hand over her conversation folder as tangible evidence and a safeguard for their intertwined destinies.", "To ensure that the Doctor internalizes the warning as a pivot point for his chaotic timeline."],
        ap.beliefs = ["She believes that uncovering and sharing hidden truths is essential to shaping a better future.", "She holds that fate is a shared responsibility, demanding personal sacrifice to avert disaster.", "She is convinced that the evidence she has gathered is key to unravelling the mysteries of their intertwined lives."],
        ap.goals = ["Short-term: Pass the prophecy and the crucial folder to the Doctor before events spiral further out of control.", "Medium-term: Ensure that the evidence motivates the Doctor to reassess his chaotic timeline and prepare for his future challenges.", "Ultimate: Secure a future where their shared destiny, intertwined by time, is acknowledged and acted upon to prevent catastrophe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_3'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears in a state of controlled haste, leaning slightly forward as he listens to Sally’s urgent delivery. His expression shifts from distracted bemusement to focused attentiveness, punctuated by his whimsical retort about his disordered life, all while maintaining an air of enigmatic calm.',
        ap.emotional_state = 'Internally, he is caught between the lighthearted irreverence that masks his persistent worry and a palpable sense of urgency given the prophecy’s implication. Though his tone is laced with surreal humor, there is an undercurrent of introspective anxiety and acceptance of the chaos that defines his time-traveling existence.',
        ap.emotional_tags = ["Internally, he is caught between the lighthearted irreverence that masks his persistent worry", "a palpable sense of urgency given the prophecy\u2019s implication. Though his tone is laced with surreal humor, there is an undercurrent of introspective anxiety", "acceptance of the chaos that defines his time-traveling existence."],
        ap.active_plans = ["To absorb and decode the prophecy as delivered by Sally.", "To secure and safeguard the conversation folder as a tangible anchor to his convoluted timeline.", "To reconcile his non-linear experience of time with the imperative need to act, setting in motion plans for his unexpected future challenges."],
        ap.beliefs = ["He believes that time is a malleable tapestry, where seemingly random events hold deep interconnected meanings.", "He is convinced that fate leaves clues, and that every peculiar message, however cryptic, plays a role in his journey.", "He maintains that even amid personal disorder, there is wisdom in listening to the warnings of those he trusts."],
        ap.goals = ["Short-term: Receive and process Sally\u2019s prophecy and the accompanying evidence to understand the impending situation.", "Medium-term: Adapt his course of action to prevent a disastrous stasis in time, notably the foretold 1969 incident.", "Ultimate: Navigate his chaotic timeline and safeguard the integrity of events, ensuring that the critical moments of his future are averted or embraced as necessary."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_3'})
    ON CREATE SET
        ap.current_status = 'Martha is positioned close by, her stance practical and alert as she carries her quiver of arrows. Her body language is marked by impatience and urgency, constant reminders of the ticking deadline as she interjects with pragmatic concerns over the Doctor’s convoluted timeline.',
        ap.emotional_state = 'Her emotional state is a blend of exasperation and concern as she balances the surreal nature of the situation with the serious demands of their mission. Martha’s calm exterior belies a simmering anxiety about the rapid pace of events and the vital need to prevent further temporal disruption.',
        ap.emotional_tags = ["Her emotional state is a blend of exasperation", "concern as she balances the surreal nature of the situation with the serious dem", "s of their mission. Martha\u2019s calm exterior belies a simmering anxiety about the rapid pace of events", "the vital need to prevent further temporal disruption."],
        ap.active_plans = ["To prompt the Doctor to pay attention to the critical timeline and adhere to the imminent deadline.", "To ensure that the practical aspects of their mission are not lost amidst the surreal banter.", "To maintain order and direct focus, balancing the chaotic interplay of prophecy and personal revelations."],
        ap.beliefs = ["She believes that despite the whimsical veneer of their adventures, time travel demands strict attention and punctuality.", "She is convinced that the consequences of ignoring practical warning signs can lead to irreversible disaster.", "She trusts that every message, however cryptic, must be heeded in order to maintain the delicate fabric of their reality."],
        ap.goals = ["Short-term: Urgently remind the Doctor about their pressing schedule and the need to act swiftly.", "Medium-term: Prevent further delays by enforcing a pragmatic approach to the unfolding events.", "Ultimate: Ensure that the chaos inherent in their time-travel adventures does not compromise the integrity of future events, thereby averting potential temporal catastrophe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_4'})
    ON CREATE SET
        ap.current_status = 'Sally stands outside the DVD store, urgently calling out for the Doctor. In a determined yet tender manner she hands over her file of crucial documents before saying her bittersweet goodbye, reconnecting with both the chaos of mystery and the normalcy of everyday life.',
        ap.emotional_state = 'Sally displays a blend of anxious urgency, heartfelt sorrow, and hopeful resolve. Outwardly, she shows intensity and determination as she addresses the Doctor, yet beneath that surface runs a deep emotional undercurrent of regret and longing for stability. The moment of farewell is charged with both vulnerability and a secret strength that hints at her unyielding curiosity and commitment to uncovering truths.',
        ap.emotional_tags = ["Sally displays a blend of anxious urgency, heartfelt sorrow,", "hopeful resolve. Outwardly, she shows intensity", "determination as she addresses the Doctor, yet beneath that surface runs a deep emotional undercurrent of regret", "longing for stability. The moment of farewell is charged with both vulnerability", "a secret strength that hints at her unyielding curiosity", "commitment to uncovering truths."],
        ap.active_plans = ["Ensure that the Doctor receives the file containing crucial information for his time-travel endeavors.", "Secure her connection to normal life by confirming her role and responsibilities through the farewell.", "Establish a clear goodbye that marks both an ending and a new beginning in her ongoing investigation."],
        ap.beliefs = ["She believes that truth must be shared, no matter how surreal the circumstances.", "She is convinced that personal connections and timely acts can preserve the flow of time.", "She holds steadfast to the idea that resolving mysteries and safeguarding life are intertwined."],
        ap.goals = ["Short-term: Deliver the file to the Doctor and say a heartfelt goodbye.", "Medium-term: Navigate the immediate chaos and maintain control over the unfolding mystery.", "Ultimate: Reconcile the extraordinary revelations with her everyday life while preserving the integrity of time."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_4'})
    ON CREATE SET
        ap.current_status = 'The Doctor appears in a rush outside the DVD store, his dishevelled yet enigmatic presence underscored by apologetic remarks and hurried gestures. He listens intently as Sally hands over the file, his cryptic yet urgent tone underscoring his need to move on quickly amidst the extraordinary circumstances.',
        ap.emotional_state = 'The Doctor exudes a frenetic energy marked by a mix of nonchalance and internal disquiet. Outwardly, he apologizes for his confusing, complex life and his hurried manner, while subtly revealing an inner layer of regret and urgency. Beneath his eccentric exterior lies a man burdened by the weight of time, caught between apologetic resignation and the pressing need to secure the timeline.',
        ap.emotional_tags = ["The Doctor exudes a frenetic energy marked by a mix of nonchalance", "internal disquiet. Outwardly, he apologizes for his confusing, complex life", "his hurried manner, while subtly revealing an inner layer of regret", "urgency. Beneath his eccentric exterior lies a man burdened by the weight of time, caught between apologetic resignation", "the pressing need to secure the timeline."],
        ap.active_plans = ["Quickly absorb and act upon the vital information handed to him by Sally.", "Hasten his departure to address other pressing, time-sensitive issues.", "Dispense his cryptic advice and warnings to guide the future course of events."],
        ap.beliefs = ["He believes that time is nonlinear and its preservation is paramount, despite his own erratic existence.", "He is convinced that fate interweaves ordinary moments with extraordinary events.", "He holds a deep conviction that even in chaos, precise actions can secure the timeline."],
        ap.goals = ["Short-term: Receive Sally\u2019s file and pass on the necessary warnings before he must rush off.", "Medium-term: Reconcile the perplexing events of the present with his own convoluted timeline.", "Ultimate: Ensure the continuity of time and prevent catastrophic disruptions despite his scattered circumstances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_46_4'})
    ON CREATE SET
        ap.current_status = 'Larry reappears calmly holding a carton of milk as he steps back into the scene, providing a stark contrast to the chaotic energy of Sally and the Doctor. His measured presence and pragmatic demeanor ground the moment, symbolizing the return of everyday normalcy even amid surreal circumstances.',
        ap.emotional_state = 'Larry’s emotions reveal a quiet concern blended with a desire for stability. Outwardly, he maintains a composed and practical attitude as he reintroduces an element of normal domesticity. Internally, there is a cautious hope and a longing for simplicity, even as the bizarre events continue to swirl around him.',
        ap.emotional_tags = ["Larry\u2019s emotions reveal a quiet concern blended with a desire for stability. Outwardly, he maintains a composed", "practical attitude as he reintroduces an element of normal domesticity. Internally, there is a cautious hope", "a longing for simplicity, even as the bizarre events continue to swirl around him."],
        ap.active_plans = ["Serve as a stabilizing influence by reintroducing everyday objects and routines into the chaotic scene.", "Support Sally by bridging the gap between the extraordinary events and ordinary life.", "Ensure that, despite the surreal events, normal responsibilities are not forgotten."],
        ap.beliefs = ["He believes that the mundane aspects of life are essential anchors in times of chaos.", "He is convinced that keeping calm and practical can counterbalance even the most bizarre events.", "He holds that everyday gestures and routines can restore balance and provide solace."],
        ap.goals = ["Short-term: Assist Sally by providing a touch of normalcy, symbolized by his holding of the milk carton.", "Medium-term: Help reestablish order and continuity as the scene transitions back to normalcy.", "Ultimate: Maintain a stable, predictable life despite the encroachment of inexplicable events and preserve the integrity of his everyday world."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_wester_drumlin_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_kathys_flat_hallway'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_kathys_flat_bedroom'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_3_1'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_kitchen'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_4_1'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_kathys_flat_bedroom'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Location {uuid: 'location_kitchen'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Location {uuid: 'location_wester_drumlin_house'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_7_1'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_8'}),
          (b:Location {uuid: 'location_entrance_hall'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Location {uuid: 'location_drawing_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Location {uuid: 'location_conservatory'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_11'}),
          (b:Location {uuid: 'location_drawing_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_2'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Location {uuid: 'location_front_door'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_blink'})
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
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Location {uuid: 'location_conservatory'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Location {uuid: 'location_front_door'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_2'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_15'}),
          (b:Location {uuid: 'location_drawing_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_16'}),
          (b:Location {uuid: 'location_front_door'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_15'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_16_1'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_17'}),
          (b:Location {uuid: 'location_drawing_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_16'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_2'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_18'}),
          (b:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_18'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_17'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_18_1'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ben'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_19'}),
          (b:Location {uuid: 'location_entrance_hall'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_19'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_18'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_19_1'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_20'}),
          (b:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_20'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_19'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_20_1'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_ben'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_21'}),
          (b:Location {uuid: 'location_entrance_hall'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_21'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_20'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_21_1'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_22'}),
          (b:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_22'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_21'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_22_1'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_ben'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_22_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_22_1'}),
          (b:Event {uuid: 'event_22_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_22_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_22_1'}),
          (b:Event {uuid: 'event_22_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_23'}),
          (b:Location {uuid: 'location_entrance_hall'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_23'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_22'}),
          (b:Scene {uuid: 'scene_23'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_23_1'}),
          (b:Scene {uuid: 'scene_23'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_23_2'}),
          (b:Scene {uuid: 'scene_23'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_23_1'}),
          (b:Event {uuid: 'event_23_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_23_3'}),
          (b:Scene {uuid: 'scene_23'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_23_2'}),
          (b:Event {uuid: 'event_23_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_23_4'}),
          (b:Scene {uuid: 'scene_23'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_23_3'}),
          (b:Event {uuid: 'event_23_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_1'}),
          (b:Event {uuid: 'event_23_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_23_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_23_1'}),
          (b:Event {uuid: 'event_23_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_2'}),
          (b:Event {uuid: 'event_23_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_3'}),
          (b:Event {uuid: 'event_23_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_23_4'}),
          (b:Event {uuid: 'event_23_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malcolm'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_23_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malcolm_event_23_4'}),
          (b:Event {uuid: 'event_23_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_24'}),
          (b:Location {uuid: 'location_cafe'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_24'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_23'}),
          (b:Scene {uuid: 'scene_24'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_24_1'}),
          (b:Scene {uuid: 'scene_24'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_24_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_24_1'}),
          (b:Event {uuid: 'event_24_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_24_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_24_1'}),
          (b:Event {uuid: 'event_24_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_25'}),
          (b:Location {uuid: 'location_field_near_grazing_cows'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_25'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_24'}),
          (b:Scene {uuid: 'scene_25'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_25_1'}),
          (b:Scene {uuid: 'scene_25'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_25_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_25_1'}),
          (b:Event {uuid: 'event_25_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ben'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_25_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_25_1'}),
          (b:Event {uuid: 'event_25_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_26'}),
          (b:Location {uuid: 'location_cemetery'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_26'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_25'}),
          (b:Scene {uuid: 'scene_26'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_26_1'}),
          (b:Scene {uuid: 'scene_26'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_26_2'}),
          (b:Scene {uuid: 'scene_26'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_26_1'}),
          (b:Event {uuid: 'event_26_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_1'}),
          (b:Event {uuid: 'event_26_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_kathy_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_26_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_kathy_nightingale_event_26_1'}),
          (b:Event {uuid: 'event_26_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ben'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_26_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ben_event_26_1'}),
          (b:Event {uuid: 'event_26_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_26_2'}),
          (b:Event {uuid: 'event_26_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_27'}),
          (b:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_27'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_26'}),
          (b:Scene {uuid: 'scene_27'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_27_1'}),
          (b:Scene {uuid: 'scene_27'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_27_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_27_1'}),
          (b:Event {uuid: 'event_27_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_banto'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_27_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_27_1'}),
          (b:Event {uuid: 'event_27_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_28'}),
          (b:Location {uuid: 'location_back_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_28'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_27'}),
          (b:Scene {uuid: 'scene_28'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_28_1'}),
          (b:Scene {uuid: 'scene_28'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_28_2'}),
          (b:Scene {uuid: 'scene_28'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_28_1'}),
          (b:Event {uuid: 'event_28_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_28_3'}),
          (b:Scene {uuid: 'scene_28'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_28_2'}),
          (b:Event {uuid: 'event_28_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_28_4'}),
          (b:Scene {uuid: 'scene_28'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_28_3'}),
          (b:Event {uuid: 'event_28_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_1'}),
          (b:Event {uuid: 'event_28_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_1'}),
          (b:Event {uuid: 'event_28_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_28_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_28_1'}),
          (b:Event {uuid: 'event_28_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_2'}),
          (b:Event {uuid: 'event_28_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_2'}),
          (b:Event {uuid: 'event_28_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_3'}),
          (b:Event {uuid: 'event_28_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_3'}),
          (b:Event {uuid: 'event_28_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_3'}),
          (b:Event {uuid: 'event_28_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_28_4'}),
          (b:Event {uuid: 'event_28_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_28_4'}),
          (b:Event {uuid: 'event_28_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_28_4'}),
          (b:Event {uuid: 'event_28_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_29'}),
          (b:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_29'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_28'}),
          (b:Scene {uuid: 'scene_29'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_29_1'}),
          (b:Scene {uuid: 'scene_29'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_banto'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_29_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_banto_event_29_1'}),
          (b:Event {uuid: 'event_29_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_30'}),
          (b:Location {uuid: 'location_police_station'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_30'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_29'}),
          (b:Scene {uuid: 'scene_30'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_30_1'}),
          (b:Scene {uuid: 'scene_30'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_30_2'}),
          (b:Scene {uuid: 'scene_30'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_30_1'}),
          (b:Event {uuid: 'event_30_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_1'}),
          (b:Event {uuid: 'event_30_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_desk_sergeant'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_desk_sergeant_event_30_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_desk_sergeant_event_30_1'}),
          (b:Event {uuid: 'event_30_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_30_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_30_2'}),
          (b:Event {uuid: 'event_30_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_30_2'}),
          (b:Event {uuid: 'event_30_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_31'}),
          (b:Location {uuid: 'location_underground_car_park'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_31'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_30'}),
          (b:Scene {uuid: 'scene_31'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_31_1'}),
          (b:Scene {uuid: 'scene_31'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_31_2'}),
          (b:Scene {uuid: 'scene_31'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_31_1'}),
          (b:Event {uuid: 'event_31_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_1'}),
          (b:Event {uuid: 'event_31_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_1'}),
          (b:Event {uuid: 'event_31_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_31_2'}),
          (b:Event {uuid: 'event_31_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_31_2'}),
          (b:Event {uuid: 'event_31_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_32'}),
          (b:Location {uuid: 'location_street'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_32'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_31'}),
          (b:Scene {uuid: 'scene_32'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_32_1'}),
          (b:Scene {uuid: 'scene_32'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_32_2'}),
          (b:Scene {uuid: 'scene_32'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_32_1'}),
          (b:Event {uuid: 'event_32_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_1'}),
          (b:Event {uuid: 'event_32_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_32_2'}),
          (b:Event {uuid: 'event_32_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_32_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_32_2'}),
          (b:Event {uuid: 'event_32_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_33'}),
          (b:Location {uuid: 'location_alleyway'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_33'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_32'}),
          (b:Scene {uuid: 'scene_33'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_33_1'}),
          (b:Scene {uuid: 'scene_33'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_33_2'}),
          (b:Scene {uuid: 'scene_33'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_33_1'}),
          (b:Event {uuid: 'event_33_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_1'}),
          (b:Event {uuid: 'event_33_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_1'}),
          (b:Event {uuid: 'event_33_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_1'}),
          (b:Event {uuid: 'event_33_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_33_2'}),
          (b:Event {uuid: 'event_33_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_33_2'}),
          (b:Event {uuid: 'event_33_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_33_2'}),
          (b:Event {uuid: 'event_33_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_34'}),
          (b:Location {uuid: 'location_underground_car_park'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_34'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_33'}),
          (b:Scene {uuid: 'scene_34'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_34_1'}),
          (b:Scene {uuid: 'scene_34'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_34_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_34_1'}),
          (b:Event {uuid: 'event_34_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_35'}),
          (b:Location {uuid: 'location_geriatric_ward'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_35'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_34'}),
          (b:Scene {uuid: 'scene_35'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_35_1'}),
          (b:Scene {uuid: 'scene_35'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_35_2'}),
          (b:Scene {uuid: 'scene_35'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_35_1'}),
          (b:Event {uuid: 'event_35_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_35_3'}),
          (b:Scene {uuid: 'scene_35'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_35_2'}),
          (b:Event {uuid: 'event_35_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_1'}),
          (b:Event {uuid: 'event_35_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_1'}),
          (b:Event {uuid: 'event_35_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_2'}),
          (b:Event {uuid: 'event_35_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_2'}),
          (b:Event {uuid: 'event_35_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_35_3'}),
          (b:Event {uuid: 'event_35_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_di_billy_shipton'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_di_billy_shipton_event_35_3'}),
          (b:Event {uuid: 'event_35_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_36'}),
          (b:Location {uuid: 'location_back_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_36'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_35'}),
          (b:Scene {uuid: 'scene_36'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_36_1'}),
          (b:Scene {uuid: 'scene_36'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_36_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_36_1'}),
          (b:Event {uuid: 'event_36_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_36_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_36_1'}),
          (b:Event {uuid: 'event_36_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_37'}),
          (b:Location {uuid: 'location_street'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_37'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_36'}),
          (b:Scene {uuid: 'scene_37'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_37_1'}),
          (b:Scene {uuid: 'scene_37'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_37_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_37_1'}),
          (b:Event {uuid: 'event_37_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_38'}),
          (b:Location {uuid: 'location_back_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_38'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_37'}),
          (b:Scene {uuid: 'scene_38'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_38_1'}),
          (b:Scene {uuid: 'scene_38'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_38_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_38_1'}),
          (b:Event {uuid: 'event_38_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_39'}),
          (b:Location {uuid: 'location_street'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_39'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_38'}),
          (b:Scene {uuid: 'scene_39'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_39_1'}),
          (b:Scene {uuid: 'scene_39'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_39_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_39_1'}),
          (b:Event {uuid: 'event_39_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_39_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_39_1'}),
          (b:Event {uuid: 'event_39_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_40'}),
          (b:Location {uuid: 'location_back_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_40'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_39'}),
          (b:Scene {uuid: 'scene_40'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_40_1'}),
          (b:Scene {uuid: 'scene_40'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_40_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_40_1'}),
          (b:Event {uuid: 'event_40_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_40_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_40_1'}),
          (b:Event {uuid: 'event_40_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_41'}),
          (b:Location {uuid: 'location_entrance_hall'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_41'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_40'}),
          (b:Scene {uuid: 'scene_41'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_41_1'}),
          (b:Scene {uuid: 'scene_41'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_41_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_41_1'}),
          (b:Event {uuid: 'event_41_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_41_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_41_1'}),
          (b:Event {uuid: 'event_41_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_42'}),
          (b:Location {uuid: 'location_drawing_room'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_42'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_41'}),
          (b:Scene {uuid: 'scene_42'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_42_1'}),
          (b:Scene {uuid: 'scene_42'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_42_2'}),
          (b:Scene {uuid: 'scene_42'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_42_1'}),
          (b:Event {uuid: 'event_42_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_42_3'}),
          (b:Scene {uuid: 'scene_42'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_42_2'}),
          (b:Event {uuid: 'event_42_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_42_4'}),
          (b:Scene {uuid: 'scene_42'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_42_3'}),
          (b:Event {uuid: 'event_42_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_1'}),
          (b:Event {uuid: 'event_42_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_1'}),
          (b:Event {uuid: 'event_42_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_1'}),
          (b:Event {uuid: 'event_42_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_2'}),
          (b:Event {uuid: 'event_42_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_2'}),
          (b:Event {uuid: 'event_42_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_2'}),
          (b:Event {uuid: 'event_42_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_42_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_42_2'}),
          (b:Event {uuid: 'event_42_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_3'}),
          (b:Event {uuid: 'event_42_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_42_3'}),
          (b:Event {uuid: 'event_42_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_42_4'}),
          (b:Event {uuid: 'event_42_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_42_4'}),
          (b:Event {uuid: 'event_42_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_43'}),
          (b:Location {uuid: 'location_cellar'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_43'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_42'}),
          (b:Scene {uuid: 'scene_43'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_43_1'}),
          (b:Scene {uuid: 'scene_43'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_43_2'}),
          (b:Scene {uuid: 'scene_43'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_43_1'}),
          (b:Event {uuid: 'event_43_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_43_3'}),
          (b:Scene {uuid: 'scene_43'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_43_2'}),
          (b:Event {uuid: 'event_43_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_1'}),
          (b:Event {uuid: 'event_43_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_2'}),
          (b:Event {uuid: 'event_43_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_2'}),
          (b:Event {uuid: 'event_43_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_43_3'}),
          (b:Event {uuid: 'event_43_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_43_3'}),
          (b:Event {uuid: 'event_43_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_44'}),
          (b:Location {uuid: 'location_tardis_interior'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_44'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_43'}),
          (b:Scene {uuid: 'scene_44'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_44_1'}),
          (b:Scene {uuid: 'scene_44'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_44_2'}),
          (b:Scene {uuid: 'scene_44'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_44_1'}),
          (b:Event {uuid: 'event_44_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_44_3'}),
          (b:Scene {uuid: 'scene_44'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_44_2'}),
          (b:Event {uuid: 'event_44_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_44_4'}),
          (b:Scene {uuid: 'scene_44'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_44_3'}),
          (b:Event {uuid: 'event_44_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_44_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_44_1'}),
          (b:Event {uuid: 'event_44_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_1'}),
          (b:Event {uuid: 'event_44_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_1'}),
          (b:Event {uuid: 'event_44_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_2'}),
          (b:Event {uuid: 'event_44_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_2'}),
          (b:Event {uuid: 'event_44_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_3'}),
          (b:Event {uuid: 'event_44_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_3'}),
          (b:Event {uuid: 'event_44_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_44_4'}),
          (b:Event {uuid: 'event_44_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_44_4'}),
          (b:Event {uuid: 'event_44_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_45'}),
          (b:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_45'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_44'}),
          (b:Scene {uuid: 'scene_45'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_45_1'}),
          (b:Scene {uuid: 'scene_45'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_45_2'}),
          (b:Scene {uuid: 'scene_45'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_45_1'}),
          (b:Event {uuid: 'event_45_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_45_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_45_1'}),
          (b:Event {uuid: 'event_45_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_45_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_45_1'}),
          (b:Event {uuid: 'event_45_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_45_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_45_2'}),
          (b:Event {uuid: 'event_45_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_45_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_45_2'}),
          (b:Event {uuid: 'event_45_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_46'}),
          (b:Location {uuid: 'location_bantos_dvd_store'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_46'}),
          (ep:Episode {uuid: 'episode_blink'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_45'}),
          (b:Scene {uuid: 'scene_46'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_46_1'}),
          (b:Scene {uuid: 'scene_46'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_46_2'}),
          (b:Scene {uuid: 'scene_46'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_46_1'}),
          (b:Event {uuid: 'event_46_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_46_3'}),
          (b:Scene {uuid: 'scene_46'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_46_2'}),
          (b:Event {uuid: 'event_46_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_46_4'}),
          (b:Scene {uuid: 'scene_46'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_46_3'}),
          (b:Event {uuid: 'event_46_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_1'}),
          (b:Event {uuid: 'event_46_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_1'}),
          (b:Event {uuid: 'event_46_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_1'}),
          (b:Event {uuid: 'event_46_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_2'}),
          (b:Event {uuid: 'event_46_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_2'}),
          (b:Event {uuid: 'event_46_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_3'}),
          (b:Event {uuid: 'event_46_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_3'}),
          (b:Event {uuid: 'event_46_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_martha_jones'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_martha_jones_event_46_3'}),
          (b:Event {uuid: 'event_46_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sally_sparrow'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sally_sparrow_event_46_4'}),
          (b:Event {uuid: 'event_46_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_46_4'}),
          (b:Event {uuid: 'event_46_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_larry_nightingale'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_46_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_larry_nightingale_event_46_4'}),
          (b:Event {uuid: 'event_46_4'})
    MERGE (a)-[:IN_EVENT]->(b);
