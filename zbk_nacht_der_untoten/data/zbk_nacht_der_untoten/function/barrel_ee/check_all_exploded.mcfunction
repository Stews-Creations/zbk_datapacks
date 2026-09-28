execute if score #ee_barrel zbk.nacht matches 1 run return 0
execute if entity @e[type=minecraft:marker,tag=explosive_barrel,tag=!explosive_barrel_exploded] run return 0
scoreboard players set #ee_barrel zbk.nacht 1
function zbk_nacht_der_untoten:sounds/play/radio_stop
stopsound @a music
function zbk_nacht_der_untoten:sounds/play/ee_barrel
