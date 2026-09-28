# Build all player-proximity tags before evaluating linked doors.
# Partners must see the complete pass; clear temporary proximity only after every decision.

# ===================================
# CUSTOM DOORS SUBMODULE - TICK
# ===================================

# ===== FRAME PLACEMENT DETECTION =====
execute as @e[type=minecraft:glow_item_frame,name="Custom Door Corner 1"] at @s run function zbk:map_elements/custom_door/spawning/spawn_corner1
execute as @e[type=minecraft:glow_item_frame,name="Custom Door Corner 2"] at @s run function zbk:map_elements/custom_door/spawning/spawn_corner2
execute as @e[type=minecraft:endermite,name="Custom Door Sign"] at @s run function zbk:map_elements/custom_door/spawning/spawn_sign

# ===== SIGN ANIMATION PROCESSING =====
execute as @e[type=marker,tag=custom_door_sign,scores={cd_sign_anim=0..}] at @s run function zbk:map_elements/custom_door/animations/tick

# ===== FLOATING DISPLAY PROCESSING =====
execute if entity @e[type=block_display,tag=cd_float_bd,limit=1] run function zbk:map_elements/custom_door/float/on_tick
execute unless entity @e[type=block_display,tag=cd_float_bd,limit=1] if entity @e[type=item_display,tag=cd_float_id,limit=1] run function zbk:map_elements/custom_door/float/on_tick

# ===== AUTO ZONE HIGHLIGHT =====
# Tag only the closest custom_door marker per player holding build stick
function zbk:map_elements/custom_door/management/tick_highlights
