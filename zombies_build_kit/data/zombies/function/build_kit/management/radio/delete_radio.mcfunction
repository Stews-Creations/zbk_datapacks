# Build Manager - Delete Radio
# Finds the nearest radio marker within 5 blocks and kills it + its display and interaction entities

execute as @e[type=marker,tag=radio_marker,distance=..5,limit=1,sort=nearest] at @s run function zombies:build_kit/management/radio/delete_radio_entities
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Radio deleted.","color":"red"}]
