# Create one invisible controller, mount the visible model, and add its stationary interaction hitbox.
summon minecraft:block_display ~ ~ ~ {Tags:["tram_call_console_runtime","tram_call_console_root","tram_call_console_root_new"],view_range:.5f,width:1f,height:1f,shadow_radius:0f,shadow_strength:0f,block_state:{Name:"minecraft:air"}}
$execute as @e[type=minecraft:block_display,tag=tram_call_console_root_new,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:tram/call_console/model/spawn {yaw:$(yaw)}
execute as @e[type=minecraft:block_display,tag=tram_call_console_root_new,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:tram/call_console/interactions/spawn
tag @e[type=minecraft:block_display,tag=tram_call_console_root_new,distance=..1,limit=1,sort=nearest] remove tram_call_console_root_new
