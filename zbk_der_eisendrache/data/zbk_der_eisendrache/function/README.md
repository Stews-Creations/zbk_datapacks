# Der Eisendrache Map Systems

Owns gameplay and set pieces exclusive to Der Eisendrache. The base pack registers and selects this provider; the base pack event handlers call the module only while `zbk_der_eisendrache` is active.

`events/zombie_spawn` is invoked by the base pack for each newly created zombie, including completed hole/wall animations, and assigns Der Eisendrache Fuse-drop eligibility. The base pack owns reusable Panzer enemies, spawners and round scheduling; this add-on supplies only Der Eisendrache-specific Panzer quest reactions.

## Systems

| Path | Responsibility |
| --- | --- |
| [`115_launch/`](115_launch/) | 115 launch-pad vehicle and movement sequence |
| [`anti_gravity/`](anti_gravity/) | Undercroft activation plates and cycle, portal boundaries, player room state, authored wall-run paths, level-2 out-of-bounds recovery, and 115 launch-zone suppression |
| [`fuse_drop/`](fuse_drop/) | Persistent placement and delayed Round 1 spawn for the guaranteed Fuse drop |
| [`intro_cutscene/`](intro_cutscene/) | Der Eisendrache opening video, intro camera handoff, and delayed normal game start |
| [`map_pack_a_punch/`](map_pack_a_punch/) | Map-specific Pack-a-Punch locations and unlock flow |
| [`quest/`](quest/) | Dragon heads, bows, fire ring, disco, and wolf Easter-egg systems |
| [`rocket/`](rocket/) | Rocket model, launch sequence, and effects |
| [`rocket_test_launch/`](rocket_test_launch/) | Recurring in-game rocket test launch timing and launch entry point |
| [`tram/`](tram/) | Linked tram routes, paired calls, rewards, and automatic return |

## Audio ownership

Gameplay modules own their DE sound replacements in `audio/` and callout triggers in `audio/voice/trigger/`. This includes game and round cues, dog rounds, powerups, weapons, enemy kills, player health and points, and shared map elements. Base pack sound and voice event tags route directly to these handlers; their public tag IDs remain unchanged.

[`player/voice/`](player/voice/) owns the shared per-character cooldowns and player voice lifecycle. [`game/audio/music/`](game/audio/music/) owns ambient timing and cleanup. Map load resets both states; maintenance advances ambient music, and game reset/end stops it. Feature-specific handlers preserve their active-provider guards, fallback blocking, audience, volume, and DE resource event IDs.

## Lifecycle and Reset

The base pack dispatches lifecycle and gameplay events to this provider only when its registration is active. The base pack also owns sound event selection and routing. The namespace root contains only lifecycle entry points; Minecraft's load tag calls `events/load` to reset registration state before the base pack startup, and `events/maintenance` calls `quest/maintenance` for quest presentation.

- `on_load` loads every feature regardless of the current selection, including anti-gravity plate, cycle, and movement objectives plus quest objectives and triggers.
- `on_tick` is called directly by `#zbk:event/runtime/tick`. It guards inactive providers, delegates the rocket effects, rocket test launch timer, anti-gravity activation cycle, boundaries, player gravity, authored wall-run paths, 115 launch, Pack-a-Punch, tram, and quests, then cleans up Fuse powerup state.
- `initialize` resets anti-gravity plate progression, cycling, player, mob, and wall-platform state, Pack-a-Punch, quests, and the rocket test launch state, rebuilds configured rocket-test doors open, and rebuilds trams from their Start markers. The game-start preservation flag applies only to the prebuilt rocket.
- Dragon-head quest displays use an explicit half-turn skull rotation for Minecraft 26.2 rendering; initialization also corrects existing large and mini heads.
- `enable_triggers` enables selected-map quest triggers for the current player.
- `events/` handles readiness, cutscene-enabled game-start interception, reset preservation, game start, Round Start, map-owned cutscene tick and stop cleanup, teleporter arrivals, 115 launch-start handoff, anti-gravity reload-input reservation, and precise grenade-step dispatch. The first in-game forward teleporter arrival on Der Eisendrache arms the initial rocket-test cooldown regardless of landing position, and Round 1 schedules the configured Fuse drop 1 tick after round setup finishes.
- `management/cleanup` removes Der Eisendrache runtime, including anti-gravity player, mob, and wall-platform state, rocket-test door displays and collision, and transient quest entities, after another ID is selected.

Lifecycle hooks are reached through the base pack event tags. Combat callbacks for disco and bow interactions route through `events/`, while public feature commands and scheduled callbacks keep defensive Der Eisendrache checks. Persistent Build Kit markers remain configuration; models, interactions, effects, and other gameplay entities are derived runtime state.
