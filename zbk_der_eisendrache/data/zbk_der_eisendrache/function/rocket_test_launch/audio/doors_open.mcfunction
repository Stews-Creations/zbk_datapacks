# Check anchor presence once, then choose volume separately for each listener.
# One listener hears one sound even when multiple exhaust markers are configured.

# Stop the fire LP and announce completion when a real door-opening movement begins.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=0}] unless entity @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_state=2}] run return 0

function zbk_der_eisendrache:rocket_test_launch/audio/fire/stop
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/audio/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_moving_lp
tag @e[type=minecraft:marker,tag=rocket_test_door_audio_active] remove rocket_test_door_audio_active
execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] as @a at @s run function zbk_der_eisendrache:rocket_test_launch/audio/doors_open_for_player
