data modify storage zbk:events stack append value {context:{event:"extension/waves/initialize/4",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=marker,tag=panzer_spawner] if data entity @s {data:{zone:0}} run scoreboard players set @s spawner_unlocked 1
function #zbk:event/extension/waves/initialize/after_zone_zero_unlock
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
