advancement revoke @s only zombies:crafting_bench_placement
data modify storage zombies:crafting_bench placement.rotation set from entity @s Rotation
data modify storage zombies:crafting_bench placement.rotation[1] set value 0f
execute at @s as @e[type=marker,tag=cb_new,distance=..8,sort=nearest,limit=1] at @s run function zombies:map_elements/crafting_bench/marker/apply_facing
