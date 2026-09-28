# Applies Panzer flamethrower contact to a player in the cone.
# Runs as: hit player, at the hit player.

execute unless entity @s[gamemode=adventure,team=!downed] run return 0
tag @s add panzer_burning
scoreboard players set @s panzer_burn_timer 40
execute unless score @s panzer_burn_damage_cooldown matches 1.. run function zbk:bosses/panzer/attacks/flame_thrower/direct_damage
particle minecraft:flame ~ ~1 ~ 0.25 0.5 0.25 0.04 8 force
particle minecraft:smoke ~ ~1 ~ 0.18 0.35 0.18 0.015 3 force
