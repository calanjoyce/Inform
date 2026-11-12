# Keithwood

An Inform 7 game in progress, set in the house I grew up in, layering memories of the past over the present. The design notes are in [DESIGN.md](DESIGN.md).

## Yards demo

A small playable sketch for trying out the time shift: the yards around the house, eleven spaces in all, from the gravel strip along the road to the shed in the back yard's far corner. Things that are gone have left traces: tire tracks on the gravel strip and the driveway, a slight mound in the front lawn where the old tree stood, a post hole where the mailbox used to be, and a hollow in the middle of the back yard where a big, low, spreading tree stood. Look closely at a trace, touch it or search it, and what made it comes back. The cars and the trees are hazy, so each time you look they may shift to another of the ways they might have been. Left alone, they fade. The map is in [walkthrough.txt](walkthrough.txt).

## Files

- `story.ni`: the Inform 7 source, with comments explaining each part.
- `Keithwood.gblorb`: the compiled demo (Glulx, release build), made with Inform 7 v10.1.2.
- `walkthrough.txt`: how the demo works, with a map and a sample playthrough.
- `DESIGN.md`: the design notes.

## Playing it

Open `Keithwood.gblorb` in any Glulx interpreter: Lectrote or Gargoyle on the desktop, or upload it at [iplayif.com](https://iplayif.com/). Type `hint` for help.

To work on the source, paste `story.ni` into a new Inform project and press **Go**. Type `test me` at the first prompt to run through the demo automatically, or `test front` / `test back` for one yard (testing builds only).
