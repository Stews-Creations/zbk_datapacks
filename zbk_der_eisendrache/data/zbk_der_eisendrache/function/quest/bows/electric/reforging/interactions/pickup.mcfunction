# The validated owner claims quest progress, not an inventory weapon.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 3 run return 0
scoreboard players set #electric de_el_progress 4
scoreboard players set #sequence de_er_state 3
scoreboard players set @e[type=marker,tag=de_er_marker] de_er_state 3
function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
execute at @s run function zbk_der_eisendrache:events/quest_inventory_tick
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_pickup master @s ~ ~ ~ 1 1
tellraw @s[tag=debug] {"text":"Reforged arrow collected. Electric quest circle complete!","color":"aqua"}
