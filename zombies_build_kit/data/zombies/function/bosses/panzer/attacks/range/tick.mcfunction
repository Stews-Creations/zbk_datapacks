# Ticks the current electric throw attack window.
# Runs as and at: panzer_ai iron golem.

execute unless entity @s[tag=panzer_range_attack] run return 0
execute if score @s panzer_attack_timer matches 1.. run scoreboard players remove @s panzer_attack_timer 1
execute if score @s panzer_attack_timer matches 18 if entity @p[gamemode=adventure,team=!downed,distance=..34,sort=nearest,limit=1] positioned ~ ~1.55 ~ facing entity @p[gamemode=adventure,team=!downed,distance=..34,sort=nearest,limit=1] eyes positioned ^0.65 ^0.1 ^1.1 run function zombies:bosses/panzer/attacks/range/projectile/spawn
execute if score @s panzer_attack_timer matches ..0 run function zombies:bosses/panzer/attacks/shared/finish_attack
