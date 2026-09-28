# ===================================
# WALL GUN MODULE - INITIALIZE
# ===================================
# Purpose: Reset/initialize all wall gun display entities
# Called from on_load.mcfunction and game reset
# ===================================

# Kill old display entities
kill @e[type=text_display,tag=wall_gun_ui]
kill @e[type=item_display,tag=wall_gun_ui]
kill @e[type=interaction,tag=wall_gun_interaction]

# Spawn displays for each wall gun marker
execute as @e[type=marker,tag=wall_gun] at @s run function zombies:map_elements/wall_gun/display/update_display

# Debug confirmation
function zombies:debug/info {f:"WALL",m:"Wall gun system initialized"}
