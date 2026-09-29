# === SELECTIVE FILL AIR - CHECK BLOCK ===
# Macro: checks block at (sx,sy,sz) in door_storage, sets (x,y,z) to air if non-air in storage
$execute positioned $(sx) $(sy) $(sz) in zbk:door_storage unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air positioned $(x) $(y) $(z) in minecraft:overworld run setblock ~ ~ ~ air
