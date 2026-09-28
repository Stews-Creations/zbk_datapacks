# Toggle rocket launch state
execute unless score #active zbk.de matches 1 run return 0

scoreboard players add #rocket rocket_launch 0
scoreboard players set #temp rocket_launch 0
scoreboard players operation #temp rocket_launch = #rocket rocket_launch

execute if score #temp rocket_launch matches 0 run scoreboard players set #rocket rocket_launch 1
execute if score #temp rocket_launch matches 0 run scoreboard players set #rocket rocket_height 0
execute if score #temp rocket_launch matches 0 as @e[type=minecraft:block_display,tag=rocket_move] run data merge entity @s {teleport_duration:1}
execute if score #temp rocket_launch matches 0 run tellraw @s [{"text":"[Rocket] ","color":"gold"},{"text":"Launch ","color":"green"},{"text":"ENGAGED","color":"red","bold":true}]

execute if score #temp rocket_launch matches 1 run scoreboard players set #rocket rocket_launch 0
execute if score #temp rocket_launch matches 1 run scoreboard players set #rocket rocket_height 0
execute if score #temp rocket_launch matches 1 run tellraw @s [{"text":"[Rocket] ","color":"gold"},{"text":"Launch ","color":"green"},{"text":"DISENGAGED","color":"gray"}]
