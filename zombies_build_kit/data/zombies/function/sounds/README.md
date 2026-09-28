# Core sounds

Provides fixed audio cues for reusable gameplay. There is no map ID, sound-pack selector, or ambient map soundtrack. Core includes four-character gameplay voice callouts.

## Public calls

Call `zombies:sounds/play/<cue>` directly, without macro storage. The functions in `play/` preserve their callers' audience, location, volume, and sound category.

| Cue group | Sound source |
| --- | --- |
| `drops_*` | Shared `zbk:drops.*` events |
| `cash`, `game_over` | Shared `zbk:game.cash` and `zbk:game.game_over` events |
| `music_menu`, `music_menu_stop` | Shared `zbk:game.disco`, scoped by the lobby menu |
| Game/round start/end, dogs, teleporters | Shared `zbk:` events |
| Power activation | Vanilla fallback; a map may provide a local cue |
| Character callouts | Shared `zbk:voice.*.character_1` through `character_4` events |

Other weapon, perk, trap, and machine effects are called directly by their owning modules. The reusable radio plays/stops the shared music event from its interaction handlers. Players need the matching core resource pack for `zbk:` events. The optional Vivecraft overlay does not select a different audio namespace.

## Add-on integration

Shared cues offer request events before playing their fallback. The active map may handle a cue and block that fallback. Core assigns four character slots at game start, maintains a shared per-character callout cooldown, and plays the matching voice after `sound_voice_*` requests unless an add-on blocks them. See the [Core API contract](../../../../../docs/API.md).
