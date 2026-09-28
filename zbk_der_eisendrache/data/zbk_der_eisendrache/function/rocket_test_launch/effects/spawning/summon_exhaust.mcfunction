# Place the persistent exhaust anchor at the launch-pad floor center.
execute unless score #active zbk.de matches 1 run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Effects] ","color":"gold"},{"text":"Select Der Eisendrache before placing the exhaust anchor.","color":"red"}]

kill @e[type=minecraft:marker,tag=rocket_test_exhaust]
summon minecraft:marker ~ ~ ~ {Tags:["rocket_test_exhaust"]}
tellraw @s[tag=debug] [{"text":"[Rocket Test Effects] ","color":"gold"},{"text":"Exhaust anchor placed. The engine layer begins 10 blocks above this point.","color":"green"}]
