# Called by a player near the first DE Pack-a-Punch location.

function zbk_der_eisendrache:map_pack_a_punch/location_manager/clear_nearest_location_id
tag @e[type=marker,tag=map_pack_a_punch_location,distance=..5,limit=1,sort=nearest] add de_pap_location_1
scoreboard players set @e[type=marker,tag=map_pack_a_punch_location,distance=..5,limit=1,sort=nearest] map_pap_location_id 1
function zbk_der_eisendrache:map_pack_a_punch/location_manager/reset_ids
