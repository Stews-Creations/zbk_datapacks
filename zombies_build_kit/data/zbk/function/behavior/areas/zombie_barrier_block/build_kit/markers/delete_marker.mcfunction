# === DELETE ZOMBIE BLOCK MARKER ===
# Kills the nearest zombie block marker

kill @e[type=marker,tag=barrier_zombie_block,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Zombie block marker deleted.","color":"red"}]
