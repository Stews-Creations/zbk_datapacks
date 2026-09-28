scoreboard players reset @s rs_edit
execute at @s store result score @s rs_edit run scoreboard players get @e[type=marker,tag=build_manager_target,tag=rs_part_candidate,sort=nearest,limit=1] rs_candidate
function zbk:build_kit/management/build_manager/cleanup
dialog show @s zbk:shield_part_marker
