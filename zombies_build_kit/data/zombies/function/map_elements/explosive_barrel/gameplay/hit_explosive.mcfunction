# ===================================
# EXPLOSIVE BARREL - HIT BY EXPLOSIVE
# ===================================
# Purpose: Instantly explode barrel when hit by grenade, ray gun, or other explosive
# Called as @s = the explosive_barrel_interaction entity (from raycast) or marker (from grenade)

# If called as interaction entity, find the marker and explode
execute as @e[type=marker,tag=explosive_barrel,tag=!explosive_barrel_exploded,distance=..2,limit=1,sort=nearest] at @s run function zombies:map_elements/explosive_barrel/gameplay/explode
