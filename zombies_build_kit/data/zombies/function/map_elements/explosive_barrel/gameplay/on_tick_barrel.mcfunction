# ===================================
# EXPLOSIVE BARREL - PER-BARREL TICK
# ===================================
# Purpose: Show fire particles on damaged (but not exploded) barrels
# Called as @s = explosive_barrel marker, at @s = its position

# Fire/smoke particles at barrel top when health < 100
execute if score @s barrel_health matches ..99 run particle minecraft:flame ~ ~1.2 ~ 0.2 0.3 0.2 0.05 3 normal @a
execute if score @s barrel_health matches ..99 run particle minecraft:smoke ~ ~1.4 ~ 0.15 0.2 0.15 0.02 2 normal @a
