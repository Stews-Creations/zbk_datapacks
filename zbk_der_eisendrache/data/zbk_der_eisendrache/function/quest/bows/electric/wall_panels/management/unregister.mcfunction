# Operator recovery only after the old marker was manually deleted, not merely unloaded.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_ep_id temp $(id)
execute unless score #de_ep_id temp matches 1..5 run return 0
$execute if entity @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"The panel marker still exists. Use delete instead.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
$kill @e[tag=de_el_panel_$(id)_runtime]
$scoreboard players reset #$(id) de_ep_set
$tellraw @s {"text":"Panel $(id) unregistered. Only use this after manually deleting the old marker; an unloaded marker can return as a duplicate.","color":"yellow"}
