# ===================================
# 115 LAUNCH PAD - SPAWN PEAK MARKER
# ===================================
# Usage: Stand at the desired arc peak HEIGHT (X/Z auto-calculated)
# ===================================

execute unless score #active zbk.de matches 1 run return 0

summon marker ~ ~ ~ {Tags:["115_launch","115_launch_peak"]}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
tellraw @s [{"text":"[115 Launch] ","color":"light_purple","bold":true},{"text":"Peak height marker placed! (X/Z will be auto-calculated)","color":"yellow"}]
