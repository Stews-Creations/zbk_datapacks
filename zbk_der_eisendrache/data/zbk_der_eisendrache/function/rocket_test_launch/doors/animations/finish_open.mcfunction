# Snap one completed opening to its exact coordinates and clear remaining collision.
scoreboard players operation #rocket_test_door_id global = @s rkt_door_id
tag @e[type=minecraft:marker,tag=rocket_test_door_target] remove rocket_test_door_target
tag @s add rocket_test_door_target

execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_x,tag=rocket_test_door_left] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~-7.5 ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_x,tag=rocket_test_door_right] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~3.5 ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_z,tag=rocket_test_door_left] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~ ~ ~-7.5
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_z,tag=rocket_test_door_right] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~ ~ ~3.5

execute as @e[type=minecraft:block_display,tag=rocket_test_door_opening] if score @s rkt_door_id = #rocket_test_door_id global run tag @s remove rocket_test_door_opening
function zbk_der_eisendrache:rocket_test_launch/doors/collision/open
scoreboard players set @s rkt_door_state 1
function zbk_der_eisendrache:rocket_test_launch/doors/audio/stop
tag @s remove rocket_test_door_target
