# ===================================
# DER EISENDRACHE INTRO CUTSCENE - START
# ===================================
# Plays the map-owned video intro before the normal game start flow.
# ===================================

execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket/management/ensure_ready
execute unless score #rocket_ready global matches 1 run return 0
execute unless entity @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1] run return 0

# Stop menu/music sounds and hide HUD elements while the video plays.
stopsound @a
scoreboard players set #menu_music_timer global 0
title @a actionbar {"text":""}
scoreboard objectives setdisplay sidebar

# Force all players to watch the placed intro camera.
gamemode spectator @a
execute as @a run spectate @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1]
schedule function zbk_der_eisendrache:intro_cutscene/management/spectate 5t

# Mark this as an active cutscene so player HUD/actionbar logic stays suppressed.
scoreboard players set #global cutscene_active 5

# Play the generated video-font intro and its audio.
function zbk_der_eisendrache:intro_cutscene/video/play

# Fire cutscene start game signals.
function zbk:api/map_elements/game_signals/runtime/fire_cutscene_start
