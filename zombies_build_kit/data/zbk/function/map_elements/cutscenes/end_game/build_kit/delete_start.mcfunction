# ===================================
# END GAME CUTSCENE - DELETE START POSITION
# ===================================

execute unless entity @e[type=marker,tag=cutscene_end_start,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"No start position exists.","color":"red"}]
execute unless entity @e[type=marker,tag=cutscene_end_start,limit=1] run return 0

kill @e[type=marker,tag=cutscene_end_start]

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 1
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start position deleted.","color":"yellow"}]
