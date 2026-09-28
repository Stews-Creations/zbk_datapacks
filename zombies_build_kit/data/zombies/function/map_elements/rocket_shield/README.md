# Rocket Shield part locations

Owns reusable part placement, candidate selection, shared collection, and pickup entities on every map. Menus, lifecycle hooks, and shared HUD have no Map ID gate; shield resources use the shared `zombies` namespace. Combat owns the equipped shield; Player owns the shared inventory indicators. Bench placement belongs to the [Crafting Bench module](../crafting_bench/README.md); the bench owns building and claiming the shield. Runtime ticks cover the Overworld, Nether, and End; no Map ID restriction applies.

## Builder workflow

Build Kit > Buildables > Shield supplies Plate, Mechanism, and Rocket spawn eggs. Use an egg on a surface to place a persistent `marker` at the center of that block footprint. The successful egg-use event saves the actual placing player's yaw on the marker, with pitch fixed at zero. Its part display uses that saved facing after every reset or reconstruction. Place as many candidate locations as desired for each part. A game start/reset selects one registered location per part uniformly at random and leaves the other markers inactive. If a part has no candidates, it has no pickup.

Hold the Build Stick near a candidate, right-click and release, then choose Delete Marker. Clicking an active pickup with the Build Stick also opens its deletion dialog. The builder's saved candidate ID identifies the exact marker; deletion requires it to remain within 5 blocks. Deletion removes that marker, its linked item display, interaction and text, and its registry entry. Other candidates are untouched. Deleting the selected location does not reroll mid-round; reset to choose a replacement.

## Runtime and collection

The rocket/tube pickup has a local 180-degree yaw correction so its tanks face outward in the saved marker direction. Its centering offset rotates with it, preserving its local centering before the shared placement offset.

Each selected location creates a part model (the mechanism is 1.5 blocks tall with proportional width and depth; the other parts fit within a 1-block cube) shifted 0.70 blocks toward the back of the placement block (along the saved yaw, away from the placer), a 1-by-1-block interaction, and an initially empty text display centered on the part at 0.5 blocks above the floor and 0.60 blocks forward of the model. The enlarged mechanism preserves its original floor clearance and rear extent, including the 0.18-block forward correction and the plate geometry has a 0.18-block forward correction to clear nearby walls. Their hitboxes and prompts retain their shared anchors. The mechanism prompt has an additional 0.15-block visual offset toward the viewer to clear the enlarged model, without changing its proximity-check origin. The interaction shares the model entity's 0.70-block horizontal offset, while the text sits forward of the part; the persistent marker stays at the placement block center. Item and text displays force block and sky brightness to 15 so nearby solid blocks do not darken them. When any player comes within 2.25 blocks of the offset pickup floor location, the shared text stays upright with both rotation axes locked to the saved placement orientation and a local 180-degree yaw correction so the lettering faces the approach side, showing two centered lines, `Right click` and `to pickup`; it becomes empty when everyone leaves. A right-click by a non-spectator, non-downed player within 3 blocks records collection for the entire team. The first successful pickup removes all runtime entities for that part, refreshes everyone's inventory HUD, and plays the vanilla item-pickup sound to all online players. Duplicate collection clicks have no effect. A click outside the 3-block collection radius is forwarded as a weapon-use pulse to Combat at the clicking player's position and facing, preserving normal ammunition, cooldown, and weapon input gates. Build Stick clicks never fire a gun.

The persistent marker remains after collection. Game reset clears all three collected flags and selects fresh locations. A run-generation score rejects stale runtime entities after a previously unloaded chunk returns. The candidate registry includes IDs of unloaded markers, so those locations remain eligible; a selected location creates its runtime within 20 ticks (1 second) after its chunk loads. Stale clicked pickups are rejected immediately by their run generation. Markers must be deleted through the Build Stick or this module's deletion function so the registry stays accurate.

Give All Shield Parts now sets the same three shared collected flags, removes outstanding pickups, and refreshes everyone's HUD. It also promotes a missing shield recipe from build state 0 to ready state 1 when all parts are present, as does the final part pickup. A recipe already built (state 2) stays built. It does not give ingredient stacks or a built shield. Adventure players see the HUD automatically, including late joiners; collecting or granting parts also enables it for online builders until reset. The inventory indicators are cosmetic and cannot establish collection by being moved, copied, or dropped.

## Lifecycle and ownership

| Path | Responsibility |
| --- | --- |
| `on_load` | Objectives and persistent registry initialization |
| `initialize` | Register pending placements, clear collected flags, reroll, reconstruct loaded runtime |
| `on_tick` | Per-dimension click processing and prompt visibility |
| `management/maintenance` | Shared 20-tick (1-second) hook: register pending markers, reconcile loaded runtime, remove HUD drops, and repair player HUD items |
| `marker/` | Persistent candidate registration and per-dimension orchestration |
| `spawning/` | Placement eggs and derived pickup entities |
| `display/` | Reconstruction and proximity prompts |
| `interactions/` | Resolve the actual clicking player and route collection or Build Stick inspection |
| `management/` | Random selection, collection, grant-all, and precise deletion |

Candidates carry `rs_part_candidate` and `rs_plate_candidate`, `rs_mechanism_candidate`, or `rs_rocket_candidate`. Their unique `rs_candidate` score is authoritative identity. Storage `zombies:shield_parts candidates` indexes registered IDs by part. `#next rs_candidate` is monotonic across resets. Runtime entities copy the candidate ID and current `#run rs_epoch`; they are disposable derived state.

Global fake players `#plate`, `#mechanism`, and `#rocket` hold `rs_chosen` (selected candidate ID, or 0) and `rs_collected` (0 missing, 1 collected). Crafting reads these flags, never inventory items. `rs_ui_preview` enables builder HUD previews, and `rs_edit` stores a builder's chosen deletion target.

## Tick cost

Only click polling and prompt visibility run every tick. Each loaded prompt performs one player-range query and writes its text/state only when visibility changes. Candidate registration, runtime reconciliation, dropped-HUD cleanup, and per-player HUD repair run through the existing global 20-tick (1-second) schedule; no additional repeating schedule is created. Collected parts skip candidate enumeration. Collection and grant-all still update inventory indicators immediately. Reset rebuilds loaded pickups immediately; chunk-load recovery and moved/duplicated HUD repair can take up to 1 second.

## Public commands and validation

Reset and reroll all locations:

```mcfunction
function zombies:map_elements/rocket_shield/initialize
```

Grant the shared recipe for crafting tests:

```mcfunction
function zombies:map_elements/rocket_shield/management/give_all_parts
```

`management/delete_candidate` runs as a specific candidate marker at its position; builder dialogs call it through a validated selection. HUD behavior and slots are documented in the [Player module](../../player/README.md). [Combat](../../combat/weapons/special_equipment/rocket_shield/README.md) owns give/refill/remove for the equipped shield.

Run `python tools/validate_core.py` from the datapacks repository for static validation. Test candidate selection, collection, reset, deletion, and chunk reload in an isolated Minecraft 26.2 world. Player clicks, proximity rendering, and inventory appearance require client inspection.

Dimension-dispatched candidate registration, runtime maintenance, prompt updates, and interaction checks restrict their entity selectors to the current dimension with `distance=0..`. Each loaded entity is processed once per intended interval across the three vanilla dimensions. Prompt and interaction handling remain per tick; maintenance remains once per second.
