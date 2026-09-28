# === CONVERT SPAWN POINT EGG TO MARKER ===
# Runs at the location of the placed bat egg
# Creates a marker entity and removes the bat
# Multiple spawn point markers are allowed - players distribute across them

# Create new spawn point marker at this location
execute as @e[type=minecraft:bat,name="Spawn Point"] at @s run summon marker ~ ~ ~ {Tags:["spawn_point_marker"]}

# Remove the bat that was spawned from the egg
execute as @e[type=minecraft:bat,name="Spawn Point"] run kill @s

# Reassign sequential IDs to all spawn point markers
function zbk:game/management/spawn_point/index_markers

# Notify player
function zbk:debug/info {f:"GAME",m:"Spawn point added!"}
