# Step 4: burn the rocket for 400 ticks (20 seconds).
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 3 run return 0

scoreboard players set #rocket_test_launch rkt_test_state 4
tellraw @a[tag=debug] [{"text":"[Rocket Test] ","color":"gold","bold":true},{"text":"Rocket burn started.","color":"gold"}]
function zbk_der_eisendrache:rocket_test_launch/audio/fire/start

schedule function zbk_der_eisendrache:rocket_test_launch/sequence/door_open 400t replace
