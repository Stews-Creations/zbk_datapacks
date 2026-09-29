# === CONVERT WORLDSPAWN EGG TO MARKER ===
# Runs at the location of the placed salmon egg
# Creates a marker entity and removes the salmon

# Remove any existing worldspawn markers (only one allowed)
kill @e[type=marker,tag=worldspawn]

# Create new worldspawn marker at this location
execute as @e[type=minecraft:salmon,name="Worldspawn Marker"] at @s run summon marker ~ ~ ~ {Tags:["worldspawn"]}

# Remove the salmon that was spawned from the egg
execute as @e[type=minecraft:salmon,name="Worldspawn Marker"] run kill @s

# Notify player
tellraw @a [{"text":"[Game] ","color":"gold"},{"text":"Worldspawn marker set!","color":"green"}]
