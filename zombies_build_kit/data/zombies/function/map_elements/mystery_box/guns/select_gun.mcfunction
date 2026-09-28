# Normal gun selection - route to no-duplicate selection system
# This is called when the teddy bear does not appear

# Route to the new selection system that prevents giving players guns they already have
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/guns/select_gun_no_duplicates
