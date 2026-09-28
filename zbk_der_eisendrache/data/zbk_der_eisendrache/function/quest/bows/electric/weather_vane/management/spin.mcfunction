# Continuous visual test, stopped explicitly or by initialization/map cleanup.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"[Electric Bow] The vane spin test requires Der Eisendrache.","color":"red"}
execute unless entity @e[type=item_display,tag=de_el_vane_head] run return run tellraw @s {"text":"[Electric Bow] Place the weather vane first.","color":"yellow"}
tag @e[type=item_display,tag=de_el_vane_head] add de_el_vane_spinning
tellraw @s {"text":"[Electric Bow] Vane spin test started: one turn every 4 seconds.","color":"green"}
