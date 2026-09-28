# Place one persistent door marker at the doorway center seam and floor level.
# Usage: function zbk_der_eisendrache:rocket_test_launch/doors/spawning/summon {id:1,facing:"north"}

execute unless score #active zbk.de matches 1 run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"Select Der Eisendrache before placing doors.","color":"red"}]

$scoreboard players set #rocket_test_door_id global $(id)
execute unless score #rocket_test_door_id global matches 1.. run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"Door IDs must be positive.","color":"red"}]

scoreboard players set #rocket_test_door_duplicate global 0
execute as @e[type=minecraft:marker,tag=rocket_test_door] if score @s rkt_door_id = #rocket_test_door_id global run scoreboard players set #rocket_test_door_duplicate global 1
execute if score #rocket_test_door_duplicate global matches 1 run return run tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"That door ID already exists.","color":"red"}]

$summon minecraft:marker ~ ~ ~ {Tags:["rocket_test_door","rocket_test_door_$(facing)","rocket_test_door_new"]}
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_north,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_south,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_east,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_west,distance=..1,limit=1] run tellraw @s[tag=debug] [{"text":"[Rocket Test Doors] ","color":"gold"},{"text":"Facing must be north, south, east, or west.","color":"red"}]
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_north,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_south,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_east,distance=..1,limit=1] unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,tag=rocket_test_door_west,distance=..1,limit=1] run kill @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1]
execute unless entity @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1,limit=1] run return 0

$scoreboard players set @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1,limit=1,sort=nearest] rkt_door_id $(id)
scoreboard players set @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1,limit=1,sort=nearest] rkt_door_state 1
execute as @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn
tag @e[type=minecraft:marker,tag=rocket_test_door_new,distance=..1,limit=1,sort=nearest] remove rocket_test_door_new
