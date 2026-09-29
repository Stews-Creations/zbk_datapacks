# === SHOW JUMP PAD USED IDS (CHAT REPORT) ===
# Prints a per-marker breakdown of all assigned jump pad IDs to chat

tellraw @a [{"text":"[Build Kit] ","color":"gold"},{"text":"--- Jump Pad IDs in Use ---","color":"yellow","bold":true}]

# Print each Start marker with its ID
execute as @e[type=marker,tag=jp_start,scores={jump_pad_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"jump_pad_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Start Marker","color":"aqua"}]

# Print each Peak marker with its ID
execute as @e[type=marker,tag=jp_peak,scores={jump_pad_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"jump_pad_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Peak Marker","color":"aqua"}]

# Print each End marker with its ID
execute as @e[type=marker,tag=jp_end,scores={jump_pad_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"jump_pad_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"End Marker","color":"aqua"}]

# If no markers have IDs assigned
execute unless entity @e[type=marker,tag=jump_pad,scores={jump_pad_id=1..}] run tellraw @a [{"text":"  (no IDs assigned yet)","color":"dark_gray","italic":true}]
