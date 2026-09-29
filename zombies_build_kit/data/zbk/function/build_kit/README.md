# Build Kit Module

The Build Kit module owns shared authoring tools, trigger routing, marker legends, zone highlighting, and help. Feature-specific editors and Build Manager handlers live under `build_kit/` inside their owning gameplay module.

## Lifecycle and entry points

| Hook or interface | Responsibility |
| --- | --- |
| `on_load` | Create Build Kit objectives and reset transient editor state |
| `initialize` | Reset per-player editor state and enable the Build Manager |
| `on_tick` | Process Build Kit triggers and zone highlights |
| `on_tick_as_player` | Show nearby marker legends while the player holds the Build Manager |
| `enable_triggers` | Re-enable Build Kit controls for the current player |

Open the authoring interface with:

```mcfunction
dialog show @s zbk:build_kit
```

The Build Manager dispatches persistent markers to their owning module's configuration or deletion flow. Build-only visualization runs for players using the tool. Persistent marker data remains the source of truth; owning modules reconstruct their runtime entities during initialization.

## Dialog organization

Dialog resources live in [`data/zbk/dialog/`](../../dialog/). The root contains the main menus: `zombies`, `build_kit`, `player_tools`, and `quick_actions`.

- `build_kit/` contains map-authoring dialogs: building settings, buildables, cutscene editors, map elements, and game setup.
- `build_kit/map_elements/` groups placement and marker dialogs by feature, including doors, barriers, perks, radios, and wall guns. `build_kit/game_management/` contains spawn-point and round controls.
- `player_tools/` contains player controls and weapon categories.
- `navigation/` contains the shared return dialog.

Dialog IDs match their paths beneath that directory, without `.json`; for example, `zbk:build_kit/map_elements/doors/purchasable_doors` and `zbk:player_tools/weapons/assault_rifles`. Use these IDs in dialog actions and `dialog show` commands. Wall-gun weapon pages live under `build_kit/map_elements/wall_gun/weapons/`, separate from the player weapon pages.

## Buildables and equipment

Build Kit > Buildables provides Crafting Bench and Rocket Shield controls. Shield part eggs place candidate markers; the Build Manager opens their deletion dialogs. The Crafting Bench module owns oriented bench placement and hold-to-build progress. Combat owns giving, refilling, and removing the shield; the Rocket Shield placed-system module owns part placement and shared collection state.

Player Tools > Weapons provides the conventional weapon categories and the Ray Gun. Conventional weapons use the combat weapon-slot assignment flow. Bows and map-specific weapon pages are not part of this core interface. Wall-buy weapon selection is separate: it updates the selected marker and does not give the weapon to the builder. Bowie Knife remains an available wall-buy option.

## Map-element configuration

The Build Kit dialogs expose reusable doors, barriers, traps, jump pads, mystery-box locations, perks, spawn points, signals, power, teleporters, radios, wall guns, and other core markers. Map-specific Pack-a-Punch set pieces, tram controls, and quest editors are excluded. The Pack-a-Punch editor places and deletes the ordinary machine; weapon packing and elemental effects remain available from Player Tools.

Game Management provides the current Spawn Menu Egg, documented in [Spawn Menu V2](../map_elements/spawn_menu_v2/README.md). The deprecated menu has no placement, tick, raycast, or advancement hooks. The current menu removes loaded retired menu entities on initialization and placement.

Build Manager routes directly to feature handlers such as `map_elements/door/build_kit/purchasable/dispatch`. Each preserves its target-selection and cleanup order before opening its dialog. The shared tool retains input and cooldown state.

The zone highlighter uses `zones/` and marker `zones` configuration to show spawner and door zones. The marker legend is dispatched by `markers/show_nearby` and `markers/display_nearby`; each call draws for its current viewer without caching a viewer list across ticks.

## Help book

Operators can give the current player the Build Kit help book with:

```mcfunction
function zbk:build_kit/help/give_book
```

Book delivery is explicit and is not part of load or reload.

## Add-on integration

The Map Tools entry dispatches `map_tools_open` as the selecting player. The active map provider supplies its own dialog. Reusable Panzer spawner placement and timing controls belong to the base pack. See the [base pack integration contract](../../../../../README.md#base-pack-integration).

## Responsibility folders

| Folder | Responsibility |
| --- | --- |
| `tools/build_manager/` | Item delivery, input lock, pending target, cleanup, and routing |
| `tools/mob_immunity/` | Shared mob-immunity editing tool |
| `triggers/` | Player trigger routing and shared buildable actions |
| `settings/` | Builder preferences |
| `markers/`, `zones/` | Marker legends and zone highlights |
| `help/` | Help book delivery |
| `events/` | Shared builder notifications |
