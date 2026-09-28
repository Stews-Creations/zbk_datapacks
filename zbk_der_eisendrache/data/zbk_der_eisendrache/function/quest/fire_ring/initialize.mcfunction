# ===================================
# FIRE RING COURTYARD - INITIALIZE
# ===================================
# Purpose: Reset all fire_ring_courtyard displays to invisible state
# Called from maps/der_eisendrache/quest/initialize.mcfunction

# Reset all fire_ring_courtyard displays to invisible (view_range=0)
execute as @e[type=item_display,tag=fire_ring_courtyard] run data merge entity @s {view_range:0.0f}

# Reset all passengers of fire_ring_courtyard displays to invisible
execute as @e[type=item_display,tag=fire_ring_courtyard] on passengers run data merge entity @s {view_range:0.0f}

# Remove revealed tag from all displays (reset permanent visibility status)
tag @e[type=item_display,tag=fire_ring_courtyard] remove fire_ring_revealed

tag @e[type=item_display,tag=fire_ring_courtyard] remove fire_ring_temporary
tag @e[type=item_display,tag=fire_ring_courtyard] add fire_ring_hidden
