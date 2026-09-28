# Der Eisendrache Anti-Gravity System

Owns persistent activation plates, the repeating room cycle, room membership, reduced player gravity, authored wall-run paths, and movement-effect suppression for the Der Eisendrache Undercroft anti-gravity room (Der Eisendrache).

## Activation plates and cycle

Place one persistent `de_ag_plate` marker at floor level in the center of each of the four activation plates. Each marker expects a `minecraft:redstone_lamp` exactly one block beneath it:

```mcfunction
function zbk_der_eisendrache:anti_gravity/spawning/plate
```

The placement command refuses to create more than four markers. Delete an incorrectly placed plate marker by standing within 5 blocks:

```mcfunction
function zbk_der_eisendrache:anti_gravity/management/delete_nearest_plate
```

At any time, a non-spectating player in adventure, survival, or creative mode can charge a plate by remaining within 1.25 blocks of its marker for 60 consecutive ticks (3 seconds). Charging has no continuous base particle. Initial contact plays `plate_down_00`; a small light pulse appears after 20 ticks (1 second); and the stronger light pulse plus `plate_down_01` plays after 40 ticks (2 seconds). At 60 ticks (3 seconds), the final bright burst sets the lamp beneath that marker to `lit=true` and plays `plate_complete`. Leaving before completion plays `plate_reset` once and clears that plate's charge. These four Map 2 sounds originate from the individual plate and reach non-spectating players within 16 blocks.

Leaving early resets only that plate's charge. A completed plate and its lamp remain active until reset. Initialization, cleanup, marker placement, and marker deletion return the corresponding lamps to `lit=false`. Completing all four plates permanently unlocks this cycle until the next reset:

1. Anti-gravity activates immediately for 1,200 ticks (1 minute).
2. The Stop clip begins and anti-gravity remains fully active for 220 ticks (11 seconds).
3. Anti-gravity then deactivates for a uniformly random 1,200-3,600 ticks (1-3 minutes), while the clip's final 7-second tail may continue for players who remain inside.
4. The active and inactive phases repeat until map/game initialization or cleanup.

The four-plate unlock tellraw targets only players tagged `debug`. Active, shutting-down and inactive actionbar messages target only players inside the room with `de_ag_debug`; activation and shutdown chat feedback also requires `de_ag_debug` on the invoking player. Normal players receive room audio and movement changes without these status messages. Explicit authoring confirmations, errors and requested diagnostic reports remain visible to their operator. Disable anti-gravity diagnostics with `function zbk_der_eisendrache:anti_gravity/debug/disable` to stop its movement, boundary and cycle logs as well as status actionbars.

When an active phase begins, players currently carrying `de_ag_inside` hear the 0.98-second `anti_gravity_start` clip at their own position at volume 0.25. The 5.865-second `anti_gravity_loop` is requested after 0.9 seconds of real time and repeats after 5.75 seconds of real time at volume 0.20, targeting only players who are inside at each playback. `audio/tick` checks a stopwatch each active room tick; the small overlap covers the time until the next tick without making the loop wait through a fixed number of slow game ticks. Each actual playback restarts the stopwatch, so a long server stall never queues a burst of missed loops. A stall longer than the overlap or client/network delay can still interrupt the seam. Gameplay cycle and shutdown timers remain tick-based.

A deactivation request disables audio polling, removes its stopwatch, force-stops the LP, and begins the 18-second `anti_gravity_stop` clip at volume 0.25 only for players still inside. Gravity, movement modifiers, wall-run support, and other active-room behavior remain enabled for 220 ticks (11 seconds); the scheduled completion then removes them while the clip's final 7-second tail continues. Crossing out of the room immediately stops all three clips for that player. Initialization and cleanup remove the audio stopwatch, clear its transient scores, and cancel pending shutdown without playing the normal deactivation cue. Audio polling uses `#audio_next` and `#audio_elapsed` in `de_ag_cycle`, both measured in milliseconds; `#audio_next = 0` disables polling.

Persistent plate markers survive resets. Plate charge, completion tags, cycle unlock state, timers, and player movement state are transient and reset with the rest of the map.

These operator commands remain available for movement testing. They change the current room state without unlocking or restarting the cycle:

```mcfunction
function zbk_der_eisendrache:anti_gravity/management/activate
function zbk_der_eisendrache:anti_gravity/management/deactivate
```

## Player gravity

While active, eligible players receive three named attribute modifiers:

- `zombies:anti_gravity` reduces `minecraft:gravity` to 25% of normal with a `-0.75` multiplied-base value.
- `zombies:anti_gravity_jump` raises `minecraft:jump_strength` by 20% with a `0.2` multiplied-base value.
- `zombies:anti_gravity_speed` raises `minecraft:movement_speed` by 60% with a `0.6` multiplied-total value, matching the movement increase of command amplifier 2 (Speed III) without owning or clearing the player's Speed effect.

Stamina Up keeps its `0.15` base movement speed on normal ground in the active room. Only while an owned wall-run barrier actually supports the player does the wall-run system use the normal `0.1` base speed, preventing Stamina Up from overshooting the collision path. The perk remains owned and resumes its speed when the player leaves the barrier.

Eligible players also receive a hidden one-second Night Vision effect refreshed every tick. When eligibility ends, the named gravity, jump, and movement-speed modifiers are removed immediately while Night Vision expires naturally within one second. The module never clears player potion effects, so effects owned by other systems survive room exit, suppression, deactivation, reset, and map cleanup.

This module does not modify fall damage because the game owns global fall-damage behavior.

## Enemies

Anti-gravity affects players only. Zombies and dogs keep their normal wave-configured gravity and movement speed, with no additional nearby-player gravity or speed modifiers. There is no per-tick mob search for this feature.

Reload and map/game cleanup retain `management/clear_mob_effects` solely to remove the retired named modifiers and state tags from already affected, loaded enemies. Other systems' attribute modifiers are preserved. This cleanup is not a recurring mob tick; an old affected enemy in an unloaded chunk must be loaded during reload/reset for its saved modifiers to be removed.

## Ambient particles

Players carrying `de_ag_effects` receive refreshed hidden Night Vision and a sparse Nacht-style anti-gravity palette around their own view: blue-to-purple transition dust (10 particles per tick), portal particles (2 per tick), and a periodic warm highlight (4 particles per tick during the shared tick window). Each particle command explicitly targets the executing player, so one player's ambient field is not sent to other players. Night Vision and the particles begin when active anti-gravity movement is applied; particles stop immediately when eligibility ends and Night Vision expires naturally within one second.

## Air jump

Eligible players receive one air jump after leaving the ground. Vanilla command logic cannot reliably detect a second press of the normal jump key while the player is already airborne, so the air jump uses a fresh sneak press:

1. Jump normally.
2. While airborne, tap sneak once.
3. Land before using another air jump.

The input uses the shared `zombies:is_sneaking` predicate and a press-edge tag, so holding sneak does not repeatedly trigger boosts. The boost is a six-tick, hidden level-7 Levitation pulse. Room exit, 115 suppression, deactivation, reset, and map cleanup clear the pulse and its availability.

Sneak is also the normal reload and barrier-repair input. While an eligible player is airborne with an unused air jump, the fresh press is reserved for the air jump and manual reload is skipped. Barrier repairs require the player to be on the ground. After consuming the air jump, a later fresh sneak press may reload normally while airborne.

## Wall-run path

Structure void blocks mark the permanent route one block below its collision level. Eligible anti-gravity players reveal and generate temporary barrier collision across a 3-by-2 footprint spanning their current row and the row one block ahead, with no search behind. The barrier removes itself after every eligible player leaves. See [wall_run/README.md](wall_run/README.md) for placement and ownership details.

## Room boundaries

The four normal room openings use persistent `de_ag_portal` markers. Each marker must face inward:

- Players reaching the sensor 2 blocks in front of the marker enter the room.
- Players reaching the sensor 2 blocks behind the marker exit the room.
- The two sensors have a 1.9-block radius, leaving a small gap that prevents rapid state changes at the doorway center.

Place one marker at floor level in the center of each normal opening while looking into the room:

```mcfunction
function zbk_der_eisendrache:anti_gravity/spawning/portal
```

Delete an incorrectly placed marker by standing within 5 blocks of it:

```mcfunction
function zbk_der_eisendrache:anti_gravity/management/delete_nearest_portal
```

The Divinium well is not a portal marker. The Der Eisendrache 115 launch module suppresses anti-gravity while a player is within 2 blocks of its Start marker and permanently exits the player from the room when flight begins.

## Out-of-bounds recovery

On Der Eisendrache, `minecraft:light[level=2]` marks forbidden player-foot positions. A player entering this space returns to the nearest persistent `de_ag_recovery` marker within 32 blocks in the same dimension, preserving yaw and pitch. Neither marker placement nor recovery requires a running game, a started round, activated plates, or active anti-gravity. Recovery works during both active and inactive anti-gravity phases, even if the player has no room-membership tag. Existing level-5 and level-6 barriers keep their own behavior.

While the room is active and the player is inside without movement suppression, recovery allows rising jumps, the current air-jump pulse, and actual owned wall-run support. Height is sampled each tick at 0.001-block precision; a 3-tick (0.15-second) rising timer smooths the jump apex. Wall-run exemption requires an owned barrier beneath the player's footprint with its structure void still below it; horizontal movement alone does not qualify. Recovery runs after wall-run collision updates. Creative, Survival, and Adventure players are eligible, including while building before game start. Spectator players, `disable_tp` players, and committed `115_launch_flying` players bypass recovery.

Stand at the intended landing position on safe full-block ground inside the room, then place a marker:

```mcfunction
function zbk_der_eisendrache:anti_gravity/spawning/recovery
```

The equivalent raw summon command is:

```mcfunction
summon minecraft:marker ~ ~ ~ {Tags:["de_ag_recovery"]}
```

Prefer the placement function: it checks Der Eisendrache, destination clearance, and nearby duplicates, and reports why placement was refused. Raw summons bypass those placement checks, but recovery still validates the destination before teleporting. Markers persist through initialization, reload, room deactivation, and map cleanup; no runtime model is needed. Debug mode shows them with gold particles.

Give yourself the boundary blocks, then cover forbidden landing areas and escape routes:

```mcfunction
give @s minecraft:light[block_state={level:"2"}] 64
```

Cover the entire forbidden landing area rather than only a thin perimeter: rising players may cross a thin boundary and land beyond its detection. Detection samples the block containing the player's feet, so author enough vertical coverage for the reachable forbidden space. Leave intended jumping and wall-run routes open. Keep recovery markers comfortably inside playable space and within 32 blocks of their intended zones; nearest-marker selection uses distance, not line of sight or link IDs, so avoid placing a closer marker across a wall or on another floor.

Each recovery attempt starts a 20-tick (1-second) cooldown. The nearest marker must have room for the standing player, with only air or nonblocking light blocks in its footprint, and must not put any part of that clearance in level-2, level-5, or level-6 light blocks. Unsupported air/light, liquid, powder-snow, structure-void, and barrier footing are rejected. These checks are conservative clearance checks, not a complete terrain-safety test: the builder must choose solid, harmless ground away from edges, portals, and other teleport triggers. If the nearest marker is missing or fails validation, recovery skips the teleport and reports the issue to a player with anti-gravity debug enabled; it does not choose a farther destination. Correct marker placement prevents immediate return loops, while the cooldown spaces out repeated attempts.

Delete the nearest recovery marker within 5 blocks:

```mcfunction
function zbk_der_eisendrache:anti_gravity/management/delete_nearest_recovery
```

`boundary/` owns height sampling, movement exemptions, recovery, and transient cleanup. `validation/` owns placement and destination-clearance checks. The `zombies:de_ag_recovery_clearance` block tag defines permitted empty space. Recovery does not save previous positions or alter gravity, jump strength, speed, or friction.

For a pre-game test, select Der Eisendrache, place a recovery marker, and walk into a level-2 light block in Creative, Survival, or Adventure. The light block belongs in the air space containing the player's feet, not buried below the walking surface. The Build Kit's Disable TP setting must be OFF; recovery respects this explicit bypass just like existing barriers. To inspect the current map, bypasses, block detection, cooldown, and nearest destination without starting a game or enabling debug particles, run:

```mcfunction
function zbk_der_eisendrache:anti_gravity/debug/recovery_status
```

This diagnostic also works on other map selections so it can explain why Der Eisendrache is required. If Disable TP is enabled and you want to allow teleportation, run `tag @s remove disable_tp` or turn it off in the Build Kit settings.

## Player state

| Tag | Meaning |
| --- | --- |
| `de_ag_inside` | The player crossed a normal portal into the anti-gravity room |
| `de_ag_suppressed` | The player remains inside but anti-gravity movement must not apply, currently used by the 115 launch zone |
| `de_ag_effects` | The module's gravity, jump-strength, Night Vision, and Speed state currently applies to the player |
| `de_ag_air_jump_ready` | The eligible airborne player has not consumed the current air jump |
| `de_ag_sneak_held` | Sneak was already held on the previous tick, preventing repeated boosts |
| `de_ag_debug` | The player receives boundary/recovery messages and sees placement particles, including gold recovery markers |
| `de_ag_wall_moving` | The eligible player's horizontal position changed enough to generate wall-run collision |
| `de_ag_wall_supported` | An owned wall-run barrier supports the player's current footprint; Stamina Up speed is ignored for this tick |
| `de_ag_wall_pos_init` | The wall-run system has captured the player's previous horizontal position |
| `de_ag_bound_init` | Recovery has captured the player's previous height; cleared on reset, reload, or bypass |

`management/enter` and `management/exit` are the public state-transition commands for map-owned teleports and other systems. Runtime features treat active room state plus `de_ag_inside` without `de_ag_suppressed` as the eligibility gate for low gravity, double jump, and movement particles.

## Lifecycle

- `on_load` creates the room, plate-charge, cycle, air-jump, wall-run movement and refresh-grace, and recovery height/timer objectives, and clears recovery sampling state.
- `initialize` deactivates the room and clears plate progression, cycle state, and transient player state while preserving plate and portal markers.
- `on_tick` processes portal crossings, 115 launch-zone suppression, activation plates, the unlocked cycle, real-time room audio, player gravity, player-local ambient particles, air jumps, authored wall-run paths, level-2 recovery, and optional debug particles.
- `management/cleanup` resets plate progression and cycling, deactivates the room, and removes player gravity state, any loaded retired mob modifiers, and transient recovery state while preserving recovery markers.

Enable or disable placement diagnostics for the executing player:

```mcfunction
function zbk_der_eisendrache:anti_gravity/debug/enable
function zbk_der_eisendrache:anti_gravity/debug/disable
```

## Plate dispatch

`plates/update_and_count` updates each plate and counts its resulting completed state in one marker traversal. Cycle activation remains after the completed count is collected, preserving completion on the same tick. Wall-running retains its separate clear, player-request, and platform-expiry phases; support lifetime and multiplayer collision behavior are unchanged.
