# Repairable board barriers

Owns reusable zombie-breakable barriers on every map. Persistent `barrier` markers carry damage state and heading; associated `boards_spawn` markers locate the derived board and repair-text entities. These markers survive initialization.

## Lifecycle and state

- `on_load` defines damage, breaking, and player-repair objectives before initialization.
- `initialize` resets loaded barriers to intact, rebuilds their boards and repair text, restores light-block restrictions, and resets player repair counters. Carpenter uses this same reset path.
- `on_tick` detects placement eggs, nearby zombies, active breaking timers, and player repairs every tick. Damage and repair timings are unchanged.
- `enable_triggers` enables authoring triggers for the player.

Marker `barrier_state` is 0 when intact and increases to 6 when fully broken. `barrier_break_timer` tracks zombie breaking; player repair cooldown and per-round rewarded repairs remain separate state.

Repair text is hidden when intact and visible when damaged. Visibility updates on the first damaged stage, the final repair to intact, and text reconstruction. It is not rewritten every tick. Operator code that directly edits `barrier_state` must also call `function zombies:map_elements/barrier/management/update_repair_text` as that marker at its position, or use the normal damage/repair flows.

## Responsibilities

| Folder | Responsibility |
| --- | --- |
| `spawning/` | Authoring placement, directional boards, and repair-text reconstruction |
| `zombie/` | Nearby-enemy detection, break timing, and board removal |
| `player/` | Sneak-repair detection, board repair, points, and cooldowns |
| `management/` | Board restoration/removal, text visibility, light restrictions, and authoring utilities |

The [Carpenter powerup](../../combat/powerups/README.md) restores both this module and the separate `barrier_w3` system. Presentation and authoring markers belong to this module; combat points, sounds, and player input predicates are shared dependencies.

## Marker dispatch

`zombie/tick` combines each barrier's zombie detection and break-timer update. The separate player-repair pass still runs after all barriers have processed breaking, preserving shared player cooldown and nearest-barrier selection. Initialization, board state, and interaction timing are unchanged.

Visible boards and repair prompts restore `view_range:0.5f` directly; hidden states retain zero. This respects the shared display cap without requiring repeated maintenance reads.
