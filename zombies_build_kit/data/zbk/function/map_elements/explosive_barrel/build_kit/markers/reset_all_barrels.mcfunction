# ===================================
# BUILD KIT - RESET ALL EXPLOSIVE BARRELS
# ===================================
# Purpose: Reset all explosive barrels to full health and respawn their displays
# Called from: map_elements dialog button

function zbk:map_elements/explosive_barrel/initialize
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"All explosive barrels reset.","color":"green"}]
