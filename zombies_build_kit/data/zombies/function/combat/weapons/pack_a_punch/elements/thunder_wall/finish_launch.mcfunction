# Finish a Thunder Wall launch: drop loot, credit shooter (half), kill victim.
# Run as @s = launched piglin (positioned at @s, mid-air at peak).

execute if entity @s[tag=immune_elements] run return 0

# Stash victim's stored shooter id so @a iteration can match
scoreboard players operation #tw_kill_shooter stats = @s tw_shooter_id

# Award HALF kill points to original shooter
execute as @a if score @s id = #tw_kill_shooter stats run function zombies:player/points/add_half_kill_points

# Drop loot at victim position (mid-air — items will fall)
scoreboard players operation #map_killer temp = #tw_kill_shooter stats
execute at @s run function zbk:enemy/killed
loot spawn ~ ~ ~ loot entities/zombified_piglin

# Death effect — thunder crack + spark burst
particle minecraft:flash{color:[1.0,1.0,0.8,1.0]} ~ ~ ~ 0 0 0 0 1 force
particle minecraft:electric_spark ~ ~0.5 ~ 0.5 0.5 0.5 0.8 30 force
particle minecraft:cloud ~ ~0.5 ~ 0.3 0.3 0.3 0.05 8 force
playsound minecraft:entity.lightning_bolt.impact master @a[distance=..30] ~ ~ ~ 0.5 1.5

# Kill
kill @s
