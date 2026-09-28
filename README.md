# ZBK Datapacks

The `zombies_build_kit` datapack supplies shared Zombies Build Kit gameplay and map-building tools for Minecraft Java 26.2. It contains no built-in map selection, map quests, or sound-pack selection.

## Packs

All packs start at version `1.0.0` and target Minecraft Java 26.2.

| Pack | Purpose |
| --- | --- |
| `zombies_build_kit` | Required Core systems and public event API |
| `zbk_nacht_der_untoten` | Nacht map behavior and authoring tools |
| `zbk_der_eisendrache` | Der Eisendrache map behavior and authoring tools |
| `zbk_template` | Developer reference and starting point for a custom map |

Install Core with at most one map provider. The template is itself a provider: use it in a development world rather than alongside Nacht or DE.

## Extend Core with events

Core runs without a map pack. An add-on can listen to `#zbk:event/*` function tags to react to shared gameplay. For example, add `data/zbk/tags/function/event/round_start.json` to the add-on:

```json
{
  "replace": false,
  "values": ["my_map:events/round_start"]
}
```

Core supplies the event tags, so listeners append with `replace: false`. A map provider registers through `#zbk:event/register` by calling `function zbk:api/map/register {id:"my_map",version:10000}`. During `core_ready`, the provider checks `storage zbk:registry active` before enabling its own runtime. API version `10000` corresponds to Core API 1.0.0. Other event listeners can coexist without registering as a map provider.

| Event | Typical use |
| --- | --- |
| `core_ready`, `game_reset` | Initialize or rebuild map runtime from persistent markers |
| `game_start`, `round_start`, `round_end`, `game_end` | React to match and round transitions |
| `enemy_spawned`, `enemy_killed`, `player_down`, `player_revived` | React to combat and player state |
| `power_on`, `zone_unlocked` | React to shared world state |
| `before_game_start`, `before_jump_pad_purchase`, `before_manual_reload` | Block a request before Core commits it |

Callbacks run synchronously. Read `storage zbk:events stack[-1].context` during the callback for the current event, actor, round, or event-specific fields; a nested event restores the outer context afterward. Do not retain the event frame for a scheduled function. Request listeners can call `zbk:api/request/block`; notifications cannot veto an action. Use public `zbk:api/*` functions for shared state changes, such as power activation or game reset, and keep other Core functions private. Game start, end, reset, and resume calls cannot run during event dispatch.

See the [API contract](docs/API.md) for every event, context field, request response, and public function. The [map template](zbk_template/README.md) contains working registration, listener, reset, and deferred-start examples.

## Install

1. Archive the contents of `zombies_build_kit/` with `pack.mcmeta` at the ZIP root, excluding development documentation from Minecraft resource directories. Copy the ZIP into `<WORLD>/datapacks/`.
2. Enable the matching `zombies_build_kit` resource pack from [zbk_resourcepacks](https://github.com/Stews-Creations/zbk_resourcepacks). Install [zbk_structures](https://github.com/Stews-Creations/zbk_structures) into the world's generated structure directory for Build Kit placement and runtime templates.
3. Run `/reload`, confirm the pack with `/datapack list`, then use `/function zbk:build_kit/management/give_zbk_book` to open the Build Kit workflow.

For a map, archive its matching pack directory the same way, copy its ZIP into the world, and enable its matching resource pack above Core. Installing a map datapack does not supply a finished world or create its required map geometry and configured markers.

The optional Vivecraft resource overlay and VR companion mod are client additions. The core runs without them. This pack supplies systems for a world you build; it does not include a finished playable map.

## Runtime and development

The installed datapack folder is `zombies_build_kit`; Core gameplay functions and dialogs use the `zbk:` namespace. See the [pack guide](zombies_build_kit/README.md) for entry points and [function architecture](zombies_build_kit/data/zbk/function/README.md) for module ownership.

Before publishing, parse functions with Mecha against Minecraft 26.2, parse JSON, check function and dialog references, and run `git diff --check`. Test Core alone and each map separately. Macro-generated paths and gameplay require isolated Minecraft 26.2 tests. Verify a fresh world, placement, start/reset/reload, combat, purchases, and multiplayer before publishing a playable map.

## License and credit


Free noncommercial use, modification, and sharing are allowed with credit to
[MiniStew](https://www.youtube.com/@MiniStew). Monetized videos and streams are
allowed under the [media permission](MEDIA_PERMISSION.md). Selling covered ZBK
content or maps containing it, or charging for server access, is not covered
by that permission. See [licensing and attribution](LICENSE.md) for the code
and asset licenses, their scope, and redistribution requirements.
