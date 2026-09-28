# ===================================
# TELEPORTER - SPAWN AUTO-RETURN MARKER
# ===================================
# Purpose: Detect placed endermite spawn egg, summon auto-return marker, kill endermite
# ===================================

execute as @e[type=minecraft:endermite,name="Teleporter Auto Return"] at @s run function zbk:map_elements/teleporter/spawning/place_auto_return
kill @e[type=minecraft:endermite,name="Teleporter Auto Return"]
