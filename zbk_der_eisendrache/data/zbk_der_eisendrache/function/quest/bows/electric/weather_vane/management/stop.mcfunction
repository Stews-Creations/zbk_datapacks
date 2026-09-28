execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"[Electric Bow] The vane spin test requires Der Eisendrache.","color":"red"}
tag @e[type=item_display,tag=de_el_vane_head] remove de_el_vane_spinning
tellraw @s {"text":"[Electric Bow] Vane stopped at its current angle.","color":"green"}
