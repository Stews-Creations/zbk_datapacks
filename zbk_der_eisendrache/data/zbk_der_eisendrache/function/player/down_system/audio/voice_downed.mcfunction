execute unless score #active zbk.de matches 1 run return 0
function zbk:global/events/request/block
execute if score @s character matches 1 run playsound zbk_der_eisendrache:voice.downed.character_1 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 2 run playsound zbk_der_eisendrache:voice.downed.character_2 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 3 run playsound zbk_der_eisendrache:voice.downed.character_3 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 4 run playsound zbk_der_eisendrache:voice.downed.character_4 voice @s ~ ~ ~ 1000 1 1
