# Clears the current Panzer attack and returns the model to walking.
# Runs as and at: panzer_ai iron golem.

tag @s remove panzer_melee_attack
tag @s remove panzer_flame_attack
tag @s remove panzer_range_attack
tag @s remove panzer_attacking
scoreboard players set @s panzer_attack_timer 0
function zbk:bosses/panzer/model/animations/paired/walk
