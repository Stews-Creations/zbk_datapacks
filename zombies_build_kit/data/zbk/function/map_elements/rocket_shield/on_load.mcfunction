scoreboard objectives add rs_candidate dummy
scoreboard objectives add rs_chosen dummy
scoreboard objectives add rs_collected dummy
scoreboard objectives add rs_epoch dummy
scoreboard objectives add rs_ui_preview dummy
scoreboard objectives add rs_edit dummy
scoreboard objectives add rs_prompt dummy
execute unless score #next rs_candidate matches 0.. run scoreboard players set #next rs_candidate 0
execute unless data storage zbk:shield_parts candidates.plate run data modify storage zbk:shield_parts candidates.plate set value []
execute unless data storage zbk:shield_parts candidates.mechanism run data modify storage zbk:shield_parts candidates.mechanism set value []
execute unless data storage zbk:shield_parts candidates.rocket run data modify storage zbk:shield_parts candidates.rocket set value []
