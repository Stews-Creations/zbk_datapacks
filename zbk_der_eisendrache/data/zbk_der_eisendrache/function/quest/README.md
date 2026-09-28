# Der Eisendrache Quest Module

Owns the Easter-egg and quest systems exclusive to Der Eisendrache (Der Eisendrache).

## Subsystems

| Path | Responsibility |
| --- | --- |
| `bows/` | Default and electric bow quest behavior, owned charged lightning storms, and model spawning; pickup, binding and electric-fire progress chat targets only the tagged `debug` player; the older electric hit placeholder no longer broadcasts chat |
| [`bows/electric/weather_vane/`](bows/electric/weather_vane/) | Map 2 vane placement, original-bow quest trigger, saved breakable wall, and broken-arrow pickup |
| [`bows/electric/wall_panels/`](bows/electric/wall_panels/) | Five placed wind panels; eligible-owner wall-run attempt with jumping, ground-contact reset and second quest segment completion |
| [`bows/electric/soul_pots/`](bows/electric/soul_pots/) | Three soul pots, saved charge, electric base-bow shots and three electric tornadoes completing the third HUD segment |
| [`bows/electric/reforging/`](bows/electric/reforging/) | Placed bottom-arrow interaction, ascent and accelerated vane effects, full-arrow pickup and final HUD segment |
| [`bows/electric/ritual_box/`](bows/electric/ritual_box/) | Final 15-soul ritual and safe original-to-electric bow exchange |
| `souls/` | Shared custom-kill deduplication and native killer UUID routing to the active electric quest collector |
| `disco/` | Persistent disco placement marker, reconstructed model and interaction, detection, effects, and trigger state |
| [`dragon_heads/`](dragon_heads/README.md) | Dragon-head modes, soul collection, animation, and completion; completion tellraws target only players tagged `debug` |
| `fire_ring/` | Courtyard fire-ring progression |
| `wolf/` | Painting shuffle, wolf quest progression, and spawning; spawned painting item frames are fixed to lock their items and rotation |

## Lifecycle

- `on_load` delegates scoreboard and trigger-objective setup to quest subsystems without creating runtime state.
- `initialize` clears transient electric storms, resets dragon heads, fire ring, wolf, and disco state, rebuilds disco runtime from `de_disco_marker` entities, and resets the vane quest: restoring marked wall blocks, clearing broken-arrow ownership, and reconstructing the vane from its persistent marker.
- `on_tick` orchestrates electric-bow projectiles, weather-vane spin testing, dragon souls, fire ring, disco, wolf runtime behavior and final electric-arrow reforging while Der Eisendrache is selected.
- `enable_triggers` delegates quest trigger enabling.
- `management/cleanup` removes transient wolf, dragon, bow, disco, electric-bow, and weather-vane runtime and hides fire rings when another map is selected. The vane, wall-block and arrow-placement markers survive; loaded wall blocks are restored.

## Public commands

| Command | Purpose |
| --- | --- |
| `function zbk_der_eisendrache:quest/disco/spawning/summon` | Place a persistent disco marker and build its runtime at the current position |
| `function zbk_der_eisendrache:quest/disco/management/delete_nearest` | Delete the nearest disco marker within 5 blocks and rebuild remaining disco runtime |
| `function zbk_der_eisendrache:quest/wolf/spawning/spawn_egg` | Give the wolf-painting placement egg |
| `function zbk_der_eisendrache:quest/bows/summon/spawn_marker` | Place the dragon-bow reward marker |
| `function zbk_der_eisendrache:quest/bows/electric/give` | Give the older enchanted vanilla test bow (separate from the working combat weapon) |
| `function zbk_der_eisendrache:quest/bows/electric/weather_vane/spawning/place` | Place the electric-bow vane; see its [test commands](bows/electric/weather_vane/README.md) for spin, stop, reset, and deletion |
All public commands require Der Eisendrache (Der Eisendrache). Dragon-head summon and manual reset functions follow the same defensive restriction.

## Uncharged electric bow

On Map 2, quick shots leave one [small electric orb](bows/electric/orb/README.md) at the first valid enemy or block impact. The orb lasts 60 ticks (3 seconds), shocks susceptible enemies within 2.5 blocks, and preserves the original shooter's combat credit. Central map events own dispatch; the orb module owns runtime and cleanup.

## Charged electric bow

Use `function zbk_der_eisendrache:combat/weapons/guns/electric_bow/give/main` to test the working electric weapon without the dialog. Hold for 20 ticks (1 second) and release with at least 2 ammo to create a storm at the first enemy or block impact. Quick shots use the shared 45-damage electric profile; a single remaining arrow falls back to a quick shot. Combat owns input, ammo and direct hits, while `maps/events/electric_bow_charged_impact` dispatches the special attack only on Map 2. This does not advance the Easter egg or add bows to the box or wall buys.

When the charged impact creates its tornado, `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ball_explo` plays once at the impact center for all players within 15 blocks. The resource pack uses a mono Ogg Vorbis conversion of `wpn_lightning_ball_explo.flac` for positional playback. This cue does not repeat during storm pulses or for later arrivals. Quick-shot orbs also play it once at creation; misses do not play it. The existing thunder effect remains.

`bows/electric/storm/` owns the transient marker's creation (`spawning/`), rotation and lifetime (`animations/`), target selection and capture/hold/release (`effects/`), and removal (`management/`). Each `de_electric_storm` marker stores the original shooter ID in `de_storm_owner` and its remaining lifetime in `de_storm_life`. Each marker and its `de_storm_breeze` share a unique `de_storm_link`, so multiple storms by the same player remain separate. Marker expiry or owner loss removes only its paired breeze; orphan breezes are removed when loaded without a matching center. Captured enemies share their storm's `de_storm_link`, use `de_storm_life` for the 20-tick rise, and carry `de_storm_held` plus restoration tags for any preexisting disabled AI/gravity. These attacks are not persistent placements and both parts are cleared by quest initialization and map cleanup.

A storm lasts 200 ticks (10 seconds), applies Slowness VII to susceptible zombified piglins and wolves within 10 blocks, and deals lethal remaining-health damage to eligible ordinary zombies and dogs every 10 ticks (0.5 seconds), beginning on its first tick. Bosses are excluded from these damage pulses. A late entrant is hit on the next pulse, so kills can occur up to 0.5 seconds after entry regardless of round health. Slowness lasts 20 ticks (1 second), refreshes with each pulse, and reduces normal walking speed to zero; full-charge direct hits apply it immediately. It does not prevent knockback or gravity. Blue-white spiral particles, sparks and thunder remain alongside a scale-5 invisible, invulnerable, silent, non-colliding breeze circling at a 1.5-block radius. The breeze has no direct damage (`combat_ignore`), no AI or gravity, and does not run the older prototype damage logic. Grounded, susceptible piglins, wolves and Panzer controllers (`panzer_ai` iron golems) within 3 blocks of the moving breeze are captured by that tornado. With clear headroom, they rise 1 block over 20 ticks (1 second), then remain suspended with AI disabled until their linked storm ends. Panzers cancel active attacks and freeze their model; melee, flamethrower, ranged attacks and relocation cannot run while held. Panzers become eligible after their controlled spawn descent; ordinary iron golems are excluded. Already captured enemies stay linked to their original storm, so overlapping storms cannot release each other's victims. Existing levitation prevents initial capture. Expiry, owner loss, map cleanup or a missing linked center restores the captured AI/gravity flags and grants Slow Falling for 60 ticks (3 seconds). The maps dispatcher checks held enemies even outside Map 2, allowing orphan recovery after chunk reload. Capture awards no extra points and leaves storm damage ownership unchanged. No real lightning entities, fire or player damage are created. Element-immune, gun-immune, turned and combat-ignored enemies and decoys are excluded. Storm pulses do not receive Pack-a-Punch damage multipliers or trigger further elemental effects.

Active charged-shot tornadoes loop `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado` at volume 0.5 for players within 10 blocks of the storm center. Each listener hears the nearest live storm once every 91 ticks (4.55 seconds), using the mono Ogg Vorbis conversion of `pfx_stormbow_tornado.flac`. Proximity is checked every tick: entry starts playback, leaving the radius or losing the last nearby live storm stops it. Overlapping storms share one loop per listener instead of stacking identical audio. Playback originates at the selected storm when each clip starts; movement updates the source on the next repeat. The per-player `de_storm_audio` countdown is owned by storm `effects/`, with quest tick dispatch after storm expiry and explicit cleanup on map/reset. The vane uses a separate event backed by the same asset so stopping one does not interrupt the other.

Every pulse restores its marker's shooter ID before calling the shared combat collision and points handlers. Accepted pulses award normal hit and kill points, Double Points when active, the shooter's kill statistic, the powerup-drop gate and enemy loot (including dragon soul drops). Overlapping storms retain independent owners, and a dead enemy cannot be credited twice. The nearest player and current weapon holder are never used for attribution. A storm ends if its owner disconnects; normal downed-player point restrictions still apply. Storm damage is evaluated at the victim's feet, so it does not count as a headshot.

## Electric-bow quest start

The first upgrade step is playable: shoot the vane with the original bow, wait 41 ticks (2.05 seconds) for its fast 720-degree spin, three gradually slowing turns and wall break, then right-click the broken lightning arrow. [Shared bow binding](bows/binding/README.md) reserves one quest per player and one player per quest. Switching arrows preserves quest progress and makes the released pickup available again; binding does not grant the upgraded weapon. Use the [vane setup and reset commands](bows/electric/weather_vane/README.md) to mark the wall blocks and pickup location. The [three-fire stage](bows/electric/fires/README.md) is now available after binding. Later quest stages remain separate work.

## Dragon-bow reward test

The completed dragon-head quest displays the vanilla `minecraft:bow` model at the existing `quest_dragon_bow_spawn` marker, using a fixed item transform at scale `0.4`. The marker position, facing-player billboard, pickup interaction, sounds, and duplicate-ownership check are retained. Pickup calls the original bow's combat give command, so the reward becomes a working weapon with the new held model.

After `/reload` and a resource-pack reload with `F3+T`, select Map 2 and run:

```mcfunction
function zbk_der_eisendrache:quest/dragon_heads/management/complete_for_test
```

The command requires all three placed large heads and the existing bow reward marker to be loaded. It completes the heads, activates their mini heads, and rebuilds one display and interaction at the reward marker. Repeating it replaces the transient reward without duplicating it. It does not move or create placements, or directly give the bow. Right-click the reward to test acquisition; use a loadout without the original bow because the normal duplicate-ownership check remains active. Starting a new game or reinitializing the quest resets this test completion through the usual lifecycle.

## Conventions

- Each quest owns its markers, scoreboards, effects, and reset behavior.
- `de_disco_marker` is the persistent source of truth for each disco model and interaction; `initialize` recreates runtime entities from it.
- Shared combat or map-element behavior should be called through the owning module instead of copied into a quest.
- The Der Eisendrache map lifecycle owns initialization and ticking. External combat and advancement callbacks enter through `maps/events/`, which checks Der Eisendrache before dispatching here.
- Directly callable placement, give, and reset commands defensively require Der Eisendrache.
- Generated model/animation output should remain separate from quest state machines.

## Quest inventory UI

The [quest inventory board](hud/README.md) displays a top row of collectible parts, then player portraits above all four bow emblems in fixed native slots. Electric shared progress fills its four-segment ring after all initial fires, the five-panel wall-run loop, charged fire hits and reforged arrow pickup. Shield/Ragnarok part tracking remains unconnected and is shown as missing-part placeholders. Core's inventory event updates the Adventure-only board through player inventory management; owner profiles are cached and correct items are left untouched. Cosmetic previews never change gameplay state. Item art lives in `zbk_der_eisendrache`; the resource pack's native inventory background is globally styled. No quest output is added to the actionbar.

The [electric soul pots](bows/electric/soul_pots/README.md) collect owner kills after wall-run completion. Native soul metadata is processed before the dragon collector consumes its existing stone item. The quest-owned `souls/` router selects the stage-specific collector after resolving kill ownership. Both the soul pots and the [final ritual box](bows/electric/ritual_box/README.md) preserve partial charge across player departures and binding changes; the electric quest reset clears it. At progress 4, the box collects 15 owner kills and exchanges the visibly held original bow for the working electric weapon.

Storm breeze and captured-enemy loops use separate synchronous center lookups; their lifecycle and invalidation contract are documented in [Electric storm runtime](bows/electric/storm/README.md).

Dragon-head ticking selects block displays, and default-bow particles select item displays, avoiding unrelated entity types without changing per-tick timing.
