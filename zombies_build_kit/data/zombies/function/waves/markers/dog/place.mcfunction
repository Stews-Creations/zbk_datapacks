# === PLACE DOG SPAWN MARKER ===
# Purpose: Detect and convert placed wolves to dog spawn point markers
# Runs every tick to detect newly placed markers

# Find wolves spawned from the dog marker egg and convert them to markers
execute as @e[type=wolf,tag=!converted,tag=!wave_dog] at @s run function zombies:waves/markers/dog/convert
