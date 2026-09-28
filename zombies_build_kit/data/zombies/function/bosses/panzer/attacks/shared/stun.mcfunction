# Cancel the active attack and freeze the paired model in its idle walk pose.
# Storm capture owns NoAI, NoGravity and the zbk.enemy_stunned lifetime.
function zombies:bosses/panzer/attacks/shared/finish_attack
execute unless score @s panzer_id matches 1.. run return 0
scoreboard players operation #temp_pid panzer_id = @s panzer_id
execute as @e[type=item_display,tag=aj.de_panzer.root,distance=..16,tag=!panzer_dying] if score @s panzer_id = #temp_pid panzer_id run tag @s remove panzer_landing_to_walk
execute as @e[type=item_display,tag=aj.de_panzer.root,distance=..16,tag=!panzer_dying] if score @s panzer_id = #temp_pid panzer_id run function animated_java:de_panzer/animations/pause_all
