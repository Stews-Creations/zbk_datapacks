# ===================================
# TELEPORTER - INITIALIZE
# ===================================
# Purpose: Reset teleporter system to default state
# Called from on_load.mcfunction and game reset
# ===================================

# Remove all state tags from teleporter start markers
execute as @e[type=marker,tag=teleporter,tag=tp_start] run tag @s remove tp_purchased
execute as @e[type=marker,tag=teleporter,tag=tp_start] run tag @s remove tp_active
execute as @e[type=marker,tag=teleporter,tag=tp_start] run tag @s remove tp_reverse
execute as @e[type=marker,tag=teleporter,tag=tp_start] run tag @s remove tp_auto_return_pending

# Reset timers
scoreboard players reset @e[type=marker,tag=teleporter,tag=tp_start] teleporter_cooldown
scoreboard players reset @e[type=marker,tag=teleporter,tag=tp_start] teleporter_duration
scoreboard players reset @e[type=marker,tag=teleporter,tag=tp_start] teleporter_recharge_delay
scoreboard players reset @e[type=marker,tag=teleporter,tag=tp_start] teleporter_auto_return
tag @a[tag=tp_auto_return_player] remove tp_auto_return_player
scoreboard players reset @a teleporter_return_id

# Kill old text displays and interaction entities
kill @e[type=text_display,tag=teleporter_ui]
kill @e[type=interaction,tag=teleporter_interaction]

# Respawn text displays and interaction entities for all start markers
execute as @e[type=marker,tag=teleporter,tag=tp_start] at @s run function zbk:map_elements/teleporter/purchasing/update_display

# Respawn interaction entities for all end markers (for build stick + two-way)
execute as @e[type=marker,tag=teleporter,tag=tp_end] at @s run function zbk:map_elements/teleporter/purchasing/update_end_display

# Keep auto-return markers invisible after UI cleanup
execute as @e[type=marker,tag=teleporter,tag=tp_auto_return] at @s run function zbk:map_elements/teleporter/purchasing/update_auto_return_display

# Set up end marker displays based on two-way setting
execute as @e[type=marker,tag=teleporter,tag=tp_start] run function zbk:map_elements/teleporter/management/setup_end_display

# Confirmation message (debug only)
function zbk:debug/info {f:"TELE",m:"Teleporter system initialized"}
