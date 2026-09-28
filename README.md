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

Install Core with at most one map provider. The template is itself a provider: use it in a development world rather than alongside Nacht or DE. See the [API contract](docs/API.md) for registration, events, and request gates.

## Install

1. Archive the contents of `zombies_build_kit/` with `pack.mcmeta` at the ZIP root, excluding development documentation from Minecraft resource directories. Copy the ZIP into `<WORLD>/datapacks/`.
2. Enable the matching `zombies_build_kit` resource pack from [zbk_resourcepacks](https://github.com/Stews-Creations/zbk_resourcepacks). Install [zbk_structures](https://github.com/Stews-Creations/zbk_structures) into the world's generated structure directory for Build Kit placement and runtime templates.
3. Run `/reload`, confirm the pack with `/datapack list`, then use `/function zbk:build_kit/management/give_zbk_book` to open the Build Kit workflow.

For a map, archive its matching pack directory the same way, copy its ZIP into the world, and enable its matching resource pack above Core. Installing a map datapack does not supply a finished world or create its required map geometry and configured markers.

The optional Vivecraft resource overlay and VR companion mod are client additions. The core runs without them. This pack supplies systems for a world you build; it does not include a finished playable map.

## Runtime and development

The installed datapack folder is `zombies_build_kit`; command identifiers retain the `zbk:` namespace. See the [pack guide](zombies_build_kit/README.md) for entry points and [function architecture](zombies_build_kit/data/zbk/function/README.md) for module ownership.

Before publishing, parse functions with Mecha against Minecraft 26.2, parse JSON, check function and dialog references, and run `git diff --check`. Test Core alone and each map separately. Macro-generated paths and gameplay require isolated Minecraft 26.2 tests. Verify a fresh world, placement, start/reset/reload, combat, purchases, and multiplayer before publishing a playable map.

## License and credit


Free noncommercial use, modification, and sharing are allowed with credit to
[MiniStew](https://www.youtube.com/@MiniStew). Monetized videos and streams are
allowed under the [media permission](MEDIA_PERMISSION.md). Selling covered ZBK
content or maps containing it, or charging for server access, is not covered
by that permission. See [licensing and attribution](LICENSE.md) for the code
and asset licenses, their scope, and redistribution requirements.
