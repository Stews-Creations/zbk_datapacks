data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/effects/explosive/kill/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute if entity @s[type=iron_golem,tag=panzer_ai] run function zombies:bosses/panzer/model/removal/paired_display
function #zbk:event/extension/combat/weapons/effects/explosive/kill/1
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
