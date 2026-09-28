# Original direct-hit position is retained by collide; damage has already happened.
scoreboard players set #blast_raygun stats 0
execute if score #gun_id stats matches 7 run scoreboard players set #blast_raygun stats 1
scoreboard players operation #blast_before stats = #direct_explosive_before stats
execute store result score #blast_remaining stats run data get entity @s Health 100
scoreboard players operation #blast_applied stats = #blast_before stats
scoreboard players operation #blast_applied stats -= #blast_remaining stats
scoreboard players operation #shooter_id stats = #player stats
execute at @s run function zbk:combat/weapons/effects/explosive/try_crawler_conversion
