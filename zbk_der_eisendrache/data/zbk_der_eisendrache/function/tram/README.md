# Der Eisendrache Tram Module

Owns the Map 2 tram runtime. Linked marker sets define tram routes, while marker configuration and auto-start support multiple routes. The paired call-and-reward sequence currently reserves IDs 1 and 2.

## Structure

| Path | Responsibility |
| --- | --- |
| [`call_console/`](call_console/) | Single stationary call console, interaction hitbox, and call-manager boundary |
| `collision/` | Entity-free grenade collision shell following each tram root |
| `doors/` | Four independently placed, stationary platform-door objects |
| [`easter_egg/`](easter_egg/) | Per-player Round 1 grenade qualification and one-time fifth-call Tram 1 sequence |
| `management/` | Call, return, Round 1 start, and operator state transitions |
| `marker/` | Authoritative Start, Middle, End, and Reward marker creation |
| `model/` | Invisible route controller with one baked item-display body |
| `route/` | Root creation, movement, arrival, and linked-root cleanup |
| `reward/` | Reward spawn, claim, timeout, cleanup, and auto-return |
| `spawning/` | Runtime tram spawning and marker summon entry point |
| `sway/` | Short damped animation after arriving at Middle |

## Marker Set

Every route uses the same positive `tram_link_id` across four markers:

- `tram_start`: reload position plus `tram_start_delay` and `tram_auto_start`.
- `tram_middle`: Round 1 and return destination.
- `tram_stop`: opposite call destination.
- `tram_reward_spawn`: reward display, claim, timeout, and auto-return area.

## Lifecycle

[`maps/on_load`](../on_load.mcfunction) delegates objective setup to `on_load`, and [`maps/on_tick`](../on_tick.mcfunction) delegates runtime updates to `on_tick`. `initialize` removes runtime trams/rewards and rebuilds idle tram roots from Start markers only when Map 2 is active. Round 1 calls `management/start`, which sends auto-start routes to Middle after their configured delays.

`management/call {id}` moves the mirrored pair toward Start or End and arms only the selected route's reward. During a call movement, whichever paired tram first comes within 5 blocks of its linked destination plays the Maxis arriving announcement once for every player without distance attenuation. `management/return` sends both routes to Middle with the announcement disarmed, so the arriving PA does not play while a tram leaves after a call; the Round 1 auto-start departure is also silent.

Every movement type, including calls, returns, and Round 1 auto-start, uses the motor audio sequence. When a return movement actually begins, the Maxis departing announcement plays once for every player without distance attenuation; the mirrored tram cannot duplicate it. Player-called trips suppress this departure line because the global Maxis called announcement already covers them, and the Round 1 auto-start departure is also silent. Players within 16 blocks of a moving route's linked Start or End marker hear the motor-start clip. After 20 ticks (1 second), the measured 50-tick (2.5-second) motor clip repeats at 50% volume while the route remains in motion. Arrival stops the active motor loop before playing the motor-stop clip in the same marker zones. Initialization also force-stops the loop so reloads and map changes cannot leave motor audio playing.

Every new game rebuilds tram roots from persistent Start markers before gameplay begins, so positions never carry over from the previous game. Runtime tram roots use a one-tick teleport duration so their per-tick route steps are interpolated continuously on clients without changing server-side travel speed or arrival timing.

The Tram 1 easter egg uses no additional detector entities. From the moment a new game becomes active, including the rocket launch and the pre-Round 1 delay, Tram 1's existing root defines a moving `9 x 5 x 5` block grenade box. It remains eligible through the delayed auto-departure and movement toward Middle, then closes when Tram 1 arrives. A hand-thrown grenade inside that box qualifies only its recorded thrower. Separately, every tram root owns an entity-free shell of root-relative boxes approximating the displayed floor, segmented walls and widened three-block doorway, roof ring, and tapered upper support. Hand grenades and grenade-launcher projectiles follow their normal explosion path only when a physics substep touches that shell, rather than detonating anywhere in the interior or passing through displayed surfaces. The qualified player's successful console calls are counted independently, and their fifth call consumes its Fuse, flickers both full-bright lamps between emerald and black for 18 ticks (0.9 seconds), then calls Tram 1 instead of Tram 2. Each player can complete this replacement call exactly once per game; rejected calls never advance progress. See [`easter_egg/`](easter_egg/) for lifecycle and state details.

One stationary call-console marker owns the staged control display. Its current form is a compact faceted circular/oval metal panel with a subtle 10-degree upward tilt, a low supporting pedestal, a compact square hand wheel on the lower metal section, a fixed red left lamp, a fixed green right lamp, and an angled status readout on the black panel. The readout reports `CALL TRAM`, `TRAM MOVING`, or `AT PLATFORM` from the paired Tram 1/2 operation and Tram 2's destination. Its derived interaction entity covers the controls and delegates right-clicks as the exact interacting player to the console manager. The temporary manager calls Tram 2 only from the available `CALL TRAM` state when that player carries a Fuse (`de_fuse = 1`), then consumes it by resetting the score to `0`. Rejected calls preserve the Fuse; their chat explanations require the interacting player's `debug` tag. Later selection and lamp behavior can change behind this boundary without rebuilding the interaction system. See [`call_console/`](call_console/) for placement and ownership details.

The four platform doors are stationary objects and are not attached to tram models. Each persistent `tram_platform_door` marker owns one closed left/right display pair and has a unique `tram_door_id` from 1 through 4. Its separately assigned `tram_link_id` identifies the tram route that will control it. Runtime leaf controllers inherit both IDs plus their facing and left/right tags so animation can target either half. Each closed pair spans 4 blocks, sits flush with its marker's ground level, and stands about 0.98 blocks tall: a 3-block barred center with a 0.5-block connection on each outside edge for the platform's iron fencing. The dark frame, thin vertical bars, and green plate on the inside of each leaf follow the Der Eisendrache safety-gate design. `initialize` removes the derived controllers and model pieces, resets every door closed, and recreates them from the markers when Map 2 is active.

To assign a route, stand within 5 blocks of a platform-door marker and use the Build Manager. The platform-door dialog shows its fixed Door Number and lets the builder assign a Tram ID from 1 through 99. Use the same Tram ID as the route's Start, Middle, End, and Reward markers. Deleting the marker through this dialog also removes both runtime leaves and their model pieces.

When the explicitly called tram reaches Start or End, every platform door with its `tram_link_id` slides open over 10 ticks (0.5 seconds). The mirrored non-called tram does not open doors, and arrivals at Middle never open doors because Middle is the waiting position. Calls and returns close matching doors first and wait 10 ticks (0.5 seconds) before movement begins. Round 1 auto-start routes add the same closing window after their configured start delay. Each real opening or closing transition plays the Map 2 Tram gate sound for players within 24 blocks of that door marker. Doors assigned to other Tram IDs do not animate.

Closed platform doors own a four-block-wide, two-block-high wall of `minecraft:magenta_stained_glass_pane` blocks aligned to the marker facing. The resource pack renders these panes invisibly, and their narrow hitbox follows the visual gate more closely. The second collision row prevents players and mobs from jumping over the approximately one-block-tall visual gate. Opening immediately removes only these panes inside that door's volume; closing restores them after the 10-tick visual animation. Initialization restores collision for closed Map 2 doors, while deletion and switching away from Map 2 remove it.

Reward marker state:

- `tram_r_state = 0`: inactive.
- `tram_r_state = 1`: reward active for up to 600 ticks (30 seconds).
- `tram_r_state = 2`: claimed, picked up, or timed out; return after the matching tram's safety box is clear.

The auto-return occupancy check follows the matching tram root instead of the reward marker. Its axis-aligned box starts 1 block outside the model on X and Z and 2 blocks below the root, then spans `dx=10`, `dy=6`, and `dz=6`. This covers the full 9-by-5-block tram footprint, including the cliff-side/front standing area, with a one-block horizontal margin. The tram remains at the platform while that box contains any player, active zombified-piglin zombie, wolf, or living Panzer controller; it closes and returns only after all of them leave.

Tram 1 presents a claimable Monkey Bomb or packed KRM-262 (Shoeshining 100). Tram 2 uses a round-gated reward pool independent of the normal zombie-drop cap and kill gate. Through Round 5 it chooses evenly between Max Ammo, Double Points, and Insta-Kill. From Round 6 onward it first rolls `1..100`; a roll of `1` presents an owner-only Ray Gun claim for the player who purchased the call, unless that player already owns a Ray Gun or cannot be resolved. Those cases fall back to the normal pool. The Round 6+ normal pool chooses evenly between Max Ammo, Double Points, Insta-Kill, and Nuke. Ray Gun claims use the same 600-tick (30-second) lifetime and visible interaction flow as Tram 1 weapon claims.

## Gameplay feedback

Console status and Fuse messages, Easter egg qualification/activation notices, reward-claim confirmations and owner-only claim rejection chat target only the interacting player tagged `debug`. Normal play uses the console status display, lamps, reward presentation, voice announcements and sounds. Setup confirmations, placement errors and invalid operator command arguments remain visible to the operator. Debug filtering does not change rejection gates, Fuse consumption, reward ownership or call progress.

## Commands

```mcfunction
function zbk_der_eisendrache:tram/spawning/summon_marker {type:"start"}
function zbk_der_eisendrache:tram/spawning/summon_marker {type:"middle"}
function zbk_der_eisendrache:tram/spawning/summon_marker {type:"stop"}
function zbk_der_eisendrache:tram/spawning/summon_marker {type:"reward_spawn"}
function zbk_der_eisendrache:tram/doors/spawning/summon {id:1,facing:"north"}
function zbk_der_eisendrache:tram/management/call {id:1}
function zbk_der_eisendrache:tram/management/call {id:2}
function zbk_der_eisendrache:tram/management/return
```

There are no legacy marker aliases or score backfills; current Build Kit markers are authoritative.

Build Kit dialogs and marker editing remain in `build_kit/management/tram`; they call this map-owned runtime namespace.

The packed KRM-262 reward uses the shared BO3 give and PaP-capacity paths, including its 16-round magazine and 64-round reserve.

## Route and reward dispatch

The arrival sound and its latch share one proximity check through `route/audio/arriving`. Reward arrival uses `reward/start_at_target` for linked cleanup, reward creation, and the existing 600-tick (30-second) lifetime. Owner assignment precedes that helper, and temporary target tags are cleared afterward. Route movement, collision geometry, link IDs, and reset behavior are unchanged.

## Scheduled ownership

The scheduled route and sway loops recheck Der Eisendrache before touching runtime or scheduling another tick. Initialization and map cleanup still cancel their schedules and rebuild or remove owned entities. Internal per-tram helpers run synchronously inside those guarded loops.

## Display rendering

Each tram body is one `tram_body` item display riding its existing invisible
`tram` block-display controller. The controller remains the `tram_route_display`
entity and owns route scores, interpolation, sway, grenade collision, reward
occupancy, and audio. No route origin or gameplay selector changes are needed.
The body's right rotation cancels the item renderer's 180-degree Y rotation,
preserving the original bottom-left block anchor and positive X/Z geometry offsets.
The model retains the original slabs, stairs, connected iron bars, glass material,
textures, and geometry. Platform doors and the call console remain separate.

The body uses `view_range:0.5f`, scaled by client entity-distance settings, with
client settings and entity tracking also limiting visibility. Its floor extends
slightly below the unchanged controller origin, so the single visual retains zero
culling bounds to prevent screen-edge clipping. Platform-door pieces retain their
8-block-wide, 1.5-block-high bounds and `0.5f` range; the console retains `0.5f` range.

The [fixed-prop sources](../../../../../../resourcepacks/zbk_der_eisendrache/README.md)
own model geometry and regeneration. Install both matching packs, press F3+T,
and run `/reload` outside an active game with the trams loaded. Initialization
removes old passenger assemblies before their roots, then reconstructs the new
body/controller pairs from the existing Start markers. Repeated resets do not
accumulate visuals. Previously unloaded routes can be rebuilt by calling
`function zbk_der_eisendrache:tram/initialize` after loading their area.

Verify both routes, sway, calling/returning, rewards, grenade collision, and glass
appearance in game. A single visual samples lighting at one origin, so lighting
can differ from the former per-piece displays.

Each platform door leaf is one baked item model riding its original movable
block-display controller. Left and right leaves remain independent, preserving
sliding animation, all four facings, link IDs, and collision-pane timing.
Initialization removes all tagged leaf visuals before rebuilding from persistent
door markers. The console body is also baked; its live lamps and text remain
separate. All baked visuals cancel the item renderer half-turn to retain their
original anchors. Install matching resource-pack assets before reloading.

Door uprights fit between the top and bottom rails instead of overlapping them,
preventing coplanar faces from flickering at the frame joints.
