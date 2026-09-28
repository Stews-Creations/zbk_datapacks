data modify storage zbk:events stack append value {context:{event:"extension/map_elements/pack_a_punch/upgrade/apply/2",request:1b,blocked:0b,handled:0b,args:{}}}
function #zbk:event/extension/map_elements/pack_a_punch/upgrade/apply/2
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
