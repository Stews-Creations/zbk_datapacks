# Wall Gun Module

Provides reusable, marker-driven wall purchases for guns, equipment, ammunition, and the Bowie Knife melee upgrade.

## Marker Contract

Each persistent marker tagged `wall_gun` stores `data.gun_id`, `data.price`, `data.ammo_price`, and `data.pap_ammo_price`. Its directional tag (`wall_gun_north`, `wall_gun_south`, `wall_gun_east`, or `wall_gun_west`) controls display placement. Runtime item displays, text displays, and interaction entities are derived from these markers and are rebuilt by `initialize`.

Map builders place a marker with the Wall Gun spawn egg, then use the Build Stick to configure it. Choose Weapon opens category pages for Pistols, SMGs, Assault Rifles, LMGs, Shotguns, Sniper Rifles, Launchers, Wonder Weapons, and Equipment & Melee. Each page has named item buttons; selecting one applies its internal ID to the nearest wall marker within 5 blocks, rebuilds displays, and returns to configuration showing the selected item name. The numeric ID list and ID slider are not shown. Purchase, regular ammo, and Pack-a-Punch ammo prices have separate controls. Pack-a-Punch ammo defaults to 4,500 points and can be set from 0 to 10,000 points in 50-point steps. Selecting another weapon preserves this setting. The public placement trigger is `give_wall_gun_egg`.

Supported wall-item IDs are `20` through `46` for the [BO3 roster](../../combat/weapons/guns/bo3/README.md), `7` for Ray Gun, and `13` through `16` for equipment and the Bowie Knife.

## Ammo prices and public labels

A refill uses the regular ammo price for an unpacked gun and the Pack-a-Punch ammo price for tier 1 or higher. The tier comes from the owned slot matching that wall weapon, including Mule Kick slot 3; holding a different gun does not change the charge. Insufficient points prevent both payment and refill. A successful refill restores the matching slot to its registered magazine and reserve capacities.

Gun wall labels show the weapon name, purchase price, regular ammo price, and PaP ammo price to all players, without requiring the debug tag. Each label snapshots its own marker prices when rebuilt. Grenades, Monkey Bombs, and Trip Mines use only the regular ammo price and do not show a PaP line; Bowie Knife has no ammo price line.

Existing markers without `data.pap_ammo_price` receive the 4,500-point default when initialized, configured, or used. Newly loaded older markers are reconciled every 20 ticks (1 second) through the shared maintenance hook and then schedule display reconstruction for the following tick. Initialization, configuration, and purchases still validate immediately. Existing purchase and regular ammo prices remain unchanged, and configured PaP prices persist through reconstruction. Price-default maintenance lives under `marker/`; Build Kit applies the setting through `function zombies:build_kit/management/wall_gun/apply_pap_ammo_price {pap_ammo_price:4500}`.

## Bowie Knife

Gun ID `16` selects the Bowie Knife. Selecting that ID sets the marker purchase price to the canonical `3,000`-point default; builders may change the price afterward. The normal wall-gun display and interaction are reused, and no ammo-refill price is shown or sold.

On purchase, the Bowie Knife replaces the player's starter knife in hotbar slot 4 (default key 4) and sets the player's `bowie_knife` ownership score. Its melee damage uses the canonical round-scaled starter-knife damage plus a permanent 9-damage bonus. Ownership and the item survive the normal down-and-revive flow. Bleeding out or starting a fresh game setup resets ownership, after which the starter knife is restored.

## Lifecycle

- `on_load` creates wall-gun objectives and initializes runtime entities.
- `initialize` removes derived wall-gun entities and recreates them from persistent markers.
- `on_tick` detects newly placed marker bats.
- `marker/maintenance`, called by `global/tick_1s`, selects loaded wall markers once per 20 ticks (1 second) and checks their saved ID and price configuration. It replaces the repeated per-ID searches formerly performed every tick.
- `enable_triggers` enables the Wall Gun spawn-egg trigger for a player.

Gameplay purchase behavior lives under `gameplay/`, display creation under `display/`, Wall Gun-specific name routing under `lookup/`, and marker creation under `spawning/`. Build Kit configuration is owned by `build_kit/management/wall_gun/`. The Wall Gun lookup handles ID `16` locally and delegates only other IDs to the conventional weapon-name lookup, keeping the Bowie Knife entirely outside Mystery Box configuration and selection.

All wall-gun chat messages require the recipient to have the `debug` tag, including purchases, ammo refills, insufficient-points notices, already-owned notices, and Build Kit configuration messages. Existing diagnostic level filters still apply where configured.

Retired IDs 1-6 and 8-10 migrate to their BO3 replacements before display reconstruction or purchase. Migration preserves marker prices and direction. Newly loaded chunks with old markers trigger reconstruction. New placements default to MR6 (20). All BO3 guns support weapon purchases and ammunition refills; packed slots refill their registered PaP magazine and reserve capacities. Invalid IDs are rejected before payment.

## Rendering budget

Wall item displays use `view_range:0.1875f`, nominally 12 blocks at 100% Entity
Distance. Wall labels use `view_range:0.125f`, nominally 8 blocks. Client entity
distance and tracking also affect visibility; at 50% the nominal ranges halve.
These settings apply to all supported wall items and all four facings. Purchase
hitboxes, prices, and marker configuration are unchanged. Run
`function zombies:map_elements/wall_gun/initialize` to rebuild loaded walls with
these settings, or use `/reload` outside an active game.

BO3 wall weapons use generated `zombies:wall/bo3/` model variants. They preserve
textures, transforms, and exterior detail while removing faces completely hidden
by opaque, unrotated cuboids. Rotated pieces are retained conservatively. Held
weapons continue to use their existing models. Generated model authoring sources are maintained outside this repository. Install the matching resource
pack and press F3+T before rebuilding the wall displays.
