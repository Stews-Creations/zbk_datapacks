# Authoring-only ray, independent of weapon shooting.
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air align xyz run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/place_here
scoreboard players add #de_el_select temp 1
execute if score #de_el_select temp matches ..60 positioned ^ ^ ^0.1 run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/look
tellraw @s {"text":"[Electric Bow] Look at a solid wall block within 6 blocks.","color":"yellow"}
