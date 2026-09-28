# Fill the closed seven-block-wide, 16-block-tall doorway with barrier collision.
execute if entity @s[tag=rocket_test_door_north] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:barrier keep
execute if entity @s[tag=rocket_test_door_south] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:barrier keep
execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:barrier keep
execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:barrier keep
