# BO3 conventional weapons

This shared combat implementation owns IDs 20-46 on every map. All weapons are available in the Weapons dialog, Mystery Box and Wall Gun configuration. Ray Gun, Death Machine and equipment keep their existing IDs and acquisition rules.

## Registry and generation

The checked-in `registry/` functions define weapon IDs, firing modes, timings, damage, and ammunition tiers. Models live in the matching core resource pack. Authoring and generation sources are maintained outside this repository. Do not hand-edit files marked generated.

Each loaded `zombies:bo3 weapons.w<ID>.base` and `.pap` profile includes the string `pap_name`. It is the weapon's Pack-a-Punch display name regardless of the selected tier; inventory items use that name when upgraded. The shared Ray Gun profiles use the same `pap_name` key in `zombies:weapons guns.*`.

| Folder | Ownership |
| --- | --- |
| `registry/` | Generated stat selection, names and display dispatch |
| `input/` | Semi-auto, automatic and burst input, cancellation and timing |
| `inventory/` | Tier capacities, PaP refills, builder trigger and downed fallback |
| `reload/` | Magazine reloads and interruptible KRM shell loading; delegates recorded sounds to shared combat reload audio |
| `combat/` | Scaled damage, range falloff, headshots, pellet distribution and splash |
| `projectile/` | XM-53 rocket flight and impact, with a saved owner and damage profile |
| `migration/` | Retired IDs, saved wall markers and one-time inventory conversion |
| `display/` | Generated canonical items for inventory slots |

## Runtime behavior

The existing weapon `on_load` creates objectives and loads the registry. The existing weapon tick updates input and rockets; inventory enforcement also synchronizes the selected slot before displaying its item. Firing is driven by the `bo3_weapon` using-item advancement, with `force_fire` forwarding intercepted clicks. Each weapon plays a dedicated single-discharge sound: `guns.kn44` for the approved KN-44, and `guns.bo3.<slug>` for the others, including `guns.bo3.sheiva`. Imported events play one supplied discharge sample; RPK keeps three synthesized variations. Base/PaP tiers share that weapon's normal sound. Semi-auto and manual-burst guns require a fresh trigger press; Pharo and 48 Dredge repeat bursts while held. Changing the active slot, replacing a weapon, hiding the weapon, using Death Machine or entering/leaving the downed state prevents queued fire from affecting another gun.

Cooldowns retain milliseconds across 50 ms (1 tick) updates. Fast automatic weapons can emit multiple shots in a tick with Double Tap, preserving the existing twice-speed perk. Damage is rounded from the researched BO3 base profile divided by 25, with a minimum of 1 health point, against ZBK's round-number-plus-20 zombie health. PaP doubles that scaled profile; MR6 instead gains explosive rounds. RPK has explicitly documented ZBK tuning because the source dump predates it. These are ZBK balance values, not an exact BO3 damage simulation.

Regular guns use 0.2-block samples over at most 60 blocks; snipers reach 100 blocks and shotguns 20 blocks. Close/far damage interpolates over each profile's configured range. Head multipliers remain per weapon. KRM, Brecci and Haymaker distribute one shell's damage over four rays and award hit points once per enemy per shell. Argus uses one precise ray. Fractional pellet damage is retained to hundredths of a health point. Shared collision retains immunity, elemental effects, points, kill tracking, loot.

The XM-53 travels approximately 3 blocks per tick, checks terrain and enemies every 0.2 blocks, and expires after 35 ticks (1.75 seconds). Its marker owns a snapshot of damage, tier and shooter ID so switching guns cannot change an airborne rocket. Reload removes airborne rockets. XM-53 and packed MR6 splash within 3 blocks, including wolves, and retain the existing explosive self-damage handling. They do not destroy terrain.

Reloads distinguish a partially loaded magazine from an empty one. Speed Cola halves reload time. KRM loads individual shells and allows a fresh trigger to interrupt once a shell is available. PaP I and II apply the registered magazine/reserve limits and refill both pools; PaP II continues to assign the existing ammo elements. Max Ammo and wall refills use those same slot capacities. MR6 PaP tracks 12 combined rounds (6 per pistol) while retaining the approved single-gun model with glint and its upgraded name.

Downed players prefer an owned Ray Gun, then an owned MR6. The temporary MR6 fallback has a separate 8-round magazine and 80-round reserve, so firing it does not consume another owned weapon's ammunition.

## Firing audio

Clips contain one discharge, so automatic and burst cadence comes from actual firing events rather than a recording containing several shots. The shared firing function emits exactly one sound event per consumed round. Shotgun pellet rays do not play extra discharge sounds, and XM-53 plays a launch sound while projectile combat retains its existing impact audio.

The firing assets use supplied weapon recordings, converted to mono Ogg Vorbis with headroom checked against normal and Double Tap sequences. RPK retains its existing synthesized audio because no source recording was supplied. Automatic guns and repeating-burst Pharo/48 Dredge use short, smoothly faded 80-170 ms discharges to reduce stacked room echo; firing cadence is unchanged. Reload timers, Speed Cola and Double Tap behavior are retained; recorded reload audio is owned by the shared combat helpers. Firing sounds remain positional mono audio using the ambient channel at playback volume 1.4 for normal and Double Tap fire, with the existing nearby-player audience. No new runtime objectives, callbacks, markers or map restrictions are introduced by this sound set. Silenced recordings are available as optional resource-pack events; both gameplay tiers continue to use normal shots. Razorback, XR-2 and P-06 have audio assets only, with no gameplay IDs.

KRM-262 and Argus include a pump/lever action after the discharge; Locus and SVG-100 include a bolt action. `combat/play_sound` selects one combined clip per shot, using `sound` normally and `sound_fast` with Double Tap. The generated registry defaults `sound_fast` to `sound` for other weapons. The four action weapons explicitly configure a `_fast` sound event. Both cadences preserve the full recorded discharge and its pitch; Double Tap fits native-speed mechanical transients into the faster cooldown by using shorter action cuts and gaps, without time stretching. Shot tails can overlap subsequent shots and are included in the audio headroom checks. Base and PaP share the corresponding normal/fast variants. Rebuild these audio assets if firing intervals change.

The closing action finishes just before the earliest available cooldown tick, with timing limited to 50 ms (1 tick). This signals the cycling delay; existing ammo, reload and fresh-trigger checks still decide whether another shot is allowed. Because the action is embedded in the firing clip, it also plays after a last round and is not cancelled on a weapon switch. These firing actions are separate from recorded magazine/shell reload playback.

## KN-44 audio and timing

KN-44 and Anointed Avenger (ID 28) select `guns.kn44`, which plays the supplied normal KN-44 recording as one discharge per actual shot. Both tiers share this sound, with no distinct Pack-a-Punch audio. The optional silenced event is `guns.bo3.kn44_silenced`.

The existing 96 ms cycle targets 625 RPM, with millisecond carry across 50 ms (1 tick) updates. Partial reloads take 41 ticks (2.05 seconds), rounding the 2.03-second reference; empty reloads take 56 ticks (2.8 seconds). Speed Cola uses 20/28 ticks (1/1.4 seconds), matching the existing integer timer division. The current ZBK Double Tap perk still doubles firing speed; exact BO3 perk behavior and reload-cancel ammunition transfer are outside this audio pass.

KN-44 uses recorded normal/fast reloads through the [shared reload audio contract](../../../README.md#reload-audio), replacing the iron-door start and completion sounds while retaining background-slot reloads. Shot sounds use the existing nearby-player audience. No KN-44-specific reload state, markers or map restrictions apply.

## Public interfaces and migration

Use Weapons > SMGs > Kuda (23), or `trigger give_bo3 set 23`, to receive Kuda. The Weapons dialog groups conventional guns into seven category pages, with a give button for each gun and a Back button returning to Weapons. The installer generates these category pages from the registry. Operator calls use each named give entry point, for example:

```mcfunction
function zombies:combat/weapons/guns/kuda/give/main
function zombies:combat/weapons/guns/xm53/give/main
```

Smart assignment fills slots 1 and 2, then slot 3 with Mule Kick, and otherwise replaces the active weapon. Inventory IDs 20-46 are fixed and must not be renumbered. The model resource key is `zombies:bo3/<slug>`; ID 23 is `zombies:bo3/kuda`.

| Retired ID | Replacement ID | Replacement |
| --- | --- | --- |
| 1 | 42 | Argus |
| 2 | 25 | Vesper |
| 3 | 46 | XM-53 |
| 4 | 34 | BRM |
| 5 | 20 | MR6 |
| 6 | 30 | ICR-1 |
| 8 | 33 | M8A7 |
| 9 | 39 | KRM-262 |
| 10 | 44 | Locus |

Existing public legacy give paths and builder triggers remain acquisition aliases for saved map commands. Old firing implementations are removed. Inventory conversion preserves tier, element and remaining ammunition, clamping ammunition to the new tier's limits. If setup encounters retired IDs, it snapshots and restores the weapon slots around the existing setup reset, then converts them; later normal game resets still give the starter MR6 with 8 loaded rounds and 32 spare (80 reserve capacity). Pending PaP and Mystery Box IDs also resolve through the migration table. Persistent wall markers retain prices and directional tags, migrate before reconstruction, and rebuild when old markers load from another chunk. Legacy model files remain authoring pose references; they are not offered as active guns.

## Validation

Run `python tools/validate_core.py` from the datapacks repository for static validation. Minecraft 26.2 runtime testing remains authoritative for game behavior. Test firing, reloads, weapon switching, upgrades, and wall purchases in an isolated world. In-game hand/controller alignment and balance require client review.

MR6 and XM-53 blast victims use the shared [explosive damage contract](../../../README.md#damage-and-recovery), including shooter-owned death credit, loot and immunity. Their splash does not convert survivors to crawlers.
