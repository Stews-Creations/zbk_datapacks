# Remove the stationary leaves owned by the current persistent door marker.
scoreboard players operation #rocket_test_door_id global = @s rkt_door_id
execute as @e[type=minecraft:block_display,tag=rocket_test_door_backfill_model] if score @s rkt_door_id = #rocket_test_door_id global run kill @s
execute as @e[type=minecraft:block_display,tag=rocket_test_door_backfill] if score @s rkt_door_id = #rocket_test_door_id global run kill @s
