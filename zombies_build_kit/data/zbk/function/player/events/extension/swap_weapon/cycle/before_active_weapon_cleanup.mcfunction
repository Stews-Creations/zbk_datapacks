data modify storage zbk:events stack append value {context:{event:"extension/player/swap_weapon/cycle/1",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/player/swap_weapon/cycle/before_active_weapon_cleanup
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
