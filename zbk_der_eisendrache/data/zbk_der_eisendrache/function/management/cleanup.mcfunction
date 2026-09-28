# Remove Der Eisendrache runtime after another Map / Sound ID is selected.
execute if score #active zbk.de matches 1 run return 0
scoreboard players set #tram_skip_reset global 0
scoreboard players set #rocket_skip_reset global 0
function zbk_der_eisendrache:anti_gravity/management/cleanup
function zbk_der_eisendrache:tram/initialize
function zbk_der_eisendrache:map_pack_a_punch/initialize
kill @e[tag=de_pack_location_sign_display]
function zbk_der_eisendrache:rocket/management/apply_map_selection
function zbk_der_eisendrache:rocket_test_launch/initialize
function zbk_der_eisendrache:quest/management/cleanup
