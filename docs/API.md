# ZBK Core API 1.0.0

ZBK Core owns match progression, shared weapons, players, purchases, and reusable placed systems. Map datapacks subscribe to vanilla function tags and call public `zbk:api/` functions. Core contains no map-name dispatch. Other functions in the `zbk:` namespace are private to Core.

The datapack release version is `1.0.0`; its API compatibility number is `10000`. Minecraft Java 26.2 uses datapack format 107.1. Release versions and Minecraft pack formats are different values.

## Install and register

Install Core and one map provider. Zero map providers is a supported Core-only installation. Multiple providers or a provider requiring a different API version leave map runtime inactive and produce a diagnostic. Other event listeners can coexist without registering as a map provider.

An add-on's `minecraft:load` function creates its own objectives and disables its runtime until registration succeeds. Core waits until the next tick after load before collecting registrations, so the registration contract does not depend on pack load order. Register a map through `#zbk:event/register`:

```mcfunction
function zbk:api/map/register {id:"my_map",version:10000}
```

During `core_ready`, read `storage zbk:registry active{id:"my_map"}` to determine whether the provider was accepted, then initialize its runtime. An absent `active` compound means no map is authorized. Missing Core must leave the add-on inactive. The add-on owns its own active flag and must guard public commands, tick handlers, and scheduled callbacks.

## Subscribe to events

For example, place this file in the add-on at `data/zbk/tags/function/event/round_start.json`:

```json
{
  "replace": false,
  "values": ["my_map:events/round_start"]
}
```

Core supplies empty definitions so no-listener operation is valid. Listeners must append, never replace, the tag. Do not depend on ordering between independent add-ons.

The current callback context is `storage zbk:events stack[-1].context`. Nested dispatch restores the outer frame. Read or copy context synchronously; do not keep an NBT path to it for a scheduled callback. Context contains `event` and, for lifecycle dispatch, `round`, `round_type` (0 normal, 1 dog), and `actor_id` (0 when there is no player actor). Event-specific fields are described below. Callback functions retain the documented executor and position; use `at @s` explicitly when changing executor.

## Lifecycle notifications

| Tag suffix | Timing and context |
| --- | --- |
| `core_ready` | Definitions and registration are ready; reconstruct accepted add-on runtime |
| `before_game_reset` | Before shared runtime cleanup; `reason` identifies the reset; cleanup cannot veto reset |
| `game_reset` | Shared reset finished; rebuild map runtime from persistent configuration |
| `game_start` | Match setup finished and the first round is scheduled |
| `game_end` | A running match stops, before result state is cleared; includes `reason` |
| `round_start` | Number, type, statistics, and countdown are initialized |
| `round_end` | Once on completion, before completed-round type is cleared |
| `power_on` | Power changed from unavailable to available |
| `zone_unlocked` | First unlock of a zone in the current reset generation; `zone` is its integer ID |
| `enemy_spawned` | As and at the created enemy; conversion/recovery does not allocate an extra kill |
| `enemy_killed` | As and at the victim; `killer_id` is the credited stable player ID or 0 when unknown |
| `player_down` | As the downed player after down state is applied, before game-over evaluation |
| `player_revived` | As the player after down state is cleared |
| `player_eliminated` | As the eliminated player after entering spectator mode |
| `player_respawned` | As and at a previously eliminated player after next-round respawn |

Reset reasons include `load`, `new_game`, `manual`, and `game_over`. Initial Core bootstrap is represented by `core_ready`; intermediate module initialization does not emit map reset callbacks. A new match includes a reset, so a reset is not necessarily a game-over notification.

An enemy death is emitted once per entity. Cleanup and crawler conversion are not kill events. Environmental deaths may have no credited player. Map-owned attacks must use the exported combat/credit entry points and keep the original owner identity rather than selecting the nearest player.

## Requests and responses

| Request tag | Additional context | Response |
| --- | --- | --- |
| `before_game_start` | `resuming`, `skip_cutscene` as 0/1 | Block, or claim a deferred normal start |
| `before_jump_pad_purchase` | `jump_pad_id` | Block before payment and activation |
| `before_manual_reload` | Actor is the requesting player | Block before reload consumes the input |

Use `zbk:api/request/block` inside a request listener. Denial is monotonic and local to the current request; another listener cannot undo it. Notification listeners cannot block. Tag return values are not votes.

For a delayed intro, call `zbk:api/request/defer {owner:"my_map"}` only during an initial, cutscene-enabled start request. Do not start the intro inside that listener. Core first resolves every listener and accepts at most one claim from the active provider. Conflicting claims or a denial prevent acceptance.

After acceptance, `game_start_deferred` contains `owner`, `token`, and `generation`. Copy the context to add-on storage and begin the intro. When finished, outside an event callback, call:

```mcfunction
function zbk:api/game/resume with storage my_map:state start_ticket
```

Resume validates the owner and ticket, reruns readiness with `resuming:1`, then continues gameplay once without repeating the intro. Reset, reload, or a consumed token makes old tickets invalid. A blocked resume does not begin gameplay. Add-ons must stop their own pending intro schedules on reset and cutscene cleanup.

## Public state transitions

| Function | Contract |
| --- | --- |
| `zbk:api/game/start` | Request normal start and configured cutscenes |
| `zbk:api/game/start_immediate` | Request start with cutscenes skipped; readiness restrictions still apply |
| `zbk:api/game/end` | End an active match through Core's ending flow |
| `zbk:api/game/reset` | Reset through shared orchestration |
| `zbk:api/game/resume` | Resume an accepted start using its owner/token/generation |
| `zbk:api/power/activate` | Activate power once through the shared system |
| `zbk:api/zones/unlock {zone:3}` | Unlock a zone through shared spawner/signals handling |
| `zbk:api/enemy/register` | As an existing map enemy, make it count toward round completion |
| `zbk:api/enemy/unregister` | As that entity, remove its round membership without awarding a kill |
| `zbk:api/enemy/reserve` | As a pending-spawn marker, hold round completion until released |
| `zbk:api/enemy/release` | Release that marker's round hold |
| `zbk:api/authoring/open` | Open the active provider's builder entry through `authoring_open` |

Game start/end/reset/resume calls are rejected during event dispatch. Schedule an intentional transition after the callback instead of recursively resetting the world. Power and zone calls support nested notification dispatch. Add-ons must not write match/round progression directly.

`zbk:api/powerups/can_spawn` returns 1 when the shared powerup drop gate permits a candidate, otherwise 0. It does not change counters or consume the candidate; an accepted add-on spawn calls `zbk:api/powerups/record_spawn` once after creating its pickup. Core increments the round drop count and sets the next requirement to 30 kills before the next candidate is processed.

## Shared integration contracts

`tick`, `player_tick`, and `maintenance` provide ordered global, player-context, and 20-tick (1-second) integration. `inventory_update` runs after shared inventory reconstruction; add-on HUD items must use their documented reserved slots. `builder_tick` runs in the shared player authoring hook. Keep expensive scans behind active-state and feature-presence checks.

`teleporter_arrival` preserves the arriving player's context. `grenade_step` preserves the precise physics sample and projectile owner; it is not a once-per-tick approximation. `barrel_exploded` identifies the persistent barrel marker after explosion state changes.

`interaction_hit` is a request at the shared weapon interaction edge. An add-on that consumes the hit calls `request/block`; otherwise the normal Core interaction continues. Read the raycast shooter state; the callback is not automatically executed as the shooter.

`pack_a_punch_gun_spawn`, `pack_a_punch_gun_slide`, and `pack_a_punch_flag_down` are presentation requests as and at the selected machine. Handle the presentation and block the fallback only for owned machines. Persistent markers with `zbk.custom_presentation` are excluded from default machine display reconstruction. Shared purchase state and payment remain Core-owned.

`sound_<cue>` requests let the active provider replace a Core sound cue. Play the replacement and block the fallback; otherwise Core plays its default. `voice_<operation>` notifications preserve gameplay callout opportunities. Core assigns four character slots and applies the default voice cooldown; add-ons can replace a callout through the corresponding `sound_voice_<cue>` request. Neither mechanism selects a numeric map ID or changes global resource-pack selection.

The `extension/` tags are low-level, operation-specific contracts for registered weapon input, inventory presentation, combat, boss integration, and authoring. Their namespace/path identifies the shared operation; the final stage identifies the precise synchronous insertion point. Their listeners are real consumers, not a catalogue of hypothetical events. Arguments appear in `context.args`; legacy shared combat scratch scores retain their owner/context contract for that operation. Only those callbacks may update their delegated weapon/profile fields. They must not change Core match progression.

`zbk:api/request/complete {result:0}` marks a handled low-level extension and returns its result from the interrupted operation. This is separate from blocking a purchase/start request. Callback-local state must not leak across players or subsequent invocations. Public adapters below `zbk:api/combat/`, `player/`, `behavior/`, `map_elements/`, and `build_kit/` preserve the execution context and named macro arguments of their exported operation; map code must use the adapter rather than call private Core functions.

## Validation

Validate Core alone and with each map provider separately. Package each datapack independently with `pack.mcmeta` at the ZIP root. See the [repository guide](../README.md) for static and runtime checks.

Use a disposable Minecraft 26.2 server to test registration, nested requests, denial, deferred start/resume/cancellation, completed-round snapshots, and lifecycle reentrancy. Test each map separately and with conflicting providers. Client presentation, sounds, multiplayer, and VR require client tests in addition to command validation.

### Panzer integration check

In a disposable Core-only Minecraft 26.2 server, check that absent markers disable the schedule, round 12 starts a spawn, round 13 does not, round 18 repeats it, and reset removes runtime enemies and models while keeping placement markers. Package Core first.
