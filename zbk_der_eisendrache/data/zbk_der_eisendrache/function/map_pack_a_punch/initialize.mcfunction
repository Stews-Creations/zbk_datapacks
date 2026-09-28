# ===================================
# DER EISENDRACHE MAP PACK-A-PUNCH - INITIALIZE
# ===================================
# Reset the map-specific PaP unlock shell. Location markers remain placed, but
# the machine itself disappears until players link three unique locations.

scoreboard players set #map_pap_unlocked map_pap 0
scoreboard players set #map_pap_visited_count map_pap 0
scoreboard players set #map_pap_previous_location map_pap_location_id 0
scoreboard players set #map_pap_next_location map_pap_location_id 0
scoreboard players set #map_pap_next_id map_pap_location_id 0
scoreboard players set #map_pap_total_locations map_pap_location_id 0

scoreboard players set @e[type=marker,tag=map_pack_a_punch_location] map_pap_visited 0
scoreboard players set @e[type=marker,tag=map_pack_a_punch_location] map_pap_uses 0
scoreboard players set @e[type=marker,tag=map_pack_a_punch_location] map_pap_rounds 0
scoreboard players reset @e[type=item_display,tag=de_pack_debris] map_pap_uses
tag @e[type=marker,tag=map_pack_a_punch_location] remove map_pap_move_pending
tag @e[type=marker,tag=map_pap_debris_anim] remove map_pap_debris_anim
tag @e[type=marker,tag=map_pap_complete_after_debris] remove map_pap_complete_after_debris

# Remove any active map PaP machine and return its marker to dormant location state.
execute as @e[type=marker,tag=map_pack_a_punch_active] at @s run function zbk_der_eisendrache:map_pack_a_punch/location_manager/deactivate_here
execute as @e[type=marker,tag=de_pack_a_punch_location] at @s run function zbk_der_eisendrache:map_pack_a_punch/machine/model/delete_nearest

# Rebuild dormant location UI from scratch.
kill @e[type=interaction,tag=map_pack_a_punch_ui]
kill @e[type=item_display,tag=map_pack_a_punch_ui]
kill @e[type=text_display,tag=map_pack_a_punch_ui]
execute if score #active zbk.de matches 1 as @e[type=marker,tag=map_pack_a_punch_location] at @s run function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn_location_ui
execute if score #active zbk.de matches 1 as @e[type=marker,tag=de_pack_location_sign] at @s run function zbk_der_eisendrache:map_pack_a_punch/sign/create_display

function zbk_der_eisendrache:map_pack_a_punch/location_manager/reset_ids

execute if score #active zbk.de matches 1 as @e[type=item_display,tag=map_pack_a_punch_structure_entity] run function zbk_der_eisendrache:map_pack_a_punch/display/configure_structure
