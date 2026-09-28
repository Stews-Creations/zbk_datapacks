# Scheduled callbacks recheck ownership before moving entities or playing sound.
execute unless score #active zbk.de matches 1 run return 0

# Play the LP once, 40 ticks (2 seconds) after door movement begins.
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door_audio_active] run return 0
execute as @e[type=minecraft:marker,tag=rocket_test_door,tag=rocket_test_door_audio_active] at @s run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_moving_lp master @a[distance=..40] ~ ~ ~ 4 1 1
