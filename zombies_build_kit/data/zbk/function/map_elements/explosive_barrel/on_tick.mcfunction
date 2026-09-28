# ===================================
# EXPLOSIVE BARREL MODULE - TICK
# ===================================
# Purpose: Detect placed explosive barrel spawn eggs (creepers) and convert to prop

execute if entity @e[type=minecraft:creeper,name="Explosive Barrel"] run function zbk:map_elements/explosive_barrel/spawning/spawn

# Fire particles on damaged barrels (health < 100, not yet exploded)
execute as @e[type=marker,tag=explosive_barrel,tag=!explosive_barrel_exploded] at @s run function zbk:map_elements/explosive_barrel/gameplay/on_tick_barrel
