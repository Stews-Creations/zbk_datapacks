data modify storage zbk:events stack append value {context:{event:"voice_event_dog",request:0b,blocked:0b}}
function #zbk:event/voice_event_dog
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
