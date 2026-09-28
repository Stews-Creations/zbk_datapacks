# === DELETE PERK MACHINE ===
# Deletes the nearest perk machine and all its associated entities

execute as @e[type=marker,tag=perk_machine,distance=..5,limit=1,sort=nearest] at @s run function zombies:build_kit/management/perk_machine/delete_entities

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Perk machine deleted.","color":"red"}]
