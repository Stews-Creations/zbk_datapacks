# Advance the shared cadence once before selecting effect origins.
# Grouping exhaust effects must not advance the timer per marker or change the burn duration.

# Throttle secondary effects while keeping the main burn plume continuous.
scoreboard players add #rocket_test_launch rkt_fx_timer 1
execute if score #rocket_test_launch rkt_fx_timer matches 4.. run scoreboard players set #rocket_test_launch rkt_fx_timer 0

# Warning, countdown, and closing use light geyser-base bursts across the configured Y 79 ground area.
execute if score #rocket_test_launch rkt_test_state matches 1..3 if score #rocket_test_launch rkt_fx_timer matches 0 run function zbk_der_eisendrache:rocket_test_launch/effects/ground_geyser/light

# State 4 is the full 20-second rocket burn.
execute if score #rocket_test_launch rkt_test_state matches 4 as @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] at @s run function zbk_der_eisendrache:rocket_test_launch/effects/exhaust/tick

execute if score #rocket_test_launch rkt_test_state matches 4 if score #rocket_test_launch rkt_fx_timer matches 0..1 run function zbk_der_eisendrache:rocket_test_launch/effects/ground_geyser/burn
