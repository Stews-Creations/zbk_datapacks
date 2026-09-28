# === FORCE SNAP IMMEDIATE - DEBUG ===
# Run this while standing near a floating mystery box to force it to snap
# Uses execute positioned to limit range and avoid affecting other boxes

# Force snap all entities within 3 blocks
execute as @e[type=item_display,distance=..3] run data merge entity @s {start_interpolation:-1}
execute as @e[type=block_display,distance=..3] run data merge entity @s {start_interpolation:-1}
execute as @e[type=text_display,distance=..3] run data merge entity @s {start_interpolation:-1}

# Wait 1 tick then apply empty transforms
schedule function zombies:map_elements/mystery_box/animation/state/force_snap_immediate_2 1t
