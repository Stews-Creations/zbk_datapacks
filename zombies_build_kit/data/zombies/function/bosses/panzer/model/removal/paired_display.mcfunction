# Play death animation on the paired Panzer display when this Panzer controller dies.
# Runs as: the dying panzer_ai iron golem

execute if entity @s[tag=panzer_dying] run return 0
execute unless score @s panzer_id matches 1.. run return 0
tag @s add panzer_dying
tag @s remove raycast_hit
scoreboard players operation #temp_pid panzer_id = @s panzer_id
scoreboard players set #panzer_display_found panzer_id 0
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root] if score @s panzer_id = #temp_pid panzer_id run scoreboard players set #panzer_display_found panzer_id 1
execute if score #panzer_display_found panzer_id matches 0 run return run kill @s
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root] if score @s panzer_id = #temp_pid panzer_id run function zombies:bosses/panzer/model/animations/play/death
