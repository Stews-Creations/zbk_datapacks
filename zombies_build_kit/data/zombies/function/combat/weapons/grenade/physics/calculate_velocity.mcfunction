# ===================================
# CALCULATE GRENADE VELOCITY
# ===================================
# Purpose: Calculate initial velocity vector from player's look direction
# Executed as: Marker entity (newly spawned grenade)
# Dependencies: Requires rotation from player
# ===================================

# Store initial position
execute store result score @s motion_x1 run data get entity @s Pos[0] 1000
execute store result score @s motion_y1 run data get entity @s Pos[1] 1000
execute store result score @s motion_z1 run data get entity @s Pos[2] 1000

# Move forward 0.1 blocks in look direction
tp @s ^ ^ ^0.1

# Store new position
execute store result score @s motion_x2 run data get entity @s Pos[0] 1000
execute store result score @s motion_y2 run data get entity @s Pos[1] 1000
execute store result score @s motion_z2 run data get entity @s Pos[2] 1000

# Calculate velocity (difference = new_pos - old_pos)
scoreboard players operation @s motion_x2 -= @s motion_x1
scoreboard players operation @s motion_y2 -= @s motion_y1
scoreboard players operation @s motion_z2 -= @s motion_z1

# Store result in motion_x1/y1/z1 for use in update_position
scoreboard players operation @s motion_x1 = @s motion_x2
scoreboard players operation @s motion_y1 = @s motion_y2
scoreboard players operation @s motion_z1 = @s motion_z2

# Apply throw power multiplier
scoreboard players set #speed_multiplier stats 500
scoreboard players operation @s motion_x1 *= #speed_multiplier stats
scoreboard players operation @s motion_y1 *= #speed_multiplier stats
scoreboard players operation @s motion_z1 *= #speed_multiplier stats
