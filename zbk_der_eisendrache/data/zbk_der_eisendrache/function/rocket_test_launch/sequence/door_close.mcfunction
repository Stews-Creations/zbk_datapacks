# Step 2: begin closing 20 ticks (1 second) before the countdown starts.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 1 run return 0

scoreboard players set #rocket_test_launch rkt_test_state 2
function zbk_der_eisendrache:rocket_test_launch/doors/management/close_slow
tellraw @a[tag=debug] [{"text":"[Rocket Test] ","color":"gold","bold":true},{"text":"Safety doors closing.","color":"red"}]

# The 240-tick close still finishes at the original rocket-burn moment.
schedule function zbk_der_eisendrache:rocket_test_launch/sequence/rocket_burn 240t replace
