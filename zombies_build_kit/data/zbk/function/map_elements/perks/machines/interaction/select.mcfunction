tag @e[type=marker,tag=pm_v2_selected] remove pm_v2_selected
$tag @e[type=marker,tag=pm_v2,scores={pm_v2_id=$(id)},distance=..6,limit=1] add pm_v2_selected
execute if entity @e[type=marker,tag=pm_v2_selected] run function zbk:map_elements/perks/machines/interaction/click
tag @e[type=marker,tag=pm_v2_selected] remove pm_v2_selected
