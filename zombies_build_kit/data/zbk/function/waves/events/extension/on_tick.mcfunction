data modify storage zbk:events stack append value {context:{event:"extension/waves/on_tick/1",request:1b,blocked:0b,handled:0b,args:{}}}
function zbk:waves/markers/panzer/place
function #zbk:event/extension/waves/on_tick
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
