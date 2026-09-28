# === DELETE BARRIER STRUCTURE ===
# Deletes the nearest barrier and all its associated entities
# (block displays, boards_spawn, repair text, player_block, zombie_block)

# Position at the nearest barrier marker, then clean up everything nearby
execute as @e[type=marker,tag=barrier,distance=..5,limit=1,sort=nearest] at @s run function zombies:build_kit/management/barrier/delete_barrier_entities

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Barrier and all associated entities deleted.","color":"red"}]
