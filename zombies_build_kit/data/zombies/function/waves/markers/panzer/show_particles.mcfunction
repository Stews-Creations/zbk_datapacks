# === SHOW PANZER SPAWN MARKER PARTICLES ===
# Purpose: Display particles at Panzer spawn markers when marker visibility is enabled

execute at @e[type=marker,tag=panzer_spawner] run particle minecraft:dust{color:[1.0,0.65,0.0],scale:1.2} ~ ~1 ~ 0.2 0.5 0.2 0 5 force
execute at @e[type=marker,tag=panzer_spawner] run particle minecraft:electric_spark ~ ~1.2 ~ 0.15 0.3 0.15 0.01 2 force
