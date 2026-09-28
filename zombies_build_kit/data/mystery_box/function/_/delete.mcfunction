# mystery_box created via BDEngine

execute as @e[type=minecraft:block_display,tag=mystery_box,level=1, sort=nearest, distance=..2] on passengers run kill @s
execute as @e[type=minecraft:block_display,tag=mystery_box, limit=1, sort=nearest, distance=..2] run kill @s
execute as @e[type=minecraft:interaction,tag=mystery_box_interaction, limit=1, sort=nearest, distance=..2] run kill @s
