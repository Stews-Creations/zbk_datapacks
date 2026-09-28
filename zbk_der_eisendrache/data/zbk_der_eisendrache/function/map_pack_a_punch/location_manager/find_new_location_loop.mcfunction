# Pick the next map PaP location by placement ID, wrapping around deleted gaps.

execute as @e[type=marker,tag=map_pack_a_punch_location] if score @s map_pap_location_id = #map_pap_next_location map_pap_location_id at @s run function zbk_der_eisendrache:map_pack_a_punch/location_manager/activate_here

execute if entity @e[type=marker,tag=map_pack_a_punch_active,limit=1] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.8
execute if entity @e[type=marker,tag=map_pack_a_punch_active,limit=1] run tellraw @a[tag=debug] [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"Pack-a-Punch has moved.","color":"gold"}]
execute if entity @e[type=marker,tag=map_pack_a_punch_active,limit=1] run return 1

scoreboard players add #map_pap_attempts map_pap_location_id 1
execute if score #map_pap_attempts map_pap_location_id matches 3.. run return 0

scoreboard players add #map_pap_next_location map_pap_location_id 1
execute if score #map_pap_next_location map_pap_location_id matches 4.. run scoreboard players set #map_pap_next_location map_pap_location_id 1

function zbk_der_eisendrache:map_pack_a_punch/location_manager/find_new_location_loop
