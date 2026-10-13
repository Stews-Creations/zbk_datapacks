# Combat Module

Owns player weapons, damage mechanics, special equipment, Pack-a-Punch effects, immunity rules, and collectible powerups.

## Structure

| Path | Responsibility |
| --- | --- |
| `immunity/` | Damage-immunity checks and tools |
| `enemies/` | Once-per-enemy death notifications and kill callouts |
| `powerups/` | Drop spawning, pickup detection, timers, HUD state, and activation |
| `weapons/guns/` | Gun-specific acquisition, fire, reload, and presentation |
| `weapons/grenade/` | Grenade inventory and throwing |
| `weapons/knife/` | Melee behavior |
| `weapons/mechanics/` | Shared raycast, hit, and firing mechanics |
| `weapons/reload/`, `weapons/firing/` | Shared reload flow and firing dispatch |
| `weapons/inventory/`, `weapons/profiles/`, `weapons/runtime/` | Ammo/slot maintenance, stat selection, timers, and advancement recovery |
| `weapons/reload_audio/` | Recorded reload playback and slot-specific cancellation |
| `weapons/pack_a_punch/` | Upgrades and elemental effects |
| `weapons/special_equipment/` | Rocket Shield, Monkey Bombs, Trip Mines, and related equipment |

## Lifecycle

- `on_load` delegates to weapons and powerups.
- `on_tick` runs shared weapon and drop logic.
- `on_tick_as_player` runs player-context combat logic through the shared player loop.

Player inventory owns weapon and equipment slots; Combat owns weapon state, ammunition, reload timing, damage, and kill credit. The [Player module](../player/README.md) reconstructs canonical items from that state. [Waves](../waves/README.md) owns counted zombie slots and spawn accounting.

Weapons, powerups, and enemy deaths own their audio and event dispatch under `audio/` and `events/` in the corresponding feature. Powerup timers live in `powerups/management/`. Enemy death reporting lives in `enemies/lifecycle/` and preserves the once-per-entity guard and killer context.

## Damage and recovery

Adult-to-crawler conversion transfers the existing zombie's counted round slot and consumed speed allocation. It confirms crawler creation before transferring ownership or removing the adult; conversion is not another wave spawn. Explicit recovery refunds the crawler's original slot once.

Shared blasts reject already-dead targets, combat-ignored entities, turned zombies, decoys, and explosive-immune enemies. Damage resolves before crawler conversion. Insta-Kill remains lethal, and the per-blast victim selection prevents a newly created crawler from being hit again by the same blast.

Deadshot ownership is read from the shooter matching the ray's player ID for each victim. Non-explosive gun hits use the headshot classification regardless of impact height, with the existing legacy or per-weapon head damage multiplier, kill statistics, and head-position blood. Shotgun damage division, range falloff, immunity, and element consumption retain their existing rules. Natural explosive head hits retain their original behavior; Deadshot never promotes explosive body or leg hits.

## Reload audio

The conventional gun roster and Ray Gun use the shared reload flow. Weapon profiles own normal reload timing; Speed Cola applies the existing timer adjustment. Slot-specific audio is stopped when reload completes, the weapon is replaced, or firing cancels the reload. Background reloads continue when the player changes active slots. Successful reload starts invoke Electric Cherry once, using that slot's pre-reload ammo and current capacity; shell insertions and completions do not retrigger it. Electric Cherry uses the same nonlethal stun strength as Dead Wire, with its own blue-outline ownership and cleanup.

## Equipment

The Rocket Shield is an optional slot-6 item with boost, melee, durability, and back-display behavior. Monkey Bombs own their decoy and detonation lifecycle. Trip Mines own placement, arming, and explosion behavior. Powerups own their drop eligibility, pickup, timers, and activation effects.

Grenades use shared throw and explosion paths. Downed players cannot throw hand grenades in solo or co-op; blocked attempts consume no ammunition. Throwing becomes available again after revival. The throw consumes ammunition when the projectile is created; impact or the flight limit resolves the explosion. Widow's Wine switches hand grenades to sticky web grenades with a 40-tick contact fuse and a web wave after their explosion; its defensive burst consumes the same ammunition. Webbed kills can drop a one-charge blue spider pickup through the guarded enemy death lifecycle. The knife enchantment dispatches exact-victim web hits, and its separate damage multiplier applies only while a knife is held. The [perk module](../map_elements/perks/README.md) owns timing, restraint, refill, and pickup rules. Entities tagged `combat_ignore` are excluded from shared gun raycast collision.

## Feature subfolders

Grenades, Monkey Bombs, and Trip Mines separate inventory, spawning, and effects/runtime. Shared blast helpers separate damage, kill accounting, and target selection. Weapon-upgrade editor actions live in `weapons/pack_a_punch/build_kit/`. Conventional weapon registries and focused weapon-specific folders keep their existing organization.
