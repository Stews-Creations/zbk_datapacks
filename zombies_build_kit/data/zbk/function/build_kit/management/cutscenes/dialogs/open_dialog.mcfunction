# Open cutscene marker management dialog
# Reads speed from the start marker (canonical source) and shows macro dialog with speed slider
# Default speed is 2 for markers without speed data (backward compatibility)

# === END GAME CUTSCENE MARKERS ===

# End game - Start position marker (speed is stored here)
execute at @s if entity @e[type=marker,tag=cutscene_end_start,distance=..5,limit=1,sort=nearest] run data modify storage zbk:temp cutscene.speed set value 2
execute at @s if entity @e[type=marker,tag=cutscene_end_start,distance=..5,limit=1,sort=nearest] if data entity @e[type=marker,tag=cutscene_end_start,distance=..5,limit=1,sort=nearest] data.speed store result storage zbk:temp cutscene.speed int 1 run data get entity @e[type=marker,tag=cutscene_end_start,distance=..5,limit=1,sort=nearest] data.speed
execute at @s if entity @e[type=marker,tag=cutscene_end_start,distance=..5,limit=1,sort=nearest] run function zbk:build_kit/management/cutscenes/dialogs/show_end_pan_start with storage zbk:temp cutscene

# End game - End position marker (reads speed from start marker)
execute at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..5,limit=1,sort=nearest] run data modify storage zbk:temp cutscene.speed set value 2
execute at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..5,limit=1,sort=nearest] if entity @e[type=marker,tag=cutscene_end_start,limit=1] if data entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed store result storage zbk:temp cutscene.speed int 1 run data get entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed
execute at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..5,limit=1,sort=nearest] run function zbk:build_kit/management/cutscenes/dialogs/show_end_pan_end with storage zbk:temp cutscene

# === START GAME CUTSCENE MARKERS ===

# Start game - Start position marker (speed is stored here)
execute at @s if entity @e[type=marker,tag=cutscene_start_start,distance=..5,limit=1,sort=nearest] run data modify storage zbk:temp cutscene.speed set value 2
execute at @s if entity @e[type=marker,tag=cutscene_start_start,distance=..5,limit=1,sort=nearest] if data entity @e[type=marker,tag=cutscene_start_start,distance=..5,limit=1,sort=nearest] data.speed store result storage zbk:temp cutscene.speed int 1 run data get entity @e[type=marker,tag=cutscene_start_start,distance=..5,limit=1,sort=nearest] data.speed
execute at @s if entity @e[type=marker,tag=cutscene_start_start,distance=..5,limit=1,sort=nearest] run function zbk:build_kit/management/cutscenes/dialogs/show_start_pan_start with storage zbk:temp cutscene

# Start game - End position marker (reads speed from start marker)
execute at @s if entity @e[type=marker,tag=cutscene_start_finish,distance=..5,limit=1,sort=nearest] run data modify storage zbk:temp cutscene.speed set value 2
execute at @s if entity @e[type=marker,tag=cutscene_start_finish,distance=..5,limit=1,sort=nearest] if entity @e[type=marker,tag=cutscene_start_start,limit=1] if data entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed store result storage zbk:temp cutscene.speed int 1 run data get entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed
execute at @s if entity @e[type=marker,tag=cutscene_start_finish,distance=..5,limit=1,sort=nearest] run function zbk:build_kit/management/cutscenes/dialogs/show_start_pan_end with storage zbk:temp cutscene
