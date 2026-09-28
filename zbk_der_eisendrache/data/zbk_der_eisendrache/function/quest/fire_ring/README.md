# Der Eisendrache fire ring

Map 2 owns courtyard target presentation and arrow-hit revelation. Placed `fire_ring_courtyard` item-display assemblies remain the runtime targets; initialization hides their roots and passengers and clears permanent revelation.

## Visibility and ticks

`on_tick` checks whether any player rides a `launch_arc` vehicle once per tick for shared temporary visibility. Unrevealed targets transition to visible at `view_range:0.5f` while a rider exists and to `0f` otherwise. Both roots and passengers receive the range. Permanent arrow-hit revelation uses `0.5f` and persists until initialization. Client entity-distance settings scale the effective distance.

`fire_ring_temporary` and `fire_ring_hidden` record the last applied visibility on each target. Showing, hiding, revealing and initializing maintain these tags. Unknown state on newly loaded targets is reconciled on the next tick; recorded temporary state is rechecked against current rider presence. The `#fire_ring_rider temp` scratch score is recomputed every tick. Unchanged states do not rewrite entity NBT. External edits to range or passengers must use these visibility functions or reinitialize the feature to synchronize the state tags.

Rider-arrow tagging, owner checks, grounded-arrow detection, permanent reveal effects and sound keep their original timing and ordering. The enclosing Map 2 quest dispatcher owns lifecycle dispatch; this module adds no independent schedule.

A temporary `de_fire_ring_rider` player tag shares the root-vehicle check between visibility and arrow attribution in the same synchronous tick. It is cleared before collection and after processing, so dismounts and multiplayer changes are observed every tick. Nearby arrow-hit targets use one selection pass.
