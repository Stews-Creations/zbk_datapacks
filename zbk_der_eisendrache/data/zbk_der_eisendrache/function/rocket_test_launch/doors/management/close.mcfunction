# Close every configured rocket-test door and add collision when movement finishes.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel] run data merge entity @s {teleport_duration:56}
execute as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=1}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/animations/close
schedule function zbk_der_eisendrache:rocket_test_launch/doors/collision/finalize_close 56t replace
