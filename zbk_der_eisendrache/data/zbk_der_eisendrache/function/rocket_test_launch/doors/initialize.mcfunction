# Rebuild open runtime doors from their persistent center markers.
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/collision/finalize_close
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/close_slow_tick
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/animations/open_tick
schedule clear zbk_der_eisendrache:rocket_test_launch/doors/audio/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.door_moving_lp
scoreboard players set #rocket_test_door rkt_door_timer 0

kill @e[type=minecraft:block_display,tag=rocket_test_door_model]
kill @e[type=minecraft:block_display,tag=rocket_test_door_panel]
kill @e[type=minecraft:block_display,tag=rocket_test_door_backfill]
tag @e[tag=rocket_test_door_closing] remove rocket_test_door_closing
tag @e[tag=rocket_test_door_opening] remove rocket_test_door_opening
tag @e[tag=rocket_test_door_audio_active] remove rocket_test_door_audio_active

# Reset removes only barrier blocks inside each configured door's owned volume.
execute as @e[type=minecraft:marker,tag=rocket_test_door] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/collision/open
scoreboard players set @e[type=minecraft:marker,tag=rocket_test_door] rkt_door_state 1

execute if score #active zbk.de matches 1 as @e[type=minecraft:marker,tag=rocket_test_door,scores={rkt_door_id=1..}] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn
