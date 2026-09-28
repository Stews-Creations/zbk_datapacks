execute if score @s cb_recipe matches 1 unless score #shield cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score @s cb_recipe matches 2 unless score #ragnarok cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
scoreboard players operation @s cb_last = #now cb_stamp
scoreboard players operation @s cb_time = #now cb_stamp
scoreboard players operation @s cb_time -= @s cb_start
# Completion requires a current input event, never a timeout/grace tick.
execute if score @s cb_time >= #duration cb_time run function zbk:map_elements/crafting_bench/build/complete
