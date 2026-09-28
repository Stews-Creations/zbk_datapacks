# Direct damage from standing in the Panzer flamethrower stream.
# Runs as and at: hit player.

execute unless entity @s[gamemode=adventure,team=!downed] run return 0
damage @s 8 minecraft:generic
scoreboard players set @s panzer_burn_damage_cooldown 10
playsound minecraft:entity.generic.burn player @s ~ ~ ~ 0.7 1.25
