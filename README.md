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

1. Run `python tools/package_pack.py --pack all` from this repository and copy `output/zombies_build_kit.zip` into `<WORLD>/datapacks/`. The archive places `pack.mcmeta` at its root and excludes development documentation from Minecraft resource directories.
2. Enable the matching `zombies_build_kit` resource pack from [zbk_resourcepacks](https://github.com/Stews-Creations/zbk_resourcepacks). Install [zbk_structures](https://github.com/Stews-Creations/zbk_structures) into the world's generated structure directory for Build Kit placement and runtime templates.
3. Run `/reload`, confirm the pack with `/datapack list`, then use `/function zombies:build_kit/management/give_zbk_book` to open the Build Kit workflow.

For a map, also copy its matching datapack ZIP from `output/` into the world, and enable its matching resource pack above Core. Installing a map datapack does not supply a finished world or create its required map geometry and configured markers.

The optional Vivecraft resource overlay and VR companion mod are client additions. The core runs without them. This pack supplies systems for a world you build; it does not include a finished playable map.

## Runtime and development

The installed datapack folder is `zombies_build_kit`; command identifiers retain the `zombies:` namespace. See the [pack guide](zombies_build_kit/README.md) for entry points and [function architecture](zombies_build_kit/data/zombies/function/README.md) for module ownership.

Install Python development dependencies and validate from this repository:

```powershell
python -m pip install -r requirements-dev.txt
python tools/validate_core.py
python tools/validate_core.py --map zbk_nacht_der_untoten
python tools/validate_core.py --map zbk_der_eisendrache
python tools/validate_core.py --map zbk_template
python tools/repair_mystery_box_after_export.py --check
git diff --check
```

The validator parses functions with Mecha, supplements gamerules and stopwatch commands with the official Minecraft 26.2 command report, checks JSON and static function/dialog references, rejects map-selection dependencies, and checks README links. Macro-generated paths and gameplay require isolated Minecraft 26.2 tests. Verify a fresh world, placement, start/reset/reload, combat, purchases, and multiplayer before publishing a playable map.

## License and credit


Free noncommercial use, modification, and sharing are allowed with credit to
[MiniStew](https://www.youtube.com/@MiniStew). Monetized videos and streams are
allowed under the [media permission](MEDIA_PERMISSION.md). Selling covered ZBK
content or maps containing it, or charging for server access, is not covered
by that permission. See [licensing and attribution](LICENSE.md) for the code
and asset licenses, their scope, and redistribution requirements.
