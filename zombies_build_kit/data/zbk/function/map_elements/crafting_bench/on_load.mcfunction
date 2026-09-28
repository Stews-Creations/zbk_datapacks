scoreboard objectives add cb_id dummy
execute unless score #next cb_id matches 0.. run scoreboard players set #next cb_id 0
scoreboard objectives add cb_build dummy
execute unless score #shield_bench cb_id matches 0.. run scoreboard players set #shield_bench cb_id 0
scoreboard objectives add rag_collected dummy
execute unless score #shield cb_build matches 0..2 run scoreboard players set #shield cb_build 0
execute unless score #ragnarok cb_build matches 0..2 run scoreboard players set #ragnarok cb_build 0
function zbk:map_elements/crafting_bench/management/check_ready
scoreboard objectives add cb_recipe dummy
scoreboard objectives add cb_target dummy
scoreboard objectives add cb_start dummy
scoreboard objectives add cb_last dummy
scoreboard objectives add cb_time dummy
scoreboard objectives add cb_stamp dummy
scoreboard objectives add cb_bar dummy
function zbk:map_elements/crafting_bench/display/load
scoreboard players set #duration cb_time 100
function zbk:map_elements/crafting_bench/initialize
