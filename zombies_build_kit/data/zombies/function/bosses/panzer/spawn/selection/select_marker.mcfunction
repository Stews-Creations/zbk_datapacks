# Select the open Panzer marker whose closest active player is nearest.
# If no active player can be scored, pick any open marker.

scoreboard players set #panzer_best_dist temp 2000000000
tag @e[type=minecraft:marker,tag=panzer_spawn_open] remove panzer_spawn_open

tag @e[type=minecraft:marker,tag=panzer_spawner,scores={spawner_unlocked=1}] add panzer_spawn_open
execute as @e[type=minecraft:marker,tag=panzer_spawner] if data entity @s {data:{zone:0}} run tag @s add panzer_spawn_open

execute as @e[type=minecraft:marker,tag=panzer_spawn_open] run function zombies:bosses/panzer/spawn/selection/score_marker
execute as @e[type=minecraft:marker,tag=panzer_spawn_open] run function zombies:bosses/panzer/spawn/selection/select_if_best
execute unless entity @e[type=minecraft:marker,tag=panzer_spawn_selected,limit=1] run tag @e[type=minecraft:marker,tag=panzer_spawn_open,sort=random,limit=1] add panzer_spawn_selected

tag @e[type=minecraft:marker,tag=panzer_spawn_open] remove panzer_spawn_open
