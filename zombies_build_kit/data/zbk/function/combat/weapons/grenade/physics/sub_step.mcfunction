# ===================================
# GRENADE SUB-STEP
# ===================================
# Purpose: Move grenade one sub-step (1/5 of tick velocity) and check collisions
# Executed as: Marker entity (grenade_marker)
# Called recursively up to 5 times per tick from update_position
# ===================================

# Teleport by 1/5 of tick velocity (NBT already stored in zbk:temp motion by update_position)
function zbk:combat/weapons/grenade/physics/move_by_velocity with storage zbk:temp motion


# Check solid block collision at new position
function zbk:dispatch/grenade_step
execute at @s unless block ~ ~ ~ #zbk:raycast_pass run function zbk:combat/weapons/grenade/explode

# Check mob hitbox collision (any living mob except excluded types)
execute if entity @s[tag=!exploded] at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[type=!#zbk:not_mob,type=!player,tag=!combat_ignore,tag=!immune_explosives,tag=!monkey_bomb_decoy,tag=!solo_down_decoy,tag=!turned_zombie,dx=0,dy=0,dz=0] run function zbk:combat/weapons/grenade/explode

# Check disco interaction collision
execute if entity @s[tag=!exploded] at @s if entity @e[type=interaction,tag=disco_interaction,distance=..1] run function zbk:combat/weapons/grenade/explode

# Recurse for remaining sub-steps (stop if exploded)
scoreboard players remove @s grenade_sub_step 1
execute if entity @s[tag=!exploded] if score @s grenade_sub_step matches 1.. run function zbk:combat/weapons/grenade/physics/sub_step
