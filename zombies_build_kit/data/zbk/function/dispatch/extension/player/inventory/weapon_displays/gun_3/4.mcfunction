data modify storage zbk:events stack append value {context:{event:"extension/player/inventory/weapon_displays/gun_3/4",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/player/inventory/weapon_displays/gun_3/4
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
