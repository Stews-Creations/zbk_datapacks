scoreboard players operation #stage cb_bar = #progress cb_time
scoreboard players set #segments cb_bar 20
scoreboard players operation #stage cb_bar *= #segments cb_bar
scoreboard players operation #stage cb_bar /= #duration cb_time
execute if score #stage cb_bar matches 20.. run scoreboard players set #stage cb_bar 20
execute if score @s cb_bar = #stage cb_bar run return 0
scoreboard players operation @s cb_bar = #stage cb_bar
execute store result storage zbk:crafting_bench progress.stage int 1 run scoreboard players get #stage cb_bar
function zbk:map_elements/crafting_bench/display/render with storage zbk:crafting_bench progress
