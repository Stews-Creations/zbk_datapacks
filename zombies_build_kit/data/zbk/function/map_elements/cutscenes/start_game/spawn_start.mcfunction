# ===================================
# START GAME CUTSCENE - SPAWN START POSITION
# ===================================
# Only one can exist at a time
# ===================================

# Block if timed marker exists
execute if entity @e[type=marker,tag=cutscene_start_timed,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"A timed cutscene already exists! Delete it first to use pan mode.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_start_timed,limit=1] run return 0

execute if entity @e[type=marker,tag=cutscene_start_start,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start position already exists! Delete it first.","color":"red"}]
execute if entity @e[type=marker,tag=cutscene_start_start,limit=1] run return 0

summon marker ~ ~ ~ {Tags:["cutscene_start_start"]}
data modify entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed set value 2

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start game cutscene START position placed!","color":"green"}]
