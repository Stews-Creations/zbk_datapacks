$execute if data storage zbk:registry zones[{zone:$(zone)}] run return 0
$data modify storage zbk:registry zones append value {zone:$(zone)}
function zbk:map_elements/door/events/zone_unlocked
