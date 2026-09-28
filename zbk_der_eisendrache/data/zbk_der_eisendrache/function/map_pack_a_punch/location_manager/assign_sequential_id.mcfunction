# Called as a map_pack_a_punch_location marker.

scoreboard players add #map_pap_next_id map_pap_location_id 1
scoreboard players operation @s map_pap_location_id = #map_pap_next_id map_pap_location_id
function zbk_der_eisendrache:map_pack_a_punch/location_manager/tag_location_id
