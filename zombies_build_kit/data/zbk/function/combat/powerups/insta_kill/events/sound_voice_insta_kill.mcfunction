data modify storage zbk:events stack append value {context:{event:"sound/voice/insta_kill",request:1b,blocked:0b}}
function #zbk:event/sound/voice/insta_kill
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
