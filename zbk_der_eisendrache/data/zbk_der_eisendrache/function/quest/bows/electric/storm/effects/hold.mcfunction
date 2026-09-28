# Runs as and at a captured enemy, including after chunk reload or map deselection.
execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/storm/effects/release
scoreboard players operation #de_held_link temp = @s de_storm_link
scoreboard players set #de_held_center temp 0
execute unless score #storm_lookup_active temp matches 1 as @e[type=marker,tag=de_electric_storm,scores={de_storm_life=1..}] if score @s de_storm_link = #de_held_link temp run scoreboard players set #de_held_center temp 1
execute if score #storm_lookup_active temp matches 1 run function zbk_der_eisendrache:quest/bows/electric/storm/lookup/query
execute if score #de_held_center temp matches 0 run return run function zbk_der_eisendrache:quest/bows/electric/storm/effects/release

# Rise at most 1 block over 20 ticks, then hover until the linked storm ends.
# Conservative headroom also accommodates the taller Panzer controller.
data merge entity @s {NoAI:1b,NoGravity:1b,Motion:[0.0d,0.0d,0.0d],fall_distance:0.0f}
execute if score @s de_storm_life matches 1.. if block ~ ~1 ~ #zombies:raycast_pass if block ~ ~2 ~ #zombies:raycast_pass if block ~ ~3 ~ #zombies:raycast_pass run tp @s ~ ~0.05 ~
execute if score @s de_storm_life matches 1.. run scoreboard players remove @s de_storm_life 1
