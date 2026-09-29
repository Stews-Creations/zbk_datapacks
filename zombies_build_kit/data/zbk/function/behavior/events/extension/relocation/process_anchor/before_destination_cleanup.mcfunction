data modify storage zbk:events stack append value {context:{event:"extension/behavior/relocation/process_anchor/3",request:1b,blocked:0b,handled:0b,args:{}}}
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,tag=!panzer_dying,tag=!panzer_relocating] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..45] run tag @s add relocation_candidate
function #zbk:event/extension/behavior/relocation/process_anchor/before_destination_cleanup
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
