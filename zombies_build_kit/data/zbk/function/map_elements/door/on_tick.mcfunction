# Advance all active door timers before dispatching local animation milestones.
# Each animation retains its original threshold and final collision cleanup.

# ===================================
# DOORS SUBMODULE - TICK
# ===================================
# Runs every game tick for door system

# ===== FRAME PLACEMENT DETECTION =====
# Detect and process placement of door glow item frame entities
execute as @e[type=minecraft:glow_item_frame,name="Door Marker"] at @s run function zbk:map_elements/door/purchasable/spawn_from_frame
execute as @e[type=minecraft:glow_item_frame,name="Gate Door Marker"] at @s run function zbk:map_elements/door/purchasable/spawn_from_frame_gate
execute as @e[type=minecraft:glow_item_frame,name="Jump Spot Marker"] at @s run function zbk:map_elements/door/purchasable/spawn_from_frame_jump_spot
execute as @e[type=minecraft:glow_item_frame,name="Powered Door Marker"] at @s run function zbk:map_elements/door/powered/spawn_from_frame
execute as @e[type=minecraft:glow_item_frame,name="Powered Stairs Door Marker"] at @s run function zbk:map_elements/door/powered/spawn_from_frame_stairs
execute as @e[type=minecraft:glow_item_frame,name="Powered Power Room Door Marker"] at @s run function zbk:map_elements/door/powered/spawn_from_frame_power_room
execute as @e[type=minecraft:glow_item_frame,name="Powered Church Door Marker"] at @s run function zbk:map_elements/door/powered/spawn_from_frame_church

# ===== DOOR ANIMATION TIMERS =====
# Increment animation timer for doors with active timers
scoreboard players add @e[type=marker,tag=door,scores={door_anim_timer=0..}] door_anim_timer 1

# Check animation stages at specific times and call functions
# Default door animation (4 stages)
execute as @e[type=marker,tag=door,tag=!door_gate,scores={door_anim_timer=5..25}] at @s run function zbk:map_elements/door/purchasable/animation/default/tick

# Gate door animation (5 stages)
execute as @e[type=marker,tag=door_gate,scores={door_anim_timer=5..25}] at @s run function zbk:map_elements/door/purchasable/animation/gate/tick
