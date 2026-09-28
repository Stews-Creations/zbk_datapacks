# ===================================
# SPAWN GRENADE (SHARED)
# ===================================
# Purpose: Core grenade spawning logic used by both hand-thrown and launcher
# Executed as: Player throwing/launching the grenade
# Dependencies: calculate_velocity.mcfunction
# Note: Ammo consumption is handled by the caller
# ===================================

# Summon marker at player's eye level for physics tracking
execute anchored eyes run summon marker ^ ^ ^0.5 {Tags:["new_grenade","grenade_marker","active_grenade"]}

# Calculate initial velocity based on look direction
execute as @e[type=marker,tag=new_grenade,limit=1] at @s rotated as @p run function zombies:combat/weapons/grenade/physics/calculate_velocity

# Summon item display for visual representation
execute anchored eyes run summon item_display ^ ^ ^0.5 {Tags:["grenade_display"],teleport_duration:2,item:{id:"minecraft:snowball",components:{item_model:"zbk:grenade"}},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f]},brightness:{sky:15,block:15}}

# Store thrower ID for damage tracking
execute store result entity @e[type=marker,tag=new_grenade,limit=1] data.thrower_id int 1 run scoreboard players get @s id

# Initialize distance counter to 0
scoreboard players set @e[type=marker,tag=new_grenade,limit=1] grenade_distance 0

# Assign unique grenade ID to link marker and display
scoreboard players add #grenade_id_counter grenade_id 1
scoreboard players operation @e[type=marker,tag=new_grenade,limit=1] grenade_id = #grenade_id_counter grenade_id
execute at @e[type=marker,tag=new_grenade,limit=1] run scoreboard players operation @e[type=item_display,tag=grenade_display,sort=nearest,limit=1,distance=..1] grenade_id = #grenade_id_counter grenade_id

# Remove new tag
tag @e[type=marker,tag=new_grenade] remove new_grenade
