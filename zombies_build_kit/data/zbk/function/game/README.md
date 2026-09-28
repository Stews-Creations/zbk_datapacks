# Game Module

Owns lobby state, game start and reset, game over, player spawning, custom starting rounds, and spawn-menu placement.

## Responsibilities

| Area | Responsibility |
| --- | --- |
| `management/` | Start, reset, game-over flow, and player respawning |
| `initialize` | Reset shared gameplay state and return players to the lobby |
| `spawn/` | Starting positions and worldspawn behavior |
| `management/custom_start/` | Operator configuration for the starting round |

## Lifecycle

`on_load` creates game objectives and initializes the module. `initialize` resets shared gameplay modules and returns players to the lobby. `start` clears active cutscenes, resets gameplay state, prepares players, and schedules the first round. `trigger_game_over` selects the configured ending flow and stops active gameplay.

Cutscene markers are optional. When present, the spawn menu can play an opening or ending sequence before continuing the shared game flow.

## Persistent state

`game_active` records whether a match is running. `game.start_round` stores the operator-selected starting round; normal starts use Round 1. Spawn markers and cutscene markers are persistent world configuration, while their displays and interactions are rebuilt by their owning modules.

Crafting Bench recipe flags reset through `map_elements/crafting_bench/management/reset_buildables`, then saved locations rebuild through `map_elements/crafting_bench/initialize`. See the [Crafting Bench module](../map_elements/crafting_bench/README.md).

## Add-on integration

Start, reset, and end publish lifecycle events. Start requests may be blocked or deferred; only the accepted owner can resume a pending start with its current token. Map-specific readiness and intro behavior belong to the registered add-on. See the [Core API contract](../../../../../docs/API.md).
