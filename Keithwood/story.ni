"Keithwood"

[Inform 7 source is meant to read like English. Text in square brackets, like this, is a comment and is ignored by the compiler. Indented lines must use tabs.]

[This is a first playable sketch of the front yard, built to try out the time-shifting idea from DESIGN.md. Things that are gone have left traces in the present: tire tracks on the gravel strip and the driveway, and a slight mound in the lawn. Looking closely at a trace, touching it or searching it brings back the thing that made it. What comes back is hazy, so it shifts each time you look at it, and it fades if you leave it alone.]

The story headline is "A front yard, then and now".
The release number is 1.
The story creation year is 2026.

When play begins:
	say "You haven't stood in this yard in years. The house looks smaller than you remember, and different: the colors, the plantings. But some things leave marks.[paragraph break][italic type](This is a short demo of one room. Things that are gone have left traces here. LOOK CLOSELY AT them, TOUCH them or SEARCH them, and see what comes back. Type HINT for help.)[roman type]".

Part 1 - Then and now

[The era is 'then' only while the whole past is back at once. Descriptions can test it.]

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

[While a memory is gone, it is only "the car from the gravel strip" or "the old tree": its hazy forms show only once it is back.]

Rule for printing the name of a memory (called the haze) when the haze is not in the location:
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
	repeat with haze running through memories in the location:
		increase the idle time of haze by 1;
		if the idle time of haze is greater than the fading limit, add haze to fading;
	repeat with haze running through fading:
		say "[departure of haze][paragraph break]";
		now haze is nowhere.

[When everything that is gone is back at the same moment, the yard slips fully into the past.]

Wholeness-seen is a truth state that varies.

Every turn (this is the whole yard rule):
	if every memory is in the location:
		if the current era is now:
			now the current era is then;
			if wholeness-seen is false:
				now wholeness-seen is true;
				say "For a moment, all of it is here at once: your mom's [gravel car] on the gravel, your dad's [driveway car] in the driveway, the [lost tree] by the shrub. The yard is the way it was, or close enough.[paragraph break]";
			otherwise:
				say "The yard is whole again, for a moment.[paragraph break]";
	otherwise:
		now the current era is now.

Part 2 - The Front Yard

The Front Yard is a room. "The lawn slopes gently up from Keithwood Drive toward the house, a split-level of red brick and cream siding. To your left, a low brick wing holds the garage, with a wide picture window set above its door, and the driveway slopes down to it from the road, for the garage sits a little below the level of the yard. To your right rises the two-story part of the house: dark red shutters frame the upstairs windows, and a brick chimney climbs the far end. A paved walk leads from the driveway past a weeping shrub to the front door. Two enormous old trees shade the lawn to the west, and a strip of gravel runs along the edge of the road.[if the gravel car is in the Front Yard][paragraph break]Your mom's [gravel car] is parked on the gravel strip.[end if][if the driveway car is in the Front Yard][paragraph break]Your dad's [driveway car] sits in the driveway, nosed down toward the garage.[end if][if the lost tree is in the Front Yard][paragraph break]A smaller tree, a [lost tree], stands a few feet north of the weeping shrub.[end if][if the current era is then][paragraph break]For a moment, the yard is the way it was.[end if]"

[Each time you LOOK, anything hazy shifts.]

Before looking:
	repeat with haze running through memories in the location:
		shift haze.

[The rest of the house is for later rooms. For now, the yard is all there is.]

Instead of going north in the Front Yard, say "Keithwood Drive runs past the bottom of the lawn. You're not ready to leave yet."
Instead of going south in the Front Yard, say "The front door can wait. For now, there's the yard."
Instead of going inside in the Front Yard, try going south.
Instead of going outside in the Front Yard, try going north.
Instead of going nowhere from the Front Yard, say "The yard runs on a little that way, but everything you came for is here."

Chapter 1 - The house

The house is scenery in the Front Yard. Understand "split-level" and "split" and "level" and "home" and "brick" and "siding" and "cream" and "red" as the house. The description of the house is "A split-level of red brick and cream siding, built in 1957. The low wing on the left holds the garage; the taller part on the right has the front door below and two shuttered windows above."

The garage is scenery in the Front Yard. Understand "garage door" and "door" and "wing" and "white" as the garage. The description of the garage is "The garage sits at the bottom of the low brick wing, sunk a little below the level of the yard, its white door at the foot of the driveway."

The picture window is scenery in the Front Yard. Understand "wide" and "panes" and "pane" as the picture window. The description of the picture window is "A wide window of three panes, set in the brick above the garage door."

The front door is scenery in the Front Yard. Understand "storm door" and "storm" as the front door. The description of the front door is "The front door, behind a storm door, at the end of the paved walk."

The shutters are plural-named scenery in the Front Yard. Understand "shutter" and "upstairs" and "windows" and "dark red" as the shutters. The description of the shutters is "Dark red shutters frame the two upstairs windows."

The chimney is scenery in the Front Yard. The description of the chimney is "A brick chimney climbs the far end of the house."

The coach light is scenery in the Front Yard. Understand "lamp" and "lantern" as the coach light. The description of the coach light is "A coach light beside the garage door."

The paved walk is scenery in the Front Yard. Understand "path" and "walkway" as the paved walk. The description of the paved walk is "A paved walk leads from the driveway along the front of the house to the door."

The weeping shrub is scenery in the Front Yard. Understand "bush" as the weeping shrub. The description of the weeping shrub is "A weeping shrub by the front walk, its branches drooping to the ground."

The round shrubs are plural-named scenery in the Front Yard. Understand "row" and "bushes" and "shrubs" and "foundation" as the round shrubs. The description of the round shrubs is "A row of round shrubs edges the driveway, and more shrubs line the foundation of the house."

The big trees are plural-named scenery in the Front Yard. Understand "two" and "enormous" and "old" and "tree" and "trees" and "shade" as the big trees. The description of the big trees is "Two enormous old trees on the west side of the lawn, their branches far above your head."

Instead of climbing the big trees, say "Their lowest branches are far above your head."

The power lines are plural-named scenery in the Front Yard. Understand "wires" and "line" and "wire" as the power lines. The description of the power lines is "Power lines run overhead along the road."

The road is scenery in the Front Yard. Understand "street" and "keithwood" and "drive" as the road. The description of the road is "Keithwood Drive, running past the bottom of the lawn."

Chapter 2 - The places where things were

The lawn is scenery in the Front Yard. Understand "grass" and "yard" as the lawn. The description of the lawn is "A big lawn, sloping gently up from the road to the house. A few feet north of the weeping shrub, it rises in a slight mound."

The gravel strip is scenery in the Front Yard. Understand "gravel" and "pull-off" and "shoulder" as the gravel strip. The description of the gravel strip is "A strip of gravel along the edge of the road, wide enough for one car. Tire tracks are pressed into it."

The driveway is scenery in the Front Yard. The description of the driveway is "The driveway slopes down from the road to the garage, which sits a little below the level of the yard. There are tire marks on it, darker where cars stood."

[Looking closely at, searching or touching the surface a trace sits on finds the trace.]

Instead of searching the gravel strip, try searching the gravel tracks.
Instead of searching the driveway, try searching the driveway tracks.
Instead of searching the lawn, try searching the mound.

Chapter 3 - The traces

The gravel tracks are a privately-named plural-named trace in the Front Yard. The printed name is "tire tracks in the gravel". Understand "tire" and "tracks" and "track" and "ruts" and "rut" and "marks" as the gravel tracks. Understand "tire/-- tracks/ruts/marks in/on the/-- gravel" and "gravel tracks/ruts" as the gravel tracks. The description of the gravel tracks is "[if the gravel car is in the location]The [gravel car] sits right on top of them.[otherwise]Two shallow ruts pressed into the gravel, the shape of tires that parked here for a long time. You'd have to look more closely to see more.[end if]"

The driveway tracks are a privately-named plural-named trace in the Front Yard. The printed name is "tire marks on the driveway". Understand "tire" and "tracks" and "track" and "marks" and "mark" and "stain" and "stains" and "oil" as the driveway tracks. Understand "tire/-- tracks/marks in/on the/-- driveway" and "driveway tracks/marks" as the driveway tracks. The description of the driveway tracks is "[if the driveway car is in the location]The [driveway car] sits right on top of them.[otherwise]Faint tire marks run down the driveway toward the garage, and a darker stain shows where an engine once dripped. You'd have to look more closely to see more.[end if]"

The mound is a trace in the Front Yard. The printed name is "slight mound in the lawn". Understand "slight" and "rise" and "hump" and "bump" and "stump" as the mound. The description of the mound is "[if the lost tree is in the location]The [lost tree] grows right out of it.[otherwise]A slight rise in the lawn, a few feet north of the weeping shrub. The grass over it is a little greener than the rest. You'd have to look more closely to see more.[end if]"

The gravel tracks evoke the gravel car.
The driveway tracks evoke the driveway car.
The mound evokes the lost tree.

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
	if the noun is the lawn, try searching the mound instead;
	try examining the noun instead.

Carry out scrutinizing:
	try searching the noun.

Part 3 - What comes back

Chapter 1 - The cars

The gravel car is a privately-named memory. The form table of the gravel car is the Table of Mom's Cars. Understand "car" and "mom's" and "moms" and "mom" and "mother's" and "mother" and "station" and "wagon" and "dodge" and "wood" and "paneling" and "panelling" and "minivan" and "caravan" and "van" and "honda" and "fit" and "green" and "tan" and "silver" as the gravel car.

The plain name of the gravel car is "car from the gravel strip".
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
The arrival of the driveway car is "Something catches the light at the bottom of the driveway. Your dad's [driveway car] is parked down by the garage, as if it had never left."
The departure of the driveway car is "The [driveway car] thins and is gone, and the driveway is just a driveway again."
The recollection of the driveway car is "Your dad's car, down the driveway by the garage. There were a few over the years, and they won't stay sorted."

Table of Dad's Cars
form name	form description
"tan Volkswagen Rabbit"	"A tan Volkswagen Rabbit, big rust spots blooming on its side panels."
"blue Honda Accord"	"A blue Honda Accord hatchback. Or was it green? It's blue now, anyway."
"green Honda Accord"	"A green Honda Accord hatchback. Or was it blue? It's green now, anyway."

Chapter 2 - The old tree

[Nobody remembers what kind of tree it was, so it can be any of these. Only maple and birch come from the design notes; crabapple is a placeholder.]

The lost tree is a privately-named memory. The form table of the lost tree is the Table of Trees. Understand "tree" and "small" and "smaller" and "young" and "climbing" and "maple" and "birch" and "crabapple" and "branch" and "branches" and "trunk" and "bark" as the lost tree.

The plain name of the lost tree is "old tree".
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

Chapter 3 - Looking at a memory

[Every look shifts a hazy memory to another of its forms, and keeps it from fading.]

Instead of examining a memory (called the haze):
	shift the haze;
	now the idle time of the haze is 0;
	say "[form description in row (form of the haze) of (form table of the haze)][if the previous form of the haze is greater than 0] Wasn't it a [form name in row (previous form of the haze) of (form table of the haze)] a moment ago?[end if]".

Instead of scrutinizing a memory, try examining the noun.
Instead of searching a memory, try examining the noun.

Instead of touching a memory (called the haze):
	now the idle time of the haze is 0;
	say "Your hand passes through the [haze] as if through morning mist. When you take it back, the [haze] is still there."

Before doing something other than examining, scrutinizing, searching, touching, remembering, climbing, smelling or listening to when the noun is a memory:
	say "You can't. It's only a memory, and it barely holds still long enough to look at." instead.

Part 4 - Remembering

[REMEMBER works on anything in the yard. On a trace it brings the memory back; on a memory it tells you what it meant.]

Remembering is an action applying to one visible thing. Understand "remember [any thing]" and "recall [any thing]" as remembering.

Does the player mean remembering something which is in the location: it is likely.

Carry out remembering:
	if the noun is a trace:
		recall the noun;
	otherwise if the noun is a memory:
		if the noun is in the location:
			now the idle time of the noun is 0;
			say "[recollection of the noun][line break]";
		otherwise:
			say "It's there at the edge of things, but it won't come on its own. Something in the yard might bring it back.";
	otherwise if the noun is the gravel strip:
		recall the gravel tracks;
	otherwise if the noun is the driveway:
		recall the driveway tracks;
	otherwise if the noun is the lawn:
		recall the mound;
	otherwise:
		say "Nothing in particular comes back. Not about that."

Remembering vaguely is an action applying to nothing. Understand "remember" and "recall" as remembering vaguely.

Carry out remembering vaguely:
	say "The yard is full of things that aren't here anymore. Some of them left marks: in the gravel, on the driveway, in the lawn."

Part 5 - Help and polish

Asking for a hint is an action out of world applying to nothing. Understand "hint" and "hints" and "help" and "about" as asking for a hint.

Carry out asking for a hint:
	say "Things that are gone have left traces in the yard: marks in the gravel, marks on the driveway, a rise in the lawn. LOOK CLOSELY AT a trace, or TOUCH or SEARCH it, to bring back what made it.[paragraph break]What comes back is hazy. Look at it more than once and it may not be what it was. REMEMBER something to hear what it meant to you. Memories fade if you leave them alone for a while."

[If the player asks for something that's gone, say so, rather than 'You can't see any such thing.']

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "car/cars/wagon/minivan/van/rabbit/accord/fit/volkswagen/honda/dodge/caravan/hatchback":
	say "There's no car here now. There are only the marks where cars used to park."

Rule for printing a parser error when the latest parser error is the can't see any such thing error and the player's command includes "maple/birch/crabapple/trunk/branch/branches/bark":
	say "There's no such tree here now. Only a slight rise in the lawn, a few feet north of the weeping shrub."

Test me with "look / x gravel / x tire tracks in the gravel / look closely at gravel / x car / x car / remember car / touch mound / x maple / x birch / climb tree / remember tree / search driveway / x dad's car / x dad's car / look / take car / touch car / wait / wait / wait / wait / wait / wait / wait / look".
