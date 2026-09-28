# ===================================
# 115 LAUNCH PAD - SPAWN START MARKER
# ===================================
# Usage: Stand where the launch pad trigger area should be
# ===================================

execute unless score #active zbk.de matches 1 run return 0

summon marker ~ ~ ~ {Tags:["115_launch","115_launch_start"]}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
tellraw @s [{"text":"[115 Launch] ","color":"light_purple","bold":true},{"text":"Start marker placed!","color":"green"}]
