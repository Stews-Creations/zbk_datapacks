# ===================================
# FIRE RING COURTYARD - REVEAL
# ===================================
# Purpose: Permanently reveal a fire_ring_courtyard display (arrow hit it)
# Called from fire_ring/check_nearby.mcfunction
# Run as the fire_ring_courtyard display entity

# Mark this display as permanently revealed
tag @s add fire_ring_revealed

# Make this specific display visible permanently
data merge entity @s {view_range:0.5f}

# Make all passengers visible too
execute on passengers run data merge entity @s {view_range:0.5f}

# Visual and audio feedback
particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force
playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 1.5

tag @s remove fire_ring_hidden
tag @s remove fire_ring_temporary
