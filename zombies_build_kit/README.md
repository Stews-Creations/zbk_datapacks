# Zombies Build Kit datapack

Reusable gameplay and authoring systems for Minecraft Java 26.2. Package this source as `zombies_build_kit.zip` with `python tools/package_pack.py` from the repository root, then install it with its matching resource pack and shared structure templates. See the [repository guide](../README.md) for installation and validation.

## Namespaces and entry points

| Namespace | Responsibility |
| --- | --- |
| `zombies` | Core implementation, persistent markers, dialogs, and operator commands |
| `zbk` | Public API, event tags, provider registration, and request context |
| `minecraft` | Load/tick tags and shared enemy loot overrides |
| `animated_java` | Generated crawler and Panzer model runtime |
| `mystery_box` | Generated Mystery Box animations |

Minecraft's load and tick tags call `zombies:load` and `zombies:tick`, with generated model hooks alongside them. Load defines shared objectives before consumers, resets runtime gameplay, reconstructs placed systems, and starts the shared 20-tick (1 second) maintenance schedule. Tick calls module hooks and then one shared player loop.

## Core boundaries

Reusable placed systems remain under `data/zombies/function/map_elements/`. There is no `maps/` runtime, active map ID, or sound-pack picker. Core audio uses fixed shared events and vanilla fallbacks; no map soundtrack or character voice bank is required. Installed folder names do not change namespaced commands. Optional map packs subscribe to the [event API](../docs/API.md); Core never calls their namespaces. Registration runs one tick after load, and only one compatible provider may become active. Add-ons must use `zbk:api/*` rather than private Core function calls.

Persistent markers and their settings define placed features. Their owning modules recreate runtime models, displays, and interactions during initialization. See the [function architecture](data/zombies/function/README.md) and the nearest module README for public commands and marker contracts.

## Generated content

Keep gameplay in the owning `zombies` module, not generated model/keyframe functions. The generated crawler, Panzer, and Mystery Box runtime is included; authoring projects are not. See [Mystery Box ownership](data/mystery_box/README.md) before replacing its generated output.

## Licensing

Retain [LICENSE.md](LICENSE.md), [NOTICE](NOTICE), [LICENSES](LICENSES/), and [MEDIA_PERMISSION.md](MEDIA_PERMISSION.md) when redistributing this pack or a world containing it. Third-party material retains its own terms.
