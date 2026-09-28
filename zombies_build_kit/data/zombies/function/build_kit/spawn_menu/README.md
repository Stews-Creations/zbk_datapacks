# Legacy Spawn Menu

This is the deprecated spawn-menu implementation retained so existing maps, markers, advancements, and function paths continue to work.

It provides separate Start Game and Start (No Cutscene) actions, a Build Kit action, and a Menu Music toggle. New maps should place `Spawn Menu Egg (New)` from the Game Management dialog and use the runtime owned by [`map_elements/spawn_menu_v2/`](../../map_elements/spawn_menu_v2/).

Existing `spawn_menu_marker` markers are not migrated, deleted, or rebuilt as v2 menus during reload. Explicitly placing either menu version replaces the other because only one lobby menu is supported.
