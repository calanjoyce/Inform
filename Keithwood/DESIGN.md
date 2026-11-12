# Keithwood: design notes

## Premise

An Inform 7 game set in my childhood home on Keithwood Drive, explored in great detail. The core idea is layering the past on top of the present: the house as it is now, with memories surfacing through it.

## Setting facts

- Built in 1957: a split-level of red brick and cream siding, three bedrooms, two full baths, about 1,600 sq ft, a full basement, on a little over half an acre (public records).
- The only photos online are two Street View captures of the front, from 2023 and 2025, so current colors and plantings may differ from my memories.
- Behind the house it isn't woods: several more large trees stand along the back property line, and there are homes on all the surrounding lots.

## Memory mechanics

- **Past and present:** one map, with an era switch (now or then) that room and object descriptions check, so the same place reads differently in each era.
- **Remembering:** a REMEMBER verb that brings up what a thing meant to you, even while the game stays in the present.
- **What's gone:** things that no longer exist leave a trace in the present, so a player can find them and remember them.
- **Hazy memories:** details that aren't clear in memory shift each time you look (a maple one moment, a birch the next). Open question: does a hazy detail settle once its memory firms up, or stay unknowable?

### How this might look in Inform 7

- An era variable (now or then) that descriptions test with `[if era is then]...[otherwise]...[end if]`.
- A "memory" text property on things, printed by the REMEMBER verb.
- Present-day stand-ins for things that are gone (a mound in the lawn for the old tree), each carrying the memory of what used to be there.
- Hazy details as `[one of]maple[or]birch[or]...[at random]` in the printed name and description, with every candidate word listed in an Understand line so the player can refer to it by any of them. An optional switch could let the detail settle on one value once the memory firms up.

## Rooms

### Front Yard

Draft from Street View, to correct from memory:

> The lawn slopes gently up from Keithwood Drive toward the house, a split-level of red brick and cream siding. To your left, a low brick wing holds the garage, with a wide picture window set above its door. To your right rises the two-story part of the house: dark red shutters frame the upstairs windows, and a brick chimney climbs the far end. A paved walk leads from the driveway past a weeping shrub to the front door. Two enormous old trees shade the lawn to the west.

Corrections from memory:

- The garage sits slightly sunken below the level of the yard, so the driveway slopes down from Keithwood Drive to it.
- The driveway is gravel.
- A small concrete patio sits directly in front of you as you face the house, leading to the front door. The garage door is slightly lower than the patio.

**Then:** a smaller tree stood a few feet north of the shrub, long since cut down. You once climbed it and fell when a branch broke. Its species is hazy, so it shifts each time you look.

**Now:** a slight mound in the lawn marks where it stood.

**The family cars:** the cars span the years, so they suit the hazy-memory idea: the car parked in each spot can shift among these each time you look.

- **Gravel strip along the road:** where one of our cars was usually parked, almost always my mom's car. Could be a green Dodge station wagon with wood paneling; a tan Dodge Caravan minivan; a silver Honda Fit.
- **Driveway leading to the garage:** where my dad's cars would be. Could be a tan Volkswagen Rabbit with big rust spots on the side panels; a blue (or maybe green) Honda Accord hatchback.

**The mailbox:** it stands right next to the eastern edge of the driveway now. It used to be at the western edge of the gravel strip, so it's another memory shift (see Gravel Strip).

**Examinable:** the house, garage door, picture window, front door, shutters, chimney, walk, driveway, weeping shrub, the two big trees, the lawn, the gravel strip along the road.

Other details seen in Street View that could be added: a coach light beside the garage, a storm door on the front door, a row of round shrubs edging the driveway, foundation shrubs along the house, and power lines overhead.

### Gravel Strip

The gravel strip along the road is its own location, north of the front yard, even though it's narrow. My mom's car was almost always parked here (the car list is under Front Yard).

**Now:** tire tracks in the gravel.

**The mailbox:** every interactive game needs a mailbox outside the starting house. This one used to stand at the western edge of the gravel strip; now it's right next to the eastern edge of the driveway. In the demo, a small square post hole at the strip's west end (a placeholder trace) brings back the old mailbox where it stood.

### Back Yard

Not in the game yet.

**Layout:** a fence runs around the back yard, with a gate in it right next to the southwest corner of the house. The back door into the house is also at the southwest corner, on the south side of the house. Those two are the entry points to the back yard.

**Then:** "There used to be a very large, low, spreading tree (maybe a crabapple?) in the exact center of the back yard. As a kid I would have to duck and push aside branches to get to the trunk, and could basically step into it almost like a nest."

Crabapple stays a possible species for both trees: this one and the front yard's climbing tree.

**Now:** several more large trees along the back property line, with homes on all the surrounding lots.

## Open questions

- How does the player move between now and then: by remembering, by objects, or by the story?
- What is the game's goal or ending?
- Which rooms come next after the front yard?
