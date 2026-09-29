# === SHOW CUSTOM DOOR USED IDS (CHAT REPORT) ===
# Prints a per-marker breakdown of all assigned custom door IDs to chat

tellraw @a [{"text":"[Build Kit] ","color":"gold"},{"text":"--- Custom Door IDs in Use ---","color":"yellow","bold":true}]

# Print each Corner 1 marker with its ID
execute as @e[type=marker,tag=custom_door_1,scores={custom_door_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"custom_door_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Corner 1","color":"aqua"}]

# Print each Corner 2 marker with its ID
execute as @e[type=marker,tag=custom_door_2,scores={custom_door_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"custom_door_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Corner 2","color":"aqua"}]

# Print each Sign marker with its ID
execute as @e[type=marker,tag=custom_door_sign,scores={custom_door_id=1..}] run tellraw @a [{"text":"  ID ","color":"gray"},{"score":{"name":"@s","objective":"custom_door_id"},"color":"yellow","bold":true},{"text":" - ","color":"dark_gray"},{"text":"Sign Marker","color":"aqua"}]

# If no markers have IDs assigned
execute unless entity @e[type=marker,tag=custom_door,scores={custom_door_id=1..}] unless entity @e[type=marker,tag=custom_door_sign,scores={custom_door_id=1..}] run tellraw @a [{"text":"  (no IDs assigned yet)","color":"dark_gray","italic":true}]
