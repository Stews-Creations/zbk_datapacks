# Map Elements Module

Owns reusable world features that builders place or configure. Each module owns its persistent markers, derived runtime entities, player interactions, and reset behavior.

## Shared modules

| Module | Responsibility |
| --- | --- |
| `barrier/` and `barrier_w3/` | Repairable zombie barriers |
| `crafting_bench/` | Buildable shield components and recipes |
| `custom_door/`, `door/` | Purchasable doors and linked zones |
| `explosive_barrel/` | Reusable explosive props |
| `jump_pad/`, `teleporter/` | Player transport features |
| `mystery_box/`, `wall_gun/`, `pack_a_punch/`, `perks/` | Purchasable gameplay equipment |
| `radio/`, `painting/`, `floating_objects/` | Placed displays and interactions |
| `cutscenes/`, `spawn_menu_v2/` | Reusable lobby and game presentation |
| `rocket_shield/`, `traps/`, `fire_floor/`, `power/` | Equipment, hazards, and power state |

## Lifecycle

- `on_load` delegates module setup.
- `on_tick` delegates shared runtime behavior.
- `on_tick_as_player` delegates player-context interactions.
- `enable_triggers` enables Build Kit triggers for one player.

Submodules implement only the hooks they need.

Each placed feature owns cues under `audio/`, event dispatch under `events/`, and editor functions and Build Manager handlers under `build_kit/`. Editors separate settings, dialogs, marker deletion, and link-ID helpers. The current `spawn_menu_v2/` also owns lobby music; the deprecated menu is removed.

## Marker contract

Persistent markers and their scores or data are the source of truth. Runtime models, text, interactions, and effects are reconstructed from those markers by `initialize`. Deleting or relinking a marker must clean up or synchronize its derived entities. Authoring and runtime share the owning feature module, with editor-specific work in its `build_kit/` folder.

## Zone unlocks

Door management owns zone unlocking and its notifications. `door/management/notify_zone_unlocked` records each unlocked zone and dispatches the zone-unlocked event once per reset generation. Waves owns spawning from the unlocked spawners.

## Crafting Bench placement

[Crafting Bench](crafting_bench/README.md) owns reusable oriented bench markers, 3-wide by 2-tall models, and upper-half interactions. Saved locations remain active after initialization and rebuild through the shared maintenance hook.
