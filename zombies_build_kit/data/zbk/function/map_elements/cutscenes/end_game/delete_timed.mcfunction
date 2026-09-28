# ===================================
# END GAME CUTSCENE - DELETE TIMED MARKER
# ===================================

execute unless entity @e[type=marker,tag=cutscene_end_timed,limit=1] run tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"No timed marker exists.","color":"red"}]
execute unless entity @e[type=marker,tag=cutscene_end_timed,limit=1] run return 0

kill @e[type=marker,tag=cutscene_end_timed]

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 1
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Timed marker deleted.","color":"yellow"}]
