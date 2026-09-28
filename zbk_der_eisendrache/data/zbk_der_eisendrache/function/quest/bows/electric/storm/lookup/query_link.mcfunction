scoreboard players set #de_storm_center_exists stats 0
scoreboard players set #de_held_center temp 0
$execute if data storage zbk:temp storm_lookup_index.seen."$(link)" run scoreboard players set #de_storm_center_exists stats 1
$execute if data storage zbk:temp storm_lookup_index.live."$(link)" run scoreboard players set #de_held_center temp 1
