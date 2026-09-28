# If score = 0 (unpowered) but lever is on, force it off
execute if score #power power matches 0 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=true] if block ~ ~ ~-1 minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=south,powered=false]
execute if score #power power matches 0 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=true] if block ~ ~ ~1 minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=north,powered=false]
execute if score #power power matches 0 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=true] if block ~-1 ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=east,powered=false]
execute if score #power power matches 0 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=true] if block ~1 ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=west,powered=false]

# If score = 1 (powered) but lever is off, force it on
execute if score #power power matches 1 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=false] if block ~ ~ ~-1 minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=south,powered=true]
execute if score #power power matches 1 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=false] if block ~ ~ ~1 minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=north,powered=true]
execute if score #power power matches 1 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=false] if block ~-1 ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=east,powered=true]
execute if score #power power matches 1 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=false] if block ~1 ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ minecraft:lever[face=wall,facing=west,powered=true]
