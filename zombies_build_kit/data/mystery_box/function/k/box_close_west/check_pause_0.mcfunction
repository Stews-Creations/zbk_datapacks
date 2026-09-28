# mystery_box created via BDEngine

execute as @e[tag=mystery_box_root,tag=anim_box_close_west,type=block_display] unless entity @s[tag=animation_pause] at @s run function mystery_box:k/box_close_west/keyframe_1
