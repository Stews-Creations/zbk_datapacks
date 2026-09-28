# Zombies Build Kit datapack

The shared ZBK gameplay and map-building core for Minecraft Java 26.2. Its models, sounds, and interface use the matching ZBK resource pack; placed systems use the shared ZBK structures.

## What it adds

- Match and round progression, enemies, weapons, purchases, powerups, player state, and shared audio.
- The Build Kit for placing and configuring reusable map elements such as doors, barriers, perks, teleporters, traps, and spawn points.
- Persistent markers and initialization that rebuild runtime entities after load and reset.
- The public `zbk:api/*` functions and `#zbk:event/*` hooks used by map add-ons. See the [Core API contract](../README.md#core-api-100).

Map-specific quests, locations, and presentation belong to their map packs.
