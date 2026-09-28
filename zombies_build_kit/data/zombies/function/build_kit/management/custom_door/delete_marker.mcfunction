# === DELETE CUSTOM DOOR MARKER ===
# Kills the nearest custom_door marker within 5 blocks

execute at @s run kill @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Custom door marker deleted","color":"green"}]
