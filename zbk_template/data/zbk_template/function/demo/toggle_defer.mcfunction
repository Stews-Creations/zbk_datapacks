execute if score #defer_start zbk.template matches 1 run scoreboard players set #defer_start zbk.template 0
execute unless score #defer_start zbk.template matches 1 run scoreboard players set #defer_start zbk.template 1
tellraw @s [{"text":"Template deferred-start example is now ","color":"gray"},{"score":{"name":"#defer_start","objective":"zbk.template"},"color":"yellow"}]
