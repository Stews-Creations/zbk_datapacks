data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/batch/clear_all/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=marker,tag=panzer_spawner] run function zombies:build_kit/management/spawner/batch/clear_this
function #zbk:event/extension/build_kit/management/spawner/batch/clear_all/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
