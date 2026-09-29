# ZBK Datapacks

The `zombies_build_kit` datapack supplies shared Zombies Build Kit gameplay and map-building tools for Minecraft Java 26.2.

The base pack bundles shared structure templates in `zombies_build_kit/data/zbk/structure/`, grouped by category and using IDs such as `zbk:barriers/barrier`. Pack-a-Punch templates live in the `pack_a_punch/` category. No separate structures download or world-folder installation is required.

## Packs

All packs start at version `1.0.0` and target Minecraft Java 26.2.

| Pack | Purpose |
| --- | --- |
| `zombies_build_kit` | Required base pack systems and shared event hooks |
| `zbk_nacht_der_untoten` | Nacht map behavior and authoring tools |
| `zbk_der_eisendrache` | Der Eisendrache map behavior and authoring tools |
| `zbk_template` | Developer reference and starting point for a custom map |

Install the base pack with at most one map provider. The template is itself a provider: use it in a development world rather than alongside Nacht or DE.

## Base pack integration

The base pack owns match progression, shared weapons, players, purchases, and reusable placed systems. Map datapacks subscribe to vanilla function tags and call the owning core functions directly in the `zbk:` namespace. The base pack contains no map-name dispatch. Use the lifecycle entry points below for state transitions, and preserve each operation's executor, position, arguments, and scratch-state requirements. Internal steps are not interchangeable with complete operations. The [map template](zbk_template/README.md) provides executable examples.

The datapack release version is `1.0.0`; its add-on compatibility revision is `30000`. Minecraft Java 26.2 uses datapack format 107.1. Release versions, add-on compatibility revisions, and Minecraft pack formats are different values. Update the base pack and its add-ons together; function paths and caller requirements must match the tested core revision.

### Install and register

Install the base pack and one map provider. Zero map providers is a supported Base pack only installation. Multiple providers or a provider requiring a different compatibility revision leave map runtime inactive and produce a diagnostic. Other event listeners can coexist without registering as a map provider.

An add-on's `minecraft:load` function creates its own objectives and disables its runtime until registration succeeds. The base pack waits until the next tick after load before collecting registrations, so the registration contract does not depend on pack load order. Register a map through `#zbk:event/startup/register`:

```mcfunction
function zbk:global/startup/register {id:"my_map",version:30000}
```

During `ready`, read `storage zbk:registry active{id:"my_map"}` to determine whether the provider was accepted, then initialize its runtime. An absent `active` compound means no map is authorized. Without the base pack, leave the add-on inactive. The add-on owns its own active flag and must guard public commands, tick handlers, and scheduled callbacks.

### Subscribe to events

For example, place this file in the add-on at `data/zbk/tags/function/event/round/round_start.json`:

```json
{
  "replace": false,
  "values": ["my_map:events/round_start"]
}
```

The base pack supplies empty definitions so no-listener operation is valid. Listeners must append, never replace, the tag. Do not depend on ordering between independent add-ons.

The tag directory is grouped by responsibility. Use the full path after `event/` when subscribing; for example `#zbk:event/round/round_start`. The listener function in `values` keeps its own add-on namespace and may have a different path.

| Directory under `event/` | Hooks |
| --- | --- |
| `startup/` | Provider registration and the base pack readiness |
| `game/`, `round/`, `player/`, `enemy/` | Match and actor lifecycle |
| `world/`, `map_elements/`, `build_kit/` | Shared world and authoring systems |
| `combat/`, `runtime/` | Combat integration and recurring ticks |
| `sound/` | Replaceable cues; `sound/voice/` holds character voice cues |
| `voice/` | Voice callout notifications and processing |
| `extension/` | Operation-specific insertion points, grouped by owning system |

Moving a tag changes its public ID. Add-on subscriptions must use these grouped paths; the previous flat IDs are no longer called.

The current callback context is `storage zbk:events stack[-1].context`. Nested dispatch restores the outer frame. Read or copy context synchronously; do not keep an NBT path to it for a scheduled callback. Context contains `event` and, for lifecycle dispatch, `round`, `round_type` (0 normal, 1 dog), and `actor_id` (0 when there is no player actor). Event-specific fields are described below. Callback functions retain the documented executor and position; use `at @s` explicitly when changing executor.

### Lifecycle notifications

| Tag suffix | Timing and context |
| --- | --- |
| `startup/ready` | Definitions and registration are ready; reconstruct accepted add-on runtime |
| `build_kit/map_tools_open` | As the player who selected Map Tools; the active provider can show its builder dialog |
| `game/before_game_reset` | Before shared runtime cleanup; `reason` identifies the reset; cleanup cannot veto reset |
| `game/game_reset` | Shared reset finished; rebuild map runtime from persistent configuration |
| `game/game_start` | Match setup finished and the first round is scheduled |
| `game/game_end` | A running match stops, before result state is cleared; includes `reason` |
| `round/round_start` | Number, type, statistics, and countdown are initialized |
| `round/round_end` | Once on completion, before completed-round type is cleared |
| `world/power_on` | Power changed from unavailable to available |
| `world/zone_unlocked` | First unlock of a zone in the current reset generation; `zone` is its integer ID |
| `enemy/enemy_spawned` | As and at the created enemy; conversion/recovery does not allocate an extra kill |
| `enemy/enemy_killed` | As and at the victim; `killer_id` is the credited stable player ID or 0 when unknown |
| `player/player_down` | As the downed player after down state is applied, before game-over evaluation |
| `player/player_revived` | As the player after down state is cleared |
| `player/player_eliminated` | As the eliminated player after entering spectator mode |
| `player/player_respawned` | As and at a previously eliminated player after next-round respawn |

Reset reasons include `load`, `new_game`, `manual`, and `game_over`. Initial startup is represented by `ready`; intermediate module initialization does not emit map reset callbacks. A new match includes a reset, so a reset is not necessarily a game-over notification.

An enemy death is emitted once per entity. Cleanup and crawler conversion are not kill events. Environmental deaths may have no credited player. Map-owned attacks must use the exported combat/credit entry points and keep the original owner identity rather than selecting the nearest player.

### Requests and responses

| Request tag | Additional context | Response |
| --- | --- | --- |
| `game/before_game_start` | `resuming`, `skip_cutscene` as 0/1 | Block, or claim a deferred normal start |
| `map_elements/before_jump_pad_purchase` | `jump_pad_id` | Block before payment and activation |
| `player/before_manual_reload` | Actor is the requesting player | Block before reload consumes the input |

Use `zbk:global/events/request/block` inside a request listener. Denial is monotonic and local to the current request; another listener cannot undo it. Notification listeners cannot block. Tag return values are not votes.

For a delayed intro, call `zbk:global/events/request/defer {owner:"my_map"}` only during an initial, cutscene-enabled start request. Do not start the intro inside that listener. The base pack first resolves every listener and accepts at most one claim from the active provider. Conflicting claims or a denial prevent acceptance.

After acceptance, `game_start_deferred` contains `owner`, `token`, and `generation`. Copy the context to add-on storage and begin the intro. When finished, outside an event callback, call:

```mcfunction
function zbk:game/start/resume with storage my_map:state start_ticket
```

Resume validates the owner and ticket, reruns readiness with `resuming:1`, then continues gameplay once without repeating the intro. Reset, reload, or a consumed token makes old tickets invalid. A blocked resume does not begin gameplay. Add-ons must stop their own pending intro schedules on reset and cutscene cleanup.

### Public state transitions

| Function | Contract |
| --- | --- |
| `zbk:game/start/request` | Request normal start and configured cutscenes |
| `zbk:game/start/immediate` | Request start with cutscenes skipped; readiness restrictions still apply |
| `zbk:game/end/request` | End an active match through the base pack's ending flow |
| `zbk:game/reset/request` | Reset through shared orchestration |
| `zbk:game/start/resume` | Resume an accepted start using its owner/token/generation |
| `zbk:map_elements/power/management/on` | Activate power once through the shared system |
| `zbk:map_elements/door/management/unlock_zone {zone:3}` | Unlock a zone through shared spawner/signals handling |
| `zbk:waves/management/enemies/register` | As an existing map enemy, make it count toward round completion |
| `zbk:waves/management/enemies/unregister` | As that entity, remove its round membership without awarding a kill |
| `zbk:waves/management/enemies/reserve` | As a pending-spawn marker, hold round completion until released |
| `zbk:waves/management/enemies/release` | Release that marker's round hold |
| `zbk:build_kit/events/map_tools_open` | Dispatch `map_tools_open` as the requesting player so the active provider can show its Map Tools dialog |

Game start/end/reset/resume calls are rejected during event dispatch. Schedule an intentional transition after the callback instead of recursively resetting the world. Power and zone calls support nested notification dispatch. Add-ons must not write match/round progression directly.

`zbk:combat/powerups/spawning/can_spawn` returns 1 when the shared powerup drop gate permits a candidate, otherwise 0. It does not change counters or consume the candidate; an accepted add-on spawn calls `zbk:combat/powerups/spawning/record_spawn` once after creating its pickup. The base pack increments the round drop count and sets the next requirement to 30 kills before the next candidate is processed.

### Shared integration contracts

`runtime/tick`, `player/player_tick`, and `runtime/maintenance` provide ordered global, player-context, and 20-tick (1-second) integration. `player/inventory_update` runs after shared inventory reconstruction; add-on HUD items must use their documented reserved slots. `build_kit/builder_tick` runs in the shared player authoring hook. Keep expensive scans behind active-state and feature-presence checks.

`map_elements/teleporter_arrival` preserves the arriving player's context. `combat/grenade_step` preserves the precise physics sample and projectile owner; it is not a once-per-tick approximation. `map_elements/barrel_exploded` identifies the persistent barrel marker after explosion state changes.

`combat/interaction_hit` is a request at the shared weapon interaction edge. An add-on that consumes the hit calls `zbk:global/events/request/block`; otherwise the normal base pack interaction continues. Read the raycast shooter state; the callback is not automatically executed as the shooter.

`map_elements/pack_a_punch_gun_spawn`, `map_elements/pack_a_punch_gun_slide`, and `map_elements/pack_a_punch_flag_down` are presentation requests as and at the selected machine. Handle the presentation and block the fallback only for owned machines. Persistent markers with `zbk.custom_presentation` are excluded from default machine display reconstruction. Shared purchase state and payment remain owned by the base pack.

`sound/<cue>` requests let the active provider replace a base pack sound cue. Play the replacement and block the fallback; otherwise the base pack plays its default. `voice/<operation>` notifications preserve gameplay callout opportunities. The base pack assigns four character slots and applies the default voice cooldown; add-ons can replace a callout through the corresponding `sound/voice/<cue>` request.

The `extension/` tags are low-level, operation-specific contracts for registered weapon input, inventory presentation, combat, boss integration, and authoring. The path names the owning base pack operation. A single insertion point uses the operation path directly, such as `extension/combat/weapons/grenade/explode`; operations with several distinct insertion points add a timing name, such as `extension/combat/weapons/initialize/before_reset` or `extension/combat/weapons/mechanics/raycast/block_impact/after_core_explosion`. Read the base pack caller for the exact executor, state, and adjacent commands. The callback's `context.event` matches the path after `event/`.

Consecutive add-on-only slots have one hook. For example, `extension/player/inventory/weapon_displays/gun_1/custom_weapons` runs after the base pack's weapon display cases; an add-on dispatches its own weapon IDs inside one listener. The base pack checks for completion after the tag returns. An add-on with several internal handlers must stop calling later handlers when an earlier one completes the request. Arguments appear in `context.args`; legacy shared combat scratch scores retain their owner/context contract for that operation. Only those callbacks may update their delegated weapon/profile fields. They must not change base pack match progression.

`zbk:global/events/request/complete {result:0}` marks a handled low-level extension and returns its result from the interrupted operation. This is separate from blocking a purchase/start request. Callback-local state must not leak across players or subsequent invocations. Call combat, player, behavior, map-element, and Build Kit operations directly in their owning modules. Preserve their execution context and named macro arguments. Test add-ons against the core revision they ship with; a helper path alone does not promise a complete, safe state transition.

### Validation

Validate the base pack alone and with each map provider separately. Package each datapack independently with `pack.mcmeta` at the ZIP root. See [Runtime and development](#runtime-and-development) for static and runtime checks.

Use a disposable Minecraft 26.2 server to test registration, nested requests, denial, deferred start/resume/cancellation, completed-round snapshots, and lifecycle reentrancy. Test each map separately and with conflicting providers. Client presentation, sounds, multiplayer, and VR require client tests in addition to command validation.

#### Panzer integration check

In a disposable Minecraft 26.2 server, check that absent markers disable the schedule, round 12 starts a spawn, round 13 does not, round 18 repeats it, and reset removes runtime enemies and models while keeping placement markers. Package the base pack first.

## Install

1. Archive the contents of `zombies_build_kit/` with `pack.mcmeta` at the ZIP root, excluding development documentation from Minecraft resource directories. Copy the ZIP into `<WORLD>/datapacks/`.
2. Enable the matching `zombies_build_kit` resource pack from [zbk_resourcepacks](https://github.com/Stews-Creations/zbk_resourcepacks). All shared structure templates ship inside the base pack and update with it.
3. Run `/reload`, confirm the pack with `/datapack list`, then use `/function zbk:build_kit/help/give_book` to open the Build Kit workflow.

For a map, archive its matching pack directory the same way, copy its ZIP into the world, and enable its matching resource pack above the base pack. Installing a map datapack does not supply a finished world or create its required map geometry and configured markers.

The optional Vivecraft resource overlay and VR companion mod are client additions. The base pack runs without them. This pack supplies systems for a world you build; it does not include a finished playable map.

## Bundled structure templates

The base pack includes barriers, doors and gates, powered doors, perk machines, the power switch, Mystery Box locations, and Pack-a-Punch collision and clearing templates. Keep animation and clearing variants with their placement templates. Gameplay functions configure the placed elements; use the Build Kit tools to perform their complete setup.

The template `data/zbk/structure/barriers/barrier.nbt` is loaded as `zbk:barriers/barrier`. Pack-a-Punch uses `zbk:pack_a_punch/pack_a_punch` and `zbk:pack_a_punch/pack_a_punch_empty`. Preserve template identifiers, origins, entity tags, and embedded commands when editing them. Existing placed signs retain their saved commands until replaced or updated.

When upgrading an existing world, close it and back up its former `generated/minecraft/structure/zbk/` folder outside `generated/`, then remove that folder or its old source junction. Check the older plural `generated/minecraft/structures/zbk/` path too. World-installed copies under the same namespace and path can override bundled templates. Update custom commands to the `zbk:<category>/<template>` IDs when upgrading; the old shared namespace and root-level Pack-a-Punch IDs are no longer supplied. Keep unrelated map-specific structures. New worlds need only the datapack. Structure blocks still save edits to the world; copy reviewed `.nbt` exports into the base pack's matching `data/` path to distribute them.

Download the base pack and template ZIPs from the [releases page](https://github.com/Stews-Creations/zbk_datapacks/releases). Each ZIP includes the bundled `.nbt` templates and the `LICENSES/` notices. See [Releases](#releases) for how they are built.

## Runtime and development

The installed datapack folder is `zombies_build_kit`; base pack gameplay functions and dialogs use the `zbk:` namespace. See the [pack overview](zombies_build_kit/README.md) for shared systems and [function architecture](zombies_build_kit/data/zbk/function/README.md) for entry points and module ownership.

Before publishing, parse functions with Mecha against Minecraft 26.2, parse JSON, check function and dialog references, and run `git diff --check`. Test the base pack alone and each map separately. Macro-generated paths and gameplay require isolated Minecraft 26.2 tests. Verify a fresh world, placement, start/reset/reload, combat, purchases, and multiplayer before publishing a playable map.

## Releases

| Workflow | Runs | Result |
| --- | --- | --- |
| [Build datapacks](.github/workflows/build-datapacks.yml) | On every push, or manually | Packages and inspects `zombies_build_kit` and `zbk_template`, then uploads each ZIP as a workflow artifact. These are development builds. |
| [Release datapacks](.github/workflows/release-datapacks.yml) | Manually from `main` | Publishes a GitHub release with `zombies_build_kit-<tag>.zip` and `zbk_template-<tag>.zip`. |

To publish a release, set the version in each pack's `VERSION` file and `pack.mcmeta`, merge to `main`, then run **Release datapacks** with the matching tag, such as `v1.0.0`. The workflow stops if the tag and a pack version differ. Running it with an existing tag rebuilds that revision.

Each ZIP has `pack.mcmeta` at its root and installs by copying it into a world's `datapacks/` folder. It contains the pack metadata, the functions, JSON, and structure templates under `data/`, and the `LICENSES/` folder. Documentation and development files are left out.

## License and credit


Free noncommercial use, modification, and sharing are allowed with credit to
[MiniStew](https://www.youtube.com/@MiniStew). Monetized videos and streams are
allowed under the [media permission](LICENSES/MEDIA_PERMISSION.md). Selling covered ZBK
content or maps containing it, or charging for server access, is not covered
by that permission. See [licensing and attribution](LICENSES/LICENSE.md) for the code
and asset licenses, their scope, and redistribution requirements.
