# Ensure map PaP locations have stable placement-order IDs.

scoreboard players set #map_pap_next_id map_pap_location_id 0
execute as @e[type=marker,tag=map_pack_a_punch_location] run function zbk_der_eisendrache:map_pack_a_punch/location_manager/sync_location_id_from_tag
execute as @e[type=marker,tag=map_pack_a_punch_location] if score @s map_pap_location_id matches 1.. if score @s map_pap_location_id > #map_pap_next_id map_pap_location_id run scoreboard players operation #map_pap_next_id map_pap_location_id = @s map_pap_location_id
execute as @e[type=marker,tag=map_pack_a_punch_location] unless score @s map_pap_location_id matches 1.. run function zbk_der_eisendrache:map_pack_a_punch/location_manager/assign_sequential_id
execute as @e[type=marker,tag=map_pack_a_punch_location] run function zbk_der_eisendrache:map_pack_a_punch/location_manager/tag_location_id

scoreboard players set #map_pap_total_locations map_pap_location_id 0
execute as @e[type=marker,tag=map_pack_a_punch_location] run scoreboard players add #map_pap_total_locations map_pap_location_id 1
