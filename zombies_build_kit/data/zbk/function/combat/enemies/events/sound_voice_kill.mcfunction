data modify storage zbk:events stack append value {context:{event:"sound/voice/kill",request:1b,blocked:0b}}
function #zbk:event/sound/voice/kill
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
