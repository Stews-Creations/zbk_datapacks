# === SHOW ZOMBIE SPAWN MARKER PARTICLES ===
# Purpose: Display particles at zombie spawn markers when marker visibility is enabled

execute at @e[type=marker,tag=zombie_spawner] run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3 force
