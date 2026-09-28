data modify storage zbk:events stack append value {context:{event:"extension/waves/initialize/2",request:1b,blocked:0b,handled:0b,args:{}}}
execute unless score #global wave.panzer_start_round matches 1.. run scoreboard players set #global wave.panzer_start_round 12
execute unless score #global wave.panzer_round_interval matches 1.. run scoreboard players set #global wave.panzer_round_interval 6
function #zbk:event/extension/waves/initialize/2
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
