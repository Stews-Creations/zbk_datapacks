scoreboard players operation @s cb_recipe = #recipe cb_build
scoreboard players operation @s cb_target = #clicked cb_target
scoreboard players operation @s cb_start = #now cb_stamp
scoreboard players operation @s cb_last = #now cb_stamp
scoreboard players set @s cb_time 0
tag @s add cb_building
function zbk:combat/weapons/guns/bo3/input/cancel
scoreboard players set @s auto_firing 0
playsound zbk:zmb_building master @s ~ ~ ~ 1 1

scoreboard players operation #progress_target cb_id = @s cb_target
execute as @e[type=marker,tag=cb_marker,distance=..8] if score @s cb_id = #progress_target cb_id at @s run function zbk:map_elements/crafting_bench/display/create
