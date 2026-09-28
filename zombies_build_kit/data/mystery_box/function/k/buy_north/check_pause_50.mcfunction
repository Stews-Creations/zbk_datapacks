# mystery_box created via BDEngine

execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_north] unless entity @s[tag=animation_pause] at @s run function mystery_box:k/buy_north/keyframe_51
# Start the teddy bear animation (north direction)
execute as @e[tag=mystery_box_root,scores={mystery_box_frame=50},tag=anim_buy_north] if entity @s[tag=animation_pause] at @s run function mystery_box:a/teddy_bear_north/play_anim
