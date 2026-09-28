# === CONVERT ZOMBIE BLOCK TO MARKER ===
# Converts the spawned creeper into a marker entity

# Get position and summon marker
execute as @e[type=minecraft:creeper,name="Zombie Block Marker"] at @s run summon marker ~ ~ ~ {Tags:["barrier_zombie_block"]}

# Kill the creeper
kill @e[type=minecraft:creeper,name="Zombie Block Marker"]

# Feedback to player
tellraw @a [{"text":"[Barriers] ","color":"gold"},{"text":"Zombie Block marker placed","color":"green"}]
