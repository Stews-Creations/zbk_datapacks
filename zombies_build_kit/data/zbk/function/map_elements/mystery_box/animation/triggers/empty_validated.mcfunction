# Internal function - called with @s = mystery_box_location marker
# Validates and plays empty animation

execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] empty_validated: ","color":"aqua"},{"text":"Called. pending_empty=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_pending_empty"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_active"},"color":"yellow"}]

# Validate empty animation can be played
execute unless function zbk:map_elements/mystery_box/animation/validation/validate_empty run return 0

# Clear pending empty flag since we're playing the empty animation now
scoreboard players reset @s mystery_box_pending_empty

# Set last animation to empty
scoreboard players set @s mystery_box_last_anim 1

# Play animation based on facing direction
# NOTE: Empty animation keyframes use distance=..60 and start_interpolation:-1 to reset floating entities
execute if entity @s[tag=facing_south] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/empty_south/play_anim
execute if entity @s[tag=facing_north] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/empty_north/play_anim
execute if entity @s[tag=facing_east] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/empty_east/play_anim
execute if entity @s[tag=facing_west] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/empty_west/play_anim
