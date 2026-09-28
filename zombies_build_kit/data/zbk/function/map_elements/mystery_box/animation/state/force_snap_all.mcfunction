# === FORCE VISUAL SNAP - ALL ENTITIES ===
# @s = mystery_box_root (block_display), position = at root
# Forces ALL mystery box display entities to snap, using extended distance
# This is needed when entities are far away (e.g., after teddy bear floats them to Y~50)
# Uses distance=..60 to catch entities that have floated up to Y~50
# Uses start_interpolation:-1 to clear existing interpolation state

execute as @e[type=item_display,distance=..60] run data merge entity @s {start_interpolation:-1}
execute as @e[type=block_display,distance=..60] run data merge entity @s {start_interpolation:-1}
execute as @e[type=text_display,distance=..60] run data merge entity @s {start_interpolation:-1}
