data modify storage zbk:events stack append value {context:{event:"sound/jump_pad_unlocked",request:1b,blocked:0b,claims:0,round:0,round_type:0,actor_id:0,killer_id:0}}
execute store result storage zbk:events stack[-1].context.round int 1 run scoreboard players get #global wave.round
execute store result storage zbk:events stack[-1].context.round_type int 1 run scoreboard players get #global wave.is_dog_round
execute store result storage zbk:events stack[-1].context.jump_pad_id int 1 run scoreboard players get @s jump_pad_id

function #zbk:event/sound/jump_pad_unlocked
data modify storage zbk:events result set from storage zbk:events stack[-1].context
data remove storage zbk:events stack[-1]
