# Restore and unregister all wall blocks, retaining the vane and pickup placement.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=marker,tag=de_el_vane_marker] run return run tellraw @s {"text":"[Electric Bow] Load the vane placement before editing its configuration.","color":"yellow"}
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
execute if score @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls matches 1.. unless score #de_el_count temp = @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls run return run tellraw @s {"text":"[Electric Bow] Load every marked wall block before deleting its configuration.","color":"red"}
function zbk_der_eisendrache:quest/bows/electric/weather_vane/initialize
execute if entity @e[type=marker,tag=de_el_wall_marker,scores={de_el_broken=1}] run return run tellraw @s {"text":"[Electric Bow] Wall restoration is pending; retry in a moment.","color":"red"}
kill @e[type=marker,tag=de_el_wall_marker]
scoreboard players set @e[type=marker,tag=de_el_vane_marker] de_el_walls 0
tellraw @s {"text":"[Electric Bow] Wall blocks restored and unmarked.","color":"green"}
