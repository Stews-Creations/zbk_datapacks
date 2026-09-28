# Scheduled callback: reverse the 220-tick close movement at the same speed.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_door rkt_door_timer matches 1.. run return 0

execute as @e[type=minecraft:block_display,tag=rocket_test_door_opening,tag=rocket_test_door_x,tag=rocket_test_door_left] at @s run tp @s ~-0.01590909090909091 ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_opening,tag=rocket_test_door_x,tag=rocket_test_door_right] at @s run tp @s ~0.01590909090909091 ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_opening,tag=rocket_test_door_z,tag=rocket_test_door_left] at @s run tp @s ~ ~ ~-0.01590909090909091
execute as @e[type=minecraft:block_display,tag=rocket_test_door_opening,tag=rocket_test_door_z,tag=rocket_test_door_right] at @s run tp @s ~ ~ ~0.01590909090909091

scoreboard players remove #rocket_test_door rkt_door_timer 1
function zbk_der_eisendrache:rocket_test_launch/doors/collision/retreat_open
execute if score #rocket_test_door rkt_door_timer matches 0 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=3}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/animations/finish_open
execute if score #rocket_test_door rkt_door_timer matches 1.. run schedule function zbk_der_eisendrache:rocket_test_launch/doors/animations/open_tick 1t replace
