# Spawn Menu V2

Owns the reusable player-facing lobby menu. It provides Start Game, a persistent Cutscene toggle, and a Help Book action.

## Runtime layout

Players select options by right-clicking or shooting them. The menu title is `ZOMBIES`; `Spawn Menu V2` is the internal Build Kit name. The menu marker is persistent configuration, while text displays and interactions are rebuilt runtime entities.

The `spawn_menu_v2_cutscene` score stores `1` when opening cutscenes are enabled and `0` when disabled. Start Game uses that setting to play configured cutscene markers or begin the game directly.

## Lifecycle and Build Kit

`on_load` creates objectives and calls `initialize`. Initialization rebuilds menu runtime entities from the marker without changing its setting. The shared tick handles placement and lobby interactions. Deleting the marker removes all derived entities.

Use the Game Management dialog to place `Spawn Menu Egg (New)`. Build Manager opens the marker dialog for deletion. Functions under `build_kit/management/spawn_menu_v2/` call this runtime module.
