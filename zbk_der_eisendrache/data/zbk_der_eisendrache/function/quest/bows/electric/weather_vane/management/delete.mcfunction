# Operator command: remove the unique placement and its derived displays.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"[Electric Bow] Select Der Eisendrache before deleting its vane placement.","color":"red"}
execute unless entity @e[type=marker,tag=de_el_vane_marker] run return run tellraw @s {"text":"[Electric Bow] Load the vane placement before editing its configuration.","color":"yellow"}
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
execute if score @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls matches 1.. unless score #de_el_count temp = @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls run return run tellraw @s {"text":"[Electric Bow] Load every marked wall block before deleting its configuration.","color":"red"}
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/cleanup
# Do not discard snapshots if a broken wall could not be restored.
execute if entity @e[type=marker,tag=de_el_wall_marker,scores={de_el_broken=1}] run return run tellraw @s {"text":"[Electric Bow] Wall restoration is pending. Wait for storage to load, then retry.","color":"red"}
kill @e[type=marker,tag=de_el_vane_marker]
kill @e[type=marker,tag=de_el_wall_marker]
kill @e[type=marker,tag=de_el_arrow_marker]
tellraw @s {"text":"[Electric Bow] Vane, wall-block markers and arrow placement removed; wall restored.","color":"green"}
