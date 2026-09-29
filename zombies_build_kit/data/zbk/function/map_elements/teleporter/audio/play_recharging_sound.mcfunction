# ===================================
# TELEPORTER - PLAY RECHARGING SOUND
# ===================================
# Purpose: Play recharging sound at both start and end pads
# Executed as the start marker, at the start marker
# ===================================

# Play at start pad
function zbk:map_elements/teleporter/audio/teleporter_recharging

# Find linked end marker and play there too
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id
execute as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run function zbk:map_elements/teleporter/audio/teleporter_recharging

# Reset the timer so it doesn't fire again
scoreboard players reset @s teleporter_recharge_delay
