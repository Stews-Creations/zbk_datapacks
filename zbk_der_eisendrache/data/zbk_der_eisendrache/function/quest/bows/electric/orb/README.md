# Electric bow quick-shot orb

Map 2-only lingering attack for electric bow weapon ID 12. An uncharged shot leaves one small blue-white electric ball at its first valid enemy or solid-block impact. The direct shot keeps its existing piercing damage, but subsequent hits cannot create another orb. A fully drawn shot with only one ammo uses this quick-shot effect. Charged shots retain their separate storm. Range exhaustion and unloaded terrain do not count as impacts.

The [Call of Duty Wiki](https://callofduty.fandom.com/wiki/Wrath_of_the_Ancients/Kreema%27ahm_la_Ahmahm) describes an uncharged electrical ball lingering at impact and shocking nearby zombies; the [gameplay guide](https://mmmrkennedy.com/games/BO3/der_eisendrache/der_eisendrache_guide) also describes a short-lived orb. The numbers below are Build Kit tuning values, not claimed measurements from Black Ops III.

## Damage and lifetime

The orb lasts 60 loaded ticks (3 seconds). Starting on its first tick, it deals 45 damage every 10 ticks (0.5 seconds) to zombified piglins and wolves whose feet are within 2.5 blocks of the impact center. This kills a full-health normal ZBK zombie through round 25 in one pulse; later rounds can require further pulses. Every accepted hit applies Slowness VII for 20 ticks (1 second). Blue particles form a compact ball slightly above the impact center, with sparks on shocked victims. There is no large storm, lift, real lightning, fire, block destruction or player damage.

Element-immune, gun-immune, combat-ignored, turned enemies and decoys are excluded. Damage uses shared combat collision at each victim's feet, preserving hit/kill points, Double Points, Insta-Kill, kill statistics, loot, model cleanup and quest soul credit. Pulses do not receive headshot bonuses, Pack-a-Punch multipliers or extra element procs. Every orb stores and restores its shooter's stable player ID, so overlapping orbs and weapon changes do not transfer credit. Owner disconnection removes the orb when next ticked.

## Proximity sound

Orb creation also plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ball_explo` once at the impact center for every player within 15 blocks, using the same loud spawn cue as a charged tornado. Orb ticks, later arrivals and misses do not replay this spawn cue.

Each player within 3 blocks of a live orb's impact center hears `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.lightning_ball` once for that orb, played at the orb's position. The radius is checked every tick, so players approaching after impact also hear it. All players qualify, regardless of quest ownership. Leaving and re-entering does not replay the same orb's cue; separate orbs track listeners independently. The approximately 2.9-second Ogg Vorbis clip comes from the supplied `lightning_ball_01.flac` and finishes naturally once started.

Each transient marker keeps listener UUIDs in `data.sound_listeners`. The sound helper copies this list into `zombies:de_orb_sound` scratch storage for one synchronous player pass, writes it back to that same marker, then clears the scratch fields. This list expires with the orb and needs no persistent configuration or player scores.

## Ownership and lifecycle

These are transient attack markers, not persistent authoring placements. No placement command or saved configuration is needed. Reset, reload initialization and map cleanup remove loaded orbs; there is no reconstruction of spent attacks. An unloaded orb pauses until loaded again, when its map and owner checks resume.

| State or entry point | Responsibility |
| --- | --- |
| `de_electric_orb` | Transient marker at the impact center |
| `de_orb_owner` | Original shooter's stable player ID |
| `de_orb_life` | Remaining loaded lifetime in ticks |
| `on_load` | Define objectives on every map |
| `initialize` | Remove transient orb markers |
| `on_tick`, `animations/` | Check active map/owner, render ball, pulse and expire |
| `spawning/` | Guard Map 2 and create exactly one owned marker |
| `effects/` | Select nearby victims, restore shooter attribution and play proximity audio once per listener |

Combat enters through `maps/events/electric_bow_quick_impact`, which consumes the per-shot request before dispatching. The [quest orchestrator](../../../README.md) owns load, tick, initialization and cleanup calls. Shared damage remains in [combat](../../../../../../../../zombies_build_kit/README.md), under `weapons/guns/electric_bow/orb/hit`. Neither orb ticks nor storm ticks may create another impact effect.

## Validation

Use isolated Minecraft 26.2 fixtures to check quick versus charged impacts, last-ammo fallback, piercing without duplicate orbs, all weapon slots, misses, damage radius, late entrants, immunity, owner-specific points and kills, expiry, owner departure and map/reset cleanup. Client appearance still needs an in-game check.
