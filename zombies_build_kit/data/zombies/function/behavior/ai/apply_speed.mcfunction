# === APPLY ZOMBIE SPEED ===
# Purpose: Assigns speed deterministically from round's calculated pool

# Test spawns and uncounted enemies must not consume round speed allocations.
execute unless entity @s[tag=wz_slot] run attribute @s movement_speed base set 0.21
execute unless entity @s[tag=wz_slot] run return 0
scoreboard players reset @s wz_speed

# 1. Get total remaining in the pool
scoreboard players operation #pool_total temp = #global wave.spd_walkers
scoreboard players operation #pool_total temp += #global wave.spd_normals
scoreboard players operation #pool_total temp += #global wave.spd_fasts

# Fallback (Edge case: more zombies spawning than expected count)
execute if score #pool_total temp matches ..0 run tag @s add speed_normal
execute if score #pool_total temp matches ..0 run attribute @s movement_speed base set 0.21
execute if score #pool_total temp matches ..0 run return 1

# 2. Get random index 0 to (pool_total - 1)
execute store result score @s temp run random value 0..1000000
scoreboard players operation @s temp %= #pool_total temp

# 3. Determine bucket
# Walker check
execute if score @s temp < #global wave.spd_walkers run tag @s add speed_walking
execute if entity @s[tag=speed_walking] run scoreboard players remove #global wave.spd_walkers 1
execute if entity @s[tag=speed_walking] run scoreboard players set @s wz_speed 1
execute if entity @s[tag=speed_walking] run attribute @s movement_speed base set 0.17
execute if entity @s[tag=speed_walking] run return 1

# Adjust index for normal check
scoreboard players operation @s temp -= #global wave.spd_walkers

# Normal check
execute if score @s temp < #global wave.spd_normals run tag @s add speed_normal
execute if entity @s[tag=speed_normal] run scoreboard players remove #global wave.spd_normals 1
execute if entity @s[tag=speed_normal] run scoreboard players set @s wz_speed 2
execute if entity @s[tag=speed_normal] run attribute @s movement_speed base set 0.21
execute if entity @s[tag=speed_normal] run return 1

# Fast check (Everything else)
tag @s add speed_fast
scoreboard players remove #global wave.spd_fasts 1
scoreboard players set @s wz_speed 3
attribute @s movement_speed base set 0.25
