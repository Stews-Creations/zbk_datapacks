# === DELETE PLAYER BLOCK MARKER ===
# Kills the nearest player block marker

kill @e[type=marker,tag=player_block,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Player block marker deleted.","color":"red"}]
