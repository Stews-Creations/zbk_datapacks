# ===================================
# FIRE RING COURTYARD - HIDE TEMPORARY
# ===================================
# Purpose: Hide display when no players are in air (only if not permanently revealed)
# Called from fire_ring/on_tick.mcfunction
# Run as non-revealed fire_ring_courtyard display entity

# Make this display invisible again
data merge entity @s {view_range:0.0f}

# Make all passengers invisible too
execute on passengers run data merge entity @s {view_range:0.0f}

tag @s remove fire_ring_temporary
tag @s add fire_ring_hidden
