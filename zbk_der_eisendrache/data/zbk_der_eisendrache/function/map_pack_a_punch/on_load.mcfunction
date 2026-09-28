# ===================================
# DER EISENDRACHE MAP PACK-A-PUNCH - LOAD
# ===================================

scoreboard objectives add give_map_pack_a_punch_egg trigger
scoreboard objectives add give_map_pack_a_punch_sign_egg trigger
scoreboard objectives add map_pap dummy
scoreboard objectives add map_pap_location_id dummy
scoreboard objectives add map_pap_visited dummy
scoreboard objectives add map_pap_uses dummy
scoreboard objectives add map_pap_rounds dummy

# Tuning values.
scoreboard players set #map_pap_required_locations map_pap 3
scoreboard players set #map_pap_move_rounds map_pap 3

function zbk_der_eisendrache:map_pack_a_punch/initialize
