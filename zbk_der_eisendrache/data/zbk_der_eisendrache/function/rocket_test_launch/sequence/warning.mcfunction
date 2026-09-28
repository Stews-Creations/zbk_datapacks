# Step 1: begin the 180-tick (9-second) warning phase.
scoreboard players set #rocket_test_launch rkt_test_state 1
execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] as @a at @s if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,distance=..100,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_launch master @s ~ ~ ~ 1 1
execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] as @a at @s unless entity @e[type=minecraft:marker,tag=rocket_test_exhaust,distance=..100,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_launch master @s ~ ~ ~ 0.05 1
function zbk_der_eisendrache:rocket_test_launch/effects/ground_geyser/light
function zbk_der_eisendrache:rocket_test_launch/effects/refresh_geyser
tellraw @a[tag=debug] [{"text":"[Rocket Test] ","color":"gold","bold":true},{"text":"Warning phase started.","color":"yellow"}]

# Begin closing 20 ticks (1 second) before the countdown starts, while preserving
# the original finish time at the rocket-burn transition.
schedule function zbk_der_eisendrache:rocket_test_launch/sequence/door_close 160t replace
schedule function zbk_der_eisendrache:rocket_test_launch/sequence/countdown 180t replace
