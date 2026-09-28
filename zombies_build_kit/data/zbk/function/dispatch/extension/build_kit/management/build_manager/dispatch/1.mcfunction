data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/build_manager/dispatch/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute if entity @e[tag=build_manager_target,tag=panzer_spawner] run function zombies:build_kit/management/build_manager/panzer_spawner/dispatch
function #zbk:event/extension/build_kit/management/build_manager/dispatch/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
