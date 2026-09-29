# Toggle all combat immunity settings on all mob spawners within $(radius) blocks of the player.

scoreboard players set #spawner_toggle global 1
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_guns:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_explosives:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_elements:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_nuke:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=zombie_spawner,distance=..$(radius),nbt=!{data:{immune_melee:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_guns:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_explosives:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_elements:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_nuke:1b}}] run scoreboard players set #spawner_toggle global 0
$execute at @s if entity @e[type=marker,tag=dog_spawner,distance=..$(radius),nbt=!{data:{immune_melee:1b}}] run scoreboard players set #spawner_toggle global 0
$function zbk:waves/build_kit/spawners/events/extension/batch/nearby_all/before_enable {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
$execute at @s if score #spawner_toggle global matches 1 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run function zbk:waves/build_kit/spawners/batch/clear_this
$execute at @s if score #spawner_toggle global matches 1 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run function zbk:waves/build_kit/spawners/batch/clear_this
$function zbk:waves/build_kit/spawners/events/extension/batch/nearby_all/before_disable {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_guns set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_explosives set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_elements set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_nuke set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run data modify entity @s data.immune_melee set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_guns set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_explosives set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_elements set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_nuke set value 1b
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run data modify entity @s data.immune_melee set value 1b
$function zbk:waves/build_kit/spawners/events/extension/batch/nearby_all/before_feedback {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #spawner_toggle global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Nearby spawners now spawn mobs that can be hit by everything.","color":"green"}]
execute if score #spawner_toggle global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Nearby spawners now give mobs full combat immunity.","color":"green"}]
