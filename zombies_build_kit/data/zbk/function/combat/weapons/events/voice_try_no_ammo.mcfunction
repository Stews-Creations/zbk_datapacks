data modify storage zbk:events stack append value {context:{event:"voice/try_no_ammo",request:0b,blocked:0b}}
function #zbk:event/voice/try_no_ammo
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
