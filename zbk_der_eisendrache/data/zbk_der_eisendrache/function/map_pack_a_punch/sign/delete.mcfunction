# Delete the selected DE Pack-a-Punch sign.

scoreboard players set #de_pack_sign_delete_found map_pap 0
execute if entity @e[type=marker,tag=de_pack_location_sign,tag=de_pack_location_sign_delete_target,limit=1] run scoreboard players set #de_pack_sign_delete_found map_pap 1
execute if entity @e[type=marker,tag=de_pack_location_sign,tag=de_pack_location_sign_delete_target,limit=1] as @e[type=marker,tag=de_pack_location_sign,tag=de_pack_location_sign_delete_target,limit=1] at @s run function zbk_der_eisendrache:map_pack_a_punch/sign/delete_entities
execute if score #de_pack_sign_delete_found map_pap matches 0 as @e[type=marker,tag=de_pack_location_sign,distance=..5,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/sign/delete_entities

tag @e[type=marker,tag=de_pack_location_sign_delete_target] remove de_pack_location_sign_delete_target
