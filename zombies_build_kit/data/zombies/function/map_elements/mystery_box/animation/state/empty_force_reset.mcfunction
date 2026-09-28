# === FORCE RESET AFTER EMPTY ===
# @s = mystery_box_root (block_display)
# Called at the end of empty animation to ensure entities are properly reset
# Clears interpolation state and forces immediate visual update

execute as @e[type=item_display,distance=..60] run data merge entity @s {start_interpolation:-1}
execute as @e[type=block_display,distance=..60] run data merge entity @s {start_interpolation:-1}
execute as @e[type=text_display,distance=..60] run data merge entity @s {start_interpolation:-1}
