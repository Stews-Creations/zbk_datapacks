# === SPAWN POWERED DOOR MARKER ===
# Runs when a Powered Door Marker mob is detected
# Only spawns the marker, not the structure (structure is spawned by reset function)

# ===== ORIGINAL POWERED DOOR (BLAZE) =====
# For each Powered Door Marker Blaze, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door_powered","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door_powered","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door_powered","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door_powered","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door_powered","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Blaze so it only runs once
execute as @e[type=minecraft:blaze,name="Powered Door Marker"] run kill @s

# ===== POWERED STAIRS DOOR (WITHER SKELETON) =====
# For each Powered Stairs Door Marker, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_stairs","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_stairs","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_stairs","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_stairs","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_stairs","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Wither Skeleton so it only runs once
execute as @e[type=minecraft:wither_skeleton,name="Powered Stairs Door Marker"] run kill @s

# ===== POWERED POWER ROOM DOOR (ELDER GUARDIAN) =====
# For each Powered Power Room Door Marker, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_power_room","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_power_room","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_power_room","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_power_room","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_power_room","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Elder Guardian so it only runs once
execute as @e[type=minecraft:elder_guardian,name="Powered Power Room Door Marker"] run kill @s

# ===== POWERED CHURCH DOOR (SHULKER) =====
# For each Powered Church Door Marker, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_church","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_church","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_church","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_church","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door_powered","door_powered_church","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Shulker so it only runs once
execute as @e[type=minecraft:shulker,name="Powered Church Door Marker"] run kill @s

# Reset and spawn door
function zombies:map_elements/door/initialize
