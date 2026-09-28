# BO3 rarity pool; all conventional guns are eligible.
execute store result score #pool_roll temp run random value 1..11
execute if score #pool_roll temp matches 1 run scoreboard players set #gun_cycle temp 20
execute if score #pool_roll temp matches 2 run scoreboard players set #gun_cycle temp 21
execute if score #pool_roll temp matches 3 run scoreboard players set #gun_cycle temp 22
execute if score #pool_roll temp matches 4 run scoreboard players set #gun_cycle temp 23
execute if score #pool_roll temp matches 5 run scoreboard players set #gun_cycle temp 24
execute if score #pool_roll temp matches 6 run scoreboard players set #gun_cycle temp 25
execute if score #pool_roll temp matches 7 run scoreboard players set #gun_cycle temp 26
execute if score #pool_roll temp matches 8 run scoreboard players set #gun_cycle temp 27
execute if score #pool_roll temp matches 9 run scoreboard players set #gun_cycle temp 28
execute if score #pool_roll temp matches 10 run scoreboard players set #gun_cycle temp 32
execute if score #pool_roll temp matches 11 run scoreboard players set #gun_cycle temp 39
execute as @e[type=item_display,tag=mystery_box_gun,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/guns/display_selected_gun
