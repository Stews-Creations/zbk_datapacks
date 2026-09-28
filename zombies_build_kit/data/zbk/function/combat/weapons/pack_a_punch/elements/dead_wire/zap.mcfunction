# Zap a single Dead Wire victim — instant kill + attribution.
# Run as @s = victim piglin. Requires #shooter_id stats.

# Tag immediately so the stun loop in handle skips already-killed victims
execute if entity @s[tag=immune_elements] run return 0
tag @s add dw_zapped

# Award HALF kill points to original shooter
execute as @a if score @s id = #shooter_id stats run function zbk:player/points/add_half_kill_points

# Drop loot
scoreboard players operation #map_killer temp = #shooter_id stats
execute at @s run function zbk:enemy/killed
loot spawn ~ ~ ~ loot entities/zombified_piglin

# Electric death burst
particle minecraft:electric_spark ~ ~1 ~ 0.4 0.6 0.4 0.6 25 force
particle minecraft:flash{color:[0.6,0.8,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force

# Kill
kill @s
