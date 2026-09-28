# mystery_box created via BDEngine

tag @s remove animation_pause
tag @s remove animation_loop
tag @s add anim_spawn_east

# Enable location (remove disabled tag)
execute as @s at @s run tag @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] remove disabled

execute as @s at @s run function mystery_box:k/spawn_east/keyframe_0
