# End active audio and play the shutdown clip only for players still inside.
scoreboard players set #audio_next de_ag_cycle 0
stopwatch remove zbk_der_eisendrache:anti_gravity/audio
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_start
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_loop
execute as @a[tag=de_ag_inside] at @s run playsound zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_stop player @s ~ ~ ~ 0.25 1
