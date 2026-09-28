# Called as a map_pack_a_punch_location marker after map_pap_location_id is set.

tag @s remove de_pap_location_1
tag @s remove de_pap_location_2
tag @s remove de_pap_location_3

execute if score @s map_pap_location_id matches 1 run tag @s add de_pap_location_1
execute if score @s map_pap_location_id matches 2 run tag @s add de_pap_location_2
execute if score @s map_pap_location_id matches 3 run tag @s add de_pap_location_3
