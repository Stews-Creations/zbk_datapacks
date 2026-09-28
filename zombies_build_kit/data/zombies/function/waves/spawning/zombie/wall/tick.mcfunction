# Move a wall zombie mannequin upward, then stage it out from the wall.

scoreboard players set #wall_spawn_health temp 1
execute store result score #wall_spawn_health temp run data get entity @s Health 100
execute if score #wall_spawn_health temp matches ..0 run function zombies:waves/spawning/zombie/discard_mannequin
execute if score #wall_spawn_health temp matches ..0 run return 0

execute store result score #animation_ok wz_state run function zombies:waves/spawning/zombie/animation/guard
execute unless score #animation_ok wz_state matches 1 run return 0

execute if entity @s[tag=wall_zombie_exiting] run function zombies:waves/spawning/zombie/wall/exit_tick
execute if entity @s[tag=wall_cleanup_mannequin] run return 0
execute if entity @s[tag=wall_zombie_exiting] run return 0

scoreboard players add @s wall_spawn_timer 1
execute if score @s wall_spawn_timer matches ..20 run tp @s ~ ~0.05 ~
execute if score @s wall_spawn_timer matches ..20 run return 0

execute if entity @s[tag=wall_dir_east] if block ~1 ~1 ~ minecraft:air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_east] if block ~1 ~1 ~ minecraft:cave_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_east] if block ~1 ~1 ~ minecraft:void_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_east] if block ~1 ~1 ~ minecraft:barrier run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_south] if block ~ ~1 ~1 minecraft:air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_south] if block ~ ~1 ~1 minecraft:cave_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_south] if block ~ ~1 ~1 minecraft:void_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_south] if block ~ ~1 ~1 minecraft:barrier run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_west] if block ~-1 ~1 ~ minecraft:air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_west] if block ~-1 ~1 ~ minecraft:cave_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_west] if block ~-1 ~1 ~ minecraft:void_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_west] if block ~-1 ~1 ~ minecraft:barrier run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_north] if block ~ ~1 ~-1 minecraft:air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_north] if block ~ ~1 ~-1 minecraft:cave_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_north] if block ~ ~1 ~-1 minecraft:void_air run tag @s add wall_zombie_exiting
execute if entity @s[tag=wall_dir_north] if block ~ ~1 ~-1 minecraft:barrier run tag @s add wall_zombie_exiting

execute if entity @s[tag=wall_zombie_exiting] run scoreboard players set @s wall_spawn_timer 0
execute if entity @s[tag=wall_zombie_exiting] run data merge entity @s {pose:"crouching"}
execute if entity @s[tag=wall_zombie_exiting] run return 0
tp @s ~ ~0.05 ~
