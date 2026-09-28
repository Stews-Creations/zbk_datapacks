# Scheduled callback after the 10-tick visual closing animation.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=tram_platform_door,scores={tram_door_state=0}] at @s run function zbk_der_eisendrache:tram/doors/collision/close
