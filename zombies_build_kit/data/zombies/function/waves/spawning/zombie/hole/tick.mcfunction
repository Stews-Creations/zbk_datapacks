# Animate a hole zombie mannequin from crawl to crouch to real zombie.

scoreboard players set #hole_spawn_health temp 1
execute store result score #hole_spawn_health temp run data get entity @s Health 100
execute if score #hole_spawn_health temp matches ..0 run function zombies:waves/spawning/zombie/discard_mannequin
execute if score #hole_spawn_health temp matches ..0 run return 0

execute store result score #animation_ok wz_state run function zombies:waves/spawning/zombie/animation/guard
execute unless score #animation_ok wz_state matches 1 run return 0

scoreboard players add @s hole_spawn_timer 1

execute if score @s hole_spawn_timer matches 1..60 if entity @s[tag=hole_dir_east] run tp @s ~0.05 ~ ~
execute if score @s hole_spawn_timer matches 1..60 if entity @s[tag=hole_dir_south] run tp @s ~ ~ ~0.05
execute if score @s hole_spawn_timer matches 1..60 if entity @s[tag=hole_dir_west] run tp @s ~-0.05 ~ ~
execute if score @s hole_spawn_timer matches 1..60 if entity @s[tag=hole_dir_north] run tp @s ~ ~ ~-0.05

execute if score @s hole_spawn_timer matches 42 run data merge entity @s {pose:"crouching"}
execute if score @s hole_spawn_timer matches 52 run data merge entity @s {pose:"standing"}
execute if score @s hole_spawn_timer matches 60.. run function zombies:waves/spawning/zombie/hole/finish
