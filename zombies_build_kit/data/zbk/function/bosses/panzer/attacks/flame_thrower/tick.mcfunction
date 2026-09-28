# Ticks the current flamethrower attack window.
# Runs as and at: panzer_ai iron golem.

execute unless entity @s[tag=panzer_flame_attack] run return 0
execute if score @s panzer_attack_timer matches 1.. run scoreboard players remove @s panzer_attack_timer 1
execute if score @s panzer_attack_timer matches 10..22 positioned ~ ~1.95 ~ facing entity @p[gamemode=adventure,team=!downed,distance=..12,sort=nearest,limit=1] eyes positioned ^-0.95 ^0 ^0.75 run function zbk:bosses/panzer/attacks/flame_thrower/stream
execute if score @s panzer_attack_timer matches ..0 run function zbk:bosses/panzer/attacks/shared/finish_attack
