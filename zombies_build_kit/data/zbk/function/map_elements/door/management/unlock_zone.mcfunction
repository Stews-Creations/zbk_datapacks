# Call with {zone}; unlock shared spawners/signals and restore the caller's zone scratch state.
data modify storage zbk:state zone_calls append value {saved:[],zone:0}
data modify storage zbk:state zone_calls[-1].saved set from storage zbk:temp unlock_zones
execute store result storage zbk:state zone_calls[-1].zone int 1 run scoreboard players get #zone_to_unlock global
$data modify storage zbk:temp unlock_zones set value [$(zone)]
function zbk:map_elements/door/management/unlock_spawners_recursive
data modify storage zbk:temp unlock_zones set from storage zbk:state zone_calls[-1].saved
execute store result score #zone_to_unlock global run data get storage zbk:state zone_calls[-1].zone
data remove storage zbk:state zone_calls[-1]
