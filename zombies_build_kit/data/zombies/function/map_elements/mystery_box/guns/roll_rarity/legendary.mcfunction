# Legendary: Ray Gun

scoreboard players set #gun_cycle temp 7
execute as @e[type=item_display,tag=mystery_box_gun,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/guns/display_selected_gun
