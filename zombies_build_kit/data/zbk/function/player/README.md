# Player Module

Owns player identity, setup, health, down and revive state, points, inventory enforcement, HUD composition, statistics, and weapon-slot input.

## Responsibilities

| Area | Responsibility |
| --- | --- |
| `setup/` | Player defaults, identity, triggers, and scoreboard presentation |
| `down_system/`, `health/` | Downing, revival, damage, and health display |
| `inventory/`, `swap_weapon/` | Canonical item reconstruction and slot input |
| `actionbar/`, `xpbar/` | HUD rendering and presentation state |
| `points/`, `stats/` | Score awards and combat records |
| `settings/` | Per-player display preferences |
| `voice/` | Shared character assignment and callout cooldowns |
| `events/` and feature-local `events/` | Player lifecycle and operation notifications |

Points, health, and down/revive features own their cues and voice callouts under their own `audio/` folders. Other gameplay callouts live with the module that triggers them; all use the [shared character voice state](voice/README.md).

## Lifecycle and ownership

`setup/setup_player` is safe for one player at a time. It runs on first join, return after reload, game reset, and manual recovery without resetting other players or module-global state. The `dp_version` objective detects players who were offline during `/reload`.

Combat owns weapon state, ammunition, reload timing, and damage. Player reconstructs canonical inventory items from that state and handles player setup, slot presentation, points, and HUD rendering. See the [Combat module](../combat/README.md).

## Inventory

Native hotbar selection drives weapon cycling and the Adventure-mode HUD highlight. Knife and tactical items are reconstructed from owned scores in keys 4 and 5. Cleanup removes moved or duplicate copies across inventory slots before reconstruction. Gun displays remain in the offhand; Combat restores an owned Rocket Shield and its durability and charges.

## HUD

The actionbar HUD layers ammunition, grenades, equipment, timed powerups, perks, and the current round. It reads Combat's ammunition and reload state; points remain in the native sidebar. The [resource pack](https://github.com/Stews-Creations/zbk_resourcepacks) supplies the custom fonts and HUD artwork.

Perks appear in acquisition order from the center outward for either gun hand: left-to-right when the gun is left, and right-to-left when the gun is right.

The round counter animates on every round change instead of a screen title. The previous round pulses bright red and fades out, then the new round fades in, holds bright, and settles over four seconds. Rounds 1-5 draw their tally marks in one at a time. Dog rounds use a deeper blood red and keep the counter dimmed until the round ends. Waves owns the `wave.round_flash` timer; `actionbar/prepare/round/round_flash` maps it to the displayed round and color.

Reload progress appears beneath the ammunition display. It follows Combat's reload timer, flashes after a successful transfer, and clears when the reload is cancelled, the weapon changes, the gun is hidden, or the player leaves Adventure mode.

The Rocket Shield module owns collected-part state. Player renders its indicators in the configured HUD slots and restores moved or duplicated indicators through the shared maintenance hook.

## Hand presentation

Players choose Main Hand Left or Main Hand Right in Minecraft's client settings. The `gun_side` trigger configures matching HUD and muzzle-smoke placement: absent or `1` means gun left; `2` means gun right. It is a per-player presentation preference and persists across setup and game reset.

## Add-on integration

The base pack emits player down, revive, and respawn notifications after the corresponding state transition. Map listeners use the supplied executor and actor ID; shared player lifecycle remains owned here. See the [base pack integration contract](../../../../../README.md#base-pack-integration).

## Feature subfolders

`down_system/lifecycle/` owns down/death/revive transitions and reset; `revive/`, `decoys/`, `effects/`, and `bossbar/` hold their specific responsibilities. `inventory/melee/` reconstructs melee items, and `inventory/cleanup/` clears ground items. HUD preparation separates `actionbar/prepare/ammo/` and `actionbar/prepare/round/`; statistics snapshot helpers live in `stats/capture/`.
