# Der Eisendrache quest inventory board

Map 2 owns its Fuse and Ragnarok indicators, shared bow progress, and owner portraits shown in the normal player inventory. All native slot positions remain unchanged. Four decorative 2-by-2 groups occupy columns 1-2, 3-4, 6-7, and 8-9; column 5 is the empty center gap across the two bow rows. Each icon and portrait occupies one real slot, never the midpoint between slots.

## Layout and state

| Row | Columns (one-based) | Command slots | Contents |
| --- | --- | --- | --- |
| Top main-inventory row | 1 | `inventory.0` | Empty/full tram Fuse, from the viewer's `de_fuse` |
| Top main-inventory row | 3, 4, 5 | `inventory.2`, `.3`, `.4` | Shared Rocket Shield collection indicators (owned by Player) |
| Top main-inventory row | 7, 8, 9 | `inventory.6`, `.7`, `.8` | Ragnarok missing-part placeholders |
| Middle main-inventory row | 2, 4, 6, 8 | `inventory.10`, `.12`, `.14`, `.16` | Player heads for Electric, Fire, Wolf, Void owners |
| Bottom main-inventory row | 2, 4, 6, 8 | `inventory.19`, `.21`, `.23`, `.25` | Corresponding bow emblems and four-segment progress rings |

The divider occupies the existing boundary below the first row. It does not insert spacing or move any inventory item. Armor, crafting, offhand and hotbar positions remain native. The inventory background texture is global to the resource pack and appears outside Map 2 as well; Creative's separate inventory texture is unchanged. See the `art/maps/der_eisendrache/inventory/README.md`.

The board reserves its slots only in Adventure on Map 2, or during an explicit cosmetic preview. Leaving Adventure or Map 2 removes the tagged items. Every bow is visible to every viewer regardless of binding. Before its quest arrow has been claimed, the emblem is dim and non-glowing. A successful first claim sets shared `de_bow_started`; the colored emblem then remains active through unbinding or ownership changes, until quest reset. Live ownership or nonzero saved progress also selects the active state. Cosmetic previews always show the active stage being previewed. Electric progress reads shared `#electric de_el_progress`: initial fires, five-panel loop, charged fire hits, then reforged arrow pickup fill its four segments. Fire, Wolf and Void live progress remain empty until their feature state is connected. Ragnarok parts remain unconnected placeholders. Shield slots are owned by the shared Player inventory renderer, read real team collection state, and work on every map. This Map 2 module neither writes nor clears shield indicators.

## Player portraits

Owner IDs come from `#1` through `#4` in `de_bow_owner`. They are compared with each player's stable `id`; holding a bow does not establish ownership. An unassigned bow displays a silhouette. On the first update after an ownership change, `inventory/owners/capture` runs the existing `zombies:player_head` loot table as the owner into a temporary item entity, copies its profile, then removes that entity. It never borrows a player inventory slot.

Profiles are cached in `zombies:quest_inventory owners` and indexed by the corresponding `de_ui_owner` score. All viewers reuse them, including after that owner disconnects. If a reserved owner is offline before a profile has been captured, a silhouette explicitly says the profile is unavailable; it does not claim the bow is unassigned. Reload/reset clears the profile cache. Hovering a real head shows only the exact player profile username as its title (without the possessive or "Head" suffix), plus an assignment description. Ownership, quest progress and rewards remain authoritative in their existing modules.

## Updates and item preservation

`maps/events/quest_inventory_tick` remains the public dispatcher called by the inventory manager. `inventory/update` checks the board every 5 ticks (0.25 seconds), using per-player `de_ui_clock`; already-correct items are not rewritten. There is no inventory-open detector and no requirement to repeatedly open the screen. The first eligible call updates immediately. Cosmetic preview commands reset the clock for immediate feedback.

Only cosmetic tags `de_quest_ui`, `de_fuse_ui` and `de_board_ui` identify managed items. Moved/duplicated items are repaired on the next board update, including portraits. Real stacks occupying a reserved slot are copied with all components and counts into a dropped item at the player's feet with a 20-tick (1-second) pickup delay. A failed copy prevents replacement. Unreserved inventory slots and the real hotbar are untouched.

This is not a client-side slot lock: native clicks still work. Tagged items dropped in the world are deleted by the shared map tick, once per tick rather than once per player; displaced normal items are not. Copies placed into external containers cannot be locked by a datapack and carry no gameplay authority. Map cleanup and game reset remove cosmetic items and previews. No quest UI is added to the actionbar.

## Lifecycle and responsibility

| Path | Responsibility |
| --- | --- |
| `on_load`, `initialize` | Define UI objectives; clear previews, items and cached owner profiles |
| `inventory/update`, `inventory/bow`, `inventory/apply` | Board cadence and shared progress indicators |
| `inventory/owners/` | Profile capture, cache, portrait restoration |
| `inventory/parts/` | Explicit missing-part placeholders |
| `inventory/fuse/` | Viewer-specific Fuse status |
| `inventory/board/`, `inventory/displace` | Safe slot reservation and complete-stack preservation |
| `inventory/clear`, `inventory/clear_all`, `inventory/clear_dropped` | Scoped cosmetic cleanup |
| `management/` | Map-guarded preview commands |

Scratch storage `zombies:quest_inventory args` and `head`, plus scores in `temp`, are prepared and consumed synchronously per player. `de_hud_preview` and `de_hud_stage` are cosmetic per-player overrides; they never change gameplay state. This UI has no placement markers and reconstructs itself from feature state and ownership.

## Preview and validation

Reload functions with `/reload` and client assets with **F3+T**. On Map 2:

```mcfunction
function zbk_der_eisendrache:quest/hud/management/preview {quest:1,stage:3}
function zbk_der_eisendrache:quest/hud/management/end_preview
```

`quest` accepts 1 Electric, 2 Fire, 3 Wolf, or 4 Void; `stage` accepts 0 through 4. Only that viewer's selected emblem changes, in its fixed column. Previews can be inspected in Creative, while the Creative screen keeps its vanilla layout. End the preview to return to live Adventure state.

Run `python tools/build_inventory_board.py` for the background and part/portrait assets, and `python tools/validate_quest_inventory.py` for an isolated vanilla 26.2 two-player test. Runtime checks cover all slot mappings, real profile components, ownership changes, shared progress, preview isolation, movement/duplicates, safe displacement, dropped items, Creative/off-map cleanup and reset. Client appearance, skin loading and GUI scales require an in-game visual review.
