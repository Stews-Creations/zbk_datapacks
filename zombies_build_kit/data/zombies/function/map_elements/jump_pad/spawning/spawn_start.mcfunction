# ===================================
# JUMP PAD - SPAWN START MARKER
# ===================================
# Purpose: Summon start marker for jump pad arc with purchasable interaction
#
# Usage: Stand where you want the jump to start, run this function
# ===================================

# Summon marker with fixed price of 500 (unlinked by default)
summon marker ~ ~ ~ {Tags:["jump_pad","jp_start","jp_unlinked","jp_locked"],data:{name:500,cooldown:120,require_unlock:1}}

# Summon text display showing price
summon text_display ~ ~1 ~ {Tags:["jump_pad_ui","jump_pad_text_display"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Jump Pad\n","color":"aqua","bold":true},{"text":"500","color":"yellow","bold":true}],text_opacity:-1b}

# Summon interaction entity for click detection
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["jump_pad_interaction"]}

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
tellraw @s [{"text":"[Jump Pad] ","color":"gold","bold":true},{"text":"Start marker placed with default price of 500!","color":"green"}]
