# Delete the nearest configured rocket-test door within 5 blocks.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door,distance=..5,sort=nearest,limit=1] run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"No door marker found within 5 blocks.","color":"red"}]
execute as @e[type=minecraft:marker,tag=rocket_test_door,distance=..5,sort=nearest,limit=1] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/management/delete
tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"Nearest door deleted.","color":"green"}]
