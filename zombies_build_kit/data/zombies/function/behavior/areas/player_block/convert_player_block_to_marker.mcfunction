# === CONVERT PLAYER BLOCK TO MARKER ===
# Converts the spawned cat into a marker entity

# Get position and summon marker
execute as @e[type=minecraft:cat,name="Player Block Marker"] at @s run summon marker ~ ~ ~ {Tags:["player_block"]}

# Kill the cat
kill @e[type=minecraft:cat,name="Player Block Marker"]

# Feedback to player
tellraw @a [{"text":"[Barriers] ","color":"gold"},{"text":"Player Block marker placed","color":"green"}]
