scoreboard players reset @s cb_edit
execute at @s store result score @s cb_edit run scoreboard players get @e[type=marker,tag=build_manager_target,tag=cb_marker,sort=nearest,limit=1] cb_id
function zbk:build_kit/tools/build_manager/cleanup
execute if score @s cb_edit matches 1.. run dialog show @s zbk:build_kit/buildables/crafting_bench
