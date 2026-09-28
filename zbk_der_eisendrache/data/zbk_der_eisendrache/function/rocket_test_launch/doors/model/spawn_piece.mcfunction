# Summon one tiled deepslate-brick piece and mount it to the current leaf controller.
$summon minecraft:block_display ~ ~ ~ {Tags:["rocket_test_door_model","rocket_test_door_model_new"],view_range:128f,shadow_radius:0f,shadow_strength:0f,brightness:{block:15,sky:15},block_state:{Name:"minecraft:deepslate_bricks"},transformation:{translation:[$(x),$(y),$(z)],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[$(sx),1f,$(sz)]}}
scoreboard players operation @e[type=minecraft:block_display,tag=rocket_test_door_model_new,distance=..1,limit=1,sort=nearest] rkt_door_id = @s rkt_door_id
execute if entity @s[tag=rocket_test_door_backfill] run tag @e[type=minecraft:block_display,tag=rocket_test_door_model_new,distance=..1,limit=1,sort=nearest] add rocket_test_door_backfill_model
ride @e[type=minecraft:block_display,tag=rocket_test_door_model_new,distance=..1,limit=1,sort=nearest] mount @s
tag @e[type=minecraft:block_display,tag=rocket_test_door_model_new,distance=..1,limit=1,sort=nearest] remove rocket_test_door_model_new
