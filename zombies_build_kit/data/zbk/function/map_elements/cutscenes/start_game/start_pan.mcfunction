# ===================================
# START GAME CUTSCENE - START PAN
# ===================================
# Two-marker camera pan cutscene before game starts
# ===================================

# Read speed from start marker and convert to blocks/tick (bps * 0.05)
# Default to 2 bps (0.1 blocks/tick) for markers without speed data
data modify storage zbk:cutscene speed set value 0.1d
execute if data entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed store result storage zbk:cutscene speed double 0.05 run data get entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed

# Stop all sounds
stopsound @a

# Summon invisible armor stand camera at start position
execute at @e[type=marker,tag=cutscene_start_start,limit=1] run summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["cutscene_camera","cutscene_start_camera"]}

# Face the camera toward the end marker BEFORE spectating
execute as @e[type=armor_stand,tag=cutscene_start_camera] at @s facing entity @e[type=marker,tag=cutscene_start_finish,limit=1] feet run tp @s ~ ~ ~ ~ ~

# Force all players to spectator mode watching the camera (5 tick delay for sync)
schedule function zbk:map_elements/cutscenes/start_game/spectate 5t

# Clear actionbar, hide sidebar, and activate start game pan cutscene (2)
title @a actionbar {"text":""}
scoreboard objectives setdisplay sidebar
scoreboard players set #global cutscene_active 2

# Play game start sound
function zbk:sounds/play/game_start

# Fire cutscene start game signals
function zbk:map_elements/game_signals/runtime/fire_cutscene_start
