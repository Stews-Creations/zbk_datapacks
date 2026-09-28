# Finish a Blast Furnace burn: drop loot, credit shooter, kill victim.
# Run as @s = burning piglin (positioned at @s).

execute if entity @s[tag=immune_elements] run return 0

# Stash victim's stored shooter id so @a iteration can match
scoreboard players operation #bf_kill_shooter stats = @s bf_shooter_id

# Award HALF kill points to original shooter (element AoE is cheap mass-clear)
execute as @a if score @s id = #bf_kill_shooter stats run function zombies:player/points/add_half_kill_points

# Drop loot at victim position
scoreboard players operation #map_killer temp = #bf_kill_shooter stats
execute at @s run function zbk:enemy/killed
loot spawn ~ ~ ~ loot entities/zombified_piglin

# Death effect
particle minecraft:flame ~ ~1 ~ 0.5 0.8 0.5 0.1 30 force
particle minecraft:large_smoke ~ ~1 ~ 0.3 0.5 0.3 0.02 8 force

# Kill
kill @s
