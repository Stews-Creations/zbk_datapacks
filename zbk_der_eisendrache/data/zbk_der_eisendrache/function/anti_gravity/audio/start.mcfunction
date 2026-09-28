# Begin room audio only for players currently inside anti-gravity.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #room de_ag_state matches 1 run return 0

stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_loop
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_stop
stopwatch create zbk_der_eisendrache:anti_gravity/audio
stopwatch restart zbk_der_eisendrache:anti_gravity/audio
scoreboard players set #audio_next de_ag_cycle 900
execute as @a[tag=de_ag_inside] at @s run playsound zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_start player @s ~ ~ ~ 0.25 1
