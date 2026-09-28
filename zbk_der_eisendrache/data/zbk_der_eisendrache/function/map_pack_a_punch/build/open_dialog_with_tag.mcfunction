# Tag the nearest dormant map PaP location for dialog actions.

tag @e[type=marker,tag=map_pack_a_punch_location,tag=map_pap_delete_target] remove map_pap_delete_target
execute if entity @e[type=marker,tag=build_manager_target,tag=map_pack_a_punch_location,tag=!pack_a_punch,limit=1] as @e[type=marker,tag=build_manager_target,tag=map_pack_a_punch_location,tag=!pack_a_punch,limit=1] run tag @s add open_dialog
execute if entity @e[type=marker,tag=build_manager_target,tag=map_pack_a_punch_location,tag=!pack_a_punch,limit=1] as @e[type=marker,tag=build_manager_target,tag=map_pack_a_punch_location,tag=!pack_a_punch,limit=1] run tag @s add map_pap_delete_target
execute unless entity @e[type=marker,tag=map_pap_delete_target,limit=1] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!pack_a_punch,distance=..5,limit=1,sort=nearest] run tag @s add open_dialog
execute unless entity @e[type=marker,tag=map_pap_delete_target,limit=1] at @s as @e[type=marker,tag=map_pack_a_punch_location,tag=!pack_a_punch,distance=..5,limit=1,sort=nearest] run tag @s add map_pap_delete_target
function zbk_der_eisendrache:map_pack_a_punch/build/open_dialog
