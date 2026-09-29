data modify storage zbk:events stack append value {context:{event:"extension/behavior/relocation/init_anchor/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute if score @s relocation_zone matches ..-1 store result score @s relocation_zone run data get entity @e[type=marker,tag=panzer_spawner,scores={spawner_unlocked=1},distance=..64,sort=nearest,limit=1] data.zone
function #zbk:event/extension/behavior/relocation/init_anchor
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
