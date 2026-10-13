execute if data entity @s {Health:0.0f} run return run function zbk:map_elements/perks/electric_cherry/effects/restore
execute unless data entity @s active_effects[{id:"minecraft:glowing"}] run return run function zbk:map_elements/perks/electric_cherry/effects/restore
execute unless score @s cherry_stun matches 1.. run return run function zbk:map_elements/perks/electric_cherry/effects/restore
execute if score @s cherry_stun matches 10 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
execute if score @s cherry_stun matches 20 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
execute if score @s cherry_stun matches 30 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
execute if score @s cherry_stun matches 40 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
execute if score @s cherry_stun matches 50 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
execute if score @s cherry_stun matches 60 run particle minecraft:dust{color:[0.1,0.45,1.0],scale:0.65} ~ ~1 ~ 0.25 0.45 0.25 0 2 normal
scoreboard players remove @s cherry_stun 1
execute if score @s cherry_stun matches 0 run function zbk:map_elements/perks/electric_cherry/effects/restore
