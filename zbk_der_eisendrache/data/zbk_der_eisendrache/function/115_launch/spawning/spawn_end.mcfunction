# ===================================
# 115 LAUNCH PAD - SPAWN END MARKER
# ===================================
# Usage: Stand where the launch should land
# ===================================

execute unless score #active zbk.de matches 1 run return 0

summon marker ~ ~ ~ {Tags:["115_launch","115_launch_end"]}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 0.5
tellraw @s [{"text":"[115 Launch] ","color":"light_purple","bold":true},{"text":"End marker placed!","color":"red"}]
