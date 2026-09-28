# Runs as: Panzer Animated Java root entity.
# Switch before Animated Java's once-animation stop frame can snap back.

scoreboard players operation #panzer_walk panzer_id = @s panzer_id
scoreboard players set #panzer_on_ground panzer_id 0
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..16] if score @s panzer_id = #panzer_walk panzer_id if entity @s[nbt={OnGround:1b}] run scoreboard players set #panzer_on_ground panzer_id 1
execute unless score #panzer_on_ground panzer_id matches 1 run return 0
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..16] if score @s panzer_id = #panzer_walk panzer_id run data modify entity @s NoGravity set value 0b
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..16] if score @s panzer_id = #panzer_walk panzer_id run data modify entity @s NoAI set value 0b
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..16] if score @s panzer_id = #panzer_walk panzer_id run effect clear @s minecraft:slow_falling
execute at @s run playsound zbk:mob.panzer.landing hostile @a[distance=..64] ~ ~ ~ 1 1
function zombies:bosses/panzer/model/animations/play/walk
tag @s remove panzer_landing_to_walk
scoreboard players reset @s panzer_anim_timer
