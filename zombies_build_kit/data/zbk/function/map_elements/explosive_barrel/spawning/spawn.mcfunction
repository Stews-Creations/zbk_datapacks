# ===================================
# EXPLOSIVE BARREL - SPAWN
# ===================================
# Purpose: Detect placed creeper spawn egg, summon the barrel prop, kill the creeper
# Called every tick when a creeper named "Explosive Barrel" exists

execute as @e[type=minecraft:creeper,name="Explosive Barrel"] at @s run function zbk:map_elements/explosive_barrel/spawning/place
kill @e[type=minecraft:creeper,name="Explosive Barrel"]
