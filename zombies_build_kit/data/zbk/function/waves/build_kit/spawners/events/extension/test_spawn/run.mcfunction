data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/test_spawn/run/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute if entity @e[type=marker,tag=spawner_test_target,tag=panzer_spawner,limit=1] as @e[type=marker,tag=spawner_test_target,tag=panzer_spawner,limit=1] at @s run function zbk:waves/build_kit/spawners/test_spawn/panzer
function #zbk:event/extension/build_kit/management/spawner/test_spawn/run
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
