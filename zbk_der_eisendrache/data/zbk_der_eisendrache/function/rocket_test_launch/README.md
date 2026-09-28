# Der Eisendrache Rocket Test Launch

Owns the recurring rocket test launch timing for Der Eisendrache (Der Eisendrache).

## Lifecycle

| Function | Responsibility |
| --- | --- |
| `on_load` | Creates the timer and sequence-state objectives and ensures their fake-player scores exist |
| `initialize` | Disarms the timer and cancels pending sequence callbacks until game start |
| `on_tick` | Counts down while the game is active and launches when the timer reaches zero |

The first successful in-game forward teleporter arrival on Der Eisendrache arms the first interval, regardless of the landing position. It does not launch a test immediately. Each interval is chosen randomly from 3,600-10,800 ticks (3-9 minutes), and later arrivals do not reset an active countdown. Reaching zero starts the launch sequence, plays `zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_launch` for every player, and disarms the cooldown until the sequence finishes.

## Structure

| Path | Responsibility |
| --- | --- |
| `audio/` | Rocket-fire Start and repeating LP playback |
| `doors/` | Persistent door markers, derived display leaves, movement, and barrier collision |
| `effects/` | Launch-area geyser-base effects, the persistent exhaust anchor, and the layered rocket exhaust |
| `hazard/` | Active-burn launch-pad health drain and zombie relocation |
| `management/` | Public launch state transition |
| `sequence/` | Warning, door, burn, and completion callbacks |
| `timing/` | Random countdown arming |

## Launch Sequence

| Step | Duration | Behavior |
| --- | --- | --- |
| Warning | 180 ticks (9 seconds) | Announces the initial warning phase, starts the launch audio, and begins closing the doors after 160 ticks (8 seconds) |
| Countdown | 200 ticks (10 seconds) | Announces the full launch countdown and starts the slow door closure |
| Door close | 240 ticks (12 seconds), beginning during the warning | Starts 20 ticks (1 second) before the countdown and finishes at the original rocket-burn moment |
| Rocket burn | 400 ticks (20 seconds) | Announces the rocket burn, plays the fire Start clip, then begins the repeating LP after 40 ticks (2 seconds) |
| Door open | 220 ticks (11 seconds) | Announces that the safety doors are opening and reverses the close movement |

Each step has its own function under `sequence/`. Scheduled callbacks verify Der Eisendrache and their expected sequence state before advancing. The next random cooldown is armed by `sequence/complete` only after the door-open time has elapsed.

Rocket Test sequence announcements and authoring feedback are sent only to players with the `debug` entity tag. Use `tag @s add debug` to see them and `tag @s remove debug` to hide them.

Rocket Test audio is owned by the Map 2 resource-pack namespace under `assets/zbk_der_eisendrache/sounds/der_eisendrache/rocket_test_launch/`. Warning, fire Start and LP, and completion clips play at each player's position without distance attenuation. Players within 100 blocks of the persistent `rocket_test_exhaust` center marker hear those clips at volume 1; all other players hear them at volume 0.05. Door Start, LP, and Stop clips remain spatial sounds originating from each moving door marker and reach players within 40 blocks of that individual door at volume 4 with a minimum volume of 1. The door-opening transition plays the 4.52-second Maxis completion announcement using the same player-relative volume rule as the other non-door sounds.

## Launch Effects

Minecraft 26.2 `minecraft:geyser_base` particles cover the rectangular launch area from X 37 through 82 and Z 42 through 87. The first light burst occurs on the same tick as the warning sound, then continues through the warning, door closure, and countdown with `burst_impulse_base:0.35`. Each randomized sample emits at Y 80 only when the block at Y 79 is non-air and the block directly above it at Y 80 is air. The existing fire timing is unchanged: when the 400-tick (20-second) rocket burn begins, flame starts and the floor switches to denser `burst_impulse_base:1.0` geyser-base sampling. All floor particles stop when the burn ends and the doors begin opening. Both intensities use the four-water-block scale. Random sampling spreads the work over time instead of checking all 2,116 positions every tick.

One persistent `rocket_test_exhaust` marker defines the center of the launch pad at floor level. On the same tick as the warning sound and first floor burst, the public full-geyser function emits a four-water-block `minecraft:geyser` at that marker, producing its base, poof/top, and plume together. Because the full geyser is a short one-shot emitter with no configurable lifetime, it is refreshed every 20 ticks (1 second) throughout sequence states 1-4 and stops when the 400-tick (20-second) fire phase ends. During the burn, the effect also builds a broad engine layer 10 blocks above the marker, carries the existing flame and smoke down through the launch bay, and adds a concentrated four-water-block `minecraft:geyser_base` impact across an approximately 12-block-wide floor area. Flame renders every tick; elevated exhaust smoke and the centered geyser-base impact render every 4 ticks (0.2 seconds). Rocket-fire Start plays immediately at each player's position, and the 4.47-second LP begins after 40 ticks (2 seconds) and repeats every 90 ticks (4.5 seconds). Proximity to this marker selects volume 1 within 100 blocks or volume 0.05 outside that radius. The LP callback is canceled and the sound is force-stopped on the exact tick that the doors begin opening, and initialization performs the same cleanup. The marker remains authoritative across initialization and does not create runtime entities.

During the rocket-burn state, the kill zone covers X 37 through 82, Y 78 through 108, and Z 42 through 87. On the first damage pulse, active wave zombies inside the zone are refunded through the shared enemy-relocation flow so the wave spawner can re-enter them from a valid spawn location. Every 10 ticks (0.5 seconds), non-downed adventure players inside the zone take 5 generic damage, including during manual lobby tests. The pulse accounts for the health regenerated by the player's constant Saturation effect, producing an expected net drain near 4 health per pulse. A full-health Juggernog player starts with 60 health and reaches the pack's 20-health down threshold after approximately 100 ticks (5 seconds), one quarter of the way through the 400-tick (20-second) burn. Players without Juggernog reach that threshold sooner. Because the down system only runs during an active game, a lobby test can cause a normal Minecraft death instead of a Zombies down.

From the initial launch call through sequence completion, Der Eisendrache rejects purchase attempts for Jump Pad ID 4. The shared jump-pad purchase flow passes the candidate ID through `maps/events/jump_pad_purchase_check`; Der Eisendrache returns a blocked result only when that ID is 4 and `rkt_test_state` is active. The pad's persistent progression lock and cooldown state are not modified.

Stand at the launch-pad floor center to place the exhaust anchor. Re-running the summon command replaces the previous anchor:

```mcfunction
function zbk_der_eisendrache:rocket_test_launch/effects/spawning/summon_exhaust
function zbk_der_eisendrache:rocket_test_launch/effects/management/delete_exhaust
```

To test the complete Minecraft 26.2 geyser from a command block, use the
following command. It emits the normal base, poof/top, and plume at the command
block's position using the natural four-water-block scale and returns without
emitting anything unless Der Eisendrache is active. The launch sequence calls this
same function from the persistent exhaust marker every 20 ticks (1 second),
starting with the warning sound and ending with the fire phase.

```mcfunction
function zbk_der_eisendrache:rocket_test_launch/effects/spawn_geyser
```

## Safety Doors

Each persistent `rocket_test_door` marker represents the center seam of one seven-block-wide doorway at floor level. The marker stores a unique positive `rkt_door_id` and one cardinal facing. Its two derived deepslate-brick leaves are each exactly 4 blocks wide, 16 blocks tall, and 1 block thick. The model uses tiled one-block pieces instead of stretching one block texture across the full leaf. Every piece uses full block and sky brightness so the doors remain visible in dark areas. Facing-aware 0.03-block depth clearance separates the broad face from the surrounding wall.

Each configured doorway creates two complete pairs of 4-by-16 block-display leaves. One pair is static and permanently duplicates the left and right side walls at the open positions. The other pair starts directly over the static pair and moves inward to close the doorway. This keeps both side walls filled for the door's entire runtime and prevents gaps behind the moving panels. The static pair uses a slight depth offset to avoid overlap flicker while both pairs occupy the open position. During the rocket-test sequence, the close handler begins 160 ticks (8 seconds) into the warning, 20 ticks (1 second) before the countdown starts, and moves both primary leaves exactly `0.01458333333333333` blocks per tick for 240 ticks (12 seconds), totaling 3.5 blocks. The doors still finish at the original rocket-burn moment, producing a closed eight-block-wide pair. Opening retains its 220-tick (11-second) movement. The manual close command retains the faster 56-tick (2.8-second) motion.

Every real opening or closing movement emits audio from each moving door marker to players within 40 blocks of that door. The 6.47-second Start clip plays immediately, and the 9.29-second LP clip begins once after a 40-tick (2-second) delay without repeating. At the exact movement completion, any pending LP callback is canceled and the LP is force-stopped before the 1.37-second Stop clip plays from each door. Initialization also cancels the callback and force-stops the LP.

During closure, collision follows the leading edge from both sides. A newly half-covered block column receives `minecraft:magenta_stained_glass_pane`; when the leaf reaches the next full-block boundary, that column becomes `minecraft:barrier`. This repeats across the seven-block-wide by 16-block-tall owned doorway until the center closes, so players cannot pass through the already covered part of a moving door. Opening reverses those collision stages from the center outward, downgrading barriers to panes at half-block coverage and clearing each column as it opens. Reset and map cleanup remove derived displays and owned collision; Map 2 initialization then recreates open doors from the persistent markers. Do not place unrelated barrier blocks or magenta stained glass panes inside a configured door's owned volume.

Door state values are `0` for closed, `1` for open, `2` for closing, and `3` for opening.

Place the marker at the doorway's center seam and floor level. Use `north` or `south` when the doorway spans the X axis, and `east` or `west` when it spans the Z axis. Door IDs must be unique.

## Manual Launch Command

```mcfunction
function zbk_der_eisendrache:rocket_test_launch/management/launch
function zbk_der_eisendrache:rocket_test_launch/effects/spawning/summon_exhaust
function zbk_der_eisendrache:rocket_test_launch/doors/spawning/summon {id:1,facing:"north"}
function zbk_der_eisendrache:rocket_test_launch/doors/management/close
function zbk_der_eisendrache:rocket_test_launch/doors/management/open
function zbk_der_eisendrache:rocket_test_launch/doors/management/delete_nearest
```

The command launches whenever Der Eisendrache is selected, including from the lobby for testing. It returns without restarting the sequence if one is already active. During normal gameplay, the first random 3-9 minute cooldown begins after the first forward teleport on Der Eisendrache, with no landing-position requirement. The next cooldown begins after the doors finish opening, and countdowns advance only while the game is active.

## Exhaust dispatch

`effects/exhaust/tick` reuses the selected exhaust marker for flame and smoke while preserving effect throttles. Audio player helpers select the loud or quiet version using one nearby-exhaust check; when several exhaust markers exist, any one within 100 blocks still qualifies. Existing loop scheduling, active-map guards, burn-state guards, and stop/clear functions are unchanged.

## Delayed audio ownership

The delayed door-audio callback checks Der Eisendrache as well as its live audio-active marker before playback. Existing stop/reset paths clear the schedule and marker; the callback guard also prevents stale delayed work after deselection.
