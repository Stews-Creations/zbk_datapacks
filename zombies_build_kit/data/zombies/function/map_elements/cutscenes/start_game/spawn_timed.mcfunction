# ===================================
# START GAME CUTSCENE - SPAWN TIMED MARKER
# ===================================
# Single marker with configurable duration. Only one can exist.
# Default length: 5 seconds
# ===================================

# Block if pan markers exist
execute if entity @e[type=marker,tag=cutscene_start_start,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Pan markers already exist! Delete them first to use timed mode.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_start_start,limit=1] run return 0
execute if entity @e[type=marker,tag=cutscene_start_finish,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Pan markers already exist! Delete them first to use timed mode.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_start_finish,limit=1] run return 0

execute if entity @e[type=marker,tag=cutscene_start_timed,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Timed marker already exists! Delete it first.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_start_timed,limit=1] run return 0

summon marker ~ ~ ~ {Tags:["cutscene_start_timed"],data:{length:5,yaw:0.0f,pitch:0.0f}}

# Store player's current facing into the marker
execute store result entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.yaw float 1 run data get entity @s Rotation[0]
execute store result entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.pitch float 1 run data get entity @s Rotation[1]

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start game timed cutscene placed facing your direction! Default: 5s. Use Build Stick to configure.","color":"green"}]
