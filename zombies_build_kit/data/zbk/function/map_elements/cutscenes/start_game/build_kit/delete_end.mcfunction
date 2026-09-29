# ===================================
# START GAME CUTSCENE - DELETE END POSITION
# ===================================

execute unless entity @e[type=marker,tag=cutscene_start_finish,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"No end position exists.","color":"red"}]
execute unless entity @e[type=marker,tag=cutscene_start_finish,limit=1] run return 0

kill @e[type=marker,tag=cutscene_start_finish]

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 1
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"End position deleted.","color":"yellow"}]
