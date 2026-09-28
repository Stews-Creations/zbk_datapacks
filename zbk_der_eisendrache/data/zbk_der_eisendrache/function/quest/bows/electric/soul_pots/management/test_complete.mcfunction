# Temporary operator shortcut: complete the charged-fire milestone for the executing player.
execute unless entity @s[type=minecraft:player,scores={id=1..}] run return 0
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before completing the electric-fire test.","color":"yellow"}
execute at @s unless dimension minecraft:overworld run return 0
execute at @s run function zbk_der_eisendrache:quest/bows/binding/management/unbind
scoreboard players operation #1 de_bow_owner = @s id
execute unless score #electric de_el_progress matches 3.. run scoreboard players set #electric de_el_progress 3
scoreboard players set #1 de_es_souls 8
scoreboard players set #1 de_ec_used 1
scoreboard players set #1 de_ec_fire 1
scoreboard players set #1 de_el_fire_lit 1
scoreboard players set #2 de_es_souls 8
scoreboard players set #2 de_ec_used 1
scoreboard players set #2 de_ec_fire 1
scoreboard players set #2 de_el_fire_lit 1
scoreboard players set #3 de_es_souls 8
scoreboard players set #3 de_ec_used 1
scoreboard players set #3 de_ec_fire 1
scoreboard players set #3 de_el_fire_lit 1
execute at @s run function zbk_der_eisendrache:quest/bows/electric/soul_pots/initialize
execute at @s run function zbk_der_eisendrache:quest/bows/electric/fires/on_tick
execute at @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/initialize
scoreboard players set @s de_hud_preview 0
execute at @s run function zbk_der_eisendrache:events/quest_inventory_tick
tellraw @s {"text":"Electric-fire stage complete for testing: all three pots used, all three tornadoes electric, third quest segment complete.","color":"aqua"}
