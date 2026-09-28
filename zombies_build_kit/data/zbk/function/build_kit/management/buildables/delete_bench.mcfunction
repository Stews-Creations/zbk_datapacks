execute unless score @s cb_edit matches 1.. run return 0
scoreboard players operation #bench_edit cb_id = @s cb_edit
execute at @s as @e[type=marker,tag=cb_marker,distance=..5] if score @s cb_id = #bench_edit cb_id at @s run function zbk:map_elements/crafting_bench/management/delete
scoreboard players reset @s cb_edit
