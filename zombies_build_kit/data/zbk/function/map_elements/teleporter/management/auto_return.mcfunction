# ===================================
# TELEPORTER - EXECUTE AUTO RETURN
# ===================================
# Purpose: Teleport tagged riders to the linked auto-return marker, then start cooldown
# Executed as the start marker, at the start marker
# ===================================

# Get the teleporter ID
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id

# Find the matching auto-return marker by ID
tag @e[tag=tp_temp_auto_return] remove tp_temp_auto_return
execute as @e[type=marker,tag=teleporter,tag=tp_auto_return] if score @s teleporter_id = #active_tp_id teleporter_id run tag @s add tp_temp_auto_return

# Select riders from this teleporter
tag @a[tag=tp_auto_return_target] remove tp_auto_return_target
execute as @a[tag=tp_auto_return_player] if score @s teleporter_return_id = #active_tp_id teleporter_id run tag @s add tp_auto_return_target

# Teleport selected riders if a destination exists
execute if entity @e[tag=tp_temp_auto_return] as @a[tag=tp_auto_return_target] at @e[tag=tp_temp_auto_return,limit=1] run tp @s ~ ~ ~
execute if entity @e[tag=tp_temp_auto_return] at @e[tag=tp_temp_auto_return,limit=1] run function zbk:sounds/play/teleporter_success

# Warn and fail gracefully if the marker was deleted after purchase
execute unless entity @e[tag=tp_temp_auto_return] run function zbk:debug/warn {f:"TELE",m:"No linked auto-return marker found!"}

# Clear rider tracking for this trip
tag @a[tag=tp_auto_return_target] remove tp_auto_return_player
scoreboard players reset @a[tag=tp_auto_return_target] teleporter_return_id
tag @a[tag=tp_auto_return_target] remove tp_auto_return_target
tag @e[tag=tp_temp_auto_return] remove tp_temp_auto_return

# Transition from auto-return wait to cooldown
tag @s remove tp_auto_return_pending
scoreboard players reset @s teleporter_auto_return

# Read cooldown from data.cooldown (seconds * 20 = ticks), fallback to 600 ticks (30s)
execute store result score @s teleporter_cooldown run data get entity @s data.cooldown 20
execute if score @s teleporter_cooldown matches 0 run scoreboard players set @s teleporter_cooldown 600

function zbk:debug/info {f:"TELE",m:"Auto-return executed"}
