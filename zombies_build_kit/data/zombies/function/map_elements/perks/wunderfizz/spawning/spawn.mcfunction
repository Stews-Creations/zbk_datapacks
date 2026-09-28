# === SPAWN DER WUNDERFIZZ MACHINE ===

# For each Wunderfizz Bat, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°)
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s if score @p playerYaw matches -45..45 run place template minecraft:zombies/wunderfizz ~-1 ~ ~ counterclockwise_90

# Facing West (yaw between 45° and 135°)
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s if score @p playerYaw matches 45..135 run place template minecraft:zombies/wunderfizz ~ ~ ~-1 none

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s if score @p playerYaw matches 135..180 run place template minecraft:zombies/wunderfizz ~1 ~ ~ clockwise_90
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s if score @p playerYaw matches -180..-135 run place template minecraft:zombies/wunderfizz ~1 ~ ~ clockwise_90

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s if score @p playerYaw matches -135..-45 run place template minecraft:zombies/wunderfizz ~ ~ ~1 180

# === STORE ROTATION IN WUNDERFIZZ MARKER ===
# The wunderfizz marker is inside the structure template. Store playerYaw for delete orientation.
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] at @s run execute as @p[distance=..50,sort=nearest] store result score @e[type=marker,tag=wunderfizz,tag=!wunderfizz_ui_spawned,distance=..3,limit=1,sort=nearest] playerYaw run data get entity @s Rotation[0] 1

# Cleanup — remove the Bat so it only runs once
execute as @e[type=minecraft:bat,name="Der Wunderfizz"] run kill @s
