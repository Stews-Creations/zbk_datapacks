data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/effects/particles/bullet_trail/fallback_0",request:1b,blocked:0b}}
function #zbk:event/extension/combat/weapons/effects/particles/bullet_trail/fallback_0
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
execute unless data storage zbk:events result{blocked:1b} run execute unless score #gun_id stats matches 7 unless score #gun_id stats matches 2 if score #tier stats matches 1.. if score #temp raycast_distance matches 0 if score @s raycast_distance matches 10.. run particle minecraft:dust{color:[0.5,0.0,1.0],scale:1.0} ^ ^ ^ 0 0 0 0 1 force
