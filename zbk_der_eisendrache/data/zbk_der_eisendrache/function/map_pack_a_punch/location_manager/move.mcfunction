# Move the active map PaP to the next placed location. Called as/at the active marker.

function zbk_der_eisendrache:map_pack_a_punch/location_manager/reset_ids

execute unless score #map_pap_total_locations map_pap_location_id matches 2.. run tag @s remove map_pap_move_pending
execute unless score #map_pap_total_locations map_pap_location_id matches 2.. run scoreboard players set @s map_pap_rounds 0
execute unless score #map_pap_total_locations map_pap_location_id matches 2.. run return 0

scoreboard players operation #map_pap_previous_location map_pap_location_id = @s map_pap_location_id
scoreboard players operation #map_pap_next_location map_pap_location_id = @s map_pap_location_id
scoreboard players add #map_pap_next_location map_pap_location_id 1
execute if score #map_pap_next_location map_pap_location_id matches 4.. run scoreboard players set #map_pap_next_location map_pap_location_id 1

function zbk_der_eisendrache:map_pack_a_punch/location_manager/deactivate_here

scoreboard players set #map_pap_attempts map_pap_location_id 0
function zbk_der_eisendrache:map_pack_a_punch/location_manager/find_new_location_loop
