# BO3 rarity pool; all conventional guns are eligible.
execute store result score #pool_roll temp run random value 1..9
execute if score #pool_roll temp matches 1 run scoreboard players set #gun_cycle temp 29
execute if score #pool_roll temp matches 2 run scoreboard players set #gun_cycle temp 30
execute if score #pool_roll temp matches 3 run scoreboard players set #gun_cycle temp 31
execute if score #pool_roll temp matches 4 run scoreboard players set #gun_cycle temp 33
execute if score #pool_roll temp matches 5 run scoreboard players set #gun_cycle temp 40
execute if score #pool_roll temp matches 6 run scoreboard players set #gun_cycle temp 42
execute if score #pool_roll temp matches 7 run scoreboard players set #gun_cycle temp 46
execute if score #pool_roll temp matches 8 run scoreboard players set #gun_cycle temp 14
execute if score #pool_roll temp matches 9 run scoreboard players set #gun_cycle temp 15
execute as @e[type=item_display,tag=mystery_box_gun,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/guns/display/display_selected_gun
