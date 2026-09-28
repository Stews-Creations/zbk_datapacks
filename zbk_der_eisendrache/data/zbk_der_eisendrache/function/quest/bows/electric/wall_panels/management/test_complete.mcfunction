# Temporary operator shortcut; bypass the wall-run challenge for the executing player.
execute unless entity @s[type=minecraft:player,scores={id=1..}] run return 0
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before completing the panel test.","color":"yellow"}
execute at @s unless dimension minecraft:overworld run return 0

execute at @s run function zbk_der_eisendrache:quest/bows/binding/management/unbind
scoreboard players operation #1 de_bow_owner = @s id
# Complete through the panel milestone without reducing later saved progress.
execute unless score #electric de_el_progress matches 2.. run scoreboard players set #electric de_el_progress 2
execute at @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/initialize
scoreboard players set @s de_hud_preview 0
execute at @s run function zbk_der_eisendrache:events/quest_inventory_tick
tellraw @s {"text":"Panel step complete for testing. All five panels are lit and the second quest segment is complete.","color":"aqua"}
