# ===================================
# JUMP PAD - SPAWN END MARKER
# ===================================
# Purpose: Summon end/landing marker for jump pad arc
#
# Usage: Stand where you want the jump to end, run this function
# ===================================

summon marker ~ ~ ~ {Tags:["jump_pad","jp_end","jp_unlinked"]}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 0.5
tellraw @s [{"text":"[Jump Pad] ","color":"gold","bold":true},{"text":"End marker placed!","color":"red"}]
