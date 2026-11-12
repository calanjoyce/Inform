"Lantern Hill" by "Claude"

[Inform 7 source is meant to read like English. Text in square brackets, like this, is a comment and is ignored by the compiler. Indented lines must use tabs.]

The story headline is "A small Inform 7 demonstration".
The story genre is "Fantasy".
The release number is 1.

Use scoring.
The maximum score is 4.

When play begins:
	say "Your aunt, the astronomer, left you three things in her will: her old observatory on Lantern Hill, a note reading 'Watch for the comet tonight,' and absolutely no instructions.[paragraph break]The comet passes at midnight. The telescope, you are told, has not worked in years."

Part 1 - The Map

[Rooms are declared simply by naming them. Quoted text right after a room becomes its description.]

The Garden Path is a room. "Gravel crunches underfoot as the path winds up Lantern Hill to the old observatory, its copper dome dark against the first stars. A crooked potting shed leans against the hedge to the west. The observatory door stands open to the north."

The Potting Shed is west of the Garden Path. "Clay pots, tangled twine and the earthy smell of last summer's tomatoes. [first time]Someone has tidied a single shelf, as if expecting a visitor. [only]The garden lies back east."

The Entrance Hall is north of the Garden Path. "A tall, echoing hall papered with faded star maps. A spiral staircase climbs to a small iron door above, a narrow stair drops into the cellar, and an archway to the east opens on the library. The garden is back south."

The Library is east of the Entrance Hall. "Floor-to-ceiling shelves of almanacs and star atlases. A heavy reading desk sits beneath the window, and the hall lies back to the west."

The Cellar is below the Entrance Hall. The Cellar is dark. "A low, damp cellar smelling of candle wax and old coal. Stone steps lead back up to the hall."

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

Chapter 3 - The telescope

[A container can hold things, so the lens can go in it. Making it scenery keeps it out of the automatic 'You can see' list, since the room description mentions it.]

The telescope is a scenery container in the Dome. The description of the telescope is "A long brass telescope on an iron mount. [if the glass lens is in the telescope]The lens sits snugly in its mount.[otherwise]The mount for the lens is empty.[end if]"

Check inserting something into the telescope:
	if the noun is not the glass lens, say "Only a lens belongs in the telescope's mount." instead.

After inserting the glass lens into the telescope:
	say "The lens clicks into the mount as if it had been waiting for you."

The night sky is a backdrop. It is in the Garden Path and the Dome. Understand "stars" and "star" and "heavens" and "comet" as the night sky. The description of the night sky is "[one of]Stars, more than you have ever seen at once.[or]The Plough, the Pole Star, and a smudge of light low in the east that might be something new.[or]Somewhere up there is a comet. To your naked eye it is only a hint.[stopping]"

Part 3 - New Actions

[Each new action needs a name, some grammar that the player can type, and rules saying what happens.]

Chapter 1 - Polishing

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

Chapter 2 - Peering through things

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

Chapter 3 - Stargazing

Stargazing is an action applying to nothing. Understand "stargaze" as stargazing.

Carry out stargazing:
	if the player is in the Dome:
		try peering through the telescope;
	otherwise if the player is in the Garden Path:
		say "You tip your head back. [description of the night sky][line break]";
	otherwise:
		say "You'll need to be under the open sky, or under the dome."

Chapter 4 - Using things

Using is an action applying to one thing. Understand "use [something]" as using.

Instead of using the telescope, try peering through the telescope.
Instead of using the brass lantern, try switching on the brass lantern.
Instead of using the velvet cloth, say "Try polishing something with it."
Instead of using the small brass key, say "Try unlocking something with it."

Check using something:
	say "You'll need to be more specific about what to do with [the noun]." instead.

Chapter 5 - Petting the cat

Petting is an action applying to one thing. Understand "pet [something]" and "stroke [something]" and "scratch [something]" as petting.

Check petting something:
	if the noun is not Copernicus, say "[The noun] does not seem to appreciate it." instead.

Report petting:
	say "[one of]You scratch Copernicus behind the ears. He purrs like a small engine.[or]Copernicus stretches luxuriously and rolls over.[or]Copernicus permits this, for now.[stopping]"

Chapter 6 - Hints and a little fun

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

Test me with "hint / west / take lantern / turn on lantern / east / north / down / take key / up / east / x notebook / pet cat / open drawer / take lens / take cloth / polish lens / west / unlock door with key / open door / up / put lens in telescope / look through telescope".
