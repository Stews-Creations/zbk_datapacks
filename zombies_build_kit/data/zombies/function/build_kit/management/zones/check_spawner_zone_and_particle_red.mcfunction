# === CHECK SPAWNER ZONE AND SHOW RED PARTICLE ===
# Runs as each dog spawner marker
# Checks if the spawner's zone matches the highlight zone
# If match found, shows red particle

# Get this spawner's zone
execute store result score #this_spawner_zone global run data get entity @s data.zone

# If this spawner's zone matches, show red particle
execute if score #this_spawner_zone global = #highlight_zone global run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 5 force
