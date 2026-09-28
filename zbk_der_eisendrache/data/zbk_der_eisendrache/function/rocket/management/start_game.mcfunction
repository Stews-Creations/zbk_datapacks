# Launch the rocket only while Der Eisendrache is the active provider.
execute unless score #active zbk.de matches 1 run return 0

scoreboard players set #rocket rocket_launch 1
scoreboard players set #rocket rocket_height 0
execute as @e[type=minecraft:block_display,tag=rocket_move] run data merge entity @s {teleport_duration:1}
execute as @a at @s run playsound zbk_der_eisendrache:der_eisendrache.rocket.rocket_liftoff master @s ~ ~ ~ 0.75 1
