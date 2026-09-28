# Reserve airborne sneak for an unused anti-gravity air jump.
execute unless score #active zbk.de matches 1 run return 0
execute if entity @s[tag=de_ag_air_jump_ready,nbt={OnGround:0b}] run return 1
return 0
