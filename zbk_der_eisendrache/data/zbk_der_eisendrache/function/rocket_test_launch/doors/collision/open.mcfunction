# Remove only door-owned collision blocks inside this configured door's volume.
execute if entity @s[tag=rocket_test_door_north] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:air replace minecraft:barrier
execute if entity @s[tag=rocket_test_door_south] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:air replace minecraft:barrier
execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:air replace minecraft:barrier
execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:air replace minecraft:barrier
execute if entity @s[tag=rocket_test_door_north] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=rocket_test_door_south] run fill ~-3 ~ ~ ~3 ~15 ~ minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~-3 ~ ~15 ~3 minecraft:air replace minecraft:magenta_stained_glass_pane
