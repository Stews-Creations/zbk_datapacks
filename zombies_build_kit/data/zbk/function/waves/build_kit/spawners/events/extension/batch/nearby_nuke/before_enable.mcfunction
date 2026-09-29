data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/spawner/batch/nearby_nuke/1",request:1b,blocked:0b,handled:0b,args:{}}}
$data modify storage zbk:events stack[-1].context.args set value {radius:"$(radius)"}
$execute at @s if entity @e[type=marker,tag=panzer_spawner,distance=..$(radius),nbt=!{data:{immune_nuke:1b}}] run scoreboard players set #spawner_toggle global 0
function #zbk:event/extension/build_kit/management/spawner/batch/nearby_nuke/before_enable
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
