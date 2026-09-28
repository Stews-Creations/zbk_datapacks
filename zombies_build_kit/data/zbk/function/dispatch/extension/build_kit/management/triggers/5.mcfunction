data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/triggers/5",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/build_kit/management/triggers/5
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
