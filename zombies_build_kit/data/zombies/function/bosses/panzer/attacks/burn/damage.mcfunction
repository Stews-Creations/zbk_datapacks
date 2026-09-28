# Lingering Panzer burn damage.
# Runs as and at: burning player.

execute unless entity @s[gamemode=adventure,team=!downed] run return 0
damage @s 5 minecraft:generic
scoreboard players set @s panzer_burn_damage_cooldown 12
playsound minecraft:entity.generic.burn player @s ~ ~ ~ 0.45 1.4
