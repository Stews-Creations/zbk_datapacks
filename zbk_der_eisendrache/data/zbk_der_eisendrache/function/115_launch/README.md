# Der Eisendrache 115 Launch Module

Owns the Map 2 launch pad that carries nearby players through a configured two-phase arc.

## Structure

| Path | Responsibility |
| --- | --- |
| `flight/` | Player vehicle creation, arc calculation, movement, landing, and cleanup |
| `management/` | Proximity activation and launch dispatch |
| `spawning/` | Start, peak, and end marker placement commands |

The module root contains only `on_load`, `on_tick`, and this documentation.

## Lifecycle

`on_load` creates the launch countdown objective. After the central map dispatcher selects Der Eisendrache, `on_tick` detects players, advances the 40-tick (2-second) countdown, and updates active flights.

One `115_launch_start`, one `115_launch_peak`, and one `115_launch_end` marker define the route. Runtime tracking markers and armor-stand vehicles are derived state and are removed after landing.

Tick processing keeps separate activation, countdown decrement, launch, expired-timer reset, and arc-movement phases. Activation sets 40 ticks (2 seconds), immediately decremented to 39 on that tick; launch occurs on the 40th invocation and new arcs move during that invocation. Timer and nearby-player checks precede route searches, but route availability is checked again at launch. The players within 2 blocks at launch time are the passengers. No persistent route or passenger cache is used. Landing clears flight state immediately and schedules vehicle cleanup after 6 ticks (0.3 seconds).

The Start marker also defines the anti-gravity suppression zone. Players retain room membership but immediately lose the room's gravity modifier while within 2 blocks, regain it if they back out before launch while the room is active, and permanently exit the anti-gravity room when `flight/start` commits the flight.

## Marker Commands

These commands only act while Der Eisendrache is selected:

```mcfunction
function zbk_der_eisendrache:115_launch/spawning/spawn_start
function zbk_der_eisendrache:115_launch/spawning/spawn_peak
function zbk_der_eisendrache:115_launch/spawning/spawn_end
```

## Start-marker dispatch

After the shared activation phase, `management/tick_start` handles a selected start marker's countdown, launch at zero, and timer removal. Existing zero-valued timers are processed without an extra decrement. Arc movement still runs afterward; the helpers do not change flight ownership, map restriction, or cleanup.
