data modify storage zbk:events stack append value {context:{event:"extension/waves/markers/show_particles/1",request:1b,blocked:0b,handled:0b,args:{}}}
function zbk:waves/markers/panzer/show_particles
function #zbk:event/extension/waves/markers/show_particles
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
