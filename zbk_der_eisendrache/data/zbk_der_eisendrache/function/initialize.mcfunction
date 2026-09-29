# Active Der Eisendrache reset and runtime reconstruction.
execute unless score #active zbk.de matches 1 run return 0

function zbk_der_eisendrache:anti_gravity/initialize
execute unless score #tram_skip_reset global matches 1 run function zbk_der_eisendrache:tram/initialize
scoreboard players set #tram_skip_reset global 0

function zbk_der_eisendrache:map_pack_a_punch/initialize
function zbk_der_eisendrache:quest/initialize
function zbk_der_eisendrache:rocket_test_launch/initialize

execute unless score #rocket_skip_reset global matches 1 run function zbk_der_eisendrache:rocket/management/delete
execute unless score #rocket_skip_reset global matches 1 run function zbk_der_eisendrache:rocket/management/apply_map_selection
scoreboard players set #rocket_skip_reset global 0
function zbk_der_eisendrache:game/audio/music/stop_ambient
