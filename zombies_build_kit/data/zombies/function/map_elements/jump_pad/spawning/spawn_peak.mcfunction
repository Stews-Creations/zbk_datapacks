# ===================================
# JUMP PAD - SPAWN PEAK MARKER
# ===================================
# Purpose: Summon peak height marker for jump pad arc
#
# Usage: Stand at the desired arc peak HEIGHT (X/Z position doesn't matter)
# The arc will automatically calculate the horizontal midpoint between start and end
# ===================================

summon marker ~ ~ ~ {Tags:["jump_pad","jp_peak","jp_unlinked"]}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
tellraw @s [{"text":"[Jump Pad] ","color":"gold","bold":true},{"text":"Peak height marker placed! (X/Z position will be auto-calculated)","color":"yellow"}]
