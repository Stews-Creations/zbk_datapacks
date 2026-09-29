data modify storage zbk:events stack append value {context:{event:"game/game_start_deferred",request:0b,blocked:0b,claims:0,round:0,round_type:0,actor_id:0,killer_id:0}}
execute store result storage zbk:events stack[-1].context.round int 1 run scoreboard players get #global wave.round
execute store result storage zbk:events stack[-1].context.round_type int 1 run scoreboard players get #global wave.is_dog_round
execute if entity @s[type=player] store result storage zbk:events stack[-1].context.actor_id int 1 run scoreboard players get @s id
data modify storage zbk:events stack[-1].context.token set from storage zbk:state pending.token
data modify storage zbk:events stack[-1].context.generation set from storage zbk:state pending.generation
data modify storage zbk:events stack[-1].context.owner set from storage zbk:state pending.owner
function #zbk:event/game/game_start_deferred
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
