# === SPAWN JUGGERNOG MACHINE ===

# For each Juggernog Bat, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:bat,name=Juggernog] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°)
execute as @e[type=minecraft:bat,name=Juggernog] at @s if score @p playerYaw matches -45..45 run place template minecraft:zombies/juggernog ~-1 ~ ~ counterclockwise_90

# Facing West (yaw between 45° and 135°)
execute as @e[type=minecraft:bat,name=Juggernog] at @s if score @p playerYaw matches 45..135 run place template minecraft:zombies/juggernog ~ ~ ~-1 none

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:bat,name=Juggernog] at @s if score @p playerYaw matches 135..180 run place template minecraft:zombies/juggernog ~1 ~ ~ clockwise_90
execute as @e[type=minecraft:bat,name=Juggernog] at @s if score @p playerYaw matches -180..-135 run place template minecraft:zombies/juggernog ~1 ~ ~ clockwise_90

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:bat,name=Juggernog] at @s if score @p playerYaw matches -135..-45 run place template minecraft:zombies/juggernog ~ ~ ~1 180

# === CREATE PERK MARKER ===
execute as @e[type=minecraft:bat,name=Juggernog] at @s run summon marker ~ ~ ~ {Tags:["perk_machine","perk_juggernog","perk_new"]}
execute as @e[type=marker,tag=perk_new] at @s run execute as @p[distance=..50,sort=nearest] store result score @e[type=marker,tag=perk_new,limit=1,sort=nearest] playerYaw run data get entity @s Rotation[0] 1
tag @e[type=marker,tag=perk_new] remove perk_new

# Cleanup — remove the Bat so it only runs once
execute as @e[type=minecraft:bat,name=Juggernog] run kill @s
