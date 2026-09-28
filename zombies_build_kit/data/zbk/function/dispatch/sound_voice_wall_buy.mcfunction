data modify storage zbk:events stack append value {context:{event:"sound_voice_wall_buy",request:1b,blocked:0b}}
function #zbk:event/sound_voice_wall_buy
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
