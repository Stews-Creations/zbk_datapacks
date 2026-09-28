# ===================================
# TELEPORTER - SHOW RETURN DISPLAY
# ===================================
# Purpose: Show the price on the end marker text display for return trips
# Executed as the end marker, at the end marker
# ===================================

execute as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Teleporter\n","color":"light_purple","bold":true},{"score":{"name":"$teleporter_temp","objective":"teleporter_price"},"color":"yellow","bold":true}]
execute as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value 127b
