# Animate a wall zombie mannequin out from the wall, then swap to the real pigman.

scoreboard players add @s wall_spawn_timer 1

execute if score @s wall_spawn_timer matches 1..10 if entity @s[tag=wall_dir_east] run tp @s ~0.05 ~0.05 ~
execute if score @s wall_spawn_timer matches 1..10 if entity @s[tag=wall_dir_south] run tp @s ~ ~0.05 ~0.05
execute if score @s wall_spawn_timer matches 1..10 if entity @s[tag=wall_dir_west] run tp @s ~-0.05 ~0.05 ~
execute if score @s wall_spawn_timer matches 1..10 if entity @s[tag=wall_dir_north] run tp @s ~ ~0.05 ~-0.05

execute if score @s wall_spawn_timer matches 11 run data merge entity @s {pose:"standing"}

execute if score @s wall_spawn_timer matches 12..21 if entity @s[tag=wall_dir_east] run tp @s ~0.05 ~0.05 ~
execute if score @s wall_spawn_timer matches 12..21 if entity @s[tag=wall_dir_south] run tp @s ~ ~0.05 ~0.05
execute if score @s wall_spawn_timer matches 12..21 if entity @s[tag=wall_dir_west] run tp @s ~-0.05 ~0.05 ~
execute if score @s wall_spawn_timer matches 12..21 if entity @s[tag=wall_dir_north] run tp @s ~ ~0.05 ~-0.05

execute if score @s wall_spawn_timer matches 22..31 if entity @s[tag=wall_dir_east] run tp @s ~0.05 ~ ~
execute if score @s wall_spawn_timer matches 22..31 if entity @s[tag=wall_dir_south] run tp @s ~ ~ ~0.05
execute if score @s wall_spawn_timer matches 22..31 if entity @s[tag=wall_dir_west] run tp @s ~-0.05 ~ ~
execute if score @s wall_spawn_timer matches 22..31 if entity @s[tag=wall_dir_north] run tp @s ~ ~ ~-0.05

execute if score @s wall_spawn_timer matches 32.. run function zbk:waves/spawning/zombie/wall/finish
