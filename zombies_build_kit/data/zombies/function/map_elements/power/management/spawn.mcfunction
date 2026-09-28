# === SPAWN POWER STRUCTURE ===
# Runs when a Power Switch bat is detected

# For each Power Switch Bat, Store yaw into scoreboard objective "playerYaw"
execute as @e[type=minecraft:bat,name="Power Switch"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45 and 45)
execute as @e[type=minecraft:bat,name="Power Switch"] at @s if score @p playerYaw matches -45..45 run place template minecraft:zombies/power ~ ~ ~ counterclockwise_90

# Facing West (yaw between 45 and 135)
execute as @e[type=minecraft:bat,name="Power Switch"] at @s if score @p playerYaw matches 45..135 run place template minecraft:zombies/power ~ ~ ~ none

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:bat,name="Power Switch"] at @s if score @p playerYaw matches 135..180 run place template minecraft:zombies/power ~ ~ ~ clockwise_90
execute as @e[type=minecraft:bat,name="Power Switch"] at @s if score @p playerYaw matches -180..-135 run place template minecraft:zombies/power ~ ~ ~ clockwise_90

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:bat,name="Power Switch"] at @s if score @p playerYaw matches -135..-45 run place template minecraft:zombies/power ~ ~ ~ 180

# Tag template marker as runtime-only (gameplay) so Build Manager ignores it
execute as @e[type=minecraft:bat,name="Power Switch"] at @s run tag @e[type=marker,tag=power_marker,distance=..5,limit=1,sort=nearest] add power_runtime_marker

# === CREATE BUILD KIT POWER MARKER ===
execute as @e[type=minecraft:bat,name="Power Switch"] at @s run summon marker ~ ~ ~ {Tags:["power_build_marker","power_new"]}
execute as @e[type=marker,tag=power_new] at @s run execute as @p[distance=..50,sort=nearest] store result score @e[type=marker,tag=power_new,limit=1,sort=nearest] playerYaw run data get entity @s Rotation[0] 1
tag @e[type=marker,tag=power_new] remove power_new

# Cleanup - remove the Bat so it only runs once
execute as @e[type=minecraft:bat,name="Power Switch"] run kill @s
