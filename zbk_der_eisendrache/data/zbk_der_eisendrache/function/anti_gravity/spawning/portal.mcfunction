# Place a persistent normal doorway marker at the executing player's feet.
# Look into the anti-gravity room before running this command.
execute unless score #active zbk.de matches 1 run return 0

summon minecraft:marker ~ ~ ~ {Tags:["de_ag_portal","de_ag_portal_new"]}
data modify entity @e[type=minecraft:marker,tag=de_ag_portal_new,distance=..1,limit=1,sort=nearest] Rotation set from entity @s Rotation
data modify entity @e[type=minecraft:marker,tag=de_ag_portal_new,distance=..1,limit=1,sort=nearest] Rotation[1] set value 0.0f
tag @e[type=minecraft:marker,tag=de_ag_portal_new,distance=..1] remove de_ag_portal_new

tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Portal placed. Its green sensor faces into the room.","color":"green"}]
