# One baked leaf; cancel the item renderer half-turn to preserve the authored anchor.
$summon minecraft:item_display ~ ~ ~ {view_range:0.5f,Tags:["tram_door_model","tram_door_model_new"],Rotation:[$(yaw),0f],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:props/tram/tram_door_left"}},item_display:"none",width:8f,height:1.5f,transformation:{translation:[0f,0f,0f],scale:[2f,2f,2f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f]}}
ride @e[type=item_display,tag=tram_door_model_new,distance=..1,limit=1,sort=nearest] mount @s
tag @e[type=item_display,tag=tram_door_model_new,distance=..1,limit=1,sort=nearest] remove tram_door_model_new
