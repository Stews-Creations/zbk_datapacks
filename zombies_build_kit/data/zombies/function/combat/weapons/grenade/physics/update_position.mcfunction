# ===================================
# UPDATE GRENADE POSITION
# ===================================
# Purpose: Move grenade each tick using 5 sub-steps with gravity simulation
# Executed as: Marker entity (active_grenade tag)
# Dependencies: calculate_velocity.mcfunction, sub_step.mcfunction
# ===================================

# Store 1/5 of velocity to NBT storage for sub-step macro (0.00002 = 0.0001 / 5)
execute store result storage zombies:temp motion.x double 0.00002 run scoreboard players get @s motion_x1
execute store result storage zombies:temp motion.y double 0.00002 run scoreboard players get @s motion_y1
execute store result storage zombies:temp motion.z double 0.00002 run scoreboard players get @s motion_z1

# Initialize sub-step counter and run 5 sub-steps (each checks block/zombie/disco collisions)
scoreboard players set @s grenade_sub_step 5
function zombies:combat/weapons/grenade/physics/sub_step

# Stop processing if grenade exploded during sub-stepping
execute if entity @s[tag=exploded] run return fail

# Apply gravity (200 units/tick for quick punchy arc)
scoreboard players remove @s motion_y1 200

# Increment distance counter (each tick = 1 unit)
scoreboard players add @s grenade_distance 1

# Update display position to marker's current position (at @s refreshes to post-movement location)
scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute at @s as @e[type=item_display,tag=grenade_display] if score @s grenade_id = #current_grenade_id grenade_id run tp @s ~ ~ ~ ~ ~

# Check for max range (80 ticks)
execute if score @s grenade_distance matches 80.. run function zombies:combat/weapons/grenade/explode
