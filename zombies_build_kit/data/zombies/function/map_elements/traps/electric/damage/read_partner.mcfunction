# Context: selected partner corner, retaining the first-corner execution origin.
# Only coordinate scratch is written; the caller owns bounds calculation and damage.

execute store result score #x2 trap_cost run data get entity @s Pos[0]
execute store result score #y2 trap_cost run data get entity @s Pos[1]
execute store result score #z2 trap_cost run data get entity @s Pos[2]
