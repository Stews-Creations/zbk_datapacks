scoreboard players set #active zbk.nacht 0
execute if data storage zbk:registry active{id:"zbk_nacht_der_untoten"} run scoreboard players set #active zbk.nacht 1
execute if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:initialize
