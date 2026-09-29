# The base pack calls this after provider selection. Initialize runtime state only if this map won registration.
scoreboard players set #active zbk.template 0
execute if data storage zbk:registry active{id:"zbk_template"} run scoreboard players set #active zbk.template 1
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] ready: provider active; rebuilding runtime displays.","color":"gray"}
execute unless score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] ready: provider inactive.","color":"gray"}
execute if score #active zbk.template matches 1 run function zbk_template:initialize
