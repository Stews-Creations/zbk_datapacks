# Replay the 5.865-second LP with a small overlap to cover tick quantization.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #room de_ag_state matches 1 run return 0
execute unless score #audio_next de_ag_cycle matches 1.. run return 0
execute if score #stopping de_ag_cycle matches 1 run return 0

stopwatch restart zbk_der_eisendrache:anti_gravity/audio
scoreboard players set #audio_next de_ag_cycle 5750
execute as @a[tag=de_ag_inside] at @s run playsound zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_loop player @s ~ ~ ~ 0.20 1
