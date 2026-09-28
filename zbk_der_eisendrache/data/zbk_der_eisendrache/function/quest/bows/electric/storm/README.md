# Electric storm runtime

Map 2 owns charged electric-bow storm centers, paired breeze visuals, enemy suspension and pulse effects. Gameplay values and damage attribution are documented in the [quest module](../../../README.md#charged-electric-bow). Center creation assigns a unique positive `de_storm_link` shared with its breeze and captured enemies.

## Center lookup batches

`animations/tick_breezes` and `effects/tick_held` each build a fresh center-membership snapshot immediately before their synchronous entity loop. The original entity selection and iteration order are preserved. `lookup/prepare` clears and rebuilds the `zbk:temp storm_lookup_index` compound: `seen` records every loaded center by its numeric link key; `live` records those with positive lifetime. This preserves the distinction between visual orphan checks and held-enemy lifetime checks.

`#storm_lookup_active temp` permits only that batch to use the snapshot. `lookup/finish` clears the flag, the index compound and `zbk:temp storm_lookup` query storage after every batch. There is no cross-tick entity cache. Batch callbacks may change captured entities but must not create, remove or change the lifetime/link of storm centers. Center expiration and owner-loss cleanup occur before the breeze batch. The held batch rebuilds its own snapshot after other quest work.

Direct calls to `animations/breeze_tick` or `effects/hold` outside a batch retain fresh entity lookup. Missing links cannot reuse the previous query's storage value. The maps dispatcher invokes held-enemy recovery even outside Map 2; wrong-map guards release captured enemies or remove orphan breezes without relying on a snapshot.

`on_load` clears leftover lookup state. Clearing the small index does not scan scoreboard holders. The parent quest module owns lifecycle dispatch. Existing capture eligibility, per-tick lift steps, damage radius/cadence, owner attribution, saved AI/gravity restoration and cleanup behavior are unchanged.
