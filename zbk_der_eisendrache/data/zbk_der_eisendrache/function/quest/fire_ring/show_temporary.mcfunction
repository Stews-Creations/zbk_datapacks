# ===================================
# FIRE RING COURTYARD - SHOW TEMPORARY
# ===================================
# Purpose: Temporarily show display while player is in air (not permanently revealed yet)
# Called from fire_ring/on_tick.mcfunction
# Run as non-revealed fire_ring_courtyard display entity

# Make this display temporarily visible
data merge entity @s {view_range:0.5f}

# Make all passengers visible too
execute on passengers run data merge entity @s {view_range:0.5f}

tag @s remove fire_ring_hidden
tag @s add fire_ring_temporary
