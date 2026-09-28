# Electric bow ritual box

Map 2-only final weapon exchange in the overworld, after the [reforged arrow pickup](../reforging/README.md) completes the four-segment quest circle. One persistent marker drives the interaction, arrow, blue soul orbs, light beam and upgraded bow reward at a manually placed box. This module does not spawn, move or remove the box model, or change real blocks.

## Player flow

1. At electric progress 4, the bound quest owner interacts with `place arrow`. Soul collection starts and immediately triggers the standard Max Ammo powerup for all non-downed players, including magazine, reserve, grenade and owned special-equipment refills with the normal audio. It triggers once when the empty box enters soul collection; repeated interactions and presentation rebuilds do not grant another refill. A full lightning arrow appears with full-bright rendering and enchantment glint. It has no interaction while collecting souls.
2. Kill 15 gameplay zombies within 5 blocks of the ritual marker. The victim position determines range. Only kills credited to the current electric quest owner count, using the same weapon-independent attribution, exclusions and blue traveling orbs as the [soul pots](../soul_pots/README.md). Ordinary gun, bow, native melee and supported delayed damage all work. Combat points and kill statistics remain owned by combat.
3. At 15 souls, the arrow gains an outline and brighter cyan/electric particles, and `offer bow` becomes available. The owner must visibly hold the original bow (weapon ID 11) in their offhand with that same weapon selected. Hidden weapons, another held gun, a pending Pack-a-Punch purchase, downed players and spectators cannot deposit it.
4. The original bow temporarily leaves its weapon slot, its current charge is cancelled, and another owned weapon is selected if available. The arrow and interaction disappear. A cyan/white particle beam rises 8 blocks for 100 ticks (5 seconds).
5. The beam stops and the electric bow appears with `pick up electric bow`. Only the player who deposited the original bow can claim this reward, even if quest binding changes or they disconnect. There is no expiry timer.
6. Claim grants the existing working electric bow (weapon ID 12), fully loaded with its established firing behavior, sounds and storm attack. The box cannot grant a second reward. The HUD circle remains full throughout this exchange; no fifth segment is added.

Before deposit, partial charge follows the shared quest and survives binding changes and player departure. After deposit, the bow belongs to its depositor. Interactions resolve the exact clicker UUID and enforce a maximum reach of 6 blocks; proximity alone never accepts an interaction.

Successful original-bow deposit plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ritual_bow_place` once only to the depositing quest player. The resource pack uses a stereo Ogg Vorbis conversion of `place.flac`, so the cue stays with its listener. It plays when the bow is removed and the beam animation starts, not on initial arrow placement, rejected interactions, runtime reconstruction or reward pickup. Vanilla beacon and XP cues are disabled throughout the ritual box flow.

When the fifteenth soul fills the ritual box and its phase becomes charged, `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_reforged` plays once to every online player. Playback occurs at each listener's own position, with no distance, dimension or quest-ownership restriction. The resource pack uses a stereo Ogg Vorbis conversion of `zmb_arrow_reforged.flac`. This cue belongs to soul completion, not arrow pickup, bow deposit or reward claim; presentation reconstruction does not replay it. No vanilla charged-box chime plays.

At successful bow deposit, the start of the beam/effects phase also plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.bow_upgrade` once at the ritual marker for every player within 10 blocks. The resource pack uses a mono Ogg Vorbis conversion of `zmb_bow_upgrade.flac` for positional playback. It does not repeat during the animation or presentation reconstruction. The depositing player still receives the separate private placement cue.

Successful upgraded-bow collection plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.bow_pickup` once only to the player receiving the weapon, after the bow is assigned to a valid weapon slot. The stereo Ogg Vorbis cue is converted from `zmb_bow_pickup.flac` and stays with its listener. Rejected claims, including no free weapon slot, do not play it. No vanilla completion chime plays.

## Placement and test commands

Select Map 2, stand at the desired interaction base beside or inside your manually placed box, face its heading, and run:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/place
```

The marker snaps X/Z to the block center and retains feet height. No box display is created. The interaction is 1 block wide and 1 block tall, starting at the marker base. The arrow and its charging particles appear at +0.7 blocks, at scale 0.325 (half its original size), with a 45-degree pitch tilt and the marker's unchanged yaw heading. The reward bow appears at +0.9 blocks with scale 0.325 (half its original size). Repeating placement moves the single loaded interaction marker, preserving soul count and phase. An unloaded registered placement cannot be replaced. A pending exchange must be claimed before moving the marker.

Temporary shortcut for the executing player (`@s`), with Map 2 selected and a positive player ID in the overworld. Run from player chat; console callers must use `execute as <player> at @s run function` followed by the shortcut path. A direct console call does nothing:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/test_setup
```

This resets the box for testing, binds electric, completes the earlier milestones and reforged-arrow pickup, and displays the full HUD circle. It preserves placed markers, creates no missing placements, and leaves the box empty so activation and all 15 souls can be tested. It does not grant a bow. Obtain the base bow with:

```mcfunction
/function zbk_der_eisendrache:combat/weapons/guns/bow/give/main
```

Gameplay test zombie and optional soul-count chat:

```mcfunction
/summon minecraft:zombified_piglin ~ ~ ~ {Tags:["wave_enemy","wave_zombie"],PersistenceRequired:1b}
/tag @s add debug
```

Delete the loaded interaction marker and its quest runtime, or recover registration after manually deleting the marker:

```mcfunction
/function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/delete
/function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/unregister
```

Use `unregister` only after manual deletion, never for an unloaded chunk. Both commands cancel a pending exchange and arrange return of the original bow. They leave the completed quest circle, manually placed box and real blocks unchanged.

## Saved state and weapon safety

| State | Contract |
| --- | --- |
| `de_eb_marker` | Persistent box position and heading, source of truth for reconstruction |
| `#registered de_eb_state` | Singleton placement registration, including while unloaded |
| `#phase de_eb_state` | 0 empty, 1 collecting, 2 charged, 3 beam animation, 4 reward ready, 5 claimed |
| `#souls de_eb_souls` | Shared saved charge, capped at 15 and credited immediately on accepted kills |
| `#buyer de_eb_owner` | Depositor's stable player ID during phases 3 and 4 |
| `#clock de_eb_time` | Animation ticks; `#fx` in this objective throttles particles to every 4 ticks (0.2 seconds) |
| Player `de_eb_slot`, `de_eb_tier`, `de_eb_elem`, `de_eb_ammo` | Pending original-bow slot and refund snapshot; independent of Pack-a-Punch's pending state |
| `de_eb_runtime`, `de_eb_content` | Reconstructed phase-specific arrow, bow, label or interaction; content caches its phase in `de_eb_state` so stale loaded displays are removed |
| `de_eb_orb` | Cosmetic soul orb moving 0.3 blocks per tick (6 blocks per second), removed on arrival or after 100 ticks (5 seconds) |

A claim prefers the deposited weapon's original slot, then another empty available slot. Slot 3 requires Mule Kick. If every usable slot has been filled during the animation, the reward waits; no existing gun is overwritten. Claim uses the combat weapon's slot-give functions and inventory reconstruction, preserving its current weapon contract rather than creating a decorative item.

Cancelling/resetting an exchange returns the original bow with its saved tier, element and remaining ammo into an available slot. If the player is offline or has no free usable slot, the refund snapshot waits. The central map inventory event retries recovery after reconnect and outside Map 2. Normal gameplay death/loadout resets still control the rest of the inventory. Cleanup does not create extra weapon copies or reuse Pack-a-Punch's pending fields.

`#active de_eb_state` records whether the previous runtime tick was active. Runtime cleanup clears it, so inactive ticks avoid entity searches. The shared `maps/events/maintenance_1s` hook removes stale inactive presentation after chunk reload within 20 ticks (1 second). Active phase reconciliation, interactions and animations retain their every-tick timing.

## Ownership and lifecycle

| Entry point or folder | Responsibility |
| --- | --- |
| `on_load` | Create objectives before quest reset callers run |
| `initialize` | Rebuild presentation while retaining souls, phase, pending depositor and animation clock |
| `on_tick` | At progress 4, remove stale phase content, rebuild missing visuals, read interactions, animate beam and orbs; clear runtime once when leaving the stage |
| `spawning/`, `marker/`, `display/` | Map-guarded placement and runtime reconstruction |
| `interactions/`, `management/` | Eligibility, activation, transitions, explicit reset and placement deletion |
| `souls/`, `animations/`, `effects/` | Accepted soul collection and cosmetic presentation |
| `reward/` | Base-bow snapshot/removal, safe reward slot selection, claim and cancellation recovery |

The quest orchestrator owns lifecycle calls and [shared soul routing](../../../README.md). Its shared victim callback deduplicates custom lethal reports before dispatching to stage-specific collectors. Its native-loot reader resolves the real killer UUID before the dragon collector consumes the existing stone. This module never claims or consumes dragon loot itself.

Full electric quest reset, map deselection and the existing global reload reset flow clear this ritual and refund pending bows; placement remains. Presentation-only initialization, disconnects and chunk unloading retain progress. The beam clock pauses while the box marker is unloaded. The module uses existing models in `zbk_der_eisendrache`; it adds no Mystery Box or wall-buy entries.

## Validation

Use an isolated Minecraft 26.2 server with two connected players to verify stage and owner gates, actual custom gun points/kills, native kill UUIDs, cap and orb arrival, saved charge, visible-bow requirement, Pack-a-Punch exclusion, weapon removal, timed reward, owner changes, occupied-slot protection, alternate slots, Mule Kick, offline reservation, pending refunds, reconstruction and deletion. Check the box orientation, beam and right-click targeting in the client at the intended placement.

## Orb destination dispatch

Orb animation resolves its destination through the facing selector and calls `animations/advance_orb`; if no destination exists, the orb is removed. The advance helper retains the arrival-distance check, movement, and effects. Box display, interaction, and animation phases remain separate, with existing stage-exit cleanup and map restrictions unchanged.
