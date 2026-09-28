# === DELETE SPAWNER MARKER ===
# Macro function - receives spawner_tag and spawner_type
# Kills only the specific type of spawner marker

$execute at @s run kill @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest]
$tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"$(spawner_type) spawner marker deleted.","color":"red"}]
