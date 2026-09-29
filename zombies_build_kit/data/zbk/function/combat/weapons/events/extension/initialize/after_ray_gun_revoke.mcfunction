data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/initialize/3",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/combat/weapons/initialize/after_ray_gun_revoke
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
