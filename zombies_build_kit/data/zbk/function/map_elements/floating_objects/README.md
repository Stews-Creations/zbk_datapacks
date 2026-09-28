# Floating objects

Owns reusable floating props and anti-gravity-center presentation. There is no map
ID restriction. The car and truck each use one resource-pack item display. The couch retains its block-display implementation.

## Ownership and lifecycle

| Folder or hook | Responsibility |
| --- | --- |
| `spawning/` | Car/truck placement and anti-gravity effect-marker placement |
| `model/` | Runtime visual spawning; generated geometry has no gameplay logic |
| `effects/` | Hover/sway movement and anti-gravity presentation |
| `initialize` | Rebuild loaded cars and trucks from their placement markers |
| `on_tick` | Advance truck/car motion and ambient effects |

`game/initialize` calls `initialize` on reload and game reset. Car markers preserve
the placement origin; derived `floating_car` item displays are recreated there.
The existing 100-tick (5-second) hover/sway cycle and 0.01-block movement steps are
unchanged. The runtime entity is one block below the marker with a compensating
one-block visual translation. Its 14-block-wide, 3.25-block-high culling box covers
the body and wheels. View range is `0.5f`; effective visibility depends on client entity-distance settings.

## Placement and removal

```mcfunction
function zbk:map_elements/floating_objects/spawning/car
```

Run at the desired original model origin. For removal, delete the intended
`floating_car_marker` and call `function zbk:map_elements/floating_objects/initialize`.
The `model/car` function is the internal runtime factory, not a persistent placement
command. The matching resource pack is required; reload it with F3+T after updates.

## Replacing already saved cars

Install the updated datapack and resource pack, use F3+T, then run `/reload`
outside a game with the cars loaded. Initialization adopts each saved
`floating_car` block-display root into persistent placement, removes its passenger
pieces before its root, and reconstructs one item display per marker. A marker
within 1 block is reused to avoid duplicating a previously manually converted car.
The saved root's current position, including its sway offset, becomes the origin
when no marker exists. Couches are not selected by this conversion. Trucks follow the equivalent replacement process described below.

Previously unloaded cars are converted on the next initialization after their
area is loaded. To run that directly in the current dimension:

```mcfunction
function zbk:map_elements/floating_objects/initialize
```

Repeated initialization replaces runtime displays without creating more markers
or visuals. Conversion runs only during initialization, not in the tick loop.

## Generated assets

The item visual uses a 180-degree Y correction to cancel Minecraft's item-renderer
turn. This preserves the source block-display geometry around its original anchor.

The baked model enables conservative hidden-face removal during generation.
Only complete faces covered by opaque axis-aligned cuboids are removed; partially
exposed faces, transparent surfaces, and arbitrary rotations are retained.
Exterior coordinates, UVs, bounds, and runtime transforms are preserved. These
geometry-only updates apply with F3+T without rebuilding runtime entities.

## Truck placement and conversion

`function zbk:map_elements/floating_objects/spawning/truck` places a persistent `floating_truck_marker` and one derived `floating_truck` item display. Remove the intended marker and call `initialize` to remove its visual. `model/truck` is the internal runtime factory.

On reload or game reset, initialization adopts loaded old `floating_truck` block-display roots, removes their passengers and roots, and rebuilds one item display per marker. A marker within 1 block is reused; otherwise the saved root's current position becomes the placement origin. Previously unloaded trucks convert on the next initialization after loading their area. Repeated initialization does not add markers or duplicate visuals.

The truck retains its original anchor, scale, and 100-tick (5-second) motion cycle. Its runtime origin is lowered 2.25 blocks with an equal upward visual translation. Culling width is 18.5 blocks and height is 5.5 blocks, enclosing the complete model. View range is `0.5f`. Effective distance depends on client settings.

The truck source includes all 82 original block-display pieces, including the visible root. Its generated resource model removes fully occluded faces conservatively. Install the matching pack, press F3+T, and run `/reload` with the truck loaded to replace it. Check placement and floating motion in game after conversion.

Car, truck, and couch visuals use `view_range:0.5f`. Couch roots and their passengers receive this range during placement and initialization; the couch remains a block-display assembly.
