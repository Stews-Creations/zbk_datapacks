# Called by the authoring dialog as a player. Cycle the opt-in start veto between 0 and 1.
scoreboard players add #block_start zbk.template 1
execute if score #block_start zbk.template matches 2.. run scoreboard players set #block_start zbk.template 0
tellraw @s [{"text":"Template start-block example is now ","color":"gray"},{"score":{"name":"#block_start","objective":"zbk.template"},"color":"yellow"}]
