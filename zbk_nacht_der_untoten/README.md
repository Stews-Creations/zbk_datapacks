# ZBK Nacht der Untoten

This map add-on depends on ZBK base pack compatibility revision 30000 and the matching Nacht der Untoten resource pack. It uses the base pack's rounds, explosive barrels, Build Kit, and shared audio systems.

## What it adds

- A placeable Dr. Monty radio with shooting, melee, and interaction controls. Its marker preserves placement across load and reset.
- Map-specific dialogue and sound cues.
- A barrel-completion Easter egg that changes the map audio after every explosive barrel has detonated.
- Map Tools controls for placing and managing the radio.

## Radio controls

Shoot the regular radio to play music and knife it to stop. Its tracks use the Music volume setting. Knife the Dr. Monty radio to play its message once per game; further knife hits stay silent until game reset or reload. Monty's message uses the Voice/Speech volume setting.

## Module layout

Functions live under `data/zbk_nacht_der_untoten/function/`:

| Folder | What it adds |
| --- | --- |
| `dr_monty_radio/` | The placeable Dr. Monty radio, persistent placement, display reconstruction, interactions, music playback, and deletion |
| `barrel_easter_egg/` | Completion detection, reward audio, and the base pack sound-request handlers for the Easter egg triggered by detonating every explosive barrel |
| `ambient_music/` | Map ambient music playback and its once-per-second timer |
| `event/` | base pack registration and event listeners that route lifecycle, authoring, and gameplay events to the modules |

The regular radio prop belongs to the base pack. The base pack also supplies its full ten-track playlist; `dr_monty_radio/` owns only the separate Dr. Monty prop. Shooting that prop plays the shared radio playlist, while melee plays Monty's message.

Pack-root `on_load`, `initialize`, and `on_tick` coordinate the add-on. Feature roots contain their needed lifecycle hooks; actions live in responsibility folders such as `spawning/`, `interactions/`, `management/`, or `gameplay/`. Each feature owns its audio: barrel reward playback lives in `barrel_easter_egg/audio/`, its base pack request handlers in `barrel_easter_egg/requests/`, and Dr. Monty's shared playlist controls in `dr_monty_radio/audio/`. Ambient playback lives in `ambient_music/playback/`, with its timer in `ambient_music/gameplay/tick_1s`. Shared `data/zbk/tags/function/event/` paths are base pack event subscriptions and retain the shared tag names.

Entity tags and scoreboard identifiers remain stable so existing placed radios survive function-path changes. Map Tools exposes placement and deletion of the Dr. Monty radio.
