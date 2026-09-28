# ===================================
# 115 LAUNCH PAD - START LAUNCH
# ===================================
# Purpose: Initialize two-phase launch (up to peak, then over to end)
# Executed as the player being launched
# ===================================

# Prevent duplicate launches
execute if entity @s[tag=115_launch_flying] run return fail

# Commit the one-way exit before creating any flight runtime.
function zbk_der_eisendrache:events/115_launch_start

# Tag player as in flight
tag @s add 115_launch_flying

# Summon tracking marker at player position
execute at @s run summon marker ~ ~ ~ {Tags:["115_launch_arc","115_launch_arc_new"]}

# Summon invisible armor stand vehicle
execute at @s run summon armor_stand ~ ~ ~ {Invulnerable:1b,NoGravity:1b,Invisible:1b,Tags:["115_launch_vehicle","115_launch_vehicle_new"]}

# Store player ID on tracking marker
execute store result entity @e[tag=115_launch_arc_new,limit=1,sort=nearest] data.player_id int 1 run scoreboard players get @s id

# Store start position (player's current position, scaled by 1000)
execute store result score @e[tag=115_launch_arc_new,limit=1,sort=nearest] arc_start_x run data get entity @s Pos[0] 1000
execute store result score @e[tag=115_launch_arc_new,limit=1,sort=nearest] arc_start_y run data get entity @s Pos[1] 1000
execute store result score @e[tag=115_launch_arc_new,limit=1,sort=nearest] arc_start_z run data get entity @s Pos[2] 1000

# Store peak position (from peak marker - this is where they go straight up to)
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_peak_x run data get entity @e[type=marker,tag=115_launch_peak,limit=1] Pos[0] 1000
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_peak_y run data get entity @e[type=marker,tag=115_launch_peak,limit=1] Pos[1] 1000
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_peak_z run data get entity @e[type=marker,tag=115_launch_peak,limit=1] Pos[2] 1000

# Store end position (from end marker - landing spot)
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_end_x run data get entity @e[type=marker,tag=115_launch_end,limit=1] Pos[0] 1000
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_end_y run data get entity @e[type=marker,tag=115_launch_end,limit=1] Pos[1] 1000
execute as @e[tag=115_launch_arc_new,limit=1,sort=nearest] store result score @s arc_end_z run data get entity @e[type=marker,tag=115_launch_end,limit=1] Pos[2] 1000

# Initialize progress counter (0 to 100)
# Phase 1: 0-50 = start -> peak (straight up)
# Phase 2: 51-100 = peak -> end (forward and down)
scoreboard players set @e[tag=115_launch_arc_new] arc_t 0

# Apply effects for smooth flight
effect give @s slow_falling 10 0 true

# Clear player velocity
data modify entity @s Motion set value [0.0d,0.0d,0.0d]

# Link armor stand to player by ID
scoreboard players operation @e[tag=115_launch_vehicle_new,limit=1,sort=nearest] id = @s id

# Mount player on armor stand
execute at @s run ride @s mount @e[tag=115_launch_vehicle_new,limit=1,sort=nearest]

# Remove temp tags
tag @e[tag=115_launch_arc_new] remove 115_launch_arc_new
tag @e[tag=115_launch_vehicle_new] remove 115_launch_vehicle_new
