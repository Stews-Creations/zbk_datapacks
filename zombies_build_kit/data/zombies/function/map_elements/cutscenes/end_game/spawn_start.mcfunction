# ===================================
# END GAME CUTSCENE - SPAWN START POSITION
# ===================================
# Purpose: Place the camera start position marker at the player's location
# Only one can exist at a time
# ===================================

# Block if timed marker exists
execute if entity @e[type=marker,tag=cutscene_end_timed,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"A timed cutscene already exists! Delete it first to use pan mode.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_end_timed,limit=1] run return 0

# Block placement if one already exists
execute if entity @e[type=marker,tag=cutscene_end_start,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start position already exists! Delete it first.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_end_start,limit=1] run return 0

# Summon marker at player position
summon marker ~ ~ ~ {Tags:["cutscene_end_start"]}
data modify entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed set value 2

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"End game camera START position placed!","color":"green"}]
