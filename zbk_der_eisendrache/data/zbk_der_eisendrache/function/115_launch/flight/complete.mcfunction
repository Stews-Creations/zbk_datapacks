# ===================================
# 115 LAUNCH PAD - COMPLETE ARC
# ===================================
# Purpose: Land the player at the end position
# Executed as tracking marker when arc_t > 100
# ===================================

# Get the player ID
execute store result score #complete_player_id arc_calc run data get entity @s data.player_id

# Teleport armor stand to end marker position (lowered by 1.5 for armor stand offset)
execute as @e[type=armor_stand,tag=115_launch_vehicle] if score @s id = #complete_player_id arc_calc at @e[type=marker,tag=115_launch_end,limit=1] run tp @s ~ ~-1.5 ~

# Tag armor stand for cleanup and schedule it
execute as @e[type=armor_stand,tag=115_launch_vehicle] if score @s id = #complete_player_id arc_calc run tag @s add 115_launch_cleanup
schedule function zbk_der_eisendrache:115_launch/flight/cleanup_vehicle 0.3s append

# Clear effects and tags from player
execute as @a if score @s id = #complete_player_id arc_calc run effect clear @s slow_falling
execute as @a if score @s id = #complete_player_id arc_calc run tag @s remove 115_launch_flying

# Kill tracking marker
kill @s
