# ===================================
# JUMP PAD - SET PRICE
# ===================================
# Purpose: Set the price for a jump pad marker
# Called from build manager or dialog
#
# Usage: Execute as player, at jump pad marker
# Requires: $price macro parameter
# ===================================

$execute as @e[type=marker,tag=jump_pad,tag=jp_start,distance=..5,limit=1,sort=nearest] run data modify entity @s data.name set value $(price)

# Update text display
$execute as @e[type=text_display,tag=jump_pad_text_display,distance=..5,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Jump Pad\n","color":"aqua","bold":true},{"text":"$(price)","color":"yellow","bold":true}]

$tellraw @s [{"text":"[Jump Pad] ","color":"gold","bold":true},{"text":"Price set to $(price) points!","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
