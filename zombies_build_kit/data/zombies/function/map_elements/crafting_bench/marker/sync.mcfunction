execute unless score @s cb_id matches 1.. run function zombies:map_elements/crafting_bench/marker/register
scoreboard players operation #owner cb_id = @s cb_id
scoreboard players set #found cb_id 0
execute as @e[type=item_display,tag=cb_model,distance=..0.1] if score @s cb_id = #owner cb_id run scoreboard players add #found cb_id 1
execute as @e[type=interaction,tag=cb_interaction,distance=..1.5] if score @s cb_id = #owner cb_id run scoreboard players add #found cb_id 1
execute if score #found cb_id matches 4 run return run function zombies:map_elements/crafting_bench/display/sync_shield
execute as @e[tag=cb_runtime] if score @s cb_id = #owner cb_id run kill @s
execute at @s run function zombies:map_elements/crafting_bench/spawning/runtime
function zombies:map_elements/crafting_bench/display/sync_shield
