function zombies:debug/event {f:"POWERUP",m:"Carpenter activated - repairing all barriers!"}

# Award points to all players (classic Carpenter behavior)
execute if score global double_points matches 0 run scoreboard players add @a player_points 200
execute if score global double_points matches 1 run scoreboard players add @a player_points 400

# Fully restore all barriers using the initialize function
function zombies:map_elements/barrier/initialize
function zombies:map_elements/barrier_w3/initialize

# Play repair sound at each barrier
execute as @e[type=marker,tag=barrier] at @s run playsound minecraft:block.wood.place master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=barrier_w3] at @s run playsound minecraft:block.wood.place master @a ~ ~ ~ 1 1

execute as @a run function zbk:dispatch/voice_event_carpenter
