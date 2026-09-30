# ZBK Map Pack Template

An executable developer reference for map add-ons targeting ZBK base pack compatibility revision 30000. Install the template with the base pack to run its event examples. The pack uses the shared `zbk` namespace for registration and event tags, and `zbk_template` for its own functions, storage, identifiers, and objectives. It has no gameplay effect by default.

## Install and test

1. Install the matching ZBK base pack release and `zbk_template.zip` in a disposable Minecraft Java 26.2 world.
2. Run `/reload`; the base pack registers the template and reports a conflict if another map provider is installed.
3. Use the base pack's Map Tools page to open ZBK Template Tools. Place the sample marker to test persistent marker reconstruction. Toggle the start-block or deferred-start example only when you want to exercise those request hooks.
4. Run `/function zbk:game/reset/request` or use the dialog reset button to see the reset listener clear and rebuild runtime displays. Test the template without the base pack separately: the template must remain inactive.

The dialog also exposes examples of public power activation and zone unlocking calls. Those buttons intentionally invoke the examples only when clicked.

To see event diagnostics, run `/tag @s add debug` before `/reload`, then use the dialog, kill a hostile entity, or start a round. Messages prefixed `[ZBK Template]` go only to players with the `debug` tag. Use `/tag @s remove debug` when finished. The per-tick handlers do not send chat messages. For the start examples, toggle one flag in the dialog, then call `/function zbk:game/start/request`; toggle it again to turn it off. A deferred start reports its accepted callback and scheduled resume. The dialog buttons themselves show their on/off state to the player who clicked them.

The function namespace root contains only `on_load`, `initialize`, and `on_tick` lifecycle hooks. The base pack event handlers, including registration and the Map Tools listener, live in `function/event/`.

## File guide

Every `.mcfunction` begins with a comment explaining its caller and purpose. Follow setup from `on_load` through `event/ready` and `initialize`; `on_tick` handles the demo trigger through `map_tools_open/trigger`. Other examples live in `demo/`, `game/`, and `marker/`. JSON and metadata files cannot contain Minecraft comments, so their roles are listed here:

| File | Purpose |
| --- | --- |
| `pack.mcmeta` | Declares Minecraft 26.2 pack compatibility; its `${version}` placeholder is stamped from the release tag when packaged, alongside a generated `VERSION` file. |
| `data/minecraft/tags/function/load.json` | Calls `zbk_template:on_load` on datapack load and `/reload`. |
| `data/zbk_template/dialog/map_tools.json` | Defines the builder dialog and its opt-in sample buttons. |
| `data/zbk/tags/function/event/startup/register.json` | Subscribes the provider registration handler. |
| `data/zbk/tags/function/event/startup/ready.json` | Subscribes setup after the base pack selects the active provider. |
| `data/zbk/tags/function/event/build_kit/map_tools_open.json` | Opens the builder dialog when a player selects Map Tools. |
| `data/zbk/tags/function/event/build_kit/builder_tick.json` | Enables the demo trigger for each builder. |
| `data/zbk/tags/function/event/runtime/tick.json` | Calls the root `on_tick` hook to check the demo trigger once per global tick. |
| `data/zbk/tags/function/event/game/before_game_start.json` | Subscribes the optional start block and defer requests. |
| `data/zbk/tags/function/event/game/game_start_deferred.json` | Receives the base pack's accepted deferral and schedules resume. |
| `data/zbk/tags/function/event/game/before_game_reset.json` | Cancels a pending resume before reset. |
| `data/zbk/tags/function/event/game/game_reset.json` | Rebuilds displays after reset. |
| `data/zbk/tags/function/event/map_elements/before_jump_pad_purchase.json` | Demonstrates a conditional purchase veto for pad 99. |
| `data/zbk/tags/function/event/enemy/enemy_killed.json` | Demonstrates a kill notification. |
| `data/zbk/tags/function/event/round/round_start.json` | Demonstrates round context and a round-10 actionbar. |

Each event tag uses `replace: false` and names its matching `zbk_template:event/*` handler. When adapting the pack, keep the tag path in the base pack's `zbk` namespace and change the handler value to your own namespace. The files in `LICENSES/` contain the project terms and notices; keep them with distributed copies.

## Events and state

The `#zbk:event/*` tags in this pack use `replace: false`, so handlers append to the base pack's empty event tags. Notification handlers read the synchronous frame at `storage zbk:events stack[-1].context`. For example, `round_start` checks the current round number and `enemy_killed` runs as the victim; optional credited-player context comes from the base pack event frame. Never retain the frame across ticks.

The opt-in `before_game_start` example blocks the request when `#block_start` is enabled and demonstrates single-owner deferral when `#defer_start` is enabled. The base pack owns request-local state, denial, token validation, and normal game start. The template copies the accepted token and generation from `game_start_deferred`, then resumes once through `zbk:game/start/resume`. Its `before_game_reset` listener cancels pending work. A request listener must do no payment, movement, or other side effect before the final decision.

The sample marker is persistent configuration; the block display is disposable runtime state. `initialize` removes old displays and rebuilds them from markers. The `game_reset` example demonstrates cleanup and reconstruction.

Public calls such as `zbk:map_elements/power/management/on`, `zbk:map_elements/door/management/unlock_zone {zone:1}`, and `zbk:game/reset/request` are shown as user-invoked dialog actions. Reset, start, and end calls are rejected during synchronous event dispatch; power and zone calls may dispatch nested notifications. The pack calls the owning core functions directly.

## Adapting the template

1. Rename the pack folder, `zbk_template` namespace, registration ID, storage IDs, scoreboard objectives, tags, marker IDs, dialog IDs, and documentation to your own stable namespace.
2. Keep the shared `zbk` namespace for core functions and `#zbk:event/*` tag paths. Change only the listener value that points to your function.
3. Set a new `VERSION` and matching `zbk.version` metadata when releasing a compatible pack. Keep the base pack compatibility revision in registration aligned with the contract you support.
4. Add map features behind your provider's active flag, and reconstruct disposable entities from persistent markers during `initialize`.
5. Add a resource pack only for assets your map owns. Install it above the base ZBK resource pack; the template itself needs no custom assets.

## Packaging and verification

Package this folder as `zbk_template.zip`, with `pack.mcmeta` at the archive root. Parse all functions with Mecha, parse JSON, check function and dialog references, and run `git diff --check`. In an isolated world, verify the base pack alone, the base pack plus template, and template without the base pack. Installing the reference pack alone must not block a start, charge points, grant items, or alter ordinary gameplay.

## License and credit

Use, modification, and redistribution follow [the project license](LICENSES/LICENSE.md), [the media permission](LICENSES/MEDIA_PERMISSION.md), and the included [notice](LICENSES/NOTICE). Required third-party terms are in [LICENSES](LICENSES/).
