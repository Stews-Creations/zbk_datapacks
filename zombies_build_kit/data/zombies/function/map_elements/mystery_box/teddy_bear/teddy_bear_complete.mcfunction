# === TEDDY BEAR ANIMATION COMPLETE ===
# Called at the end of teddy bear animation (keyframe_150)
# @s = mystery_box_root block_display entity
#
# Flow:
# 1. Clean up teddy bear animation tags
# 2. Force snap kf150 transforms (makes the "poof" visible)
# 3. Delegate to teddy_bear_complete_at_location for state + empty + relocation

# === STEP 1: Clean up animation state ===
tag @s remove anim_teddy_bear_north
tag @s remove anim_teddy_bear_south
tag @s remove anim_teddy_bear_east
tag @s remove anim_teddy_bear_west
scoreboard players reset @s mystery_box_frame

# === STEP 2: Force kf150 transforms to visually take effect ===
# kf150 sets entities to tiny (the "poof") with interpolation_duration:0 but no start_interpolation.
# Without force_snap, entities stay visually stuck at kf149's interpolated positions.
execute at @s run function zombies:map_elements/mystery_box/animation/state/force_snap

# === STEP 3: Handle location cleanup, empty, and relocation ===
execute at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zombies:map_elements/mystery_box/teddy_bear/teddy_bear_complete_at_location
