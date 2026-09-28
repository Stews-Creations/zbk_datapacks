# Award melee hit points only if attack was fully charged (>= 13 ticks)
# Netherite sword attack speed = 1.6/sec = 12.5 ticks for full charge (rounded to 13)
execute if items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run function zombies:build_kit/management/mob_immunity_tool/apply_hit
execute if items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run scoreboard players set @s melee_timer 0
execute if items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run return 0

# Cancel knife damage and points when the struck mob has melee immunity.
scoreboard players reset @e[tag=immune_melee,distance=..6] mob_immunity_tool_hurt
execute at @s as @e[type=!#zombies:not_mob,tag=immune_melee,distance=..6] store result score @s mob_immunity_tool_hurt run data get entity @s HurtTime
execute at @s if entity @e[tag=immune_melee,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] as @e[tag=immune_melee,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] run function zombies:build_kit/management/mob_immunity_tool/restore_health
execute at @s if entity @e[tag=immune_melee,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] run scoreboard players set @s melee_timer 0
execute at @s if entity @e[tag=immune_melee,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] run advancement revoke @s only zombies:hit_game_enemy
execute at @s if entity @e[tag=immune_melee,distance=..6,scores={mob_immunity_tool_hurt=1..},limit=1,sort=nearest] run return 0
execute if score @s melee_timer matches 13.. run function zombies:player/points/add_hit_points

# Reset timer on any hit (charged or not)
scoreboard players set @s melee_timer 0

# Revoke advancement (handles uncharged case where add_hit_points wasn't called)
advancement revoke @s only zombies:hit_game_enemy
