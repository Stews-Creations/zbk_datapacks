# Opens the Build Manager dialog for the nearest DE Pack-a-Punch sign.

tag @e[type=marker,tag=de_pack_location_sign,tag=de_pack_location_sign_delete_target] remove de_pack_location_sign_delete_target
execute if entity @e[type=marker,tag=build_manager_target,tag=de_pack_location_sign,limit=1] as @e[type=marker,tag=build_manager_target,tag=de_pack_location_sign,limit=1] run tag @s add open_dialog
execute if entity @e[type=marker,tag=build_manager_target,tag=de_pack_location_sign,limit=1] as @e[type=marker,tag=build_manager_target,tag=de_pack_location_sign,limit=1] run tag @s add de_pack_location_sign_delete_target
execute unless entity @e[type=marker,tag=de_pack_location_sign_delete_target,limit=1] at @s as @e[type=marker,tag=de_pack_location_sign,distance=..5,limit=1,sort=nearest] run tag @s add open_dialog
execute unless entity @e[type=marker,tag=de_pack_location_sign_delete_target,limit=1] at @s as @e[type=marker,tag=de_pack_location_sign,distance=..5,limit=1,sort=nearest] run tag @s add de_pack_location_sign_delete_target

function zbk_der_eisendrache:map_pack_a_punch/sign/open_dialog
