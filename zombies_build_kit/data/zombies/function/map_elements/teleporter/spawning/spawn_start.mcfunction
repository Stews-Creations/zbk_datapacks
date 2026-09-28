# ===================================
# TELEPORTER - SPAWN START MARKER
# ===================================
# Purpose: Detect placed endermite spawn egg, summon start marker, kill endermite
# ===================================

execute as @e[type=minecraft:endermite,name="Teleporter Start"] at @s run function zombies:map_elements/teleporter/spawning/place_start
kill @e[type=minecraft:endermite,name="Teleporter Start"]
