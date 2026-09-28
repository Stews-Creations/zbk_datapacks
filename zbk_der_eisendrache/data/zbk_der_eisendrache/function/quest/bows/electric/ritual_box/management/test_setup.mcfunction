execute unless entity @s[type=minecraft:player,scores={id=1..}] run return 0
execute unless score #active zbk.de matches 1 run return 0
execute at @s unless dimension minecraft:overworld run return 0
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/reset
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/test_complete
scoreboard players set #electric de_el_progress 4
scoreboard players set #sequence de_er_state 3
function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
execute at @s run function zbk_der_eisendrache:events/quest_inventory_tick
function zbk_der_eisendrache:quest/bows/electric/ritual_box/initialize
tellraw @s {"text":"Ritual box test ready: full quest circle, empty box. Interact to place the arrow, then collect 15 souls.","color":"aqua"}
