# Global Module

Owns shared objectives, teams, startup registration, gamerules, rendering maintenance, and cross-module event response state.

## Structure

| Path | Responsibility |
| --- | --- |
| `startup/` | Load state, load messages, map provider registration, and readiness |
| `gamerules/` | Apply recommended rules or restore defaults |
| `rendering/` | Shared display range maintenance |
| `events/` | Global tick and maintenance notification dispatch |
| `events/request/` | Block, defer, or complete the current synchronous event request |

`on_load`, `on_tick`, and `on_tick_as_player` supply the shared module lifecycle. `tick_1s` owns the scheduled 20-tick maintenance pass. The pack-level `load`, `tick`, and `on_tick_as_player` functions orchestrate the owning modules.

## Registration and requests

Call `zbk:global/startup/register` with `{id,version}` only during `#zbk:event/startup/register`. Readiness dispatch follows registration on the next tick after load.

The request helpers operate on `storage zbk:events stack[-1].context`. Use them synchronously inside the applicable event listener; nested dispatch restores the outer frame. See the [integration contract](../../../../../README.md#base-pack-integration) for blocking, deferral, and completion rules.
