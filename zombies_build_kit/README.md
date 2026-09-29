# Zombies Build Kit datapack

The shared ZBK gameplay and map-building base pack for Minecraft Java 26.2. Its models, sounds, and interface use the matching ZBK resource pack; placed systems use structure templates bundled in this datapack. No separate world structure installation is required.

## What it adds

- Match and round progression, enemies, weapons, purchases, powerups, player state, and shared audio.
- Death Machine muzzle smoke follows its lowered first-person model in either hand.
- The Build Kit for placing and configuring reusable map elements such as doors, barriers, perks, teleporters, traps, and spawn points.
- Persistent markers and initialization that rebuild runtime entities after load and reset.
- Direct calls to core functions and grouped `#zbk:event/*` hooks used by map add-ons. Round start is `#zbk:event/round/round_start`; extension hooks use operation and timing names instead of numbered stages. See the [Base pack integration contract](../README.md#base-pack-integration).

Map-specific quests, locations, and presentation belong to their map packs.

## Core calls and events for add-ons

An add-on uses two directions of communication with the base pack:

| Add-on wants to... | Use | Who runs it? |
| --- | --- | --- |
| Ask the base pack to perform an action | `function zbk:<module>/<operation>` | The add-on calls the owning core function with its required context and arguments. Lifecycle entry points validate requests before changing shared state. |
| React when something happens in the base pack | `#zbk:event/...` | The base pack calls the tag, which runs every subscribed add-on function. |

These are Minecraft function IDs, not files to import or copy. The base pack and the add-on must both be installed. Add-ons call the owning `zbk:` functions directly. Preserve the function's executor, position, macro arguments, and scratch state. A core call may emit events while it runs.

For example, an add-on calls `function zbk:game/start/request` to request a match. The base pack runs `#zbk:event/game/before_game_start` so listeners can block or defer it. If the match starts, the base pack later runs `#zbk:event/game/game_start` so listeners can react.

### Calls available to add-ons

| Purpose | Core functions |
| --- | --- |
| Register a map provider | `zbk:global/startup/register` |
| Control a match | `zbk:game/start/request`, `zbk:game/start/immediate`, `zbk:game/end/request`, `zbk:game/reset/request`, `zbk:game/start/resume` |
| Change shared world state | `zbk:map_elements/power/management/on`, `zbk:map_elements/door/management/unlock_zone`, `zbk:build_kit/events/map_tools_open` |
| Track map enemies and pending spawns | `zbk:waves/management/enemies/register`, `zbk:waves/management/enemies/unregister`, `zbk:waves/management/enemies/reserve`, `zbk:waves/management/enemies/release` |
| Integrate powerup drops | `zbk:combat/powerups/spawning/can_spawn`, `zbk:combat/powerups/spawning/record_spawn` |
| Respond inside a request or extension listener | `zbk:global/events/request/block`, `zbk:global/events/request/defer`, `zbk:global/events/request/complete` (each has a specific callback context) |

Combat, weapons, players, behavior, map elements, Build Kit tools, and debug operations live in their owning folders under [`data/zbk/function/`](data/zbk/function/). Each gameplay module owns its audio and event dispatch. Call functions directly with their required context and arguments; see the [base pack integration guide](../README.md#base-pack-integration).

### Events add-ons can listen for

| Category | Event tags under `#zbk:event/` |
| --- | --- |
| Setup | `startup/register`, `startup/ready` |
| Match | `game/before_game_start`, `game/game_start_deferred`, `game/game_start`, `game/game_end`, `game/before_game_reset`, `game/game_reset`, `game/cutscene_tick`, `game/cutscene_stop` |
| Rounds and enemies | `round/round_start`, `round/round_end`, `enemy/enemy_spawned`, `enemy/enemy_killed` |
| Players | `player/player_down`, `player/player_revived`, `player/player_eliminated`, `player/player_respawned`, `player/before_manual_reload`, `player/inventory_update`, `player/player_tick` |
| World and Build Kit | `world/power_on`, `world/zone_unlocked`, `build_kit/map_tools_open`, `build_kit/builder_tick` |
| Map elements and combat | `map_elements/before_jump_pad_purchase`, `map_elements/teleporter_arrival`, `map_elements/barrel_exploded`, `map_elements/pack_a_punch_gun_spawn`, `map_elements/pack_a_punch_gun_slide`, `map_elements/pack_a_punch_flag_down`, `combat/grenade_step`, `combat/interaction_hit` |
| Recurring work | `runtime/tick`, `runtime/maintenance` |
| Sound and voice | `sound/<cue>` to replace a cue; `voice/<operation>` for callout notifications |
| Advanced integrations | `extension/<operation>/<stage>` for specific weapon, player, combat, boss, and authoring insertion points |

Subscribe by placing a JSON function tag at the matching path in the add-on, with `"replace": false` and the add-on function in `"values"`. For example, `data/zbk/tags/function/event/round/round_start.json` can list `"my_map:events/round_start"`. The [Base pack integration contract](../README.md#base-pack-integration) explains each event's timing, context, request responses, and the complete sound and extension families. The actual tag definitions are under [`data/zbk/tags/function/event/`](data/zbk/tags/function/event/).

## Resource item IDs

Use the matching base resource pack. Item model components use categorized IDs: `zbk:guns/<type>/<weapon>`, `zbk:wall/guns/<type>/<weapon>`, `zbk:special_equipment/`, `zbk:powerups/`, `zbk:perks/`, `zbk:melee/`, and `zbk:map_elements/`. Ray Gun uses `zbk:guns/wonder_weapons/ray_gun`; Death Machine uses `zbk:guns/special/death_machine`. Gameplay function paths, weapon IDs, textures, and sound events are unchanged. Recreate saved items that still carry the previous item model IDs when updating an existing world.
