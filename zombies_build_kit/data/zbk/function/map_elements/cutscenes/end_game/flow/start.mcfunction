# ===================================
# END GAME CUTSCENE - START
# ===================================
# Purpose: Begin the end game camera pan cutscene
# Called from trigger_game_over when both markers exist
# ===================================

# Read speed from start marker and convert to blocks/tick (bps * 0.05)
# Default to 2 bps (0.1 blocks/tick) for markers without speed data
data modify storage zbk:cutscene speed set value 0.1d
execute if data entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed store result storage zbk:cutscene speed double 0.05 run data get entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed

# Summon invisible armor stand camera at start position
execute at @e[type=marker,tag=cutscene_end_start,limit=1] run summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["cutscene_camera"]}

# Face the camera toward the end marker BEFORE spectating
execute as @e[type=armor_stand,tag=cutscene_camera] at @s facing entity @e[type=marker,tag=cutscene_end_finish,limit=1] feet run tp @s ~ ~ ~ ~ ~

# Remove revive bossbars before cutscene
execute as @a run function zbk:player/down_system/bossbar/remove_own

# Remove all players from downed team (stops downed particles)
team join no_friendly_fire_team @a

# Force all players to spectator mode watching the camera (1 tick delay for rotation to sync)
schedule function zbk:map_elements/cutscenes/end_game/camera/spectate 5t

# Clear actionbar, hide sidebar, and activate cutscene tick
title @a actionbar {"text":""}
scoreboard objectives setdisplay sidebar
scoreboard players set #global cutscene_active 1

# Play game over sound
function zbk:game/audio/game_over

# Fire cutscene end game signals
function zbk:map_elements/game_signals/runtime/fire_cutscene_end
