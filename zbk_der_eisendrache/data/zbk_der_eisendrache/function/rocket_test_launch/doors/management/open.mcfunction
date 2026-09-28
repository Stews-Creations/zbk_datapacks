# Open every configured rocket-test door by reversing the slow close movement.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket_test_launch/audio/doors_open
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/collision/finalize_close
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/close_slow_tick
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/open_tick
scoreboard players set #rocket_test_door rkt_door_timer 220
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel] run data merge entity @s {teleport_duration:1}
execute as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=0}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/animations/open
execute as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/animations/open
tag @e[tag=rocket_test_door_closing] remove rocket_test_door_closing
execute if entity @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=3}] run schedule function zbk_der_eisendrache:rocket_test_launch/doors/animations/open_tick 1t replace
