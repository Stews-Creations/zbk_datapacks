# Cosmetic exhaust only, emitted while the bash moves; no placed fire or scheduled cleanup.
execute positioned ^0.2 ^0.45 ^-0.3 run particle minecraft:flame ~ ~ ~ 0.08 0.12 0.08 0.015 3 normal @a[distance=..32]
execute positioned ^-0.2 ^0.45 ^-0.3 run particle minecraft:flame ~ ~ ~ 0.08 0.12 0.08 0.015 3 normal @a[distance=..32]
# Eye-relative sparks stay in the basher's view, including when looking up/down.
execute at @s anchored eyes rotated as @s positioned ^0.45 ^-0.15 ^1.3 run particle minecraft:flame ~ ~ ~ 0.10 0.12 0.08 0.01 4 force @s
execute at @s anchored eyes rotated as @s positioned ^-0.45 ^-0.15 ^1.3 run particle minecraft:flame ~ ~ ~ 0.10 0.12 0.08 0.01 4 force @s
