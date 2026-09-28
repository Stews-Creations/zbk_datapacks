# ===================================
# CALCULATE MONKEY BOMB VELOCITY
# ===================================
# Slower than grenades, with a heavy drop handled by update_position.

# Store initial position.
execute store result score @s motion_x1 run data get entity @s Pos[0] 1000
execute store result score @s motion_y1 run data get entity @s Pos[1] 1000
execute store result score @s motion_z1 run data get entity @s Pos[2] 1000

# Move forward 0.1 blocks in look direction.
tp @s ^ ^ ^0.1

# Store new position.
execute store result score @s motion_x2 run data get entity @s Pos[0] 1000
execute store result score @s motion_y2 run data get entity @s Pos[1] 1000
execute store result score @s motion_z2 run data get entity @s Pos[2] 1000

# Calculate velocity direction.
scoreboard players operation @s motion_x2 -= @s motion_x1
scoreboard players operation @s motion_y2 -= @s motion_y1
scoreboard players operation @s motion_z2 -= @s motion_z1
scoreboard players operation @s motion_x1 = @s motion_x2
scoreboard players operation @s motion_y1 = @s motion_y2
scoreboard players operation @s motion_z1 = @s motion_z2

# Heavy toss: slower forward movement than grenades.
scoreboard players set #monkey_bomb_speed stats 90
scoreboard players operation @s motion_x1 *= #monkey_bomb_speed stats
scoreboard players operation @s motion_y1 *= #monkey_bomb_speed stats
scoreboard players operation @s motion_z1 *= #monkey_bomb_speed stats
