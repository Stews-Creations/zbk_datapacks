# Resolve the winning location once before applying it to every sign.
# The scratch value is rebuilt from loaded markers on every invocation, including the locked state.

# Re-evaluate current loaded locations every call; no cross-tick cache.
scoreboard players set #de_pap_sign_location global 0
execute if score #map_pap_unlocked map_pap matches 1.. as @e[type=marker,tag=map_pack_a_punch_active] run function zbk_der_eisendrache:map_pack_a_punch/sign/read_location
execute as @e[type=item_display,tag=de_pack_location_sign_display] run function zbk_der_eisendrache:map_pack_a_punch/sign/apply_location
