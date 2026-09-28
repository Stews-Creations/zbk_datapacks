# Place a Pack-a-Punch location sign marker and display.

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["de_pack_location_sign","de_pack_location_sign_south"]}
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s if score @p playerYaw matches 46..135 run summon marker ~ ~ ~ {Tags:["de_pack_location_sign","de_pack_location_sign_west"]}
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s if score @p playerYaw matches 136..180 run summon marker ~ ~ ~ {Tags:["de_pack_location_sign","de_pack_location_sign_north"]}
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s if score @p playerYaw matches -180..-136 run summon marker ~ ~ ~ {Tags:["de_pack_location_sign","de_pack_location_sign_north"]}
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s if score @p playerYaw matches -135..-46 run summon marker ~ ~ ~ {Tags:["de_pack_location_sign","de_pack_location_sign_east"]}

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s as @e[type=marker,tag=de_pack_location_sign,tag=!de_pack_location_sign_initialized,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/sign/create_display
execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] at @s as @e[type=marker,tag=de_pack_location_sign,tag=!de_pack_location_sign_initialized,distance=..1,limit=1,sort=nearest] run tag @s add de_pack_location_sign_initialized

execute as @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] run kill @s
