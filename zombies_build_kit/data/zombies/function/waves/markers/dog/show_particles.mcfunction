# === SHOW DOG SPAWN MARKER PARTICLES ===
# Purpose: Display particles at dog spawn markers when marker visibility is enabled

execute at @e[type=marker,tag=dog_spawner] run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 5 force
