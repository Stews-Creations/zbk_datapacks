# Runs as: the player hit by Panzer melee.

execute unless entity @s[gamemode=adventure,team=!downed] run return 0
execute store result score #rs_blocked temp run function zbk:combat/weapons/special_equipment/rocket_shield/protection/try_block
execute if score #rs_blocked temp matches 1 run return 0
damage @s 10 minecraft:generic
execute at @s run playsound minecraft:entity.player.hurt player @s ~ ~ ~ 1 0.8
execute at @s run particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.4 0.3 0.05 8 force
