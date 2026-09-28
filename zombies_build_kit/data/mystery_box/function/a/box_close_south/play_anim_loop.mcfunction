# mystery_box created via BDEngine

execute as @e[tag=mystery_box_root,type=block_display] at @s run tag @s remove animation_pause
execute as @e[tag=mystery_box_root,type=block_display] at @s run tag @s add anim_box_close_south
execute as @e[tag=mystery_box_root,type=block_display] at @s run tag @s add animation_loop
execute as @e[tag=mystery_box_root,type=block_display] at @s run function mystery_box:k/box_close_south/keyframe_0
