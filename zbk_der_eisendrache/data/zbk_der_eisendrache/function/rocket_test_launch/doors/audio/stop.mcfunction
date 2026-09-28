# Runs as one door marker at its real movement completion.
execute unless entity @s[tag=rocket_test_door_audio_active] run return 0
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/audio/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_moving_lp
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_stop master @a[distance=..40] ~ ~ ~ 4 1 1
tag @s remove rocket_test_door_audio_active
