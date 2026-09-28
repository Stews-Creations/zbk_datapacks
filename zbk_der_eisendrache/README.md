# Der Eisendrache

An independently installable ZBK Core add-on that restores the implemented Der Eisendrache runtime: rocket and intro sequence, rocket tests, anti-gravity movement, trams and rewards, fuse drop, map Pack-a-Punch, Core-owned Panzer enemy, spawner and round schedule with Der Eisendrache quest reactions, dragon heads, bows and quests, fire ring, wolf paintings, disco, and the quest inventory board.

Requires ZBK Core API 1.0.0 and the matching Der Eisendrache resource pack. Install this datapack beside Core and the map resource pack. The installed pack registers the `zbk_der_eisendrache` map provider through Core API 1.0.0. Core owns provider selection and generic sound requests; this add-on supplies Der Eisendrache-specific cue and character-voice handlers, with no numeric map or soundtrack setup command. Runtime remains inactive when Core is missing or incompatible, or when another map provider is selected.

Persistent Build Kit markers configure trams, rocket-test doors, quest placements, and other placed systems. Runtime displays and interactions are reconstructed from those markers after Core reports readiness and after game resets. Public placement, management, and diagnostic functions are documented in the owning feature folders.

The function namespace root contains only `on_load`, `initialize`, `on_tick`, and `enable_triggers` lifecycle hooks. `function/events/` contains Core event handlers and the Minecraft load bootstrap; `function/quest/maintenance` reconciles quest presentation during the shared maintenance event.

The intro waits for rocket model readiness before it claims a game start. Round 1 starts tram delays and the configured Fuse drop. The original, electric, fire, wolf, and void bow branches are retained at their implemented maturity; incomplete quest stages remain incomplete and are not synthesized by this pack.

The sound module routes Core sound events to DE audio, assigns character voice slots after game start, and advances voice cooldowns with the active map tick. Ambient music is scheduled by the Core maintenance hook and is stopped on reset or game end. The resource pack supplies map audio, models, textures, fonts, intro frames, and bow transforms. Enable the optional DE Vivecraft overlay with the shared resource pack when using Vivecraft. The pack's generated model runtime is included; Blockbench authoring files are not.

See the repository datapack guide for packaging and validation. Retain the repository license and third-party notices when redistributing.
