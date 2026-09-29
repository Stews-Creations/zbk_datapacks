data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/batch/nearby_all/2",request:1b,blocked:0b,handled:0b,args:{}}}
$data modify storage zbk:events stack[-1].context.args set value {radius:"$(radius)"}
$execute at @s if score #spawner_toggle global matches 1 as @e[type=marker,tag=panzer_spawner,distance=..$(radius)] run function zbk:waves/build_kit/spawners/batch/clear_this
function #zbk:event/extension/build_kit/management/spawner/batch/nearby_all/before_disable
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
