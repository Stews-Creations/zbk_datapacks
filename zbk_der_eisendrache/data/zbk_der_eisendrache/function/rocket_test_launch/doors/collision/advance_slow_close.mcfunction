# Advance collision after the visual leaves cross each half-block boundary.
# The 240-tick movement covers 3.5 blocks, so rounded-up thresholds occur after
# 35, 69, 103, 138, 172, 206, and 240 movement ticks.
execute if score #rocket_test_door rkt_door_timer matches 205 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_half {negative:-3,positive:3}
execute if score #rocket_test_door rkt_door_timer matches 171 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_full {negative:-3,positive:3}
execute if score #rocket_test_door rkt_door_timer matches 137 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_half {negative:-2,positive:2}
execute if score #rocket_test_door rkt_door_timer matches 102 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_full {negative:-2,positive:2}
execute if score #rocket_test_door rkt_door_timer matches 68 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_half {negative:-1,positive:1}
execute if score #rocket_test_door rkt_door_timer matches 34 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_full {negative:-1,positive:1}
execute if score #rocket_test_door rkt_door_timer matches 0 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/place_full {negative:0,positive:0}
