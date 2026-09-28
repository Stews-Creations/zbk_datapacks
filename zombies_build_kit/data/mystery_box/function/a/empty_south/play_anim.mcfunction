# mystery_box created via BDEngine

tag @s remove animation_pause
tag @s remove animation_loop
tag @s add anim_empty_south

# Disable box particles at this location
execute as @s at @s run tag @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] add disabled

execute as @s at @s run function mystery_box:k/empty_south/keyframe_0
