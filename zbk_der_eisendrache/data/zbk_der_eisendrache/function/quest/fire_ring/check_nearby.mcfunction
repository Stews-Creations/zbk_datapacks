# ===================================
# FIRE RING COURTYARD - CHECK NEARBY
# ===================================
# Purpose: Check if arrow landed near any fire_ring_courtyard displays and reveal them
# Called from fire_ring/on_tick.mcfunction
# Run as arrow entity, at arrow location

# Check if any fire_ring_courtyard displays are within 3 blocks
# If found, reveal the display and its passengers
execute as @e[type=item_display,tag=fire_ring_courtyard,distance=..3] run function zbk_der_eisendrache:quest/fire_ring/reveal

# Mark arrow as processed to prevent repeated checks
tag @s add processed
