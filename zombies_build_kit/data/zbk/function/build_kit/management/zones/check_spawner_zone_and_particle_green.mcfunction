# === CHECK SPAWNER ZONE AND SHOW GREEN PARTICLE ===
# Runs as each zombie spawner marker
# Checks if the spawner's zone matches the highlight zone
# If match found, shows green particle

# Get this spawner's zone
execute store result score #this_spawner_zone global run data get entity @s data.zone

# If this spawner's zone matches, show green particle
execute if score #this_spawner_zone global = #highlight_zone global run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3 force
