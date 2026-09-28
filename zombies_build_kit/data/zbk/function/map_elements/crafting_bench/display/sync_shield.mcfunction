# Marker context. Reuse the one-second maintenance hook; no shield tick or teleport.
scoreboard players operation #shield_owner cb_id = @s cb_id
scoreboard players set #shield_here cb_build 0
execute if score #shield cb_build matches 2 if score @s cb_id = #shield_bench cb_id run scoreboard players set #shield_here cb_build 1
execute if score #shield_here cb_build matches 0 as @e[type=item_display,tag=cb_shield,distance=..3] if score @s cb_id = #shield_owner cb_id run kill @s
execute if score #shield_here cb_build matches 0 run return 0
scoreboard players set #shield_display cb_build 0
execute as @e[type=item_display,tag=cb_shield,distance=..3] if score @s cb_id = #shield_owner cb_id run scoreboard players set #shield_display cb_build 1
execute if score #shield_display cb_build matches 0 run function zbk:map_elements/crafting_bench/spawning/shield
