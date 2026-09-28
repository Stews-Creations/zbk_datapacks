# === SHOW TELEPORTER USED IDS (CHAT REPORT) ===
# Prints a per-marker breakdown of all assigned teleporter IDs to chat

tellraw @a [{"text":"[Build Kit] ","color":"gold"},{"text":"--- Teleporter IDs in Use ---","color":"yellow","bold":true}]

# Print each Start marker with its ID
execute as @e[type=marker,tag=tp_start,scores={teleporter_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"teleporter_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Start Marker","color":"aqua"}]

# Print each End marker with its ID
execute as @e[type=marker,tag=tp_end,scores={teleporter_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"teleporter_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"End Marker","color":"aqua"}]

# Print each Auto-Return marker with its ID
execute as @e[type=marker,tag=tp_auto_return,scores={teleporter_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"teleporter_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Auto-Return Marker","color":"light_purple"}]

# If no markers have IDs assigned
execute unless entity @e[type=marker,tag=teleporter,scores={teleporter_id=1..}] run tellraw @a [{"text":"  (no IDs assigned yet)","color":"dark_gray","italic":true}]
