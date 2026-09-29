data modify storage zbk:events stack append value {context:{event:"voice/event_insta_kill",request:0b,blocked:0b}}
function #zbk:event/voice/event_insta_kill
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
