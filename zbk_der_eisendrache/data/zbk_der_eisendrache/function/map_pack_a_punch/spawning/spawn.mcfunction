# ===================================
# DER EISENDRACHE MAP PACK-A-PUNCH - SPAWN LOCATION
# ===================================
# Detect named bats and create dormant map PaP location markers with orientation.

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45 and 45) - Player looking south.
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["map_pack_a_punch_location","map_pap_south"]}

# Facing West (yaw between 46 and 135) - Player looking west.
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s if score @p playerYaw matches 46..135 run summon marker ~ ~ ~ {Tags:["map_pack_a_punch_location","map_pap_west"]}

# Facing North (yaw between 136..180 or -180..-136) - Player looking north.
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s if score @p playerYaw matches 136..180 run summon marker ~ ~ ~ {Tags:["map_pack_a_punch_location","map_pap_north"]}
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s if score @p playerYaw matches -180..-136 run summon marker ~ ~ ~ {Tags:["map_pack_a_punch_location","map_pap_north"]}

# Facing East (yaw between -135..-46) - Player looking east.
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s if score @p playerYaw matches -135..-46 run summon marker ~ ~ ~ {Tags:["map_pack_a_punch_location","map_pap_east"]}

# Initialize only the marker that was just placed near each egg.
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pap_location_initialized,distance=..1,limit=1,sort=nearest] run scoreboard players set @s map_pap_visited 0
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pap_location_initialized,distance=..1,limit=1,sort=nearest] run scoreboard players set @s map_pap_uses 0
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pap_location_initialized,distance=..1,limit=1,sort=nearest] run scoreboard players set @s map_pap_rounds 0
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pap_location_initialized,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn_location_ui
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pap_location_initialized,distance=..1,limit=1,sort=nearest] run tag @s add map_pap_location_initialized

function zbk_der_eisendrache:map_pack_a_punch/location_manager/reset_ids

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] run kill @s
