# mystery_box created via BDEngine

execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_west] unless entity @s[tag=animation_pause] at @s run function mystery_box:k/buy_west/keyframe_51
# Start the teddy bear animation (west direction)
execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_west] if entity @s[tag=animation_pause] at @s run function mystery_box:a/teddy_bear_west/play_anim
