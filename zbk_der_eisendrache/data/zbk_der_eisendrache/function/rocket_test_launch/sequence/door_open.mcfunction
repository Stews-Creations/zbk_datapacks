# Step 5: open the doors over 56 ticks (2.8 seconds).
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 4 run return 0

scoreboard players set #rocket_test_launch rkt_test_state 5
schedule clear zbk_der_eisendrache:rocket_test_launch/effects/refresh_geyser
function zbk_der_eisendrache:rocket_test_launch/doors/management/open
tellraw @a[tag=debug] [{"text":"[Rocket Test] ","color":"gold","bold":true},{"text":"Safety doors opening.","color":"green"}]

schedule function zbk_der_eisendrache:rocket_test_launch/sequence/complete 220t replace
