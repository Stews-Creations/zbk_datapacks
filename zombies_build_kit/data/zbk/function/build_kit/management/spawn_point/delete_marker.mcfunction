# === DELETE SPAWN POINT MARKER ===
# Kills the nearest spawn point marker

kill @e[type=marker,tag=spawn_point_marker,distance=..5,limit=1,sort=nearest]

# Reassign sequential IDs after deletion
function zbk:game/management/spawn_point/index_markers

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Spawn point marker deleted.","color":"red"}]
