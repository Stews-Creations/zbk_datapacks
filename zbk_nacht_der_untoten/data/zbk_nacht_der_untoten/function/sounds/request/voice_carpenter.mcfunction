execute unless score #active zbk.nacht matches 1 run return 0
function zbk:api/request/block
execute if score @s character matches 1 run playsound zbk_nacht_der_untoten:voice.carpenter.character_1 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 2 run playsound zbk_nacht_der_untoten:voice.carpenter.character_2 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 3 run playsound zbk_nacht_der_untoten:voice.carpenter.character_3 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 4 run playsound zbk_nacht_der_untoten:voice.carpenter.character_4 voice @s ~ ~ ~ 1000 1 1
