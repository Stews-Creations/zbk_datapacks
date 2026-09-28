scoreboard players add #token zbk.api 1
data modify storage zbk:state pending set value {}
execute store result storage zbk:state pending.token int 1 run scoreboard players get #token zbk.api
execute store result storage zbk:state pending.generation int 1 run scoreboard players get #generation zbk.api
data modify storage zbk:state pending.owner set from storage zbk:events result.owner
function zbk:dispatch/game_start_deferred
