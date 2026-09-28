# === DELETE PERK BONUS MARKER ===
# Kills the nearest perk bonus marker

kill @e[type=marker,tag=perk_bonus,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Perk bonus marker deleted.","color":"red"}]
