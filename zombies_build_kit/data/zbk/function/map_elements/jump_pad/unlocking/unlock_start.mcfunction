# ===================================
# JUMP PAD - UNLOCK START MARKER
# ===================================
# Purpose: Find and unlock the matching START marker by ID
# Executed as: END marker with player nearby
# ===================================

# Store this END marker's ID
execute store result score #unlock_jp_id jump_pad_id run scoreboard players get @s jump_pad_id

# Find matching START marker that is still locked and unlock it
execute as @e[type=marker,tag=jp_start,tag=jp_locked] at @s if score @s jump_pad_id = #unlock_jp_id jump_pad_id run function zbk:map_elements/jump_pad/unlocking/unlock_execute
