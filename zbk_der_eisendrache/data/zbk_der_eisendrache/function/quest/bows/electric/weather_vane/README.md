# Der Eisendrache electric-bow weather vane

Owns the first electric-bow quest step on Der Eisendrache (Der Eisendrache): shoot the vane with the original bow, reveal the broken arrow through the wall, and right-click to claim it. The existing stationary mount, spinning head and Map 2 models remain in use. The [three-fire milestone](../fires/README.md) follows binding; later Easter egg steps and the upgraded weapon reward remain separate work.

## Responsibilities

| Path | Responsibility |
| --- | --- |
| `spawning/` | Persistent vane placement, two item displays and their shot hitbox |
| `interactions/` | Original-bow eligibility, raycast hit detection and quest activation |
| `animations/` | Timed spin and wall/arrow reveal |
| `wall/` | Per-block authoring, exact snapshots, break and restoration |
| `arrow/` | Persistent electric pickup placement; [shared binding](../../binding/README.md) owns display and interaction |
| `management/` | Visual spin tests, runtime cleanup and deletion |
| [Blockbench source](../../../../../../../../../resourcepacks/zbk_der_eisendrache/README.md) | Editable model and generated vane assets |

Resource assets live in `assets/zbk_der_eisendrache/`. The vane items are `zbk_der_eisendrache:quest/bows/electric/weather_vane/mount` and `head`; the reward display uses `zbk_der_eisendrache:quest/bows/arrows/lightning_broken`.

## Placement and testing

Core selects this add-on through its registration API. This quest is authored in the overworld; keep the vane, wall and arrow placements loaded while testing or editing them.

An existing vane placement can be reused after `/reload`. To place one for the first time, stand where its mounting foot belongs; horizontal facing becomes its saved heading:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/spawning/place
```

Stand within 32 blocks of the vane. Look directly at each wall block that should break and run the following once per block. The authoring ray reaches 6 blocks and starts from the player's eyes and facing, discarding inherited command position/rotation. It saves ordinary solid blocks with their exact block states, including stair facing and shape. It refuses duplicates, block entities such as containers, and configurations beyond 64 wall blocks. All previously marked blocks must be loaded before appending more. Each successful registration briefly highlights the selected block and prints its saved coordinates; that same block is snapshotted, broken and restored.

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/place
```

For exact placement without aiming, substitute the desired block coordinates for `X Y Z` below. Alignment uses the block's integer corner; no eye-height offset applies. Use this as the player in the overworld within 40 blocks of the vane, with the quest idle. If existing selections are wrong, use the wall-clear command in [Reset and editing](#reset-and-editing) to restore and unregister them before marking again.

```mcfunction
execute positioned X Y Z align xyz run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/place_here
```

Stand at the desired arrow pickup position, within 32 blocks of the vane, and face its desired heading. The arrow appears above this position after the wall breaks. Repeating this command moves the pickup placement while the quest is idle.

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/arrow/marker/place
```

Give the actual original bow, then shoot the vane's model:

```mcfunction
function zbk_der_eisendrache:combat/weapons/guns/bow/give/main
```

Only the original bow (inventory ID `11`, including its packed version) starts this step. Other bows share some combat functions but do not qualify. Both quick and charged original-bow shots work. At close range, a right-click intercepted by the vane hitbox is forwarded through the original bow firing function for the exact clicker when that bow is in their offhand. The vane spins 720 degrees in 10 ticks (0.5 seconds), at 72 degrees per tick. It then coasts through three more turns over 30 ticks (1.5 seconds), slowing from 70.8 to 1.2 degrees per tick in 2.4-degree steps. After one additional tick (0.05 seconds) for the last turn to interpolate, only the registered wall blocks disappear, break particles and sound play, and the broken lightning arrow appears with the label `bind upgrade quest`. The accepted shot stops at the vane rather than exploding behind it. Missing authoring configuration produces one setup message and leaves the quest idle.

Right-click the arrow to bind the electric quest. The [shared bow binding module](../../binding/README.md) uses the exact player's UUID and allows one player per quest and one quest per player. Downed players cannot bind. The arrow hides while occupied. Binding another available arrow releases electric ownership and makes its pickup appear again without resetting the wall, vane stage or other quest progress. Another player can then bind electric and continue from the saved stage. An occupied destination does not release the player's current quest. Binding does not grant the upgraded bow.

```mcfunction
scoreboard players get #1 de_bow_owner
scoreboard players get @s id
```

Matching values mean you own the electric quest. A missing or zero owner means it is free. `de_el_stage = 3` records that the quest has been started, independently of its current owner.

## Quest-start audio

A valid original-bow hit starting the quest plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.weathervane_spin` once at the vane head, to all players within 32 blocks. The command keeps the 32-block audience limit and uses `minimumVolume=0.5` with the normal sound attenuation range. Listeners outside the normal audible sphere receive playback two blocks from their position at that minimum volume; nearby listeners retain positional playback from the vane. When the saved wall breaks and the arrow appears, `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_reveal` plays once at the arrow pickup marker, to all players within 8 blocks of that location. The reveal cue runs after the complete wall-break pass, not once per wall block. Repeated hits during the sequence and the model-only spin test do not replay these cues. Existing thunder and stone-break effects remain.

The resource pack uses mono Ogg Vorbis conversions of `weathervane_spin_04.flac` and `arrow_reveal_03.flac` for positional playback. Reload client resources after installing the sounds.

## Reset and editing

Reset only this quest step, restore its saved wall and rebuild the vane at its original heading:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/initialize
```

Restore and unregister all wall blocks while retaining the vane and pickup placement:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/management/clear
```

Delete the complete placement, restoring the wall first:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/delete
```

Load every registered wall marker before clearing or deleting configuration. Reauthor wall blocks after changing their materials; reset restores the snapshot captured when the block was registered.

The existing model-only spin/stop commands remain available; they do not activate quest progression:

```mcfunction
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/spin
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/stop
```

## State and lifecycle

| State | Contract |
| --- | --- |
| `de_el_vane_marker` | One persistent placement, heading, wall count, stage and timer |
| `de_el_wall_marker` | One persistent block position, snapshot coordinates in `data.sx`/`data.sz`, and `de_el_broken` restore flag |
| `de_el_arrow_marker` | One persistent pickup position and heading, also registered with shared bow binding |
| `de_el_stage` | Vane state: `0` idle, `1` spinning, `2` revealed but never bound, `3` started (retained when unbound) |
| `de_el_timer` | Remaining spin ticks; reveal waits if required placements unload |
| `de_el_walls` | Registered wall-block count; all must be loaded to start/reveal or change configuration |
| `#1 de_bow_owner` / `#1 de_bow_ready` | Electric reservation and availability, owned by shared bow binding |
| `de_el_vane_runtime` / `de_bow_1_runtime` | Derived displays, label and interactions, removed on reset/map cleanup |

`on_load` creates objectives and forceloads the snapshot chunk in the existing `zombies:door_storage` dimension. This module reserves X `0..15`, Y `64`, Z `-1024..-1021` for its 64 exact block snapshots. Custom doors allocate their saved zones at Z `0` and above, so these regions do not overlap. Save the storage dimension along with the map world; the snapshots are world data, not resource-pack assets. No new dimension or server restart is required.

`initialize` restores broken wall blocks, clears electric ownership, availability and progress (including the three fires and their ring segment), removes derived runtime, and rebuilds the vane on Map 2. It is invoked by quest/game initialization and reload. `management/cleanup` also restores loaded wall blocks and clears transient state after map deselection while retaining all authoring markers. If storage is still loading, restoration retains `de_el_broken = 1` and retries on Map 2 ticks. Do not delete a marker whose restore is pending.

`on_tick` runs the model-only spin test at 4.5 degrees per tick and the shot-triggered reveal with a fast spin followed by gradual deceleration, using 1-tick (0.05-second) interpolation. The timed reveal completes five turns over 40 ticks (2 seconds), then stops rotating even if wall/arrow placements temporarily unload. It also handles vane hits; the shared binding tick reconciles arrow pickups and consumes their interactions. Cross-module weapon hits enter through `maps/events/electric_bow_vane_shot`. This module owns no combat damage, weapon grants, Mystery Box entries or wall buys.

## Verification

Verify original-bow hits, rejection of other bows, one reveal despite repeated hits, exact-player binding, single ownership, progress-preserving switches, exact wall restoration, and cleanup on map changes. Placement/runtime functions require Map 2; cleanup deliberately works after deselection. Appearance and right-click targeting need an in-game check with the current resource pack. Commands and state transitions can be tested in an isolated vanilla 26.2 world.

The [final arrow reforging sequence](../reforging/README.md) controls the loaded head at 36 degrees per tick with flame and electric particles as soon as all three electric fires are complete, before the arrow is clicked. The effects continue through the 200-tick (10-second) arrow animation. It removes the normal spinning tag while controlling the head and stops rotation when the full arrow appears. That sequence owns its own marker, interaction, clock and quest completion.

## Arrow reveal dispatch

At reveal completion, `animations/reveal_arrow` reuses the selected arrow marker for the stone sound, bow-ready transition, and pickup display synchronization. The vane still waits for the required wall and arrow markers before completion. Heading, animation timing, map guards, and initialization remain unchanged.

Electric quest cleanup also clears `#1 de_bow_started`, returning its inventory emblem to the dim pre-claim state. A later successful arrow claim activates it again.

The model-test spin tick selects spinning heads before checking reveal markers. With no spinning head loaded, it skips that marker search; active heads retain the reveal-stage guard and rotate every tick.
