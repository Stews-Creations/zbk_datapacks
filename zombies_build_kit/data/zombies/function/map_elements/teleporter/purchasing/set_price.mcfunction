# ===================================
# TELEPORTER - SET PRICE
# ===================================
# Purpose: Set the price for a teleporter marker
# Requires: $price macro parameter
# ===================================

$execute as @e[type=marker,tag=teleporter,tag=tp_start,distance=..5,limit=1,sort=nearest] run data modify entity @s data.name set value $(price)

# Update text display
$execute as @e[type=text_display,tag=teleporter_text_display,distance=..5,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Teleporter\n","color":"light_purple","bold":true},{"text":"$(price)","color":"yellow","bold":true}]

$tellraw @s [{"text":"[Teleporter] ","color":"light_purple","bold":true},{"text":"Price set to $(price) points!","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
