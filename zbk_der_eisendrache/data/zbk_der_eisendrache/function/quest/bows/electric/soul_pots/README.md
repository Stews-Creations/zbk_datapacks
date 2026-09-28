# Der Eisendrache electric soul pots

Map 2-only soul collection at three real flower pots after the five-panel wall-run milestone. Each pot accepts eight zombies in any order, then supplies charged base-bow shots until one successfully electrifies a fire. Only all three electric fires advance the four-segment HUD. There are no pot display models or changes to real blocks.

## Placement and testing

Select Map 2 in the overworld. Place three empty or planted flower pots, then aim at each pot within 8 blocks and run its matching command. Placement snaps to the pot block center, 0.4 blocks above its base:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/soul_pots/spawning/place {id:1}
function zbk_der_eisendrache:quest/bows/electric/soul_pots/spawning/place {id:2}
function zbk_der_eisendrache:quest/bows/electric/soul_pots/spawning/place {id:3}
```

Repeating a loaded ID moves the marker and preserves its charge. An existing unloaded placement is refused to prevent duplicates. IDs are exactly 1, 2 and 3. Leave enough space between pots for clear collection areas; overlapping ranges still credit only one pot per kill.

To test immediately as the executing player (`@s`), use the existing wall-panel shortcut after `/reload`:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/test_complete
```

This binds electric and completes through the wall-run stage. Pots spark once shared electric progress is at least 2. Kill gameplay zombies within 10 blocks of a marker while bound to electric at progress exactly 2. Any supported weapon can supply souls; another player's kills cannot. The distance uses the victim position, not the killer's position. Dogs, bosses, display entities, turned zombies and crawler conversions are not souls.

Each accepted soul creates a compact blue particle orb that travels from the death location toward the pot at 0.3 blocks per tick (6 blocks per second). Uncharged pots emit intermittent sparks; charged pots have denser sparks and a bright cyan particle core. These are visual effects, not world light blocks. Particles update within 48 blocks of viewers. Soul arrival and pot completion have visual effects without vanilla chimes. Charge counters in chat require the killer's `debug` tag.

To skip the entire soul-pot and electric-fire milestone for the executing player (`@s`):

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/test_complete
```

This temporary operator command targets the executing player (`@s`) with Map 2 selected and that player in the overworld with a positive player ID. Run it from player chat; console callers must use `execute as <player> at @s run function` followed by the shortcut path. A direct console call does nothing. It binds electric to that player, sets all three pots to eight souls and spent, marks all three fires lit and electric, clears carried charges/orbs, rebuilds the completed panel visuals and refreshes the HUD at progress 3. Later progress is not lowered. It preserves marker placements and real blocks, and does not create missing placements or complete the final arrow pickup.

## Saved charge and attribution

Each unique pot caps at eight souls. If unfinished pots overlap, the nearest one accepts the kill; a full pot is skipped. Charge is saved immediately when accepted, as with the dragon system, so disappearing cosmetic orbs, disconnects or unloaded chunks cannot lose accepted souls. A player can leave the area, disconnect, unbind or switch quests and resume the saved counts later. A new electric owner inherits the same quest charge. Filling pots alone leaves electric progress at 2. Each pot must also be successfully used on a different fire to complete the charged-fire milestone.

Custom gun, bow, storm, explosive, grenade-crawler and elemental lethal paths report the victim and the same stable shooter ID used by their combat attribution through `maps/events/zombie_killed`. A per-victim `map_kill_reported` tag prevents repeat collection. Existing damage, points, loot and dragon drops are preserved. Native melee kills use the existing dragon soul stone: its loot metadata copies the actual credited player's UUID only for gameplay zombies not already reported by custom combat. The quest-owned `souls/` router reads that UUID before the dragon collector consumes the stone and selects this collector at progress 2 or the [ritual box](../ritual_box/README.md) at progress 4; it never substitutes the nearest player or consumes the dragon's item.

`initialize` clears cosmetic orbs and carried bow charges and restarts effect timing while preserving placements, soul counts, spent-pot flags and electric-fire flags. The electric fire reset calls the internal `management/reset` to clear soul counts, spent-pot flags and electric-fire flags along with the complete electric quest. Full game/map reset, weather-vane reset, map deselection and the existing global `/reload` reset flow therefore start a fresh electric quest; merely leaving or switching bindings does not. Do not use a full quest reset to refresh effects.

## Charging and electrifying fires

At electric progress 2, the bound owner can fully draw the original base bow (weapon ID 11) within 3 blocks of any pot with eight souls that has not been spent. Other pots can still be empty. Full charge requires at least 20 ticks (1 second) of draw and two rounds of bow ammo. The custom arrowhead sound, cyan sparks beside the held bow and a blue electric arrow trail identify the special shot.

Successful charge acquisition starts `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_arrowhead`, audible only to the charging player. It repeats every 70 held-draw ticks (3.5 seconds) until the player shoots or cancels. The per-player `de_ec_audio` countdown advances only on held-draw callbacks. The resource pack contains a 3.456-second stereo Ogg Vorbis version of the supplied `pfx_stormbow_arrowhead.flac`; non-positional playback stays with the player while they move away from the pot. Release, a new draw, weapon/quest ineligibility, downing, death, spectator state and leaving the overworld stop the cue. Initialization and map/quest cleanup stop it for all players and clear countdowns. Returning to a ready pot and acquiring a new charge restarts the loop; filling a pot alone or attempting to charge from an empty or spent pot does not start it. Reload client resources after installing the stereo asset.

Once charged, keep holding the draw while moving to aim. Release at any unelectrified authored fire, regardless of which pot supplied the shot. The existing long-range bow ray and fire hitboxes perform the hit test. A hit turns that fire into a tall blue soul-flame tornado with electric sparks, marks the source pot spent, removes its remaining soul orbs and stops all of its pot particles. It cannot supply or collect more charge until the electric quest resets.

Only the third successful conversion, completing all three electric fires with all three pots spent, plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.fire_ignite` once only to the quest player who fired, at their position so distant hits remain audible. This is the 6.5-second cue converted from `bonefire shot with lightning.flac`. The first two conversions, initial ordinary-fire ignition, rejected hits, already-electric fires and runtime reconstruction do not play it. The nearby lightning-impact sound also plays only on the third conversion, at the final hit position. No vanilla completion chime plays.

Every release consumes the carried electric charge. A miss, short shot, cancelled draw or shot at an already-electric fire does not spend the pot, but another electric attempt requires returning to a filled unused pot and fully drawing again. Weapon swaps, invalid quest ownership/stage and downed/spectator state clear held charge. The normal bow's ammo, sounds, damage, kill credit and maximum ray range are preserved. Uncharged shots cannot electrify a fire.

Any pot/fire order works. Successful fire and spent-pot flags persist across leaving the area, binding changes and presentation reconstruction. The third unique electric fire, supplied by the third unused pot, sets electric progress to 3 and refreshes the HUD's third segment. One or two electric fires do not advance it. Progress 3 unlocks the [arrow reforging sequence](../reforging/README.md); its final pickup fills the fourth segment.

## Removal and diagnostics

Remove the nearest marker within 8 blocks, or a loaded marker by ID. Deletion clears that pot's soul count and registration but leaves the real flower pot intact. A spent ID remains blocked until the electric quest resets, even if its marker is deleted and replaced:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/delete_nearest
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/delete {id:1}
```

Only after manually deleting a marker, recover its registration with `unregister`. It preserves the saved charge for replacement and refuses if the marker still exists. Do not use it when the old chunk is merely unloaded:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/unregister {id:1}
scoreboard players get #1 de_es_souls
scoreboard players get #2 de_es_souls
scoreboard players get #3 de_es_souls
```

## Ownership and lifecycle

| State/path | Contract |
| --- | --- |
| `de_es_pot` marker, `data.id`, position | Persistent authored pot location |
| `#1..#3 de_es_set` | Registration guarding unloaded placements |
| `#1..#3 de_es_souls` | Shared saved soul counts, zero through eight |
| `#1..#3 de_ec_used`, `#1..#3 de_ec_fire` | Saved spent pots and electric fires; only whole-quest reset clears these |
| Player `de_ec_pot`, `de_ec_shot` | Transient held charge and the source pot of the current synchronous bow ray |
| `de_es_orb`, `data.id`, `de_es_age` | Disposable traveling orb; removed on arrival, missing destination or after 100 ticks (5 seconds) |
| `on_load` | Define objectives before electric reset callers run |
| `initialize` | Refresh presentation without clearing charge |
| `on_tick` | Emit pot effects, animate orbs and maintain carried charges; the quest orchestrator reads native drops before dragons |
| `spawning/`, `marker/` | Guarded pot-targeting ray and persistent placement |
| `souls/`, `validation/` | Credited killer checks, nearest unfinished pot and capped collection |
| `charge/` | Draw eligibility, source-pot capture, single-shot consumption, fire conversion and third milestone completion |
| `animations/`, `effects/` | Cosmetic blue orb, sparks, charged bow/trail, pot glow and sounds |
| `management/` | Placement deletion/recovery and internal whole-quest reset |

## Validation

Use an isolated Minecraft 26.2 server with two connected players to verify aimed placement, stage and owner gates, actual gun and native kills, points remaining unchanged, delayed elemental attribution, duplicate suppression, the eight-soul cap, overlap selection, orb arrival, arbitrary pot order, binding changes, presentation reconstruction, explicit quest reset and no HUD advancement from filling alone. Verify real base-bow shots after full draw, single-pot readiness, miss/recharge, arbitrary pot/fire pairing, spent-pot lockout, existing-electric rejection, short-shot and wrong-bow rejection, reset, and advancement only on the third electric tornado. Check particles and orb appearance in the client at the authored locations.

## Orb destination dispatch

Orb animation resolves the linked pot through its ID and calls `animations/advance_orb` with the orb's data. Missing destinations remove the orb. Arrival still checks any matching pot within 0.4 blocks before movement; movement targets the same first matching destination as before. Age limits, charge behavior, and cleanup are unchanged.
