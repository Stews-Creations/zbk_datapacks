execute align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~
scoreboard players add #next rs_candidate 1
scoreboard players operation @s rs_candidate = #next rs_candidate
$data modify storage zombies:shield_parts marker set value {part:"$(part)"}
execute store result storage zombies:shield_parts marker.id int 1 run scoreboard players get @s rs_candidate
function zombies:map_elements/rocket_shield/marker/register_id with storage zombies:shield_parts marker
tag @s remove rs_candidate_new
tag @s remove rs_placement_pending
