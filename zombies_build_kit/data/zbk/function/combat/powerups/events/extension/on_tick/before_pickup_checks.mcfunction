data modify storage zbk:events stack append value {context:{event:"extension/combat/powerups/on_tick/1",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/combat/powerups/on_tick/before_pickup_checks
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
