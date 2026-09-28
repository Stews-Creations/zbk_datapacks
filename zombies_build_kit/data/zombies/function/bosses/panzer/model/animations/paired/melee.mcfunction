# Plays melee on the display paired to this Panzer controller.
# Runs as: panzer_ai iron golem.

execute unless score @s panzer_id matches 1.. run return 0
scoreboard players operation #temp_pid panzer_id = @s panzer_id
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root,distance=..16] if score @s panzer_id = #temp_pid panzer_id run function zombies:bosses/panzer/model/animations/play/melee
