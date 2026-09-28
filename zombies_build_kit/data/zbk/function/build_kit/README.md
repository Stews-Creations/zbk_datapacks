# Build Kit Module

The Build Kit module owns the in-game tools for placing, inspecting, configuring, and removing reusable Zombies Build Kit map elements. Feature-specific editors live under `management/<feature>/`; runtime behavior stays with the owning gameplay module.

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
dialog open @s zbk:build_kit
```

The Build Manager dispatches persistent markers to their owning module's configuration or deletion flow. Build-only visualization runs for players using the tool. Persistent marker data remains the source of truth; owning modules reconstruct their runtime entities during initialization.

## Buildables and equipment

Build Kit > Buildables provides Crafting Bench and Rocket Shield controls. Shield part eggs place candidate markers; the Build Manager opens their deletion dialogs. The Crafting Bench module owns oriented bench placement and hold-to-build progress. Combat owns giving, refilling, and removing the shield; the Rocket Shield placed-system module owns part placement and shared collection state.

Player Tools > Weapons provides the conventional weapon categories and the Ray Gun. Conventional weapons use the combat weapon-slot assignment flow. Bows and map-specific weapon pages are not part of this core interface. Wall-buy weapon selection is separate: it updates the selected marker and does not give the weapon to the builder. Bowie Knife remains an available wall-buy option.

## Map-element configuration

The Build Kit dialogs expose reusable doors, barriers, traps, jump pads, mystery-box locations, perks, spawn points, signals, power, teleporters, radios, wall guns, and other core markers. Map-specific Pack-a-Punch set pieces, tram controls, and quest editors are excluded. The Pack-a-Punch editor places and deletes the ordinary machine; weapon packing and elemental effects remain available from Player Tools.

Game Management provides both the shared Spawn Menu and Spawn Menu Egg (New). The legacy menu supports Start Game, Build Kit, and its reusable Menu Music toggle; the newer menu is documented in [`map_elements/spawn_menu_v2/`](../map_elements/spawn_menu_v2/README.md). Neither menu offers map or sound-pack selection.

The zone highlighter uses `management/zones/` and marker `zones` configuration to show spawner and door zones. The marker legend is dispatched by `markers/show_nearby` and `markers/display_nearby`; each call draws for its current viewer without caching a viewer list across ticks.

## Help book

Operators can give the current player the Build Kit help book with:

```mcfunction
function zbk:build_kit/management/give_zbk_book
```

Book delivery is explicit and is not part of load or reload.

## Add-on integration

The Map Tools entry dispatches `map_tools_open` as the selecting player. The active map provider supplies its own dialog. Reusable Panzer spawner placement and timing controls belong to Core. See the [Core API contract](../../../../../README.md#core-api-100).
