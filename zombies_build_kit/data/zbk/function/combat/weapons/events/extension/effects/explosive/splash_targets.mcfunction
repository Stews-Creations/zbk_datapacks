data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/effects/explosive/splash_targets/1",request:1b,blocked:0b,handled:0b,args:{}}}
$data modify storage zbk:events stack[-1].context.args set value {radius:"$(radius)"}
function #zbk:event/extension/combat/weapons/effects/explosive/splash_targets
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
