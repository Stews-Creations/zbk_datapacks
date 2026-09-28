# Runs once per tick as a moving tram root.
execute if score @s tram_motor_timer matches 1.. run scoreboard players remove @s tram_motor_timer 1
execute if score @s tram_motor_timer matches 0 run function zbk_der_eisendrache:tram/route/audio/play_loop
