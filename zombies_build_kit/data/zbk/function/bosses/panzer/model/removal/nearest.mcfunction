# Remove the nearest Panzer golem controller and its paired rig root.
# Requires exported Animated Java namespace: de_panzer

scoreboard players set #panzer_remove_found panzer_id 0
execute if entity @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..3] run scoreboard players set #panzer_remove_found panzer_id 1
execute if score #panzer_remove_found panzer_id matches 1 run scoreboard players operation #panzer_remove panzer_id = @e[type=minecraft:iron_golem,tag=panzer_ai,distance=..3,sort=nearest,limit=1] panzer_id
execute if score #panzer_remove_found panzer_id matches 1 as @e[type=item_display,tag=panzer_model] if score @s panzer_id = #panzer_remove panzer_id run function animated_java:de_panzer/remove/this
execute if score #panzer_remove_found panzer_id matches 1 as @e[type=minecraft:iron_golem,tag=panzer_ai] if score @s panzer_id = #panzer_remove panzer_id run kill @s

execute if score #panzer_remove_found panzer_id matches 0 as @e[type=item_display,distance=..3,tag=panzer_model,sort=nearest,limit=1] run function animated_java:de_panzer/remove/this
