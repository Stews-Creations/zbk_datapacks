# Starts a delayed Panzer spawn from the selected build-kit marker.

scoreboard players set #panzer_spawn_used_marker temp 1
function zombies:bosses/panzer/spawn/pending/start_here
execute if entity @s[nbt={data:{immune_guns:1b}}] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_pending,distance=..0.25,limit=1,sort=nearest] data.immune_guns set value 1b
execute if entity @s[nbt={data:{immune_explosives:1b}}] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_pending,distance=..0.25,limit=1,sort=nearest] data.immune_explosives set value 1b
execute if entity @s[nbt={data:{immune_elements:1b}}] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_pending,distance=..0.25,limit=1,sort=nearest] data.immune_elements set value 1b
execute if entity @s[nbt={data:{immune_nuke:1b}}] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_pending,distance=..0.25,limit=1,sort=nearest] data.immune_nuke set value 1b
execute if entity @s[nbt={data:{immune_melee:1b}}] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_pending,distance=..0.25,limit=1,sort=nearest] data.immune_melee set value 1b
tag @s remove panzer_spawn_selected
