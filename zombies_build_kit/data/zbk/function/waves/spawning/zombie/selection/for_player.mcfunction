# Runs as and at the selected player; distances are relative to this player.
tag @e[type=marker,tag=wz_candidate] remove wz_candidate
tag @e[type=marker,tag=wz_selected] remove wz_selected
$execute as @e[type=marker,tag=zombie_spawner,tag=!wz_failed_pass,distance=..$(range)] at @s run function zbk:waves/spawning/zombie/selection/candidate
execute store result score #candidates wz_state if entity @e[type=marker,tag=wz_candidate]
execute unless score #candidates wz_state matches 1.. run return 0
execute if entity @e[type=marker,tag=wz_candidate,tag=!wz_used] run tag @e[type=marker,tag=wz_candidate,tag=wz_used] remove wz_candidate
execute store result score #px wz_state run data get entity @s Pos[0] 100
execute store result score #pz wz_state run data get entity @s Pos[2] 100
scoreboard players set #last_sector wz_state -1
execute if score @s wz_sector matches 0..3 run scoreboard players operation #last_sector wz_state = @s wz_sector
scoreboard players set #total wz_state 0
execute as @e[type=marker,tag=wz_candidate] run function zbk:waves/spawning/zombie/selection/weight with storage zbk:zombie_spawn
execute unless score #total wz_state matches 1.. run return 0
execute store result storage zbk:zombie_spawn total int 1 run scoreboard players get #total wz_state
function zbk:waves/spawning/zombie/selection/draw with storage zbk:zombie_spawn
execute as @e[type=marker,tag=wz_candidate] run function zbk:waves/spawning/zombie/selection/pick
execute as @e[type=marker,tag=wz_selected,limit=1] at @s run function zbk:waves/spawning/zombie/selection/attempt
execute if score #success wz_state matches 1 run scoreboard players operation @s wz_sector = @e[type=marker,tag=wz_selected,limit=1] wz_sector
tag @e[type=marker,tag=wz_candidate] remove wz_candidate
tag @e[type=marker,tag=wz_selected] remove wz_selected
