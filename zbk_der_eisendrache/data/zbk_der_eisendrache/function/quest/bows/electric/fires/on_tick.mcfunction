execute unless score #active zbk.de matches 1 run return 0
scoreboard players add #de_el_fire_fx temp 1
execute if score #de_el_fire_fx temp matches 2.. run scoreboard players set #de_el_fire_fx temp 0
scoreboard players add #de_el_fire_smoke temp 1
execute if score #de_el_fire_smoke temp matches 10.. run scoreboard players set #de_el_fire_smoke temp 0
execute as @e[type=marker,tag=de_el_fire_marker] at @s run function zbk_der_eisendrache:quest/bows/electric/fires/display/sync with entity @s data
execute as @e[type=interaction,tag=de_el_fire_target] at @s if data entity @s interaction.player run function zbk_der_eisendrache:quest/bows/electric/fires/interactions/use
