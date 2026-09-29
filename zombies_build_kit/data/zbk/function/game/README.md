# Game Module

Owns lobby state, game start and reset, game over, player spawning, and custom starting rounds.

## Responsibilities

| Area | Responsibility |
| --- | --- |
| `start/` | Start requests, deferral/resume, cutscene continuations, and match setup |
| `reset/` | Reset requests and before/after reset phases |
| `end/` | End requests, operator stops, and game-over flow |
| `initialize` | Reset shared gameplay state and return players to the lobby |
| `spawn_points/markers/`, `spawn_points/players/` | Spawn placement/indexing and player distribution/respawn |
| `lobby/` | Worldspawn teleporting; `markers/` holds placement |
| `spawn_points/build_kit/`, `lobby/build_kit/` | Marker configuration and Build Manager handlers |
| `settings/start_round/` | Operator configuration for the starting round |
| `audio/` | Match start/end cues |
| `events/` | Match lifecycle request and notification dispatch |

## Lifecycle

`on_load` creates game objectives and initializes the module. `initialize` resets shared gameplay modules and returns players to the lobby. `start/request` checks readiness, allows listeners to block or defer the request, and runs configured opening cutscenes. `start/immediate` performs the same readiness checks while skipping intros. Accepted starts reach `start/match`, which clears active cutscenes, resets gameplay state, prepares players, and schedules the first round; this setup step requires the internal continuation flag. `end/trigger` selects the configured ending flow and stops active gameplay.

Cutscene markers are optional. When present, the spawn menu can play an opening or ending sequence before continuing the shared game flow. The current lobby menu, its placement, and its music belong to `map_elements/spawn_menu_v2`.

## Persistent state

`game_active` records whether a match is running. `game.start_round` stores the operator-selected starting round; normal starts use Round 1. Spawn markers and cutscene markers are persistent world configuration, while their displays and interactions are rebuilt by their owning modules.

Crafting Bench recipe flags reset through `map_elements/crafting_bench/management/reset_buildables`, then saved locations rebuild through `map_elements/crafting_bench/initialize`. See the [Crafting Bench module](../map_elements/crafting_bench/README.md).

## Add-on integration

Start, reset, and end publish lifecycle events. Start requests may be blocked or deferred; only the accepted owner can resume a pending start with its current token. Map-specific readiness and intro behavior belong to the registered add-on. See the [base pack integration contract](../../../../../README.md#base-pack-integration).

## Direct calls

Run `function zbk:game/start/request` for a normal start, or `function zbk:game/start/immediate` to skip intros. Both reject starts while loading, during synchronous event dispatch, while a match is active, or while an accepted deferred start is pending.

Use `zbk:game/reset/request` for an operator or add-on reset and `zbk:game/end/request` to end an active match. An accepted intro resumes through `zbk:game/start/resume` with its saved `{owner,token,generation}` compound. Reset and reload invalidate old tickets. These entry points own lifecycle validation; add-ons must not set the continuation flag or call `start/match` themselves.
