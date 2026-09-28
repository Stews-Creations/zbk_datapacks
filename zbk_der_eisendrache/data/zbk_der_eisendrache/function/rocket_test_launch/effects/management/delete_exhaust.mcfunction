# Delete the persistent exhaust anchor nearest the executor.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=rocket_test_exhaust,distance=..8,sort=nearest,limit=1] run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Effects] ","color":"gold"},{"text":"No exhaust anchor found within 8 blocks.","color":"red"}]
kill @e[type=minecraft:marker,tag=rocket_test_exhaust,distance=..8,sort=nearest,limit=1]
tellraw @s[tag=debug] [{"text":"[Rocket Test Effects] ","color":"gold"},{"text":"Exhaust anchor deleted.","color":"green"}]
