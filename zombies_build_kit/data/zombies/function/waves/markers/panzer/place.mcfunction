# === PLACE PANZER SPAWN MARKER ===
# Purpose: Detect and convert placed llamas to Panzer spawn point markers
# Runs every tick to detect newly placed markers

execute as @e[type=llama,tag=!converted] at @s run function zombies:waves/markers/panzer/convert
