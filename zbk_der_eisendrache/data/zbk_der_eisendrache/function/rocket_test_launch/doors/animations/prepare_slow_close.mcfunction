# Runs as one open persistent marker and selects its runtime leaf controllers.
function zbk_der_eisendrache:rocket_test_launch/doors/audio/start
scoreboard players operation #rocket_test_door_id global = @s rkt_door_id
execute as @e[type=minecraft:block_display,tag=rocket_test_door_panel] if score @s rkt_door_id = #rocket_test_door_id global run tag @s add rocket_test_door_closing
scoreboard players set @s rkt_door_state 2
