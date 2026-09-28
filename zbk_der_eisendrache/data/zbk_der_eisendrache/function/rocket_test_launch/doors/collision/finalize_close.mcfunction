# Scheduled callback after the 56-tick visual closing animation.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=0}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/close
execute as @e[type=minecraft:marker,tag=rocket_test_door,tag=rocket_test_door_audio_active,scores={rkt_door_state=0}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/audio/stop
