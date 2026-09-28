function zbk:map_elements/rocket_shield/marker/register_pending
execute as @e[distance=0..,tag=rs_part_runtime] unless score @s rs_epoch = #run rs_epoch run kill @s
execute as @e[distance=0..,tag=rs_plate_runtime] unless score @s rs_candidate = #plate rs_chosen run kill @s
execute if score #plate rs_collected matches 1 run kill @e[distance=0..,tag=rs_plate_runtime]
execute as @e[distance=0..,tag=rs_mechanism_runtime] unless score @s rs_candidate = #mechanism rs_chosen run kill @s
execute if score #mechanism rs_collected matches 1 run kill @e[distance=0..,tag=rs_mechanism_runtime]
execute as @e[distance=0..,tag=rs_rocket_runtime] unless score @s rs_candidate = #rocket rs_chosen run kill @s
execute if score #rocket rs_collected matches 1 run kill @e[distance=0..,tag=rs_rocket_runtime]
execute as @e[distance=0..,type=item] if items entity @s contents *[custom_data~{rs_part_ui:true}] run kill @s
execute unless score #plate rs_collected matches 1 if score #plate rs_chosen matches 1.. as @e[distance=0..,type=marker,tag=rs_plate_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #plate rs_chosen run function zbk:map_elements/rocket_shield/display/sync {part:"plate"}
execute unless score #mechanism rs_collected matches 1 if score #mechanism rs_chosen matches 1.. as @e[distance=0..,type=marker,tag=rs_mechanism_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #mechanism rs_chosen run function zbk:map_elements/rocket_shield/display/sync {part:"mechanism"}
execute unless score #rocket rs_collected matches 1 if score #rocket rs_chosen matches 1.. as @e[distance=0..,type=marker,tag=rs_rocket_candidate,tag=!rs_candidate_new] at @s if score @s rs_candidate = #rocket rs_chosen run function zbk:map_elements/rocket_shield/display/sync {part:"rocket"}
