# Der Eisendrache uses its intro video when the required camera armor stand exists.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket/management/ensure_ready
execute unless score #rocket_ready global matches 1 run return 0
execute if entity @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1] run scoreboard players set #map_start_intercepted global 1
execute if score #map_start_intercepted global matches 1 run function zbk_der_eisendrache:intro_cutscene/management/start
execute unless entity @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1] run tellraw @a [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Missing intro_cutscene armor stand; using normal start cutscene flow.","color":"yellow"}]
