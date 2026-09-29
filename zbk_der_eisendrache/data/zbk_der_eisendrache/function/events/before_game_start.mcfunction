execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket/management/ensure_ready
execute unless score #rocket_ready global matches 1 run return run function zbk:global/events/request/block
execute if data storage zbk:events stack[-1].context{resuming:1} run return 0
execute if data storage zbk:events stack[-1].context{skip_cutscene:1} run return 0
execute if entity @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1] run function zbk:global/events/request/defer {owner:"zbk_der_eisendrache"}
execute unless entity @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1] run tellraw @a[tag=debug] [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Missing intro_cutscene armor stand; continuing without the map intro.","color":"yellow"}]
