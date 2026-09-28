# Behavior Module

Owns gameplay-mob behavior, area restrictions, crawler cleanup, and enemy relocation.

## Structure

| Path | Responsibility |
| --- | --- |
| `ai/` | Piglin and wolf attributes, targeting, and movement behavior |
| `areas/` | Player-block and zombie-barrier marker systems |
| `crawler/` | Crawler pairing and periodic cleanup |
| `relocation/` | Recovery of enemies that become stuck or leave valid play areas |

## Lifecycle

- `on_load` creates behavior triggers and relocation scoreboards.
- `on_tick` owns the shared entity selectors and delegates per-entity work.
- `on_tick_as_player` is reserved for player-context behavior.
- `enable_triggers` enables the module's Build Kit triggers for one player.
- `global/tick_1s` delegates zombie recovery sampling every 20 ticks (1 second).

## Enemy targeting

`ai/anger` skips turned zombies. Before each normal piglin or wolf batch, `on_tick` checks Monkey Bomb availability once and stores 0 or 1 in `#monkey_available temp`. Every enemy in that synchronous batch reuses the answer. The score is reset immediately after each batch; the wolf batch refreshes after the intervening weapon effects. Neither batch creates, removes, or moves decoys. Future changes that do so must refresh availability or end the batch first.

When a decoy exists, `ai/target_monkey` still selects the nearest decoy separately at each enemy's position, refreshes anger for 100 ticks (5 seconds), clears the solo-down target tag, and returns before player targeting. Otherwise the existing nearest-standing-player and solo-down logic runs. Both selectors retain their original unrestricted dimension scope; no distance or dimension filter is added.

## Zombie recovery

Travel anchors and map hazards retain their zombie cleanup triggers. Their zombie/mannequin refund paths call the guarded [Waves accounting contract](../waves/README.md): remove ownership first, refund once, and restore an actually consumed speed allocation. Dog refunds remain separate. Crawler conversion transfers the adult's ownership and allocation; recovery also removes its paired display.

Distance relocation requires at least one standing player and a usable unlocked replacement marker within the normal spawn range of an eligible player with a positive `id`. It respects marker mode, animation occupancy, and temporary exclusion. With no replacement, enemies remain for a later check. Distance alone triggers this path; it does not wait for stationary time or visibility checks. Refunded slots return through ordinary weighted selection, cooldowns, and burst limits, so replacement is not necessarily immediate. Existing teleporter anchor settings remain separate.

| `zr_cfg` holder | Default | Meaning |
| --- | ---: | --- |
| `#relocate_distance` | 60 | Automatic relocation threshold in blocks from every standing adventure-mode player |
| `#enabled` | 0 | 0 disables stationary sampling; 1 enables it during active zombie rounds |
| `#still_seconds` | 30 | Consecutive one-second samples with insufficient movement |
| `#distance` | 48 | Minimum separation from every standing adventure-mode player, in blocks |
| `#movement` | 25 | Per-axis displacement from the reference position in hundredths of a block, 0.25 blocks |
| `#budget` | 2 | Maximum expensive recovery/visibility evaluations per one-second sample |

Movement is measured from the start of the stationary interval so slow progress accumulates. Near players, within 6 blocks of an intact barrier marker, or while turned, launched, burning, marked for fireworks, zapped, under Slowness/Levitation, or `NoAI`/`NoGravity`, the observation window resets. Only zombies with a counted round slot qualify, and a usable replacement marker must exist near an eligible player.

Visibility is conservative: bounded rays from each standing player's eyes toward the candidate's feet, torso, and head suppresses recovery when the path is clear. Only full blocks listed in `zombies:recovery_occluder` count as occluders; unknown materials, glass, and partial blocks do not hide a candidate. Players beyond the 128-block ray budget also suppress removal. This can retain stranded enemies when visibility is uncertain. At most two candidates receive these checks per sample by default. A visible candidate restarts its observation window so it cannot permanently monopolize the evaluation budget.

## Approved Entity Hooks

`on_tick_as_piglin` and `on_tick_as_wolf` intentionally remain at the module root. Zombified piglins and wolves are the common gameplay mobs, so `on_tick` selects each type once and delegates to these hooks. This mirrors the repository's single `on_tick_as_player` loop and prevents repeated broad selectors in child functions.

## Dependencies

- `global` supplies shared scoreboards and timing.
- `combat` owns Pack-a-Punch status effects applied to enemies.
- `waves` owns enemy spawning; this module owns behavior after spawn.
- Animated Java owns generated crawler model functions.

Do not put spawning, weapon damage, or wave progression in this module.

## Marker lookup phases

Relocation anchors refresh each local spawner's zone through `relocation/refresh_zone` in one selection per spawner type. Destination selection and refund phases still follow all zone refreshes; anchor expiry, scratch-tag cleanup, and reset behavior are unchanged.

## Shield-owner melee

The shared piglin/wolf loops call [Combat shield protection](../combat/weapons/special_equipment/rocket_shield/README.md#protection-and-durability) only while a player owns a usable shield. Combat temporarily suppresses native attack damage for enemies targeting that owner, resolves directional contact before health loss, and restores native damage when the target changes or loses the shield. Behavior retains targeting and movement ownership; no extra enemy selector loop is added.

## Grounded enemy fall protection

Piglin and wolf behavior checks the native `zombies:behavior/grounded` entity predicate before resetting `fall_distance`. Airborne enemies retain the existing per-tick reset; grounded enemies skip the redundant entity NBT write. The predicate reads the native ground flag rather than matching serialized entity NBT. Targeting, movement speed, hellhound fire and shield routing remain at their existing phases.
