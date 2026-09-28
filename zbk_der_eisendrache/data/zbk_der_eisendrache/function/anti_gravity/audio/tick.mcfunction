# Audio follows elapsed real time instead of the room's gameplay tick timers.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #room de_ag_state matches 1 run return 0
execute unless score #audio_next de_ag_cycle matches 1.. run return 0
execute if score #stopping de_ag_cycle matches 1 run return 0

execute store result score #audio_elapsed de_ag_cycle run stopwatch query zbk_der_eisendrache:anti_gravity/audio 1000
execute if score #audio_elapsed de_ag_cycle >= #audio_next de_ag_cycle run function zbk_der_eisendrache:anti_gravity/audio/play_loop
