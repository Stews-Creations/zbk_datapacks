# ===================================
# MONKEY BOMB DISPLAY TICK
# ===================================
# Spins the temporary monkey bomb display, starts its song on landing, and removes
# it after the landed timer expires.

tp @s ~ ~ ~ ~-6 ~

scoreboard players set #monkey_bomb_clap_cycle temp 8
scoreboard players operation @s temp = @s timer
scoreboard players operation @s temp %= #monkey_bomb_clap_cycle temp
execute if score @s temp matches 0 run data modify entity @s item.components."minecraft:item_model" set value "zbk:monkey_bomb_cymbal_closed"
execute if score @s temp matches 1 run data modify entity @s item.components."minecraft:item_model" set value "zbk:monkey_bomb_cymbal_mid"
execute if score @s temp matches 2..5 run data modify entity @s item.components."minecraft:item_model" set value "zbk:monkey_bomb"
execute if score @s temp matches 6 run data modify entity @s item.components."minecraft:item_model" set value "zbk:monkey_bomb_cymbal_mid"
execute if score @s temp matches 7 run data modify entity @s item.components."minecraft:item_model" set value "zbk:monkey_bomb_cymbal_closed"

execute if entity @s[tag=monkey_bomb_landed,tag=!monkey_bomb_song_played] as @a[distance=..16] run playsound zbk:special_equipment.monkey_bomb master @s ~ ~ ~ 0.5 1
execute if entity @s[tag=monkey_bomb_landed,tag=!monkey_bomb_song_played] run tag @s add monkey_bomb_song_played

execute if entity @s[tag=monkey_bomb_landed] run scoreboard players remove @s timer 1
execute if score @s timer matches ..0 run function zbk:combat/weapons/special_equipment/monkey_bomb/explode_monkey_bomb
