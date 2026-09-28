# Combat powerups

Owns drop eligibility, pickup entities, powerup timers, activation effects, and the HUD state read by Player. `on_load` defines objectives and calls `initialize`; `on_tick` advances timers, processes candidate drops, updates presentation, and checks pickups.

## Candidate processing

Each kind uses one item selection and a native item check for spawning, diagnostics, and disposal. The internal `spawning/consume` macro receives a fixed powerup kind and label, executes as the candidate item at its position, checks the shared drop gate, and consumes the candidate whether accepted or rejected. Debug diagnostics identify rejected candidates.

## Ownership

Per-powerup folders own spawning, pickup, activation, sound behavior, timers, and activation-order scores. `spawning/` owns shared candidate gating. The [Player actionbar](../../player/README.md#mirrored-actionbar-hud) reads activation scores for timed-powerup display. Player inventory and ammunition capacities remain owned by Player and Combat. Carpenter delegates barrier reconstruction to the [barrier module](../../map_elements/barrier/README.md).

Powerup drop sounds use shared `zombies:drops.*` events. Max Ammo also refills charges on an existing owned Rocket Shield without repairing durability or granting a replacement.
