scoreboard players operation @s cb_edit = #clicked cb_target
function zombies:build_kit/management/build_manager/cleanup
execute if score @s cb_edit matches 1.. run dialog show @s zombies:crafting_bench
