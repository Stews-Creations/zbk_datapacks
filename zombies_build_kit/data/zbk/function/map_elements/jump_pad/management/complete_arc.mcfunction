# Complete the arc animation and land the player
# Executed as tracking marker when arc is complete

# Get the player ID
execute store result score #complete_player_id arc_calc run data get entity @s data.player_id

# Find the matching end marker
execute as @e[type=marker,tag=jp_end] if score @s jump_pad_id = @n[tag=jump_arc] jump_pad_id run tag @s add temp_final_end

# Teleport armor stand to end marker position (player stays mounted)
# Lower by 1.5 blocks to match the arc positioning
execute as @e[type=armor_stand,tag=jump_arc_vehicle] if score @s id = #complete_player_id arc_calc at @e[tag=temp_final_end,limit=1] run tp @s ~ ~-1.5 ~

# Ask stranded enemies to re-enter near the landing pad.
execute at @e[tag=temp_final_end,limit=1] run function zbk:behavior/relocation/create_anchor

# Tag the armor stand for cleanup and schedule the cleanup function
execute as @e[type=armor_stand,tag=jump_arc_vehicle] if score @s id = #complete_player_id arc_calc run tag @s add jump_arc_cleanup
schedule function zbk:map_elements/jump_pad/management/cleanup_vehicle 0.3s append

# Clear effects and tags from player
execute as @a if score @s id = #complete_player_id arc_calc run effect clear @s slow_falling
execute as @a if score @s id = #complete_player_id arc_calc run tag @s remove jump_pad_flying

# Play landing sound
execute as @a if score @s id = #complete_player_id arc_calc run function zbk:dispatch/voice_event_jump_pad_land
execute as @a if score @s id = #complete_player_id arc_calc at @s run playsound zbk:jump_pads.flinger_land master @a ~ ~ ~ 1 1

# Clean up
tag @e[tag=temp_final_end] remove temp_final_end
kill @s
