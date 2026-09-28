# Der Eisendrache Rocket Module

Owns the Map 2 rocket model, readiness gate, launch state, ascent, effects, and cleanup.

## Structure

| Path | Responsibility |
| --- | --- |
| `model/` | Baked item visual and invisible controller creation |
| `effects/` | Root-relative booster particles and launch cleanup |
| `management/` | Map selection, readiness, launch, game-start launch, and deletion |
| `movement/` | Per-tick ascent, synchronized booster effects, and height tracking |
| `spawning/` | Synchronous model reconstruction |

The module root contains the standard `on_load` and `on_tick` lifecycle hooks plus this documentation.

## Lifecycle

`on_load` creates rocket objectives and clears the obsolete standalone movement schedule. The selected-map dispatcher calls `on_tick` only for Der Eisendrache, and `on_tick` defensively checks the active ID before advancing the rocket. The maps selection-change and initialization handlers call `management/apply_map_selection`, which removes the rocket outside Map 2 or starts reconstruction at the Der Eisendrache pad. The map game-start preparation event checks `management/ensure_ready` before continuing. At the actual game-start launch, the rocket begins moving after 60 ticks (3 seconds) and the 25.08-second Map 2 liftoff clip plays once to every player at volume 0.75 without distance attenuation. During ascent, the model moves 1 block per tick (20 blocks per second) and emits the restored root-relative redstone-block debris, flame, smoke, and lava-spark booster particles every tick from the moving rocket.

The invisible rocket root and its single item-display passenger are derived runtime entities. `management/delete` clears the model, scores, pending schedules, and any active liftoff playback. `#rocket_skip_reset global` allows an intentional prebuilt rocket to survive the game-start reset.

## Manual Launch Command

```mcfunction
function zbk_der_eisendrache:rocket/management/launch
```

The command returns without changing state unless Der Eisendrache is active.

## Display rendering

The rocket uses one `rocket_body` item display on the original invisible
`rocket_root` controller. All original visible geometry, including the former
root cube, is baked into `zbk_der_eisendrache:props/rocket`. Reconstruction is synchronous;
there is no passenger batch schedule or build-progress objective. The readiness
gate still checks that the rocket exists before game start.

The visual uses `view_range:1f` (nominally 64 blocks at 100% Entity Distance,
further limited by client settings and tracking). It retains zero culling bounds
because the original geometry extends below the controller. The model restores
its authored scale and cancels the item renderer's Y half-turn, preserving the
pad anchor, ascent, and booster positions. Lighting is sampled at one origin.

The [fixed-prop compiler](../../../../../../resourcepacks/zbk_der_eisendrache/README.md)
owns the source scene and generated resource-pack geometry. Install the matching
packs, press F3+T, and run `/reload` outside an active game with the pad loaded.
Reset removes the old tagged assembly and creates the new controller/model pair.
Check appearance and lighting at the pad and during ascent in game.

The compiler removes fully hidden faces covered by opaque cuboids, preserving
visible geometry, textures, bounds, and the pad anchor. Partially exposed faces
remain intact, and transparent parts cannot hide other faces during compilation.
Geometry-only updates apply with F3+T; existing rocket entities need no rebuild.
