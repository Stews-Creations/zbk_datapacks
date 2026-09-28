# ===================================
# RADIO - SPAWN
# ===================================
# Purpose: Detect placed bat spawn egg, summon the radio prop, kill the bat

execute as @e[type=minecraft:bat,name="Radio"] at @s run function zombies:map_elements/radio/spawning/place
kill @e[type=minecraft:bat,name="Radio"]
