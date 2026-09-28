# === SPAWN DOOR MARKER ===
# Runs when a Door Marker bat is detected
# Only spawns the marker, not the structure (structure is spawned by reset function)

# For each Door Marker Bat, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:bat,name="Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:bat,name="Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:bat,name="Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:bat,name="Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:bat,name="Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:bat,name="Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Bat so it only runs once
execute as @e[type=minecraft:bat,name="Door Marker"] run kill @s

# ===== GATE DOOR (ZOMBIE) =====
# For each Gate Door Marker Zombie, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door","door_gate","door_south"],data:{name:1500,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door","door_gate","door_west"],data:{name:1500,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door","door_gate","door_north"],data:{name:1500,zones:[0]}}
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door","door_gate","door_north"],data:{name:1500,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door","door_gate","door_east"],data:{name:1500,zones:[0]}}

# Cleanup — remove the Zombie so it only runs once
execute as @e[type=minecraft:zombie,name="Gate Door Marker"] run kill @s

# ===== JUMP SPOT (PARROT) =====
# For each Jump Spot Marker Parrot, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°) - Tag with orientation
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["door","door_jump_spot","door_south"],data:{name:1000,zones:[0]}}

# Facing West (yaw between 45° and 135°) - Tag with orientation
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["door","door_jump_spot","door_west"],data:{name:1000,zones:[0]}}

# Facing North (yaw between 135..180 or -180..-135) - Tag with orientation
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["door","door_jump_spot","door_north"],data:{name:1000,zones:[0]}}
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["door","door_jump_spot","door_north"],data:{name:1000,zones:[0]}}

# Facing East (yaw between -135..-45) - Tag with orientation
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["door","door_jump_spot","door_east"],data:{name:1000,zones:[0]}}

# Cleanup — remove the Parrot so it only runs once
execute as @e[type=minecraft:parrot,name="Jump Spot Marker"] run kill @s

# Reset and spawn door
function zombies:map_elements/door/initialize
