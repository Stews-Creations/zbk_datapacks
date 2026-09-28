# ===================================
# MONKEY BOMB SUB-STEP
# ===================================
# Moves one sub-step and marks the monkey bomb landed on collision.

function zbk:combat/weapons/grenade/physics/move_by_velocity with storage zbk:temp motion

# Land when the marker reaches a solid block or touches the floor.
execute unless block ~ ~ ~ #zbk:raycast_pass run tag @s add monkey_bomb_landed
execute positioned ~ ~-0.15 ~ unless block ~ ~ ~ #zbk:raycast_pass run tag @s add monkey_bomb_landed

scoreboard players remove @s grenade_sub_step 1
execute if entity @s[tag=!monkey_bomb_landed] if score @s grenade_sub_step matches 1.. run function zbk:combat/weapons/special_equipment/monkey_bomb/physics/sub_step
