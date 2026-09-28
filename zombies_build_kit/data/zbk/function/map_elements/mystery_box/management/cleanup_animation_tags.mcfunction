# Clean up all animation tags from mystery box entities on reload
# This prevents stale animation state from persisting after reloads

# Remove all animation tags from mystery box root entities
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_buy_east
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_buy_north
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_buy_south
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_buy_west
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_box_close_east
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_box_close_north
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_box_close_south
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_box_close_west
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_spawn_east
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_spawn_north
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_spawn_south
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_spawn_west
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_empty_east
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_empty_north
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_empty_south
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_empty_west
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_teddy_bear_east
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_teddy_bear_north
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_teddy_bear_south
execute as @e[type=block_display,tag=mystery_box_root] run tag @s remove anim_teddy_bear_west

# Reset frame tracking scoreboard
scoreboard players reset @e[type=block_display,tag=mystery_box_root] mystery_box_frame
