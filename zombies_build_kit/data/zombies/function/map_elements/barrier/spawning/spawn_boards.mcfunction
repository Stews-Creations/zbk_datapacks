# ===================================
# BARRIER SPAWNING - SPAWN BOARDS
# ===================================
# Purpose: Detect boards_spawn markers and spawn directional board entities
#
# Context: Executed as @e[type=marker,tag=boards_spawn,tag=!boards_spawned] at @s
# ===================================

# ===== SPAWN BOARDS BASED ON DIRECTION =====
# Facing South (yaw between -45° and 45°)
execute if score @s playerYaw matches -45..45 run function zombies:map_elements/barrier/spawning/boards/south_boards

# Facing West (yaw between 45° and 135°)
execute if score @s playerYaw matches 45..135 run function zombies:map_elements/barrier/spawning/boards/west_boards

# Facing North (yaw between 135..180 or -180..-135)
execute if score @s playerYaw matches 135..180 run function zombies:map_elements/barrier/spawning/boards/north_boards
execute if score @s playerYaw matches -180..-135 run function zombies:map_elements/barrier/spawning/boards/north_boards

# Facing East (yaw between -135..-45)
execute if score @s playerYaw matches -135..-45 run function zombies:map_elements/barrier/spawning/boards/east_boards

# ===== MARK AS SPAWNED =====
# Tag this marker so boards don't spawn again unless intentionally respawned
tag @s add boards_spawned

# ===== MARK NEARBY BOARDS_SPAWN AS SPAWNED TOO =====
# Prevent duplicate boards_spawn markers in same location from spawning twice
tag @e[type=marker,tag=boards_spawn,tag=!boards_spawned,distance=..1] add boards_spawned

# ===== SPAWN REPAIR TEXT DISPLAY =====
# Spawn repair prompt text 0.5 blocks below this marker
function zombies:map_elements/barrier/spawning/spawn_repair_text
