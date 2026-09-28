# Foot samples use the candidate height within its block, preserving solid obstacles.
scoreboard players set #rs_foot_clear temp 0
execute if block ~ ~0.001 ~ #zbk:rocket_shield_air run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 0.. if block ~ ~0.001 ~ minecraft:snow[layers=1] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 125.. if block ~ ~0.001 ~ minecraft:snow[layers=2] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 250.. if block ~ ~0.001 ~ minecraft:snow[layers=3] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 375.. if block ~ ~0.001 ~ minecraft:snow[layers=4] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 500.. if block ~ ~0.001 ~ minecraft:snow[layers=5] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 625.. if block ~ ~0.001 ~ minecraft:snow[layers=6] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 750.. if block ~ ~0.001 ~ minecraft:snow[layers=7] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_height temp matches 188.. if block ~ ~0.001 ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_foot_clear temp 1
execute if score #rs_foot_clear temp matches 0 run scoreboard players set @s rs_step_clear 0
execute unless block ~ ~0.9 ~ #zbk:rocket_shield_air run scoreboard players set @s rs_step_clear 0
execute unless block ~ ~1.7 ~ #zbk:rocket_shield_air run scoreboard players set @s rs_step_clear 0
