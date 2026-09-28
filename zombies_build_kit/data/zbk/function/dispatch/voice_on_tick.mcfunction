data modify storage zbk:events stack append value {context:{event:"voice_on_tick",request:0b,blocked:0b}}
function #zbk:event/voice_on_tick
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
