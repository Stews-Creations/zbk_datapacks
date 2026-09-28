# Core function architecture

The `zombies` namespace owns shared gameplay and Build Kit authoring. Root functions orchestrate lifecycle calls; implementation lives in the owning modules.

## Ownership

| Module | Responsibility |
| --- | --- |
| `global/` | Shared objectives, teams, gamerules, and the 20-tick (1 second) maintenance schedule |
| `game/` | Lobby, start/reset, game-over flow, and spawn distribution |
| `player/` | Setup, health, down state, inventory, points, HUD, and stats |
| `combat/` | Weapons, damage, equipment, Pack-a-Punch effects, and powerups |
| `behavior/` | Common enemy behavior, crawler presentation, and relocation |
| `waves/` | Round progression, enemy spawning, dog rounds, and marker-enabled Panzer scheduling |
| `bosses/` | Reusable Panzer controller, attacks, model, and spawn lifecycle |
| `map_elements/` | Reusable placed systems and their marker/runtime lifecycle |
| `build_kit/` | In-game authoring, configuration, and management dialogs |
| `sounds/` | Fixed shared sound cues and vanilla fallbacks |
| `gamerules/` | Operator-facing gamerule management |
| `debug/` | Shared diagnostics |

`load` defines modules in dependency order and resets runtime state. `tick` invokes module-wide hooks followed by one shared player loop through `on_tick_as_player`. There is no built-in map dispatcher, map selection, map quest runtime, or sound-pack selection.

## Lifecycle and state

Module roots expose only needed `on_load`, `initialize`, `on_tick`, `on_tick_as_player`, and `enable_triggers` entry points plus their README. Put actions in responsibility folders such as `management/`, `spawning/`, `interactions/`, `animations/`, `marker/`, or `model/`.

Persistent markers, scores, and marker data are authoritative. Runtime displays, interactions, and models are derived and must be reconstructed by their owners. Keep lifecycle functions as orchestrators and avoid redundant reload wrappers. Specialized behavior entity hooks, `global/tick_1s`, and public debug helpers are established root APIs.

Scratch state is synchronous and must be refreshed for each operation or player. Do not retain entity-selection results across ticks. Preserve execution context, selector scope, and phase ordering when sharing helpers; `function` does not move its execution position when an entity teleports.

## Validation and generated output

Update all calls, schedules, advancement rewards, dialog actions, and documentation when changing a function path. Run the static and isolated runtime checks described in the [pack guide](../../../../README.md).

Map add-ons use the [public Core API](../../../../docs/API.md). Core emits function-tag events at state transitions and operation gates; add-ons never call map-specific code through Core. Event frames are synchronous and nested; request handlers use the active frame to block or claim an operation.

Generated crawler and Panzer models and Mystery Box animations keep their existing namespaces. Do not mix gameplay into generated transforms or keyframes. Maintain their public callback contracts and verify references after replacing generated output.
