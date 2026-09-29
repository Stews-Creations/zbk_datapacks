# BO3 rarity pool; all conventional guns are eligible.
execute store result score #pool_roll temp run random value 1..5
execute if score #pool_roll temp matches 1 run scoreboard players set #gun_cycle temp 34
execute if score #pool_roll temp matches 2 run scoreboard players set #gun_cycle temp 35
execute if score #pool_roll temp matches 3 run scoreboard players set #gun_cycle temp 36
execute if score #pool_roll temp matches 4 run scoreboard players set #gun_cycle temp 37
execute if score #pool_roll temp matches 5 run scoreboard players set #gun_cycle temp 38
execute as @e[type=item_display,tag=mystery_box_gun,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/guns/display/display_selected_gun
