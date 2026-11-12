"Keithwood" by Alan Joyce

[Inform 7 source is meant to read like English. Text in square brackets, like this, is a comment and is ignored by the compiler. Indented lines must use tabs.]

[This is a playable sketch of the yards around the house, built to try out the time-shifting idea from DESIGN.md. Things that are gone have left traces in the present: tire tracks on the gravel strip and the driveway, a slight mound in the front lawn, a post hole by the road, a hollow in the middle of the back yard. Looking closely at a trace, touching it or searching it brings back the thing that made it. What comes back is hazy, so it shifts each time you look at it, and it fades if you leave it alone.]

The story headline is "A house and its yards, then and now".
The release number is 1.
The story creation year is 2026.

When play begins:
	say "You haven't stood in this yard in years. The house looks smaller than you remember, and different: the colors, the plantings. But some things leave marks.[paragraph break][italic type](This is a short demo of the yards around the house. Things that are gone have left traces here. LOOK CLOSELY AT them, TOUCH them or SEARCH them, and see what comes back. Type HINT for help.)[roman type]".

Part 1 - Then and now

[The era is 'then' only while the whole past of the front yard is back at once. Descriptions can test it.]

Era is a kind of value. The eras are now and then.
The current era is an era that varies. The current era is now.

[A trace is a present-day mark left by something that is gone. A memory is the thing that made it. Each trace evokes exactly one memory.]

A trace is a kind of thing. A trace is usually scenery.
A memory is a kind of thing. A memory is usually scenery.

Evocation relates one trace to one memory. The verb to evoke means the evocation relation.

[A memory is hazy: it has several possible forms, listed in a table, and the form it shows changes each time you look. The previous form lets us say what it was a moment ago.]

A memory has a table name called the form table.
A memory has a number called the form. The form of a memory is usually 1.
A memory has a number called the previous form.
A memory has a number called the idle time.
A memory has a text called the arrival.
A memory has a text called the departure.
A memory has a text called the recollection.
A memory has a text called the plain name.

[How a memory looks from the next space over, as in 'To the east, your dad's car sits in the driveway.']

A memory has a text called the far view.

[Front yard memories together make the yard whole; the back yard has its own.]

A memory can be frontyard or backyard. A memory is usually frontyard.

[While a memory is gone, it is only "the car from the gravel strip" or "the old tree": its hazy forms show only once it is back.]

Rule for printing the name of a memory (called the haze) when the haze is off-stage:
	say "[plain name of the haze]".

Rule for printing the name of a memory (called the haze):
	say "[form name in row (form of the haze) of (form table of the haze)]".

To shift (haze - a memory):
	let count be the number of rows in the form table of the haze;
	if count is greater than 1:
		now the previous form of the haze is the form of the haze;
		let top be count - 1;
		let pick be a random number between 1 and top;
		if pick is at least the form of the haze, increase pick by 1;
		now the form of the haze is pick.

[Bringing a memory back: it appears in a random form, over the top of its trace.]

To recall (mark - a trace):
	let haze be a random memory evoked by the mark;
	if haze is in the location:
		try examining haze;
	otherwise:
		now the form of haze is a random number between 1 and the number of rows in the form table of haze;
		now the previous form of haze is 0;
		now the idle time of haze is 0;
		move haze to the location;
		say "[arrival of haze][paragraph break]".

[Memories fade after a few turns of being left alone. Looking at one, touching it or remembering it keeps it here.]

The fading limit is a number that varies. The fading limit is 8.

Every turn (this is the fading memories rule):
	let fading be a list of memories;
	repeat with haze running through on-stage memories:
		increase the idle time of haze by 1;
		if the idle time of haze is greater than the fading limit, add haze to fading;
	repeat with haze running through fading:
		if haze is in the location, say "[departure of haze][paragraph break]";
		now haze is nowhere.

[When everything that is gone from the front yard is back at the same moment, the yard slips fully into the past.]

Wholeness-seen is a truth state that varies.

Every turn (this is the whole yard rule):
	if every frontyard memory is on-stage:
		if the current era is now:
			now the current era is then;
			if wholeness-seen is false:
				now wholeness-seen is true;
				say "For a moment, all of it is here at once: your mom's [gravel car] on the gravel, your dad's [driveway car] in the driveway, the [lost tree] by the shrub, the orange mailbox back at the west end of the strip. The yard is the way it was, or close enough.[paragraph break]";
			otherwise:
				say "The yard is whole again, for a moment.[paragraph break]";
	otherwise:
		now the current era is now.

Part 2 - The map

[North is Keithwood Drive. The house faces it, so from the front lawn the garage wing is on your left (east) and the two-story part on your right (west). Each space in the yards is its own room. The rooms are grouped into two regions, the Front Yard and the Back Yard, so that rules and scenery can treat each yard as one place. The gate in the back yard fence is the only way between them.]

The Front Lawn is a room. The Front Lawn is north of Front Patio.
Under the Big Tree is a room. Under the Big Tree is west of the Front Lawn and northwest of Front Patio.
Eastern Approach is a room. The printed name of Eastern Approach is "Driveway". Eastern Approach is east of the Front Lawn and northeast of Front Patio.
Front Patio is a room.
West Side Yard is a room. West Side Yard is south of Under the Big Tree.

By the Back Door is a room.
By the Swing is a room. By the Swing is south of By the Back Door.
Southwest Corner is a room. Southwest Corner is south of By the Swing.
Middle of the Yard is a room. Middle of the Yard is east of By the Swing, southeast of By the Back Door and northeast of Southwest Corner.
Along the East Fence is a room. Along the East Fence is east of By the Back Door and northeast of Middle of the Yard.
East of Middle of the Yard is Along the East Fence.
By the Shed is a room. By the Shed is south of Along the East Fence, southeast of Middle of the Yard and east of Southwest Corner.

The Front Yard is a region. The Front Lawn, Under the Big Tree, Eastern Approach, Front Patio and West Side Yard are in the Front Yard.
The Back Yard is a region. By the Back Door, By the Swing, Southwest Corner, Middle of the Yard, Along the East Fence and By the Shed are in the Back Yard.

[The gate opens by itself when you walk through it.]

The back yard gate is a door. It is scenery. It is south of West Side Yard and north of By the Back Door. Understand "gate" and "fence gate" as the back yard gate. The description of the back yard gate is "A gate in the back yard fence, right next to the southwest corner of the house. It is [if open]open[otherwise]closed[end if]."

Before going through the back yard gate when the back yard gate is closed:
	say "(first opening the gate)[line break]";
	now the back yard gate is open.

[Ways that lead out of the yards, or into the house, which is for later.]

Instead of going north when the location is the Front Lawn or the location is Eastern Approach or the location is Under the Big Tree:
	say "Keithwood Drive runs past the bottom of the lawn. You're not ready to leave yet."

Instead of going nowhere:
	if the location is in the Back Yard, say "The fence closes the yard in that way." instead;
	say "That way lies the house, or the neighbors' yards. Everything you came for is closer."

Instead of going inside in Front Patio, try opening the front door.
Instead of going inside in By the Back Door, try opening the rear door.
Instead of going inside in Eastern Approach, try opening the garage.
Instead of going inside in By the Shed, try opening the garden shed.
Instead of going outside when the location is in the Front Yard, say "You're already outside. The road is to the north, past the bottom of the lawn."
Instead of going outside when the location is in the Back Yard, say "The gate is by the southwest corner of the house, north of the back door."

[Things you can see from one space but not reach: you'd have to go closer.]

A thing can be distant. A thing is usually not distant.

Before doing something other than examining, scrutinizing or remembering when the noun is distant:
	say "That's too far off from here. You'd have to go closer." instead.

[Each time you LOOK, anything hazy shifts.]

Before looking:
	repeat with haze running through memories in the location:
		shift haze.

[After the room description: memories you can see in the next space over, and the moment when the front yard is whole.]

After looking (this is the yard extras rule):
	let seen be 0;
	repeat with haze running through on-stage memories:
		let place be the location of haze;
		if place is not the location and place is adjacent to the location and the far view of haze is not "":
			let way be the best route from the location to place, using even locked doors;
			if seen is greater than 0, say " ";
			say "To the [way], [far view of haze].[no line break]";
			increase seen by 1;
	if seen is greater than 0, say "[paragraph break]";
	if the current era is then and the location is in the Front Yard:
		say "For a moment, the yard is the way it was.[paragraph break]".

Chapter 1 - Scenery shared across the yards

The house is a backdrop. It is everywhere. Understand "split-level" and "split" and "level" and "home" and "brick" and "siding" and "cream" and "red" and "wall" and "walls" as the house. The description of the house is "[if the location is in the Back Yard]The back of the house: cream siding and red brick, with the back door at the southwest corner.[otherwise]A split-level of red brick and cream siding, built in 1957. The low wing on the east holds the garage; the taller part on the west has the front door below and two shuttered windows above.[end if]"

The neighboring houses are a plural-named backdrop. They are everywhere. Understand "neighbor" and "neighbors" and "neighbour" and "neighbours" and "house" and "houses" and "homes" and "lots" as the neighboring houses. The description of the neighboring houses is "Houses stand on the lots on every side. Behind this one, big trees run along the back property line."

Does the player mean doing something to the neighboring houses: it is unlikely.

The road is a backdrop. It is in the Front Lawn, Under the Big Tree and Eastern Approach. Understand "street" and "keithwood" and "drive" as the road. The description of the road is "Keithwood Drive, running past the bottom of the lawn."

The power lines are a plural-named backdrop. They are in the Front Lawn, Under the Big Tree and Eastern Approach. Understand "wires" and "line" and "wire" as the power lines. The description of the power lines is "Power lines run overhead along the road."

The chimney is a backdrop. It is in the Front Lawn, Front Patio, Under the Big Tree and West Side Yard. The description of the chimney is "A brick chimney climbs the west end of the house."

The shutters are a plural-named backdrop. They are in the Front Lawn and Front Patio. Understand "shutter" and "upstairs" and "windows" and "dark red" as the shutters. The description of the shutters is "Dark red shutters frame the two upstairs windows."

The weeping shrub is a backdrop. It is in the Front Lawn and Front Patio. Understand "bush" and "shrub" as the weeping shrub. The description of the weeping shrub is "A weeping shrub beside the patio, its branches drooping to the ground."

The grass is a backdrop. It is in Under the Big Tree, Front Patio, West Side Yard, By the Back Door, By the Swing, Southwest Corner, Along the East Fence and By the Shed. Understand "lawn" and "yard" as the grass. The description of the grass is "Grass, a little long, the way it always was by the end of the week."

The yard fence is a backdrop. It is in Eastern Approach, West Side Yard, By the Back Door, By the Swing, Southwest Corner, Middle of the Yard, Along the East Fence and By the Shed. The printed name of the yard fence is "fence". Understand "fence" and "fences" as the yard fence. The description of the yard fence is "[if the location is Eastern Approach]Beyond the driveway, a fence closes off the side yard on the east side of the house.[otherwise if the location is West Side Yard]The back yard fence closes off the south end of the side yard, with a gate in it near the corner of the house.[otherwise if the location is Along the East Fence]The east fence runs along this side of the back yard. At the northeast corner it meets the fence that divides the back yard from the side yard beyond the driveway.[otherwise]A fence runs all the way around the back yard.[end if]"

Instead of climbing the yard fence, say "You're not here for the neighbors' yards."

Chapter 2 - The Front Lawn

[The starting space covers everything from the gravel strip along the road up to the edge of the patio.]

The description of the Front Lawn is "You stand on the front lawn, which slopes gently up from a strip of gravel along Keithwood Drive toward the house, a split-level of red brick and cream siding. Ahead of you, to the south, a small concrete patio leads past a weeping shrub to the front door. To the east, the low brick wing holds the garage, and a gravel driveway slopes down to it from the road. To the west, one of two enormous old trees spreads its branches over the lawn.[if the gravel car is in the Front Lawn][paragraph break]Down by the road, your mom's [gravel car] is parked on the gravel strip.[end if][if the old mailbox is in the Front Lawn][paragraph break]At the west end of the strip, the old orange mailbox stands on its post, where it used to be.[end if][if the lost tree is in the Front Lawn][paragraph break]A smaller tree, a [lost tree], stands a few feet north of the weeping shrub.[end if]"

The front grass is privately-named scenery in the Front Lawn. Understand "lawn" and "grass" and "yard" and "front" as the front grass. The description of the front grass is "A big lawn, sloping gently up from the road to the house. A few feet north of the weeping shrub, it rises in a slight mound."

The gravel strip is scenery in the Front Lawn. Understand "gravel" and "strip" and "pull-off" and "shoulder" as the gravel strip. The description of the gravel strip is "A strip of gravel along the edge of the road, wide enough for one car. Tire tracks are pressed into it, and at the west end there's a small square hole in the ground, half grown over."

The eastward view is privately-named distant scenery in the Front Lawn. The printed name of the eastward view is "driveway". Understand "driveway" and "gravel driveway" and "garage" and "garage door" and "wing" and "picture window" as the eastward view. The description of the eastward view is "The gravel driveway runs down to the garage on the east side of the lawn. You'd have to go east to see it properly."

The southward view is privately-named distant scenery in the Front Lawn. The printed name of the southward view is "patio". Understand "patio" and "concrete" and "front door" and "door" and "storm door" and "walk" and "path" as the southward view. The description of the southward view is "A small concrete patio leads up to the front door, just to the south."

The westward view is privately-named plural-named distant scenery in the Front Lawn. Understand "two" and "enormous" and "old" and "big" and "tree" and "trees" as the westward view. The printed name of the westward view is "big trees". The description of the westward view is "Two enormous old trees on the west side of the lawn: one just to the west, the other beyond it, beside the house."

Chapter 3 - Under the Big Tree

The description of Under the Big Tree is "One of the two enormous old trees stands here on the west side of the front lawn, its trunk too wide to get your arms around, its branches far over your head. The lawn runs east toward the patio and the driveway. To the south, the side yard runs down the west wall of the house, where the other big tree stands."

The great front tree is scenery in Under the Big Tree. Understand "big" and "enormous" and "old" and "tree" and "trunk" and "branches" and "bark" as the great front tree. The description of the great front tree is "Its trunk is too wide to get your arms around, and its lowest branches are far above your head."

Instead of climbing the great front tree, say "Its lowest branches are far above your head."

Chapter 4 - The driveway

The description of Eastern Approach is "A gravel driveway slopes down from Keithwood Drive to the garage, whose white door sits a little lower than the front patio. Above the door, a wide picture window is set in the brick of the low wing, with a coach light beside it. Round shrubs edge the driveway, and a mailbox stands right beside it on its eastern side. Beyond, a fence closes off the side yard to the east. The lawn lies to the west, and the patio to the southwest.[if the driveway car is in Eastern Approach][paragraph break]Your dad's [driveway car] sits in the driveway, nosed down toward the garage.[end if]"

The driveway is scenery in Eastern Approach. Understand "gravel driveway" and "gravel" as the driveway. The description of the driveway is "A gravel driveway slopes down from the road to the garage door, which sits a little lower than the front patio. There are tire marks in it, darker where cars stood."

The garage is scenery in Eastern Approach. Understand "garage door" and "door" and "wing" and "white" as the garage. The description of the garage is "The garage sits at the bottom of the low brick wing, its white door at the foot of the gravel driveway, a little lower than the front patio."

Instead of opening the garage, say "The garage door is shut, and it isn't yours to open anymore."

The picture window is scenery in Eastern Approach. Understand "wide" and "panes" and "pane" as the picture window. The description of the picture window is "A wide window of three panes, set in the brick above the garage door."

The coach light is scenery in Eastern Approach. Understand "lamp" and "lantern" as the coach light. The description of the coach light is "A coach light beside the garage door."

The round shrubs are plural-named scenery in Eastern Approach. Understand "row" and "bushes" and "shrubs" and "round" as the round shrubs. The description of the round shrubs is "A row of round shrubs edges the driveway."

The east side yard is distant scenery in Eastern Approach. Understand "side" and "yard" and "east" as the east side yard. The description of the east side yard is "The side yard on the east side of the house, past the driveway, behind its fence."

Chapter 5 - The mailbox

[The mailbox stands beside the driveway now. It used to stand at the west end of the gravel strip, and the hole its old post left behind is a trace.]

The mailbox is a closed openable scenery container in Eastern Approach. Understand "box" and "mail" as the mailbox. The description of the mailbox is "A mailbox on a post, right beside the driveway on its eastern side. Its little flag is down. It is [if open]open[otherwise]closed[end if]."

The little flag is part of the mailbox. Understand "red" as the little flag. The description of the little flag is "A little flag on the side of the mailbox. It's down."

Instead of pushing, pulling, turning or taking the little flag, say "You raise the little flag. There's nothing to send, so you put it down again."
Understand "raise [something]" and "lower [something]" as pulling.

After opening the mailbox for the first time:
	say "You open the mailbox. You half expect something to be waiting inside for you, the way something always is in the stories. It's empty."

Chapter 6 - The front patio

The description of Front Patio is "A small concrete patio in front of the house, a step higher than the garage door. The front door waits behind its storm door, with the weeping shrub drooping beside the patio. Above, dark red shutters frame the upstairs windows of the two-story part of the house. The lawn slopes down to the north; the driveway is to the northeast, and the big tree to the northwest."

The concrete patio is scenery in Front Patio. Understand "small" and "patio" and "walk" and "path" and "walkway" and "step" as the concrete patio. The description of the concrete patio is "A small concrete patio leading to the front door. It sits a little higher than the garage door."

The front door is scenery in Front Patio. Understand "storm door" and "storm" and "door" as the front door. The description of the front door is "The front door, behind a storm door, at the back of the small concrete patio."

Instead of opening or entering the front door, say "The front door can wait. For now, there's the yard."

Chapter 7 - The west side yard

The description of West Side Yard is "A strip of side yard runs along the west wall of the house, where bushes grow close against the brick and the chimney climbs to the roof. Another enormous old tree stands here, the second of the pair. To the south, the back yard fence closes the side yard off, with a gate in it near the corner of the house. The other big tree is to the north."

The house bushes are plural-named scenery in West Side Yard. Understand "bushes" and "bush" and "shrubs" and "shrub" as the house bushes. The description of the house bushes is "Bushes grow close along the west wall of the house."

The side yard tree is scenery in West Side Yard. Understand "big" and "enormous" and "old" and "large" and "tree" and "trunk" and "branches" and "second" and "other" as the side yard tree. The description of the side yard tree is "The second of the two enormous old trees, its branches spreading over the side yard and the roof."

Instead of climbing the side yard tree, say "Its lowest branches are far above your head."

Chapter 8 - The back yard

The description of By the Back Door is "Just inside the gate, at the southwest corner of the house. The back door is here, on the south side of the house. The back yard opens out to the south and southeast, with a fence running all the way around it, and along the back of the house the yard runs east toward the far fence."

The rear door is scenery in By the Back Door. The printed name of the rear door is "back door". Understand "back door" and "door" as the rear door. The description of the rear door is "The back door into the house, on its south side, at the southwest corner."

Instead of opening or entering the rear door, say "Not yet. The house can wait."

The description of By the Swing is "The west side of the back yard. A large tree stands here, and near it a standing bench swing, its frame planted in the grass. The middle of the yard lies to the east; the back door is to the north, and the corner of the yard to the south."

The swing tree is privately-named scenery in By the Swing. The printed name of the swing tree is "large tree". Understand "large" and "big" and "tree" and "trunk" and "branches" as the swing tree. The description of the swing tree is "A large tree on the west side of the back yard."

Instead of climbing the swing tree, say "Its lowest branches are far above your head."

The bench swing is an enterable scenery supporter in By the Swing. Understand "standing" and "frame" and "seat" and "swing" as the bench swing. The description of the bench swing is "A bench swing hung from its own standing frame."

Instead of swinging the bench swing, say "You push off with one foot. The swing creaks back and forth, and for a moment it's any summer evening at all."

The description of Southwest Corner is "The back yard's southwest corner, where the fences meet. Leaves have gathered here in a pile under a few trees. The swing is to the north, the middle of the yard to the northeast, and the shed is east along the back fence."

The leaf pile is scenery in Southwest Corner. Understand "leaf" and "leaves" and "pile" as the leaf pile. The description of the leaf pile is "A pile of leaves, drifted into the corner where the fences meet."

Instead of entering the leaf pile, say "You jump into the leaves. They crunch and scatter, and you lie there a minute looking up through the branches."
Instead of searching the leaf pile, say "Just leaves, and the damp smell under them."
Understand "jump in/into/on [something]" as entering.

The corner trees are plural-named scenery in Southwest Corner. Understand "tree" and "trees" as the corner trees. The description of the corner trees is "A few trees stand over the corner, dropping their leaves on the pile."

The description of Middle of the Yard is "The middle of the back yard, open lawn all around, except that right in the center the ground dips in a broad, shallow hollow where the grass grows thin. The swing is to the west, the back door to the northwest, the east fence to the east and the shed to the southeast.[if the spreading tree is in Middle of the Yard][paragraph break]Over the hollow stands the [spreading tree], low and wide, its branches nearly brushing the grass.[end if]"

The middle grass is privately-named scenery in Middle of the Yard. Understand "lawn" and "grass" and "yard" and "middle" and "center" as the middle grass. The description of the middle grass is "Open lawn, except for the hollow right in the center."

The description of Along the East Fence is "The east side of the back yard, running along the east fence up to the northeast corner, where it meets the fence that divides the back yard from the side yard beyond the driveway. The back door is west along the house, the middle of the yard southwest, and the shed south."

The far side yard is privately-named distant scenery in Along the East Fence. Understand "side" and "yard" and "east" as the far side yard. The printed name of the far side yard is "side yard". The description of the far side yard is "Over the dividing fence, the side yard on the east side of the house, past the driveway."

The description of By the Shed is "The back yard's southeast corner. Tall bushes crowd the fences here, and an old garden shed stands among them, its door shut. The east fence runs north, and the corner with the leaf pile is west along the back fence."

The garden shed is scenery in By the Shed. Understand "old" and "shed" and "door" as the garden shed. The description of the garden shed is "An old garden shed, its door shut."

Instead of opening or entering the garden shed, say "The shed door is stuck fast."

The tall bushes are plural-named scenery in By the Shed. Understand "bushes" and "bush" and "tall" and "shrubs" as the tall bushes. The description of the tall bushes is "Tall bushes, grown up against the fences around the shed."

Chapter 9 - The places where things were

[Looking closely at, searching or touching the surface a trace sits on finds the trace.]

Instead of searching the gravel strip, try searching the gravel tracks.
Instead of touching the gravel strip, try touching the gravel tracks.
Instead of searching the driveway, try searching the driveway tracks.
Instead of searching the front grass, try searching the mound.
Instead of searching the middle grass, try searching the hollow.

Chapter 10 - The traces

The gravel tracks are a privately-named plural-named trace in the Front Lawn. The printed name is "tire tracks in the gravel". Understand "tire" and "tracks" and "track" and "ruts" and "rut" and "marks" as the gravel tracks. Understand "tire/-- tracks/ruts/marks in/on the/-- gravel" and "gravel tracks/ruts" as the gravel tracks. The description of the gravel tracks is "[if the gravel car is in the location]The [gravel car] sits right on top of them.[otherwise]Two shallow ruts pressed into the gravel, the shape of tires that parked here for a long time. You'd have to look more closely to see more.[end if]"

The driveway tracks are a privately-named plural-named trace in Eastern Approach. The printed name is "tire marks on the driveway". Understand "tire" and "tracks" and "track" and "marks" and "mark" and "stain" and "stains" and "oil" as the driveway tracks. Understand "tire/-- tracks/marks in/on the/-- driveway" and "driveway tracks/marks" as the driveway tracks. The description of the driveway tracks is "[if the driveway car is in the location]The [driveway car] sits right on top of them.[otherwise]Faint tire marks run down the driveway toward the garage, and a darker stain shows where an engine once dripped. You'd have to look more closely to see more.[end if]"

The mound is a trace in the Front Lawn. The printed name is "slight mound in the lawn". Understand "slight" and "rise" and "hump" and "bump" and "stump" as the mound. The description of the mound is "[if the lost tree is in the location]The [lost tree] grows right out of it.[otherwise]A slight rise in the lawn, a few feet north of the weeping shrub. The grass over it is a little greener than the rest. You'd have to look more closely to see more.[end if]"

The post hole is a trace in the Front Lawn. The printed name is "small square hole at the west end of the strip". Understand "small" and "square" and "hole" and "west" and "end" and "post" and "dirt" as the post hole. The description of the post hole is "[if the old mailbox is in the location]The old mailbox's post stands right in it.[otherwise]A small square hole in the ground at the west end of the strip, half grown over with grass, the size a post would leave. You'd have to look more closely to see more.[end if]"

The hollow is a trace in Middle of the Yard. The printed name is "hollow in the middle of the yard". Understand "broad" and "shallow" and "dip" and "thin" and "bare" and "patch" and "center" and "centre" as the hollow. The description of the hollow is "[if the spreading tree is in the location]The [spreading tree] spreads right over it.[otherwise]A broad, shallow dip right in the center of the yard, the grass thin over it, as if something wide once kept the sun off. You'd have to look more closely to see more.[end if]"

The gravel tracks evoke the gravel car.
The driveway tracks evoke the driveway car.
The mound evokes the lost tree.
The post hole evokes the old mailbox.
The hollow evokes the spreading tree.

[Three ways to bring a memory back.]

Instead of searching a trace (called the mark):
	say "You crouch for a closer look at [the mark].[paragraph break]";
	recall the mark.

Instead of touching a trace (called the mark):
	say "You crouch and lay your hand on [the mark].[paragraph break]";
	recall the mark.

Scrutinizing is an action applying to one visible thing. Understand "look closely at [something]" and "look carefully at [something]" and "look closer at [something]" and "look at [something] closely" and "look at [something] carefully" and "examine [something] closely" and "examine [something] carefully" and "study [something]" and "inspect [something]" and "scrutinize [something]" and "scrutinise [something]" and "peer at [something]" as scrutinizing.

Check scrutinizing something which is not a trace:
	if the noun is the gravel strip, try searching the gravel tracks instead;
	if the noun is the driveway, try searching the driveway tracks instead;
	if the noun is the front grass, try searching the mound instead;
	if the noun is the middle grass, try searching the hollow instead;
	try examining the noun instead.

Carry out scrutinizing:
	try searching the noun.

Part 3 - What comes back

Chapter 1 - The cars

The gravel car is a privately-named memory. The form table of the gravel car is the Table of Mom's Cars. Understand "car" and "mom's" and "moms" and "mom" and "mother's" and "mother" and "station" and "wagon" and "dodge" and "wood" and "paneling" and "panelling" and "minivan" and "caravan" and "van" and "honda" and "fit" and "green" and "tan" and "silver" as the gravel car.

The plain name of the gravel car is "car from the gravel strip".
The far view of the gravel car is "your mom's [gravel car] is parked on the gravel strip by the road".
The arrival of the gravel car is "The gravel crunches, though nobody has moved. When you look up, a car is parked on the strip along the road, right over its own tracks: your mom's [gravel car], the way it almost always was."
The departure of the gravel car is "Your mom's [gravel car] fades like breath off a window. The gravel strip is empty again, except for the tracks."
The recollection of the gravel car is "Your mom's car, out here on the gravel strip, almost always. Which car it was depends on the year, and the years have run together."

Table of Mom's Cars
form name	form description
"green station wagon"	"A long green Dodge station wagon, its sides trimmed in wood paneling, its nose pointed down the road."
"tan minivan"	"A tan Dodge Caravan, boxy and practical, with its sliding door on the far side."
"silver Honda Fit"	"A small silver Honda Fit, tidy and upright, parked neatly on the gravel."

The driveway car is a privately-named memory. The form table of the driveway car is the Table of Dad's Cars. Understand "car" and "dad's" and "dads" and "dad" and "father's" and "father" and "volkswagen" and "vw" and "rabbit" and "rust" and "rusty" and "spots" and "honda" and "accord" and "hatchback" and "blue" and "green" and "tan" as the driveway car.

The plain name of the driveway car is "car from the driveway".
The far view of the driveway car is "your dad's [driveway car] sits in the driveway".
The arrival of the driveway car is "Something catches the light at the bottom of the driveway. Your dad's [driveway car] is parked down by the garage, as if it had never left."
The departure of the driveway car is "The [driveway car] thins and is gone, and the driveway is just a driveway again."
The recollection of the driveway car is "Your dad's car, down the driveway by the garage. There were a few over the years, and they won't stay sorted."

Table of Dad's Cars
form name	form description
"tan Volkswagen Rabbit"	"A tan Volkswagen Rabbit, big rust spots blooming on its side panels."
"blue Honda Accord"	"A blue Honda Accord hatchback. Or was it green? It's blue now, anyway."
"green Honda Accord"	"A green Honda Accord hatchback. Or was it blue? It's green now, anyway."

Chapter 2 - The old tree

[Nobody remembers what kind of tree it was, so it can be any of these. Crabapple may also be the species of the big tree in the back yard; it stays an option for both.]

The lost tree is a privately-named memory. The form table of the lost tree is the Table of Trees. Understand "tree" and "small" and "smaller" and "young" and "climbing" and "maple" and "birch" and "crabapple" and "branch" and "branches" and "trunk" and "bark" as the lost tree.

The plain name of the lost tree is "old tree".
The far view of the lost tree is "a [lost tree] stands on the lawn, a few feet north of the weeping shrub".
The arrival of the lost tree is "The grass over the mound stirs. Then there's a trunk where there was only lawn, and branches spreading overhead: the [lost tree] that stood a few feet from the weeping shrub. The one you used to climb."
The departure of the lost tree is "The [lost tree] goes, branch by branch, until there's only sky over the mound."
The recollection of the lost tree is "You climbed it once. A branch broke, and you fell. You remember the falling better than the tree."

Table of Trees
form name	form description
"maple tree"	"A young maple, its trunk forking low, close enough to the ground for a kid to get a foot into."
"birch tree"	"A slim birch, its white bark peeling in papery curls, its lower branches just within reach."
"crabapple tree"	"A crabapple, low and twisty, with branches that seem made for climbing."

Does the player mean doing something to the lost tree when the lost tree is in the location: it is very likely.
Does the player mean remembering the lost tree: it is very likely.

Instead of climbing the lost tree:
	now the idle time of the lost tree is 0;
	say "You reach for the lowest branch, and your stomach drops the way it did the day one broke under you. You let go."

Chapter 3 - The old mailbox

The old mailbox is a privately-named memory. The form table of the old mailbox is the Table of Old Mailboxes. Understand "old" and "orange" and "mailbox" and "box" and "mail" and "post" as the old mailbox.

The plain name of the old mailbox is "old mailbox".
The far view of the old mailbox is "the old orange mailbox stands at the west end of the gravel strip, where it used to be".
The arrival of the old mailbox is "The grass around the hole parts. A post rises out of it, and on top of the post an orange mailbox: right here at the west end of the gravel strip, where it used to be, not over by the driveway where it stands now."
The departure of the old mailbox is "The orange mailbox and its post sink back into the grass, and there's only the hole at the end of the strip."
The recollection of the old mailbox is "The orange mailbox used to stand here, at the west end of the gravel strip. Now a different one stands over by the driveway."

Table of Old Mailboxes
form name	form description
"orange mailbox"	"An orange mailbox on its post at the west end of the gravel strip, where it used to stand."

Does the player mean doing something to the old mailbox when the old mailbox is in the location: it is very likely.
Does the player mean remembering the old mailbox when the player is in the Front Lawn: it is very likely.

Chapter 4 - The spreading tree

[The big, low, spreading tree that stood in the middle of the back yard. It may have been a crabapple; nobody is sure.]

The spreading tree is a privately-named backyard memory. The form table of the spreading tree is the Table of Spreading Trees. Understand "tree" and "low" and "wide" and "spreading" and "great" and "crabapple" and "branch" and "branches" and "trunk" and "nest" as the spreading tree.

The plain name of the spreading tree is "big tree in the middle of the yard".
The far view of the spreading tree is "the [spreading tree] stands low and wide over the middle of the yard".
The arrival of the spreading tree is "The thin grass in the hollow darkens with shade. Branches come down around you, low and wide, nearly brushing the lawn: the [spreading tree] that filled the middle of the yard."
The departure of the spreading tree is "The [spreading tree] lifts away, branch by branch, and the sun comes back into the hollow."
The recollection of the spreading tree is "You had to duck and push the branches aside to get to the trunk. Then you could step right into it, like a nest."

Table of Spreading Trees
form name	form description
"crabapple tree"	"A very large, low crabapple, its branches spreading wide and dipping almost to the grass all around."
"spreading tree"	"A very large, low tree, spreading wide in every direction. Maybe a crabapple; you never knew for sure."

Does the player mean doing something to the spreading tree when the spreading tree is in the location: it is very likely.
Does the player mean remembering the spreading tree when the player is in Middle of the Yard: it is very likely.

Instead of entering or climbing the spreading tree:
	now the idle time of the spreading tree is 0;
	say "You duck, push the low branches aside and step in toward the trunk. Inside, the branches close around you like the walls of a nest, and the yard goes green and quiet."

Chapter 5 - Looking at a memory

[Every look shifts a hazy memory to another of its forms, and keeps it from fading.]

Instead of examining a memory (called the haze):
	shift the haze;
	now the idle time of the haze is 0;
	if the previous form of the haze is greater than 0:
		say "[form description in row (form of the haze) of (form table of the haze)] Wasn't it a [form name in row (previous form of the haze) of (form table of the haze)] a moment ago?";
	otherwise:
		say "[form description in row (form of the haze) of (form table of the haze)][line break]".

Instead of scrutinizing a memory, try examining the noun.
Instead of searching a memory, try examining the noun.

Instead of touching a memory (called the haze):
	now the idle time of the haze is 0;
	say "Your hand passes through the [haze] as if through morning mist. When you take it back, the [haze] is still there."

Before doing something other than examining, scrutinizing, searching, touching, remembering, climbing, entering, smelling or listening to when the noun is a memory:
	say "You can't. It's only a memory, and it barely holds still long enough to look at." instead.

Instead of entering a memory, say "You can't. It's only a memory, and it barely holds still long enough to look at."

Part 4 - Remembering

[REMEMBER works on anything in the yards. On a trace it brings the memory back; on a memory it tells you what it meant.]

Remembering is an action applying to one visible thing. Understand "remember [any thing]" and "recall [any thing]" as remembering.

Does the player mean remembering something which is in the location: it is likely.

Carry out remembering:
	if the noun is a trace:
		recall the noun;
	otherwise if the noun is a memory:
		if the noun is in the location:
			now the idle time of the noun is 0;
			say "[recollection of the noun][line break]";
		otherwise if the noun is on-stage:
			say "You'd have to go closer.";
		otherwise:
			say "It's there at the edge of things, but it won't come on its own. Something in the yard might bring it back.";
	otherwise if the noun is the gravel strip:
		recall the gravel tracks;
	otherwise if the noun is the driveway:
		recall the driveway tracks;
	otherwise if the noun is the front grass:
		recall the mound;
	otherwise if the noun is the middle grass:
		recall the hollow;
	otherwise if the noun is distant:
		say "It's too far off. You'd have to go closer.";
	otherwise:
		say "Nothing in particular comes back. Not about that."

Remembering vaguely is an action applying to nothing. Understand "remember" and "recall" as remembering vaguely.

Carry out remembering vaguely:
	say "The yards are full of things that aren't here anymore. Some of them left marks: in the gravel, on the driveway, in the front lawn, at the end of the gravel strip, in the middle of the back yard."

Part 5 - Help and polish

Asking for a hint is an action out of world applying to nothing. Understand "hint" and "hints" and "help" and "about" as asking for a hint.

Carry out asking for a hint:
	say "Things that are gone have left traces in the yards: marks in the gravel and a hole at the west end of the strip by the road, a rise in the front lawn, marks on the driveway, a hollow in the middle of the back yard. LOOK CLOSELY AT a trace, or TOUCH or SEARCH it, to bring back what made it.[paragraph break]What comes back is hazy. Look at it more than once and it may not be what it was. REMEMBER something to hear what it meant to you. Memories fade if you leave them alone for a while.[paragraph break]The front yard is all around the front lawn where you start. The back yard is through the gate at the south end of the west side yard."

[If the player asks for something that's gone, say so, rather than 'You can't see any such thing.']

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "car/cars/wagon/minivan/van/rabbit/accord/fit/volkswagen/honda/dodge/caravan/hatchback":
	if the gravel car is on-stage or the driveway car is on-stage:
		say "You'd have to go closer to see it properly.";
	otherwise:
		say "There's no car here now. There are only the marks where cars used to park."

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "maple/birch/crabapple/trunk/branch/branches/bark/nest":
	if the lost tree is on-stage or the spreading tree is on-stage:
		say "You'd have to go closer to see it properly.";
	otherwise if the player is in the Front Lawn:
		say "There's no such tree here now. Only a slight rise in the lawn, a few feet north of the weeping shrub.";
	otherwise if the player is in Middle of the Yard:
		say "There's no such tree here now. Only a hollow in the middle of the lawn.";
	otherwise:
		say "There's no such tree here now."

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "tree/trees" and (the lost tree is on-stage or the spreading tree is on-stage):
	say "You'd have to go closer to see it properly."

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "mailbox/box/flag/post" and the player is in the Front Lawn:
	say "The mailbox isn't down here anymore. It stands over by the driveway now, though the west end of the strip still remembers where it used to be."

Test front with "x mailbox / x driveway / open door / x gravel / look closely at gravel / x car / remember car / touch hole / x old mailbox / touch mound / x maple / climb tree / remember tree / x car / east / search driveway / x dad's car / x mailbox / open mailbox / raise flag / look / southwest / x front door / open front door / x shrub / northwest / x tree / climb tree / south / x bushes / x chimney".

Test back with "gonear side yard tree / south / x back door / open back door / south / x swing / sit on swing / swing swing / x tree / south / x leaves / jump in leaves / northeast / x hollow / touch hollow / x tree / x tree / enter tree / remember tree / look / east / x fence / x side yard / south / x shed / open shed / x bushes / west / north / north / north / look".

Test me with "test front / test back".
