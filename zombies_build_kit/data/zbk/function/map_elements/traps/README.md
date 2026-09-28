# Traps module

Owns reusable linked electric-trap corners, purchase controls, collision-volume damage, particles, and cooldowns. Persistent corner and sign markers store placement and link configuration; temporary targeting tags and active/cooldown scores belong to runtime.

## Lifecycle and responsibilities

Runtime keeps active damage and cooldown phases separate across traps. The inactive gate does not suppress placement. Coordinate helpers may switch executor to the linked corner while retaining the first corner's origin; both particles and damage consume the same resolved bounds.

The current particle implementation is reached through `electric/particles/core/spawn_grid`. Unused archived particle functions with stale references are removed; historical implementations remain in version history. Build Kit marker editing belongs to the [authoring module](../../build_kit/README.md). Follow the [function architecture](../../README.md) for temporary state and lifecycle changes.
