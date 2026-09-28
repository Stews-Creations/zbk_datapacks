# Waves Module

Owns round progression, enemy counts and scaling, spawn markers, zombie spawning, and dog rounds.

## Structure

| Path | Responsibility |
| --- | --- |
| `management/calculations/` | Health, count, delay, burst, multiplier, and speed-pool calculations |
| `management/rounds/` | Countdown, round start, spawning transition, completion, and round end |
| `management/zombie/` | Zombie tuning defaults, pending-burst reset, and selection history |
| `markers/` | Zombie and dog marker placement and visualization |
| `spawning/` | Enemy selection, creation, accounting, and spawn presentation |
| `special_rounds/dog/` | Dog-round scheduling, effects, and marker reward handling |

## Lifecycle

- `on_load` creates wave scoreboards and configurable defaults.
- `initialize` clears wave enemies, scheduled starts, spawn state, and special-round state.
- `on_tick` processes marker placement, spawn-animation entities, and active waves.
- `on_tick_as_player` applies player-context dog-round effects.
- `enable_triggers` enables wave marker tools for one player.

Dog markers are checked every tick with native item predicates. Eligibility uses byte-valued custom data `{dog_round_marker:1b}` on a dropped item. Marker consumption, remaining-dog checks, and Max Ammo creation run in the dog-round flow.

## Round state

`wave.is_active` uses `0` for waiting, `1` for countdown, `2` for spawning, and `3` for waiting for remaining kills. Positive configuration values persist across reload; `initialize` resets runtime state.

## Zombie selection and pacing

Persistent `zombie_spawner` markers supply `data.zone`, `data.mode`, and optional immunity flags. Zone 0 starts unlocked; doors unlock other zones. Modes are 0 for standard, 1-4 for hole east/south/west/north, and 5-8 for wall east/south/west/north. Missing or invalid modes are excluded with a debug diagnostic.

Each spawn opportunity rotates through standing adventure-mode players with a positive `id`, skipping players without usable markers. Markers are filtered by unlock state, range, mode, temporary failure exclusion, and animation occupancy before weighted selection. Burst counters track successful creations, retain their target while blocked, and respect `wave.max_alive`.

`wz_cfg` stores the range, weight, recent-use, retry, attempt, animation-age, climb-height, and failure-exclusion settings. Positive tuning values persist across reload. Keep weights and multipliers positive and within signed scoreboard limits.

## Creation and recovery

Zombie creation identifies the exact new entity before initialization and allocates a round slot only after successful creation. Hole and wall animations retain persistent marker configuration while runtime entities, age, health, and occupancy are rebuilt or cleared by initialization. Crawlers retain the adult's counted slot and consumed speed allocation. Explicit recovery refunds ownership once; ordinary kills complete the slot.

Standard zombies, hole/wall spawns, and crawlers use a 256-block `minecraft:follow_range`. Behavior owns the default 60-block relocation threshold and runs recovery every 20 ticks (1 second) when a usable replacement spawn exists. See [Behavior](../behavior/README.md).

Hole animations crawl for 60 ticks (3 seconds). Wall animations use bounded climb and exit movement. Conversion requires both body cells to match `zbk:spawn_exit_passable`, preserves remaining health, facing, and immunity, and clears temporary failure state on success.

## Add-on integration

Round start/end notifications publish the current round and round type. Pending custom enemies can reserve round completion through the API. Panzer scheduling belongs to Core and is disabled when no Panzer spawner markers exist. See the [Core API contract](../../../../../docs/API.md).
