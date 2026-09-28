# === FORCE VISUAL SNAP ===
# @s = mystery_box_root (block_display), position = at root
# Forces all nearby display entities to visually snap to their current transformation data.
#
# In Minecraft 1.20.2+, setting transformation without start_interpolation does NOT
# trigger a visual update. Entities stay at whatever position their last interpolation
# left them. This function sets start_interpolation:0 on all entities to force them
# to snap to the transformation data that was just written by the empty animation.
#
# Without this, entities that were previously animated with start_interpolation
# (like teddy_bear kf149) would stay visually frozen at their old positions.

execute as @e[type=item_display,distance=..1] run data merge entity @s {start_interpolation:0}
execute as @e[type=block_display,distance=..1] run data merge entity @s {start_interpolation:0}
execute as @e[type=text_display,distance=..1] run data merge entity @s {start_interpolation:0}
