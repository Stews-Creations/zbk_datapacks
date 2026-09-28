# === CHECK SPAWNER ZONE AND SHOW GOLD PARTICLE ===
# Runs as each Panzer spawner marker
# Checks if the spawner's zone matches the highlight zone

execute store result score #this_spawner_zone global run data get entity @s data.zone

execute if score #this_spawner_zone global = #highlight_zone global run particle minecraft:dust{color:[1.0,0.65,0.0],scale:1.2} ~ ~1 ~ 0.2 0.5 0.2 0 5 force
