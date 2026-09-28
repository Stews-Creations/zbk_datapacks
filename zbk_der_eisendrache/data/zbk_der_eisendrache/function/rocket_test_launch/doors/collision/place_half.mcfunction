# Add pane collision to the two half-covered leading columns.
$execute if entity @s[tag=rocket_test_door_north] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_north] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:magenta_stained_glass_pane keep
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:magenta_stained_glass_pane keep
