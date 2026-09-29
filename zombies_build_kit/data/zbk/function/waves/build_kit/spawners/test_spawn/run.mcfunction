# === TEST SPAWN FROM SPAWNER MARKER ===
# Macro function - receives spawner_type and spawner_tag.
# Spawns one mob from the nearest marker of this type without advancing wave spawn counters.

tag @e[type=marker,tag=spawner_test_target] remove spawner_test_target
$execute as @p at @s run tag @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] add spawner_test_target

$execute unless entity @e[type=marker,tag=spawner_test_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"No nearby $(spawner_type) spawner marker found.","color":"red"}]

execute if entity @e[type=marker,tag=spawner_test_target,tag=zombie_spawner,limit=1] as @e[type=marker,tag=spawner_test_target,tag=zombie_spawner,limit=1] at @s run function zbk:waves/build_kit/spawners/test_spawn/zombie
execute if entity @e[type=marker,tag=spawner_test_target,tag=dog_spawner,limit=1] as @e[type=marker,tag=spawner_test_target,tag=dog_spawner,limit=1] at @s run function zbk:waves/build_kit/spawners/test_spawn/dog
function zbk:waves/build_kit/spawners/events/extension/test_spawn/run
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

tag @e[type=marker,tag=spawner_test_target] remove spawner_test_target
