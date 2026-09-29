# Custom doors

Custom doors are reusable across maps. Persistent `custom_door_1` corner markers store saved display data; `custom_door_sign` markers own purchase settings and link to door zones through `custom_door_id`. Sign UI entities are associated with their marker through `cd_sign_uid`.

## Lifecycle and ownership

`on_load` creates objectives and calls `initialize`. Initialization resets loaded sign markers, restores their saved block and item displays, recreates purchase UI, and resets floating emitters. Purchased doors also restore their saved blocks. Build Kit authoring lives under `build_kit/management/custom_door` and `custom_door_sign` and calls this runtime module for restoration and UI updates.

| Folder | Responsibility |
| --- | --- |
| `reset/` | Restore saved zones and runtime displays |
| `management/` | Create and update purchase UI |
| `buy/` | Purchase, linked opening, and UI removal |
| `animations/` | Animate opening and clean up door displays |
| `float/` | Floating presentation and particles |

## Display ranges

Restored block and item displays use `view_range:0.35f`. Purchase text uses `view_range:0.125f`, matching wall-gun labels. These are range multipliers, not distances in blocks; effective visibility depends on client entity-distance settings.

The summon functions apply the model range whenever a saved door is restored, including reset and reload. Sign creation and updates apply the text range. Saved geometry and transformations remain the source of truth, while these rendering defaults are owned by the runtime module. Manually changed display ranges are replaced when those entities are rebuilt. Ordinary blocks in a door zone retain normal chunk rendering.

Continuous floating-door particles are sent only to players within 22.4 blocks of the zone center emitter (64 blocks multiplied by 0.35). The particle macro is skipped when no player is in that radius. This fixed server-side distance does not scale with client entity-distance settings, so it approximates rather than exactly follows the model visibility range. Placement and one-shot opening effects retain their existing behavior.

## Highlight updates

Each tick marks the nearest eligible door corner for every player holding the Build Manager. It then processes nearby corners followed by already-active corners that are no longer nearby. All players' proximity tags remain available until both passes finish, preserving linked-pair highlighting while either corner is near a builder and clearing stale highlights after builders leave or switch items. Idle, unhighlighted corners no longer invoke the per-corner helper. Gameplay opening and floating effects retain their timing.

Builder proximity uses a direct main-hand check for a stick with `build_manager:true`. It is recomputed every tick before linked-door highlight decisions.

## Editor and animation folders

`build_kit/door/` and `build_kit/sign/` own their respective editors and Build Manager handlers. Animation block clearing lives in `animations/clearing/`; layer movement lives in `animations/layers/`. Highlighting, saved-zone storage, and scratch-state ordering remain owned by the corresponding editor operations.
