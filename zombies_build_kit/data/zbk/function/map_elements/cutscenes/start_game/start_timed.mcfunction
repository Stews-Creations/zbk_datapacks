# ===================================
# START GAME CUTSCENE - START TIMED
# ===================================
# Static camera at marker position for configured duration
# ===================================

# Stop all sounds
stopsound @a

# Summon invisible armor stand camera at marker position
execute at @e[type=marker,tag=cutscene_start_timed,limit=1] run summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["cutscene_camera","cutscene_start_camera"]}

# Apply stored facing from marker to camera
execute store result entity @e[type=armor_stand,tag=cutscene_start_camera,limit=1] Rotation[0] float 1 run data get entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.yaw
execute store result entity @e[type=armor_stand,tag=cutscene_start_camera,limit=1] Rotation[1] float 1 run data get entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.pitch

# Force all players to spectator mode watching the camera (5 tick delay for sync)
schedule function zbk:map_elements/cutscenes/start_game/spectate 5t

# Load timer from marker data (length in seconds -> ticks, scale factor handles floats)
execute store result score #global cutscene_timer run data get entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.length 20

# Clear actionbar, hide sidebar, and activate timed start game cutscene (4)
title @a actionbar {"text":""}
scoreboard objectives setdisplay sidebar
scoreboard players set #global cutscene_active 4

# Play game start sound
function zbk:sounds/play/game_start

# Fire cutscene start game signals
function zbk:map_elements/game_signals/runtime/fire_cutscene_start
