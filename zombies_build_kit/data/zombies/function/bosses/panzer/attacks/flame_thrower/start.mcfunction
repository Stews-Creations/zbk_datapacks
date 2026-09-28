# Starts the medium-range Panzer flamethrower attack.
# Runs as and at: panzer_ai iron golem.

scoreboard players set @s panzer_attack_cooldown 90
scoreboard players set @s panzer_attack_timer 34
tag @s add panzer_attacking
tag @s add panzer_flame_attack
function zombies:bosses/panzer/model/animations/paired/flame_thrower
playsound zbk:mob.panzer.flamethrower_burst hostile @a[distance=..48] ~ ~ ~ 0.95 1
playsound zbk:mob.panzer.flamethrower_loop hostile @a[distance=..48] ~ ~ ~ 0.75 1
