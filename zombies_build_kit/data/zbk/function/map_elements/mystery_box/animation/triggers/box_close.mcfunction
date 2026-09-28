# Play box close animation on nearest mystery box based on facing direction
# @s is mystery_box_location marker - moves to marker position then searches within 2 blocks

execute if entity @s[tag=facing_south] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/box_close_south/play_anim
execute if entity @s[tag=facing_north] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/box_close_north/play_anim
execute if entity @s[tag=facing_east] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/box_close_east/play_anim
execute if entity @s[tag=facing_west] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/box_close_west/play_anim
