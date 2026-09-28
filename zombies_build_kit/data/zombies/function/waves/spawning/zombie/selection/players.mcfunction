execute unless entity @a[gamemode=adventure,team=!downed,scores={id=1..},tag=!wz_tried] run return 0
scoreboard players set #next_player wz_state 2147483647
execute as @a[gamemode=adventure,team=!downed,scores={id=1..},tag=!wz_tried] if score @s id > #cursor wz_state run scoreboard players operation #next_player wz_state < @s id
execute if score #next_player wz_state matches 2147483647 as @a[gamemode=adventure,team=!downed,scores={id=1..},tag=!wz_tried] run scoreboard players operation #next_player wz_state < @s id
tag @a[tag=wz_player] remove wz_player
execute as @a[gamemode=adventure,team=!downed,scores={id=1..},tag=!wz_tried] if score @s id = #next_player wz_state run tag @s add wz_player
tag @a[tag=wz_player] add wz_tried
scoreboard players operation #cursor wz_state = #next_player wz_state
execute as @a[tag=wz_player,limit=1] at @s run function zombies:waves/spawning/zombie/selection/for_player with storage zombies:zombie_spawn
tag @a[tag=wz_player] remove wz_player
execute if score #success wz_state matches 1 run return 1
execute if score #attempts wz_state >= #attempt_limit wz_state run return 0
return run function zombies:waves/spawning/zombie/selection/players
