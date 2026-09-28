# A structure void one block below this position marks an authored wall-run block.
execute unless block ~ ~-1 ~ minecraft:structure_void run return 0

# Refresh collision already owned at this exact path cell.
execute as @e[type=minecraft:marker,tag=de_ag_wall_platform,distance=..0.1,limit=1] run tag @s add de_ag_wall_platform_keep
execute if entity @e[type=minecraft:marker,tag=de_ag_wall_platform,distance=..0.1,limit=1] run return 0

# Migrate collision left by the immediately previous gold prototype.
execute if block ~ ~ ~ minecraft:gold_block run setblock ~ ~ ~ minecraft:air

# Preserve unrelated terrain; collision can only be created in empty space.
execute unless block ~ ~ ~ minecraft:air run return 0
summon minecraft:marker ~ ~ ~ {Tags:["de_ag_wall_platform","de_ag_wall_platform_keep"]}
setblock ~ ~ ~ minecraft:barrier
