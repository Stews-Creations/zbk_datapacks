# Remove the Panzer controller paired to this Animated Java root.
# Runs as: aj.de_panzer.root item_display

execute unless entity @s[tag=aj.de_panzer.root] run return 0
execute unless score @s panzer_id matches 1.. run return 0
scoreboard players operation #temp_pid panzer_id = @s panzer_id
execute as @e[type=minecraft:iron_golem,tag=panzer_ai] if score @s panzer_id = #temp_pid panzer_id run kill @s
