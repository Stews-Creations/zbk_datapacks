# === DELETE BARRIER W3 MARKER ===
# Kills the nearest wide barrier marker

kill @e[type=marker,tag=barrier_w3,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Barrier (3-Wide) marker deleted.","color":"red"}]
