# Bow trigger lock countdown - runs every tick via bow_cooldown advancement
scoreboard players remove @s bow_trigger_lock 1
execute if score @s bow_trigger_lock matches 1.. run return run advancement revoke @s only zbk_der_eisendrache:bow_cooldown
scoreboard players reset @s bow_trigger_lock
