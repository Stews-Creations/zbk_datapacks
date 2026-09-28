# === SPAWN ELECTRIC TRAP BOTTOM LEFT ===
# Runs as the detected glow item frame for corner 1.

execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["trap_corner","trap_corner1"]}
particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Bottom Left corner placed!","color":"gold"}]
function zombies:build_kit/util/placement/cleanup
