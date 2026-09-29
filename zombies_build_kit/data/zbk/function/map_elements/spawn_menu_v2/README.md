# Spawn Menu V2

Owns the reusable player-facing lobby menu. It provides Start Game, persistent Cutscene and Music toggles, and a Help Book action.

## Runtime layout

Players select options by right-clicking or shooting them. The menu title is `ZOMBIES`; `Spawn Menu V2` is the internal Build Kit name. The menu marker is persistent configuration, while text displays and interactions are rebuilt runtime entities.

The `spawn_menu_v2_cutscene` score stores `1` when opening cutscenes are enabled and `0` when disabled. Start Game uses that setting to play configured cutscene markers or begin the game directly.

## Lifecycle and Build Kit

`on_load` creates objectives and calls `initialize`. Initialization rebuilds menu runtime entities from the marker without changing its setting. The shared tick handles placement and lobby interactions. Deleting the marker removes all derived entities.

Use the Game Management dialog to place `Spawn Menu Egg`. Build Manager opens the deletion dialog through `build_kit/dispatch`. Editor functions live under `build_kit/`; music playback and its request events live under `audio/` and `events/`.

## Retired menu cleanup

The deprecated lobby menu has no placement, tick, raycast, or advancement handlers. `migration/remove_legacy` removes its loaded entities and marker when this menu initializes or is placed. On an upgraded world, load the old lobby area and reload before placing the current menu. Current menu markers and settings survive initialization.
