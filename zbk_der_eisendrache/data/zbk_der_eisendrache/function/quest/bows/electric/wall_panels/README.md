# Der Eisendrache electric wind panels

Map 2-only presentation for the five electric-quest wall-run panels. Five independently placed markers share the [editable stone wind-panel models](../../../../../../../../../resourcepacks/zbk_der_eisendrache/README.md). The eligible owner must reach all five unique panels in one run without landing on ordinary ground to complete the second electric-quest segment.

## Placement and visual testing

Select Map 2 in the overworld. Aim anywhere on the vertical face of a wall block within 8 blocks, at the desired panel height, then place a unique ID:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/place {id:1}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/place {id:2}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/place {id:3}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/place {id:4}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/place {id:5}
```

Placement snaps to the center of the aimed-at block face, including height. The ray selects the actual vertical face it enters, even when you aim diagonally; precise center aiming is unnecessary. Top and bottom faces are rejected. The panel center sits 0.08 blocks outside the selected face. Its decorated side faces back toward the placing player: runtime creation rotates the fixed item display 180 degrees from the marker's wall-facing yaw for all three model states. Reinitializing also corrects existing saved placements without moving their markers. Leave two blocks of horizontal wall space for the panel. No blocks are placed, replaced or removed. IDs are 1 through 5; repeating a loaded ID moves it. Existing unloaded IDs are refused to avoid duplicates.

Reload the resource pack with F3+T after installing the models, and the datapack with `/reload`. To inspect the three states without changing binding, fires or anti-gravity, preview one loaded panel for 60 ticks (3 seconds):

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/preview {id:1,state:0}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/preview {id:1,state:1}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/preview {id:1,state:2}
```

State 0 is off, 1 is cyan glow, and 2 is the white-blue flash. Preview is an operator-only visual test command and does not grant gameplay eligibility. Live behavior resumes automatically afterward.

For temporary live testing, stand inside the anti-gravity room and run this shortcut from player chat:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/test_setup
```

This operator fixture targets the executing player (`@s`), requires their existing positive player `id`, Map 2 and the overworld, and is never invoked by gameplay. Console callers must use `execute as <player> at @s run function` followed by the shortcut path; a direct console call does nothing. It enters that player into the room, activates anti-gravity, releases their current bow binding, assigns electric ownership to them (replacing any existing owner), and sets shared electric progress to 1, the three-fire-complete stage. It bypasses the fires without lighting their markers and resets the unfinished panel attempt and visuals, ready for another complete loop. Panel feedback requires active anti-gravity and room eligibility; airborne jumps and barrier-supported contact both count.

Remove the nearest panel within 8 blocks or a loaded panel by ID:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/delete_nearest
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/delete {id:1}
```

To replace the downstairs signs, run `delete_nearest` beside each old panel, then place the replacement panels using IDs 1 through 5 above. Deletion removes both the saved placement and its display; `/reload` will not bring a deleted panel back. It clears the unfinished run without undoing completed quest milestones.

Only if a marker was manually deleted, recover its registration with the following command. Do not use it for an unloaded marker, which could later return as a duplicate:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/unregister {id:1}
```

To skip the wall-run challenge and test the completed step:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/test_complete
```

This temporary command has the same executing-player (`@s`), Map 2, positive player ID and overworld requirements. It binds electric to that player, advances shared progress to at least 2 without lowering later milestones, clears the unfinished attempt, rebuilds the panels glowing, disables that player's HUD preview and refreshes the inventory indicator. It works without running `test_setup` first, bypasses earlier prerequisites without lighting fire markers, and does not activate anti-gravity. Like `test_setup`, it can replace another player's electric reservation and is never called by gameplay.

## Live eligibility and feedback

Only the current electric owner can trigger proximity feedback, while `#electric de_el_progress = 1` (all three initial fires complete). The player must be inside active anti-gravity, not suppressed, not downed and not a spectator. Airborne movement, normal jumps, double jumps and standing or moving on barriers, light blocks, lanterns and soul lanterns all qualify. Panel collection does not require the horizontal-movement tag or continuous authored barrier support. Standing on ordinary ground does not qualify.

The existing [anti-gravity wall-run system](../../../../anti_gravity/wall_run/README.md) remains responsible for movement and temporary barriers. This module reads its eligibility tags and room state; ground detection uses the player's on-ground flag and Minecraft's `stepping_on` supporting-block predicate. It runs after anti-gravity through the map's quest tick; it does not change movement, boundary recovery or ground detection.

Distances are measured between the player's torso (feet plus 1 block) and the authored panel center:

| Distance/state | Feedback |
| --- | --- |
| Unvisited panel with no eligible runner within 3 blocks | Off |
| Eligible runner within 3 blocks | Cyan glow |
| First entry within 1.5 blocks | White-blue flash for 8 ticks (0.4 seconds), spark burst and chime |
| Visited panel after the flash | Cyan glow until the attempt resets |
| Leaves the 3-block radius, then returns | Close-range flash is armed again |

The display is a shared world object, so everyone can see a glow or flash triggered by the eligible owner. Particles are limited to viewers within 32 blocks; the chime targets the eligible runner. A triggered flash finishes its brief duration even if the player moves away. There are no gameplay chat logs. A brief movement stall does not rearm the close-range flash; the owner must actually leave the 3-block radius. Binding changes rearm contact feedback, and completed fire/quest progress is never modified by model preview, placement or visual reset. Placement and deletion clear the unfinished loop so moved targets cannot carry old credit.

## Completing the loop

At electric progress 1, the bound owner must move within 1.5 blocks of each unique panel ID 1 through 5 while airborne or supported by barriers, light blocks, lanterns or soul lanterns in active anti-gravity. Panels may be reached in any order. Repeat visits and duplicate entities with the same ID cannot add credit. The first valid contact starts the attempt; completed panels stay cyan until a reset. Model previews grant no credit by themselves.

There is no time limit. Jumps, double jumps, falling through the air, pauses and landing on barriers, light blocks, lanterns or soul lanterns preserve every collected panel. Only physical landing on ordinary ground resets the movement attempt. Invisible `minecraft:light` blocks are exempt at every light level, including waterlogged variants. Detection combines Minecraft's on-ground state and supporting-block predicate with a fresh five-point footprint check. Removed temporary platforms cannot reset a run using stale ground state, and exempt support under any corner preserves the run. Nearby ground beneath an airborne player does not count, while slabs, stairs and other real landing surfaces do. Barriers, light blocks, lanterns and soul lanterns are exempt landing surfaces; none requires a temporary platform marker.

Anti-gravity ending, room exit, movement suppression, being downed or spectator pause new contacts without clearing progress while the player remains off real ground. Ground contact is still checked during these pauses, after anti-gravity and boundary recovery. Reactivating anti-gravity allows the same owner to continue. Ownership changes, disconnects, quest reset, placement/deletion and explicit initialization still clear unfinished attempts; completed milestones remain saved.

Reaching all five sets shared `#electric de_el_progress` to 2, fills the second of four HUD segments, plays the completion sound, and leaves all panels glowing. Subsequent falls and ownership changes do not undo this completed milestone or the earlier fires. Chat counters and completion messages only appear for players tagged `debug`. The [soul-pot stage](../soul_pots/README.md) owns the next milestone: filling three pots and using each to electrify a fire.

## Completion and reset audio

Each newly credited plate plays the next cue from `rune_cross_01` through `rune_cross_05` only to the quest runner, at the player's position. Selection follows the attempt's collected-panel count, not the authored plate ID, so any route order produces the same five-step sound sequence. Repeat visits, duplicate plate IDs and visual previews grant no new credit and do not replay these cues. Resetting the attempt restarts the sequence at 01. Cue 05 accompanies the final plate before the shared completion announcement. Vanilla contact chimes are disabled.

The visit handler supplies the accepted count through `zombies:de_el_panel_sound visit` scratch storage, invokes the sound helper synchronously and clears that scratch field immediately afterward. The five numbered Ogg Vorbis assets are converted from the supplied matching `rune_cross_01.flac` through `rune_cross_05.flac` files.

Completing the live five-panel run plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.rune_cross_done` once to every online player, at each listener's position so distance and dimension do not limit the announcement. No vanilla XP completion cue plays. The operator completion shortcut does not broadcast this cue.

Resetting an unfinished attempt with one through four collected panels plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.rune_cross_fail` once only to that attempt's recorded runner, if still online. This includes ordinary-ground landings, ownership changes and explicit resets or placement/deletion that clear an active attempt. The listener is selected before the saved runner and count are cleared. Standing on the ground afterward, resetting an empty attempt or falling after completion does not replay failure. Pauses that preserve progress do not play failure, and disconnects do not queue audio for a later login.

The resource pack contains Ogg Vorbis conversions of the supplied `rune_cross_done.flac` and `rune_cross_fail.flac`. Reload client resources after installing them.

## State and lifecycle

| State/path | Contract |
| --- | --- |
| `de_el_panel_marker`, `data.id`, position and rotation | Persistent authored placement, IDs 1 through 5 |
| `#1..#5 de_ep_set` | Persistent placement registration protecting unloaded markers |
| `de_el_panel_runtime`, `de_el_panel_<id>_runtime` | Disposable item display rebuilt from the corresponding marker |
| `de_ep_state`, `de_ep_want` | Applied and desired visual state, 0 off / 1 glow / 2 flash |
| `de_ep_present`, `de_ep_near`, `de_ep_close`, `de_ep_touch` | Per-tick proximity and one-flash contact latch |
| `de_ep_flash` | Remaining flash ticks |
| `de_ep_preview`, `de_ep_test` | Temporary preview state and remaining ticks |
| `de_el_panel_runner` | Tick-local eligible owner who is airborne or supported by a barrier, light block, lantern or soul lantern |
| `#1..#5 de_ep_seen` | Unique panel contacts in the current attempt; independent of marker loading |
| `#count`, `#runner` in `de_ep_run` | Unfinished attempt count and stable owner ID; reset without changing completed milestones |
| `on_load` | Define objectives for all maps |
| `initialize` | Clear unfinished attempt and presentation, remove runtime and reconstruct only on Map 2 |
| `on_tick` | Read eligibility, measure proximity and update only changed display states |
| `spawning/`, `marker/` | Guarded authoring ray, cardinal wall placement and runtime creation |
| `validation/`, `zombies:de_el_panel_grounded` | Actual ground contact, exempt support blocks and collection eligibility |
| `animations/`, `effects/`, `display/` | Contact latch, flash timing, particles, sound and item-model swaps |
| `route/` | Owner validation, unique contacts, attempt reset and stage completion |
| `management/` | Preview, test setup, deletion and explicit recovery after manual marker deletion |

Quest load/tick/initialize/cleanup call this module. Map cleanup removes runtime while preserving authored markers and registrations. `initialize` resets an unfinished panel attempt but does not reset completed electric quest stages or fires:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/wall_panels/initialize
```

## Validation

Validate off/glow/flash model and texture references, embedded Blockbench textures, emission values and all cardinal wall orientations. Use an isolated vanilla 26.2 server with connected-player fixtures to verify eligibility, wrong-owner and incomplete-fire rejection, airborne, barrier, light-block and lantern eligibility, approach glow, one-shot flash timing, re-entry, preview expiry, unique five-panel completion, jumps, double jumps, long pauses, anti-gravity expiry, actual ground landing, ownership changes, completed-stage persistence, reconstruction, deletion and wrong-map cleanup. The preview image is not an in-game rendering test; final appearance and route placement need a client check.

## Panel reset dispatch

`route/reset_presence` resets each panel's presence, proximity, and owner-dependent touch state through one marker traversal. Player sampling, route validation, visits, and display synchronization remain in their existing later phases. No route rule, radius, wall-run requirement, or reset behavior changes.
