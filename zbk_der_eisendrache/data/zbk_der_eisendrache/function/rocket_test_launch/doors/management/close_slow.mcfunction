# Sequence close: begin 20 ticks before the countdown and finish at the burn.
execute unless score #active zbk.de matches 1 run return 0
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/collision/finalize_close
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/close_slow_tick
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/open_tick
tag @e[tag=rocket_test_door_closing] remove rocket_test_door_closing
tag @e[tag=rocket_test_door_opening] remove rocket_test_door_opening

execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel] run data merge entity @s {teleport_duration:1}
execute as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=1}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/animations/prepare_slow_close

scoreboard players set #rocket_test_door rkt_door_timer 240
schedule function zbk_der_eisendrache:rocket_test_launch/doors/animations/close_slow_tick 1t replace
