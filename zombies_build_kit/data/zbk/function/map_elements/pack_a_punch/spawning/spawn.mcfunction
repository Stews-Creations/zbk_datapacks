# ===================================
# PACK-A-PUNCH - SPAWN
# ===================================
# Purpose: Detect named bats and create Pack-a-Punch markers with orientation
# Runs every tick to check for new Pack a Punch Marker bats
# ===================================

# For each Pack a Punch Marker bat, store yaw of nearest player
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45 and 45) - Player looking south
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["pack_a_punch","pack_a_punch_south"]}
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -45..45 run place template zbk:pack_a_punch/pack_a_punch ~-1 ~ ~ none

# Facing West (yaw between 46 and 135) - Player looking west
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches 46..135 run summon marker ~ ~ ~ {Tags:["pack_a_punch","pack_a_punch_west"]}
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches 46..135 run place template zbk:pack_a_punch/pack_a_punch ~ ~ ~-1 clockwise_90

# Facing North (yaw between 136..180 or -180..-136) - Player looking north
# Two ranges because Minecraft yaw wraps at ±180 — both ends represent "looking north".
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches 136..180 run summon marker ~ ~ ~ {Tags:["pack_a_punch","pack_a_punch_north"]}
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches 136..180 run place template zbk:pack_a_punch/pack_a_punch ~1 ~ ~ 180
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -180..-136 run summon marker ~ ~ ~ {Tags:["pack_a_punch","pack_a_punch_north"]}
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -180..-136 run place template zbk:pack_a_punch/pack_a_punch ~1 ~ ~ 180

# Facing East (yaw between -135..-46) - Player looking east
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -135..-46 run summon marker ~ ~ ~ {Tags:["pack_a_punch","pack_a_punch_east"]}
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] at @s if score @p playerYaw matches -135..-46 run place template zbk:pack_a_punch/pack_a_punch ~ ~ ~1 counterclockwise_90

# Cleanup - kill the bat so it only runs once
execute as @e[type=minecraft:bat,name="Pack a Punch Marker"] run kill @s

# Spawn displays for the newly-summoned marker(s) only — don't touch existing machines.
# Calling the global initialize would nuke every PAP's displays via its `kill @e[tag=pack_a_punch_ui]`
# and wipe any in-flight buy animation. Global init is only for /reload (handled via on_load).
execute as @e[type=marker,tag=pack_a_punch,tag=!pack_a_punch_initialized] at @s run function zbk:map_elements/pack_a_punch/display/update_display
execute as @e[type=marker,tag=pack_a_punch,tag=!pack_a_punch_initialized] run tag @s add pack_a_punch_initialized
