# ===================================
# BARRIER W3 SPAWNING - SPAWN BOARDS
# ===================================
# Context: Executed as @e[type=marker,tag=boards_spawn_w3,tag=!boards_spawned] at @s

# ===== SPAWN BOARDS BASED ON DIRECTION =====
execute if score @s playerYaw matches -45..45 run function zombies:map_elements/barrier_w3/spawning/boards/south_boards
execute if score @s playerYaw matches 45..135 run function zombies:map_elements/barrier_w3/spawning/boards/west_boards
execute if score @s playerYaw matches 135..180 run function zombies:map_elements/barrier_w3/spawning/boards/north_boards
execute if score @s playerYaw matches -180..-135 run function zombies:map_elements/barrier_w3/spawning/boards/north_boards
execute if score @s playerYaw matches -135..-45 run function zombies:map_elements/barrier_w3/spawning/boards/east_boards

# ===== MARK AS SPAWNED =====
tag @s add boards_spawned
tag @e[type=marker,tag=boards_spawn_w3,tag=!boards_spawned,distance=..1] add boards_spawned

# ===== SPAWN REPAIR TEXT DISPLAY =====
function zombies:map_elements/barrier_w3/spawning/spawn_repair_text
