# ===================================
# CUSTOM DOOR - ANIMATION TICK
# ===================================
# Runs as sign marker with cd_sign_anim >= 0
# Processes one animation step based on speed setting
# Called from: custom_door/on_tick

# Get this sign's link ID to find corner
execute store result score #cd_sign_id global run scoreboard players get @s custom_door_id
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_sign_corner

# Read speed from corner (default 4 ticks per layer)
scoreboard players set #cd_anim_speed global 4
execute if entity @e[tag=cd_sign_corner] store result score #cd_anim_speed global run scoreboard players get @e[tag=cd_sign_corner,limit=1] custom_door_speed
execute if score #cd_anim_speed global matches ..0 run scoreboard players set #cd_anim_speed global 4

# Check if this is a step tick (every #cd_anim_speed ticks)
scoreboard players operation #cd_anim_check global = @s cd_sign_anim
scoreboard players operation #cd_anim_check global %= #cd_anim_speed global

# Increment timer
scoreboard players add @s cd_sign_anim 1

# Only animate on multiples of speed
execute unless score #cd_anim_check global matches 0 run tag @e[tag=cd_sign_corner] remove cd_sign_corner
execute unless score #cd_anim_check global matches 0 run return 0

# Calculate zone height and check if animation is done
execute store result score #cd_anim_min_y global run data get entity @s data.anim_zone.min_y
execute store result score #cd_anim_max_y global run data get entity @s data.anim_zone.max_y
scoreboard players operation #cd_zone_height global = #cd_anim_max_y global
scoreboard players operation #cd_zone_height global -= #cd_anim_min_y global
scoreboard players add #cd_zone_height global 1

# Current step = (timer - 1) / speed (pre-increment value avoids off-by-one at speed=1)
scoreboard players operation #cd_anim_step global = @s cd_sign_anim
scoreboard players remove #cd_anim_step global 1
scoreboard players operation #cd_anim_step global /= #cd_anim_speed global

# If step >= zone_height, animation is done — kill remaining displays
execute if score #cd_anim_step global >= #cd_zone_height global run scoreboard players set @s cd_sign_anim -1
execute if score @s cd_sign_anim matches -1 as @e[type=block_display,tag=cd_anim_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute if score @s cd_sign_anim matches -1 as @e[type=block_display,tag=cd_door_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute if score @s cd_sign_anim matches -1 as @e[type=item_display,tag=cd_anim_id] if score @s custom_door_id = #cd_sign_id global run kill @s
execute if score @s cd_sign_anim matches -1 as @e[type=item_display,tag=cd_door_id] if score @s custom_door_id = #cd_sign_id global run kill @s
execute if score @s cd_sign_anim matches -1 run tag @e[tag=cd_sign_corner] remove cd_sign_corner
execute if score @s cd_sign_anim matches -1 run return 0

# Read animation style from corner (1=Up, 2=Down)
scoreboard players set #cd_anim_style global 1
execute if entity @e[tag=cd_sign_corner] store result score #cd_anim_style global run scoreboard players get @e[tag=cd_sign_corner,limit=1] custom_door_anim

# Route to correct animation
execute if score #cd_anim_style global matches 1 run function zombies:map_elements/custom_door/animations/up
execute if score #cd_anim_style global matches 2 run function zombies:map_elements/custom_door/animations/down

# Piston sound each step
playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 1.2

# Cleanup
tag @e[tag=cd_sign_corner] remove cd_sign_corner
