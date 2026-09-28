# Runs as one persistent door marker and creates permanent static side-wall duplicates.
function zbk_der_eisendrache:rocket_test_launch/doors/display/remove_backfill

execute if entity @s[tag=rocket_test_door_north] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"x",half:"left",dx:-7.5,dz:0}
execute if entity @s[tag=rocket_test_door_north] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"x",half:"right",dx:3.5,dz:0}
execute if entity @s[tag=rocket_test_door_south] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"x",half:"left",dx:-7.5,dz:0}
execute if entity @s[tag=rocket_test_door_south] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"x",half:"right",dx:3.5,dz:0}
execute if entity @s[tag=rocket_test_door_east] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"z",half:"left",dx:0,dz:-7.5}
execute if entity @s[tag=rocket_test_door_east] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"z",half:"right",dx:0,dz:3.5}
execute if entity @s[tag=rocket_test_door_west] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"z",half:"left",dx:0,dz:-7.5}
execute if entity @s[tag=rocket_test_door_west] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill_leaf {axis:"z",half:"right",dx:0,dz:3.5}
