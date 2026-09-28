# Compare scaled X/Z positions with the previous tick; bootstrap the first eligible tick as moving.
tag @s remove de_ag_wall_moving

execute store result score @s de_ag_motion run data get entity @s Pos[0] 100
execute unless entity @s[tag=de_ag_wall_pos_init] run tag @s add de_ag_wall_moving
execute if entity @s[tag=de_ag_wall_pos_init] unless score @s de_ag_motion = @s de_ag_wall_x run tag @s add de_ag_wall_moving
scoreboard players operation @s de_ag_wall_x = @s de_ag_motion

execute store result score @s de_ag_motion run data get entity @s Pos[2] 100
execute if entity @s[tag=de_ag_wall_pos_init] unless score @s de_ag_motion = @s de_ag_wall_z run tag @s add de_ag_wall_moving
scoreboard players operation @s de_ag_wall_z = @s de_ag_motion

tag @s add de_ag_wall_pos_init
