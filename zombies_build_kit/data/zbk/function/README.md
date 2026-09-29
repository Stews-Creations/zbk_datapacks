# Base pack function architecture

The `zbk` namespace owns shared gameplay, Build Kit authoring, and add-on integration. External packs call owning core functions directly and subscribe to `#zbk:event/` tags. Use complete operations with their documented executor, position, macro arguments, and scratch state; internal steps may require setup by their caller. See the [integration guide](../../../../README.md#base-pack-integration) for registration, event context, action restrictions, and integration boundaries.

## Ownership

| Module | Responsibility |
| --- | --- |
| `global/` | Shared objectives, teams, startup registration, gamerules, event request helpers, and the 20-tick (1 second) maintenance schedule |
| `game/` | Lobby, start/reset, game-over flow, and spawn distribution |
| `player/` | Setup, health, down state, inventory, points, HUD, and stats |
| `combat/` | Weapons, damage, equipment, Pack-a-Punch effects, and powerups |
| `behavior/` | Common enemy behavior, crawler presentation, and relocation |
| `waves/` | Round progression, enemy spawning, dog rounds, and marker-enabled Panzer scheduling |
| `bosses/` | Reusable Panzer controller, attacks, model, and spawn lifecycle |
| `map_elements/` | Reusable placed systems and their marker/runtime lifecycle |
| `build_kit/` | In-game authoring, configuration, and management dialogs |
| `debug/` | Shared diagnostics |

`load` defines modules in dependency order and resets runtime state. `tick` invokes module-wide hooks followed by one shared player loop through `on_tick_as_player`. There is no built-in map dispatcher, map selection, map quest runtime, or sound-pack selection.

## Module-local helpers

Each gameplay module owns its audio and event dispatch functions alongside its actions. `audio/` plays cues with the caller's existing executor, position, audience, volume, and sound category. `events/` dispatches the module's public event tags; `events/extension/` holds its operation-specific insertion points. Event tag IDs under `#zbk:event/` and resource-pack sound IDs are independent of these function paths.

| Helper | Owner |
| --- | --- |
| Match cues and lobby music | `game/audio/`, `map_elements/spawn_menu_v2/audio/` |
| Round and dog-round cues | `waves/audio/`, `waves/special_rounds/dog/audio/` |
| Powerup cues and callouts | `combat/powerups/<powerup>/audio/` |
| Weapon and enemy-kill callouts | `combat/weapons/audio/`, `combat/enemies/audio/` |
| Points, damage, and revive cues | `player/points/audio/`, `player/health/audio/`, `player/down_system/audio/` |
| Placed-system cues and callouts | `map_elements/<feature>/audio/` |
| Shared character assignment and cooldowns | [Player voice](player/voice/README.md) |
| Enemy death notifications | `combat/enemies/lifecycle/` |
| Pack-a-Punch presentation requests | `map_elements/pack_a_punch/presentation/` |
| Current lobby menu runtime | `map_elements/spawn_menu_v2/` |
| Provider registration and readiness | `global/startup/` |
| Shared event response helpers | `global/events/request/` |

Audio requests run before their fallback cue; a listener may block the fallback through `zbk:global/events/request/block`. Module-local `audio/voice/trigger/` functions retain callout chance and cooldown rules, and `audio/voice/play/` selects character playback. The shared voice state is defined under Player. The matching resource pack is required for `zbk:` sound events.

Install updated core and add-ons together when function paths change. Saved commands and third-party direct function calls must use the owning paths above; event tag subscriptions remain unchanged.

## Lifecycle and state

Module roots expose only needed `on_load`, `initialize`, `on_tick`, `on_tick_as_player`, and `enable_triggers` entry points plus their README. Put actions in responsibility folders such as `management/`, `spawning/`, `interactions/`, `animations/`, `marker/`, or `model/`.

Persistent markers, scores, and marker data are authoritative. Runtime displays, interactions, and models are derived and must be reconstructed by their owners. Keep lifecycle functions as orchestrators and avoid redundant reload wrappers. Specialized behavior entity hooks, `global/tick_1s`, and public debug helpers are established root entry points.

Scratch state is synchronous and must be refreshed for each operation or player. Do not retain entity-selection results across ticks. Preserve execution context, selector scope, and phase ordering when sharing helpers; `function` does not move its execution position when an entity teleports.

## Validation and generated output

Update all calls, schedules, advancement rewards, dialog actions, and documentation when changing a function path. Run the static and isolated runtime checks described in the [pack guide](../../../../README.md).

Map add-ons use the [public base pack integration](../../../../README.md#base-pack-integration). The base pack emits function-tag events at state transitions and operation gates; add-ons call the owning modules directly. Event frames are synchronous and nested; request handlers use the active frame to block or claim an operation.

Generated crawler and Panzer models and Mystery Box animations keep their existing namespaces. Do not mix gameplay into generated transforms or keyframes. Maintain their public callback contracts and verify references after replacing generated output.

## Feature subfolders

Feature-specific authoring belongs in the feature's `build_kit/` folder, alongside its runtime. Shared Build Kit owns tool input, cooldowns, routing, and cross-feature visualization. Keep target selection and cleanup in each feature handler; executor and scratch-state lifetimes differ between handlers.

Game separates `start/`, `reset/`, `end/`, `spawn_points/`, and `lobby/`. Weapon state uses `reload/`, `firing/`, `inventory/`, `runtime/`, and `profiles/`. Teleporters separate travel, timers, displays, effects, and reset. Small folders dedicated to one perk, weapon, animation, or selection algorithm stay together; generated registries and model namespaces keep their generated structure.
