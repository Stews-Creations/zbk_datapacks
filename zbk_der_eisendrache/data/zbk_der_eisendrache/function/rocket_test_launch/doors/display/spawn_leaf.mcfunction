# Create one invisible movable leaf controller and mount its deepslate-brick panel.
$execute positioned ~$(dx) ~ ~$(dz) run summon minecraft:block_display ~ ~ ~ {Tags:["rocket_test_door_panel","rocket_test_door_$(axis)","rocket_test_door_$(half)","rocket_test_door_new"],view_range:128f,shadow_radius:0f,shadow_strength:0f,teleport_duration:56,block_state:{Name:"minecraft:air"}}
scoreboard players operation @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] rkt_door_id = @s rkt_door_id
execute if entity @s[tag=rocket_test_door_north] run tag @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] add rocket_test_door_north
execute if entity @s[tag=rocket_test_door_south] run tag @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] add rocket_test_door_south
execute if entity @s[tag=rocket_test_door_east] run tag @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] add rocket_test_door_east
execute if entity @s[tag=rocket_test_door_west] run tag @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] add rocket_test_door_west
execute as @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn
tag @e[type=minecraft:block_display,tag=rocket_test_door_new,distance=..8,limit=1,sort=nearest] remove rocket_test_door_new
