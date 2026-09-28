# ===================================
# TELEPORTER - AUTO RETURN WARNING
# ===================================
# Purpose: Warn riders during the final 5 seconds before auto-return
# Executed as the start marker, at the start marker
# ===================================

execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id

# Player-local visual cue during the whole warning window
execute as @a[tag=tp_auto_return_player] if score @s teleporter_return_id = #active_tp_id teleporter_id at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.35 0.7 0.35 0.04 8 force @s
execute as @a[tag=tp_auto_return_player] if score @s teleporter_return_id = #active_tp_id teleporter_id at @s run particle minecraft:end_rod ~ ~1 ~ 0.25 0.5 0.25 0.01 2 force @s
