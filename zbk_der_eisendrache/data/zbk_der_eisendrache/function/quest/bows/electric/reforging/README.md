# Electric arrow reforging

Map 2-only final electric quest milestone, placed in the overworld. After all three soul-pot-powered fires become electric tornadoes (`#electric de_el_progress = 3`), the loaded weather-vane head immediately starts spinning with flame and electric-spark effects, before anyone interacts with the arrow. The marker shows the existing bottom lightning arrow model with electric sparks and an interaction, without a text label.

Only the current electric quest owner can activate or collect it. Interactions resolve the exact clicker's UUID, require a stable player ID matching `#1 de_bow_owner`, reject downed and spectator players, and enforce a maximum reach of 6 blocks. Ownership changes preserve the shared sequence; the current owner can collect the completed arrow.

## Sequence

1. Right-click the bottom arrow. The weather-vane head must be loaded. The interaction disappears during the animation.
2. The arrow rises exactly 8 blocks over 160 ticks (8 seconds), with 1-tick interpolation, then holds for 40 ticks (2 seconds).
3. The vane head continues the effects started when the electric fires completed: rotation at 36 degrees per tick, eight times its normal speed, rotating flame and electric-spark effects, plus a blue flash every 20 ticks (1 second). These effects run while waiting for the click and throughout the animation, independently of the arrow marker being loaded. Waiting does not advance the arrow's animation clock. The animation clock pauses if the vane unloads; the marker must also remain loaded for animation ticks.
4. At 200 ticks (10 seconds), the full lightning arrow replaces the bottom arrow at the marker's original position. Vane rotation and continuous sequence particles stop. A new interaction and the exact text `pick up arrow` appear.
5. The owner's pickup removes the runtime, sets electric progress to 4 and refreshes the full HUD circle. This completes the milestone without granting a weapon or inventory arrow and unlocks the [final ritual box](../ritual_box/README.md).

A successful final-arrow pickup plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_pickup` once only to the collecting quest owner. This stereo cue, converted from `memento_pickup.flac`, is shared with the initial electric-arrow binding. It plays on accepted collection, not when the arrow becomes ready or runtime is rebuilt. Vanilla beacon and XP cues do not play during reforging.

## Vane storm audio

While electric progress is 3 and the sequence is waiting or animating (phases 0 and 1), the spinning vane loops `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado_vane` for players within 32 blocks of its head. The command keeps the 32-block audience limit and uses `minimumVolume=0.5` with the normal sound attenuation range. Listeners outside the normal audible sphere receive playback two blocks from their position at that minimum volume; nearby listeners retain positional playback from the vane. It uses the same tornado clip at quarter volume (`0.25`), repeating every 91 ticks (4.55 seconds). Each listener's `de_vane_audio` countdown is updated after the sequence tick, so the loop stops when the full arrow becomes ready, the vane unloads, the player leaves range or the stage ends. Cleanup clears playback and countdowns. This loop does not play during the initial quest-hit spin or the model-only spin test. The event is separate from charged-shot tornado audio to allow independent stopping.

## Placement and testing

When the completed arrow returns to its original pickup position at 200 ticks (10 seconds), `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.tornado_arrow` plays once at the marker for all players within 15 blocks. The resource pack contains a mono Ogg Vorbis conversion of `zmb_tornado_arrow_1.flac` for positional playback. The cue accompanies the full-arrow reveal, not the later pickup click, and runtime reconstruction does not replay it. The current animation replaces the raised tail with the full arrow at its base; it has no separate descending phase. No vanilla readiness chime plays.

Select Map 2, stand at the arrow's desired base, and face its display direction:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/reforging/spawning/place
```

Placement snaps X/Z to the block center and keeps the player's feet height; the arrow display begins 0.6 blocks above it. One marker is supported. Repeating placement moves it and preserves readiness, but requires the old marker to be loaded and refuses moves during the animation. Placement never edits real blocks.

To skip to this stage as the executing player (`@s`), use the existing [soul-pot test helper](../soul_pots/README.md):

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/test_complete
```

The helper binds that player and completes the three electric fires; it does not lower later progress. Keep the placed vane loaded and verify it spins with flame and electric sparks before clicking. Right-click the unlabelled arrow, wait for the sequence, and right-click `pick up arrow` to verify the fourth segment.

Delete the loaded placement:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/reforging/management/delete
```

If the marker was manually killed, unregister it before placing again. Do not use this for an unloaded marker:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/reforging/management/unregister
```

Deletion/unregistration clears this sequence and its placement registration without changing completed quest milestones. For a full quest replay, use the [weather-vane reset](../weather_vane/README.md), then the stage test helper; the full reset retains placement markers.

## State and lifecycle

| State | Contract |
| --- | --- |
| `de_er_marker` | Persistent position and heading; source of truth for reconstructing runtime |
| `#placed de_er_state` | Singleton placement registration, including while its chunk is unloaded |
| `#sequence de_er_state` | Shared phase: 0 waiting, 1 animating, 2 full arrow ready, 3 claimed; independent of owner connectivity and marker chunk loading |
| Marker `de_er_state` | Loaded selector cache of the shared phase, refreshed each active-stage tick and during inactive maintenance |
| `#time de_er_tick` | Animation clock; `#height` in the same objective is reconstruction scratch |
| `#flash de_er_tick` | Independent vane flash cadence while waiting and animating; wraps every 20 ticks (1 second) |
| `de_er_runtime` | Reconstructed arrow, interaction and label; specialized tags are `de_er_arrow`, `de_er_interaction` and `de_er_label` |

`#active de_er_state` records whether the previous runtime tick was active. Cleanup clears it on initialization, reset, and stage exit. Inactive ticks skip entity searches; the shared `maps/events/maintenance_1s` hook reconciles runtime that loads after its stage ended every 20 ticks (1 second). Active animation and interaction timing remain at 1 tick (0.05 seconds).

`on_load` creates objectives. `on_tick` reconciles runtime, consumes exact-player interactions and advances the animation while Map 2 is selected. `initialize` rebuilds presentation, preserving a ready or claimed arrow; an interrupted animation returns to the waiting tail. Missing arrow displays during an active sequence rebuild at the saved height. Leaving the area or changing quest bindings does not reset readiness or milestone progress.

The quest orchestrator owns loading, initialization, ticking and cleanup. Full electric-quest resets call this module's internal `management/reset` through the soul-pot reset, clearing the shared sequence even when the placement chunk is unloaded. Map cleanup removes loaded runtime, while placement survives. The normal full quest initialization/reset still resets quest milestones; the presentation-only `initialize` contract does not override that.

| Folder | Responsibility |
| --- | --- |
| `spawning/`, `marker/` | Public placement and runtime creation from the marker |
| `display/` | Missing-runtime reconstruction |
| `interactions/` | UUID routing, ownership gates and final pickup |
| `management/` | State transitions, internal reset/cleanup and operator deletion |
| `animations/`, `effects/` | Timed ascent, temporary vane rotation and particles |

Uses the existing `zbk_der_eisendrache:quest/bows/arrows/lightning_tail` and `zbk_der_eisendrache:quest/bows/arrows/lightning` item models. Gameplay stays in this module; generated models are not edited here. Dependencies are [shared binding](../../binding/README.md), [soul-pot progression](../soul_pots/README.md), the [weather vane](../weather_vane/README.md) and the [quest HUD](../../../hud/README.md).

## Validation

An isolated vanilla 26.2 server with two connected players verifies stage gates, vane rotation and flash cadence before interaction, waiting without arrow progression, wrong-owner/out-of-range/downed rejection, the 8-block ascent, accelerated vane rotation, unload pause, display reconstruction, the full-arrow swap, stopped rotation, ownership changes, pickup and the actual full-circle inventory item, completed-state reconstruction, reset, wrong-map cleanup and deletion. Client visuals and right-click targeting still need an in-game check.

## Marker presentation dispatch

`display/tick_marker` runs display synchronization and waiting effects using the selected marker. Interaction handling remains after presentation and before the separate animation pass. Stage exit, missing-runtime reconstruction, and map guards retain their existing ownership.
