# Authoring command: look at the wall block to register it (up to 6 blocks away).
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"[Electric Bow] Select Der Eisendrache first.","color":"red"}
execute unless dimension minecraft:overworld run return run tellraw @s {"text":"[Electric Bow] Place this Der Eisendrache quest in the overworld.","color":"red"}
execute unless entity @e[type=marker,tag=de_el_vane_marker,distance=..32] run return run tellraw @s {"text":"[Electric Bow] Stand within 32 blocks of the placed vane.","color":"yellow"}
execute if entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1..}] run return run tellraw @s {"text":"[Electric Bow] Reset the vane quest before editing its wall.","color":"yellow"}
scoreboard players set #de_el_select temp 0
# Discard inherited command position/rotation before applying eye height once.
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/look
