execute unless score #active zbk.de matches 1 run return 0
# Begin configured tram auto-start delays when Round 1 starts.
execute if score #global wave.round matches 1 run function zbk_der_eisendrache:tram/management/start

# Spawn the configured Fuse after the Round 1 setup function finishes.
execute if score #global wave.round matches 1 run schedule function zbk_der_eisendrache:fuse_drop/spawning/spawn_round_one 1t replace

# Advance map-specific Pack-a-Punch relocation state every round.
function zbk_der_eisendrache:map_pack_a_punch/management/on_round_start
