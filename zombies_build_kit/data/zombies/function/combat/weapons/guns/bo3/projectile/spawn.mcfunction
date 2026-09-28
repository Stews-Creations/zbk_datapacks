# Snapshot the XM-53 payload and owner; changing weapons cannot change an airborne rocket.
summon marker ^ ^ ^0.4 {Tags:["bo3_rocket","bo3_new_rocket"],data:{age:0}}
data modify entity @e[type=marker,tag=bo3_new_rocket,limit=1] data.profile set from storage zombies:bo3 profile
execute store result entity @e[type=marker,tag=bo3_new_rocket,limit=1] data.owner int 1 run scoreboard players get @s id
data modify entity @e[type=marker,tag=bo3_new_rocket,limit=1] Rotation set from entity @s Rotation
tag @e[type=marker,tag=bo3_new_rocket] remove bo3_new_rocket
