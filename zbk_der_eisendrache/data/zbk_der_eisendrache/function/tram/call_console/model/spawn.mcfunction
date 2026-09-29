# Baked body; lamps and status stay separate for gameplay updates.
$summon minecraft:item_display ~ ~ ~ {Tags:["tram_call_console_runtime","tram_call_console_model","tram_call_console_body","tram_call_console_piece_new"],Rotation:[$(yaw),0f],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:props/tram/tram_console"}},item_display:"none",view_range:.5f,width:4f,height:2f,brightness:{block:15,sky:15},transformation:{translation:[0f,0f,0f],scale:[1f,1f,1f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f]}}
ride @e[type=item_display,tag=tram_call_console_piece_new,distance=..1,limit=1,sort=nearest] mount @s
tag @e[type=item_display,tag=tram_call_console_piece_new,distance=..1,limit=1,sort=nearest] remove tram_call_console_piece_new
$function zbk_der_eisendrache:tram/call_console/model/spawn_status {yaw:$(yaw)}
$function zbk_der_eisendrache:tram/call_console/model/spawn_light {yaw:$(yaw),side:"right",block:"emerald_block",x:-0.78f,y:0.36f,z:-0.22f}
$function zbk_der_eisendrache:tram/call_console/model/spawn_light {yaw:$(yaw),side:"left",block:"redstone_block",x:0.54f,y:0.36f,z:-0.22f}
