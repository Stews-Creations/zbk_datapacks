execute as @e[distance=0..,type=marker,tag=rs_candidate_new,tag=rs_plate_candidate] at @s run function zbk:map_elements/rocket_shield/marker/register {part:"plate"}
execute as @e[distance=0..,type=marker,tag=rs_candidate_new,tag=rs_mechanism_candidate] at @s run function zbk:map_elements/rocket_shield/marker/register {part:"mechanism"}
execute as @e[distance=0..,type=marker,tag=rs_candidate_new,tag=rs_rocket_candidate] at @s run function zbk:map_elements/rocket_shield/marker/register {part:"rocket"}
