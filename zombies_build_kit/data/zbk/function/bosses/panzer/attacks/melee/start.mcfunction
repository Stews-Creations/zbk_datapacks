# Starts the close-range Panzer melee attack.
# Runs as and at: panzer_ai iron golem.

scoreboard players set @s panzer_attack_cooldown 35
scoreboard players set @s panzer_attack_timer 22
tag @s add panzer_attacking
tag @s add panzer_melee_attack
function zbk:bosses/panzer/model/animations/paired/melee
playsound zbk:mob.panzer.melee hostile @a[distance=..48] ~ ~ ~ 1 1
