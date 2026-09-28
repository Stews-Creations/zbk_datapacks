# @s is the victim at its actual death position; #map_killer temp is the credited stable player ID.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @s[type=zombified_piglin,tag=wave_enemy,tag=!combat_ignore,tag=!turned_zombie] run return 0
execute if entity @s[tag=map_kill_reported] run return 0
tag @s add map_kill_reported
function zbk_der_eisendrache:quest/souls/accept
