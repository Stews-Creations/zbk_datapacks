# Creates one invisible movable leaf controller and mounts its visible model pieces.
$execute positioned ~$(dx) ~ ~$(dz) run summon minecraft:block_display ~ ~ ~ {Tags:["tram_door_panel","tram_platform_door_panel","tram_door_$(facing)","tram_door_$(half)","tram_door_new"],view_range:1f,width:1f,height:1f,shadow_radius:0f,shadow_strength:0f,teleport_duration:10,block_state:{Name:"minecraft:air"}}
scoreboard players operation @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] tram_door_id = @s tram_door_id
scoreboard players operation @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] tram_link_id = @s tram_link_id
execute if score @s tram_door_id matches 1 run tag @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] add tram_door_1
execute if score @s tram_door_id matches 2 run tag @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] add tram_door_2
execute if score @s tram_door_id matches 3 run tag @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] add tram_door_3
execute if score @s tram_door_id matches 4 run tag @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] add tram_door_4
$execute as @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:tram/doors/model/spawn_$(half) {yaw:$(yaw)}
tag @e[type=block_display,tag=tram_door_new,distance=..3,limit=1,sort=nearest] remove tram_door_new
