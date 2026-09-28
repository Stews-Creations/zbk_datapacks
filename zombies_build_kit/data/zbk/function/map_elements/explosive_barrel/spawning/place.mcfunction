# ===================================
# EXPLOSIVE BARREL - PLACE
# ===================================
# Purpose: Summon the invisible marker (build-stick target) and the barrel display entities
# Called as @s = the creeper, at @s = its position

# Summon the invisible marker for build stick targeting
summon marker ~ ~ ~ {Tags:["build_manager_target","explosive_barrel"]}

# Set initial barrel health
scoreboard players set @e[type=marker,tag=explosive_barrel,distance=..1,sort=nearest,limit=1] barrel_health 100

# Summon display and interaction entities
function zbk:map_elements/explosive_barrel/spawning/spawn_displays
