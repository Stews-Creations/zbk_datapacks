# mystery_box created via BDEngine

execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_south] unless entity @s[tag=animation_pause] at @s run function mystery_box:k/buy_south/keyframe_51
# Start the teddy bear animation (south direction)
execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_south] if entity @s[tag=animation_pause] at @s run function mystery_box:a/teddy_bear_south/play_anim
