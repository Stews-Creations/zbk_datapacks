data modify storage zbk:events stack append value {context:{event:"extension/player/actionbar/prepare/weapon_name/1",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/player/actionbar/prepare/weapon_name/after_base_name
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
