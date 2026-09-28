# Zombies Build Kit datapack

Reusable gameplay and authoring systems for Minecraft Java 26.2. Archive this pack's contents as `zombies_build_kit.zip` with `pack.mcmeta` at the ZIP root, then install it with its matching resource pack and shared structure templates. See the [repository guide](../README.md) for installation and validation.

## Namespaces and entry points

| Namespace | Responsibility |
| --- | --- |
| `zbk` | Core implementation, persistent markers, dialogs, operator commands, public API, event tags, and provider registration |
| `minecraft` | Load/tick tags and shared enemy loot overrides |
| `animated_java` | Generated crawler and Panzer model runtime |
| `mystery_box` | Generated Mystery Box animations |

Minecraft's load and tick tags call `zbk:load` and `zbk:tick`, with generated model hooks alongside them. Load defines shared objectives before consumers, resets runtime gameplay, reconstructs placed systems, and starts the shared 20-tick (1 second) maintenance schedule. Tick calls module hooks and then one shared player loop.

The matching Core resource pack uses `assets/zbk/`. Datapack commands and components refer to its item models, fonts, and sound events with `zbk:` IDs. Core gameplay functions, dialogs, storage, and other datapack identifiers also use `zbk:`.

## Core boundaries

Reusable placed systems remain under `data/zbk/function/map_elements/`. There is no `maps/` runtime, active map ID, or sound-pack picker. Core audio includes shared rounds, dogs, teleporters, game cues, menu music, and four-character voice callouts. Map sound requests can replace those defaults. Installed folder names do not change namespaced commands. Optional map packs subscribe to the [event API](../README.md#core-api-100); Core never calls their namespaces. Registration runs one tick after load, and only one compatible provider may become active. Add-ons must use `zbk:api/*` rather than private Core function calls.

Persistent markers and their settings define placed features. Their owning modules recreate runtime models, displays, and interactions during initialization. See the [function architecture](data/zbk/function/README.md) and the nearest module README for public commands and marker contracts.

## Generated content

Keep gameplay in the owning `zbk` module, not generated model/keyframe functions. The generated crawler, Panzer, and Mystery Box runtime is included; authoring projects are not. See [Mystery Box ownership](data/mystery_box/README.md) before replacing its generated output.

## Licensing

Retain [LICENSES](LICENSES/) (license, notice, and media permission) when redistributing this pack or a world containing it. Third-party material retains its own terms.
