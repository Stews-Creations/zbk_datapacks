# Teleporter

Owns linked teleporter markers, purchases, travel, recharge timing, automatic return, and runtime displays. Persistent markers and their configuration remain authoritative across initialization.

## Responsibility folders

| Folder | Responsibility |
| --- | --- |
| `spawning/` | Placement eggs and endpoint markers |
| `purchasing/` | Purchase validation, prices, and purchase prompts |
| `travel/` | Outbound travel, return travel, and automatic return warnings |
| `timers/` | Cooldown and recharge progression |
| `display/`, `effects/`, `audio/` | Runtime labels, particles, and sound cues |
| `reset/` | Reset one teleporter's runtime state |
| `build_kit/` | Marker settings, link-ID management, dialogs, and Build Manager dispatch |
| `events/` | Arrival notifications and sound requests |

Use the placement and configuration tools to link endpoints. Internal travel functions depend on their caller's selected markers, executor, and position; preserve that context when calling them. Initialization and reset reconstruct derived runtime from the saved markers.
