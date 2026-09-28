# Runs as one persistent rocket-test door marker.
function zbk_der_eisendrache:rocket_test_launch/doors/collision/open
scoreboard players operation #rocket_test_door_id global = @s rkt_door_id
execute as @e[type=minecraft:block_display,tag=rocket_test_door_model] if score @s rkt_door_id = #rocket_test_door_id global run kill @s
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel] if score @s rkt_door_id = #rocket_test_door_id global run kill @s
execute as @e[type=minecraft:block_display,tag=rocket_test_door_backfill] if score @s rkt_door_id = #rocket_test_door_id global run kill @s
kill @s
