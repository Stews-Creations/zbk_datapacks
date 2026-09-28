execute if score #block_start zbk.template matches 1 run scoreboard players set #block_start zbk.template 0
execute unless score #block_start zbk.template matches 1 run scoreboard players set #block_start zbk.template 1
tellraw @s [{"text":"Template start-block example is now ","color":"gray"},{"score":{"name":"#block_start","objective":"zbk.template"},"color":"yellow"}]
