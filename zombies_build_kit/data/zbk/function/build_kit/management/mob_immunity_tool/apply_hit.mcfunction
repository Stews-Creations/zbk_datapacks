# Apply current tool mode to the mob just hit by the player.
# Runs as the player from the melee hit advancement.

advancement revoke @s only zbk:hit_game_enemy
tag @s add mob_immunity_tool_user
tag @e[tag=mob_immunity_tool_target] remove mob_immunity_tool_target
execute at @s as @e[type=!#zbk:not_mob,distance=..6] store result score @s mob_immunity_tool_hurt run data get entity @s HurtTime
execute at @s run tag @e[type=!#zbk:not_mob,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] add mob_immunity_tool_target
execute at @s unless entity @e[tag=mob_immunity_tool_target,limit=1] run tag @e[type=!#zbk:not_mob,distance=..4,limit=1,sort=nearest] add mob_immunity_tool_target

execute unless entity @e[tag=mob_immunity_tool_target,limit=1] run tellraw @s [{"text":"[Mob Immunity] ","color":"gold"},{"text":"No mob hit detected.","color":"red"}]
execute unless entity @e[tag=mob_immunity_tool_target,limit=1] run tag @s remove mob_immunity_tool_user
execute unless entity @e[tag=mob_immunity_tool_target,limit=1] run return 0

execute as @e[tag=mob_immunity_tool_target,limit=1] run function zbk:build_kit/management/mob_immunity_tool/restore_health

execute if score @s mob_immunity_tool_mode matches 0 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_guns
execute if score @s mob_immunity_tool_mode matches 1 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_explosives
execute if score @s mob_immunity_tool_mode matches 2 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_elements
execute if score @s mob_immunity_tool_mode matches 3 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_nuke
execute if score @s mob_immunity_tool_mode matches 4 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_melee
execute if score @s mob_immunity_tool_mode matches 5 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_guns
execute if score @s mob_immunity_tool_mode matches 5 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_explosives
execute if score @s mob_immunity_tool_mode matches 5 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_elements
execute if score @s mob_immunity_tool_mode matches 5 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_nuke
execute if score @s mob_immunity_tool_mode matches 5 as @e[tag=mob_immunity_tool_target,limit=1] run tag @s add immune_melee
execute if score @s mob_immunity_tool_mode matches 6 as @e[tag=mob_immunity_tool_target,limit=1] run function zbk:build_kit/management/mob_immunity_tool/clear_target
execute if score @s mob_immunity_tool_mode matches 7 as @e[tag=mob_immunity_tool_target,limit=1] at @s run function zbk:build_kit/management/mob_immunity_tool/check_target
execute as @e[tag=mob_immunity_tool_target,limit=1] at @s run function zbk:build_kit/management/mob_immunity_tool/announce_target

execute as @e[tag=mob_immunity_tool_target,limit=1] at @s run particle minecraft:enchanted_hit ~ ~1 ~ 0.25 0.4 0.25 0.02 12 force
scoreboard players reset @e[tag=mob_immunity_tool_target,limit=1] mob_immunity_tool_hurt
execute as @e[tag=mob_immunity_tool_target,limit=1] run tag @s remove mob_immunity_tool_target
tag @s remove mob_immunity_tool_user
