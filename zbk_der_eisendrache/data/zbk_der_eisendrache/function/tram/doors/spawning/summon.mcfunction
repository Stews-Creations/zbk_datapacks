# Place one persistent platform-door marker at the command source.
# Usage: function zbk_der_eisendrache:tram/doors/spawning/summon {id:1,facing:"north"}

execute unless score #active zbk.de matches 1 run tellraw @s [{"text":"[Tram Doors] ","color":"gold"},{"text":"Select Der Eisendrache before placing platform doors.","color":"red"}]
execute unless score #active zbk.de matches 1 run return 0
$summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_platform_door","tram_platform_door_$(id)","tram_platform_door_$(facing)","tram_platform_door_new"]}
$scoreboard players set @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] tram_door_id $(id)
scoreboard players set @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] tram_door_state 0
scoreboard players set @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] tram_link_id 0
execute as @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:tram/doors/display/spawn
execute as @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:tram/doors/collision/close
tag @e[type=marker,tag=tram_platform_door_new,distance=..1,limit=1,sort=nearest] remove tram_platform_door_new
