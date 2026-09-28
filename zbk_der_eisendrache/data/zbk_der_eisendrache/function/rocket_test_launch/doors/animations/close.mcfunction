# Runs as one open persistent door marker.
execute unless score #active zbk.de matches 1 run return 0
execute unless score @s rkt_door_state matches 1 run return 0

function zbk_der_eisendrache:rocket_test_launch/doors/audio/start
scoreboard players operation #rocket_test_door_id global = @s rkt_door_id
tag @e[type=minecraft:marker,tag=rocket_test_door_target] remove rocket_test_door_target
tag @s add rocket_test_door_target

# Move each leaf 3.5 blocks inward over its controller's 56-tick interpolation.
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_x,tag=rocket_test_door_left] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~-4 ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_x,tag=rocket_test_door_right] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~ ~ ~
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_z,tag=rocket_test_door_left] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~ ~ ~-4
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel,tag=rocket_test_door_z,tag=rocket_test_door_right] if score @s rkt_door_id = #rocket_test_door_id global at @e[type=minecraft:marker,tag=rocket_test_door_target,limit=1] run tp @s ~ ~ ~

scoreboard players set @s rkt_door_state 0
tag @s remove rocket_test_door_target
