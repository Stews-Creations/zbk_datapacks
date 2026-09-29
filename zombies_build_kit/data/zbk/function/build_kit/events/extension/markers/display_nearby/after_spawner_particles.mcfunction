data modify storage zbk:events stack append value {context:{event:"extension/build_kit/markers/display_nearby/1",request:1b,blocked:0b,handled:0b,args:{}}}
execute if entity @s[tag=panzer_spawner] run particle minecraft:dust{color:[1.0,0.65,0.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]
execute if entity @s[tag=panzer_spawner] run particle minecraft:electric_spark ~ ~1.2 ~ 0.08 0.2 0.08 0.01 1 normal @a[tag=zbk_marker_viewer]
function #zbk:event/extension/build_kit/markers/display_nearby/after_spawner_particles
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
