# Called by the authoring dialog as a player. Cycle the opt-in deferral example between 0 and 1.
scoreboard players add #defer_start zbk.template 1
execute if score #defer_start zbk.template matches 2.. run scoreboard players set #defer_start zbk.template 0
tellraw @s [{"text":"Template deferred-start example is now ","color":"gray"},{"score":{"name":"#defer_start","objective":"zbk.template"},"color":"yellow"}]
