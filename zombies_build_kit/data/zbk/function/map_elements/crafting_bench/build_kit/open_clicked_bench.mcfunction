scoreboard players operation @s cb_edit = #clicked cb_target
function zbk:build_kit/tools/build_manager/cleanup
execute if score @s cb_edit matches 1.. run dialog show @s zbk:build_kit/buildables/crafting_bench
