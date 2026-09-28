# Ticks the current melee attack window.
# Runs as and at: panzer_ai iron golem.

execute unless entity @s[tag=panzer_melee_attack] run return 0
execute if score @s panzer_attack_timer matches 1.. run scoreboard players remove @s panzer_attack_timer 1
execute if score @s panzer_attack_timer matches 14 run function zombies:bosses/panzer/attacks/melee/hit
execute if score @s panzer_attack_timer matches ..0 run function zombies:bosses/panzer/attacks/shared/finish_attack
