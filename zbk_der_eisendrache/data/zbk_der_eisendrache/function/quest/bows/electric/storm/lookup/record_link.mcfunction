$data modify storage zombies:temp storm_lookup_index.seen."$(link)" set value 1b
$execute if score @s de_storm_life matches 1.. run data modify storage zombies:temp storm_lookup_index.live."$(link)" set value 1b
