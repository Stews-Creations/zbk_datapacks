# Play spawn animation based on nearest marker's facing direction
# Detects the marker's direction and plays the appropriate spawn animation
# NOTE: This is called from location_manager with @s = mystery_box_location marker

# Validate spawn animation can be played
execute unless function zombies:map_elements/mystery_box/animation/validation/validate_spawn run return 0

# Play animation based on facing direction
execute if entity @s[tag=facing_south] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_south/play_anim
execute if entity @s[tag=facing_north] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_north/play_anim
execute if entity @s[tag=facing_east] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_east/play_anim
execute if entity @s[tag=facing_west] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_west/play_anim
