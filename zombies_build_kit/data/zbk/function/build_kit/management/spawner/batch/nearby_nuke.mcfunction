# Toggle nuke immunity on all mob spawners within $(radius) blocks of the player.

scoreboard players set #spawner_toggle global 1
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_nuke:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_nuke:1b}}] run scoreboard players set #spawner_toggle global 0
$function zbk:dispatch/extension/build_kit/management/spawner/batch/nearby_nuke/1 {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
$execute at @s if score #spawner_toggle global matches 1 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data remove entity @s data.immune_nuke
$execute at @s if score #spawner_toggle global matches 1 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data remove entity @s data.immune_nuke
$function zbk:dispatch/extension/build_kit/management/spawner/batch/nearby_nuke/2 {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_nuke set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_nuke set value 1b
$function zbk:dispatch/extension/build_kit/management/spawner/batch/nearby_nuke/3 {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #spawner_toggle global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Nearby spawners now spawn mobs that can be hit by nukes.","color":"green"}]
execute if score #spawner_toggle global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Nearby spawners now give mobs nuke immunity.","color":"green"}]
