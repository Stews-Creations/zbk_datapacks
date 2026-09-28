# ===================================
# BARRIER W3 SUBMODULE - INITIALIZE
# ===================================
# Purpose: Reset wide barrier system to default state
# Called from: barrier_w3/on_load, game/initialize

# ===== RESET ALL BARRIER STATES =====
scoreboard players set @e[type=marker,tag=barrier_w3] bw3_state 0
scoreboard players set @e[type=marker,tag=barrier_w3] bw3_break_timer -1

# ===== RESTORE BARRIER BOARDS =====
kill @e[type=item_display,tag=barrier_w3_passenger]
kill @e[type=item_display,tag=barrier_w3_boards]
kill @e[type=text_display,tag=barrier_w3_repair_text]

# Remove boards_spawned tag from markers so boards respawn fresh
tag @e[type=marker,tag=boards_spawn_w3] remove boards_spawned

# Copy playerYaw from barrier markers to boards_spawn markers (needed for reload)
execute as @e[type=marker,tag=barrier_w3] at @s run scoreboard players operation @e[type=marker,tag=boards_spawn_w3,distance=..3,limit=1,sort=nearest] playerYaw = @s playerYaw

# Respawn board entities at all boards_spawn markers
execute as @e[type=marker,tag=boards_spawn_w3] at @s run function zbk:map_elements/barrier_w3/spawning/spawn_boards

# Ensure all light blocks in barrier areas are set to level 6
execute as @e[type=marker,tag=boards_spawn_w3] at @s run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=6] replace minecraft:light[level=5]
