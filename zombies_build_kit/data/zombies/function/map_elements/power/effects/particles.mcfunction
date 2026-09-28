# === POWER PARTICLES ===
# Runs every tick while power is on

# Add particle effects around power location
execute as @e[type=marker,tag=power_marker] at @s run particle minecraft:electric_spark ~ ~ ~ 0.5 0.5 0.5 0.01 2 force
