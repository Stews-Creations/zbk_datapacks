# ===================================
# BARRIER SUBMODULE - INITIALIZE
# ===================================
# Purpose: Reset barrier system to default state
#
# Called from: barrier/on_load.mcfunction, game/initialize.mcfunction
# ===================================

# ===== RESET ALL BARRIER STATES =====
# Reset barrier states to intact (don't kill markers - they persist)
scoreboard players set @e[type=marker,tag=barrier] barrier_state 0
scoreboard players set @e[type=marker,tag=barrier] barrier_break_timer -1

# ===== RESTORE BARRIER BOARDS =====
# Kill passengers first (they don't have barrier_boards tag, only barrier_passenger)
kill @e[type=item_display,tag=barrier_passenger]

# Then kill parent entities
kill @e[type=item_display,tag=barrier_boards]

# Kill repair text displays
kill @e[type=text_display,tag=barrier_repair_text]

# Remove boards_spawned tag from markers so boards respawn fresh
tag @e[type=marker,tag=boards_spawn] remove boards_spawned

# Copy playerYaw from barrier markers to boards_spawn markers (needed for reload)
execute as @e[type=marker,tag=barrier] at @s run scoreboard players operation @e[type=marker,tag=boards_spawn,distance=..3,limit=1,sort=nearest] playerYaw = @s playerYaw

# Respawn board entities at all boards_spawn markers
execute as @e[type=marker,tag=boards_spawn] at @s run function zbk:map_elements/barrier/spawning/spawn_boards

# Ensure all light blocks in barrier areas are set to level 6
execute as @e[type=marker,tag=boards_spawn] at @s run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=6] replace minecraft:light[level=5]

# ===== RESET PLAYER REPAIR COUNTERS =====
# Reset all players' point-earning repair counts and cooldowns
scoreboard players set @a barrier_point_repairs 0
scoreboard players set @a barrier_repair_cooldown 0
