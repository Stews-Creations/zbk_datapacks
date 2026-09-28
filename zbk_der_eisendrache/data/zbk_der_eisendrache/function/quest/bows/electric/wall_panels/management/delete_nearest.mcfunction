execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_el_panel_marker,distance=..8] run return run tellraw @s {"text":"Stand within 8 blocks of the wind panel to remove.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/management/delete with entity @e[type=marker,tag=de_el_panel_marker,distance=..8,sort=nearest,limit=1] data
