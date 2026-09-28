# === DELETE BARRIER MARKER ===
# Kills the nearest barrier marker

kill @e[type=marker,tag=barrier,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Barrier marker deleted.","color":"red"}]
