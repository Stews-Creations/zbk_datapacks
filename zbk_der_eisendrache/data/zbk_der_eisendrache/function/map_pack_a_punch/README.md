# Der Eisendrache Pack-a-Punch Module

Owns the Map 2 Pack-a-Punch location-linking, unlock, relocation, machine presentation, and Build Kit placement flow.

## Structure

| Path | Responsibility |
| --- | --- |
| `build/` | Build Kit dialogs and deletion redirection |
| `location_manager/` | Location IDs, activation, deactivation, and relocation |
| `machine/` | Machine runtime, model, and animations |
| `management/` | Round-start state transitions |
| `sign/` | Location sign placement, display, and deletion |
| `spawning/` | Location marker placement and dormant location UI |
| `structures/` | Map-specific structure placement |
| `unlock/` | Three-location linking and debris sequence |
| `usage/` | Successful purchase handling |

The module root is limited to lifecycle hooks, trigger enabling, and documentation.

## Lifecycle

- `on_load` creates objectives and initializes tuning values.
- `initialize` resets unlock and relocation state, removes derived machine entities, and rebuilds dormant UI from persistent location and sign markers.
- `on_tick` runs machine animation, placement detection, unlock debris, signs, and safe relocation after the Der Eisendrache dispatcher is selected.
- `management/on_round_start` is called through `maps/events/round_start` once per Der Eisendrache round.
- `enable_triggers` enables the two Build Kit spawn-egg triggers for one player.

Persistent `map_pack_a_punch_location` and `de_pack_location_sign` markers are configuration. Machine models, interactions, debris, and location UI are derived runtime state.

The active machine purchase interactions are 1.5 blocks tall and 0.5 blocks wide in every orientation, starting 0.5 blocks above the location marker. Recreating the machine applies these dimensions.

Location-link, materialization, and relocation tellraws target only players tagged `debug`; progression and machine behavior are unchanged.

## Sign lookup dispatch

`sign/read_location` selects the current loaded active locations once per refresh and computes a call-local location code. `sign/apply_location` writes the resulting model to each sign. If malformed duplicate active locations exist, the original location-3-over-2-over-1 precedence is preserved. The scratch score is recomputed every call; machine movement, buy locks, and reset/deactivation paths are unchanged.

## Shared machine callbacks

The reusable machine cycle enters map-owned gun spawning, gun sliding, and flag animation through the central `maps/events/pack_a_punch_*` callbacks. The callbacks preserve machine context and reject other maps. There is no separate empty purchase callback; generic purchasing remains owned by the reusable Pack-a-Punch cycle.

## Display range

The active machine model, local location UI, and signs use `view_range:0.5f` when created. Template-based structure displays and passengers receive the same range after placement and during initialization on Map 2; deliberately hidden displays stay hidden. These range multipliers depend on client entity-distance settings; they are not distances in blocks.
