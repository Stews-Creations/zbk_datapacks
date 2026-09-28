# Step 3: begin the full 200-tick (10-second) launch countdown.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 2 run return 0

scoreboard players set #rocket_test_launch rkt_test_state 3
tellraw @a[tag=debug] [{"text":"[Rocket Test] ","color":"gold","bold":true},{"text":"Launch countdown started: 10 seconds.","color":"yellow"}]
