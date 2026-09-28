execute unless score @s rs_edit matches 1.. run return 0
scoreboard players operation #rs_edit rs_candidate = @s rs_edit
execute at @s as @e[type=marker,tag=rs_part_candidate,distance=..5] if score @s rs_candidate = #rs_edit rs_candidate at @s run function zombies:map_elements/rocket_shield/management/delete_candidate
scoreboard players reset @s rs_edit
