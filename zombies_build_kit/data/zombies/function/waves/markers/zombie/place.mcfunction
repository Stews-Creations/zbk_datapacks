# === PLACE ZOMBIE SPAWN MARKER ===
# Purpose: Detect and convert placed axolotls to zombie spawn point markers
# Runs every tick to detect newly placed markers

# Find axolotls spawned from the zombie marker egg and convert them to markers
execute as @e[type=axolotl,tag=!converted] at @s run function zombies:waves/markers/zombie/convert
