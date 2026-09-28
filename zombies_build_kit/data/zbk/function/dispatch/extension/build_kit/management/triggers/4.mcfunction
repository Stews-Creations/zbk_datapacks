data modify storage zbk:events stack append value {context:{event:"extension/build_kit/management/triggers/4",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @a[scores={give_panzer_marker=1..}] run function zbk:waves/markers/panzer/give
function #zbk:event/extension/build_kit/management/triggers/4
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
