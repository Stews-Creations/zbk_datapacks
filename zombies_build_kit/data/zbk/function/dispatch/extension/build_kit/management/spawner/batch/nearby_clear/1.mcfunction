data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/batch/nearby_clear/1",request:1b,blocked:0b,handled:0b,args:{}}}
$data modify storage zbk:events stack[-1].context.args set value {radius:"$(radius)"}
$execute at @s as @e[type=marker,tag=panzer_spawner,distance=..$(radius)] run function zombies:build_kit/management/spawner/batch/clear_this
function #zbk:event/extension/build_kit/management/spawner/batch/nearby_clear/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
