# Der Eisendrache bow quest binding

Shared Map 2 ownership and interactable pickups for electric, fire, wolf and void upgrade quests. A quest has at most one owner and a player has at most one bound quest. Changing ownership never resets quest progress, restores walls, consumes inventory items or grants a weapon. Only the electric quest currently has a playable unlock; the other pickups are operator test fixtures until their quests are implemented.

The binding confirmation chat message is visible only to the binding player when tagged `debug`; pickup visibility, the inventory indicator and the confirmation sound still update for every player.

## Ownership and progress

| Quest key | Arrow | Owner score holder |
| --- | --- | --- |
| 1 | Electric / lightning | `#1` |
| 2 | Fire | `#2` |
| 3 | Wolf | `#3` |
| 4 | Void | `#4` |

`de_bow_owner` on these score holders is the owner's stable player `id`; missing or zero means unbound. `de_bow_ready = 1` on the same holders means the quest's pickup has been unlocked. `de_bow_started` on each quest holder records its first successful arrow claim for the inventory emblem: missing means dim/unstarted, 1 means colored/started. Unbinding and switching retain it; full binding initialization, individual arrow removal and electric vane cleanup clear the corresponding started state. These scores are independent of loaded marker chunks and player connectivity. Disconnecting does not release a reservation. Explicit game reset/map cleanup clears all owners; individual feature resets clear their own availability and progress. The electric vane reset only clears electric ownership and readiness.

All quest progress belongs to its feature's persistent markers/state, shared by whoever binds that quest next. Binding only updates ownership. Electric `de_el_stage = 3` means its quest has been started at least once, not that it is currently occupied. An unbound electric quest keeps that stage and its broken wall. Other future quest counters, completed targets and timers must likewise remain feature-owned and must not be reset by binding.

The exact interaction UUID selects the player, with a maximum reach of 6 blocks. Downed players, players without a stable ID, unavailable destinations and occupied destinations are rejected before releasing the player's existing quest. Successful binding releases every previous reservation for that player, reserves the destination, hides its runtime and rebuilds available pickups. Two clicks processed in the same tick cannot steal or duplicate a reservation. Released pickups in unloaded chunks reappear when their markers load.

Successful electric-arrow binding plays `zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_pickup` once only to the collecting player, without a vanilla XP chime. Other bow bindings retain their existing chime. This also applies when a released electric pickup is claimed again. Other quest bindings and rejected interactions do not play this cue. The stereo Ogg Vorbis asset is converted from `memento_pickup.flac` and is shared with the final reforged electric-arrow pickup.

## Lifecycle and responsibilities

| Path | Responsibility |
| --- | --- |
| `on_load` | Define ownership, availability and runtime quest-key objectives |
| `initialize` | Clear owners, remove runtime and reconstruct unlocked pickups on Map 2 |
| `on_tick` | Detect availability changes and process exact-player interactions |
| `display/` | Derive arrow model, `bind upgrade quest` label and interaction from marker metadata |
| `interactions/` | Validate destination and bind without changing saved progress |
| `management/` | Manual unbind and temporary arrow test placements |

Persistent pickup markers use `de_bow_pickup` and `data:{quest:1,model:"lightning"}` (or keys 2/3/4 with fire/wolf/void). Feature code owns placement and sets `#<key> de_bow_ready` only after its unlock. The electric placement also retains `de_el_arrow_marker` for its wall-reveal lifecycle. Runtime uses `de_bow_runtime`, a quest-specific `de_bow_<key>_runtime` tag and `de_bow_interaction`; the interaction's `de_bow_kind` score carries its quest key. Runtime is always derived from persistent placements, readiness and owners. Keep one placement per quest, in the overworld.

The enclosing quest module calls this module's load, reset and tick hooks. Map deselection calls `initialize` to clear reservations and hide runtime. Temporary test-arrow placements and readiness survive reset and rebuild on Map 2; remove them explicitly when done. Electric availability resets through the [weather vane](../electric/weather_vane/README.md). This module adds no Mystery Box or wall-buy entries.

## Test commands

After reloading, unlock the electric arrow through the vane. Stand at a different spot for each temporary test pickup:

```mcfunction
function zbk_der_eisendrache:quest/bows/binding/management/place_test_arrow {quest:2}
function zbk_der_eisendrache:quest/bows/binding/management/place_test_arrow {quest:3}
function zbk_der_eisendrache:quest/bows/binding/management/place_test_arrow {quest:4}
```

These place fire, wolf and void arrows. They are Map 2 operator fixtures, do not implement or complete the corresponding Easter eggs, and refuse to replace an existing or occupied fixture. Right-click electric, then fire: electric must return, fire must disappear, and the electric wall must remain broken. A second player can bind the released electric quest. Switching back resumes its existing stage. Trying an occupied arrow must leave both current reservations unchanged.

Compare an owner to a player's stable ID:

```mcfunction
scoreboard players get #1 de_bow_owner
scoreboard players get @s id
```

Release only your current binding without resetting any quest:

```mcfunction
function zbk_der_eisendrache:quest/bows/binding/management/unbind
```

Load all temporary arrow locations, then remove their markers, runtime and reservations:

```mcfunction
function zbk_der_eisendrache:quest/bows/binding/management/remove_test_arrows
```

This leaves the real electric pickup and its progress intact. Validate single ownership, same-tick contention, exact clicker selection, switching in both directions, downed/out-of-range rejection, display reconstruction, Map 2 guards and feature progress preservation in an isolated vanilla server. In-game visuals and client right-click targeting still need a player test.

## Presentation reconciliation

Each pickup marker's `de_bow_visual` score records the last synchronized availability (0 unavailable, 1 available). It is derived state, never authoritative ownership or proof that runtime exists. Each tick compares it with current readiness and owner scores; missing or changed state immediately synchronizes the pickup. Explicit bind, unbind, placement and initialization still synchronize immediately.

`display/maintenance`, dispatched by `maps/events/maintenance_1s` on Map 2, checks actual runtime every 20 ticks (1 second). This recovers missing or newly loaded runtime, including chunks whose saved presentation score is already current, and removes late-loaded unavailable visuals. This bounds external runtime repair to one maintenance interval while preserving per-tick interaction validation and state transitions. `#bow_available temp` is synchronous scratch, overwritten for each marker.
