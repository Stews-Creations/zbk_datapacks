# ===================================
# DER EISENDRACHE MAP PACK-A-PUNCH - TICK
# ===================================

function zbk_der_eisendrache:map_pack_a_punch/machine/on_tick
execute as @e[type=marker,tag=map_pap_debris_anim] at @s run function zbk_der_eisendrache:map_pack_a_punch/unlock/debris_tick

# Spawn egg placement.
execute if entity @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Location"] run function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn
execute if entity @e[type=minecraft:bat,name="Der Eisendrache Pack-a-Punch Sign"] run function zbk_der_eisendrache:map_pack_a_punch/sign/spawn
function zbk_der_eisendrache:map_pack_a_punch/sign/update_all

# If a map PaP is due to move, wait until the current buy/claim cycle is
# fully safe before moving it.
execute as @e[type=marker,tag=map_pack_a_punch_active,tag=map_pap_move_pending] at @s unless entity @e[type=marker,distance=..8,tag=de_pack_a_punch_location,tag=pap_busy,limit=1] unless entity @e[type=marker,distance=..8,tag=de_pack_a_punch_location,tag=pap_claim_ready,limit=1] unless entity @e[type=marker,distance=..8,tag=de_pack_a_punch_location,tag=pap_song_lock,limit=1] run function zbk_der_eisendrache:map_pack_a_punch/location_manager/move
