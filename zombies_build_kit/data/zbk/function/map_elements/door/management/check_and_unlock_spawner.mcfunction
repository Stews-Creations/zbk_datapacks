# === CHECK AND UNLOCK SPAWNER ===
# Runs as each spawner to check if its zone matches the zone being unlocked
# If it matches, unlock the spawner

# Store this spawner's zone in a temporary score
execute store result score #this_spawner_zone global run data get entity @s data.zone

# If this spawner's zone matches the zone we're unlocking, unlock it
execute if score #this_spawner_zone global = #zone_to_unlock global run scoreboard players set @s spawner_unlocked 1
