# Panzer enemy

Core owns the reusable Panzer controller, generated model, attacks, spawner markers, and round schedule. Any map can use this enemy without installing Der Eisendrache. Map quests may react through the [Core event API](../../../../../../docs/API.md).

## Placement and round schedule

Place persistent `panzer_spawner` markers with the Build Kit Panzer spawner tools. The marker's `data.zone` and immunity settings configure spawning; zone 0 is immediately available, and other zones must be unlocked. Pending spawn markers, controllers, projectiles, and model displays are runtime entities removed on reset.

Core checks the schedule when each round starts. With no Panzer spawner markers, automatic Panzer spawning is disabled. The default first round is 12, repeating every 6 rounds. The Build Kit timing dialog updates `#global wave.panzer_start_round` and `#global wave.panzer_round_interval`. Only an available marker can be selected when markers exist. A 60-tick (3-second) warning precedes spawning.

## Ownership and lifecycle

| Folder | Responsibility |
| --- | --- |
| `spawn/` | Marker selection and delayed spawning |
| `controller/`, `ai/` | Enemy state, targeting, and relocation |
| `attacks/` | Melee, flamethrower, electric projectiles, and burn damage |
| `model/` | Pairing, animations, descent, and removal |
| `drops/` | Guaranteed random shared powerup on death |
| `lifecycle/` | Cleanup of runtime entities |

`on_load` defines objectives, `initialize` cleans up runtime state, and tick hooks advance controllers and player burn effects. Core emits `enemy_spawned` as the new controller and reports deaths through its shared enemy event path. The generic `zbk.enemy_stunned` tag suspends controller attacks while a caller owns a temporary stun; the caller must release its own stun state.

The `animated_java:de_panzer` identifier is the retained generated rig identifier, not a dependency on a map pack. Keep generated model output separate from gameplay changes. Do not edit animation frames by hand.
