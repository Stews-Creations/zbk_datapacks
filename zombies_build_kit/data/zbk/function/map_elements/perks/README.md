# Perks

Owns the reusable perk machines, Der Wunderfizz, purchase limits, acquisition order, player effects, and perk clearing. The six implemented perks are Juggernog, Stamina Up, Speed Cola, Double Tap, Quick Revive, and Mule Kick.

## Lifecycle and state

`on_load` defines perk objectives and triggers. `initialize` clears runtime entities and player perk state, and `on_tick` and `on_tick_as_player` maintain machines, effects, and interactions. Each successful grant increments `perk_count` and the player's `perk_order`, then stores that acquisition position in the perk-specific score.

The standard purchase limit remains 4. Maps may raise that limit separately; the [player actionbar](../../player/README.md#layered-actionbar-hud) already reserves nine positions and reads acquisition scores from 1 through 9. Perks no longer occupy or clear hotbar slots.

## Responsibility folders

Each named perk folder owns placement, purchase, grant, sound, and sign updates. `wunderfizz/` owns random selection, claiming, presentation, and location movement. `management/` owns shared application, clearing, and bonus handling.

Persistent placement markers are the source of truth. `initialize` resets perk state and rebuilds Wunderfizz UI from them. Public purchase and grant functions remain guarded by the owning perk state and the shared limit.

## Model machines and collision

Spawn eggs place the seven cabinet models through `zbk:map_elements/perks/machines/placement/` using the matching base resource pack. The six perks retain their existing prices and purchase rules; Der Wunderfizz retains its random-perk cycle and location system. Right-click a cabinet to buy, or use the Build Manager to open its delete dialog.

Cabinet item displays use `view_range:0.35f`, matching the mystery box. This is a client entity-distance multiplier, not a distance in blocks. Placement and reconstruction apply it; reload or reset rebuilds loaded v2 cabinets with the reduced range, including displays temporarily hidden for diagnosis. Label ranges are independent.

New markers carry `pm_v2`, plus `perk_machine` and the perk-specific tag, or `wunderfizz`. Their displays, interactions, and labels carry `pm_v2_runtime` and share the marker's `pm_v2_id` score. Bottle item IDs remain `zbk:perks/<perk>`; cabinet item IDs are `zbk:map_elements/perks/<perk>`.

Placement snaps to a block center and the nearest cardinal facing. Cabinet displays rotate 180 degrees from that saved facing so their fronts face the placing player; rebuilding also corrects existing v2 displays. It requires two air blocks above the floor and reserves them as a two-block-high barrier column inside the cabinet. Initialization rebuilds owned entities and restores missing barriers without replacing other block types. The wider cabinets also use invisible magenta glass-pane side rails in the two adjacent side columns, rotated with the machine. Juggernog retains the narrow footprint. Side rails are only added to air cells, and their ownership is saved on the marker. Reload upgrades existing placements. Delete removes owned entities, the central barriers, and owned side rails; replacement blocks and pre-existing map panes are preserved. Adjacent machines reacquire any needed empty side cells after deletion.

Standard machine labels sit on the lower cabinet front, one block above the floor and 0.675 blocks forward from the placement marker, and stay aligned with the machine instead of turning toward the camera. New machine interaction boxes are 1.25 blocks wide and 2.4 blocks tall, starting at the floor. Each client shows them only at close range (2.5 blocks at the default entity-distance setting), independently of other nearby players. Wunderfizz places its price, selected-perk name, and bottle at the same position beneath the nozzle: 1.25 blocks above the floor and 0.0875 blocks toward the back from the marker. The bottle keeps the cabinet facing throughout cycling and claiming instead of turning toward the camera. Wunderfizz retains its power, active-location, and purchase-cycle visibility rules. Reload rebuilds saved v2 labels at the new position.

Existing block machines are tagged `perk_machine_legacy` during initialization and remain usable. They are not automatically converted to v2. Both generations retain Build Manager deletion: legacy cleanup checks the old machine's saved orientation, block types, and entity positions instead of placing an empty template over neighboring builds. New machine entities are excluded from legacy cleanup. Select a machine again if its dialog target has been removed or is more than six blocks away.

The older transitional `pm_marker` restoration remains separate from `pm_v2`; it cannot replace new machines with structures. Runtime model exports do not include Blockbench authoring projects.

To opt an existing block placement into conversion, tag its marker `pm_v2_upgrade` and initialize the perk module with that chunk loaded. Conversion uses its saved `playerYaw` and the bounded legacy cleanup, preserves its UUID, and removes the upgrade tag after success. Markers without a saved orientation are left pending. Untagged legacy machines remain unchanged.

## Validation

From the datapack repository, run `python tools/test_perk_machines.py --server-jar PATH --java PATH` with a Minecraft 26.2 server JAR and Java 25. The disposable local server checks placement, collision blocks, reset/reload, selected deletion, legacy cleanup, and purchase routing. Check model rendering, right-click targeting, and walking collision in a client with the matching resource pack before releasing a map.

## Authoring ownership

Feature-specific editor functions and Build Manager handlers live inside the owning gameplay feature's `build_kit/` folder. The shared Build Manager only owns tool input, pending selection, and routing; each feature preserves its own dialog context and cleanup order.
