# ===================================
# TELEPORTER - SHOW START DISPLAY
# ===================================
# Purpose: Show the price on the start marker text display
# Executed as the start marker
# ===================================

scoreboard players set $teleporter_temp teleporter_price 0
execute store result score $teleporter_temp teleporter_price run data get entity @s data.name 1
execute as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Teleporter\n","color":"light_purple","bold":true},{"score":{"name":"$teleporter_temp","objective":"teleporter_price"},"color":"yellow","bold":true}]
execute as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value 127b
