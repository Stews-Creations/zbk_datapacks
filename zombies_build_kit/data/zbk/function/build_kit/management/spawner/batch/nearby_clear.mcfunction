# Remove all immunity settings from all mob spawners within $(radius) blocks of the player.

$execute at @s as @e[type=marker,tag=zombie_spawner,distance=..$(radius)] run function zbk:build_kit/management/spawner/batch/clear_this
$execute at @s as @e[type=marker,tag=dog_spawner,distance=..$(radius)] run function zbk:build_kit/management/spawner/batch/clear_this
$function zbk:dispatch/extension/build_kit/management/spawner/batch/nearby_clear/1 {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Nearby spawners now spawn mobs damageable by everything.","color":"green"}]
