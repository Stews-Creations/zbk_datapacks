# ZBK Nacht der Untoten

An installable map add-on for ZBK Core 1.0.0 and the matching Nacht der Untoten resource pack. It restores the Dr. Monty radio, its Build Kit placement and interactions, map theme, and the barrel-completion Easter egg. Shared rounds, dogs, teleporters, and character voices are provided by Core. The pack identifies itself as `zbk_nacht_der_untoten` and requires no in-game map or sound selector.

## Install

1. Install ZBK Core 1.0.0 in the world.
2. Install `zbk_nacht_der_untoten.zip` in the same world's `datapacks` folder and enable the matching Nacht resource pack above the base ZBK resource pack.
3. Run `/reload`. Core registers the installed provider during bootstrap. If Core is missing or incompatible, the add-on remains inactive. Only one map provider can be active in a world.
4. Open Core's Map Tools and choose Nacht der Untoten to get a Dr. Monty radio placement egg.

## Runtime and authoring

The persistent `zbk_nacht_radio_marker` stores the radio's location. Initialization recreates its display and interaction entities, including after a game reset or reload. Players may shoot, punch, or interact with the radio; the Dr. Monty audio plays once per game. Build Stick targeting uses the shared `build_manager_target` tag.

The function namespace root contains only `on_load`, `initialize`, and `on_tick` lifecycle hooks. Core event handlers and registration live in `function/event/`; `function/radio/initialize` rebuilds the radio's runtime entities.

The barrel-completion Easter egg belongs to Nacht: after every Core explosive-barrel marker is exploded, the add-on stops radio and music playback and starts the streamed Nacht cue. Core supplies barrel state and dispatches the `barrel_exploded` event; the add-on owns the completion counter and map audio.

Core supplies reusable round, game, dog-round, drop, teleporter, menu, and character voice cues. This provider supplies radio tracks and barrel-completion audio through map-owned sound events. Audio playback requires the matching resource packs.

## Public boundary

Core registers this provider through `zbk:api/map/register` and dispatches its event and sound handlers through additive `#zbk:event/*` tags. Radio offhand firing uses `zbk:api/weapons/force_fire`. Map gameplay, markers, sound state, and audio event identifiers are owned by this namespace. No private Core function is called.

## Validation and limitations

Package this folder as `zbk_nacht_der_untoten.zip` with its root at `pack.mcmeta`. Run the datapack Mecha parser and static function, dialog, advancement, and JSON reference checks from the datapacks component. Also test the radio's bullet, melee, and right-click paths; reload and reset reconstruction; radio one-time playback; all-barrels completion and music interruption; and Core-only play. Client audio and world interaction need a Minecraft 26.2 client test.

This pack restores the source's implemented radio and barrel Easter egg behavior. It does not claim unfinished map quests or ship a finished world.

## License and credit

Use, modification, and redistribution follow [the project license](LICENSES/LICENSE.md), [the media permission](LICENSES/MEDIA_PERMISSION.md), and the included [notice](LICENSES/NOTICE). Required third-party terms are in [LICENSES](LICENSES/).
