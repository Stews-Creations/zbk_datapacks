# === DELETE WUNDERFIZZ ===
# Deletes the nearest wunderfizz and all its associated entities

execute as @e[type=marker,tag=wunderfizz,distance=..5,limit=1,sort=nearest] at @s run function zbk:build_kit/management/wunderfizz/delete_entities

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Wunderfizz deleted.","color":"red"}]
