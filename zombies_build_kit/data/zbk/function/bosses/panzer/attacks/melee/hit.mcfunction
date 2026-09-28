# Applies the active melee hit near the Panzer claw sweep.
# Runs as and at: panzer_ai iron golem.

tag @s add rs_attack_source
execute positioned ^ ^0.8 ^2.2 as @p[gamemode=adventure,team=!downed,distance=..2.35,sort=nearest,limit=1] run function zbk:bosses/panzer/attacks/melee/damage

tag @s remove rs_attack_source
