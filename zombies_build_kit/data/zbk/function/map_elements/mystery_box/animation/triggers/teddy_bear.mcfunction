# Play teddy bear animation based on nearest marker's facing direction
# Call this function near a mystery box to trigger teddy bear animation
# Teddy bear can play regardless of box state (called from gameplay)

# Find nearest marker and play teddy bear animation
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest,tag=facing_south] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/teddy_bear_south/play_anim
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest,tag=facing_north] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/teddy_bear_north/play_anim
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest,tag=facing_east] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/teddy_bear_east/play_anim
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest,tag=facing_west] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/teddy_bear_west/play_anim
