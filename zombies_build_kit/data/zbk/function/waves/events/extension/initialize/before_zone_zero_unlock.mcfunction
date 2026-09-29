data modify storage zbk:events stack append value {context:{event:"extension/waves/initialize/3",request:1b,blocked:0b,handled:0b,args:{}}}
scoreboard players set @e[type=marker,tag=panzer_spawner] spawner_unlocked 0
function #zbk:event/extension/waves/initialize/before_zone_zero_unlock
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
