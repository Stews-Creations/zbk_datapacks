# Build Manager - Delete Explosive Barrel
# Finds the nearest explosive barrel marker within 5 blocks and kills it + its display entity

execute as @e[type=marker,tag=explosive_barrel,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/explosive_barrel/build_kit/markers/delete_barrel_entities
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Explosive barrel deleted.","color":"red"}]
