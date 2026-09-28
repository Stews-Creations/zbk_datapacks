# Delete the selected map PaP location marker.

scoreboard players set #map_pap_delete_found map_pap 0
execute if entity @e[type=marker,tag=map_pack_a_punch_location,tag=map_pap_delete_target,limit=1] run scoreboard players set #map_pap_delete_found map_pap 1
execute if entity @e[type=marker,tag=map_pack_a_punch_location,tag=map_pap_delete_target,limit=1] as @e[type=marker,tag=map_pack_a_punch_location,tag=map_pap_delete_target,limit=1] at @s run function zbk_der_eisendrache:map_pack_a_punch/build/delete_entities
execute if score #map_pap_delete_found map_pap matches 0 as @e[type=marker,tag=map_pack_a_punch_location,distance=..5,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/build/delete_entities

function zbk_der_eisendrache:map_pack_a_punch/location_manager/reset_ids
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Map Pack-a-Punch location deleted.","color":"red"}]
