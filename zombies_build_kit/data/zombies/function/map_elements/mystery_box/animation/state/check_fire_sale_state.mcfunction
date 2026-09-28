# === CHECK FIRE SALE STATE ===
# Called at the end of animations to ensure box is in correct state
# Run at the mystery_box_root entity position
# @s = mystery_box_root (block_display)

# Get the nearest mystery box location marker
execute at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zombies:map_elements/mystery_box/animation/state/check_fire_sale_state_execute
