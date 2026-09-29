scoreboard players add #token zbk.lifecycle 1
data modify storage zbk:state pending set value {}
execute store result storage zbk:state pending.token int 1 run scoreboard players get #token zbk.lifecycle
execute store result storage zbk:state pending.generation int 1 run scoreboard players get #generation zbk.lifecycle
data modify storage zbk:state pending.owner set from storage zbk:events result.owner
function zbk:game/events/game_start_deferred
