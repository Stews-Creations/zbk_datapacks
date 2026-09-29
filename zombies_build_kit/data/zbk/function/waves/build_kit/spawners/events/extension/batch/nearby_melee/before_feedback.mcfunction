data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/batch/nearby_melee/3",request:1b,blocked:0b,handled:0b,args:{}}}
$data modify storage zbk:events stack[-1].context.args set value {radius:"$(radius)"}
$execute at @s if score #spawner_toggle global matches 0 as @e[type=marker,tag=panzer_spawner,distance=..$(radius)] run data modify entity @s data.immune_melee set value 1b
function #zbk:event/extension/build_kit/management/spawner/batch/nearby_melee/before_feedback
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
