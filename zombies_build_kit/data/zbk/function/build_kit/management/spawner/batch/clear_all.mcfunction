# Remove all immunity settings from every mob spawner on the map.

execute as @e[type=marker,tag=zombie_spawner] run function zbk:build_kit/management/spawner/batch/clear_this
execute as @e[type=marker,tag=dog_spawner] run function zbk:build_kit/management/spawner/batch/clear_this
function zbk:dispatch/extension/build_kit/management/spawner/batch/clear_all/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"All mob spawners now spawn mobs damageable by everything.","color":"green"}]
