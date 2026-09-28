# Do not count the recovery teleport itself as a rising jump next tick.
execute store result score @s de_ag_bound_y run data get entity @s Pos[1] 1000
scoreboard players set @s de_ag_bound_rise 0
