stopsound @s master zbk:zmb_building
tag @s remove cb_building
scoreboard players set #cancel_target cb_id 0
execute if score @s cb_target matches 1.. run scoreboard players operation #cancel_target cb_id = @s cb_target
execute as @e[type=text_display,tag=cb_progress] if score @s cb_id = #cancel_target cb_id at @s run function zombies:map_elements/crafting_bench/display/update
scoreboard players set @s cb_time 0
scoreboard players reset @s cb_start
scoreboard players reset @s cb_last
scoreboard players reset @s cb_recipe
scoreboard players reset @s cb_target
