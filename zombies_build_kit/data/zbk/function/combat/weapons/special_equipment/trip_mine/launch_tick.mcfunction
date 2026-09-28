# ===================================
# TRIP MINE LAUNCH TICK
# ===================================
# Called as the triggered trip mine marker.

scoreboard players remove @s timer 1
tp @s ~ ~0.16 ~

scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute at @s as @e[type=item_display,tag=trip_mine_display] if score @s grenade_id = #current_grenade_id grenade_id run tp @s ~ ~0.35 ~

particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.02 2 force

execute if score @s timer matches ..0 run tag @s add grenade_marker
execute if score @s timer matches ..0 run function zbk:combat/weapons/grenade/explode
