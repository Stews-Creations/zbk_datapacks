data modify entity @s Rotation set from storage zbk:shield_parts placement.rotation
tag @s remove rs_placement_pending
execute if entity @s[tag=rs_plate_candidate] run function zbk:map_elements/rocket_shield/marker/register {part:"plate"}
execute if entity @s[tag=rs_mechanism_candidate] run function zbk:map_elements/rocket_shield/marker/register {part:"mechanism"}
execute if entity @s[tag=rs_rocket_candidate] run function zbk:map_elements/rocket_shield/marker/register {part:"rocket"}
