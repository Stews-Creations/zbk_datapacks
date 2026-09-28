# Starts the long-range Panzer electric throw attack.
# Runs as and at: panzer_ai iron golem.

scoreboard players set @s panzer_attack_cooldown 85
scoreboard players set @s panzer_attack_timer 30
tag @s add panzer_attacking
tag @s add panzer_range_attack
function zombies:bosses/panzer/model/animations/paired/range_attack
