# ===================================
# BUILD KIT - RESET SINGLE EXPLOSIVE BARREL
# ===================================
# Purpose: Reset the nearest explosive barrel to full health and respawn its display
# Called from: explosive_barrel_marker dialog button

execute as @e[type=marker,tag=explosive_barrel,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/explosive_barrel/gameplay/respawn_display
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Explosive barrel reset.","color":"green"}]
