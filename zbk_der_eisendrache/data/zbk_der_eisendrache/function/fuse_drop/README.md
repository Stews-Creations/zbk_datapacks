# Der Eisendrache Round 1 Fuse Drop

Owns the persistent placement marker and Round 1 timing for the guaranteed Der Eisendrache Fuse drop. The shared Fuse model, pickup behavior, player state, and drop gating remain owned by `combat/powerups/fuse/`.

## Placement

Select Der Eisendrache, stand at the desired drop location, and run:

```mcfunction
function zbk_der_eisendrache:fuse_drop/spawning/summon_marker
```

The command replaces any existing `de_fuse_drop_marker`, so exactly one configured Fuse location exists. The marker is persistent configuration and is not removed during normal game resets.

## Round lifecycle

The Der Eisendrache Round Start event schedules `spawning/spawn_round_one` only when Round 1 begins. The callback runs 1 tick after the event, allowing the shared round-start function to finish its calculations, counters, countdown, and active-state setup first. It defensively verifies Der Eisendrache, an active game, Round 1, the initialized round state, and that no Fuse is already active before spawning the shared Fuse drop at the marker location.

Later rounds never schedule this drop. Game reset cleanup of the runtime Fuse remains owned by the shared combat powerup lifecycle.
