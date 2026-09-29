# === DELETE POWER MARKER ===
# Deletes nearest build marker, removes runtime marker, and places power_delete with build marker yaw

execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s if score @s playerYaw matches -45..45 run place template zbk:power/power_delete ~ ~ ~ counterclockwise_90
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s if score @s playerYaw matches 45..135 run place template zbk:power/power_delete ~ ~ ~ none
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s if score @s playerYaw matches 135..180 run place template zbk:power/power_delete ~ ~ ~ clockwise_90
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s if score @s playerYaw matches -180..-135 run place template zbk:power/power_delete ~ ~ ~ clockwise_90
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s if score @s playerYaw matches -135..-45 run place template zbk:power/power_delete ~ ~ ~ 180

# Fallback for legacy markers without playerYaw
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s unless score @s playerYaw matches -180..180 run place template zbk:power/power_delete ~ ~ ~ none

# Remove runtime marker handled by power system
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] at @s run kill @e[type=marker,tag=power_marker,tag=power_runtime_marker,distance=..5,limit=1,sort=nearest]

# Delete the build marker itself
execute as @e[type=marker,tag=power_build_marker,distance=..6,limit=1,sort=nearest] run kill @s

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Power switch deleted.","color":"red"}]
