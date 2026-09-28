# ===================================
# JUMP PAD - START ARC ANIMATION
# ===================================
# Purpose: Initialize jump pad arc animation with Bezier curve calculations
# Executed as the player who is launching
#
# Dependencies:
# - Requires markers: tag=jump_pad,tag=jp_start / jp_peak / jp_end
# - Requires scoreboards from on_load.mcfunction
# ===================================

# Check if player already in flight - prevent duplicate launches
execute if entity @s[tag=jump_pad_flying] run return fail

# Tag player as in flight
tag @s add jump_pad_flying
tag @s add has_launched

# Get the jump pad ID from the nearest start marker
execute store result score #active_jp_id jump_pad_id run scoreboard players get @e[type=marker,tag=jp_start,sort=nearest,limit=1] jump_pad_id

# Summon tracking marker at player position to store arc data
execute at @s run summon marker ~ ~ ~ {Tags:["jump_arc","jump_arc_new"]}

# Summon invisible armor stand for player to ride (smooth camera movement)
execute at @s run summon armor_stand ~ ~ ~ {Invulnerable:1b,NoGravity:1b,Invisible:1b,Tags:["jump_arc_vehicle","jump_arc_vehicle_new"]}

# Store player's ID on the tracking marker
execute store result entity @e[tag=jump_arc_new,limit=1,sort=nearest] data.player_id int 1 run scoreboard players get @s id

# Store the jump pad ID on the marker for matching with end marker
scoreboard players operation @e[tag=jump_arc_new,limit=1,sort=nearest] jump_pad_id = #active_jp_id jump_pad_id

# Store start position (from player's current position)
execute store result score @e[tag=jump_arc_new,limit=1,sort=nearest] arc_start_x run data get entity @s Pos[0] 1000
execute store result score @e[tag=jump_arc_new,limit=1,sort=nearest] arc_start_y run data get entity @s Pos[1] 1000
execute store result score @e[tag=jump_arc_new,limit=1,sort=nearest] arc_start_z run data get entity @s Pos[2] 1000

# Store end position (find matching end marker by ID)
execute as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #active_jp_id jump_pad_id run tag @s add temp_jp_end
execute as @e[tag=jump_arc_new,limit=1,sort=nearest] store result score @s arc_end_x run data get entity @e[type=marker,tag=temp_jp_end,limit=1] Pos[0] 1000
execute as @e[tag=jump_arc_new,limit=1,sort=nearest] store result score @s arc_end_y run data get entity @e[type=marker,tag=temp_jp_end,limit=1] Pos[1] 1000
execute as @e[tag=jump_arc_new,limit=1,sort=nearest] store result score @s arc_end_z run data get entity @e[type=marker,tag=temp_jp_end,limit=1] Pos[2] 1000
tag @e[tag=temp_jp_end] remove temp_jp_end

# Calculate midpoint X and Z (peak horizontal position)
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_x = @e[tag=jump_arc_new,limit=1] arc_start_x
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_x += @e[tag=jump_arc_new,limit=1] arc_end_x
scoreboard players set #2 arc_t 2
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_x /= #2 arc_t

scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_z = @e[tag=jump_arc_new,limit=1] arc_start_z
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_z += @e[tag=jump_arc_new,limit=1] arc_end_z
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_z /= #2 arc_t

# Get peak Y from peak marker and calculate adjusted control point
execute as @e[type=marker,tag=jp_peak] if score @s jump_pad_id = #active_jp_id jump_pad_id run tag @s add temp_jp_peak
execute store result score #temp_peak_y arc_calc run data get entity @e[tag=temp_jp_peak,limit=1] Pos[1] 1000
tag @e[tag=temp_jp_peak] remove temp_jp_peak

# Calculate adjusted control point: control_y = 2*peak_y - 0.5*(start_y + end_y)
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_y = #temp_peak_y arc_calc
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_y *= #2 arc_t

# Calculate average of start and end Y
scoreboard players operation #avg_y arc_calc = @e[tag=jump_arc_new,limit=1] arc_start_y
scoreboard players operation #avg_y arc_calc += @e[tag=jump_arc_new,limit=1] arc_end_y
scoreboard players operation #avg_y arc_calc /= #2 arc_t

# Subtract from doubled peak
scoreboard players operation @e[tag=jump_arc_new,limit=1] arc_peak_y -= #avg_y arc_calc

# Initialize progress counter (0 to 100)
scoreboard players set @e[tag=jump_arc_new] arc_t 0
scoreboard players set #100 arc_t 100

# Apply effects to player for smooth flight
effect give @s slow_falling 10 0 true

# Clear player velocity to prevent momentum issues
data modify entity @s Motion set value [0.0d,0.0d,0.0d]

# Link armor stand to tracking marker by storing same player ID in scoreboard
scoreboard players operation @e[tag=jump_arc_vehicle_new,limit=1,sort=nearest] id = @s id

# Mount player on armor stand
execute at @s run ride @s mount @e[tag=jump_arc_vehicle_new,limit=1,sort=nearest]

# Remove temp tags
tag @e[tag=jump_arc_new] remove jump_arc_new
tag @e[tag=jump_arc_vehicle_new] remove jump_arc_vehicle_new

# Play activate sounds
playsound zombies:jump_pads.flinger_fly master @a ~ ~ ~ 1 1
playsound zombies:jump_pads.flinger_activate master @a ~ ~ ~ 1 1
