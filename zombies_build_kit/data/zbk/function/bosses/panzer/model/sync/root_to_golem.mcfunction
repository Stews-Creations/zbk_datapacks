# Runs as: the paired panzer_ai golem

scoreboard players set #panzer_found panzer_id 1
execute at @s rotated as @s run tp @e[type=item_display,tag=panzer_syncing,limit=1] ~ ~ ~ ~ 0
