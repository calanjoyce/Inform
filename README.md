# Inform
Inform games development 

## Games

- [Lantern Hill](LanternHill/): a short Inform 7 game about an old observatory and a comet. Play `LanternHill.gblorb` in Lectrote, Gargoyle or at iplayif.com.
- [Keithwood](Keithwood/): a new game in design, set in the house I grew up in, layering memories of the past over the present. A small demo of the yards around the house, `Keithwood.gblorb`, tries out the time shift. See [DESIGN.md](Keithwood/DESIGN.md).

## Testing from the command line

`tools/play.py` compiles a game's `story.ni` with the Inform app's compiler and plays commands through it, printing the transcript. It needs Inform.app in `/Applications` and `brew install glulxe`.

```
tools/play.py --wait 6 Keithwood/story.ni "test me"
tools/play.py Keithwood/story.ni "x patio" "look closely at gravel"
```
