# === INITIALIZE MYSTERY BOX ===
# Purpose: Set mystery box system to default values
# Called from on_load.mcfunction and game reset

# Reset spawn location unlock flag (re-restrict to spawn locations)
scoreboard players set #mystery_box_unlocked mystery_box_unlocked 0

# Reset spin counters for all mystery box locations
scoreboard players set @e[tag=mystery_box_location,type=marker] mystery_box_spins 0

# Reset pending empty flags
scoreboard players reset @e[tag=mystery_box_location,type=marker] mystery_box_pending_empty

# Reset pending spawn flags
scoreboard players reset @e[tag=mystery_box_location,type=marker] mystery_box_pending_spawn

# Restore the configured item-part and label ranges on loaded boxes.
execute as @e[type=block_display,tag=mystery_box] run function zbk:map_elements/mystery_box/display/configure_rendering

# Stop all current animations
tag @e[tag=mystery_box_root,type=block_display] add animation_pause

# Remove all animation tags to prevent animations from running on multiple boxes
function zbk:map_elements/mystery_box/management/cleanup_animation_tags

# Reset mystery box location IDs and initialize (after 2 tick delay to ensure animations stopped)
execute if entity @e[tag=mystery_box_location,type=marker] run schedule function zbk:map_elements/mystery_box/locations/index/reset_ids 2t

function zbk:debug/info {f:"BOX",m:"Mystery box system initialized"}
