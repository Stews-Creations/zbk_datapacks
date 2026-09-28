# Validate if spawn animation can be played
# Spawn can only play when:
# 1. Fire sale is active AND box is NOT active
# 2. Box is active AND no animation has been played yet (last_anim = 0) - becoming active

# Block spawn if box is currently animating (mystery_box_frame >= 1 on block_display)
execute at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] if score @s mystery_box_frame matches 1.. run return 0

# Block spawn if teddy bear animation is running (prevents fire sale spawn conflict)
execute at @s if entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_teddy_bear_north,limit=1] run return 0
execute at @s if entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_teddy_bear_south,limit=1] run return 0
execute at @s if entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_teddy_bear_east,limit=1] run return 0
execute at @s if entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_teddy_bear_west,limit=1] run return 0

# Condition 1: Fire sale active AND box NOT active
execute if score global fire_sale matches 1 unless score @s mystery_box_active matches 1 run return 1

# Condition 2: Box is active AND never played an animation (becoming active for first time or after move)
execute if score @s mystery_box_active matches 1 if score @s mystery_box_last_anim matches 0 run return 1

# If neither condition is met, fail validation
return 0
