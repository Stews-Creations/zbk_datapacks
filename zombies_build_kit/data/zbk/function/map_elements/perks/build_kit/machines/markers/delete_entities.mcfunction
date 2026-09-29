# Called as/at the selected placement marker.
execute if entity @s[tag=pm_v2] run return run function zbk:map_elements/perks/machines/lifecycle/delete
function zbk:map_elements/perks/machines/legacy/cleanup
kill @s
