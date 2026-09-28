# Promote the two fully covered columns from pane collision to full barriers.
$execute if entity @s[tag=rocket_test_door_north] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_north] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:barrier replace minecraft:magenta_stained_glass_pane
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:barrier replace minecraft:magenta_stained_glass_pane

$execute if entity @s[tag=rocket_test_door_north] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(negative) ~ ~ ~$(negative) ~15 ~ minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_north] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_south] run fill ~$(positive) ~ ~ ~$(positive) ~15 ~ minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(negative) ~ ~15 ~$(negative) minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_east] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:barrier keep
$execute if entity @s[tag=rocket_test_door_west] run fill ~ ~ ~$(positive) ~ ~15 ~$(positive) minecraft:barrier keep
