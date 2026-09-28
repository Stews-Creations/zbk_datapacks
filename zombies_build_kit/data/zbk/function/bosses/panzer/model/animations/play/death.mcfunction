# Starts the Panzer death animation once.
# Runs as: Panzer Animated Java root entity

execute if entity @s[tag=panzer_dying] run return 0
tag @s add panzer_dying
execute at @s run playsound zbk:mob.panzer.death hostile @a[distance=..64] ~ ~ ~ 1 1
function animated_java:de_panzer/animations/animation_model_die/play
