# Shared element gate: per-shooter 15s cooldown + 25%-per-bullet roll + shooter stash.
# Side-effect contract:
#   - On gate fail (cooldown active OR roll missed): sets #cooldown_roll_pass temp = 0.
#   - On gate pass: sets X_cooldown=300 on the shooter, stashes #shooter_id stats,
#                   sets #cooldown_roll_pass temp = 1.
#
# Caller passes {prefix:"bf"|"dw"|"fw"|"tw"} via function macro args.
# Turned does not use this — it has no cooldown (global count cap instead).
#
# Usage:
#   function zombies:combat/weapons/pack_a_punch/elements/_common/cooldown_roll {prefix:"bf"}
#   execute if score #cooldown_roll_pass temp matches 0 run return 0

scoreboard players set #cooldown_roll_pass temp 0

# Cooldown gate
$execute as @a if score @s id = #player stats if score @s $(prefix)_cooldown matches 1.. run return 0

# 25% per-bullet roll
$execute store result score #$(prefix)_roll temp run random value 1..4
$execute unless score #$(prefix)_roll temp matches 1 run return 0

# Both gates passed — set cooldown, stash shooter, flag pass
$execute as @a if score @s id = #player stats run scoreboard players set @s $(prefix)_cooldown 300
scoreboard players operation #shooter_id stats = #player stats
scoreboard players set #cooldown_roll_pass temp 1
