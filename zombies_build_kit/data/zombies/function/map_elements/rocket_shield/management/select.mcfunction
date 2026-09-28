$scoreboard players set #$(part) rs_chosen 0
$execute store result score #rs_count temp run data get storage zombies:shield_parts candidates.$(part)
execute unless score #rs_count temp matches 1.. run return 0
scoreboard players remove #rs_count temp 1
$data modify storage zombies:shield_parts roll set value {part:"$(part)"}
execute store result storage zombies:shield_parts roll.max int 1 run scoreboard players get #rs_count temp
function zombies:map_elements/rocket_shield/management/roll with storage zombies:shield_parts roll
