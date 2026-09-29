data modify storage zbk:events stack append value {context:{event:"extension/behavior/relocation/process_anchor/2",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=marker,tag=panzer_spawner,scores={spawner_unlocked=1},distance=..64] if score @s relocation_zone = #relocation_zone relocation_zone run tag @s add relocation_panzer_dest
function #zbk:event/extension/behavior/relocation/process_anchor/after_candidate_selection
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
