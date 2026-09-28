data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/mechanics/raycast/start/fallback_0",request:1b,blocked:0b}}
function #zbk:event/extension/combat/weapons/mechanics/raycast/start/fallback_0
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
execute unless data storage zbk:events result{blocked:1b} run execute unless score #gun_id stats matches 20..46 at @s anchored eyes positioned ^ ^ ^ rotated as @s run function zombies:combat/weapons/mechanics/raycast/raycast
