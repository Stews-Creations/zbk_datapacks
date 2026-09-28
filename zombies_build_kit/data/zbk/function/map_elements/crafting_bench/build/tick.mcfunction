execute if entity @s[team=downed] run return run function zbk:map_elements/crafting_bench/build/cancel
execute if entity @s[gamemode=spectator] run return run function zbk:map_elements/crafting_bench/build/cancel
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk:map_elements/crafting_bench/build/cancel
execute store result score #now cb_stamp run time query gametime
scoreboard players operation #gap cb_stamp = #now cb_stamp
scoreboard players operation #gap cb_stamp -= @s cb_last
execute if score #gap cb_stamp matches 5.. run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score #gap cb_stamp matches ..-1 run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score @s cb_recipe matches 1 unless score #shield cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score @s cb_recipe matches 2 unless score #ragnarok cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
scoreboard players operation #target cb_target = @s cb_target
scoreboard players set #exists cb_target 0
execute as @e[type=marker,tag=cb_marker,distance=..2.5] if score @s cb_id = #target cb_target run scoreboard players set #exists cb_target 1
execute if score #exists cb_target matches 0 run return run function zbk:map_elements/crafting_bench/build/cancel
scoreboard players operation @s cb_time = #now cb_stamp
scoreboard players operation @s cb_time -= @s cb_start
