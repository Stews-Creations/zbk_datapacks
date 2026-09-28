# Ask the normal relocation system to recover this Panzer if it drifts away from all active players.
# Runs as and at: panzer_ai iron golem.

execute if score @s panzer_relocation_cooldown matches 1.. run scoreboard players remove @s panzer_relocation_cooldown 1
execute if score @s panzer_relocation_cooldown matches 1.. run return 0

execute if entity @a[gamemode=adventure,team=!downed] unless entity @a[gamemode=adventure,team=!downed,distance=..45] at @p[gamemode=adventure,team=!downed,sort=nearest,limit=1] run function zbk:behavior/relocation/create_anchor
execute if entity @a[gamemode=adventure,team=!downed] unless entity @a[gamemode=adventure,team=!downed,distance=..45] run scoreboard players set @s panzer_relocation_cooldown 20
