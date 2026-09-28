# ===================================
# EXPLOSIVE BARREL - HIT BY BULLET
# ===================================
# Purpose: Apply flat damage to barrel health per bullet hit, explode if health reaches 0
# Called as @s = the explosive_barrel_interaction entity (from raycast)
# Flat 34 damage per hit = 3 shots to explode (regardless of weapon)

# Find the barrel marker at this position and subtract flat 34 damage
execute as @e[type=marker,tag=explosive_barrel,tag=!explosive_barrel_exploded,distance=..2,limit=1,sort=nearest] run scoreboard players remove @s barrel_health 34

# Hit particle feedback
particle minecraft:block{block_state:{Name:"minecraft:red_concrete"}} ~ ~0.8 ~ 0.3 0.3 0.3 2 10

# If health <= 0, explode
execute as @e[type=marker,tag=explosive_barrel,tag=!explosive_barrel_exploded,distance=..2,limit=1,sort=nearest] if score @s barrel_health matches ..0 at @s run function zbk:map_elements/explosive_barrel/gameplay/explode
