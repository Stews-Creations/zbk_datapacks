data modify storage zbk:events stack append value {context:{event:"extension/map_elements/door/management/unlock_spawners_recursive/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=marker,tag=panzer_spawner] run function zombies:map_elements/door/management/check_and_unlock_spawner
function #zbk:event/extension/map_elements/door/management/unlock_spawners_recursive/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
