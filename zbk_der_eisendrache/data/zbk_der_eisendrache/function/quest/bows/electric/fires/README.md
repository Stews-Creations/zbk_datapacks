# Der Eisendrache electric bow fires

Map 2's first electric upgrade milestone: light three individually placed fire targets with the original bow while bound to the electric quest. Binding the initial arrow gives zero filled UI segments. Lighting all three fires fills exactly the first of four segments. The anti-gravity panel loop, charged-fire stage and final arrow pickup are later gameplay steps.

## Placement and testing

Select Map 2. Build each bonfire from real blocks in the overworld. Stand on top of its logs, centered at the intended flame base, and place the three unique IDs:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/fires/spawning/place {id:1}
function zbk_der_eisendrache:quest/bows/electric/fires/spawning/place {id:2}
function zbk_der_eisendrache:quest/bows/electric/fires/spawning/place {id:3}
```

Each placement saves an invisible marker at your feet and reconstructs an invisible shot hitbox 5.5 blocks wide and 5 blocks high, plus a rotating effect anchor. The hitbox starts 4.25 blocks below the marker and ends 0.75 blocks above it; the effect anchor remains at the marker. No fire model or block display is spawned. Keep the marker above the logs at the intended flame base; an arrow striking a solid block inside the hitbox counts as a fire hit. Blocks struck outside the hitbox still stop the arrow. Placement, ignition, reset and deletion never place, replace or burn world blocks, and the particles do not damage players. Keep targets separated so their hitboxes do not overlap. You can place and test one target first, then place the others; no UI segment fills until IDs 1, 2 and 3 are all lit.

Repeating an ID moves that unlit target. A lit target must be reset first, and an existing placement must be loaded before it can be moved or deleted. Invalid IDs are refused. Configuration records prevent creating a duplicate when the old marker is unloaded.

Bind electric through the [weather-vane arrow](../weather_vane/README.md), then use the original bow:

```mcfunction
function zbk_der_eisendrache:combat/weapons/guns/bow/give/main
```

Shoot inside the hitbox around each marked log pile. Passing through the hitbox or striking a block inside it both qualify. Original-bow shots reach up to 750 blocks through loaded terrain; an obstruction outside the hitbox still stops them. Both quick and charged original-bow shots qualify, including the packed original bow. Only the current electric owner can progress this stage; the upgraded electric weapon and the other elemental bows do not qualify. Nearby right-clicks intercepted by a fire interaction use the genuine original-bow firing path for the exact clicking player.

A valid hit lights that target, starts a continuous fire tornado: twin orange flame spirals rising about 7.2 blocks, a widening smoke plume at 7.4 to 8.6 blocks above the marker, and scattered embers. The fire-count and first-segment completion chat messages are visible only to the shooter when tagged `debug`. Normal players receive the flame effects and inventory-ring progress without chat logs. Placement/deletion confirmations and setup errors remain visible to the operator. Already-lit targets cannot add credit again. Accepted hits consume the bow shot without a second explosion behind the target. Once all three are lit, the inventory indicator changes from 0/4 to 1/4. The next three segments have no completion triggers in this implementation.

Reset this fire stage while retaining placements and the current quest binding:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/fires/initialize
```

This resets electric progress to 0/4 and stops particle emission at all three targets; existing particles fade naturally. Your built logs remain untouched. The broader vane/game reset also resets this stage. Switching or releasing bindings does not call reset and never extinguishes a fire.

To remove a misplaced unlit target without remembering its ID, stand within 8 blocks of it:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/fires/management/delete_nearest
```

This selects the closest persistent fire marker and removes only that target. It refuses to remove a lit fire until reset. A missing nearby marker reports the distance requirement. Explicit ID deletion distinguishes an unregistered ID from a registered placement whose marker is unloaded; it never clears an unloaded registration blindly.

Delete an unlit, loaded placement by ID:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/fires/management/delete {id:1}
```

## Ignition audio

First-stage bonfires are silent: neither individual ignition nor completion of the third fire plays a sound. The custom bonfire cue plays only during the later [soul-pot electric-fire conversion](../soul_pots/README.md#charging-and-electrifying-fires), not when these initial fires are lit.

## State and milestone contract

| State | Meaning |
| --- | --- |
| `de_el_fire_marker`, `data.id` | Persistent authored position and unique fire ID 1, 2 or 3 |
| `#1..#3 de_el_fire_set` | Placement registration, retained across resets to protect unloaded placements |
| `#1..#3 de_el_fire_lit` | Shared quest completion flags, independent of loaded entities or owner |
| `#electric de_el_progress` | Number of fully completed electric milestones, 0 through 4 |
| `de_el_fire_runtime` / `de_el_fire_<id>_runtime` | Reconstructed invisible effect anchor and interaction entities |
| `de_el_fire_fx` on runtime markers | Disposable rotating anchor for the particle tornado |
| `de_el_fire_id` on interactions | Authoritative target ID copied from its placement marker |

Markers own placement configuration; shared lit flags own progression. Counting the three fixed score holders lets the third hit finish the stage even when earlier fires are in unloaded chunks. Progress belongs to the electric quest, not the player who lit each target. Its next owner resumes the same flags and UI state.

The four-segment UI contract is:

| Filled segments | Completed milestone |
| --- | --- |
| 0 | Initial arrow bound; none of the following milestones complete |
| 1 | All three initial fires lit |
| 2 | Full anti-gravity loop over all five panels |
| 3 | All three charged arrows hit their fires |
| 4 | Interact at the original arrow location and pick up the arrow |

This module implements milestone 1; the [wall-panel module](../wall_panels/README.md) implements milestone 2 and the [soul-pot charged-shot flow](../soul_pots/README.md) implements milestone 3. The [arrow reforging module](../reforging/README.md) implements milestone 4 on the final pickup. Each module advances `#electric de_el_progress` only after its entire milestone completes, not for individual panels or fires. Binding, unbinding and HUD preview never modify this value.

## Lifecycle and responsibilities

| Path | Responsibility |
| --- | --- |
| `on_load` | Define fire configuration, completion and electric-progress objectives |
| `initialize` | Clear completion, reset electric progress and reconstruct unlit runtime on Map 2 |
| `on_tick` | Repair missing or mismatched targets, apply saved lit state, emit effects and bridge close bow clicks |
| `spawning/` | Guarded authoring and runtime creation |
| `display/` | Reconstruct missing or mismatched runtime and gate lit effects using shared completion flags |
| `effects/` | Rotate the disposable anchor and emit flame spirals, smoke and embers |
| `interactions/` | Shooter ownership, real bow eligibility, ray contact and one-time ignition |
| `management/` | Guarded deletion by ID or nearest unlit placement |

Flame strands emit every 2 ticks (0.1 seconds); smoke and embers emit every 10 ticks (0.5 seconds). The effect anchor rotates 8 degrees per tick. Effects run only with a player within 256 blocks and particles are sent only to nearby players. Unlit targets emit nothing. Missing hitboxes or effect anchors are rebuilt from the persistent marker without changing completion. Loaded hitboxes are also checked against the current width, height, marker-relative position, target tag and fire ID; a mismatch rebuilds that target. This repairs older runtime when a previously unloaded chunk returns. Reload and explicit reset discard loaded runtime and recreate it through the normal game/quest initialization path.

Shot detection fetches the three fire interactions before checking each entity's bounds, so a hitbox extending across a chunk-section boundary remains hittable throughout its volume. The combat bow's nearby-interaction lookup includes the origins of these tall hitboxes; the block-impact handler also checks the exact collision sample against the fire hitbox before running explosion effects. This applies to both midpoint and endpoint wall checks. Accepted initial or soul-pot-charged hits consume the shot; impacts outside the hitbox and ineligible shooters retain ordinary block collision.

At progress 2, the same original-bow hitbox check delegates electric shots to the soul-pot module. A successful hit saves `#<id> de_ec_fire = 1` and switches the existing tornado to blue soul flames and electric sparks. Ordinary uncharged hits do not convert it. The soul-pot module owns source-pot consumption and advances the third HUD segment only after all three fires are electric. No real blocks are changed.

Quest `on_load` and `on_tick` delegate here. Weather-vane cleanup invokes `initialize`, including full quest reset and map deselection; cleanup clears state on any map but runtime creation remains Map 2-only. The same explicit reset also clears the [soul-pot charges](../soul_pots/README.md), while ordinary binding changes preserve both systems. `maps/events/electric_bow_fire_shot` is the central dispatch boundary from combat. This module owns no combat damage, weapons, Mystery Box entries or wall buys. The separate courtyard `quest/fire_ring` system is unchanged.

## Validation

Use real-player server tests for original-bow ray contact, quick/charged shots, ownership and bow rejection, one/two fires leaving the ring empty, three fires granting one segment, duplicate-hit suppression, ownership switching, reconstruction from saved flags, reset, deletion and Map 2 guards. Verify the generated four-segment assets and item model paths. Also verify no fire block displays spawn, lit anchors rotate while unlit anchors stay still, and real log blocks survive ignition, reset and deletion. Client particle appearance and targeting still need an in-game check at the authored positions.

## Runtime marker dispatch

`display/set_charge` applies the charge state to every runtime-effect marker selected for the authored fire ID. Missing global charge state still clears the local charge flag. Interaction reconstruction and the separately selected effect emitter retain their previous order; no ID registry or cross-tick cache is added.
