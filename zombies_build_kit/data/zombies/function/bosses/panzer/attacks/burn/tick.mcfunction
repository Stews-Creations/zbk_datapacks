# Per-player Panzer burn timer.
# Runs as and at: player.

execute if score @s panzer_burn_damage_cooldown matches 1.. run scoreboard players remove @s panzer_burn_damage_cooldown 1
execute if entity @s[team=downed] run scoreboard players set @s panzer_burn_timer 0
execute if entity @s[team=downed] run tag @s remove panzer_burning
execute unless entity @s[gamemode=adventure,team=!downed] run return 0
execute unless score @s panzer_burn_timer matches 1.. run return 0

scoreboard players remove @s panzer_burn_timer 1
particle minecraft:flame ~ ~1 ~ 0.25 0.5 0.25 0.025 4 force
particle minecraft:smoke ~ ~1.1 ~ 0.18 0.35 0.18 0.01 2 force
execute if score @s panzer_burn_timer matches 1.. unless score @s panzer_burn_damage_cooldown matches 1.. run function zombies:bosses/panzer/attacks/burn/damage
execute unless score @s panzer_burn_timer matches 1.. run tag @s remove panzer_burning
