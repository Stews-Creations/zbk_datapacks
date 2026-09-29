data modify storage zbk:events stack append value {context:{event:"extension/combat/weapons/mechanics/raycast/collide/5",request:1b,blocked:0b,handled:0b,args:{}}}
execute if score #health stats matches ..0 if entity @s[type=minecraft:iron_golem,tag=panzer_ai] run function zbk:bosses/panzer/model/removal/paired_display
function #zbk:event/extension/combat/weapons/mechanics/raycast/collide/before_headshot_tracking
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
