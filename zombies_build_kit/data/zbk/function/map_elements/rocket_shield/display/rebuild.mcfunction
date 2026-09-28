kill @e[tag=rs_part_runtime]
execute as @e[type=marker,tag=rs_plate_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #plate rs_chosen unless score #plate rs_collected matches 1 run function zbk:map_elements/rocket_shield/display/sync {part:"plate"}
execute as @e[type=marker,tag=rs_mechanism_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #mechanism rs_chosen unless score #mechanism rs_collected matches 1 run function zbk:map_elements/rocket_shield/display/sync {part:"mechanism"}
execute as @e[type=marker,tag=rs_rocket_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #rocket rs_chosen unless score #rocket rs_collected matches 1 run function zbk:map_elements/rocket_shield/display/sync {part:"rocket"}
