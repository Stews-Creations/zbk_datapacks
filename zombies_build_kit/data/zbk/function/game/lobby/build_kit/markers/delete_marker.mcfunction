# === DELETE WORLDSPAWN MARKER ===
# Kills the nearest worldspawn marker

kill @e[type=marker,tag=worldspawn,distance=..5,limit=1,sort=nearest]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Worldspawn marker deleted.","color":"red"}]
