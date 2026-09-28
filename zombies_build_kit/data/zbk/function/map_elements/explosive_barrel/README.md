# Explosive barrels

Reusable explosive props with no map ID restriction. Each placed barrel has one
persistent `explosive_barrel` marker, one `explosive_barrel_display` item display,
and one `explosive_barrel_interaction` interaction entity. The matching resource
pack supplies the fixed visual model; the interaction stays 1 block wide and 1.6
blocks tall independently of visual geometry.

## Responsibilities

| Folder or hook | Responsibility |
| --- | --- |
| `spawning/` | Spawn egg, persistent placement, item display, and interaction |
| `gameplay/` | Hits, explosions, area damage, effects, and individual reset |
| `on_load` | Define objectives and rebuild loaded barrels |
| `initialize` | Clear derived runtime and rebuild every loaded marker at full health |
| `on_tick` | Placement, interaction, and damaged-barrel effects |

Game reset/reload and the Build Kit reset-all command call `initialize`, including
for undamaged barrels. All runtime is cleared before reconstruction, avoiding
duplicate displays on repeated resets. Single-barrel reset, explosion, and Build
Manager deletion retain their existing proximity selection behavior.

## Gameplay and rendering

Markers own `barrel_health`, initially 100. Bullets deal 34 damage, so three hits
explode a fresh barrel. Explosive hits detonate immediately. The marker retains
`explosive_barrel_exploded` after its runtime is removed and is reused on reset.
Explosion behavior is unchanged: effects and sound, a 7-block damage radius,
10 HP player damage, and 200 damage to eligible zombies/wolves. Existing immunity,
and powerup logic remains in the gameplay functions.

The visual is one item display with `view_range:1f`, nominally 64 blocks at 100%
Entity Distance, and a 2-block-wide, 1.75-block-high culling box. It retains the
authored 1.5x barrel design scale. This replaces the passenger display assembly;
health, bullet detection, explosions, and deletion do not use visual model pieces.

Use the Build Kit spawn egg and existing marker dialog for placement, reset, and
deletion. The runtime rebuild command is:

```mcfunction
function zbk:map_elements/explosive_barrel/initialize
```

## Updating already saved barrel visuals

Install both updated packs, use F3+T, and run `/reload` outside a game with the
barrels loaded. Initialization removes both older block-display assemblies and
current item displays before rebuilding from the persistent markers. Saved
passengers are removed before their roots so old geometry cannot survive a reset.
Explosion, single-barrel reset, and Build Manager deletion also clean both visual
formats within their existing 3-block cleanup radius. Damage and hitbox behavior
is unchanged.

For a previously unloaded area, load its barrels and run:

```mcfunction
function zbk:map_elements/explosive_barrel/initialize
```

This resets loaded barrels to full health and preserves their markers. Only the
new single-item-display format is created.

The matching core resource pack supplies the generated barrel model.

The item visual uses a 180-degree Y correction to cancel Minecraft's item-renderer
turn. This preserves the source block-display geometry around its original anchor.

The baked model enables conservative hidden-face removal during generation.
Only complete faces covered by opaque axis-aligned cuboids are removed; partially
exposed faces, transparent surfaces, and arbitrary rotations are retained.
Exterior coordinates, UVs, bounds, and runtime transforms are preserved. These
geometry-only updates apply with F3+T without rebuilding runtime entities.
