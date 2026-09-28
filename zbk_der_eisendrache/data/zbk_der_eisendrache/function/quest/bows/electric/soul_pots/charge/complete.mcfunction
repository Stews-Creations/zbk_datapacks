execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 2 run return 0
scoreboard players set #electric de_el_progress 3
playsound minecraft:entity.lightning_bolt.impact master @a[distance=..48] ~ ~ ~ 0.6 1.5
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.fire_ignite master @s ~ ~ ~ 1 1
execute at @s run function zbk_der_eisendrache:events/quest_inventory_tick
tellraw @s[tag=debug] {"text":"All three electric tornadoes complete. Third quest segment filled!","color":"aqua"}
