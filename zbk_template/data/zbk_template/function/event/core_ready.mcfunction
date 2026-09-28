scoreboard players set #active zbk.template 0
execute if data storage zbk:registry active{id:"zbk_template"} run scoreboard players set #active zbk.template 1
execute if score #active zbk.template matches 1 run function zbk_template:initialize
