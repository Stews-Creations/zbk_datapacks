# Doors

Owns purchasable and powered doors, marker-driven reconstruction, linked spawner-zone unlocking, and zone notifications.

## Responsibility folders

| Folder | Responsibility |
| --- | --- |
| `purchasable/spawning/`, `powered/spawning/` | Placement eggs, frames, and marker creation |
| `purchasable/purchasing/` | Purchase validation, interaction, and price updates |
| `purchasable/display/` | Price prompts and derived displays |
| `purchasable/management/`, `powered/management/` | Door opening |
| `management/` | Shared zone iteration, spawner unlocking, and notification deduplication |
| `build_kit/purchasable/`, `build_kit/powered/` | Marker settings, dialogs, deletion, and Build Manager handlers |
| `events/` | Zone notification and door extension dispatch |

`initialize` reconstructs doors and their runtime UI from persistent markers. Use `zbk:map_elements/door/management/unlock_zone {zone:3}` to unlock a shared zone with the required scratch-state handling. The first unlock in a reset generation emits the existing zone-unlocked event.
