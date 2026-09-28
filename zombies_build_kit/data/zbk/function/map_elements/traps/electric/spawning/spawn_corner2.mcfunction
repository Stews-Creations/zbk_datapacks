# === SPAWN ELECTRIC TRAP TOP RIGHT ===
# Runs as the detected glow item frame for corner 2.

execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["trap_corner","trap_corner2"]}
particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Top Right corner placed!","color":"gold"}]
function zbk:build_kit/util/placement/cleanup
