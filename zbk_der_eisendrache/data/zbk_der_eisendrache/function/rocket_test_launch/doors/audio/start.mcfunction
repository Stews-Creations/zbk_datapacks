# Runs as one door marker when a real opening or closing movement starts.
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_moving_lp
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_start master @a[distance=..40] ~ ~ ~ 4 1 1
tag @s add rocket_test_door_audio_active
schedule function zbk_der_eisendrache:rocket_test_launch/doors/audio/play_loop 40t replace
