# Global tick listener. Keep all Der Eisendrache runtime work behind the active-provider check.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket/on_tick
function zbk_der_eisendrache:rocket_test_launch/on_tick
function zbk_der_eisendrache:anti_gravity/on_tick
function zbk_der_eisendrache:115_launch/on_tick
function zbk_der_eisendrache:map_pack_a_punch/on_tick
function zbk_der_eisendrache:tram/on_tick
function zbk_der_eisendrache:quest/on_tick
function zbk_der_eisendrache:events/powerup_fuse_cleanup
