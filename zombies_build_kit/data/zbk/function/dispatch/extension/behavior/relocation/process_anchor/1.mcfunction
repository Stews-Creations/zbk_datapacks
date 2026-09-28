data modify storage zbk:events stack append value {context:{event:"extension/behavior/relocation/process_anchor/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=marker,tag=panzer_spawner,distance=..64] run function zombies:behavior/relocation/refresh_zone
function #zbk:event/extension/behavior/relocation/process_anchor/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
