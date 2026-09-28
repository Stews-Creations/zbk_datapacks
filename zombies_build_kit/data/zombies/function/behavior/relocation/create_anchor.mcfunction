# Create one short-lived relocation anchor at the current destination.

execute if entity @e[type=marker,tag=enemy_relocation_anchor,distance=..8,limit=1] run return 0

summon marker ~ ~ ~ {Tags:["enemy_relocation_anchor","enemy_relocation_new"]}
execute as @e[type=marker,tag=enemy_relocation_new,distance=..1,sort=nearest,limit=1] at @s run function zombies:behavior/relocation/init_anchor
tag @e[type=marker,tag=enemy_relocation_new,distance=..1] remove enemy_relocation_new
