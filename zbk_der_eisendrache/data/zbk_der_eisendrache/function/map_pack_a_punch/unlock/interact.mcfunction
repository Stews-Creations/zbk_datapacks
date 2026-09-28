# Map Pack-a-Punch dormant-location interaction handler.
# Triggered by zbk_der_eisendrache:interaction_map_pack_a_punch.

advancement revoke @s only zbk_der_eisendrache:interaction_map_pack_a_punch

execute if entity @s[team=downed] run return fail

# Build Manager stick opens the marker dialog instead of linking the location.
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk_der_eisendrache:map_pack_a_punch/build/open_dialog_with_tag

# Once the map PaP has been unlocked, dormant location links no longer do anything.
execute if score #map_pap_unlocked map_pap matches 1.. run return 0

execute at @e[type=interaction,tag=map_pack_a_punch_interaction,nbt={interaction:{}},distance=..8,limit=1,sort=nearest] as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pack_a_punch_active,distance=..4,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/unlock/interact_location
execute as @e[type=interaction,tag=map_pack_a_punch_interaction,nbt={interaction:{}},distance=..8] run data remove entity @s interaction
