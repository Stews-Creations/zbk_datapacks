# Der Eisendrache

This map add-on depends on ZBK base pack compatibility revision 30000 and the matching Der Eisendrache resource pack. It uses the base pack's rounds, Build Kit, and Panzer enemy.

## What it adds

- Rocket and intro sequences, rocket tests, anti-gravity movement, trams and rewards, and the fuse drop.
- Map Pack-a-Punch presentation, dragon heads, bows and their quest branches, the fire ring, wolf paintings, disco, and the quest inventory board.
- Persistent Build Kit markers for map systems, with runtime displays and interactions rebuilt after load and reset.
- Der Eisendrache sound cues, character voices, models, and other map-specific presentation.

The base pack owns the Panzer controller and its `animated_java:de_panzer` rig. This add-on keeps only map-specific quest reactions. Sound handlers live in their owning gameplay modules under `audio/`; shared character cooldowns live in `player/voice/`, and ambient music lives in `game/audio/music/`.

## Resource item IDs

Map item IDs use the `zbk_der_eisendrache:` namespace. Fuse items live under `powerups/`, Pack-a-Punch parts and signs under `map_elements/pack_a_punch/`, tram displays under `props/tram/`, and the rocket under `props/rocket/`. Bow and quest item IDs retain their `quest/` subfolders. Use the matching DE resource pack and recreate items or displays carrying the previous IDs when updating an existing world.
