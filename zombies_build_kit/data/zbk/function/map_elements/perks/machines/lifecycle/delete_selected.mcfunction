# Called as/at a marker already resolved from the user's selection.
scoreboard players set #deleted pm_v2_id 1
execute if entity @s[tag=wunderfizz] run return run function zbk:map_elements/perks/wunderfizz/build_kit/markers/delete_entities
function zbk:map_elements/perks/build_kit/machines/markers/delete_entities
