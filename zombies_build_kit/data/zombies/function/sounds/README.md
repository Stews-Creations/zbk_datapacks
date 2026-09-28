# Core sounds

Provides fixed audio cues for reusable gameplay. There is no map ID, sound-pack selector, ambient map soundtrack, or character voice bank.

## Public calls

Call `zombies:sounds/play/<cue>` directly, without macro storage. The functions in `play/` preserve their callers' audience, location, volume, and sound category.

| Cue group | Sound source |
| --- | --- |
| `drops_*` | Shared `zombies:drops.*` events |
| `cash`, `game_over` | Shared `zombies:game.cash` and `zombies:game.game_over` events |
| `music_menu`, `music_menu_stop` | Shared `zombies:game.disco`, scoped by the lobby menu |
| Game/round start/end, dogs, power, teleporters | Vanilla note-block, wolf, beacon, portal, and teleport cues |

Other weapon, perk, trap, and machine effects are called directly by their owning modules. The reusable radio plays/stops the shared music event from its interaction handlers. Players need the matching core resource pack for `zombies:` events. The optional Vivecraft overlay does not select a different audio namespace.

## Add-on integration

Shared cues offer request events before playing their fallback. The active map may handle a cue and block that fallback. Map-specific voice selection and cooldowns live in the map pack; Core forwards integration points without owning a voice bank. See the [Core API contract](../../../../../docs/API.md).
