# The model test turns only the head: 4.5 degrees per tick, 80 ticks per revolution.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_el_wall_marker,scores={de_el_broken=1}] unless entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1..3}] at @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/restore with entity @s data
execute as @e[type=item_display,tag=de_el_vane_head,tag=de_el_vane_spinning] unless entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1}] at @s run tp @s ~ ~ ~ ~4.5 0
execute as @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1}] at @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/animations/reveal_tick
execute as @e[type=interaction,tag=de_el_vane_target] at @s if data entity @s interaction.player run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/use
