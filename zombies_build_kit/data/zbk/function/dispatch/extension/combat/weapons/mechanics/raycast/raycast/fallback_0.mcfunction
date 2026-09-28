data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/mechanics/raycast/raycast/fallback_0",request:1b,blocked:0b}}
function #zbk:event/extension/combat/weapons/mechanics/raycast/raycast/fallback_0
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
execute unless data storage zbk:events result{blocked:1b} run execute as @s if score #tier stats matches 1.. unless score #gun_id stats matches 2 unless score #gun_id stats matches 7 run function zombies:combat/weapons/effects/particles/bullet_trail
