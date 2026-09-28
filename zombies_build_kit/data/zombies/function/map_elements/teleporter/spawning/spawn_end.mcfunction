# ===================================
# TELEPORTER - SPAWN END MARKER
# ===================================
# Purpose: Detect placed endermite spawn egg, summon end marker, kill endermite
# ===================================

execute as @e[type=minecraft:endermite,name="Teleporter End"] at @s run function zombies:map_elements/teleporter/spawning/place_end
kill @e[type=minecraft:endermite,name="Teleporter End"]
