# ===================================
# FIRE RING COURTYARD - TICK
# ===================================
# Purpose: Show fire_ring_courtyard displays when ANY player is in air, hide when they land unless hit
# Called from maps/der_eisendrache/quest/on_tick.mcfunction

# ===== TEMPORARY VISIBILITY WHILE IN AIR =====
# Snapshot riders once for visibility and arrow attribution; clear after both phases.
tag @a[tag=de_fire_ring_rider] remove de_fire_ring_rider
tag @a[nbt={RootVehicle:{Entity:{Tags:["launch_arc"]}}}] add de_fire_ring_rider
scoreboard players set #fire_ring_rider temp 0
execute if entity @a[tag=de_fire_ring_rider] run scoreboard players set #fire_ring_rider temp 1

# Only transition displays whose temporary visibility needs updating.
execute if score #fire_ring_rider temp matches 1 as @e[type=item_display,tag=fire_ring_courtyard,tag=!fire_ring_revealed,tag=!fire_ring_temporary] run function zbk_der_eisendrache:quest/fire_ring/show_temporary

# Hide non-revealed displays when NO players are in the air
execute if score #fire_ring_rider temp matches 0 as @e[type=item_display,tag=fire_ring_courtyard,tag=!fire_ring_revealed,tag=!fire_ring_hidden] run function zbk_der_eisendrache:quest/fire_ring/hide_temporary

# ===== PERMANENT REVEAL THROUGH ARROW HITS =====
# Tag arrows shot by players who are currently riding launch_arc (actively in air on jump pad)
execute as @a[tag=de_fire_ring_rider] at @s as @e[type=arrow,distance=..5,tag=!checked] if data entity @s Owner run tag @s add jump_pad_arrow

# Mark all arrows as checked to prevent re-tagging
tag @e[type=arrow] add checked

# Check for arrows that have landed (inGround) and were shot by jump pad riders
execute as @e[type=arrow,nbt={inGround:1b},tag=jump_pad_arrow,tag=!processed] at @s run function zbk_der_eisendrache:quest/fire_ring/check_nearby

# This audience snapshot is valid only inside this synchronous tick.
tag @a[tag=de_fire_ring_rider] remove de_fire_ring_rider
