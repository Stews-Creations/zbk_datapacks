# mystery_box created via BDEngine

tag @s remove animation_pause
tag @s remove animation_loop
# Remove buy animation tag to prevent animation conflicts
tag @s remove anim_buy_east
tag @s remove anim_buy_north
tag @s remove anim_buy_south
tag @s remove anim_buy_west
tag @s add anim_teddy_bear_south

# Disable box particles at this location
execute as @s at @s run tag @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] add disabled

execute as @s at @s run function mystery_box:k/teddy_bear_south/keyframe_0
