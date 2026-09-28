# === DELETE BARRIER W3 STRUCTURE ===
# Deletes the nearest wide barrier and all its associated entities

execute as @e[type=marker,tag=barrier_w3,distance=..5,limit=1,sort=nearest] at @s run function zbk:build_kit/management/barrier_w3/delete_barrier_w3_entities

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Barrier (3-Wide) and all associated entities deleted.","color":"red"}]
