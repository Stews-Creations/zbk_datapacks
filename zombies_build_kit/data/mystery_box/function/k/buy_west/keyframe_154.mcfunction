# mystery_box created via BDEngine

# Debug: Track keyframe execution
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[KEYFRAME] ","color":"yellow"},{"text":"buy_west:154 - Buy animation complete","color":"white"}]

# Mark box as ready to buy again and disable claiming
execute as @e[tag=anim_buy_west] at @s run scoreboard players set @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_ready 1
execute as @e[tag=anim_buy_west] at @s run scoreboard players set @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_can_claim 0

data merge entity @e[type=text_display,tag=mystery_box_10,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,1f,0.875f,0f,1f,0f,0.4375f,-1f,0f,0f,0.5f,0f,0f,0f,1f],interpolation_duration:0}
scoreboard players set @s mystery_box_frame 154
execute as @e[tag=anim_buy_west] at @s if score @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_active matches 0 unless score global fire_sale matches 1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] buy_kf154: ","color":"aqua"},{"text":"Trigger A (inactive+no fire_sale) -> empty","color":"red"}]
execute as @e[tag=anim_buy_west] at @s if score @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_active matches 0 unless score global fire_sale matches 1 run function zbk:map_elements/mystery_box/animation/triggers/empty
execute as @e[tag=anim_buy_west] at @s if score @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_pending_empty matches 1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] buy_kf154: ","color":"aqua"},{"text":"Trigger B (pending_empty) -> empty","color":"red"}]
execute as @e[tag=anim_buy_west] at @s if score @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_pending_empty matches 1 run function zbk:map_elements/mystery_box/animation/triggers/empty
scoreboard players reset @s mystery_box_frame
tag @s remove anim_buy_west
schedule function mystery_box:k/buy_west/check_loop 0.1s
