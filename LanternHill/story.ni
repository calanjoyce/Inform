"Lantern Hill" by "Claude"

[Inform 7 source is meant to read like English. Text in square brackets, like this, is a comment and is ignored by the compiler. Indented lines must use tabs.]

The story headline is "A small Inform 7 demonstration".
The story genre is "Fantasy".
The release number is 2.

Use scoring.
The maximum score is 6.

[Four points win the game. The last two are for finding the library's secrets, which are optional.]

When play begins:
	say "Your aunt, the astronomer, left you three things in her will: her old observatory on Lantern Hill, a note reading 'Watch for the comet tonight,' and absolutely no instructions.[paragraph break]The comet passes at midnight. The telescope, you are told, has not worked in years."

Part 1 - The Map

[Rooms are declared simply by naming them. Quoted text right after a room becomes its description.]

The Garden Path is a room. "Gravel crunches underfoot as the path winds up Lantern Hill to the old observatory, its copper dome dark against the first stars. A crooked potting shed leans against the hedge to the west. The observatory door stands open to the north."

The Potting Shed is west of the Garden Path. "Clay pots, tangled twine and the earthy smell of last summer's tomatoes. [first time]Someone has tidied a single shelf, as if expecting a visitor. [only]The garden lies back east."

The Entrance Hall is north of the Garden Path. "A tall, echoing hall papered with faded star maps. A spiral staircase climbs to a small iron door above, a narrow stair drops into the cellar, and an archway to the east opens on the library. The garden is back south."

The Library is east of the Entrance Hall. "Floor-to-ceiling shelves of almanacs and star atlases. A heavy reading desk sits beneath the window, and the hall lies back to the west.[if the hidden stair is in the Library] One section of shelving has swung inward on hidden hinges, and a narrow stone stair spirals down into the hill.[end if]"

The Cellar is below the Entrance Hall. The Cellar is dark. "A low, damp cellar smelling of candle wax and old coal. Stone steps lead back up to the hall."

[The Laboratory has no exits yet. They are added during play, when the player finds the secret stair (see Chapter 3 of Part 2).]

The Laboratory is a room. "A long vault cut into the rock of the hill. Lamps in green glass shades still burn along the workbenches, as if your aunt had only stepped out. A brass orrery ticks quietly on a stand, a chalkboard covered in sums fills one wall, and a glass-fronted cabinet stands at the far end. The stone stair leads back up."

The Dome is a room. "You stand beneath the great copper dome. A slot in the roof is open to the night, and through it a slice of starry sky. In the centre of the floor sits the telescope, long as a rowing boat and pointed hopefully upward. The iron door leads back down."

[A door connects two rooms. 'Above' and 'below' mean up and down.]

The iron door is a door. The iron door is above the Entrance Hall and below the Dome. The iron door is scenery. The iron door is lockable and locked. The description of the iron door is "A small iron door painted with a crescent moon. It is [if locked]locked tight[otherwise if open]open[otherwise]closed but unlocked[end if]."

[Some convenient synonyms for directions.]

Instead of going inside when the player is in the Garden Path, try going north.
Instead of going outside when the player is in the Entrance Hall, try going south.
Instead of going outside when the player is in the Potting Shed, try going east.

Part 2 - Things

Chapter 1 - The lantern and the key

[A device can be switched on or off. Here we make 'switched on' also mean 'gives off light'.]

The brass lantern is a device in the Potting Shed. "An old brass lantern hangs from a nail on the tidy shelf." The description of the brass lantern is "A sturdy brass lantern with a little crank on the side. It is [if switched on]glowing warmly[otherwise]dark[end if]."

[The Standard Rules normally add 'The brass lantern is currently switched on' when you examine a device. Our description already says so, so we switch that rule off for the lantern.]

The examine devices rule does nothing when examining the brass lantern.

Carry out switching on the brass lantern: now the brass lantern is lit.
Carry out switching off the brass lantern: now the brass lantern is not lit.

[LIGHT is already a synonym for BURN, so we redirect burning the lantern rather than adding new grammar.]

Instead of burning the brass lantern, try switching on the brass lantern.

Understand "lamp" and "light" as the brass lantern.

The small brass key is in the Cellar. "A small brass key hangs from a hook by the steps." The description of the small brass key is "Its bow is shaped like a tiny crescent moon." The small brass key unlocks the iron door.

After taking the small brass key for the first time:
	increase the score by 1;
	continue the action.

After unlocking the iron door with something for the first time:
	increase the score by 1;
	continue the action.

Chapter 2 - The library

The reading desk is a scenery supporter in the Library. The description of the reading desk is "A heavy oak desk with a single drawer."

The drawer is part of the reading desk. The drawer is a closed openable container. The description of the drawer is "A shallow drawer with a brass pull."

The glass lens is in the drawer. The glass lens can be clean or smudged. The glass lens is smudged. The description of the glass lens is "A disc of ground glass the size of your palm. [if the glass lens is smudged]It is clouded with thumbprints and dust.[otherwise]It is spotless.[end if]"

The velvet cloth is on the reading desk. The description of the velvet cloth is "A square of soft blue velvet, the kind used for cleaning spectacles."

The notebook is on the reading desk. The description of the notebook is "Your aunt's handwriting fills the last page:[paragraph break]'Lens out for cleaning again. Key to the dome on its hook downstairs, where it always is. Mind the dark. And give Copernicus a scratch behind the ears, the old rascal.'"

Copernicus is a male animal in the Library. "A grey cat named Copernicus is curled up on the window seat." The description of Copernicus is "A large grey cat with one white paw. He opens one eye, judges you, and closes it again." Understand "cat" and "grey" and "gray" as Copernicus.

Instead of taking Copernicus, say "Copernicus has no intention of being carried anywhere tonight."

Chapter 3 - The library books

[A 'kind' is a category of thing. Every book we create below automatically answers to the word BOOK, and the player can say BOOKS to mean all of them.]

A book is a kind of thing.

[Each thing can carry its own text to be shown by the READ command, which is defined in Part 3. Most things have none.]

A thing has some text called the reading text.

[The shelves are scenery, so the room description doesn't list them separately, but because they are a supporter, the books on them are listed automatically.]

The shelves are a scenery supporter in the Library. Understand "shelf" and "bookshelf" and "bookshelves" and "bookcase" and "almanacs" and "atlases" and "floor-to-ceiling" as the shelves. The description of the shelves is "Almanacs, star atlases, tide tables and decades of astronomical journals, all in your aunt's fierce alphabetical order. A few volumes stand out."

Instead of reading the shelves, say "You could read for a year and not reach the end. Better to choose one book."

Section 1 - Three ordinary books

The battered almanac is a book on the shelves. Understand "lenwood" and "lenwood's" and "returning" and "comets" and "ribbon" as the battered almanac. The description of the battered almanac is "A thick, much-thumbed almanac. The gilt on its spine reads [italic type]Lenwood's Almanac of Returning Comets[roman type]. A faded red ribbon marks a page."

The reading text of the battered almanac is "You open it at the ribbon.[paragraph break][italic type]THE LANTERN COMET. A bright periodic comet returning once in sixty-one years. Viewed from northern latitudes it climbs out of the east shortly before midnight, its tail always pointing away from the Sun. At its best it outshines every star in the sky, but it stays near the Earth for a single night only.[roman type][paragraph break]In the margin, in pencil, a child's careful handwriting: 'Saw it from Lantern Hill with Aunt Bea. I was nine. I will see it again.' Underneath, in the same hand grown older: 'Sixty-one years. Not long now.'"

The slim manual is a book on the shelves. Understand "care" and "keeping" and "refracting" and "slim" as the slim manual. The description of the slim manual is "A slim grey manual, [italic type]The Care and Keeping of the Refracting Telescope[roman type]. Several pages have their corners turned down."

[This book hints at the lens puzzle without giving it away completely.]

The reading text of the slim manual is "You turn to the most dog-eared chapter.[paragraph break][italic type]Chapter Four: Of the Lens. The objective lens is the soul of the instrument. Between observations it should be removed and kept somewhere dry and dark, a desk drawer being ideal. A lens must never be cleaned with a sleeve, a handkerchief or, heaven forbid, the breath. Use only a square of soft velvet, and rub gently.[roman type][paragraph break]Your aunt has underlined 'velvet' twice and added: 'C. sleeps on it if you let him.'"

The little green book is a book on the shelves. Understand "dignity" and "cats" and "cat book" as the little green book. The description of the little green book is "A small cloth-bound book: [italic type]On the Dignity of Cats[roman type], by Anonymous. A grey hair is stuck to the cover."

The reading text of the little green book is "[italic type]Rule the First: A cat is never lifted. A cat consents, on occasion, to rise.[line break]Rule the Second: Every closed door is an insult.[line break]Rule the Third: Affection is offered behind the ears, and nowhere else.[roman type][paragraph break]Beside the third rule your aunt has written: 'True. Ask Copernicus.'"

Section 2 - The hollow book

[This book looks ordinary, but its pages have been cut away to hide a key. The key starts 'off-stage', meaning nowhere in the game world, until the player opens or reads the book.]

The fat grey volume is a book on the shelves. Understand "collected" and "lectures" and "fat" and "hollow" as the fat grey volume. The description of the fat grey volume is "[italic type]Collected Lectures on the Stillness of the Fixed Stars, Volume II[roman type]. It is fat enough to prop open a door, yet oddly light for its size[if the silver key is off-stage], and something inside it rattles faintly when you tilt it[end if]."

The silver key is a thing. The description of the silver key is "A slim silver key with a star cut into its bow."

Instead of opening, reading or searching the fat grey volume:
	if the silver key is off-stage:
		now the player carries the silver key;
		say "You lift the heavy cover. There are no lectures inside: the pages have been cut away to leave a neat hollow, and nestled in it is a slim silver key. You take it.";
	otherwise:
		say "Only the hollow where the key was. Whatever the Collected Lectures had to say about the fixed stars, they kept it to themselves."

Section 3 - The book that is a lever

[This book can't be taken. Trying to take it, pull it or read it tilts it outward, which opens the secret stair (see Chapter 4).]

The tall red book is a book on the shelves. Understand "hidden" and "motions" and "heavens" as the tall red book. The description of the tall red book is "[italic type]Hidden Motions of the Heavens[roman type], bound in red leather. [if the hidden stair is in the Library]It is tilted out from the shelf at an odd angle.[otherwise]Unlike its neighbours it sits perfectly flush with the shelf, and the top of its spine has been worn shiny, as if fingers have pulled at it many times.[end if]"

Instead of taking, pulling, pushing, turning, opening, reading or searching the tall red book:
	if the hidden stair is in the Library:
		say "The red book is tilted out as far as it will go. The bookcase stands open.";
	otherwise:
		open the secret stair.

Section 4 - Other things to read

Instead of reading the notebook, try examining the notebook.

Instead of reading Copernicus, say "Copernicus's expression is easy to read. It says that you are not his favourite person."

The star maps are scenery in the Entrance Hall. Understand "map" and "faded" and "wallpaper" as the star maps. The description of the star maps is "Charts of the northern sky, pasted edge to edge like wallpaper and faded to the colour of weak tea."

The reading text of the star maps is "The constellations are labelled in tiny copperplate. Someone has drawn a pencil line rising from the eastern horizon, marked with a date: tonight's."

Chapter 4 - The secret stair and the laboratory

[The hidden stair starts off-stage. 'To open the secret stair' is a phrase of our own, used by the red book's rule above. It puts the stair in the Library and joins the Library to the Laboratory on the map.]

The hidden stair is scenery. Understand "stairs" and "staircase" and "steps" and "stone" and "narrow" and "spiral" and "opening" and "passage" as the hidden stair. The description of the hidden stair is "Worn stone steps spiral down into the hill. A warm glow comes from below."

To open the secret stair:
	now the hidden stair is in the Library;
	now the Laboratory is mapped below the Library;
	now the Library is mapped above the Laboratory;
	increase the score by 1;
	say "You hook a finger over the top of the red book's spine. It tilts towards you, stops with a heavy click, and comes no further.[paragraph break]Somewhere behind the shelves a counterweight drops. With a groan of old hinges, a whole section of the bookcase swings inward, revealing a narrow stone stair spiralling down into the hill.[paragraph break]On the window seat, Copernicus opens both eyes."

Instead of climbing or entering the hidden stair, try going down.

The stone stair is scenery in the Laboratory. Understand "stairs" and "staircase" and "steps" as the stone stair. The description of the stone stair is "The stair spirals back up to the library."

Instead of climbing or entering the stone stair, try going up.
Instead of going outside when the player is in the Laboratory, try going up.

The brass orrery is scenery in the Laboratory. Understand "planets" and "stand" and "model" as the brass orrery. The description of the brass orrery is "A clockwork model of the solar system. Brass planets turn on long arms around a lamp-bright Sun, and one extra arm, newer than the rest, carries a tiny glass bead on a long, looping path."

Instead of turning or pushing or pulling the brass orrery, say "You nudge the crank. The planets whirr round, and the glass bead swings in close to the little Sun before looping away into the dark again."

The workbenches are scenery in the Laboratory. Understand "bench" and "workbench" and "lamps" and "lamp" and "shades" as the workbenches. The description of the workbenches is "Lenses, prisms, notebooks and a half-drunk cup of tea gone cold. The lamps hum softly."

The chalkboard is scenery in the Laboratory. Understand "board" and "blackboard" and "sums" and "chalk" as the chalkboard. The description of the chalkboard is "Rows of orbital calculations in your aunt's quick hand. They end in a single word, circled twice." The reading text of the chalkboard is "Period sixty-one years. Perihelion passed. Closest approach to Earth... and then, circled twice: [italic type]MIDNIGHT[roman type]. Beneath it, smaller: 'Clean the lens first!'"

Section 1 - The locked cabinet

[The cabinet is transparent, so the player can see what is inside before they can open it. The silver key from the hollow book unlocks it.]

The glass-fronted cabinet is a scenery container in the Laboratory. It is openable, closed, lockable, locked and transparent. Understand "glass" and "front" as the glass-fronted cabinet. The silver key unlocks the glass-fronted cabinet. The description of the glass-fronted cabinet is "A tall cabinet of dark wood with a glass front and a small silver lock shaped like a star. It is [if locked]locked[otherwise if open]open[otherwise]closed[end if]."

After unlocking the glass-fronted cabinet with something for the first time:
	increase the score by 1;
	continue the action.

The letter is in the glass-fronted cabinet. Understand "envelope" as the letter. The description of the letter is "A cream envelope addressed, in your aunt's hand, 'To whoever found the stair. I hope it was you.'"

The reading text of the letter is "[italic type]If you are reading this, you pulled the right book. I always meant to show you this room myself.[paragraph break]Sixty-one years ago I sat on this hill with my own aunt and watched the Lantern Comet come up out of the east, and I promised I would see it again. I may not manage it. You will have to see it for both of us.[paragraph break]The telescope will want its lens, and the lens will want a clean. Then look up.[paragraph break]With love,[line break]your aunt[roman type][paragraph break]Folded inside the letter is a pressed flower, long dried, the colour of starlight."

[When the player is carrying both keys, these rules help the game guess which key they mean.]

Does the player mean unlocking the iron door with the small brass key: it is very likely.
Does the player mean unlocking the glass-fronted cabinet with the silver key: it is very likely.

Chapter 5 - The telescope

[A container can hold things, so the lens can go in it. Making it scenery keeps it out of the automatic 'You can see' list, since the room description mentions it.]

The telescope is a scenery container in the Dome. The description of the telescope is "A long brass telescope on an iron mount. [if the glass lens is in the telescope]The lens sits snugly in its mount.[otherwise]The mount for the lens is empty.[end if]"

Check inserting something into the telescope:
	if the noun is not the glass lens, say "Only a lens belongs in the telescope's mount." instead.

After inserting the glass lens into the telescope:
	say "The lens clicks into the mount as if it had been waiting for you."

The night sky is a backdrop. It is in the Garden Path and the Dome. Understand "stars" and "star" and "heavens" and "comet" as the night sky. The description of the night sky is "[one of]Stars, more than you have ever seen at once.[or]The Plough, the Pole Star, and a smudge of light low in the east that might be something new.[or]Somewhere up there is a comet. To your naked eye it is only a hint.[stopping]"

Part 3 - New Actions

[Each new action needs a name, some grammar that the player can type, and rules saying what happens.]

Chapter 1 - Reading

[The Standard Rules treat READ as another word for EXAMINE. Here we cut that link so READ can be an action of its own, which prints a thing's reading text.]

Understand the command "read" as something new.

Reading is an action applying to one thing and requiring light. Understand "read [something]" as reading.

[Cutting the link also removed READ ABOUT, so we put it back. It is a form of the built-in consulting action, as in LOOK UP COMET IN ALMANAC. For any book, consulting simply reads it.]

Understand "read about [text] in [something]" as consulting it about (with nouns reversed).

Instead of consulting a book about something, try reading the noun.

Check reading something:
	if the reading text of the noun is empty, say "There's nothing to read on [the noun]." instead.

Report reading something:
	say "[reading text of the noun][paragraph break]".

[OPEN ALMANAC and so on mean the same as reading it.]

Instead of opening a book, try reading the noun.

[Typing READ on its own would otherwise make the parser guess what to read. We give it a gentle prompt instead.]

Reading vaguely is an action applying to nothing. Understand "read" as reading vaguely.

Report reading vaguely:
	say "What would you like to read? Try READ followed by the name of a book."

[When a name could mean more than one thing, these rules tell the parser what the player probably meant.]

Does the player mean reading a book: it is likely.
Does the player mean petting Copernicus: it is very likely.

Chapter 2 - Polishing

[POLISH, CLEAN and WIPE are already synonyms for RUB, so the lens puzzle uses the built-in rubbing action. We add a new action for RUB something WITH something.]

Rubbing it with is an action applying to two things. Understand "rub [something] with [something preferably held]" as rubbing it with.

Instead of rubbing something with the velvet cloth, try rubbing the noun.
Instead of rubbing something with something, say "That would only make matters worse."

Instead of rubbing the glass lens:
	if the glass lens is clean:
		say "It already gleams." instead;
	if the player does not carry the velvet cloth:
		say "Your sleeve would only add more smudges. Something soft and clean would do better." instead;
	now the glass lens is clean;
	increase the score by 1;
	say "You buff the lens with the velvet cloth until it is as clear as a drop of water."

Chapter 3 - Peering through things

Peering through is an action applying to one thing. Understand "peer through/into/in [something]" and "gaze through/into/in [something]" as peering through.

[LOOK THROUGH already means searching, so we send it here for the telescope.]

Instead of searching the telescope, try peering through the telescope.

Check peering through something:
	if the noun is not the telescope, say "You peer through [the noun], but the world looks much the same." instead.

Carry out peering through the telescope:
	if the glass lens is not in the telescope:
		say "Without its lens the telescope shows you only a dim, empty circle." instead;
	if the glass lens is smudged:
		say "Everything is a grey, greasy blur. That lens needs a clean." instead;
	increase the score by 1;
	say "You put your eye to the eyepiece and turn the brass wheel.[paragraph break]There it is. A blazing white head trailing a veil of blue fire across a field of stars, so close you could count the ripples in its tail. Somewhere below, Copernicus gives a single approving meow.";
	end the story finally saying "You have seen the comet".

Chapter 4 - Stargazing

Stargazing is an action applying to nothing. Understand "stargaze" as stargazing.

Carry out stargazing:
	if the player is in the Dome:
		try peering through the telescope;
	otherwise if the player is in the Garden Path:
		say "You tip your head back. [description of the night sky][line break]";
	otherwise:
		say "You'll need to be under the open sky, or under the dome."

Chapter 5 - Using things

Using is an action applying to one thing. Understand "use [something]" as using.

Instead of using the telescope, try peering through the telescope.
Instead of using the brass lantern, try switching on the brass lantern.
Instead of using the velvet cloth, say "Try polishing something with it."
Instead of using the small brass key, say "Try unlocking something with it."

Check using something:
	say "You'll need to be more specific about what to do with [the noun]." instead.

Chapter 6 - Petting the cat

Petting is an action applying to one thing. Understand "pet [something]" and "stroke [something]" and "scratch [something]" as petting.

Check petting something:
	if the noun is not Copernicus, say "[The noun] does not seem to appreciate it." instead.

Report petting:
	say "[one of]You scratch Copernicus behind the ears. He purrs like a small engine.[or]Copernicus stretches luxuriously and rolls over.[or]Copernicus permits this, for now.[stopping]"

Chapter 7 - Hints and a little fun

[An action 'out of world' doesn't take any game time.]

Asking for a hint is an action out of world applying to nothing. Understand "hint" and "hints" and "help" as asking for a hint.

Carry out asking for a hint:
	if the brass lantern is not handled:
		say "Have you looked in the potting shed?";
	otherwise if the brass lantern is not switched on and the small brass key is not handled:
		say "The cellar is dark. The lantern might help (try TURN ON LANTERN).";
	otherwise if the small brass key is not handled:
		say "Your aunt's notes mention a key on a hook in the cellar.";
	otherwise if the iron door is locked:
		say "The brass key looks like it would fit the iron door above the hall (try UNLOCK DOOR WITH KEY).";
	otherwise if the glass lens is not handled:
		say "A telescope needs a lens. Have you looked inside the library desk?";
	otherwise if the glass lens is smudged:
		say "That lens is too grubby to see through. Something soft might clean it (try POLISH LENS).";
	otherwise if the glass lens is not in the telescope:
		say "Put the lens in the telescope.";
	otherwise:
		say "Peer through the telescope!"

Instead of listening when the player is in the Garden Path, say "Crickets, and far away an owl asking the same question over and over."

Understand "xyzzy" or "abracadabra" as a mistake ("Magic words have no power here. Astronomy, on the other hand...").

[TEST ME plays the whole game, secrets included, for 6 of 6 points. TEST BOOKS tries the library books and some wrong turns. Both work only in the Inform app's testing builds.]

Test me with "hint / west / take lantern / turn on lantern / east / north / down / take key / up / east / x notebook / pet cat / read manual / open drawer / take lens / take cloth / polish lens / pull red book / take grey volume / open volume / down / unlock cabinet with silver key / open cabinet / take letter / read letter / up / west / unlock door with key / open door / up / put lens in telescope / look through telescope".

Test books with "north / east / x shelves / read shelves / read / read almanac / look up comet in almanac / read cat book / x red book / read volume / read volume / read desk / read cat / read notebook / take books / i / x red book / down / read chalkboard / x cabinet / open cabinet / turn orrery / up / west / read maps".
