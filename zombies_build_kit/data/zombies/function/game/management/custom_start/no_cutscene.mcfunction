# Stores a test start round, then starts immediately without the cutscene intercept.

$scoreboard players set #global game.start_round $(round)
execute if score #global game.start_round matches ..0 run scoreboard players set #global game.start_round 1
execute if score #global game.start_round matches 1000.. run scoreboard players set #global game.start_round 999

tellraw @s [{"text":"[Game] ","color":"gold"},{"text":"Starting without cutscene on round ","color":"green"},{"score":{"name":"#global","objective":"game.start_round"},"color":"yellow","bold":true},{"text":"...","color":"green"}]
function zombies:game/management/start
